# Dusk Goal 1 independent review

Date: 2026-07-25

Verdict: **PRIOR PASS SUPERSEDED; FUNCTIONAL RE-REVIEW PENDING**

## Functional correction

The original verdict relied on screenshots captured in editing mode. Its
conclusion that Map of Content and Mail Box exposed failed raw Datacore source
is withdrawn. Current
[functional revalidation](2026-07-25-dusk-plugin-functional-revalidation.md)
shows both surfaces rendering on Windows and physical Android in reading view.

Dataview JavaScript was genuinely disabled in fresh defaults. Enabling only
`enableDataviewJs` and `enableInlineDataviewJs` restored tested output. Current
selected baselines load 44 light and 52 full plugins on Windows, plus 42 light
and 49 full plugins on Android, after restart.

PR #7 must remain draft until an independent reviewer checks the amended
evidence, boundaries, guide, and repository verification.

## Scope

The independent Dusk release reviewer checked the external objective, all 18
deliverables, physical-Android additions, corrected raw evidence, source and
live-vault boundaries, repository reports, and verification output.

The prior PASS meant Goal 1 discovery was comprehensive enough to begin one informed
personalization decision. It does not approve Dusk import, plugin selection,
configuration transfer, FNS enrollment, personal-data migration, or any write
to `G:\Obsidian`.

## Corrections accepted

- An initial disposable copy mistakenly included 31 source community-plugin
  `data.json` files. It remains quarantined and is not promotion evidence.
- Four fresh pre-open checkpoints contain zero source plugin `data.json`,
  tokens, or risky-name paths.
- Corrected PC and Android pre-open manifests match exactly at 343 light and
  371 full rows.
- Post-update plugin manifests match across platforms at 47 of 47 light and 57
  of 57 full plugins.
- Prior **BLOCKED** dashboard labels are superseded by reading-view functional
  evidence.
- Ten corrected `Dusk_light` portrait and ten landscape captures cover the
  major requested surfaces. Visual QA found no new landscape-wide overflow;
  one Home tab label remains clipped.
- `Dusk_light_empty` is an untested Goal 2 hypothesis. Populated runtime
  behavior and excluded source settings do not transfer by assumption.

## Boundary evidence

- PC source rehash found zero mismatch. PC and tablet source totals remain
  1,571 files and 293,256,520 bytes.
- The desktop Obsidian registry returned to SHA-256
  `B8F2DB0F6C68F065E1853DEAAE885EC18CEA70ED9DAAEC1BDF931A25E9C88D40`.
- Desktop and Android Obsidian were stopped after testing.
- Corrected disposables keep Obsidian Sync, Publish, FNS, Todoist, embedded
  frames, beta installation, sharing, and external writers off or absent.
- Live-vault Dusk sentinel paths remain absent, its 164-file Notion tree count
  remains unchanged, only FNS is enabled, and core Sync and Publish remain
  disabled.
- No raw evidence or disposable vault is tracked by Git.

## Remaining promotion blockers

- Dynamic dashboards require explicit safe-field reconstruction or a native
  replacement; source `data.json` cannot be copied wholesale.
- Safe Journals migration remains unknown.
- Normal in-app Vietnamese save/index/search behavior remains unresolved.
- Executable-note and write workflows, FNS convergence, backup, and rollback
  remain untested for a selected Dusk configuration.
- Full Android startup became ready only between 11.7 and 19.7 seconds and
  emitted repeated Mali allocation warnings.
- Settings Search/Highlightr and Novel Word Count errors remain.
- Exact minimum plugin set remains undecided.

These are Goal 2 gates, not accepted live defects.

## Prior review decision

The prior reviewer allowed Goal 1 to close. Current re-review must decide
whether that closure remains justified. Goal 2 must still start with a freshly sanitized
`Dusk_light_empty` disposable, direct Windows and Android testing, and
field-by-field reconstruction of only the non-secret settings needed by one
chosen workflow. Quarantined copies must never be committed, synced, or reused
as promotion evidence.
