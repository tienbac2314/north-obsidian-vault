# Active goal

## Release-candidate packages and three-plugin correction (2026-08-16)

Current disposable Dusk_light release candidate passed ChatGPT Web review and
the approved bloat cleanup, then applied the user's correction. Restored on
both disposable platforms: `obsidian-checklist-plugin` `2.2.14`, `custom-sort`
`3.1.6`, and `recent-files-obsidian` `1.7.10`. Checklist is back as the
right-side Todo List/Checklist pane; Recent Files is back as a usable recent
file pane; Custom Sort is installed with `suspended=true` for later Notebook
Navigator/File Explorer sync. No note content was removed.

Still removed on both: `daily-note-navbar`, `obsidian-day-planner`, and
`obsidian-admonition`. The prior removal of the three restored IDs is a
superseded historical checkpoint, not current release state.
Android QuickAdd retained one stale Custom Sort startup command; it was
removed, Android was restarted, and the final Android package was rebuilt.
Settled rerun showed no error toast.

Existing guide authority is [Dusk_light quick start](dusk-light-getting-started.md);
it now documents one PC/mobile flow, current plugin ownership, capture choices,
Notebook Navigator, Bases/Datacore/Tasks, templates, and FNS/Notion deferral.

Final marked-demo packages are outside Git under the Part 2 runtime evidence
root:

- PC: `Dusk_light-PC-USER-20260816.zip`, SHA-256
  `f117d633b65668628f03ecb4a5232ff1876f41e0871e56ce3ec552a8f2668521`.
- Android: `Dusk_light-Android-USER-20260816.zip`, SHA-256
  `418325edfd69cff5f2e68336d8f9e64a4ca5069cca8d2e7b856f0ebc6e864f0f`.
- Package manifest: `FINAL-PACKAGE-MANIFEST-20260816.csv`, SHA-256
  `5b280cfc70ff1670679a7d51ac9c62b297c955179682c84a9e60da8427913bd3`.

Both packages contain same 9 marked demo notes plus guided walkthrough. Exact
pre-review rollback archives remain separate and unchanged. FNS and Notion
setup stay deferred to user. Publish only this reset branch after repository
validators pass. Wave 6/Task 7, Wave 7/Task 8, and Wave 8/Task 9 remain NOT
STARTED.

## Current NN folder and toolbar customization result (2026-08-16)

Approved Notebook Navigator and Note Toolbar customization is verified on the
two disposable Dusk_light targets. Windows and Android show root order
`HUB, DAILY, PARA, STICKY, INBOX, SYSTEM`, alphabetical nested folders, and
matching 28-folder icon sets. Note Toolbar global actions are `Home`, `Today`,
`New...`, `Recent`, and `Search`; `Page Task` remains contextual to Area and
Project. Global floating Delete and Settings entries are removed. ChatGPT and
YouTube custom-frame ribbon icons were already disabled.

Empty Windows STAGING was retired outside the vault. Physical INBOX remains
because QuickAdd writes there; Mail Box remains virtual. Android
`SYNTHETIC-QUARANTINE` remains preserved on disk but is hidden from Notebook
Navigator so visible roots match Windows.

Windows: Obsidian `1.13.6`, PID `15808`, maximized CUA `1920x1033`.
Android: serial `01234ABC`, PID `12577`, native `1200x2000`.

Raw evidence and rollback stay outside this repository:
`G:/Dusk-Knowledge-Hub/payload/evidence/Dusk-Phase2-Preparation-Part2-Runtime/checkpoints/PERSONALIZATION-NN-FOLDER-TOOLBAR-20260816/`.
Manifest SHA-256:
`a8246113ef6d4469436bc137a011f07d0e967dc28da43217c0160bb579165fe4`.
Part 2 authority at publication preparation:
`2e66276000ed8b61349af403806201e1b8cd6891` / tree
`3bf288bcdc2ad3f93ed3ef1f476e4efe2c1c821b`.

This is a compact product status update only. Wave 6/Task 7, Wave 7/Task 8,
and Wave 8/Task 9 remain NOT STARTED.

## Current ISO date standardization result (2026-08-14)

User reverted the prior day-first display experiment. Supported visible dates
now use `YYYY-MM-DD` with hyphens on both exact disposable targets. Covered
Notebook Navigator, Bases, Homepage/Mobile Homepage, Mail Box/Mobile Mail
Box, Calendar, Timeline, monthly/weekly views, and templates.

Stored frontmatter, task-line dates, journal properties, journal filenames,
links, note content, and template calculations were preserved. Tasks and
Journals already use ISO. Checklist was not patched because it has no
supported date-format setting.

Windows: `W5-CLEAN-REVIEW-20260811`, Obsidian `1.13.7`, PID `18996`, CUA
window `5113818`, `1920x1033`. Android: serial `01234ABC`,
`md.obsidian/.MainActivity`, PID `6574`, native `1200x2000`. Homepage and
Monthly Note runtime checks show ISO dates on both platforms.

External result and rollback:
`G:/Dusk-Knowledge-Hub/payload/evidence/Dusk-Phase2-Preparation-Part2-Runtime/checkpoints/PERSONALIZATION-DATE-FORMAT-ISO-STANDARD-20260814/`

40-row manifest SHA-256:
`BDDFE88A556025FF6DD08CB64E33845CAEF811C6BB339E22F9C61372EEDC13BB`.
Part 2 authority is currently `0ca0a84e938fc231efed89d126c7f2e470fd77bb`
/ tree `b7c0dc7bc5e219c526365816990da06bd15e81ab`, clean. Final Graphify
refresh used 9router/OpenAI-compatible `openai` model `graphify` and wrote
190 nodes, 127 edges, and 71 communities; generated output is navigation-only
with one fail-closed stale-node warning. This compact product entry
supersedes the day-first entry below. No future wave or canonical Task 7, 8,
or 9 starts.

## Current date display repair result (2026-08-14)

User-requested day-first visible date repair is accepted on exact disposable
Windows and Android targets. Notebook Navigator, Homepage and Mobile Homepage
Datacore labels, Mail Box, existing and template monthly/weekly views, custom
Calendar and Timeline labels, and visible Bases date columns now use
dd/mm/yyyy or an equivalent day-first form. Stored frontmatter, task-line
dates, journal properties, template calculations, and note filenames remain
ISO YYYY-MM-DD.

Windows target W5-CLEAN-REVIEW-20260811 passed settled Homepage and weekly
Base checks. Android serial 01234ABC passed settled Homepage, daily note, and
monthly Base checks. No live vault, source tree, bf23 worktree, credentials,
or future wave/task changed. Tasks native task-pane dates remain ISO because
its task-line contract has no safe display-only setting. Journals period
naming remains ISO because it drives filenames and date variables. Checklist
has no date-format setting. No plugin bundle or stored task syntax changed.

External raw evidence and exact hash manifest remain outside this product
repository at:
G:/Dusk-Knowledge-Hub/payload/evidence/Dusk-Phase2-Preparation-Part2-Runtime/checkpoints/PERSONALIZATION-DATE-FORMAT-REPAIR-20260814/

Manifest SHA-256:
964BEDA77C6C5B19E3CA02CA9F90D41D8D49BF5FC996A5133DF65230EE057AAB.
The manifest has 56 rows: 40 intentional display changes, two workspace-only
navigation changes, and 14 unchanged controls.

Post-commit Graphify used the process-local 9router OpenAI-compatible route,
backend openai, model graphify. It wrote 220 nodes, 140 edges, and 86
communities. One fail-closed stale-node warning was recorded; generated
Graphify output remains navigation-only and was not treated as authority.

This is one compact product status update on docs/phase2-preparation-reset.
Wave 6/Task 7, Wave 7/Task 8, and Wave 8/Task 9 remain NOT STARTED.

## Current Checklist content-filter result (2026-08-14)

The first Checklist repair restored its right-side pane but left it empty.
Dusk places #task inline on task lines, while Checklist showAllTodos=false
looks for a tag block. Disposable-only fix: set showAllTodos=true while
keeping todoPageName=task, note format, Tasks, NN Calendar, Homepage, and
Note Toolbar unchanged.

Real grouped rows now appear on both platforms. Windows shows NN Calendar
above Todo List; Android shows Todo List rows in its right drawer and keeps
Calendar in its drawer menu. Safe checkbox tests passed and were reverted.
No note content changed. Raw evidence and rollback stay outside this repo
under the existing task-pane checkpoint. This supersedes the earlier
task-pane shell-only status. No future wave or canonical Task 7, 8, or 9
started.

## Current Checklist task-pane repair result (2026-08-14)

Personalization repair passed on both disposable platforms. The requested
right-side task component is Checklist 2.2.14's todo view, which supplies
Search tasks, Today, Show all, Completed, and grouped task rows. Tasks 8.3.0
remains enabled for task queries; it does not own this docked pane.

Windows disposable W5-CLEAN-REVIEW-20260811 now has 41 active community
plugins and shows NN Calendar above Checklist Todo List in a fresh maximized
1920x1033 observation. Android serial 01234ABC now has 39 active community
plugins and shows Todo List in its right drawer; Calendar remains available
from the drawer menu. Safe checkbox tests passed and fixture notes were
restored. The short Android No file view was transient startup loading.

No note content, templates, plugin payloads, live vault, source tree, bf23,
or product main changed. Full raw evidence and rollback remain outside this
repository:
G:/Dusk-Knowledge-Hub/payload/evidence/Dusk-Phase2-Preparation-Part2-Runtime/checkpoints/PERSONALIZATION-TASK-PANE-REPAIR-20260814/

This is a compact status only. No future wave or canonical Task 7, 8, or 9
started.

## Superseding current NN full UI/debloat result (2026-08-14)

Personalization NN audit passed on exact disposable Windows and registered
Android targets. This is not a new wave. Notebook Navigator `3.3.3` is the
single visible right-sidebar calendar on both, with quarter and week-number
labels. Journals remains installed for period rendering, commands, properties,
and templates; its duplicate calendar surface is disabled only in the
disposable plugin payload after source-level recreation proof. Note Toolbar FAB
and `Toggle Page Task` remain. The stale Todoist ribbon shortcut is hidden;
other plugin and left-rail owners remain.

Cursor-free quarter/year NN templates render on both platforms. The Windows
pre-existing empty `DAILY/YEARLY/2026.md` was filled, not deleted. No
`20260812` artifact exists on either target. Windows has 40 community IDs and
Android 38; only `quick-explorer` and `statusbar-organizer` are Windows-only.
Android dual pane remains unchanged and passed after transient startup
loading.

External result and manifest:
`G:/Dusk-Knowledge-Hub/payload/evidence/Dusk-Phase2-Preparation-Part2-Runtime/checkpoints/PERSONALIZATION-NN-FULL-CONFIG-AUDIT-20260814/NN-FULL-CONFIG-AUDIT-RESULT-20260814.md`
and `NN-FULL-CONFIG-AUDIT-MANIFEST-20260814.csv`.

