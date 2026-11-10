# 06 — Original extensions to course project ideas

These are **design assignments**, not completed runnable apps. Implement them yourself from the course concepts and add evidence only after testing.

## Extension A — Multi-service auth & mailer (inspired by Oleksandr)

- Design: API, auth service, mailer worker, MongoDB, and Nginx.
- Your unique upgrade: queue-based mailer, healthchecks, least-privilege networks, retry/dead-letter handling and integration tests.
- Evidence: failure recovery, request path diagram, cold-start test and screenshots.
- Course: https://www.udemy.com/course/docker-and-docker-compose-project-deployment-from-scratch/

## Extension B — Network home lab (inspired by Luke Robertson)

- Design: uptime monitoring and metrics dashboard with Prometheus/Grafana and a reverse proxy.
- Your unique upgrade: service health dashboard, documented risk model and network isolation test.
- Warning: Vaultwarden, VPN, privileged/host networking, socket mounts and internet exposure require a threat model and safe isolated lab.
- Course: https://www.udemy.com/course/docker-containers-from-fundamentals-to-production/

## Extension C — Production-like deployment (inspired by Fast-Track)

- Design: containerized browser UI, API, DB, load balancer, backup plan.
- Your unique upgrade: immutable image tags, staging pipeline, release rollback checklist and TLS on an isolated VPS with a real domain.
- **Do not** turn on Watchtower/socket-access automation by default; review risk carefully.
- Course: https://www.udemy.com/course/fast-track-docker/

Keep teaching starter code separate from course instructor assets, and provide meaningful attribution.
