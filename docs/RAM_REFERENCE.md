# Dragon Warrior IV RAM/SRAM Data Reference

Comprehensive reference for runtime memory and save data structures.

## Memory Overview

### Memory Regions

| Region | Address Range | Size | Description |
|--------|---------------|------|-------------|
| Zero Page | $0000-$00FF | 256 bytes | Fast access variables |
| Stack | $0100-$01FF | 256 bytes | CPU stack |
| RAM | $0200-$07FF | 1536 bytes | General purpose RAM |
| WRAM (SRAM) | $6000-$7FFF | 8192 bytes | Battery-backed save RAM |
| PPU Registers | $2000-$2007 | 8 bytes | Graphics control |
| APU Registers | $4000-$4017 | 24 bytes | Audio control |
| PRG ROM | $8000-$FFFF | 32768 bytes | Switchable + fixed banks |

## System RAM ($0000-$07FF)

### Map/Location Data

| Address | Size | Description |
|---------|------|-------------|
| $063 | 1 byte | Current Map Number |
| $064 | 1 byte | Current Sub-Map Number |

## WRAM/SRAM ($6000-$7FFF)

### Party Member Data Structure (30 bytes each)

Each playable character uses a 30-byte block:

| Offset | Size | Description |
|--------|------|-------------|
| +$00 | 1 byte | Status flags (see below) |
| +$01-$02 | 2 bytes | Current HP (little-endian) |
| +$03-$04 | 2 bytes | Current MP (little-endian) |
| +$05 | 1 byte | Level |
| +$06 | 1 byte | Strength |
| +$07 | 1 byte | Agility |
| +$08 | 1 byte | Vitality |
| +$09 | 1 byte | Intelligence |
| +$0A | 1 byte | Luck |
| +$0B | 1 byte | Unknown |
| +$0C-$0D | 2 bytes | Maximum HP |
| +$0E-$0F | 2 bytes | Maximum MP |
| +$10-$12 | 3 bytes | Current Experience (24-bit) |
| +$13-$1A | 8 bytes | Item slots 1-8 |
| +$1B | 1 byte | Battle spells (bits 1-8) |
| +$1C | 1 byte | Battle spells (bits 9-16) |
| +$1D | 1 byte | Overworld spells |

### Status Flags Byte (offset +$00)

| Bit | Mask | Description |
|-----|------|-------------|
| 7 | $80 | 1 = Alive, 0 = Dead |
| 6 | $40 | Paralyzed |
| 5 | $20 | Poisoned |
| 4-0 | $1F | Unknown/Reserved |

### Character Addresses

| Character | Address Range | Index |
|-----------|---------------|-------|
| Hero | $6001-$601E | $00 |
| Cristo | $601F-$603C | $01 |
| Nara | $603D-$605A | $02 |
| Mara | $605B-$6078 | $03 |
| Brey | $6079-$6096 | $04 |
| Taloon | $6097-$60B4 | $05 |
| Ragnar | $60B5-$60D2 | $06 |
| Alena | $60D3-$60F0 | $07 |
| (Unused) | $60F1-$610E | $08 |
| Extra Companion #1 | $610F-$6114 | $09 |
| Extra Companion #2 | $6115-$611A | $0A |

### Extra Companion Structure (6 bytes)

| Offset | Size | Description |
|--------|------|-------------|
| +$00 | 1 byte | Status flags |
| +$01-$02 | 2 bytes | Current HP |
| +$03-$04 | 2 bytes | Current MP |
| +$05 | 1 byte | Companion ID (see values) |

### Extra Companion Values

| Value | Name | Chapter | Class |
|-------|------|---------|-------|
| $C5 | Healie | 1 | Kind Healer |
| $C6 | Orin | 4 | Alchemist |
| $C7 | Laurent | 3 | Troubadour |
| $C8 | Strom | 3 | Guardsman |
| $C9 | Hector | 5 | Young Man |
| $CA | Panon | 5 | Jester |
| $CB | Lucia | 5 | Zenithian |
| $CC | Doran | 5 | Baby Dragon |

## General Game Data

| Address | Size | Description |
|---------|------|-------------|
| $6157-$6159 | 3 bytes | Gold (24-bit little-endian) |
| $615A | 1 byte | Chapter Number (0-4) |
| $615B | 1 byte | Battle Tactics |
| $6165-$6167 | 3 bytes | Return spell locations (bits) |
| $616A-$616D | 4 bytes | Party order |
| $625D-$6277 | 27 bytes | Treasure chest flags |
| $62AD-$62AF | 3 bytes | Casino coins |
| $62E7 | 1 byte | Ch3 Lakanaba Shop - Boomerang count |
| $62E8 | 1 byte | Ch3 Lakanaba Shop - Chain Sickle count |
| $62E9 | 1 byte | Ch3 Lakanaba Shop - Sword of Malice count |
| $62ED | 1 byte | Day/Night cycle counter |

### Chapter Values

