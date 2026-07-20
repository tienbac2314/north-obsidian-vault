# First production-worthy release

Status: proposed implementation scope after design approval.

## Included

- Dusk-inspired Obsidian vault structure with `INBOX/Unsorted` and `INBOX/Pending Agent Review`.
- Plain Markdown guide and optional short project, literature, permanent, weekly, and monthly templates.
- One free sync design proven on actual Windows, Android, and Oracle VPS replica.
- Narrow Git checkpoints, encrypted off-host backup, and successful restore drill.
- Proposal-only Hermes workflow for queued notes.
- Deterministic workspace service with path policy, SQLite proposal journal, expected hashes, atomic apply, validation, and idempotency.
- Existing 9Router for permitted replaceable generation, with explicit data-class and logging policy.
- Weekly review in user's own words plus one changed action; monthly compression.

## Excluded

- OpenViking installation/projection and embeddings.
- Telegram ingress as normal input.
- Canvas automation.
- Automatic updates to existing notes, managed sections, folder reorganization, moves, renames, merges, deletes, archives, and link repair.
- Paid Obsidian Sync.
- Local VLM/reasoning fallback.

## Build order and acceptance

1. **Vault and habit**
   - Create structure without Dusk plugins or sample content.
   - Pass: new note takes under 30 seconds; no mandatory fields; weekly review produces own-words insight and next action in three of four weeks.
2. **Sync experiment**
   - Compare Self-hosted LiveSync and Remotely Save; run only one engine at a time.
   - Pass: offline same-note conflict, create, attachment, rename, delete, Canvas file, client/VPS restart, and recovery cause no silent byte loss.
3. **History and recovery**
   - Add Git checkpoint policy and encrypted off-host backup.
   - Pass: coordinated generation restores clean machine/VPS directory with vault, Git history, configuration, proposal journal, and documented key recovery; nonterminal jobs reconcile without blind apply.
4. **Proposal boundary**
   - Implement queue detection, proposal artifact, SQLite journal, approval/rejection, hash-checked atomic apply, and narrow Git commit.
   - Pass: ordinary notes trigger nothing; queued source remains unchanged; rejected unchanged item does not loop; stale hash blocks; duplicate approval applies once; staged Git blob equals approved bytes; forbidden paths and injected source instructions fail.
5. **Hermes and 9Router**
   - Hermes drafts proposals through permitted 9Router routes.
   - Pass: outage queues work without affecting notes/sync; invalid output cannot mutate vault; unlabeled notes default local-only; restricted content never reaches external route or raw logs.

## Rollback

- Disable Hermes watcher/workflow; Obsidian, sync, Git, and backup remain useful.
- Disable agent apply; keep proposals as manual copy/edit suggestions.
- Disable 9Router processing; queued notes remain unchanged.
- Restore accepted file from Git or full vault from encrypted backup.
- Change sync provider only after full snapshot and conflict-free shutdown of old engine.

## Exit criteria

Release is complete only when sync conflict/recovery tests, restore drill, mutation safety tests, 9Router outage test, data-leak test, and four-week learning loop pass. OpenViking and Telegram begin separate promotion experiments afterward.
