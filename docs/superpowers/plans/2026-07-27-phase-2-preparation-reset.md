# Phase 2 Preparation Reset Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Produce one lean Phase 1-complete repository state, one verified cold archive of failed Phase 2 material, and one safe handoff for future Phase 2 Execution.

**Architecture:** Keep current `main` history and implement recovery on `docs/phase2-preparation-reset`. Promote only concise current authority and historical lessons; keep raw evidence outside active repository use. Copy and verify every cleanup target before requesting exact destructive approval.

**Tech Stack:** Git, GitHub CLI, Windows PowerShell 5.1, Markdown, existing repository checks, external NTFS archive on `G:`.

## Global Constraints

- Base commit is `571fde461571d842c3912964f86adfa9b0314092`; base tree is `ac711cdb04e368b28480ae389b3142ce5e44f5f3`.
- Work only on `docs/phase2-preparation-reset` in `C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline-phase2-reset`.
- Do not rewrite or commit directly to `main`.
- Do not run Obsidian, ADB, Android, FNS, package installers, or Computer Use during recovery.
- Do not modify `G:\Obsidian`, `C:\Users\TienBac\Documents\New project\dusk-obsidian-vault-master`, either immutable Dusk source archive, device state, FNS state, personal notes, or credentials.
- Treat old Phase 2 evidence as diagnostic history, never fresh acceptance.
- Use `Dusk_light` as future behavioral reference; consider `Dusk_light_empty` later; allow at most three full-Dusk gap experiments after a proven need.
- Use one main implementer. Use one Sol xhigh agent only for read-only recovery review. Future UI execution may use at most one Luna visual Computer Use subagent.
- Create `G:\Dusk-Phase2-Cold-Archive-20260727` copy-first. No source deletion, branch deletion, worktree removal, PR closure, or remote mutation before exact user approval.
- Before each phase, reread `CURRENT-STATE.md`, `DECISIONS.md`, `DESTRUCTIVE-ACTIONS.md`, and `RESUME.md` under `C:\Users\TienBac\Documents\New project\Dusk-Phase2-Recovery-State`.
- Update durable recovery state after every logical commit, archive verification, reviewer cycle, approval boundary, destructive action, and pause.
- Every commit uses conventional lowercase subject of at most 50 characters.

## Exact cleanup target set

No item below is approved for deletion until Task 6 receives explicit user
approval. No target outside this set may enter the manifest.

Repository paths:

```text
.codex/agents/dusk-release-reviewer.toml
.codex/agents/dusk-runtime-debugger.toml
.codex/agents/dusk-source-inventory.toml
.codex/agents/obsidian-plugin-auditor.toml
.codex/agents/obsidian-visual-qa.toml
docs/superpowers/plans/2026-07-24-dusk-subagents.md
docs/superpowers/specs/2026-07-24-dusk-subagents-design.md
```

Registered worktrees:

```text
C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline\.worktrees\docs-phase2-reversal
C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline\.worktrees\dusk-goal1-discovery
C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline\.worktrees\obsidian-phase2
```

Local and remote branches:

```text
codex/docs-phase2-reversal
docs/dusk-goal1-discovery
feat/dusk-subagents
feat/fns-release-one
feat/obsidian-phase2
research/full-system-design
research/full-system-design-dev
```

External directories and files:

