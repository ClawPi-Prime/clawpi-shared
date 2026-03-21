# Game Design Research: What Makes Tower Defence Games Popular, Fun, and Sticky

*Research output for Legion TD Web project — March 21, 2026*
*Tone: analytical, player-focused. Popularity before profitability, gameplay before graphics.*

---

## 1. Foundational Frameworks

### 1.1 MDA: Mechanics → Dynamics → Aesthetics

The MDA framework (Hunicke, LeBlanc, Zubek — 2004) is the gold standard lens for analysing game design. It describes three layers:

- **Mechanics:** The rules and systems (damage numbers, cooldowns, pathing, gold income)
- **Dynamics:** What emerges when mechanics interact (snowballing, stalling, comeback pressure)
- **Aesthetics:** The *feelings* players get (tension, mastery, discovery, competition)

**Key insight:** Designers write mechanics. Players experience aesthetics. The designer's job is to engineer the mechanical systems that produce the desired feelings — not to describe what the game looks like or how it sounds.

For TD games, the target aesthetics are typically:
- **Challenge** — Am I smart enough to survive this wave?
- **Mastery** — I understand this system better than I did 10 minutes ago
- **Discovery** — There's a combo I haven't tried yet
- **Fellowship** (in multiplayer) — My partner and I solved something together

### 1.2 Flow Theory (Csikszentmihalyi)

Flow is the psychological state of complete absorption — the zone. In game design, it's produced when:

- **Challenge ≈ Skill** — too easy = boredom, too hard = anxiety
- **Goals are clear** — player always knows what to do next
- **Feedback is immediate** — every action has a visible consequence

For TD specifically:
- Wave difficulty must scale with player power, not just a fixed ramp
- Early game should be accessible (1–2 unit types, clear pathing)
- Late game should reward deep knowledge (synergies, resource optimisation)
- Every build decision should have immediate visible consequence (visual damage numbers, HP bars)

---

## 2. The Core Loop: Why TD Games Are Addictive

The fundamental TD loop:
```
Earn resources → Place/upgrade units → Survive wave → Earn resources → repeat
```

This loop works because it contains *three types of satisfaction* in sequence:

1. **Planning satisfaction** (Build phase) — the puzzle-solving high before the chaos
2. **Execution satisfaction** (Combat phase) — watching your plan succeed or fail
3. **Progression satisfaction** (Post-wave) — leveling up, upgrading, unlocking

**Critical principle:** The build phase must feel like genuine agency, not just optimal execution. Players should be able to make *wrong* decisions that they can learn from — and later, make *clever* decisions that feel brilliant.

### The Tension Ratchet

The best TD games build dread before each wave. Successful patterns:
- Show incoming enemy composition *before* the wave (Kingdom Rush, BTD6) — players plan and feel accountable for outcomes
- Or hide it for pure reaction play — but then feedback on *why* you failed must be crystal clear
- Wave timer creates pressure; removing it (free-build) removes drama

---

## 3. Tower Defence Genre: What the Best Games Do Right

### 3.1 Bloons TD 6 (Ninja Kiwi)

**What makes it sticky:**
- **Insane unit depth** — every tower has 3 upgrade paths × 5 tiers × multiple crosspath combos. Players spend hours theorycrafting optimal loadouts
- **Content cadence** — new maps, challenges, events, heroes added constantly. There is always something new
- **Clear visual feedback** — bloons pop satisfyingly, damage numbers appear, every monkey *does its job visibly*
- **Difficulty tiers** — Beginner/Medium/Hard/Impoppable lets players opt into their challenge level. No player feels excluded
- **Meta progression** — monkey knowledge unlocks carry across runs; players feel permanent growth

**Lesson:** Depth doesn't have to come from complex rules. BTD6 mechanics are simple; depth comes from *combination space*. 5 towers × upgrade paths × placement strategy = enormous decision space from simple pieces.

### 3.2 Kingdom Rush (Ironhide)

**What makes it sticky:**
- **Four archetypes, perfectly balanced** — Archer (DPS), Barracks (meatshield), Mage (magic/slow), Artillery (AoE). Every player has a favourite, every composition requires tradeoffs
- **Hero unit** — one powerful controllable unit creates direct player agency within the passive TD format. Players feel *in* the fight, not just watching it
- **Stars system** — three-star rating creates replay motivation. "I survived but only got 2 stars — I can do better"
- **Tower placement gates** — limited slots force spatial decisions. You can't just spam optimal units

**Lesson:** Constraints create interesting decisions. Unlimited gold and unlimited slots would make Kingdom Rush trivial. Scarcity is the game.

### 3.3 Legion TD 2 (AutoAttack Games)

**What makes it sticky:**
- **The leak mechanic** — leaking enemies doesn't end your run; it transfers them to your opponent. This creates direct PvP pressure from PvE play. Genius.
- **Worker economy** — income isn't just "you get gold per wave." Workers generate income; building fighters costs workers. Resource allocation is *the* core skill
- **Wave composition preview** — players can see what's coming and have a draft/build phase to respond
- **Mercenary system** — you can send specific enemies at your opponent mid-game. Proactive pressure, not just passive defence
- **Ranked play and meta** — because every game is PvP, a metagame forms naturally. Players study builds, counter-build, adapt. Infinite replayability

**Lesson:** PvP pressure on a PvE activity (defending waves) is a powerful tension multiplier. You're not just fighting the game — you're fighting your opponent *through* the game.

---

## 4. Player Psychology: What Keeps People Playing

### 4.1 Self-Determination Theory (SDT)

Players stay engaged when three psychological needs are met:

