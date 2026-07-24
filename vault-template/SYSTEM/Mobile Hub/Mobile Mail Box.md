---
cssclasses:
  - dusk-surface
  - hide-properties_editing
  - hide-properties_reading
aliases:
  - Mobile Mail Box
---

# Mail Box

[[SYSTEM/Mobile Hub/Mobile Home|Home]] · [[HUB/Mail Box|Rich desktop mailbox]]

## Review queue

![[HUB/Bases/Review Queue.base#Queue]]

## Page tasks

```dataview
table status as "Status", dateformat(file.mtime, "dd/MM/yyyy") as "Updated"
from ""
where page_task = true and status != "done" and status != "4 Completed"
sort file.mtime desc
limit 20
```

Hermes approval remains separate from task completion. Review exact proposal
content and its `Human review` block before moving it to `STAGING/Reviewed`.
