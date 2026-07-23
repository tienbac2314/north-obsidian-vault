# Simplify Obsidian and Hermes workspace design

## Summary

- Make direct Obsidian writing the primary input and keep Telegram as ordinary Hermes chat only.
- Restrict automatic review to notes moved into `INBOX/Pending Agent Review`.
- Use Hermes native cron plus bundled Obsidian skill instead of custom watcher, workspace service, or workflow database.
- Create separate deterministic proposal notes; never auto-apply changes to human notes.
- Keep existing 9Router as generation gateway.
- Remove OpenViking, embeddings, Telegram ingestion, custom SQLite, Python apply tooling, and elaborate backup machinery from first design.

## Research

- Compared Self-hosted LiveSync CLI, Fast Note Sync MCP, Syncthing, and Local REST API using official sources and community failure reports.
- Challenged a compact 20-source NotebookLM review and recorded explicit retractions where it inherited obsolete design assumptions.
- Confirmed Hermes native scheduled tasks replace both custom watcher and shell cron.
- Preserved unresolved sync decision instead of presenting a future fix as deployable today.

## Repository workflow

- Preserve detailed commits on permanent `research/full-system-design-dev`.
- Generate `research/full-system-design` as one clean commit over `origin/main` using guarded force-with-lease automation.
- Keep volatile progress in `docs/current-state/active-goal.md`, separate from stable contributor rules.

## Remaining gate

Approve sync transport, remaining design sections, and replacement specification before creating implementation plan or changing runtime services.

## Validation

- Workflow integration test in temporary Git repositories.
- Local Markdown-link check.
- Secret scan that never prints matched values.
- Git whitespace check.