Material result commit: Part 2 `8c4e7fa776187f86e1f7e47836864285994439f5`
/ tree `b1da1e5b368e6aeadfb37b1c02d07d96cb7859e7`; product reset local
`b33c7b6eef7e438008fdac6903790d6c83aa02b1` / tree
`b403b75c039a17ed9a7ef8520c0421e512584880`. Both worktrees were clean at
this checkpoint; product reset was two commits ahead of origin/reset until
push. Stop for user self-review after final validators and publication. Do
not start Wave 6/Task 7, Wave 7/Task 8, or Wave 8/Task 9.

## Current NN full UI/debloat audit checkpoint (2026-08-14)

Personalization continues in the existing lane. NN `3.3.3` is the primary
right-side calendar on Windows and Android. Read-only review found Journals'
separate left calendar leaf, a working Note Toolbar bottom-right FAB with
`Toggle Page Task`, and a settled full-height Android NN dual pane.

Next bounded work: preserve rollback; add and map cursor-free NN quarter/year
templates; hide only Journals' duplicate calendar leaf and stale Todoist ribbon
shortcut; restart and verify Windows and Android. Keep Journals renderer and
period commands, all note content, Note Toolbar, Tasks, Datacore, Bases,
Templater, QuickAdd, and PC-only features. No guessed Android CSS change.

Windows empty `DAILY/YEARLY/2026.md` is a pre-existing disposable artifact.
No `20260812` artifact exists in either exact target. Do not delete it or
create another empty note. No future wave/task starts.

Before this checkpoint: Part 2 `a55d641c46773fd25ff96a6a38beaf6381b022d9`
/ tree `cbd3a1ab5de79a80b08c868ff42a3a4b0844a6ad`; product reset
`d8fc1568345d3e5c22b28fb1360bce510f18937a` / tree
`4f2e6504bb33741a6580543c391fdfe9991bf5e0`, clean.

## Current NN visual pilot result (2026-08-14)

Disposable NN pilot passed on Windows `W5-CLEAN-REVIEW-20260811` and Android
`01234ABC`. Right-sidebar calendar, Q3, week numbers, existing-date
navigation, restart persistence, and platform sync passed. Windows is
maximized; Android drawer opens to NN Calendar. Journals stays installed with
its calendar hidden in left navigation; no visible duplicate remains. No note
content changed. Windows-only `quick-explorer` and `statusbar-organizer` are
expected; Projects absent and Day Planner disabled on both.

External result/manifest:
`G:/Dusk-Knowledge-Hub/payload/evidence/Dusk-Phase2-Preparation-Part2-Runtime/checkpoints/PERSONALIZATION-NN-VISUAL-PILOT-20260814/NN-VISUAL-PILOT-RESULT-20260814.md`.

Status: `PASS_WINDOWS_ANDROID_NN_VISUAL_PILOT_STOP_FOR_USER_REVIEW`. Run final
checks, publish reset branch, then stop. Final Part 2 authority is clean at
`a55d641c46773fd25ff96a6a38beaf6381b022d9` / tree
`cbd3a1ab5de79a80b08c868ff42a3a4b0844a6ad`. Post-result Graphify used
9router/OpenAI-compatible mapping and returned 230 nodes, 143 edges, 94
communities; one fail-closed stale-node warning remains. No live vault,
`bf23`, future wave, plugin removal, or hotkey change.

## Current NN visual pilot execution (2026-08-14)

User approved bounded disposable-only NN pilot. Before runtime mutation, Part 2
is clean at `6d65a2f169358f56fb4f781b0f53fff1c58af6d8` / tree
`1b840f9b30ed3cb4842d4f7929993a752f5113ce`; product reset is clean at
`a51299ab1e2970ac42b27aefd832c0a6ffc48d68` / tree
`6e2c76fd19cf989a29577b853fd65fd9ca320745`, equal to origin/reset.

Use Windows `W5-CLEAN-REVIEW-20260811` / Obsidian 1.13.6 and Android serial
`01234ABC` / `md.obsidian` 1.13.6 / remote vault
`/storage/emulated/0/Documents/Dusk-Phase2-Preparation-Part2-Android-V1-20260801`.
Set NN only to `calendarPlacement=right-sidebar`,
`calendarShowQuarter=true`, and `calendarShowWeekNumber=true`. Create
rollback in the external runtime root first; verify both platforms, record
result, validate, publish reset, then stop for review. No live vault, `bf23`,
future wave/task, plugin removal, or hotkey change.

## Current Notebook Navigator corrected guide review (2026-08-14)

This supersedes the previous source-first draft's wrong YouTube reference only.
Historical NN and Personalization records remain truthful. Before this
documentation update, product reset was clean at
`f6445dffd31dabf6640224b4ee25c4f20d05b262` / tree
`508ab42c2e75218ae2d841d7b5fac9fc6cf4de91`, equal to origin/reset. Part 2
`main` was clean at
`d17fbbb45ece6289f421155f0960281629bfb64e` / tree
`29f3415b5fe98222378fe954adc8910ad93d24f6`.

User required NotebookLM and external desktop Chrome ChatGPT Web review before
another NN configuration change. Correct guide is
`Mastering Notebook Navigator 3 for Obsidian`,
`https://youtu.be/m2maDNtho7Y?si=4Zx0hooPD0qtfaDs`, by Johan Sanneblad.
NotebookLM source `feae0f00-9947-4a3e-a1e4-72ae0a55134d` is ready in notebook
`aede6d6f-b21f-48dd-9801-014a9b21f10d` with 279 ready sources. Earlier Bases
video `1Mgsdpy7awE` is superseded. Corrected ChatGPT Web used
`GPT-5.6 Sol` and `High`, but its web search hung and was stopped; partial
output is advisory only.

Independent local NN 3.3.3 source confirms right/left calendar placement,
full right-sidebar month, left-sidebar week control, quarter/week-number,
feature-image/task/year/outside-month options, internal filter search with
optional Omnisearch integration, manual sort writes, and desktop/tablet
dual-pane versus phone single-pane limits. Current baseline is unchanged:
left calendar, one left-sidebar week, quarter/week-number off, feature/tasks/
year/outside/highlight on, dual pane on; data.json SHA-256
`0F2B9650272AAB880A953A00E3B47E50B26CA387AB747602E50A07CF3ED2F371`.

NotebookLM identifies unconfigured features for later disposable review:
property browsing/saved searches, context-aware folder notes, shortcuts,
recent files, manual sorting/group headers, word targets, merge, range
filtering, icons/colors/spacing, vault profiles, and per-setting sync.
Manual sort, property/tag assignment, folder-note creation, frontmatter
icon/color writes, and merge remain review-only. Keep current plugin owners;
NN does not replace Bases, Datacore, Tasks, Templater, Meta Bind, QuickAdd,
Note Toolbar, or Journals rendering.

Evidence remains outside product Git:
`G:/Dusk-Knowledge-Hub/payload/evidence/Dusk-Phase2-Preparation-Part2-Runtime/checkpoints/PERSONALIZATION-NN-SOURCE-FIRST-REVIEW-20260814/`.
Review SHA-256 is
`92D83AA76EC4D983CC5A3D6062B4DFA754B61C7FCC716C7773108BC3E2A810B5`;
manifest SHA-256 is
`AE117EA9B6FDA1563C96B445654526F91F18D11B98B1AC9D04C54274C4AC6A4A`.
Graphify refresh after Part 2 documentation commit used process-local
9router/OpenAI-compatible `backend=openai`, `model=graphify`: 4 documents
re-extracted; 202 nodes, 137 edges, 75 communities. Fail-closed warnings
remain recorded in Part 2; generated Graphify output is navigation-only.

Status: `SOURCE_REVIEW_COMPLETE_STOP_FOR_USER_REVIEW`. No vault, plugin,
hotkey, Android config, live-vault, `bf23`, or future-wave/task mutation.
After this authority update, product reset publication remains limited to
this compact correction; no raw sources, screenshots, profiles, ledgers, or
archives enter product Git.

## Current Notebook Navigator follow-up result (2026-08-13)

This is the current compact Personalization checkpoint. It supersedes the
older NN result below without rewriting history. Before this product update,
product reset was clean at `24b7ede00259380ec370da29013db7452580085d` / tree
`2174670570a7d648690692ea35b51804eed98a40`, equal to origin/reset. Part 2 is
clean at `d17fbbb45ece6289f421155f0960281629bfb64e` / tree
`29f3415b5fe98222378fe954adc8910ad93d24f6`.

- Notebook Navigator `3.3.3` is enabled on the exact Windows clean
  disposable and registered Android disposable. NN is primary visible
  navigation/calendar surface on both platforms.
- Quarter and year paths are synchronized to
  `[DAILY]/[QUARTERLY]/YYYY-[Q]Q` and `[DAILY]/[YEARLY]/YYYY`.
- `includeDescendantNotes=true` and `narrowSidebarLayout=none` match on both;
  Android keeps dual panes. Journals remains installed as periodic-note
  renderer, with its fallback calendar leaf moved left so no right-side
  duplicate is visible.
- Windows synthetic empty `2026.md` is at `DAILY/YEARLY/2026.md`. Android
  stale main-tab clutter was reduced to one Homepage tab; no note content was
  deleted.
- Fresh Windows settled UI and retained Android native evidence passed the
  follow-up. Raw evidence and rollback stay in the external runtime root, not
  product Git. External result:
  `PERSONALIZATION-NN-FOLLOWUP-20260813/NN-FOLLOWUP-RESULT-20260813.md`.

### Overlap decision

| Surface | Result | Current action |
|---|---|---|
| File Explorer, Recent Files, Custom Sort, tags, properties | NN overlaps browsing/navigation | Keep current owners for review; no removal yet |
| Omnisearch | NN offers optional integration, not a bundled search engine | Keep Omnisearch |
| Bases, Datacore, Tasks | NN does not replace them | Keep |
| Templater, Meta Bind, QuickAdd, Note Toolbar | NN does not replace them | Keep |
| Journals | NN does not replace periodic-note rendering | Keep Journals; NN owns visible calendar/navigation |

Reddit/OpenCLI findings were advisory. Official Notebook Navigator repository,
documentation, and release data control material decisions.

Graphify refreshed Part 2 through process-local 9router/OpenAI-compatible
mapping. Final graph identity is recorded in the external result. One
fail-closed stale-node warning remains; no purge or fallback was used.

Status: `PASS_WINDOWS_ANDROID_NN_FOLLOWUP_REVIEW_READY`. Product checks passed;
compact result committed and pushed only to `docs/phase2-preparation-reset`.
Stop for user review. Do not remove overlap plugins or start Wave 6/Task 7,
Wave 7/Task 8, or Wave 8/Task 9 in this checkpoint.

## Current Notebook Navigator migration result (2026-08-13)

