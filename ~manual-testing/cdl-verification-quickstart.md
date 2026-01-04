# CDL Verification Quick Start Guide

## 🎯 Goal
Capture CDL data during spell casting and level-ups to verify ROM data locations.

---

## Part 1: Spell Table Verification

### Setup (5 minutes)
1. Open **Mesen** emulator
2. Load `Dragon Warrior IV (1992-10)(Enix)(US).nes`
3. Load a save with spell-casting characters (Chapter 2+)

### Capture (10 minutes)
1. **Reset CDL**: Debug → Code/Data Logger → Reset Log
2. **Enter battle** with weak enemies
3. **Cast these spells**:
   - Heal (Cristo)
   - Icebolt (Brey)
   - Blaze (Mara)
   - Upper (Cristo)
   - Return (from menu)
4. **Save CDL**: Debug → Code/Data Logger → Save As...
   - Save to: `debug/spells-test.cdl`

### Analyze (2 minutes)
```powershell
cd c:\Users\me\source\repos\dragon-warrior-4-info
python tools/analyze_spell_cdl.py debug/spells-test.cdl "roms/Dragon Warrior IV (1992-10)(Enix)(US).nes"
```

### Expected Result
- Bank 0x0D $9000 should show high DATA coverage
- Spell entries should show reasonable MP costs (0-30)

---

## Part 2: Experience Table Verification

### Setup (5 minutes)
1. Get a character close to level-up
2. Options:
   - Use save editor to set EXP near threshold
   - Grind until close to level-up
3. Save state before final battle

### Capture (10 minutes)
1. **Reset CDL**: Debug → Code/Data Logger → Reset Log
2. **Win battle** that triggers level-up
3. **Watch** the "Level Up!" sequence complete
4. **Save CDL**: Debug → Code/Data Logger → Save As...
   - Save to: `debug/levelup-test.cdl`

### Analyze (2 minutes)
```powershell
cd c:\Users\me\source\repos\dragon-warrior-4-info
python tools/analyze_exp_cdl.py debug/levelup-test.cdl "roms/Dragon Warrior IV (1992-10)(Enix)(US).nes"
```

### Expected Result
- Ascending sequence of EXP values
- First value small (5-20 for level 2)
- Growth rate 1.1x-1.5x per level

---

## Part 3: Compare with Baseline

If you want to see ONLY the new data accessed:

```powershell
# Copy merged CDL as baseline
$baseCdl = "c:\Users\me\source\repos\GameInfo\Games\NES\Dragon Warrior 4 (NES)\Debugging\cdls\Dragon Warrior IV (1992-10)(Enix)(US)-merged.cdl"

# Compare
python tools/cdl_compare.py $baseCdl debug/spells-test.cdl "roms/Dragon Warrior IV (1992-10)(Enix)(US).nes"
```

---

## Quick Reference

| Action | Mesen Menu |
|--------|------------|
| Reset CDL | Debug → Code/Data Logger → Reset Log |
| Save CDL | Debug → Code/Data Logger → Save As... |
| Load CDL | Debug → Code/Data Logger → Load... |

| Test | Save As |
|------|---------|
| Spell casting | `debug/spells-test.cdl` |
| Level up | `debug/levelup-test.cdl` |

---

## After Testing

1. Update `data/asset-map.json` with verified locations
2. Update include files if needed
3. Commit changes with results
4. Close GitHub issue #XX (once created)
