# Executive summary

Obsidian is now primary workspace, not future projection. Write normal Markdown without structure; use `INBOX/Unsorted` when destination is unclear. Moving note to `INBOX/Pending Agent Review` requests Hermes proposal but never authorizes silent overwrite.

Dusk-inspired PARA and Zettelkasten folders remain optional navigation. Growth comes from weekly own-words compression and one changed action, then monthly synthesis—not daily page volume.

First production-worthy release includes vault structure, one tested free sync method, Git audit, encrypted off-host backup/restore, proposal-only Hermes, deterministic hash-checked writes, and permitted 9Router generation. Existing notes remain human-owned. Git does not infer ownership, replace sync, or replace backup.

OpenViking becomes later read-only, rebuildable projection with explicit manifest. Optional Telegram uses full-synchronous SQLite ingress: text/link `Saved` follows commit, while media metadata and attachment durability are acknowledged separately. Hermes/OpenViking/9Router stay downstream. Embeddings are exact-model pinned and fail closed; compare dedicated 9Router route with local `embeddinggemma`. Never use model combos for vectors.

Main open decision is free sync: test Self-hosted LiveSync against Remotely Save on actual Windows/Android/VPS workflow. Syncthing is not preferred because official Android app is discontinued. Private/work notes need explicit policy before any external model call.

Read [system design](system-design.md), [workspace specification](superpowers/specs/2026-07-20-obsidian-openviking-workspace-design.md), [MVP](roadmap/mvp.md), and [decision log](decisions/decision-log.md).