Approved Personalization work continued after the bounded Notebook Navigator
pilot. Before this documentation checkpoint, product reset was clean at
`7ea72c6bde2d926cbe96b12ecfe38931cb1f48` / tree
`6f24d0f08a6c92b5bd6d854223e2727115a554e9`, equal to origin/reset. Part 2
authority and raw evidence remain in the separate runtime repository/root.

- Notebook Navigator `3.3.3` is enabled on exact Windows
  `W5-CLEAN-REVIEW-20260811` and registered Android serial `01234ABC`.
- Windows Obsidian `1.13.6` is open and maximized. Windows passed NN daily,
  weekly, and monthly calendar creation. Android passed NN calendar selection
  and Create for `DAILY/DAILY/2026-08-13.md`; settled native output was 634
  bytes with no raw Templater token. Synthetic output was preserved outside
  Git and moved out of Android active content.
- NN uses escaped literal folder patterns and cursor-free NN-only periodic
  template copies with required Journals fields. Original Dusk templates stay
  unchanged. Android `includeDescendantNotes` now matches Windows (`true`) with
  rollback preserved.
- NN owns navigation/calendar/creation. Journals remains periodic renderer and
  owner. Calendar overlap is intentional fallback behavior; no plugin removal,
  creation-hotkey rebinding, live-vault change, or future wave/task work began.
- Windows has 40 community IDs and Android 38. Only Windows-only IDs are
  `quick-explorer` and `statusbar-organizer`; Android-only IDs: none.

External result root:
`G:/Dusk-Knowledge-Hub/payload/evidence/Dusk-Phase2-Preparation-Part2-Runtime/checkpoints/PERSONALIZATION-NOTEBOOK-NAVIGATOR-MIGRATION-20260813/`.
Manifest SHA-256:
`82C1EA8A8ADE93F5AE68773364F2AEB36008087021CA978F5199333DFD72065E`.

Status: `PASS_WINDOWS_ANDROID_NN_MIGRATION_STOP_FOR_REVIEW`. Next action is
final validators, one required 9router Graphify refresh after the authority
commit, exact Git identity, and push of this compact reset-branch update.
Wave 6/Task 7, Wave 7/Task 8, and Wave 8/Task 9 remain not started.

## Current documentation seal (2026-08-13)

Before this authority-only seal, Part 2 was clean at
`797f5642d2fa4b529d6c29eb64786268a5e01e7a` / tree
`d25b0e1de971ab23e572fa12fbcf78736c2a18b1`; product reset was clean at
`072514b3dfd3d6e4c0ad5ba6237bf80dc1fbd88f` / tree
`bda91d3193b0fd9519da92273cba6bdaa63d9fbf`, equal to origin/reset. Final
identity is recorded in the external pilot checkpoint after this commit.
Stop for user review.

## Current Notebook Navigator pilot result (2026-08-13)

Pilot finished on exact clean Windows and registered Android targets. Official
Notebook Navigator `3.3.3` was the only added community ID: Windows `39 -> 40`
and Android `37 -> 38`. Existing plugins, hotkeys, Dusk routes, and content
owners remain unchanged.

- Windows passed folder/descendant navigation, Knowledge/Area/Project opening,
  filter/property search, Omnisearch, existing daily-note calendar opening,
  and safe Templater creation.
- Android passed settled load, PARA/Projects expansion, existing project-note
  opening, and settled Homepage return. Native captures are `1200x2000`.
- Synthetic Windows `INBOX/Untitled.md` rendered and was quarantined outside
  the vault. No existing artifact was deleted.
- One review-only finding remains: Notebook Navigator search preview can show
  template source text containing `tp.file.cursor()`; opened rendered notes
  did not show a raw token. No repair or removal follows from this finding.
- Structure decision remains `PARA/RESOURCES/KNOWLEDGE` for reusable learning
  and reference. Concept Map remains retired as a normal owner. Existing user
  moves were not remigrated.
- External evidence root:
  `G:/Dusk-Knowledge-Hub/payload/evidence/Dusk-Phase2-Preparation-Part2-Runtime/checkpoints/PERSONALIZATION-NOTEBOOK-NAVIGATOR-PILOT-20260813/`.
  Final manifest SHA-256:
  `708F1AF7633F13233ECC304C1CF13725E4E1C0AA6CF9664D4766B6F0E526EF44`.

Status: stop for user review before any plugin removal, hotkey rebinding, or
future wave/task work. Wave 6/Task 7, Wave 7/Task 8, and Wave 8/Task 9 remain
not started.

Post-commit Graphify used process-local 9router/OpenAI-compatible
`backend=openai`, `model=graphify`; five documents were re-extracted and the
graph wrote 189 nodes, 125 edges, and 73 communities. Fail-closed warnings
remain recorded in the external pilot checkpoint. Generated graph output is
navigation-only; no Gemini fallback or retry.

## Current Personalization Notebook Navigator pilot (2026-08-13)

User approved default structure decisions with one correction: keep
`PARA/ARCHIVES` and `PARA/WORKSTATION` during audit; use
`PARA/RESOURCES/KNOWLEDGE` for reusable learning/reference; retire Concept Map
as a normal owner. Existing clean-vault moves are current and must not be
remigrated.

- Pilot official Notebook Navigator `3.3.3` on the clean Windows disposable,
  then mirror it to registered Android. Keep current Dusk navigation, search,
  creation hotkeys, and all existing plugins during pilot.
- Use one compact Windows matrix, one compact Android matrix, and one final
  manifest. Reuse accepted structure evidence when the contract is unchanged.
  Keep mandatory target, rollback, clean-Git, manifest, and final acceptance
  checks; remove only duplicate active checks, never historical evidence.
- Pilot stops for user review after both platforms, or sooner for wrong target,
  private-data/credential exposure, missing rollback, or unrelated behavior.
- Scope remains Personalization. Wave 6/Task 7, Wave 7/Task 8, and Wave 8/Task
  9 remain not started.

## Current clean-primary post-removal checkpoint (2026-08-13)

User authorized removal of empty clean-only
`PARA/RESOURCES/MEETINGS/Untitled.md` from Windows review copy
`W5-CLEAN-REVIEW-20260811`. Before move: 82 bytes, SHA-256
`8A61F73F657160EC88EB91A8D1BA433908D2ED5556D34C270FD075F2ED1F694C`;
identical rollback copy remains outside Git.

- Current comparison: clean=293, integrated=449; 260 identical, 3 clean-only,
  159 integrated-only, 30 common changed.
- Clean `MEETINGS` folder now shows 3 entries (`GENERAL`, `STANDUP`, `TEAM`)
  and no `Untitled` entry. Diagnostic UI only; not formal Wave 5 capture.
- Seven clean runtime/config files changed after Obsidian relaunch/UI
  navigation; exact before/after hashes are external in
  `CLEAN-PRIMARY-RUNTIME-VOLATILE-SIDE-EFFECT-20260813.csv`.
- Post-removal evidence manifest: 8 rows,
  `POST-REMOVAL-MANIFEST-20260813.csv`, SHA-256
  `D5BA1E7D889D9266BC6766AF0E82395748D215CA622E0A53A35AA13A7A69892E`.
- Integrated rollback/source, Android, live vault, bf23, and future waves/tasks
  remain untouched. Stop for clean-copy user review.

## Current clean-primary review correction (2026-08-13)

Use `W5-CLEAN-REVIEW-20260811` as the Windows user-review vault. It has later
accepted UX/onboarding work and is not stale. Keep
`W5-INTEGRATED-UPDATED-LIGHT-20260803` intact as rollback and accepted source,
not as the review surface.

- Narrow carryover is complete in clean only: ten Knowledge notes, five owner
  folders, and fourteen route/view/onboarding edits. `ZETA` and
  `PARA/RESOURCES/CONCEPT MAP` are absent in clean.
- Pre-removal clean/integrated comparison: 294/449 files, 261 identical, four
  clean-only, 159 integrated-only, and 29 common changed. Full-Dusk
  onboarding/media, synthetics, and omitted drawing shells remain omitted.
- Clean Homepage, Components > Knowledge (ten rows), and Dusk_light Quick
  Start render in Obsidian 1.13.6 with no raw template token. Android was not
  changed by this correction.
- The blank Meeting `Untitled.md` was later removed under user authorization;
  two empty trash files and `Skib.md` remain clean-only.
- Raw comparison, identity, screenshots, and validated manifest remain outside
  this repository in the Part 2 runtime evidence root. Stop for user review.
  Do not modify live vault, bf23, integrated rollback, Android, or future work.

## Current presentable Personalization checkpoint (2026-08-13)

The approved Personalization structure migration is ready for user review.
This entry supersedes the 2026-08-12 partial-migration pause; that historical
entry remains below.

- Windows disposable:
  `G:/Dusk-Knowledge-Hub/payload/evidence/Dusk-Phase2-Preparation-Part2-Runtime/disposables/W5-INTEGRATED-UPDATED-LIGHT-20260803`.
- Android disposable: serial `01234ABC`, package `md.obsidian`,
  `/storage/emulated/0/Documents/Dusk-Phase2-Preparation-Part2-Android-V1-20260801`.
- Both copies now use `PARA/RESOURCES/KNOWLEDGE` with 12 migrated files and
  `PERMANENT`, `LITERATURE`, and `FLEETING` folders. `INBOX` exists. `ZETA`
  and `PARA/RESOURCES/CONCEPT MAP` are gone after empty checks. Workstation,
  Archives, Sticky, Projects notes, templates, and note types remain.
- QuickAdd `Create Inbox Capture` was added and tested into `INBOX`; the
  synthetic test note is quarantined outside Git. Feature-bearing config is
  mirrored to Android. Remember Cursor Position and Novel Word Count are
  platform-local generated caches and can rewrite after each app launch.
- Windows passed rendered Homepage/task panel, Bases, migrated links,
  Templater, and Excalidraw. Android passed native Mobile Homepage, structure
  navigation, Daily Base, and migrated Chatbot Diagram Excalidraw after final
  restart. No source-code leak appeared in the accepted checks.
- Windows-only desktop utilities are `quick-explorer` and
  `statusbar-organizer`; Android-only IDs: none. This is expected platform
  behavior, not a failed sync.
- Evidence and rollback remain outside Git under the Part 2 runtime root,
  checkpoint `PERSONALIZATION-STRUCTURE-20260813`.
- Durable identities: Part 2 `main` `3d2c152f2c96ec9a6b2cd72a072f0d720b1d0131`
  / tree `d20ba688edbc36ac7c43277b732d4fd91f9edfea`, clean; product reset
  `docs/phase2-preparation-reset` `52748902d398734123a5057edbc607aeb5aff882`
  / tree `5826d0456abe5647cba2fdc84619390f966d46f0`, clean and pushed
  origin-equal.
- Final validators, 9router Graphify, product push, and clean Git checks
  passed. This checkpoint is ready for user review. Future Wave 6/Task 7,
  Wave 7/Task 8, and Wave 8/Task 9 remain not started.

## Current pause checkpoint: Windows Knowledge migration partial (2026-08-12)

