# Dusk_light Datacore-Permanent Debloat Implementation Plan

> **For the main session:** Use `executing-plans` for inline execution. Do not
> dispatch subagents or create another canonical wave. Main session owns
> disposable mutations, verification, Git, evidence, and publication.

**Goal:** Port every remaining DataviewJS surface to Bases or permanent
Datacore ownership, disable Day Planner on both disposable platforms, remove
Dataview only after parity proof, and finish the overlap-plugin audit without
changing Dusk_light's main flow.

**Architecture:** Bases owns simple file/property tables. Datacore owns
complex JavaScript views, task/date aggregation, progress views, and custom
Mail Box/Map of Content surfaces. Tasks remains the inline-task owner.

**Tech Stack:** Obsidian 1.13.4, core Bases, Datacore 0.1.29, Tasks,
Templater, Meta Bind, QuickAdd, Journals, native Computer Use, direct ADB,
PowerShell, Git, existing Part 2 validators, and process-local 9router
Graphify.

## Accepted structure-simplification amendment (2026-08-12)

This is a continuation of the current Personalization/debloat program. It is
not a new wave, canonical Task 7/8/9, or full-Dusk import.

User accepted the ChatGPT Web design-gate defaults with one correction:

- Keep inactive Project/Area families under `PARA/ARCHIVES`.
- Keep `WORKSTATION` through dependency inventory. Do not promote it as a new
  generic capture destination while the audit runs.
- Preserve `permanent_note`, `literature_note`, and `fleeting_note` values.
- Treat `RESOURCES/CONCEPT MAP` as a legacy candidate, not a permanent new
  content category. `RESOURCES/KNOWLEDGE` becomes the default home for
  reusable learning and reference content.
- Inventory Concept Map before moving or deleting anything. Keep Canvas,
  Excalidraw, navigation/MOC, and other behavior-bearing items in place until
  their current owner and Windows/Android contract are proven. Move only
  content classified as reusable Knowledge after collision, link, template,
  query, and creation-flow checks pass.

The intended visible structure is:

```text
HUB/
PARA/PROJECTS/
PARA/AREAS/
PARA/RESOURCES/CONTACTS/
PARA/RESOURCES/DOCUMENTATIONS/
PARA/RESOURCES/MEETINGS/
PARA/RESOURCES/KNOWLEDGE/
PARA/ARCHIVES/
INBOX/
DAILY/
STICKY/
SYSTEM/
```

`CONCEPT MAP` is omitted from this target only as a future owner. Existing
files remain untouched until inventory proves whether they are reusable
Knowledge, active MOCs, Canvas/Excalidraw assets, or legacy residue. No
blanket ZETA move, silent content rewrite, or irreversible deletion is
authorized by this amendment.

### Structure audit continuation

Before any structure mutation, inspect the exact Windows disposable and
registered Android target for:

1. Concept Map file types, embeds, links, MOC behavior, Canvas/Excalidraw
   destinations, commands, and visible navigation.
2. `WORKSTATION` templates, Templater folder rules, QuickAdd destinations,
   Note Toolbar mappings, Meta Bind actions, Bases, Datacore, Tasks queries,
   scripts, and literal path filters.
3. Existing `PARA/ARCHIVES` move/restore behavior and every path-bearing
   reference that would be affected by Knowledge or archive placement.
4. Destination collisions, duplicate-basename links, pre-existing broken
   links, and literal path strings before creating a per-file migration
   manifest.

Classify each item as `KEEP_MOC`, `MOVE_TO_KNOWLEDGE`, `KEEP_ACTIVE_AREA`,
`KEEP_WORKSTATION`, or `LEGACY_REVIEW`. `LEGACY_REVIEW` never means delete by
default. Record baseline rows and representative Windows/Android acceptance
tests before moving the first note. Notebook Navigator remains a separate
post-migration pilot and cannot be used to justify structure or plugin
removal.

### Structure inventory result and migration map (2026-08-12)

