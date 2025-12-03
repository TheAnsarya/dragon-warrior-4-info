# Dragon Warrior IV - Monster Data Byte Structure

## Overview

Each monster in Dragon Warrior IV is defined by approximately 27 bytes of data. This document describes the known structure based on:
- Cowness.net speedrun notes
- Vaxherd's research (noted in speedrun files)
- ROM analysis

## Monster Record Layout

| Byte | Offset | Name | Description |
|------|--------|------|-------------|
| 0-1 | +$00 | EXP_Lo/Hi | Experience points (16-bit) |
| 2-3 | +$02 | Gold_Lo/Hi | Gold dropped (16-bit) |
| 4-5 | +$04 | HP_Lo/Hi | Hit Points (16-bit) |
| 6 | +$06 | Attack | Attack power |
| 7 | +$07 | Defense | Defense power |
| 8 | +$08 | Agility | Agility stat |
| 9-14 | +$09 | Skills | 6 bytes of skill/ability data |
| 15-18 | +$0F | Unknown_15_18 | Unknown (possibly AI/behavior) |
| 19 | +$13 | Drop_Item | Item drop ID |
| 20 | +$14 | Unknown_20 | Unknown (Vaxherd: byte 17) |
| 21 | +$15 | Unknown_21 | Unknown (Vaxherd: byte 18) |
| 22 | +$16 | Metal_Flags | Metal monster flags (Vaxherd: byte 19) |
| 23 | +$17 | Drop_Rate_Flags | Drop rate and flags (Vaxherd: byte 20) |
| 24 | +$18 | Status_Vuln | Status vulnerability flags (Vaxherd: byte 21) |
| 25 | +$19 | Unknown_25 | Unknown |
| 26 | +$1A | Unknown_26 | Unknown |

## Byte 22 - Metal Flags ($16)

This byte contains flags for special monster types, particularly Metal monsters.

| Bits | Mask | Description |
|------|------|-------------|
| 0-1 | $03 | Metal flag (11 = Metal monster, immune to most damage) |
| 2-7 | $FC | Unknown (usually zero) |

### Known Values

| Monster | Byte 22 | Binary | Notes |
|---------|---------|--------|-------|
| Slime | $00 | 00000000 | Standard enemy (baseline) |
| Metal Slime | $11 | 00010001 | Metal flag set, takes 0-1 damage |
| Metal Babble | $11 | 00010001 | Metal flag set |
| King Metal | $11 | 00010001 | Metal flag set |

## Byte 23 - Drop Rate & Flags ($17)

Contains the item drop rate in the lower 3 bits, with upper bits for additional flags.

| Bits | Mask | Description |
|------|------|-------------|
| 0-2 | $07 | Item drop rate (see table below) |
| 3-5 | $38 | Unknown flags |
| 6-7 | $C0 | Unknown flags |

### Drop Rate Table

| Value | Rate | Probability |
|-------|------|-------------|
| 000 | 0% | Never drops |
| 001 | 1/2 | 50% |
| 010 | 1/4 | 25% |
| 011 | 1/8 | 12.5% |
| 100 | 1/16 | 6.25% |
| 101 | 1/32 | 3.125% |
| 110 | 1/256 | 0.39% |
| 111 | 100% | Always drops |

## Byte 24 - Status Vulnerability ($18)

Controls which status effects the monster is vulnerable to.

| Bits | Mask | Description |
|------|------|-------------|
| 0-2 | $07 | Base vulnerability (usually 111) |
| 3-5 | $38 | Mid bits - behavior/AI flags |
| 6 | $40 | Paralysis vulnerability (1=can be paralyzed) |
| 7 | $80 | Confusion vulnerability OR Bounce flag |

### Known Patterns

| Value | Binary | Meaning | Example Monsters |
|-------|--------|---------|------------------|
| $C7 | 11000111 | Bounce/Reflect magic | Necrosaro 7 |
| $87 | 10000111 | Can be Confused | - |
| $47 | 01000111 | Can be Paralyzed | - |
| $07 | 00000111 | Asleep (very vulnerable) | Esturk, Bomb Crag |
| $17 | 00010111 | Sleepy Boys pattern | Brahmird, Big Sloth |
| $37 | 00110111 | Two-turn crew (sometimes) | King Metal (rare) |
| $3F | 00111111 | Standard enemy | Most monsters |
| $9F | 10011111 | Confused Boys | Vampire Bat |
| $97 | 10010111 | Confused Boys | Rogue Wisper |

