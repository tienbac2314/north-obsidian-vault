# Active goal

Updated: 2026-07-25

## Objective

Finish Dusk Goal 1 discovery from the fixed source bundle and physical Android
copy before asking about personalization or changing the live vault.

Status: **incomplete**. Functional re-review returned **FAIL**. PR #7 remains
draft. Goal 2 and live promotion are not authorized.

## Read order

1. [Functional revalidation](research/2026-07-25-dusk-plugin-functional-revalidation.md)
   for current findings, user corrections, and raw evidence paths.
2. [Independent review](research/2026-07-25-dusk-goal1-review.md) for current
   verdict and release blockers.
3. [Goal 1 discovery](research/2026-07-25-dusk-goal1-discovery.md) for the
   18-deliverable index and conditional Goal 2 recommendation.
4. [PR review guide](research/2026-07-25-dusk-pr-review-guide.md) for visual
   evidence acceptance, historical-evidence reuse, and later personalization.
5. [Correction ledger](research/2026-07-25-dusk-goal1-correction-ledger.md) for
   current blocker status, corrections, restoration, and validation results.

Plans under `docs/archive/superpowers/` are historical execution records, not
current instructions.

## Verified checkpoint

- PR #6 is merged at `571fde4`; DEC-039 remains reversal authority.
- Sole source is
  `C:\Users\TienBac\Documents\New project\dusk-obsidian-vault-master`.
- Historical evidence stays under `G:\Dusk-Goal1-Discovery-20260725`.
  Current mutable disposables and new evidence must stay under its
  `goal1-current` and `goal1-current-evidence` subdirectories, outside
  `G:\Obsidian` and read-only checkpoints.
- Selected plugin loads passed after restart: Windows light 44/44, Windows full
  52/52, Android light 42/42, Android full 49/49.
- User Android `Dusk_light` was restored at 45/45 enabled plugins with both
  Dataview JavaScript flags true. Manual post-import enablement is intentional,
  not incompatibility or configuration drift.
- Reading view can render tested Datacore and Dataview surfaces. This does not
  prove navigation, write behavior, visual quality, or workflow usability.
- Source, tablet source, live vault, and production FNS received no promotion.

## Open blockers

1. First priority: reproduce and fix Android daily-note creation. Trace
   Journals command/configuration, Templater invocation, destination path,
   filename, frontmatter, and reading-view result. Legacy Journals 1.4.3
   configuration has an empty daily `dateFormat`. Post-update Journals 2.1.10
   configuration contains a schema-v3 daily journal with `YYYY-MM-DD`, but
   desktop/mobile Home, Note Toolbar, and the daily hotkey still reference
   the removed 1.x command ID, and the tested daily fixture reports that it is
   not connected to a journal. Treat those as separate facts until runtime
   reproduction isolates the cause.
2. After fixing daily creation, create one synthetic note through the intended
   command in every default root on both PC and Android: `DAILY`, `HUB`, `PARA`,
   `STICKY`, `SYSTEM`, and `ZETA`. Exercise each applicable template family,
   verify exact output path/content/rendering, then restore state and archive
   residue.
3. Complete runtime review of supplied Dusk Discord/GitHub changes. Static
   inventory covers Dynamic Form, Priority Matrix full/light/Git copies, Habit
   Streak RPG, Map of Content update, styling, Discord notes, older-zip
   templates, and full-Dusk plugin additions. Exact current GitHub diffs and
   PC/Android create/write behavior remain unproved.
4. Attribute four request hosts recorded without initiators:
   `cdn.ko-fi.com`, `storage.ko-fi.com`, `i.ytimg.com`, and
   `img.buymeacoffee.com`.
5. Diagnose full Android Home error-like content, clipping, and horizontal
   overflow.
6. Diagnose failed Home ribbon, `Map of Contents`, and `Daily Note`
   navigation. Replace or remove the stale `Map of Contents` and `Inbox`
   specific-file hotkeys only after confirming the intended current commands in
   a disposable vault.
7. Remove or explain raw Todoist configuration rendered on desktop and mobile
   Home.
8. Test required QuickAdd, Meta Bind, Mail Box, timeline, and remaining write
   paths with synthetic fixtures and restored state. Include the stale
   `toggle_todo_revert.md-new-tab` specific-file binding and obsolete Templater
   `insert-` hotkey in this write-path review.
9. Obtain a new release verdict after evidence and documentation are corrected.

## Execution rules

- Use disposable vaults only. Never modify `G:\Obsidian`, either source vault,
  or the user-restored Android vault.
- The main agent owns decisions, repository edits, disposable-vault fixes,
  commits, and final interpretation.
- Use one `obsidian-visual-qa` Luna thread for the complete bounded visual work.
  Luna owns Computer Use, Windows and Android navigation, complete scrolling,
  screenshot capture, evidence indexing, and explicitly authorized reversible
  synthetic interactions. Reuse the same thread for recaptures.
- Luna must not implement fixes or modify repository, source, live, or
  user-restored vault state. Do not run parallel UI operators or duplicate
  Luna's completed visual pass in the main thread.
- Follow the [PR review guide](research/2026-07-25-dusk-pr-review-guide.md) for
  accepted visual evidence and historical-evidence classification. Dynamic
  surfaces require settled reading-view evidence; desktop captures require a
  verified maximized window and complete vertical/horizontal traversal.
- Inventory existing evidence before recapture. Treat pre-2026-07-25 06:00
  screenshots as diagnostic-only by default; retain valid narrow claims from
  logs, manifests, checkpoints, and isolated reproductions.
- Keep network, credential, sync, publish, sharing, AI, and external-writer
  features gated unless a scoped test requires one.
- Reproduce first, apply the smallest safe correction, update the correction
  ledger, restore every synthetic mutation, and verify the relevant checkpoint.
- Preserve atomic commits. Do not collapse findings into one final checkpoint.

## Default Dusk structure

- User-facing roots: `DAILY`, `HUB`, `PARA`, `STICKY`, `SYSTEM`, and `ZETA`.
  Source also contains `.trash`; do not treat it as a designed workflow root.
- `SYSTEM/TEMPLATE/FORMAT` contains 18 templates covering areas, projects,
  daily/weekly/monthly notes, meetings, Zettelkasten notes, contacts,
  documentation, and workstation notes.
- `SYSTEM/TEMPLATE/CODE` contains three todo-toggle templates.
- `SYSTEM/TEMPLATE/CSS` contains Calendar and Timeline note, CSS, and JavaScript
  view assets.

Review whole structure and template behavior before personalization. Do not
infer default design from Home or one template.

## Completion gate

Goal 1 closes only when blockers are resolved or explicitly accepted, PC and
physical-Android evidence match claims, repository checks pass, all synthetic
mutations are restored, and the independent reviewer returns exactly `PASS`.
Until then, keep PR #7 draft and do not ask personalization questions.
