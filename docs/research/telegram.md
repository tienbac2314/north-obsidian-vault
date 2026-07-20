# Telegram evaluation

## Evidence

- Official [Telegram Bot API](https://core.telegram.org/bots/api) supplies `update_id`, replies, media groups, files, polling, and retrying webhooks. Pending updates have limited retention.
- Current Hermes bot uses polling, but durable-before-agent acknowledgment was not proven.

## Revised fit

Telegram is optional quick capture and remote status channel, not primary input. Direct Obsidian use covers normal note writing.

If enabled, dedicated deterministic ingress must:

1. allowlist sender/chat;
2. derive idempotency from stable non-secret bot identity plus `update_id`;
3. commit raw update, relationships, attachment metadata, and job/outbox to SQLite WAL;
4. say `Saved` for text/link only after full-synchronous commit; for media, acknowledge metadata/pending first and bytes/checksum separately;
5. download/process asynchronously through Hermes;
6. create vault proposal rather than silently mutate canonical note.

OpenViking and Hermes memory are downstream, not receipt boundary. If 9Router, upstream provider, Hermes, OpenViking, sync, or Obsidian is unavailable, raw capture remains queued. If disk/SQLite fails, no success acknowledgment. SQLite WAL alone is insufficient: receipt path requires durable local storage and full synchronous commits.

## Later choices

Polling avoids public webhook; webhook offers explicit delivery retry but needs authenticated endpoint. Choose after ingress prototype. Attachment retention and command/capture disambiguation remain open.
