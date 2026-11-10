# 14-Day Sequential Docker Roadmap — Updated to Match Excel

**Scheduling rule: one Udemy course per day.** A course can span consecutive days. Docker and DCA are **never mixed on the same day**. Each day is **225 minutes (3h 45m)** including lessons, labs, and documentation; no Docker workshop requires Kubernetes.

The exact workbook snapshot lives at [`planning/Docker-Mastery-14-Day-One-Course-Per-Day-DCA.xlsx`](../planning/Docker-Mastery-14-Day-One-Course-Per-Day-DCA.xlsx). Match **section titles**, not just numerical positions, because Udemy curricula change. Course URLs and selection rules live in [`COURSE-SECTIONS.md`](COURSE-SECTIONS.md).

| Day | One course | Study sections (selected; videos not always entire section) | Lab / project outcome | Evidence path |
|---|---|---|---|---|
| **1** | **C1 KodeKloud Beginner** | S1 Introduction; S2 Docker Commands; S3 Docker Run Commands | Nginx/Redis lifecycle, logs, exec, diagnose port clash | `projects/01-engine-fundamentals`; `evidence/day-01/` |
| **2** | **C1 KodeKloud Beginner** | S4 Docker Images; S5 Docker Compose; optional S6 Engine / S8 Registry | Dockerfile, Compose app and health endpoint | `projects/02-production-compose-app`; `evidence/day-02/` |
| **3** | **C2 Ricardo** | S5 Dockerfiles; S6 Containers in Depth; S7 Volumes | Non-root image, optimizations, PostgreSQL persistence | `projects/04-networking-storage-labs`; `evidence/day-03/` |
| **4** | **C3 Jason Cannon** | S4 Running/Managing Containers; S6 Logs; S8 Volumes; S9 Networking | 3 controlled incidents; isolate network; test volume copy | `projects/01-engine-fundamentals`; `projects/04-networking-storage-labs` |
| **5** | **C7 Bret Fisher — Docker only** | S4 Images; S6 ENTRYPOINT; S7 Compose | Dockerfile cache/layer optimization, Compose challenge | `projects/02-production-compose-app`; `evidence/day-05/` |
| **6** | **C10 Fast-Track (part 1)** | S4 Custom Image Builds; S6 Persistent Data | Full-stack MVP — browser, API, PostgreSQL | `projects/02-production-compose-app` |
| **7** | **C10 Fast-Track (part 2)** | S7 Networking; S8 Compose; S9 Deployment Setup | Gateway, healthchecks, persistence, automated smoke | `projects/02-production-compose-app`; `.github/workflows/docker-ci.yml` |
| **8** | **C4 Zero to Cloud** | S5 Running Apps; S6 Building Images; S7 Web Apps; S8 Microservices; S10 Compose | Five Dockerfile image builds + 2–3 service-to-service tests (stretch) | `projects/03-polyglot-microservices` |
| **9** | **C5 Oleksandr** | S1 Planning; S2 Configuration; S3 Deployment | Plan/implement original Auth + API + MongoDB extension; Mailer stretch | `projects/06-course-project-extensions` |
| **10** | **C6 Luke Robertson** | S4 Networking; S6 Registries; S8 Portainer; S9 Limits; S10 Security | Loopback registry, resource caps, manual scanner report | `projects/05-registry-and-swarm`; `projects/06-course-project-extensions` |
| **11** | **C8 KodeKloud Advanced** | S3 Docker Swarm; S4 Docker Service; S5 Advanced Networking; S6 Stacks | Disposable Swarm; scale, rolling update, rollback | `projects/05-registry-and-swarm` |
| **12** | **C9 Zeal Vora DCA (1/3)** | S1 Getting Started; S2 Image Creation / Management / Registry | Image/registry concepts, quiz, missing objectives log | `docs/DCA-3-DAY-STUDY-BLOCK.md`; `evidence/day-12/` |
| **13** | **C9 Zeal Vora DCA (2/3)** | S3 Networking; S7 Storage; S6 Security | Networking, storage and security drills + quiz review | `docs/DCA-3-DAY-STUDY-BLOCK.md`; `evidence/day-13/` |
| **14** | **C9 Zeal Vora DCA (3/3)** | S4 Orchestration (Docker Swarm only); **Docker EE** heading; Exam Preparation | Time-boxed mock + honest exam-gap report | `docs/DCA-3-DAY-STUDY-BLOCK.md`; `evidence/day-14/` |

## Time allocation

- **Days 1–11:** approximately 65–105 min selected lectures + 110–150 min labs + 10 min notes; single course only.
- **Days 12–14:** ~135 min DCA videos + 75 min quiz/labs + 15 min notes each day. No lectures from other courses.
- The 14-day plan is a **timebox**. If a lab needs more time, keep the scope honest. The goal is to produce one solid flagship project and reproducible proof, not to claim ten fully watched courses.

## Completion boundaries

- **C1:** target finish Docker fundamentals + chosen labs (excluding Kubernetes). Other C2/C3/C7/C10/C4/C5/C6/C8: **selected sections or MVP**, not full-course completion.
- **C9 DCA:** **partial course**; not equivalent to passing DCA. Up to ~14h15 of original videos could remain after the estimated 6h45 viewing, plus labs, other official objectives and exam review. Progress varies with actual watch speed.
- **All 10 courses are represented**. Course order is `C1 → C2 → C3 → C7 → C10 → C4 → C5 → C6 → C8 → C9`.
