# Dragon Warrior IV - Enemy Data Table
# Location: Bank 19, $B967

## Table Structure

Each byte encodes enemy properties:
- Bits 7-5: Type category (0-7)
- Bits 4-0: Resistance/special flags

## Type Categories (Bits 7-5)

Based on value distribution analysis:
```
0 ($00-$1F): Regular enemies
1 ($20-$3F): Undead/Ghost?
2 ($40-$5F): Flying?
3 ($60-$7F): Magic-using?
4 ($80-$9F): Strong enemies
5 ($A0-$BF): Boss-tier?
6 ($C0-$DF): High resistance
7 ($E0-$FF): Bosses/immune
```

## Type Distribution
```
Type 0: 86 enemies
Type 1: 21 enemies
Type 2: 0 enemies
Type 3: 32 enemies
Type 4: 0 enemies
Type 5: 52 enemies
Type 6: 24 enemies
Type 7: 41 enemies
```

## Resistance Value Distribution
```
Resist $00 ( 0): 2 enemies
Resist $01 ( 1): 2 enemies
Resist $02 ( 2): 9 enemies
Resist $03 ( 3): 9 enemies
Resist $04 ( 4): 9 enemies
Resist $05 ( 5): 5 enemies
Resist $06 ( 6): 3 enemies
Resist $07 ( 7): 2 enemies
Resist $08 ( 8): 6 enemies
Resist $0A (10): 2 enemies
Resist $0B (11): 1 enemies
Resist $0C (12): 2 enemies
Resist $0F (15): 3 enemies
Resist $12 (18): 2 enemies
Resist $14 (20): 2 enemies
Resist $19 (25): 1 enemies
Resist $1F (31): 196 enemies
```

## Raw Data
```
$B967: A2 A4 AA C4 C6 CA E5 E8 EF A2 C5 E8 CB C2 C4 C8  ................
$B977: A4 EF AF A4 C7 E1 C3 C3 A3 C3 C4 A5 A0 22 04 A3  ............."..
$B987: C4 23 64 63 06 26 02 25 12 23 25 27 72 79 62 62  .#dc.&.%.#%'rybb
$B997: 2C 34 61 08 74 68 63 62 6C 60 22 68 1F 1F 1F 1F  ,4a.thcbl`"h....
$B9A7: 1F 1F 1F BF BF BF BF BF BF BF BF BF 7F FF FF FF  ................
$B9B7: FF FF FF FF FF FF FF 1F 1F 1F 1F 1F 1F 1F 1F 1F  ................
$B9C7: 1F 1F 1F 1F 1F 1F 7F FF 1F 1F 1F 1F 1F FF BF FF  ................
$B9D7: 3F 3F 1F BF DF BF 1F DF FF BF FF BF FF BF BF 1F  ??..............
$B9E7: FF 3F BF DF DF BF BF DF DF FF DF 3F BF BF DF 1F  .?.........?....
$B9F7: FF 1F 1F 1F 3F BF 1F 3F 3F 1F 1F 7F DF DF FF 1F  ....?..??.......
$BA07: 7F 1F 1F 1F 1F 1F BF 3F FF BF BF BF 1F 1F 1F 1F  .......?........
$BA17: 1F 1F BF 1F BF BF BF 1F 1F 1F 1F BF 1F BF BF 1F  ................
$BA27: BF 1F 1F 1F BF 1F 1F 3F BF 1F BF 1F 1F 1F 3F 1F  .......?......?.
$BA37: 1F 1F 1F 1F BF FF 7F 1F 1F BF FF 1F 1F FF 7F BF  ................
$BA47: BF 1F FF 1F 7F FF 7F 1F 7F 7F FF 7F FF FF 7F FF  ................
$BA57: 7F FF 7F 7F FF FF 7F 1F 1F FF 1F 7F 3F FF 7F 1F  ............?...
```

## Sample Enemy Analysis

| Index | Byte | Type | Resist | Notes |
|-------|------|------|--------|-------|
| $00 | $A2 | 5 (Boss-tier) | $02 |  |
| $01 | $A4 | 5 (Boss-tier) | $04 |  |
| $02 | $AA | 5 (Boss-tier) | $0A |  |
| $03 | $C4 | 6 (High-Res) | $04 |  |
| $04 | $C6 | 6 (High-Res) | $06 |  |
| $05 | $CA | 6 (High-Res) | $0A |  |
| $06 | $E5 | 7 (Boss/Immune) | $05 |  |
| $07 | $E8 | 7 (Boss/Immune) | $08 |  |
| $08 | $EF | 7 (Boss/Immune) | $0F |  |
| $09 | $A2 | 5 (Boss-tier) | $02 |  |
| $0A | $C5 | 6 (High-Res) | $05 |  |
| $0B | $E8 | 7 (Boss/Immune) | $08 |  |
| $0C | $CB | 6 (High-Res) | $0B |  |
| $0D | $C2 | 6 (High-Res) | $02 |  |
| $0E | $C4 | 6 (High-Res) | $04 |  |
| $0F | $C8 | 6 (High-Res) | $08 |  |
| $10 | $A4 | 5 (Boss-tier) | $04 |  |
| $11 | $EF | 7 (Boss/Immune) | $0F |  |
| $12 | $AF | 5 (Boss-tier) | $0F |  |
| $13 | $A4 | 5 (Boss-tier) | $04 |  |
| $14 | $C7 | 6 (High-Res) | $07 |  |
| $15 | $E1 | 7 (Boss/Immune) | $01 |  |
| $16 | $C3 | 6 (High-Res) | $03 |  |
| $17 | $C3 | 6 (High-Res) | $03 |  |
| $18 | $A3 | 5 (Boss-tier) | $03 |  |
| $19 | $C3 | 6 (High-Res) | $03 |  |
| $1A | $C4 | 6 (High-Res) | $04 |  |
| $1B | $A5 | 5 (Boss-tier) | $05 |  |
| $1C | $A0 | 5 (Boss-tier) | $00 | No resistance |
| $1D | $22 | 1 (Undead?) | $02 |  |
| $1E | $04 | 0 (Regular) | $04 |  |
| $1F | $A3 | 5 (Boss-tier) | $03 |  |

## Usage in Battle Code

The table is used in several ways:

1. **Hit Check ($9135)**
   - Uses bits 4-0 as hit threshold modifier

2. **Damage Reduction ($AB59)**
   - `LDA $B967,Y; AND #$1F` extracts resistance
   - Compared against $75DC (special flag)

3. **Action Validation ($A599)**
   - `LDA $B967,Y; AND #$1F` checks resistance
   - Used to determine if action affects target
