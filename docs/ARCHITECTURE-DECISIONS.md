# Architecture Decision Record — ADR-001 (example)

## Context

We need a reproducible local Docker system that demonstrates container network isolation, persistence, build hygiene and service readiness.

## Decision

- Nginx binds to `127.0.0.1:8088` on the developer workstation.
- PostgreSQL and Redis have no published host ports and share an internal back-end network.
- FastAPI runs as UID 10001, `read_only`, `no-new-privileges` with dropped capabilities.
- PostgreSQL data sits on a named volume, not in the writable container layer.
- Compose health checks ensure dependency readiness before API startup.

## Tradeoffs

- Demo password from `.env.example` is never a substitute for a real secret manager.
- Compose is not cross-node orchestration; HA and zero downtime require more design.
- Nginx is root-starting in its standard image (binds port 80); risk-reduction applies to API separately, not to every container.
- Cache metrics are intentionally ephemeral and not critical business data.

## Verification

Add **actual** commands, output, and issue/PR links after running the lab. Do not imply these are verified just because the YAML includes them.
