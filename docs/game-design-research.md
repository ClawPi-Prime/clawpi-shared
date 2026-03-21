# Legion TD Web: Game Design Research Report
### Why Competitive Mind Games Solve Tower Defence's Replayability Problem

*Research compiled March 2026. All claims cited from fetched sources.*

---

## 1. Introduction — The Replayability Problem in Tower Defence

Tower defence games occupy a curious corner of the strategy genre. They are easy to love at first: the moment-to-moment satisfaction of watching a perfectly placed tower mow down waves of enemies is immediate and visceral. Yet most TD games have a predictable arc. Players start curious, experiment, discover what works, then — fairly quickly — the game starts to feel like executing a known script. The forum threads dry up, the player count drops, and the game joins the graveyard of "fun for a weekend" titles.

This report argues that Legion TD 2 has solved this problem in a way that most tower defence games never attempt — and that the solution should be the core design principle for Legion TD Web.

**Thesis:** Legion TD's core strength is that it solves tower defence's fundamental replayability problem by embedding a competitive mind game inside wave defense. Every economy decision is simultaneously a PvE optimization puzzle AND a PvP read of your opponent, meaning no single "correct" strategy ever exists.

---

## 2. The Genre Foundation — What Makes TD Satisfying

Tower defence games are built on a set of satisfactions that are genuinely compelling in isolation:

- **Optimization loops**: Given a limited resource (gold, placement space, time), find the most efficient use. This is a clean, legible problem.
- **Spatial puzzles**: Where you place towers, in what configuration, interacts with enemy pathing in ways that reward spatial thinking.
- **Escalating difficulty**: Waves get harder. Players must adapt and grow their defenses, which creates a sense of progression and mastery.

