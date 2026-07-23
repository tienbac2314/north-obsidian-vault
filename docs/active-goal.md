# Active goal

Updated: 2026-07-23

## Objective

Reach first usable synthetic Windows and Android Fast Note Sync vault with agreed plain-Markdown layout. Implement through verified checkpoints and stop at physical-device, account, or safety gate before personal migration.

## Checkpoint

- PR #2 is merged. Branch `feat/fns-release-one` starts from verified `origin/main`.
- Current upstream releases are FNS server `3.6.0` and Obsidian plugin `2.4.0`; server image digest and ARM64 manifest are recorded in deployment contract.
- Open server issues `#339`, `#342`, and `#346` still block personal data and agent consumers.
- Stage 1 contract now defines pinned Compose, loopback bind, closed-by-default registration, secret-bearing runtime config, dedicated tunnel, stopped-service backup, empty-path restore, and rollback.
- Stage 2 read-only Oracle preflight passed architecture, Docker, Compose, disk, loopback port, target-path, and no-existing-FNS checks.
- Preflight disproved old Nginx assumption. DEC-035 selects new dedicated Cloudflare Tunnel without editing existing routes or tunnel processes.
- Hermes and 9Router remain outside deployment and receive no vault workload.

## Next action

Verify Stage 1 repository checks, commit contract, then deploy pinned FNS and dedicated tunnel on Oracle. Bootstrap one disposable account, close registration, initialize disposable Windows vault, and stop when physical Android or user-secret interaction is required.

## Blockers

- FNS physical Windows/Android note and native-attachment gates remain unrun.
- Disposable account creation may require interactive browser input.
- Physical Android plugin installation and battery/background checks require user device.
- Independent off-VPS backup destination remains later promotion gate.
- Public TLS endpoint plus unresolved FNS security reports restrict pilot to synthetic content.

## Authority

- [Executive summary](executive-summary.md)
- [System design](system-design.md)
- [Architecture modules](architecture/recommended-architecture.md)
- [Behavior and experiments](behavior/capture-to-digest.md)
- [First release](roadmap/mvp.md)
- [Phased roadmap](roadmap/phased-roadmap.md)
- [Decision log](decisions/decision-log.md)
- [Git workflow](git-workflow.md)

`docs/archive/`, `docs/superpowers/`, chat history, and NotebookLM output remain history or working evidence unless promoted into current modules or accepted decisions.
