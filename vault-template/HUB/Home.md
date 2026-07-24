---
cssclasses:
  - dusk-home
  - wide-view
  - hide-properties_editing
  - hide-properties_reading
aliases:
  - Home
tags: []
---

<div class="dusk-hero">
  <span class="dusk-kicker">NORTH VAULT</span>
  <h1>Learn, build, connect.</h1>
  <p>Fast capture. Deliberate understanding. Useful software.</p>
</div>

<div class="dusk-nav-grid">
  <a class="internal-link dusk-nav-button" data-href="HUB/Map of Content" href="HUB/Map of Content">⌖ Map of Content</a>
  <a class="internal-link dusk-nav-button" data-href="HUB/Priority Matrix" href="HUB/Priority Matrix">◆ Priority Matrix</a>
  <a class="internal-link dusk-nav-button" data-href="HUB/Mail Box" href="HUB/Mail Box">▣ Mail Box</a>
</div>

<div class="dusk-command-row">

`BUTTON[capture_note]` `BUTTON[open_daily_note]`

</div>

```dataviewjs
const now = dv.luxon.DateTime.now();
const elapsed = now.diff(now.startOf("day"), "minutes").minutes;
const progress = Math.max(0, Math.min(100, (elapsed / 1440) * 100));
const shell = dv.container.createDiv({ cls: "dusk-day-progress" });
shell.createDiv({
  cls: "dusk-day-label",
  text: `${now.toFormat("dd/MM/yyyy")} · ${Math.round(progress)}% of today`
});
const bar = shell.createEl("progress");
bar.max = 100;
bar.value = progress;
```

> [!multi-column]
>
>> [!dusk-review]+ Review queue
>> ![[HUB/Bases/Review Queue.base#Queue]]
>
>> [!dusk-today]+ Open tasks
>> ```tasks
>> not done
>> path does not include SYSTEM
>> sort by due
>> limit 10
>> short mode
>> ```

`````tabs
tab: Projects
![[HUB/Bases/Projects.base#Active]]

tab: Areas
![[HUB/Bases/Areas.base#Active]]

tab: Learning
![[HUB/Bases/Learning.base#Recent]]

tab: Start here
> [!tip] Capture without ceremony
> Put unclear material in `STAGING/Unsorted`. File obvious work directly. Move
> material to `STAGING/Pending Agent Review` only when Hermes review is wanted.

> [!example] Main paths
> - [[PARA/Projects|Projects]] and [[PARA/Areas|Areas]]
> - [[PARA/Resources|Resources]] and [[PARA/WORKSTATION|Workstation]]
> - [[ZETA/Literature|Literature]] and [[ZETA/Permanent|Permanent]]
> - [[Notion|Notion import]]
> - [[SYSTEM/Guides/vault-operating-guide|Operating guide]]
`````

<div class="dusk-footer">Core Markdown and Bases remain usable when rich plugins are disabled.</div>

```meta-bind-button
label: Capture
icon: lucide-plus-circle
hidden: true
id: capture_note
style: primary
actions:
  - type: command
    command: quickadd:choice:8e928b13-838c-4743-bc4e-97a756c4d8e4
```

```meta-bind-button
label: Daily note
icon: lucide-calendar
hidden: true
id: open_daily_note
style: primary
actions:
  - type: command
    command: daily-notes
```