Read-only inventory found 9 ZETA notes, 3 Concept Map Excalidraw Markdown
files, 6 Workstation notes, no Knowledge/INBOX, empty PARA/ARCHIVES, and no
destination basename collisions on the exact Windows disposable. Android
serial 01234ABC exposes the same 39 enabled community plugin IDs.

Accepted map:

- Move ZETA permanent, literature, and fleeting notes to matching
  PARA/RESOURCES/KNOWLEDGE subfolders. Preserve note-type values and internal
  links.
- Move populated and empty Concept Map Excalidraw Markdown files to
  PARA/RESOURCES/KNOWLEDGE root. Remove only the redundant empty owner after
  link/config checks.
- Keep PARA/WORKSTATION, PARA/ARCHIVES, and STICKY.
- Create INBOX as one unprocessed-capture owner.
- Update QuickAdd, Templater, Note Toolbar, Excalidraw, Canvas, View Mode,
  Iconic, Bookmarks, Bases, Homepage/Mobile Homepage, and onboarding paths.
  Generated caches are refreshed by Obsidian, not hand-edited.
- Apply Windows first. Mirror Android only after Windows creation, link,
  Base, Excalidraw, and capture regression passes.

Manifest and baseline summary are outside Git at
G:/Dusk-Knowledge-Hub/payload/evidence/Dusk-Phase2-Preparation-Part2-Runtime/checkpoints/PERSONALIZATION-STRUCTURE-20260812/.

## Global Constraints

- Use only Windows disposable `W5-INTEGRATED-UPDATED-LIGHT-20260803` and
  registered Android serial `01234ABC`.
- Keep product `main`, protected source trees, personal/live vaults, and
  `C:\Users\TienBac\.codex\worktrees\bf23\personal-knowledge-pipeline`
  untouched.
- Keep Datacore permanently for complex views and Bases for simple tables.
- Keep inactive Project/Area families under `PARA/ARCHIVES`; do not introduce
  a new root-level `ARCHIVES` owner.
- Treat existing `RESOURCES/CONCEPT MAP` content as legacy-candidate input to
  the structure audit. Do not delete it or move it to `KNOWLEDGE` without
  per-file classification and link/consumer checks.
- Keep `WORKSTATION` during the audit and do not make it a new generic user
  capture recommendation beside `STICKY` and `INBOX`.
- Keep Tasks, Templater, Meta Bind, QuickAdd, Journals, project templates, and
  project-note creation unless a later verified owner replacement exists.
- Disable `obsidian-day-planner` on both exact disposable targets; do not
  uninstall it in this program step.
- Remove Dataview only after zero `dataview`, `dataviewjs`, `dv.view`, and
  `dv.pages` consumers remain in runtime notes and templates.
- Preserve Dusk navigation, buttons, tabs, frontmatter, task actions, and
  project creation flow.
- Windows accepted captures use native `1920x1040` JPEG. Android accepted
  captures use native `1200x2000` PNG.
- Treat initial indexing/loading separately from settled behavior.
- Keep raw screenshots and rollback snapshots outside Git.
- Before each new Computer Use `node_repl` call, close
  `sky.transport`; pass returned Window objects unchanged. If refresh fails,
  use `js_reset`, re-import `@oai/sky`, and list/select/capture in one call.
- For Graphify, use process-local `OPENAI_BASE_URL` from `9router_base_url`,
  `OPENAI_API_KEY` from `9router_api_key`, `OPENAI_MODEL=graphify`, backend
  `openai`; never print or persist secret values.
- Do not begin future canonical waves or create a new wave/task hierarchy.

## Files and ownership map

### Control and product authority

- Modify only current authority in the Part 2 repository:
  `G:\Dusk-Knowledge-Hub\payload\repos\Dusk-Phase2-Preparation-Part2-20260729\state\ACTIVE-CONTEXT\CURRENT.md`,
  `state\ACTIVE-CONTEXT\DECISIONS.md`, `state\RESUME.md`,
  `state\RESULT-LEDGER.md`, and relevant existing coverage CSVs.
- Publish only compact current status and verified repair references to:
  `C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline-phase2-reset\docs\active-goal.md`,
  `docs\dusk-light-getting-started.md`, and existing linked authority files.
