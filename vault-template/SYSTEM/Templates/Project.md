---
type: project
status: active
priority: medium
due:
area: []
created: "{{date:YYYY-MM-DD}}"
aliases: []
tags: []
cssclasses:
  - dusk-surface
---

# {{title}}

## Outcome

-

## Next action

-

## Project details

- Priority: `INPUT[inlineSelect(option(high), option(medium), option(low)):priority]`
- Status: `INPUT[inlineSelect(option(active), option(blocked), option(done), option(archived)):status]`
- Due: `INPUT[date:due]`
- Areas: `INPUT[inlineList:area]`

## Notes

-

## Related knowledge

```dataview
table type as "Type", status as "Status", dateformat(file.mtime, "dd/MM/yyyy") as "Updated"
from "ZETA" or "PARA/Resources" or "PARA/WORKSTATION"
where contains(file.outlinks, this.file.link) or contains(connections, this.file.link)
sort file.mtime desc
```

## Connections

-
