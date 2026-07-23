# Obsidian evaluation

## Verified facts

- Official [Obsidian help](https://help.obsidian.md/Files+and+folders/How+Obsidian+stores+data): vault is local folder; notes are Markdown plain text; external editors may modify files; metadata cache is rebuildable.
- Obsidian therefore supplies portable canonical human artifacts, not durable jobs, compare-and-swap writes, replication, or backup by itself.

## Revised fit

Obsidian is primary interface and canonical human library. This matches actual expected behavior: most material will be pasted or written directly in Obsidian, and only selected notes should involve Hermes.

Vault structure adapts Dusk's PARA/Zettelkasten organization but excludes its old community plugins, scripts, CSS, dashboards, and sample content. `INBOX/Unsorted` removes capture-time taxonomy. `INBOX/Pending Agent Review` is explicit proposal request.

## Sync research

- [Self-hosted LiveSync](https://github.com/vrtmrz/obsidian-livesync) supports self-hosted CouchDB/object-storage modes, end-to-end encryption, and conflict handling. It warns against combining sync solutions and explicitly recommends separate backup.
- Its official [headless CLI](https://github.com/vrtmrz/obsidian-livesync/tree/main/src/apps/cli) can continuously mirror CouchDB into a real VPS vault directory. This removes the previously assumed need for a custom bridge and lets Hermes use its bundled filesystem-first Obsidian skill.
- Current CLI release has a blocking encrypted-write defect: [issue #1036](https://github.com/vrtmrz/obsidian-livesync/issues/1036) reports that E2EE pushes crash under Node. Do not promote it for bidirectional agent edits until fixed and verified on Oracle ARM64.
- [Fast Note Sync](https://github.com/haierkeys/fast-note-sync-service) combines sync, history, trash, attachments, Git automation, REST, and native MCP. Its Obsidian plugin has Excellent Health and Passed Review, but E2EE remains future work and open authorization/correctness reports require a bounded pilot.
- [Local REST API with MCP](https://github.com/coddingtonbear/obsidian-local-rest-api) provides strong targeted editing and search while Obsidian is running. It does not create an always-on VPS replica.
- [Remotely Save](https://github.com/remotely-save/remotely-save) supports several remote storage backends. VPS convergence and conflict semantics need tests.
- [Syncthing Android](https://github.com/syncthing/syncthing-android) official app was discontinued and archived in December 2024. [Syncthing-Fork](https://github.com/researchxxl/syncthing-android/releases) remains maintained but needs physical-device validation.
- Syncthing preserves concurrent edits as propagated `.sync-conflict-*` files and supports per-device versioning for remote changes. These are useful plain-file safety properties, not proof of Android background reliability.
- [Syncthing Manager](https://github.com/gustjose/obsidian-syncthing-manager) adds status, conflict diff, versioning, restore, and control UI inside Obsidian. It reduces usability cost but does not change core conflict or backup semantics.
- Git is excellent audit/rollback but awkward default phone sync. Paid Obsidian Sync violates constraint.

## Recommendation

Current design selects FNS for an isolated Windows and Android human-sync pilot because integrated setup, history, trash, and attachments best fit daily Obsidian use. FNS MCP, REST, headless clients, and Hermes access remain disabled until authorization, external-writer, conflict, and restore gates pass. If FNS fails or plain-file Hermes access becomes dominant, replace it with Syncthing core plus Syncthing Manager. LiveSync remains a mature promotion candidate after encrypted CLI issue `#1036` is fixed and ARM64-tested.

Detailed evidence: [2026-07-22 sync and extension reevaluation](2026-07-22-sync-and-extension-reevaluation.md).

## Growth structure

Daily note is optional. Weekly review should compress a few items into own words, evidence/application, repeated pattern, next experiment, and project/knowledge links. Monthly review summarizes changed beliefs and demonstrated skill. Templates remain short and optional.
