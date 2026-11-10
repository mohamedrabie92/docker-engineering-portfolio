# 04 — Networking & Storage Labs

Perform isolation tests and save expected-success/**expected-failure** terminal output.

```bash
bash network-isolation.sh
bash volume-lab.sh
```

Each script uses named resources prefixed `portfolio-` and cleans them up. `volume-lab.sh` leaves no important data (test values only).

MACVLAN and IPVLAN require physical network and Linux networking capabilities often unavailable under Docker Desktop/WSL2. Study drivers from Luke's course, but do not force privileged host network changes merely to claim completed labs.
