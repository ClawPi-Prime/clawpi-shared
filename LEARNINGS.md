# LEARNINGS.md

Operational lessons from running an AI agent (Claude Sonnet 4.6 on Raspberry Pi via OpenClaw)
as an autonomous engineering collaborator. Written from first principles. Updated continuously.

---

## Issue 1: AI research methodology is not human research methodology

**Date:** 2026-03-21  
**Discovered by:** Isac

**What happened:**  
Agent was tasked with "research game design principles — what makes games popular, fun, and sticky."
Produced a polished report with citations and references. Output looked authoritative. It was entirely
drawn from training data. No sources were actually retrieved, read, or verified.

**Root cause:**  
"Research" is ambiguous. To a human: find sources, read them, evaluate them, synthesize them.
To an LLM: generate a confident-sounding summary of what you already know. Both outputs look
identical from the outside. The gap is invisible until you interrogate the methodology.

**Solution:**  
Task definitions for knowledge work must specify *how*, not just *what*. Not "research X" but
"search the web for X, read the top results, and synthesize from those sources." The agent needs
to be told when real source retrieval is required vs. internal knowledge is acceptable.

**Broader implication:**  
Any deliverable that looks plausible regardless of whether real work was done is a risk. This
applies to research, security audits, dependency checks. Verify methodology, not just output.

---

## Issue 2: Config schema mutations break the gateway

**Date:** 2026-03-22  
**Triggered by:** Adding SummaryBot (second Discord account) via manual JSON editing

**What happened:**  
Manually added `requireMention` to account-level config blocks in `openclaw.json`. When OpenClaw
migrated to multi-account format, `requireMention` is a guild-level key, not an account-level key.
Gateway refused to start with a schema validation error.

**Root cause:**  
Directly editing `openclaw.json` bypasses schema validation. OpenClaw's config schema evolves;
keys that are valid at one nesting level are rejected at another. The agent assumed structural
parity between single-account and multi-account configs — wrong assumption.

**Solution:**  
Run `openclaw config set <path> <value>` for all config mutations. It validates before writing.
After any direct JSON edit (unavoidable in some cases), run `openclaw doctor` before restarting
the gateway. If doctor reports errors, fix them before proceeding.

**Rule:**  
Validate → Fix → Restart. Never Restart → Validate.

---

## Issue 3: openclaw gateway restart exits with code 1 — but the gateway is fine

**Date:** 2026-03-22  
**Discovered by:** observing misleading exit codes

**What happened:**  
`openclaw gateway restart` consistently exits with code 1. This caused false alarms — the agent
repeatedly checked and re-checked gateway health, assuming failure.

**Root cause:**  
The restart command signals the gateway process and exits before the new process is confirmed up.
The exit code reflects the signal delivery, not the gateway health. It is structurally 1 even on
clean restarts.

**Solution:**  
After `openclaw gateway restart`, always follow up with `openclaw gateway status` to confirm
`RPC probe: ok`. The exit code of the restart command itself is meaningless.

---

## Issue 4: Editing the systemd service file causes a 3-hour outage

**Date:** 2026-03-22  
**Caused by:** Agent

**What happened:**  
Attempted to add an `ExecStartPost` directive to `~/.config/systemd/user/openclaw-gateway.service`
to send a Discord notification on startup. Gateway stopped responding. Morbror manually fixed it
3 hours later after returning home.

**Root cause:**  
OpenClaw owns the systemd service file and regenerates it on gateway operations. Any manual edit
is silently overwritten. The modified file caused `systemctl` validation or restart to fail. Because
the agent had no visibility into the failure (it was down), it could not self-recover.

**Solution:**  
Never touch the systemd service file. It is OpenClaw's file. Use supported extension points:
- Startup actions → `BOOT.md` hook (gateway:startup event)
- Pre-restart notifications → wrapper shell script that sends notification then calls `openclaw gateway restart`

**Rule:**  
Do not edit files owned by the runtime. If you need behaviour from a file you don't own,
use the official hook/extension system.

---

## Issue 5: Cross-channel context isolation causes confusion

**Date:** 2026-03-22  
**Discovered by:** Morbror

**What happened:**  
Agent responded in another channel claiming SummaryBot didn't exist. SummaryBot had been set up
earlier in #meta-discussions. The agent in the other channel had no knowledge of it because
OpenClaw creates isolated sessions per channel.

**Root cause:**  
OpenClaw session keys are scoped to channel (`agent:main:discord:channel:<id>`). Each channel
starts fresh. The agent knew about SummaryBot in #meta-discussions but not in any other channel.
MEMORY.md is intentionally excluded from group chats (security boundary).

**Solution:**  
`PROJECT.md` in the workspace root, injected into every session via `AGENTS.md` startup sequence.
Critical infrastructure, decisions, and people go in PROJECT.md immediately when established.
Not "I'll document it later" — write it before the conversation ends.

