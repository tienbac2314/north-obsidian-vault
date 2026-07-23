# Failure handling

Status: current failure contract under [system design](../system-design.md).

## Invariants

- Local Obsidian writing never depends on FNS availability, Hermes, 9Router, or internet.
- One whole-vault transport runs against a vault.
- Unknown conflict outcome preserves all recoverable copies and stops promotion.
- Every live attachment byte stays in vault and uses same authority and recovery path as notes.
- FNS history and FNS trash are convenient live-service recovery, not independent backup.
- Ordinary note never authorizes Hermes; synchronized queue placement records intent but authenticated receipt authorizes exact provider read.
- Failure never returns false success or silently deletes source.

## Human pilot matrix

| Failure | Safe behavior | Recovery evidence |
|---|---|---|
| FNS server offline | Continue local writing; show delayed convergence | Reconnect and compare fixture state |
| Windows or Android offline | Keep device-local edits | Delayed reconnect test and final equality |
| Same-note divergent edits | Preserve recoverable versions; no silent winner | Inspect history/conflict behavior and retain both meanings |
| Case-only rename race | Stop promotion on duplicate, loss, or wrong case | Compare both clients, history, trash, and server state |
| Multi-attachment folder move | Preserve every unique byte and reference | Count/hash fixtures before and after |
| Delete while peer offline | Make deletion/history behavior visible | Restore deleted note and attachment |
| Android background suspended | Retain phone-local data; no fake synced state | Battery restriction, screen lock, swipe-away, reboot, delayed reconnect cases |
| FNS process restart | Clients reconnect without lost committed fixture | State counts and convergence after restart |
| FNS upgrade fails | Stop service and restore pinned prior state | Rollback copy plus restored version check |
| FNS database corrupt or lost | Do not continue against empty accidental authority | Empty-path restore and client rebuild |
| External file disappears | Stop any agent/headless promotion | Create external fixture and prove survival before access decision |
| Vault token crosses boundary | Reject all agent/API promotion | Direct negative access test in disposable vault |

## Attachment matrix

| Failure | Safe behavior | Recovery evidence |
|---|---|---|
| Paste, drop, camera, or file selection fails | Source remains outside vault; no empty or broken reference | Repeat capture and inspect resulting local file |
| FNS transfer interrupted | Existing local byte remains authoritative | Reconnect, compare byte hashes, and open on peer |
| Duplicate capture or retry | No unexplained duplicate loop or lost reference | Inspect vault paths, backlinks, and hashes |
| Attachment renamed or moved | Native link remains understandable or visibly broken | Open from both clients and repair only after evidence |
| Attachment deleted while peer offline | No silent resurrection or unrecoverable loss | Inspect trash/history and independent copy |
| Android background transfer stalls | Phone-local file remains; state is not falsely complete | Resume, reconnect, and compare hash manifest |
| Large file exceeds practical transfer limit | Keep original source and stop promotion for that class | Record size, time, error class, and recovery path |
| Cloud Preview unavailable | Local attachment remains open because auto-delete is off | Open both clients while server path is unavailable |

## Later Hermes matrix

| Failure | Safe behavior | Recovery evidence |
|---|---|---|
| Gateway supervisor unstable | No vault access or schedule configured | One authoritative supervisor and sustained health |
| Hermes/9Router timeout, 429, or 5xx | Queue and source unchanged; visible bounded failure | Execution evidence without note body |
| Invalid model output | No proposal or quarantined new proposal only | Source hash unchanged |
| Source changes during generation | Old result cannot overwrite; new identity on rerun | Compare source hash and proposal identity |
| Duplicate scheduled run | Skip matching proposal or create visible duplicate | No source mutation |
| Prompt injection in source | No extra tools, context, credentials, or writes | Security fixture and sanitized tool trace |
| Transport removes external proposal | Stop agent promotion | External-writer survival gate |
| Existing-note edit requested later | Fresh read required; ambiguity stops | Exact target and before/after evidence |
| Synced peer forges queue or `accept` | No provider request or write without matching authenticated receipt | Forged-file fixture and empty executor trace |
| Path traverses, collides, or resolves outside root | Reject whole item before any note read or write | Canonicalization negative fixtures |
| Target changes between preflight and write | Compare-and-swap fails or maintenance window aborts | Original bytes and transaction receipt |
| Executor stops after partial write | Roll back only when current bytes equal journaled executor postimage; otherwise preserve all versions and disable executor | Preimage/postimage journal, post-rollback hashes, and isolated restore |
| Human edits file after executor write before rollback | Never overwrite human edit; mark transaction unknown and stop | Current human version, preimage, executor postimage, and recovery record |
| Weekly and manual scan run same day | Create distinct deterministic run IDs or deduplicate exact identity; never overwrite digest | Create-only result and checkpoint generation |
| Repeated accepted item after crash | Return prior receipt or retry only from original preconditions | One effective transaction identity |

## Recovery order

1. Stop new sync or agent activity when integrity is uncertain.
2. Preserve Windows, Android, and FNS server state before repair.
3. Record sanitized counts and visible error category.
4. Choose one recovery authority; never let newly empty service overwrite surviving clients.
5. Restore FNS into empty isolated path and verify service state.
6. Rebuild one empty client and compare notes, local attachments, history, and trash.
7. Open restored attachments and compare sanitized equality manifest outside live FNS.
8. Re-enable one client at a time; observe convergence before adding another writer.
9. Resume synthetic observation only after cause and recovery are understood.

## Independent backup and restore

Current plan defines outcome, not premature tool lock-in. Backup procedure must:

- stop or quiesce FNS consistently;
- copy FNS storage and required non-secret configuration;
- copy vault notes and every attachment independently of live service;
- preserve public version and count manifest;
- store copy off VPS and outside synchronized vault;
- restore into empty location;
- avoid remote-delete semantics;
- keep credentials and private identifiers outside repository.

Passing copy command is not proof. Empty-path restore, rebuilt client, history/trash inspection, native link opening, and independent byte equality are proof.

## Rollback rules

- Failed FNS gate: shut down FNS for that vault, preserve copies, and stop. Do not add Syncthing alongside it.
- Failed attachment gate: reject personal promotion for affected file class; do not hide failure with a second attachment authority.
- Failed FNS upgrade: restore pinned server state and matching client release before continuing.
- Failed personal-data gate: return to synthetic vault; personal notes remain outside pilot.
- Failed Hermes gate later: disable schedule and access credentials; human Obsidian/FNS system remains useful.
- Failed apply transaction or rollback later: revoke executor, preserve journal and preimages, recover touched files, and keep proposal-only workflow.

## Visibility

Record statuses, public versions, counts, latency bands, recovery duration, warning categories, and pass/fail. Surface oldest non-converged fixture, last successful restore, attachment retry/recovery action, server restart/upgrade result, and seven-day observation status. Never log raw private note bodies, tokens, endpoints, account IDs, or attachment filenames in repository.