User requested pause after reversible Windows structure migration. This entry
supersedes the preceding read-only inventory checkpoint as current state.

- Windows disposable
  `G:/Dusk-Knowledge-Hub/payload/evidence/Dusk-Phase2-Preparation-Part2-Runtime/disposables/W5-INTEGRATED-UPDATED-LIGHT-20260803`
  now has 12 moved content files under `PARA/RESOURCES/KNOWLEDGE` (9 ZETA
  notes and 3 Concept Map Excalidraw Markdown files), Knowledge subfolders,
  and empty `INBOX`. Empty old `ZETA` and `PARA/RESOURCES/CONCEPT MAP`
  owners were removed after exact checks. Workstation, Archives, Sticky, and
  all note content remain preserved.
- QuickAdd, Templater, Note Toolbar, Excalidraw, Canvas, View Mode, Iconic,
  Bookmarks, Homepage, Mobile Homepage, Bases, and Getting Started paths were
  updated. Obsidian-generated caches were not hand-edited.
- Rollback snapshot:
  `G:/Dusk-Knowledge-Hub/payload/evidence/Dusk-Phase2-Preparation-Part2-Runtime/checkpoints/PERSONALIZATION-STRUCTURE-20260812/windows-before/`
  contains 28 files and 746483 bytes.
- Known cleanup: restore original two-space indentation in nine moved-note
  `connections` lists. Legacy embedded Concept Map wording remains pending.
  No Windows UI, creation, Base, Excalidraw, Canvas, or mobile parity check
  has run after migration. PC Obsidian is closed.
- Android serial `01234ABC` and remote disposable
  `/storage/emulated/0/Documents/Dusk-Phase2-Preparation-Part2-Android-V1-20260801`
  are unchanged in this continuation.
- Resume: normalize links; run static checks; test exact Windows target; mirror
  and test Android only after Windows passes. Do not start future waves/tasks.
- Pre-seal Part 2 parent: `ee06b4291cb241640c0dbaece4000a7cef71ccb2` /
  tree `3daeae6f414f2575d4dc896820a47f22eb76f350`. Pre-seal product parent:
  `41140111581d0cd8a75ccff4510643c0f9657f61` / tree
  `961478bdd7423421382ded1104ba8b8f9774223e`. Final seal identities are in
  the external pause checkpoint.


## Current structure inventory checkpoint (2026-08-12)

Part 2 identity: efba247796ef977be57226a4c3ecc681f6683555 /
tree 2f8b0953778b5a5a1fe56777d001df31e844c680, clean.

Product identity: a1d5121b8f9210fa8645a9ff771792b02e445314 /
tree 87a2614d0999e26e0a3aa298c98f1b50ddb05132,
docs/phase2-preparation-reset, clean and pushed origin-equal.

Read-only inventory is complete on Windows disposable
W5-INTEGRATED-UPDATED-LIGHT-20260803 and Android serial 01234ABC. It found
9 ZETA notes, 3 Concept Map Excalidraw Markdown files, 6 Workstation notes,
no Knowledge/INBOX, empty PARA/ARCHIVES, and no destination basename
collisions. External manifest:
G:/Dusk-Knowledge-Hub/payload/evidence/Dusk-Phase2-Preparation-Part2-Runtime/checkpoints/PERSONALIZATION-STRUCTURE-20260812/STRUCTURE-MIGRATION-MANIFEST.csv.

Accepted mutation map: move classified ZETA notes into
PARA/RESOURCES/KNOWLEDGE/PERMANENT, LITERATURE, or FLEETING; move Concept
Map files to Knowledge root; preserve current note types and Excalidraw
content; keep PARA/WORKSTATION, PARA/ARCHIVES, and STICKY; create INBOX.
Apply Windows first, then mirror Android after regression. No vault/plugin/
config mutation has been made after inventory.

## Current Personalization structure decision (2026-08-12)

User accepted the external design review defaults with one correction. This
continues the current Personalization/debloat program; it does not start a
new wave or canonical Task 7/8/9.

Decision-entry identity: Part 2 `main` `e9efb8db67ce76db01fe28b6a2315141149beca9`
/ tree `eb77c4e8291cc12f99fc9c4e7239a04023ae3d85`, clean; product reset
`docs/phase2-preparation-reset` `61d4cb5f384088da41c156502fb612e7f936e79a`
/ tree `68cc1982534942c8ae2e3733fd201d89594b7109`, clean and origin-equal.

- Keep inactive Project/Area families under `PARA/ARCHIVES`.
- Keep `WORKSTATION` during dependency audit. Do not present it as a new
  generic capture destination while its behavior is being checked.
- Preserve `permanent_note`, `literature_note`, and `fleeting_note` values.
- Treat `RESOURCES/CONCEPT MAP` as a legacy candidate. `RESOURCES/KNOWLEDGE`
  is the default home for reusable learning and reference content.
- Inventory Concept Map before moving or deleting anything. Keep files with
  MOC, Canvas, Excalidraw, navigation, or other behavior in place until their
  owner and Windows/Android contract are proven. Move only per-file content
  classified as reusable Knowledge after collision, link, query, template,
  and creation-flow checks pass.

Target visible structure:

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

No blanket ZETA move, silent content rewrite, or irreversible Concept Map
deletion is authorized. The next action is read-only inventory on the exact
disposable Windows and registered Android targets, followed by a per-file
manifest and review stop if semantic ownership remains unclear.

## Current Wave 5 final repair checkpoint (2026-08-11)

Wave 5 integrated Dusk_light repair now passes on Windows and registered
Android disposables. The scoped Daily Overview embed-border repair is applied
to the integrated Windows source and Android target. A shared
`template_daily_overview.md` is used by 53 integrated Windows daily notes and
11 Android daily notes. The unreferenced duplicate `Datacore Calendar View.md`
was removed; canonical `Calendar View.md` remains. No note content was
deleted.

Windows passed settled Reading and Live Preview with no unwanted left line;
Meetings=1, Projects=9, Areas=4. Android passed native `1200x2000` Reading
with Meetings=2, Projects=5, Areas=3, settled Live Preview with Projects=5,
and relevant vertical/horizontal scrolling. Android interaction caveat:
tapping a nested Overview tab while Live Preview is focused opens the editor
keyboard and exposes the embed token; no text was entered, and Reading mode
restores clean rendering. This did not mutate the daily note.

Part 2 source for this compact update is
`e9efb8db67ce76db01fe28b6a2315141149beca9` / tree
`eb77c4e8291cc12f99fc9c4e7239a04023ae3d85`. Wave 5 is ready for final
validators and user self-review after this reset-branch publication. Wave
6/Task 7, Wave 7/Task 8, and Wave 8/Task 9 remain `NOT STARTED`. Full-Dusk
comparison and Discord component addition remain skipped. No PR or merge.

## Current E7 usable self-review checkpoint (2026-08-10)

E7 personalization, migration, task-panel repair, and safe debloat now reach a
usable disposable checkpoint on Windows and registered Android. Wave 6/Task 7,
Wave 7/Task 8, and Wave 8/Task 9 remain `NOT STARTED`. Full-Dusk comparison and
Discord component addition remain skipped by user direction.

Latest Part 2 authority is `d0128b923d172cf6946689027d63559f1fb43c9d` / tree
`2763dcb89a51f627d5582815f8b7d5e5211033ea`.

Six synchronized core Bases files cover safe table views. Dataview is absent
from both active disposables; Datacore keeps complex JSX, task/date/progress,
Calendar/Timeline, and custom UI behavior. Tasks, Templater, Meta Bind,
QuickAdd, Journals, project templates, and project-note creation remain intact.
Projects dashboard/plugin is removed; PARA/PROJECTS notes, project frontmatter,
templates, and Homepage project view remain.

Task panel now has explicit Today, All open, and Completed modes, visible state,
clear Add action, readable wrapped rows, and no title border clutter. Windows
passed fresh maximized `1920x1040` checks. Android passed native `1200x2000`
settled checks. Admonition is disabled on both platforms with rollback kept;
core callouts, Homepage, Bases, templates, and mobile layout still pass.

Windows has 39 enabled community IDs. Android has 37. Common IDs match;
Windows-only Quick Explorer and Status Bar Organizer remain PC features, with
native Android fallbacks. Checklist, Day Planner, and Daily Note Navbar remain
disabled with payloads retained. No live vault, protected source, product
`main`, or `bf23` changed.

Remaining overlap audit found no additional 100-percent bloat candidate.
Highlightr, Iconic, mapped file hotkeys, Custom Frames, Recent Files, Tag
Wrangler, Natural Language Dates, Paste Image Rename, and Trash Explorer retain
documented, configured, or distinct user-facing behavior.

Final evidence manifest validates 11 artifacts with zero missing, byte, hash,
or dimension errors. Manifest SHA is
`8B18BF95D19B608A2DF7A8439DBA7A2C4B509CA6507B37EC8BAD92090C48AC5F`.
Latest 9router/OpenAI Graphify record is
`6A77FF93AE87B5230FB6743DF280E8C3A561A685A8984D12A4FB09E0D88A0B1E`.

Status: `READY_FOR_USER_SELF_REVIEW`; product update is limited to
`docs/phase2-preparation-reset`, with no PR or merge.

## Current E7 final runtime and product publication checkpoint (2026-08-10)

E7 personalization/debloat runtime work passes on exact disposable Windows and
registered Android targets. This remains one E7 program. Wave 6/Task 7, Wave
7/Task 8, and Wave 8/Task 9 are `NOT STARTED`. Full-Dusk comparison and
Discord component addition remain skipped by user direction.

Part 2 runtime authority for this product update is `main`
`369444265ac4314d2e6d5900f60bb0527b4f7a05` / tree
`147fb8dd8b0e9c98cb6a3416f1a101ab9deda2c7`.

Six synchronized core `.base` files now cover all safe Homepage, area,
contact, and daily/weekly/monthly table views and their format templates.
Ordinary Dataview/DQL is gone from both active disposables. Datacore keeps
complex JSX, task/date/progress, Calendar/Timeline, and custom UI behavior;
Tasks, Templater, Meta Bind, QuickAdd, Journals, project templates, and note
creation remain intact. The Projects plugin is removed; PARA/PROJECTS notes,
frontmatter, templates, QuickAdd creation, Meta Bind, and Homepage project
surfaces remain.

Windows has 40 enabled community IDs. Android has 38. Common IDs match;
Windows-only Quick Explorer and Status Bar Organizer remain PC features, with
native Android fallbacks. Dataview and Home Tab are absent on both. Day
Planner, Checklist, and Daily Note Navbar are disabled with rollback payloads
retained. No live vault, protected source, product `main`, or `bf23` changed.

