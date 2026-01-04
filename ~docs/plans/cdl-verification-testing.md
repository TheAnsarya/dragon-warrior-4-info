# CDL Verification Testing Guide

**Purpose:** Manual gameplay CDL sessions to verify spell table and experience table ROM locations.

## Overview

We need to capture CDL (Code/Data Logger) data during specific gameplay actions to definitively locate:
1. **Spell Table** - Currently believed to be Bank 0x0D $9000 (unverified)
2. **Experience Tables** - Location unknown (original Bank 0x27 entry was invalid)

## Prerequisites

### Required Software
- **Mesen** (preferred) or **FCEUX** emulator with CDL support
- Dragon Warrior IV (US) ROM: `Dragon Warrior IV (1992-10)(Enix)(US).nes`
- Python 3.x (for analysis scripts)

### Required Files
- Existing merged CDL: `GameInfo/Games/NES/Dragon Warrior 4 (NES)/Debugging/cdls/Dragon Warrior IV (1992-10)(Enix)(US)-merged.cdl`
- ROM file in `roms/` folder

---

## Part 1: Spell Table Verification

### Goal
Capture CDL data when casting spells to identify where spell data is read from ROM.

### Test Plan

#### Step 1: Prepare Save State
1. Load game with characters who know spells
2. Best candidates:
   - **Brey** (knows Icebolt, Snowstorm early)
   - **Cristo** (knows Heal, Upper early)
   - **Mara** (knows Blaze, Firebal early)
3. Enter a battle with weak enemies
4. Create save state before spell menu opens

#### Step 2: Start Fresh CDL
1. In Mesen: Debug → Code/Data Logger → Reset Log
2. Alternative: Delete existing .cdl file

#### Step 3: Capture Spell Casting
Perform these actions:
1. Open spell menu (captures spell list reading)
2. Select a spell (captures spell data lookup)
3. Cast the spell (captures spell effect execution)
4. Repeat with 3-5 different spells

**Spells to Test:**
| Spell | Character | Expected Effect |
|-------|-----------|-----------------|
| Heal | Cristo | Single ally heal |
| Icebolt | Brey | Single enemy ice damage |
| Blaze | Mara | Single enemy fire damage |
| Upper | Cristo | Defense buff |
| Return | Any | Teleport (menu spell) |

#### Step 4: Save CDL
1. Save CDL file as: `Dragon Warrior IV-spells-test.cdl`
2. Copy to `debug/` folder

#### Step 5: Analyze Results
Run the analysis script (see Automation section below).

