---
type: area
status: active
category: ""
created: "{{date:YYYY-MM-DD}}"
aliases: []
tags: []
cssclasses:
  - dusk-surface
---

# {{title}}

## Standard

What stays healthy when this area is working?

-

## Current attention

-

## Related projects

```dataview
table status as "Status", priority as "Priority", dateformat(due, "dd/MM/yyyy") as "Due"
from "PARA/Projects"
where contains(area, this.file.link) or contains(area, this.file.name)
sort due asc
```

## Notes

-

## Connections

-
