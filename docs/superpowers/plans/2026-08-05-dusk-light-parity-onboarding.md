# Dusk_light parity and onboarding implementation plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (\`- [ ]\`) syntax for tracking.

**Goal:** Add the three approved mobile-capable plugins, remove obsolete Settings Search, verify Dusk_light behavior and Windows/Android parity, and publish a Dusk_light-specific Getting Started guide with sanitized screenshots.

**Architecture:** Main session performs every runtime mutation and verification on the existing disposable Windows vault/profile and registered Android vault. Each plugin change is an isolated rollback-backed transaction. Part 2 remains the evidence authority; the product reset branch receives only compact status, reproducible repair references, and the approved plan/spec.

**Tech Stack:** Obsidian 1.13.4, PowerShell, Git, direct ADB, native Windows Computer Use, Markdown/CSV ledgers, SHA-256 manifests, rtk, Graphify with the OpenAI-compatible 9router graphify model.

## Global Constraints

- Main session is sole executor and owner; do not call spawn_agent, use Codex subagents, or create another full task for this batch.
- Work only on product branch docs/phase2-preparation-reset; product main, bf23, source trees, live vaults, and protected Museum/source paths remain untouched.
- Part 2 starts at main HEAD 9a100527af6efd009b6bf29bcd8e9d30b25b0eed, tree 0aa34dff1ebbc2db74e0fcdbb5f25ae56ff07d1a, clean.
- Product reset starts at HEAD ced77c8224519ab938d8fcb71f388ccbf8e51787, tree 602d2c4a53248c94d40000d447710cbe472fc483, clean.
- Windows target is G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime\disposables\W5-INTEGRATED-UPDATED-LIGHT-20260803 with its registered external profile.
- Android target is serial 01234ABC, package md.obsidian, vault /storage/emulated/0/Documents/Dusk-Phase2-Preparation-Part2-Android-V1-20260801.
- Do not inspect, copy, hash, upload, or print credentials, tokens, browser profiles, personal notes, network caches, or raw logs.
- Keep core Daily Notes disabled and Journals as the sole periodic-note owner.
- Keep Todoist, BRAT, credential-bearing integrations, network frames, arbitrary JS/JSX/macros, and protected/live/source actions disabled or gated.
- Add obsidian-day-planner, remember-cursor-position, and darlal-switcher-plus; do not add Advanced Tables table-editor-obsidian.
- Keep obsidian-projects enabled on both platforms because QuickAdd and Note Toolbar consume its commands.
- Remove only settings-search, and only after exact external rollback capture and reference audit.
- Windows accepted screenshots must be freshly reobserved, maximized immediately before capture, and verified as native 1920x1040 JPEGs. Android accepted screenshots must remain native 1200x2000 PNGs.
- Use existing Part 2 ledgers. Do not create duplicate coverage/plugin/evidence tables.
- Raw evidence stays under G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime; raw evidence never enters Git.
- This batch is post-Wave-6 usability/parity work. It does not start Wave 7 / Task 8, Wave 8 / Task 9, or any new canonical wave.
- If a target is wrong, a credential/private-data surface appears, rollback is missing, a destructive action is not recoverable, a branch/remote is ambiguous, or an unexplained plugin is loaded, stop before further mutation.

---

## File map

### Product reset files

- Create: docs/superpowers/plans/2026-08-05-dusk-light-parity-onboarding.md — this execution plan.
- Existing: docs/superpowers/specs/2026-08-05-dusk-light-parity-onboarding-design.md — approved design contract.
- Modify after runtime: docs/active-goal.md — add one superseding compact post-Wave-6 batch entry without rewriting historical entries.
- Modify after runtime: docs/phase-2-preparation-handoff.md — add current status, exact product/Part 2 identities, runtime evidence references, and remaining gates.
- Modify after runtime if needed: docs/generated-work-index.md — link this plan and the approved design; keep both labeled as planning artifacts.

### Part 2 authority files

