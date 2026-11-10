# Publish the portfolio responsibly

## Step 1 — execute locally

1. Install Docker Engine/Desktop Linux containers + Compose V2. Run `docker version` and `docker compose version`.
2. Run `bash scripts/verify.sh` for the flagship; save terminal output.
3. Run `bash scripts/verify-polyglot.sh` (optional multi-language lab); save output.
4. Run isolated labs manually, and record results with dates, Docker versions and OS.

## Step 2 — fill evidence

Create `evidence/day-01/` ... `evidence/day-14/` using [evidence template](../templates/EVIDENCE-REPORT-TEMPLATE.md). Name proof meaningfully (e.g. `docker-image-optimization.txt`, `compose-healthy.png`). Exclude any keys, passwords, tokens, private hostnames, and personal data.

## Step 3 — demonstrate ownership

- Commit original improvements: tests, security hardening, healthchecks, failure handling, cache optimization, runbooks.
- For course-inspired apps, explicitly identify instructor and tutorial source (see `docs/ATTRIBUTION.md`); do not blindly upload course-owned assets.
- Document measurable before/after output and one failure fixed.

## Step 4 — GitHub

From the repository root (never upload your personal `.env`):

```bash
git init
git add .
git status
git commit -m "Initialize Docker portfolio and 14-day sequential study plan"
git branch -M main
# Either create the repo on github.com, or use the authenticated GitHub CLI:
gh repo create docker-engineering-portfolio --public --source=. --remote=origin --push
```

The `gh` command only works after authentication. Publish screenshots/tests **after running them**. Do not add a CI badge before the first real passing run.
