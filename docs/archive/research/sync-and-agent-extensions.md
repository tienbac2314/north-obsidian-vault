# Sync and agent extension evaluation

Date: 2026-07-21. This is earlier research evidence, not current decision authority. See the [2026-07-22 reevaluation](../../research/2026-07-22-sync-and-extension-reevaluation.md) for current scorecards, releases, decision, and VPS state.

## Decision question

Can existing Hermes and Obsidian extensions replace the proposed custom workspace service, SQLite proposal engine, separate backup pipeline, and OpenViking-first integration?

## Hermes bundled Obsidian skill

Hermes already ships an [Obsidian skill](https://github.com/NousResearch/hermes-agent/blob/main/skills/note-taking/obsidian/SKILL.md). It resolves `OBSIDIAN_VAULT_PATH` and uses ordinary file tools to list, search, read, create, append, and patch Markdown files.

This removes the need for a custom note CRUD service when Hermes has a plain-file VPS replica. It does not itself enforce review policy, path restrictions, or human approval. Those behaviors can be expressed in one narrow workflow skill and tested against a dedicated queue folder.

## Self-hosted LiveSync plus CLI

[Self-hosted LiveSync](https://github.com/vrtmrz/obsidian-livesync) provides Obsidian-native CouchDB/object-storage synchronization, conflict handling, and end-to-end encryption. Its official README explicitly warns that synchronization is not backup, recommends backing up before installation or upgrade, and says not to run another sync solution on the same vault.

The newer official [LiveSync CLI](https://github.com/vrtmrz/obsidian-livesync/tree/main/src/apps/cli) changes the earlier architecture assessment:

- `daemon` continuously synchronizes CouchDB and a real local vault directory;
- `mirror` materializes database contents as ordinary files;
- `push`, `pull`, `put`, `cat`, revision inspection, conflict resolution, and remote lock commands support headless operation;
- a user-level systemd installer is included;
- Hermes can point its bundled Obsidian skill at that VPS directory.

This is the cleanest path to an encrypted sync service plus plain Markdown for Hermes. Current release `0.25.83` has an important blocker: [open issue #1036](https://github.com/vrtmrz/obsidian-livesync/issues/1036) reports that encrypted CLI pushes crash on Node because a browser-only `FileReader` path is selected. Pulls work, but agent edits cannot safely flow back under E2EE without an upstream fix or local patch. A private workaround would undermine the goal of minimizing custom machinery.

LiveSync revision/conflict data helps recovery, but upstream still treats separate backup as necessary. Minimum independent recovery may be Git history over the VPS Markdown replica rather than the previously designed encrypted archive pipeline.

## Fast Note Sync

[Fast Note Sync Service](https://github.com/haierkeys/fast-note-sync-service) combines multi-device sync, note history, trash, attachments, backup targets, Git automation, REST, and MCP. It publishes a concrete [Hermes MCP configuration](https://github.com/haierkeys/fast-note-sync-service/blob/master/docs/skills/fns-mcp/configs/hermes.yaml). This is the fewest-component option: Obsidian plugin talks to FNS, and Hermes talks to the same service through authenticated MCP.

Important limits:

- [plugin roadmap](https://github.com/haierkeys/obsidian-fast-note-sync) still lists end-to-end encryption as unfinished;
- MCP can create, replace, append, move, rename, restore, and delete notes and files, so a leaked or misused token has a large blast radius;
- [folder-scoped permissions request #339](https://github.com/haierkeys/fast-note-sync-service/issues/339) remains open;
- [vault restriction bug #346](https://github.com/haierkeys/fast-note-sync-service/issues/346) remains open as of this review;
- [security audit issue #342](https://github.com/haierkeys/fast-note-sync-service/issues/342) alleges several serious server and plugin weaknesses and remains open; maintainer acknowledged it but has not documented complete resolution there;
- an earlier [arbitrary-user-login vulnerability #268](https://github.com/haierkeys/fast-note-sync-service/issues/268) was closed after maintainer directed users to upgrade to `v2.13.8`.

Fast Note Sync is operationally attractive but does not meet the current trust boundary for exposing a personal vault and write-capable agent endpoint to the internet. It remains a candidate only if deployed behind a private network/strict reverse proxy and after the reported security and permission issues are independently resolved.

## Local REST API with MCP

[Local REST API with MCP](https://github.com/coddingtonbear/obsidian-local-rest-api) offers authenticated CRUD, heading/block/frontmatter patches, search, active-file access, periodic notes, commands, and a built-in Streamable HTTP MCP server.

It runs inside Obsidian. It is excellent for a local agent while Obsidian remains open, but it does not by itself provide an always-on VPS vault. Reaching it remotely would add an always-on desktop and secure tunnel, which conflicts with current VPS-first goal.

## `hermes-obsidian-always-on-setup`

The inspected local bundle is a setup guide and small systemd wrapper around paid `obsidian-headless`, not a complete Hermes workflow. It assumes Obsidian Sync, root paths, and an unspecified Hermes gateway restart. It provides no review policy and contains scripts unsuitable for direct production reuse. Retain only its central idea: give Hermes one ordinary synced vault path.

## Community field reports

Reddit evidence below is anecdotal and lower-confidence than project documentation and issue trackers. It is useful for identifying failure modes and usability friction, not proving implementation behavior.

### Self-hosted LiveSync

- A widely used [self-hosting guide](https://www.reddit.com/r/selfhosted/comments/1eo7knj/guide_obsidian_with_free_selfhosted_instant_sync/) has strong positive reports about fast cross-device sync and mobile usability. Its author later documented an endless repair loop after upgrading to `0.25.43`, restored from Markdown backups, and now advises disabling sync, backing up, upgrading every device together, then re-enabling devices one at a time.
- Comments on that guide are mixed: several users report long-running success, while others report unexplained sync failures, app restarts, or eventually moving to Git, Syncthing, or paid Obsidian Sync.
- A newer [iOS and Linux self-hosting thread](https://www.reddit.com/r/selfhosted/comments/1nkkqbk/there_is_any_simple_way_to_self_host_obsidian_sync/) again recommends LiveSync most often, but contains reports of failures after weeks and repeated restores. These reports reinforce backup and upgrade-discipline requirements.
- Community comparison consistently describes LiveSync as better than Git for live mobile synchronization and simultaneous edits. Git remains better suited to independent history and rollback than transport.

### Fast Note Sync

- The developer's [announcement thread](https://www.reddit.com/r/ObsidianMD/comments/1pn3dsg/recommend_a_nearperfect_realtime_note/) receives praise for easy setup and responsive sync.
- The same thread exposes unresolved design questions. The developer says a personal scenario normally has no simultaneous edits and therefore does not require conflict resolution. That assumption is too weak for a multi-device vault where offline and agent edits can overlap.
- Current primary documentation claims automatic offline merge, but the [server roadmap](https://github.com/haierkeys/fast-note-sync-service) still lists optimizing that merge and adding a conflict-resolution mechanism as future work. Therefore, automatic merge is not equivalent to a mature, user-visible conflict workflow.
- One user reports partial synchronization and duplicate notes after case-only renames, then returned to LiveSync. Another notes that full note contents are sent on each file change. These are individual reports, but they weaken any claim that Fast Note Sync is already a production-safe replacement.
- At the time of that thread, `.obsidian` settings were not synchronized. Current plugin documentation now advertises configuration sync as a testing-phase feature, so this limitation has changed but is not yet a stable foundation.

### Hermes and agent-managed vaults

- A popular [Hermes plus Obsidian workflow](https://www.reddit.com/r/hermesagent/comments/1stz6gd/how_i_use_obsidian_as_the_longterm_memory/) validates the low-complexity core: Hermes reads and writes ordinary Markdown, Obsidian remains human-readable, Hermes hot memory holds compact pointers, and the vault stores durable notes.
- Its autonomous routing rules are inspiration, not a safe authorization boundary. The post relies heavily on prompt instructions and contains no demonstrated protection against mistaken filing or edits.
- A separate [Hermes memory integration report](https://www.reddit.com/r/hermesagent/comments/1uhhie3/i_wired_up_gary_tans_gbrain_mcp_server_to_hermes/) says retrieval works when invoked but the model chooses to search or persist information inconsistently, despite strong prompt instructions. Comments report similar model-dependent tool-use misses.
- This supports explicit triggers such as moving a note to `INBOX/Pending Agent Review` or issuing a direct command. Do not depend on Hermes noticing every relevant note or deciding autonomously what deserves persistence.

### Community implications

1. Keep synchronization, independent recovery, agent access, and authorization as separate responsibilities even if one product advertises several of them.
2. Prefer explicit queue state over model initiative for review work.
3. Do not use Git as concurrent mobile sync; use it only on one authoritative filesystem replica for history and rollback.
4. Require a tested restore path before enabling agent writes.
5. Treat LiveSync upgrade coordination as operating procedure, not optional polish.

## Provisional comparison

| Option | Components | Hermes access | Privacy | Current blocker |
|---|---|---|---|---|
| LiveSync + official CLI | Obsidian plugin, CouchDB, CLI daemon, Hermes | Bundled filesystem skill | E2EE intended | Encrypted CLI push bug |
| Fast Note Sync | Obsidian plugin, FNS server, Hermes | Native MCP | Server-readable plaintext | Open security/permission issues |
| Local REST API | Obsidian desktop plugin, Hermes, secure reachability | Native MCP | Local by default | Obsidian must stay running |
| Paid Obsidian Sync + headless | Obsidian Sync, official headless, Hermes | Bundled filesystem skill | First-party E2EE | Subscription rejected |

## Simplification hypothesis for adversarial review

Target design should contain no custom Python service, no custom SQLite proposal state, no OpenViking, and no Telegram capture path. Keep:

1. Obsidian as canonical interface and Markdown library.
2. One existing sync mechanism that exposes a VPS vault or safe MCP endpoint.
3. Hermes with one narrow review workflow skill.
4. `INBOX/Pending Agent Review` as explicit authorization boundary.
5. Git as lightweight history/recovery for Markdown, not transport or approval UI.
6. 9Router only as Hermes model gateway; no pipeline-specific routing service.

Agent output should create a separate proposal note by default. Applying changes to an existing human note remains an explicit Hermes command or approval action. Ordinary notes remain untouched.

## Native Hermes automation finding

Hermes's official [cron feature](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/features/cron.md) can replace both a custom filesystem watcher and a separate operating-system cron script. A recurring job may attach the Obsidian skill, set the vault as `workdir`, run in a fresh session, write local output, and be paused or triggered manually. Hermes itself provides tick locking and an execution ledger.

This does not make prompt policy a hard write sandbox. First release should therefore keep the consequence small: scheduled runs create separate deterministic proposal notes and never apply changes to existing human notes. Duplicate generation is acceptable; silent source mutation is not.

The user selected this native scheduled mode. Sync transport was resolved by the later [reevaluation](../../research/2026-07-22-sync-and-extension-reevaluation.md).
