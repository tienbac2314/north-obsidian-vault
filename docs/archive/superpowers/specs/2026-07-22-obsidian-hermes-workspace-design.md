# Obsidian and Hermes workspace design

Status: superseded non-authoritative specification under DEC-027. Current authority is [system design](../../../system-design.md); do not implement this document directly.

Date: 2026-07-22. Status: approved through standing best-judgment authorization after tracked-requirement and adversarial self-review. Sync and attachment sections were amended after the focused [2026-07-22 reevaluation](../../../research/2026-07-22-sync-and-extension-reevaluation.md).

This specification replaces the superseded [Obsidian and OpenViking workspace design](2026-07-20-obsidian-openviking-workspace-design.md). No runtime behavior is deployed by this document.

## Outcome

Build a small personal learning system where:

- Obsidian remains the canonical human library and primary writing interface;
- ordinary Markdown never needs an agent, template, or classification step;
- moving a note into `INBOX/Pending Agent Review` explicitly requests Hermes review;
- Hermes creates a separate proposal and never silently mutates human notes;
- Windows and Android keep working during VPS, sync, Hermes, 9Router, or provider failure;
- first rollout optimizes human Obsidian sync and recovery before enabling any Hermes vault writer;
- weekly and monthly reflection compress learning into demonstrated growth and one next action.

## Non-goals for release one

- No Telegram-to-Obsidian capture pipeline.
- No custom filesystem watcher, workspace daemon, apply service, or workflow database.
- No OpenViking, embeddings, vector database, or automatic retrieval index.
- No autonomous filing, merging, renaming, deleting, archiving, or link repair.
- No Canvas generation or Dusk plugin runtime.
- No FNS MCP, Local REST API, or internet-facing agent note API.
- No Google Drive attachment plugin or second sync transport.
- No claim that sync, version history, or local Git alone is backup.

## Components

### Human sync pilot

1. **Obsidian on Windows and Android** for direct Markdown use.
2. **Fast Note Sync plugin** on both Obsidian clients.
3. **Self-hosted Fast Note Sync server** behind private access controls.
4. **Independent, tested recovery copy** outside the live FNS authority.

### Later gated agent workflow

1. **Existing Hermes Agent** on the VPS, after its gateway is stable.
2. **Hermes bundled Obsidian skill** or another single approved FNS-aware transport.
3. **One narrow review skill** for queue and proposal rules.
4. **Existing 9Router** as Hermes's generation gateway.

Human sync pilot does not authorize this later workflow. Exact Hermes transport is chosen only after FNS authorization, external-writer, conflict, and restore tests.

### Explicitly absent

- Syncthing core, Syncthing Manager, and Self-hosted LiveSync on the FNS pilot vault.
- FNS MCP, REST, Git automation, one-way mirror, and third-party headless clients.
- Drive Attachments, Drive Embedder, External Attachments, and Google Drive Sync.
- Obsidian Git, Dataview, Templater, QuickAdd, Linter, and other community plugins as architecture dependencies.

Optional UI plugins may be evaluated later. Removing one must never break the workflow contract.

## Authority boundaries

| Concern | Authority | Guarantee |
|---|---|---|
| Human knowledge | Obsidian Markdown | User can read and edit without agent or service. |
| Replication | FNS plugin and server during pilot | Current Markdown and attachments move between enrolled Obsidian clients. |
| Agent review request | Queue-folder placement | Only queued content authorizes scheduled inspection. |
| Agent output | Separate proposal note | Scheduled run creates a candidate, not an accepted mutation. |
| Generation | Hermes through 9Router | Provider failure leaves source and queue unchanged. |
| History | FNS note history and trash | Convenient rollback depth; not an independent backup. |
| Recovery | Independently restorable copy | Required before scheduled agent writes, mechanism verified during rollout. |

No product inherits authority from another. A sync credential does not authorize Hermes. A proposal does not authorize an existing-note edit. Git history does not approve content.

## Vault contract

Minimum folders:

```text
INBOX/
  Unsorted/
  Pending Agent Review/
  Reviewed/
PARA/
  Projects/
  Areas/
  Resources/
  Archive/
  WORKSTATION/
SYSTEM/
  Agent Proposals/
    Pending/
    Kept/
    Rejected/
  Reviews/
    Weekly/
    Monthly/
```

Only `INBOX/Pending Agent Review` has scheduled semantics. Other folders are ordinary Markdown organization. Folder names may be migrated once before rollout; later renames require a specification change because the workflow skill depends on them.

## Normal writing flow

