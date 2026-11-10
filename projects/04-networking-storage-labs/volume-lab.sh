#!/usr/bin/env bash
set -euo pipefail
src="portfolio-volume-src-$$"
dst="portfolio-volume-dst-$$"
cleanup(){ docker volume rm "$src" "$dst" >/dev/null 2>&1 || true; }
trap cleanup EXIT
docker volume create "$src" >/dev/null
docker volume create "$dst" >/dev/null
docker run --rm -v "$src:/data" busybox:1.36 sh -c "printf 'persisted-docker-data' > /data/message"
value=$(docker run --rm -v "$src:/data:ro" busybox:1.36 cat /data/message)
[ "$value" = 'persisted-docker-data' ] || exit 1
# Copy between distinct Docker volumes using disposable container
docker run --rm -v "$src:/source:ro" -v "$dst:/dest" busybox:1.36 sh -c 'cp /source/message /dest/message'
restored=$(docker run --rm -v "$dst:/data:ro" busybox:1.36 cat /data/message)
[ "$restored" = 'persisted-docker-data' ] || exit 1
echo 'PASS: persistence and copy into a fresh volume verified'
