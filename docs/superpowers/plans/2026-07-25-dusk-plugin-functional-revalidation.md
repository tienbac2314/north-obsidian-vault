# Dusk Plugin Functional Revalidation Plan

Status: incomplete execution record. Independent functional review returned
FAIL. Current findings and blockers live in
[Dusk plugin functional revalidation](../../research/2026-07-25-dusk-plugin-functional-revalidation.md).

> **For agentic workers:** REQUIRED SUB-SKILL: Use
> superpowers:subagent-driven-development (recommended) or
> superpowers:executing-plans to implement this plan task-by-task. Steps use
> checkbox (`- [ ]`) syntax for tracking.

**Goal:** Correct PR #7 with functional Windows and physical-Android evidence
after compatible plugin updates, deliberate enablement, safe non-secret
configuration, and reading-view surface tests.

**Architecture:** Preserve every prior and user-edited vault. Clone current
post-update copies into new functional-rerun roots, classify plugins before
enablement, and keep credential-bearing data absent. Use Obsidian UI/runtime
state and reading-view screenshots as authority; installed manifests and
`community-plugins.json` are supporting evidence only.

**Tech Stack:** Obsidian 1.12.7, PowerShell 5.1, ADB, Android 14, Chromium
DevTools Protocol, Markdown evidence, GitHub PR #7.

## Global Constraints

- Never modify `G:\Obsidian`, PC source, or tablet source.
- Preserve current user-edited Android `Dusk_light` before testing.
- Never read or copy another source community-plugin `data.json`.
- Never copy `.obsidian/todoist-token` or any credential-bearing file.
- Keep FNS, Obsidian Sync, publishing, and production accounts disconnected.
- Test notes in reading view; capture write mode only to explain source code.
- Network/credential plugins receive isolated idle-load gates without account
  setup, publishing, sharing, or note submission.
- Raw logs, screenshots, and manifests stay outside Git under
  `G:\Dusk-Goal1-Discovery-20260725\functional-rerun`.

---

### Task 1: Preserve and classify runtime state

**Files:**

