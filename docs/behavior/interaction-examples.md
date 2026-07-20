# Interaction examples

## Normal note

User pastes long AI answer into `INBOX/Unsorted/java-pool.md`. Sync/Git may copy/checkpoint it. Hermes does nothing.

## Request review

User moves note to `INBOX/Pending Agent Review`. Hermes creates proposal that shortens answer, labels source versus interpretation, adds application to current project, suggests one practice step, and proposes `ZETA/LITERATURE`. Source file remains unchanged.

## Concurrent edit

User changes source after proposal. Approval sees base hash mismatch, marks proposal stale, and asks to regenerate. New text is never overwritten.

## Agent-created report

Hermes creates disposable research draft under `SYSTEM/AGENT PROPOSALS`. Automatic creation is allowed. Publishing it as canonical project/resource note requires approval.

## 9Router outage

User continues writing and syncing. Queued agent review waits. No note changes and no data loss.

## OpenViking outage

Vault stays available. Projection manifest shows drift. Hermes may use exact file inspection for simple work or delay context-heavy proposal.

## Sync conflict

Two devices edit same note offline. Sync preserves conflict version. Hermes excludes conflict file and creates no proposal until user resolves it.

## Optional Telegram

User sends screenshot while 9Router is down. Ingress commits raw message/metadata to full-synchronous SQLite, then says `Saved metadata; attachment pending`. After bytes/checksum persist it says `Attachment saved`. OCR/proposal waits and runs once after service recovery.
