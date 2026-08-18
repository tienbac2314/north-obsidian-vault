# Dusk Template Demo Rebuild Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task with checkpoint updates.

**Goal:** Rebuild disposable Dusk_light-FNS demo notes through visible Obsidian template flows, document them with screenshots and onboarding tabs, and obtain an independent ChatGPT Web review.

**Architecture:** Preserve current package configuration and templates. Build a fresh disposable PC root from that preserved state, create notes through visible File Explorer, Notebook Navigator, and template-picker interactions, then copy only verified generated notes/media to the Android package. Keep rollback ZIPs and a sanitized review ZIP outside Git.

**Tech Stack:** Obsidian desktop, Notebook Navigator, Templater, Journals, existing Dusk_light templates, Android package, ZIP/SHA-256 verification, Chrome ChatGPT Web.

## Global Constraints

- Never edit live/personal vault or `C:\Users\TienBac\.codex\worktrees\bf23\personal-knowledge-pipeline`.
- Never expose or upload FNS credentials; review ZIP excludes FNS token-bearing data.
- Use visible UI for all template note creation. Do not use command-palette automation.
- Preserve `.obsidian`, `SYSTEM`, template files, plugin settings, and rollback packages.
- Use synthetic `DUMMY` names and no personal data.
- Verify PC and Android package parity before review upload.

---

### Task 1: Freeze rebuild inputs

**Files:**
- Read: `C:\Users\TienBac\Documents\Dusk_light-FNS-20260817\PC\Dusk_light-FNS-Test-20260817`
- Read: `C:\Users\TienBac\Documents\Dusk_light-FNS-20260817\Android-final2\Dusk_light-FNS-Test-20260817`
- Preserve: `C:\Users\TienBac\Documents\Dusk_light-FNS-20260817\Dusk_light-FNS-20260818-template-rebuild-before-PC.zip`
- Preserve: `C:\Users\TienBac\Documents\Dusk_light-FNS-20260817\Dusk_light-FNS-20260818-template-rebuild-before-Android.zip`
- Update: `C:\Users\TienBac\AppData\Local\Temp\dusk-light-template-demo-rebuild-state.md`

- [ ] Record package roots, backup hashes, template hashes, current plugin manifests, and current note counts in state file.
- [ ] Verify backup archives contain `.obsidian` and `SYSTEM/TEMPLATE/FORMAT`.
- [ ] Mark current package as rollback-only. Do not edit it during rebuild.

### Task 2: Build clean disposable roots

**Files:**
- Create: `C:\Users\TienBac\Documents\Dusk_light-FNS-20260818-template-demo\PC\Dusk_light-FNS-Template-Demo`
- Create: `C:\Users\TienBac\Documents\Dusk_light-FNS-20260818-template-demo\Android\Dusk_light-FNS-Template-Demo`

- [ ] Copy `.obsidian`, `SYSTEM`, and empty approved content folders from current package.
- [ ] Do not copy old `DUMMY` notes, `Untitled` artifacts, old project/area samples, or old testing notes.
- [ ] Keep folder names `DAILY/1. DAILY`, `DAILY/2. WEEKLY`, `DAILY/3. MONTHLY`, `DAILY/4. QUARTERLY`, `DAILY/5. YEARLY`, `PARA/1. PROJECTS` through `PARA/5. WORKSTATION`, `STICKY`, and `INBOX`.
- [ ] Copy templates unchanged and verify their hashes equal input package.

### Task 3: Create period notes through visible UI

**Files:**
- Create through Notebook Navigator: `DAILY/1. DAILY/<current date>.md`
- Create through Notebook Navigator: `DAILY/2. WEEKLY/<current year-month-week>.md`
- Create through Notebook Navigator: `DAILY/3. MONTHLY/<current year-month>.md`
- Create through Notebook Navigator: `DAILY/4. QUARTERLY/<current year-quarter>.md`
- Create through Notebook Navigator: `DAILY/5. YEARLY/<current year>.md`

- [ ] Maximize Obsidian and select only clean disposable vault.
- [ ] Use Notebook Navigator calendar date/period controls to create or open each note.
- [ ] Confirm visible note contains generated Dusk headings, calendar/timeline, task or Datacore sections as defined by template.
- [ ] Capture settled Reading-mode screenshots for daily, weekly, monthly, and yearly views.
- [ ] Record any platform-limited surface instead of fabricating content.

### Task 4: Create PARA and capture notes through visible UI

