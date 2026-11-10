#!/usr/bin/env bash
set -euo pipefail
name='portfolio-local-registry'
if docker container inspect "$name" >/dev/null 2>&1; then echo "Container $name already exists; stop and remove it manually first." >&2; exit 1; fi
cleanup(){ docker rm -f "$name" >/dev/null 2>&1 || true; }
trap cleanup EXIT
docker run -d --name "$name" -p 127.0.0.1:5000:5000 registry:2 >/dev/null
docker pull busybox:1.36
docker tag busybox:1.36 localhost:5000/portfolio/busybox:lab1
docker push localhost:5000/portfolio/busybox:lab1
docker image rm localhost:5000/portfolio/busybox:lab1 >/dev/null
docker pull localhost:5000/portfolio/busybox:lab1
echo 'PASS: local tag, push, remove and pull verified (loopback-only HTTP registry)'
