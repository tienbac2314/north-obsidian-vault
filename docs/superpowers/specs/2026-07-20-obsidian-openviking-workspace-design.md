# Obsidian, Hermes, OpenViking, and 9Router workspace design

Status: superseded non-authoritative specification. Preserve for provenance; do not implement. Current authority is [system design](../../system-design.md).

> **Status: superseded on 2026-07-21.** Preserve for design provenance; do not implement. Replacement specification will follow approval of current simplified design. Use [documentation status](../../README.md) and [active goal](../../active-goal.md).

Previous status: approved baseline before simplification.

Date: 2026-07-20.

Adversarial review: 2026-07-21.

## Purpose

Build a personal engineering workspace that produces better judgment, reusable knowledge, and visible growth. Obsidian is the normal place to write, read, and edit. Telegram is optional quick capture. Hermes coordinates explicit workflows. OpenViking may provide derived machine context. 9Router supplies replaceable generation and vision models.

The design must remain useful when every agent component is down. Plain Markdown and attachments in the logical Obsidian vault are the canonical human library.

## Product rules

1. Writing must not require classification, frontmatter, a template, or an agent.
2. New material may stay in `INBOX/Unsorted` until a weekly review.
3. Moving a note into `INBOX/Pending Agent Review` authorizes one proposal job. For release one, it also authorizes sending that queued note and only its explicitly linked context through the configured 9Router generation route. It never authorizes overwrite.
4. Every existing human note is review-required. Filesystem events cannot reliably prove who edited a synced file.
5. Hermes may auto-create only bounded agent artifacts in `SYSTEM/AGENT PROPOSALS` or another explicitly generated path.
6. OpenViking is a rebuildable projection, never a second editable copy of a curated note.
7. Git records accepted changes and supports rollback. It does not grant edit authority and is not backup by itself.
8. Optional Telegram capture is acknowledged only after a local durable commit independent of Hermes, OpenViking, 9Router, and upstream models.
9. No 9Router combo or provider fallback may change embedding identity inside one index generation.
10. Notes forbidden from external processing stay out of 9Router and external embedding/VLM calls.
11. Missing sensitivity label fails closed to `local_only`; external classification cannot decide whether disclosure is allowed.
12. Copied content is untrusted data and cannot supply agent/tool instructions.

## Authority model

| Component | Owns | Must not own |
|---|---|---|
| Logical Obsidian vault | Canonical human-visible Markdown, Canvas, attachments, reviews | Agent job state or Telegram delivery queue |
| Obsidian clients | Human creation, editing, moves, approvals | Hidden agent state |
| Replication layer | File convergence between devices and VPS replica | Authorization, backup, or knowledge semantics |
| Deterministic workspace service | Proposals, expected hashes, approvals, atomic writes, job journal | Content judgment |
| Hermes | Intent routing, research, synthesis, tool orchestration | Unrestricted filesystem mutation or sole durable state |
| OpenViking | Later derived vault retrieval projection | Canonical curated notes; native memory/imported-resource state before separate policy |
| 9Router | Replaceable generation/VLM routing | Capture durability or substitutable embeddings |
| Telegram ingress | Optional raw delivery durability and idempotency | Knowledge interpretation |
| Git | Accepted-history audit and rollback | Sync authority, ownership detection, independent backup |

## Vault structure

Structure adapts Dusk's PARA and Zettelkasten ideas without its old plugin runtime:

```text
HUB/
    Home.md
    Agent Queue.md
INBOX/
    Unsorted/
    Pending Agent Review/
    Reviewed/
PARA/
    PROJECTS/
    AREAS/
    RESOURCES/
    WORKSTATION/
    ARCHIVES/
ZETA/
    FLEETING/
    LITERATURE/
    PERMANENT/
DAILY/
    DAILY/
    WEEKLY/
    MONTHLY/
SYSTEM/
    TEMPLATES/
    ATTACHMENTS/
    AGENT PROPOSALS/
        Pending/
        Approved/
        Rejected/
        Applied/
        Stale/
        Failed/
    GUIDE/
```

Folders are choices, not capture requirements. `INBOX/Unsorted` is default destination. PARA answers “what action or responsibility does this support?” Zettelkasten answers “how mature is my understanding?” A note may stay unsorted indefinitely without breaking system.

