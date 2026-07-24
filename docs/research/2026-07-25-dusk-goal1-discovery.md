# Dusk Goal 1 discovery

Date: 2026-07-25

Status: complete. Independent release-review verdict: **PASS**.

## Outcome

Goal 1 establishes enough evidence to reject wholesale live import and define
a bounded Goal 2 experiment. Corrected source-safe runtime copies prove that
Dusk's static shell can be inspected without credentials, but also prove that
major dashboards depend on plugin configuration that cannot be copied
wholesale. No personalization, live-vault write, source change, final plugin
selection, or Discord-component promotion occurred.

Recommended Goal 2 starting hypothesis:

1. sanitize `Dusk_light_empty` into a new disposable and test that empty base
   directly;
2. preserve its Dusk structure, Home/Map/Mail Box, templates, visual language,
   and onboarding rather than reconstructing them;
3. replay compatible updates, then rebuild only documented non-secret plugin
   settings field by field;
4. keep sync, sharing, publishing, embedded frames, Todoist, AI, BRAT, and
   credentialed features off;
5. evaluate one workflow and its exact plugin dependencies at a time;
6. add no `new from discord` component initially;
7. test a hybrid language contract with English machine keys/ISO dates and
   source-language prose;
8. prove Windows and Android startup, search, write, FNS, backup, and rollback
   before any live promotion.

This is a design recommendation, not permission to modify `G:\Obsidian`.

## Deliverable index

