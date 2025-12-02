# Dragon Warrior IV Quick Reference

A fast lookup guide for common values, addresses, and commands.

## 📍 Memory Map Quick Reference

### RAM ($0000-$07FF)
| Address | Size | Description |
|---------|------|-------------|
| $0000-$00FF | 256 | Zero Page (fast access) |
| $0100-$01FF | 256 | Stack |
| $0200-$02FF | 256 | OAM buffer (sprites) |
| $0300-$07FF | 1280 | General RAM |

### Common RAM Addresses
| Address | Description |
|---------|-------------|
| $0010-$001F | Temp variables |
| $0020-$002F | Controller input |
| $0030-$003F | Frame counter |
| $0060-$007F | Current party data pointers |
| $0100-$01FF | Stack |
| $0200-$02FF | Sprite OAM buffer |
| $0300-$03FF | Game state flags |
| $0400-$04FF | Battle data |
| $0500-$05FF | Map data |
| $0600-$06FF | Text buffer |
| $0700-$07FF | Misc variables |

### SRAM ($6000-$7FFF)
| Address | Size | Description |
|---------|------|-------------|
| $6000-$60FF | 256 | Save slot 1 |
| $6100-$61FF | 256 | Save slot 2 |
| $6200-$62FF | 256 | Save slot 3 |
| $6300-$7FFF | 7424 | Expanded save data |

### PPU Registers ($2000-$2007)
| Address | Name | Description |
|---------|------|-------------|
| $2000 | PPUCTRL | NMI, sprites, BG, addressing |
| $2001 | PPUMASK | Color, sprites, BG enable |
| $2002 | PPUSTATUS | Vblank, sprite 0, overflow |
| $2003 | OAMADDR | OAM address |
| $2004 | OAMDATA | OAM data |
| $2005 | PPUSCROLL | Scroll position |
| $2006 | PPUADDR | VRAM address |
| $2007 | PPUDATA | VRAM data |

### APU Registers ($4000-$4017)
| Address | Description |
|---------|-------------|
| $4000-$4003 | Pulse 1 |
| $4004-$4007 | Pulse 2 |
| $4008-$400B | Triangle |
| $400C-$400F | Noise |
| $4010-$4013 | DMC |
| $4015 | Status |
| $4017 | Frame counter |

### MMC3 Registers ($8000-$FFFF)
| Address | Description |
|---------|-------------|
| $8000 | Bank select |
| $8001 | Bank data |
| $A000 | Mirroring |
| $A001 | PRG RAM protect |
| $C000 | IRQ latch |
| $C001 | IRQ reload |
| $E000 | IRQ disable |
| $E001 | IRQ enable |

## 📦 ROM Bank Reference

### PRG Banks (16KB each)
| Bank | File Offset | Contents |
|------|-------------|----------|
| 00 | $00010-$04010 | Game engine, main loop |
| 01 | $04010-$08010 | Battle system |
| 02 | $08010-$0C010 | Menu system |
| 03 | $0C010-$10010 | Map engine |
| 04 | $10010-$14010 | NPC/Event scripts |
| 05 | $14010-$18010 | Text data 1 |
| 06 | $18010-$1C010 | Text data 2 |
| 07 | $1C010-$20010 | Monster data |
| 08 | $20010-$24010 | Item/Equipment data |
| 09 | $24010-$28010 | Character data |
| 10 | $28010-$2C010 | Map data 1 |
| 11 | $2C010-$30010 | Map data 2 |
| 12 | $30010-$34010 | Map data 3 |
| 13 | $34010-$38010 | Music data |
| 14 | $38010-$3C010 | Sound effects |
| 15 | $3C010-$40010 | Fixed bank (vectors, init) |

### CHR Banks (8KB each)
| Bank | File Offset | Contents |
|------|-------------|----------|
| 00-01 | $40010-$44010 | Font, UI tiles |
| 02-03 | $44010-$48010 | Overworld tiles |
| 04-05 | $48010-$4C010 | Town tiles |
| 06-07 | $4C010-$50010 | Dungeon tiles |
| 08-09 | $50010-$54010 | Battle backgrounds |
| 10-11 | $54010-$58010 | Character sprites |
| 12-13 | $58010-$5C010 | Monster sprites 1 |
| 14-15 | $5C010-$60010 | Monster sprites 2 |

## 🔢 Data Structure Sizes

| Type | Size | Count | Total |
|------|------|-------|-------|
| Monster | 14 bytes | ~180 | ~2,520 bytes |
| Item | 8 bytes | 126 | 1,008 bytes |
| Spell | 6 bytes | ~70 | ~420 bytes |
| Character Base | 30 bytes | 10 | 300 bytes |
| Map Header | 16 bytes | 73+ | ~1,168 bytes |

## 🧮 Address Calculations

### File Offset to ROM Address
```
ROM_Address = File_Offset - $10
```

### ROM Address to File Offset
```
File_Offset = ROM_Address + $10
```

### Bank to File Offset (PRG)
```
File_Offset = (Bank_Number * $4000) + $10
```