- Modify after each accepted documentation checkpoint: state/ACTIVE-CONTEXT/CURRENT.md, state/RESUME.md, state/ACTIVE-CONTEXT/DECISIONS.md, and state/RESULT-LEDGER.md.
- Modify coverage rows in place: runtime/SURFACE-REGRESSION.csv.
- Modify plugin ownership/disposition rows in place: runtime/PLUGIN-DEPENDENCIES.csv.
- Add sanitized patch/hash references in place: runtime/PATCH-INDEX.csv.
- Generated Graphify files under graphify-out/ remain navigation-only and are never treated as authority.

### External runtime files

- Create checkpoint directory:
  G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime\checkpoints\DUSK-LIGHT-PARITY-ONBOARDING-20260805.
- Create raw screenshot directory:
  G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime\screenshots\DUSK-LIGHT-PARITY-ONBOARDING-20260805.
- Create evidence manifest:
  G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime\manifests\DUSK-LIGHT-PARITY-ONBOARDING-20260805-SHA256.csv.
- Create exact rollback copies inside the checkpoint directory for each changed plugin directory, manifest, configuration file, and Getting Started file. Exclude credentials, network/token-like paths, browser profiles, and private note contents.
- Runtime guide directory:
  G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime\disposables\W5-INTEGRATED-UPDATED-LIGHT-20260803\SYSTEM\GETTING STARTED.
- Runtime guide media directory:
  G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime\disposables\W5-INTEGRATED-UPDATED-LIGHT-20260803\SYSTEM\GETTING STARTED\Onboarding Media\Dusk_light.

## Workstream 1: Entry identity and rollback

**Files:**

- Create external checkpoint files under DUSK-LIGHT-PARITY-ONBOARDING-20260805.
- Read only: Part 2 authority files listed above, both disposable manifests, and sanitized plugin metadata.

**Produces:** A dated entry record with target identity, pre-change plugin IDs/versions, configuration hashes, rollback manifest hashes, clean Git identities, and no active child-task owner.

- [ ] **Step 1: Verify repository identity and clean state.**

Run separately:

~~~powershell
git -C 'G:\Dusk-Knowledge-Hub\payload\repos\Dusk-Phase2-Preparation-Part2-20260729' status --short
git -C 'G:\Dusk-Knowledge-Hub\payload\repos\Dusk-Phase2-Preparation-Part2-20260729' branch --show-current
git -C 'G:\Dusk-Knowledge-Hub\payload\repos\Dusk-Phase2-Preparation-Part2-20260729' rev-parse HEAD
git -C 'G:\Dusk-Knowledge-Hub\payload\repos\Dusk-Phase2-Preparation-Part2-20260729' rev-parse 'HEAD^{tree}'
git -C 'C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline-phase2-reset' status --short
git -C 'C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline-phase2-reset' branch --show-current
git -C 'C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline-phase2-reset' rev-parse HEAD
git -C 'C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline-phase2-reset' rev-parse 'HEAD^{tree}'
~~~

Expected: Part 2 branch main, product branch docs/phase2-preparation-reset, both clean, and exact starting identities from Global Constraints.

- [ ] **Step 2: Verify the registered Windows target before opening it.**

Use Get-Process Obsidian only to identify candidate PIDs, then use native Computer Use guidance to freshly inspect the exact title containing W5-INTEGRATED-UPDATED-LIGHT-20260803. Do not click until the title, process, and profile identity agree. If no exact target exists, launch only the registered profile through the existing approved runtime method and reverify the title.

Expected: one exact disposable window or a recorded closed state; no interaction with another Obsidian window.

- [ ] **Step 3: Verify Android serial, package, and registered vault.**

Run:

~~~powershell
adb devices -l
adb -s 01234ABC shell pidof md.obsidian
adb -s 01234ABC shell "ls -ld /storage/emulated/0/Documents/Dusk-Phase2-Preparation-Part2-Android-V1-20260801"
~~~

Expected: serial 01234ABC is device, the registered directory exists, and any running package is either verified against that target or force-stopped only after identity is proven.

- [ ] **Step 4: Capture sanitized pre-change plugin and configuration manifests.**

Record plugin IDs, manifest versions, isDesktopOnly, community-list membership, enabled state, and SHA-256 for community-plugins.json, each candidate plugin manifest, relevant plugin data files, and the current Getting Started Markdown/image index. Do not record note bodies or private configuration values.

