# Dusk_light parity and onboarding design

**Status:** Approved design, 2026-08-05

## Purpose

Make the disposable Dusk_light vault easier to use and closer in practical
desktop/mobile parity without importing the full Dusk vault. This is a
post-Wave-6 usability and parity batch. It is not a new canonical wave and it
does not authorize Wave 7 / Task 8 or Wave 8 / Task 9.

The batch covers three selected mobile-capable plugins, removal of one
obsolete compatibility-risk plugin, platform parity checks, and a new
Dusk_light-specific Getting Started guide with fresh sanitized screenshots.

## Approved decisions

- Add `obsidian-day-planner` at the current stable package verified before
  implementation.
- Add `remember-cursor-position` at the current stable package verified before
  implementation.
- Add `darlal-switcher-plus` (Quick Switcher++) at the current stable package
  verified before implementation.
- Do not add `table-editor-obsidian` / Advanced Tables. Obsidian Bases remains
  the preferred future path for structured tables and any later
  Dataview/Datacore-to-Bases personalization.
- Keep `obsidian-projects` enabled on Windows and Android. Its commands are
  consumed by existing QuickAdd and Note Toolbar mappings.
- Remove `settings-search` from both registered disposable targets only,
  after exact rollback capture and a final reference audit. It is archived,
  in maintenance mode, uses internal Settings APIs, and has already produced
  an Obsidian 1.13.4 compatibility toast in disposable testing.
- Keep core Daily Notes disabled. Journals remains the periodic-note owner;
  Day Planner must consume Journals-created notes without creating a second
  periodic-note owner.
- Keep Todoist, BRAT, credential-bearing integrations, network-connected
  frames, arbitrary code/macros/JSX execution, and protected/live/source
  vaults outside scope.

## Current boundary

The accepted disposable baseline is:

- Windows vault/profile: `W5-INTEGRATED-UPDATED-LIGHT-20260803` under
  `G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime`.
- Android serial: `01234ABC`; package `md.obsidian`; registered vault
  `/storage/emulated/0/Documents/Dusk-Phase2-Preparation-Part2-Android-V1-20260801`.
- Part 2 control repository:
  `G:\Dusk-Knowledge-Hub\payload\repos\Dusk-Phase2-Preparation-Part2-20260729`.
- Product publication worktree:
  `C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline-phase2-reset`.
- Raw runtime evidence remains outside Git at
  `G:\Dusk-Knowledge-Hub\payload\evidence\Dusk-Phase2-Preparation-Part2-Runtime`.
- The baseline has 47 installed plugin directories and 44 enabled community
  IDs. Implementation must recalculate this count after each transaction;
  it must not treat the count as proof of feature support.
- Exact full-Dusk source/archive is not admitted. Public legacy Dusk material
  and existing full-Dusk-looking Getting Started images are advisory/reference
  only. No full-Dusk feature is accepted from those images alone.

## Goals and non-goals

### Goals

1. Install, configure, and test the three approved plugins on Windows and the
   registered physical Android disposable where the platform supports them.
2. Remove Settings Search only after reversible capture, reference audit, and
   affected startup/settings reruns.
3. Verify every installed plugin directory has a platform disposition:
   supported and tested, supported but disabled by policy, desktop-only,
   blocked by credential/network/safety rules, or not applicable.
4. Test safe representative actions for existing Dusk_light surfaces and the
   new plugin surfaces, including daily/weekly/monthly note integration,
   Reading and Live Preview, startup/readiness, navigation, scrolling, and
   recovery.
5. Replace misleading onboarding assumptions with a compact guide written for
   Dusk_light, while retaining old images as explicitly labeled historical
   full-Dusk reference media.
6. Record Windows/mobile differences explicitly instead of silently claiming
   byte or behavior parity where Obsidian platform limits differ.

### Non-goals

- Importing the full Dusk vault, full-only content, or full-only plugins.
- Enabling Daily Note Navbar alongside Journals.
- Enabling Todoist, BRAT, credentials, network integrations, or arbitrary
  execution merely to make a screen appear complete.
- Migrating Dataview or Datacore queries to Bases now.
- Deleting any user-facing plugin based only on zero static Dusk references.
- Publishing raw screenshots, profiles, ledgers, archives, logs, or personal
  vault content to the product repository.

## Design

### 1. Transaction and rollback boundary

