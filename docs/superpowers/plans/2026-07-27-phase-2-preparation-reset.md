# Phase 2 Preparation Reset Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Do not dispatch implementation subagents. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Produce one lean Phase 1-complete repository state, one verified cold archive of failed Phase 2 material, and one safe handoff for future Phase 2 Preparation.

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

## Future Phase 2 Preparation traceability contract

This is the compact execution contract for the later Preparation stage, not
evidence that any native test has passed. Row IDs express traceability, not
unconditional execution order. After recovery publication is separately
authorized, use this dependency order:

1. Verify source identity, hashes, disposable containment, and rollback.
2. Review onboarding, templates, configuration blocks, and executable code
   statically.
3. Inventory every plugin and classify compatibility, settings, writes,
   execution, network, credentials, and platform support.
4. Define the approved component set and add required stable child rows.
5. Start bounded capture before any authorized network-capable install/update, first enable/load, or reload/restart; otherwise enable/update/load only the approved set inside the disposable.
6. Perform read-only rendering and navigation.
7. Perform bounded synthetic writes and executable tests.
8. Perform visual and performance acceptance.

The approved component set means every inventoried plugin/component has an
explicit TEST, GATED, DEFER, or NOT APPLICABLE disposition and every enabled
item has a child row. `GS-02` never authorizes wholesale “Trust author and
enable plugins.” Static classification and no-credential preflight precede
network activation. `NET-01` may perform authorized install/update, first
enable/load, or reload/restart only under already-running capture; this is the
sole exception to ordinary `NET`-before-enable. No other `EXE`, write,
credential, or network row runs until `PLUG`/`RISK`/`NET` prerequisites pass.

The sole source authority at
`C:\Users\TienBac\Documents\New project\dusk-obsidian-vault-master` and every
contained source variant are static-only and must never be registered or opened
as Obsidian vaults. Every runtime “populated reference” or “immutable reference”
below means a fresh disposable copy whose included files match an approved hash
manifest. The manifest excludes whole plugin `data.json` files, credentials,
personal content, and separately gated secret-bearing paths; `RISK-02`
reconstructs required non-secret fields. Before/after source manifests and
hashes prove the source unchanged; Obsidian vault-registry/path snapshots prove
no canonical source variant was registered.

