# Decision log

Status: current after 2026-07-23 design-readiness hardening. Earlier workspace-service, SQLite, backup, Telegram-ingestion, OpenViking, embedding, Syncthing-first, and thin-spec decisions remain visible as superseded history.

Statuses: Accepted, Proposed, Rejected, Postponed, Superseded.

## DEC-001: Obsidian is canonical human library

- Status: Accepted
- Decision: Direct Obsidian Markdown is primary input and curated truth. Writing requires no agent, template, frontmatter, or classification.

## DEC-002: Keep Dusk structure optional

- Status: Accepted; capture path amended by DEC-030
- Decision: Reuse understandable PARA/Zettelkasten folders and `PARA/WORKSTATION`, but not Dusk's old plugin runtime. Current capture path is `STAGING/Unsorted` under DEC-030.

## DEC-003: Queue placement authorizes proposal only

- Status: Accepted; paths and review feedback amended by DEC-030, authorization amended by DEC-033
- Decision: Moving raw note or creating sidecar request in `STAGING/Pending Agent Review` records proposal intent. Moving workflow-created proposal with explicit review block into `STAGING/Reviewed` authorizes review reading under DEC-030. DEC-033 requires authenticated hash-bound receipt before provider source read or any later write. Ordinary notes remain untouched. Existing human-note changes require authenticated exact-plan approval plus deterministic transaction.
- Activation: Inactive during Releases 1 and 2. Before Release 3 promotion, folder is ordinary Markdown organization and grants no runtime access because Hermes has no vault credential or schedule.
- Tradeoff: Duplicate generation or stale proposal is tolerable; silent human-note loss is not.

## DEC-004: Manual edit claims agent-created note

- Status: Accepted
- Decision: First direct manual edit makes whole agent-created note human-owned and review-required unless management is explicitly restored.
- Activation: Applies only after Release 3 creates first proposal; no agent-created vault note exists in current human pilot.

## DEC-005: Use Hermes native scheduled review

- Status: Accepted
- Decision: Hermes native cron scans pending folder using bundled Obsidian skill plus one narrow workflow skill. No custom watcher or shell cron.
- Activation: Design choice for Release 3, not current configuration. Cron remains disabled through synthetic and personal human-sync releases.
- Tradeoff: Fresh sessions need self-contained instructions; prompt policy is not filesystem sandbox.

## DEC-006: Reuse 9Router for generation

- Status: Accepted
- Decision: Existing 9Router remains Hermes generation-model gateway. Do not add pipeline-specific router. Model or provider outage leaves note queued.
- Activation: Human-sync releases send no vault content to 9Router. Release 3 requires gateway stability, logging/privacy verification, and explicit queued-content policy first.
- Open evidence: logging, fallback quality, and sensitive-data policy still require controlled verification.

## DEC-007: Remove custom first-design orchestration

- Status: Accepted
- Decision: First design has no custom Python workspace service, workflow SQLite database, apply script, OpenViking, embeddings, or Telegram ingestion. Scheduled workflow creates proposal files only.
- Activation: Proposal creation begins only in Release 3 after its entry gates. Current human pilot runs no scheduled workflow.

## DEC-008: Keep responsibilities conceptually separate

- Status: Accepted
- Decision: Sync, version history, independent recovery, agent access, authorization, and knowledge retrieval are different guarantees even when one product advertises several.

## DEC-009: Use Syncthing as first sync candidate

- Status: Superseded by DEC-019
- Decision: Use Syncthing core, not Syncthing Integration, to expose a plain-file Windows, Android, and VPS vault replica. Keep scheduled Hermes writes disabled until physical-device, conflict, gateway, and restore gates pass.
- Tradeoff: Maintained Syncthing-Fork and visible conflict copies are deployable now but require manual conflict handling. FNS remains a disposable-vault challenger because its Passed score covers the Obsidian plugin, not the server or third-party headless bridge. Promote Self-hosted LiveSync only after encrypted CLI writes are fixed upstream and verified on Oracle ARM64.
- Evidence: [2026-07-22 sync and extension reevaluation](../research/2026-07-22-sync-and-extension-reevaluation.md).

