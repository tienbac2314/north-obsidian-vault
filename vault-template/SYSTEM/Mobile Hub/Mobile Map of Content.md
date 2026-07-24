---
cssclasses:
  - dusk-surface
  - hide-properties_editing
  - hide-properties_reading
aliases:
  - Mobile Map of Content
---

# Map of Content

[[SYSTEM/Mobile Hub/Mobile Home|Home]] · [[HUB/Map of Content|Rich desktop map]]

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

- [[STAGING/Unsorted|Unsorted]]
- [[PARA/Projects|Projects]]
- [[PARA/Areas|Areas]]
- [[PARA/Resources|Resources]]
- [[PARA/WORKSTATION|Workstation]]
- [[ZETA/Literature|Literature]]
- [[ZETA/Permanent|Permanent]]
- [[Notion|Notion import]]
