# Decision log

No recommendation becomes accepted merely because it appears here. Proposed and Experimental records require MVP evidence before promotion.

## DEC-001: Raw capture survives every model outage

- Status: Accepted
- Date: 2026-07-19
- Confidence: High
- Context: Lost captures destroy trust. 9Router, upstream providers, Hermes, Notion, and future memory systems can all be unavailable.
- Decision: Commit each allowlisted Telegram update to local durable storage before acknowledging it. No LLM call may occur in this transaction.
- Rationale: This is an explicit product invariant and removes volatile dependencies from ingestion.
- Alternatives considered: Model-first capture; Notion-first capture; Hermes session state as the only record.
- Tradeoffs: Requires a small ingestion service and local recovery discipline.
- Evidence: User requirement; current 9Router logs contain timeout/rate-limit/fallback signals; architecture failure analysis.
- What could change this decision: Nothing short of a new product requirement accepting capture loss.
- Related documents: [Recommended architecture](../architecture/recommended-architecture.md), [Failure handling](../architecture/failure-handling.md)

## DEC-002: Start with one Telegram bot

- Status: Experimental
- Date: 2026-07-19
- Confidence: Medium
- Context: Capture must work on phone and PC without a new habit or form.
- Decision: Use one bot for capture, status, digest, and correction during MVP; keep internal ingestion, processing, and publishing boundaries separate.
- Rationale: Lowest behavioral friction and no second destination to remember.
- Alternatives considered: Separate capture/digest bots; Notion form; Obsidian-only capture.
- Tradeoffs: Digest noise and security roles share one interface.
- Evidence: Telegram already works through Hermes; Telegram supports text, files, replies, media groups, and stable update IDs.
- What could change this decision: Notification fatigue, security separation, or observed command ambiguity.
- Related documents: [Telegram research](../research/telegram.md), [Experiments](../behavior/experiments.md)

## DEC-003: Use hybrid asynchronous processing

- Status: Experimental
- Date: 2026-07-19
- Confidence: Medium
- Context: Immediate synthesis fragments related messages; daily-only processing loses context.
- Decision: Save immediately, enrich asynchronously, group conservatively, review daily, and consolidate weekly.
- Rationale: Balances low capture friction with enough context for useful synthesis.
- Alternatives considered: Immediate full synthesis; session-window batching; daily-only processing.
- Tradeoffs: More states, jobs, retries, and correction paths.
- Evidence: Current capture behavior and cadence analysis; not yet validated by two weeks of use.
- What could change this decision: Capture latency, grouping accuracy, review time, or ignored-digest evidence.
- Related documents: [Capture-to-digest behavior](../behavior/capture-to-digest.md), [Experiments](../behavior/experiments.md)

## DEC-004: Keep local SQLite and files as canonical truth

- Status: Proposed
- Date: 2026-07-19
- Confidence: Medium-high
- Context: Raw events need idempotency, provenance, offline recovery, attachments, and replaceable projections.
- Decision: Use SQLite WAL for records/jobs/FTS and content-addressed files for large payloads.
- Rationale: Small operational footprint, transactional capture, straightforward export, and no SaaS dependency.
- Alternatives considered: Notion canonical store; Markdown-only append log; Supermemory/OpenViking canonical store.
- Tradeoffs: Operator owns schema, backup, restore, and projection reconciliation.
- Evidence: Storage comparison and 2-core/12-GB deployment constraint.
- What could change this decision: Prototype reveals unacceptable corruption/recovery burden or attachment scale.
- Related documents: [Storage research](../research/storage-options.md), [Data model](../architecture/data-model.md)

## DEC-005: Use Notion as review projection, not ingestion queue

- Status: Proposed
- Date: 2026-07-19
- Confidence: Medium
- Context: Existing journal is visible but sparse; repeating templates solve page creation, not knowledge growth.
- Decision: Project digests and approved notes to Notion through an outbox. Preserve local truth through Notion outages.
- Rationale: Retains familiar review UI without coupling capture reliability to Notion.
- Alternatives considered: Notion as sole store; remove Notion; Notion as canonical approved-note store.
- Tradeoffs: Two-way edits need explicit reconciliation.
- Evidence: Four inspected journal rows, empty summaries, official API limits/webhooks/repeating-template behavior.
- What could change this decision: User prefers Obsidian review, Notion projection adds no usage, or conflict handling proves costly.
- Related documents: [Notion research](../research/notion.md), [Unresolved questions](unresolved-questions.md)