```text
G:\Dusk-Goal1-Discovery-20260725
G:\Dusk Audit
C:\Users\TienBac\Documents\New project\From ChatGPT Web Sol 5.6 High\1
C:\Users\TienBac\Documents\New project\From ChatGPT Web Sol 5.6 High\2
C:\Users\TienBac\Documents\New project\From ChatGPT Web Sol 5.6 High\3-desperate handoff
C:\Users\TienBac\Documents\New project\north-obsidian-vault-main-with-worktrees.zip
G:\Apply-Dusk-Four-Commit-Audit-Windows.ps1
G:\dusk-doc-archive-update.zip
G:\dusk-goal1-archive-stale-handoff.patch
G:\dusk-goal1-contact-sheet-triage.patch
G:\dusk-goal1-corrected-audit-deliverables-20260726.zip
G:\Dusk-Goal1-Discovery-20260725 (1).rar
G:\Dusk-Goal1-Discovery-20260725.rar
G:\dusk-goal1-discovery-v4.zip
G:\dusk-goal1-full-evidence-review-fixes.patch
G:\dusk-goal1-full-evidence-review-fixes.patch.lnk
G:\dusk-goal1-hotkey-review-fixes.patch
G:\dusk-goal1-portable-audit.bundle
G:\dusk-goal1-portable-audit-deliverables-20260726 (1).zip
G:\dusk-goal1-portable-audit-deliverables-20260726 (2).zip
G:\dusk-goal1-portable-audit-deliverables-20260726.zip
G:\dusk-goal1-proposed-fixes.zip
G:\dusk-goal1-remove-stale-agent-constraints.patch
G:\dusk-goal1-resolution-update.zip
G:\dusk-goal1-screenshot-resolution-and-skill-routing.patch
G:\dusk-goal1-v2-review-fixes.patch.lnk
G:\dusk-goal1-v3-reviewed-changes.zip
G:\dusk-lean-restart-handoff-20260726.zip
G:\dusk-reference-image-catalog.jsonl
G:\fix-evidence-contact-sheet-discovery-windows.patch
G:\fix-evidence-contact-sheet-empty-resolution-values.patch
G:\fix-evidence-contact-sheet-expected-failures.patch
G:\fix-evidence-contact-sheet-tests.patch
```

GitHub state: close draft PR #7 only after confirming head
`3cd0c80e5637bec7c9b34c4ffdaac53b79774201`.

---

### Task 1: Promote reset authority

**Files:**

- Modify: `docs/architecture/phase-2-preparation-reset.md`
- Replace: `docs/active-goal.md`
- Modify: `docs/roadmap/phased-roadmap.md`
- Modify: `docs/decisions/decision-log.md`
- Modify: `docs/README.md`

**Interfaces:**

- Consumes: approved reset specification at commit `90420258ee4582ff67b3b8186e155101f96b5752`.
- Produces: DEC-040, concise active goal, and one unambiguous project-phase/release mapping used by every later task.

- [ ] **Step 1: Mark exact specification approved**

Replace its status paragraph with:

```markdown
Status: approved on 2026-07-27. This design governs repository recovery and
Phase 2 Preparation; it does not authorize Phase 2 Execution or live promotion.
```

- [ ] **Step 2: Replace active goal with concise current checkpoint**

Keep these exact sections and facts:

```markdown
# Active goal

Updated: 2026-07-27

## Objective

Complete Phase 2 Preparation: preserve the completed Phase 1 FNS foundation,
remove failed Phase 2 machinery from active use, retain its useful lessons in
one verified cold archive, and leave one executable future-validation handoff.

Status: Phase 1 foundation complete. Phase 2 Preparation is active. No Dusk
source, plugin set, desktop result, Android result, or live promotion is
currently accepted.

## Stage mapping

- Phase 1: existing FNS foundation and current safe baseline. This does not
  claim every roadmap Release 1 exit gate passed.
- Phase 2 Preparation: source choice, design, archive, test contract, and
  approval. It performs no native validation.
- Phase 2 Execution: future disposable desktop and Android validation,
  correction, and promotion decision.
- Roadmap Release 0 through Release 5 remain evidence gates, not aliases for
  project phases.

## Current authority

- [DEC-039](decisions/decision-log.md#dec-039-archive-hand-built-phase-2-and-restart-import-first)
  preserves the reversal of closed PR #4.
- [DEC-040](decisions/decision-log.md#dec-040-reset-phase-2-preparation)
  selects current `main` as recovery base and makes old Phase 2 evidence
  historical only.
- [Phase 2 Preparation reset](architecture/phase-2-preparation-reset.md)
  defines source, validation, archive, safety, and review boundaries.
- [Implementation plan](superpowers/plans/2026-07-27-phase-2-preparation-reset.md)
  defines exact recovery order.

## Next action

Finish verified cold archive and review. Request exact destructive approval.
Run only approved cleanup, verify repository and archive again, then publish
the future-agent handoff without merging to `main`.

## Safety

- Do not revive PR #4 or PR #7.
- Do not treat historical screenshots or plugin state as current acceptance.
- Do not modify source vaults, `G:\Obsidian`, FNS, personal data, credentials,
  or device state during recovery.
- No Phase 2 Execution begins until recovery finishes and a later session
  refreshes current Dusk GitHub, Discord, plugin, desktop, and Android evidence.

## Authority

- [Documentation map](README.md)
- [System design](system-design.md)
- [Recommended architecture](architecture/recommended-architecture.md)
- [Evidence-gated roadmap](roadmap/phased-roadmap.md)
- [Decision log](decisions/decision-log.md)
- [Phase 1 implementation evidence](research/2026-07-23-fns-implementation-evidence.md)
- [Phase 2 reversal](archive/2026-07-24-phase-2-reversal.md)
```