Expected: baseline counts are recomputed from live targets rather than copied from older ledgers; existing baseline is expected to be 47 installed directories and 44 enabled IDs unless fresh readback proves otherwise.

- [ ] **Step 5: Create and validate the external rollback copy.**

Copy only the allowed plugin/config/Getting Started paths to the checkpoint directory. Generate a path/byte/SHA-256 manifest and verify every copied file has a matching source hash, with zero extra, missing, bad, or reparse entries.

Expected: rollback manifest and its SHA-256 are recorded before any deletion or installation.

- [ ] **Step 6: Commit the durable entry checkpoint in Part 2.**

Append one compact entry row to CURRENT.md, RESUME.md, ACTIVE-CONTEXT/DECISIONS.md, and RESULT-LEDGER.md with current identities, next operation, rollback manifest path/hash, platform state, and stop rules. Stage only those four files, run git diff --cached --check, and commit with:

~~~powershell
git add -- state/ACTIVE-CONTEXT/CURRENT.md state/RESUME.md state/ACTIVE-CONTEXT/DECISIONS.md state/RESULT-LEDGER.md
git diff --cached --check
git commit -m "docs: checkpoint Dusk light parity"
~~~

Expected: Part 2 is clean and the entry commit identity is recorded before runtime mutation.

## Workstream 2: Settings Search audit and removal

**Files:**

- Runtime: resolved settings-search plugin directory, .obsidian/community-plugins.json, and only relevant safe settings metadata.
- External: Settings Search rollback copy, reference audit, before/after manifest, and sanitized result.
- Part 2: one runtime/PATCH-INDEX.csv row and one runtime/PLUGIN-DEPENDENCIES.csv disposition row.

**Produces:** Settings Search absent from both disposable active plugin sets, no settled compatibility toast, reversible rollback, and explicit platform result.

- [ ] **Step 1: Resolve the exact Settings Search directory and references.**

Find the plugin directory by matching its manifest.json ID to settings-search; do not assume a folder name. Search only .obsidian manifests, community lists, plugin data keys, command IDs, Dusk configuration, and the two Getting Started indexes:

~~~powershell
rg -n --hidden --glob '!**/workspace*.json' --glob '!**/workspaces*.json' --glob '!**/cache/**' "settings-search|Settings Search" 'G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime\disposables\W5-INTEGRATED-UPDATED-LIGHT-20260803\.obsidian'
~~~

For Android, use direct ADB reads of the matching manifest and community list only. Expected: references are limited to the plugin manifest/community list or explicitly documented settings usage; no private note body is searched.

- [ ] **Step 2: Reproduce the settled compatibility result before removal.**

After fresh exact-target observation and startup settlement on each platform, open only core Settings and the Settings Search surface if present. Record any compatibility toast separately from settled Settings behavior. Do not enter credentials or use search against private notes.

Expected: the prior Obsidian 1.13.4 compatibility toast is either reproduced or marked not reproduced; this result does not block removal after rollback.

- [ ] **Step 3: Remove Settings Search from Windows.**

With Obsidian closed or the exact target in a supported reload state, remove only the resolved Settings Search directory and its ID from .obsidian/community-plugins.json. Preserve all other IDs byte-for-byte where possible. Reload the exact disposable and wait for settled startup.

Expected: no Settings Search directory, no settings-search community ID, core Settings opens, no settled compatibility toast, and existing Dusk surfaces remain available.

- [ ] **Step 4: Remove Settings Search from Android.**

Use direct ADB on serial 01234ABC to apply the same exact ID/directory removal after verifying package and vault identity. Restart only md.obsidian for the registered target, wait for settled Homepage, and inspect core Settings without credentials.

Expected: Android has the same intended Settings Search removal and no settled compatibility toast. If serial or vault identity fails, restore Windows if needed and record Android as blocked; do not call parity complete.

- [ ] **Step 5: Rerun affected Settings and Homepage checks.**

On Windows and Android, reobserve settled Homepage, Mobile Homepage, core Settings, Search, Note Toolbar FAB, Journals, Projects, and recovery to Homepage. Capture fresh evidence only for affected behavior and any new error.

