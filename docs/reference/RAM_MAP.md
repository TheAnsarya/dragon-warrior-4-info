# Dragon Warrior IV (NES) - RAM Map

## Source
Extracted from GameInfo wiki documentation and Mesen debugger analysis.

## System RAM ($0000-$07FF)

| Address | Size | Category | Description |
|---------|------|----------|-------------|
| $000-$062 | - | ??? | Unknown |
| $063 | byte | World | Map Number |
| $064 | byte | World | Sub-Map Number |
| $065-$7FF | - | ??? | Unknown |

## WRAM ($6000-$7FFF)

Battery-backed save RAM.

### Party Members ($6001-$610E)

Each party member uses 30 bytes (0x1E).

| Address Range | Size | Character | Index |
|---------------|------|-----------|-------|
| $6001-$601E | 30 | Hero | $00 |
| $601F-$603C | 30 | Cristo | $01 |
| $603D-$605A | 30 | Nara | $02 |
| $605B-$6078 | 30 | Mara | $03 |
| $6079-$6096 | 30 | Brey | $04 |
| $6097-$60B4 | 30 | Taloon | $05 |
| $60B5-$60D2 | 30 | Ragnar | $06 |
| $60D3-$60F0 | 30 | Alena | $07 |
| $60F1-$610E | 30 | (Unused) | $08 |
| $610F-$6114 | 6 | Extra Companion #1 | $09 |
| $6115-$611A | 6 | Extra Companion #2 | $0A |

### Party Member Structure (30 bytes)

Offset from party member base address:

| Offset | Size | Description |
|--------|------|-------------|
| +$00 | byte | Status flags |
| +$00 bit 5 | - | Poisoned |
| +$00 bit 6 | - | Paralyzed |
| +$00 bit 7 | - | 1=Alive, 0=Dead |
| +$01-$02 | word | Current HP |
| +$03-$04 | word | Current MP |
| +$05 | byte | Level |
| +$06 | byte | Strength |
| +$07 | byte | Agility |
| +$08 | byte | Vitality |
| +$09 | byte | Intelligence |
| +$0A | byte | Luck |
| +$0B | byte | ??? |
| +$0C-$0D | word | Maximum HP |
| +$0E-$0F | word | Maximum MP |
| +$10-$12 | 3 bytes | Current XP (24-bit) |
| +$13-$1A | 8 bytes | Item slots #1-#8 |
| +$1B | byte | Battle spells byte 1 |
| +$1C | byte | Battle spells byte 2 |
| +$1D | byte | Overworld spells |

### Extra Companion Structure (6 bytes)

| Offset | Size | Description |
|--------|------|-------------|
| +$00 | byte | Status flags (same as party) |
| +$01-$02 | word | Current HP |
| +$03-$04 | word | Current MP |
| +$05 | byte | Which Companion (see values) |

### General Game State

| Address | Size | Category | Description |
|---------|------|----------|-------------|
| $6157-$6159 | 3 bytes | General | Gold (24-bit) |
| $615A | byte | General | Chapter Number |
| $615B | byte | General | Battle Tactics |
| $6165-$6167 | 3 bytes | General | Return Locations (bitfield) |
| $616A-$616D | 4 bytes | General | Party Order |
| $625D-$6277 | 27 bytes | General | Treasure Chest Flags |
| $6292 | byte | General | Party Members (?) |
| $62AD-$62AF | 3 bytes | General | Casino Coins |
| $62E7 | byte | Ch. 3 | Lakanaba Shop - Boomerang Count |
| $62E8 | byte | Ch. 3 | Lakanaba Shop - Chain Sickle Count |
| $62E9 | byte | Ch. 3 | Lakanaba Shop - Sword of Malice Count |
| $62ED | byte | General | Day/Night Counter |

### Map/Tileset Data

| Address Range | Size | Description |
|---------------|------|-------------|
| $6EFE | 0x20 | ??? (initialized to $FF) |
| $6F20 | 0x20 | Smoothing Flags (wall tile selection) |
| $6F40 | 0x40 | Tile Behaviors (32 tiles + roof) |
| $7600 | 0xC0 | Tile numbers for current tileset |
| $76C0 | 0x40 | Attribute values for current tileset |
| $7800 | ??? | Map data for current map |

### Map Data Format

Each map tile byte: `RRRttttt`
- `ttttt` (bits 0-4): Tile number 0-31
- `RRR` (bits 5-7): Roof number 0-7 (0 = no roof)

## Hero Spells (Example)

### Battle Spells ($601C-$601E bits)

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

### Overworld Spells ($601E bits 2-7)

| Bit | Spell |
|-----|-------|
| 2 | Return |
| 3 | Healmore |
| 4 | Repel |
| 5 | Outside |
| 6 | Healall |
| 7 | Vivify |

---

## Return Locations ($6165-$6167)

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
| 7 | "Infsnip" (invalid - ocean) |
