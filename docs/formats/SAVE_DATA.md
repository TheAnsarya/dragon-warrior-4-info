# Dragon Warrior IV - Save Data Format

## Overview

DW4 uses battery-backed SRAM ($6000-$7FFF, 8KB) to store save data and current game state. The game supports 3 save slots.

## Memory Layout

| Address Range | Size | Description |
|---------------|------|-------------|
| $6000-$62EE | 751 | Current game state |
| $62EF-$65DE | 752 | Save File 1 |
| $65DF-$68CE | 752 | Save File 2 |
| $68CF-$6BBE | 752 | Save File 3 |
| $6BBF-$7FFF | ~5185 | Additional RAM/workspace |

## Current Game State ($6000-$62EE)

This area holds the active game data loaded from a save slot.

### Party HP/MP ($6000-$603F)

Each character has 8 bytes of HP/MP data, indexed by character slot:

| Offset | Size | Field |
|--------|------|-------|
| +$00 | 2 | Current HP (low/high) |
| +$02 | 2 | Current MP (low/high) |
| +$04 | 2 | Max HP (low/high) |
| +$06 | 2 | Max MP (low/high) |

**Character Slots:**
| Slot | Character (Ch5) |
|------|-----------------|
| 0 | Hero |
| 1 | Ragnar |
| 2 | Alena |
| 3 | Cristo |
| 4 | Brey |
| 5 | Taloon |
| 6 | Mara |
| 7 | Nara |

### Experience ($6018-$602F)

| Address | Field |
|---------|-------|
| $601C,X | Experience high byte (indexed) |

Experience is stored as 3 bytes per character for up to 16,777,215 EXP.

### Battle State ($6150-$61FF)

See [RAM_MAP.md](RAM_MAP.md) for detailed battle state documentation.

## Save File Structure (752 bytes)

Each save slot contains:

### Header ($00-$0F)

| Offset | Size | Field |
|--------|------|-------|
| $00 | 2 | Checksum |
| $02 | 1 | Chapter number (0-4) |
| $03 | 1 | Sub-chapter progress |
| $04 | 2 | Gold (low/high) |
| $06 | 2 | Casino coins |
| $08 | 4 | Play time (frames) |
| $0C | 2 | Day/night cycle value |
| $0E | 2 | Reserved |

### Chapter Values

| Value | Chapter |
|-------|---------|
| $00 | Chapter 1 (Ragnar) |
| $01 | Chapter 2 (Alena) |
| $02 | Chapter 3 (Taloon) |
| $03 | Chapter 4 (Nara/Mara) |
| $04 | Chapter 5 (Hero) |

### Party Configuration ($10-$2F)

| Offset | Size | Field |
|--------|------|-------|
| $10 | 4 | Active party (4 slots) |
| $14 | 4 | Wagon party (4 slots) |
| $18 | 1 | Party count |
| $19 | 1 | Wagon count |
| $1A-$1F | 6 | Reserved |

**Party Slot Values:**
- $00-$07: Character ID
- $FF: Empty slot

### Character Stats ($20-$11F)

8 characters × 32 bytes = 256 bytes

| Offset | Size | Field |
|--------|------|-------|
| +$00 | 8 | Name (null-terminated) |
| +$08 | 1 | Level |
| +$09 | 3 | Experience (24-bit) |
| +$0C | 2 | Current HP |
| +$0E | 2 | Max HP |
| +$10 | 2 | Current MP |
| +$12 | 2 | Max MP |
| +$14 | 2 | Strength |
| +$16 | 2 | Agility |
| +$18 | 2 | Vitality |
| +$1A | 2 | Intelligence |
| +$1C | 2 | Luck |
| +$1E | 1 | Status effects |
| +$1F | 1 | Reserved |

### Equipment ($120-$15F)

8 characters × 8 bytes = 64 bytes