### CPU Address to File Offset
```
If CPU >= $C000 (fixed bank):
    File_Offset = ($3C000 + (CPU - $C000)) + $10
Else if CPU >= $8000:
    File_Offset = (Current_Bank * $4000) + (CPU - $8000) + $10
```

## 🎮 Controller Bits

| Bit | Button |
|-----|--------|
| 7 | A |
| 6 | B |
| 5 | Select |
| 4 | Start |
| 3 | Up |
| 2 | Down |
| 1 | Left |
| 0 | Right |

## 📝 Text Control Codes

| Code | Meaning |
|------|---------|
| $00 | End of string |
| $01 | New line |
| $02 | Clear window |
| $03-$05 | Wait/pause |
| $06 | Hero name |
| $07-$0F | Character names |
| $10-$1F | Item names (by ID) |
| $20-$7F | Standard ASCII range |
| $80-$FF | Extended characters |

## 🛠️ Tool Commands

### ROM Analyzer
```powershell
# Analyze ROM
python tools/rom_analyzer.py analyze roms/dw4.nes

# Dump bank info
python tools/rom_analyzer.py banks roms/dw4.nes

# Find patterns
python tools/rom_analyzer.py search roms/dw4.nes --pattern "AA BB CC"
```

### Asset Extractor
```powershell
# Extract all assets
python tools/asset_extractor.py extract-all roms/dw4.nes

# Extract specific type
python tools/asset_extractor.py monsters roms/dw4.nes -o assets/data/monsters.bin
python tools/asset_extractor.py items roms/dw4.nes -o assets/data/items.bin
python tools/asset_extractor.py text roms/dw4.nes -o assets/text/
python tools/asset_extractor.py graphics roms/dw4.nes -o assets/graphics/
```

### Asset Reinserter
```powershell
# Reinsert modified assets
python tools/asset_reinserter.py monsters assets/data/monsters.bin build/dw4.nes
python tools/asset_reinserter.py all build/dw4.nes
```

### Universal Editor
```powershell
# Edit monster data
python tools/universal_editor.py monster edit 0 --hp 100 --attack 50

# Edit item data
python tools/universal_editor.py item edit 0 --price 100
```

## 🔨 Build Commands

### Full Build
```powershell
# PowerShell
.\scripts\build.ps1

# Or with Python
python tools/build.py
```

### Verify ROM
```powershell
# Check ROM integrity
python tools/rom_analyzer.py verify build/dw4.nes --checksum
```

### Run Tests
```powershell
pytest tests/ -v
```

## 📊 Hex Value Quick Reference

### Common Values
| Hex | Decimal | Description |
|-----|---------|-------------|
| $00 | 0 | Null/End |
| $FF | 255 | Max byte |
| $10 | 16 | iNES header size |
| $4000 | 16384 | PRG bank size |
| $2000 | 8192 | CHR bank size |
| $0800 | 2048 | RAM size |
| $2000 | 8192 | SRAM size |

### Power of 2
| Hex | Decimal |
|-----|---------|
| $01 | 1 |
| $02 | 2 |
| $04 | 4 |
| $08 | 8 |
| $10 | 16 |
| $20 | 32 |
| $40 | 64 |
| $80 | 128 |

### Bit Masks
| Hex | Binary | Use |
|-----|--------|-----|
| $01 | 00000001 | Bit 0 |
| $02 | 00000010 | Bit 1 |
| $04 | 00000100 | Bit 2 |
| $08 | 00001000 | Bit 3 |
| $10 | 00010000 | Bit 4 |
| $20 | 00100000 | Bit 5 |
| $40 | 01000000 | Bit 6 |
| $80 | 10000000 | Bit 7 |
| $0F | 00001111 | Low nibble |
| $F0 | 11110000 | High nibble |
| $FF | 11111111 | All bits |

## 🎯 Monster Type IDs

| ID | Type |
|----|------|
| $00-$1F | Chapter 1 monsters |
| $20-$3F | Chapter 2 monsters |
| $40-$5F | Chapter 3 monsters |
| $60-$7F | Chapter 4 monsters |
| $80-$AF | Chapter 5 monsters |
| $B0-$BF | Boss monsters |

## 🗺️ Map Type IDs

| ID Range | Type |
|----------|------|
| $00-$0F | World maps |
| $10-$2F | Towns |
| $30-$4F | Dungeons |
| $50-$5F | Castles |
| $60-$6F | Caves |
| $70-$7F | Special areas |

## 🧙 Character IDs

| ID | Character |
|----|-----------|
| $00 | Hero |
| $01 | Ragnar |
| $02 | Alena |
| $03 | Cristo |
| $04 | Brey |
| $05 | Taloon |
| $06 | Mara |
| $07 | Nara |
| $08 | Companion 1 |
| $09 | Companion 2 |

## ⚔️ Equipment Slots

| Slot | Type |
|------|------|
| 0 | Weapon |
| 1 | Armor |
| 2 | Shield |
| 3 | Helmet |
| 4 | Accessory |

---

*Quick Reference v1.0 - 2025-12-01*
