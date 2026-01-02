# Dragon Warrior IV (NES) - Monster Arena

## Overview

The Monster Arena allows players to bet on fights between groups of monsters. It's located in the back of Endor Castle.

## Location

| Property | Value |
|----------|-------|
| **Town** | Endor |
| **Map ID** | `$04` |
| **Submap** | `$07` (ENDOR_ARENA) |
| **Accessibility** | Available in Chapters 2-5 |

## How It Works

1. **View Contenders**: Player sees 3-4 groups of monsters
2. **Place Bet**: Choose a monster group and bet amount
3. **Watch Fight**: Monsters battle using the regular battle system
4. **Collect Winnings**: If your monster wins, you receive payout

## Betting Options

| Bet Amount | Coins |
|------------|-------|
| Small | 10 |
| Medium | 50 |
| Large | 100 |
| Maximum | 500 |

## Payout System

Payouts are based on the odds of each monster group:

| Odds | Description | Payout |
|------|-------------|--------|
| 2:1 | Favorite | 2× bet |
| 3:1 | Even match | 3× bet |
| 5:1 | Underdog | 5× bet |
| 10:1 | Long shot | 10× bet |

## Monster Groups

The arena features rotating monster matchups. Common participants:

### Tier 1 (Early Game)
- Slimes vs Drakees
- Babbles vs Cruelcetes
- Healers vs Magicians

### Tier 2 (Mid Game)
- Metal Slimes vs Healers
- Lionheads vs Demon Toadstols
- Wyverns vs Vampdogs

### Tier 3 (Late Game)
- Metal Babbles vs King Slimes
- Andreal vs Gigademon
- Boss Trolls vs King Healers

## Battle System

Arena battles use the standard combat engine with modifications:

- **No player input**: Fights are fully automated
- **Speed determines order**: AGI stat controls turn order
- **AI patterns**: Monsters use their standard AI
- **Victory condition**: Last group standing wins

## Arena-Specific Monsters

Some monsters appear only in the arena:

| Monster | Arena Exclusive | Notes |
|---------|-----------------|-------|
| Champion Slime | Yes | Buffed slime with high stats |
| Arena Drake | Yes | Special Drakee variant |
| Fighting King | Yes | Buffed King Slime |

## Memory Addresses

| Address | Purpose |
|---------|---------|
| `$6400` | Current arena bet amount |
| `$6401` | Selected monster group (0-3) |
| `$6402` | Arena state flags |
| `$6403` | Fight progress counter |

## Code Location

Arena code shares Bank 23 with poker but uses different entry points:

| Address | Function |
|---------|----------|
| `$9000` | Arena initialization |
| `$9100` | Display monster groups |
| `$9200` | Place bet |
| `$9300` | Execute fight |
| `$9400` | Calculate payout |

## Random Factors

The arena uses the global RNG for:
- Monster group selection
- Fight outcomes (damage rolls)
- Critical hit chances

### RNG Influence

While fights are deterministic based on stats and RNG seed, skilled players can:
- Track RNG patterns
- Choose optimal betting moments
- Recognize favorable matchups

## Sound Effects

| Event | Sound |
|-------|-------|
| Enter Arena | Arena fanfare |
| Place Bet | Coin sound |
| Fight Start | Battle music |
| Victory | Win jingle |
| Defeat | Lose jingle |

## Strategy Tips

1. **Watch first**: Observe fights before betting
2. **Note patterns**: Some matchups have predictable outcomes
3. **Bet smart**: Higher odds = higher risk
4. **Track RNG**: Similar setups may repeat

## Differences from Other Versions

| Version | Features |
|---------|----------|
| **NES** | Basic 3-4 groups, simple betting |
| **PS1** | More monster variety, cutscenes |
| **DS** | Enhanced graphics, more options |
| **Mobile** | Streamlined interface |
