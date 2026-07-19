# OpenViking evaluation

## Evidence

- Official sources: [repository](https://github.com/volcengine/OpenViking), [README](https://github.com/volcengine/OpenViking/blob/main/README.md), [documentation](https://docs.openviking.ai/), accessed 2026-07-19.
- Commit: `379c19f66ea60d91a6beab334900a8f1867c682b`; release `v0.4.10`; AGPL-3.0.
- Official facts: hierarchical `viking://` context filesystem; resource/memory/skill/session concepts; server/CLI; configurable storage, embeddings, VLM, auth, indexing, and reindex modes.
- Repository-history fact: version 0.4.9 was evaluated on 2026-07-15 and remained pilot-only because isolation, backup, migration, outage, and dual-client gates were open.

## Strengths

- Could index future Obsidian/Markdown resources while serving both Hermes and development agents.
- Separates source resources from semantic summaries/indexes.
- Rich navigation and explicit context hierarchy may fit long-term knowledge use better than isolated daily pages.

## Risks

- Young, rapidly changing component; version changed during this research window.
- Requires more services/configuration than current capture problem.
- Embedding/VLM cost and failure paths.
- Identity/peer scopes and automatic memory behaviors can leak or duplicate context if misconfigured.
- No verified direct importer from this pipeline or existing Supermemory corpus.
- Repository indexing overlaps CodeGraph and broadens scope.

## Recommendation

Do not install for MVP. Preserve compatibility through Markdown export and stable IDs. Consider pilot only after:

1. two-week behavior experiment passes;
2. 30+ approved notes exist;
3. FTS retrieval fails measured tests;
4. backup/restore works;
5. actor/peer isolation and deletion pass;
6. embeddings are pinned outside fallback combos;
7. automatic capture/recall starts disabled.

## 9Router placement in future pilot

VLM/query-planning generation may use a designated 9Router route if substitution is acceptable and logged. Dense embeddings remain explicitly pinned by provider/model/dimensions/index generation; fail closed on embedding outage.

## Uncertainty

Current 0.4.10 storage/identity migration behavior, OVPack completeness, Hermes plugin compatibility, and OpenCode overlap need version-pinned tests. Past 0.4.9 findings are historical, not current guarantees.