**Files:**
- Create one note for each mapped template in the matrix from the design document.
- Add only short synthetic showcase text after generated output.
- Create links between project, area, knowledge, meeting, contact, documentation, workstation, Sticky, and Inbox examples.

- [ ] Use File Explorer new-note UI inside mapped folders so folder templates run.
- [ ] Use visible template picker for `template_project.md`, `template_area.md`, and index notes.
- [ ] Reopen each generated note in Reading mode and capture screenshots of project controls, connection selector, meeting fields, task block, and note preview.
- [ ] Verify no raw Templater syntax remains in rendered Reading mode.
- [ ] Remove any visible `Untitled` artifact through normal UI only after confirming it belongs to this rebuild.

### Task 5: Add onboarding tabs and screenshots

**Files:**
- Modify through Obsidian editor: `SYSTEM/GETTING STARTED/Dusk_light Quick Start.md`
- Add: `SYSTEM/GETTING STARTED/Onboarding Media/Dusk_light/template-daily.png`
- Add: `SYSTEM/GETTING STARTED/Onboarding Media/Dusk_light/template-project.png`
- Add: `SYSTEM/GETTING STARTED/Onboarding Media/Dusk_light/template-knowledge.png`
- Add: `SYSTEM/GETTING STARTED/Onboarding Media/Dusk_light/template-meeting.png`
- Add: `SYSTEM/GETTING STARTED/Onboarding Media/Dusk_light/template-navigation.png`

- [ ] Add tabs for Daily, Project, Area/Knowledge, Meeting, Sticky/Inbox, Workstation, Notebook Navigator, and sync.
- [ ] Each tab states where to click, what the user should see, and what Reading/Editing mode changes.
- [ ] Embed fresh screenshots from this rebuild, not screenshots of old handcrafted notes.
- [ ] Explain that template-created controls remain in Reading mode and source syntax appears only in Editing/Source mode when applicable.

### Task 6: Replicate to Android package

**Files:**
- Modify: `C:\Users\TienBac\Documents\Dusk_light-FNS-20260818-template-demo\Android\Dusk_light-FNS-Template-Demo`

- [ ] Copy only verified generated Markdown, media, and onboarding changes from PC to Android package.
- [ ] Preserve Android `.obsidian` platform settings where they differ intentionally.
- [ ] Compare content hashes and list intentional platform differences.
- [ ] Open representative notes on registered Android disposable and capture mobile screenshots if available.

### Task 7: Package and safety verification

**Files:**
- Create PC ZIP: `C:\Users\TienBac\Documents\Dusk_light-FNS-20260818-template-demo-PC.zip`
- Create Android ZIP: `C:\Users\TienBac\Documents\Dusk_light-FNS-20260818-template-demo-Android.zip`
- Create review ZIP: `C:\Users\TienBac\Documents\Dusk_light-FNS-20260818-template-demo-review-sanitized.zip`
- Update: `C:\Users\TienBac\AppData\Local\Temp\dusk-light-template-demo-rebuild-state.md`

- [ ] Check exact note counts, no `Untitled`, no old six sample folders, and no personal-looking content.
- [ ] Check `.obsidian/plugins/fast-note-sync/data.json` is absent from review ZIP.
- [ ] Scan review ZIP filenames/content for credential-like keys without printing values.
- [ ] Record ZIP size and SHA-256 for all three archives.

### Task 8: ChatGPT Web review

**Files:**
- Upload only: `C:\Users\TienBac\Documents\Dusk_light-FNS-20260818-template-demo-review-sanitized.zip`
- Update: `C:\Users\TienBac\AppData\Local\Temp\dusk-light-template-demo-chatgpt-review.md`

- [ ] Use existing signed-in Chrome ChatGPT Web session.
- [ ] Attach sanitized review ZIP, then request review of actual-template fidelity, PC/mobile UX, onboarding clarity, tabs, structure, and regressions against old Dusk_light.
- [ ] Save response text and response timestamp in state file without copying credentials or private browser state.
- [ ] Apply only concrete defects that are unambiguous and remain inside disposable scope.

### Task 9: Final handoff

- [ ] Update state with completed tasks, screenshots, package hashes, ChatGPT review outcome, unresolved issues, and exact next action.
- [ ] Run Git checks for project documentation.
- [ ] Report links to PC ZIP, Android ZIP, sanitized review ZIP, rollback ZIPs, and state file.

