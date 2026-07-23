# NotebookLM adversarial design review

Date: 2026-07-21. Private notebook/conversation identifiers intentionally omitted.

Status: historical adversarial review. Its Syncthing-first verdict was superseded by the focused [2026-07-22 sync, history, and attachment reevaluation](2026-07-22-sync-and-extension-reevaluation.md); retained reasoning and retractions remain evidence.

## Method

Project Markdown sources in the existing Obsidian-focused notebook were refreshed before review: stale project copies were removed, current design files were uploaded, and official/web research sources were retained. Questions attacked sync, authority, note mutation, Telegram durability, taxonomy, OpenViking lifecycle, 9Router, embeddings, privacy, and VPS constraints. Follow-ups explicitly requested retractions and ended with "What important question are we not asking yet?" Important claims were then checked against official project documentation.

NotebookLM was research partner, not source of truth. Its answers mixed useful critique, inference, stale statements, and unsupported specifics.

## Retained

- Plain Markdown remains canonical and portable.
- Git is useful for history and rollback but separate from edit permission.
- Existing human notes should not receive unrestricted automatic writes.
- Telegram durability must precede model processing.
- 9Router should serve replaceable generation, while embedding identity remains fixed.
- Local CPU vision/reasoning inference is poor default on 2-core ARM64 VPS.
- Sensitive work notes require explicit external-processing policy.

## Changed after challenge

- Obsidian moved from future projection to primary input and canonical human library.
- No filesystem watcher may infer human/agent ownership; sync events lack trustworthy author identity.
- Queue placement authorizes proposal only. Approved write uses expected hash and deterministic tool.
- Small SQLite WAL is allowed for operational proposal/job state and optional Telegram ingress, not knowledge storage.
- OpenViking is explicit manifested projection. Arbitrary directory watching and update behavior are not assumed.
- Full Dusk structure remains available, but capture never requires PARA/Zettelkasten choice.
- Sync provider must pass actual device experiment before approval.

## Rejected NotebookLM output

- Paid Obsidian Sync/headless client: violates user's no-subscription constraint.
- Blanket rejection of Self-hosted LiveSync as too heavy: official project documents low-resource/Raspberry Pi deployment and newer CLI, but fit still needs benchmark.
- Syncthing as obvious Android answer: official Android app was discontinued and repository archived in December 2024.
- Automatic merge of `.sync-conflict` files: official Syncthing behavior propagates them as normal files; automation can create conflict loops.
- OpenViking as durable Telegram receipt: ingestion triggers parsing/persistence/semantic work and is unnecessary critical dependency.
- Direct OpenViking directory-mirror/watch assumptions: official APIs support resource and filesystem operations, but do not prove desired arbitrary mirror semantics.
- Invented Go microservice, fixed external models, endpoint choices, resource measurements, vulnerability claims, and named implementation libraries without sufficient evidence.
- Proposed direct Hermes writes despite simultaneously rejecting unrestricted mutation.

## Postponed

- Canvas generation and layout updates.
- Automatic reorganization, moves, renames, merges, delete, archive, and link repair.
- Managed-section auto-write.
- OpenViking/vector retrieval until plain search baseline fails.
- Telegram as main interface.
- Local VLM/reasoning fallback.

## Required experiments

1. Syncthing plus maintained Syncthing-Fork on Windows, Android, VPS: offline same-note edits, attachments, rename, delete, conflicts, Android background/battery, restart, and restore. Evaluate Self-hosted LiveSync only after failure.
2. OpenViking pinned-version add/update/move/delete and reconciliation behavior.
3. Dedicated exact 9Router embedding route versus local Ollama `embeddinggemma`: bilingual retrieval, throughput, memory, rebuild, privacy, outage.
4. Proposal service: forbidden paths, stale hashes, crash replay, apply-once, Git failure recovery.
5. Data-class enforcement and proof restricted content never reaches external models or raw request logs.

## Most important unasked questions

- Which notes may legally or ethically leave VPS for external models?
- What happens when primary desktop is offline for days and VPS has pending proposals?
- Which files must be excluded from Hermes/OpenViking context to prevent secrets, system metadata, conflicts, and proposals from feeding themselves back?
- What evidence proves weekly review changes behavior rather than creating another archive?
- Can full system be restored from off-host backup without any live SaaS or primary device?

## Official verification used