- [ ] **Step 3: Add project-stage mapping to roadmap**

Insert after roadmap status paragraphs and before `## Program map`:

```markdown
## Project-stage mapping

Project stages describe current work; releases describe promotion evidence.
They are related but not interchangeable.

| Project stage | Current meaning | Release effect |
|---|---|---|
| Phase 1 | Existing FNS foundation and safe baseline | Does not waive incomplete Release 1 gates |
| Phase 2 Preparation | Dusk source, design, archive, and future test contract | Promotes no release |
| Phase 2 Execution | Disposable desktop and Android validation plus promotion decision | Must satisfy applicable Release 1 and Release 2 gates |
```

- [ ] **Step 4: Append DEC-040**

Append:

```markdown
## DEC-040: Reset Phase 2 Preparation

- Status: Accepted.
- Decision: Recover from current `main` without rewriting history. Use project
  stages Phase 1, Phase 2 Preparation, and Phase 2 Execution while preserving
  roadmap Release 0 through Release 5 as separate promotion gates.
- Source: Use populated `Dusk_light` as future behavioral reference. Consider
  `Dusk_light_empty` only after comparison. Do not run full Dusk as a second
  end-to-end candidate; permit at most three bounded experiments for proven
  gaps.
- Evidence: Treat PR #4, PR #7, audit packages, old screenshots, and old plugin
  state as historical diagnostics. Future acceptance requires fresh disposable
  desktop and Android evidence.
- Operation: Remove obsolete five-agent orchestration and its two generated
  documents from the candidate tree. Preserve recoverable copies in the cold
  archive before any external cleanup.
- Safety: Recovery performs no Obsidian, ADB, Android, FNS, package-installer,
  Computer Use, live-vault, source-vault, personal-data, or credential change.
  Every external deletion, branch deletion, worktree removal, PR closure, and
  remote mutation requires an exact reviewed manifest and separate approval.
- Review: One main implementer owns decisions and edits. One fresh Sol xhigh
  reviewer checks recovery read-only. Future UI work may use at most one Luna
  visual Computer Use subagent under the main agent.
- Design: [Phase 2 Preparation reset](../architecture/phase-2-preparation-reset.md).
```

- [ ] **Step 5: Add direct decision-map link**

Change current Decisions navigation to:

```markdown
- Decisions: [decision log](decisions/decision-log.md),
  [DEC-040 Phase 2 Preparation reset](decisions/decision-log.md#dec-040-reset-phase-2-preparation),
  and [unresolved questions](decisions/unresolved-questions.md).
```

Do not add a new index file.

- [ ] **Step 6: Run documentation checks**

Run:

```powershell
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
git diff --check
```

Expected: link check passes with every tracked Markdown file reachable; secret
scan passes without printing values; whitespace check prints nothing.

- [ ] **Step 7: Commit authority**

```powershell
git add docs/active-goal.md docs/architecture/phase-2-preparation-reset.md docs/roadmap/phased-roadmap.md docs/decisions/decision-log.md docs/README.md
git commit -m "docs(phase2): reset preparation authority"
```

Expected: one commit and clean worktree.

### Task 2: Distill historical lessons

**Files:**

- Create: `docs/archive/2026-07-27-phase-2-preparation-lessons.md`
- Modify: `docs/archive/README.md`

**Interfaces:**

- Consumes: historical PR #4/PR #7 evidence and verified Dusk onboarding observations.
- Produces: one non-authoritative lessons record before any obsolete file is removed.

- [ ] **Step 1: Create one historical lessons record**

Use these sections and claims:

