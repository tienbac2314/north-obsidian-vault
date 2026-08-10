# Dusk_light Datacore-Permanent Debloat Design

Date: 2026-08-10
Status: Approved design sections; pending user review of this written spec
Scope: One personalization/debloat program; no new canonical wave

## Decision

Dusk_light will use a permanent two-owner query model:

- Obsidian Bases owns simple file and property tables.
- Datacore owns complex queries, task/date aggregation, progress views, and
  custom Mail Box and Map of Content surfaces.
- Dataview is a removal candidate after every remaining DataviewJS consumer is
  ported to Bases or Datacore and passes Windows and Android regression checks.

This is not a Datacore-to-Bases migration program. Datacore remains the
long-term owner for behavior that needs JavaScript, block-level task data, or
custom interactive UI.

## Baseline

Verified current repositories:

- Part 2 control repository: `main`, commit
  `a1c1dc91a223fef712a444ab2bd6b7cbf4d1ee28`, tree
  `2227dbf1e5a9763190ffabc1e76851b5dcdc09df`.
- Product reset worktree: `docs/phase2-preparation-reset`, commit
  `84c1b6f66717943c532783e4aedd9126bcf820cb`, tree
  `a615e18b0f8a7d61532c7ccf08b673269c348da8`.
- Windows disposable: `W5-INTEGRATED-UPDATED-LIGHT-20260803`.
- Android disposable: serial `01234ABC`, registered Dusk_light vault.
- Current Windows static inventory: zero ordinary Dataview blocks, 21
  DataviewJS blocks, four Datacore JSX surfaces, and 178 Tasks blocks.
- Current Windows and Android enabled community-plugin sets: 43 IDs and equal.

Six reusable Bases files already own the safe table surfaces. Existing
Templates, Meta Bind, QuickAdd, Journals, project templates, and project-note
creation remain protected.

## Owner rules

| Capability | Permanent owner | Action |
| --- | --- | --- |
| Simple file/property tables | Bases | Keep and extend only where behavior remains equivalent |
| Complex JavaScript views | Datacore | Port remaining DataviewJS groups directly |
| Inline task query and task editing | Tasks plus Datacore views | Keep Tasks; Datacore displays and filters task data |
| Templates and note creation | Templater, Meta Bind, QuickAdd, Journals | Keep unchanged unless a later test proves redundancy |
| Mail Box and Map of Content | Datacore JSX | Keep as protected complex surfaces |
| Project-note creation | QuickAdd, Templater, Meta Bind, templates | Keep; Projects dashboard is already removed |
| Simple dashboards and journal tables | Bases | Keep current six Base files and matching embeds |
| Date/calendar/timeline logic | Datacore first; owning plugin where needed | Replace only after visual and interaction parity |

## DataviewJS migration lanes

Migrate by behavior group. Duplicate copies in existing journals and format
templates use one canonical implementation and one test contract.

### Lane 1: Homepage progress and task timeline

Port the progress calculation and the `Add Vault Task` timeline view to
Datacore. Keep the visible Homepage and Mobile Homepage buttons, callouts,
headings, and task entry flow. Keep Tasks as the owner of task syntax,
completion, due dates, recurrence, and metadata behavior.

Pass condition:

- Same progress result for the same task set.
- Same task rows, ordering, links, and completion behavior.
- Same PC and mobile entry controls.

### Lane 2: Weekly due and completed tabs

Port the due-this-week and completed-this-week views to Datacore. Preserve
the existing tab names, ordering, limit, priority handling, and task links.

Pass condition:

- Due and completed sets match the pre-change disposable output.
- Toggling or changing task state updates the correct note on both platforms.

### Lane 3: Monthly overview date window

Port the monthly open-task aggregation to Datacore. Preserve the current
`journal-start-date` and `journal-end-date` contract and timezone behavior.

Pass condition:

- Boundary dates are included or excluded exactly as before.
- The result is identical in current and newly created monthly notes.

### Lane 4: Calendar and Timeline loaders

Replace wrapper calls only when Datacore can reproduce the displayed behavior.
Do not remove the owning calendar/timeline plugin before that proof. A
Datacore custom view may be used for a one-column mobile layout if it keeps
the same dates, links, and navigation.

Pass condition:

- Same chronological ordering and date labels.
- No clipping, horizontal overflow, or broken touch interaction on Android.

### Lane 5: Templates and existing journal notes

Update canonical format templates first. Then update existing disposable
journal notes that contain the same blocks. Preserve Templater cursor calls,
frontmatter, async hooks, tabs, and note creation behavior. Do not rewrite
unrelated frontmatter or delete disposable Untitled notes.

