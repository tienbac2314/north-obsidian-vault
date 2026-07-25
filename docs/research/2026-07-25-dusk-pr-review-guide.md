# Dusk PR review and personalization guide

Date: 2026-07-25

Use this guide to review PR #7 and leave the decisions needed for Goal 2.
Reviewing this PR does not change `G:\Obsidian`.

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
The plan under `docs/superpowers/plans/` is working history, not product
authority.

## What to verify

Approve the evidence correction only if these claims are clear:

- reading view, not editing mode, determines rendered dashboard behavior;
- Map and Mail Box Datacore views work on PC and physical Android;
- Dataview JavaScript required only two explicit booleans for tested surfaces;
- current compatible local plugins load after update and re-enable;
- desktop-only plugins are excluded only on Android;
- network and credential plugins are tested separately and end off;
- source vaults and `G:\Obsidian` were not changed;
- passing discovery does not approve live promotion.

Leave a PR comment if any file still says current Map or Mail Box behavior is
blocked, shows raw Datacore in reading view, or treats imported disabled state
as proof of incompatibility.

## Personalization decisions

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

- Journals, because the daily fixture is not connected;
- Novel Word Count, because minimal workspaces produce a file-explorer error;
- Highlightr plus Settings Search, because their interaction still throws;
- every write-capable or executable-note plugin used by the selected workflow.

## Approval meaning

PR approval means:

- Goal 1 evidence is accurate enough for personalization;
- your checked decisions can seed a Goal 2 design.

PR approval does not mean:

- copy Dusk into `G:\Obsidian`;
- import source plugin settings;
- enable network or credential plugins;
- sync personal notes;
- remove every plugin not yet understood.

After review, next artifact should be a short Goal 2 design for one disposable
vault and one selected workflow. Implementation follows only after that design
and its verification plan are accepted.
