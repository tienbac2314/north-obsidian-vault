# Dusk Goal 1 Discovery Implementation Plan

Status: historical execution plan. Do not rerun its multi-agent orchestration.
Current continuation instructions live in
[active goal](../../../active-goal.md); current evidence lives in
[functional revalidation](../../../research/2026-07-25-dusk-plugin-functional-revalidation.md).

**Goal:** Produce complete, reproducible Windows and physical-Android Dusk discovery evidence before any personalization or live-vault change.

**Architecture:** Treat the local source bundle and tablet copy as immutable inputs. Generate sanitized manifests, clone only into disposable roots, preserve first-open baselines, and run updates only in checkpointed duplicates. Distill raw evidence into linked `docs/research/` reports; keep current design authority unchanged except Goal 1 status in `docs/active-goal.md`.

**Tech Stack:** PowerShell 5.1, Git worktrees, Obsidian 1.12.7, Android Debug Bridge, Agent Reach, NotebookLM CLI 0.7.3, in-app Browser, project-scoped Dusk agents, Markdown.

## Global Constraints

- Sole local source authority: `C:\Users\TienBac\Documents\New project\dusk-obsidian-vault-master`.
- Raw evidence and Windows disposable root: `G:\Dusk-Goal1-Discovery-20260725`.
- Live vault `G:\Obsidian` is read-only and receives no Goal 1 promotion.
- Tablet source `/sdcard/Documents/dusk-obsidian-vault-master` remains immutable.
- Android experiments use new disposable copies under `/sdcard/Documents/Dusk-Goal1-Disposable-20260725`.
- Never open, hash, copy, print, or commit `.obsidian/todoist-token`.
- Treat every community-plugin `data.json` and every token, secret, credential, password, API-key, or auth-named path as secret-bearing until a safe-field allowlist is documented.
- Keep Fast Note Sync, Obsidian Sync, Self-hosted LiveSync, Syncthing integrations, publishing, sharing, and other external writers disabled in every disposable copy before first open.
- Do not choose final plugins, language policy, folder presentation, dashboard layout, or mobile compromises during discovery.
- Record observed facts, inference, and recommendations separately. Community reports remain anecdotal.
- Keep raw logs, screenshots, account identifiers, device serials, private note bodies, endpoints, and secrets outside Git. Commit only sanitized findings.

---

### Task 1: Record preflight and immutable baselines

**Files:**

- Create: `docs/research/2026-07-25-dusk-goal1-preflight.md`
- Create: `docs/research/2026-07-25-dusk-source-manifest.md`
- Modify: `docs/README.md`
- Modify: `docs/active-goal.md`

**Interfaces:**

- Consumes: PR #6 merge commit `571fde4`, source canonical manifest SHA-256 `D7E55C61CD6395F938F1842CBED66D71D22DCD8480BA5EE2628CD5452CB3B6AB`, and raw manifests under `G:\Dusk-Goal1-Discovery-20260725\source-manifests`.
- Produces: fixed roots, versions, route health, safe exclusion policy, PC/tablet equality result, and checkpoint used by every later task.

- [ ] **Step 1: Write sanitized prerequisite report**

  Record repository branch/worktree state, PR #6 evidence, disk headroom, Obsidian executable/version, ADB/device/package facts, NotebookLM auth, Browser availability, Agent Reach routes, custom-agent validation, diagnostics access, and exact blockers or limitations.

- [ ] **Step 2: Write source and variant manifest report**

  Record complete directory/file counts, byte counts, top-level variants, canonical hashes, excluded-sensitive counts, and PC/tablet safe-manifest equality. Link raw manifest filenames without committing their rows.

- [ ] **Step 3: Update active checkpoint only**

  Replace previous next action with Goal 1 discovery status, fixed source authority, immutable roots, and explicit no-promotion boundary. Do not alter system design, architecture, roadmap, or accepted decisions.

- [ ] **Step 4: Verify documentation**

  Run:

  ```powershell
  powershell -NoProfile -File scripts/check-markdown-links.ps1
  powershell -NoProfile -File scripts/check-secrets.ps1
  git diff --check
  ```

  Expected: all commands exit `0`; secret scan prints filenames only.

- [ ] **Step 5: Commit preflight**

  ```powershell
  git add docs/README.md docs/active-goal.md docs/research/2026-07-25-dusk-goal1-preflight.md docs/research/2026-07-25-dusk-source-manifest.md docs/generated-work-index.md docs/superpowers/plans/2026-07-25-dusk-goal1-discovery.md
  git commit -m "docs(dusk): record goal 1 preflight"
  ```

