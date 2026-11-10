#!/usr/bin/env bash
set -euo pipefail
suffix="$$"
front="portfolio-front-$suffix"
back="portfolio-back-$suffix"
name="portfolio-isolated-$suffix"
cleanup(){ docker rm -f "$name" >/dev/null 2>&1 || true; docker network rm "$front" "$back" >/dev/null 2>&1 || true; }
trap cleanup EXIT
docker network create "$front" >/dev/null
docker network create --internal "$back" >/dev/null
docker run -d --name "$name" --network "$back" busybox:1.36 sleep 180 >/dev/null
echo "Cross-network DNS should FAIL (expected):"
if docker run --rm --network "$front" busybox:1.36 nslookup "$name"; then
  echo 'Unexpected cross-network visibility' >&2; exit 1
else
  echo 'PASS: isolated from other network'
fi
echo 'Same-network DNS should SUCCEED:'
docker run --rm --network "$back" busybox:1.36 nslookup "$name"
echo 'PASS: same-network service discovery'
