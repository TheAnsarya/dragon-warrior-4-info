# Dragon Warrior IV - Master Project Plan

**Created:** 2026-01-09  
**Last Updated:** 2026-01-09  
**Status:** Active Development  
**Related:** [DW4Lib](../../../logsmall/DW4Lib), [GameInfo](../../../GameInfo/Games/NES/Dragon%20Warrior%204%20(NES))

---

## Project Overview

Complete disassembly, documentation, and tooling for Dragon Warrior IV (NES, US 1992) with:
1. Full 6502 assembly source producing byte-perfect ROM
2. Extracted/editable game assets (JSON, PNG)
3. C# library (DW4Lib) for programmatic data access
4. Universal editor GUI for all asset types
5. Comprehensive documentation for Dark Repos wiki

## Current Status Summary (2026-01-09)

### Repositories

| Repository | Purpose | Status |
|------------|---------|--------|
| `dragon-warrior-4-info` | Disassembly, docs, Python tools | 🔄 Active |
| `logsmall/DW4Lib` | C# .NET 9.0 library | 🔄 Active |
| `GameInfo/Games/NES/Dragon Warrior 4 (NES)` | Debugging files, CDLs, MLBs | ✅ Support |

### Completion by Area

| Area | Status | Progress | Notes |
|------|--------|----------|-------|
| **CDL Coverage** | ✅ Good | 80.76% | All 5 chapters verified |
| **Disassembly Banks** | 🔄 Partial | 32/32 files | Labels incomplete |
| **Monster Data** | ✅ Complete | 100% | 27-byte format documented |
| **Item Data** | ✅ Complete | 100% | 8-byte format documented |
| **Spell Data** | 🔄 Partial | ~80% | Location unverified (Bank 0x0D) |
| **Experience Tables** | ❌ Unknown | 0% | Location undiscovered |
| **Text/DTE System** | ✅ Complete | 100% | Full encoding documented |
| **Maps** | 🔄 Partial | ~60% | Pointer tables found |
| **Audio** | 🔄 Partial | ~40% | Banks documented |
| **Labels/MLB** | 🔄 Active | ~30% | Include files started |
| **C# Library** | 🔄 Active | ~60% | Core structures done |
| **Documentation** | 🔄 Active | ~70% | Formats documented |

---

## Open GitHub Issues (80 total, 30+ open)

### High Priority

| # | Title | Category | Status |
|---|-------|----------|--------|
| #78 | Tools: DW4Lib C# Library Integration | tools | Active |
| #77 | Tools: Save State and SRAM Editor | tools | Blocked |
| #76 | Research: Save system and SRAM format | data | In Progress |
| #73 | Research: Main game loop and state machine | data | Open |
| #72 | Research: Event flag system | data | Open |
| #62 | Research: Chapter progression system | data | Open |
| #56 | Create Mesen debugger labels file | disassembly | Active |
| #12 | Disassembly: Identify and document text encoding | text | Complete (verify) |
| #13 | Disassembly: Locate and document text pointers/strings | text | In Progress |
| #5 | Analyze ROM header and verify checksums | disassembly | Open |

### Medium Priority

| # | Title | Category |
|---|-------|----------|
| #80 | Update disassembly labels based on Monster.cs/Item.cs research | docs |
| #81 | Manual Testing: CDL verification for spell and experience tables | testing |
| #79 | Research: Casino system code and data extraction | tools |
| #71 | Research: Random number generation system | data |
| #70 | Research: World map system and zones | maps |
| #67 | Research: Elemental damage and resistance system | data |
| #61 | Research: Monster arena betting system | data |
| #58 | Docs: Create documentation index and quick reference | docs |
| #55 | Research: Party AI tactics system | disassembly |
| #50 | Extraction: Experience and level-up tables | tools |
| #22 | Extraction: Monster data extraction | tools |
| #16 | Disassembly: Document monster data tables | disassembly |

### Lower Priority

| # | Title | Category |
|---|-------|----------|
| #75 | Research: Animation systems | graphics |
| #74 | Research: Menu system and UI rendering | graphics |
| #69 | Research: NPC dialogue system and triggers | text |
| #68 | Research: Flee and escape mechanics | data |
| #66 | Research: Status effect system | data |
| #65 | Research: Equipment system and stat modifiers | data |
| #64 | Research: Inn and church service mechanics | data |
| #59 | Research: Wagon system and party management | data |

---

## Work Breakdown Structure

### Phase 1: Critical Blockers (Priority)

#### 1.1 Experience Table Discovery (Issue #50)
- **Status:** BLOCKED - location unknown
- **Required Action:** 
  - CDL gameplay session during level-ups
  - Run `tools/analyze_exp_cdl.py` on captured data
  - Update `asset-map.json` with verified location
- **See:** [~docs/plans/cdl-verification-testing.md](cdl-verification-testing.md)

#### 1.2 Spell Table Verification (Issue #81)
- **Status:** Unverified (Bank 0x0D $9000)
- **Required Action:**
  - CDL gameplay session casting spells
  - Run `tools/analyze_spell_cdl.py`
  - Verify 6-byte structure matches DW4Lib

#### 1.3 Mesen Labels File (Issue #56)
- **Current:** `Dragon Warrior IV (1992-10)(Enix)(US).mlb` exists
- **Required:**
  - Sync with include files (monsters.inc, items.inc, etc.)
  - Export labels from Python analysis tools
  - Merge auto_labels.txt into MLB format

### Phase 2: DW4Lib Completion (Issue #78)

