# Dragon Warrior IV - ROM Map

## ROM Header

| Offset | Size | Value | Description |
|--------|------|-------|-------------|
| $00 | 4 | `NES^Z` | iNES header magic |
| $04 | 1 | $20 | PRG-ROM size: 32 × 16KB = 512KB |
| $05 | 1 | $00 | CHR-ROM size: 0 (uses CHR-RAM) |
| $06 | 1 | $40 | Flags 6: Mapper 4 (MMC3), vertical mirroring |
| $07 | 1 | $00 | Flags 7 |
| $08-$0F | 8 | $00 | Reserved |

## ROM Layout

**Total Size:** 524,304 bytes (512KB + 16-byte header)

| Bank | File Offset | CPU Address | Size | Primary Content |
|------|-------------|-------------|------|-----------------|
| 0 | $00010-$04000 | $8000-$BFFF | 16KB | Map/tileset data |
| 1 | $04010-$08000 | $8000-$BFFF | 16KB | Map/tileset data |
| 2 | $08010-$0C000 | $8000-$BFFF | 16KB | Map data |
| 3 | $0C010-$10000 | $8000-$BFFF | 16KB | Map data |
| 4 | $10010-$14000 | $8000-$BFFF | 16KB | Map data |
| 5 | $14010-$18000 | $8000-$BFFF | 16KB | Text (menu, items) |
| 6 | $18010-$1C000 | $8000-$BFFF | 16KB | Monster tables |
| 7 | $1C010-$20000 | $8000-$BFFF | 16KB | Mixed data/code |
| 8 | $20010-$24000 | $8000-$BFFF | 16KB | Utility routines |
| 9 | $24010-$28000 | $8000-$BFFF | 16KB | Data |
| 10 | $28010-$2C000 | $8000-$BFFF | 16KB | Data |
| 11 | $2C010-$30000 | $8000-$BFFF | 16KB | Utility routines |
| 12 | $30010-$34000 | $8000-$BFFF | 16KB | Dialog text (Ch1-2) |
| 13 | $34010-$38000 | $8000-$BFFF | 16KB | Dialog text (Ch3-4) |
| 14 | $38010-$3C000 | $8000-$BFFF | 16KB | Dialog text (Ch5) |
| 15 | $3C010-$40000 | $8000-$BFFF | 16KB | Game logic |
| 16 | $40010-$44000 | $8000-$BFFF | 16KB | **Battle system** |
| 17 | $44010-$48000 | $8000-$BFFF | 16KB | **Battle system** |
| 18 | $48010-$4C000 | $8000-$BFFF | 16KB | **Battle/party** |
| 19 | $4C010-$50000 | $8000-$BFFF | 16KB | **Core calculations** |
| 20 | $50010-$54000 | $8000-$BFFF | 16KB | **Enemy AI** |
| 21 | $54010-$58000 | $8000-$BFFF | 16KB | **Damage/healing** |
| 22 | $58010-$5C000 | $8000-$BFFF | 16KB | **Spell effects** |
| 23 | $5C010-$60000 | $8000-$BFFF | 16KB | **Status effects** |
| 24 | $60010-$64000 | $8000-$BFFF | 16KB | Game logic |
| 25 | $64010-$68000 | $8000-$BFFF | 16KB | Text data |
| 26 | $68010-$6C000 | $8000-$BFFF | 16KB | Data |
| 27 | $6C010-$70000 | $8000-$BFFF | 16KB | Game logic |
| 28 | $70010-$74000 | $8000-$BFFF | 16KB | Game logic |
| 29 | $74010-$78000 | $8000-$BFFF | 16KB | Game logic |
| 30 | $78010-$7C000 | $8000-$BFFF | 16KB | Game logic |
| 31 | $7C010-$80000 | $C000-$FFFF | 16KB | **Fixed bank** |

## Bank Categories

### Data Banks (0-5)

Primarily map, tileset, and menu text data with minimal code.

| Bank | Subroutines | Content |
|------|-------------|---------|
| 0 | 22 | Map/tileset 0 |
| 1 | 17 | Map/tileset 1 |
| 2 | 16 | Map data |
| 3 | 14 | Map data |
| 4 | 22 | Map data |
| 5 | 12 | Menu text |

### Monster Data (Bank 6)

**Monster Table Location:** $18010 + offset

Known table at $A2A2 (CPU $A2A2 in bank 6):
- 27-byte records
- Contains HP, ATK, DEF, AGI, EXP, Gold
- Sprite references
- Status/resistance flags

### Text Banks (5, 12-14, 25)

| Bank | Content |
|------|---------|
| 5 | Menu text, item names |
| 12 | Dialog (Chapters 1-2) |
| 13 | Dialog (Chapters 3-4) |
| 14 | Dialog (Chapter 5) |
| 25 | Additional text |

### Battle System (Banks 16-23)

The core battle engine spans 8 banks:

| Bank | Role | Key Features |
|------|------|--------------|
| 16 | Entry/state | Battle state machine |
| 17 | Actions | Action processing |
| 18 | Party | Party management |
| 19 | Math | **Damage calculations**, division |
| 20 | Enemy | Enemy AI routines |
| 21 | Formulas | **Highest arithmetic ops** |
| 22 | Spells | Spell effect handlers |
| 23 | Status | Status effect processing |

### Fixed Bank (Bank 31)

Always mapped at $C000-$FFFF. Contains:
- Reset vector ($FFFC)
- NMI handler ($FFFA)
- IRQ handler ($FFFE)
- Bank switching routines ($FF91)
- RNG update

## Key Addresses

### Reset/Interrupt Vectors

| Address | Vector | Description |
|---------|--------|-------------|
| $FFFA | NMI | Non-maskable interrupt |
| $FFFC | RESET | Power-on/reset entry |
| $FFFE | IRQ | IRQ/BRK handler |

### Bank Switching

```asm
; Bank switch routine at $FF91
; A = target bank number
bank_switch:
    STA $8000      ; Write bank to MMC3
    RTS
```

### RNG Routines

| PRG Address | Label | Purpose |
|-------------|-------|---------|
| $7C890 | rng_return | RNG return point |
| $7C891 | rng_main | Main RNG entry |
| $7C8A1 | rng_inc_counter | Increment counter |
| $7C8A6 | rng_load_seed | Load seed value |
| $7C8AD | rng_shifter | LFSR shift |
| $7FF74 | nmi_rng_update | NMI RNG update |

## Subroutine Counts by Bank

From code analysis:

| Rank | Bank | Subroutines | Notes |
|------|------|-------------|-------|
| 1 | 30 | 293 | Heavy logic |
| 2 | 19 | 284 | Battle calculations |
| 3 | 15 | 282 | Game logic |
| 4 | 31 | 239 | Fixed bank |
| 5 | 17 | 236 | Battle actions |
| 6 | 22 | 232 | Spell effects |
| 7 | 27 | 207 | Game logic |
| 7 | 29 | 207 | Game logic |
| 9 | 18 | 206 | Party management |
| 10 | 16 | 203 | Battle entry |
| 10 | 23 | 203 | Status effects |

## Data Tables

### Monster Stats (Bank 6)

**Base Address:** $18010 + $A2A2 - $8000 = $1A2B2

Format per monster (27 bytes based on analysis):
```
Offset  Size  Field
------  ----  -----
0x00    2     HP
0x02    1     ATK low?
0x03    1     DEF
0x04    1     AGI
0x05-   18    Additional data
0x16    1     B22 byte (metal flag?)
0x17    1     B23 byte (drop?)
0x18    1     B24 byte (status?)
0x19-   2     Drop rate flags
```

### Experience Tables

EXP increments found at multiple locations:
- Bank 0: $B2A9, $B594
- Bank 1: $882E, $8BF0, $B7F9
- Bank 2: $9683, $A766, $B152
- Bank 3: Multiple locations
- Bank 4: $8611
- Bank 26: $87F5, $8830

All use `INC $601C,X` pattern.

### Text Pointers

| Bank | Address | Content |
|------|---------|---------|
| 22 | $B3A4 | Text pointer table |

## CHR-RAM

DW4 uses CHR-RAM (8KB) instead of CHR-ROM:
- Graphics data loaded from PRG-ROM at runtime
- Allows dynamic tile updates
- Monster sprites loaded per-battle

## Mapper: MMC3 (iNES Mapper 4)

### Bank Configuration

MMC3 allows:
- Two 8KB PRG-ROM banks at $8000-$9FFF and $A000-$BFFF
- Or one 16KB bank (as DW4 uses)
- Fixed 16KB bank at $C000-$FFFF

### Registers

| Address | Function |
|---------|----------|
| $8000 | Bank select |
| $8001 | Bank data |
| $A000 | Mirroring |
| $A001 | PRG-RAM protect |
| $C000 | IRQ latch |
| $C001 | IRQ reload |
| $E000 | IRQ disable |
| $E001 | IRQ enable |

## File Organization

```
dragon-warrior-4-info/
├── roms/
│   └── Dragon Warrior IV (1992-10)(Enix)(US).nes
├── disasm/
│   └── banks/
│       ├── bank_16.asm
│       ├── bank_17.asm
│       ├── bank_19.asm
│       └── ...
└── data/
    ├── code_map.txt
    ├── bank6_monster_table.txt
    └── ...
```

## References

- [code_map.txt](../data/code_map.txt) - Subroutine counts
- [bank6_monster_table.txt](../data/bank6_monster_table.txt) - Monster data analysis
- [BATTLE_SYSTEM.md](formats/BATTLE_SYSTEM.md) - Battle mechanics
- [RAM_MAP.md](formats/RAM_MAP.md) - Memory layout
