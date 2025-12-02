# Dragon Warrior IV ROM Structure

## Overview

This document details the internal structure of the Dragon Warrior IV (US NES) ROM file.

---

## File Structure

### iNES Header (Bytes $00-$0F)

```
Offset  Value   Description
------  -----   -----------
$00-03  4E 45 53 1A    "NES" + MS-DOS EOF marker
$04     10             PRG ROM size: 16 × 16KB = 256KB
$05     10             CHR ROM size: 16 × 8KB = 128KB
$06     42             Flags 6: Mapper low nibble + flags
                       Bit 0: Vertical mirroring
                       Bit 1: Battery-backed SRAM
                       Bit 2: No trainer
                       Bit 3: Four-screen VRAM (not used)
                       Bits 4-7: Mapper low nibble (4 = MMC3)
$07     00             Flags 7: Mapper high nibble (0)
$08     00             PRG RAM size (0 = 8KB assumed)
$09     00             TV system (0 = NTSC)
$0A     00             Flags 10 (unofficial)
$0B-0F  00 00 00 00 00 Padding
```

**Mapper:** (Flags7 & 0xF0) | (Flags6 >> 4) = 0x00 | 0x04 = **Mapper 4 (MMC3)**

---

## PRG ROM Layout

### File Offset to Bank Mapping

| Bank | File Offset | File End | Size | Content |
|------|-------------|----------|------|---------|
| 00 | $00010 | $0400F | 16KB | Main game engine |
| 01 | $04010 | $0800F | 16KB | Battle system |
| 02 | $08010 | $0C00F | 16KB | Menu/UI systems |
| 03 | $0C010 | $1000F | 16KB | Field/overworld engine |
| 04 | $10010 | $1400F | 16KB | Chapter 1 (Ragnar) |
| 05 | $14010 | $1800F | 16KB | Chapter 2 (Alena) |
| 06 | $18010 | $1C00F | 16KB | Chapter 3 (Taloon) |
| 07 | $1C010 | $2000F | 16KB | Chapter 4 (Sisters) |
| 08 | $20010 | $2400F | 16KB | Monster data tables |
| 09 | $24010 | $2800F | 16KB | Item/spell/equip data |
| 10 | $28010 | $2C00F | 16KB | Map data (part 1) |
| 11 | $2C010 | $3000F | 16KB | Map data (part 2) |
| 12 | $30010 | $3400F | 16KB | Dialog text (part 1) |
| 13 | $34010 | $3800F | 16KB | Dialog text (part 2) |
| 14 | $38010 | $3C00F | 16KB | Dialog text (part 3) |
| 15 | $3C010 | $4000F | 16KB | Fixed bank (vectors, init, core) |

### MMC3 Bank Configuration

MMC3 uses 8KB PRG banking. Each 16KB "bank" above is actually 2 × 8KB MMC3 banks:

| 16KB Bank | MMC3 8KB Banks |
|-----------|----------------|
| Bank 00 | 0, 1 |
| Bank 01 | 2, 3 |
| Bank 02 | 4, 5 |
| ... | ... |
| Bank 15 | 30, 31 |

**Fixed Banks:** MMC3 banks 30-31 ($3C010-$4000F) are always mapped to $C000-$FFFF.

---

## CHR ROM Layout

### File Offset to CHR Bank Mapping

| Bank | File Offset | File End | Size | Content |
|------|-------------|----------|------|---------|
| 00 | $40010 | $4200F | 8KB | Font/text tiles, UI elements |
| 01 | $42010 | $4400F | 8KB | Field sprites (hero, NPCs) |
| 02 | $44010 | $4600F | 8KB | Field tiles (overworld) |
| 03 | $46010 | $4800F | 8KB | Town/building tiles |
| 04 | $48010 | $4A00F | 8KB | Dungeon tiles |
| 05 | $4A010 | $4C00F | 8KB | Battle backgrounds |
| 06 | $4C010 | $4E00F | 8KB | Battle UI, effects |
| 07 | $4E010 | $5000F | 8KB | Monster sprites (set 1) |
| 08 | $50010 | $5200F | 8KB | Monster sprites (set 2) |
| 09 | $52010 | $5400F | 8KB | Monster sprites (set 3) |
| 10 | $54010 | $5600F | 8KB | Monster sprites (set 4) |
| 11 | $56010 | $5800F | 8KB | Character portraits |
| 12 | $58010 | $5A00F | 8KB | Chapter-specific graphics |
| 13 | $5A010 | $5C00F | 8KB | Special event graphics |
| 14 | $5C010 | $5E00F | 8KB | Title screen / ending |
| 15 | $5E010 | $6000F | 8KB | Miscellaneous |

*Note: Exact bank contents need verification through analysis.*

---

## Interrupt Vectors (Fixed Bank)

Located at end of PRG ROM (file offset $3FFFA):

| Address | File Offset | Vector | Purpose |
|---------|-------------|--------|---------|
| $FFFA | $3FFFA | NMI | VBlank handler - graphics updates |
| $FFFC | $3FFFC | RESET | Game initialization |
| $FFFE | $3FFFE | IRQ | Scanline counter (MMC3) |

---

## Known Data Locations

### Text and Dialog

| Description | Bank | File Offset | Size Est. |
|-------------|------|-------------|-----------|
| Main dialog | 12-14 | $30010-$3C00F | ~48KB |
| Item names | 09 | TBD | ~2KB |
| Monster names | 08 | TBD | ~2KB |
| Spell names | 09 | TBD | ~1KB |
| Menu strings | 02 | TBD | ~2KB |

