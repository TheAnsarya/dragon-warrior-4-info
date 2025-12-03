# Dragon Warrior IV (NES) - Spell Effect Tables

## Overview

This document describes the spell and action effect data tables found in Bank 19
of Dragon Warrior IV. The battle system uses these tables to determine spell behavior,
damage calculation, and effect application.

## Action Code Ranges

Based on the hit check routine at `$9135`, actions are categorized:

| Range | Type | Description |
|-------|------|-------------|
| $00-$12 | Physical | Regular attacks, defend, flee |
| $13-$1B | Healing | Heal, Healmore, Vivify, etc. |
| $1C-$28 | Offensive | Blaze, Bang, Zap, elemental spells |
| $29-$32 | Status | Sleep, StopSpell, Surround |
| $33-$42 | Buff/Utility | Bounce, Bikill, Return, etc. |
| $43+ | Special | Monster abilities, AI actions |

## Spell Effect Table ($B80B)

The primary spell effect table is at `$B80B`. Each byte defines the effect type
for a corresponding action code.

### Effect Byte Format

The effect bytes appear to encode multiple properties:
- Upper nibble: Effect category/type
- Lower nibble: Power level or parameter

Common effect bytes observed:
- `$E0-$E5`: Healing spells (different power levels)
- `$F2`: Many offensive spells
- `$67-$72`: Status/buff effects

### Spell List with Effects

| Code | Name | Effect | Category |
|------|------|--------|----------|
| $13 | Heal | $68 | healing |
| $14 | Healmore | $68 | healing |
| $15 | Healall | $EE | healing |
| $16 | Healus | $E9 | healing |
| $17 | Healusall | $67 | healing |
| $18 | Vivify | $C7 | healing |
| $19 | Revive | $6B | healing |
| $1A | Antidote | $A6 | healing |
| $1B | Numboff | $4C | healing |
| $1C | Blaze | $EA | offensive |
| $1D | Blazemore | $F2 | offensive |
| $1E | Blazemost | $F2 | offensive |
| $1F | Firebane | $CD | offensive |
| $20 | Firevolt | $CD | offensive |
| $21 | Bang | $F2 | offensive |
| $22 | Boom | $F2 | offensive |
| $23 | Explodet | $F2 | offensive |
| $24 | Icebolt | $F2 | offensive |
| $25 | Snowblast | $F2 | offensive |
| $26 | Zap | $F2 | offensive |
| $27 | Thordain | $F2 | offensive |
| $28 | Defeat | $F2 | offensive |
| $29 | Beat | $F2 | status |
| $2A | Bedragon | $F2 | status |
| $2B | Limbo | $F2 | status |
| $2C | Sleep | $F2 | status |
| $2D | Sleepmore | $F2 | status |
| $2E | StopSpell | $F2 | status |
| $2F | Surround | $F2 | status |
| $30 | RobMagic | $F2 | status |
| $31 | Ironize | $F2 | status |
| $32 | Transform | $F2 | status |
| $33 | Bounce | $F2 | buff |
| $34 | Increase | $F2 | buff |
| $35 | Bikill | $F2 | buff |
| $36 | Sap | $F2 | buff |
| $37 | Defense | $F2 | buff |
| $38 | SpeedUp | $F2 | buff |
| $39 | SlowDown | $F2 | buff |
| $3A | Outside | $F2 | buff |
| $3B | Return | $F2 | buff |
| $3C | X-Ray | $F2 | buff |
| $3D | Stepguard | $F2 | buff |
| $3E | Repel | $F2 | buff |
| $3F | Radiant | $F2 | buff |
| $40 | Day-Night | $F2 | buff |
| $41 | Chance | $F2 | buff |
| $42 | Transform | $F2 | buff |


## Tactics Modifier Tables

The AI tactics system uses several modifier tables to adjust spell behavior.

### Attack Multiplier ($BB84)

| Tactics | Multiplier | Effect |
|---------|------------|--------|
| Normal | 16 | Normal |
| SaveMP | 0 | 0.0x |
| Offensive | 16 | Normal |
| Defensive | 16 | Normal |
| TryOut | 16 | Normal |
| UseNoMP | 16 | Normal |
| Unknown | 16 | Normal |


