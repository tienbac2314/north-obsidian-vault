# Oracle VPS inventory

Status: verified point-in-time facts from read-only inspection on 2026-07-19. Identifiers and endpoints are redacted.

| Component | Observed state | Persistence | Network/model role | Evidence limit |
|---|---|---|---|---|
| Hermes Gateway | Online; Telegram connected; custom model provider | `~/.hermes/` sessions, state, logs, memory files | Telegram agent and orchestration; generation sent to loopback 9Router route | One connected DM observed; capture durability not tested |
| 9Router `0.5.35` | Online under PM2; one restart | SQLite plus WAL/SHM; upgrade snapshots | Central OpenAI-compatible generation gateway with provider/account/model fallback | Failure recovery inferred from config/log signals, not controlled test |
| Supermemory server `0.0.5` | Server and embedded engine running | Encrypted/embedded local data directory | Existing semantic memory service; embedding model pinned outside 9Router | Actual usage quality and restore not tested |
| Cloudflare tunnel | Processes running | Local tunnel state | Publishes selected HTTPS service | Access policy not inspected |
| Legacy Omni components | Tunnel online; hub errored during earlier process snapshot | Separate legacy paths/backups | Not part of proposed pipeline | May be stale and is excluded from architecture |

## 9Router deployment details

- 30 configured provider connections across 7 provider types; 22 active.
- 4 combos, including 2 multi-model combos.
- 5 active proxy pools.
- 1 active client API key.
- 3,800 usage-history rows and 1,000 request-detail rows.
- PM2 logs showed fallback/retry/timeout/rate-limit/auth/5xx activity. Counts prove paths are exercised, not that recovery always succeeds.
- Three migration/upgrade snapshots existed; no recurring backup schedule or off-host copy was verified.

## Network and filesystem findings

- 9Router bound all host interfaces; host UFW was inactive.
- Direct public connection to the service port timed out from one external test network, while HTTPS through the published hostname succeeded with valid TLS.
- This suggests cloud/tunnel controls block direct access, but host defense in depth is weak.
- Secret files were owner-only. Database and directory permissions were broader than owner-only and should be tightened after confirming service user requirements.

## Architecture implication

VPS capacity and existing services make a small capture worker practical. Existing deployment must not dictate MVP boundaries: Telegram update persistence should succeed without Hermes, 9Router, upstream providers, Notion, or Supermemory.

Detailed evidence and uncertainty: [`research-notes/vps-findings.md`](../../research-notes/vps-findings.md).