- Keep raw runtime evidence under:
  `G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime`.

### Windows disposable content

Root:
`G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime\disposables\W5-INTEGRATED-UPDATED-LIGHT-20260803`

Known migration surfaces:

- `HUB\Homepage.md`
- `HUB\Mail Box.md`
- `HUB\Map of Content.md`
- `SYSTEM\MOBILE HUB\Mobile Homepage.md`
- `SYSTEM\MOBILE HUB\Mobile Mail Box.md`
- `SYSTEM\MOBILE HUB\Mobile Map of Content.md`
- `SYSTEM\TEMPLATE\FORMAT\template_weekly_note.md`
- `SYSTEM\TEMPLATE\FORMAT\template_monthly_note.md`
- `SYSTEM\TEMPLATE\CSS\Calendar\Calendar View.md`
- `SYSTEM\TEMPLATE\CSS\Timeline\Tasks Manager.md`
- Existing `DAILY\WEEKLY\*.md` and `DAILY\MONTHLY\*.md` notes that the
  inventory command identifies as containing DataviewJS.

Windows profile:
`G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime\profiles\W5-INTEGRATED-UPDATED-LIGHT-20260803`

### Android disposable content

Registered vault:
`/storage/emulated/0/Documents/Dusk-Phase2-Preparation-Part2-Android-V1-20260801`

Use serial `01234ABC`, package `md.obsidian`, direct ADB, and the existing
native Android workflow. Do not reinstall Obsidian or use scrcpy.

## Implementation steps

### Step 1: Freeze identity and create rollback checkpoint

**Files:**

- Create raw checkpoint directory outside Git under
  `G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime\checkpoints\PERSONALIZATION-E7-DATACORE-DEBLOAT-20260810`.
- Modify existing Part 2 checkpoint ledgers only after the snapshot succeeds.

**Actions:**

- Verify Part 2 HEAD/tree, product reset HEAD/tree, clean status, branch names,
  remote URL, and untouched product `main`/`bf23`.
- Verify Windows executable, profile path, vault path, Obsidian PID, and
  returned Computer Use Window object.
- Verify Android serial, package, PID, foreground activity, and registered
  vault path.
- Copy changed Windows `.md` files, `.obsidian\plugins\datacore`,
  `.obsidian\plugins\obsidian-day-planner`, relevant plugin lists, and
  product/runtime manifests into the checkpoint.
- Copy the same Android plugin/config files with direct ADB.
- Record SHA-256 values in `CHECKPOINT-IDENTITY.txt` and preserve the file
  outside Git.

**Verification:**

```powershell
rtk git status --short
rtk git rev-parse HEAD
rtk git rev-parse --verify 'HEAD^{tree}'
adb -s 01234ABC shell pidof md.obsidian
adb -s 01234ABC shell dumpsys activity activities | findstr md.obsidian
```

Expected result: exact disposable identities, clean control/product
repositories, Android foreground `md.obsidian/.MainActivity`, and a complete
rollback snapshot.

**Commit:** Commit the identity-only authority update with
`docs: checkpoint Datacore debloat`.

### Step 2: Build the canonical consumer inventory

**Files:**

- Create external `DATAVIEW-DATACORE-INVENTORY.csv` in the Step 1 checkpoint.
- Update existing `state\RESULT-LEDGER.md`, `state\RESUME.md`, and relevant
  coverage rows; do not create a duplicate ledger.

**Actions:**

- Run the following against the exact Windows disposable:

```powershell
rg -n -i "dataviewjs|datacorejsx|dv\.view|dv\.pages|calendar-timeline|tasks" --glob "*.md" .
```

- Group duplicate blocks by output contract:
  Homepage progress/timeline, weekly due/completed, monthly date-window,
  Calendar/Timeline wrappers, template copies, and existing Datacore JSX.
- Record source file, line/block identity, current owner, intended owner,
  source/version/config/platform contract, and acceptance test.
- Count every group and confirm the total matches the static audit: 21
  DataviewJS, four Datacore JSX, and 178 Tasks blocks.

**Verification:**

