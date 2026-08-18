# Dusk Template Demo Rebuild Design

## Goal

Replace hand-written demo notes in disposable Dusk_light-FNS packages with notes created through the visible Obsidian template flows, then document those flows with screenshots and short onboarding tabs.

## Scope

- Work only in disposable PC and Android package roots under `C:\Users\TienBac\Documents\Dusk_light-FNS-20260817`.
- Preserve `.obsidian`, `SYSTEM`, templates, plugin settings, and rollback archives.
- Rebuild synthetic demo notes only. No personal vault, live source tree, or FNS security settings.
- Use visible Obsidian actions for note creation. Do not manufacture replacement frontmatter or template bodies by script.
- Add short showcase text only after template output exists. Never replace generated sections.

## Template output matrix

| Surface | Visible creation path | Actual source |
|---|---|---|
| Daily | Notebook Navigator calendar create | `SYSTEM/TEMPLATE/FORMAT/NN/template_daily_note.md` |
| Weekly | Notebook Navigator calendar create | `SYSTEM/TEMPLATE/FORMAT/NN/template_weekly_note.md` |
| Monthly | Notebook Navigator calendar create | `SYSTEM/TEMPLATE/FORMAT/NN/template_monthly_note.md` |
| Quarterly | Notebook Navigator calendar create | `SYSTEM/TEMPLATE/FORMAT/NN/template_quarterly_note.md` |
| Yearly | Notebook Navigator calendar create | `SYSTEM/TEMPLATE/FORMAT/NN/template_yearly_note.md` |
| Project family | visible template picker | `SYSTEM/TEMPLATE/FORMAT/template_project.md` |
| Project note | File Explorer new note in project folder | `SYSTEM/TEMPLATE/FORMAT/template_project_note.md` |
| Area family | visible template picker | `SYSTEM/TEMPLATE/FORMAT/template_area.md` |
| Area note | File Explorer new note in area folder | `SYSTEM/TEMPLATE/FORMAT/template_area_note_sub.md` |
| Contact | File Explorer new note in Contacts | `SYSTEM/TEMPLATE/FORMAT/template_contact.md` |
| Documentation | File Explorer new note in Documentations | `SYSTEM/TEMPLATE/FORMAT/template_documentation_note.md` |
| General, Standup, Team meeting | File Explorer new note in mapped meeting folder | matching `template_meeting_*.md` |
| Permanent, Literature, Fleeting | File Explorer new note in mapped Knowledge folder | matching knowledge template |
| Workstation | File Explorer new note in Workstation | `template_workstation_note.md` |
| Sticky, Inbox | File Explorer new note in mapped folder | `template_new_note.md` |
| Hub, PARA, Resources, Archives indexes | visible template picker | `template_new_note.md` |

Folder mappings remain source of truth. If a surface has no template, that fact is documented instead of inventing one.

## Demo content rules

- Every generated note keeps its original frontmatter, rendered controls, headings, task blocks, and code blocks.
- Synthetic links, tags, and tasks are added only through normal note editing after generation.
- Demo text uses `DUMMY` names and `.invalid` email domains. No personal data.
- Project and Area examples demonstrate connections. Knowledge examples demonstrate type and promotion flow. Meeting examples demonstrate date, time, status, and follow-up. Sticky and Inbox demonstrate different capture intent.
- Existing old demo notes stay in rollback archives. They are not silently mixed with rebuilt notes.

## Onboarding

Extend `SYSTEM/GETTING STARTED/Dusk_light Quick Start.md` with tabbed use-case flows:

1. Daily planning.
2. Project with Area connection.
3. Area and reusable Knowledge.
4. Meeting capture and follow-up.
5. Sticky versus Inbox.
6. Workstation experiment.
7. Notebook Navigator and FNS sync.

Add fresh screenshots under `SYSTEM/GETTING STARTED/Onboarding Media/Dusk_light/`. Screenshots show settled Reading mode and the relevant visible UI. They contain only synthetic demo data.

## Verification

- Fresh PC and Android package roots contain same generated Markdown and onboarding media hashes.
- Representative notes open in Reading mode without raw template syntax visible.
- Project/Area/Workstation controls render, connections can be selected, and tasks remain real `#task` items.
- Journals/Notebook Navigator period creation opens correct numbered folders and uses correct templates.
- No `Untitled` demo artifacts remain.
- Review ZIP excludes `.obsidian/plugins/fast-note-sync/data.json` and any token-bearing file.
- ChatGPT Web receives only sanitized synthetic package and is asked to review template fidelity, onboarding, UI/UX, structure, and regressions.
