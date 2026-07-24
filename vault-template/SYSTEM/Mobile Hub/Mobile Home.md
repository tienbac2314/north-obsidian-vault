---
cssclasses:
  - dusk-home
  - hide-properties_editing
  - hide-properties_reading
aliases:
  - Mobile Home
---

# North

<div class="dusk-mobile-links">
  <a class="internal-link dusk-nav-button" data-href="SYSTEM/Mobile Hub/Mobile Map of Content" href="SYSTEM/Mobile Hub/Mobile Map of Content">⌖ Map</a>
  <a class="internal-link dusk-nav-button" data-href="SYSTEM/Mobile Hub/Mobile Mail Box" href="SYSTEM/Mobile Hub/Mobile Mail Box">▣ Mail</a>
</div>

<div class="dusk-command-row">

`BUTTON[capture_note]` `BUTTON[open_daily_note]`

</div>

## Open tasks

```tasks
not done
path does not include SYSTEM
sort by due
limit 8
short mode
```

## Review queue

![[HUB/Bases/Review Queue.base#Queue]]

## Continue

![[HUB/Bases/Projects.base#Active]]

Desktop dashboard: [[HUB/Home|Home]].

```meta-bind-button
label: Capture
icon: lucide-plus-circle
hidden: true
id: capture_note
style: primary
actions:
  - type: command
    command: quickadd:runQuickAdd
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