- Create:
  `G:\Dusk-Goal1-Discovery-20260725\functional-rerun\checkpoints\`
- Create:
  `G:\Dusk-Goal1-Discovery-20260725\functional-rerun\manifests\`

**Interfaces:**

- Consumes: corrected Windows vaults and current user-edited Android vaults.
- Produces: immutable pretest archives, file manifests, and three plugin sets:
  compatible-local, desktop-only, and network/credential-gated.

- [ ] Record branch, device, app, source, live-vault, and disk invariants.
- [ ] Force-stop exact disposable Obsidian process and close desktop Obsidian.
- [ ] Archive current Android `Dusk_light` before any clone or test.
- [ ] Create file and enabled-plugin manifests without note-body output.
- [ ] Classify all light and full plugin IDs; record why each excluded plugin
  is desktop-only or separately gated.
- [ ] Verify archives restore to equal manifests.

### Task 2: Create functional-rerun copies

**Files:**

- Create:
  `G:\Dusk-Goal1-Discovery-20260725\functional-rerun\desktop-vaults\`
- Create:
  `/sdcard/Documents/Dusk-Goal1-Functional-Rerun-20260725/`

**Interfaces:**

- Consumes: Task 1 checkpoints.
- Produces: four isolated post-update vaults with zero copied credentials and
  independent platform configuration.

- [ ] Clone corrected PC light/full and current Android light/full.
- [ ] Rename vault folders uniquely so Obsidian registry selection is explicit.
- [ ] Confirm plugin versions remain 47/47 light and 57/57 full.
- [ ] Confirm no token, FNS, sync, publishing, or risky credential path exists.
- [ ] Save pre-enable manifests and rollback archives.

### Task 3: Revalidate Windows plugins and reading view

**Files:**

- Create:
  `G:\Dusk-Goal1-Discovery-20260725\functional-rerun\logs\windows-*.json`
- Create:
  `G:\Dusk-Goal1-Discovery-20260725\functional-rerun\screenshots\windows-*.png`

**Interfaces:**

- Consumes: Task 2 desktop copies and classified plugin sets.
- Produces: actual load state, console errors, idle network observations, and
  reading-view results for both variants.

- [ ] Capture failing baseline in reading view before configuration repair.
- [ ] Enable every compatible local plugin; include desktop-only plugins only
  on Windows.
- [ ] Enable Dataview JavaScript and inline JavaScript through fresh,
  non-secret runtime configuration.
- [ ] Test Datacore and other required local settings one field at a time.
- [ ] Reload and record actual loaded IDs, not only enabled-list membership.
- [ ] Open Home, Map, Mail Box, project, area, daily, weekly, monthly, Getting
  Started, and template in reading view.
- [ ] Gate BRAT, Custom Frames, Todoist, Digital Garden, and Share Note one at a
  time without credentials or feature invocation; record load and idle egress.
- [ ] Restore desktop Obsidian registry and close application.

### Task 4: Revalidate Android plugins and reading view

**Files:**

- Create:
  `G:\Dusk-Goal1-Discovery-20260725\functional-rerun\logs\android-*.txt`
- Create:
  `G:\Dusk-Goal1-Discovery-20260725\functional-rerun\screenshots\android-*.png`

**Interfaces:**

- Consumes: Task 2 Android copies and Task 3 known-good settings.
- Produces: actual load state, logcat evidence, reading-view screenshots,
  mobile-only exclusions, and restart timing.

- [ ] Capture current user-edited light behavior in reading view as reference.
- [ ] Open cloned light/full copies and record first corrected load.
- [ ] Keep Quick Explorer, Status Bar Organizer, and Image Toolkit off where
  their manifests exclude mobile.
- [ ] Enable every other compatible local plugin and repair Dataview/Datacore
  settings one field at a time.
- [ ] Reload, force-stop, and cold-start; record exact loaded/failed IDs and
  sanitized errors.
- [ ] Open all ten major surfaces in reading view and capture portrait evidence.
- [ ] Confirm DatacoreJS output renders rather than exposing source code.
- [ ] Run isolated idle-load gates for network/credential plugins without
  credentials or user-content submission.
- [ ] Restore orientation, force-stop app, and preserve posttest manifests.

### Task 5: Amend PR #7 and publish review guide

**Files:**

- Create: `docs/research/2026-07-25-dusk-plugin-functional-revalidation.md`
- Create: `docs/research/2026-07-25-dusk-pr-review-guide.md`
- Modify: `docs/research/2026-07-25-dusk-goal1-discovery.md`
- Modify: `docs/research/2026-07-25-dusk-goal1-review.md`
- Modify: `docs/research/2026-07-25-dusk-runtime-evidence.md`
- Modify: `docs/active-goal.md`
- Modify: `docs/README.md`

**Interfaces:**

- Consumes: Tasks 1-4 exact evidence.
- Produces: corrected verdict, TL;DR, human review sequence, verified commit,
  and amended PR #7.

- [ ] State the prior validation gap and source-configuration boundary breach.
- [ ] Separate installed, enabled, loaded, configured, and surface-working
  evidence.
- [ ] Write TL;DR with safe defaults, failures, and decisions needing user
  personalization.
- [ ] Write a command-free review guide ordered by screenshots and short
  documents.
- [ ] Obtain independent review against this plan and the user's reading-view
  correction.
- [ ] Run all repository checks plus source/live/disposable invariants.
- [ ] Commit, push normally, update PR body, and mark PR ready only after review
  passes.

## Self-Review

- Spec coverage: preserves user Android edits; tests PC and Android; distinguishes
  enabled from loaded; uses reading view; gates network features; adds TL;DR and
  review guide; amends PR #7.
- Placeholder scan: no unresolved implementation placeholder remains.
- Interface consistency: each task consumes immutable outputs from the prior
  task and writes raw evidence outside Git.
