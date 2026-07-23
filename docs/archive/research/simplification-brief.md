# Obsidian and Hermes simplification brief

Date: 2026-07-21. This brief fed completed adversarial review and now records fixed requirements; it is not an approved architecture.

## User outcome

Build a durable personal learning and growth system for a junior software engineer. User writes primarily in Obsidian, often by pasting rough material. Hermes should help turn explicitly submitted notes into useful structured knowledge and later reviews without silently reorganizing or overwriting the rest of the vault.

## Fixed decisions

- Obsidian is canonical human interface and Markdown library.
- Direct Obsidian writing is primary input.
- Telegram remains an ordinary Hermes chat interface, not an Obsidian ingestion channel.
- `INBOX/Unsorted` accepts ordinary rough notes without agent action.
- Moving a note to `INBOX/Pending Agent Review` explicitly requests inspection and a proposed result.
- Hermes native scheduled review automatically discovers notes in that folder; no custom watcher or shell cron is added.
- Ordinary notes remain untouched.
- Updating an existing human note requires explicit command or review.
- First manual edit to an agent-created note makes the whole note human-owned and review-required.
- Reuse Dusk's understandable PARA and Zettelkasten structure, not its outdated plugin-heavy runtime.
- Avoid paid Obsidian Sync.
- Oracle VPS already hosts Hermes and 9Router. 9Router remains Hermes's central generation-model gateway; do not invent a second model router.
- Prefer existing maintained extensions over custom services.

## Components to delete unless evidence proves need

- Telegram capture and durable ingress pipeline.
- Custom Python workspace service.
- Custom SQLite proposal/job database.
- OpenViking and embeddings in first release.
- Custom agent API when Hermes can operate a plain Markdown vault using its bundled Obsidian skill.
- Elaborate backup pipeline beyond the smallest independently restorable history mechanism.
- Automatic classification, autonomous filing, or background mutation of ordinary notes.

## Candidate existing extensions

### Self-hosted LiveSync plus official CLI

Potentially supplies free multi-device sync, E2EE, conflict handling, and a headless filesystem mirror for Hermes. Current open issue `vrtmrz/obsidian-livesync#1036` reports E2EE CLI push failure under Node. Treat that as a deployment blocker for encrypted agent writes until fixed upstream and verified.

### Fast Note Sync

Potentially supplies sync plus native REST/MCP access for Hermes with fewer components. Current concerns: E2EE remains roadmap work, folder-scoped authorization is incomplete, security/permission reports remain open, and mature conflict resolution is still roadmap work.

### Local REST API with MCP

Strong local Obsidian API while desktop app is open. Does not give always-on VPS Hermes access by itself.

### Hermes bundled Obsidian skill

Already provides filesystem-first Markdown operations through `OBSIDIAN_VAULT_PATH`. It can replace custom note CRUD when VPS has a real vault directory. A narrow workflow skill still must define submission and review behavior.

## Responsibilities that must not be conflated

- Sync: distributes current state among devices.
- Version history: permits comparison and rollback.
- Backup: restores after corruption, deletion, or broken sync.
- Agent access: lets Hermes read or write Markdown.
- Authorization: determines which notes Hermes may process or change.
- Knowledge retrieval: finds relevant notes; this does not require embeddings until plain search fails.

One tool may implement several responsibilities, but design must state which guarantee comes from which feature.

## Required behavior

1. User writes any normal note; nothing automatic happens.
2. User moves rough note into `INBOX/Pending Agent Review`.
3. Hermes processes only that queued note and relevant user-approved context.
4. Hermes creates a separate proposal/result note by default.
5. User may accept by keeping/editing/moving the result, or explicitly command an existing-note update.
6. Git or another minimal independent history mechanism records recoverable Markdown changes without demanding review of every commit.
7. Sync or model outage never prevents local Obsidian writing. Pending work waits truthfully; no silent loss.

## Questions for adversarial review

1. What is the fewest-component architecture that satisfies every fixed decision?
2. Can folder state plus Git replace custom SQLite workflow state without unsafe ambiguity?
3. Which sync option is deployable now, not merely attractive after future fixes?
4. Should first release permit VPS Hermes writes, or remain read/propose-local until LiveSync's encrypted CLI write path is fixed?
5. What is the smallest independent recovery mechanism that is not falsely described as backup?
6. Which parts can be postponed without weakening daily usefulness?
7. What is the strongest argument against the recommended architecture?