### Task 2: Inventory variants, plugins, and Discord deltas

**Files:**

- Create: `docs/research/2026-07-25-dusk-light-plugin-ledger.md`
- Create: `docs/research/2026-07-25-dusk-variant-differences.md`
- Create: `docs/research/2026-07-25-dusk-discord-components.md`
- Modify: `docs/README.md`

**Interfaces:**

- Consumes: Task 1 exclusion policy and raw manifests.
- Produces: complete Dusk_light inventory, Dusk-versus-Dusk_light delta ledger, empty-variant differences, and Discord component ledger.

- [ ] **Step 1: Dispatch source inventory**

  Assign `dusk-source-inventory` read-only access to source root and raw manifest directory. Require counts, hashes, installed/enabled plugin states, settings, templates, scripts, CSS, components, empty-variant differences, and Discord additions. Forbid note-body returns and all credential-bearing files.

- [ ] **Step 2: Dispatch plugin audit in parallel**

  Assign `obsidian-plugin-auditor` safe manifests plus plugin IDs only. Require current official stable versions, repositories, Obsidian pages, minimum app version, desktop/mobile support, releases, rewrites/v2 status, maintenance, security/network boundaries, known defects, and rollback. Use Agent Reach official routes first.

- [ ] **Step 3: Reconcile complete ledgers**

  Main agent combines local facts and current public facts. Include every Dusk_light plugin and every Dusk addition/removal/configuration change. Mark fields `unknown` only when evidence source and failed route are stated.

- [ ] **Step 4: Verify source bundle remains unchanged**

  Rebuild sanitized source canonical manifest and compare against:

  ```text
  D7E55C61CD6395F938F1842CBED66D71D22DCD8480BA5EE2628CD5452CB3B6AB
  ```

  Expected: exact match.

- [ ] **Step 5: Verify documentation and commit**

  Run link, secret, and whitespace checks. Commit with:

  ```powershell
  git commit -m "docs(dusk): inventory source and plugins"
  ```

### Task 3: Capture Windows first-open and update experiments

**Files:**

- Create: `docs/research/2026-07-25-dusk-windows-runtime.md`
- Create: `docs/research/2026-07-25-dusk-popups-and-features.md`
- Create: `docs/research/2026-07-25-dusk-failures.md`
- Modify: `docs/README.md`

**Interfaces:**

- Consumes: source manifest, plugin ledger, safe root, and update grouping.
- Produces: first-open timeline, startup/performance measurements, popup catalog, update/migration timeline, errors, and preserved raw screenshots/logs.

- [ ] **Step 1: Create hashed untouched copies**

  Create separate `Dusk` and `Dusk_light` baseline copies under `G:\Dusk-Goal1-Discovery-20260725\desktop-vaults`. Exclude sensitive files, then disable all sync, publishing, sharing, and external-writer plugins before open. Store pre-open manifests and copy hashes.

- [ ] **Step 2: Capture true first-open**

  Open each baseline separately. Record trust/restricted-mode prompts, plugin loads/disables, warnings, migrations, startup duration, modals, toasts, ribbons, toolbars, tabs, and every unknown popup. Preserve baselines unchanged after capture.

- [ ] **Step 3: Run visual QA**

  Assign `obsidian-visual-qa` exact baseline screenshot paths for Home, Map of Content, Mail Box, Priority Matrix, projects, areas, daily/weekly/monthly notes, capture, templates, forms, navigation, search, folder order, themes, snippets, attachments, and narrow layouts.

- [ ] **Step 4: Duplicate for update groups**

  Clone baseline copies into numbered update checkpoints. Record every offered update before applying. Apply dependency-sized groups, restart after each, capture migrations/popups/errors, and preserve rollback manifests.

- [ ] **Step 5: Reproduce bounded failures**

  When a failure exists, assign `dusk-runtime-debugger` one explicit disposable root, allowed paths, expected behavior, reproduction, verification, and rollback checkpoint. Never assign source root or `G:\Obsidian`.

- [ ] **Step 6: Write sanitized runtime evidence**

  Store screenshots/logs outside Git. Commit timelines, durations, exact errors with identifiers removed, disabled-plugin list, failure reproductions, rollback results, and feature descriptions.

- [ ] **Step 7: Verify and commit**

  Run link, secret, and whitespace checks. Commit with:

  ```powershell
  git commit -m "docs(dusk): record Windows discovery"
  ```

### Task 4: Capture physical Android discovery

**Files:**

