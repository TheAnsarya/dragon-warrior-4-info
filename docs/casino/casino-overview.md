# Dragon Warrior IV (NES) - Casino System Overview

## Introduction

The Casino in Dragon Warrior IV is located in **Endor** (map $04). It features two main gambling activities:

1. **Video Poker** - A card game with a Double Up feature
2. **Monster Arena** - Betting on monster battles

## Location

| Property | Value |
|----------|-------|
| **Town** | Endor |
| **Map ID** | `$04` |
| **Casino Submap** | `$01` |
| **Arena Submap** | `$07` |

## Casino Currency

Casino Coins are stored as a 24-bit value:

| Address | Size | Description |
|---------|------|-------------|
| `$62AD` | 1 byte | Casino coins (low byte) |
| `$62AE` | 1 byte | Casino coins (middle byte) |
| `$62AF` | 1 byte | Casino coins (high byte) |

**Maximum coins:** 16,777,215 (24-bit max)

## ROM Bank Information

The casino code is located in **Bank 23** (hex `$17`):

| Property | Value |
|----------|-------|
| **Bank Number** | 23 (0x17) |
| **ROM File Offset** | `0x5C010` - `0x5FFFF` |
| **CPU Address Range** | `$8000` - `$BFFF` |
| **Size** | 16KB |

## Games

### Video Poker

The primary casino game. Players are dealt 5 cards and can hold/discard to try to make winning hands.

#### Hand Rankings (Best to Worst)

| Hand | Payout Multiplier | Text Address |
|------|-------------------|--------------|
| Royal Flush | 500x | `$82E4` |
| 5 of a Kind | 250x | `$82F8` |
| Straight Flush | 100x | `$8304` |
| 4 of a Kind | 50x | `$8313` |
| Full House | 20x | N/A |
| Flush | 10x | `$832A` |
| Straight | 5x | N/A |
| 3 of a Kind | 3x | `$8339` |
| 2 Pairs | 2x | `$8345` |
| 1 Pair | 1x | N/A |

#### Double Up Feature

After any winning hand, players can attempt to double their winnings by guessing if the next card is higher or lower than the dealer's card.

- Text at `$835A`: "Double Up"
- RNG at `$8654`: Double Up random number generation
- Text at `$8392`: "Top Score of Double Up"

### Monster Arena

Players bet on which monster will win in a battle between multiple monsters.

- Located in submap `$07` (Endor Arena)
- Uses a separate betting and battle system
- Monsters fight using the standard battle engine

## Code Structure

### Entry Point
```
$8000: JMP $8D80    ; Casino bank entry point
```

### Main Casino Loop
```
$8084 - $80AE: Main casino game loop
├── $8F64: Initialize game
├── $8AAC: Handle input
├── $9242: Display update
├── $8C69: Card logic
├── $81D7: Call poker evaluation
├── $8D7F: Process results
├── $8ED6: Payout calculation
├── $80B1: Check for winning hand
├── $89EE: Continue/quit prompt
└── $8C9D: Return to menu
```

### Poker Hand Evaluation
```
$81F2: Hand evaluation entry point
├── $84A0: Check Royal Flush
├── $84CD: Check 5 of a Kind
├── $84EF: Check Straight Flush
├── $8510: Check 4 of a Kind
├── $8522: Check Full House
├── $8532: Check Flush
├── $8544: Check Straight
├── $8564: Check 3 of a Kind
├── $8572: Check 2 Pairs
├── $860C: Check 1 Pair
└── $861F: No winning hand
```

### Coin Operations
```
$80CF: Prepare coin update
$80D0: INC $62B0,X    ; Add coins
$80D9: DEC $62B0,X    ; Subtract coins
$80DE: INC $62B1,X    ; Handle overflow to next byte
```

## Text Strings (Bank 23)

| Address | String |
|---------|--------|
| `$82E4` | "Royal Flush" |
| `$82F8` | "5 of a Kind" |
| `$8304` | "Straight Flush" |
| `$8313` | "4 of a Kind" |
| `$832A` | "Flush" |
| `$8339` | "3 of a Kind" |
| `$8345` | "2 Pairs" |
| `$835A` | "Double Up" |
| `$837B` | "Total Bets" |
| `$8392` | "Top Score of Double Up" |

## Graphics

Casino graphics are loaded from CHR-RAM and include:
- Card faces (52 cards + jokers)
- Card backs
- UI elements (bet display, coin counter)
- Monster Arena sprites

## Random Number Generation

The game uses the global RNG at `$C891` for:
- Card shuffling/dealing
- Double Up card selection
- Monster Arena battle outcomes

## Related Files

- [casino-poker.md](casino-poker.md) - Detailed poker mechanics
- [casino-arena.md](casino-arena.md) - Monster Arena documentation
- [casino-prizes.md](casino-prizes.md) - Prize exchange list
- [casino-asm.md](casino-asm.md) - Annotated assembly code