| ID | Source | Workflow / component | Known behavior / risk | Disposition | Platform | Setup / checkpoint | Exact action | Expected observable result | Required evidence | Mutation / rollback | Failure / stop condition |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| OPS-01 | Audit I-01 and Task 7 | Candidate identity | A SHA committed as “current” becomes stale immediately | GATED | N/A | Before and after every corrective commit | Resolve `HEAD` and `HEAD^{tree}` from Git; compare with durable `CURRENT-STATE.md` and `RESUME.md` | Git and durable identities match; tracked docs call `0f316d2` pre-audit baseline only | Command output plus durable-state update | Read-only; durable state records new identity after commit | Any mismatch, hard-coded superseded current SHA, or missing durable update stops publication |
| GS-01 | `Getting Started.md` | Author read order and sample surfaces | Five ordered onboarding steps plus one reference file define source use | TEST | Both | Fresh approved-manifest disposable copy of populated `Dusk_light` before matrix execution | Read Part 1, Part 2, Part 3, Part 4, Walkthrough, then reference; reconcile each named surface to a row below | All seven files have an explicit disposition and no named workflow is unmapped | Checked file list, hashes, and row IDs | Read-only disposable copy | Missing file, changed hash, source registration/open, or unmapped workflow stops inspection |
| GS-02 | `Vault Onboarding Part 1  - Very Important Setup.md` | Easy/manual first-open setup | Source instructions include destructive replace and wholesale community-plugin trust steps | GATED | Windows | Verified disposable root, whole-vault checkpoint, static source review, plugin inventory | Compare both approaches without deleting or trusting/enabling wholesale; complete static review and `PLUG`/`RISK`/applicable `NET` gates, then enable only approved plugins and exercise safe manual ribbon/sidebar/status setup | No wholesale trust occurs; only approved plugins load; reload, ribbon, graph, outline, Commander, and status surfaces reach source state without external writes | Trust-prompt stop evidence, approved manifest, before/after settings, labeled screenshots | Disposable-only settings; restore whole checkpoint | Wholesale enablement, path containment failure, source/live target, credential prompt, or unlisted write stops test |
| GS-03 | `Vault Onboarding Part 2 - Structure Concept.md` | PARA, ZETA, DAILY, HUB, STICKY, SYSTEM | Separation and destination rules define source behavior | TEST | Both | Fresh approved-manifest disposable populated-reference copy plus clean disposable candidate | Traverse every root/subfamily and record source-defined create, navigate, archive, or system-only behavior | Every source root and subfamily has a disposition; PARA/ZETA boundaries and destinations match source | Full path inventory and navigation/create evidence IDs | Synthetic notes only; delete or restore checkpoint | Missing root, ambiguous destination, source registration/open, or write outside disposable stops test |
| GS-04 | `Vault Onboarding Part 3 - Main Features.md` | FAB, page tasks, HUB, connections, hotkeys | Dynamic actions vary by folder/device; state transitions and commands can drift | TEST | Both | Approved disposable, command registry, `FAB-01`, `SCOPE-01`, and `CTRL-01` inventories captured | Execute every FAB context in `FAB-01`, every connection scope in `SCOPE-01`, page-task cycle, HUB/editor toolbar, every discovered write control in `CTRL-01`, and `HK-01` through `HK-25` | Every source binding/context/control has a platform disposition and each tested action invokes its current registered command with exact scope | Command IDs, inventories, hotkey dispositions, before/after properties, reading/source screenshots | Synthetic notes; restore note and config checkpoint | Missing disposition, stale command, wrong scope/destination, raw code in reading view, or untracked write stops test |
| GS-05 | `Vault Onboarding Part 4 - Setting up on Mobile.md` plus Part 1 Easy Setup | Android first-open/import setup, Mobile Home, Custom Sort, ribbons, font, FAB | Part 4 requires Part 1 before mobile configuration; destructive content replacement, initial Restricted Mode, approved enable/update order, reload, paths, and storage-provider behavior are platform-sensitive | GATED | Android | New contained disposable Android vault/container with exact path, approved copy manifest, copied-content equality target, and whole-disposable rollback; nothing newly enabled | Record initial Restricted Mode/community-plugin state; copy only approved-manifest content and prove equality for included files without touching source, `G:\Obsidian`, FNS, or personal data; exclude whole plugin `data.json`, credentials, personal content, and separately gated secret-bearing paths; reconstruct required non-secret fields only through `RISK-02`; forbid wholesale trust; pass static `PLUG`/`RISK` and applicable `NET` gates; apply only approved field-level settings and updates; run required reload/reopen; if source Easy Setup is unsafe or unsupported on current storage, record that exact workflow GATED and test the safe manual alternative separately; only then set Mobile Homepage, run Custom Sort `Sort on`, reload, set font/ribbons, and execute `FAB-01` | Android first-open/import has an explicit source-workflow disposition; only approved plugins/settings load; included copied content matches the approved manifest; excluded paths remain absent; required reopen succeeds; Mobile Home path/order/ribbons/FAB results match source or have explicit supported/unsupported dispositions | Exact Android path/storage model, approved manifest and exclusions, source and included-copy hashes, source registry/path snapshots, enabled/loaded sets, Restricted Mode/trust stop, update/reload timeline, source-versus-manual disposition, labeled top/bottom/horizontal screenshots, FAB inventory, and discard proof | Whole-disposable discard or verified checkpoint restoration; source, `G:\Obsidian`, FNS, credentials, and personal data remain untouched | Whole-config copy, unverified included file, missing exclusion, update/enable/load before gates or capture, silent substitution of configured-mobile state, path containment failure, source registration/open or write, reload failure, clipping, missing FAB disposition, or rollback mismatch blocks acceptance |
| GS-06 | `Vault Walkthrough - Concept Map.md` | End-to-end source walkthrough | Canvas embeds page-task, Mail Box, area/project, dashboard, mobile, and configuration contracts | TEST | Both | Reading/source modes available only in fresh approved-manifest disposable populated-reference copy | In that disposable copy, scroll the complete canvas and reconcile every operational instruction with stable rows; inspect code only in source mode. Inspect canonical source Markdown only with static file tools | No unique walkthrough workflow lacks TEST, GATED, DEFER, or NOT APPLICABLE disposition | Traversal log with first/last and horizontal extremes plus mapped row IDs | Read-only disposable copy; canonical source static-only | Source registration/open, unmapped instruction, or incomplete traversal stops matrix completion |
| GS-07 | `Concept Inspiration and Reference.md` | External provenance and CSS-snippet references | Links explain concepts but do not prove current releases, snippet state, or device support | GATED | N/A | Before any referenced component enters approved set; `CFG-01` ready | Refresh official source, release, issues, license, and device support for every proposed reference; inventory modified CSS snippets through `CFG-01` | Every proposed reference has current provenance/risk disposition; other inspiration stays historical; snippet configuration is explicit | URLs, versions, dates, issue IDs, `CFG-01` evidence | Read-only; no install | Missing provenance, abandoned source, incompatible license, unknown snippet dependency, or device uncertainty defers component |
| VAR-01 | Audit ALREADY PRESERVED | Variant choice | Populated light is behavioral reference; empty is possible candidate; full is bounded | TEST | Both | Hash-verified immutable source and disposable copies | Compare populated `Dusk_light` to `Dusk_light_empty`; use full Dusk only for a proven light gap | Candidate choice and each gap are evidenced; full experiments stay at three or fewer | Hash manifests, gap statement, experiment count | Disposable copies only; discard/restore | Source mutation, unexplained variant drift, or fourth full experiment stops work |
| ROOT-01 | GS-03 and audit I-04 | `HUB`, `PARA`, `ZETA`, `DAILY`, `STICKY`, `SYSTEM` | Prior inspection missed sections and confused Archive with direct note creation | TEST | Both | Fresh approved-manifest disposable populated-reference copy and updated disposable candidate | Traverse all roots; create notes only through source-defined creation families; run Concept Map and Archive actions through `WF-03A` and `WF-03B`; inspect SYSTEM read-only | Correct source-defined create, move, navigation, metadata, and rendering behavior for every root/family | Path list, created/moved artifact matrix, reading/editing screenshots | Delete synthetic artifacts or restore whole checkpoint | Any root/family untested, source registration/open, invented Archive note flow, wrong path, or cleanup mismatch stops completion |
| TPL-01 | `SYSTEM/TEMPLATE/FORMAT` and Getting Started Calendar creation | Daily, weekly, monthly; quarterly/yearly | Registered commands and source-defined Calendar creation surfaces can diverge; empty output does not prove queries | TEST | Both | Android daily first, then Windows; updated Journals/Templater; `TPL-01A` through `TPL-01C` ready; source Calendar and screenshot-defined second “or here” control inventoried under `CTRL-01` during fresh native inspection | Create daily, weekly, and monthly once through current registered commands and independently through Calendar double-click or the actual supported device gesture; give every creation surface an explicit Windows/Android disposition, test the current mobile alternative separately when hover/double-click is unsupported, execute all three query fixtures, and mark quarterly/yearly template execution NOT APPLICABLE | Every supported surface creates one correct filename, period, dated path, frontmatter, template, and reading render with no duplicate or `Untitled.md`; unsupported gestures and alternatives are recorded without substitution; no invented quarterly/yearly support | Surface/gesture and command inventory, paths, properties, fixture manifest, exact rendered row sets | Remove every periodic fixture and restore config checkpoint | Uninventoried visual control, command-only substitution, missing platform disposition, picker escape, `Untitled.md`, duplicate, wrong period/path/template/query row, or residue blocks |
| TPL-01A | `template_daily_note.md` | Daily task, meeting, project, and area queries | Due Today, Overdue, and Completed each cap at 10; only Due Today and Overdue define priority sorting; project/meeting null-date behavior differs | TEST | Both | At least 12 matching Due Today tasks, 12 matching Overdue tasks, and 12 matching Completed-on-target-date tasks; negative fixtures outside every query; mixed priorities for due/overdue; matching/nonmatching meetings, projects with/without due dates, completed project, and areas | Render daily note and record exact rows for every tab/table | Due Today and Overdue have exact membership, priority order, and 10-row caps; Completed has exact membership and 10-row cap without an invented sort expectation; meeting/project/area rows and null-date ordering match source | Fixture manifest plus expected-versus-rendered membership/order/cap table and reading screenshots | Remove fixtures and restore hashes | Any source limit not exceeded by fixtures, wrong boundary/membership/supported-order/cap/null handling, invented Completed sort, missing table, or residue blocks |
| TPL-01B | `template_weekly_note.md` | Weekly title-derived Moment bounds versus Journals frontmatter bounds | Task tabs parse title through locale-sensitive Moment week rules while meeting/project tabs use `journal-start-date`/`journal-end-date`; only Due This Week defines priority sorting | TEST | Both | For both an ordinary week and a year-boundary week: exact locale, Moment/Journals versions, title/frontmatter; at least 12 matching due tasks and 12 matching completed tasks; negative tasks plus meetings/projects immediately before/on/after both candidate boundary systems; null-due projects | Record title-derived Moment and frontmatter windows before rendering; compare both windows and every task/table row; verify priority order only for Due This Week; verify exact membership and 10-row caps for both task tabs without imposing a Completed sort | Both boundary systems match and only in-range rows appear; Due This Week has source-defined priority order and cap; Completed This Week has exact membership and cap without invented sorting; project null behavior matches source; divergence is a gated source inconsistency, not a silent edit | Both calculated windows, locale/version/title/frontmatter, fixture manifest, exact rendered membership/order/cap table | Remove fixtures and restore hashes; do not fix source during Preparation | Fewer than 12 matching fixtures per independent task tab/week, missing boundary calculation, unclassified mismatch, wrong year/locale boundary/membership/supported-order/cap/null behavior, invented Completed sort, silent source correction, or residue blocks |
| TPL-01C | `template_monthly_note.md` | Monthly bounded queries and no-due quirk | Project query filters `Due_Date` before splitting, making its no-due branch apparently unreachable | TEST | Both | Tasks and completed tasks just before/start/end/after month; meetings inside/outside; active/completed projects due inside/outside/null; matching areas | Render monthly note, compare every row, and explicitly observe no-due project behavior without editing source | Task/meeting/area boundaries match source; no-due project is absent if native behavior confirms prefilter quirk; all in-range rows appear because monthly task tables have no cap | Month bounds, fixture manifest, exact rendered rows, quirk observation | Remove fixtures and restore hashes; do not fix source | Silent source correction, wrong boundary/null behavior, missing row, or residue blocks |
| TPL-02 | `SYSTEM/TEMPLATE/FORMAT` | Area, area note/subnote, project, project note | Area is MOC/folder oriented; project uses dashboard and explicit area connection | TEST | Both | Populated relationships, disposable create checkpoint, `TPL-02A` and `SCOPE-01` ready | Create each family through every source/current FAB or command and link project to area through exact suggester scope | Folder/note names, properties, connected components, query rows, and dashboard filter match source | Before/after paths, properties, relationship/query screenshots | Remove family folders/notes or restore checkpoint | Wrong folder, missing/leaking connection, stale command, wrong query row, or residue blocks |
| TPL-02A | `template_area.md` | Area components, projects, resources, meetings, and task queries | Type, connection, tag, completion, and sort filters can pass empty | TEST | Both | Positive/negative area note/subnote, connected/unconnected project, documentation/workstation, meeting tag, and ongoing/completed task fixtures with controlled dates/status | Render every area tab and compare exact row membership/order | Components exclude area/subnote types as coded; only connected projects/resources and matching area-tag meetings/tasks appear; ongoing/completed and sort order match source | Fixture manifest and expected-versus-rendered rows for every tab | Remove fixtures and restore hashes | Cross-area leakage, missing/extra row, wrong task state/order, empty-only proof, or residue blocks |
| TPL-03 | `SYSTEM/TEMPLATE/FORMAT` | Fleeting, literature, permanent | ZETA connection and machine-key contracts must remain stable | TEST | Both | Disposable ZETA checkpoint | Create all three, connect/alias synthetic English/Vietnamese notes, search and reopen | Correct ZETA paths, fields, links, aliases, search, and reading render | Paths, frontmatter, search/index screenshots | Remove notes or restore checkpoint | Translated machine key, broken link/search, or cleanup mismatch blocks |
| TPL-04 | `SYSTEM/TEMPLATE/FORMAT` | Contact, documentation, generic new note, workstation | PARA resource/admin destinations, connection scopes, and contact queries can drift | TEST | Both | Disposable PARA/resource checkpoint; `TPL-04A` and `SCOPE-01` ready | Create each template, test every defined connection scope, and execute contact query fixtures | Correct paths/properties/scopes, exact contact query rows, and readable result | Created-note matrix and exact query/navigation screenshots | Remove notes or restore checkpoint | Wrong root/scope, malformed tag, wrong query row, or residue blocks |
| TPL-04A | `template_contact.md` | Contact meetings and ongoing/completed tasks | Tag joins, completion state, and due-date sorting can pass empty | TEST | Both | Matching/nonmatching contact-tag meetings plus ongoing/completed tasks with controlled due dates and SYSTEM-path negative fixture | Render every contact tab and compare exact membership/order | Only matching contact-tag rows appear; SYSTEM task is excluded; ongoing/completed split and due-date order match source | Fixture manifest and exact expected-versus-rendered row sets | Remove fixtures and restore hashes | Cross-contact leakage, wrong completion/path/order, empty-only proof, or residue blocks |
| TPL-05 | `SYSTEM/TEMPLATE/FORMAT` | General, standup, team meetings | Variants have unique sections/links plus meeting page-task state | TEST | Both | Disposable meeting checkpoint; `TPL-05A` ready | Create every meeting variant, execute unique-content checks, toggle Not Done/Done, and verify Mail Box | Correct template/path/content, status/icon transition, and Mail Box visibility | Properties, variant-content checklist, before/after screenshots | Remove meetings or restore checkpoint | Wrong variant/content/status, missing Mail Box row, or cleanup mismatch blocks |
| TPL-05A | Three `template_meeting_*.md` files | Variant-specific controls and content | Team Previous/Next emits wiki-link text from Templater execution time, not `scheduled_date` or note title; source does not create neighboring notes | TEST | Both | One fixture from each author template; capture exact Templater execution date separately from title and `scheduled_date`, including one deliberately backdated or future central meeting; no neighbor-note fixture required | Verify general meeting controls/sections, standup's four agenda prompts, and exact Team Previous/Next generated wiki-link text plus normalized vault-relative target paths at execution date minus/plus seven days; do not require target files to exist | Each variant contains unique source content and excludes another variant's block; Team link text and target paths match the execution-date anchor and remain unambiguous when title or schedule differs | Rendered/source screenshots, execution/title/schedule values, exact generated link text, and normalized target paths | Remove fixtures and restore checkpoint | Missing/extra unique block, ambiguous anchor, wrong generated text/path/date, undeclared neighbor-file requirement, or residue blocks |
| TPL-06 | `SYSTEM/TEMPLATE/CODE` and `CSS` | Page-task scripts, Calendar View, Tasks Manager | Vault code executes and shared configuration can diverge | GATED | Both | Static source/dependency review, `CFG-02`, `PLUG`/`RISK`/applicable `NET` gates, whole-vault checkpoint | Compare all seven configuration locations through `CFG-02`; then execute every `EXE-01` through `EXE-05A` row | Every executable path has exact target, expected diff/view, evidence, rollback, platform disposition, and approved configuration | Source hashes, dependency/config report, and EXE-row evidence | Whole checkpoint; restore after each EXE row | Missing EXE/config disposition, unreviewed code, hidden egress/write, or non-reversible mutation stops |
| EXE-01 | `SYSTEM/TEMPLATE/CODE/toggle_todo.md` | Command containing project, meeting, and ordinary branches | Branch precedence and machine values differ from dotted onboarding prose | TEST | Both | Ordinary, meeting, and project fixtures; project starts once at `2 In Progress` and once without prior value; dependencies approved | Execute the current Templater action loading `toggle_todo.md` on all three fixture types through full source-defined cycles | Ordinary cycle changes only `file_state`/`closed`; meeting toggles boolean `meeting_status`/`closed`; project uses exact `4 Completed` and restores prior value or exact `1 To Do`; periods are display prose only | Per-branch/state frontmatter diff, Iconic/Mail Box evidence, command and source hash | Restore each fixture and verify baseline hash | Untested branch, dotted machine value, wrong precedence/state, unrelated write, hidden request, or rollback mismatch blocks |
| EXE-02 | `toggle_todo_meeting.md` | Meeting listener/synchronizer | File-open and metadata listeners derive `closed`/icon from already changed `meeting_status`; repeated render can duplicate handlers | TEST | Both | Approved JS Engine; synthetic meeting baseline; bounded write/event capture | Render listener once in reading mode; change `meeting_status` false/true/false through `EXE-01` or Meta Bind; close/reopen, reload, render again, and repeat one change | Listener never changes `meeting_status`; each input change yields one stable `closed`/icon state and no repeated write/event storm after reopen/reload | Source hash, per-change frontmatter/icon diff, bounded event/write count, reload evidence | Restore note and workspace/plugin checkpoint | Listener toggles source field, duplicate handler/write loop, timestamp churn, unrelated write, or rollback mismatch blocks |
| EXE-03 | `toggle_todo_revert.md` | Project listener/synchronizer | File-open and metadata listeners track `_previous_status`, `closed`, and icon from current `Status` | TEST | Both | Approved JS Engine; project fixtures with `2 In Progress` and no prior value; bounded write/event capture | Render listener once; change exact machine `Status` through Meta Bind/`EXE-01`, complete/revert both cases, close/reopen, reload, render again, and repeat one change | Listener records noncompleted prior status once, sets/removes `closed` and icon for exact `4 Completed`, and command restores `2 In Progress` or exact `1 To Do`; no duplicate writes | Source hash, state diffs, icon, bounded event/write count, reload evidence | Restore notes and workspace/plugin checkpoint | Dotted machine value, lost/churning prior state, duplicate handler/write loop, unrelated write, or rollback mismatch blocks |
| EXE-04 | Calendar Markdown/JS/CSS source | Calendar static gate, Monday-first configuration, and daily-path inconsistency | `Calendar View.md` sets `firstDayOfWeek: "1"`/`options: "style7"` but omits `dailyNoteFolder`; code requires the weekday value, builds root-level daily links, and dynamically evaluates inputs | GATED | Both | Source hashes, exact Markdown input, `PLUG`/`RISK` gates, controlled `EXE-04A` fixtures | Statically allowlist `pages: ""`, views `month`/`week`/`list`, `firstDayOfWeek: "1"`, initial `options: "style7"`, known task categories, date format, and no arbitrary expression; record missing-folder mismatch; treat other styles as optional personalization controls; render unchanged source only in disposable | Dynamic inputs are bounded; Monday-first and initial style configuration equal source; root-versus-`DAILY/DAILY` behavior is recorded as source inconsistency, not silently fixed; Calendar cannot pass promotion until exact daily target is resolved by later approved decision | Source/config excerpt, eval-call inventory, actual link target, first-day/style values, mismatch disposition | Read-only source; restore workspace; no source edit | Wrong/missing first day or initial style, arbitrary expression, unreviewed eval path, hidden egress/write, raw code, or unclassified daily target blocks Calendar |
| EXE-04A | Calendar `view.js` behavior | Modes, Monday-first alignment, navigation, filters, statistics, categories | Functional rendering and correct counts do not prove weekday/header/date/task alignment | TEST | Both | Controlled category fixtures across adjacent dates plus one unambiguous Monday-through-Sunday week with tasks on every date | In month and week modes map named weekday headers to exact dates and task cells, proving Monday is first and Sunday last; in month, week, and list modes test current/previous/next, filter toggle, statistics/category counts, rendering, and exact link target/return | Every header/date/task cell aligns with manifest in month and week modes; each fixture appears only in its category/date; counts match; all modes/controls work; exact daily path matches `EXE-04` disposition | Weekday/date/task alignment map, fixture/category/count table, link targets, full reading screenshots | Remove fixtures and restore layout/checkpoint | Sunday-first or shifted cell, missing/wrong category/count/date, broken mode/control/link, path contradiction, or residue blocks |
| EXE-05 | Timeline Markdown/JS/CSS source | Timeline static configuration and write gate | Source config controls whole-vault pages, inbox, daily folder/format, section, forwarding, options, selector, and eval-backed sorting/icons | GATED | Both | Source hashes, `Tasks Manager.md` input captured, `PLUG`/`RISK` gates, write checkpoint, `EXE-05A` fixtures | Compare exact `pages`, `inbox`, `dailyNoteFolder`, `dailyNoteFormat`, `section`, `forward`, `options`, default selector/order/sort; allowlist no arbitrary expression; approve exact write targets before render | Runtime config equals reviewed source; daily target is `DAILY/DAILY`; quick entry may write only approved fixture files under exact `# New Tasks`; completion may touch only origin task | Redacted config/eval inventory, approved target manifest, source hashes | Whole checkpoint; no render/write before gate | Config drift, arbitrary expression, whole-vault unbounded target, wrong heading/path, or hidden egress blocks Timeline |
| EXE-05A | Timeline `view.js` behavior | Categories, counters, filters, focus, selector, insertion, completion | One add/completion smoke path misses classification and alternative destinations | TEST | Both | Fixtures for Todo, Overdue, Unplanned, Process, completed, cancelled, scheduled, start, recurrence, forwarded daily task; current daily, Inbox, and one alternative eligible file have hashes | Verify Todo/Overdue/Unplanned counters and filters, Today focus, forwarding/classification, selector choices; add once to current daily and once to alternative file under exact `# New Tasks`; complete an originating task | Counts/categories equal fixture manifest; selector targets exact files; both insertions are single exact diffs; completion changes only origin task and all behavior restores | Fixture/count/category table, selector list, exact Markdown diffs, reading screenshots | Restore all files/checkpoint and verify hashes | Wrong count/category/filter/focus/destination/heading, duplicate/unrelated write, failed completion, or rollback mismatch blocks |
| WF-01 | Audit I-03, GS-01, GS-04, GS-05 | Desktop/Mobile Home Documentation/Docs, Workstation/Station, Permanent, Literature, Fleeting, and Concept Maps/Mind Map tables | Historical navigation failed, Todoist rendered raw, Android clipped; these exact tables combine modified-descending sort with a 15-row cap while other Home tables differ | TEST | Both | Correct platform Home after updates; `TODO-01` passed; static inventory confirms every table with both `sort file.mtime desc` and `limit 15`; separate or resettable 17-note matching fixture with distinct mtimes exists for each | Open Home, settle, traverse all axes, inventory every visible action, then test each inventoried capped table against its own fixtures on both platform Homes | Correct Home and actions; no raw/clipped/error-like/Todoist credential content; every inventoried table shows exactly its 15 newest matching notes in modified-descending order; no uncapped/differently sorted table inherits this assertion | Per-table source/query inventory, fixture paths/mtimes, exact rows, labeled top/bottom/horizontal screenshots, action log | Remove fixtures or restore checkpoint and verify both Home baselines | Missing table disposition, wrong Home/action, raw/token content, clipping, wrong per-table count/order, overgeneralized assertion, or cleanup mismatch blocks |
| WF-02 | GS-04 and audit operational input | Active-note, FAB, Mail Box, and File Explorer hovered-file Page Task paths | Active-note success does not prove source-defined `Ctrl + Space` targets an unopened hovered file; project/meeting states are special | TEST | Both | Synthetic normal/project/meeting notes plus normal note A active and unopened note B visible in File Explorer; baseline hashes; pointer/hover capability recorded | Cycle active/FAB/Mail Box states; then hover B without opening it and invoke `Ctrl + Space` through full state cycle, proving A byte-for-byte unchanged while B property, icon, and Mail Box row change; Android without hover/pointer records this surface NOT APPLICABLE and tests its current alternative separately without substitution | Every supported path targets only intended note and matches source state/icon/Mail Box transitions; project prior status restores; unsupported Android hover and its alternative have separate explicit dispositions | A/B hashes and frontmatter diffs, active/hover targets, icon/Mail Box screenshots, platform capability/disposition | Restore all note states/checkpoint and verify A/B hashes | Active note changes during hovered-file action, B opens or stays unchanged unexpectedly, missing platform disposition, substituted workflow, wrong state/icon/row, lost prior status, or write outside fixtures blocks |
| WF-02A | GS-03 and GS-04 | Map of Content search/navigation/configuration | Source defines quick search/navigation and source-mode sorting/exclusions | TEST | Both | Fresh approved-manifest disposable populated-reference copy plus uniquely titled synthetic note; Map configuration captured in source mode | Search exact and partial title, open result and return; inspect configured sort/exclusions; change one disposable exclusion, verify result disappears, then restore | Search finds expected concept, navigation opens correct note, sort/exclusion values are inspectable, disposable exclusion changes only configured result and restores exactly | Query/result/path screenshots, redacted config excerpt, before/after result set | Restore disposable-copy configuration checkpoint and remove synthetic note | Source registration/open, missing result, wrong navigation, opaque config, unrelated result change, or rollback mismatch blocks |
| WF-03 | GS-03, GS-04, walkthrough lines 187-214 | Area/project relationships and large-project dashboard | Area is MOC; large-project flow duplicates Base Project and edits name/path before filtering | TEST | Both | Fresh approved-manifest disposable populated-reference copy, synthetic linked area/project, and synthetic project folder with known notes | Inspect relationships; open dashboard via ribbon/hotkey/FAB; duplicate Base Project, select duplicate, edit name and folder path, then filter | Connected components appear under area; duplicate project targets exact folder and dashboard shows only its known notes | Relationship properties, dashboard config before/after, full-surface filtered screenshots | Remove duplicate dashboard entry and synthetic pair/folder; restore disposable-copy config checkpoint | Source registration/open, missing relation, wrong duplicate/name/path/filter, stale entry, or platform inconsistency blocks |
| WF-03A | GS-03 structure | Concept Map Canvas and Excalidraw destinations | Source requires all Canvas and Excalidraw files under `PARA/RESOURCES/CONCEPT MAP` | TEST | Both | Disposable resource checkpoint; Canvas core and Excalidraw compatibility recorded | Create one synthetic Canvas and one Excalidraw through current registered commands, save, close, reopen, edit once, and reopen again | Both files reside only in Concept Map, persist valid content, reopen/render, and remain navigable/searchable | Paths, file hashes, reopen/edit screenshots, manifest versions | Delete files or restore checkpoint; verify no attachments remain | Wrong destination, unreadable/reopen failure, orphan attachment, unsupported platform without disposition, or cleanup mismatch blocks |
| WF-03B | GS-03 structure | Archive completed Project/Area Family folders | Source Archives behavior is moving completed families, not creating Archive notes | TEST | Both | Synthetic completed Project Family and Area Family with links, dashboard entries, and baseline hashes | Move both folders into `PARA/ARCHIVES`, reopen linked notes, inspect backlinks/navigation/dashboard behavior, then restore exact original paths | Archived families remain readable/navigable with known link behavior; restoration returns paths, links, dashboards, and hashes to baseline | Before/moved/restored path manifests, link/backlink/dashboard screenshots, hashes | Move folders back and restore checkpoint | Invented direct Archive note, broken link/navigation, stale dashboard entry, data loss, or restore mismatch blocks |
| WF-04 | Audit I-03 | Android daily and Journals v3 | Daily config existed, but seven external controls used removed Journals 1.x ID | TEST | Android first, then Windows | Updated plugins, command registry and settings captured | Create today's daily through calendar, Home, toolbar, hotkey, and command; repeat weekly/monthly | Every entry point uses registered current ID and creates one correctly named/path note | Registry, safe settings fields, action/path/render evidence | Whole checkpoint; remove created periodic notes | Missing/stale ID, duplicate/wrong note, warning, or cleanup mismatch stops subsequent workflows |
| WF-05 | Audit I-03 | Specific-file hotkeys and Templater | Three specific-file bindings and one `insert-` prefix were stale; picker created monthly `Untitled.md` | TEST | Both | All four historical anchors mapped to current command IDs, configured destination/context, template, and checkpoint | Exercise every mapped binding/action from each context named by current configuration; if a command exposes finite choices, execute every choice or record GATED/DEFER/NOT APPLICABLE | Every command resolves; prompt scope, filename, exact destination, metadata, and cleanup equal current mapping | Complete anchor/context/choice map, redacted config, created-note evidence | Whole checkpoint; remove generated files | Unmapped choice/context, whole-vault picker, stale command, `Untitled.md`, wrong folder, or residue blocks |
| WF-06 | Audit I-02 and RISK-01 | Rendering, modes, scrolling, visual regressions | Navigation reopens editing mode; dynamic output needs settling; dimensions do not prove maximized | TEST | Both | Desktop window state verified; native Android orientation recorded | Re-select source/editing or reading per check, wait at least five seconds and until stable, capture top/bottom/all horizontal extremes | Reading view shows source-defined output; source view shows inspectable code; no reported Home/overflow/Journals visual defect remains | Window-state proof and labeled checkpoint screenshots | Read-only | Partial traversal, unsettled layout, wrong mode, or missing reported-defect check blocks visual acceptance |
| CFG-01 | `Concept Inspiration and Reference.md` lines 29-31 | CSS snippet inventory/configuration | Modified borrowed snippets require explicit enabled-state and dependency checks | GATED | Both | Hash-verified source snippet directory, disposable Appearance settings checkpoint | Inventory every source snippet filename/hash and enabled state; map each modified/reference-dependent snippet to platform/surface; toggle one at a time only in disposable and restore | Every snippet has provenance/modified-status/platform/disposition and observable dependency; enabled set restores exactly | Snippet/hash/state inventory, mapped surface screenshots, before/after enabled set | One-at-a-time toggle; restore settings/checkpoint | Unknown executable/import behavior, unexplained modified snippet, hidden surface dependency, or restore mismatch defers snippet |
| CFG-02 | Walkthrough lines 123-169 | Seven-location configuration parity | Desktop/Mobile Home, three toggle files, and desktop/Mobile Mail Box share machine fields that can diverge | GATED | Both | Source hashes; source-mode access; no secret-bearing plugin configuration copied | Extract configuration keys from both Homes, `toggle_todo`, `toggle_todo_meeting`, `toggle_todo_revert`, and both Mail Boxes; produce redacted field-by-field equality/difference report; propagate no change during Preparation | Shared folder/status/icon/date/property keys are byte-equal or each source-specific difference is explained and dispositioned; secrets absent | Seven source hashes, key-only redacted comparison, difference dispositions | Read-only; any later change must update all affected locations from checkpoint | Missing location/key, unexplained mismatch, secret value, wholesale config copy, or silent edit blocks executable tests |
| TODO-01 | Part 1 lines 8-10 and audit I-03 | Todoist Home setup | Source onboarding offers credentialed setup; historical Home showed raw directives/token prompts | GATED | Both | Todoist disabled/unconfigured, no token, Home checkpoint, network capture preflight available but inactive | Open normal Home with Todoist off and no credentials; inspect setup surface in source/reading modes and stop before token entry; credentialed test requires separate user approval and non-production account | Normal Home remains usable with explicit disabled fallback and no raw directive, token prompt, or broken block; credentialed behavior remains DEFER without separate authority | Disabled manifest/config field, Home screenshots, no-credential stop record | Read-only; keep integration off and restore workspace | Credential prompt/content on normal Home, token entry, personal task exposure, raw directive, or network request outside `NET-01` blocks Home |
| FAB-01 | Part 3 lines 5-12 and walkthrough lines 79-86 | Context/device-dependent FAB inventory | HUB, Projects, Areas, other roots, and device states expose different actions | TEST | Both | Approved disposable fixtures in HUB, Projects, Area Family, Area Note/Subnote, every PARA resource family, every ZETA family, Daily, Sticky, and System on Windows/Android | In every context/platform inventory all visible and absent actions; prove HUB lacks Delete; invoke every read-only action and route every write action through `CTRL-01` child row | Every context/action has TEST, GATED, DEFER, or NOT APPLICABLE; source differences and unsupported settings actions are explicit; no cross-context leakage | Context/platform/action inventory, screenshots, command IDs, child-row links | Synthetic fixtures; restore note/workspace after each context | Missing context/action disposition, Delete in HUB, wrong folder action, untracked write, or cleanup mismatch blocks FAB acceptance |
| SCOPE-01 | Walkthrough lines 88-92 and FORMAT suggesters | Connection suggester scopes | PARA, ZETA, project-area, documentation, and workstation scopes must not leak | TEST | Both | Positive and negative fixtures for `#project`, `#area`, workstation/documentation, and all three ZETA note types | Test documentation (`#project`/`#area`), project/project-note (`#area` only), fleeting/literature/permanent (three ZETA types only), and workstation (project/area/workstation/documentation) suggesters | Every allowed fixture appears; every disallowed cross-scope fixture is absent; nested area tag behavior matches source | Per-template allowed/forbidden fixture and result sets, screenshots | Remove fixtures and restore note hashes | Whole-vault picker, missing allowed result, forbidden result, wrong nested-area behavior, or residue blocks |
| CTRL-01 | GS-04 and PR7 write map | Complete write-control inventory | Convenient samples can omit Datacore, Meta Bind, Mail Box, QuickAdd, FAB, or toolbar writes | GATED | Both | Approved plugin set loaded; every visible write-capable control inventoried by surface/context/platform before first write | Add one stable child row for every discovered control with exact command/control ID, fixture, target field/path, expected diff, evidence, rollback, and stop; execute every child or disposition it | Zero write-capable controls lack a child/disposition; each executed control writes only declared target and restores baseline | Complete control/child map, exact diffs, hashes, rendered evidence | Restore after every child; whole checkpoint available | Unmapped control, arbitrary sample, wrong/multiple target, hidden egress, or rollback mismatch blocks component |
| PLUG-01 | Audit ALREADY PRESERVED and RISK-02 | Every source and approved plugin/component | Import-disabled is not incompatibility; generic load checks can miss archived triggers or automatic network egress | TEST | Both | Pre-update manifest, static source/manifest/settings classifications, no-credential preflight, and whole checkpoint; network-capable components remain off until `NET-01` capture runs | Inventory/classify every plugin and add child rows; pass static `RISK` gates; route every network-capable authorized install/update, first enable/load, and required reload/restart through already-running `NET-01` capture; update/retry other compatible approved plugins only after gates; record post-update enabled/loaded sets and execute applicable `REG` rows | Every approved component has version, compatibility/settings/load proof, exact historical trigger, evidence, rollback, and stop rule; network-capable components separately evidence automatic startup/load and action-triggered egress; every other component has explicit disposition | Pre/post manifest diff, classifications, enabled/loaded sets, `NET-01` automatic/action attribution, child/REG evidence | Whole-vault checkpoint; field-level safe changes only; controlled activation only under capture | Authorized network transition before capture, other enable/update before gates, missing disposition/child, unattributed egress, failed load, secret prompt, or drift blocks approval |
| PLUG-02 | Audit ALREADY PRESERVED | Dataview/DatacoreJS | Fresh Dataview defaults disabled two JS flags; DatacoreJS rendered on tablet but lacked complete write coverage | TEST | Both | Post-update safe settings captured without source `data.json`; every Datacore write control mapped in `CTRL-01` | Enable only required explicit Dataview JS fields; render every inventoried Dataview/Datacore surface; execute every Datacore write child | No disabled-JS/raw-code error; every query renders; each write changes only its declared synthetic target | Safe-field before/after, surface inventory, reading screenshots, child diffs | Restore settings and each note/checkpoint | Uninventoried surface/control, whole-config copy, raw code, unrelated write, or failed Android render blocks |
| REG-01 | PR4 revalidation line 46 | Homepage `openWhenEmpty: false` cold launch | Historical empty-window edge was retained but never isolated | TEST | Both | Correct Home configured, all notes/tabs closed, `openWhenEmpty` value captured, app fully stopped | Cold-launch with no previously open note and wait for settled workspace | Configured platform Home or explicit usable fallback opens; no blank/unrecoverable window | Setting field, pre-stop workspace, cold-launch video/screenshots and timing | Read-only; restore workspace layout | Blank window, wrong Home, manual rescue required, or setting drift blocks Home acceptance |
| REG-02 | PR7 RT-01/RT-02 | Commander 0.5.2 skipped/blocked | Old version failed on Windows and Android; update precedes testing | TEST | Both | Manifest records old/current-compatible version; disposable checkpoint | After prerequisite gates, update from 0.5.2, restart, verify loaded set, invoke every source-listed Commander status/ribbon action | Plugin loads on each supported platform and all source-listed commands execute; unsupported platform receives explicit manifest-backed disposition | Version/manifest, enabled/loaded set, command action screenshots | Restore whole checkpoint after test | Testing 0.5.2 as acceptance, failed load/action, unsupported platform without disposition, or rollback mismatch blocks |
| REG-03 | PR7 RT-03 | Highlightr and Settings Search `parentNode` error | Settings-index interaction raised null `parentNode` | TEST | Windows | Both plugins current/compatible; fresh bounded console capture | Open Settings Search, build/search settings index, open Highlightr settings, change and revert one harmless synthetic style setting | Search/index/settings views open with no `parentNode` exception and reverted setting matches baseline | UI screenshots, bounded fresh error capture, before/after setting field | Revert field or restore checkpoint | `parentNode`/uncaught error, missing index result, or failed restore blocks either plugin |
| REG-04 | PR7 RT-04 | Novel Word Count file-explorer leaf | Minimal workspace lacked file-explorer leaf and raised error | TEST | Windows | Current plugin; two workspace checkpoints with file explorer present and intentionally absent | Reload and invoke word-count behavior in each workspace state | Present-leaf state works; absent-leaf state fails gracefully or records explicit required dependency without uncaught error | Workspace manifests, UI result, bounded fresh error capture | Restore original workspace checkpoint | Uncaught error, corrupt workspace, silent wrong count, or failed restore blocks plugin |
| REG-05 | PR7 compatibility matrix | Quick Explorer and Status Bar Organizer | Desktop-only manifests must never become Android dependencies | TEST | Windows | Current compatible manifests and source setup | Invoke Quick Explorer navigation and configure/revert one status-bar order change | Both desktop actions work and revert; manifest records desktop-only status | Manifests, command/settings screenshots, before/after order | Restore config checkpoint | Failed desktop action, hidden external write, or restore mismatch blocks |
| REG-05A | PR7 compatibility matrix | Quick Explorer and Status Bar Organizer on Android | Plugins are not loadable by design on Android | NOT APPLICABLE | Android | Android manifest and approved-component dependency graph captured | Verify both plugins are excluded/disabled and no mobile Home/FAB/hotkey depends on their commands | Neither plugin loads; all Android navigation/status workflows use supported alternatives | Manifest, enabled/loaded set, dependency check | Read-only | Plugin enabled, unresolved command dependency, or missing alternative blocks Android candidate |
| REG-06 | PR7 surface/security map line 46 | Paste Image Rename and attachment links | Rename/link-integrity workflow remained untested | TEST | Both | Synthetic note plus generated non-secret image in disposable attachment checkpoint | Paste image, accept deterministic rename, open embed, rename/move attachment once, verify link repair, then restore/remove | Attachment has configured path/name; embed opens after each operation; no orphan or broken link remains | File/link diffs, hashes, rendered embed screenshots | Remove synthetic attachment/note or restore checkpoint | Broken embed, wrong destination, orphan, unrelated rewrite, or cleanup mismatch blocks |
| REG-07 | PR7 functional revalidation lines 268-269 | QuickAdd nested creation | Opaque choice ID did not prove complete choice-to-template/destination mapping | TEST | Both | Inventory every top-level/nested QuickAdd choice in every `FAB-01` context; whole checkpoint | Give every discovered choice a disposition/`CTRL-01` child, then invoke every TEST choice from every context where it appears | Every visible choice maps to current ID, template, prompt scope, filename, destination, and context; no opaque or omitted branch remains | Complete context/choice/ID map, created paths/properties, rendered screenshots | Remove created notes/folders or restore checkpoint | Opaque/unmapped/omitted choice, whole-vault picker, wrong template/path/name, or residue blocks |
| REG-08 | PR7 write map lines 256-258 and 320 | Mail Box, Meta Bind, Datacore and remaining writes | Render checks did not prove complete exact write destinations | TEST | Both | `CTRL-01` has every Mail Box, Meta Bind, and Datacore control; synthetic fixtures have baseline hashes | Execute every TEST child control and compare exact target diff and rendered state after each | Only declared active note/frontmatter/originating task changes; every baseline restores | Complete child-control results, exact frontmatter/Markdown diffs, reading screenshots | Restore after each child and verify hashes | Omitted control, write to wrong/multiple notes, unexpected field, hidden egress, or rollback mismatch blocks |
| NET-01 | Audit I-06 and RISK-04 | Network, credential, publish/share, AI, beta, sync, encryption | Four hosts lacked initiator attribution; idle silence misses automatic update/enable/load/startup egress | GATED | Both | Approved component child row; static classification and safe-field/no-credential preflight complete; component off; bounded capture and rollback ready | Start capture and record idle baseline before any authorized install/update, first enable/load, or required reload/restart; under capture perform that controlled transition and attribute automatic startup/load requests; under the same or a new bounded capture invoke one documented action and attribute action-triggered requests without secrets | Capture precedes every network-capable transition; automatic and action-triggered requests are separately attributed to process/plugin, expected destination, and payload class; idle silence alone never passes | Timestamped idle, transition/startup, and documented-action attribution records plus component states | Keep off by default; controlled enable/load is only under capture; restore checkpoint; no live account, credentials, personal notes, or production service | Communication before capture, unattributed automatic or action request, credential demand, note egress, unexpected endpoint, or unavailable capture keeps component disabled and blocks it |
| LANG-01 | Audit I-07 | English/Vietnamese filenames, aliases, fields, search, URI | Console mojibake can mislead; machine keys/paths must stay stable | TEST | Both | Synthetic bilingual notes and explicit English machine schema | Create, save, link, alias, index, search, reopen, and URI-open notes through normal app flow | Unicode persists byte-for-byte; aliases/search/URI work; machine keys and ISO dates remain exact | In-app screenshots plus Unicode-aware lengths/hashes | Remove notes or restore checkpoint; FNS excluded | Corruption, search/link/URI failure, translated key, or reliance on console glyphs blocks policy choice |
| PERF-01 | Audit I-08 | Weak-tablet readiness and interaction | Historical timings are diagnostic only; prior “usable” and “unbounded” terms were subjective | TEST | Android | Physical tablet, fixed variant/plugin manifest, Home target, three cold force-stop starts and three warm reloads | For each run, observe at most 60 seconds; visible means Home title plus first rendered block drawn and layout stable; interactive means Home-to-Map navigation, today's-daily open, and reading/editing toggle each respond within 10 seconds | PASS if all six launches become visible/interactable within 60 seconds, all three actions respond within 10 seconds, and no crash/ANR; DEFER if launches finish without crash inside 60 seconds but an action exceeds 10; BLOCK if any launch/action never responds within 60 seconds or crashes/ANRs | Six timestamped runs, device/Obsidian/WebView/plugin versions, per-action timings, warnings, classification calculation | Read-only except disposable app/workspace state; restore start state between runs | Missing sample/context, changed manifest, timeout, crash/ANR, or uncomputed classification blocks verdict |
| FULL-01 | Audit operational input and variant rule | Exact full-only plugin deltas | Full Dusk adds risk and is not a second candidate | DEFER | Both | Only after a documented `Dusk_light` gap | Identify exact delta and dependency; run one bounded disposable experiment if separately justified | Experiment closes named gap or records failure; cumulative count remains at most three | Gap statement, plugin delta, result, rollback proof | Disposable full copy; discard after run | No proven gap, unsafe/credential component, or experiment count over three stops escalation |
| EXT-01 | Audit operational input | Current Dusk GitHub/Discord additions | Historical additions lack current provenance, release, issues, and device proof | GATED | Both | Before any addition enters approved set | Refresh official repository/release/issues/license and supplied Discord provenance; inspect executable/write/network behavior and dependencies | Addition is current, attributable, licensed, bounded, and has platform-specific child test; otherwise deferred | URLs, commit/release, issue IDs, source hash, child row | No install until gate passes; disposable checkpoint | Missing source/version/license, unsupported device, broad write/egress, or abandoned code defers |
| RISK-01 | 39 skipped screenshots and audit I-02 | Historical visual completeness | Audit did not semantically inspect images; reported defects may be incomplete | GATED | Both | Before claiming visual completeness | Do not reuse images as acceptance; map every reported defect to WF-01, WF-04, or WF-06 and record image-derived completeness as unproved | Fresh native checks cover every reported issue; no exhaustive historical-image claim is made | Trace links to fresh labeled captures | Read-only | Any visual claim based only on old image, or reported defect without fresh row, blocks acceptance |
| RISK-02 | 555 unavailable plugin `data.json` files | Missing plugin settings | Values are absent from sanitized corpus and may contain secrets | GATED | Both | Static source/manifest/settings-schema review before enable; approved plugin child row and checkpoint exist | Define allowlisted non-secret fields statically; after approved load inspect only those fields in-app, capture manifest/version/load state, and repair field-by-field if required | Required behavior works from observable allowlisted settings without reconstructing missing values | Redacted field names/state, static allowlist, manifest/version/load proof | Field-level change from whole checkpoint; no source config copy | Enable before static gate, inferred missing value, secret exposure, whole-file copy, or unknown field blocks plugin |
| RISK-03 | 331 unavailable browser-profile files | Browser state | No approved Preparation workflow requires retained browser state | NOT APPLICABLE | N/A | Re-evaluate only if an approved workflow explicitly needs browser state | Record N/A reason; if dependency appears, add separately approved child row without importing old profile | No browser dependency in approved matrix, or new child gate exists | Approval record | No mutation | Any implicit reliance on old cookies/profile/login stops workflow |
| RISK-04 | 90 unavailable raw logs | Missing network evidence | Historical raw values cannot prove current initiator or behavior | GATED | Both | NET-01 bounded capture for each approved network-capable component | Generate fresh minimal attribution evidence; never reconstruct old log values from summaries | Each approved network component has current initiator/destination result or remains off | Fresh bounded record linked to component row | Keep component off; restore disposable | Missing capture, unattributed request, or inferred old value blocks component |
| PERS-01 | Audit USEFUL MINOR DETAIL | Pomodoro and visual style | Preferences do not determine source correctness | DEFER | N/A | After Preparation passes and personalization begins | Record no Preparation action beyond preserving later choice | No Pomodoro/style requirement enters native acceptance gates | Deferred decision note only | None | Any attempt to use preference as pass/fail criterion is rejected |

