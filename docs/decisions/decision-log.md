# Decision log

Statuses: Accepted, Proposed, Experimental, Rejected, Postponed.

## DEC-001: Obsidian vault is canonical human library

- Status: Accepted
- Date: 2026-07-21
- Decision: Direct Obsidian Markdown is primary input and canonical curated knowledge. Ordinary notes require no agent or structure.
- Tradeoff: Vault sync and file-level concurrency become operator responsibilities.

## DEC-002: Keep Dusk structure optional

- Status: Accepted
- Date: 2026-07-21
- Decision: Retain Dusk-inspired PARA/Zettelkasten folders plus `INBOX/Unsorted` and `INBOX/Pending Agent Review`; omit old plugins/runtime. Classification is never required during capture.
- Tradeoff: Some notes remain unsorted; weekly review carries organization cost.

## DEC-003: Queue means proposal, not overwrite

- Status: Accepted
- Date: 2026-07-21
- Decision: Moving note to pending review authorizes Hermes to inspect and propose. Existing canonical pages always require approval and expected hash.
- Alternatives rejected: unrestricted write; infer ownership from sync events; first manual edit “claims” file.
- Tradeoff: More review for actual edits, but ordinary unqueued notes require none.

## DEC-004: Use deterministic mutation service

- Status: Proposed
- Date: 2026-07-21
- Decision: Enforce path containment, exclusions, SQLite proposal journal, idempotency, hash-based optimistic concurrency, atomic write, validation, and Git commit outside LLM.
- Tradeoff: Small custom operational component remains necessary.

## DEC-005: Separate sync, Git, and backup

- Status: Accepted
- Date: 2026-07-21
- Decision: Sync converges devices, Git audits accepted history, encrypted off-host backup restores disaster loss. No component substitutes for other two.
- Tradeoff: Three policies/tools require documentation and drills.

## DEC-006: Test free sync before selection

- Status: Experimental
- Date: 2026-07-21
- Decision: Compare Self-hosted LiveSync and Remotely Save on Windows/Android/VPS. Syncthing needs explicit acceptance of community Android client. Paid Obsidian Sync rejected.
- Tradeoff: Implementation plan cannot fix exact sync topology until experiment passes.

## DEC-007: OpenViking is derived projection

- Status: Proposed
- Date: 2026-07-21
- Decision: Add OpenViking after core release through explicit manifest/reconciliation for derived vault retrieval. Native agent memory/imported-resource state stays disabled until separate authority, retention, deletion, and backup policy exists. OpenViking never owns curated page truth or raw Telegram acknowledgment.
- Tradeoff: Advanced semantic recall arrives later and requires projection lifecycle service.

## DEC-008: Operational SQLite is allowed

- Status: Accepted
- Date: 2026-07-21
- Decision: SQLite WAL may own proposal/jobs/idempotency and optional Telegram raw ingress. Markdown remains knowledge truth; OpenViking remains derived context.
- Rationale: OpenViking feature overlap does not provide truthful pre-agent receipt or file compare-and-swap.

## DEC-009: Telegram remains optional and independently durable

- Status: Proposed
- Date: 2026-07-21
- Decision: Add Telegram after core release. Commit raw update before `Saved`; Hermes/OpenViking/9Router run asynchronously.
- Evidence: Hermes documented hooks and memory flush occur within/after agent lifecycle, not proven pre-receipt durability.

## DEC-010: Reuse 9Router for replaceable generation/VLM

- Status: Proposed
- Date: 2026-07-21
- Decision: Use current gateway for allowed classification, synthesis, and vision. No call sits in ordinary writing or Telegram raw transaction. Provider/data-class policy controls sensitive notes.
- Tradeoff: Generation can pause; fallback model quality varies.

## DEC-011: Pin embeddings and fail closed

- Status: Accepted
- Date: 2026-07-21
- Decision: One index generation fixes provider, exact model, dimensions, preprocessing, chunker, normalization, and metric. No model combo fallback.
- Experiment: compare dedicated exact 9Router route against local Ollama `embeddinggemma` on bilingual corpus and ARM64 VPS.

## DEC-012: Weekly compression is core product

- Status: Accepted
- Date: 2026-07-21
- Decision: Daily page is optional. Weekly review must produce own-words understanding and one changed action; monthly review compresses trends.
- Tradeoff: System cannot fully automate growth; user reflection remains necessary.

## DEC-013: Postpone high-risk automation

- Status: Postponed
- Date: 2026-07-21
- Decision: Canvas generation, managed-section writes, bulk organization, moves, renames, merges, archive, delete, automatic link repair, vector retrieval, and local VLM fallback wait for concrete evidence.

## DEC-014: Treat NotebookLM as adversary, not authority

- Status: Accepted
- Date: 2026-07-21
- Decision: Retain challenges and independently verified facts; reject paid/out-of-scope, invented, contradictory, or unsupported prescriptions.
- Related: [NotebookLM review](../research/notebooklm-adversarial-review.md).