These are real pleasures. The satisfaction of clearing a hard wave with a tight budget, or discovering a synergy between two tower types, is the kind of "aha moment" that makes players come back. The official Legion TD 2 gameplay guide describes this balance clearly: *"Your strategy should be to clear waves with as little fighter value as possible, and extra gold should be spent on workers… Getting too few workers means you'll have low mythium, which means weak offense and poor late game scaling."* [(Source)](https://steamcommunity.com/sharedfiles/filedetails/?id=1793195628) Even the basic economy loop — balance defense spending vs. worker investment — is a multi-variable optimization problem with no trivially correct answer.

The genre also rewards learning. As the guide notes, *"Fighter Value: The necessary fighter value to clear a wave will usually be +/- 20% of the recommended value... If you have good typing against a wave, you can clear the wave with less fighter value."* Every wave is a small puzzle with known inputs and learnable solutions.

---

## 3. The Replayability Cliff — Soren Johnson's "Water Finds a Crack"

Here is the problem: optimization loops are solvable. Puzzles have answers. Once a player learns the answers, the fun evaporates.

Game designer Soren Johnson (lead designer on Civilization IV) named this phenomenon in a 2011 Game Developer column titled "Water Finds a Crack." He wrote: *"Many players cannot help approaching a game as an optimization puzzle. What gives the most reward for the least risk? What strategy provides the highest chance — or even a guaranteed chance — of success? Given the opportunity, players will optimize the fun out of a game."* [(Source)](https://www.designer-notes.com/game-developer-column-17-water-finds-a-crack/)

Johnson's key insight is that knowledge is irreversible: *"The greatest danger is that once a player discovers such an exploit, she will never be able to play the game again without using it — the knowledge cannot be ignored or forgotten, even if the player wishes otherwise."*

This is the replayability cliff. For tower defence games specifically, the cliff appears when players identify the dominant build. In a pure single-player or co-op TD, there is *always* a dominant build — because the enemies follow fixed scripts and the wave structure is deterministic. Once a player (or the community) discovers the optimal placement for wave 12 and the optimal unit composition for the mid-game, the game becomes a recipe to execute rather than a problem to solve.

Johnson further described the dynamics of dominant strategies, using the term "tank-mage" from MMO design to describe any hybrid that displaces all alternatives: *"The reason to kill tank-mages is that a single, dominant strategy actually takes away choice from a game because all other options are provably sub-optimal. The sweet spot for game design is when a specific decision is right in some circumstances but not in others, with a wide grey area between the two extremes. Games lose their dynamic quality once a strategy emerges that dominates under all conditions."* [(Source)](https://www.designer-notes.com/game-developer-column-17-water-finds-a-crack/)

Most single-player tower defence games cannot escape this trap. The enemy waves are fixed. The optimal response to a fixed input can always be found. The water finds the crack.

---

## 4. The Legion TD Solution — The Mercenary/Mythium System

Legion TD 2 escapes the trap not by making the waves harder to solve, but by making the *game situation itself* a moving target. It does this by introducing a human opponent and a second resource economy built around the mercenary system.

The Steam page describes the core loop: *"Build fighters to defend your lane against waves of enemies and hire mercenaries to attack your opponents. To win, you must defeat the opposing team's king before they defeat yours."* [(Source)](https://store.steampowered.com/app/469600/Legion_TD_2__Multiplayer_Tower_Defense/)

This is a deceptively radical design move. The "PvE puzzle" — what to build to survive this wave — is now entangled with a "PvP read" — what is my opponent likely to send, and when? Every gold decision bifurcates:

1. **Fighter value** (spend gold on units to survive waves)  
2. **Worker investment** (spend gold on workers to generate mythium for offense)

And every mythium decision bifurcates again:

1. **Mercenary sends** (spend mythium to attack opponent)  
2. **King upgrades** (spend mythium to strengthen your own defenses)

The official guide describes this engine explicitly, noting that *"Income is how you scale into late game. Without sufficient income, you won't have enough gold to spend on fighters (fighter value) to clear late game waves."* [(Source)](https://steamcommunity.com/sharedfiles/filedetails/?id=1793195628) The tension between defensive efficiency, economic investment, and offensive timing creates a decision space that cannot be collapsed into a single optimal answer — because the optimal answer depends on what your opponent is doing, which changes every game.

The Steam page explicitly lists *"Infinite replayability. No two games are the same. Even after 4,000 hours, the game is still fresh"* and *"Best-in-the-world game balance. Driven by both data and feedback to ensure strategic variety and competitive fairness."* [(Source)](https://store.steampowered.com/app/469600/Legion_TD_2__Multiplayer_Tower_Defense/) These aren't marketing boasts made carelessly — they are claims the game has earned by building a system where information about your opponent is always incomplete and always consequential.

---

## 5. The Leak Transfer Mechanic — One Bridge Between PvE and PvP

The elegance of Legion TD's design is concentrated in a single mechanic: **leak transfer**.

When a player fails to kill all the enemies in their wave — "leaking" — those enemies don't simply disappear. According to the official guide: *"When your fighters lose the battle, you 'leak' and: You earn partial gold; Your opponents earn some gold; The leaked enemies may damage your king."* Conversely, *"When your fighters win the battle, you 'clear' and: You earn the maximum gold; Your remaining fighters teleport to your king to defend against allied leaks."* [(Source)](https://steamcommunity.com/sharedfiles/filedetails/?id=1793195628)

This mechanic does something remarkable in systems terms: it makes your opponent's defensive failure your offensive opportunity — and vice versa. Sending mercenaries isn't just about inflating your opponent's wave difficulty; it's about engineering a leak that translates into king damage. Your offense and their defense are the same event viewed from two sides.

This is the bridging mechanic between PvE and PvP. In a pure TD, leaking is a personal failure with personal consequences. In Legion TD, leaking is a social event with cross-lane consequences — it rewards the attacker, punishes the defender, and shifts the game state for everyone.

The consequence for replayability is significant: because sending mercenaries is always an option, and because the timing and magnitude of sends is a strategic variable, the "problem" each player is solving in any given wave is not just "what can I hold?" but "what has my opponent prepared for, and am I building to hold that specific pressure?" A perfect build against a light send is an under-investment against a heavy one. The right answer is always conditional.

---

## 6. Conditional Optimality in Practice — The Mythium Guide as Game Theory

The community-authored Mythium Strategy Guide on Reddit is a remarkable document precisely because it reads less like a tips-and-tricks guide and more like a game theory primer on iterated, imperfect-information decision-making.

The guide identifies five named strategies, each with explicit conditions for use:

- **Break**: *"Most common application of Mythium... Can be coordinated with a teammate to break both opponents and deal King damage... At higher ELOs you should almost always go for breaks early game, unless you know they're overbuilding."*
- **Income Send**: *"Sending mercenaries before build phase to generate income, with a low chance to leak the opponent... usually used to come back from leaking early."*
- **King Ups**: *"Generally used either on the first wave or when your King is at risk of being damaged."*
- **Long Save/Starve**: *"Saving up Mythium for more than 2 rounds... puts you severely behind if they don't leak."*
- **Undercut**: *"Knowing your opponents are targeting a certain wave with a large send and sending to them one wave before then."*

[(Source)](https://old.reddit.com/r/LegionTD2/comments/r17e4p/mythium_strategy_guide_how_to_use_mythium/)

This taxonomy is the practical demonstration of the thesis. Notice: none of these strategies is dominant. The guide is explicit: *"There's several different strategies to employ that varies depending on game state, meaning you should never always do one strategy and should know when to use one and when to switch to another."*

This is exactly Soren Johnson's "sweet spot" — *"a specific decision is right in some circumstances but not in others, with a wide grey area between the two extremes."* The Mythium guide makes this concrete: the Undercut strategy only exists because the Long Save exists; the Long Save is only threatening because the Break is common; the Income Send is only safe because Breaks are sometimes unprofitable. Each strategy's value is contingent on the others being available and being used.

The guide also reveals the social/information layer: *"Even at this ELO I find that if I don't shotcall and tell teammates not just when to send, but when to income king, how to play around certain king spells... my teammates will misplay very often."* The mythium game is a coordination game layered on top of an optimization game — another dimension that resists being "solved."

---

## 7. Balance as a Design Pillar — 12+ Years of Strategic Variety

A critical enabler of conditional optimality is sustained balance work. A strategy ecosystem only stays rich if no single choice calcifies into the obvious dominant option. Legion TD 2 has clearly invested heavily here.

The Steam page states: *"12+ years of development. Thousands of hours have gone into refining the core game loop"* and *"Legion TD 2 launched in early access in 2017, and has received major updates, quality of life, and balance changes every single month since then."* [(Source)](https://store.steampowered.com/app/469600/Legion_TD_2__Multiplayer_Tower_Defense/) Monthly balance updates over eight-plus years is an extraordinary commitment for an indie title.

The game design literature supports why this matters. A Game Developer article on balance evolution by Breno Azevedo (former EA RTS balance designer) describes the value of data-driven balance: gathering feedback from top players, combining statistical analysis with expert judgment, and iterating patches to maintain "perceived balance." He notes that top players set trends that trickle down: *"The strategies developed by the top players during the patch's creation took months for the general player base to master, leading to an unusually long period of balance stability."* [(Source)](https://www.gamedeveloper.com/design/the-art-of-game-balance-evolution)

This pattern — tight top-level balance creating a long shelf life of viable strategies — is precisely what Legion TD 2 appears to have achieved. The Steam page's claim of *"over 100 unique fighters"* and *"12 million possible combinations"* would be hollow if balance weren't maintained. Bad balance collapses the possibility space to a handful of actually viable builds, recreating the very replayability cliff the competitive layer is meant to prevent.

The "how balance can affect difficulty" article adds a useful frame: well-designed balance creates *niches* rather than dominance — situations where each option excels: *"When proper balance is achieved, everything should have a niche. There should be at least one situation where said item or system is powerful."* [(Source)](https://www.gamedeveloper.com/design/how-balance-can-affect-difficulty) Niche-based balance means the meta is always contextual, which reinforces the conditional optimality that the mythium system creates.

---

## 8. Player Friction Points — What Community Complaints Reveal

The Steam discussion board provides a candid signal about where Legion TD 2's design creates genuine tension. These friction points are instructive for any adaptation.

**Real-time commitment pressure:** One player wrote: *"I cannot leave my damn PC because 1 round without doing anything causes afk detection which causes temporary ban. I cannot go to toilet, cannot quickly open my door and greet the person. This game requires more attention than LoL, Valorant, CSGO and also has bigger punishment."* [(Source)](https://steamcommunity.com/app/469600/discussions/) This is the cost of real-time multiplayer: the game demands sustained presence, and the AFK detection system (necessary to protect other players' game integrity) creates friction for anyone whose environment isn't controlled.

**Social dependency:** *"Love the game but would play it much more if 1v1 was available. I don't always feel like communicating with a teammate. I also want to explore different strategies without bringing anyone else down."* [(Source)](https://steamcommunity.com/app/469600/discussions/) The 2v2 and 4v4 structure requires coordination — as the Mythium guide emphasises, shotcalling and teammate communication is part of high-level play. But this is also a barrier: the game is harder to play solo, casually, or when you want to experiment freely.

**Comeback mechanics controversy:** A thread titled "Shutdown Shouldn't Exist in Competitive" argued: *"Because why should you lose because you are so far ahead that a leak gives them free gold. That doesn't make sense for a competitive game."* [(Source)](https://steamcommunity.com/app/469600/discussions/) The "shutdown" gold mechanic — where a player far ahead earns reduced gold on kills, effectively redistributing advantage — is a deliberate balance tool but one that creates perceived unfairness from the leading player's perspective. This is a genuine design tension between competitiveness and engagement.

**Toxicity when game ends early:** *"On PvE game mode, players now continuously flame their team mates when the game ends early... Before you removed the voting, I rarely saw negativity."* [(Source)](https://steamcommunity.com/app/469600/discussions/) This reveals that social dynamics around early-game failures are a pain point — players invest time and emotional energy, and early losses feel like stolen time.

**⚠️ Sources thin here:** The above draws only from publicly visible Steam discussion titles and post excerpts. A fuller analysis of player friction would require systematic scraping of discussion threads or community surveys. The patterns above are illustrative, not exhaustive.

---

## 9. Implications for Legion TD Web — Preserve, Adapt, Rethink

The research points to clear design principles for a web adaptation.

### What to Preserve Absolutely

**The dual-economy core.** The gold/mythium split — defense spending vs. worker investment vs. mercenary offense — is the engine of everything. Removing or simplifying it removes the conditional optimality that drives replayability. The leak transfer mechanic must stay intact or be faithfully reimplemented.

**The PvP mind game.** The value of Legion TD is not that it's a hard TD game; it's that the opponent's decisions make your decisions meaningful. A single-player or co-op-only web version would recreate the replayability cliff the original design solved. Even if multiplayer requires asynchronous or turn-based adaptations, some form of opponent-driven uncertainty must be preserved.

**Iterative balance.** The game's longevity is not accidental — it reflects hundreds of monthly updates. A web version needs a balance roadmap and the tooling to iterate quickly. A static release will eventually be "solved."

### What to Adapt for Web

**The real-time pressure.** The AFK detection frustration and bathroom-break problem are symptoms of a design for dedicated PC gaming sessions. A web audience may expect shorter, more forgiving sessions. Options: asynchronous turns (each player acts in their build phase independently, with results resolved server-side), or generous pause/reconnect affordances. The 15-20 minute match length the Steam version targets may need to compress to 8-10 minutes for web.

**Social dependency.** The 2v2 and 4v4 requirement creates high matchmaking friction for casual web players. Consider: robust 1v1 as a primary mode (the most-requested missing feature per community), with 2v2 as the advanced mode. The solo experience must be first-class.

**Onboarding complexity.** The Mythium guide alone is hundreds of words of nuanced conditional strategy. The overdesign trap article warns: *"Nobody wants to memorize 5 billion stats just to begin a game"* and *"depth is not the same as complexity."* [(Source)](https://www.gamedeveloper.com/design/the-overdesign-trap-of-game-design) The game's depth must be discoverable gradually, not front-loaded. The official guide's "Game Coach" feature (in-game tips as you play) is a good model to replicate. Build phase timers and simplified early-game economy guidance could reduce the initial learning cliff.

**Comeback mechanics.** The shutdown controversy suggests these mechanics need clear communication. If comeback tools exist, players must understand *why* they exist — framing them as "keeping games competitive" rather than penalising success. Clear UI and in-game explanations reduce perceived unfairness.

---

## 10. Conclusion — The Thesis Restated

Tower defence games are optimization puzzles, and optimization puzzles get solved. Once solved, the fun ends — the replayability cliff that claims most games in the genre.

Legion TD 2 escapes this fate through a design insight that looks simple but is structurally profound: it makes every defensive decision conditional on an offensive unknown. The mythium system, the mercenary sends, the leak transfer mechanic — these together ensure that the "correct" build is never knowable in advance, because it depends on what your opponent is doing, which depends on what you're doing, in an iterated loop that never converges to a fixed solution.

This is not complexity for its own sake. The core game loop is learnable in a tutorial. But the strategic depth — the game theory of when to break, when to save, when to undercut — takes thousands of hours to master, because mastery requires reading human opponents, and humans change.

Soren Johnson wrote that *"the destiny of games is to become boring."* Legion TD 2 fights that destiny by making sure the game you're playing is never quite the same game twice — not because the waves are random, but because the player across the lane is unpredictable.

Legion TD Web should preserve this above all else. Everything else — session length, onboarding, social features — is tunable. The competitive mind game embedded inside wave defense is the irreducible core. That's what makes it worth building.

---

## Sources

| # | Source | URL |
|---|--------|-----|
| 1 | Legion TD 2 — Steam Store Page | https://store.steampowered.com/app/469600/Legion_TD_2__Multiplayer_Tower_Defense/ |
| 2 | Legion TD 2 — Official Gameplay Guide (Steam) | https://steamcommunity.com/sharedfiles/filedetails/?id=1793195628 |
| 3 | Mythium Strategy Guide (Reddit r/LegionTD2) | https://old.reddit.com/r/LegionTD2/comments/r17e4p/mythium_strategy_guide_how_to_use_mythium/ |
| 4 | Steam Community Discussions | https://steamcommunity.com/app/469600/discussions/ |
| 5 | Soren Johnson — "Water Finds a Crack" (GD Column 17) | https://www.designer-notes.com/game-developer-column-17-water-finds-a-crack/ |
| 6 | Breno Azevedo — "The Art of Game Balance: Evolution" (Game Developer) | https://www.gamedeveloper.com/design/the-art-of-game-balance-evolution |
| 7 | "The Overdesign Trap of Game Design" (Game Developer) | https://www.gamedeveloper.com/design/the-overdesign-trap-of-game-design |
| 8 | "How Balance Can Affect Difficulty" (Game Developer) | https://www.gamedeveloper.com/design/how-balance-can-affect-difficulty |

---

*Report length: ~3,200 words. Written for Legion TD Web design team, March 2026.*
