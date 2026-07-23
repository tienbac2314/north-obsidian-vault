# Redacted VPS findings

Inspection date: **2026-07-19**, timezone Asia/Saigon. Method: authenticated VibeShell Agent Gateway, existing saved SSH credentials, read-only process/file-metadata/database-schema commands, and one external reachability probe. No service, file, process, firewall rule, or database row was changed.

Hostnames, IP addresses, account/provider names, model-route contents, tokens, secrets, full environment values, prompt content, raw logs, and database rows are intentionally omitted.

## Verified current-state facts

### Process state

- PM2 reported 9Router online at version `0.5.35`, one restart, running as a local process rather than Docker.
- Hermes Gateway was online and its Telegram platform reported connected.
- Supermemory server `0.0.5` and its embedded engine were running as separate processes.
- Point-in-time process state can become stale immediately after inspection.

### Hermes and 9Router integration

- Sanitized Hermes configuration used provider type `custom`, default model label `Hermes`, and a loopback OpenAI-compatible `/v1` route.
- 9Router listened on its standard port and exposed the local compatibility endpoint Hermes targets.
- This verifies Hermes generation currently depends on 9Router. It does not prove every Hermes tool or background task uses that route.

### 9Router routing and persistence

- SQLite schema contained 30 provider connections across 7 provider types; 22 connections were active.
- Four model combos existed; two contained multiple models, verifying configured model-level fallback rather than only advertised capability.
- Five proxy pools existed and were active.
- One active client API key existed.
- SQLite held 3,800 usage-history rows and exactly 1,000 request-detail rows. Values were not inspected.
- All stored usage-history status values were `ok`; this cannot be interpreted as a success rate because failed attempts may be represented only in logs or omitted.

### Failure and logging signals

- Aggregated PM2 log keyword counts showed repeated `fallback`, `retry`, timeout, 429, 403, and 5xx events. No raw line, provider, model, request, or account value was read into this repository.
- Request-log environment flag was not set in the PM2 environment at inspection time.
- Despite that flag, large PM2 output/error logs and structured request-detail/usage tables existed. Treat all three as sensitive operational data.
- Keyword counts show failure handling is exercised; they do not prove that every failed request recovered or that fallback preserved output quality.

### Storage and backups

- Current 9Router state used `~/.9router/db/data.sqlite` with WAL/SHM files.
- Three automatic database snapshots were present under the 9Router backup directory. Names indicate schema/upgrade events, not scheduled disaster-recovery backups.
- No user cron entry or user systemd timer for recurring 9Router backups was found.
- Older backups under a different legacy product directory were observed but are not counted as current 9Router backups.
- No off-host backup was verified.

### Security posture

- Secret files used owner-only mode `600`.
- Main SQLite file used mode `644`; 9Router directories used mode `775`. On a multi-user host, other local users could potentially read the database or traverse directories.
- 9Router bound to all network interfaces. Host UFW was inactive.
- A public HTTPS probe succeeded with valid TLS and an HTTP redirect.
- A direct probe to the 9Router service port timed out from the inspector network. This suggests an external network control blocks direct access, but it is not a complete perimeter audit.
- Cloudflare tunnel processes were present. Command-line secrets were redacted during inspection.
- Security therefore relies partly on Oracle/cloud network controls and tunnel configuration rather than host firewall defense in depth.

### Supermemory embeddings

- Supermemory `0.0.5` had an embedding plan pinned to `gemini-embedding-2-preview`, 768 dimensions.
- Its endpoint was a named OpenAI-compatible host and did **not** match the user-managed 9Router hostname.
- This is valuable precedent: current vector data already depends on a fixed model/dimension contract rather than a model-combo fallback.

## Interpretation

9Router is suitable for replaceable generation calls where cost/quota fallback matters. It should not sit before raw capture persistence. Embeddings should remain pinned; transparent fallback across embedding models can corrupt retrieval consistency even when dimensions match.

## Remaining uncertainty

- Oracle VCN/security-list rules were not available through the host inspection.
- Dashboard authentication and tunnel access policy were not exercised to avoid state or credential exposure.
- Backup restore was not tested.
- Log retention/rotation policy was not identified.
- 9Router `requestDetails` payload contents were deliberately not inspected.
- Failure recovery quality needs controlled requests with synthetic, non-sensitive prompts.