`PARA/WORKSTATION` is the junior-SWE engineering workbench: active debugging investigations, implementation decisions, blockers, experiments, benchmarks, and postmortems. Workstation notes may be incomplete and project-adjacent. They do not trigger Hermes merely by existing there. During weekly review, a durable conclusion may be rewritten into `ZETA/PERMANENT`, retained as a project-specific record, moved to `PARA/RESOURCES`, or discarded when it has served its temporary purpose.

Templates are optional prompts. Minimum useful review asks:

- What did I learn in my own words?
- Where did I see or use it?
- What will I do differently or test next?
- Which project, area, or prior note does it relate to?

The optional Workstation template asks only for context, observation, evidence, next experiment, and current conclusion. It uses plain Markdown and does not require plugin-generated frontmatter. Dusk's plugin-heavy dashboards, inline scripts, credential-bearing configuration, and automatic page-state machinery are not copied.

Daily notes are optional. Weekly synthesis is required growth loop; monthly synthesis compresses weekly reviews. AI drafts questions and summaries, but user-owned wording is final understanding.

Workspace service may create an unprocessed weekly or monthly request listing links to changed notes or accepted reviews without reading note bodies. User removes unwanted links and moves request into pending queue; only that action authorizes linked bodies for one synthesis job.

## Direct Obsidian workflow

1. User creates or edits any note normally.
2. Sync copies bytes to other devices and VPS working replica when available.
3. Git automation may checkpoint changed files, but ordinary notes trigger no agent work.
4. Moving a stable note into `INBOX/Pending Agent Review` creates one proposal request. Ordinary notes elsewhere trigger nothing.
5. Hermes reads exact queued source plus explicitly linked, permitted context and returns one structured proposal. Create requests need no directive. Update requests require one user-written `Update [[vault-relative/path]]` directive; service validates target and supplies its current content. Hermes may not guess an existing target. It has no shell, file-write, credential, deployment, or messaging tools and does not retain this job in Hermes memory.
6. Workspace service creates `SYSTEM/AGENT PROPOSALS/Pending/<proposal-id>/Review.md` plus `Proposed.md`. SQLite, not note frontmatter, stores source path/hash, operation, target path, expected target hash, proposed payload hash, state, attempts, and timestamps.
7. User may edit `Proposed.md`. Moving proposal folder to `Approved` authorizes its exact current bytes. Moving it to `Rejected` authorizes no target change.
8. Apply re-hashes live target immediately before mutation. Update requires exact expected-target SHA-256; create requires absent target. Mismatch moves proposal to `Stale` and writes nothing.
9. Successful decision moves raw queued input unchanged to `INBOX/Reviewed`, preventing an unchanged item from retriggering. Stale or failed work leaves source pending, remains visible, and stays suppressed until source bytes change or user explicitly retries.
10. Accepted mutation gets a narrow Git commit. First human edit of an agent-created page makes no special state transition: all canonical pages are always human-owned, and every later agent update still requires another proposal.

No watcher tries to infer human versus agent authorship. First manual edit does not need to claim a file because existing canonical notes are always human-owned.

Queue ledger permits one active proposal per source path/hash. Approval applies one target and moves source to `INBOX/Reviewed` as one reviewed workflow. Rejection changes no target and also moves source to `INBOX/Reviewed`. Transient Hermes/9Router failures retry at most three total attempts with bounded delay. Terminal failed/stale work retries only after source edit or explicit retry command, preserving old proposal history.

## Deterministic mutation boundary

Hermes must not receive a generic unrestricted write tool. Workspace service enforces:

- realpath containment under vault root;
- explicit readable and writable path allowlists;
- rejection of `.git`, `.obsidian`, sync-conflict files, secrets, backup directories, and system state;
- byte-preserving or narrowly parsed edits rather than whole-file YAML reserialization;
- same-directory temporary write, flush, atomic replace, and parent-directory durability where supported;
- expected-base SHA-256 optimistic concurrency;
- per-path agent lease and stable-file check before apply;
- idempotency key per requested mutation;
- persisted proposal/apply journal;
- post-write validation before Git commit;
- post-write result hash and staged Git blob must equal approved bytes;
- explicit reviewed operations for moves, renames, merges, archive, and delete.

A small SQLite WAL journal is allowed for operational jobs, proposals, idempotency, and Telegram ingress. It is not a knowledge database and does not duplicate vault content as canonical truth. Git helper stages only intended paths, verifies staged blob identity, and commits approved bytes. If sync changes working tree after staging, commit remains exact and workflow enters reconciliation.

## Safe write policy

