#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p backups
output="backups/portfolio-$(date +%Y%m%d-%H%M%S).sql"
docker compose exec -T db sh -c 'exec pg_dump -U "$POSTGRES_USER" "$POSTGRES_DB"' > "$output"
echo "Created SQL dump: $output (DO NOT COMMIT production data)"