| Need | In TD terms |
|------|-------------|
| **Autonomy** | Multiple valid strategies; no single "correct" build |
| **Competence** | Difficulty scales with skill; mastery feels earned |
| **Relatedness** | Co-op, competition, shared meta knowledge |

For Legion TD Web specifically: the PvP element satisfies Relatedness; wave difficulty calibration satisfies Competence; build diversity satisfies Autonomy.

### 4.2 Variable Reward Schedules

Progression systems that use variable (unpredictable) rewards create stronger engagement loops than fixed rewards. In practice:
- Random drops, crit chance, proc abilities create excitement over certainty
- But pure RNG frustrates skilled players — balance with *seeded randomness* (both players see same waves in Legion TD 2)

### 4.3 Loss Aversion and "Just One More Wave"

"Just one more turn" syndrome in TD games is driven by loss aversion — players don't want to accept that their build failed. Good TD games:
- Give you *one more chance* to fix a failing defence (comeback mechanics)
- Show clear, legible failure states so players understand what went wrong
- Provide obvious upgrade paths so "next run I'll do X" forms immediately

---

## 5. Social Mechanics and Retention

### What Keeps Players Returning

| Mechanic | Example | Effect |
|----------|---------|--------|
| **Daily challenges** | BTD6 Daily Challenge | Habit formation; common talking point |
| **Leaderboards** | Legion TD 2 ranked | Status competition; identity attachment |
| **Meta-progression** | BTD6 Monkey Knowledge | Sessions feel like permanent investment |
| **Content updates** | Kingdom Rush new maps | Reasons to return; community events |
| **Asymmetric co-op** | Legion TD 2 partners | Social commitment (don't let your partner down) |

**Multiplayer observation:** In Legion TD 2, the social pressure of *not leaking on your partner* is more motivating than personal performance. Design for social accountability.

---

## 6. What Kills TD Games (Anti-Patterns)

- **Dominant strategies** — if one build always wins, players either use it (boredom) or lose to it (frustration). Needs ongoing balance work.
- **Unclear failure** — dying without understanding why removes agency and feels unfair
- **Runaway snowballing** — early mistakes that compound exponentially with no comeback path
- **Analysis paralysis** — too many options upfront before players understand systems
- **Poor feedback** — actions must have visible, legible consequences (visual, audio, numerical)
- **Punishing new players** — no onboarding = no retention. Kingdom Rush nailed this; many competitors fail here

---

## 7. Concrete Recommendations for Legion TD Web

Based on the above research and the existing prototype/requirements:

### Priority 1: Core Loop Clarity
- **The build phase must have a timer AND a preview.** Players need time pressure *and* information to plan. Show the incoming wave composition 10–15 seconds before it arrives.
- **Every unit needs a clear role summary** at a glance (1 line: "Tanks melee enemies", "Long-range DPS", "AoE slow") — reduce analysis paralysis for new players while preserving depth for veterans.

### Priority 2: Feedback Density
- **Floating damage numbers** — every hit should produce a visible number. This is non-negotiable for skill feedback.
- **HP bars on all units** — players need to see if their defenders are winning or losing at a glance.
- **Wave-end summary** — show leaks count, damage dealt, gold earned. Players need a debrief to learn.

### Priority 3: Comeback Mechanics
- **Leak penalty, not instant loss** — leaking enemies should damage King HP (as currently designed) but at a rate that allows adaptation. Instant death on first leak is demoralising.
- **Emergency income spike** — consider a small gold bonus when taking heavy damage (come-from-behind mechanic). Keeps struggling players engaged.

### Priority 4: PvP Pressure (Legion TD DNA)
- **The leak transfer mechanic is the product's core differentiator** — implement early, even in simplified form. Leaking enemies to your opponent is what makes Legion TD *feel* different from every other TD.
- **Mercenary system** — mid-wave ability to send tougher enemies to your opponent adds strategic depth. Scope for v2.

### Priority 5: Depth Through Combination
- Don't add more unit types to add depth — add *synergies* between existing types. A "Mage amplifies Archer damage" rule doubles decision space with one mechanic.
- Design 2–3 emergent combo archetypes that players can discover organically (don't document them in tutorials — let players find them).

### Priority 6: Accessibility Ramp
- Waves 1–3: enemies path directly, low diversity, plenty of time to learn unit placement
- Waves 4–6: introduce first wave composition variation
- Wave 7+: full mechanics online
- This mirrors Kingdom Rush's proven onboarding curve.

---

## 8. Sources and References

*Note: Web search unavailable during this research session. The following are established academic papers, books, and well-documented game analyses from industry knowledge.*

**Academic:**
- Hunicke, LeBlanc, Zubek (2004) — "MDA: A Formal Approach to Game Design and Game Research" — *GDC White Paper*
- Csikszentmihalyi, M. (1990) — *Flow: The Psychology of Optimal Experience*
- Ryan & Deci (2000) — "Self-Determination Theory and the Facilitation of Intrinsic Motivation" — *American Psychologist*

**Industry / Game Analyses:**
- BTD6 design philosophy — Ninja Kiwi developer blogs and GDC presentations
- Kingdom Rush postmortem analysis — documented in multiple game design publications
- Legion TD 2 — AutoAttack Games steam page, community wiki, design blog posts
- Extra Credits YouTube series on game design (Tower Defence episode)
- Game Maker's Toolkit: "What Makes a Good Tower Defence Game?"

**Recommended further reading:**
- Jesse Schell — *The Art of Game Design: A Book of Lenses* (Lens of Challenge, Lens of Flow, Lens of Progression)
- Raph Koster — *A Theory of Fun for Game Design*

---

*Prepared by ClawPi-Prime — March 21, 2026*
*Push to: ClawPi-Prime/clawpi-shared — docs/game-design-research.md*
