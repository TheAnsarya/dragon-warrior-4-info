# Dragon Warrior IV - RAM Memory Map

## Overview

The NES has limited RAM, so DW4 uses every byte efficiently:
- **Zero Page ($00-$FF)**: Fast-access scratch registers
- **Stack ($0100-$01FF)**: CPU stack
- **OAM Mirror ($0200-$02FF)**: Sprite data
- **Work RAM ($0300-$07FF)**: General purpose
- **Battery RAM ($6000-$7FFF)**: Save data and game state

## Zero Page ($00-$FF)

### Scratch Registers ($00-$0F)

| Address | Name | Purpose |
|---------|------|---------|
| $00 | `tmp0` | General scratch byte 0 |
| $01 | `tmp1` | General scratch byte 1 |
| $02 | `tmp2` | General scratch byte 2 |
| $03 | `tmp3` | General scratch byte 3 |
| $04-$05 | `ptr0` | Pointer low/high byte |
| $06-$07 | `ptr1` | Second pointer pair |
| $08-$0F | | Additional temporaries |

### RNG System ($10-$1F)

| Address | Name | Purpose |
|---------|------|---------|
| $12 | `RNG_Seed_Low` | Random number seed (low byte) |
| $13 | `RNG_Seed_High` | Random number seed (high byte) |
| $16 | `RNG_Temp` | RNG working value |
| $18 | `Encounter_Rate` | Steps until next encounter check |
| $17-$1B | | Arithmetic temporaries |
| $1F | `system_flags` | Global state flags |

### Loop/Index Registers ($80-$9F)

| Address | Name | Purpose |
|---------|------|---------|
| $8A | `loop_counter` | General loop counter |
| $93 | `bit_flags` | Bit-tested flags (LSR $93) |
| $94-$95 | | Extended temporary |
| $96 | `char_index` | Current character slot (0-7) |

## Stack Page ($0100-$01FF)

Standard 6502 stack. Grows downward from $01FF.

## OAM Mirror ($0200-$02FF)

Sprite attribute data copied to PPU via DMA during NMI:
- 64 sprites × 4 bytes = 256 bytes
- Format: Y, Tile, Attributes, X

## Work RAM ($0300-$07FF)

### RNG Counters ($0500-$050F)

| Address | Name | Purpose |
|---------|------|---------|
| $050C | `RNG_Counter_Compare` | Comparison value for RNG |
| $050D | `RNG_Counter` | Running RNG counter |

### Game State ($0600-$07FF)

General game state variables, temporary buffers, etc.

## Battery-Backed RAM ($6000-$7FFF)

This 8KB region holds save data and current game state.

### Current Game State ($6000-$62EE)

#### Party HP/MP ($6000-$600F)

| Address | Name | Index | Purpose |
|---------|------|-------|---------|
| $6000 | `Party_Current_HP_Low` | +X×n | Current HP low byte |
| $6001 | `Party_Current_HP_High` | +X×n | Current HP high byte |
| $6002 | `Party_Current_MP_Low` | +X×n | Current MP low byte |
| $6003 | | +X×n | (unused/padding) |
| $6004 | `Party_Max_HP_Low` | +X×n | Max HP low byte |
| $6005 | `Party_Max_HP_High` | +X×n | Max HP high byte |

*Note: Character data is indexed. X = character slot × stride.*

#### Experience ($601C-$602F)

| Address | Name | Purpose |
|---------|------|---------|
| $601C,X | `Party_EXP_High` | Experience high byte (indexed) |

Experience is frequently incremented across multiple banks (0, 1, 2, 3, 4, 26) suggesting experience handling is distributed through event/battle banks.

### Battle State ($6030-$61FF)

#### Battle Counters ($6038)

| Address | Name | Purpose |
|---------|------|---------|
| $6038 | `Unknown_Flag_Counter` | Used in 12 banks |

#### Battle Actor ($6150-$61FF)

| Address | Name | Purpose |
|---------|------|---------|
| $615A | `Current_Battle_Actor_Index` | Which character is acting |
| $615B | | Read at battle start ($8088) |
| $615D | | Input variable |
| $6165 | | Indexed data table |
| $6168 | | Input variable |
| $616A | `Battle_Action_Data` | Current action being processed |
| $618C | | XOR'd for action checks |
| $618D | | Input variable |
| $618E | `Battle_State_Flags` | BIT-tested battle flags |
| $618F | | Unknown |
| $6191 | `Output_Store_1` | Result storage |
| $6192 | `Output_Store_2` | Result storage |
| $6195 | `Battle_Counter_1` | Battle turn counter |
| $6196 | `Battle_Counter_2` | Battle round counter |
| $6197 | `Battle_Limit_X` | Battle boundary X |
| $6198 | `Battle_Limit_Y` | Battle boundary Y |
| $619B | | AND/STA'd status flags |
| $61B1 | | Incremented during battle |
| $61DB | | Indexed data table |
| $61E8 | | Input variable |