## DEC-010: Postpone OpenViking and embeddings

- Status: Postponed
- Decision: Plain filename, link, and text search establish baseline first. Add vector/index lifecycle only after measured retrieval failure.

## DEC-011: Keep Telegram outside Obsidian ingestion

- Status: Accepted
- Decision: Telegram remains ordinary Hermes chatbot. No Telegram-to-Obsidian capture path or receipt database in first design.

## DEC-012: Weekly compression is core product

- Status: Accepted
- Decision: Daily page is optional. Weekly review produces own-words understanding and one changed action; monthly review compresses patterns and demonstrated growth.

## DEC-013: Treat NotebookLM as adversary, not authority

- Status: Accepted
- Decision: Retain independently verified challenges and retractions; reject stale, invented, contradictory, paid, or out-of-scope prescriptions.
- Evidence: [NotebookLM adversarial review](../research/notebooklm-adversarial-review.md).

## DEC-014: Preserve detailed and clean Git histories

- Status: Superseded by DEC-024
- Decision: Permanent local/remote dev branch retains small verified commits. Generated clean branch contains one commit over `origin/main` and updates only through exact force-with-lease.
- Evidence: [Skill-generated migration design](../superpowers/specs/2026-07-22-git-workflow-migration-design.md).

## DEC-015: Keep release-one extension set minimal

- Status: Superseded by DEC-019 and DEC-020
- Decision: Use Hermes bundled Obsidian skill and one narrow review skill. Do not install Syncthing Integration, FNS MCP, Local REST API, OpenViking, or Dusk's community-plugin runtime as architecture dependencies.
- Tradeoff: Fewer convenience interfaces, smaller trust and failure surface.

## DEC-016: Stabilize gateway before vault workload