### Source hotkey dispositions

The common contract applies to every row below. Windows is TEST. Android is
GATED on both current command availability and a connected physical keyboard,
except `HK-11`, whose Quick Explorer dependency makes it NOT APPLICABLE on
Android. Before each test, capture current command ID, binding, active note or
workspace, and platform. Record before/after UI evidence and exact file or
property diff when the command writes. Use only synthetic notes. Restore note,
workspace, and binding state after each row. A missing or ambiguous command,
wrong action or destination, untracked write, binding collision, or failed
rollback stops hotkey acceptance.

| ID | Source | Binding | Exact action | Expected observable result | Windows | Android |
| --- | --- | --- | --- | --- | --- | --- |
| HK-01 | Part 3 lines 42 and 91 | `Ctrl + Space` | Toggle Page Task on active note and independently on unopened hovered File Explorer note B through `WF-02` | Only intended target changes; page-task state, Iconic state, and Mail Box visibility restore exactly; Android hover receives explicit capability disposition | TEST | GATED |
| HK-02 | Part 3 line 92 | `Ctrl + Shift + Q` | Invoke configured Create Note action | Current command opens its configured scoped flow and creates one uniquely named fixture at exact configured destination; every finite choice is covered by `REG-07` | TEST | GATED |
| HK-03 | Part 3 line 93 | `Ctrl + Shift + W` | Open platform Homepage | Correct Windows or Mobile Home opens and settles as `WF-01` defines | TEST | GATED |
| HK-04 | Part 3 line 94 | `Ctrl + Shift + E` | Open today's daily note | Current daily command opens or creates exact dated DAILY path without `Untitled.md` | TEST | GATED |
| HK-05 | Part 3 line 95 | `Ctrl + Shift + R` | Add one task to today's daily note | One task appears at documented daily location; no other note changes | TEST | GATED |
| HK-06 | Part 3 line 96 | `Ctrl + Shift + I` | Open Mail Box | Mail Box opens in reading mode and displays current synthetic fixtures | TEST | GATED |
| HK-07 | Part 3 line 97 | `Ctrl + Shift + O` | Open Map of Content | Map opens, settles, and supports `WF-02A` navigation | TEST | GATED |
| HK-08 | Part 3 line 98 | `Ctrl + Shift + P` | Open Projects Dashboard | Dashboard opens and filters current project fixture as `WF-03` defines | TEST | GATED |
| HK-09 | Part 3 line 99 | `Ctrl + Shift + A` | Invoke Omnisearch | Omnisearch finds and opens uniquely named synthetic note | TEST | GATED |
| HK-10 | Part 3 line 100 | `Ctrl + Shift + S` | Open Recent Files | Recent-files surface opens and lists controlled recent fixture in expected order | TEST | GATED |
| HK-11 | Part 3 line 101 | `Ctrl + Shift + D` | Invoke Quick Explorer vault navigation | Quick Explorer opens and navigates to one controlled nested fixture under each of HUB, PARA, ZETA, DAILY, STICKY, and SYSTEM | TEST | NOT APPLICABLE |
| HK-12 | Part 3 line 102 | `Ctrl + Shift + F` | Toggle Focus Mode on, then off | Focus-only chrome change appears and original layout restores | TEST | GATED |
| HK-13 | Part 3 line 103 | `Ctrl + Shift + G` | Toggle Garble Text on, then off | Visible text is garbled only while enabled and original render restores | TEST | GATED |
| HK-14 | Part 3 line 104 | `Ctrl + Shift + Z` | Toggle Format Eraser on formatted synthetic text, then off | Formatting suppression changes only presentation and restores | TEST | GATED |
| HK-15 | Part 3 line 105 | `Ctrl + Shift + X` | Remove highlight from one marked fixture span | Only that span's highlight markup is removed | TEST | GATED |
| HK-16 | Part 3 line 106 | `Ctrl + Shift + C` | Apply red highlight to one controlled fixture span | That span receives exact red-highlight markup and renders red | TEST | GATED |
| HK-17 | Part 3 line 107 | `Ctrl + Shift + V` | Apply green highlight to one controlled fixture span | That span receives exact green-highlight markup and renders green | TEST | GATED |
| HK-18 | Part 3 line 108 | `Ctrl + N` | Create new note | One note is created through current default-new-note scope with expected filename prompt | TEST | GATED |
| HK-19 | Part 3 line 109 | `Ctrl + M` | Create Workstation note | One Workstation note uses exact template, fields, and destination from `TPL-04` | TEST | GATED |
| HK-20 | Part 3 line 110 | `Ctrl + ,` | Create Fleeting note | One Fleeting note uses exact template, fields, and ZETA destination from `TPL-03` | TEST | GATED |
| HK-21 | Part 3 line 111 | `Ctrl + W` | Close current synthetic note | Active tab closes without deleting note or changing unrelated tabs | TEST | GATED |
| HK-22 | Part 3 line 112 | `Ctrl + E` | Toggle Editing to Reading and back | Mode changes twice; rendered output appears in Reading and source code in Editing | TEST | GATED |
| HK-23 | Part 3 line 113 | `Ctrl + G` | Open Graph View | Graph opens and includes connected synthetic fixture | TEST | GATED |
| HK-24 | Part 3 line 114 | `Shift + Up` | Move one uniquely marked fixture line up once | Only that line's order changes; undo or checkpoint restores baseline | TEST | GATED |
| HK-25 | Part 3 line 115 | `Shift + Down` | Move one uniquely marked fixture line down once | Only that line's order changes; undo or checkpoint restores baseline | TEST | GATED |