```markdown
# Phase 2 Preparation historical lessons

Status: historical synthesis. These observations identify future tests; none
passes a current desktop, Android, plugin, or promotion gate.

## Source behavior worth preserving

- Easy/manual first-open setup and populated `Dusk_light` behavior.
- PARA/ZETA split; Home, Map of Content, and Mail Box surfaces.
- Page tasks and area/project family relationships.
- Daily, weekly, monthly, project, area, resource, archive, fleeting, and
  permanent note creation.
- Dynamic actions, templates, hotkeys, search, desktop/mobile Home, and mobile
  sorting.

## Visual method

- Maximize desktop Obsidian and verify native desktop/tablet resolution.
- Capture a screenshot before leaving each checkpoint.
- Scroll vertical and horizontal surfaces completely.
- Use editing/source mode to inspect configuration and reading view to judge
  rendered behavior.
- Inspect full templates and every section, not recent files or Home alone.

## Android and plugin risks to retest

- Initial import may disable compatible plugins; update first, then retry each
  plugin except proven desktop-only or unsafe plugins.
- Android daily new-note creation previously failed around template/Journals/
  Templater behavior. Test it first, then weekly and monthly creation.
- Dataview JavaScript queries were disabled in one observed Android state;
  verify actual current setting rather than importing stale configuration.
- DatacoreJS appeared promising on tablet but lacked complete verification.
- Plugin command and hotkey identifiers drift across versions.
- Refresh current Dusk GitHub and Discord extension changes before choosing a
  plugin set.

## Evidence and safety

- Identify exact source, candidate, device, mode, checkpoint, and timestamp.
- Record actual plugin load state and relevant settings after updates.
- Use disposable vaults and synthetic notes only.
- Restore or discard every synthetic write with proof.
- Exclude credentials, plugin `data.json` secrets, personal notes, source
  mutation, `G:\Obsidian`, and FNS changes.

## What stays historical

PR #4, PR #7, old screenshots, packages, patches, dashboards, contact sheets,
validators, and five-agent orchestration remain archive material. Future agents
may reuse questions and regression ideas, not old acceptance conclusions.
```

- [ ] **Step 2: Link historical lessons**

Add lessons under `docs/archive/README.md` abandoned-attempt history. Leave
obsolete Dusk-subagent files and index entries present until verified archive,
review, and exact approval.

Use this exact link:

```markdown
- [2026-07-27 Phase 2 Preparation historical lessons](2026-07-27-phase-2-preparation-lessons.md)
```

- [ ] **Step 3: Validate and commit**

Run link, secret, and whitespace checks from Task 1. Then:

```powershell
git add docs/archive/README.md docs/archive/2026-07-27-phase-2-preparation-lessons.md
git commit -m "docs(phase2): distill failed attempt lessons"
```

Expected: checks pass and worktree is clean.

### Task 3: Build and verify cold archive

**Files:**

- Create externally: `G:\Dusk-Phase2-Cold-Archive-20260727\README.md`
- Create externally: `G:\Dusk-Phase2-Cold-Archive-20260727\SOURCE-MANIFEST.csv`
- Create externally: `G:\Dusk-Phase2-Cold-Archive-20260727\SHA256SUMS.csv`
- Create externally: archive subdirectories `git`, `worktrees`, `external`, `state`, and `verification`
- Modify externally: durable recovery-state files after verification

**Interfaces:**

- Consumes: exact refs and external targets in `KEEP-ARCHIVE-DELETE.md`.
- Produces: independently verifiable archive required before any destructive approval.

- [ ] **Step 1: Revalidate paths and free space without broad drive listing**

Run `Test-Path`, `Get-Item`, and `Get-PSDrive G` only for exact named targets.
Abort if archive root already exists, any required source unexpectedly vanished,
or available space is below twice total source bytes.

Use:

```powershell
$archiveRoot = 'G:\Dusk-Phase2-Cold-Archive-20260727'
if (Test-Path -LiteralPath $archiveRoot) {
    throw "Archive root already exists: $archiveRoot"
}
$drive = Get-PSDrive -Name G
if ($drive.Free -lt 3GB) {
    throw "Archive safety floor failed: $($drive.Free) free bytes"
}
```

Compute exact source bytes from target set and raise `3GB` if twice measured
bytes is larger. Expected: root absent and free bytes above safety floor.

- [ ] **Step 2: Create fixed archive layout**

Create only:

```text
G:\Dusk-Phase2-Cold-Archive-20260727\git
G:\Dusk-Phase2-Cold-Archive-20260727\worktrees
G:\Dusk-Phase2-Cold-Archive-20260727\external
G:\Dusk-Phase2-Cold-Archive-20260727\state
G:\Dusk-Phase2-Cold-Archive-20260727\verification
```

Use:

```powershell
$archiveRoot = 'G:\Dusk-Phase2-Cold-Archive-20260727'
New-Item -ItemType Directory -Path $archiveRoot | Out-Null
@('git', 'worktrees', 'external', 'state', 'verification') | ForEach-Object {
    New-Item -ItemType Directory -Path (Join-Path $archiveRoot $_) | Out-Null
}
```

- [ ] **Step 3: Preserve Git graph and unique unreachable commit**

Create and verify one `--all` repository bundle. Create binary patches and
`git archive` ZIP snapshots for these exact refs:

```text
codex/docs-phase2-reversal
feat/dusk-subagents
feat/fns-release-one
research/full-system-design
feat/obsidian-phase2
docs/dusk-goal1-discovery
research/full-system-design-dev
```

Create a dedicated archive, commit metadata record, and binary patch for
`f97eff4816156f7138682ec6dca23d9d21cc7317`. Verify every recorded commit and
tree with `git cat-file -e` and every bundle with `git bundle verify`.

Export PR #7 metadata, body, comments, and reviews to `git\pr-7.json` with
`C:\Program Files\GitHub CLI\gh.exe`. Verify its repository, draft/open state,
base `main`, and head SHA
`3cd0c80e5637bec7c9b34c4ffdaac53b79774201`. Do not close it.

Core Git commands:

```powershell
$archiveRoot = 'G:\Dusk-Phase2-Cold-Archive-20260727'
$gitArchive = Join-Path $archiveRoot 'git'
git bundle create (Join-Path $gitArchive 'repository-all-refs.bundle') --all
git bundle verify (Join-Path $gitArchive 'repository-all-refs.bundle')

$refs = @(
    'codex/docs-phase2-reversal',
    'feat/dusk-subagents',
    'feat/fns-release-one',
    'research/full-system-design',
    'feat/obsidian-phase2',
    'docs/dusk-goal1-discovery',
    'research/full-system-design-dev'
)
foreach ($ref in $refs) {
    $safe = $ref.Replace('/', '__')
    $base = git merge-base main $ref
    git diff --binary --full-index "--output=$(Join-Path $gitArchive "$safe.patch")" "$base..$ref"
    git archive --format=zip "--output=$(Join-Path $gitArchive "$safe.zip")" $ref
}

$lost = 'f97eff4816156f7138682ec6dca23d9d21cc7317'
git archive --format=zip "--output=$(Join-Path $gitArchive 'unreachable-f97eff4.zip')" $lost
git diff-tree --root --binary --full-index --patch "--output=$(Join-Path $gitArchive 'unreachable-f97eff4.patch')" $lost
git cat-file commit $lost | Set-Content -LiteralPath (Join-Path $gitArchive 'unreachable-f97eff4.commit.txt') -Encoding UTF8
```

Expected: each command exits 0 and archive contains one bundle, seven branch
patches, seven branch ZIPs, and three unreachable-commit artifacts.

- [ ] **Step 4: Preserve clean historical worktree snapshots**

Recheck porcelain status for:

```text
C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline\.worktrees\docs-phase2-reversal
C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline\.worktrees\dusk-goal1-discovery
C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline\.worktrees\obsidian-phase2
```

Abort on any dirty line. Record each HEAD and tree, then retain the matching Git
archive from Step 3 as its clean snapshot.

- [ ] **Step 5: Copy exact external evidence**

Copy these directories with `robocopy /E /COPY:DAT /DCOPY:T /R:1 /W:1 /XJ` and
treat exit codes 0 through 7 as success:

```text
G:\Dusk-Goal1-Discovery-20260725
G:\Dusk Audit
C:\Users\TienBac\Documents\New project\From ChatGPT Web Sol 5.6 High\1
C:\Users\TienBac\Documents\New project\From ChatGPT Web Sol 5.6 High\2
C:\Users\TienBac\Documents\New project\From ChatGPT Web Sol 5.6 High\3-desperate handoff
```

Copy the one worktree ZIP and all 27 loose `G:` files from exact cleanup target
set into collision-free named destinations. Copy recovery-state directory into
`state`. Never copy `G:\Obsidian`, source vault, `G:\Dusk.zip`, or
`G:\dusk-obsidian-vault-master.zip` as task evidence.

Use exact pairs:

```powershell
$archiveRoot = 'G:\Dusk-Phase2-Cold-Archive-20260727'
$directoryCopies = @(
    @('G:\Dusk-Goal1-Discovery-20260725', (Join-Path $archiveRoot 'external\dusk-goal1-discovery')),
    @('G:\Dusk Audit', (Join-Path $archiveRoot 'external\dusk-audit')),
    @('C:\Users\TienBac\Documents\New project\From ChatGPT Web Sol 5.6 High\1', (Join-Path $archiveRoot 'external\package-1')),
    @('C:\Users\TienBac\Documents\New project\From ChatGPT Web Sol 5.6 High\2', (Join-Path $archiveRoot 'external\package-2')),
    @('C:\Users\TienBac\Documents\New project\From ChatGPT Web Sol 5.6 High\3-desperate handoff', (Join-Path $archiveRoot 'external\package-3-desperate-handoff')),
    @('C:\Users\TienBac\Documents\New project\Dusk-Phase2-Recovery-State', (Join-Path $archiveRoot 'state\recovery-state'))
)
foreach ($pair in $directoryCopies) {
    robocopy $pair[0] $pair[1] /E /COPY:DAT /DCOPY:T /R:1 /W:1 /XJ
    if ($LASTEXITCODE -gt 7) { throw "Robocopy failed for $($pair[0]): $LASTEXITCODE" }
}
```

Copy 28 file sources with unchanged unique filenames:

```powershell
$fileSources = @(
    'C:\Users\TienBac\Documents\New project\north-obsidian-vault-main-with-worktrees.zip',
    'G:\Apply-Dusk-Four-Commit-Audit-Windows.ps1',
    'G:\dusk-doc-archive-update.zip',
    'G:\dusk-goal1-archive-stale-handoff.patch',
    'G:\dusk-goal1-contact-sheet-triage.patch',
    'G:\dusk-goal1-corrected-audit-deliverables-20260726.zip',
    'G:\Dusk-Goal1-Discovery-20260725 (1).rar',
    'G:\Dusk-Goal1-Discovery-20260725.rar',
    'G:\dusk-goal1-discovery-v4.zip',
    'G:\dusk-goal1-full-evidence-review-fixes.patch',
    'G:\dusk-goal1-full-evidence-review-fixes.patch.lnk',
    'G:\dusk-goal1-hotkey-review-fixes.patch',
    'G:\dusk-goal1-portable-audit.bundle',
    'G:\dusk-goal1-portable-audit-deliverables-20260726 (1).zip',
    'G:\dusk-goal1-portable-audit-deliverables-20260726 (2).zip',
    'G:\dusk-goal1-portable-audit-deliverables-20260726.zip',
    'G:\dusk-goal1-proposed-fixes.zip',
    'G:\dusk-goal1-remove-stale-agent-constraints.patch',
    'G:\dusk-goal1-resolution-update.zip',
    'G:\dusk-goal1-screenshot-resolution-and-skill-routing.patch',
    'G:\dusk-goal1-v2-review-fixes.patch.lnk',
    'G:\dusk-goal1-v3-reviewed-changes.zip',
    'G:\dusk-lean-restart-handoff-20260726.zip',
    'G:\dusk-reference-image-catalog.jsonl',
    'G:\fix-evidence-contact-sheet-discovery-windows.patch',
    'G:\fix-evidence-contact-sheet-empty-resolution-values.patch',
    'G:\fix-evidence-contact-sheet-expected-failures.patch',
    'G:\fix-evidence-contact-sheet-tests.patch'
)
$looseRoot = Join-Path $archiveRoot 'external\loose-files'
New-Item -ItemType Directory -Path $looseRoot | Out-Null
foreach ($source in $fileSources) {
    $destination = Join-Path $looseRoot ([IO.Path]::GetFileName($source))
    if (Test-Path -LiteralPath $destination) { throw "Collision: $destination" }
    Copy-Item -LiteralPath $source -Destination $destination
    if (-not (Test-Path -LiteralPath $destination)) { throw "Copy missing: $destination" }
}
```

- [ ] **Step 6: Generate manifests without printing content**

`SOURCE-MANIFEST.csv` must contain source path, archive-relative path, item
type, byte count, file count, classification, and intended post-approval
action. `SHA256SUMS.csv` must contain archive-relative file path, byte count,
and SHA-256 for every archived file except `SHA256SUMS.csv` itself. Sort both
files ordinally by relative path.

Generate checksums with:

```powershell
$archiveRoot = 'G:\Dusk-Phase2-Cold-Archive-20260727'
$rows = Get-ChildItem -LiteralPath $archiveRoot -Recurse -File |
    Where-Object { $_.FullName -ne (Join-Path $archiveRoot 'SHA256SUMS.csv') } |
    ForEach-Object {
        [pscustomobject]@{
            RelativePath = $_.FullName.Substring($archiveRoot.Length + 1)
            Bytes = $_.Length
            SHA256 = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash
        }
    } |
    Sort-Object RelativePath
$rows | Export-Csv -LiteralPath (Join-Path $archiveRoot 'SHA256SUMS.csv') -NoTypeInformation -Encoding UTF8
```

Expected: one checksum row per archived file other than checksum file itself.

- [ ] **Step 7: Verify copy equality and restore path**

Compare source and destination file counts, total bytes, and per-file SHA-256
for every copied target. Clone the repository bundle into
`verification\bundle-restore`, verify every preserved ref SHA, and extract the
`docs/dusk-goal1-discovery` snapshot into
`verification\worktree-restore`. Verify restored tree identity against
`3cd0c80e5637bec7c9b34c4ffdaac53b79774201^{tree}`.

- [ ] **Step 8: Record archive result**

Write archive `README.md` with purpose, created time, source/base SHAs,
exclusions, bundle verification commands, restoration commands, and explicit
statement that archive is historical evidence only. Update durable state with
archive counts, bytes, manifest hashes, restore result, and any excluded item.

Expected: zero mismatch, zero unclassified target, source trees unchanged.

### Task 4: Prepare exact destructive manifest

**Files:**

- Replace externally: `C:\Users\TienBac\Documents\New project\Dusk-Phase2-Recovery-State\DESTRUCTIVE-ACTIONS.md`
- Modify externally: `CURRENT-STATE.md`, `KEEP-ARCHIVE-DELETE.md`, and `RESUME.md`

**Interfaces:**

- Consumes: verified archive manifest and archive restoration proof.
- Produces: exact approval packet; performs no destructive command.

- [ ] **Step 1: List candidate-tree deletions already proposed**

Record seven repository paths from exact cleanup target set with candidate
commit and cold archive location. Status remains `NOT APPROVED` until reviewer
and user act.

- [ ] **Step 2: List exact external filesystem cleanup**

Record the two evidence directories, three package directories, one worktree
ZIP, and 27 loose `G:` files from exact cleanup target set. Include
resolved absolute source, archive destination, source/archive counts and bytes,
manifest hash, recoverability command, exact PowerShell removal command, and
`NOT APPROVED`.

- [ ] **Step 3: List exact Git and GitHub cleanup**

Record:

- removal of three registered historical worktrees;
- deletion of these seven local branches: `codex/docs-phase2-reversal`,
  `docs/dusk-goal1-discovery`, `feat/dusk-subagents`, `feat/fns-release-one`,
  `feat/obsidian-phase2`, `research/full-system-design`, and
  `research/full-system-design-dev`;
- remote deletion of seven archived branches;
- closure of draft PR #7 after confirming head `3cd0c80e5637bec7c9b34c4ffdaac53b79774201`;
- retention of `main`, `docs/phase2-preparation-reset`, PR #3, PR #4, PR #5,
  PR #6, source archives, source vault, live vault, and recovery state.

Every row must name prerequisite archive evidence, precondition, exact command,
rollback, approval, and result. Do not execute commands.

- [ ] **Step 4: Check manifest completeness**

Compare manifest targets against `KEEP-ARCHIVE-DELETE.md` in both directions.
Expected: zero missing and zero extra destructive target.

### Task 5: Run one independent recovery review

**Files:**

- Modify externally: `REVIEW-FINDINGS.md`, `CURRENT-STATE.md`, and `RESUME.md`
- Modify repository files only if reviewer proves a Critical or Important defect

**Interfaces:**

- Consumes: approved spec, implementation plan, current candidate diff,
  proposed cleanup set, archive README/manifests, destructive manifest, and
  durable recovery state.
- Produces: one severity-ranked read-only review from a fresh Sol xhigh agent.

- [ ] **Step 1: Invoke requesting-code-review**

Dispatch exactly one `dusk-release-reviewer`-role agent with model
`gpt-5.6-sol`, xhigh reasoning, and read-only task text. Do not dispatch any
other agent. Packet must include exact paths, candidate/base SHAs, scope,
non-goals, verification output, and request for Critical/Important findings
only.

- [ ] **Step 2: Evaluate findings technically**

