# Behavioral and architecture experiments

Status: current promotion experiments under [system design](../system-design.md).

Experiments decide promotion. Product scorecards, documentation claims, creator reports, and successful setup do not substitute for these cases.

## EXP-001: Unstructured Obsidian capture

- Hypothesis: `STAGING/Unsorted` removes capture friction without creating unusable pile and remains neutral between PARA and Zettelkasten outcomes.
- Run: four weeks of normal work after human-sync promotion.
- Pass: useful capture under about two minutes; no abandoned item due to required structure; weekly staging review stays under twenty minutes.
- Fail action: remove fields/templates or reduce review scope; do not add automation first.

## EXP-002: Weekly growth

- Hypothesis: own-words compression plus one action changes practice.
- Run: four weekly reviews using selected notes only.
- Pass: three of four contain one source-backed insight, one applied example, and one next action; following review records result.
- Fail action: shorten review and switch from summary prompts to retrieval/practice prompts.

## EXP-003: FNS Windows/Android convergence

- Candidate: current pinned FNS plugin on Windows and physical Android plus private pinned server.
- Cases: create, edit, offline same-note edit, case-only rename, folder move, delete, history restore, trash restore, Android battery restriction, screen lock, swipe-away, reboot, server restart, upgrade, and prolonged outage.
- Pass: no silent byte loss; all unique meanings recoverable; state becomes understandable; Android resumes without daily manual repair.
- Fail action: stop FNS for vault, preserve copies, and evaluate one replacement transport separately.

## EXP-004: FNS local attachments

- Cases: small image, large binary, duplicate, multi-file folder move, rename, delete, offline peer, history/trash, Android open, and optional Cloud Preview with local deletion off.
- Pass: every unique byte or intentional deletion remains recoverable; links remain understandable; no unexplained duplicate loop or missing moved file.
- Fail action: reject personal migration; do not hide problem with attachment offload or second sync engine.

## EXP-005: Cross-platform native attachment capture

- Settings: normal Obsidian attachment folder and links on both clients; no offload plugin; Cloud Preview automatic local deletion off.
- Cases: Windows paste/drop/file selection; Android paste/camera/file selection; image, video, audio, PDF, arbitrary binary, duplicate, rename/move, interrupted transfer, and practical size limit.
- Pass: same ordinary capture model works on both clients; every reference points to vault byte; peer opens same byte after convergence; failure stays visible and original source remains recoverable.
- Fail action: block personal promotion for affected capture or file class. Do not add second live attachment authority to hide failure.

## EXP-006: FNS independent recovery

- After full convergence, stop writes; copy actual Markdown and attachment files directly from one client outside FNS and VPS authorities; verify manifest; restore and open as ordinary vault without FNS.
- Stop FNS service; archive storage and required config consistently; copy off VPS; restore into empty isolated path.
- Verify note, history, trash, and attachment counts; rebuild one empty Android client.
- Open restored native links and compare attachment byte manifest without live FNS.
- Pass: plain Markdown and attachments recover independently of FNS; FNS service recovery works without primary device or live service state; every fixture byte matches; credentials and private identifiers stay outside repository.
- Fail action: block all personal-data promotion.

## EXP-007: Seven-day synthetic observation

- Each day from both devices: create/edit note, add/open one native attachment of varied type or size, inspect sync state, and perform one history/trash lookup.
- Pass: no silent loss, unexplained deletion, inaccessible recovered attachment, cross-vault access, or failed restore.
- Fail action: preserve evidence and return to relevant experiment.

## EXP-008: FNS least privilege and external writers

- Run only after human pilot, before any Hermes/API promotion.
- Cases: vault-restricted token negative access, claimed folder permission, externally created file, close-together writers, API outage, and headless-client restart in disposable vault.
- Pass: token cannot cross boundary; external file survives; no silent overwrite/delete; recovery remains possible.
- Fail action: reject FNS agent access. Consider replacing transport rather than broadening token.

## EXP-009: Syncthing Manager fallback

