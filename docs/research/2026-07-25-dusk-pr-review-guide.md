# Dusk PR review and personalization guide

Date: 2026-07-25

Use this guide to review PR #7 and leave the decisions needed for Goal 2.
Reviewing this PR does not change `G:\Obsidian`.

Current state: PR #7 remains draft after an independent functional FAIL. Use
[active goal](../active-goal.md) as the sole current blocker list. Do not make
personalization choices until a later independent review returns exactly
`PASS`.

## Ten-minute review

Read in this order:

1. [functional revalidation](2026-07-25-dusk-plugin-functional-revalidation.md)
   for corrected PC and Android behavior;
2. [Goal 1 discovery](2026-07-25-dusk-goal1-discovery.md) for recommendation
   and remaining unknowns;
3. [Dusk_light plugin ledger](2026-07-25-dusk-light-plugin-ledger.md) only for
   plugins you may remove or depend on;
4. [surface and security map](2026-07-25-dusk-surface-and-security-map.md) for
   write, code, network, and credential boundaries.

In GitHub, use **Files changed**. Review research and authority files first.
Plans under `docs/archive/superpowers/plans/` are preserved history, not
product authority.

## What to verify

Approve the evidence correction only if these claims are clear:

- reading view, not editing mode, determines rendered dashboard behavior;
- Map and Mail Box Datacore views can render on PC and physical Android;
- Dataview JavaScript required only two explicit booleans for tested surfaces;
- current compatible local plugins load after update and re-enable;
- desktop-only plugins are excluded only on Android;
- network and credential plugins are tested separately and end off;
- source vaults and `G:\Obsidian` were not changed;
- render success does not prove workflow usability;
- imported disabled state is not proof of Android incompatibility;
- passing discovery would not approve live promotion.

Leave a PR comment if any file still says current Map or Mail Box behavior is
blocked, shows raw Datacore in reading view, or treats imported disabled state
as proof of incompatibility.

## Visual evidence acceptance

Rendered application surfaces must be judged in settled reading view.

- Datacore, Dataview, Meta Bind, JavaScript-backed, dashboard, Home, Mail Box,
  timeline, and other dynamic notes require a primary acceptance capture of the
  rendered interface in reading view.
- Editing or Live Preview captures are supplemental and may prove source text,
  authoring behavior, frontmatter, or editability. They do not replace rendered
  evidence.
- Raw fenced code, Datacore source, query text, an active cursor, or the editor
  toolbar makes a rendered-surface capture invalid unless that source is the
  surface intentionally under test.
- If source remains visible after switching to reading view and waiting at
  least five seconds for rendering to settle, record a rendering failure.
- Label every capture with platform, vault, surface, mode, orientation, and
  scroll position.

Desktop acceptance captures require a verified maximized Obsidian window.

- Verify that Obsidian fills the available desktop work area and that the
  window control represents restore-down rather than maximize.
- Reject floating, tiled, snapped, partially obscured, or unexpectedly narrow
  windows unless that state is explicitly under test.
- Capture the full application area and record desktop resolution and Obsidian
  content dimensions in the evidence manifest.

For each dynamic surface:

1. switch explicitly to reading view;
2. wait at least five seconds and until visible layout movement stops;
3. verify that the intended interface replaced source text;
4. capture the top state;
5. traverse vertically and horizontally where applicable;
6. capture bottom and overflow extremes;
7. test assigned controls and record destinations;
8. use a separate editing-mode capture only when authoring evidence is needed.

Existing candidate screenshots are under:

```text
G:\Dusk-Goal1-Discovery-20260725\workflow-rerun\screenshots\computer-use-maximized
```

They remain candidates until classified under the rules below.

## Historical evidence reuse

Inventory relevant evidence under `G:\Dusk-Goal1-Discovery-20260725` before
recapturing a surface. Classify each artifact as `accepted`, `diagnostic-only`,
`superseded`, or `invalid`.

Screenshots created before 2026-07-25 06:00 local time default to
`diagnostic-only`. Promote an older screenshot to `accepted` only when its exact
vault, run directory, checkpoint, plugin state, configuration state, view mode,
window state, and complete surface coverage are established. Timestamp alone is
not sufficient; copied files may have misleading filesystem times.

