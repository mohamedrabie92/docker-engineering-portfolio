# DCA study coverage (not certification readiness)

Blueprint source: https://training.mirantis.com/certification/dca-certification-exam/
Official study guide (January 2025 v1.5): https://a.storyblok.com/f/146871/x/2001ce939c/docker-study-guide_v1-5-jan-2025.pdf

| DCA domain | Weight | Lab / evidence | Gap |
|---|---:|---|---|
| Orchestration | 25% | `projects/05-registry-and-swarm` | multi-node quorum, enterprise features, Kubernetes objectives |
| Image creation/registry | 20% | `02`, `03`, `05` | image signing/content trust depth |
| Installation/configuration | 15% | Engine fundamentals / host documentation | real Linux daemon config, MKE/MSR, Kubernetes networking |
| Networking | 15% | `04`, `02` | multi-host overlay & enterprise deployments |
| Security | 15% | `02` + scans | PKI, RBAC, MTLS and enterprise deployment |
| Storage & volumes | 10% | `02`, `04` | storage drivers, CSI, Kubernetes storage objectives |

> The official DCA objectives include Kubernetes and Docker Enterprise / Mirantis product concepts. This 14-day track deliberately omits Kubernetes to respect Docker-only study; it does **not** constitute full DCA exam preparation. Verify the current blueprint before booking any exam.

Write down your actual practice quiz scores, concepts you missed, and retest dates. Do not mark a certification as earned until officially awarded.