| Value | Description |
|-------|-------------|
| $00 | Chapter 1 - Ragnar |
| $01 | Chapter 2 - Alena, Cristo, Brey |
| $02 | Chapter 3 - Taloon |
| $03 | Chapter 4 - Mara, Nara |
| $04 | Chapter 5 - Hero |

### Battle Tactics Values

| Value | Tactic |
|-------|--------|
| $00 | Normal |
| $01 | Save MP |
| $02 | Offensive |
| $03 | Defensive |
| $04 | Try Out |
| $05 | Use No MP |

### Day/Night Cycle

Inn sets time to $28. Cycle resets after $CB.

| Range | Length | Description |
|-------|--------|-------------|
| $00-$27 | 40 | Day |
| $28-$77 | 80 | Day (after Inn) |
| $78-$7B | 4 | Afternoon |
| $7C-$7F | 4 | Dusk |
| $80-$83 | 4 | Evening |
| $84-$BF | 60 | Night |
| $C0-$C3 | 4 | Pre-dawn |
| $C4-$C7 | 4 | Dawn |
| $C8-$CB | 4 | Morning |

## Return Spell Locations

### Byte $6165
| Bit | Location |
|-----|----------|
| 0 | Branca |
| 1 | Endor |
| 2 | Bonmalmo |
| 3 | Aneaux |
| 4 | Konenber |
| 5 | Mintos |
| 6 | Soretta |
| 7 | Keeleon |

### Byte $6166
| Bit | Location |
|-----|----------|
| 0 | Haville |
| 1 | Monbaraba |
| 2 | Santeem |
| 3 | Tempe |
| 4 | Stancia |
| 5 | Burland |
| 6 | Izmit |
| 7 | Gardenbur |

### Byte $6167
| Bit | Location |
|-----|----------|
| 0 | Rosaville |
| 1 | Riverton |
| 2 | Dire Palace |
| 3 | Aktemto |
| 4 | Gottside |
| 5 | Zenithia |
| 6 | Last Refuge |
| 7 | (Invalid - ocean) |

## Character Spell Bitmasks

### Hero Battle Spells

**Byte $601C:**
| Bit | Spell |
|-----|-------|
| 0 | Expel |
| 1 | Healmore |
| 2 | Blaze |
| 3 | Return |
| 4 | Sleepmore |
| 5 | Awake |
| 6 | Firebal |
| 7 | Healall |

**Byte $601D:**
| Bit | Spell |
|-----|-------|
| 0 | Ironize |
| 1 | FendSpell |
| 2 | Zap |
| 3 | Transform |
| 4 | Boom |
| 5 | Healusall |
| 6 | Lightning |
| 7 | Vivify |

**Byte $601E (bits 0-1):**
| Bit | Spell |
|-----|-------|
| 0 | Thordain |
| 1 | Chance |

### Hero Overworld Spells

**Byte $601E (bits 2-7):**
| Bit | Spell |
|-----|-------|
| 2 | Return |
| 3 | Healmore |
| 4 | Repel |
| 5 | Outside |
| 6 | Healall |
| 7 | Vivify |

## Item Values

Items use 7-bit indices ($00-$7F). Bit 7 ($80) indicates equipped.

### Equipment ($00-$50)

| Range | Type |
|-------|------|
| $00-$23 | Weapons |
| $24-$3C | Armor |
| $3D-$45 | Shields |
| $46-$50 | Helmets/Accessories |

### Consumables ($52-$7E)

| Value | Item |
|-------|------|
| $52 | Baron's Horn |
| $53 | Medical Herb |
| $54 | Antidote Herb |
| $55 | Fairy Water |
| $56 | Wing of Wyvern |
| $57 | Leaf of World Tree |
| $58 | Full Moon Herb |
| $59 | Wizard's Ring |
| $5A | Magic Potion |
| $5B | Dew of World Tree |
| ... | ... |

### Special Values

| Value | Meaning |
|-------|---------|
| $51 | Blank separator |
| $7F | No item / Empty slot |

## Map Tile Data (Runtime)

| Address | Size | Description |
|---------|------|-------------|
| $6EFE | $20 bytes | Unknown (initialized to $FF) |
| $6F20 | $20 bytes | Wall smoothing flags |
| $6F40 | $40 bytes | Tile behavior table |
| $7600 | $C0 bytes | Tile numbers (32 tiles + roof) |
| $76C0 | $40 bytes | Tile attributes |
| $7800 | Variable | Current map data |

### Map Tile Format

```
Format: RRRttttt
  ttttt (bits 0-4) = Tile number (0-31)
  RRR   (bits 5-7) = Roof number (0-7, 0 = no roof)
```

## Treasure Chest Flags

27 bytes at $625D-$6277 track whether chests have been opened.
Each bit represents one chest (0 = available, 1 = opened).

See full chest documentation in RAM map for specific locations.

---

*Data Reference v1.0 - Based on GameInfo Wiki documentation*
