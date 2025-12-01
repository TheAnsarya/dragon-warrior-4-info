# Dragon Warrior 4 Disassembly Project - Comprehensive Plan

## 📋 Project Overview

This document outlines the complete plan for creating a full disassembly of Dragon Warrior IV (NES US version) with asset extraction, editing tools, and a complete build pipeline.

## 🎯 Goals

1. **Complete Code Disassembly** - Full 6502 assembly source that assembles to a byte-perfect ROM
2. **Asset Extraction System** - Extract all game assets to editable formats
3. **Universal Asset Editor** - GUI editor for all game data and graphics
4. **Build Pipeline** - JSON/PNG → ASM → ROM build system
5. **Comprehensive Documentation** - Technical docs for all game systems
6. **Automated Testing** - Verify ROM integrity and data correctness

---

## 📊 Dragon Warrior IV ROM Structure

### ROM Technical Details

| Property | Value |
|----------|-------|
| Mapper | MMC3 (iNES Mapper 4) |
| PRG ROM | 256 KB (16 × 16 KB banks) |
| CHR ROM | 128 KB (16 × 8 KB banks) |
| Mirroring | Vertical (hardware controlled) |
| Battery | Yes (SRAM for saves) |
| Header | 16 bytes (iNES) |
| Total Size | 393,232 bytes |

### Memory Map

```
$0000-$07FF   2KB Internal RAM
$6000-$7FFF   8KB SRAM (battery-backed save data)
$8000-$9FFF   PRG Bank 0 (switchable)
$A000-$BFFF   PRG Bank 1 (switchable)
$C000-$DFFF   PRG Bank 2 (switchable)
$E000-$FFFF   PRG Bank 3 (fixed to last bank)
```

### PRG Bank Organization (Estimated)

| Bank | Offset | Size | Content |
|------|--------|------|---------|
| 00 | $00010 | 16KB | Game engine, main loop |
| 01 | $04010 | 16KB | Battle system |
| 02 | $08010 | 16KB | Menu systems |
| 03 | $0C010 | 16KB | Field/map engine |
| 04-07 | ... | 64KB | Chapter-specific code |
| 08-11 | ... | 64KB | Data tables |
| 12-14 | ... | 48KB | Text/dialog data |
| 15 | $3C010 | 16KB | Fixed bank (vectors, init) |

---

## 📑 Phase 1: ROM Analysis & Initial Disassembly

### 1.1 ROM Header Analysis
- [ ] Verify iNES header
- [ ] Extract mapper information
- [ ] Document PRG/CHR ROM sizes
- [ ] Verify checksums

### 1.2 Initial Code Analysis
- [ ] Identify reset vector ($FFFC)
- [ ] Identify NMI handler ($FFFA)
- [ ] Identify IRQ handler ($FFFE)
- [ ] Map out fixed bank (Bank 15)
- [ ] Identify bank switching routines

### 1.3 Memory Map Documentation
- [ ] System RAM ($0000-$07FF)
- [ ] SRAM/WRAM ($6000-$7FFF)
- [ ] PPU registers usage
- [ ] APU registers usage

### 1.4 Known Data Structures (from existing documentation)
- [ ] Party member data ($6001-$60F0)
- [ ] Chapter state ($615A)
- [ ] Treasure flags ($625D-$6277)
- [ ] Return spell locations ($6165-$6167)
- [ ] Map/submap numbers ($063-$064)

---

## 📑 Phase 2: Complete Disassembly

### 2.1 Disassembly Infrastructure
- [ ] Create DW4_Defines.asm with constants
- [ ] Create memory map include files
- [ ] Set up bank include structure
- [ ] Configure Ophis assembler

### 2.2 Bank-by-Bank Disassembly

Each bank requires:
1. Raw disassembly from ROM
2. Label identification
3. Data table extraction
4. Code flow analysis
5. Comment documentation