E7 task-panel repair now has explicit Today, All open, and Completed modes,
visible active state, named controls, empty-state actions, and wrapped rows.
Windows passed fresh maximized `1920x1040` Today/All open/Completed, Add,
scroll, and Reading/Live Preview checks. Android passed native `1200x2000`
settled Today/All open/Completed, wrapped rows, and vertical scroll. A real
first-repair Android overflow was fixed; horizontal swipes opened an existing
Dusk side pane and were not treated as task-row scrolling. Synthetic Add
content was restored exactly; no user note remains changed.

Fresh Android Journal Views Base parity and settled weekly/monthly/Homepage
evidence also pass. External evidence stays outside this repo under
`G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime\checkpoints\PERSONALIZATION-E7-DATACORE-DEBLOAT-20260810`:
Step 13 SHA `721877995100E88798D096486FB204F2AF8C47BC068729971E2F9BC1BD534C0C`,
manifest SHA `9FB171EA6BD1347DA3CAB888FF4C0AB01EB4250B5272F114A1994DE4BA43E3BD`,
task UX manifest SHA `E1D0412136CC77737BA06885E0A3856BBEAFE4D77C1B45751CC378E74CEB9DCA`,
task UX Graphify SHA `F6F6DB3738593F0D3F00BB714CCD68C1B5330643D50A2A2072F4E1CD3014D459`,
post-seal Graphify SHA `6996E7319DB70F775773393018B5C472EDD0AD047224FA637E8F4394DE56B5E9`,
and independent review SHA `519797B4A48381FB2B69137D31E3FF13C0F04B294967D78FCD8D369894CBE9F4`.

Status: `PUBLISHED_PENDING_USER_SELF_REVIEW`.

Compact product update is committed and pushed only to
`docs/phase2-preparation-reset`. Final local/origin identity verification is
the last check. No PR or merge.

## Superseded E7 full Bases migration and debloat checkpoint (2026-08-10)

This older snapshot is retained as historical product evidence. Current E7
status is above.

This compact product status supersedes the earlier E20 pilot wording. Runtime
work completed on the exact disposable Windows target and registered Android
target. It remains one personalization execution inside the current Dusk
program; Wave 6/Task 7, Wave 7/Task 8, and Wave 8/Task 9 are not started.

Part 2 final authority is
`a1c1dc91a223fef712a444ab2bd6b7cbf4d1ee28` / tree
`2227dbf1e5a9763190ffabc1e76851b5dcdc09df`.

Full Bases-safe migration is complete. Six core `.base` files now cover
Homepage/Mobile Homepage, area families and area views, contact directory and
contact meetings, and daily/weekly/monthly meeting/project views. Matching
format-template embeds are updated. Windows audit is zero ordinary Dataview,
21 protected DataviewJS blocks, four protected Datacore JSX surfaces, and 178
Tasks blocks. Tasks, date aggregation, progress bars, Calendar/Timeline
loaders, Mail Box/Map JSX, Templater, Meta Bind, QuickAdd, Journals, project
templates, and creation flow remain intact because Bases cannot replace them
without UX loss.

BRAT and Todoist were removed recoverably from both active disposable targets.
Todoist homepage/onboarding blocks were removed; native `Add Vault Task`
remains. Windows and Android enabled plugin IDs match at 43/43. Disabled
Checklist and Daily Navbar payloads remain recoverable. No live vault,
protected source, product `main`, or `bf23` worktree changed.

External evidence remains outside Git at
`G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime\checkpoints\PERSONALIZATION-E7-FULL-MIGRATION-PRETODOIST-20260810`.
Evidence manifest SHA is
`DCE0C4F425612064006867F658DE6FE35526B315801AFFB8D07DF1DA381C86FF`;
post-seal 9router/OpenAI Graphify record SHA is
`98547EF7975BE1963D3E479C3C22CAA7CA65B808C8DEBAD1C129C35C17A7851B`.
Graphify remains navigation-only; one fail-closed stale-source warning is
recorded. Windows evidence is native 1920x1040 JPEG; Android evidence is
native 1200x2000 PNG.

Status: `READY_FOR_USER_SELF_REVIEW`. No PR or merge.

## Current Wave 5 E20 parity and settled mobile coverage checkpoint (2026-08-10)

Wave 5 remains integrated Dusk_light regression, repair, pruning, and
Windows/Android rerun. E20 supersedes the earlier E19 self-review stop for
this compact checkpoint.

Part 2 authority after E20 ledger sealing is
`12382219c3a9bf01d7886f516cb3ea7d8d59844e` / tree
`855d827b480f5138f6a324c60750124a964f5d41`. Product work remains only on
`docs/phase2-preparation-reset`; product `main` remains unchanged.

Computer Use passed with the transport-refresh workaround on exact disposable
window `197270` at native `1920x1040`. Windows and registered Android have
equal 43-plugin ID sets. Projects, Commander, and Settings Search are absent
on both. Windows and Android now match byte-for-byte for Homepage, Mobile
Homepage, and contact/area/project templates. Fresh Windows Homepage Project
view rendered after synchronization.

Android serial `01234ABC`, package `md.obsidian`, native `1200x2000` passed all
Mobile Homepage outer/nested tabs and settled Daily Note Overview surfaces.
Daily Projects showed five rows. Daily Areas showed the three-row Area
Families Base with `Note`, `area_category`, and `created`. First `No file`
screen was transient loading and is not accepted as settled failure.

Confirmed current disposable boundary: Todoist, BRAT, core Daily, credentials,
network integrations, arbitrary JS/JSX/macros, destructive actions, and
Android physical keyboard remain gated. Checklist remains disabled with
payload retained. No further plugin removal is justified by E20.

Raw screenshots, records, and manifests remain outside this product repo. E20
Android record SHA is
`08FD6B7342501254BD7915A17C8552A191EDD3179AE32D15AF8BFFD99D74EAD0`;
manifest SHA is
`5DAA61EB1911426FB5E74319AC4C52D8A75C52CB971D558798E928A5DAC5F565`;
post-seal Graphify record SHA is
`9AD222574133A58D6F66E8DA8DBA06535011B0906C513C8039701CE5100EC526`.
Graphify used 9router/OpenAI and remains navigation-only; one fail-closed
stale-source warning remains.

Status: `READY_FOR_USER_SELF_REVIEW_WITH_EXPLICIT_GATES`. Future Wave 6 /
Task 7, Wave 7 / Task 8, and Wave 8 / Task 9 remain `NOT STARTED`. No PR or
merge.

## Current Wave 5 E19 repair and self-review checkpoint (2026-08-10)

Wave 5 remains the active integrated Dusk_light regression, repair, and
pruning lane. The final sealed Part 2 authority before this compact product
publication is `094f7d138bdbc135cc2cddd80ad4e2976402e681` / tree
`14daaf3818173bfa62fa8e19b109705cd19f175d`.

Windows Computer Use is working with the transport-refresh workaround. On the
exact disposable, Minimal Theme Settings Focus Mode was toggled on and off:
it hid native tabs while enabled and restored them through Command Palette
`Minimal Theme Settings: Toggle Focus Mode`. Final settings preserve
`focusMode=false`, Hider `hideTabs=false`, and Editing Toolbar `autohide=true`.
This is a reversible Focus Mode warning, not a Hider or Editing Toolbar repair.

A stronger real-wikilink Hover Editor probe remains unproven: the command did
not open a pane because local code requires an internal-link cursor token that
Computer Use cannot expose. Ordinary wikilink navigation and current-file
Hover Editor remain passed; no plugin code or configuration repair was made.
Windows and Android community-plugin IDs remain equal at 43/43. Android stays
the feature-preserving native baseline, serial `01234ABC`, native `1200x2000`.

Raw E19 evidence remains outside Git under the runtime evidence root. E19 UI
record SHA is
`709DDF8EB62AFEBA79FF2E77E35E0ECA4B6DB4030B04F952FF325F4FF8F57104`;
image manifest SHA is
`B05D4F6B357E1A04159C71C6628D37EE2AB235C31EFB7636822EBA7CBABD3CA0`;
sealed Graphify record SHA is
`8FAB24D4327CECE61581D12EF62ABC9ADC7073E3414C933474F371CF0DC130E7`.
Graphify used 9router/OpenAI and remains navigation-only; one fail-closed
stale-source warning remains.

Current stop is user self-review of the explicit gates: Hover cursor-token
proof, Android physical keyboard, destructive actions, arbitrary JS/JSX/macros,
credentials, network integrations, Todoist, BRAT, and disabled core Daily.
Wave 6 / Task 7, Wave 7 / Task 8, and Wave 8 / Task 9 remain `NOT STARTED`.
No live vault, product `main`, protected source, or `bf23` worktree was
touched.

## Superseding E12 Contact Directory Base pilot checkpoint (2026-08-09)

E12 created one compact core Bases pilot for the Contacts table on both exact
Dusk_light disposables. Final file SHA-256 is
`607121B88A583F6818AF24181CD9A85E43A884594D3E1263E7183115FA91862C`.
Android native 1200x2000 evidence passes with four contact rows and
Note/Company/Title headers after repairing the property keys to
`note.company` and `note.title`. Windows static file and plugin-parity checks
pass. The latest approved Windows Computer Use recheck returned metadata
naming Obsidian but a screenshot showing Codex/ChatGPT and repository panels.
Capture was excluded as a wrong-target safety stop; no Windows Base visual is
accepted and no UI input or runtime mutation followed.

Original Contacts Dataview, Homepage/Mobile Homepage, DataviewJS, Datacore,
Tasks, templates, project creation, and plugin owners remain unchanged. Keep
the Base as a parallel pilot until user review. Checklist stays disabled with
payload retained. No next overlap plugin met the proven-unused rule, so E12
made no new plugin removal or disable.

Part 2 source: `494067807a0b410b21bf0b296edca7c567c7625e` /
`9c4ca7af2238860a47938dec4595fdaa874eb4aa`. Raw evidence and final 9router
Graphify identity remain external under
`G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime`.

Current gate: `E12_CONTACT_DIRECTORY_BASE_REVIEW_REQUIRED`. Do not promote
Bases, remove Dataview, remove another plugin, or start Wave 6/Task 7, Wave
7/Task 8, or Wave 8/Task 9 from this checkpoint.

## Superseding E13 next-candidate triage checkpoint (2026-08-09)

User accepted keeping Checklist disabled in both exact Dusk_light disposable
targets. Read-only overlap triage found no unambiguously unused next plugin.
Home tab has active new-tab/search state; Quick Explorer remains a useful
desktop PC navigation feature; Novel Word Count has 262 cached counts; List
Callouts has seven configured symbols and 49 current Markdown syntax entries on
both platforms; Admonition has one custom definition; Recent Files has 50
entries; Status Bar Organizer owns requested bottom-bar cleanup; and Editing
Toolbar `autohide=true` is protected. No next candidate was disabled or
uninstalled.

Compact cumulative list: `obsidian-projects`, `cmdr`, and `settings-search` are
already removed from both active disposable trees. `obsidian-checklist-plugin`,
`obsidian42-brat`, `daily-note-navbar`, and `todoist-sync-plugin` are disabled
with payload retained for rollback. Do not batch-remove active Checklist or
List Callouts without later user review. Dataview, Datacore, Tasks, templates,
project creation, and future canonical waves remain protected/not started.