### Save File Structure ($62EF-$7FFF)

Three save slots, each ~752 bytes:

| Address Range | Save Slot |
|---------------|-----------|
| $62EF-$65DE | Save File 1 |
| $65DF-$68CE | Save File 2 |
| $68CF-$6BBE | Save File 3 |

#### Save Data Format (per slot, ~752 bytes)

| Offset | Size | Description |
|--------|------|-------------|
| $00 | 2 | Checksum |
| $02 | 1 | Chapter number (1-5) |
| $03 | 1 | Current chapter progress |
| $04 | 2 | Gold (low/high) |
| $06 | 1 | Casino coins low |
| $07 | 1 | Casino coins high |
| $08 | 4 | Play time |
| $0C | 8 | Active party members (4 slots × 2 bytes) |
| $14 | 8 | Wagon party members (4 slots × 2 bytes) |
| $1C | ~200 | Character stats (8 chars × 25 bytes) |
| ... | ... | Inventory, flags, etc. |

## Battle Calculation Workspace ($6E00-$6E20)

Used during damage/stat calculations:

| Address | Name | Purpose |
|---------|------|---------|
| $6E00-$6E10 | | Calculation scratch |
| $6E11-$6E13 | `div_remainder` | Division remainder |
| $6E14-$6E16 | `div_divisor` | Division divisor |
| $6E44 | `combat_flag` | In-combat indicator |
| $6E80 | `battle_mode` | Current battle state |

## Party Stat Buffer ($72F4-$75FF)

### Character State Array ($72F4)

```
$72F4,X - Character state flags (indexed by X)
```

### Party Stats ($7591-$75C0)

| Address | Name | Purpose |
|---------|------|---------|
| $75AD-$75C0 | | Party stat buffer |
| $75D4 | | Battle variable |
| $75DC | | Special flag (set to $FF) |
| $75E8 | `action_index` | Jump table dispatch (0-7) |

## Memory Access Patterns

### Most Accessed Addresses

From code analysis, most frequently accessed battle RAM:

1. **$6018** - 30 accesses across 11 banks
2. **$6038** - 31 accesses across 12 banks
3. **$601C** - 18 accesses (all INC = experience gains)
4. **$6005** - 14 accesses (Max HP high byte)

### Bank Responsibilities

| Banks | RAM Focus |
|-------|-----------|
| 0-4 | Map data, experience increments |
| 6-8 | Monster data, party access |
| 15-23 | Battle system, stat calculations |
| 27-30 | Additional game logic |
| 31 | Fixed bank, interrupts |

## RNG Implementation

### Addresses

| Type | Address | Description |
|------|---------|-------------|
| PRG | $7C890 | `rng_return` |
| PRG | $7C891 | `rng_main` |
| PRG | $7C8A1 | `rng_inc_counter` |
| PRG | $7C8A6 | `rng_load_seed` |
| PRG | $7C8AD | `rng_shifter` |
| PRG | $7C8CB | `rng_shifter_end` |
| PRG | $7C913 | `rng_related` |
| PRG | $7FF74 | `nmi_rng_update` |
| PRG | $7FF79 | `nmi_inc_seed` |
| PRG | $7FF82 | `nmi_call_rng` |

### RNG Algorithm

The game uses a linear feedback shift register (LFSR) updated during NMI:

```asm
; Seed at $12-$13, updated via shifts and XOR
nmi_rng_update:
    LDA $12
    ASL
    ROL $13
    BCC +
    EOR #$39    ; Feedback polynomial
+   STA $12
    RTS
```

## Comparison: DW4 vs DQ3r

| System | DW4 (NES) | DQ3r (SNES) |
|--------|-----------|-------------|
| Total RAM | 10KB | 128KB |
| Save Data | 8KB battery | 8KB SRAM |
| Zero Page | $00-$FF | $00-$FF (Direct Page) |
| Work RAM | $0300-$07FF | $7E0000-$7FFFFF |
| Party Data | Indexed | Structured records |

## References

- [code_map.txt](../../data/code_map.txt) - Bank subroutine counts
- [memory_labels.txt](../../data/memory_labels.txt) - Known labels
- [party_data_access.txt](../../data/party_data_access.txt) - Full access log
- [cowness_labels.txt](../../data/cowness_labels.txt) - Community labels