| Bank | Status | Primary Content |
|------|--------|-----------------|
| Bank 00 | ⬜ | Main engine |
| Bank 01 | ⬜ | Battle system |
| Bank 02 | ⬜ | Menus |
| Bank 03 | ⬜ | Field engine |
| Bank 04 | ⬜ | Chapter 1 |
| Bank 05 | ⬜ | Chapter 2 |
| Bank 06 | ⬜ | Chapter 3 |
| Bank 07 | ⬜ | Chapter 4-5 |
| Bank 08 | ⬜ | Monster data |
| Bank 09 | ⬜ | Item/spell data |
| Bank 10 | ⬜ | Map data |
| Bank 11 | ⬜ | NPC data |
| Bank 12 | ⬜ | Dialog (part 1) |
| Bank 13 | ⬜ | Dialog (part 2) |
| Bank 14 | ⬜ | Dialog (part 3) |
| Bank 15 | ⬜ | Fixed bank |

### 2.3 Build Verification
- [ ] Create build script
- [ ] Verify byte-perfect assembly
- [ ] Create comparison tools
- [ ] Document any discrepancies

---

## 📑 Phase 3: Asset Extraction

### 3.1 Data Tables
All extracted to JSON format in `assets/json/`

| Asset | Format | Location | Status |
|-------|--------|----------|--------|
| Monsters | JSON | Bank 08 | ⬜ |
| Items | JSON | Bank 09 | ⬜ |
| Spells | JSON | Bank 09 | ⬜ |
| Equipment | JSON | Bank 09 | ⬜ |
| Shops | JSON | Various | ⬜ |
| Characters | JSON | Various | ⬜ |
| Experience tables | JSON | Various | ⬜ |
| Enemy groups | JSON | Bank 08 | ⬜ |

### 3.2 Text and Dialog
Extracted to text files with encoding support

| Asset | Format | Status |
|-------|--------|--------|
| Dialog text | JSON + TXT | ⬜ |
| Item names | JSON | ⬜ |
| Monster names | JSON | ⬜ |
| Spell names | JSON | ⬜ |
| Location names | JSON | ⬜ |
| Menu text | JSON | ⬜ |

### 3.3 Graphics
Extracted to PNG format in `assets/graphics/`

| Asset | Format | Status |
|-------|--------|--------|
| Character sprites | PNG | ⬜ |
| Monster sprites | PNG | ⬜ |
| Map tilesets | PNG | ⬜ |
| Menu graphics | PNG | ⬜ |
| Title screen | PNG | ⬜ |
| Font tiles | PNG | ⬜ |

### 3.4 Maps
Extracted to JSON/TMX format in `assets/maps/`

| Asset | Format | Status |
|-------|--------|--------|
| World map | JSON | ⬜ |
| Town maps | JSON | ⬜ |
| Dungeon maps | JSON | ⬜ |
| Castle maps | JSON | ⬜ |
| Tile collision | JSON | ⬜ |

### 3.5 Audio
Extracted to custom format in `assets/audio/`

| Asset | Format | Status |
|-------|--------|--------|
| Music tracks | JSON | ⬜ |
| Sound effects | JSON | ⬜ |
| APU sequences | JSON | ⬜ |

---

## 📑 Phase 4: Universal Editor

### 4.1 Editor Framework
- [ ] Main window with tabbed interface
- [ ] ROM loading/saving
- [ ] Build integration
- [ ] Undo/redo system
- [ ] Search functionality

### 4.2 Individual Editors

| Editor | Features | Status |
|--------|----------|--------|
| Monster Editor | Stats, elements, drops, AI | ⬜ |
| Item Editor | Properties, effects, prices | ⬜ |
| Spell Editor | Damage, MP, targets, effects | ⬜ |
| Character Editor | Stats, growth, equipment | ⬜ |
| Shop Editor | Inventory, prices | ⬜ |
| Dialog Editor | Text, encoding, preview | ⬜ |
| Map Editor | Tiles, events, warps | ⬜ |
| Graphics Editor | Sprites, palettes | ⬜ |
| Music Editor | Tracks, instruments | ⬜ |

### 4.3 Validation System
- [ ] Data range validation
- [ ] Reference integrity
- [ ] ROM size limits
- [ ] Balance warnings

---

## 📑 Phase 5: Build Pipeline