Part 2 source is `f354266dec27137b126df5772479e4df50634307` / tree
`20569d8b81532371672ef22b46969f6bdbde3aca`. Product/reset source before this
publication is `ec110e66adb1b0e112cf5898bdc5c8f2414ccbb3` / tree
`460f5e591510e05307929eb4e65690238c33fdef`. Raw evidence remains external at
`G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime`.

Current gate: `E13_NEXT_CANDIDATE_TRIAGE_COMPLETE_NO_UNUSED_CANDIDATE`.

## Superseding E13 Checklist disable-test checkpoint (2026-08-09)

E12 Base parity was accepted by the user. E13 is the next bounded step in the
same personalization/debloat program; it is not a new wave or canonical Task
7/8/9 work.

Checklist was disabled, not uninstalled, in both exact Dusk_light disposable
targets for an owner-overlap test. The enabled community-plugin sets now have
43 IDs and are exactly equal between Windows and Android. Checklist data,
manifest, and vault content are unchanged. Tasks remains enabled. Dataview,
DataviewJS, Datacore, Templater, Meta Bind, QuickAdd, project templates, and
project creation were not changed.

Android native validation passed after restart: Mobile Homepage remained
usable, Daily Note recovered to its settled task and Dataview Meetings surface,
and no note content changed. Windows exact-profile restart settled, but fresh
visual acceptance was blocked before input by the Computer Use helper error
`node_repl exec context not found`; no input followed. This is static evidence,
not a Windows visual pass.

Current gate: `E13_CHECKLIST_DISABLE_TEST_REVIEW_REQUIRED`. Keep Checklist
disabled or restore it after user review. Do not uninstall it, test the next
candidate, remove Tasks or Dataview, promote Bases, or start Wave 6/Task 7,
Wave 7/Task 8, or Wave 8/Task 9 until that decision.

Part 2 source is `fe9cd524a3ff23b1bbe1bcad21005ee878f715cc` / tree
`2853c62d711224e105eaeadea073e2b56cfe7856`. Product/reset source before this
publication is `4e36dba5c4257b9db909dd206d8b6daf5393e97f` / tree
`ef0b1903af1a2e420bf556bdb1f80034d273cc09`. Raw evidence remains external at
`G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime`.
No live vault, product main, protected source, or `bf23` worktree was touched.

## Superseding E12 Base parity checkpoint (2026-08-09)

E11 review was accepted. E12 is the next bounded step inside the one
personalization/debloat program; it is not a new wave or canonical Task 7/8/9
work.

Contact Base is now embedded in the actual disposable
PARA/RESOURCES/CONTACTS/Elon Musk.md note on Windows and Android. It retains
the old query filter, every old attribute (file identity, scheduled date,
start time, summary, and meeting status), and the old status/date sort.
Meeting status stays available as a sort property but is hidden from visible
order, matching the old Dataview columns. The original Dataview block remains
unchanged.

New Area Scheduled Meetings Base is embedded in the actual
PARA/AREAS/Space Tourism Initiatives/2. Space Tourism Initiatives.md note and
also passed standalone opening on both disposables. It uses the matching area
filter and meeting attributes; one expected meeting row rendered. Original
Dataview remains unchanged. These are parallel pilots, not promoted migrations.

Windows exact disposable/profile was reverified at PID 19120. Existing accepted
Windows Base visual remains valid; fresh Computer Use stopped before input with
node_repl exec context not found. Android serial 01234ABC, package md.obsidian,
PID 26020, and registered disposable vault were reverified. Native 1200x2000
evidence covers settled startup, standalone Area Base, actual Area note, and
actual Contact note.

One Android coordinate-test truncation was detected by SHA comparison and
restored from staged disposable content. Bad snapshot remains outside Git and
is excluded from acceptance. No live vault, protected source, product main, or
bf23 worktree was touched.

Part 2 source is aa041d53b7ffd8ba170559f0e9d1c683cd3e1d7f /
f5463bc52ef33e315353521f568d774cb13eb805. Product/reset source before this
publication is 114f787712b4d661f60fff68a5f2a055e6a38e14 /
1d0fdb611de6f0f755c4d6469265c6aec0b7e8b9. Raw evidence remains external at
G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime.

Current status: E12_PASS_REVIEW_REQUIRED. Review actual-note Contact and Area
Base embeds before any promotion, Dataview/Datacore removal, Homepage Project
replacement, project-creation change, or E13 runtime work.

## Superseding E11 supported Contact Base access repair (2026-08-09)

The earlier E11 status accepted Android Files navigation while leaving a
direct external URI shortcut gap. User rejected that. Supported onboarding is
now repaired on both exact disposable targets: `SYSTEM/GETTING STARTED/Getting
Started.md` contains one internal link to
`Dusk_light Bases Pilot - Contact Meetings.base`, labelled `Elon Musk Meetings
Base pilot`.

Android native 1200x2000 evidence shows the link in Getting Started and the
link-opened Base with `Elon Musk Meetings`, 2 results, and both expected rows.
Windows guide content and the existing accepted Windows Base visual remain
valid; a fresh guide capture hit a Computer Use helper error and no input
followed. The Base remains a parallel pilot. Dataview, source notes, templates,
plugins, and core configuration remain unchanged. No runtime file is copied
into this product repository.

Part 2 source for this compact update is `16b61cba8ec162eee8cf1a2d22f221e240892dec`
/ tree `208743f22f50aca7037913dcca1cbaabae8772fe`, clean before this product
edit. Product/reset is `0f09420b6e1bdc04db387c18a1e925ea57c6f93a` /
tree `e5f3be69b4206b23fdce1a3405ec3c8c2230fa5d`, clean and equal to origin
before this publication. Product `main`, live vaults, protected sources, and
raw evidence remain untouched. Stop after push for user review; do not promote
the Base or start another candidate.

## Current Personalization execution checkpoint (2026-08-09)

This supersedes the older product-facing Wave 5 checkpoint below. Historical
entries remain unchanged. The current lane is Personalization continuation;
full-Dusk comparison and Discord component addition are skipped for now. This
does not create a new wave or canonical Task 7/8/9 hierarchy.

E11 contact-meetings Base pilot is verified only in the exact Windows and
Android disposables. Both rendered the expected two meeting rows; Android's
verified route is Files navigation, while its direct external-link shortcut
remains a gap. Dataview remains the source-note owner. The Base is not promoted
to the product vault, and the next candidate is gated on user review. Later
implementation gates may request fresh NotebookLM, official, web, and local
research because the current research pool is not exhaustive.

The verified disposable changes are: the exact area-family Dataview table was
migrated to one core Bases view on platform-present files only, and Commander
was removed after Windows/Android fallback proof. Area Families Base SHA-256
is `18378FE60114DDB359C9EDF233CDF6585A89943274F4A53C90986149B38FA1D3`;
the retained Area Components pilot SHA-256 is
`12F85D01BB5B8CF710791378A55A8519831354E7BC3247E8A8FF5F5C2FBBA439`.
Dataview/DataviewJS, Datacore, Tasks, Templater, Meta Bind, JS Engine,
QuickAdd, Note Toolbar, Journals, Pomodoro, Day Planner, project templates,
and project creation remain protected owners.

Commander removal leaves 44 enabled community IDs on each target with zero
sorted-set difference. Windows community SHA-256 is
`CCDE647ACA2DEB504A3100C2BFB1830453E334C833927656D0F034A6306BAE6A`;
Android is `331AB2C10D579ED7B54596DDFBA9330C86E4FB12C925FE53221E3E73DEBC6AA0`.
Status Bar Organizer Commander references are zero. Home tab, Checklist,
Quick Explorer, Novel Word Count, and List Callouts remain review-gated; no
uninstall is implied by zero-reference counts.

Part 2 source checkpoint before this publication is
`fe96824c1dceff405c43ed8deb857439964aae04` / tree
`45ab684b43e5c1dd07910eab81cab40d7ae41620`. Product/reset remains at
`379c050c5f8f9e97153aa0a4e1edb2e58082ecaf` / tree
`727e08ac873d35857f170933502c7b8a64d14e95`, equal to origin/reset before this
publication. Product
`main` remains unchanged. Raw evidence and
rollback stay outside Git under the Part 2 runtime evidence root. Next action
is user review of the E11 parallel Base; E12 runtime work and all uncertain
ownership changes remain gated. This compact publication adds no runtime
vault content.

## Superseding Wave 5 Projects removal checkpoint (2026-08-06)

Current Wave 5 remains open for one external Windows UI gate. Earlier product
text saying Wave 5 was complete or Projects was retained is superseded current
status; historical sections remain unchanged as history. Part 2 authority is
`a6d3290215b38da086d3690f3555142543c6d51c` with tree
`c6f965b9d8fcc96e307b1aab48ad128b891709e7`, clean before this publication.

User-authorized repair removed archived `obsidian-projects` from both exact
Dusk_light disposables, including its dashboard/config tree, community ID,
hotkey/workspace ribbon state, stale QuickAdd command steps, and Note Toolbar
View Projects item. Rollback trees remain outside this product repository.
PARA/PROJECTS Markdown, project frontmatter, both project templates, Templater,
Meta Bind, Dataview/DVJS, Homepage Development > Project, and QuickAdd Create
Project Family remain. Dataview replaces the removed Homepage Projects
dashboard; Projects commands/dashboard are no longer part of Dusk_light.

Both active platforms retain equal sorted 45-plugin ID sets. Android fresh
native UI passed settled Homepage, Development > Project DataviewJS, relevant
scrolling, no-Projects menu, QuickAdd Project Family, populated template
output, and cleanup. Windows static checks pass, but two fresh exact-target
Computer Use tasks hit `node_repl exec context not found`; no Windows UI
capture or acceptance claim exists. Wave 5 is not complete until that gate is
resolved or accepted as an external blocker. Evidence remains outside Git at
`G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime\checkpoints\W5-PROJECTS-REMOVAL-20260806`.

Wave 6 / canonical Task 7, Wave 7 / Task 8, and Wave 8 / Task 9 remain
`NOT STARTED`.

## Current Wave 5 Dusk_light parity and onboarding checkpoint (2026-08-05)

The earlier Wave 5 `PASS_WITH_GAPS` was superseded interim evidence. Current
Wave 5 work repaired and reran integrated Dusk_light behavior on the exact
disposable Windows target and registered Android target. Wave 6 / canonical
Task 7, Wave 7 / Task 8, and Wave 8 / Task 9 remain `NOT STARTED`.

Part 2 final live identity is `main` at
`1b406ca7479513c348e22c092f1757a4bd0754d0`, tree
`4bbd41d4011df6a14a6b6eb00d74766d2f8edcc9`, clean before this product
update. Product/reset current base is `170fcf7bfd83a26c60e15cc4c6f905a3aca47a18`,
tree `b70e101756938e5b1dbdfa9460b26b3b5d396904`, on
`docs/phase2-preparation-reset`; `origin/main` remains
`571fde461571d842c3912964f86adfa9b0314092`.