Expected: no settled error attributable to Settings Search removal; rollback remains usable if a new plugin/config error appears.

- [ ] **Step 6: Record the removal transaction.**

Add one sanitized settings-search row to PLUGIN-DEPENDENCIES.csv, one patch/hash row to PATCH-INDEX.csv, and affected rows to SURFACE-REGRESSION.csv. Include Windows/Android before and after config hashes, exact resolved directory, rollback path, toast result, and disposition. Commit these ledgers atomically in Part 2.

Expected: current authority says Settings Search removed only from the two disposables; historical six-plugin correction rows remain unchanged.

## Workstream 3: Day Planner integration

**Files:**

- Runtime: Day Planner directory/manifest/data, community lists, and only safe test notes created in the disposable.
- External: package/version record, screenshots, action ledger, and rollback manifest.
- Part 2: PLUGIN-DEPENDENCIES.csv, SURFACE-REGRESSION.csv, and PATCH-INDEX.csv.

**Produces:** Day Planner installed at an identified stable version or explicitly retained disabled if it conflicts with Journals periodic ownership.

- [ ] **Step 1: Verify the current stable package before installation.**

Read the official Day Planner release/manifest through the approved public research route or Obsidian Community Plugins UI. The previously researched baseline is 0.35.1; record the actual version used and do not update unrelated plugins. The plugin ID must be obsidian-day-planner, and its manifest must remain isDesktopOnly=false.

- [ ] **Step 2: Install Day Planner on Windows through the disposable UI.**

Use the exact registered Windows target and Community Plugins search for obsidian-day-planner. Enable only Day Planner after its manifest is present. Do not enable Core Daily Notes or Periodic Notes. Reload and wait for settled readiness.

Expected: the plugin loads without a settled error and Journals remains the only periodic owner.

- [ ] **Step 3: Install the same Day Planner release on Android.**

Use only serial 01234ABC and the registered vault. Install the exact recorded version through the disposable UI or the same verified community package, enable it, restart md.obsidian, and wait for settled Homepage.

Expected: Android plugin directory, manifest version, and enabled-list ID match Windows unless a verified mobile capability failure occurs.

- [ ] **Step 4: Test Day Planner against existing Journals notes.**

Open the planner, inspect a current safe daily note, inspect one scheduled safe Tasks item, scroll the timeline vertically and horizontally where supported, and return to Homepage. Use an isolated synthetic dated note only if an action requires creation; hash it, capture it outside Git, and delete/quarantine it after the rerun. Do not connect online calendars or create real reminders.

Expected: existing Journals daily paths are consumable without duplicate daily-note ownership, no template marker appears, and no settled Dataview/Tasks error appears.

- [ ] **Step 5: Test Day Planner weekly/monthly boundaries without changing ownership.**

Open existing safe weekly and monthly notes through Journals routes, verify planner navigation does not create duplicate weekly/monthly files, and return to Homepage. If Day Planner supports only daily paths, record that as a documented platform/feature boundary rather than changing templates.

- [ ] **Step 6: Record Day Planner disposition and rerun affected integrated surfaces.**

Record version, config hash, Windows/Android actions, startup/readiness, daily/weekly/monthly result, mobile tap/hold result where available, and any blocked online-calendar behavior. Update all three existing Part 2 ledgers and commit the accepted transaction.

## Workstream 4: Remember Cursor Position integration

**Files:**

- Runtime: Remember Cursor Position directory/manifest/data and synthetic test notes only.
- External: before/after config hashes, screenshots, and action result.
- Part 2: existing plugin, surface, and patch ledgers.

**Produces:** Cursor/scroll restoration result across Edit, Reading, and Live Preview without template deletion or tp.file.cursor() removal.

- [ ] **Step 1: Verify and install the current stable release.**

Use plugin ID remember-cursor-position; the previously researched baseline is 1.0.13. Record actual installed version, require isDesktopOnly=false, install/enable it on Windows, then install/enable the same version on Android after target identity verification.

- [ ] **Step 2: Prove existing templates remain unchanged.**