Traceability completion requires dependency order above; zero source workflows,
plugins, FAB contexts, connection scopes, write controls, FORMAT queries, or
Calendar/Timeline behaviors without disposition; all 25 source hotkeys and all
seven executable rows executed or gated; every historical regression covered;
zero Important or ALREADY PRESERVED lesson without TEST/GATED coverage; zero
approved component without observable evidence and rollback; reason for every
DEFER or NOT APPLICABLE. Any discovered workflow, component, control, quirk, or
unknown receives a stable row before work continues. FNS and production/browser
state remain outside test scope.

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

Temporary local preservation ref, never remote:

```text
refs/archive/f97eff4
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

- [x] **Step 1: Mark exact specification approved**

Replace its status paragraph with:

```markdown
Status: approved on 2026-07-27. This design governs repository recovery and
Phase 2 Preparation; it does not authorize Phase 2 Execution or live promotion.
```

- [x] **Step 2: Replace active goal with concise current checkpoint**

Keep these exact sections and facts:

```markdown
# Active goal

Updated: 2026-07-27

## Objective

Complete repository recovery: preserve the completed Phase 1 FNS foundation,
remove failed Phase 2 machinery from active use, retain its useful lessons in
one verified cold archive, and leave one executable Phase 2 Preparation handoff.

