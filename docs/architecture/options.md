# Architecture options

## Criteria

- Direct Obsidian use stays available without agents.
- Canonical Markdown has one authority.
- Existing notes cannot be silently overwritten.
- Sync, audit, and backup remain distinct.
- Optional Telegram capture survives model outages.
- 2-core/12-GB ARM64 VPS remains operable.

## A. Obsidian only

Obsidian plus free sync, Git, and backup. Lowest operational burden and valid fallback. Lacks agent proposal automation and semantic context, but remains useful if every later component is removed.

## B. Obsidian plus proposal-only Hermes

Adds deterministic workspace service and 9Router-backed proposal drafting. Best first release: agent value without second knowledge authority or automatic overwrite.

## C. Obsidian plus symmetric OpenViking

Both systems edit same logical notes. Rejected: conflicting truth, rename/delete ambiguity, feedback loops, and unclear recovery.

## D. Obsidian plus derived OpenViking

OpenViking indexes allowed vault material through explicit manifest and serves Hermes recall. Recommended later promotion after plain-search baseline and lifecycle tests.

## E. Telegram/OpenViking first

Rejected as main workflow. User expects direct Obsidian use; OpenViking processing is unnecessary receipt dependency. Optional Telegram later uses independent SQLite ingress.

## Sync candidates

| Option | Strength | Critical weakness | Status |
|---|---|---|---|
| Self-hosted LiveSync | Obsidian-native multi-device flow; self-hostable; newer CLI | CouchDB/CLI recovery and conflict behavior need ARM64 test | Primary experiment |
| Remotely Save | Many free storage backends | VPS convergence and same-note conflict semantics need proof | Primary experiment |
| Syncthing | Strong desktop/VPS file replication | Official Android client discontinued | Fallback with accepted community client |
| Git transport | Excellent history and controlled exchange | Weak phone/offline live-sync UX; merges expose implementation detail | Desktop-first fallback |
| Obsidian Sync | First-party integration | Paid subscription violates constraint | Rejected |

## Component comparison

| Component | Role | Canonical? | May block ordinary writing? |
|---|---|---|---|
| Obsidian vault | Human library | Yes | No |
| Sync | Replication | No | No; local edits continue |
| Git | Audit/rollback | No | No |
| Backup | Disaster recovery | Recovery copy | No |
| Hermes | Orchestration/proposals | No | No |
| Workspace service | Safe mutation state | Operational only | Only approved agent apply |
| 9Router | Replaceable model gateway | No | No |
| OpenViking | Derived context | No | No |
| SQLite Telegram ingress | Raw delivery queue | Canonical for raw event only | Telegram acknowledgment only |
