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
4. [PR review guide](research/2026-07-25-dusk-pr-review-guide.md) for evidence
   review now; use its personalization checklist only after PASS.

Plans under `docs/archive/superpowers/` are historical execution records, not
current instructions.

## Verified checkpoint

- PR #6 is merged at `571fde4`; DEC-039 remains reversal authority.
- Sole source is
  `C:\Users\TienBac\Documents\New project\dusk-obsidian-vault-master`.
- Raw evidence and disposables stay under
  `G:\Dusk-Goal1-Discovery-20260725`, outside `G:\Obsidian`.
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
   filename, frontmatter, and reading-view result. Current Android new-note
   behavior is broken and the daily template is a suspected dependency.
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
6. Diagnose failed Home ribbon, `Map of Contents`, and `Daily Note` navigation.
7. Remove or explain raw Todoist configuration rendered on Home.
8. Test required QuickAdd, Meta Bind, Mail Box, timeline, and remaining write
   paths with synthetic fixtures and restored state.
9. Obtain a new release verdict after evidence and documentation are corrected.

## Execution rules

- Use disposable vaults only. Never modify `G:\Obsidian` or source vaults.
- Maximize desktop Obsidian before judgment. Distinguish editing from reading
  mode, wait for dynamic content, and save a labeled screenshot before moving
  to the next check.
- On both PC and Android, scroll each surface from top to bottom and
  horizontally where available. Inspect content, sidebars, toolbars, and final
  rows before judging; one viewport is incomplete evidence.
- Main agent owns decisions, file edits, and Computer Use interactions. Future
  UI work may use at most one Luna visual subagent for read-only review of
  captured screenshots. Do not recreate multi-agent orchestration.
- Keep network, credential, sync, publish, sharing, AI, and external-writer
  features gated unless a scoped test requires one.
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
physical-Android evidence match claims, repository checks pass, and review
returns PASS. Until then, keep PR #7 draft and do not ask personalization
questions.

Current product authority remains in [system design](system-design.md),
[architecture](architecture/recommended-architecture.md),
[behavior](behavior/capture-to-digest.md), [roadmap](roadmap/mvp.md),
[decisions](decisions/decision-log.md), and [Git workflow](git-workflow.md).