Status: Phase 1 foundation complete. Repository recovery is active. Phase 2
Preparation has not started. No Dusk
source, plugin set, desktop result, Android result, or live promotion is
currently accepted.

## Stage mapping

- Phase 1: existing FNS foundation and current safe baseline. This does not
  claim every roadmap Release 1 exit gate passed.
- Phase 2 Preparation: inspect Dusk, select candidate, create fresh disposable
  desktop/Android evidence, define safety and test contracts, and approve one
  customization plan.
- Phase 2 Execution: implement and validate the approved customized workspace.
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
- No Phase 2 Preparation native validation begins during recovery. A later
  Preparation session refreshes current Dusk GitHub, Discord, plugin, desktop,
  and Android evidence before approving an Execution plan.

## Authority

- [Documentation map](README.md)
- [System design](system-design.md)
- [Recommended architecture](architecture/recommended-architecture.md)
- [Evidence-gated roadmap](roadmap/phased-roadmap.md)
- [Decision log](decisions/decision-log.md)
- [Phase 1 implementation evidence](research/2026-07-23-fns-implementation-evidence.md)
- [Phase 2 reversal](archive/2026-07-24-phase-2-reversal.md)
```

- [x] **Step 3: Add project-stage mapping to roadmap**

Insert after roadmap status paragraphs and before `## Program map`:

```markdown
## Project-stage mapping

Project stages describe current work; releases describe promotion evidence.
They are related but not interchangeable.

| Project stage | Current meaning | Release effect |
|---|---|---|
| Phase 1 | Existing FNS foundation and safe baseline | Does not waive incomplete Release 1 gates |
| Phase 2 Preparation | Dusk inspection, candidate selection, fresh disposable desktop/Android evidence, safety/test contract, and approved customization plan | Promotes no release |
| Phase 2 Execution | Implement and validate approved customized workspace | Must satisfy applicable Release 1 and Release 2 gates |
```

- [x] **Step 4: Append DEC-040**

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

- [x] **Step 5: Add direct decision-map link**

Change current Decisions navigation to:

```markdown
- Decisions: [decision log](decisions/decision-log.md),
  [DEC-040 Phase 2 Preparation reset](decisions/decision-log.md#dec-040-reset-phase-2-preparation),
  and [unresolved questions](decisions/unresolved-questions.md).
```

Do not add a new index file.

- [x] **Step 6: Run documentation checks**

Run:

```powershell
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
git diff --check
```

Expected: link check passes with every tracked Markdown file reachable; secret
scan passes without printing values; whitespace check prints nothing.

- [x] **Step 7: Commit authority**

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

- [x] **Step 1: Create one historical lessons record**

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

- [x] **Step 2: Link historical lessons**

Add lessons under `docs/archive/README.md` abandoned-attempt history. Leave
obsolete Dusk-subagent files and index entries present until verified archive,
review, and exact approval.

Use this exact link:

```markdown
- [2026-07-27 Phase 2 Preparation historical lessons](2026-07-27-phase-2-preparation-lessons.md)
```

- [x] **Step 3: Validate and commit**

Run link, secret, and whitespace checks from Task 1. Then:

```powershell
git add docs/archive/README.md docs/archive/2026-07-27-phase-2-preparation-lessons.md
git commit -m "docs(phase2): distill failed attempt lessons"
```

Expected: checks pass and worktree is clean.

### Task 3: Build and verify cold archive

Status: completed before execution review on 2026-07-27. Revalidate recorded
artifacts; do not recreate or overwrite archive implicitly.

**Files:**

- Create externally: `G:\Dusk-Phase2-Cold-Archive-20260727\README.md`
- Create externally: `G:\Dusk-Phase2-Cold-Archive-20260727\SOURCE-MANIFEST.csv`
- Create externally: `G:\Dusk-Phase2-Cold-Archive-20260727\SHA256SUMS.csv`
- Create externally: archive subdirectories `git`, `worktrees`, `external`, `state`, and `verification`
- Modify externally: durable recovery-state files after verification

**Interfaces:**

- Consumes: exact refs and external targets in `KEEP-ARCHIVE-DELETE.md`.
- Produces: independently verifiable archive required before any destructive approval.

- [x] **Step 1: Revalidate paths and free space without broad drive listing**

Run `Test-Path`, `Get-Item`, and `Get-PSDrive G` only for exact named targets.
Archive root must exist and match recorded manifests. Abort if it is missing,
any required source unexpectedly vanished, or available space is below twice
total source bytes.

Use:

```powershell
$archiveRoot = 'G:\Dusk-Phase2-Cold-Archive-20260727'
if (-not (Test-Path -LiteralPath $archiveRoot -PathType Container)) {
    throw "Archive root missing: $archiveRoot"
}
$drive = Get-PSDrive -Name G
if ($drive.Free -lt 3GB) {
    throw "Archive safety floor failed: $($drive.Free) free bytes"
}
```

Compute exact source bytes from target set and raise `3GB` if twice measured
bytes is larger. Expected: root present with required manifests and free bytes
above safety floor.

- [x] **Step 2: Verify fixed archive layout**

Create only:

```text
G:\Dusk-Phase2-Cold-Archive-20260727\git
G:\Dusk-Phase2-Cold-Archive-20260727\worktrees
G:\Dusk-Phase2-Cold-Archive-20260727\external
G:\Dusk-Phase2-Cold-Archive-20260727\state
G:\Dusk-Phase2-Cold-Archive-20260727\verification
```

Verify without creating:

```powershell
$archiveRoot = 'G:\Dusk-Phase2-Cold-Archive-20260727'
@('git', 'worktrees', 'external', 'state', 'verification') | ForEach-Object {
    $path = Join-Path $archiveRoot $_
    if (-not (Test-Path -LiteralPath $path -PathType Container)) { throw "Archive layout missing: $path" }
}
```

- [x] **Step 3: Preserve Git graph and unique unreachable commit**