Settings Search was removed from both disposable active trees with dated
rollback/quarantine. Day Planner `0.35.1`, Remember Cursor Position `1.0.13`,
and Quick Switcher++ `6.1.6` were added on both. Projects and disputed
personal utilities remain retained; Advanced Tables was skipped. Both active
community configs have 46 IDs and SHA-256
`591DAC8656E72F5345AD9394AB4D943CF9671EB3DA870B66C00CFC4049D2EC79`.
Status Bar Organizer remains the Windows cleanup path: its Default profile can
hide or reorder bottom status-bar items, including Grandfather's clock, without
uninstalling Grandfather. It is desktop-only; Android omission is expected.

Windows passed settled Homepage one-Calendar/one-Todo/FAB, Day Planner
multi-day, Quick Switcher++ search, and Dusk_light guide checks. The exact
profile reloaded the repaired Day Planner bytes and returned a settled
Homepage title; one fresh post-patch Computer Use screenshot was blocked by
the helper error `node_repl exec context not found`, with no UI action after
it. Android passed config/file/manifest parity, the repaired Day Planner
long-press menu and Edit modal, cursor metadata, Settings Search absence, and
final settled Homepage after synthetic-note cleanup. Full-Dusk source and
older full-Dusk Getting Started media remain reference-only. Stop after reset
branch push for user self-review.

## Historical superseded Wave 6 / Task 7 static delta

This section is retained as historical evidence only. Current authority leaves
Wave 6 / canonical Task 7, Wave 7 / Task 8, and Wave 8 / Task 9 `NOT STARTED`.
An earlier handoff recorded Wave 6 / canonical Task 7 as authorized and its
historical full-versus-light static comparison as:
71 rows total, comprising 58 full-content-only paths, 11 full-plugin-only IDs,
one workspace variant, and one Dusk_light-only row. Full-content additions are
grouped DAILY=5, PARA=44, and ZETA=9. Full-only plugin additions are
`advanced-canvas`, `darlal-switcher-plus`, `digitalgarden`, `meld-encrypt`,
`obsidian-chartsview-plugin`, `obsidian-day-planner`, `obsidian-image-toolkit`,
`password-protection`, `remember-cursor-position`, `share-note`, and
`table-editor-obsidian`.

The exact full-Dusk source is not admitted, so no full-only plugin or content
was imported, enabled, or runtime-tested. Dusk_light contains Daily Note
Navbar v0.2.0 but leaves it disabled while Journals owns periodic navigation.
Note Toolbar v1.34.12 is enabled with local desktop/mobile/tablet FAB
mappings. Public plugin documentation declares mobile support; physical target
acceptance remains a runtime gate. Wave 7 / Task 8 and Wave 8 / Task 9 remain
`NOT STARTED`.

Part 2 current checkpoint: `6ece63890bed34d2f2c553dad703500b38b03e2e`,
tree `81eb797249bbed260cc1587131c0aa0ecc21e9bb`, clean before this product
publication. The fixed Windows disposable archive remains external and
recoverable under the Part 2 runtime evidence root.

Updated: 2026-08-04

## Superseding Wave 6 / Task 7 Note Toolbar repair

Task 7 remains static-only for full-Dusk comparison. Exact full-Dusk source
and archive remain gated; no full-vault visual/import/activation occurred.

Systematic debugging isolated the missing Dusk_light FAB to legacy nested
Note Toolbar item visibility: Dusk_light stored
`visibility.<platform>.allViews.components`, while Note Toolbar v1.34.12 reads
direct `visibility.<platform>.components`. A temporary current-schema toolbar
rendered, proving the renderer/CSS and disposable target were functional. The
disposable repair flattened all 100 items, retained 21 ordered mappings and a
final `*` fallback, removed the temporary toolbar, disabled debug logging, and
pushed identical config to Windows and Android.

Settled Windows Homepage, Map of Content, and PARA/PROJECTS note showed the
context-sensitive FAB in native 1920x1040 JPEG evidence. Settled Android
Homepage showed it in native 1200x2000 PNG evidence. External sanitized repair
and hash references are stored under the Part 2 runtime evidence root at
`checkpoints/W6-FAB-FALLBACK-20260804`; raw screenshots and runtime JSON stay
outside Git. Final config SHA-256 is
`E6AAE6DE732156534F7694B974ADAD7F95ED237E36D488CC1FAAB0CA3D4505ED`.

The 11 historical full-only plugins remain review-only. Day Planner and
Remember Cursor Position are future candidates; Advanced Tables is optional
because Obsidian Bases is core. Bases and future Dataview/Datacore migration
belong to later personalization/customization/optimization. Journals remains
periodic owner and Daily Note Navbar stays disabled. Wave 7 / Task 8 and Wave
8 / Task 9 remain `NOT STARTED`.

Part 2 pre-publication checkpoint: `189c1930e77a46896b71545755e09a3646199120`
/ tree `65c212db7da2d1d5ec222ab97561ae47ce68e3f3`.

## Completed Wave 5 Projects platform-sync correction

Android Projects was disabled only because its dependency path had not been
tested there. The plugin directory and manifest were present, and the only
enabled-ID difference was `obsidian-projects`: Windows had 44 IDs; Android had
43. After a disposable-only enable-list push and restart, both current
disposable configs match at 44 IDs / 991 bytes / SHA-256
`7F11C3A7F043724BFA95E9AB1353DA1499A9D235163D8D96C873FF03B7C03905`.
Android settled on native Homepage at PID `19366`. No plugin was reinstalled or
removed; no source, live, product-main, or `bf23` state changed.

Evidence is external under the runtime checkpoint. Result SHA-256 is
`EEE61F14B42893113084BD0B7510B367A6CD03373ADFBB459E56D9A2A8263BFA`; the
18-row evidence hash manifest is SHA-256
`A4C9F7E099629784A65BAD13F5C9BAB5D7A89BCB47FB9AF494B20B62A4F0ED26`.
Part 2 mutation checkpoint is `6007f669cf051a5ed2d1d87a989da19434c8931d`
with tree `a0742fbc10086f3f70ab87a60e134df544fca185`. Correct Graphify
evidence uses the 9router OpenAI-compatible route; no Gemini fallback.

## Current Wave 5 pruning correction

Wave 5 is `COMPLETE_WITH_EXPLICIT_GATES` after the user-reopened pruning
correction. The earlier R8/R9 claim that six plugins were disposable bloat is
superseded: that audit proved only zero mapped Dusk/consumer references, not
zero personal utility or zero configured behavior.

Exact rollback trees for Garble Text, Grandfather, Pomodoro Timer, URL Into
Selection, Force note view mode, and Settings Search were restored and enabled
on both registered disposables. Windows finished at 44 enabled entries and
SHA-256 `72C7E31F007BFA8F1783C9A41601F37B13991571D6AA84D54BA80BA87BBE72B0`;
Android finished at 43 enabled entries and SHA-256
`8BFA2E3EB94B10E786A78847BA1939BC01516C09A001C51F71A36EBD537BFD01`.
Final Android direct readback is 968 bytes, SHA-256
`80FBA64CD66A3A2327E229CB20352F0DC164A25F8C0F38F0DDC243DCE84F68D9`, with
the same 43 IDs after one terminal-LF normalization.
Pomodoro run/reset and Settings Search filtering passed on both targets. No
disputed plugin was uninstalled; no live/source/product/bf23 state changed.

Compact runtime proof remains external under
`G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime\checkpoints\W5-PRUNING-CORRECTION-20260804`.
The restored-plugin manifest is 34 rows, SHA-256
`F663F451923155EB25805B783B0331FD4534FF086EEAC76CBA0112800C0CF8C3`; the
evidence hash manifest is SHA-256
`6588D33B9BC2D3AA98AE4A85E5EF03ECCB8510775DAA5D0F4BFF3C6C6926BA6B`.
Wave 7/Task 8 and Wave 8/Task 9 remain `NOT STARTED`.

Updated: 2026-08-04

## Objective

Continue bounded Dusk Phase 2 Preparation from the accepted post-structure-
refactor checkpoint while preserving the completed Phase 1 FNS foundation and
keeping Phase 2 Execution, personalization, and live promotion gated.

Status: Phase 1 foundation remains complete. Wave 4 is closed and
structure-refactor Tasks 1-6 are accepted. Wave 5 was reopened for repair and
is now `COMPLETE_WITH_EXPLICIT_GATES`: duplicate Calendar/Todo List leaves,
stale timer-view and journal-calendar ghost surfaces, stale disabled statusbar
items, four stale Note Toolbar Daily mappings, and the Journals/Templater
Reading-mode cursor-marker integration defect were repaired and rerun.
The earlier `PASS_WITH_GAPS` is superseded interim evidence. Wave 6/Task 7
static delta is recorded with full-only runtime gated. Wave 7/Task 8 and Wave
8/Task 9 are `NOT STARTED`. Phase 2 Execution,
personalization, live promotion, PR, and merge remain gated.

Getting Started scope is corrected: guide Markdown navigation and scrolling
remain Wave 5 checks, but the 82 image references and 81 unique basenames are
full-Dusk reference media confirmed by the user, not Dusk_light behavior
requirements. No full-vault media or feature was imported during Wave 5.