1. User creates or edits any note in Obsidian.
2. Sync may replicate it, but no Hermes workflow runs.
3. User may place rough material in `INBOX/Unsorted` without triggering review.
4. Local writing remains available when every remote component is offline.

## Scheduled review flow

1. User moves one note to `INBOX/Pending Agent Review`.
2. A later approved agent transport makes that queued file available to Hermes without expanding authorization.
3. After a later agent-transport promotion, Hermes native cron starts a fresh session and attaches the review skill plus its approved vault transport.
4. Workflow lists the pending folder and processes queued notes only.
5. For each source, it calculates or receives a SHA-256 content hash and derives a proposal filename:

   ```text
   SYSTEM/Agent Proposals/Pending/<source-slug>--<hash-prefix>.md
   ```

6. If that exact proposal exists, workflow leaves it unchanged.
7. Otherwise Hermes reads only the queued source. Scheduled release-one review does not follow links or read surrounding vault notes.
8. Hermes creates one new proposal note. It does not edit, move, rename, or delete source.
9. User reviews proposal in Obsidian, then keeps, edits, moves, or rejects it.
10. User moves source to `INBOX/Reviewed` when request is resolved.

If source changes while still queued, its content hash changes and a new proposal may be created. Duplicate proposals are visible and tolerable. Silent source mutation is not.

## Proposal format

Proposal frontmatter is human-readable identity, not a workflow database:

```yaml
---
proposal_version: 1
source_path: INBOX/Pending Agent Review/example.md
source_sha256: <full digest>
created_by: hermes
status: pending
---
```

Body contains:

1. proposed note or restructuring;
2. short explanation of value;
3. uncertain claims or missing context;
4. suggested destination, never an automatic move;
5. source link.

Scheduled workflow never modifies an existing proposal. First manual edit therefore naturally makes it human-owned.

## Existing-note updates

Existing human notes are outside scheduled workflow. Update requires a direct interactive command naming exact target and change. Hermes must:

1. read target immediately before editing;
2. restate intended narrow change;
3. patch only requested section;
4. stop on ambiguity, missing target, or changed context;
5. never infer permission to move, rename, delete, or rewrite whole note.

If deterministic compare-and-swap becomes necessary after observed overwrite risk, add smallest guard then. Do not pre-build general apply service.

## Reviews

### Weekly

User selects proposal or ordinary-note links explicitly. Review answers:

- What did I understand in my own words?
- What evidence or application shows that understanding?
- Which repeated pattern appeared?
- What one experiment or action comes next?
- Which project or knowledge note should link to this review?

### Monthly

Monthly review compresses weekly notes into changed beliefs, demonstrated skills, recurring friction, and one next focus. It does not score every note or infer performance from activity volume.

Release-one scheduled review reads only its request note. User must paste needed context into that request or use an interactive command naming exact notes.

## Sync and attachment design

### Human-first pilot topology

- Windows and Android use FNS as the only sync transport for an isolated pilot vault.
- FNS server provides integrated history, trash, attachment synchronization, and Web UI.
- Keep attachments as ordinary local vault files during pilot.
- Keep FNS Cloud Preview's local-deletion option off. Test it later only for large or cold media.
- Do not enable FNS MCP, REST, Git automation, filesystem mirror, or third-party headless clients.
- Do not run Syncthing, LiveSync, Google Drive Sync, or another transport against the same vault.
- Do not install a desktop-only Google Drive attachment plugin for canonical media. Android parity and normal portable links are required.

### History and recovery

FNS note history and trash improve everyday recovery but remain inside the live synchronization authority. Before personal migration, prove server database backup and full restore plus one independent, restorable copy outside FNS. Google Drive may hold that backup only after privacy and restore checks; it is not the live attachment authority.

### Promotion and fallback

- **Fast Note Sync:** preferred human pilot. Personal-data promotion requires conflict, rename, attachment, Android, server-upgrade, and restore gates. Agent promotion additionally requires token isolation and external-writer survival.
- **Syncthing core plus Syncthing Manager:** whole-vault fallback when plain-file Hermes access outweighs FNS UX or FNS fails a safety gate. Replace FNS; never layer transports.
- **Self-hosted LiveSync:** mature future candidate after issue `#1036` closes in a release and encrypted ARM64 CLI push passes.

## Hermes design

