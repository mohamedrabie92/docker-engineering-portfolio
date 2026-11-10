# Evidence checklist (complete only after execution)

| Item | What to save | Status |
|---|---|---|
| Full-stack boot | `docker compose ps`, browser screenshot, HTTP smoke result | [ ] |
| Build optimization | image sizes before/after + `docker history` | [ ] |
| Non-root container | `docker compose exec api id` | [ ] |
| Network isolation | prove DB not published; services resolve internally | [ ] |
| Persistence | note created before `down`, still there after `up` | [ ] |
| Backup and restore | `pg_dump` backup and a restore to a **fresh** test DB | [ ] |
| CI | URL of successful GitHub Actions run | [ ] |
| Security | scanner findings, what you fixed and accepted risks | [ ] |
| Polyglot | successful `/health` on all five services | [ ] |
| Private registry | push/pull evidence against `localhost:5000` | [ ] |
| Swarm | service scale/rollback + output, performed in isolated lab | [ ] |
| Troubleshooting | 3 root-cause reports: symptom / reproduction / log / fix / regression test | [ ] |

Never fabricate test results, passing badges, vulnerabilities, measurements or screenshots. Redact tokens, passwords, private IPs, and personal information.

## Short incident template

**Symptom:**

**Expected vs actual:**

**Reproduction:**

**Evidence (commands/logs):**

**Root cause:**

**Fix & validation:**

**Preventive change:**
