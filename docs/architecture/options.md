# Architecture options

Status: analysis; recommendation is Proposed until experiments pass.

## Evaluation criteria

- Raw capture succeeds without model/SaaS availability.
- Original source and derivation provenance remain inspectable.
- Capture requires no structure and under 30 seconds p90.
- Review fits two minutes.
- Components can be removed without data migration crisis.
- Security and backup are understandable by one operator.
- 2-core/12-GB VPS remains sufficient.

## Option A: Notion-first automation

```text
Telegram/Hermes -> 9Router -> Notion databases/pages
```

- Strengths: fastest visible result; existing interface; calendar and page templates; built-in daily recurrence.
- Weaknesses: Notion/model outage enters capture path; API size/rate/order constraints; hard raw/derived separation; platform lock-in; duplicate/retry logic still needs local state.
- 9Router role: all processing generation.
- Embeddings: absent or added later.
- Verdict: useful prototype of digest layout, not production MVP truth.

## Option B: Local truth with projections

```text
Telegram -> capture adapter -> SQLite/files -> async processor -> Telegram/Notion projections
                                             -> 9Router generation
```

- Strengths: capture independence; transactional idempotency/outbox; source fidelity; easy backup/export; Notion/Hermes/9Router replaceable.
- Weaknesses: small service and schema must be maintained; two visible stores; projection reconciliation.
- 9Router role: classification/synthesis/optional permitted vision after capture.
- Embeddings: none initially; later direct pinned index.
- Verdict: recommended MVP.

## Option C: Memory-platform-first

```text
Telegram/Hermes -> Supermemory or OpenViking -> semantic recall -> Notion/Obsidian
```

- Strengths: automatic extraction, linking, and retrieval; existing Supermemory deployment; future shared agent context.
- Weaknesses: retrieval product becomes source of truth; automatic inference can obscure source; model/index outages; migration/backup complexity; behavior still unproven.
- 9Router role: generation and possibly VLM; embeddings must remain pinned.
- Verdict: reject for MVP; test as derived index after baseline.

## Option D: Hermes-native workflow

```text
Telegram -> Hermes Gateway/session/memory/cron -> Notion
                        -> 9Router
```

- Strengths: least new deployment; current Telegram and scheduling already work.
- Weaknesses: raw acknowledgement ordering unclear; broad agent tools; session/memory semantics are not an immutable event log; Hermes/9Router outage can affect capture.
- Verdict: viable only if a pre-agent durable hook meets capture invariant. Otherwise Hermes calls external capture service.

## Component comparison

| Component | MVP role | Future role | Must not own |
|---|---|---|---|
| Telegram | Capture/review interface | Same | Durable truth |
| Capture worker | Idempotent persistence and outbox | Stable ingestion boundary | Knowledge inference |
| SQLite/files | Raw truth, state, FTS | Canonical provenance/export | UI polish |
| Hermes | Optional processor/scheduler/sender | Agent orchestration | Sole raw persistence |
| 9Router | Replaceable generation gateway | Central generation observability/fallback | Raw capture or fallback embeddings |
| Notion | Digest/knowledge projection | Editable review UI | Raw event queue |
| Obsidian | None | Portable local note UI | Ingestion queue |
| Supermemory | None/shadow experiment | Derived semantic index | Canonical source |
| OpenViking | None | Shared context/resource backend pilot | MVP dependency |

## Recommendation rationale

Option B adds one small local boundary but removes every volatile component from capture availability. This directly addresses user problem and preserves paths to all candidate tools. Tradeoff is modest service/schema ownership; experiments can still begin with a single process and SQLite file.

