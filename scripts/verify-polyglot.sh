#!/usr/bin/env bash
# Run manually when Docker is installed; tests all five original demonstration HTTP servers.
set -euo pipefail
repo="$(cd "$(dirname "$0")/.." && pwd)"
cd "$repo/projects/03-polyglot-microservices"
export COMPOSE_PROJECT_NAME="portfolio-polyglot-check-$$"
cleanup(){ docker compose down --remove-orphans >/dev/null 2>&1 || true; }
trap cleanup EXIT
command -v docker >/dev/null || { echo 'Docker CLI not installed' >&2; exit 1; }
command -v curl >/dev/null || { echo 'curl not installed' >&2; exit 1; }
docker compose config -q
docker compose up -d --build
for item in '8101 python' '8102 node' '8103 go' '8104 java' '8105 ruby'; do
    read -r port lang <<<"$item"
    response="$(curl --retry 15 --retry-connrefused --retry-delay 2 -fsS "http://127.0.0.1:$port/health")"
    echo "$response" | grep -q '"status"[[:space:]]*:[[:space:]]*"ok"'
    echo "$response" | grep -q "\"service\"[[:space:]]*:[[:space:]]*\"$lang\""
    echo "PASS $lang on $port"
done
echo 'PASS: all five polyglot services returned healthy responses'
