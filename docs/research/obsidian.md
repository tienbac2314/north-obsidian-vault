# Obsidian evaluation

## Verified facts

- Official [Obsidian help](https://help.obsidian.md/Files+and+folders/How+Obsidian+stores+data): vault is local folder; notes are Markdown plain text; external editors may modify files; metadata cache is rebuildable.
- Obsidian therefore supplies portable canonical human artifacts, not durable jobs, compare-and-swap writes, replication, or backup by itself.

## Revised fit

Obsidian is primary interface and canonical human library. This matches actual expected behavior: most material will be pasted or written directly in Obsidian, and only selected notes should involve Hermes.

Vault structure adapts Dusk's PARA/Zettelkasten organization but excludes its old community plugins, scripts, CSS, dashboards, and sample content. `INBOX/Unsorted` removes capture-time taxonomy. `INBOX/Pending Agent Review` is explicit proposal request.

## Sync research

- [Self-hosted LiveSync](https://github.com/vrtmrz/obsidian-livesync) supports self-hosted CouchDB/object-storage modes and warns against combining sync solutions. Recent releases add headless CLI capabilities. Resource use, bootstrap, conflict, and recovery still need Oracle ARM64 tests.
- [Remotely Save](https://github.com/remotely-save/remotely-save) supports several remote storage backends. VPS convergence and conflict semantics need tests.
- [Syncthing Android](https://github.com/syncthing/syncthing-android) official app was discontinued and archived in December 2024. Desktop/VPS remains viable, but Android requires community-client acceptance.
- Git is excellent audit/rollback but awkward default phone sync. Paid Obsidian Sync violates constraint.

## Recommendation

Test LiveSync versus Remotely Save on actual clients. Run one sync engine only. Preserve conflict copies for human resolution. Keep `.git`, volatile `.obsidian` state, service databases, temp files, and agent proposal state out of sync/index contexts as selected design requires.

## Growth structure

Daily note is optional. Weekly review should compress a few items into own words, evidence/application, repeated pattern, next experiment, and project/knowledge links. Monthly review summarizes changed beliefs and demonstrated skill. Templates remain short and optional.