Before every mutation, independently prove the exact Windows vault/profile,
Android serial/package/vault, process identity, branch, and clean Git state.
Create an external rollback copy for the plugin directories, manifests, and
affected configuration files. Store the copy and SHA-256 manifest under a
dated child of the runtime evidence root. Do not read or copy credentials,
tokens, browser profiles, network caches, or private note content.

Each plugin change is an isolated transaction:

1. Capture before file list, byte counts, and SHA-256 values.
2. Change only the disposable target.
3. Reload or restart the exact target and wait for settled behavior.
4. Exercise the affected contract on Windows and Android.
5. Restore the transaction if startup, readiness, identity, or contract
   checks fail.
6. Record sanitized patch paths, exact hashes, result, and remaining gate.

### 2. Plugin additions

Use stable community packages and their exact manifests rather than copying
from a full vault. Add each ID to the community plugin list only after its
directory and manifest are verified. Preserve the core Quick Switcher because
Quick Switcher++ extends it.

#### Day Planner

Day Planner is an optional timeline/time-tracking surface. Test it against
existing Journals-created daily notes and scheduled Tasks. Do not enable core
Daily Notes or Periodic Notes to satisfy its documentation; that would create
duplicate periodic-note ownership. If the plugin cannot consume the current
Journals paths without a second owner, leave it installed but disabled and
document the incompatibility.

Minimum safe checks: startup/readiness, open the planner, open a current daily
note, inspect a scheduled safe task, tap/hold equivalent mobile controls where
available, scroll the timeline, and recover to Homepage. Do not create a
real-world reminder or sync an online calendar.

#### Remember Cursor Position

Test existing and newly opened safe notes in Edit, Reading, and Live Preview.
Verify cursor/scroll restoration without entering personal content or relying
on a credential-bearing workflow. Record whether Templater-generated daily,
weekly, and monthly notes remain clean. A failure in restoration is isolated
to this plugin; it must not be “fixed” by deleting `tp.file.cursor()` from
templates.

#### Quick Switcher++

Keep core Quick Switcher enabled. Test file search/open, heading or symbol
navigation where a safe Dusk_light note provides it, command/panel access, and
mobile launcher behavior. Verify that it does not replace or corrupt existing
Homepage, Map, Mail, Journals, Projects, or Note Toolbar routes.

### 3. Settings Search removal

Before removal, search only sanitized plugin IDs, manifests, settings data,
command IDs, and Dusk_light configuration for references. Do not inspect
credentials or private note content. Preserve exact rollback trees externally,
remove the plugin directory and community-list ID on each disposable, reload,
and verify:

- no settled startup incompatibility toast;
- Settings opens normally through core Obsidian;
- enabled-plugin configuration has the intended ID difference only;
- existing settings-dependent plugin routes remain available;
- rollback is possible from the external copy.

If Android is unavailable, the Windows removal may proceed only with the
Android change explicitly blocked; final parity must not be called complete.

### 4. Dusk_light onboarding

Add one concise guide under `SYSTEM/GETTING STARTED` named
`Dusk_light Quick Start.md`, and link it from the existing Getting Started
index. The guide must explain in plain language:

- Homepage, Mobile Homepage, Map, Mail/Inbox, Journals, and the
  context-sensitive Note Toolbar floating button;
- how to create daily, weekly, and monthly notes without enabling a second
  calendar/periodic owner;
- Tasks, Dataview/DVJS, Datacore, Meta Bind, Templater, QuickAdd, Commander,
  Projects, Excalidraw, Hover Editor, Tabs, Search, and recovery basics;
- Day Planner, Remember Cursor Position, and Quick Switcher++ after they pass
  testing;
- which features are desktop-only, disabled, blocked, or intentionally absent
  from Dusk_light;
- the distinction between Reading and Live Preview, including the safe
  handling of `tp.file.cursor()` through Templater.

Capture a small curated set of fresh sanitized screenshots after the target is
settled:

- Windows: native 1920x1040 JPEGs, maximized immediately before each accepted
  capture;
- Android: native 1200x2000 PNGs;
- no credentials, personal notes, browser profiles, raw logs, or private
  identifiers.

Keep existing full-Dusk-looking images in place only with a clear
“historical/full-Dusk reference; not Dusk_light acceptance evidence” label.
Do not duplicate the old image atlas into the new guide.

### 5. Coverage and evidence

Use the existing Part 2 ledgers, not duplicate tables:

- `runtime/SURFACE-REGRESSION.csv` for the compact navigation/action checklist
  and platform result;
- `runtime/PLUGIN-DEPENDENCIES.csv` for plugin ownership, dependencies, and
  disposition;
- `runtime/PATCH-INDEX.csv` for sanitized repair references;
- `state/ACTIVE-CONTEXT/CURRENT.md`, `state/RESUME.md`,
  `state/ACTIVE-CONTEXT/DECISIONS.md`, and `state/RESULT-LEDGER.md` for the
  current checkpoint and remaining gates.

The product branch receives only the guide, concise authority/status updates,
and reproducible sanitized patch/hash references. Raw evidence and full
ledgers stay in the Hub evidence root.

### 6. Parity rule

Compare enabled IDs, plugin versions, relevant configuration, and safe
behavior by platform. The expected result is equal supported configuration,
not forced identity: desktop-only plugins and platform-native UI differences
remain explicit exceptions. Any configuration drift must have one of these
causes recorded: platform capability, intentional safety policy, disabled
credential/network integration, or a verified failure with rollback.

## Debugging and failure handling

Use systematic debugging for every unexpected result:

1. Reproduce on the same settled disposable target.
2. Separate loading messages from settled behavior.
3. Compare the owning plugin, dependency, command ID, path, and configuration
   against the known-good baseline.
4. Bisect only the relevant interaction group.
5. Apply the smallest disposable-only repair.
6. Rerun the failed check and its affected integrated checks on both platforms.

Recoverable UI automation failures are retried with fresh observation. A
wrong target, private-data exposure, unexplained plugin, missing rollback,
destructive action, branch/remote ambiguity, or authority outside this batch
stops work. A blocked platform is recorded as blocked, not converted into a
pass.

## Acceptance matrix

The batch is accepted only when all applicable rows below are evidenced:

| Area | Acceptance evidence |
|---|---|
| Target identity | Windows vault/profile and Android serial/package/vault re-proven before each mutation |
| Plugin inventory | All installed directories have a disposition; new IDs, versions, and enabled-list changes are hashed |
| Settings Search | External rollback, reference audit, removal, clean settled startup/settings rerun on both platforms |
| Day Planner | Safe planner/daily-note/task/timeline checks; no duplicate periodic owner; mobile result explicit |
| Remember Cursor Position | Existing/new note cursor or scroll restoration checks in Edit, Reading, and Live Preview; Templater routes clean |
| Quick Switcher++ | Core dependency, file/heading/command/panel checks, mobile launcher check, recovery to existing routes |
| Existing Dusk_light | Equal-contract evidence reused only where source/version/config/platform/contract remain equal; affected routes rerun |
| Scrolling and views | Full relevant vertical/horizontal scroll; settled Reading and Live Preview behavior |
| Screenshots | Accepted Windows captures are 1920x1040 JPEG; Android captures are native 1200x2000 PNG; sanitized |
| Onboarding | Guide links resolve, Dusk_light-specific claims match observed state, legacy media is labeled reference |
| Parity | Supported IDs/configuration are synchronized; desktop-only, disabled, blocked, and platform-native differences are listed |
| Repository/evidence | Part 2/product checks, manifest/hash validation, Git identity/clean checks, and bounded 9router Graphify refresh after material docs commit |

“Fully fixed” means all safely testable applicable rows pass. It does not
erase credential, network, unsupported, desktop-only, missing-device, or
full-source gates.

## Advisory sources

These public sources inform plugin capabilities only; local manifests and
disposable observation control acceptance:

- [Day Planner README](https://github.com/ivan-lednev/obsidian-day-planner/blob/main/README.md)
  and [its periodic-notes adapter](https://github.com/ivan-lednev/obsidian-day-planner/blob/main/src/service/periodic-notes.ts)
- [Remember Cursor Position](https://github.com/dy-sh/obsidian-remember-cursor-position)
- [Quick Switcher++](https://github.com/darlal/obsidian-switcher-plus)
- [Settings Search repository](https://github.com/javalent/settings-search) and
  [its changelog](https://github.com/javalent/settings-search/blob/main/CHANGELOG.md)
- [legacy Dusk README](https://github.com/DuskWasHere/dusk-obsidian-vault/blob/master/README.md)

Public Dusk material remains historical advisory context, not admission of a
full-Dusk source or visual baseline.