## Monster Categories

### Metal Boys (Byte 22 Nonzero)

Monsters with the metal flag take 0-1 damage from most attacks.

| Monster | Byte 22 | Byte 24 | Notes |
|---------|---------|---------|-------|
| Metal Slime | $11 | $3F | Standard metal behavior |
| Metal Babble | $11 | $3F | Has evasion "3" (high dodge rate) |
| King Metal | $11 | $37 | Different mid bits, two-turn flee check |

### Sleepy Boys (Byte 24 = $07 or $17)

These monsters have high sleep vulnerability.

| Monster | Byte 22 | Byte 24 | Notes |
|---------|---------|---------|-------|
| Esturk | $00 | $07 | "Sleepiest Boy" - very easy to put to sleep |
| Bomb Crag | $00 | $07 | Same sleep vulnerability as Esturk |
| Brahmird | $00 | $17 | Slightly more resistant |
| Big Sloth | $00 | $17 | Same pattern as Brahmird |

### Confused Boys (Byte 24 bit 7 set)

These monsters can be confused.

| Monster | Byte 22 | Byte 24 | Notes |
|---------|---------|---------|-------|
| Rogue Wisper | $00 | $97 | Confusion vulnerability |
| Vampire Bat | $00 | $9F | Confusion vulnerability |

### Guaranteed Drop Boys

Certain monsters always drop their item (drop rate = 111).

| Monster | Notes |
|---------|-------|
| Chameleon Humanoid | 100% item drop |
| Infernus Shadow | 100% item drop |
| Roric | Tournament opponent |
| Vivian | Tournament opponent |
| Sampson | Tournament opponent |
| Bakor | Boss |

### Mimic AI

Mimics have special AI behavior encoded elsewhere.

| Monster | Byte 22 | Byte 24 |
|---------|---------|---------|
| Mimic | $00 | $3F |
| Bebanbar | $00 | $3F |

### Scripted Bosses

These bosses have scripted behavior patterns.

| Monster | Byte 22 | Byte 24 | Notes |
|---------|---------|---------|-------|
| Skeleton | $00 | $3F | Scripted |
| Dragon Rider | $00 | $3F | Scripted |
| Guardian | $00 | $3F | Scripted (center column?) |
| Master Malice | $00 | $3F | - |
| Necrosaro 4 | $00 | $3F | - |
| King Slime | $00 | $3F | - |
| Bakor | $00 | $3F | - |

### Two-Turn Crew

These monsters may act twice or have special turn mechanics.

| Monster | Byte 22 | Byte 24 | Notes |
|---------|---------|---------|-------|
| King Metal | $00 | $37 | Sometimes flees after 2 turns |
| Dragon Rider | $00 | $3F | Two actions |
| Guardian | $00 | $3F | Two actions |
| Necrosaro 1 | $00 | $3F | Multi-phase |
| Necrosaro 7 | $00 | $C7 | Has Bounce/Reflect, regenerates 100/turn |
| Gigademon | $00 | $3F | Two actions |

## Additional Notes

### Byte Numbering

The field names in the database are off by 5 from byte positions:
- Database field `5_XP1` = Byte 0
- Database field `24_Unknown` = Byte 19 (Vaxherd calls this byte 19)
- Database field `25_Unknown` = Byte 20 (Vaxherd calls this byte 20)
- Database field `26_Unknown` = Byte 21 (Vaxherd calls this byte 21)

### High Bits of Skill Bytes

The high bits of the six skill bytes encode:
- Action chance
- Action count
- HP regeneration

### Unknown Patterns

Monsters with unusual Byte 24 patterns that need more research:
- Spite Spirit: Has unusual bit patterns
- Ouphnest: Different mid bits
- Somnabeetle: Different mid bits
- Mystic Doll: Unusual patterns
- Chaos Hopper: Unusual patterns
- Radimvice: Unusual patterns

### Jubilant Flag

Some monsters may have a "Jubilant" flag in their data:
- Lighthouse Bengal: Is Jubilant
- Keeleon 5: Is NOT Jubilant (despite similar structure)

## ROM Location

Monster data tables are stored in one of the data banks. Further ROM analysis is needed to pinpoint the exact location.

## References

- [Cowness.net DW4 Notes](https://cowness.net/Speedrunning/DW4%20Notes/)
- Vaxherd's Discord notes (6/6/21)
- Dragon Warrior IV NES ROM analysis
