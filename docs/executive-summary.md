# Executive summary

Current failure is not missing journal automation. It is loss of context between capture and later reflection. Empty daily pages and pasted AI/article text do not produce durable understanding.

Recommended experiment: capture anything through one Telegram bot without structure, persist it locally before acknowledging, enrich it asynchronously, review a short daily digest, then produce a weekly topic/project synthesis with source links and one practice target.

Recommended MVP keeps SQLite/files as canonical truth. Telegram is capture/review UI. 9Router is current centralized generation gateway for classification and synthesis, but never part of raw capture. Notion is an optional review projection. SQLite FTS and explicit links precede vectors. If vectors become justified, embeddings use an explicitly pinned contract and fail closed; transparent model fallback is forbidden.

Obsidian, Supermemory, and OpenViking remain future derived views or shadow experiments. None owns raw truth. Main risks are capture loss, sensitive-content leakage, prompt injection, weak backup/restore, 9Router credential/log blast radius, bad grouping, and review fatigue.

Build only after Phase 0 tests behavior. First technical acceptance test: with 9Router and every upstream provider unavailable, a Telegram update still becomes one durable capture and receives `Saved` only after commit.

Read [system design](system-design.md) for complete behavior and architecture, then [decision log](decisions/decision-log.md), [MVP](roadmap/mvp.md), and [unresolved questions](decisions/unresolved-questions.md).