- No file outside the exact disposable is included.
- Every DataviewJS match belongs to one named group.
- Existing Datacore surfaces are marked protected, not migration targets.

**Commit:** Commit the inventory authority update with
`docs: map Datacore migration consumers`.

### Step 3: Disable Day Planner on both platforms

**Files:**

- Windows `.obsidian\community-plugins.json` and
  `.obsidian\plugins\obsidian-day-planner\data.json` through the exact
  disposable UI/config path.
- Android matching plugin list/config through direct ADB.
- External checkpoint manifest and existing result/coverage ledgers.

**Actions:**

- Disable `obsidian-day-planner` in Windows Obsidian using the plugin settings
  surface; close/reopen the disposable and confirm disabled state.
- Apply the same disabled state to Android; restart the registered vault.
- Do not delete its manifest, settings, or payload.
- Recheck daily note creation, Journals, Tasks editing, date navigation, and
  Mobile Homepage navigation.

**Verification:**

- Day Planner is disabled on both targets.
- No daily, weekly, monthly, task, or mobile navigation regression appears.
- Windows/Android enabled plugin IDs remain equal except for the intended
  Day Planner state.
- Capture settled before/after records outside Git.

**Commit:** Commit only the compact authority/result update with
`docs: record Day Planner disable`.

### Step 4: Port Homepage progress and task timeline

**Files:**

- `HUB\Homepage.md`
- `SYSTEM\MOBILE HUB\Mobile Homepage.md`
- `SYSTEM\TEMPLATE\CSS\Timeline\Tasks Manager.md` if its Dataview owner is
  replaced.
- Matching external rollback and evidence files.

**Actions:**

- Keep existing button commands, callouts, headings, and task entry controls.
- Replace only the progress-bar and timeline query blocks with Datacore code
  views using the inventory's exact task/date inputs.
- Keep Tasks responsible for checkbox state, due dates, recurrence, and task
  metadata writes.
- Keep Bases embeds in place; do not convert a safe table again.

**Verification:**

- Compare progress value, bar text, task rows, links, ordering, and empty state
  before and after.
- Check a task in Live Preview and confirm the source note changes correctly.
- Reopen in Reading mode and after restart.
- Repeat on Android with settled indexing separated from settled results.

**Commit:** Commit the lane with
`feat: move homepage queries to Datacore`.

### Step 5: Port weekly due/completed views

**Files:**

- `SYSTEM\TEMPLATE\FORMAT\template_weekly_note.md`
- Every current `DAILY\WEEKLY\*.md` file listed by the inventory.

**Actions:**

- Port both due and completed query blocks to Datacore.
- Preserve tab names, date parsing, priority sort, result limit, links, and
  task state display.
- Update the template before existing notes.
- Do not change frontmatter or `tp.file.cursor()` calls.

**Verification:**

- Compare due and completed row sets against the pre-change snapshot.
- Create one disposable weekly note through the existing flow.
- Check a task, switch tabs, scroll fully, and restart on Windows and Android.

**Commit:** Commit the lane with
`feat: move weekly queries to Datacore`.

### Step 6: Port monthly date-window views

**Files:**

- `SYSTEM\TEMPLATE\FORMAT\template_monthly_note.md`
- Every current `DAILY\MONTHLY\*.md` file listed by the inventory.

**Actions:**

- Port the open-task date-window query to Datacore.
- Preserve `journal-start-date`, `journal-end-date`, timezone handling, and
  Overview tab placement.
- Update the template first, then existing disposable notes.

**Verification:**

- Test start boundary, end boundary, one day outside each boundary, completed
  task, missing due date, and empty result.
- Create one disposable monthly note through the existing flow.
- Recheck settled Reading/Live Preview and full relevant scrolling on both
  platforms.

**Commit:** Commit the lane with
`feat: move monthly queries to Datacore`.

### Step 7: Resolve Calendar and Timeline loaders

**Files:**

- `SYSTEM\TEMPLATE\CSS\Calendar\Calendar View.md`
- `SYSTEM\TEMPLATE\CSS\Timeline\Tasks Manager.md`
- All journal notes still referencing those loaders.
- Existing calendar/timeline plugin configuration only if a tested owner
  replacement is accepted.

