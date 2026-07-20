# Behavioral and architecture experiments

## EXP-001: Unstructured Obsidian capture

- Hypothesis: `INBOX/Unsorted` removes capture friction without creating unusable pile.
- Run: four weeks of normal work.
- Pass: useful note capture under 30 seconds p90; no abandoned item due to required structure; inbox reviewed weekly without exceeding 20 minutes.

## EXP-002: Weekly growth

- Hypothesis: own-words compression plus one action changes practice.
- Pass: three of four weekly reviews contain one source-backed insight, one applied example, and one next action; next review records result.
- Failure: shorten template or switch from summary to retrieval/practice prompts.

## EXP-003: Sync bake-off

- Candidates: Self-hosted LiveSync and Remotely Save, one at a time.
- Cases: Windows/Android/VPS create, offline same-note edit, attachment, rename, delete, `.canvas`, restart, prolonged outage, recovery.
- Pass: no silent byte loss; conflicts visible; no recursive conflict loop; acceptable latency/resources; documented clean restore.

## EXP-004: Proposal safety

- Cases: normal queue, reject-with-file-still-queued, source edit after draft, duplicate approval, sync race after replace, crash before/after replace, forbidden path, symlink/path traversal, invalid Markdown, Git failure, and source prompt injection asking for shell/secrets/messaging.
- Pass: source unchanged before approval; rejected hash does not loop; stale hash blocks; apply once; staged Git blob equals approved result; writes remain in allowlist; injected source invokes no tool or wider context; failure is inspectable and recoverable.

## EXP-005: 9Router outage and privacy

- Stop disposable/test route; queue allowed and restricted notes.
- Pass: normal writing/sync unaffected; allowed proposal waits/retries; unlabeled note defaults local-only; restricted note never leaves policy boundary; no external classifier sees undecided content; raw request bodies absent from gateway logs.

## EXP-006: Backup restore

- Restore encrypted snapshot to isolated path without primary device.
- Pass: coordinated backup generation restores vault bytes/checksums, Git history, sync/bootstrap documentation, proposal journal, and keys/config references; nonterminal proposal reconciliation never blindly reapplies.

## EXP-007: OpenViking lifecycle

- Pin version; test add, content update, move, delete, interrupted task, rebuild, and manifest reconciliation on synthetic vault.
- Pass: no canonical vault mutation; desired/observed drift resolves; deleted/restricted items disappear; full projection rebuild succeeds.

## EXP-008: Retrieval and embeddings

- Prewrite bilingual queries and answer key.
- Compare plain Obsidian text/link search, OpenViking with exact 9Router route, and OpenViking with local `embeddinggemma`.
- Measure top-k, provenance, query/index latency, RAM, rebuild duration, cost, privacy, and outage.
- Promote vectors only for material measured gain.

## EXP-009: Optional Telegram durability

- Cases: duplicate, edit, attachment failure, SQLite failure, restart, Hermes/9Router/OpenViking outage.
- Pass: text/link `Saved` only after full-synchronous durable raw record; media acknowledgment distinguishes metadata from attachment bytes; delayed jobs drain once; disk failure never returns success.