Pass condition:

- New daily, weekly, and monthly notes render the Datacore view after creation.
- Existing notes render after restart.
- Reading and Live Preview remain usable.

### Lane 6: Existing Datacore surfaces

Treat the four Mail Box and Map of Content JSX surfaces as working protected
examples. Refactor only when needed to share helpers or remove Dataview
dependencies. Do not replace them with Bases unless a later design explicitly
changes the user experience.

## Plugin decisions

### Disable now in the approved implementation plan

`obsidian-day-planner` will be disabled on both exact disposable targets. It
will not be uninstalled in this step. Preserve its manifest, settings, and
rollback copy. Verify that disabling it does not change Journals, daily-note
creation, task editing, or mobile navigation.

### Keep

- Datacore: permanent complex-query owner.
- Tasks: inline-task owner.
- Templater, Meta Bind, QuickAdd, and Journals: creation and metadata owners.
- Note Toolbar and other utility plugins until a real owner test proves
  redundancy.
- Bases core plugin and all accepted Base files.

### Remove only after separate proof

Dataview is removed last among the query engines. Other overlapping plugins,
including calendar/timeline and Checklist candidates, are reviewed one at a
time. Zero text references alone are not sufficient for removal.

Already removed or disabled state remains historical and is not repeated as a
new action: Projects, Commander, Settings Search, BRAT, and Todoist are
removed; Checklist and Daily Navbar are disabled with rollback payload.

## Windows and Android contract

The Datacore manifest currently declares `isDesktopOnly=false`; the exact
disposable plugin is version `0.1.29` on both targets. Datacore's own
documentation describes it as power-user JavaScript software and warns that
initial indexing can take several minutes. Initial loading is recorded
separately from settled behavior.

Every accepted lane requires:

- Windows settled capture at native `1920x1040`.
- Android settled capture at native `1200x2000`.
- Matching rows, counts, dates, sorting, links, buttons, and task actions.
- Reading and Live Preview checks where the surface supports both.
- Complete relevant vertical and horizontal scrolling.
- Restart and settled-readiness check.
- No PC feature reduction to accommodate mobile. Mobile may use a narrower
  layout or fallback view only if its data and actions remain equivalent.

## Rollback and evidence

Before each lane, save a disposable-only snapshot of changed notes, plugin
settings, and active manifests outside Git. Record exact paths, SHA-256 values,
target identity, enabled plugin IDs, and the test contract. Raw screenshots
remain outside Git. Commit only compact authority, sanitized results, and
reproducible repair references.

## Stop rules

Stop the affected lane and keep its previous owner when:

- Datacore output differs in rows, dates, sorting, state, or links.
- Android indexing does not settle or a view freezes, clips, or loses touch
  actions.
- A template or creation flow changes unexpectedly.
- Ownership is unclear or rollback cannot be proven.
- The target is not the exact disposable Windows or registered Android target.

Do not touch the live/personal vault, protected source trees, product `main`,
or the `bf23` worktree. Do not begin future canonical waves.

## Final acceptance

The migration/debloat program is accepted only when:

1. Every remaining DataviewJS group has a tested Bases or Datacore owner.
2. Dataview has zero runtime and template consumers before removal.
3. Datacore complex surfaces pass Windows and Android regression.
4. Tasks, Templater, Meta Bind, QuickAdd, Journals, and project creation still
   work.
5. Day Planner is disabled on both platforms and no dependent flow regresses.
6. Each removed or disabled plugin has a documented owner, rollback record,
   and platform result.
7. Current authority, coverage, result, and evidence manifests are updated.
8. User reviews the final disposable result before any live-vault promotion.

## Sources and authority

- Current Dusk_light authority: [active goal](../../active-goal.md), [Dusk_light
  quick start](../../dusk-light-getting-started.md), and the Part 2 control
  repository ledgers.
- [Datacore documentation](https://blacksmithgu.github.io/datacore/).
- [Datacore repository and manifest](https://github.com/blacksmithgu/datacore).
- [Obsidian Bases syntax](https://obsidian.md/help/bases/syntax).
- [Obsidian Bases developer guide](https://docs.obsidian.md/plugins/guides/bases-view).
- [User-provided Dataview versus Bases video](https://www.youtube.com/watch?v=1Mgsdpy7awE).

NotebookLM and web research are advisory. Material claims are independently
checked against local target files, current plugin manifests, and runtime
tests before implementation decisions are accepted.