Create and verify one `--all` repository bundle plus one individual bundle per
ref. Create binary patches and `git archive` ZIP snapshots for these exact
refs:

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
    git bundle create (Join-Path $gitArchive "$safe.bundle") $ref
    git bundle verify (Join-Path $gitArchive "$safe.bundle")
    git diff --binary --full-index "--output=$(Join-Path $gitArchive "$safe.patch")" "$base..$ref"
    git archive --format=zip "--output=$(Join-Path $gitArchive "$safe.zip")" $ref
}

$lost = 'f97eff4816156f7138682ec6dca23d9d21cc7317'
$temporaryRef = 'refs/archive/f97eff4'
git update-ref $temporaryRef $lost
git bundle create (Join-Path $gitArchive 'unreachable-f97eff4.bundle') $temporaryRef
git bundle verify (Join-Path $gitArchive 'unreachable-f97eff4.bundle')
git archive --format=zip "--output=$(Join-Path $gitArchive 'unreachable-f97eff4.zip')" $lost
git diff-tree --root --binary --full-index --patch "--output=$(Join-Path $gitArchive 'unreachable-f97eff4.patch')" $lost
```

Expected: each command exits 0 and archive contains one all-refs bundle, seven
individual branch bundles, seven branch patches, seven branch ZIPs, and three
unreachable-commit representations including exact ref-backed bundle. Clean
restore must resolve commit `f97eff4` and tree
`25fa7923b7a48c2b936ab5063763d5a85421e756`. Temporary ref remains local and
is listed for separately approved cleanup; never push it.

- [x] **Step 4: Preserve clean historical worktree snapshots**

Recheck porcelain status for:

```text
C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline\.worktrees\docs-phase2-reversal
C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline\.worktrees\dusk-goal1-discovery
C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline\.worktrees\obsidian-phase2
```

Abort on any dirty line. Record each HEAD and tree, then retain the matching Git
archive from Step 3 as its clean snapshot.

- [x] **Step 5: Copy exact external evidence**

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

- [x] **Step 6: Generate manifests without printing content**

`SOURCE-MANIFEST.csv` must contain source path, archive-relative path, item
type, byte count, file count, classification, and planned post-approval
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

- [x] **Step 7: Verify copy equality and restore path**

Compare source and destination file counts, total bytes, and per-file SHA-256
for every copied target. Clone the repository bundle into
`verification\bundle-restore`, verify every preserved ref SHA, and extract the
`docs/dusk-goal1-discovery` snapshot into
`verification\worktree-restore`. Verify restored tree identity against
`3cd0c80e5637bec7c9b34c4ffdaac53b79774201^{tree}`.

- [x] **Step 8: Record archive result**

Write archive `README.md` with purpose, created time, source/base SHAs,
exclusions, bundle verification commands, restoration commands, and explicit
statement that archive is historical evidence only. Update durable state with
archive counts, bytes, manifest hashes, restore result, and any excluded item.

Expected: zero mismatch, zero unclassified target, source trees unchanged.

### Task 4: Prepare exact destructive manifest

Status: completed before execution review on 2026-07-27; every group remains
`NOT APPROVED`.

**Files:**

- Replace externally: `C:\Users\TienBac\Documents\New project\Dusk-Phase2-Recovery-State\DESTRUCTIVE-ACTIONS.md`
- Modify externally: `CURRENT-STATE.md`, `KEEP-ARCHIVE-DELETE.md`, and `RESUME.md`

**Interfaces:**

- Consumes: verified archive manifest and archive restoration proof.
- Produces: exact approval packet; performs no destructive command.

- [x] **Step 1: List candidate-tree deletions already proposed**

Record seven repository paths from exact cleanup target set with candidate
commit and cold archive location. Status remains `NOT APPROVED` until reviewer
and user act.

- [x] **Step 2: List exact external filesystem cleanup**

Record the two evidence directories, three package directories, one worktree
ZIP, and 27 loose `G:` files from exact cleanup target set. Include
resolved absolute source, archive destination, source/archive counts and bytes,
manifest hash, recoverability command, exact PowerShell removal command, and
`NOT APPROVED`.

- [x] **Step 3: List exact Git and GitHub cleanup**

Record:

- removal of three registered historical worktrees;
- `git branch -d` deletion of four merged local branches:
  `codex/docs-phase2-reversal`, `feat/dusk-subagents`, `feat/fns-release-one`,
  and `research/full-system-design`;
- separately approved `git branch -D` deletion of three ref-only local
  branches: `docs/dusk-goal1-discovery`, `feat/obsidian-phase2`, and
  `research/full-system-design-dev`;
- separately approved deletion of temporary local ref `refs/archive/f97eff4`
  only after its bundle restore passes;
- remote deletion of seven archived branches;
- closure of draft PR #7 after confirming head `3cd0c80e5637bec7c9b34c4ffdaac53b79774201`;
- retention of `main`, `docs/phase2-preparation-reset`, PR #3, PR #4, PR #5,
  PR #6, source archives, source vault, live vault, and recovery state.

Every row must name prerequisite archive evidence, precondition, exact command,
rollback, approval, and result. Do not execute commands.

- [x] **Step 4: Check manifest completeness**

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

- [x] **Step 1: Invoke requesting-code-review**

Dispatch exactly one `dusk-release-reviewer`-role agent with model
`gpt-5.6-sol`, xhigh reasoning, and read-only task text. Do not dispatch any
other agent. Packet must include exact paths, candidate/base SHAs, scope,
non-goals, verification output, and request for Critical/Important findings
only.

- [x] **Step 2: Evaluate findings technically**

Use `receiving-code-review`. Verify each finding against files or commands.
Record accepted, rejected-with-evidence, and fixed findings in
`REVIEW-FINDINGS.md` without copying secrets or raw logs.

- [x] **Step 3: Fix accepted findings atomically**

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

- [x] **Step 1: Ask one exact approval question**

Present short totals plus clickable destructive manifest. State retained items
and recovery path. Do not treat earlier general cleanup approval as approval.

- [x] **Step 2: Revalidate before each approved action group**

Resolve absolute targets, compare current source identity/count/hash to manifest,
verify archive copy, and stop that group on drift. Never use a computed broad
directory, wildcard, `$HOME`, or workspace root as destructive target.

- [x] **Step 3: Remove approved obsolete repository files**

Use `apply_patch` to delete only seven repository paths in exact cleanup target
set. Remove only their two links from `docs/generated-work-index.md`; keep this
2026-07-27 plan entry. Run:

```powershell
rg -n -i 'dusk-(release-reviewer|runtime-debugger|source-inventory)|obsidian-(plugin-auditor|visual-qa)|2026-07-24-dusk-subagents' README.md docs .codex -g '!docs/superpowers/plans/2026-07-27-phase-2-preparation-reset.md'
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
git diff --check
```

Expected: `rg` returns no active reference and all checks pass. Commit:

```powershell
git add .codex/agents docs/generated-work-index.md docs/superpowers
git commit -m "docs(phase2): retire swarm machinery"
```

- [x] **Step 4: Execute only approved external rows**

Use native PowerShell `Remove-Item -LiteralPath` for exact filesystem targets,
`git worktree remove` for exact clean registered worktrees, `git branch -d` for
four verified merged branches, separately approved `git branch -D` for three
verified ref-only branches, separately approved `git update-ref -d` for
`refs/archive/f97eff4`, `git push origin --delete` for exact remote branches,
and GitHub CLI to close exact PR #7. Record command, timestamp, exit status, and
postcondition per row.

- [x] **Step 5: Verify retained and removed state**

Confirm every approved target absent, every unapproved target present,
`main` still at starting SHA/tree, candidate branch present, archive manifests
still hash correctly, and restoration commands still pass. Keep initial
`state\recovery-state` snapshot immutable. Defer final-state snapshot and final
archive-ledger regeneration until Task 7 Step 5, after every final verification
artifact exists. Do not change `SOURCE-MANIFEST.csv` or
`SOURCE-FILE-HASHES.csv`; they describe initial source-copy proof only.

### Task 7: Publish final handoff and verify branch

**Files:**

- Create: `docs/phase-2-preparation-handoff.md`
- Modify: `docs/README.md`
- Modify externally: all required recovery-state files

**Interfaces:**

- Consumes: final verified candidate, archive, review, and cleanup results.
- Produces: concise future-session entrypoint; no merge to `main`.

- [x] **Step 1: Invoke handoff skill**

Create a project-state-only handoff. Include read order, exact current branch
and commit, Phase 1 versus roadmap caveat, approved Dusk source strategy,
archive location and restoration proof, unresolved native validation, safety
boundaries, and first Phase 2 Preparation action. Exclude model advice except the
explicit main-agent plus one Luna visual-subagent constraint requested by user.

- [x] **Step 2: Add documentation-map link**

Link handoff from current checkpoint section of `docs/README.md`. Do not create
another index or dashboard.

Stage both files before link validation so tracked-file reachability checks see
the new handoff:

```powershell
git add docs/README.md docs/phase-2-preparation-handoff.md
```

- [x] **Step 3: Commit handoff and run full repository verification**

Commit only staged handoff files:

```powershell
git commit -m "docs(phase2): add preparation handoff"
```

Run documentation checks in candidate:

```powershell
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/test-markdown-links.ps1
powershell -NoProfile -File scripts/test-initialize-vault-template.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
powershell -NoProfile -File scripts/check-mermaid.ps1
git diff --check
git diff --cached --check
```

Expected: all commands exit 0; all Markdown reachable; values never printed;
all Mermaid diagrams render.

Run fresh Git integrity and identity checks:

```powershell
$repo = 'C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline'
$candidate = 'C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline-phase2-reset'
$expectedMain = '571fde461571d842c3912964f86adfa9b0314092'
$expectedMainTree = 'ac711cdb04e368b28480ae389b3142ce5e44f5f3'
git -C $repo fsck --full
git -C $candidate status --short --branch
if ((git -C $repo rev-parse main) -ne $expectedMain) { throw 'Local main drift' }
if ((git -C $repo rev-parse 'main^{tree}') -ne $expectedMainTree) { throw 'Local main tree drift' }
$remoteMain = (git -C $repo ls-remote origin refs/heads/main).Split("`t")[0]
if ($remoteMain -ne $expectedMain) { throw 'Remote main drift' }
git -C $repo for-each-ref --format='%(refname) %(objectname)' refs/heads refs/archive
git -C $repo worktree list --porcelain
git -C $repo ls-remote --heads origin
git -C $repo tag --list
& 'C:\Program Files\GitHub CLI\gh.exe' pr list --repo tienbac2314/north-obsidian-vault --state all --json number,state,isDraft,baseRefName,headRefName,headRefOid
```

Expected: `fsck` exits 0; candidate clean; local and remote `main` SHA/tree
match; only retained refs/worktrees/remotes remain; no tags; PR states match
approved cleanup results.

Verify every archive checksum and bundle from fresh bytes:

```powershell
$archiveRoot = 'G:\Dusk-Phase2-Cold-Archive-20260727'
$checksumFile = Join-Path $archiveRoot 'SHA256SUMS.csv'
$checksumRows = @(Import-Csv -LiteralPath $checksumFile)
$listedPaths = @($checksumRows.RelativePath | Sort-Object -Unique)
$actualPaths = @(Get-ChildItem -LiteralPath $archiveRoot -File -Recurse -Force |
    Where-Object { $_.FullName -ne $checksumFile } |
    ForEach-Object { $_.FullName.Substring($archiveRoot.Length + 1) } |
    Sort-Object -Unique)
