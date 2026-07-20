# Design Obsidian-first personal engineering workspace

## Problem

Copied AI answers, articles, and work discoveries accumulate without own-words understanding, links, or later action. User wants direct Obsidian use, Dusk-inspired PARA/Zettelkasten structure, Hermes assistance only for selected notes, optional OpenViking context, existing 9Router reuse, and free sync.

## Research

- Inspected current repository design and redacted VPS state without changing services or exposing secrets.
- Reviewed official Obsidian, Hermes, Telegram, 9Router, OpenViking, Syncthing, Self-hosted LiveSync, Remotely Save, and Ollama material.
- Used NotebookLM notebook as adversarial reviewer; forced retractions; independently rejected unsupported, contradictory, paid, or invented prescriptions.

## Revised architecture

- Obsidian Markdown is canonical human library and primary input.
- Dusk-inspired structure remains optional; `INBOX/Unsorted` requires no classification.
- `INBOX/Pending Agent Review` requests proposal, never overwrite.
- Deterministic workspace service applies approved proposal with path allowlist, SQLite journal, expected SHA-256, atomic write, validation, idempotency, and Git commit.
- Git audits/rolls back; one tested free sync converges devices; encrypted off-host backup restores disaster loss.
- OpenViking is later explicit manifested projection, never second curated truth.
- 9Router handles permitted replaceable generation/VLM. Embeddings remain exact-model pinned and fail closed.
- Optional Telegram later commits text/link with full-synchronous SQLite WAL before `Saved`; media metadata and attachment durability are separate acknowledgments.

## Sync decision

Test Self-hosted LiveSync versus Remotely Save on actual Windows/Android/VPS clients. Syncthing is fallback because official Android app was discontinued. Paid Obsidian Sync is rejected. Never run two live sync engines or auto-merge conflict copies.

## First release

Vault structure, weekly/monthly growth loop, validated sync, Git, encrypted backup/restore, proposal-only Hermes, deterministic apply, and 9Router privacy/logging policy. OpenViking, Telegram, vectors, Canvas, managed-section writes, and automatic reorganization wait for evidence gates.

## Key risks

Sync conflict/data loss, stale overwrite, agent path escape, review fatigue, restricted-note leakage, 9Router credential/log blast radius, untested restore, OpenViking lifecycle drift, and embedding-model substitution.

## Verification target

Validate Markdown links, Mermaid syntax/rendering, secret/private-endpoint patterns, internal design consistency, Git diff, and PR body. No implementation or running-service change belongs in this PR.
