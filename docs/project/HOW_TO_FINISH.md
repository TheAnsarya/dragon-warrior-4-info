# Dragon Warrior IV (NES) - How to Finish This Project

**Project Completion Roadmap & Current Status**

This document tracks what's needed to consider the Dragon Warrior IV disassembly project "complete."

## 📊 Current Status: ~35% Complete

Dragon Warrior IV is significantly more complex than DW1-3 (16 PRG banks vs 4, 5 chapters with different party mechanics, etc.).

### ✅ Completed Work

#### Infrastructure
- [x] Project structure established
- [x] GitHub repository configured
- [x] Documentation framework created
- [x] VS Code development environment
- [x] Ophis assembler integration
- [x] Build pipeline basics

#### Initial Analysis
- [x] ROM header verified (Mapper 4 / MMC3)
- [x] Bank structure identified (16 PRG, 32 CHR banks)
- [x] Initial bank purpose mapping
- [x] Battle system preliminary analysis
- [x] Monster table locations identified
- [x] Experience system analysis

#### Documentation
- [x] ROM map reference (partial)
- [x] Bank interconnections documented
- [x] Battle system analysis (partial)
- [x] EXP system analysis
- [x] Casino system documented
- [x] Project roadmap and plan

---

## 🔲 Remaining Work

### 1. Complete Disassembly (Priority: CRITICAL)
**Estimated effort: 100-200 hours**

DW4 has 16 PRG banks (256KB) vs DW1's 4 banks (64KB).

- [ ] **Bank 00** - Core engine / bank switching
- [ ] **Bank 01** - Chapter 1 (Ragnar) code
- [ ] **Bank 02** - Chapter 2 (Princess Alena) code
- [ ] **Bank 03** - Chapter 3 (Taloon) code
- [ ] **Bank 04** - Chapter 4 (Meena/Maya) code
- [ ] **Bank 05** - Chapter 5 / final chapter code
- [ ] **Bank 06** - Monster data tables
- [ ] **Bank 07** - Item/equipment tables
- [ ] **Bank 08-0F** - Maps, graphics, text
- [ ] **Label all routines** - Replace Lxxxx with descriptive names
- [ ] **Document all subroutines** - Comments explaining each function

### 2. Asset Extraction (Priority: HIGH)
**Estimated effort: 40-60 hours**

- [ ] **Monster data** - 144 monsters (vs 39 in DW1)
  - Stats (HP, MP, STR, AGI, DEF, etc.)
  - Drop tables
  - AI patterns
  
- [ ] **Spell data** - ~35 spells across 10 characters
  - MP costs
  - Effects
  - Targeting

- [ ] **Item data** - 200+ items
  - Weapons
  - Armor
  - Accessories
  - Key items
  - Consumables

- [ ] **Character data** - 10 playable characters
  - Base stats
  - Growth curves
  - Learnable spells
  - Equipment compatibility

- [ ] **Shop data** - All shops per chapter

- [ ] **Text/Dialog** - Compressed text system
  - Main dialog
  - Item names
  - Monster names
  - Spell names
  - Menu text

- [ ] **Maps** - World maps and dungeons
  - Overworld (per chapter)
  - Town/dungeon interiors
  - NPC placements

- [ ] **Graphics** - CHR ROM
  - Character sprites (10 heroes)
  - Monster sprites (144 unique)
  - Tilesets
  - UI elements

### 3. Tools Development (Priority: HIGH)
**Estimated effort: 30-50 hours**

- [ ] **Universal Editor** - GUI for all assets
- [ ] **ROM Analyzer** - Complete analysis tool
- [ ] **Text Editor** - With compression support
- [ ] **Monster Editor** - All 144 monsters
- [ ] **Character Editor** - Growth curves, spells
- [ ] **Map Editor** - Visual map editing
- [ ] **Sprite Editor** - CHR manipulation
- [ ] **Build System** - Full asset pipeline

### 4. Dark Repos Wiki (Priority: HIGH)
**Estimated effort: 20-30 hours**

Wiki pages needed in `GameInfo/DarkRepos/Wiki/NES/Dragon_Warrior_IV/`:

- [ ] **index.wikitext** - Game overview
- [ ] **ROM_Map.wikitext** - All 16 banks documented
- [ ] **RAM_Map.wikitext** - Complete RAM documentation
- [ ] **Monster_Data.wikitext** - 144 monster entries
- [ ] **Character_Data.wikitext** - 10 character stat tables
- [ ] **Items.wikitext** - Complete item list
- [ ] **Magic.wikitext** - All spells documented
- [ ] **Shops.wikitext** - Shop inventories
- [ ] **Battle_System.wikitext** - Damage formulas
- [ ] **AI_Patterns.wikitext** - Monster/wagon AI
- [ ] **Chapter_System.wikitext** - Chapter mechanics
- [ ] **TBL.wikitext** - Text encoding table
- [ ] **Glitches.wikitext** - Known exploits
- [ ] **Secrets.wikitext** - Hidden content

### 5. Build Pipeline (Priority: MEDIUM)
**Estimated effort: 20-30 hours**

- [ ] **Clean build** - All source, no binary blobs
- [ ] **Asset pipeline** - JSON → ASM generation
- [ ] **Verification** - Byte-perfect match
- [ ] **Automated tests** - Build verification
- [ ] **Documentation** - Build instructions

---

## 🎯 Definition of "Complete"

1. **100% Disassembled** - All 16 PRG banks fully disassembled
2. **100% Labeled** - No Lxxxx style labels remain
3. **100% Documented** - All routines have comments
4. **All Assets Extracted** - Monsters, items, spells, maps, graphics
5. **Working Tools** - Can edit any game aspect
6. **Clean Build** - ROM builds from source only
7. **Complete Wiki** - All Dark Repos pages populated

---

## 📋 Complexity Comparison

| Aspect | DW1 | DW4 | Factor |
|--------|-----|-----|--------|
| PRG Banks | 4 | 16 | 4x |
| Monsters | 39 | 144 | 3.7x |
| Characters | 1 | 10 | 10x |
| Chapters | 1 | 5 | 5x |
| Spells | 10 | ~35 | 3.5x |
| Items | 32 | 200+ | 6x |
| Total Effort | 100% | ~400% | 4x |

---

## 🗓️ Suggested Timeline

### Phase 1: Core Extraction (Months 1-2)
- Extract all monster/item/spell data
- Basic disassembly of key banks
- Create extraction tools

### Phase 2: Disassembly (Months 3-5)
- Complete all 16 bank disassemblies
- Label all routines
- Document key systems

### Phase 3: Tools & Wiki (Months 6-7)
- Build universal editor
- Complete wiki documentation
- Build system finalization

### Phase 4: Polish (Month 8)
- Comprehensive review
- Final documentation
- Release preparation

---

## 📁 Key File Locations

| Content | Location |
|---------|----------|
| Disassembly source | `source_files/` |
| Analysis docs | `analysis/`, `data/` |
| Wiki content | `GameInfo/DarkRepos/Wiki/NES/Dragon_Warrior_IV/` |
| Tools | `tools/` |
| Build output | `build/` |
| Documentation | `docs/` |

---

## 📝 GitHub Issues to Create

### Epic Issues
1. `epic: Complete DW4 PRG Disassembly (16 banks)`
2. `epic: Extract All DW4 Game Assets`
3. `epic: DW4 Universal Editor Suite`
4. `epic: Complete DW4 Dark Repos Wiki`

### Major Tasks
5. `task: Disassemble Bank 00 - Core Engine`
6. `task: Disassemble Bank 06 - Monster Tables`
7. `task: Extract 144 monster stats`
8. `task: Extract 10 character growth tables`
9. `task: Implement DW4 text decompression`
10. `task: Create DW4 monster editor`
11. `task: Document DW4 battle system`
12. `task: Complete ROM_Map wiki page`

---

## 🔗 Related Resources

- [Data Crystal - Dragon Warrior IV](https://datacrystal.tcrf.net/wiki/Dragon_Warrior_IV)
- [DW4 Technical Notes](docs/reference/)
- [Cowness Labels](data/cowness_labels.txt) - Community labels
- [RHDN Dragon Warrior IV](https://www.romhacking.net/games/305/)

---

*Last updated: 2025*
