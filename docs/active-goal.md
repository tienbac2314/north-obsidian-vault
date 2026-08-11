# Active goal

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