| # | Requested deliverable | Evidence |
|---:|---|---|
| 1 | Prerequisite report | [Goal 1 preflight](2026-07-25-dusk-goal1-preflight.md) |
| 2 | Exact source/variant manifest | [Source manifest and Android comparison](2026-07-25-dusk-source-manifest.md) |
| 3 | Dusk_light complete plugin ledger | [47-plugin ledger](2026-07-25-dusk-light-plugin-ledger.md) |
| 4 | Dusk versus Dusk_light differences | [Variant ledger](2026-07-25-dusk-variant-and-discord-ledger.md#dusk-additions-over-dusk_light) |
| 5 | `new from discord` component ledger | [Discord ledger](2026-07-25-dusk-variant-and-discord-ledger.md#new-from-discord-ledger) |
| 6 | First-open/startup timeline | [Windows and Android timelines](2026-07-25-dusk-runtime-evidence.md#windows-first-open-timeline) |
| 7 | Plugin update/migration timeline | [Update evidence](2026-07-25-dusk-runtime-evidence.md#windows-update-and-migration-timeline) |
| 8 | Popup/new feature catalog | [Popup catalog](2026-07-25-dusk-runtime-evidence.md#popup-and-newly-discovered-feature-catalog) |
| 9 | Bug/failure catalog | [RT-01 through RT-08](2026-07-25-dusk-runtime-evidence.md#error-and-failure-catalog) |
| 10 | Desktop/mobile compatibility matrix | [Physical-device matrix](2026-07-25-dusk-runtime-evidence.md#desktopmobile-compatibility-matrix) |
| 11 | Dusk surface/workflow map | [Surface dependency map](2026-07-25-dusk-surface-and-security-map.md) |
| 12 | Security/privacy/network review | [Security model](2026-07-25-dusk-surface-and-security-map.md#security-and-privacy-model) |
| 13 | Startup/performance assessment | [Performance evidence](2026-07-25-dusk-runtime-evidence.md#performance-assessment) |
| 14 | Language-strategy analysis | [Three strategies](2026-07-25-dusk-language-strategies.md) |
| 15 | Zoomed-out risks/opportunities | [Risks and simpler experiments](2026-07-25-dusk-surface-and-security-map.md#zoomed-out-risks) |
| 16 | Archived PR #4 revalidation | [Confirmed/stale/contradicted/unknown ledger](2026-07-25-dusk-pr4-revalidation.md) |
| 17 | Goal 2 recommendation | [Goal 2 scope](#goal-2-recommendation) |
| 18 | Independent review verdict | [PASS](2026-07-25-dusk-goal1-review.md) |

Android-specific requested deliverables are covered by the source manifest and
runtime report: source-copy equality, physical startup/popup timeline,
load/update matrix for both variants, surface screenshots, errors/disabled
plugin evidence, rotation/background findings, mixed-language probe, and
blocker list.

## Fixed authority and safety result

- Sole source:
  `C:\Users\TienBac\Documents\New project\dusk-obsidian-vault-master`.
- Source totals: 1,571 files, 421 directories, 293,256,520 bytes.
- PC/tablet safe-manifest equality:
  `D7E55C61CD6395F938F1842CBED66D71D22DCD8480BA5EE2628CD5452CB3B6AB`.
- Disposable/raw root: `G:\Dusk-Goal1-Discovery-20260725`.
- Corrected Android disposables:
  `/sdcard/Documents/Dusk-Goal1-Safe-Rerun/{Dusk_light,Dusk}`.
- Corrected pre-open copies contained zero community-plugin `data.json`,
  `todoist-token`, or risky-name paths.
- `G:\Obsidian`, PC source, and tablet source were not test targets.
- FNS, Obsidian Sync, configuration sync, publishing, sharing, and external
  writers were unavailable or off in runtime copies.

Independent review found 31 source community-plugin `data.json` files in the
initial runtime copies. Those observations are quarantined. The unsafe
Android copy was removed, and all promotion-relevant runtime claims below come
from a fresh corrected rerun.

## Evidence-backed conclusions

### Source choice

`Dusk_light_empty` remains the best Goal 2 starting hypothesis:

- it preserves the source's direct-import model and full Dusk configuration;
- it omits 57 demonstration notes that would otherwise become user clutter;
- it carries 47 rather than 58 plugin binaries;
- version, manifest, CSS, template, and non-secret structural findings can be
  compared without importing source plugin settings;
- the populated light copy remains a reference and regression fixture for
  understanding dashboards.

It is not ready for live use unchanged. The empty base was not runtime-tested,
and populated runtime behavior does not transfer by assumption because every
source plugin `data.json` was excluded. Its source configuration enables 46
plugins, includes executable-note engines, and contains versions with known
first-start defects.

### Updates and migrations

Obsidian 1.12.7 found the same 34 light and 44 full updates on Windows and
Android. Post-update plugin manifests had exact cross-platform hash parity:
47 of 47 in light and 57 of 57 in full.

Commander 0.5.2 is unsuitable for the current Android baseline; 0.5.7 removed
the block. Editing Toolbar AI consent must be explicit and remained off.
Journals v2 migration appeared only in quarantined evidence; corrected copies
without source settings did not migrate. Safe Journals migration remains
unknown.

### Mobile

Static source surfaces render on the physical tablet, but corrected dynamic
surfaces do not. Home reports DataviewJS disabled, Map and Mail Box expose raw
DatacoreJS, and full Home exposes raw button tokens. Project, area, onboarding,
and template-source views remain readable. Ten major light surfaces have
paired portrait/landscape captures; rotation added no major new overflow beyond
one clipped Home tab label. Quick Explorer, Status Bar Organizer, and the
full-only Image Toolkit cannot support Android by manifest.

Corrected light became usable by a 10.7-second probe and full by about 19.7
seconds. Neither corrected run reached recovery, but repeated Mali GPU
allocation errors remained; no crash or ANR was captured. Full startup and
missing safe dashboard configuration independently block unchanged-stack
promotion.

### Executable and network features

Datacore, DataviewJS, JS Engine, QuickAdd scripts, and Templater turn vault
files into code. Meta Bind, Tasks, Tag Wrangler, attachment tools, trash tools,
encryption, and Discord components can write broadly. Todoist, AI Editor,
Custom Frames, Digital Garden, Share Note, BRAT, and sync/configuration
features cross network, credential, or code-supply boundaries.

Goal 2 should not enable these by category. It should enable only the exact
dependency needed by an accepted workflow, after static review and a
checkpointed Windows/Android test.

## Current public evidence

Primary sources checked through the project's Agent Reach/GitHub routes:

- official
  [community plugin registry](https://github.com/obsidianmd/obsidian-releases/blob/master/community-plugins.json),
  observed blob `8cc54b1b17954e4884ccd7012b4b8ba1ba54ce61`;
- Obsidian
  [Plugin security](https://help.obsidian.md/Extending+Obsidian/Plugin+security)
  and
  [Community plugins](https://help.obsidian.md/Extending+Obsidian/Community+plugins);
- project release links for every plugin in the complete ledger;
- [Settings Search issue #47](https://github.com/javalent/settings-search/issues/47)
  for the Highlightr interaction;
- Commander Android reports
  [#167](https://github.com/jsmorabito/obsidian-commander/issues/167) and
  [#200](https://github.com/jsmorabito/obsidian-commander/issues/200);
- Editing Toolbar Android AI report
  [#344](https://github.com/pkm-er/obsidian-editing-toolbar/issues/344);
- Checklist Android memory report
  [#193](https://github.com/delashum/obsidian-checklist-plugin/issues/193);
- Paste URL mobile data-loss report
  [#50](https://github.com/denolehov/obsidian-url-into-selection/issues/50);
- Quick Explorer mobile request
  [#104](https://github.com/pjeby/quick-explorer/issues/104);
- Outliner Android touch request
  [#582](https://github.com/vslinko/obsidian-outliner/issues/582);
- Recent Files mobile request
  [#93](https://github.com/tgrosinger/recent-files-obsidian/issues/93);
- current public Priority Matrix commit
  [`bb0b67d`](https://github.com/DuskWasHere/Priority_Matrix/commit/bb0b67de694b9171b5ae80d6522303cfacf2ecc8).

Open-issue keywords and community reports identify test targets; they do not
prove a defect on this device. Runtime claims in this report come from current
disposable evidence.

## NotebookLM synthesis

Broad notebook `8ce765d2-f356-43a0-8717-e29975e6b257` challenged metadata
stability, manual file-move/link behavior, executable dashboards, and
language/schema decisions. Much of its answer drifted into unrelated VPS,
agent, sync, and backup architecture, so those claims were excluded.

Lean notebook `c1fd2c71-0e8f-47c7-97ed-22e4f5f989ae` correctly challenged:

- wholesale use of the large plugin footprint;
- unreviewed Datacore JSX and QuickAdd JavaScript;
- need for core/Bases comparison;
- journal migration validation;
- stable English machine fields and ISO dates.

It also overreached by calling the measured Android delay a complete usability
failure, recommending removal of four plugins without dependency tests,
adding Lazy Loader even though it is absent from source, and asserting a
sub-1.5-second target without evidence. None of those recommendations is
accepted. NotebookLM remains an adversarial research partner, not source of
truth.

## Unknowns that move to Goal 2

- exact minimal plugin set for the selected user workflows;
- Highlightr/Settings Search minimum trigger;
- per-plugin startup and memory cost;
- Android cold-start recovery root cause;
- normal in-app Vietnamese create/save/search/index behavior;
- semantic equivalence of Journals v2 configuration and generated notes;
- safe-field reconstruction for intentionally excluded `data.json`;
- direct Windows and Android runtime of `Dusk_light_empty`;
- Android writes through Project Meta Bind, Tasks, QuickAdd, and any selected
  Datacore component;
- attachment rename/link behavior;
- FNS convergence for Unicode names and selected `.obsidian` policy;
- current Habit Streak RPG provenance/license;
- uninstall-time AI/config/secret cleanup;
- whether core Bases can replace any accepted Dusk interactive surface.

These are bounded experiments, not reasons to repeat broad discovery.

## Goal 2 recommendation

Goal 2 should evaluate one sanitized disposable `Dusk_light_empty` in this
order:

1. prove the empty copy starts on Windows and Android with the same exclusion
   contract;
2. replay the 34 compatible updates;
3. rebuild only the minimum non-secret Dataview, Datacore, Meta Bind, and
   related settings needed for one accepted surface, from an explicit field
   allowlist;
4. set the hybrid language experiment: English machine fields and ISO dates,
   source-language prose, aliases for cross-language retrieval;
5. preserve the Dusk folder shell and select the first human workflow among
   Home/capture/review/tasks;
6. identify only that workflow's required plugins and disable unrelated
   plugins in dependency-sized groups;
7. keep all networked, credentialed, publishing, AI, sync, and Discord
   additions off;
8. test the same workflow on Windows and physical Android, including cold
   starts, normal Vietnamese typing/search, write behavior, narrow tables,
   rotation, resume, and offline operation;
9. add one Discord component only if a requirement remains unmet, beginning
   with the public Priority Matrix rather than loose copies;
10. produce a concise design and implementation plan, then a backup/rollback
   manifest, before asking for live promotion.

Do not rebuild Dusk feature-by-feature. Do not copy all plugins into
`G:\Obsidian`. Do not translate machine-facing contracts during initial
personalization.

## Independent verdict

Independent release review returned **PASS** after the unsafe-copy finding was
corrected, all reports were rewritten against source-safe reruns, and ten
major Android surfaces gained paired portrait and landscape evidence. The
[review record](2026-07-25-dusk-goal1-review.md) closes discovery only.
Dynamic-dashboard failures and remaining write, FNS, migration, and performance
unknowns continue to block live promotion.
