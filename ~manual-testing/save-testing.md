# Save System Testing Guide

**Last Updated:** 2026-01-09  
**Related Issues:** #76, #77

---

## Overview

Dragon Warrior IV uses 8KB battery-backed SRAM for save data, divided into:
- Current game state ($6000-$62EE)
- Save Slot 1 ($62EF-$65DE)
- Save Slot 2 ($65DF-$68CE)
- Save Slot 3 ($68CF-$6BBE)

---

## Part 1: SRAM Format Verification

### Goal
Verify the documented save data format matches actual game behavior.

### Test Procedure

1. **Create test save**
   - Start new game
   - Note exact stats/items/gold/location
   - Save to Slot 1

2. **Export SRAM**
   - In Mesen: File → Export → Save RAM...
   - Save as: `debug/test-save.sav`

3. **Analyze with Python**
   ```powershell
   cd c:\Users\me\source\repos\dragon-warrior-4-info
   python tools/dw4_save_editor.py --analyze debug/test-save.sav
   ```

4. **Verify fields**
   | Field | Offset | Expected |
   |-------|--------|----------|
   | Current HP | $6000 | Match in-game |
   | Current MP | $6002 | Match in-game |
   | Gold | $6010 | Match in-game |
   | Experience | $601C | Match in-game |
   | Items | $6020 | Match inventory |
   | Chapter | $60XX | Current chapter |

### Expected Results
- All documented fields match game state
- Checksum validates correctly
- Save can be re-imported without corruption

---

## Part 2: Save Editor Testing

### Goal
Verify the save editor can modify saves without breaking the game.

### Test 1: Modify Gold

1. Load test save in editor
2. Change gold amount
3. Save modified file
4. Import into Mesen
5. Load game and verify gold changed

### Test 2: Modify Stats

1. Increase a character's HP max
2. Verify game loads correctly
3. Check stats screen shows modified value
4. Battle to confirm HP works correctly

### Test 3: Modify Inventory

1. Add/remove items from inventory
2. Save and reload
3. Verify inventory matches modifications
4. Use an added item to confirm it works

### Test 4: Chapter/Story Flags

1. Note current story progress
2. Modify chapter or flag bytes
3. Verify game state changes appropriately
4. Check for softlocks or glitches

---

## Part 3: Save State Compatibility

### Goal
Verify save state format for potential future tools.

### Mesen Save State Format

1. Create save state in Mesen
2. Note file extension (.mss)
3. Extract and analyze structure

### FCEUX Save State Format

1. Create equivalent save state in FCEUX
2. Compare with Mesen format
3. Document differences

---

## Save Data Structure Reference

### Character Data Block (32 bytes per character)

```
Offset  Size  Field
------  ----  -----
0x00    2     Current HP
0x02    2     Max HP
0x04    1     Current MP
0x05    1     Max MP
0x06    1     Level
0x07    1     Attack
0x08    1     Defense
0x09    1     Agility
0x0A    4     Experience (32-bit)
0x0E    1     Status flags
0x0F    1     Equipment weapon
0x10    1     Equipment armor
0x11    1     Equipment shield
0x12    1     Equipment helmet
0x13    1     Equipment accessory
0x14-0x1F     Spell flags / Other
```

### Inventory Block

```
Offset  Size  Field
------  ----  -----
0x6020  XX    Party inventory (255 slots max)
```

### Progress Flags

```
Offset  Size  Field
------  ----  -----
0x60XX  1     Current chapter (0-4)
0x60XX  XX    Story progress flags
0x60XX  XX    Chest opened flags
0x60XX  XX    NPC talked flags
```

---

## Analysis Scripts

### dw4_save_editor.py

```powershell
# Analyze save file
python tools/dw4_save_editor.py --analyze saves/test.sav

# Export to JSON
python tools/dw4_save_editor.py --export saves/test.sav --output saves/test.json

# Import from JSON
python tools/dw4_save_editor.py --import saves/test.json --output saves/modified.sav

# Interactive edit mode
python tools/dw4_save_editor.py --edit saves/test.sav
```

---

## Known Issues

1. **Checksum handling** - Save files have checksum bytes that must be recalculated
2. **Chapter-specific data** - Save format varies slightly between chapters
3. **Wagon party** - Chapter 5 has additional party member data

---

## After Testing

Update the following files with verified information:

- [ ] `data/asset-map.json` - Save structure details
- [ ] `source_files/include/ram_map.inc` - SRAM addresses
- [ ] `docs/formats/SAVE_DATA.md` - Format documentation
- [ ] `source_files/include/characters.inc` - Character structure
