# Dragon Warrior IV (NES) - Video Poker System

## Overview

The Video Poker game in DW4 uses a standard deck with jokers, allowing for special hands like "5 of a Kind".

## Game Flow

1. Player places bet (1-10 coins per round)
2. 5 cards are dealt
3. Player selects which cards to hold
4. Non-held cards are replaced
5. Final hand is evaluated
6. If winning, player can attempt Double Up

## Hand Evaluation Code

### Entry Point: `$81F2`

The hand evaluation routine checks hands from best to worst:

```asm
loc_81F2:
    LDA #$00                 ; $81F2: A9 00
    STA $7E                  ; $81F4: 85 7E      - Clear hand type
    JSR $84A0                ; $81F6: 20 A0 84  - Check Royal Flush
    JSR $84CD                ; $81F9: 20 CD 84  - Check 5 of a Kind
    JSR $84EF                ; $81FC: 20 EF 84  - Check Straight Flush
    BCS $8227                ; $81FF: B0 26     - Exit if found
    JSR $8510                ; $8201: 20 10 85  - Check 4 of a Kind
    BCS $8227                ; $8204: B0 21     - Exit if found
    JSR $8522                ; $8206: 20 22 85  - Check Full House
    BCS $8227                ; $8209: B0 1C     - Exit if found
    JSR $8532                ; $820B: 20 32 85  - Check Flush
    BCS $8227                ; $820E: B0 17     - Exit if found
    JSR $8544                ; $8210: 20 44 85  - Check Straight
    BCS $8227                ; $8213: B0 12     - Exit if found
    JSR $8564                ; $8215: 20 64 85  - Check 3 of a Kind
    BCS $8227                ; $8218: B0 0D     - Exit if found
    JSR $8572                ; $821A: 20 72 85  - Check 2 Pairs
    BCS $8227                ; $821D: B0 08     - Exit if found
    JSR $860C                ; $821F: 20 0C 86  - Check 1 Pair
    BCS $8227                ; $8222: B0 03     - Exit if found
    JSR $861F                ; $8224: 20 1F 86  - No winning hand

loc_8227:
    PHP                      ; $8227: 08
    STX $81                  ; $8228: 86 81     - Store hand type in X
    LDA #$00                 ; $822A: A9 00
    STA $7F                  ; $822C: 85 7F
    ROL                      ; $822E: 2A
    STA $7E                  ; $822F: 85 7E
```

## Hand Types (X register values)

| X Value | Hand | Multiplier |
|---------|------|------------|
| `$08` | Royal Flush | 500x |
| `$07` | 5 of a Kind | 250x |
| `$06` | Straight Flush | 100x |
| `$05` | 4 of a Kind | 50x |
| `$04` | Full House | 20x |
| `$03` | Flush | 10x |
| `$02` | Straight | 5x |
| `$01` | 3 of a Kind | 3x |
| `$00` | 2 Pairs | 2x |
| (special) | 1 Pair | 1x |

## Card Data Structure

Cards are stored in the buffer at `$7635`:

```
$7635,X: Card value (5 cards, X = 0-4)
```

### Card Value Encoding

| Bits | Meaning |
|------|---------|
| 0-3 | Rank (0=Ace, 1=2, ..., 12=King) |
| 4-5 | Suit (0=Spades, 1=Hearts, 2=Diamonds, 3=Clubs) |
| 6 | Joker flag |

### Example Values

| Card | Value |
|------|-------|
| Ace of Spades | `$00` |
| King of Hearts | `$1C` |
| Joker | `$40` |

## Payout Table

The payout multiplier table is at `$81C5`:

```asm
; Multiplier table (low/high bytes)
$81C5: $F4, $01  ; 500 (Royal Flush)
$81C7: $64, $00  ; 100 (5 of a Kind - uses special calc)
$81C9: $32, $00  ; 50 (Straight Flush - uses special calc)
$81CB: $14, $00  ; 20 (4 of a Kind)
$81CD: $08, $00  ; 8 (Full House)
$81CF: $05, $00  ; 5 (Flush)
$81D1: $04, $00  ; 4 (Straight)
$81D3: $02, $00  ; 2 (3 of a Kind)
$81D5: $01, $00  ; 1 (2 Pairs / 1 Pair)
```

## Double Up System

### Entry Point: `$8654`

After a winning hand, the player can gamble their winnings:

```asm
loc_8654:
    ; Generate random card for dealer
    JSR $C891                ; Call RNG
    AND #$0F                 ; Mask to 0-15
    CMP #$0D                 ; Compare to 13
    BCS $8654                ; If >= 13, regenerate
    STA dealer_card         ; Store dealer's card
    
    ; Player guesses HIGH or LOW
    ; If correct: winnings × 2
    ; If wrong: lose all
    ; If tie: push (keep current)
```

### Double Up Flow

1. Dealer card is shown (rank only, not suit)
2. Player chooses HIGH or LOW
3. Hidden card is revealed
4. Compare ranks:
   - Player correct: Double winnings
   - Player wrong: Lose all
   - Tie: Push (keep current)

### Text Display

| Address | Text |
|---------|------|
| `$835A` | "Double Up" |
| `$8392` | "Top Score of Double Up" |

## Input Handling

### Button Mapping

| Button | Action |
|--------|--------|
| A | Confirm / Deal |
| B | Cancel / Stand |
| D-Pad | Select cards to hold |
| Start | Open menu |

### Hold Selection

The hold state is stored in `$82`:
- Bit 0: Card 1 held
- Bit 1: Card 2 held
- Bit 2: Card 3 held
- Bit 3: Card 4 held
- Bit 4: Card 5 held

## Betting System

### Bet Selection: `$8AAC`

```asm
; Bet amounts: 1, 2, 5, 10 coins
; Selected bet stored in $83
```

### Coin Deduction

Coins are deducted before the deal:

```asm
loc_80D9:
    DEC $62B0,X              ; Subtract from coin counter
```

### Winnings Addition

Winnings added after hand evaluation:

```asm
loc_80CF:
    TAX                      ; X = hand type
    INC $62B0,X              ; Add to coin counter
    BNE loc_80E1
    ; Handle overflow
    INC $62B1,X              ; Carry to next byte
```

## Sound Effects

| Event | Sound ID |
|-------|----------|
| Card Deal | `$0A` |
| Win | `$0C` |
| Lose | `$0D` |
| Double Up Success | `$0E` |
| Double Up Fail | `$0F` |

## Graphics

Poker graphics are loaded to CHR-RAM:

| Tile Range | Content |
|------------|---------|
| `$00-$0C` | Card ranks (A-K) |
| `$10-$13` | Suit symbols |
| `$20-$2F` | Card frame |
| `$40-$4F` | "HOLD" indicator |
| `$50-$5F` | Bet display |
