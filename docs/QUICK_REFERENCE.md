# Dragon Warrior IV - Quick Reference

## ROM Info

| Property | Value |
|----------|-------|
| **System** | NES / Famicom |
| **Mapper** | MMC3 (iNES #4) |
| **PRG-ROM** | 512KB (32 × 16KB banks) |
| **CHR-ROM** | None (CHR-RAM) |
| **CHR-RAM** | 8KB |
| **SRAM** | 8KB (battery-backed) |
| **Mirroring** | Vertical |

## Key Memory Addresses

### Zero Page ($00-$FF)

| Address | Name | Purpose |
|---------|------|---------|
| $00-$03 | tmp0-tmp3 | Scratch registers |
| $04-$07 | ptr0-ptr1 | Pointer pairs |
| $12-$13 | RNG_Seed | Random seed (lo/hi) |
| $18 | Encounter_Rate | Steps until encounter |
| $96 | char_index | Current character slot |

### Work RAM ($6000-$7FFF)

| Address | Purpose |
|---------|---------|
| $6000-$600F | Party HP/MP (indexed) |
| $601C,X | Experience high byte |
| $615A | Current battle actor |
| $616A | Battle action data |
| $618E | Battle state flags |
| $6195-$6196 | Battle counters |
| $6E80 | Battle mode/state |
| $72F4,X | Character state array |
| $75E8 | Action jump index |

### Save Slots

| Slot | Address Range |
|------|---------------|
| Current | $6000-$62EE |
| Save 1 | $62EF-$65DE |
| Save 2 | $65DF-$68CE |
| Save 3 | $68CF-$6BBE |

## Bank Quick Reference

### Code Banks

| Bank | Offset | Primary Purpose |
|------|--------|-----------------|
| 16 | $40010 | Battle entry |
| 17 | $44010 | Battle actions |
| 18 | $48010 | Party management |
| **19** | $4C010 | **Core calculations** |
| 20 | $50010 | Enemy AI |
| 21 | $54010 | Damage formulas |
| 22 | $58010 | Spell effects |
| 23 | $5C010 | Status effects |
| **31** | $7C010 | **Fixed bank** |

### Data Banks

| Bank | Content |
|------|---------|
| 0-4 | Map/tileset data |
| 5 | Menu text |
| 6 | Monster tables |
| 9 | Town/castle maps |
| 12-14 | Dialog text |
| 25 | Additional text |

## Data Structures

### Monster (16 bytes)

```
+00  HP (2)      +08  Gold (2)
+02  MP (1)      +0A  Drop item (1)
+03  ATK (2)     +0B  Drop rate (1)
+05  DEF (1)     +0C  AI pattern (1)
+06  AGI (1)     +0D  Resistances (1)
+07  EXP (2)     +0E  Sprite (1)
```

### Item (8 bytes)

```
+00  Type/flags (1)    +04  Effect (1)
+01  Attack mod (1)    +05  Equip flags (1)
+02  Defense mod (1)   +06  Price low (1)
+03  Speed mod (1)     +07  Price high (1)
```

### Save Header (16 bytes)

```
+00  Checksum (2)      +08  Play time (4)
+02  Chapter (1)       +0C  Day/night (2)
+03  Progress (1)      +0E  Reserved (2)
+04  Gold (2)
+06  Casino coins (2)
```

## Text Encoding

### Basic Characters

| Range | Characters |
|-------|------------|
| $00 | Space |
| $01-$0A | 0-9 |
| $0B-$24 | a-z |
| $25-$3E | A-Z |
| $65-$81 | Punctuation |
| $82-$EF | DTE pairs |

### Control Codes

| Code | Function |
|------|----------|
| $F0 | [WAIT] |
| $F1 | [LINE] |
| $F2 | [NAME] |
| $F3 | [ITEM] |
| $F4 | [NUM] |
| $FE | [PAUSE] |
| $FF | [END] |

## Chapter System

| Ch | Protagonist | Party Size | Special |
|----|-------------|------------|---------|
| 1 | Ragnar | 1-2 | Healie joins |
| 2 | Alena | 3 | AI control |
| 3 | Taloon | 1 | Merchant |
| 4 | Nara | 2 | Magic focus |
| 5 | Hero | 4+4 | Wagon |

### Chapter IDs

```
$00 = Chapter 1 (Ragnar)
$01 = Chapter 2 (Alena)
$02 = Chapter 3 (Taloon)
$03 = Chapter 4 (Nara)
$04 = Chapter 5 (Hero)
```

## Battle Tactics (Ch5)

| ID | Name | Description |
|----|------|-------------|
| $00 | Normal | Balanced |
| $01 | Save MP | Conservative |
| $02 | Offensive | Aggressive |
| $03 | Defensive | Protective |
| $04 | Try Out | Random |
| $05 | Use No MP | Physical only |

## Item Ranges

| Range | Type |
|-------|------|
| $00-$23 | Weapons |
| $24-$37 | Armor |
| $38-$43 | Shields |
| $44-$50 | Helmets |
| $51 | (blank) |
| $52-$7E | Consumables |
| $7F | No item |
| $80+ | Equipped flag |

## Status Effects

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

## Key Routines

### Bank 19

| Address | Purpose |
|---------|---------|
| $8038 | Battle entry |
| $8088 | Read game state |
| $80A1 | Check conditions |
| $8176 | Multiply by 16 |
| $8187 | Divide by 16 |
| $83C5 | 16-bit division |
| $8414 | 24-bit division |

### Fixed Bank (31)

| Address | Purpose |
|---------|---------|
| $FF91 | Bank switch |
| $7C891 | RNG main |
| $7FF74 | NMI RNG update |
| $FFFA | NMI vector |
| $FFFC | RESET vector |
| $FFFE | IRQ vector |

## Day/Night Cycle

| Range | Period |
|-------|--------|
| $00-$27 | Day |
| $78-$7B | Afternoon |
| $7C-$7F | Dusk |
| $80-$83 | Evening |
| $84-$BF | Night |
| $C0-$C3 | Dawn |

## Common Formulas

### Physical Damage
```
Base = ATK - (DEF / 2)
Variance = ±12.5%
Min damage = 0-1
```

### Critical Rate
```
Base = 1/64 (1.5625%)
Alena = Level / 256
```

### Experience
```
Per char = Total EXP / Living party
```

## File Locations

| File | Content |
|------|---------|
| `assets/json/monsters.json` | Monster data |
| `assets/json/items.json` | Item data |
| `assets/json/spells.json` | Spell data |
| `assets/json/chapters.json` | Chapter defs |
| `assets/text/dialog.json` | Dialog text |
| `data/dw4.tbl` | Text table |
| `data/code_map.txt` | Bank analysis |

## Links

- [INDEX.md](INDEX.md) - Full documentation index
- [ROM_MAP.md](formats/ROM_MAP.md) - Bank details
- [RAM_MAP.md](formats/RAM_MAP.md) - Memory layout
- [BATTLE_SYSTEM.md](formats/BATTLE_SYSTEM.md) - Battle mechanics
