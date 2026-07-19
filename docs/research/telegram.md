# Telegram evaluation

## Evidence

- Official source: [Telegram Bot API](https://core.telegram.org/bots/api), accessed 2026-07-19.
- Version: Bot API 10.2, released 2026-07-14.
- Verified: `update_id` supports duplicate suppression/order recovery; replies and media-group IDs provide grouping signals; Telegram retains unconsumed updates for no more than 24 hours; failed webhooks are retried.
- Current deployment: one Hermes Telegram DM connected through polling.

## Fit

Telegram is strongest capture interface because it is already available across phone and PC and accepts every expected raw form. It is not a knowledge store: retention is short, message edits/deletes complicate provenance, and bot availability depends on Telegram.

## Recommendation

Use one bot for MVP. Separate capture and digest behavior through message types/state, not separate bot identities. Add another bot only if notification volume, access policy, or experimentation requires isolation.

Persist before acknowledgment using `(bot identity, update_id)` idempotency. Keep:

- chat/message/update IDs;
- timestamp and edit version;
- original text/caption;
- reply and media-group IDs;
- forward/source metadata when available;
- attachment file ID, checksum after download, MIME type, and local object path.

## Tradeoffs

- **Polling:** already works with Hermes; simpler firewall; must confirm offset after durable write.
- **Webhook:** lower latency and explicit retries; adds public endpoint/authentication; still must persist before 2xx.
- **Separate bots:** clearer UX boundaries; doubles credentials/config and fragments reply context.

## Uncertainty

Hermes polling acknowledgement order is unverified. MVP spike must prove raw commit occurs before update confirmation or implement a thin independent adapter.
