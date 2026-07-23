# Capture-to-growth behavior

Status: current product behavior under [system design](../system-design.md).

## Direct capture

Write or paste directly into Obsidian. Use obvious destination when known; otherwise use `STAGING/Unsorted`. This general capture space replaces Dusk's `ZETA/FLEETING` role without assuming every raw note will become Zettelkasten knowledge; it may instead move to PARA or trash. Target is roughly two minutes for raw capture. No template, property, summary, taxonomy, daily page, or agent call is required.

A rough note may contain copied AI output, article fragments, code, screenshots, attachment links, questions, and incomplete thoughts. Capture is successful when future self can identify source and why it mattered. It does not need to be polished.

## Attachment capture on Windows and Android

Use platform-native Obsidian actions: paste, drop, or select on Windows; paste where supported, capture, or select on Android. Store attachment under `SYSTEM/Media` and keep normal vault-relative links or embeds. Attachment byte remains in vault, and FNS synchronizes both note and file.

Do not route live attachments through Drive, S3, CDN, or external-folder plugin. Gestures may differ by platform, but vault-local outcome, link model, privacy, byte authority, and recovery path must match. Keep Cloud Preview automatic local deletion off.

For important or large material, retain original source until peer opens synchronized file and byte equality is checked. Interrupted transfer, Android background delay, unsupported capture action, or practical size limit must stay visible; retry FNS without creating a second live authority.

## Triage without ceremony

During weekly staging pass:

1. delete obvious junk only by human choice;
2. move actionable material to project or area when destination is clear;
3. leave useful reference in resources;
4. move raw `STAGING/Unsorted` note worth synthesis to `STAGING/Pending Agent Review`, or create sidecar request there for already-filed note, after Hermes is promoted;
5. do not force every note into permanent form.

FNS history and trash may help inspect changes. They do not decide meaning or retention.

## Request agent review later

Queue behavior stays disabled during human-sync pilot. After explicit promotion:

- raw note may move from `STAGING/Unsorted` into `STAGING/Pending Agent Review`;
- already-filed note stays at canonical path while sidecar request names exact source path and optional context; trusted approval step calculates source SHA-256.

Queue state records intent, not actor identity. Before provider read, user confirms exact request through authenticated Hermes channel or approved trusted local adapter. Local receipt outside synchronized vault binds request bytes, source bytes, context, workflow version, and expiry. Scheduled workflow processes only matching receipt, then creates separate proposal in `STAGING/Agent Proposals`.

Useful proposal normally contains:

- concise own-words explanation;
- source facts separated from interpretation;
- why it matters to current work;
- example, caveat, or failure mode;
- one practice or next action;
- suggested links and optional destination.

Source content is never silently overwritten, moved, renamed, deleted, merged, or filed. Raw source may already have moved when user queued it; canonical source referenced by sidecar remains in place. Proposal identity derives from canonical source path plus exact content hash and workflow version. Matching work can be skipped; changed source produces new visible proposal.

Proposal ends with `Decision: pending` and optional `Feedback:` under `## Human review`. User changes decision to `keep`, `revise`, or `reject`, writes feedback when useful, and moves proposal into `STAGING/Reviewed`. This is explicit permission for Hermes to read review. Only `revise` authorizes one new proposal; `keep` and `reject` authorize no automated write. First manual edit makes whole proposal human-owned, and Hermes never overwrites it. Updating existing human note requires explicit command naming exact target and change, followed by fresh read.

Leave raw source in `STAGING/Pending Agent Review` while requesting revision; leave canonical source named by sidecar at original path. After `keep` or `reject`, user moves raw source to PARA, Zettelkasten, `STAGING/Unsorted`, or trash and removes sidecar when no longer needed. Kept proposal becomes ordinary human material only when user moves or rewrites it into chosen destination. `STAGING/Reviewed` is visible feedback staging, not permanent knowledge and not hidden agent memory.

## Weekly review

Weekly review remains human-started and small. Select useful notes or links instead of processing every changed file. Produce:

1. strongest lessons in own words;
2. one repeated confusion, blocker, or pattern;
3. something applied, shipped, debugged, or observed;
4. one next experiment or behavior change;
5. links to relevant project, area, or permanent note.

Target is rereadable evidence, not a complete activity log. If review exceeds about twenty minutes or feels like cleanup debt, reduce selected notes and template size.

## Monthly review

Compress selected weekly reviews into:

- changed beliefs;
- demonstrated skills;
- recurring risks or blockers;
- abandoned ideas and why;
- next deliberate practice.

AI may draft from explicitly selected material after agent promotion. User accepts wording and decides links.

## Approved filing and link gardening later

After proposal-only and learning-loop gates pass, user may mark exact filing and dependent-note link patches in reviewed proposal. Separate weekly changed-note gardener may recommend missing links in one digest without scanning whole vault daily. Both require authenticated one-time approval of immutable reviewed hash and deterministic transactional executor with canonical paths, concurrency control, preimages, post-write verification, and rollback. Neither is active in human pilot or proposal-only Release 3.

Full later behavior: [Hermes approved apply and link gardening](hermes-apply-and-link-gardening.md).

## Failure behavior

- FNS unavailable: keep writing locally.
- Attachment transfer delayed: keep local source, retry FNS, and verify peer bytes before cleanup.
- Android delayed: do not assume convergence; check before editing same note on another device.
- Hermes/9Router unavailable later: queued note waits unchanged.
- Sync conflict: preserve versions and resolve manually before agent processing.

## Out of scope

Telegram remains ordinary Hermes chat, not Obsidian capture. No OpenViking, embeddings, Canvas generation, automatic filing, background note mutation, or second sync engine enters current workflow.
