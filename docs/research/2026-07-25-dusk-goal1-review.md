# Dusk Goal 1 independent review

Date: 2026-07-25

Verdict: **FAIL; PR #7 REMAINS DRAFT**

This file records release verdict only. Detailed checks, user corrections,
workflow results, and raw evidence paths live in
[functional revalidation](2026-07-25-dusk-plugin-functional-revalidation.md).

## Accepted corrections

- Earlier Map of Content and Mail Box failures came from editing-mode
  screenshots. Both can render on Windows and physical Android in reading view.
- Fresh Dataview defaults disabled JavaScript queries. Enabling only
  `enableDataviewJs` and `enableInlineDataviewJs` restored tested output.
- Compatible selected plugins loaded after update and restart: Windows light
  44/44, Windows full 52/52, Android light 42/42, Android full 49/49.
- User Android plugin enablement after import was intentional. It is not
  configuration drift or evidence of incompatibility.
- Initial copies containing source plugin `data.json` remain quarantined.
  Corrected copies exclude plugin configuration, credentials, sync, publishing,
  sharing, AI, and external writers unless tested through a separate gate.

These corrections establish plugin-load and technical-render evidence. They do
not establish complete usability or safe promotion.

## Release blockers

1. `windows-full-post-reload.json` records `cdn.ko-fi.com`,
   `storage.ko-fi.com`, `i.ytimg.com`, and `img.buymeacoffee.com` without
   initiators. Attribution remains unknown.
2. Full Android Home contains error-like content, stray text, and clipping.
   Android tables overflow horizontally.
3. Home ribbon navigation and Home `Map of Contents` and `Daily Note` buttons
   failed during maximized Windows checks.
4. Home reading view exposes raw Todoist `filter`, `project`, and `sorting`
   configuration.
5. Daily notes still report `Note is not connected to a journal`.
6. QuickAdd, Meta Bind, Mail Box, timeline, and remaining executable-note write
   paths lack direct restored-state evidence.
7. Templater exposed the whole vault picker and created `Untitled.md` in the
   current `DAILY/MONTHLY` folder without a naming or location prompt.
8. Physical-Android interaction and write coverage remains incomplete.

Old 1024 by 800 Windows screenshots are diagnostic only. Valid desktop
usability evidence requires maximized 1920 by 1040 captures, explicit
reading/editing-mode control, settled dynamic content, and a labeled screenshot
before each transition.

## Safety boundary

- Source and tablet-source manifests remain unchanged.
- `G:\Obsidian` received no Dusk files or settings.
- Desktop Obsidian registry returned to SHA-256
  `B8F2DB0F6C68F065E1853DEAAE885EC18CEA70ED9DAAEC1BDF931A25E9C88D40`.
- Disposable evidence stays outside Git under
  `G:\Dusk-Goal1-Discovery-20260725`.
- Quarantined or credential-bearing copies cannot become promotion evidence.

## Decision

Prior Goal 1 closure is withdrawn. Goal 1 remains open, PR #7 remains draft,
and Goal 2 must not start.

A later PASS requires corrected evidence for release blockers, matching claims
across Windows and physical Android, passing repository checks, and a fresh
review. Even PASS would authorize personalization review only, not live import,
configuration transfer, FNS enrollment, or personal-data migration.
