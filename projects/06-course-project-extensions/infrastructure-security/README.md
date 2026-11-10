# Luke-inspired infrastructure / security lab — day 10

**Status: optional original extension; not runnable yet.** Start by assessing the existing `02-production-compose-app` instead of adding a privileged home-server stack.

## MVP acceptance criteria

- Document image scanning commands and **actual** vulnerabilities, not invented results.
- Verify non-root user, read-only filesystem, dropped capabilities and limits on the API container.
- Test service DNS isolation and confirm no DB ports published to the host.
- Save before/after Compose and `docker inspect` output.
- Demonstrate a local registry push/pull using `../05-registry-and-swarm/local-registry.sh` (path relative to project root depends on shell).

## Stretch

- Add Prometheus/Grafana to an **isolated disposable network** with safe local ports.
- Document a threat model before granting Docker-socket mounts, privileged mode or host networking.
- Cite [Luke course](https://www.udemy.com/course/docker-containers-from-fundamentals-to-production/) for any copied assets; independently implement your controls.