### 5.1 Asset Reinsertion
- [ ] JSON → ASM generator
- [ ] PNG → CHR converter
- [ ] Text encoder (TBL format)
- [ ] Map compiler

### 5.2 Build System
- [ ] Main build script (PowerShell)
- [ ] Incremental builds
- [ ] Parallel assembly
- [ ] Build caching

### 5.3 Verification
- [ ] ROM comparison tool
- [ ] Checksum verification
- [ ] Size validation
- [ ] Content verification

---

## 📑 Phase 6: Documentation

### 6.1 Technical Documentation
- [ ] ROM map (complete)
- [ ] RAM map (complete)
- [ ] Data format specs
- [ ] Compression algorithms
- [ ] Bank switching details

### 6.2 User Documentation
- [ ] Build guide
- [ ] Editor tutorials
- [ ] API documentation
- [ ] Contribution guide

### 6.3 Research Documentation
- [ ] Game mechanics analysis
- [ ] Formula documentation
- [ ] AI behavior analysis
- [ ] Event scripting

---

## 📑 Phase 7: Testing

### 7.1 Automated Tests
- [ ] Build system tests
- [ ] Asset extraction tests
- [ ] Editor unit tests
- [ ] Integration tests

### 7.2 Manual Testing
- [ ] Playthrough testing
- [ ] Edge case testing
- [ ] Regression testing
- [ ] Performance testing

### 7.3 Continuous Integration
- [ ] GitHub Actions setup
- [ ] Automated builds
- [ ] Test reporting
- [ ] Coverage tracking

---

## 📅 Timeline (Estimated)

| Phase | Duration | Dependencies |
|-------|----------|--------------|
| Phase 1: Analysis | 2-4 weeks | None |
| Phase 2: Disassembly | 4-8 weeks | Phase 1 |
| Phase 3: Extraction | 2-4 weeks | Phase 2 |
| Phase 4: Editors | 4-8 weeks | Phase 3 |
| Phase 5: Build Pipeline | 2-4 weeks | Phase 3 |
| Phase 6: Documentation | Ongoing | All phases |
| Phase 7: Testing | Ongoing | Phase 4, 5 |

**Total Estimated Time**: 14-28 weeks (3-7 months)

---

## 🔧 Tools and Technologies

### Required
- Python 3.8+
- Ophis Assembler
- PowerShell 5.1+

### Recommended
- VS Code with 6502 extension
- Mesen (NES emulator with debugger)
- Git for version control

### Optional
- Tiled (map editor)
- Aseprite/GIMP (graphics)
- PyQt5 (alternative GUI)

---

## 📚 Reference Materials

### Existing Documentation
- GameInfo Wiki pages (RAM map, TBL, etc.)
- Mesen debug labels (.mlb files)
- Community research

### Related Projects
- dragon-warrior-info (DW1 disassembly)
- ffmq-info (FFMQ disassembly)

### External Resources
- NES Dev Wiki
- 6502.org
- Mapper 4 (MMC3) documentation

---

## 🎮 DW4-Specific Features to Document

### Chapters System
- Chapter 1: Ragnar (soldier)
- Chapter 2: Alena, Brey, Cristo (princess and advisors)
- Chapter 3: Taloon (merchant)
- Chapter 4: Nara, Mara (sisters)
- Chapter 5: Hero (main quest)

### Unique Mechanics
- AI-controlled party members
- Wagon system (party swap)
- Day/night cycle
- Casino games
- Medal collection
- Monster arena

### Data Complexity
- 8 playable characters with unique stats
- Multiple inventory systems
- Chapter-specific flags
- Complex event scripting

---

## ✅ Immediate Next Steps

1. **Create GitHub Repository**
   - Initialize repository
   - Set up GitHub Issues
   - Create project board

2. **Set Up Development Environment**
   - Copy Ophis assembler
   - Create initial file structure
   - Verify build system

3. **Begin ROM Analysis**
   - Analyze ROM header
   - Map out bank structure
   - Identify key routines

4. **Document Existing Knowledge**
   - Import RAM map from GameInfo
   - Import TBL file
   - Create initial defines file
