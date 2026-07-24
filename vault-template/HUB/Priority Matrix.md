---
cssclasses:
  - dusk-surface
  - hide-properties_editing
  - hide-properties_reading
aliases:
  - Priority Matrix
---

# Priority Matrix

[[HUB/Home|Home]]

Typed property values stay machine-readable:

- `urgent_important`
- `not_urgent_important`
- `urgent_not_important`
- `not_urgent_not_important`

## Do First

```query
[eisenhower_status:urgent_important]
```

## Schedule

```query
[eisenhower_status:not_urgent_important]
```

## Delegate

```query
[eisenhower_status:urgent_not_important]
```

## Do Not Do

```query
[eisenhower_status:not_urgent_not_important]
```
