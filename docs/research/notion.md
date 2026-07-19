# Notion evaluation

## Current workspace evidence

Read-only inspection on 2026-07-19 found database `My journal` with date, title, status, and summary properties; calendar and log views; and default `Daily entry` template. Four dated rows existed: two done, two not started, all Summary values empty. Template contains Tasks, What I learned, Problems/how solved, and Links sections.

Observation: structure exists, but capture and review habits do not. Blank/partial rows show automatic page creation alone cannot create understanding.

## Official evidence

- [Database templates](https://www.notion.com/help/database-templates), official Notion Help, accessed 2026-07-19: repeating database templates can create daily, weekly, monthly, or yearly pages.
- [Request limits](https://developers.notion.com/reference/request-limits), official Notion API, accessed 2026-07-19: rate limits, 500 KB/1,000-block payload limit, and 2,000-character rich-text objects.
- [Webhook event delivery](https://developers.notion.com/reference/webhooks-events-delivery), official Notion API, accessed 2026-07-19: events may be aggregated, delayed, retried, and out of order and require fetching latest state.

## Role options

### Main raw and knowledge store

- Benefit: one familiar UI.
- Cost: large copied content/attachments encounter API constraints; event/outbox semantics are awkward; raw and synthesis become easy to overwrite; export portability is weaker than files.
- Recommendation: reject for MVP raw truth.

### Review interface only

- Benefit: calendar/table/linked-page UX and mobile access; local pipeline can survive outage.
- Cost: projection logic and two-way edits require reconciliation.
- Recommendation: preferred MVP role, with one-way export plus explicit feedback actions initially.

### Both canonical durable notes and review UI

- Benefit: fewer visible systems.
- Cost: Notion becomes availability and migration dependency; provenance must be encoded in properties/blocks.
- Recommendation: reconsider after two-week behavior experiment.

## Automatic daily creation

Existing template can be configured in Notion UI with `•••` → `Repeat` → daily. This directly solves missing daily pages without VPS automation. However, daily blank pages may worsen clutter. Pipeline should publish digests only on capture days and create a weekly review every week; recurring blank journal pages are optional.

## Proposed projection

Use three views/databases only if experiment succeeds:

- `Daily Digests`: date, review status, capture count, one question, summary.
- `Knowledge`: title, topic, maturity, source captures, last reviewed, related notes.
- `Practice/Evidence`: action, skill, project, result, interview/promotion evidence.

Raw payload stays local and is linked by opaque capture ID, not copied wholesale.

## Uncertainty

Connected plan entitlements, API attachment flow, template scheduling behavior, and user preference for digest editing need live tests. No workspace mutations were made during research.
