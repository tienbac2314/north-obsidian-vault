# Failure handling

## Invariants

- Local Obsidian writing never depends on Hermes, 9Router, OpenViking, or Telegram.
- Existing canonical note never changes without approved proposal and matching base hash.
- OpenViking failure never rolls back vault.
- Optional Telegram says `Saved` only after SQLite durable commit.

## Matrix

| Failure | Safe behavior | Recovery evidence |
|---|---|---|
| Sync offline | Keep local edit; report non-convergence | Resume and compare hashes |
| Same-note conflict | Preserve both versions; no auto-merge | Human resolution and Git commit |
| Partial/temp sync event | Exclude temp/conflict files from agent work | Stable-file debounce plus hash check |
| Hermes/9Router down | Queue proposal request; source unchanged | Retry once service returns |
| Invalid/untrusted model output | Reject proposal or mark failed | Validation result retained |
| Concurrent human edit | Expected hash mismatch; proposal stale | Regenerate from current bytes |
| Sync race after atomic replace | Verify result hash and exact staged Git blob; mark working-tree divergence | Preserve approved commit object; reconcile newer bytes without overwrite |
| Workspace-service crash | SQLite journal resumes idempotently | Apply-once test and journal audit |
| Atomic write succeeds, Git fails | Mark uncommitted; block more agent mutation | Reconcile commit or restore |
| Forbidden path request | Deny before write | Security event without raw content |
| Prompt injection in source | Keep source inert; drafting has no privileged tools | Quarantine tool-seeking output; run security fixture |
| Missing data label | Resolve locally to `local_only`; make no external call | User explicitly changes policy if desired |
| OpenViking add/update/move/remove fails | Vault unchanged; projection job retries | Manifest desired/observed mismatch clears |
| Embedding route unavailable | Fail closed; never substitute | Retry exact contract |
| 9Router provider fallback | Permit only approved generation purpose | Record requested/actual model when available |
| Telegram duplicate | Return existing acknowledgment | One raw row by idempotency key |
| Telegram disk/SQLite failure | Never say `Saved`; receipt DB uses full synchronous WAL | Repair storage and resend/replay |
| Telegram attachment failure | Say only `Saved metadata; attachment pending`; retry binary | Send final confirmation after bytes/checksum; visible dead letter |
| Backup failure | Alert; keep last known good backup | Successful restore drill timestamp |

## Recovery order

1. Stop agent mutation if vault integrity uncertain.
2. Snapshot local copies and resolve sync conflicts without automatic merging.
3. Restore canonical vault and Git consistency.
4. Restore proposal/Telegram operational SQLite journals from coordinated snapshot.
5. Restore sync and drain proposals/captures.
6. Rebuild OpenViking projection from manifest and vault.

## Coordinated backup and restore

Pause new agent applies, checkpoint SQLite WAL, record Git HEAD plus vault file manifest, then snapshot vault/Git and operational database under one backup generation ID. Resume after checksums persist. Restore compares every nonterminal proposal with current path hash and recorded commit: exact completed states remain completed, mismatches become `stale` or `reconcile`, and no apply resumes blindly.

## Observability

Record statuses, counts, hashes, ages, route identities, and error classes—not raw private note bodies. Track sync conflicts, stale proposals, uncommitted mutations, oldest job, 9Router availability, OpenViking projection drift, backup age, and last successful restore.
