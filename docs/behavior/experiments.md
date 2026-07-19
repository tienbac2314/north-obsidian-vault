# Behavioral experiments

No proposal becomes Accepted until measured with non-sensitive material.

## EXP-001: Two-week capture habit

- Hypothesis: Telegram raw capture with no required structure is sustainable.
- Duration: 14 calendar days.
- Procedure: send every intentionally saved learning item to one bot; optional `why:` context only when natural.
- Measures: number of captured items, days with at least one capture, median and p90 manual capture time, abandoned captures.
- Pass: at least 10 useful captures, median under 15 seconds, p90 under 30 seconds, and no item abandoned because form fields were required.
- Failure response: reduce bot interaction; do not add more automation.

## EXP-002: Grouping and classification

- Hypothesis: reply/media/source signals plus conservative semantic grouping avoid harmful merges.
- Sample: first 30 captures or all captures after two weeks.
- Measures: incorrect merge, incorrect split, wrong durable/temporary class, user corrections.
- Pass: zero harmful merges, at most 20% items needing any correction, and all corrections traceably update derived state without changing raw input.
- Failure response: disable automatic semantic grouping; retain explicit reply/media grouping only.

## EXP-003: Daily digest usability

- Hypothesis: digest creates interpretation without becoming another chore.
- Procedure: deliver only on capture days at chosen time.
- Measures: review time, reviewed digests, promoted/practice/reference/temporary actions, ignored questions.
- Pass: median review under two minutes; at least 70% of digests on active days reviewed; at least 60% of promoted items rated useful one week later.
- Failure response: reduce digest to three items and defer overflow to weekly review.

## EXP-004: Weekly growth value

- Hypothesis: topic-centered weekly synthesis helps retention and action more than daily-page browsing.
- Procedure: before reading weekly review, answer five short recall prompts generated from captures; then rate usefulness and choose one practice item.
- Pass: source-backed answer for at least four of five prompts, one concrete next-week practice action, and no unsupported growth claim.
- Failure response: use spaced recall prompts instead of narrative summary.

## EXP-005: Model and provider outage

- Hypothesis: raw capture remains reliable without 9Router or upstream providers.
- Procedure: stop only a disposable/local test route or point test worker at a guaranteed-failing endpoint; send text, link, and attachment; restore processor.
- Pass: three raw records committed and acknowledged, no model call on capture transaction, three delayed jobs processed exactly once, original bytes/metadata unchanged.
- Failure response: redesign persistence/ack boundary before any further feature work.

## EXP-006: Notion export outage

- Hypothesis: Notion is a projection, not availability dependency.
- Procedure: use invalid test integration credentials; approve one synthesis; restore valid test connection.
- Pass: local approval persists, outbox retries with same idempotency key, one Notion projection appears, and no raw/synthesized data is lost.

## EXP-007: Retrieval baseline

- Hypothesis: source links, titles, tags, and full-text search are enough before vectors.
- Procedure: define eight real questions after 30+ captures; answer with SQLite full-text/file search, then optionally compare semantic retrieval.
- Pass without vectors: at least six correct top-five results with source provenance and acceptable manual search time.
- Vector-search trigger: fewer than six correct results on two consecutive curated test sets or repeated user failure to find known material.

## Edge cases to include

- forwarded messages without original URL;
- edited/deleted Telegram messages;
- duplicate updates and retries;
- very long AI answers;
- inaccessible/paywalled links;
- screenshots containing secrets;
- prompt injection inside captured pages;
- conflicting new and old knowledge;
- one item relevant to multiple topics/projects;
- copyright-sensitive copied material;
- retention/deletion requests;
- clock/timezone changes and missed digest runs.
