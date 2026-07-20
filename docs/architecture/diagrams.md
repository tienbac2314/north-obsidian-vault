# Architecture diagrams

## First release

```mermaid
flowchart LR
    U["User"] --> O["Obsidian clients"]
    O <--> S["One validated free sync"]
    S <--> V["VPS vault replica"]
    V --> G["Git audit"]
    V --> B["Encrypted off-host backup"]
    V --> Q["Pending Agent Review"]
    Q --> H["Hermes"]
    H --> R["9Router generation"]
    H --> P["Proposal artifact"]
    P --> A["Deterministic approval/apply"]
    A --> V
```

## Optional later services

```mermaid
flowchart LR
    T["Telegram"] --> I[("SQLite WAL ingress")]
    I --> H["Hermes worker"]
    H --> P["Vault proposal"]
    V["Canonical vault"] --> M["Projection manifest"]
    M --> X["OpenViking derived context"]
    X --> H
    H --> R["9Router generation/VLM"]
    E["Pinned embedding endpoint"] --> X
```

## Proposal state

```mermaid
stateDiagram-v2
    [*] --> Queued
    Queued --> Drafting
    Drafting --> Proposed
    Drafting --> Failed
    Proposed --> Rejected
    Proposed --> Stale: base hash changed
    Proposed --> Approved
    Approved --> Applying
    Applying --> Applied: atomic write and validation
    Applying --> Stale: hash mismatch
    Applying --> Failed
    Applied --> Committed: Git commit succeeds
    Applied --> Reconcile: Git commit fails
    Reconcile --> Committed
```

## Authority and derivation

```mermaid
flowchart TB
    V["Obsidian vault: canonical"] --> P["OpenViking projection: rebuildable"]
    V --> G["Git history: audit"]
    V --> B["Encrypted backup: recovery"]
    P --> H["Hermes context"]
    H --> Q["Proposal only"]
    Q --> V
```

Sync copies canonical bytes. Git records history. Backup recovers data. OpenViking derives context. None grants Hermes authority.

## Telegram availability boundary

```mermaid
flowchart TB
    T["Telegram update"] --> I["Allowlist and idempotency"]
    I --> D[("SQLite durable commit")]
    D --> A["Saved"]
    D --> J["Async job"]
    J --> H["Hermes"]
    H --> R["9Router/upstream"]
    H --> V["Vault proposal"]
```

For text/link, full-synchronous SQLite commit precedes `Saved`. Media first confirms durable metadata/pending attachment; final confirmation follows durable bytes/checksum. Every model/agent component may fail and retry.
