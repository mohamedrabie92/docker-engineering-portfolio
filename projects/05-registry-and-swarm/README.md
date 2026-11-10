# 05 — Private Registry & Docker Swarm

## Local registry (loopback only)

```bash
bash local-registry.sh
```

Creates a disposable local Registry V2 at `127.0.0.1:5000`, pushes/pulls a tiny image, and cleans up only this lab's registry container. This uses HTTP **only on localhost**, not suitable for remote/production use; use TLS, authentication and access controls for real registries.

## Swarm lab — manual, isolated Docker host ONLY

This changes the Docker daemon's swarm state, so it **must be an explicit manual exercise** on a spare VM, never auto-run in CI.

```bash
docker swarm init
# Read stack.yaml first; published Swarm ports may listen on host interfaces.
docker stack deploy -c stack.yaml portfolio

docker service ls
docker service scale portfolio_web=3
docker service ps portfolio_web
docker stack rm portfolio
docker swarm leave --force   # ONLY if this swarm was created solely for the lab
```

To prove rolling updates and rollbacks, create your own versioned web image, push it to registry, then use `docker service update --image ...` followed by `docker service rollback ...` in the disposable lab. Save real service status output and diagnosis of a failed deployment.

A single-node Swarm demonstrates mechanics but **not** manager quorum/HA. Multi-node requirements need separate VMs and networking.
