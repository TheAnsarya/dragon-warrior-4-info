# Dragon Warrior IV - Item & Spell Data Locations

## Overview

Item names, spell names, and equipment names are stored in **Bank 26** using the standard TBL encoding with DTE compression. This document maps the exact ROM locations of all text data.

## Text Encoding

- **$00**: Space
- **$01-$0A**: Digits 0-9
- **$0B-$24**: Lowercase a-z
- **$25-$3E**: Uppercase A-Z
- **$60-$7F**: Punctuation and special characters
- **$80-$FE**: DTE codes (lookup in table at Bank 22 $B3A4)
- **$FF**: End of string marker

## Bank 26 Text Data (ROM $68000-$6BFFF)

### Spell Names ($6A000+ area)

The spell names are stored consecutively with $FF terminators:

| ROM Offset | Bank Address | Spell Name |
|------------|--------------|------------|
| $6A??? | $A??? | Heal |
| $6A??? | $A??? | Healmore |
| $6A??? | $A??? | Healall |
| $6A??? | $A??? | Infernos |
| $6A??? | $A??? | Firebane |
| $6A??? | $A??? | Firebal |
| $6A??? | $A??? | Blaze |
| $6A??? | $A??? | Blazemore |
| $6A??? | $A??? | Blazemost |

*(Exact offsets to be determined by pointer table analysis)*

### Spell Categories

**Healing Spells**: Heal, Healmore, Healall, Healus, Healusall, Vivify, Revive

**Attack Spells**: 
- Fire: Firebal, Firebane, Infernos, Blaze, Blazemore, Blazemost
- Ice: Icebolt, Snowstorm, Blizzard
- Wind/Lightning: Zap, Bolt, Lightning, Explodet
- Status: Sleep, Surround, Defeat, Beat

**Support Spells**: Defense, Increase, Upper, Speed, Bikill, Sap, Antidote

**Exploration**: Return, Outside, Stepguard, Repel

### Item Names ($6B000+ area)

Items appear to be grouped by category:

**Weapons**:
- Cypress stick, Club, Copper sword, Divine dagger
- Iron claw, Chain sickle, Thorn whip
- Sword of miracles, Sword of decimation

**Armor**:
- Clothes, Robe, Traveler clothes
- Leather armor, Chain mail
- Half plate armor, Full plate armor
- Sacred armor, Armor of radiance

**Shields**:
- Leather shield, Scale shield
- Bronze shield, Iron shield
- Steel shield, Dragon shield
- Shield of strength

**Helmets**:
- Leather hat, Wooden hat
- Hardwood headware, Feather hat
- Iron helmet, Iron mask
- Great helm

**Accessories**:
- Strength ring, Agility ring
- Luck ring, Gold bracelet
- Meteorite armband

## Text Pointer System

The game uses pointer tables to reference text strings. Each pointer is 2 bytes (little-endian) pointing to the text data within the same bank.

### Known Pointer Tables

| ROM Offset | Bank | Purpose |
|------------|------|---------|
| $5B01F | 22 | Menu text pointers |
| TBD | 26 | Item name pointers |
| TBD | 26 | Spell name pointers |

## DTE Table Reference (Bank 22 $B3A4)

The DTE (Dual Tile Encoding) table maps codes $80-$FE to character pairs:

| Code | Pair | Notes |
|------|------|-------|
| $80 | "sp" | Common suffix |
| $81 | "ee" | |
| $82 | "yo" | "you" common |
| $83 | "QU" | "QUEST" |
| ... | ... | |

Full DTE table in `assets/text/dragon_warrior_4.tbl`

## Extraction Notes

1. Items and spells use the same encoding as menu text
2. Names are null-terminated ($FF)
3. Some names use DTE codes for common letter pairs
4. Equipment stats are stored separately from names

## Related Files

- `assets/text/dragon_warrior_4.tbl` - Complete character mapping
- `tools/extract_items_spells.py` - Extraction script
- `docs/analysis/text_system_analysis.md` - Text system overview

## TODO

- [ ] Map exact ROM offsets for all item names
- [ ] Map exact ROM offsets for all spell names  
- [ ] Find equipment stat tables
- [ ] Document pointer table structure
- [ ] Create complete item/spell extraction tool