**Rule:**  
If it happened in one channel and needs to be known everywhere, write it to PROJECT.md now.
Assume every other session has amnesia.

---

## Issue 6: exec allowlist mode doesn't cover shell-dispatched binaries

**Date:** 2026-03-22  
**Discovered by:** repeated exec denials despite allowlist entries for `/usr/bin/curl` etc.

**What happened:**  
Set `security: allowlist` with glob entries for `/usr/bin/*`, `/bin/*`, etc. Shell commands
continued to be denied with "allowlist miss." Direct binary invocations (e.g. `/usr/bin/curl ...`)
were also denied.

**Root cause:**  
OpenClaw's allowlist matches against the *resolved binary path of the command*, but shell
invocations (bash/sh) are the parent — the exec system checks what's being invoked, not what
runs inside the shell. Glob patterns in exec-approvals.json don't cover all invocation paths.
The `security: full` setting is the only reliable way to remove friction entirely.

**Solution:**  
For a trusted operator environment (single owner, self-hosted), `security: full` in
exec-approvals.json plus `tools.exec.security: full` in openclaw.json. This matches the
actual trust model — we own the machine, we trust the agent.

**Trade-off:**  
Full security mode means no guardrail between agent and OS. Acceptable here. Would not be
acceptable in a multi-user or untrusted environment.

---

## Issue 7: Bot token exposed in group chat

**Date:** 2026-03-22

**What happened:**  
SummaryBot's bot token was shared by Morbror in plain text in #meta-discussions (a group channel).
The token is now potentially visible to anyone who can see that channel's history.

**Root cause:**  
No established protocol for sharing secrets. Token was shared conversationally without thinking
about channel visibility.

**Solution (immediate):**  
Tokens that appear in chat should be rotated via Discord Developer Portal. Anyone with the token
can impersonate the bot.

**Solution (process):**  
Secrets go to the agent via DM only, or set directly on the machine via SSH. Never in group channels.
Agent should proactively remind users of this when they're about to share credentials.

---

## Issue 8: BOOT.md hook registers but does not fire

**Date:** 2026-03-22  
**Status:** Unresolved

**What happened:**  
Enabled the `boot-md` hook. Logs confirm it registers against `gateway:startup`. After restarts,
no evidence in logs of the hook actually executing BOOT.md or the agent acting on it.

**Root cause (hypothesis):**  
The `gateway:startup` event may fire before the Discord connection is fully established. The agent
can't send a Discord message if the channel isn't connected yet. Or the hook fires into a session
that isn't routed anywhere observable.

**Current state:**  
Startup notification via BOOT.md is not working. The restart warning via wrapper script works
(sends curl to Discord API before calling gateway restart).

**Next steps:**  
Investigate if boot-md fires into main session and whether that session has a Discord route
available. May need to add a short sleep or use a cron job (fire once at boot + 1min delay)
as an alternative.

---

## Issue 9: Force pushing to main wiped the prototype

**Date:** 2026-03-22 / discovered 2026-03-23  
**Caused by:** Agent

**What happened:**  
The workspace git repo was committing to `master` while GitHub's default branch was `main` (with
different history). To align them, force pushed `master` to `main`. The old `main` contained
`index.html` (the Legion TD prototype served via GitHub Pages). Force push overwrote it.
Prototype returned 404 the next morning.

**Root cause:**  
Did not inspect the contents of the remote branch before force pushing. Assumed `main` was empty
or equivalent. It wasn't — it had real content being actively served.

**Solution:**  
Recovered `index.html` from git history (`git show <sha>:index.html`) and committed it back.

**Rule:**  
Before `git push --force`, always inspect what's on the remote branch:
`git fetch && git log origin/<branch> --oneline -10`
Never assume a remote branch is empty or irrelevant.

---

## General Principles Extracted

**On infrastructure changes:**
- Validate config before every restart, no exceptions
- Never modify files owned by the runtime (systemd service, OpenClaw internals)
- Test changes in the smallest possible scope before restarting the gateway
- Iterate slowly on infra; fast iteration is for code, not for services you depend on to stay alive

**On task definitions for AI agents:**
- Specify methodology, not just outcome
- For research tasks: require actual source retrieval
- For infra tasks: require validation steps before destructive actions
- Ambiguous instructions produce plausible-but-wrong outputs

**On secrets and credentials:**
- Secrets over DM or SSH only, never group channels
- Rotate any token shared in a group channel immediately
- Credentials in TOOLS.md (private workspace file) only

**On context and memory:**
- Each channel session starts fresh
- PROJECT.md is the cross-channel memory — update it aggressively
- If a decision was made, write it down before the conversation ends
