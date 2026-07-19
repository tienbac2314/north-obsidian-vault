# Unresolved questions

These remain visible by design. MVP experiments must answer behavioral questions before tool expansion.

## Blocking before implementation

- Can installed Hermes persist Telegram updates in a pre-agent hook before any 9Router call, or must a separate polling/webhook adapter own Telegram ingestion?
- Which raw captures may leave personal infrastructure for external model processing? What employer content must remain local or unprocessed?
- Should attachment binaries be retained indefinitely, for a fixed period, or deleted after durable extraction?
- What off-host backup target and encryption-key recovery method will be used?

## Blocking before MVP promotion

- Does `Saved` after commit remain under 30 seconds p90 and build trust?
- Which grouping signals and thresholds meet the correction target without merging unrelated captures?
- Can daily review remain under two minutes on 80% of active days?
- Does weekly topic-centered synthesis change practice or work decisions?
- Should Notion edits flow back to local truth, and how are conflicts presented?
- Which 9Router routes provide acceptable quality, cost, latency, and fallback provenance with synthetic non-sensitive tests?
- Are 9Router request bodies retained anywhere despite current request-log settings?
- Can a 9Router restore and provider-outage drill recover within acceptable time?

## Future-tool questions

- At what approved-note corpus size does SQLite FTS/backlink retrieval miss useful items?
- Which fixed embedding contract is affordable, stable, and permitted for the data classes involved?
- Does Obsidian become the preferred review/editor once deterministic Markdown export exists?
- Does Supermemory improve retrieval enough to justify existing operational complexity?
- Can OpenViking be isolated, backed up, and fed approved content without becoming a hidden source of truth?
- Is a second bot justified by notification fatigue or security separation?
- When should adapter, processor, and scheduler become separate processes?

## Known inspection limits

- Oracle network/security-list configuration was not available from host inspection.
- Tunnel access policy and dashboard authentication were not exercised.
- 9Router fallback order, account contents, raw request details, and provider secrets were deliberately not inspected.
- Backup restore and controlled service/provider outage tests were not performed.
- Current process state is a point-in-time observation from 2026-07-19.