Part 2 Wave 5 result checkpoint: control repository `main` at
`8e4b47e1995a71e201d6300c0a12e2583df64ea0`, tree
`51d85566ee41c406954296675197a883088d3e80`, clean. The prior six-plugin
disposable removal is superseded; exact rollback trees were restored and
retained outside this repository. Windows and Android affected reruns
passed. Real September monthly Tabs passed settled Windows Reading and Live
Preview. Synthetic three/four-fence Live Preview literal-source behavior
remains an explicit owner/contract gap; no Dusk source mutation was justified.
The disposable Journals finalizer is SHA-256
`AD1CF7D5CD28C8C3C0F146A73417725528EF10D3FAB25520B7FE94C51ACCCFE8` on both
platforms. Final cursor evidence is external `RESULT.txt`, SHA-256
`37DC97A12B861B73CF849C679123296D881870D69ACF464C8AF8BDEEA35EF5BD`.
Publication is limited to `docs/phase2-preparation-reset`; product `main` and
detached `bf23` remain unchanged.

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
- [DEC-041](decisions/decision-log.md#dec-041-continue-bounded-dusk-preparation-wave-5)
  records the bounded Wave 5 continuation, reset-branch publication, and
  current Luna-max orchestration contract.
- [DEC-042](decisions/decision-log.md#dec-042-close-wave-5-with-explicit-gaps)
  records the earlier interim `PASS_WITH_GAPS`; it remains historical.
- [DEC-043](decisions/decision-log.md#dec-043-close-wave-5-after-reopened-repair)
  records the superseding repaired Wave 5 result and current gates at the
  earlier R7 checkpoint.
- [DEC-044](decisions/decision-log.md#dec-044-wave-5-r8-repair-and-pruning)
  records the current R8 repair, pruning, and Windows/Android reruns.
- [DEC-045](decisions/decision-log.md#dec-045-close-wave-5-after-media-scope-correction)
  records the final cursor repair, Getting Started media scope correction,
  evidence cleanup, and explicit Wave 5 gates.
- [DEC-046](decisions/decision-log.md#dec-046-correct-wave-5-pruning-disposition)
  records the superseding six-plugin restoration and affected utility reruns.
- [Phase 2 Preparation reset](architecture/phase-2-preparation-reset.md)
  defines source, validation, archive, safety, and review boundaries.
- [Implementation plan](superpowers/plans/2026-07-27-phase-2-preparation-reset.md)
  defines exact recovery order.

## Next action

Finish compact product publication and review the Part 2/product checkpoints.
Do not start Wave 6 / canonical Task 7, Wave 7 / Task 8, or Wave 8 / Task 9;
keep full-only import, remnant implementation, personalization, live-vault
promotion, pull request, and merge gated.

Wave 5 evidence: integrated disposable/profile
`W5-INTEGRATED-UPDATED-LIGHT-20260803` is closed on Windows; Android serial
`01234ABC` was reverified on the registered disposable target. The R8 repair
manifest has 29 rows and SHA-256
`BBCE4DDD8E5B4FBA79DE94E01485DA4AAABA846E018E141599354FC98E999C6B`.
Rollback, bloat audit, and sanitized repair references remain outside this
repository under
`G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime`.

## Safety

- Do not revive PR #4 or PR #7.
- Do not treat historical screenshots or plugin state as current acceptance.
- Do not modify source vaults, `G:\Obsidian`, FNS, personal data, credentials,
  or device state during recovery.
- Native validation remains disposable-only. Keep Dusk source, `G:\Obsidian`,
  FNS, personal notes, credentials, and protected Museum inputs outside test
  scope.

## Current Dusk repair references

- Journals remains the sole periodic-note owner; core Daily Notes and
  credential-bearing Todoist remain disabled in the disposable.
- Templater daily creation was repaired in the disposable; accepted note SHA is
  `A92F843EE5E35F0D713D574989094BB8FCD93D35FC4C7C1DA88261472BE8796B`.
- Datacore `0.1.29` was retained after BRAT was disabled; Android reattached
  daily evidence SHA is
  `E24A3B4E6CAC1D2BF654D597BDCD9AE89D5E08EDCBB0741009541C2833B43C54`.
  Full ledgers and raw evidence remain outside this product repository.
- Windows Projects was retained and re-enabled after R6 pruning exposed its
  required QuickAdd/Note Toolbar command consumer. The six disputed utility
  directories were restored and retained after Windows/Android reruns;
  rollback trees remain external. Todoist, BRAT, and credential-bearing
  integrations remain disabled.
- The full-Dusk Getting Started media scope record is external:
  `GETTING-STARTED-MEDIA-SCOPE-20260804.txt`, SHA-256
  `088638E92D0B6E8FE31240FEB24050829385FE9C35B5AAEE0CA92CD210778BCC`.

## Current orchestration

Main session owns decisions, edits, Git, verification, debugging, evidence
disposition, and may perform Computer Use directly. No `spawn_agent` or Codex
subagents. If another agent is needed, create a separate full user-visible
`gpt-5.6-luna` task with `max` reasoning after a durable checkpoint; target
ownership is exclusive and returned claims require independent verification.
Any full task created under the saved project must use
`C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline-phase2-reset`
as workdir for every product Git command, must not edit the saved project's
`main` checkout, and must not request a second checkout of this reset branch.

## Authority

- [Documentation map](README.md)
- [System design](system-design.md)
- [Recommended architecture](architecture/recommended-architecture.md)
- [Evidence-gated roadmap](roadmap/phased-roadmap.md)
- [Decision log](decisions/decision-log.md)
- [Phase 1 implementation evidence](research/2026-07-23-fns-implementation-evidence.md)
- [Phase 2 reversal](archive/2026-07-24-phase-2-reversal.md)

## Superseding Wave 5 selector repair checkpoint (2026-08-15)

Current Wave 5 remains integrated Dusk_light regression, repair, pruning, and
affected Windows/Android reruns. This compact checkpoint supersedes only the
older selector gap; it does not start a future wave.

Homepage `Add task to` chooser previously showed only the current note,
`Inbox.md`, and notes already containing tasks. Disposable repair now scans
existing `DAILY/DAILY/YYYY-MM-DD.md` files, keeps current note first, retains
Inbox/task-bearing notes, removes duplicates, and sorts choices by date path.
No task query, task storage, template, or note content changed.

Verified exact disposable results:

- Windows `W5-CLEAN-REVIEW-20260811`, Obsidian `1.13.6`, maximized Computer
  Use observation: 14 existing daily-note choices; chooser closed without
  creating or changing a note.
- Registered Android serial `01234ABC`, package `md.obsidian`, Android 14:
  13 existing daily-note choices in native `1200x2000` evidence. Different
  counts reflect pre-existing disposable note-content drift; no note sync.
- Three repaired source files are byte-matched to Android remote copies.

Part 2 authority checkpoint: `3b9d13a1b5c5309fb3ace9cc6b79465d29fa2a58` /
tree `0f1072a63a70ea53dee38e8e057bfae5c6743082`, clean before this product
publication. Evidence is external under
`G:/Dusk-Knowledge-Hub/payload/evidence/Dusk-Phase2-Preparation-Part2-Runtime/checkpoints/W5-SELECTOR-REPAIR-20260815/`.
Result SHA-256:
`A289AC94BD05DC6C25F72AF3371923152FE3C16E86048120F07951AA4B159EF9`.
Manifest SHA-256:
`8DA345099D96B9FCEF546CC75D58033583FCD6475D0673CC696265DCC8E97EF6`.

Plugin state was not changed. Fresh disposable readback found 41 enabled IDs
on Windows and 39 on Android; Android lacks desktop-only Quick Explorer and
Status Bar Organizer. The accidental six-file unregistered Android sibling was
removed; registered Android remained intact. Graphify used the required local
9router/OpenAI-compatible route once; its fail-closed stale-node warning is
non-authoritative and not a runtime failure.

Remaining Wave 5 gaps stay explicit in Part 2 ledgers: disposable note-content
drift between platforms, desktop-only plugin membership difference, and any
historical UI gaps marked `PASS_WITH_GAP` or `UNTESTED`. Wave 6 / Task 7,
Wave 7 / Task 8, and Wave 8 / Task 9 remain `NOT STARTED`. No raw evidence,
profiles, ledgers, archives, credentials, or bulky runtime files enter product
Git.

## Final Wave 5 result and self-review stop (2026-08-15)

Wave 5 is `COMPLETE_WITH_EXPLICIT_GATES`. The current Homepage chooser repair
is included in final acceptance: existing daily notes now appear on both exact
disposable platform copies, Windows exposed 14 choices, Android exposed 13,
and no note/task/template content changed. Source files are byte-matched
between Windows and registered Android.

Final Part 2 authority: `c9eec6d02d418af4de522ce4505d2b306d533466`, tree
`9e7d562b39fcad60f0560805a0b5f6a31438db56`, clean. External selector result
and manifest remain at
`G:/Dusk-Knowledge-Hub/payload/evidence/Dusk-Phase2-Preparation-Part2-Runtime/checkpoints/W5-SELECTOR-REPAIR-20260815/`.

Final gates remain visible: new Windows selector observation is diagnostic
`1920x1033` rather than a new formal `1920x1040` JPEG; disposable daily-note
content differs across platforms; Android omits desktop-only Quick Explorer
and Status Bar Organizer; older accepted `PASS_WITH_GAP`/`UNTESTED` behavior
remains unchanged where physical keyboard, synthetic multi-tabs Live Preview,
or Hover Editor cursor-target proof was unavailable. These do not hide a
selector failure. Graphify used local 9router/OpenAI-compatible routing once;
its stale excluded-source warning remains non-authoritative.

The reset branch is the only product branch updated. Wave 6 / Task 7, Wave 7 /
Task 8, and Wave 8 / Task 9 remain `NOT STARTED`. No raw evidence, profiles,
full ledgers, archives, credentials, product `main`, `bf23`, PR, or merge was
added or changed. Stop here for user self-review.

## Superseding Wave 5 task-picker scroll repair (2026-08-15)

Wave 5 final repair is `PASS_WINDOWS_ANDROID_FINAL` with explicit repository
baseline gates. This is still Wave 5 integrated regression/repair work; no
future wave started.

- Windows disposable `W5-CLEAN-REVIEW-20260811`, Obsidian `1.13.6`, PID `9996`,
  Computer Use window `66322`: picker floats outside task surface and scrolls
  independently; long Completed task list stays inside fixed-height surface.
- Android serial `01234ABC`, Android 14, package `md.obsidian`, PID `838`,
  registered vault unchanged: native picker finger-scroll, selection close,
  Completed mode, and restored Today/`2026-08-14` passed.
- Final Windows/Android source parity: Homepage
  `FB7A025A07877C3CB3E0304AD01C7711806459E342FA51F93471BCD8860F2A2C`;
  Mobile Homepage `BAD6DE6A263E87396EADED574C2F64A1B5159264DA91BAEC6CDE94223BDFEC5A`;
  shared Timeline `88066F242E857417E18E1DB29F1388D5512EE3210179DB72C8E9A1E254B95BC4`;
  Base `E6FC388DEAB7C1EFDC2D92FBA91072E42B17D3736B520B7CF5C503FCFFD6F5D1`.
- Evidence stays outside product Git:
  `G:/Dusk-Knowledge-Hub/payload/evidence/Dusk-Phase2-Preparation-Part2-Runtime/checkpoints/W5-TASK-PICKER-FLOATING-SCROLL-20260815/`.
  Manifest SHA-256 `716F6608A3539C5EA786F3DA2596FC7B5CC41B9B0CD2205F4E929AC473BEF597`;
  result SHA-256 `53CF8C32DDA89033DD98B61B335A1A9F125BD2125DFBA44466DF7984B5D253C7`.
- Repair keeps existing task syntax/storage, internal-link hover behavior,
  note destinations, and Base date-time display. No note/plugin/config content
  mutation occurred during final interaction checks.
- ChatGPT Web was advisory only: it supported body-mounted fixed picker,
  bounded task scroller, owner-document positioning, cleanup, and Datacore API
  limits. Live source and runtime evidence remain authority.
- Explicit baseline gap: repository-wide content/boundary scanners reject
  pre-existing historical `planning-debate-v1.zip` and `SECRET-*` paths. They
  were not touched. Wave 6 / Task 7, Wave 7 / Task 8, and Wave 8 / Task 9
  remain `NOT STARTED`.
