# Dragon Warrior IV - Manual Testing Index

**Last Updated:** 2026-01-09  
**Status:** Active

---

## Purpose

This folder contains manual testing procedures that require human gameplay to verify ROM data locations and functionality. These tests cannot be automated because they require:
- Playing the game in an emulator with debugging features
- Capturing CDL (Code/Data Logger) data during specific actions
- Visual verification of game behavior

---

## Test Categories

### 1. CDL Data Verification

Tests that capture CDL data to identify ROM access patterns.

| Test | Document | Priority | Issue |
|------|----------|----------|-------|
| Spell Table Verification | [cdl-verification-quickstart.md](cdl-verification-quickstart.md) | HIGH | #81 |
| Experience Table Verification | [cdl-verification-quickstart.md](cdl-verification-quickstart.md) | HIGH | #81 |
| Level-Up Stat Gains | [levelup-testing.md](levelup-testing.md) | MEDIUM | #50 |

### 2. Save System Testing

Tests for save file integrity and editor functionality.

| Test | Document | Priority | Issue |
|------|----------|----------|-------|
| SRAM Format Verification | [save-testing.md](save-testing.md) | HIGH | #76 |
| Save Editor Validation | [save-testing.md](save-testing.md) | MEDIUM | #77 |
| Save State Compatibility | [save-testing.md](save-testing.md) | LOW | - |

### 3. Chapter Progression Testing

Tests for chapter-specific mechanics.

| Test | Document | Priority | Issue |
|------|----------|----------|-------|
| Chapter Transitions | [chapter-testing.md](chapter-testing.md) | MEDIUM | #62 |
| Wagon System | [chapter-testing.md](chapter-testing.md) | LOW | #59 |
| AI Tactics | [chapter-testing.md](chapter-testing.md) | LOW | #55 |

### 4. Battle System Testing

Tests for combat mechanics.

| Test | Document | Priority | Issue |
|------|----------|----------|-------|
| Damage Formulas | [battle-testing.md](battle-testing.md) | MEDIUM | - |
| Status Effects | [battle-testing.md](battle-testing.md) | LOW | #66 |
| Elemental Resistances | [battle-testing.md](battle-testing.md) | LOW | #67 |

---

## Quick Start

### Prerequisites

1. **Mesen Emulator** with CDL support
   - Download: https://www.mesen.ca/
   - Enable Debug menu

2. **Dragon Warrior IV ROM**
   - File: `Dragon Warrior IV (1992-10)(Enix)(US).nes`
   - Location: `roms/` folder

3. **Python 3.x** with dependencies
   ```powershell
   cd c:\Users\me\source\repos\dragon-warrior-4-info
   pip install -r requirements.txt
   ```

### Running a Test

1. Open test document
2. Follow setup instructions
3. Perform gameplay actions
4. Save CDL/save state
5. Run analysis script
6. Update documentation with results

---

## Test Results Tracking

After completing tests, update the following:

| Item | Location | Description |
|------|----------|-------------|
| `asset-map.json` | `data/` | ROM data locations |
| Include files | `source_files/include/` | Assembly labels |
| MLB file | `GameInfo/.../Debugging/` | Mesen labels |
| Session log | `~docs/session-logs/` | Test notes |

---

## Testing Environment

### Files Needed

| File | Path | Purpose |
|------|------|---------|
| ROM | `roms/Dragon Warrior IV (1992-10)(Enix)(US).nes` | Game ROM |
| Merged CDL | `GameInfo/.../cdls/Dragon Warrior IV-merged.cdl` | Baseline |
| MLB | `GameInfo/.../Dragon Warrior IV.mlb` | Mesen labels |
| TBL | `GameInfo/.../Dragon Warrior 4 (NES) - English.tbl` | Text table |

### Analysis Scripts

| Script | Purpose |
|--------|---------|
| `tools/analyze_spell_cdl.py` | Spell table verification |
| `tools/analyze_exp_cdl.py` | Experience table verification |
| `tools/cdl_compare.py` | Compare CDL files |
| `tools/verify_chapters_cdl.py` | Chapter map verification |

---

## GitHub Issues

Related manual testing issues:

- **#81** - Manual Testing: CDL verification for spell and experience tables
- **#76** - Research: Save system and SRAM format  
- **#77** - Tools: Save State and SRAM Editor
- **#50** - Extraction: Experience and level-up tables

---

## Contributing

When adding new tests:

1. Create test document in this folder
2. Add entry to this README
3. Create GitHub issue if needed
4. Document expected results clearly
5. Include analysis script if applicable