- Status: Accepted
- Decision: Diagnose and stabilize observed Hermes gateway restart pattern before configuring vault access or native cron.
- Evidence: Sanitized read-only VPS observation in [current reevaluation](../research/2026-07-22-sync-and-extension-reevaluation.md#live-vps-observation).

## DEC-017: Approve replacement workspace design

- Status: Superseded by DEC-025
- Decision: [`2026-07-22-obsidian-hermes-workspace-design.md`](../superpowers/specs/2026-07-22-obsidian-hermes-workspace-design.md) replaces earlier product architecture through standing best-judgment authorization and self-review.

## DEC-018: Approve gateway-first implementation plan

- Status: Superseded by DEC-021
- Decision: Execute [`2026-07-22-obsidian-hermes-release-one.md`](../superpowers/plans/2026-07-22-obsidian-hermes-release-one.md) in verified checkpoints. Stabilize one gateway supervisor before sync or vault access; prove physical-device sync and recovery before scheduled proposal writes.
- Tradeoff: One stateless read-only Python scanner guarantees deterministic hashes and paths, and one stateless no-agent shell script records local Git history. This is more reliable than asking a model to calculate identity and remains smaller than a watcher, daemon, apply service, or workflow database.

## DEC-019: Pilot Fast Note Sync for human use

- Status: Accepted
- Decision: Use Fast Note Sync as the only transport in an isolated Windows and Android pilot. Prioritize integrated Obsidian setup, history, trash, and attachment experience. Keep FNS MCP, REST, Git automation, filesystem mirrors, third-party headless clients, and Hermes vault access disabled.
- Tradeoff: FNS server can read content, and Passed Review covers only the Obsidian plugin artifact. Personal-data promotion requires conflict, rename, attachment, Android, server-upgrade, database-restore, and independent-recovery tests. Agent promotion additionally requires vault-token isolation and external-writer survival.
- Fallback: Replace FNS with Syncthing core plus Syncthing Manager if FNS fails a safety gate or plain-file Hermes access becomes the higher priority. Never stack sync transports on one vault.
- Evidence: [2026-07-22 sync, history, and attachment reevaluation](../research/2026-07-22-sync-and-extension-reevaluation.md).

## DEC-020: Keep attachments inside chosen vault transport

- Status: Superseded by DEC-023
- Decision: Keep ordinary attachments local and synchronized by FNS during pilot. Leave FNS Cloud Preview local deletion off. Google Drive may serve only as an independently restorable backup after privacy checks, not as live attachment authority.
- Tradeoff: This uses more device storage but preserves Android rendering, normal portable wikilinks, offline access, and one synchronization authority. Desktop-only Drive plugins and public embeds do not meet those requirements.

## DEC-021: Separate human sync from agent rollout

- Status: Accepted
- Decision: Complete and observe the FNS human-sync pilot before choosing Hermes transport. The prior Syncthing-first implementation plan remains historical and must not be executed as current authority. A replacement plan starts with FNS deployment and recovery gates; scheduled proposal writes require a later explicit transport decision.
- Tradeoff: Hermes automation arrives later, but sync preference no longer forces an inferior daily Obsidian experience or an unsafe multi-transport vault.

## DEC-022: Approve FNS human-pilot plan

- Status: Superseded by DEC-026
- Decision: Execute [`2026-07-22-fns-human-sync-pilot.md`](../superpowers/plans/2026-07-22-fns-human-sync-pilot.md) in small verified checkpoints. Use synthetic content, one FNS transport, existing TLS Nginx ingress, stopped-service archive, off-VPS copy, empty-path restore, and seven-day observation before human-only promotion.
- Boundary: Passing plan does not authorize personal migration, Hermes vault access, MCP, REST integrations, headless sync, external filesystem writers, Git automation, or Cloud Preview local deletion.

## DEC-023: Pilot Drive Attachments on Windows

- Status: Superseded by DEC-028
- Decision: Use Drive Attachments `0.74.0` in the synthetic Windows pilot. Route pasted images directly to private Google Drive, choose Drive for arbitrary dropped files, and insert ordinary Markdown links by default. FNS synchronizes link text and any explicitly saved local recovery attachment; Google Drive owns successfully offloaded bytes. Automatic plugin fallback after upload failure is not assumed.
- Boundary: Plugin remains desktop-only. Android opens ordinary Drive links through authenticated Drive access and has no guaranteed inline preview. Non-image clipboard files are not automatic uploads. Keep OAuth data local and outside FNS configuration sync and Git.
- Tradeoff: Desktop capture and Drive management become seamless for images and one-choice for other dropped files, but attachment authority is split and offline Android media access is weaker. Promotion requires Drive-link, failure-UI, explicit local-save recovery, deletion-recovery, and privacy tests alongside FNS gates.
- Evidence: [2026-07-22 sync, history, and attachment reevaluation](../research/2026-07-22-sync-and-extension-reevaluation.md#google-drive-plugins-evaluated).

## DEC-024: Use main and short-lived branches

- Status: Accepted
- Decision: Keep `main` stable and integrate verified short-lived `feat/`, `fix/`, `refactor/`, `docs/`, `chore/`, or `spike/` branches through PR. Preserve useful atomic commits and squash noisy checkpoints. Rebase only unshared local history.
- Safety: Never use plain force push. Destructive reset, clean, broad restore, rewrite of shared history, and branch deletion require explicit authority plus exact-target verification.
- Transition: Deliver this repository refactor through final legacy publisher run. After PR #2 merge and `main` tree verification, stop using permanent dev, generated clean branch, and publisher for normal work; start every new task from current `main` on short-lived branch. Cleanup is not a gate. Keep dev branch and publisher as history unless later requested; generated clean branch may be deleted optionally after exact verification and explicit authority.
- Evidence: [Git workflow runbook](../git-workflow.md).

## DEC-025: Promote concise final system design

- Status: Superseded by DEC-027
- Decision: `docs/spec.md` was current product and architecture authority. Research, archive, and `docs/superpowers/` remained evidence or working history unless accepted content was promoted into final design.
- Scope: Preserve Obsidian-first proposal workflow, FNS human pilot, Windows-only Drive Attachments ingress, Android ordinary-link access, recovery gates, and deferred Hermes writer.

## DEC-026: Promote concise first-rollout plan

- Status: Superseded by DEC-027
- Decision: Execute former `docs/roadmap.md` sequentially. It replaced skill-generated rollout plans as current implementation authority.
- Boundary: Synthetic data only. Failed FNS or Drive gate stops relevant promotion. No Hermes, MCP, REST, headless client, personal migration, or competing whole-vault transport.

## DEC-027: Restore modular design authority

- Status: Accepted; attachment scope amended by DEC-028
- Decision: Current authority is the renovated modular design at [`docs/system-design.md`](../system-design.md), [`docs/architecture/`](../architecture/), [`docs/behavior/`](../behavior/), and [`docs/roadmap/`](../roadmap/). [`docs/executive-summary.md`](../executive-summary.md) provides orientation without replacing detail.
- Scope: Merge approved FNS human pilot, Windows Drive Attachments ingress, independent recovery, deferred Hermes proposal boundary, minimal extension set, and evidence gates into every affected module. Remove thin duplicate `docs/spec.md` and `docs/roadmap.md` after promotion.
- Amendment: DEC-028 replaces the Windows Drive Attachments portion with FNS-only native attachments; modular authority and every other DEC-027 boundary remain accepted.
- Rationale: Minimalization means fewer runtime components and automatic powers, not less explanation. Architecture, data authority, security, failure, interactions, experiments, rollback, and phased promotion remain explicit so implementation does not depend on chat history.
- History: Restore original large-document paths through a tracked-rename checkpoint before content renovation; only status and navigation links changed, and Git recognized moves at `R090` through `R100`. Preserve previous wording in Git history instead of duplicating one whole obsolete design tree under archive. Dev history keeps corrective checkpoints; generated clean PR publishes final coherent tree.
- Boundary: Historical snapshots, research, and `docs/superpowers/` remain non-authoritative. No runtime work begins until this documentation PR merges.

## DEC-028: Keep release-one attachments inside FNS

- Status: Accepted
- Decision: Use normal Obsidian attachment capture on Windows and Android. Keep every release-one attachment as a vault file referenced by a normal Obsidian link or embed, and synchronize its bytes only through FNS. Keep Cloud Preview automatic local deletion off.
- Supersedes: DEC-023. DEC-020's single-authority direction is restored with current evidence; its historical status remains unchanged so the decision sequence stays visible.
- Rationale: Drive Attachments is desktop-only, so Windows captures can upload while Android captures remain FNS files. Current mobile alternatives either publish readable URLs, support only images or limited formats, require manual mobile conversion, add another storage authority, or duplicate whole-vault sync. None meets seamless, private, arbitrary-file, offline-capable Windows/Android capture.
- Boundary: No Google Drive, S3, CDN, external-folder, or second whole-vault plugin is part of live attachment capture. An independent recovery destination remains required and may later use Google Drive only through a separately approved privacy and restore design.
- Tradeoff: FNS clients and server store more bytes, and large media may converge more slowly. In exchange, both devices use one capture path, native embeds, offline files, one live authority, and one recovery model.
- Evidence: [2026-07-22 mobile attachment follow-up](../research/2026-07-22-sync-and-extension-reevaluation.md#mobile-attachment-follow-up).

## DEC-029: Borrow Dusk structure, not runtime

- Status: Accepted
- Decision: Reuse selected Dusk organization and homepage ideas as plain Markdown. During release one, Fast Note Sync is the only installed community plugin required by this design; Obsidian core features provide folders, properties, links, embeds, templates, and the initial home note.
- Boundary: Do not copy Dusk's `.obsidian` directory, scripts, CSS, dashboards, plugin settings, sample content, or Todoist credential. Datacore, QuickAdd, Tasks, Dataview, Templater, Meta Bind, JS Engine, and other Dusk dependencies are not release-one requirements.
- Later experiments: Add at most one optional plugin after sync and learning workflow stabilize, and only for a concrete unmet need. Datacore may be tested for a richer home page, QuickAdd for capture friction, or Tasks for deliberate in-vault task management. Each experiment needs an explicit decision and rollback path.
- Rationale: Dusk's information architecture remains useful without coupling the vault to an old, broad, partly experimental runtime. A plain-Markdown baseline keeps Windows and Android behavior understandable and isolates FNS pilot risk.

## DEC-030: Use one staging workflow

- Status: Accepted
- Decision: Replace `INBOX` capture paths and `SYSTEM/Agent Proposals` with one outer `STAGING` folder containing `Unsorted`, `Pending Agent Review`, `Agent Proposals`, and `Reviewed`. `STAGING/Unsorted` replaces Dusk's narrower `ZETA/FLEETING` role while remaining neutral between PARA, Zettelkasten, and deletion outcomes.
- Review contract: Hermes later writes proposals into `STAGING/Agent Proposals`. User records `keep`, `revise`, or `reject` plus optional feedback in plain Markdown and moves proposal to `STAGING/Reviewed`. Only `revise` authorizes one new collision-safe proposal. No review decision authorizes overwrite, source mutation, filing, deletion, or hidden global learning.
- Boundary: `STAGING/Reviewed` contains reviewed workflow proposals, not automatic reports or agent-managed source notes. User files source and kept knowledge manually. No extra top-level inbox, outbox, or unsorted folder and no vault-local explanatory `README.md` are added.
- Rationale: One neutral temporary workspace avoids redundant `INBOX/Unsorted`, keeps raw capture broader than Zettelkasten, places incoming agent drafts beside other pending material, and makes review feedback visible without adding database or plugin state.

## DEC-031: Gate approved apply and link gardening

- Status: Accepted; authorization and execution amended by DEC-033
- Decision: Keep Release 3 proposal-only. After proposal-assisted learning proves useful, Release 4A may let reviewed `accept` create clean final note and apply exact displayed dependency patches. Add one weekly changed-note link-gardening scan plus manual on-demand scan; daily full-vault scan is rejected.
- Review contract: Proposal carries destination and exact dependent-note patch plan. Link digest carries changed note, candidate, reason, exact patch, and target hashes. User moves reviewed file to `STAGING/Reviewed`; `accept` or per-item `apply` records intent. DEC-033 requires authenticated one-time receipt for exact immutable plan. `revise` creates replacement recommendation, and `reject` or `ignore` creates no write.
- Safety: Deterministic executor canonicalizes paths, preflights transaction, obtains concurrency protection, preserves preimages, checks bytes immediately before atomic writes, verifies results, and rolls back partial transaction. Stop stale item. Discover no new target during apply. Initial old-note edits are additive links in approved sections. Never delete source automatically. Scan only changed notes in approved PARA/Zettelkasten roots plus narrow plain-search candidates under hard budgets.
- State: Store only rebuildable path/hash/time/version checkpoint outside vault and repository. It is not knowledge, authorization, backup, watcher, workflow database, or derived content index.
- Promotion: Requires approved transport, recovery, privacy allowlist, synthetic EXP-014, and successful proposal-only learning loop. Daily changed-note frequency requires measured need and separate decision.

## DEC-032: Ship in-vault operating guide

- Status: Accepted
- Decision: Keep detailed human and agent manual at `SYSTEM/Guides/vault-operating-guide.md`, sourced from repository `vault-template/`. It documents full folder purposes, capture, filing, linking, attachments, review, approved apply, link gardening, agent permissions, failure behavior, naming, templates, and promotion gates.
- Boundary: Guide is plain Markdown and adds no plugin dependency. Presence of guide never activates Hermes, grants vault access, or overrides current release decision.
- Rationale: Daily operation should not require repository, chat history, or remembered design rationale. One visible guide keeps human and agent expectations aligned inside synchronized vault.

## DEC-033: Authenticate and transact agent actions

- Status: Accepted
- Decision: Synchronized Markdown records review intent but does not prove human identity. Before provider reads queued source, authenticated receipt outside vault binds exact request, source, context, workflow version, and expiry. Before Release 4A writes, one-time receipt binds unchanged reviewed file SHA-256 and immutable plan hash. Any destination, target, hash, or patch edit requires replacement proposal.
- Execution: Model proposes only. Deterministic non-model executor applies. It canonicalizes cross-platform vault paths, rejects escape/collision/reparse cases, preflights whole transaction, requires compare-and-swap or proven exclusive maintenance window, stores privacy-equivalent preimages outside synchronized vault, checks bytes immediately before atomic write, journals executor-written postimage, verifies post-write hashes, rolls back only while current bytes equal postimage, and writes separate immutable result receipt. Concurrent mismatch preserves every version and forces human recovery.
- Idempotency: Local transaction journal and result receipt are narrow operational safety state, not knowledge or general workflow database. Reviewed authorization bytes never change. Unknown state or failed rollback disables executor until human recovery.
- Retention: Unused approval expires after 15 minutes. Used hash-only receipt and journal remain 90 days. Private preimages remain at least 30 days and until next verified independent recovery contains post-state; failure evidence remains until human recovery. Human may archive completed reviewed Markdown and result under PARA Archive or delete after filing and recovery; agent never cleans it automatically.
- Queue movement: Raw `STAGING/Unsorted` note may move into review queue. Already-filed canonical note stays in place; sidecar request names exact path, and trusted approval step calculates source hash to preserve links, reduce mobile friction, and avoid sync rename race.
- Gardening limits: One run is capped at 20 changed notes, 5 candidates per note, 2,000 filename-only paths, 100 content-inspected files, 1 MiB local content reads, 250 KiB provider text, 64 KiB per note, 10 model requests, 20 recommendations, and 15 minutes. Every locally inspected body counts. Overflow remains eligible; limits never rise silently. Digest name includes deterministic scan-kind/checkpoint/input run ID and uses create-only semantics before checkpoint advance.
- Rationale: FNS peers, plugins, and synchronized content are untrusted inputs. In-vault decision alone is forgeable, hash-check-then-write is race-prone, and multi-file sequential apply can fail partially. Separate authentication and deterministic recovery boundary preserve rich Markdown review without granting note content or sync state authority.

## DEC-034: Bootstrap complete core vault

- Status: Accepted
- Decision: Repository ships non-destructive PowerShell initializer plus meaningful `HUB/Home.md`, in-vault guide, and core Daily, Weekly, Literature, and Permanent templates. Initializer creates every documented empty folder and copies only missing starter files.
- Safety: Existing files are never overwritten. Fixed manifest copies only Home, guide, and four templates. Source/self-copy target, reparse-point destination/ancestor, directory at starter-file path, and missing source file fail visibly. Initializer does not install plugins, copy Dusk `.obsidian`, enable FNS or Hermes, migrate notes, change settings, or delete content. Automated test verifies exact folder set, every starter preservation, manifest exclusion, containment directions, reparse cases, and wrong-item-type rejection.
- Release gate: Stage 4 runs initializer into disposable vault, sets `SYSTEM/Media` through Obsidian core settings on both clients, and opens home/guide/templates on Windows and Android before sync fixtures.
- Rationale: Git cannot carry empty directories, and guide alone is not usable vault template. Small bootstrap makes documented structure reproducible without sample-content clutter or plugin runtime.

## DEC-035: Isolate pilot behind dedicated tunnel

- Status: Accepted implementation amendment to DEC-022; content boundary amended by DEC-038.
- Decision: Use one new Cloudflare Tunnel and DNS route dedicated to synthetic FNS pilot. Bind pinned FNS container only to Oracle loopback. Keep existing managed tunnel, PM2 tunnel, routes, origins, Hermes, and 9Router unchanged.
- Evidence: Read-only Stage 2 preflight found dormant empty host Nginx, two existing Cloudflare tunnel processes, valid local tunnel credentials, and no safe existing Nginx boundary to reuse. See [2026-07-23 implementation evidence](../research/2026-07-23-fns-implementation-evidence.md).
- Boundary: Public TLS hostname still reaches FNS-authenticated surface. Open
  security and authorization issues permit only synthetic fixtures plus
  existing Notion bytes preserved by DEC-038. No additional personal or
  employer content, FNS MCP consumer, external REST consumer, sharing, Git
  automation, mirror, configuration sync, headless client, or Cloud Preview
  deletion is authorized.
- Rollback: Stop dedicated FNS Compose project and dedicated tunnel. Preserve state for inspection. Existing ingress processes and routes remain untouched.

## DEC-036: Try core-first Dusk customization

- Status: Superseded by DEC-037; preserved history from closed PR #4.
- Decision: The first Phase 2 attempt used Obsidian core features plus a small plugin set and kept richer Dusk behavior as optional experiments.
- Outcome: It provided a plain fallback but did not match the requested Dusk experience closely enough.
- Evidence: Exact implementation history remains on archived branch `feat/obsidian-phase2`.

## DEC-037: Hand-recreate rich Dusk runtime

- Status: Superseded by DEC-039; never merged into `main`.
- Decision: The second Phase 2 attempt recreated Dusk surfaces from selected scripts, CSS, dashboards, plugins, and Discord-derived components.
- Outcome: Windows experiments produced useful findings, but the approach overengineered a vault whose legacy Dusk variants already worked on Windows and Android. Pull request [#4](https://github.com/tienbac2314/north-obsidian-vault/pull/4) was closed without merge and the live vault was rolled back.
- Boundary: Archived plugin choices, architecture, roadmap, and runtime files are evidence only. They do not authorize implementation.
- Evidence: [Phase 2 reversal](../archive/2026-07-24-phase-2-reversal.md).

## DEC-038: Record existing personal-vault exception

- Status: Accepted current-state correction; rollback details amended by DEC-039.
- Trigger: The existing `Notion` import was already inside the FNS-backed live vault, so actual state no longer matched DEC-035's synthetic-only boundary.
- Decision: Preserve existing Notion bytes and normal human-only FNS synchronization as a bounded exception. Do not describe this as completed Release 1B promotion or authorization for additional personal or employer content.
- Controls: FNS remains sole live transport. Obsidian core Sync, FNS Configuration Sync, API/MCP consumers, sharing, Git automation, Hermes, and external writers remain disabled. Preserve an independent copy and require remaining Android, privacy, and recovery gates before broader promotion.
- Rationale: Documenting existing state is safer than pretending the personal import is synthetic or destructively removing it.

## DEC-039: Archive hand-built Phase 2 and restart import-first

- Status: Accepted.
- Decision: Close PR #4 without merge, restore the live vault to its verified pre-Phase-2 content baseline, preserve the complete attempt in branch and backup archives, and replace hand-built recreation with a new direct-import-first design cycle.
- Scope: Reuse archived observations selectively. Compare user-tested Dusk variants, establish exact source authority, reproduce legacy behavior in a disposable vault, apply Discord deltas separately, and evaluate plugin upgrades incrementally.
- Boundary: No source, plugin set, Android defect, or promotion plan is accepted by this decision. No archived plan may modify `G:\Obsidian`. Live promotion requires a new concise design and implementation plan, Windows and Android evidence or explicit accepted defects, secret exclusion, backup manifest, rollback proof, and independent review.
- Rationale: Preserve useful research while removing redundant reconstruction and documentation from the implementation path.
- Evidence: [Phase 2 reversal](../archive/2026-07-24-phase-2-reversal.md).
