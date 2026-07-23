# Interaction examples

Status: current behavior examples under [system design](../system-design.md).

## Normal rough note

User pastes long AI answer into `STAGING/Unsorted/java-pool.md`, adds source URL and one sentence about current bug. Hermes does nothing. Note remains useful while FNS, VPS, 9Router, or internet are offline.

## Pasted screenshot on Windows

User presses paste. Obsidian creates normal vault image and embed. FNS sends note and image byte to Android. Android opens native embed offline after convergence.

## Video added on Android

User selects video through normal Android Obsidian file action. Byte stays in vault and FNS transfers it to Windows. User keeps original source until Windows opens file and pilot records byte equality.

## Sensitive PDF

User adds employer-derived PDF. FNS server would receive readable byte, so user excludes it from synthetic pilot and later personal use unless policy permits that disclosure. Separate offload plugin does not make it acceptable.

## Attachment transfer failure

Large attachment remains on source client while FNS transfer stalls. User keeps original external source, records visible error class, retries FNS, and compares bytes after peer receives it. Broken reference, false synchronized state, or silent loss fails pilot.

## FNS outage

Server becomes unavailable. Windows and Android remain locally writable. User avoids editing same note on both devices until service recovers. Convergence state is checked before normal multi-device work resumes.

## Offline same-note conflict

Windows and Android edit same synthetic note offline, then reconnect. Pilot records whether FNS merges, preserves history, duplicates, or loses content. Any unrecoverable meaning or silent winner stops promotion.

## Case-only rename

Windows renames `API.md` to `api.md`; Android later edits it. Both clients, FNS history/trash, attachment links, and final path are inspected. Duplicate or lost note fails gate.

## Attachment rename and restore

User renames or moves synthetic attachment through Obsidian, then reconnects offline peer. Both notes must reference understandable path and same byte. User then deletes and restores fixture through tested FNS/independent recovery path. Silent resurrection, broken embed, or changed byte fails pilot.

## Request review later

After Hermes promotion, user moves raw `STAGING/Unsorted` note into `STAGING/Pending Agent Review`. For already-filed note, user leaves it in place and creates sidecar request containing exact canonical path. Hermes shows calculated source hash and context through authenticated channel; user confirms queued request. Scheduled workflow processes only matching approval receipt and creates separate proposal under `STAGING/Agent Proposals` with own-words explanation, relevance, caveat, practice step, links, and human-review block. Source content remains unchanged.

## Duplicate scheduled run later

Scheduler sees same source path, exact hash, and workflow version. Existing deterministic proposal identity means skip. If race still creates duplicate, both remain visible; no source mutation occurs.

## Source changes during later review

Source hash changes after generation starts. Result remains separate and is marked or understood as tied to old hash. Later run creates new proposal identity. Old result cannot overwrite source.

## Human review requests revision later

User changes proposal review block to `Decision: revise`, adds concrete feedback, and moves proposal to `STAGING/Reviewed`. Whole note is human-owned. Hermes reads exact reviewed proposal and, if original source remains available under approved path and hash boundary, creates new collision-safe proposal in `STAGING/Agent Proposals`. It never overwrites reviewed proposal or source. Repeated scan of same review bytes creates no second effective revision identity.

## Human review keeps or rejects later

User sets `Decision: keep` or `Decision: reject` and moves proposal to `STAGING/Reviewed`. Hermes may read recorded decision but performs no write. User files kept material and source into PARA or Zettelkasten as appropriate, returns unfinished material to `STAGING/Unsorted`, or deletes rejected material. Folder movement never grants permission to modify existing human notes.

## Accepted filing after Release 4A

Proposal displays `ZETA/Permanent/Connection Pool Saturation.md` plus additive links for two named existing notes. User checks unchanged plan, changes decision to `accept`, and moves proposal to `STAGING/Reviewed`. Hermes shows reviewed hash and exact summary through authenticated channel. User confirms one-time receipt. Executor fresh-reads destination and both targets. One target hash changed, so whole accepted proposal transaction remains unchanged and records stale preflight failure. It creates no final note, discovers no replacement target, and deletes no source.

## Weekly missing-link review after Release 4A

User manually files several notes during week. Weekly changed-note job searches approved PARA/ZETA roots within hard filename-enumeration, local body-read, provider-byte, request, recommendation, and time limits. It creates one collision-safe `STAGING/Agent Proposals/YYYY-MM-DD Link Review <run-id>.md` containing exact recommendations. Manual run same day receives different scan-kind identity or deduplicates identical input; neither overwrites. User marks useful item `apply`, another `revise`, and rest `ignore`, then moves digest to `STAGING/Reviewed`. Hermes presents digest hash through authenticated channel. User confirms selected immutable items once. Deterministic executor applies exact valid item once and creates replacement recommendation only for revised item.

## Explicit existing-note update later

User interactively asks Hermes to update named note. Hermes rereads exact target immediately before proposing or patching. If target changed or instruction is ambiguous, it stops. Scheduled review never uses this path.

## Gateway outage later

Hermes gateway or 9Router fails. Queued note waits unchanged. Visible execution state reports failure without note body. Obsidian and FNS continue.

## Telegram chat

User may ask Hermes ordinary questions through Telegram. Chat does not create or update Obsidian note. Telegram ingestion remains separate postponed design.
