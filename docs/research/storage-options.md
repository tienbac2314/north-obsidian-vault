# Storage roles

No one store should be forced to solve human editing, operational transactions, agent retrieval, audit, and backup.

| Store | Role | Canonical scope |
|---|---|---|
| Obsidian Markdown/attachments | Human notes, projects, reviews, sources | Canonical human library |
| SQLite WAL | Proposals/jobs/idempotency; later raw Telegram events | Canonical operational state and raw delivery only |
| Git | Accepted file history | Audit copy, not live authority |
| Encrypted off-host backup | Disaster recovery | Recovery copy |
| OpenViking | Later semantic vault projection | Derived/rebuildable; native memory excluded until separately governed |
| 9Router SQLite | Gateway accounts/routes/usage | Gateway configuration only |

## Why SQLite remains

OpenViking can store resources and semantic state, but proposal compare-and-swap, crash journal, job leases, and truthful pre-agent Telegram acknowledgment need small deterministic transactional boundary. SQLite does not duplicate curated note text except proposal snapshots/object references required for safe apply.

## Backup

- Vault and Git: encrypted versioned off-host snapshots with checksums.
- Operational SQLite: online/consistent backup plus schema version.
- OpenViking: back up only state needed to preserve identity/config; prove full rebuild from vault.
- 9Router: separate encrypted SQLite/config backup and restore drill.
- Secrets/keys: separate recovery path, never committed to vault or repository.