| Action | Default |
|---|---|
| Create proposal artifact | Automatic |
| Create disposable generated report under approved generated path | Automatic |
| Update existing canonical Markdown | Review and expected hash |
| Create new canonical Markdown | Review and target-must-not-exist check |
| Move, rename, merge, archive, delete | Always review; user/Obsidian preferred in first release |
| Edit `.canvas` | Review; creation postponed until explicit use case |
| Change `.obsidian`, Git, sync, or system files | Forbidden through Hermes |

Managed sections may be evaluated later, but marker-based auto-edit is not part of first release.

## Replication and Git

No paid Obsidian Sync subscription is assumed. Release one implements Syncthing first between Windows, a maintained Syncthing-Fork Android client, and the plain-file VPS replica. The official Android client ended in December 2024, so physical-device validation is a promotion gate rather than an assumed guarantee. Self-hosted LiveSync is fallback only if Android background operation or conflict/recovery tests fail.

Syncthing requires no Tailscale dependency. Device authentication and transport remain Syncthing-owned; management UI binds to loopback and is reached through SSH when needed. Enable file versioning on Windows and VPS for remote changes. Preserve propagated `.sync-conflict-*` copies for human resolution while excluding them, Syncthing temporary names, `.stversions`, and volatile Obsidian workspace files from agent processing and Git checkpoints.

Never run two live sync engines over same vault. VPS `.git`, operational SQLite, backup spool, secrets, and service configuration do not sync. Never auto-merge or delete `.sync-conflict` files; surface them for review.

Git automation uses one active branch in VPS vault replica, dedicated workspace-service identity, one shared Git lock, narrow approved-mutation commits, and periodic stable human-change checkpoints. `.git` never syncs to Windows or Android. No automated pull/rebase/reset/checkout in live replica.

Daily recovery creates a consistent SQLite snapshot, archives vault plus VPS `.git` and non-secret recovery metadata into a timestamped AES-256-encrypted `.7z`, and uploads each unique file with one-way `rclone copyto` to Google Drive using the `drive.file` scope. Immutable-copy behavior prevents normal job overwrite. The job never uses `rclone sync` or remote delete. Failed uploads remain in a local retry spool and never block Obsidian writing or proposal decisions. `rclone.conf` is owner-only and excluded from archives; backup password lives outside VPS with one offline recovery copy. Promotion requires restore into an empty directory.

## OpenViking projection

OpenViking enters after core vault workflow is stable. First role is derived vault projection only. Native agent memories/imported resources are separate non-rebuildable state and remain disabled until independent retention, deletion, backup, and authority policy exists. Projection uses explicit desired/observed manifest, not assumed arbitrary-directory watching.

Manifest records stable note ID where available, current vault path, content hash, sensitivity policy, OpenViking URI/task identity, source model contract, and last successful projection state. Reconciliation scan:

1. discovers permitted vault files;
2. excludes `.git`, `.obsidian`, conflict files, proposals, private/system paths, and unsupported binaries;
3. compares content/path to manifest;
4. schedules explicit add, move, remove, or rebuild operations using verified APIs;
5. records success only after OpenViking confirms it;
6. leaves vault untouched on projection failure.

Exact content-update semantics must be tested against pinned OpenViking version before implementation. Do not invent a mirror contract from `add_resource` or watcher behavior.

## Optional Telegram capture

Hermes gateway/session hooks occur inside agent lifecycle and do not prove durable-before-`Saved` receipt. Telegram therefore uses separate deterministic ingress if enabled:

1. Verify allowlisted sender/chat and derive stable key from bot identity plus `update_id`.
2. Commit raw update and initial outbox/job into SQLite WAL configured for full synchronous durability on same durable filesystem as WAL.
3. For text/link, send `Saved` only after commit. For media, send `Saved metadata; attachment pending`; send `Attachment saved` only after bytes and checksum persist.
4. Download attachments and invoke Hermes asynchronously; attachment expiration/retrieval failure stays visible.
5. Publish resulting proposal or note into vault through same mutation boundary.

If SQLite/disk fails, never say `Saved`. If Hermes, OpenViking, 9Router, upstream provider, sync, or Obsidian fails, raw capture remains queued.

## 9Router and model policy

Use current self-hosted 9Router for all release-one LLM drafting. Hermes config defines one named custom provider for loopback 9Router and registers multiple model IDs discovered from its OpenAI-compatible `/models` endpoint; one validated generation model is pipeline default. Do not invent IDs or context sizes. Capture, approval, apply, Git, and backup do not depend on it. Record purpose, requested route, actual model when exposed, prompt/schema version, latency, and status without private bodies or credentials.