### Expected Results
- New DATA bytes should appear in the spell table region
- Look for Bank 0x0D $9000 area (DW4Lib's location)
- Or Bank 0x05 $8000 area (old incorrect location)
- Pattern: 6-byte entries (spell structure size)

---

## Part 2: Experience Table Verification

### Goal
Capture CDL data during level-up to identify where EXP tables are read from ROM.

### Test Plan

#### Step 1: Prepare Save State
1. Get a character close to level-up
2. Best method: Use save editor to set EXP just below threshold
3. Alternative: Grind to near level-up point
4. Create save state before final battle

#### Step 2: Start Fresh CDL
1. Reset CDL log completely
2. This isolates level-up data access

#### Step 3: Capture Level-Up
1. Win a battle that triggers level-up
2. Watch for "Level Up!" message
3. Note stat increases displayed
4. Let the game fully process the level-up

**Repeat if possible:**
- Level up multiple characters in one session
- Level up same character multiple times
- Try different chapters (different characters have different growth curves)

#### Step 4: Save CDL
1. Save CDL file as: `Dragon Warrior IV-levelup-test.cdl`
2. Copy to `debug/` folder

#### Step 5: Analyze Results
Run the analysis script (see Automation section below).

### Expected Results
- New DATA bytes in experience table region
- Pattern: 3-byte entries (24-bit EXP values) or 2-byte entries (16-bit)
- Multiple tables (one per character class)
- Values should be ascending (higher levels need more EXP)

---

## Part 3: Automation Scripts

### CDL Comparison Script

Save as `tools/cdl_compare.py`:

```python
#!/usr/bin/env python3
"""Compare two CDL files to find newly accessed ROM regions."""

import sys
from pathlib import Path

def load_cdl(path):
    """Load CDL file, return list of flag bytes."""
    with open(path, 'rb') as f:
        return list(f.read())

def find_new_data(base_cdl, new_cdl, min_consecutive=3):
    """Find regions marked as DATA in new_cdl but not in base_cdl."""
    if len(base_cdl) != len(new_cdl):
        print(f"Warning: CDL sizes differ ({len(base_cdl)} vs {len(new_cdl)})")
    
    new_regions = []
    start = None
    length = 0
    
    for i in range(min(len(base_cdl), len(new_cdl))):
        # Check if newly marked as DATA (bit 1)
        was_data = base_cdl[i] & 2
        is_data = new_cdl[i] & 2
        
        if is_data and not was_data:
            if start is None:
                start = i
                length = 1
            else:
                length += 1
        else:
            if start is not None and length >= min_consecutive:
                bank = (start - 0x10) // 0x4000
                cpu_addr = 0x8000 + ((start - 0x10) % 0x4000)
                new_regions.append({
                    'file_offset': start,
                    'bank': bank,
                    'cpu_addr': cpu_addr,
                    'length': length
                })
            start = None
            length = 0
    
    return new_regions

def main():
    if len(sys.argv) < 3:
        print("Usage: cdl_compare.py <base.cdl> <new.cdl> [rom.nes]")
        sys.exit(1)
    
    base_path = sys.argv[1]
    new_path = sys.argv[2]
    rom_path = sys.argv[3] if len(sys.argv) > 3 else None
    
    base_cdl = load_cdl(base_path)
    new_cdl = load_cdl(new_path)
    
    rom_data = None
    if rom_path:
        with open(rom_path, 'rb') as f:
            rom_data = f.read()
    
    regions = find_new_data(base_cdl, new_cdl)
    
    print(f"Found {len(regions)} new DATA regions:\n")
    
    for r in sorted(regions, key=lambda x: -x['length'])[:20]:
        print(f"Bank 0x{r['bank']:02X} ${r['cpu_addr']:04X}: {r['length']} bytes")
        print(f"  File offset: 0x{r['file_offset']:05X}")
        
        if rom_data and r['file_offset'] + 16 <= len(rom_data):
            preview = rom_data[r['file_offset']:r['file_offset']+16]
            hex_str = ' '.join(f'{b:02x}' for b in preview)
            print(f"  Preview: {hex_str}")
        print()

if __name__ == '__main__':
    main()
```

### Spell Table Analyzer

Save as `tools/analyze_spell_cdl.py`:

```python
#!/usr/bin/env python3
"""Analyze CDL to find spell table candidates."""

import sys
from pathlib import Path

def analyze_spell_regions(cdl_path, rom_path):
    """Look for 6-byte entry patterns in newly accessed data."""
    
    with open(cdl_path, 'rb') as f:
        cdl = list(f.read())
    with open(rom_path, 'rb') as f:
        rom = f.read()
    
    # Known candidates
    candidates = [
        (0x0D, 0x9000, "DW4Lib location"),
        (0x05, 0x8000, "Original asset-map (incorrect)"),
    ]
    
    print("Checking known spell table candidates:\n")
    
    for bank, cpu_addr, desc in candidates:
        file_offset = bank * 0x4000 + 0x10 + (cpu_addr - 0x8000)
        
        # Check CDL flags for first 64 spells * 6 bytes = 384 bytes
        data_count = 0
        for i in range(384):
            if file_offset + i < len(cdl) and cdl[file_offset + i] & 2:
                data_count += 1
        
        coverage = data_count / 384 * 100
        print(f"Bank 0x{bank:02X} ${cpu_addr:04X} ({desc}):")
        print(f"  CDL coverage: {data_count}/384 bytes ({coverage:.1f}%)")
        
        if coverage > 10:
            print("  First 30 bytes:")
            preview = rom[file_offset:file_offset+30]
            print(f"  {' '.join(f'{b:02x}' for b in preview)}")
            
            # Try to interpret as spell entries
            print("  As spell entries (6 bytes each):")
            for spell_id in range(5):
                offset = file_offset + spell_id * 6
                entry = rom[offset:offset+6]
                if len(entry) == 6:
                    print(f"    Spell {spell_id}: name_idx={entry[0]}, mp={entry[1]}, "
                          f"power={entry[2]}, flags={entry[3]:02x}, "
                          f"effect={entry[4]}, rate={entry[5]}")
        print()

if __name__ == '__main__':
    if len(sys.argv) < 3:
        print("Usage: analyze_spell_cdl.py <cdl_file> <rom_file>")
        sys.exit(1)
    analyze_spell_regions(sys.argv[1], sys.argv[2])
```

### Experience Table Analyzer

Save as `tools/analyze_exp_cdl.py`:

```python
#!/usr/bin/env python3
"""Analyze CDL to find experience table candidates."""

import sys

def analyze_exp_regions(cdl_path, rom_path):
    """Look for ascending 3-byte or 2-byte sequences in newly accessed data."""
    
    with open(cdl_path, 'rb') as f:
        cdl = list(f.read())
    with open(rom_path, 'rb') as f:
        rom = f.read()
    
    print("Searching for experience table patterns in newly accessed DATA...\n")
    
    # Find regions with new DATA access
    candidates = []
    
    for bank in range(32):
        bank_offset = bank * 0x4000 + 0x10
        
        for addr in range(0, 0x4000 - 30, 1):
            file_offset = bank_offset + addr
            
            # Check if this region has DATA flags
            if not (cdl[file_offset] & 2):
                continue
            
            # Try 3-byte entries (24-bit EXP)
            values_3byte = []
            for i in range(10):
                off = file_offset + i * 3
                if off + 2 < len(rom):
                    val = rom[off] | (rom[off+1] << 8) | (rom[off+2] << 16)
                    values_3byte.append(val)
            
            # Check if strictly ascending
            if len(values_3byte) == 10:
                ascending = all(values_3byte[i] < values_3byte[i+1] 
                               for i in range(len(values_3byte)-1))
                if ascending and values_3byte[0] > 0 and values_3byte[0] < 100:
                    cpu_addr = 0x8000 + addr
                    candidates.append({
                        'bank': bank,
                        'cpu_addr': cpu_addr,
                        'file_offset': file_offset,
                        'entry_size': 3,
                        'first_values': values_3byte[:5]
                    })
            
            # Try 2-byte entries (16-bit EXP)
            values_2byte = []
            for i in range(10):
                off = file_offset + i * 2
                if off + 1 < len(rom):
                    val = rom[off] | (rom[off+1] << 8)
                    values_2byte.append(val)
            
            if len(values_2byte) == 10:
                ascending = all(values_2byte[i] < values_2byte[i+1] 
                               for i in range(len(values_2byte)-1))
                if ascending and values_2byte[0] > 0 and values_2byte[0] < 100:
                    cpu_addr = 0x8000 + addr
                    candidates.append({
                        'bank': bank,
                        'cpu_addr': cpu_addr,
                        'file_offset': file_offset,
                        'entry_size': 2,
                        'first_values': values_2byte[:5]
                    })
    
    # Sort by first value (smaller = more likely EXP table start)
    candidates.sort(key=lambda x: x['first_values'][0])
    
    print(f"Found {len(candidates)} potential EXP table locations:\n")
    
    for c in candidates[:15]:
        print(f"Bank 0x{c['bank']:02X} ${c['cpu_addr']:04X} ({c['entry_size']}-byte entries):")
        print(f"  First 5 values: {c['first_values']}")
        print()

if __name__ == '__main__':
    if len(sys.argv) < 3:
        print("Usage: analyze_exp_cdl.py <cdl_file> <rom_file>")
        sys.exit(1)
    analyze_exp_regions(sys.argv[1], sys.argv[2])
```

---

## Part 4: Quick Reference

### Mesen CDL Operations

| Action | Menu Path |
|--------|-----------|
| Start logging | Debug → Code/Data Logger → (starts automatically) |
| Reset log | Debug → Code/Data Logger → Reset Log |
| Save log | Debug → Code/Data Logger → Save As... |
| Load log | Debug → Code/Data Logger → Load... |
| Merge logs | Debug → Code/Data Logger → Load (adds to existing) |

### File Locations

| File | Path |
|------|------|
| ROM | `roms/Dragon Warrior IV (1992-10)(Enix)(US).nes` |
| Merged CDL | `GameInfo/Games/NES/Dragon Warrior 4 (NES)/Debugging/cdls/Dragon Warrior IV (1992-10)(Enix)(US)-merged.cdl` |
| Test CDLs | `debug/` folder |
| Analysis scripts | `tools/` folder |

### Analysis Commands

```powershell
# Compare base CDL with spell test CDL
python tools/cdl_compare.py `
    "path/to/merged.cdl" `
    "debug/Dragon Warrior IV-spells-test.cdl" `
    "roms/Dragon Warrior IV (1992-10)(Enix)(US).nes"

# Analyze spell table candidates
python tools/analyze_spell_cdl.py `
    "debug/Dragon Warrior IV-spells-test.cdl" `
    "roms/Dragon Warrior IV (1992-10)(Enix)(US).nes"

# Analyze EXP table candidates
python tools/analyze_exp_cdl.py `
    "debug/Dragon Warrior IV-levelup-test.cdl" `
    "roms/Dragon Warrior IV (1992-10)(Enix)(US).nes"
```

---

## Part 5: Success Criteria

### Spell Table Verified When:
- [ ] Consistent DATA access in one bank/address during all spell casts
- [ ] 6-byte entry structure matches expected spell format
- [ ] MP cost values match known spell costs
- [ ] 64 spells × 6 bytes = 384 bytes total

### Experience Table Verified When:
- [ ] DATA access during level-up in a specific region
- [ ] Ascending values (higher levels need more EXP)
- [ ] Multiple tables (one per character or class)
- [ ] Values match known EXP requirements from guides

---

## Appendix: Known EXP Requirements

For verification, here are some known EXP values from game guides:

| Character | Level 2 | Level 5 | Level 10 | Level 20 |
|-----------|---------|---------|----------|----------|
| Hero | ~8 | ~110 | ~900 | ~8000 |
| Ragnar | ~12 | ~150 | ~1100 | ~9500 |
| Alena | ~7 | ~100 | ~850 | ~7500 |

These should help verify when we find the correct tables.
