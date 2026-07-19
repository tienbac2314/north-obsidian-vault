# Recommended architecture

Status: **Proposed MVP**, subject to [`behavior/experiments.md`](../behavior/experiments.md).

## Behavioral contract

Capture first, interpret later, review briefly, consolidate weekly. System never asks user to structure raw input before saving it.

## MVP components

### Capture adapter

- Receives Telegram polling/webhook update.
- Validates allowlisted user/chat.
- Downloads permitted attachment or records retriable download job.
- Writes immutable capture and outbox in one SQLite transaction.
- Acknowledges only after commit.
- Contains no LLM/Notion/memory dependency.

### Local store

- SQLite WAL for state, provenance, feedback, jobs, outbox, FTS.
- Content-addressed files for attachments/large payloads.
- Encrypted daily off-host backup and restore checks.

### Processor

- Claims jobs with lease/idempotency.
- Groups only with strong signals.
- Calls 9Router for replaceable classification/synthesis generation.
- Validates structured output against versioned schema.
- Stores candidate derivation, never overwrites raw.
- Sends irrecoverable jobs to dead letter.

Hermes may host or invoke processor, but processor contract remains independent.

### Review and projection

- Telegram sends raw acknowledgment, delayed warning, digest, and correction actions.
- Notion receives daily digests/approved knowledge through transactional outbox.
- Local data remains usable if Notion fails.
- Weekly review consolidates by topic/project and produces practice/career evidence.

## 9Router policy

Reuse current gateway for:

- classification and topic proposals;
- source summaries;
- explanation drafts;
- weekly synthesis;
- optional OCR/vision for content allowed to reach configured providers.

Do not call 9Router during raw transaction. Do not route embeddings through combos. Evaluation jobs record requested route, actual selected model when available, prompt/schema version, latency, and result status without storing prompt bodies in gateway logs.

## Embedding policy

MVP has no embeddings. If retrieval tests justify vectors:

- pin explicit provider/model/dimensions/preprocessor/chunker/metric;
- use direct endpoint or guaranteed no-fallback 9Router exact route;
- fail closed on outage;
- write new index generation for any change;
- keep index disposable and source-addressed.

## Security analysis

- Telegram bot uses allowed-user list; reject groups until explicitly tested.
- Secrets stay in owner-readable environment/secret store, never database/docs/logs.
- Raw captures classified `personal`, `public-source`, `private-work`, or `restricted`; uncertain defaults to restricted external processing.
- Captured text/web pages are untrusted data, never agent instructions. Processor prompt/tool policy prevents captured prompt injection from invoking tools.
- Processor gets no shell/browser/write tools unless job explicitly requires them.
- Use dedicated scoped 9Router client key; expose compatibility API only through loopback/private boundary where possible; management UI separate.
- Disable body/header request logging; rotate metadata logs.
- Restrict 9Router DB/directories to service owner; add host firewall defense in depth; verify tunnel access controls.
- Encrypt off-host backups and test deletion across raw, projections, indexes, and backups according to retention policy.

## MVP deployment shape

One process can host adapter, worker, scheduler, and local API; modules communicate through SQLite jobs. Separate processes are unnecessary until fault isolation or scaling evidence appears. One Telegram bot is enough.

## Possible future architecture

- Obsidian reads deterministic Markdown export.
- Supermemory or OpenViking indexes approved notes as disposable derived view.
- OpenViking may serve shared context to Hermes/development agents after isolation/backup pilot.
- Additional bots only for security boundary or noisy digest separation.
- Dedicated queue/object storage only after measured concurrency/volume.

## Explicitly postponed

- vector search;
- automatic old-note linking beyond conservative suggestions;
- multi-agent research/coaching;
- separate capture/digest bots;
- OpenViking installation;
- Obsidian plugin automation;
- migration of existing Supermemory data;
- automatic workplace-content processing;
- elaborate dashboards and gamification.