#### 2.1 Completed Components ✅
- `DataStructures/Monster.cs` - 27-byte format
- `DataStructures/Item.cs` - 8-byte format  
- `DataStructures/Spell.cs` - 6-byte format
- `DataStructures/Character.cs` - 32-byte format
- `ROM/DW4Rom.cs` - MMC3 bank mapping
- `Text/DW4Text.cs` - Encoding + DTE
- `Converters/*` - JSON export/import
- `DQ3r/*` - SNES conversion

#### 2.2 Pending Components
| Component | Priority | Dependency |
|-----------|----------|------------|
| `DataStructures/ExperienceTable.cs` | HIGH | Exp table location |
| `Maps/MapTile.cs` | MEDIUM | Map format research |
| `Audio/MusicData.cs` | LOW | Audio format research |
| `Graphics/SpriteExtractor.cs` | LOW | CHR format research |

### Phase 3: Disassembly Completion

#### 3.1 Include Files Status
| File | Status | Coverage |
|------|--------|----------|
| `monsters.inc` | ✅ Complete | 27-byte structure |
| `items.inc` | ✅ Complete | 8-byte structure |
| `spells.inc` | 🔄 Partial | 6-byte structure, location unverified |
| `characters.inc` | ✅ Complete | 32-byte structure |
| `ram_map.inc` | 🔄 Partial | Core addresses documented |
| `maps.inc` | 🔄 Partial | Pointer tables |
| `audio.inc` | ✅ Complete | Bank assignments |
| `constants.inc` | 🔄 Partial | Needs expansion |

#### 3.2 Bank Analysis Status
| Banks | Type | Coverage | Status |
|-------|------|----------|--------|
| 0x00-0x05 | Code | 60-90% | Labels needed |
| 0x06 | Monster Data | 99.8% | ✅ Complete |
| 0x07 | Item Data | 78.1% | ✅ Complete |
| 0x08 | Tilesets | 96.7% | Partial docs |
| 0x09-0x0B | Maps | 84-97% | Pointer tables found |
| 0x0C-0x16 | Graphics | 60-90% | CHR format TBD |
| 0x17 | Map Pointers | 21.8% | Documented |
| 0x18-0x1D | Audio | 57-93% | Banks documented |
| 0x1E-0x1F | Fixed | 94% | Core engine |

### Phase 4: Documentation & Wiki

#### 4.1 Dark Repos Wikitext
- ROM Map: `docs/wikitext/rom-map.wikitext`
- RAM Map: `docs/wikitext/ram-map.wikitext`
- Monster Data: `docs/wikitext/monsters.wikitext`
- Item Data: `docs/wikitext/items.wikitext`

#### 4.2 Markdown Documentation
- FORMAT docs: 17 files complete
- ANALYSIS docs: Ongoing research
- QUICK_REFERENCE.md: Current summary

### Phase 5: Editor Tools (Issue #3)

#### 5.1 Python Tools (Complete)
- `universal_editor.py` - Framework exists
- `dw4_save_editor.py` - Save editor
- Various extraction tools

#### 5.2 C# Tools (Planned)
- Blazor WebAssembly editor (future)
- Command-line extractor (via DW4Lib)
- Save state editor GUI (Issue #77)

---

## Immediate Action Items

### Today's Tasks (Priority Order)

1. **CDL Verification Session** (Manual)
   - [ ] Spell casting CDL capture
   - [ ] Level-up CDL capture
   - [ ] Run analysis scripts
   - [ ] Update asset-map.json

2. **Label File Sync**
   - [ ] Export include file labels to MLB format
   - [ ] Merge existing MLB with new labels
   - [ ] Test in Mesen debugger

3. **Documentation Update**
   - [ ] Update QUICK_REFERENCE.md with verified data
   - [ ] Create wikitext exports for Dark Repos
   - [ ] Update INDEX.md progress tracking

### This Week

1. Complete experience table location research
2. Verify spell table with gameplay CDL
3. Expand MLB labels file
4. Test DW4Lib extraction on full ROM

### This Month

1. All data table locations verified
2. MLB file comprehensive (~500+ labels)
3. DW4Lib 1.0 release with all extractors
4. Dark Repos wiki pages published

---

## Testing Checklist

See [~manual-testing/](../~manual-testing/) for detailed procedures:

- [ ] CDL spell verification (`cdl-verification-quickstart.md`)
- [ ] CDL experience table verification
- [ ] Save editor functionality
- [ ] ROM build byte-perfect match
- [ ] DW4Lib JSON extraction validation

---

## Session Log References

| Session | Date | Focus |
|---------|------|-------|
| #11 | 2026-01-03 | Spell table fix, audio docs, exp research |
| #10 | 2026-01-03 | Label updates, CDL analysis |
| #09 | 2026-01-03 | Asset map updates |
| #08 | 2026-01-03 | Bug fixes |
| #07 | 2026-01-03 | CDL verification |
| #06 | 2026-01-01 | Chapter 2 integration |
| #05 | 2026-01-01 | Integration work |

---

## Repository Cross-References

### dragon-warrior-4-info
- Main disassembly and documentation repo
- Python tools for extraction/analysis
- `data/asset-map.json` - Master data locations

### logsmall/DW4Lib
- C# .NET library for programmatic access
- DataStructures, Converters, DQ3r export
- Unit tests in DW4Lib.Tests

### GameInfo
- CDL/MLB debugging files
- Table files for emulators
- Merged CDL collection
