# Personal knowledge pipeline

Research and design for turning scattered Telegram messages, AI answers, articles, screenshots, and work lessons into useful notes and periodic growth reviews.

## Problem and goals

Current capture is unstructured copy-paste. Daily journal pages are inconsistent, summaries remain empty, and rereading every day is unrealistic. Goal is low-friction capture followed by source-linked daily triage and weekly learning synthesis—not automatic page creation for its own sake.

System must preserve raw input before any model call, require about two minutes of normal daily attention, remain useful through downstream outages, and avoid premature dependence on Notion, Obsidian, OpenViking, Supermemory, Hermes, or vector search.

## Research status

Research and proposed architecture are complete as of 2026-07-19. Official sources, existing Notion behavior, public repository history, and redacted read-only VPS state were inspected. Recommendations remain Proposed or Experimental unless decision record says otherwise. No pipeline implementation exists yet.

## Recommended reading order

1. [Executive summary](docs/executive-summary.md)
2. [Complete system design](docs/system-design.md) — authoritative behavioral and technical design
3. [Decision log](docs/decisions/decision-log.md)
4. [MVP scope and acceptance](docs/roadmap/mvp.md)
5. [Unresolved questions](docs/decisions/unresolved-questions.md)
6. [Architecture diagrams](docs/architecture/diagrams.md)

Detailed evidence lives under [current state](docs/current-state/vps-inventory.md), [component research](docs/research/9router.md), and [raw research notes](research-notes/official-sources.md). [Implementation plan](docs/superpowers/plans/2026-07-19-personal-knowledge-pipeline-research.md) preserves execution history.

## Current recommendation

- One Telegram bot; separate internal capture, processing, and publishing responsibilities.
- SQLite/files as canonical truth; raw commit before `Saved`.
- 9Router for replaceable classification/synthesis only—not capture and not fallback embeddings.
- Notion as optional review projection.
- SQLite FTS/backlinks first; pinned embeddings only after measured retrieval failure.
- Obsidian, Supermemory, and OpenViking as future derived views/pilots.

## Major unresolved decisions

- Whether Hermes can expose a safe pre-agent persistence hook.
- Data policy for private work captures and external model providers.
- Notion two-way edit/conflict behavior.
- Attachment retention and off-host backup target.
- Measured grouping thresholds, digest usefulness, and 9Router route quality.

No private endpoints, credentials, raw logs, database dumps, or provider/account details belong in this repository.
Research and design for turning scattered captures into useful notes and summaries
