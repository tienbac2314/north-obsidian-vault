# Release-one security contract

Status: current security contract under [system design](../system-design.md).

Security goal is bounded trust, recoverability, and visible failure. No plugin scorecard or self-hosting label removes need to test server, configuration, credentials, data exposure, and recovery.

## Assets and trust boundaries

| Asset | Current trusted writer | Main risk |
|---|---|---|
| Human Markdown | User through Obsidian | Sync conflict, accidental delete, compromised peer |
| Vault attachments | User through normal Obsidian capture | Silent move/delete, incomplete replication, large-file stall |
| FNS server state | FNS service | Readable vault content, broad token scope, database loss |
| FNS credentials | Obsidian clients and operator | Cross-vault access or unintended reuse |
| Independent recovery copy | User-controlled recovery process | Stale/incomplete copy or credential inclusion |
| Later queued source | User-authorized Hermes workflow | Prompt injection, context widening, provider disclosure |
| 9Router route/log state | Existing gateway | Raw body retention, provider/account blast radius |

Obsidian community plugins, FNS server, Android background behavior, copied web/AI text, Markdown links, later model output, and future external writers are untrusted inputs even when intentionally installed.

## FNS controls

- Use isolated synthetic vault and disposable account until promotion.
- Pin plugin and server releases for each test cycle; record public versions.
- Bind service port to loopback and expose only through dedicated TLS tunnel ingress. Keep existing tunnel routes and processes unchanged.
- Disable public registration after controlled bootstrap.
- Use unique credentials for pilot; never reuse Hermes, 9Router, backup, or other service keys.
- Keep server database, config, backups, logs, tokens, endpoints, and account identifiers outside repository.
- Disable FNS MCP, REST consumers, Git automation, filesystem mirror, sharing, and third-party headless clients.
- Disable configuration sync until safe cross-platform subset is proven.
- Keep Cloud Preview automatic local deletion off.
- Test vault-token isolation and external-file survival before any API or agent promotion.

Passed Obsidian Review applies to plugin artifact only. It does not establish server least privilege, runtime isolation, conflict correctness, or backup quality.

## Attachment controls

- Use normal vault-relative Obsidian links or embeds on both clients.
- Keep every live attachment byte inside vault and synchronized only by FNS.
- Keep Cloud Preview automatic local deletion off.
- Do not install Drive, S3, CDN, external-folder, or whole-vault cloud plugin as live attachment path.
- Test platform-native Windows and Android capture, rename, move, delete, duplicate, interrupted transfer, large files, Android background behavior, and independent restore.
- Keep original external source until first cross-device byte comparison passes for important material.

This removes public object URLs and split attachment credentials, but FNS server still receives readable bytes. Native link visibility does not prove peer convergence or independent recoverability.

## Sync and backup separation

- Run one whole-vault transport only.
- Stop client activity before consistent FNS service copy.
- Store independent copy outside FNS server and synchronized vault.
- Never use backup command with delete, purge, or mirror semantics against recovery destination.
- Restore into empty isolated path; never test by overwriting only surviving copy.
- Verify notes, attachments, product history/trash evidence, and rebuilt client.
- Keep backup credentials and encryption material outside VPS and repository when encryption is used.

## Later Hermes boundary

Human-sync success does not authorize agent access. Later controls must include:

- exact path allowlist limited to pending source and proposal destination;
- synchronized queue placement records intent but cannot prove human identity;
- provider read requires exact queued request plus authenticated approval receipt outside synchronized vault;
- no generic destructive shell over vault;
- copied note content treated as inert data;
- no source-controlled tool calls, credentials, target paths, research requests, or policy changes;
- scheduled create-only proposal behavior;
- existing-note edit only by authenticated interactive confirmation bound to exact immutable reviewed bytes and fresh target read;
- separate Hermes/FNS/backup/9Router credentials;
- visible failure that leaves source and queue unchanged;
- synthetic prompt-injection and path-boundary tests.

Prompt policy is not OS sandbox. Transport and filesystem boundaries must still be proven before real notes.

### Approved apply and link gardening later

Release 4A broadens scheduled reads and permits reviewed writes only after separate promotion:

- exact allowlist for changed-note scan; deny SYSTEM, STAGING history, attachments, archive, and private roots;
- one weekly scan plus manual on-demand; no daily full-vault scan;
- filename, alias, existing-link, tag, and plain-text candidate search before derived retrieval;
- full proposal or digest review moved to `STAGING/Reviewed` before any apply;
- in-vault decision and movement record intent only because any synchronized writer could forge them;
- authenticated one-time confirmation outside vault binds exact reviewed SHA-256, plan hash, workflow version, session, and expiry;
- changed plan fields require replacement proposal; accepted overrides are prohibited;
- exact destination, target paths, target hashes, and displayed patches form immutable plan;
- deterministic non-model executor canonicalizes paths, creates preimages, obtains compare-and-swap or exclusive maintenance window, fresh-reads immediately before atomic write, journals executor postimages, verifies post-write hashes, and rolls back only while current bytes still equal executor postimage;
- stale or missing target stops affected item;
- no target discovery during apply;
- additive link edits only in first promotion;
- no automatic source delete, arbitrary prose rewrite, schedule change, or global preference learning;
- rebuildable external checkpoint contains hashes and paths, never note bodies or credentials.

Link-gardening note content remains untrusted. It cannot widen scan roots, select providers or tools, or authorize its own patch.

### Path containment

All workflow paths use vault-relative forward-slash form and Unicode NFC identity. Reject absolute, UNC, device, drive-qualified, empty-segment, `.`, `..`, backslash, colon, control-character, trailing-dot/space, Windows reserved-name, symlink, junction, and reparse-point paths. Reject case-fold or Unicode-normalization collisions across Windows and Android. Resolve every existing parent and require final resolved path remain beneath exact allowlisted root. New destination must have existing contained parent. Proposal text never supplies policy root.

### Approval receipts and recovery material

Approval receipt lives outside vault, FNS, repository, proposal content, and model context. It contains identity and hashes only. Unused receipt expires after 15 minutes; used receipt and transaction journal remain 90 days. Preimage recovery bundle contains private note bytes, so store it outside synchronized vault under same or stronger access and encryption boundary as independent recovery. Retain preimages at least 30 days and until one verified independent recovery copy includes post-state, whichever is later. Failed or unknown state retains evidence until human recovery. Verified deletion records count and date without paths or note content. Unknown transaction state or failed rollback revokes executor until human recovery.

## 9Router and gateway controls later

- Resolve mixed PM2/process/user-systemd state to one authoritative supervisor before vault workload.
- Use loopback gateway path and environment-backed credentials.
- Register only model IDs returned by live `/models`; do not invent context limits.
- Choose one validated proposal model before enabling fallback routes.
- Verify request/response body retention, headers, provider logging, database permissions, public bind, and log rotation.
- Queue no employer or private content until provider policy is explicit.
- Gateway or provider outage leaves source unchanged and does not block Obsidian or sync.

## Repository controls

- Commit no credentials, private endpoints, provider/account identifiers, raw logs, databases, dumps, archives, OAuth data, or personal note content.
- Research records use public versions, sanitized counts, error categories, and pass/fail.
- Source links sit beside claims; community reports remain anecdotal.
- Current authority, research evidence, generated work, and archive stay visibly separated.

## Security acceptance tests

1. Raw FNS port is unreachable publicly; TLS route works.
2. Registration closes after bootstrap and rejects uncontrolled second account.
3. Pilot credential cannot cross vault boundary in direct test.
4. External synthetic file survives any proposed agent/headless transport test.
5. Case-only rename, same-note conflict, delete, folder move, and server restart produce no silent loss.
6. FNS database restores into empty environment and rebuilds one client.
7. No separate attachment-plugin credential or public remote URL enters vault, FNS config sync, Git, logs, or archive.
8. Native attachments remain local, open on both clients, and match expected bytes after interrupted and background transfers.
9. Large-file failure stays visible and preserves original source; no second service hides it.
10. Independent restore works without primary device or live FNS database.
11. Release 3 note outside pending queue causes zero Hermes/9Router request.
12. Later prompt-injection fixture cannot invoke tools, widen context, expose secret, or mutate source.
13. Reviewed accepted plan changes only exact destination and listed targets whose hashes still match.
14. Weekly link gardener reads only changed allowlisted notes and narrow candidates; denied-path fixture causes zero provider request.
15. Repeated digest or apply run creates no duplicate effective patch; stale target remains unchanged and reports visible failure.

## Residual risks

- FNS server can read synchronized notes and attachments.
- Compromised enrolled device or FNS service can propagate harmful changes.
- FNS product history may share failure domain with live database.
- Large attachments may be slow, storage-heavy, or unreliable through FNS until physical tests pass.
- Android may delay background synchronization.
- External providers later receive explicitly queued content under their retention policies.
- Independent backup reduces loss risk but is not immutable unless implemented and tested that way.
