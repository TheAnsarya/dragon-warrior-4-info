# Dragon Warrior IV - Event Script System Analysis

## Overview

This document describes the event script system in Dragon Warrior IV (NES) as analyzed for conversion to DQ4r (SNES port).

## ROM Bank Layout

| Bank | File Offset | Contents |
|------|-------------|----------|
| 0x00 | $00010 | Core Engine |
| 0x04 | $10010 | NPC/Event Code |
| 0x05 | $14010 | AI/Monster Behavior, Spells |
| 0x0F | $3C010 | Map Loading Code |
| 0x10-0x14 | $40010-$54010 | Script/Dialog Text (DTE encoded) |
| 0x17 | $5C010 | Map Pointer Tables, NPC Tables |

## Event Handler Analysis

Bank 4 ($10010) contains NPC and event handling code. Analysis reveals the following frequently-called subroutines that likely serve as event handlers:

| Address | Call Count | Description |
|---------|------------|-------------|
| $8XXX | Multiple | Event dispatch routines |
| ... | ... | (Requires deeper disassembly) |

## Text/Dialog System

### Encoding

DW4 uses Dual Tile Encoding (DTE) for text compression:

- **$00**: Space
- **$01-$0A**: Digits 0-9
- **$0B-$24**: Lowercase a-z
- **$25-$3E**: Uppercase A-Z
- **$65-$79**: Punctuation
- **$80-$EF**: DTE pairs (two characters per byte)
- **$F0-$FE**: Control codes
- **$FF**: String terminator

### Control Codes

| Code | Name | Function |
|------|------|----------|
| $F0 | WAIT | Pause for player input |
| $F1 | LINE | New line |
| $F2 | NAME | Insert character name |
| $F3 | ITEM | Insert item name |
| $F4 | NUM | Insert number |
| $F7 | SPELL | Insert spell name |
| $FD | CLEAR | Clear text window |
| $FE | PAUSE | Timed pause |
| $FF | END | End of string |

### DTE Table Location

The DTE dictionary is located at ROM offset $5B3B4. Each entry is 2 bytes representing a character pair.

## NPC Data Format

Based on MAP_FORMAT.md documentation:

```
NPC Entry (8 bytes):
  Byte 0: NPC ID
  Byte 1: X position (tile)
  Byte 2: Y position (tile)
  Byte 3: Movement pattern (0-6)
  Byte 4: Facing direction (0-3)
  Byte 5: Sprite ID
  Bytes 6-7: Dialog/event pointer (little-endian)
```

### Movement Patterns

| Value | Pattern |
|-------|---------|
| 0 | Stationary |
| 1 | Wander (1 tile) |
| 2 | Wander (2 tiles) |
| 3 | Patrol horizontal |
| 4 | Patrol vertical |
| 5 | Follow player |
| 6+ | Custom paths |

## Event Trigger Types

| Type | Description |
|------|-------------|
| Talk | Triggered when facing NPC and pressing A |
| Touch | Triggered when stepping on tile |
| Examine | Triggered when pressing A on tile |
| Auto | Triggered automatically when conditions met |

## Map Event Structure

Maps reference events through pointer tables in Bank 0x17. Each map has:
- NPC list pointer
- Event trigger pointer
- Warp data pointer

## DQ4r Conversion Notes

### ScriptOpcode Mapping

The DQ4r EventScript system uses opcodes that must map from NES behavior:

| NES Behavior | DQ4r Opcode |
|--------------|-------------|
| Show text | SHOW_MESSAGE |
| Yes/No choice | SHOW_CHOICE |
| Set flag | SET_FLAG |
| Check flag | CHECK_FLAG |
| Jump | JUMP |
| Conditional | JUMP_IF_TRUE/FALSE |
| Give item | GIVE_ITEM |
| Warp | WARP |
| Start battle | START_BATTLE |
| Play music | PLAY_MUSIC |
| Fade effects | FADE_IN/FADE_OUT |

### Data Extraction Status

| Data Type | Status | Notes |
|-----------|--------|-------|
| Dialog text | Partial | DTE decoding needs work |
| NPC positions | Documented | Format understood |
| Map triggers | In progress | Pointer tables located |
| Event flags | Documented | 256 flags in save data |
| Shop data | Documented | Bank 7 |
| Battle triggers | In progress | Bank 4 code analysis |

## Tools

- `extract_event_scripts.py` - Main extraction tool
- `extract_npc_dialogue.py` - Dialog extraction (existing)
- `examine_bank17.py` - Map pointer analysis

## References

- [MAP_FORMAT.md](formats/MAP_FORMAT.md) - Map and NPC format details
- [TEXT_SYSTEM.md](formats/TEXT_SYSTEM.md) - Text encoding documentation
- [RAM_MAP.md](formats/RAM_MAP.md) - RAM memory map
- [cowness_reference.md](cowness_reference.md) - Speedrun community data

## Next Steps

1. Complete DTE table extraction and verification
2. Disassemble Bank 4 event handlers
3. Map all dialog IDs to text pointers
4. Create JSON schema for event data
5. Build conversion tool for DQ4r import
