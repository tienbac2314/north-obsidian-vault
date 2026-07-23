# Storage roles

> **Status: superseded design research.** SQLite, Google Drive archive, and OpenViking roles below belong to previous architecture. Current first design removes them pending evidence. Use [simplification brief](simplification-brief.md).

No one store should be forced to solve human editing, operational transactions, agent retrieval, audit, and backup.

| Store | Role | Canonical scope |
|---|---|---|
| Obsidian Markdown/attachments | Human notes, projects, reviews, sources | Canonical human library |
| SQLite WAL | Proposals/jobs/idempotency; later raw Telegram events | Canonical operational state and raw delivery only |
| Git | Accepted file history | Audit copy, not live authority |
| Timestamped encrypted `.7z` on Google Drive | Disaster recovery | Recovery copy |
| OpenViking | Later semantic vault projection | Derived/rebuildable; native memory excluded until separately governed |
| 9Router SQLite | Gateway accounts/routes/usage | Gateway configuration only |

## Why SQLite remains

OpenViking can store resources and semantic state, but proposal compare-and-swap, crash journal, job leases, and truthful pre-agent Telegram acknowledgment need small deterministic transactional boundary. SQLite does not duplicate curated note text except proposal snapshots/object references required for safe apply.

## Backup

- Vault and VPS Git: daily timestamped AES-256-encrypted `.7z`, unique name, local checksum, one-way `rclone copyto` to Google Drive.
- 7-Zip password transport: invoke empty `-p` and pipe one password line through stdin. Official console source sets password prompting when `-p` is present but empty and reads password from standard input ([Main.cpp](https://github.com/ip7z/7zip/blob/f9d78aff31a5f2521ae7ddbdc97c4a8855808959/CPP/7zip/UI/Console/Main.cpp), [UserInputUtils.cpp](https://github.com/ip7z/7zip/blob/f9d78aff31a5f2521ae7ddbdc97c4a8855808959/CPP/7zip/UI/Console/UserInputUtils.cpp)).
- Rclone: `drive.file` scope, owner-only config, no `sync`, no remote delete, no backup secret inside archive.
- Operational SQLite: Python online backup API plus schema version included in same archive generation.
- Failure: retain encrypted archive in local retry spool; never block Obsidian writing or proposal apply.
- Restore: download without primary device, extract into empty directory, run Git and SQLite integrity checks, then reconcile nonterminal jobs without blind apply.
- OpenViking: back up only state needed to preserve identity/config; prove full rebuild from vault.
- 9Router: separate encrypted SQLite/config backup and restore drill.
- Secrets/keys: separate recovery path, never committed to vault or repository.

Google Drive is not live sync and not immutable storage. Timestamped names plus immutable-copy behavior protect normal automation from overwrite; they do not protect against a compromised OAuth token deliberately deleting rclone-created backup files.
