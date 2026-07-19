# Minimum viable pipeline

Status: Proposed implementation target after behavioral approval.

## Scope

One Telegram bot, one small service, SQLite WAL, content-addressed attachments, SQLite FTS, asynchronous processing through 9Router, Telegram digests, optional one-way Notion projection, and encrypted off-host backup.

No embeddings, vector database, OpenViking installation, Obsidian automation, autonomous research agent, separate queue, or multi-bot topology.

## Build order and acceptance evidence

1. **Durable capture:** allowlist sender; derive idempotency key from bot/update; commit raw update plus outbox before `Saved`.
   - Pass: duplicate replay creates one capture; 9Router and network-disabled processor do not stop capture; disk/commit failure never returns `Saved`.
2. **Attachments and recovery:** store metadata immediately, download with checksum through retriable job, expose dead letters.
   - Pass: partial download recovers after restart; missing binary remains visibly pending.
3. **Asynchronous candidates:** version structured output; call dedicated 9Router route; retain raw and derivation provenance.
   - Pass: invalid JSON cannot overwrite/promote; route outage queues safely; replay produces traceable new run.
4. **Daily review and correction:** deliver only on active days; support keep/practice/reference/temporary/fix.
   - Pass: 80% of sampled reviews take under two minutes; corrections supersede rather than erase history.
5. **Weekly growth review:** consolidate by topic/project with source links and one practice target.
   - Pass: user identifies at least one useful repeated pattern or changed action in two of four weeks.
6. **Projection and backup:** idempotent Notion outbox; encrypted daily off-host backup; documented restore.
   - Pass: Notion outage drains later without duplicates; restore drill reconstructs raw capture, jobs, and attachment references.

## Rollback

- Disable processing/digest workers while capture remains live.
- Switch 9Router calls to a direct fixed provider through the same processor interface.
- Disable Notion projection without changing canonical records.
- Rebuild FTS or future indexes from immutable captures/approved notes.
- Restore SQLite plus content-addressed files from last verified backup, then replay Telegram updates still available and durable outbox jobs.

## Exit criteria

Promote MVP only after experiments establish capture reliability, digest usage, grouping quality, weekly value, gateway outage safety, projection recovery, and restore success. Otherwise keep raw capture and revise review behavior before adding tools.

