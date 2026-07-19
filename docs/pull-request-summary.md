# Research and design the personal knowledge pipeline

## Problem

Unstructured captures from AI, articles, learning, and coding are copied into blank pages without context, often forgotten, and rarely consolidated. Automatic daily pages alone do not create learning or growth.

## Research performed

- Inspected existing Notion journal structure and row behavior.
- Reviewed official Telegram, Notion, Obsidian, Hermes, 9Router, Supermemory, and OpenViking sources with versions/commits and access dates.
- Traced relevant branches, commits, and paths in `tienbac2314/my-opencode-setup`.
- Inspected running VPS components read-only with identifiers, endpoints, secrets, raw logs, request bodies, and provider/account details redacted.
- Compared capture cadence, raw storage, semantic retrieval, four architecture options, security, backup, and failure handling.

## Systems inspected

Hermes/Telegram, 9Router v0.5.35, Supermemory v0.0.5, current Notion journal, and historical Supermemory/Mem0/OpenViking/9Router repository changes.

## Recommended MVP

- One Telegram bot with separate internal capture, processing, and publishing boundaries.
- Commit immutable raw update plus outbox to SQLite/files before replying `Saved`.
- Enrich asynchronously; group conservatively; daily review under two minutes; weekly topic/project growth review.
- Reuse 9Router for replaceable classification/synthesis only. Never place it in raw capture transaction.
- No embeddings in MVP. If later justified, pin exact provider/model/dimensions/preprocessing/chunking/metric and fail closed.
- Notion is optional projection; SQLite/files remain canonical.
- Encrypted off-host backup and restore drill are MVP acceptance requirements.

## Architecture options

Notion-first, local-truth-with-projections, memory-platform-first, and Hermes-native designs are compared. Local truth is proposed because every volatile component can fail without losing capture. Hermes-native remains viable only with verified pre-agent persistence.

## Possible target architecture

Deterministic Markdown export enables Obsidian review. A labeled retrieval evaluation may add one pinned-embedding shadow index. Supermemory or OpenViking may index approved notes as disposable derived views. Only approved, source-linked knowledge later reaches agents.

## Major decisions

Accepted invariant: raw capture precedes every model/SaaS call. Experimental: one bot and hybrid cadence. Proposed: SQLite/files truth, Notion projection, 9Router generation-only scope, pinned embeddings, FTS before vectors, future tools as derived views.

## Experimental assumptions

Capture p90 under 30 seconds; one-word acknowledgment builds trust; grouping can be accurate without mandatory structure; daily review stays under two minutes; weekly synthesis changes practice; outage recovery drains without loss/duplication.

## Unresolved questions

Hermes pre-agent hook feasibility, private-work data policy, attachment retention, backup target/key recovery, Notion conflict behavior, controlled 9Router quality/outage/restore/logging evidence, and vector-retrieval promotion threshold.

## Risks

False save acknowledgments, sensitive-content leakage, prompt injection, bad grouping, review fatigue, SQLite/attachment backup gaps, 9Router credential/log blast radius, and unverified cloud/tunnel/dashboard controls.

## Follow-up work

Run Phase 0 behavioral experiments with synthetic outage tests. Build only durable capture first. Promote later phases through measured evidence, not tool availability.

## Validation

Repository scripts scan tracked files for secret/private-endpoint patterns without printing values, validate local Markdown links, and render every Mermaid block. Final branch/PR checks are performed separately.

