# Capture-to-digest behavioral design

Status: **Proposed for a two-week experiment**, not accepted architecture.

## Actual problem

This project is not primarily a daily-journal generator. It must convert low-friction, scattered source captures into personal understanding and periodic action without asking the user to structure material at capture time.

Success means the user can later answer:

- What did I learn?
- Why did it matter in my work?
- Where is the original evidence?
- What should I practice or change?
- What patterns show growth over weeks?

Storage volume, embedding count, and daily-page count are not success measures.

## Observations

- Useful material appears evenly across AI chats, browser/Educative, and coding work.
- Captures may be paragraphs, links, screenshots, quotes, thoughts, partial notes, or unrelated messages sent close together.
- Current behavior copies source language without context or explanation.
- Sustainable manual effort is roughly two minutes per normal workday.
- Existing Notion journal has four dated rows: two `Done`, two `Not started`, and all four Summary fields empty.
- Template asks for tasks, learning, problems/solutions, and links, but provides no minimum entry or later review loop.
- Primary goal is engineering growth and learning retention; career evidence and better execution are desired side effects.

## Proposed hybrid flow

### 1. Persist immediately

For each Telegram update:

1. Verify allowed sender.
2. Assign stable capture ID from bot identity and `update_id`.
3. Store raw message, Telegram identifiers, timestamp, reply/media-group relationships, source URL, attachment metadata, and processing state in local durable storage.
4. Commit transaction.
5. Reply `Saved` without calling any LLM.

This path must work when 9Router, every upstream provider, Hermes agent execution, Notion, and semantic stores are unavailable.

### 2. Enrich asynchronously

Processor makes a best-effort proposal:

- normalized title;
- topic and content type;
- why it may matter;
- confidence;
- source summary distinct from personal interpretation;
- candidate related items;
- action: learn, practice, reference, temporary, or task.

Original capture remains immutable. Every derived field records processor/model/prompt version and source capture IDs.

### 3. Group conservatively

Strong grouping signals:

- same Telegram media group;
- explicit reply chain;
- same forwarded/source URL;
- continuation wording;
- high semantic/topic similarity inside a bounded interval.

Time proximity alone never merges captures. Ambiguous items remain separate. User can reply `same topic` or `separate`; ordinary language is preferable to command syntax.

### 4. Ask sparingly

- Add context is optional during capture.
- Processor asks only when two plausible interpretations would produce materially different durable knowledge.
- Batch ambiguity into at most one question per daily digest.
- Ignoring a question never blocks raw storage or later processing.

### 5. Produce daily review

Daily digest is generated only for days with captures and aims for under two minutes:

- **Learn:** reusable explanation in user-level language.
- **Practice:** one tiny exercise or workplace application.
- **Reference:** preserved source with minimal synthesis.
- **Temporary:** visible as archived, not promoted.
- **Needs context:** at most one question.

User actions: `keep`, `practice`, `reference`, `temporary`, `fix`, or ignore.

### 6. Produce weekly growth review

Weekly artifact is topic/project-centered, not a concatenation of days:

- three strongest lessons;
- repeated confusion or blocker;
- one skill to practice next week;
- decisions or solutions worth retaining;
- shipped/fixed evidence useful for interviews or promotion;
- stale/duplicate notes proposed for consolidation;
- source links for every claim.

## Cadence tradeoffs

| Cadence | Benefit | Failure mode | Fit |
|---|---|---|---|
| Immediate full synthesis | Fast feedback | Fragments related messages; interrupts capture; spends tokens on temporary items | Reject for MVP |
| Session-based synthesis | More context | Time window merges unrelated items or delays corrections | Use only with strong grouping signals |
| Daily-only synthesis | Low interruption | Context may be forgotten; one bad batch can be large | Useful review layer, not sole processing rule |
| Hybrid | Durable immediate capture, asynchronous enrichment, concise review | More states and retry logic | Recommended experiment |

## Assumptions to test

- A one-word raw acknowledgement builds trust without noise.
- Best-effort inference plus one daily question is enough context.
- Daily digest can be reviewed in under two minutes.
- Weekly synthesis creates more value than browsing daily pages.
- Explicit promotion prevents low-value material from polluting durable notes.

## Decisions not made

- Final raw store: SQLite versus append-only files plus SQLite index.
- Whether enrichment acknowledgment should appear immediately.
- Notion as interface only or canonical durable-note store.
- Session timeout and semantic grouping threshold.
- Retention period for temporary captures and attachment binaries.
- Obsidian/OpenViking/Supermemory adoption.
- Vector search and embedding provider.
- Whether Hermes hosts adapter or calls it as external service.

