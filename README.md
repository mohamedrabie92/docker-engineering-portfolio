# Docker Engineering Portfolio | 14-Day Docker-Only Track

**One course per day · 10 Udemy courses represented · 14 days · 3h 45m/day · 52h 30m**

This repository is a **hands-on starter and evidence framework**, aligned with `planning/Docker-Mastery-14-Day-One-Course-Per-Day-DCA.xlsx`. The study plan deliberately teaches **one course at a time**. Days **12–14** are a contiguous Docker Certified Associate (DCA) study block; Kubernetes videos are explicitly excluded during these 14 days.

> **Integrity note:** The repository contains starter applications, executable Docker labs, and proposed extension projects. I have **not** run Docker containers or a GitHub Actions pipeline in your account. An empty evidence folder, plan checkbox, or CI YAML does not prove a lab was completed. Add real measurements, test outputs, GitHub Actions links, and your own implementation commits.

## Study plan — one course per day

| Days | Course | Completion scope |
|---|---|---|
| **1–2** | C1 — KodeKloud Docker Beginner | **Target:** finish Docker-only core lessons and required labs |
| **3** | C2 — Ricardo, From Zero to Hero | Selected Dockerfile, container, volume sections |
| **4** | C3 — Jason Cannon | Selected administration, storage, networking labs |
| **5** | C7 — Bret Fisher | Docker image/layer/Compose practice; **skip Kubernetes** |
| **6–7** | C10 — Fast-Track Docker | Build and verify full-stack flagship MVP |
| **8** | C4 — Zero to Cloud | Five-language image builds and microservices lab |
| **9** | C5 — Oleksandr | Auth/API/MongoDB architecture and course-inspired extension |
| **10** | C6 — Luke Robertson | Advanced networking, security, resource & registry labs |
| **11** | C8 — KodeKloud Advanced | Docker Swarm, stacks, service scaling and rollback |
| **12–14** | C9 — Zeal Vora DCA | Docker domains and quizzes only; **partial course**, not full exam preparation |

**Source of truth:** [14-day day-by-day roadmap](docs/14-DAY-ROADMAP.md) · [Course sections and Udemy URLs](docs/COURSE-SECTIONS.md) · [Course-to-project matrix](docs/COURSE-TO-PROJECT-MAP.md) · [Excel](planning/Docker-Mastery-14-Day-One-Course-Per-Day-DCA.xlsx)

## Projects and evidence

| Project | Days | What demonstrates real skill | Starting point |
|---|---|---|---|
| **01 — Engine fundamentals & incident reports** | 1–5 | Container lifecycle, debugging, controlled failures | [`projects/01-engine-fundamentals`](projects/01-engine-fundamentals/) |
| **02 — Compose flagship app** | 2, 5–7 | Python API + Postgres + Redis + Nginx, non-root API, isolation, health, CI | [`projects/02-production-compose-app`](projects/02-production-compose-app/) |
| **03 — Polyglot service packaging** | 8 | Five *original minimal HTTP services*: Python, JavaScript, Go, Java, Ruby | [`projects/03-polyglot-microservices`](projects/03-polyglot-microservices/) |
| **04 — Storage & network proof labs** | 3, 4, 10 | Network isolation, DNS, named-volume copy/persistence | [`projects/04-networking-storage-labs`](projects/04-networking-storage-labs/) |
| **05 — Registry & Swarm** | 10–11 | Local registry push/pull; Swarm deploy/scale/update/rollback | [`projects/05-registry-and-swarm`](projects/05-registry-and-swarm/) |
| **06 — Course-inspired original extensions** | 9–10 | Auth/Mailer design, infra hardening tasks; **not yet runnable** | [`projects/06-course-project-extensions`](projects/06-course-project-extensions/) |
| **DCA study log (non-code)** | 12–14 | Quiz accuracy, objective gaps, exam continuation plan | [`docs/DCA-3-DAY-STUDY-BLOCK.md`](docs/DCA-3-DAY-STUDY-BLOCK.md) |

### Run flagship app locally

Requires Docker Engine / Docker Desktop Linux containers, Docker Compose V2, curl, and a shell.

```bash
cd projects/02-production-compose-app
cp .env.example .env   # PowerShell: Copy-Item .env.example .env
# Change local demonstration password inside .env (never commit it)
docker compose config -q
docker compose up -d --build --wait
curl -fsS http://127.0.0.1:8088/health
curl -fsS -X POST http://127.0.0.1:8088/api/notes \
  -H 'Content-Type: application/json' -d '{"body":"my first original note"}'
curl -fsS http://127.0.0.1:8088/api/notes
docker compose down  # keeps named volumes unless -v is supplied
```

Run repeatable smoke tests from repo root:

```bash
bash scripts/verify.sh            # Flagship app, write/read and persistence
bash scripts/verify-polyglot.sh   # Five-language service health (manual/optional)
```

Docker is **not available in the packaging environment**, so these scripts are provided but their runtime success is not asserted. The flagship binds to **127.0.0.1 only** and has no auth/TLS. **Do not expose it to the public Internet unchanged.** Swarm should be tested only in an isolated disposable VM.

### Publish meaningful GitHub evidence

1. Complete the planned work for each day, then commit the code with a descriptive message.
2. Store **actual** command outputs, diagrams, screenshots, measurements and incident reports (redact secrets).
3. Link a **real successful** GitHub Actions run; do not add a green status badge prematurely.
4. Describe what you changed independently compared with course tutorials, and cite any course assets used.
5. Show one failure you intentionally induced, what diagnosed it, and the passing retest.

Read [evidence checklist](docs/EVIDENCE-CHECKLIST.md), [actual vs planned status](docs/IMPLEMENTATION-STATUS.md) and [publishing guide](docs/GITHUB-PUBLISHING.md).

## Scope note: DCA is not complete in 14 days

The plan reserves **11 hours 15 minutes total** for DCA on days 12–14. The workbook estimates about **6 hours 45 minutes** of selected videos and the rest for practical review/quizzes, leaving roughly **14 hours 15 minutes of course video** on a ~21-hour course, including postponed Kubernetes material. These are scheduling estimates, **not** watched-time data or evidence of exam readiness. Official DCA objectives may include Kubernetes and Enterprise/Mirantis topics; see [`docs/DCA-COVERAGE.md`](docs/DCA-COVERAGE.md).

MIT license applies to **original starter code only**; course instructor assets remain subject to their own copyright and licenses.