**Actions:**

- Determine whether each loader is a Dataview wrapper or an independent plugin
  surface from the inventory and plugin consumer ledger.
- Port wrapper logic to Datacore only when the same dates, links, ordering,
  navigation, and mobile layout can be rendered.
- Keep the owning plugin enabled until both platform tests pass.
- Do not replace Calendar/Timeline with a static table merely to remove a
  plugin.

**Verification:**

- Compare week/month layout, chronological order, date labels, note links,
  and navigation.
- Fully scroll vertically and horizontally on Android; verify no clipping or
  unusable touch target.
- Reobserve settled Windows at native `1920x1040` before accepted capture.

**Commit:** Commit only a proven loader replacement with
`feat: move calendar loaders to Datacore`; otherwise commit a documented
keep decision with `docs: retain calendar loader owner`.

### Step 8: Reconcile templates and existing notes

**Files:**

- All format templates and journal notes in the inventory.
- Existing `Getting Started` and quick-start documentation only when the
  user-facing instructions change.

**Actions:**

- Confirm no template still emits DataviewJS after Steps 4-7.
- Preserve Templater cursor calls, async hooks, Meta Bind fields, Tasks blocks,
  tabs, and frontmatter.
- Create daily, weekly, monthly, area, contact, and project notes through the
  existing safe flows.
- Record any historical note that intentionally remains outside the migration
  set rather than rewriting it silently.

**Verification:**

```powershell
rg -n -i "dataviewjs|dv\.view|dv\.pages" --glob "*.md" .
```

Expected result: only explicitly documented protected exceptions, if any, and
no new-note template emits Dataview code.

**Commit:** Commit the template/guide update with
`docs: reconcile Datacore templates`.

### Step 9: Remove Dataview after zero-consumer proof

**Files:**

- Exact disposable Windows `.obsidian\community-plugins.json`, Dataview
  plugin directory, and settings.
- Exact disposable Android plugin list and Dataview directory.
- Existing plugin/consumer ledgers and external rollback manifest.

**Precondition:** Step 8 inventory reports zero Dataview runtime/template
consumers, and all affected lanes passed both platforms.

**Actions:**

- Copy Dataview payload/config to the external rollback checkpoint.
- Disable Dataview, restart Windows and Android, and verify no Dataview command
  or error remains.
- Remove the active Dataview payload only after the disabled restart passes.
- Do not remove Datacore, Tasks, Bases, Templater, Meta Bind, QuickAdd, or
  Journals.

**Verification:**

```powershell
rg -n -i "dataview|dataviewjs|dv\.view|dv\.pages" --glob "*.md" .
Get-ChildItem -LiteralPath '.obsidian\plugins' -Directory | Select-Object -ExpandProperty Name
```

Expected result: no active Dataview directory, no Dataview command, no
Dataview rendering error, and Datacore views settled on both platforms.

**Commit:** Commit the compact removal result with
`chore: remove Dataview after parity`.

### Step 10: Run overlap-plugin audit and approved removals

**Files:**

- Existing plugin/consumer ledgers, `SOURCE-MAP.csv`, `EVIDENCE-INDEX.csv`,
  and current result ledger.
- Exact disposable plugin lists/configs only for a proven candidate.

**Actions:**

- Re-evaluate Calendar/Timeline, Checklist, and other table/query helpers
  against actual commands, settings, toolbar items, status-bar items, mobile
  behavior, templates, and source references.
- Keep a plugin when it owns any user-valued behavior not reproduced by Bases
  or Datacore.
- Disable before uninstalling. Preserve payload and config outside Git.
- Do not remove a plugin from text-reference counts alone.

**Verification:**

- Each candidate has an owner mapping, replacement test, rollback hash,
  Windows result, Android result, and final disposition.
- Enabled Windows/Android plugin IDs remain intentionally synchronized.

**Commit:** Use one atomic commit per accepted candidate, with a subject that
names the candidate and action.

### Step 11: Full Windows regression

**Files:**