### Monsters

| Description | Bank | File Offset | Size Est. |
|-------------|------|-------------|-----------|
| Monster stats | 08 | TBD | ~8KB |
| Monster AI | 08 | TBD | ~4KB |
| Monster graphics pointers | 08 | TBD | ~1KB |
| Drop tables | 08 | TBD | ~1KB |
| EXP/Gold tables | 08 | TBD | ~1KB |

### Items and Equipment

| Description | Bank | File Offset | Size Est. |
|-------------|------|-------------|-----------|
| Item properties | 09 | TBD | ~2KB |
| Equipment stats | 09 | TBD | ~3KB |
| Item effects | 09 | TBD | ~1KB |
| Shop inventories | 09 | TBD | ~1KB |
| Prices | 09 | TBD | ~512 bytes |

### Characters

| Description | Bank | File Offset | Size Est. |
|-------------|------|-------------|-----------|
| Base stats | Various | TBD | ~1KB |
| Stat growth tables | Various | TBD | ~4KB |
| Spell learning | Various | TBD | ~1KB |
| Equipment permissions | 09 | TBD | ~512 bytes |

### Maps

| Description | Bank | File Offset | Size Est. |
|-------------|------|-------------|-----------|
| Overworld maps | 10-11 | TBD | ~16KB |
| Town layouts | 10-11 | TBD | ~8KB |
| Dungeon layouts | 10-11 | TBD | ~8KB |
| Tile properties | 10 | TBD | ~2KB |
| Warp data | 10-11 | TBD | ~2KB |

---

## Compression

DW4 likely uses compression for:

### Possible Compression Types

1. **RLE (Run-Length Encoding)**
   - Common for map data
   - Patterns: repeated tile runs

2. **Dictionary/LZ Compression**
   - Possible for dialog text
   - Reduces repeated phrases

3. **Huffman Coding**
   - Less common on NES
   - Possible for text

### Compression Detection

To identify compressed data:
- Look for size headers
- Check for control bytes (high bit flags)
- Compare compressed vs expected uncompressed size
- Watch for decompression routines

---

## Memory Map During Gameplay

### Typical Configuration

```
$0000-$00FF   Zero page (fast variables)
$0100-$01FF   Stack
$0200-$02FF   OAM buffer (sprite data)
$0300-$05FF   Game state, current scene data
$0600-$07FF   Scratch buffers

$6000-$7FFF   SRAM (save data, battery-backed)
              Also used as extended RAM during gameplay

$8000-$9FFF   PRG Bank 0 (switchable)
$A000-$BFFF   PRG Bank 1 (switchable)  
$C000-$DFFF   PRG Bank 2 (often Bank 15 lower half)
$E000-$FFFF   PRG Bank 3 (always Bank 15 upper half)
```

### SRAM Layout ($6000-$7FFF)

See detailed documentation in SRAM_MAP.md

Key areas:
- $6001-$60F0: Party member data (8 characters × 30 bytes)
- $60F1-$610E: Party order and wagon status
- $610F-$611A: Extra companion data (2 × 6 bytes)
- $611B-$615A: General game progress
- $615B-$6277: Chapter/flag data
- $6278-$7FFF: Extended game state

---

## Address Conversion Reference

### File Offset to PRG Bank

```
PRG_bank = (file_offset - 0x10) / 0x4000
offset_in_bank = (file_offset - 0x10) % 0x4000
```

### File Offset to CPU Address (for analysis)

For switchable banks (loaded at $8000):
```
cpu_address = 0x8000 + offset_in_bank
```

For fixed bank (bank 15, loaded at $C000):
```
cpu_address = 0xC000 + offset_in_bank
```

### CPU Address to File Offset

For fixed bank only ($C000-$FFFF):
```
file_offset = cpu_address - 0xC000 + 0x3C010
```

For switchable banks (need to know which bank):
```
file_offset = (bank * 0x4000) + (cpu_address - 0x8000) + 0x10
```

---

## ROM Verification

### Checksums

| Type | Value |
|------|-------|
| CRC32 | TBD (run rom_analyzer.py) |
| MD5 | TBD |
| SHA1 | TBD |
| File Size | 393,232 bytes |

### Header Verification

```python
# Python verification
with open('rom.nes', 'rb') as f:
    header = f.read(16)
    assert header[0:4] == b'NES\x1a'  # Magic number
    assert header[4] == 0x10          # 16 PRG banks
    assert header[5] == 0x10          # 16 CHR banks
    mapper = (header[7] & 0xF0) | (header[6] >> 4)
    assert mapper == 4                # MMC3
```

---

## Quick Reference

### Common File Offsets

| Content | Start | End |
|---------|-------|-----|
| Header | $00000 | $0000F |
| PRG Bank 00 | $00010 | $0400F |
| PRG Bank 15 | $3C010 | $4000F |
| CHR Bank 00 | $40010 | $4200F |
| CHR Bank 15 | $5E010 | $6000F |
| Reset Vector | $3FFFC | $3FFFD |
| NMI Vector | $3FFFA | $3FFFB |

### Key Sizes

| Component | Size |
|-----------|------|
| iNES Header | 16 bytes |
| PRG Bank | 16,384 bytes (0x4000) |
| CHR Bank | 8,192 bytes (0x2000) |
| Total PRG | 262,144 bytes (256KB) |
| Total CHR | 131,072 bytes (128KB) |
| Full ROM | 393,232 bytes |
