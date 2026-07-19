# Supermemory evaluation

## Evidence

- Official sources: [changelog](https://supermemory.ai/changelog/), [how it works](https://supermemory.ai/docs/concepts/how-it-works), [ingestion](https://supermemory.ai/docs/add-memories), [search](https://supermemory.ai/docs/search), accessed 2026-07-19.
- Repository commit: `566be208981aa23ef20a85fd50a737861b1b10b2`; local release `server-v0.0.5`.
- Official facts: raw documents and extracted memories are distinct; `customId` supports deduplication/update; hybrid search combines memories/chunks; local embeddings are pluggable but model choice is locked for vector consistency.
- Deployment fact: running local server 0.0.5 uses pinned `gemini-embedding-2-preview`, 768 dimensions, outside 9Router hostname.

## Strengths

- Existing self-hosted deployment and Hermes support.
- Automated extraction, temporal/user profile concepts, semantic/hybrid retrieval.
- Pinned embedding safeguards align with data-integrity requirement.

## Weaknesses for current problem

- User already reports low enjoyment/value.
- Automatic memory extraction may turn copied source text into decontextualized claims.
- Retrieval quality, provenance, correction, export, and restore are unmeasured.
- Adds model/index dependency before raw capture and review habit are validated.

## Options

- **Critical path:** reject; capture must not depend on it.
- **Shadow index:** promising experiment after 30+ captures; ingest only approved durable notes with stable IDs.
- **Hermes global memory provider:** postpone; automatic context can confound pipeline evaluation and duplicate notes.
- **Migration source:** preserve existing instance read-only until export/restore is proven.

## Evaluation protocol

Use same approved corpus and eight-query retrieval set against SQLite FTS and Supermemory hybrid search. Measure top-five relevance, source traceability, latency, correction/deletion, and operator effort. Do not compare vendor benchmark claims with this personal corpus.

## Recommendation

Keep running service untouched. Do not send all raw captures. If shadow test beats FTS materially, use Supermemory as derived search index; SQLite/files remain truth.

## Remaining uncertainty

Local server backup/restore, logical export, telemetry setting, content encryption, and exact provenance returned by APIs require a separate non-sensitive test.