Hash the daily, weekly, and monthly Dusk templates before testing and verify each still contains its intended tp.file.cursor() marker. Do not remove or rewrite markers. The test is for plugin behavior, not a template workaround.

- [ ] **Step 3: Test restoration in Edit mode.**

Open a safe synthetic note, place the cursor/scroll at a known heading, leave and reopen it, and verify restoration. Repeat on Windows and Android with settled screenshots. Delete the synthetic note after hashing and recording the result.

- [ ] **Step 4: Test restoration in Reading and Live Preview.**

Use the same safe synthetic note in Reading and Live Preview, fully scroll relevant vertical and horizontal areas, leave and reopen, and record whether cursor, scroll, or selection restoration is supported in each mode. Treat settled mode behavior separately from initial loading.

- [ ] **Step 5: Rerun Journals and Templater creation flows.**

Run safe daily, weekly, and monthly creation routes on both platforms using isolated future dates, confirm no literal tp.file.cursor() remains after settlement, capture note hashes, and quarantine/delete only the synthetic outputs. Preserve source templates.

- [ ] **Step 6: Record the plugin result.**

Add version, settings disposition, mode-by-mode behavior, Templater interaction, and platform differences to the existing ledgers. If restoration is unsupported in a mode, document it as a plugin boundary; do not mutate templates to force a pass.

## Workstream 5: Quick Switcher++ integration

**Files:**

- Runtime: Quick Switcher++ directory/manifest/data and core Switcher settings only when required by the plugin.
- External: package/version record, screenshots, action ledger, and rollback hash.
- Part 2: existing plugin and surface ledgers.

**Produces:** Quick Switcher++ working with core Quick Switcher on both platforms without disturbing existing Dusk navigation.

- [ ] **Step 1: Verify and install the current stable release.**

Use plugin ID darlal-switcher-plus; the previously researched baseline is 6.1.6. Record the actual stable version, require isDesktopOnly=false, retain core Quick Switcher enabled, install on Windows, then install the same version on Android.

- [ ] **Step 2: Test Windows file and heading navigation.**

Open Quick Switcher++ from a settled exact Windows target, search for a safe Dusk_light note, open it, search a safe heading or symbol if present, open the result, and return to Homepage. Capture a fresh maximized 1920x1040 JPEG only after reobserving the exact window.

- [ ] **Step 3: Test Windows commands, panels, workspaces, and recovery.**

Exercise only safe Quick Switcher++ command/panel/workspace/bookmark surfaces that already exist in the disposable. Do not create or modify personal bookmarks. Close each panel through an observed control and recover to Homepage.

- [ ] **Step 4: Test Android launcher and navigation.**

On serial 01234ABC, exercise Quick Switcher++ mobile launcher/file search and open a safe Dusk_light note. Fully scroll the result surface, return to Homepage, and capture native 1200x2000 PNG evidence.

- [ ] **Step 5: Rerun Dusk navigation consumers.**

Verify Homepage, Mobile Homepage, Map, Mail/Inbox, Journals, Projects, Note Toolbar FAB, Tabs, and recovery after Quick Switcher++ use. If a command ID or saved workspace changes, isolate it, preserve rollback, and repair only the affected disposable mapping.

- [ ] **Step 6: Record Quick Switcher++ disposition.**

Record core dependency, version/config parity, Windows/Android launcher result, safe action result, and any platform-native difference in the existing ledgers. Commit the accepted transaction.

## Workstream 6: Full Dusk_light coverage and parity matrix

**Files:**

- Modify: runtime/SURFACE-REGRESSION.csv existing rows and one compact checklist extension for newly added surfaces.
- Modify: runtime/PLUGIN-DEPENDENCIES.csv dispositions for all installed plugin directories on both platforms.
- Create external: platform config/version manifest and screenshot hash manifest.

**Produces:** One current matrix covering every Dusk_light navigation entry, visible surface, safe creation action, command, template flow, compatible plugin-owned feature, Reading/Live Preview view, and relevant Windows/Android behavior.

- [ ] **Step 1: Recompute installed plugin inventory after transactions.**