- [Syncthing Android repository](https://github.com/syncthing/syncthing-android)
- [Syncthing conflict handling FAQ](https://docs.syncthing.net/users/faq.html#what-if-there-is-a-conflict)
- [Self-hosted LiveSync repository](https://github.com/vrtmrz/obsidian-livesync)
- [Self-hosted LiveSync releases](https://github.com/vrtmrz/obsidian-livesync/releases)
- [Remotely Save repository](https://github.com/remotely-save/remotely-save)
- [Hermes gateway internals](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/developer-guide/gateway-internals.md)
- [OpenViking resource API](https://docs.openviking.ai/en/api/02-resources)
- [OpenViking filesystem API](https://docs.openviking.ai/en/api/03-filesystem)
- [OpenViking setup](https://docs.openviking.ai/en/getting-started/04-setup-for-agent)
- [OpenViking changelog](https://docs.openviking.ai/en/about/02-changelog)
- [9Router architecture](https://github.com/decolua/9router/blob/master/docs/ARCHITECTURE.md)
- [Ollama embeddings](https://docs.ollama.com/capabilities/embeddings)

## Decision effect

Result is narrower but more durable: rich Obsidian-first foundation now, optional derived intelligence later. This keeps user's preferred structure and agent potential without asking sync, model, or vector systems to guarantee properties they do not expose.

## Release-one implementation session

A second session challenged implementation boundaries after user selected Google Drive backup and approved a simpler release-one stack.

Retained:

- scheduled one-shot workspace process instead of permanent watcher;
- folder-based Obsidian proposal decisions;
- SQLite operational state and immediate target-hash compare-and-swap;
- Hermes drafting without write/shell/messaging tools or persistent memory;
- self-contained encrypted archives copied one-way to Google Drive;
- Syncthing as first implementation candidate because it exposes a plain-file VPS replica and visible conflict copies.

Changed after independent verification:

- Syncthing needs no Tailscale dependency for this release;
- maintained Syncthing-Fork is accepted only behind Android battery/background and conflict tests;
- existing canonical pages never move into pending queue; queued raw input produces a separate one-target proposal;
- proposal machine metadata stays in SQLite, while `Review.md` and editable `Proposed.md` remain human-visible;
- `drive.file` limits rclone to files/folders it created but is not write-only or deletion-proof;
- multi-model Hermes integration means registering several model IDs under one named custom 9Router provider, not inventing per-run overrides.
- create jobs persist before model output with nullable target fields, while a partial unique index permits only one active job per source path/hash;
- transient model failures use bounded retries; validation, policy, and auth failures require explicit retry;
- 7-Zip receives backup password through stdin with empty `-p`, never through argv.

Rejected from second session:

- `python-frontmatter`, `atomicwrites`, and Markdown parser dependencies without a demonstrated need;
- moving an existing canonical page into pending queue;
- claimed folder-only Google Drive OAuth semantics;
- invented vulnerability identifier, model IDs, paths, commands, resource measurements, and timeout thresholds;
- claimed mandatory frontmatter/YAML parser and duplicate target-hash storage as release blockers;
- S3/R2/B2/restic after user chose simpler Google Drive archives.

Second-session verdict: approve with corrections. Approved design fixes Syncthing-first replication, Obsidian proposal folders, Google Drive recovery, standard-library workspace state, and named multi-model 9Router integration. Physical-device, live-endpoint, privacy/logging, crash, and restore behavior remain implementation tests rather than documentation claims.

## Simplification session: Hermes plus Obsidian only

A fresh compact notebook was created on 2026-07-21 rather than reusing the prior 155-source notebook. It contained eight refreshed project Markdown sources and twelve official repository/issue sources covering Hermes's bundled Obsidian skill, Hermes setup reference, Self-hosted LiveSync and CLI issue `#1036`, Fast Note Sync and issues `#342`, `#339`, and `#346`, Local REST API, Dusk vault, and current 9Router findings. Prompt files are preserved in:

- `notebooklm-simplification-prompt.md`
- `notebooklm-simplification-followup.md`

First response correctly removed Telegram ingestion, OpenViking, embeddings, and general custom APIs, but reintroduced a custom SQLite WAL, local Python apply script, and Syncthing-specific machinery from stale design sources. It also repeated allegations from Fast Note Sync issue `#342` as established vulnerabilities. Those conclusions were challenged explicitly.

NotebookLM then retracted:

- custom SQLite as first-release requirement;
- custom watcher/daemon;
- local Python apply script;
- physical read isolation from all ordinary vault knowledge;
- claims that issue `#342` contained proven CVEs;
- unsupported claim that Local REST API had no upstream blockers.

Retained after challenge:

- separate proposal output means source edits during generation cannot cause silent overwrite;
- deterministic proposal identity from source path plus content hash can provide enough idempotency for first release;
- source path/hash stored in Markdown is sufficient for later stale-result detection;
- duplicate model calls and dirty Git state are tolerable first-release failures; human-note loss is not;
- automatic existing-note application remains omitted;
- Self-hosted LiveSync remains preferred long-term sync shape after official E2EE CLI push fix;
- Fast Note Sync remains excluded from default internet-facing deployment because unresolved security and permission reports create unacceptable uncertainty, not because every allegation is proven;
- Local REST API remains useful only while desktop Obsidian is running;
- sync transport choice and automation level are separate decisions.

Independent official-source check after the NotebookLM conversation found a simpler automation option that its answer missed: Hermes already has native recurring cron jobs, skill attachment, vault `workdir`, tick locking, execution history, local output, and pause/manual-run controls. Therefore scheduled pending-folder review needs neither custom watcher nor shell cron script. Manual command remains the smallest trigger; native Hermes cron is the built-in automatic trigger.

### Revised decision effect

First design can be reduced to Obsidian, one sync transport, Hermes with bundled Obsidian skill plus one narrow review skill, existing 9Router, and optional Git history. No custom service, custom database, custom watcher, apply script, OpenViking, embeddings, or Telegram ingestion is needed. After this review, the user selected Hermes native scheduled scanning. Sync transport remains unresolved.