| Offset | Size | Field |
|--------|------|-------|
| +$00 | 1 | Weapon |
| +$01 | 1 | Armor |
| +$02 | 1 | Shield |
| +$03 | 1 | Helmet |
| +$04 | 1 | Accessory 1 |
| +$05 | 1 | Accessory 2 |
| +$06-$07 | 2 | Reserved |

### Inventory ($160-$1BF)

| Offset | Size | Field |
|--------|------|-------|
| $160 | 64 | Bag items (64 slots) |
| $1A0 | 32 | Important items |

### Spells Known ($1C0-$1FF)

8 characters × 8 bytes = 64 bytes

Bit flags for learned spells.

### World State ($200-$2DF)

| Offset | Size | Field |
|--------|------|-------|
| $200 | 64 | Event flags |
| $240 | 64 | Treasure chests opened |
| $280 | 32 | NPC state flags |
| $2A0 | 32 | Door/lock state |
| $2C0 | 32 | Miscellaneous flags |

### Location ($2E0-$2EF)

| Offset | Size | Field |
|--------|------|-------|
| $2E0 | 1 | Map ID |
| $2E1 | 1 | X coordinate |
| $2E2 | 1 | Y coordinate |
| $2E3 | 1 | Direction facing |
| $2E4-$2EF | 12 | Reserved |

## Day/Night Cycle

The day/night value ($0C-$0D in save) cycles through ranges:

| Range | Length | Period |
|-------|--------|--------|
| $00-$27 | 40 | Day |
| $28-$77 | 80 | Day (after inn) |
| $78-$7B | 4 | Afternoon |
| $7C-$7F | 4 | Dusk |
| $80-$83 | 4 | Evening |
| $84-$BF | 60 | Night |
| $C0-$C3 | 4 | Dawn |
| $C4-$FF | 60 | Early morning |

Each step increments the counter by 1. Full cycle = 256 steps.

## Checksum Calculation

The checksum is calculated over the save data:

```asm
calculate_checksum:
    LDA #$00
    STA checksum_lo
    STA checksum_hi
    LDY #$02              ; Start after checksum bytes
.loop:
    CLC
    LDA (save_ptr),Y
    ADC checksum_lo
    STA checksum_lo
    LDA #$00
    ADC checksum_hi
    STA checksum_hi
    INY
    CPY #save_size
    BNE .loop
    RTS
```

## Battle Tactics Save

Chapter 5 saves the current tactic setting:

| Value | Tactic |
|-------|--------|
| $00 | Normal |
| $01 | Save MP |
| $02 | Offensive |
| $03 | Defensive |
| $04 | Try Out |
| $05 | Use No MP |

## Status Effect Byte

| Bit | Status |
|-----|--------|
| 0 | Poison |
| 1 | Sleep |
| 2 | Surround |
| 3 | Confused |
| 4 | Silenced |
| 5 | Paralyzed |
| 6 | Dead |
| 7 | Cursed |

## Save/Load Process

### Saving

1. Copy current state to selected slot
2. Calculate checksum
3. Write checksum to header
4. Battery maintains data

### Loading

1. Read slot checksum
2. Calculate checksum over data
3. Compare checksums
4. If match, copy to current state
5. If mismatch, show "Adventure Log damaged"

## SRAM Battery

- Type: CR2032 or equivalent
- Voltage: 3V
- Typical life: 15-20 years
- Failure mode: Data corruption/loss

## Comparison: DW4 vs DQ3r

| Feature | DW4 (NES) | DQ3r (SNES) |
|---------|-----------|-------------|
| SRAM Size | 8KB | 8KB |
| Save Slots | 3 | 3 |
| Checksum | 16-bit sum | CRC |
| Compression | None | None |
| Quick Save | No | Yes (suspend) |

## Files

- [chapters.json](../assets/json/chapters.json) - Chapter definitions
- [RAM_MAP.md](formats/RAM_MAP.md) - Full RAM documentation
- [cowness_labels.txt](../data/cowness_labels.txt) - Save data labels
