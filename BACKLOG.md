# BACKLOG.md

Prioritized list of improvements, ideas, and known issues.
Reviewed each morning. Pick one item and make progress on it.

---

## High Priority

### SecurityBot — insufferable, correct
A dedicated security-focused agent that monitors operations and blocks bad patterns before they
cause damage. Behaviours:
- Intercept secrets shared in group channels and immediately warn + DM the sender
- Block config changes that bypass validation (direct JSON edits)
- Enforce pre-restart health checks
- Rotate exposed tokens automatically
- Separate Discord bot, separate agent, separate workspace, Haiku model
Status: idea

### SummaryBot — BOOT.md hook not firing
The `boot-md` hook registers on `gateway:startup` but no evidence it actually executes BOOT.md
after restarts. Startup notification "OpenClaw started ✅" never arrives.
Investigation needed: does the hook fire before Discord is connected? Does it need a routable
session? Consider cron-based alternative (one-shot at boot + 60s delay).
Status: unresolved, see LEARNINGS.md Issue 8

### SummaryBot token rotation
SummaryBot's token was shared in plain text in #meta-discussions. Should be rotated via
Discord Developer Portal.
Status: needs doing

---

## Medium Priority

### Semantic memory / embeddings
`openclaw doctor` warns that memory search has no embedding provider configured. Semantic recall
(memory_search across MEMORY.md and daily notes) is non-functional. Need to configure one of:
OpenAI, Google, Voyage, or Mistral API key — or a local embedding model.
Status: blocked on API key decision

### SD card write wear
Gateway state, session logs, and cron state all write to SD card (`/dev/mmcblk0p2`). OpenClaw
doctor flagged this. Under sustained session churn this shortens card lifespan.
Options: move OPENCLAW_STATE_DIR to USB SSD, or reduce session churn.
Status: low urgency, monitor

### Startup performance on Pi
`NODE_COMPILE_CACHE` and `OPENCLAW_NO_RESPAWN` not set. Each CLI invocation re-JIT-compiles.
Adds latency on every `openclaw` command and increases startup time.
Fix: add to shell profile or systemd service environment.
Status: quick win, low urgency

---

## Low Priority / Ideas

### SecurityBot implementation
Once idea is validated, actual implementation:
1. Create new agent (`openclaw agents add securitybot`)
2. Write SOUL.md for it: paranoid, terse, blocks first asks questions later
3. Bind to a Discord account with its own bot token
4. Write standing orders covering the security rules above
5. Wire into the message pipeline somehow (needs research on OpenClaw hooks)

### Proper research methodology enforcement
Day 1 finding: "research X" produces a training-data dump, not real research.
Create a reusable research prompt template that enforces web source retrieval.
Document it in AGENTS.md or a dedicated RESEARCH.md.

### Channel cleanup / organization
Consider Discord channel categories to group: meta, development, automated (daily-summary).
Currently all channels at top level.

### Daily summary quality
SummaryBot currently has no access to session history or project context in its isolated workspace.
Its summaries will be generic without either (a) shared context files or (b) reading channel
history before summarizing. Needs proper workspace setup with PROJECT.md + AGENTS.md copied in.

---

## Completed

- [x] requireMention: false server-wide (2026-03-22)
- [x] SummaryBot as separate agent on Haiku (2026-03-22)
- [x] exec approvals set to full (2026-03-22)
- [x] Tailscale reconnected to correct tailnet (2026-03-22)
- [x] LEARNINGS.md written and pushed to git (2026-03-22)
- [x] PROJECT.md cross-channel state file created (2026-03-22)
