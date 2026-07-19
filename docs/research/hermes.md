# Hermes Agent evaluation

## Evidence

- Official repository: [NousResearch/hermes-agent](https://github.com/NousResearch/hermes-agent), accessed 2026-07-19.
- Commit: `e598cef87465981fcea1c0339edfcf5d9716c917`; latest release observed `v2026.7.7.2`.
- Official facts: one Gateway process supports multiple messaging channels; custom model endpoints, cron jobs, local session search, built-in memory, and one external memory provider are supported.
- Deployment facts: Gateway/Telegram connected; provider `custom`; loopback `/v1` route to 9Router; Telegram toolsets include files, vision, memory, cron, web, and code execution.

## Candidate roles

| Role | Fit | Risk |
|---|---|---|
| Raw Telegram adapter | Possible, pending hook/ack audit | Conversational execution may start before durable capture |
| Classifier/synthesizer | Strong | Agent tool breadth is unnecessary for simple deterministic transforms |
| Scheduler/digest sender | Strong | Cron state and delivery need monitoring/idempotency |
| Knowledge store | Weak | Session/memory semantics do not preserve complete raw provenance by default |
| Orchestrator for future tools | Strong | Can become central coupling point if interfaces are implicit |

## Recommendation

Use Hermes as replaceable processor/orchestrator after capture persistence. Prefer a small explicit command or job contract:

```text
process(capture_group_id, schema_version, prompt_version) -> synthesis_candidate
publish(digest_id, destination) -> delivery_receipt
```

Do not grant processor permission to mutate raw captures. Run with least-required toolsets and separate workplace-sensitive policy.

## Alternatives

- Direct 9Router worker: simpler and more deterministic for classification/synthesis.
- Hermes skill/plugin: easier scheduling, vision, and conversational correction.
- Hybrid: thin capture worker plus Hermes cron/processing; recommended first integration experiment.

## Uncertainty

Installed Hermes source must be reviewed for a pre-agent ingestion hook, polling offset semantics, cron retry policy, and safe per-task tool restrictions before implementation.

