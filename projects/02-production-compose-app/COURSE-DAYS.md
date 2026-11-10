# Course alignment: days 2, 5, 6, 7

- **Day 2 / C1:** explain Dockerfile + Compose deployment.
- **Day 5 / C7 Bret (Docker-only):** measure image size/cache and explain CMD/ENTRYPOINT tradeoffs; document genuine before/after.
- **Day 6 / C10:** run browser → API → Postgres write/read, and recreate with persistence.
- **Day 7 / C10:** confirm gateway/healthchecks, smoke CI, resources and rollback plan.

The provided gateway is **Nginx**, not the Traefik proxy used in some Fast-Track course lessons. Replacing/adding Traefik is an **extension to implement**, not a completed feature. This project is a learning demo with no TLS/auth. Do not deploy Internet-facing unchanged.
