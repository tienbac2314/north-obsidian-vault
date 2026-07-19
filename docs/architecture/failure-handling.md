# Failure handling

## Invariant

If raw capture cannot be durably committed, bot must not say `Saved`. Failure in 9Router, upstream models, Hermes, Notion, Supermemory, OpenViking, or Obsidian must never roll back committed raw capture.

## Failure matrix

| Failure | Detection | Safe behavior | Recovery/evidence |
|---|---|---|---|
| Duplicate Telegram update | unique source-event constraint | return existing capture acknowledgement | audit duplicate count |
| Telegram edit/delete | update type/source version | append version/tombstone; never rewrite original silently | show provenance history |
| Attachment download fails | download error/checksum missing | save message metadata, mark pending, acknowledge delayed attachment | retry before Telegram retention expires; alert dead letter |
| Disk full/SQLite commit fails | transaction/fsync error | no success acknowledgement; send failure if possible | free space, restore, resend/replay update |
| Capture worker restart | job/outbox persisted in same transaction | resume leases; no duplicate | startup recovery metrics |
| URL fetch/paywall | fetch status/content policy | preserve URL/excerpt; synthesize only available source | mark inaccessible and allow user upload |
| Prompt injection in source | untrusted-content boundary | model gets data-only wrapper and no tools | quarantine suspicious output; test corpus |
| 9Router unavailable | health/request transport error | queue processing; raw acknowledgement still works | capped backoff; process once after recovery |
| Upstream 429/5xx | structured gateway response | allow configured generation fallback where policy permits | record selected route/model and attempt |
| Model invalid JSON | schema validation | retry once with repair or alternate permitted model; never store malformed candidate | dead-letter after budget |
| Embedding provider fails | explicit pinned endpoint error | fail closed; do not substitute model | retry same contract; index remains consistent |
| Notion unavailable/rate limited | 429/529/5xx | keep local digest/note; queue projection | honor Retry-After/backoff; idempotent upsert |
| Notion edited concurrently | version/hash mismatch/webhook | do not overwrite; create reconciliation task | user chooses local/Notion/merge |
| Wrong grouping | feedback | supersede group and regenerate | preserve prior candidate for audit |
| Wrong classification | feedback | change disposition; do not retrain automatically | include in evaluation set |
| Scheduler missed run | overdue period query | generate next run with actual range; no blank daily page required | alert after grace window |
| Backup fails | nonzero job/checksum/remote failure | keep service running but alert visibly | retry; restore drill remains failed until proven |

## Retry policy

- Transport, 429, 5xx: exponential backoff with jitter, bounded attempts/age.
- Validation, auth, policy, missing permission: no blind retry; surface action.
- Job lease expiry supports crash recovery.
- Dead letters remain linked to capture and appear in digest/status.
- Manual replay creates new processing run with same source and new versioned idempotency key.

## Observability

Record counts/latency/status by stage, not raw private bodies. Required signals:

- capture commit success/failure and acknowledgement latency;
- pending attachment age;
- processing queue depth/oldest age/dead letters;
- 9Router and selected-route availability;
- digest delivery/review;
- Notion outbox age;
- backup age and last successful restore test;
- disk/database growth.

## Recovery priorities

1. Protect raw database/object store and stop false acknowledgements.
2. Restore capture ingestion.
3. Drain attachment/outbox jobs.
4. Restore processing and digests.
5. Restore projections and optional indexes.