### Stat Multiplier ($BB8B)

| Tactics | Multiplier | Effect |
|---------|------------|--------|
| Normal | 16 | Normal |
| SaveMP | 16 | Normal |
| Offensive | 0 | Disabled |
| Defensive | 16 | Normal |
| TryOut | 0 | Disabled |
| UseNoMP | 0 | Disabled |
| Unknown | 0 | Disabled |


### Hit Threshold ($BB92)

| Tactics | Threshold | Hit Chance |
|---------|-----------|------------|
| Normal | 102 | ~40% |
| SaveMP | 51 | ~20% |
| Offensive | 140 | ~55% |
| Defensive | 1 | ~0% |
| TryOut | 255 | ~100% |
| UseNoMP | 1 | ~0% |
| Unknown | 160 | ~63% |


## Spell Power Table ($BB3F, $BB49)

These 9-entry tables (indexed by `$75E8` capped at 8) provide spell power and attribute data.

### Power Values ($BB3F)

| Index | Value | Hex |
|-------|-------|-----|
| 0 | 85 | $55 |
| 1 | 100 | $64 |
| 2 | 100 | $64 |
| 3 | 192 | $C0 |
| 4 | 192 | $C0 |
| 5 | 0 | $00 |
| 6 | 0 | $00 |
| 7 | 0 | $00 |
| 8 | 85 | $55 |
| 9 | 112 | $70 |

### Attribute Values ($BB49)

| Index | Value | Hex |
|-------|-------|-----|
| 0 | 85 | $55 |
| 1 | 100 | $64 |
| 2 | 100 | $64 |
| 3 | 32 | $20 |
| 4 | 32 | $20 |
| 5 | 160 | $A0 |
| 6 | 160 | $A0 |
| 7 | 160 | $A0 |
| 8 | 85 | $55 |
| 9 | 112 | $70 |


## Raw Table Data

### Spell Effects ($B80B) - First 128 bytes

```
$B80B: E2 E2 E2 E1 E1 E1 E0 E0 E0 E5 E5 E5 E5 E4 E4 E4
$B81B: E3 E3 E3 68 68 EE E9 67 C7 6B A6 4C EA F2 F2 CD
$B82B: CD F2 F2 F2 F2 F2 F2 F2 F2 F2 F2 F2 F2 F2 F2 F2
$B83B: F2 F2 F2 F2 F2 F2 F2 F2 F2 F2 F2 F2 F2 F2 F2 F2
$B84B: F2 F2 F2 F2 F2 F2 F2 F2 F2 F2 F2 F2 72 E1 E1 E1
$B85B: E5 E5 E5 67 72 31 67 F2 F2 F2 F2 F2 F2 F2 F2 F2
$B86B: F2 F2 F2 F2 F2 F2 F2 F2 F2 F2 F2 F2 F2 F2 F2 F2
$B87B: F2 F2 F2 67 E1 F2 F2 EB 67 F2 67 F2 F2 F2 F2 F2
```

## Subroutine References

Key subroutines that use these tables:

| Address | Name | Description |
|---------|------|-------------|
| $8013 | - | Loads from $B915,Y |
| $801B | - | Loads from $B949,Y |
| $9135 | hit_check | Action code classification |
| $9279 | - | Uses $B80B for spell effects |
| $9316 | - | Uses $B80B for spell effects |
| $936A | sub_9365 | Loads from $BAA5,X |
| $937F | sub_937A | Loads from $BAD5,X |
| $939F | sub_939A | Loads from $BA74,X |
| $A46A | - | Uses $B80B,Y |
| $AE8A | - | Loads from $BB06,Y (tactics modifier) |
| $AEA9 | sub_AEA6 | Loads from $BB3F,X (spell power) |
| $AEB7 | sub_AEB4 | Loads from $BB49,X (spell attribute) |

## Notes

1. The tactics index is stored at `$6E80` (from `$615B` tactics byte)
2. Spell slot/level appears to be at `$75E8`
3. Damage output goes to `$75D4-$75D5` (16-bit)
4. Hit check result at `$75EC`
5. Final spell effect output at `$75EF`