- Create: `docs/research/2026-07-25-dusk-android-runtime.md`
- Modify: `docs/research/2026-07-25-dusk-failures.md`
- Modify: `docs/research/2026-07-25-dusk-popups-and-features.md`
- Modify: `docs/README.md`

**Interfaces:**

- Consumes: immutable tablet source manifest, Windows baseline/plugin ledger, ADB path, and safe Android root.
- Produces: tablet source comparison, startup/popup timeline, load/update matrix, screenshots, error catalog, touch/keyboard/rotation/resume findings, bilingual tests, and blocker list.

- [ ] **Step 1: Create Android disposable copies**

  Copy only sanitized Dusk and Dusk_light inputs into `/sdcard/Documents/Dusk-Goal1-Disposable-20260725`. Preserve source directory unchanged. Disable all sync/external-writer plugins in staged PC copies before pushing them to Android.

- [ ] **Step 2: Capture first-open and plugin load**

  Use `adb shell`, `adb logcat`, `adb exec-out screencap`, and `uiautomator dump` to record vault selection, trust prompts, community-plugin startup, automatic disables, warnings, modals, toasts, tours, permissions, toolbars, FAB, sidebars, tabs, and navigation.

- [ ] **Step 3: Test major surfaces**

  Capture every major Dusk surface in portrait and landscape. Test touch targets, scrolling, overflow, keyboard appearance, Vietnamese diacritics, mixed-language search, aliases, filenames, properties, templates, background/resume, and rotation.

- [ ] **Step 4: Run update duplicate**

  Preserve baseline. Duplicate it, record offered updates, apply same dependency groups as Windows, restart, capture disabled plugins/errors/popups, and preserve rollback checkpoint.

- [ ] **Step 5: Run visual QA**

  Assign `obsidian-visual-qa` Android screenshot paths paired with Windows references. Require exact visible errors and severity by surface.

- [ ] **Step 6: Write compatibility matrix**

  Classify each defect as blocker, acceptable defect candidate, or unknown. Do not accept defects on user's behalf.

- [ ] **Step 7: Verify and commit**

  Recheck tablet source manifest, link/secret/whitespace checks, then commit:

  ```powershell
  git commit -m "docs(dusk): record Android discovery"
  ```

### Task 5: Research current evidence and language implications

**Files:**

- Create: `docs/research/2026-07-25-dusk-public-evidence.md`
- Create: `docs/research/2026-07-25-dusk-language-strategies.md`
- Modify: `docs/README.md`

**Interfaces:**

- Consumes: plugin IDs, runtime findings, popup identities, and language tests.
- Produces: verified current-source record, AI/network review, and two or three viable language strategies.

- [ ] **Step 1: Research official sources**

  Use Agent Reach GitHub and web routes for repositories, releases, manifests, issues, Obsidian pages, licenses, maintenance, mobile defects, and migration notes. Use Reddit, forums, RSS, and YouTube only as labeled anecdotal evidence.

- [ ] **Step 2: Research AI/networked features**

  Establish content egress, provider/model, key storage, retention, triggers, note/settings writes, local-model support, offline/mobile behavior, and uninstall/data removal.

- [ ] **Step 3: Use NotebookLM for discovery**

  Query broad notebook `8ce765d2-f356-43a0-8717-e29975e6b257` with explicit notebook ID. Extract candidate sources and claims only.

- [ ] **Step 4: Independently verify claims**

  Confirm every material NotebookLM claim against official sources or mark it unverified.

- [ ] **Step 5: Use lean NotebookLM adversarially**

  Query lean notebook `c1fd2c71-0e8f-47c7-97ed-22e4f5f989ae` with runtime and ledger summaries. Ask for contradictions, missing risks, simpler alternatives, and lock-in.

- [ ] **Step 6: Write language strategies**

  Evaluate locale support, stable English machine properties, Vietnamese prose and diacritics, query/script breakage, dates, sorting, mobile keyboard friction, old Vietnamese Notion coexistence, bilingual template cost, and safely deferred translation. End with two or three strategies and one recommendation for Goal 2, not a selected policy.

- [ ] **Step 7: Verify and commit**

  Run link, secret, and whitespace checks. Commit with:

  ```powershell
  git commit -m "docs(dusk): research risks and language"
  ```

### Task 6: Synthesize Goal 1 discovery

**Files:**

- Create: `docs/research/2026-07-25-dusk-goal1-discovery.md`
- Modify: `docs/README.md`
- Modify: `docs/active-goal.md`

**Interfaces:**

- Consumes: all prior ledgers, timelines, matrices, public evidence, NotebookLM critique, and archived PR #4 files.
- Produces: concise navigation report covering every requested deliverable and one Goal 2 recommendation.