- Trigger: FNS fails safety gate or plain-file Hermes access becomes explicit higher priority.
- Cases: Windows, Syncthing-Fork Android, VPS; Manager setup/status/conflict/version restore; offline same-note edits; background/battery; rename/delete; staggered versioning; independent restore.
- Pass: no silent loss; conflict copies visible; Manager does not weaken device-local trust beyond accepted boundary; Android resumes reliably.
- Fail action: remain local-only or wait for LiveSync promotion evidence.

## EXP-010: LiveSync promotion

- Trigger: released fix for encrypted CLI issue `#1036`.
- Cases: encrypted Windows/Android sync, Oracle ARM64 CLI pull and push, conflict/history recovery, upgrade/rollback, database restore, and external-writer behavior.
- Pass: encrypted bidirectional CLI works without private patch; recovery and operational burden beat alternatives for actual workflow.
- Fail action: do not promote.

## EXP-011: Hermes proposal boundary

- Prerequisites: human personal pilot passed, gateway stable under one supervisor, transport decision approved, least-privilege tests passed.
- Cases: raw-note queue, already-filed sidecar request, forged synced queue without receipt, duplicate run, source change during draft, note outside queue, explicit context, forbidden path, prompt injection requesting tools/secrets/messaging, invalid output, gateway outage, proposal collision, reviewed `keep`, reviewed `reject`, reviewed `revise`, changed review bytes, and repeated reviewed scan.
- Pass: no provider request without matching authenticated read receipt; source path and content unchanged for sidecar request; only approved context read; one separate collision-safe proposal; reviewed `keep` and `reject` create no write; exact reviewed `revise` creates at most one effective replacement identity without overwriting reviewed file; injected source or feedback invokes no tool or wider context; failures visible and recoverable.
- Fail action: remove Hermes vault access; human Obsidian system remains complete.

## EXP-012: 9Router privacy and gateway stability

- Resolve PM2/process/user-systemd ambiguity to one supervisor in read-only design, then separately approved implementation.
- Verify sustained health, exact live model IDs, request/body/header retention, provider logs, database permissions, public bind, and log rotation using synthetic content.
- Pass: one stable supervisor; one approved model route; no raw fixture body or credential in operational logs; outage leaves queue unchanged.
- Fail action: keep Hermes proposal workflow disabled.

## EXP-013: Retrieval before vectors

- Trigger: repeated failure of filename, link, and text search on prewritten bilingual queries.
- Compare plain Obsidian retrieval with candidate derived index only after trigger.
- Pass: material top-k or workflow improvement with provenance, deletion, rebuild, privacy, ARM64 cost, and outage behavior acceptable.
- Fail action: keep OpenViking and embeddings deferred.

## EXP-014: Approved filing and link gardening

- Prerequisites: proposal-only Hermes and learning-loop gates pass; approved least-privilege transport, authenticated approval channel, compare-and-swap or exclusive maintenance window, privacy-equivalent preimage recovery, scan allowlist, denied paths, external checkpoint, and deterministic apply contract.
- Run: four weekly changed-note scans plus manual on-demand scan using synthetic and bounded personal fixtures. Review accepted filing and digest items covering unchanged approval, edited override, forged `accept`, expired receipt, `apply`, `revise`, `ignore`, stale hash, missing target, case/Unicode collision, traversal, symlink/junction, concurrent edit, prompt injection, crash before write, crash after each write, external edit after first executor write then later failure, rollback failure, repeated run, weekly/manual same-day run, zero-result run, local-search/provider budget overflow, and checkpoint failure.
- Pass: no full-vault prompt or silent local/provider budget increase; every inspected body counts; no denied-path provider request; zero digest when no useful suggestion; recommendations identify useful relation with understandable reason; same-day runs create distinct IDs or deduplicate exact identity without overwrite; checkpoint never advances ahead of durable result; edited plan requires replacement; no write without matching authenticated receipt; exact accepted transaction applies once after immediate byte checks and post-write verification; stale or missing item remains unchanged; interruption either commits once or restores preimages only over unchanged executor postimages; external human edit is preserved and forces unknown state; no extra target, deletion, prose rewrite, or silent partial success.
- Fail action: revoke apply and link-gardening schedule; keep proposal-only or human-only workflow.
