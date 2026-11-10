# Implementation status — planned vs verified

This is a **fresh starter**. Check marks below must be updated only after execution and saved evidence.

| Component | Repo contains | Tested here? | Next work |
|---|---|---|---|
| CLI failures | Instructions | **No** | Run scenarios and capture three incident reports |
| Compose flagship | Source code + Compose config + CI workflow | **No Docker runtime available** | `bash scripts/verify.sh`, inspect security, capture screenshot and real CI URL |
| Polyglot microservices | Five original minimal HTTP services + Compose | **No Docker runtime available** | `bash scripts/verify-polyglot.sh`, document image sizes and service-to-service traffic |
| Storage & network labs | Executable shell scripts | **No Docker runtime available** | Run on local Docker host; save command stdout |
| Local registry & Swarm | Registry script + Swarm stack | **No Docker runtime available** | Run only in isolated lab/VM; verify scale/rollback |
| Oleksandr/Luke extensions | Design briefs and acceptance criteria | **Not implemented** | Build independently after core deliverables; do not claim completion |
| DCA days 12–14 | Study roadmap, gap map, empty quiz CSV | **No exams taken** | Log actual quiz results and outstanding blueprint objectives |

**Why this matters:** A GitHub portfolio demonstrates expertise through reproducible evidence, measured outcomes and the owner's original improvements — not from having empty folders or tutorial code alone.