Use `receiving-code-review`. Verify each finding against files or commands.
Record accepted, rejected-with-evidence, and fixed findings in
`REVIEW-FINDINGS.md` without copying secrets or raw logs.

- [ ] **Step 3: Fix accepted findings atomically**

Apply smallest fix, rerun affected checks, and commit with one logical subject.
Send same reviewer exact new diff and verification evidence. Repeat until no
Critical or Important finding remains.

### Task 6: Request and execute exact cleanup approval

**Files:**

- Modify: `docs/generated-work-index.md`
- Delete: seven repository paths in exact cleanup target set
- Modify externally: destructive and recovery-state files
- External targets: only exact approved manifest rows

**Interfaces:**

- Consumes: reviewer-cleared manifest and verified archive.
- Produces: clean repository/worktree/remote/external state with restoration path retained.

- [ ] **Step 1: Ask one exact approval question**

Present short totals plus clickable destructive manifest. State retained items
and recovery path. Do not treat earlier general cleanup approval as approval.

- [ ] **Step 2: Revalidate before each approved action group**

Resolve absolute targets, compare current source identity/count/hash to manifest,
verify archive copy, and stop that group on drift. Never use a computed broad
directory, wildcard, `$HOME`, or workspace root as destructive target.

- [ ] **Step 3: Remove approved obsolete repository files**

Use `apply_patch` to delete only seven repository paths in exact cleanup target
set. Remove only their two links from `docs/generated-work-index.md`; keep this
2026-07-27 plan entry. Run:

```powershell
rg -n -i 'dusk-(release-reviewer|runtime-debugger|source-inventory)|obsidian-(plugin-auditor|visual-qa)|2026-07-24-dusk-subagents' README.md docs .codex
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
git diff --check
```

Expected: `rg` returns no active reference and all checks pass. Commit:

```powershell
git add .codex/agents docs/generated-work-index.md docs/superpowers
git commit -m "docs(phase2): retire swarm machinery"
```

- [ ] **Step 4: Execute only approved external rows**

Use native PowerShell `Remove-Item -LiteralPath` for exact filesystem targets,
`git worktree remove` for exact clean registered worktrees, `git branch -d` for
verified local branches, `git push origin --delete` for exact remote branches,
and GitHub CLI to close exact PR #7. Record command, timestamp, exit status, and
postcondition per row.

- [ ] **Step 5: Verify retained and removed state**

Confirm every approved target absent, every unapproved target present,
`main` still at starting SHA/tree, candidate branch present, archive manifests
still hash correctly, and restoration commands still pass. Refresh archived
copy of durable recovery state, regenerate `SHA256SUMS.csv`, and verify it again
so archive records post-cleanup result.

### Task 7: Publish final handoff and verify branch

**Files:**

- Create: `docs/phase-2-preparation-handoff.md`
- Modify: `docs/README.md`
- Modify externally: all required recovery-state files

**Interfaces:**

- Consumes: final verified candidate, archive, review, and cleanup results.
- Produces: concise future-session entrypoint; no merge to `main`.

- [ ] **Step 1: Invoke handoff skill**

Create a project-state-only handoff. Include read order, exact current branch
and commit, Phase 1 versus roadmap caveat, approved Dusk source strategy,
archive location and restoration proof, unresolved native validation, safety
boundaries, and first Phase 2 Execution action. Exclude model advice except the
explicit main-agent plus one Luna visual-subagent constraint requested by user.

- [ ] **Step 2: Add documentation-map link**

Link handoff from current checkpoint section of `docs/README.md`. Do not create
another index or dashboard.

- [ ] **Step 3: Run full repository verification**

Run:

```powershell
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/test-markdown-links.ps1
powershell -NoProfile -File scripts/test-initialize-vault-template.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
powershell -NoProfile -File scripts/check-mermaid.ps1
git diff --check
```

Expected: all commands exit 0; all Markdown reachable; values never printed;
all Mermaid diagrams render.

- [ ] **Step 4: Commit handoff**

```powershell
git add docs/README.md docs/phase-2-preparation-handoff.md
git commit -m "docs(phase2): add execution handoff"
```

- [ ] **Step 5: Verify final identity and publish branch**

Record candidate HEAD/tree, clean status, base ancestry, `main` SHA/tree, full
verification output, archive manifest hashes, review result, and cleanup result.
Push only `docs/phase2-preparation-reset`. Do not merge, close recovery branch,
or create a PR unless user separately requests it.