- [ ] **Step 1: Revalidate archived PR #4 findings**

  Inspect preserved files at `feat/obsidian-phase2:...`. Mark each reusable finding `confirmed`, `stale`, `contradicted`, or `still unknown`, with current evidence link.

- [ ] **Step 2: Build surface and workflow map**

  Describe Home, MOC, Mail Box/tasks, Priority Matrix, projects, areas, periodic notes, capture, templates/properties, forms, query engines, Tasks, Templater, QuickAdd, Meta Bind, JS Engine, controls, tabs, search, folder order, focus, themes/snippets/icons, attachments, mobile layout, startup/lazy loading, and AI/note tools.

- [ ] **Step 3: Build security/performance synthesis**

  Cover executable-note risks, credentials, network calls, ownership, licensing, mobile support, accessibility, startup cost, migration, dependency chains, rollback, FNS conflicts, configuration sync, recovery gaps, duplication, useful surprises, simpler alternatives, and structure/language lock-in.

- [ ] **Step 4: Write Goal 2 recommendation**

  Recommend what Goal 2 should personalize and implement, explicitly separating evidence-backed defaults from choices requiring user input.

- [ ] **Step 5: Update active checkpoint**

  Mark discovery awaiting independent verdict or complete only after Task 7. Keep live promotion unauthorized.

- [ ] **Step 6: Verify and commit**

  Run link, secret, Mermaid when diagrams changed, and whitespace checks. Commit:

  ```powershell
  git commit -m "docs(dusk): synthesize goal 1 discovery"
  ```

### Task 7: Independent review, publication, and first question

**Files:**

- Create: `docs/research/2026-07-25-dusk-goal1-review.md`
- Modify: `docs/research/2026-07-25-dusk-goal1-discovery.md`
- Modify: `docs/active-goal.md`
- Modify: `docs/README.md`

**Interfaces:**

- Consumes: complete Goal 1 evidence plus exact branch diff.
- Produces: independent verdict, corrected deliverables, verified branch, pushed PR, and one highest-impact personalization question.

- [ ] **Step 1: Dispatch release reviewer once**

  Assign `dusk-release-reviewer` source selection, plugin ledgers, candidate differences, Windows/Android results, secrets, manifests, rollback, FNS boundaries, Notion boundary, language strategies, and Goal 2 recommendation. Require `PASS`, `PASS WITH ACCEPTED DEFECTS`, or `BLOCK`.

- [ ] **Step 2: Resolve review findings**

  Correct every evidence gap or contradiction inside Goal 1 scope. Do not reinterpret missing physical evidence as accepted defect.

- [ ] **Step 3: Run full repository verification**

  ```powershell
  powershell -NoProfile -File scripts/check-markdown-links.ps1
  powershell -NoProfile -File scripts/test-markdown-links.ps1
  powershell -NoProfile -File scripts/test-initialize-vault-template.ps1
  powershell -NoProfile -File scripts/check-secrets.ps1
  powershell -NoProfile -File scripts/check-mermaid.ps1
  git diff --check
  ```

  Expected: every command exits `0`.

- [ ] **Step 4: Verify immutable boundaries**

  Recheck PC and tablet source safe-manifest SHA-256, confirm no tracked file under raw evidence roots, confirm `G:\Obsidian` tracked comparison paths remain untouched, and confirm every disposable vault keeps all sync/external writers disabled.

- [ ] **Step 5: Commit review**

  ```powershell
  git add docs
  git commit -m "docs(dusk): record goal 1 verdict"
  ```

- [ ] **Step 6: Push and open discovery PR**

  ```powershell
  git push -u origin docs/dusk-goal1-discovery
  gh pr create --base main --head docs/dusk-goal1-discovery --title "docs(dusk): complete goal 1 discovery" --body-file "G:\Dusk-Goal1-Discovery-20260725\checkpoints\pr-body.md"
  ```

  PR body lists scope, unchanged authority, remaining unknowns, evidence links, and exact verification commands.

- [ ] **Step 7: Ask one personalization question**

  Only after independent verdict and PR publication, ask highest-impact question first. No second question in same message.

## Self-Review

- Spec coverage: tasks cover all 18 core deliverables plus Android manifest, startup, load/update, screenshot, error, interaction, bilingual, and blocker deliverables.
- Placeholder scan: no unresolved implementation placeholder remains.
- Interface consistency: every task consumes fixed roots and manifest from Task 1; runtime tasks preserve baselines and pass sanitized evidence to synthesis and review.
- Scope: discovery only. No source, live-vault, VPS, FNS account, or personalization mutation.
