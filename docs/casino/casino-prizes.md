# Dragon Warrior IV (NES) - Casino Prizes

## Overview

Casino coins can be exchanged for valuable items at the prize counter. Some of the best equipment in the game is only available as casino prizes.

## Prize Exchange Location

| Property | Value |
|----------|-------|
| **Town** | Endor |
| **Map ID** | `$04` |
| **NPC** | Prize Counter Lady |

## Prize List

### Weapons

| Item | Coins | Attack | Notes |
|------|-------|--------|-------|
| Falcon Sword | 65,000 | +67 | Attacks twice per round |
| Gringham Whip | 40,000 | +85 | Hits all enemies |
| Demon Hammer | 25,000 | +70 | May instant kill |
| Metal Babble Sword | 50,000 | +90 | Highest attack weapon |

### Armor

| Item | Coins | Defense | Notes |
|------|-------|---------|-------|
| Metal Babble Armor | 35,000 | +95 | Best armor |
| Magic Bikini | 15,000 | +45 | Females only |
| Dancer's Costume | 5,000 | +32 | Agility bonus |
| Aeolus' Shield | 20,000 | +60 | Fire/ice resist |

### Helmets

| Item | Coins | Defense | Notes |
|------|-------|---------|-------|
| Metal Babble Helm | 30,000 | +50 | Best helm |
| Hat of Happiness | 10,000 | +8 | Heals while walking |

### Accessories

| Item | Coins | Effect |
|------|-------|--------|
| Meteorite Bracer | 50,000 | Doubles agility |
| Gospel Ring | 25,000 | Prevents encounters |
| Sword of Miracles | 45,000 | Heals HP on attack |

### Consumables

| Item | Coins | Effect |
|------|-------|--------|
| Prayer Ring | 500 | Restores MP (reusable) |
| Small Medal | 100 | Medal King collection |
| Seed of Strength | 200 | +1-3 STR permanently |
| Seed of Agility | 200 | +1-3 AGI permanently |
| Seed of Luck | 200 | +1-3 LCK permanently |

## Price Comparison

Buying coins vs. gold value:

| Exchange Rate | Effective Price |
|---------------|-----------------|
| 20 gold = 1 coin | 1 coin = 20G |
| 100 coins = 2000G | Break-even |

### Example Calculations

| Item | Coins | Gold Equivalent |
|------|-------|-----------------|
| Falcon Sword | 65,000 | 1,300,000 gold |
| Metal Babble Armor | 35,000 | 700,000 gold |

## Best Prize Strategies

### Early Game (Chapter 2)

1. **Hat of Happiness** - 10,000 coins
   - Excellent for exploring dungeons
   - HP regeneration saves healing items

2. **Prayer Ring** - 500 coins
   - Cheap MP restoration
   - Great for Cristo/Brey

### Mid Game (Chapters 3-4)

1. **Gringham Whip** - 40,000 coins
   - Essential for grinding
   - Hits all enemies

2. **Magic Bikini** - 15,000 coins
   - Good defense for Mara/Nara
   - More accessible than alternatives

### Late Game (Chapter 5)

1. **Metal Babble Equipment** - 115,000 total
   - Sword: 50,000
   - Armor: 35,000
   - Helm: 30,000

2. **Meteorite Bracer** - 50,000 coins
   - Doubles agility
   - Essential for speed builds

## ROM Data Location

Prize table data:

| Address | Purpose |
|---------|---------|
| `$9600` | Prize item IDs |
| `$9620` | Prize costs (low byte) |
| `$9640` | Prize costs (high byte) |

### Data Format

```
Prize Entry (3 bytes):
+00: Item ID ($00-$FF)
+01: Cost low byte
+02: Cost high byte
```

## Tips for Earning Coins

1. **Poker Strategy**
   - Always hold pairs or better
   - Double up on small wins
   - Quit while ahead

2. **Arena Strategy**
   - Bet on favorites early
   - Learn monster matchups
   - Save before big bets

3. **Optimal Grinding**
   - Metal Babble hunting for gold
   - Convert gold to coins
   - 20 gold = 1 coin at exchange

## Version Differences

| Version | Prize Differences |
|---------|-------------------|
| **NES (US)** | Standard prizes as listed |
| **Famicom (JP)** | Same items, different costs |
| **PS1** | Additional exclusive items |
| **DS** | Expanded prize list |
