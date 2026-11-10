"""Learning demo API: database-backed notes and optional cache instrumentation."""
import os
from contextlib import asynccontextmanager
from typing import Annotated

import psycopg
import redis
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field


def db_connect():
    return psycopg.connect(
        host=os.environ["DB_HOST"],
        dbname=os.environ["DB_NAME"],
        user=os.environ["DB_USER"],
        password=os.environ["DB_PASSWORD"],
        connect_timeout=3,
    )


def cache_connect():
    return redis.Redis(host=os.environ["REDIS_HOST"], port=6379, socket_connect_timeout=2)


@asynccontextmanager
async def lifespan(_app: FastAPI):
    with db_connect() as conn:
        with conn.cursor() as cur:
            cur.execute("CREATE TABLE IF NOT EXISTS notes (id BIGSERIAL PRIMARY KEY, body TEXT NOT NULL)")
    yield


app = FastAPI(title="Docker Engineering Portfolio", version="0.1.0", lifespan=lifespan)


class NewNote(BaseModel):
    body: Annotated[str, Field(min_length=1, max_length=500)]


@app.get("/health")
def health():
    try:
        with db_connect() as conn:
            with conn.cursor() as cur:
                cur.execute("SELECT 1")
                cur.fetchone()
        cache_connect().ping()
    except Exception as exc:
        raise HTTPException(status_code=503, detail="dependency unavailable") from exc
    return {"status": "ok"}


@app.post("/api/notes", status_code=201)
def create_note(note: NewNote):
    with db_connect() as conn:
        with conn.cursor() as cur:
            cur.execute("INSERT INTO notes (body) VALUES (%s) RETURNING id", (note.body,))
            note_id = cur.fetchone()[0]
    # Instrumentation intentionally best-effort; PostgreSQL is the source of truth.
    try:
        cache_connect().incr("writes")
    except redis.RedisError:
        pass
    return {"id": note_id, "body": note.body}


@app.get("/api/notes")
def list_notes():
    with db_connect() as conn:
        with conn.cursor() as cur:
            cur.execute("SELECT id, body FROM notes ORDER BY id DESC LIMIT 50")
            rows = cur.fetchall()
    return {"notes": [{"id": row[0], "body": row[1]} for row in rows]}


@app.get("/api/metrics")
def metrics():
    try:
        writes = int(cache_connect().get("writes") or 0)
    except redis.RedisError:
        writes = None
    return {"writes_since_cache_start": writes}
