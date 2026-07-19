# Interaction examples

Examples describe behavior, not final Telegram wording.

## Raw article paragraph

**User sends:** copied paragraph and URL.

**Immediate response:** `Saved · C-20260719-0042`

**Later proposal:**

> Topic: Spring transaction boundaries
> Source says: proxy-based transactions apply only across intercepted calls.
> Why this may matter: explains why self-invocation bypassed rollback.
> Suggested action: Learn
> Source: original URL and exact copied excerpt

## Screenshot without context

**User sends:** error screenshot.

Raw file and Telegram metadata persist first. OCR/vision may later propose "database connection pool timeout." If confidence is low, digest asks: "Was this saved as a bug you solved or a reference for later?"

## Several related messages

User sends a copied answer, then replies to it with code, then replies "worked after changing propagation." Reply chain provides strong grouping. One synthesis cites all three capture IDs and keeps each original item.

## Unrelated messages close together

User sends Git advice, then an Educative link about JVM memory one minute later. No reply/source relation exists and topics differ. Items remain separate despite timing.

## Optional context

**User sends:** article link plus `why: use this in next code review`.

Processor treats user-authored context as higher authority than inferred purpose and never rewrites it as a source claim.

## Correction

**Digest:** classifies a copied deployment command as durable knowledge.

**User:** `temporary, only needed for today's server fix`

System records feedback, prevents durable promotion, and keeps raw capture until retention policy removes it.

## 9Router outage

**User sends:** screenshot and note while 9Router is stopped.

**Immediate response:** `Saved · processing delayed`

Raw record enters `captured`; processing job enters retry queue. After recovery, same job executes once using idempotency key. No duplicate Notion page is created.

## Notion outage

Digest is available in Telegram/local store. Notion export remains in outbox and retries later. Review feedback applies locally and is synchronized when Notion returns.

## Work-sensitive content

If capture is marked `private-work` or source policy blocks external processing, system stores only permitted metadata/local content and skips external models. Policy must be configured before workplace rollout.
