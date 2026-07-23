# Architecture diagrams

Status: current diagrams under [system design](../system-design.md).

## Human-only pilot

```mermaid
flowchart LR
    U["User"] --> W["Windows vault: notes and attachments"]
    U --> A["Android vault: notes and attachments"]
    W <--> F["Private FNS server"]
    A <--> F
    W --> V["Independent plain-vault recovery"]
    A --> V
    F --> B["Stopped-service recovery"]
```

Hermes, 9Router, FNS APIs, headless clients, Git automation, and second sync engines are outside this release.

## Authority and copies

```mermaid
flowchart TB
    N["Vault Markdown: canonical notes"] --> S["FNS current-file replication"]
    N --> L["Vault attachment bytes"]
    L --> S
    S --> H["FNS history and trash: convenience"]
    N --> B["Independent vault recovery copy"]
    L --> B
```

Replication is not backup. Product history remains inside FNS failure domain. Independent copy includes actual note and attachment bytes.

## Evidence-gated promotion

```mermaid
flowchart LR
    D["Approved design"] --> P["Synthetic FNS pilot"]
    P --> C{"Conflict, Android, attachment, restore gates pass?"}
    C -- "No" --> X["Stop and preserve copies"]
    X --> F["Evaluate one replacement transport"]
    C -- "Yes" --> O["Seven-day synthetic observation"]
    O --> H{"Human personal-data gate passes?"}
    H -- "No" --> X
    H -- "Yes" --> U["Bounded human personal pilot"]
    U --> G{"Gateway, privacy, transport, and agent gates pass?"}
    G -- "No" --> U
    G -- "Yes" --> A["Synthetic Hermes proposal pilot"]
```

Passing one gate grants only next bounded stage. Human sync never implicitly authorizes agent access.

## Later proposal-only Hermes

```mermaid
flowchart LR
    Q["STAGING/Pending Agent Review"] --> A["Authenticated exact-request receipt"]
    A --> T["Approved transport boundary"]
    T --> H["Hermes narrow workflow"]
    H --> R["9Router generation"]
    H --> P["STAGING/Agent Proposals"]
    P --> U["User records keep, revise, or reject"]
    U --> V["STAGING/Reviewed"]
    V -. "revise only" .-> H
    Q -. "source unchanged" .-> U
```

Existing-note writes, automatic filing, deletion, rename, merge, and link repair remain outside scheduled flow.

## Later proposal state

```mermaid
stateDiagram-v2
    [*] --> Queued
    Queued --> Drafting: source path and hash captured
    Drafting --> Pending: collision-safe proposal created
    Drafting --> Waiting: gateway or provider unavailable
    Waiting --> Drafting: bounded retry
    Drafting --> Failed: validation or policy failure
    Pending --> HumanOwned: user edits review block
    HumanOwned --> Reviewed: user moves proposal
    Reviewed --> Pending: revise creates new identity
    Reviewed --> Kept: keep creates no write
    Reviewed --> Rejected: reject creates no write
    Reviewed --> AwaitingReceipt: later accept after R4A gate
    AwaitingReceipt --> ApplyPlan: authenticated hash-bound confirmation
    ApplyPlan --> Applied: transaction commits once
    ApplyPlan --> RolledBack: write failure restored
    ApplyPlan --> Stale: precondition changed
    ApplyPlan --> RecoveryRequired: rollback or state unknown
    Pending --> Stale: source hash changes

    note right of Pending
      Source remains unchanged
      Proposal is ordinary Markdown
    end note
```

Release 3 has no apply state. Release 4A adds immutable authenticated approval and deterministic transaction only after separate promotion.

## Deferred extensions

```mermaid
flowchart TB
    V["Human vault after proven workflow"] --> N{"Measured need?"}
    N -- "Retrieval failure" --> O["Evaluate OpenViking or embeddings"]
    N -- "Capture friction" --> T["Evaluate Telegram ingestion"]
    N -- "Repeated visual workflow" --> C["Evaluate Canvas automation"]
    N -- "No measured need" --> K["Keep current system"]
```

Deferred components are experiments, not empty boxes waiting for installation.