- Reuse existing Hermes installation and native cron.
- Keep all vault access and scheduled proposal writes disabled during FNS human pilot.
- Select exactly one later transport: a least-privilege FNS path after its gates pass, or a plain VPS replica after replacing FNS with Syncthing.
- Attach one narrow review skill; do not create another agent service.
- Use narrowest available toolset. Scheduled job needs vault file operations, not terminal, browser, messaging, or remote MCP.
- Treat queued note as untrusted data. Its content cannot expand allowed paths, approve another note, request secrets, or enable unrelated tools.
- Path rules are policy, not OS sandbox. Create-only output limits consequence but does not create hard isolation. If tests show policy breach, add OS-level separation or smallest deterministic guard before rollout.
- Native cron runs fresh sessions, so prompt and skill contain all paths, refusal rules, naming, and failure behavior.

## 9Router boundary

- Keep existing Hermes provider configuration; do not add pipeline router.
- Do not record private endpoint, account, provider, or model identifiers in repository.
- Treat queued note content sent for generation as external-provider data unless a verified local model is selected.
- Provider or 9Router failure leaves note queued and creates no success marker.
- Verify logging and retention before employer-derived or sensitive content is allowed.

## Failure handling

| Failure | Required behavior |
|---|---|
| Windows or Android offline | Local edits continue; later FNS reconciliation must retain recoverable history or fail the pilot gate. |
| FNS server offline | Local writing continues; remote history, Cloud Preview, and convergence wait. |
| FNS conflict or unexpected deletion | Stop migration or promotion, preserve server backup and device copies, and test restore before reuse. |
| Hermes gateway down | Queue remains unchanged; visible service failure, no false completion. |
| 9Router or provider down | Queue remains unchanged; proposal is absent or explicitly failed, never fabricated. |
| Proposal already exists | Leave existing bytes unchanged. |
| Source changes | New hash yields new proposal; older proposal remains visible. |
| Git commit fails | Do not block local writing or sync; surface history failure before agent-write promotion. |
| Recovery copy fails | Disable scheduled agent writes until restore gate passes again. |

## Security and privacy

- No credentials, endpoints, account IDs, raw logs, personal notes, or database files enter this repository.
- FNS service and management interfaces use private reachability and authenticated access defined during rollout; do not expose unauthenticated dashboards publicly.
- Hermes receives only queued source during scheduled review.
- Never grant FNS MCP or REST token as a convenience shortcut.
- Independent recovery credentials must not be stored inside synced vault.
- Live VPS changes require a separate implementation step and verification.

## Promotion gates

### Gateway gate

- Inventory PM2, user-systemd unit, and running gateway processes; select one authoritative supervisor.
- Determine Hermes gateway failure from sanitized service status and bounded log review.
- Achieve stable process uptime and successful health or Telegram command checks without restart growth.
- Verify 9Router remains independent.

### FNS human-sync gate

Use a disposable vault across actual Windows and Android clients plus the self-hosted server. Test:

- initial convergence;
- online and offline edits;
- simultaneous same-note edit;
- case-only rename and invalid Android filename;
- folder rename and delete;
- small and large attachment;
- Android background and battery restrictions;
- process, device, and server restart;
- history, trash, and conflict recovery;
- server upgrade, database backup, and full restore;
- externally created file survival;
- vault-token isolation before any API or agent promotion.

### Recovery gate

- Restore a deleted and an accidentally overwritten note through FNS history or trash.
- Restore complete FNS server state from its database backup.
- Rebuild the complete disposable vault on an empty path from an independent copy.
- Document recovery-point and recovery-time observations.

### Hermes gate

- Empty queue produces no file.
- Ordinary note outside queue is not read or changed.
- Queued note produces one deterministic proposal.
- Repeat run is byte-for-byte idempotent.
- Prompt injection cannot expand allowed paths in observed run.
- Source remains byte-for-byte unchanged.
- Existing proposal remains byte-for-byte unchanged.
- 9Router outage leaves source queued.

Scheduled agent writes remain disabled throughout human pilot. They require a later approved agent-transport plan even after human sync and recovery gates pass.

## Accepted tradeoffs

- FNS server can read synchronized content because E2EE remains roadmap work.
- Integrated UX is prioritized before plain-file Hermes access; scheduled review arrives later.
- FNS conflict and external-writer behavior are test gates rather than assumed guarantees.
- Prompt policy is not hard filesystem isolation; consequence stays create-only and tests decide whether stronger boundary is needed.
- Recovery mechanism is a rollout gate rather than another design-time backup subsystem.
- Passed Obsidian review covers plugin artifact, not FNS server, API authorization, or restore behavior.

## Approval rationale

Design satisfies fixed requirements while reflecting seamless sync, visible history, and mobile attachment priorities. It chooses a bounded FNS human pilot without pretending plugin score covers server behavior, keeps agent authorization separate from sync credentials, names a non-stacked Syncthing Manager fallback, and refuses to add vault workload to unstable Hermes gateway.
