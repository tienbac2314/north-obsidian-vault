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
- Pinned FNS server is healthy on IPv6 loopback. Dedicated tunnel and DNS route return TLS health `200` from Windows. WebGUI registration probe returns closed-registration code `410`.
- Obsidian `1.12.7` is installed. Disposable Windows vault contains agreed 18-directory layout, Home, guide, and four core templates.
- Verified FNS plugin `2.4.0` assets are installed only in disposable vault. Obsidian has not enabled plugin because first-open trust warning requires human security decision.
- Hermes and 9Router remain outside deployment and receive no vault workload.

## Next action

User reviews Obsidian trust warning and, if accepted, selects `Trust author and enable plugins`. User then chooses and records disposable FNS account credentials. Continue with one-account registration window, close-registration proof, Windows plugin connection, and physical Android enrollment.

## Blockers

- FNS physical Windows/Android note and native-attachment gates remain unrun.
- Obsidian first-open plugin trust warning is awaiting human security decision.
- Disposable account creation requires user-owned credential choice and storage.
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
