#!/usr/bin/env bash
set -euo pipefail
repo="$(cd "$(dirname "$0")/.." && pwd)"
project="$repo/projects/02-production-compose-app"
cd "$project"
export COMPOSE_PROJECT_NAME="portfolio-verify-$$"
if [ ! -f .env ]; then cp .env.example .env; fi
echo 'Validating Docker Compose configuration'
docker compose config -q
cleanup(){ docker compose down --volumes >/dev/null 2>&1 || true; }
trap cleanup EXIT
echo 'Building and starting full-stack demo'
docker compose up -d --build --wait
curl --retry 8 --retry-delay 2 --retry-connrefused -fsS http://127.0.0.1:8088/health | grep -q '"ok"'
curl -fsS -X POST -H 'Content-Type: application/json' --data '{"body":"verification-note"}' http://127.0.0.1:8088/api/notes | grep -q 'verification-note'
curl -fsS http://127.0.0.1:8088/api/notes | grep -q 'verification-note'
# Database persistence after a stop/recreate; not a full backup restore test.
docker compose down
docker compose up -d --wait
curl --retry 8 --retry-delay 2 --retry-connrefused -fsS http://127.0.0.1:8088/api/notes | grep -q 'verification-note'
echo 'PASS: compose health, API write/read and persistence after recreation'
