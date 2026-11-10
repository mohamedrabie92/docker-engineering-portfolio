# 03 — Polyglot Docker Lab (5 languages)

Five tiny, **original** standard-library HTTP services built in Python, Node.js, Go, Java, and Ruby. Each has an independent Dockerfile; the Go service uses a multi-stage `scratch` runtime.

```bash
docker compose up -d --build
for port in 8101 8102 8103 8104 8105; do curl -fsS "http://127.0.0.1:$port/health"; echo; done
docker compose ps
docker compose down
```

Goal: prove you can build and debug containers across language ecosystems. This is **not** a complete business microservices architecture yet. Extend with inter-service messaging, tests, API gateway, database and failure handling to demonstrate deeper expertise.