- External evidence directory
  `G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime\checkpoints\PERSONALIZATION-E7-DATACORE-DEBLOAT-20260810\windows`.
- Existing coverage and evidence ledgers.

**Actions:**

- Restart exact disposable and wait for Datacore indexing to settle.
- Test Homepage, Mobile Homepage, navigation, tabs, Tasks, daily/weekly/monthly
  creation, Templater, Dataview replacement outputs, Datacore JSX, Meta Bind,
  QuickAdd, Note Toolbar, Custom Sort, Excalidraw, Hover Editor, search,
  templates, mapped creation flows, recovery, Reading/Live Preview, and full
  relevant scrolling.
- Reobserve and maximize immediately before every accepted screenshot.
- Capture only native `1920x1040` JPEG evidence.

**Verification:**

- Every inventory group has a passed or explicit blocked disposition.
- No wrong-target capture is accepted.
- Capture hashes and manifest rows outside Git.

**Commit:** Commit the compact Windows result with
`docs: record Windows Datacore regression`.

### Step 12: Full Android regression

**Files:**

- External evidence directory
  `G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime\checkpoints\PERSONALIZATION-E7-DATACORE-DEBLOAT-20260810\android`.
- Existing coverage and evidence ledgers.

**Actions:**

- Verify serial `01234ABC`, package `md.obsidian`, PID, foreground activity,
  and registered vault before input.
- Test the same functional surfaces through native Android UI and direct ADB.
- Test narrow layouts, touch targets, task state changes, date boundaries,
  Datacore indexing recovery, and complete scrolling.
- Capture only native `1200x2000` PNG evidence.

**Verification:**

- Android enabled IDs match Windows intended state.
- No view is accepted while Datacore is still indexing.
- No PC-only feature is silently removed; mobile fallback is documented if
  layout differs.

**Commit:** Commit the compact Android result with
`docs: record Android Datacore regression`.

### Step 13: Seal ledgers, refresh Graphify, validate, and publish

**Files:**

- Existing Part 2 `CURRENT.md`, `DECISIONS.md`, `RESUME.md`,
  `RESULT-LEDGER.md`, `EVIDENCE-INDEX.csv`, and `SOURCE-MAP.csv`.
- Product `docs\active-goal.md`, `docs\dusk-light-getting-started.md`, and
  existing compact Dusk status authority.
- External `EVIDENCE-MANIFEST.csv`, Graphify record, and final review record.

**Actions:**

- Record exact accepted, blocked, and remaining groups; Day Planner disabled
  state; Datacore version; Dataview removal; plugin IDs; target identities;
  evidence paths/hashes; rollback paths; and stop rules.
- Add a short Getting Started note explaining Bases versus Datacore and why
  Tasks remains.
- Run all binding Part 2 validators, product checks, Git identity/clean checks,
  evidence manifest validation, and Graphify refresh after the final material
  authority commit.
- Run Graphify through 9router/OpenAI only; record success/failure and output
  identity, never secrets.
- Push only the compact verified update to
  `docs/phase2-preparation-reset`. Do not create a PR or merge.

**Verification:**

```powershell
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/test-markdown-links.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
rtk git diff --check
rtk git status --short
```

Expected result: all validators pass, manifests validate, Graphify binds to
current Part 2 HEAD/tree, both repositories are clean, and no future wave has
started.

**Commit:** Commit the final compact result with
`docs: seal Datacore debloat result`, then push only the reset branch.

## Stop conditions

Stop affected implementation and leave the previous owner active when output,
task editing, date boundaries, mobile rendering, touch behavior, template
creation, rollback, target identity, or branch ownership is uncertain. Stop
for credentials/private data, live-vault targeting, destructive action without
recovery, or a missing material rollback.

## Plan self-review checklist

- Every design section has an implementation step.
- Day Planner disable is explicit and reversible.
- Datacore remains permanent for complex views.
- Dataview removal is gated by zero-consumer proof.
- Tasks and creation plugins remain protected.
- Windows and Android have separate settled evidence requirements.
- No future wave/task hierarchy is introduced.
- No placeholder or unsupported plugin is required.
