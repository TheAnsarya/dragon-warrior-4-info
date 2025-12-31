# Dragon Warrior IV - Monster Data Format

## Overview

Dragon Warrior IV contains approximately 195-204 unique monsters. The monster data is stored in multiple tables across different ROM banks.

## Primary Monster Table

**Location:** Bank 8 (ROM offset 0x237C0)  
**Entry Size:** 16 bytes  
**Count:** ~195 entries

### Byte Structure

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0x00 | 2 | HP | Hit Points (little-endian) |
| 0x02 | 1 | MP | Magic Points (usually 0 for monsters) |
| 0x03 | 2 | Attack | Attack power (little-endian) |
| 0x05 | 1 | Defense | Defense value |
| 0x06 | 1 | Agility | Speed/turn order |
| 0x07 | 2 | EXP | Experience reward (little-endian) |
| 0x09 | 2 | Gold | Gold reward (little-endian) |
| 0x0B | 1 | Drop Item | Item ID dropped |
| 0x0C | 1 | Drop Rate | Drop probability |
| 0x0D | 1 | Action Pattern | AI behavior index |
| 0x0E | 1 | Resistances | Damage type resistances |
| 0x0F | 1 | Sprite Info | Graphics reference |

### Stat Ranges

Based on extraction analysis:

| Stat | Minimum | Maximum | Notes |
|------|---------|---------|-------|
| HP | 1 | 65,535 | 16-bit, some encoded |
| MP | 0 | 255 | Usually 0 |
| Attack | 1 | 65,535 | 16-bit |
| Defense | 0 | 255 | 8-bit |
| Agility | 0 | 255 | 8-bit |
| EXP | 0 | 65,535 | 16-bit |
| Gold | 0 | 65,535 | 16-bit |

## Enemy Type Table

**Location:** Bank 19, $B967  
**Entry Size:** 1 byte  
**Count:** 256 entries

### Byte Structure

```
Bits 7-5: Type category (0-7)
Bits 4-0: Resistance value (0-31)
```

### Type Categories

| Value | Category | Count | Description |
|-------|----------|-------|-------------|
| 0 | Regular | 86 | Normal enemies |
| 1 | Undead | 21 | Ghost/zombie types |
| 2 | Flying | 0 | (Unused?) |
| 3 | Magic | 32 | Spell-casting enemies |
| 4 | Strong | 0 | (Unused?) |
| 5 | Boss-tier | 52 | Powerful enemies |
| 6 | High-Res | 24 | High resistance |
| 7 | Boss | 41 | Bosses/immune types |

### Resistance Distribution

Most common resistance values:
- $1F (31): 196 enemies - Maximum resistance
- $02-$04: Common for mid-tier enemies
- $00: 2 enemies - No resistance

### Usage in Battle Code

The type byte is used in several battle calculations:

1. **Hit Check ($9135)**
   - Uses bits 4-0 as hit threshold modifier

2. **Damage Reduction ($AB59)**
   ```asm
   LDA $B967,Y    ; Load enemy type byte
   AND #$1F       ; Extract resistance (bits 0-4)
   ; Compare against $75DC for special handling
   ```

3. **Action Validation ($A599)**
   - Checks if actions affect target based on type

## Action Pattern Table

**Location:** Bank 19 (various)  
**Structure:** Variable-length

Each monster has an action pattern ID that references a behavior table. Patterns define:

- Available actions (attack, spell, breath, etc.)
- Action probabilities
- Conditional behaviors (low HP, party state)

### Common Action Types

| ID | Action | Description |
|----|--------|-------------|
| 0x00 | Attack | Physical attack |
| 0x01 | Spell | Cast assigned spell |
| 0x02 | Breath | Breath weapon |
| 0x03 | Special | Unique ability |
| 0x04 | Flee | Attempt to run |
| 0x05 | Call | Summon allies |

## Drop Rate Encoding

The drop rate byte encodes probability:

| Value | Probability | Fraction |
|-------|-------------|----------|
| 0 | 0% | Never |
| 1 | 100% | Always |
| 2 | 50% | 1/2 |
| 4 | 25% | 1/4 |
| 8 | 12.5% | 1/8 |
| 16 | 6.25% | 1/16 |
| 32 | 3.125% | 1/32 |
| 64 | 1.5625% | 1/64 |
| 128 | 0.78125% | 1/128 |
| 255 | ~0.39% | 1/256 |

**Formula:** `probability = 1 / drop_rate` (when drop_rate > 0)

## Metal Monsters

Special flag in type byte (bit pattern analysis):

| Monster | Byte | Notes |
|---------|------|-------|
| Metal Slime | $01 | B22=$01 (Metal flag) |
| Metal Babble | Various | High defense, flee rate |
| Metal King | Various | Highest EXP |

Metal monsters have:
- Very high defense
- Low HP
- High agility (flee often)
- Massive EXP rewards
- Immune to most magic

## Sample Monster Entries

### Slime (ID 0)
```
ROM: 0x237C0
Hex: 04 04 0f 02 04 02 05 08 01 02 01 03 01 02 04 06

HP:     1028 (0x0404)
MP:     15
Attack: 1026 (0x0204)
Defense: 2
Agility: 5
EXP:    264 (0x0108)
Gold:   258 (0x0201)
Drop:   Item 3, Rate 1/1
Action: Pattern 2
Resist: 4
Sprite: 6
```

### Boss Example (ID 24)
```
ROM: 0x2392A
Hex: CA C0 31 D0 50 D0 A0 A1 A1 25 25 D6 56 D6 2E 2D

HP:     53328 (encoded)
Attack: 160
Defense: 161
Agility: 161
EXP:    49354
Gold:   53297
Drop:   100% rate (0xFF)
Resist: 0x5D
```

## Conversion Notes for DW4→DQ3r

When converting to DQ3r format:

1. **HP**: Scale for SNES 16-bit (may need inflation)
2. **MP**: Add field (DQ3r monsters have visible MP)
3. **Stats**: Consider 16-bit expansion for all stats
4. **Drops**: DQ3r supports 2 drops per monster
5. **Patterns**: Map to DQ3r action system
6. **Resistances**: Convert to DQ3r element system

### Format Comparison

| Field | DW4 (16 bytes) | DQ3r (24 bytes) |
|-------|----------------|-----------------|
| HP | 2 bytes | 2 bytes |
| MP | 1 byte | 2 bytes |
| Attack | 2 bytes | 2 bytes |
| Defense | 1 byte | 2 bytes |
| Agility | 1 byte | 2 bytes |
| EXP | 2 bytes | 2 bytes |
| Gold | 2 bytes | 2 bytes |
| Pattern | 1 byte | 2 bytes (pointer) |
| Resist | 1 byte | 2 bytes |
| Drop 1 | 2 bytes | 2 bytes |
| Drop 2 | - | 2 bytes |
| Flags | 1 byte | 2 bytes |

---

*See [enemy_data_table.md](enemy_data_table.md) for raw type table data.*