## DEC-006: Reuse 9Router for replaceable generation only

- Status: Proposed
- Date: 2026-07-19
- Confidence: High for scope, medium for operational quality
- Context: 9Router already centralizes many provider accounts and Hermes generation; fallback is valuable but broadens outage and credential blast radius.
- Decision: Route classification, summaries, explanation drafts, and weekly synthesis through 9Router. Keep capture independent and retain direct-provider rollback mode.
- Rationale: Reuses current quota/fallback management only where model substitution is tolerable.
- Alternatives considered: Every LLM/embedding call through 9Router; no pipeline use of 9Router.
- Tradeoffs: Generation pauses during gateway outage; semantic quality can vary across fallback models.
- Evidence: Official v0.5.35 capabilities and redacted live deployment inspection.
- What could change this decision: Controlled outage/quality tests fail, privacy policy disallows routes, or gateway reliability is insufficient.
- Related documents: [9Router research](../research/9router.md), [Recommended architecture](../architecture/recommended-architecture.md)

## DEC-007: Pin embedding identity and fail closed

- Status: Proposed
- Date: 2026-07-19
- Confidence: High
- Context: Vector meaning depends on model, dimensions, preprocessing, chunking, and metric. Transparent substitution can silently mix incompatible vectors.
- Decision: If vectors are introduced, pin an exact embedding contract through a direct endpoint or guaranteed no-substitution route. Create a new index generation for any change.
- Rationale: Embedding identity is data integrity, not load balancing.
- Alternatives considered: 9Router model combo fallback; same-dimension substitution; automatic mixed indexes.
- Tradeoffs: Less availability and a second credential/endpoint path.
- Evidence: Supermemory deployment already pins one 768-dimensional model; official Supermemory behavior rejects model switching.
- What could change this decision: Proven cross-model compatibility with isolated index generations, never transparent mixing.
- Related documents: [Semantic search](../research/semantic-search.md), [Supermemory state](../current-state/supermemory.md)

## DEC-008: Postpone vector retrieval

- Status: Proposed
- Date: 2026-07-19
- Confidence: Medium-high
- Context: No corpus-size or failed-retrieval evidence yet justifies vector infrastructure.
- Decision: Start with metadata, links, SQLite FTS, and topic/project review. Add vectors only after a measured baseline fails.
- Rationale: Solves capture/review behavior first and keeps embeddings outside MVP critical path.
- Alternatives considered: Vector-first; Supermemory-first; OpenViking-first.
- Tradeoffs: Early semantic recall may be weaker.
- Evidence: Existing problem is capture and reflection, not demonstrated search failure.
- What could change this decision: Evaluation set shows material FTS/backlink misses on approved notes.
- Related documents: [Semantic search](../research/semantic-search.md), [MVP](../roadmap/mvp.md)

## DEC-009: Treat Obsidian and memory platforms as derived views

- Status: Proposed
- Date: 2026-07-19
- Confidence: Medium
- Context: Obsidian, OpenViking, and Supermemory offer different review/retrieval value but are not installed or behaviorally validated for this workflow.
- Decision: Export deterministic Markdown for Obsidian when useful; pilot Supermemory/OpenViking only against approved-note projections.
- Rationale: Preserves portability and isolates experimental indexes from raw truth.
- Alternatives considered: Adopt each as canonical MVP store.
- Tradeoffs: Delays advanced recall and agent-context features.
- Evidence: Official component research and prior repository migration history.
- What could change this decision: A shadow pilot materially improves weekly review/retrieval with acceptable backup and isolation.
- Related documents: [Obsidian](../research/obsidian.md), [OpenViking](../research/openviking.md), [Supermemory](../research/supermemory.md)