Enumerate every installed .obsidian/plugins/*/manifest.json in Windows and Android, match IDs to community-plugins.json, record versions and isDesktopOnly, and compare enabled lists. Do not infer from old 47-row counts.

- [ ] **Step 2: Assign each plugin a current disposition.**

Use exactly one disposition per platform: PASS_TESTED, RETAIN_ENABLED_UNTESTED_WITH_REASON, DISABLED_BY_POLICY, DESKTOP_ONLY, BLOCKED_CREDENTIAL_NETWORK_OR_SAFETY, or NOT_APPLICABLE. Add new plugin rows only where the existing ledger lacks the ID; do not duplicate historical rows.

- [ ] **Step 3: Rerun affected Dusk navigation.**

On both platforms, settle and exercise Homepage, Mobile Homepage, Map, Mail/Inbox, Journals daily/weekly/monthly, Projects, Search, Tabs, Tasks, Templates, Note Toolbar FAB, QuickAdd, Commander, Custom Sort, Excalidraw, Hover Editor current-note pane, Dataview/DVJS, Datacore, Meta Bind/JS Engine safe non-arbitrary surfaces, and recovery. Reuse prior rows only when source, version, config, platform, and contract remain equal.

- [ ] **Step 4: Complete safe scrolling and mode checks.**

Fully scroll relevant surfaces vertically and horizontally, compare settled Reading and Live Preview where supported, and separate loading messages from settled errors. Use native screenshot dimensions and fresh exact-window observation rules.

- [ ] **Step 5: Compare platform configuration.**

Compute sanitized enabled-ID, manifest-version, and relevant-config hashes for Windows and Android. Record every difference as supported desktop-only behavior, intentional safety policy, platform-native UI, or verified failure with rollback.

- [ ] **Step 6: Execute affected recovery checks.**

Restart/reload each exact disposable after the final plugin transaction, verify settled Homepage and no unexpected plugin errors, then recheck one representative Journals creation route and one Quick Switcher++ route on each platform.

## Workstream 7: Dusk_light Getting Started guide and screenshots

**Files:**

- Create runtime: SYSTEM/GETTING STARTED/Dusk_light Quick Start.md.
- Modify runtime: SYSTEM/GETTING STARTED/Getting Started.md and only stale claims in onboarding Parts 1, 3, and 4.
- Create runtime: SYSTEM/GETTING STARTED/Onboarding Media/Dusk_light/ sanitized images.
- Create external: raw accepted captures and SHA-256 manifest.

**Produces:** A short, plain-language Dusk_light guide that teaches the current vault rather than full-Dusk features.

- [ ] **Step 1: Capture rollback for current Getting Started files and media index.**

Copy the seven guide Markdown files, their referenced image filenames, and the current index hashes into the external checkpoint. Do not copy image contents that contain credentials or personal notes.

- [ ] **Step 2: Write the Dusk_light quick-start content.**

Create the guide with these exact sections: Start here, Navigation, Daily/weekly/monthly notes, Floating Note Toolbar, Tasks and views, Templates and cursor behavior, The three added plugins, Projects on Windows and Android, Search and recovery, What is intentionally disabled, and Windows versus Android. Link only to notes and commands verified in the current disposable.

- [ ] **Step 3: Correct stale onboarding claims.**

Change only claims contradicted by current Dusk_light evidence: Todoist remains disabled and no token is required; full-Dusk-looking images are labeled historical reference; Journals owns periodic notes; the Note Toolbar FAB is context-sensitive and options depend on the current file directory; Projects is retained on both platforms; Settings Search is removed; Advanced Tables is not installed.

- [ ] **Step 4: Capture fresh Windows onboarding images.**

Capture and register these exact JPEG names after fresh reobservation/maximization: DUSK-LIGHT-WIN-HOMEPAGE-20260805.jpg, DUSK-LIGHT-WIN-MOBILE-HOMEPAGE-20260805.jpg, DUSK-LIGHT-WIN-NOTE-TOOLBAR-20260805.jpg, DUSK-LIGHT-WIN-JOURNALS-20260805.jpg, DUSK-LIGHT-WIN-DAY-PLANNER-20260805.jpg, and DUSK-LIGHT-WIN-QUICK-SWITCHER-20260805.jpg. Verify each is 1920x1040 JPEG, sanitized, and settled.

- [ ] **Step 5: Capture fresh Android onboarding images.**

Capture and register matching native PNG names: DUSK-LIGHT-ANDROID-HOMEPAGE-20260805.png, DUSK-LIGHT-ANDROID-MOBILE-HOMEPAGE-20260805.png, DUSK-LIGHT-ANDROID-NOTE-TOOLBAR-20260805.png, DUSK-LIGHT-ANDROID-JOURNALS-20260805.png, DUSK-LIGHT-ANDROID-DAY-PLANNER-20260805.png, and DUSK-LIGHT-ANDROID-QUICK-SWITCHER-20260805.png. Verify each is 1200x2000 PNG, sanitized, and settled.

- [ ] **Step 6: Embed only the curated sanitized copies.**

Copy accepted images into the runtime Dusk_light media folder, link them from the new guide, and label the existing full-Dusk-looking Onboarding Media as historical/reference media. Do not duplicate the full image atlas.

- [ ] **Step 7: Validate guide navigation and rendering.**

Open Getting Started.md and Dusk_light Quick Start.md on Windows and Android, follow every local link, fully scroll both guides, compare Reading and Live Preview where supported, and verify no broken image/link, credential, or settled runtime error appears.

## Workstream 8: Durable authority and product publication

**Files:**

- Modify Part 2 ledgers: CURRENT.md, RESUME.md, DECISIONS.md, RESULT-LEDGER.md, SURFACE-REGRESSION.csv, PLUGIN-DEPENDENCIES.csv, PATCH-INDEX.csv.
- Modify product: docs/active-goal.md, docs/phase-2-preparation-handoff.md, and docs/generated-work-index.md if required for plan reachability.

**Produces:** Compact current status with exact identities, evidence paths/hashes, accepted/blocked rows, plugin parity, onboarding result, and explicit future-wave stop state.

- [ ] **Step 1: Write the Part 2 result checkpoint.**

Add one superseding current entry, without rewriting historical records, stating: this is a post-Wave-6 Dusk_light parity/onboarding batch; Settings Search disposition; three plugin versions and results; Projects retained; Advanced Tables skipped; Windows and Android status; guide/media paths; config and manifest hashes; remaining true gates; and next self-review stop.

- [ ] **Step 2: Commit accepted Part 2 documentation atomically.**

Stage only the existing ledgers and relevant sanitized result files, inspect git diff --cached --name-only, run git diff --cached --check, then commit with:

~~~powershell
git add -- state/ACTIVE-CONTEXT/CURRENT.md state/RESUME.md state/ACTIVE-CONTEXT/DECISIONS.md state/RESULT-LEDGER.md runtime/SURFACE-REGRESSION.csv runtime/PLUGIN-DEPENDENCIES.csv runtime/PATCH-INDEX.csv
git diff --cached --name-only
git diff --cached --check
git commit -m "docs: record Dusk light parity result"
~~~

- [ ] **Step 3: Update compact product authority.**

Add a short superseding section to docs/active-goal.md and docs/phase-2-preparation-handoff.md with the product branch identity, Part 2 identity, external evidence root, plugin additions/removal, guide path, parity result, remaining gates, and the statement that Wave 7 / Task 8 and Wave 8 / Task 9 remain NOT STARTED. Do not copy raw evidence or the full plugin/coverage tables.

- [ ] **Step 4: Link the plan in the generated-work index.**

Add this plan and the approved design to docs/generated-work-index.md with current status labels. Do not make planning artifacts current authority.

- [ ] **Step 5: Validate and commit product publication.**

Run:

~~~powershell
rtk git fetch origin
rtk git status --short
rtk git branch --show-current
rtk git rev-parse HEAD
rtk git rev-parse 'HEAD^{tree}'
rtk git rev-parse origin/docs/phase2-preparation-reset
rtk git rev-parse origin/main
rtk git diff --check
rtk powershell -NoProfile -File scripts/check-markdown-links.ps1
rtk powershell -NoProfile -File scripts/test-markdown-links.ps1
rtk powershell -NoProfile -File scripts/check-secrets.ps1
~~~

Stage only the compact product files and commit with:

~~~powershell
git add -- docs/active-goal.md docs/phase-2-preparation-handoff.md docs/generated-work-index.md
git diff --cached --check
git commit -m "docs: publish Dusk light parity status"
git push origin docs/phase2-preparation-reset
~~~

Expected: local and origin reset match; origin main remains unchanged; no PR or merge is created.

## Workstream 9: Graphify and final verification

**Files:**

- External: sanitized Graphify result under the runtime evidence root.
- Part 2: final ledger references to Graphify result/error identity.
- Product: no raw Graphify output.

**Produces:** One provider-correct semantic refresh record or one exact sanitized failure record, plus independently verified final Git/evidence/product state.

- [ ] **Step 1: Run Graphify after the material documentation commit.**

Use process-local 9router mapping only; never print or persist secret values:

~~~powershell
$env:OPENAI_BASE_URL = [Environment]::GetEnvironmentVariable('9router_base_url')
$env:OPENAI_API_KEY = [Environment]::GetEnvironmentVariable('9router_api_key')
$env:OPENAI_MODEL = 'graphify'
rtk graphify extract . --backend openai --model graphify --api-timeout 600
Remove-Item Env:OPENAI_BASE_URL,Env:OPENAI_API_KEY,Env:OPENAI_MODEL -ErrorAction SilentlyContinue
~~~

Record only variable names, backend openai, model graphify, success/failure, output identity, and an exact sanitized error if it fails. Do not use Gemini or treat Graphify output as authority.

- [ ] **Step 2: Validate evidence manifests.**

Run a fresh PowerShell validator over the onboarding screenshot manifest: every path exists, each SHA-256 matches, Windows files decode as 1920x1040 JPEG, Android files decode as 1200x2000 PNG, and no raw/private path is included. Validate rollback manifests for zero missing/bad/extra/reparse entries.

- [ ] **Step 3: Run final Part 2 and product checks.**

Run git diff --check, status/branch/HEAD/tree/remote checks, all binding Part 2 validators named by current authority, product Markdown link checks, secret scan, evidence manifest validation, and a final Graphify output identity readback. Any failure remains a documented failure; do not convert it to pass by omission.

- [ ] **Step 4: Independently review requirements.**

Compare the final ledgers against every section of the approved design: three additions, one removal, Projects parity, Advanced Tables omission, full plugin dispositions, Dusk_light guide, fresh Windows/Android images, platform differences, safety gates, rollback, exact Git identities, and future-wave stop.

- [ ] **Step 5: Stop for user self-review.**

Leave Windows and Android in a settled safe state, do not begin Wave 7 / Task 8 or Wave 8 / Task 9, and report only verified results, failures, remaining gaps, exact Part 2/product HEAD/tree, pushed reset identity, evidence root/manifest, and the next self-review decision.

## Execution order and checkpoint rules

Execute Workstreams 1 through 9 in order. Commit a durable Part 2 checkpoint before any material runtime mutation, after Settings Search removal, after each accepted plugin transaction, after onboarding ledger completion, and before Graphify. Keep raw screenshots and rollback copies external. If context approaches the 90% boundary, stop broad work, update existing CURRENT/RESUME/DECISIONS/result and coverage ledgers with exact in-flight state, commit cleanly, and resume only after rereading the active context files and re-proving targets.

## Plan self-review

- Spec coverage: every approved plugin decision, Settings Search removal gate, Projects parity rule, Advanced Tables omission, Dusk_light onboarding requirement, Windows/Android image contract, full safe-coverage matrix, rollback rule, product lean-publication rule, 9router Graphify rule, and future-wave stop has a workstream and explicit verification step.
- Placeholder scan: no unresolved implementation placeholder is used.
- Naming check: this plan uses Workstream and Step; it does not create a Wave 7/8 task hierarchy or reuse historical internal batch labels.
- Authority check: historical Wave 5/Wave 6 records remain historical; the new result is appended as a superseding post-Wave-6 batch entry.
- Safety check: no credential, private-note, full-Dusk, live-vault, product-main, bf23, PR, merge, or subagent action is included.
