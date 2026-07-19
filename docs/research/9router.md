# 9Router evaluation

Status: current centralized AI model gateway; recommended scope is **Proposed**.

## Official evidence

- Sources: [README](https://github.com/decolua/9router/blob/master/README.md), [architecture](https://github.com/decolua/9router/blob/master/docs/ARCHITECTURE.md), [Docker](https://github.com/decolua/9router/blob/master/DOCKER.md), [releases](https://github.com/decolua/9router/releases), accessed 2026-07-19.
- Commit: `0513bf393fb0eedd2baecdadb54b6129976a706c`; release/deployment `v0.5.35`; MIT.
- Verified official capability: OpenAI-compatible API, provider format translation, account-level fallback, model-combo fallback, token refresh, usage tracking, local SQLite persistence, and migration backups.
- Documentation conflict: architecture page dated 2026-02-06 still describes JSON files; current Docker guide and deployment use SQLite. Treat architecture storage section as stale.

## Redacted deployment evidence

- PM2 process online, version 0.5.35.
- Hermes custom provider targets 9Router over loopback `/v1`.
- 30 provider connections/7 provider types; 22 active.
- 4 combos; 2 use multiple models.
- 5 active proxy pools; 1 active client API key.
- SQLite contains request/usage detail; raw values were not inspected.
- Logs show fallback/retry/timeout/rate-limit/auth/5xx activity.
- 3 migration/upgrade snapshots; no recurring or off-host backup verified.
- Service binds all interfaces; UFW inactive; direct public port probe timed out; HTTPS tunnel route works with valid TLS.

## Routing/fallback analysis

9Router is useful where model substitution is acceptable:

- topic/content-type classification;
- source summarization;
- drafting explanations and weekly narratives;
- optional OCR/vision analysis of permitted captures;
- non-critical related-note suggestions.

Fallback is unsafe where stable model identity is data integrity:

- embeddings written into an existing index;
- deterministic evaluation baselines;
- policy/security classification whose behavior must be auditable;
- raw persistence acknowledgments.

Two configured multi-model combos prove substitution is active, not theoretical. Logs prove retries/fallback execute, but do not establish semantic equivalence of outputs.

## Main question

| Option | Benefits | Risks | Decision |
|---|---|---|---|
| All LLM and embedding calls through 9Router | One endpoint, quotas, account fallback, usage view | Embedding drift/corrupt index; broad outage blast radius; less reproducible evaluations | Reject |
| Classification/synthesis generation through 9Router; embeddings pinned directly | Reuses current accounts/fallback where substitution is tolerable; stable vector contract | Two credential paths; generation still unavailable during gateway outage | Recommend |
| No pipeline calls through 9Router | Maximum isolation and reproducibility | Duplicated provider management and wasted existing gateway | Keep as rollback/test mode |

If embeddings ever transit 9Router, use a dedicated exact route with no account/model substitution beyond the same immutable model contract, store provider/model/dimensions/index-generation metadata, and fail closed instead of falling back.

## Failure handling

- Capture transaction contains no 9Router call.
- Processing job records request ID, purpose, route policy, model selected, prompt/schema version, and retry count.
- Retry transport/429/5xx with capped exponential backoff and jitter.
- Do not retry policy/validation errors automatically.
- After retry budget, move to dead letter and surface in digest; raw capture remains available.
- Quality-critical weekly review can require designated model/route; routine classification may use a combo.
- Health status changes scheduling priority, never capture availability.

## Persistence, logging, and backups

- Treat 9Router SQLite, PM2 logs, request details, and provider credentials as sensitive.
- Disable full request logging for private captures; verify setting at runtime rather than assuming absent environment flag is sufficient.
- Add log rotation and retention; store metrics without prompt bodies.
- Tighten DB/directory permissions after testing.
- Add encrypted daily SQLite-consistent backup plus off-host copy and restore drill. Existing upgrade snapshots are not disaster recovery.

## Security risks

- All-interface bind plus inactive host firewall creates reliance on Oracle network/tunnel policy.
- Tunnel access policy and dashboard auth remain unverified.
- Gateway compromise exposes many provider accounts and potentially prompt history.
- Pipeline should use a dedicated scoped 9Router client key and must not expose management API.
- Work-sensitive captures require explicit policy; default deny external processing when classification is uncertain.

## Remaining uncertainty

- Provider fallback order and quality thresholds were not inspected to avoid revealing account/model configuration.
- No controlled outage or restore test was run.
- Request-detail retention and body content remain unverified.
- Direct-port reachability was tested from one network only.

