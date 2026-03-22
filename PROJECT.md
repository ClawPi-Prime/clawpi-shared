# PROJECT.md - Shared Project State

This file is injected into every session. Keep it up to date so all channel-sessions stay in sync.

## What We're Building

**Legion TD Web** — a browser-based version of Legion TD 2 (tower defense game).
- Research doc: `docs/game-design-research.md`
- Repo: https://github.com/ClawPi-Prime/clawpi-shared

## People

- **Morbror** (Discord: morbror / 120615469127434241) — owner, authorized sender
- **henrike** (Discord: henrike0106 / 1484545661654536206) — team member, authorized for exec approvals

## Discord Server Setup

Server ID: `1485219444426018868`

Channels:
- `#meta-discussions` (1485230521419169842) — project meta, decisions, this kind of stuff
- `#daily-summary` (1485233307477348403) — automated daily summary posted by SummaryBot at 23:59
- `#prototype-discussion` (1485235226514034780) — prototype ideas, progress, demos
- `#requirements-discussion` (1485235227704954892) — scope, specs, priorities

Bots:
- **ClawPi** (default) — main agent, responds in all channels without @mention
- **SummaryBot** — posts daily summaries only, **never responds to messages** (groupPolicy: disabled)

## Cron Jobs

- **daily-summary** — runs at 23:59 Europe/Stockholm, posts to #daily-summary via SummaryBot using claude-haiku-4-5

## Infrastructure

- Raspberry Pi at `100.125.34.2` (Tailscale, clawpiprime@ tailnet)
- Gateway: systemd service on port 18789
- OpenClaw version: 2026.3.13

## Channel Rules

- **#daily-summary (1485233307477348403)** — ClawPi stays silent here. This channel is owned by SummaryBot for automated posts. Do not respond to messages in this channel — return NO_REPLY always.
- **All other channels** — respond normally without requiring @mention

## Key Rules (learned the hard way)

- **NEVER edit the systemd service file** (`~/.config/systemd/user/openclaw-gateway.service`) — OpenClaw owns and regenerates it, any edits will be wiped and can cause outages

- Always run `openclaw doctor` after editing `openclaw.json`, before restarting the gateway
- Use `openclaw config set` instead of raw JSON edits where possible
- Never restart the gateway without validating config first