Editing-mode, raw-source, non-maximized, partially configured, or
plugin-disabled screenshots may guide debugging but cannot support final visual
acceptance. Logs, manifests, checkpoints, isolated reproductions, and before or
after state records may remain valid for their narrow recorded claim. Do not
generalize a result beyond the configuration in which it was observed.

Do not delete historical evidence. Record which later artifact supersedes each
rejected or stale screenshot. Final PASS decisions may cite only accepted
evidence.

The detailed external manifest should record at least:

```text
relative_path
last_write_time
run_directory
platform
vault_variant
checkpoint
surface
view_mode
window_state
orientation
plugin_state
configuration_state
coverage
classification
claim_supported
superseded_by
notes
```

Keep raw manifests and screenshots outside Git. Commit only sanitized summaries
and accepted-evidence references.

## Personalization decisions after PASS

Reply in PR comments or send the completed list back to Codex.

### 1. Base

Recommended default:

- [ ] Start from sanitized `Dusk_light_empty`.

Choose full Dusk only if you can name a full-only surface or plugin needed on
day one:

- [ ] Start from full `Dusk`.
- Required full-only feature:

### 2. First workflow

Choose one. This fixes the first dependency test and prevents broad plugin
guessing.

- [ ] Home dashboard and daily orientation
- [ ] two-minute capture into Inbox
- [ ] project and area review
- [ ] tasks and daily/weekly planning
- [ ] Other:

Recommended first choice: two-minute capture into Inbox, followed by Home
review. It matches the low-friction capture goal and gives a small end-to-end
test.

### 3. Keep or simplify Dusk surfaces

Mark each surface:

| Surface | Keep now | Later | Remove |
|---|:---:|:---:|:---:|
| Home | [ ] | [ ] | [ ] |
| Map of Content | [ ] | [ ] | [ ] |
| Mail Box | [ ] | [ ] | [ ] |
| Daily notes | [ ] | [ ] | [ ] |
| Weekly notes | [ ] | [ ] | [ ] |
| Monthly notes | [ ] | [ ] | [ ] |
| Projects and areas | [ ] | [ ] | [ ] |
| Getting Started | [ ] | [ ] | [ ] |

### 4. Language

Recommended default:

- [ ] English machine fields and tags, ISO dates, Vietnamese or English prose
  as natural.

Alternative:

- [ ] Translate visible labels only.
- [ ] Translate machine fields too; requires migration and compatibility test.

### 5. Network and account features

Leave off unless needed in Goal 2:

- [ ] Todoist Sync
- [ ] Custom Frames
- [ ] BRAT
- [ ] Digital Garden
- [ ] Share Note
- [ ] Editing Toolbar AI
- [ ] Obsidian Sync or Publish

For each checked item, state account, data sent, and exact workflow benefit.
Do not place credentials in the PR.

### 6. Plugins

Do not review all 47 plugins one by one. Start from selected workflow:

1. identify its visible surface;
2. list plugins that surface actually calls;
3. disable one unrelated group in a disposable;
4. restart PC and Android;
5. test reading, writing, and recovery;
6. keep the reduction only when behavior remains intact.

Plugins already proven desktop-only need no Android troubleshooting:

- Quick Explorer
- Status Bar Organizer
- Image Toolkit in full Dusk

Plugins needing explicit follow-up:

- Journals, because post-update desktop/mobile Home, Note Toolbar, and the
  daily hotkey still use the removed 1.x command ID, while the daily fixture is
  not connected despite a configured schema-v3 daily journal;
- Novel Word Count, because minimal workspaces produce a file-explorer error;
- Highlightr plus Settings Search, because their interaction still throws;
- every write-capable or executable-note plugin used by the selected workflow.

## Approval meaning

PR approval after blockers are resolved and independent review returns PASS
means:

- Goal 1 evidence is accurate enough for personalization;
- your checked decisions can seed a Goal 2 design.

PR approval does not mean:

- copy Dusk into `G:\Obsidian`;
- import source plugin settings;
- enable network or credential plugins;
- sync personal notes;
- remove every plugin not yet understood.

After a PASS and user review, next artifact should be a short Goal 2 design for
one disposable vault and one selected workflow. Implementation follows only
after that design and its verification plan are accepted.
