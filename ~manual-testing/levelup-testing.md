# Level-Up and Experience Table Testing Guide

**Last Updated:** 2026-01-09  
**Related Issues:** #50, #81

---

## Overview

This guide documents how to test and verify:
1. Experience table ROM locations
2. Level-up stat gain formulas
3. Character-specific growth rates

**Current Status:** Experience table location is UNKNOWN - needs CDL verification.

---

## Part 1: Experience Table Location Discovery

### Background

- DW4Lib references Bank 8 at $A866 but CDL shows inconclusive data
- Original asset-map.json had invalid Bank 0x27 (ROM only has banks 0x00-0x1F)
- Expected format: 2-byte or 3-byte ascending values per level

### CDL Capture Procedure

1. **Prepare Character Near Level-Up**
   ```
   Method A: Save Editor
   - Load save in dw4_save_editor.py
   - Set experience to (next_level_exp - 10)
   - Save and reload in emulator
   
   Method B: Grind
   - Play until character is close to leveling
   - Save state before battle
   ```

2. **Reset CDL Log**
   - Mesen: Debug → Code/Data Logger → Reset Log

3. **Trigger Level-Up**
   - Enter battle with weak enemy
   - Win battle
   - Watch "Level Up!" animation
   - Note stat increases shown

4. **Save CDL**
   - Save as: `debug/levelup-CHARNAME-LV##.cdl`
   - Example: `debug/levelup-ragnar-lv05.cdl`

5. **Analyze**
   ```powershell
   python tools/analyze_exp_cdl.py debug/levelup-ragnar-lv05.cdl "roms/Dragon Warrior IV (1992-10)(Enix)(US).nes"
   ```

### Expected Results

- New DATA bytes in previously unlogged regions
- Ascending sequence matching level requirements
- Pattern like: 5, 12, 30, 60, 110, 180... (exponential growth)

---

## Part 2: Multi-Level CDL Capture

### Goal
Capture CDL for multiple level-ups to identify table boundaries.

### Procedure

1. **Level 2→3 (Hero/Ragnar)**
   - Reset CDL
   - Level up
   - Save CDL as: `debug/levelup-lv02-03.cdl`

2. **Level 10→11**
   - Reset CDL
   - Level up
   - Save CDL as: `debug/levelup-lv10-11.cdl`

3. **Level 30→31 (if possible)**
   - Reset CDL
   - Level up
   - Save CDL as: `debug/levelup-lv30-31.cdl`

4. **Compare CDL Files**
   ```powershell
   python tools/cdl_compare.py debug/levelup-lv02-03.cdl debug/levelup-lv10-11.cdl "roms/Dragon Warrior IV (1992-10)(Enix)(US).nes"
   ```

### Analysis

Look for:
- Consistent bank access across all level-ups
- Offset differences matching level number × entry size
- 2-byte or 3-byte entry patterns

---

## Part 3: Stat Growth Verification

### Character Growth Types

| Character | Type | Focus Stats |
|-----------|------|-------------|
| Ragnar | Fighter | HP, Attack, Defense |
| Alena | Fighter | HP, Attack, Agility |
| Cristo | Healer | MP, Wisdom |
| Brey | Mage | MP, Intelligence |
| Taloon | Special | Balanced |
| Mara | Mage | MP, Intelligence |
| Nara | Healer | MP, Wisdom |
| Hero | Balanced | All stats |

### Test Procedure

1. Save state before level-up
2. Level up and record all stat changes
3. Reload and level again (verify RNG seed affects gains)
4. Document growth ranges

### Recording Template

```
Character: [Name]
Level: [X] → [X+1]
------
HP:   +[value] (range: X-Y)
MP:   +[value] (range: X-Y)
STR:  +[value] (range: X-Y)
AGI:  +[value] (range: X-Y)
VIT:  +[value] (range: X-Y)
INT:  +[value] (range: X-Y)
LUCK: +[value] (range: X-Y)
------
Spell Learned: [spell name] or None
```

---

## Part 4: Experience Requirements Reference

### Known Values (from game guides)

| Level | Hero | Ragnar | Alena |
|-------|------|--------|-------|
| 2 | ~15 | ~20 | ~18 |
| 5 | ~200 | ~250 | ~220 |
| 10 | ~2000 | ~2500 | ~2200 |
| 20 | ~25000 | ~30000 | ~27000 |
| 30 | ~80000 | ~95000 | ~85000 |
| MAX | ~1000000 | TBD | TBD |

**Note:** These are approximate - verify with actual CDL data.

---

## Part 5: Spell Learning Verification

### Goal
Identify where spell-learning tables are stored.

### Procedure

1. Save state before level where character learns spell
2. Reset CDL
3. Level up
4. Note spell learned
5. Save CDL
6. Analyze for spell table access

### Known Spell Learning Levels

| Character | Level | Spell |
|-----------|-------|-------|
| Cristo | 3 | Heal |
| Cristo | 5 | Upper |
| Brey | 2 | Icebolt |
| Brey | 5 | Snowstorm |
| Mara | 2 | Blaze |
| Hero | 3 | Heal |

---

## Analysis Scripts

### analyze_exp_cdl.py

Searches CDL for experience table patterns:
```powershell
python tools/analyze_exp_cdl.py <cdl_file> <rom_file> [--verbose]
```

### search_exp_tables.py

Searches ROM for ascending value sequences:
```powershell
python tools/search_exp_tables.py "roms/Dragon Warrior IV (1992-10)(Enix)(US).nes" --min-entries 30
```

### find_levelup_code.py

Disassembles potential level-up code routines:
```powershell
python tools/find_levelup_code.py "roms/Dragon Warrior IV (1992-10)(Enix)(US).nes"
```

---

## After Testing

Update the following files:

- [ ] `data/asset-map.json` - Add verified experience table location
- [ ] `source_files/include/experience.inc` - Create with table structure
- [ ] `logsmall/DW4Lib/DataStructures/ExperienceTable.cs` - Update addresses
- [ ] `docs/formats/DATA_TABLES.md` - Document experience format
- [ ] Close GitHub Issue #50
