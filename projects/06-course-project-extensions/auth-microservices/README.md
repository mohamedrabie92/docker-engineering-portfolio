# Oleksandr-inspired microservices extension — day 9

**Status: original design assignment; no runnable implementation supplied.** This avoids presenting a one-day tutorial exercise as a production auth system.

## Acceptance criteria

1. Run an API service, separate auth service, MongoDB, and Nginx with Docker Compose.
2. Add a **dev-only** authenticated flow with explicit test credentials stored outside Git.
3. Split public ingress from an **internal** database network and document DNS resolution.
4. Add healthchecks and a repeatable integration test.
5. Stretch: isolated mailer service with test sink (no real email credentials).
6. Record at least one simulated outage and demonstrated recovery.
7. Cite [Oleksandr course](https://www.udemy.com/course/docker-and-docker-compose-project-deployment-from-scratch/) if you reuse instructor source assets; the deliverable must include your independent improvement.

Use `templates/EVIDENCE-REPORT-TEMPLATE.md`; don't upload an unreviewed authentication demo to a public VPS.
