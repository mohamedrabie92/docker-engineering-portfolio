# 02 — Compose Full-Stack Reference App

**Original learning app, not a copy of Fast-Track Expense Tracker.** Contains browser UI, Nginx reverse proxy, Python FastAPI, PostgreSQL, Redis, healthchecks, separated networks, and persistent DB volume.

```bash
cp .env.example .env
# edit .env first
docker compose config -q
docker compose up -d --build --wait
curl http://127.0.0.1:8088/health
curl -s http://127.0.0.1:8088/api/notes
curl -X POST http://127.0.0.1:8088/api/notes -H 'Content-Type: application/json' -d '{"body":"Docker works"}'
docker compose ps
docker compose exec api id
bash scripts/backup.sh
docker compose down
# Use `docker compose up -d` to prove data persisted.
```

Scripts assume **Bash** (WSL2 or Git Bash on Windows). For PowerShell, run the main `docker compose` and `curl.exe` commands manually. Restore script should be run only against a clean test database to avoid duplicate note IDs.

This is a **local teaching environment**, not internet-ready production deployment: lacks TLS, authentication, rate limits, automated migrations and secret manager. Avoid exposing it publicly. Database and cache are never published to host ports.

**Upgrade challenges:** add JWT authentication, integration tests, a better UI, resource usage report, and TLS at the edge. Prove non-root API + isolated internal network and capture evidence.