if ($listedPaths.Count -ne $checksumRows.Count) { throw 'Duplicate archive ledger path' }
if (@(Compare-Object $listedPaths $actualPaths).Count -ne 0) { throw 'Archive ledger path set mismatch' }
foreach ($row in $checksumRows) {
    $path = Join-Path $archiveRoot $row.RelativePath
    $item = Get-Item -LiteralPath $path
    if ($item.Length -ne [long]$row.Bytes) { throw "Archive length mismatch: $($row.RelativePath)" }
    if ((Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash -ne $row.SHA256) { throw "Archive hash mismatch: $($row.RelativePath)" }
}
foreach ($bundle in Get-ChildItem -LiteralPath (Join-Path $archiveRoot 'git') -Filter '*.bundle') {
    git bundle verify $bundle.FullName
    if ($LASTEXITCODE -ne 0) { throw "Bundle verification failed: $($bundle.Name)" }
}
```

Expected: ledger and actual archive file sets match exactly; every checksum row
and every bundle passes.

Restore every branch bundle and check every non-empty patch in new repositories:

```powershell
$archiveRoot = 'G:\Dusk-Phase2-Cold-Archive-20260727'
$restoreRunId = "$(git rev-parse --short=12 HEAD)-$(Get-Date -Format 'yyyyMMdd-HHmmssfff')"
$restoreRoot = Join-Path $archiveRoot "verification\final-bundle-restores-$restoreRunId"
if (Test-Path -LiteralPath $restoreRoot) { throw 'Unique restore root collision' }
New-Item -ItemType Directory -Path $restoreRoot | Out-Null
foreach ($row in Import-Csv -LiteralPath (Join-Path $archiveRoot 'git\REFS.csv')) {
    $safe = $row.Ref.Replace('/', '__')
    $restore = Join-Path $restoreRoot $safe
    New-Item -ItemType Directory -Path $restore | Out-Null
    git -C $restore init --quiet
    git -C $restore fetch --quiet (Join-Path $archiveRoot "git\$($row.Bundle)") "refs/heads/$($row.Ref)`:refs/heads/restored"
    if ((git -C $restore rev-parse restored) -ne $row.Head) { throw "Restored head mismatch: $($row.Ref)" }
    if ((git -C $restore rev-parse 'restored^{tree}') -ne $row.Tree) { throw "Restored tree mismatch: $($row.Ref)" }
    $patch = Join-Path $archiveRoot "git\$($row.Patch)"
    if ((Get-Item -LiteralPath $patch).Length -gt 0) {
        git -C $restore checkout --quiet --detach $row.MergeBase
        git -C $restore apply --check $patch
        if ($LASTEXITCODE -ne 0) { throw "Patch restore failed: $($row.Ref)" }
    }
}
$lost = Import-Csv -LiteralPath (Join-Path $archiveRoot 'verification\UNREACHABLE-RESTORE.csv')
$lostRestore = Join-Path $restoreRoot 'unreachable-f97eff4'
New-Item -ItemType Directory -Path $lostRestore | Out-Null
git -C $lostRestore init --quiet
git -C $lostRestore fetch --quiet (Join-Path $archiveRoot $lost.BundleRelativePath) 'refs/archive/f97eff4:refs/heads/restored'
if ((git -C $lostRestore rev-parse restored) -ne $lost.Commit) { throw 'Unreachable commit restore mismatch' }
if ((git -C $lostRestore rev-parse 'restored^{tree}') -ne $lost.Tree) { throw 'Unreachable tree restore mismatch' }
```

Expected: seven branch heads/trees, every non-empty patch, and exact unreachable
commit/tree restore from clean repositories.

- [ ] **Step 4: Record final identity and publish branch — BLOCKED**

Blocked pending separate explicit Task 7 publication authority. Candidate
pre-audit baseline is `0f316d28aea2f1152bf63ab957b5dc49458eabad`, tree
`be79bf4de00e7aa4c1021f14ab60005d9b2c912a`; it is not live identity after a
corrective commit. Do not push, create or update a pull request, or regenerate
the definitive ledger.

Record candidate HEAD/tree, clean status, base ancestry, `main` SHA/tree, full
verification output, archive manifest hashes, review result, and cleanup result:

```powershell
$candidate = 'C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline-phase2-reset'
$candidateHead = git -C $candidate rev-parse HEAD
$candidateTree = git -C $candidate rev-parse 'HEAD^{tree}'
if (git -C $candidate status --porcelain=v1) { throw 'Candidate is dirty' }
```

Before push, write `$candidateHead` and `$candidateTree` to durable
`CURRENT-STATE.md` and `RESUME.md`, then reread and verify exact equality. The
tracked handoff must label `0f316d2` only as pre-audit baseline and must resolve
live identity through these commands and durable state; never amend it with a
SHA that the same commit will supersede. Push only
`docs/phase2-preparation-reset`. Verify remote branch SHA equals
`$candidateHead`. Do not merge, close recovery branch, or create a PR unless
user separately requests it.

- [ ] **Step 5: Verify pushed branch from clean room — BLOCKED**

Do not run Step 5 until separate Task 7 publication authority exists and Step 4
has completed with remote SHA equal to recorded durable identity. Then perform
clean-room checkout and content exclusion:

```powershell
$archiveRoot = 'G:\Dusk-Phase2-Cold-Archive-20260727'
$cleanRunId = "$(git rev-parse --short=12 HEAD)-$(Get-Date -Format 'yyyyMMdd-HHmmssfff')"
$cleanRoom = Join-Path $archiveRoot "verification\final-clean-room-$cleanRunId"
if (Test-Path -LiteralPath $cleanRoom) { throw 'Unique clean-room path collision' }
git clone --branch docs/phase2-preparation-reset --single-branch https://github.com/tienbac2314/north-obsidian-vault.git $cleanRoom
powershell -NoProfile -File (Join-Path $cleanRoom 'scripts\check-markdown-links.ps1')
powershell -NoProfile -File (Join-Path $cleanRoom 'scripts\test-markdown-links.ps1')
powershell -NoProfile -File (Join-Path $cleanRoom 'scripts\test-initialize-vault-template.ps1')
powershell -NoProfile -File (Join-Path $cleanRoom 'scripts\check-secrets.ps1')
powershell -NoProfile -File (Join-Path $cleanRoom 'scripts\check-mermaid.ps1')
git -C $cleanRoom diff --check
$forbidden = @(git -C $cleanRoom ls-files | rg -i '(^|/)\.obsidian/plugins/[^/]+/data\.json$|\.(png|jpe?g|gif|webp|mp4|mov|mkv|log)$|Dusk-Phase2-Recovery-State')
if ($forbidden.Count -ne 0) { throw 'Committed raw evidence or external state detected' }
if (@(git -C $cleanRoom status --porcelain=v1).Count -ne 0) { throw 'Clean-room checkout dirty' }
```

After all verification artifacts exist, preserve final durable state and create
the definitive bidirectional archive ledger:

```powershell
$archiveRoot = 'G:\Dusk-Phase2-Cold-Archive-20260727'
$stateRoot = 'C:\Users\TienBac\Documents\New project\Dusk-Phase2-Recovery-State'
$finalRunId = "$(git rev-parse --short=12 HEAD)-$(Get-Date -Format 'yyyyMMdd-HHmmssfff')"
$finalState = Join-Path $archiveRoot "state\final-recovery-state-$finalRunId"
if (Test-Path -LiteralPath $finalState) { throw 'Unique final-state path collision' }
Copy-Item -LiteralPath $stateRoot -Destination $finalState -Recurse
$finalStateManifest = Join-Path $archiveRoot "state\FINAL-STATE-HASHES-$finalRunId.csv"
Get-ChildItem -LiteralPath $finalState -File -Recurse -Force |
    Sort-Object FullName |
    ForEach-Object {
        [pscustomobject]@{
            RelativePath = $_.FullName.Substring($archiveRoot.Length + 1)
            Bytes = $_.Length
            SHA256 = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash
        }
    } | Export-Csv -LiteralPath $finalStateManifest -NoTypeInformation -Encoding UTF8
$checksumFile = Join-Path $archiveRoot 'SHA256SUMS.csv'
$finalRows = @(Get-ChildItem -LiteralPath $archiveRoot -File -Recurse -Force |
    Where-Object { $_.FullName -ne $checksumFile } |
    Sort-Object FullName |
    ForEach-Object {
        [pscustomobject]@{
            RelativePath = $_.FullName.Substring($archiveRoot.Length + 1)
            Bytes = $_.Length
            SHA256 = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash
        }
    })
$finalRows | Export-Csv -LiteralPath $checksumFile -NoTypeInformation -Encoding UTF8
$verifiedRows = @(Import-Csv -LiteralPath $checksumFile)
$listedPaths = @($verifiedRows.RelativePath | Sort-Object -Unique)
$actualPaths = @(Get-ChildItem -LiteralPath $archiveRoot -File -Recurse -Force |
    Where-Object { $_.FullName -ne $checksumFile } |
    ForEach-Object { $_.FullName.Substring($archiveRoot.Length + 1) } |
    Sort-Object -Unique)
if ($listedPaths.Count -ne $verifiedRows.Count) { throw 'Duplicate final archive ledger path' }
if (@(Compare-Object $listedPaths $actualPaths).Count -ne 0) { throw 'Final archive ledger path set mismatch' }
foreach ($row in $verifiedRows) {
    $path = Join-Path $archiveRoot $row.RelativePath
    if ((Get-Item -LiteralPath $path).Length -ne [long]$row.Bytes) { throw "Final archive length mismatch: $($row.RelativePath)" }
    if ((Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash -ne $row.SHA256) { throw "Final archive hash mismatch: $($row.RelativePath)" }
}
```

Expected: clean-room branch matches pushed candidate; full repository checks
pass; all Markdown is root-reachable; no raw evidence, secret-bearing plugin
configuration, external recovery state, or dirty file is committed; final-state
manifest exists; definitive ledger contains every other archive file exactly once
and every size and SHA-256 matches.
