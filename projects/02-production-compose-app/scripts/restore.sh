#!/usr/bin/env bash
set -euo pipefail
if [ "$#" -ne 1 ] || [ ! -f "$1" ]; then echo "Usage: $0 backups/example.sql" >&2; exit 2; fi
file="$(realpath "$1")"
cd "$(dirname "$0")/.."
echo "CAUTION: SQL restore may conflict with existing rows. Use a fresh isolated TEST database."
docker compose exec -T db sh -c 'exec psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB"' < "$file"
