---
cssclasses:
  - dusk-surface
  - hide-properties_editing
  - hide-properties_reading
aliases:
  - Mobile Map of Content
---

# Map of Content

[[SYSTEM/Mobile Hub/Mobile Home|Home]] · [[HUB/Map of Content|Desktop map]]

## Recently changed

```dataview
table type as "Type", dateformat(file.mtime, "dd/MM/yyyy") as "Updated"
from ""
where !startswith(file.path, "SYSTEM/")
and !startswith(file.path, "HUB/")
and file.name != this.file.name
sort file.mtime desc
limit 30
```

## Main paths

- Capture: `STAGING/Unsorted`
- Projects: [[HUB/Bases/Projects.base|Projects Base]]
- Areas: [[HUB/Bases/Areas.base|Areas Base]]
- Resources: `PARA/Resources`
- Workstation: `PARA/WORKSTATION`
- Literature: [[HUB/Bases/Learning.base|Learning Base]]
- Permanent notes: `ZETA/Permanent`
- Unchanged import: `Notion`