Queue placement is explicit one-job authorization for queued content and explicitly linked context to use configured 9Router providers. Notes outside queue are not read or sent. Work-restricted or private material must remain outside this queue until a local-only route exists or explicit provider policy is added. Full request/header/body logging must remain disabled or redacted and be verified at runtime.

Hermes treats note/article/AI text as inert source data. Drafting context separates trusted user intent from untrusted source delimiters and runs without shell, write, deployment, credential, or messaging tools. Research tool calls require explicit user intent and may not be initiated by instructions inside source material.

Embeddings require one immutable contract: provider, exact model, dimensions, normalization/preprocessing, chunker, metric, and index-generation ID. Compare:

- exact fail-closed 9Router route with no model substitution; and
- local pinned Ollama model, starting with `embeddinggemma` because bilingual English/Vietnamese fit matters.

Benchmark retrieval quality, ARM64 2-core throughput, memory, rebuild time, privacy, and outage behavior. Never use a 9Router combo for embeddings. Local VLM/reasoning inference is excluded unless benchmark later proves usable; it is not an emergency fallback.

## First production-worthy release

Included:

- plain Dusk-inspired vault structure, including the engineering `WORKSTATION`, and short guide;
- direct Obsidian capture with optional templates;
- Syncthing-first Windows/Android/VPS replication with physical-device gate and LiveSync fallback;
- Git checkpoints plus encrypted Google Drive backup and restore drill;
- weekly and monthly learning reviews;
- proposal-folder Hermes workflow with editable exact payload and deterministic apply boundary;
- path/sensitivity exclusions and visible failure queue;
- existing 9Router as named multi-model Hermes provider for permitted generation.

Excluded until evidence gate:

- OpenViking projection and vector retrieval;
- Telegram ingestion;
- Canvas generation;
- automatic moves, renames, merges, deletion, link repair, or bulk taxonomy;
- managed-section auto-edit;
- local VLM/reasoning fallback.

This is not a throwaway barebones phase. It establishes final authority, file format, sync, history, backup, review, privacy, and mutation contracts before adding derived services.

## Acceptance gates

- Ordinary Obsidian editing works with agents offline.
- Same-note concurrent-edit and offline-device tests lose no bytes and expose conflicts.
- Android background sync, restart, attachment, rename, delete, and battery tests pass with maintained Syncthing-Fork; otherwise stop and evaluate LiveSync.
- Restore drill rebuilds vault, Git history, and SQLite state from Google Drive archive without primary device.
- Queueing a note never changes source before approval.
- Approved proposal applies exact current `Proposed.md` once; stale target hash never overwrites current note.
- Rejected proposal changes no target; both accepted and rejected workflows move source to `INBOX/Reviewed` without loss.
- Hermes cannot write outside allowlist or into `.obsidian`/`.git`.
- Prompt-injection fixtures cannot invoke tools, disclose extra context, or alter mutation/data policy.
- 9Router outage leaves note creation, sync, review, and proposal queue intact.
- Weekly review produces one own-words insight and one changed action for three of four trial weeks.
- External-model policy blocks restricted test notes and logs no raw body.

## Retained, changed, rejected, postponed, and experimental

Retained: Obsidian-first library, Dusk-inspired optional structure, Git audit, Hermes orchestration, OpenViking as later derived context, 9Router generation role, pinned later embeddings, durable optional Telegram ingress.

Changed: default edit governance is proposal folders for one-target create/update; operational SQLite owns machine state; Syncthing-Fork is first sync candidate; Google Drive is backup target; queued placement authorizes one external generation job; taxonomy is never required during capture.

Rejected: inferred manual ownership from filesystem events, OpenViking as Telegram durability boundary, OpenViking and Obsidian as symmetric stores, external classification of disclosure policy, Git as sole sync/backup, automatic conflict merging, unrestricted note writes, embedding combos, paid Obsidian Sync assumption.

Postponed: Canvas automation, bulk organization, managed-section auto-write, vector search, Telegram as main interface, local VLM fallback.

Experimental: Syncthing physical-device validation with Self-hosted LiveSync fallback; exact later 9Router embedding route versus local `embeddinggemma`; OpenViking update/reconcile behavior; retrieval-quality gates.
