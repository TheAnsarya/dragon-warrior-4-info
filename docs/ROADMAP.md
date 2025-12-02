# Dragon Warrior IV Project Roadmap

## Vision Statement

Create the definitive disassembly and modding toolkit for Dragon Warrior IV (NES), enabling:
- Complete understanding of game internals
- Easy modification of all game assets
- Byte-perfect ROM rebuilding
- Foundation for future SNES port (DQ3: Remix)

---

## Phase 1: Foundation (Weeks 1-4)

### Goals
- Establish project infrastructure
- Begin ROM analysis
- Create basic extraction tools

### Milestones

#### 1.1 Project Setup ✅
- [x] Create repository structure
- [x] Set up GitHub issues and project board
- [x] Create comprehensive documentation
- [x] Configure VS Code development environment
- [x] Define JSON schemas

#### 1.2 ROM Analysis 🔄
- [ ] Verify ROM header (iNES format)
- [ ] Map PRG bank contents
- [ ] Map CHR bank contents  
- [ ] Document interrupt vectors
- [ ] Identify bank switching routines
- [ ] Create Mesen debug labels

#### 1.3 Basic Tools
- [ ] Implement rom_analyzer.py
- [ ] Create basic CHR ripper
- [ ] Create TBL encoder/decoder
- [ ] Implement hex pattern search

### Deliverables
- Verified ROM structure documentation
- Working ROM analyzer
- Initial bank map
- Mesen debugging setup

---

## Phase 2: Asset Extraction (Weeks 5-10)

### Goals
- Extract all game assets to editable formats
- Create binary → editable conversion pipeline
- Document all data formats

### Milestones

#### 2.1 Text Extraction
- [ ] Find text pointer tables
- [ ] Implement text decompression
- [ ] Extract all dialog
- [ ] Extract item/monster/spell names
- [ ] Create text.json

#### 2.2 Data Table Extraction
- [ ] Extract monster stats
- [ ] Extract item properties
- [ ] Extract spell data
- [ ] Extract character growth tables
- [ ] Extract shop inventories
- [ ] Extract encounter tables

#### 2.3 Graphics Extraction
- [ ] Extract all CHR banks
- [ ] Convert to indexed PNGs
- [ ] Extract palette data
- [ ] Document sprite layouts
- [ ] Create tileset images

#### 2.4 Map Extraction
- [ ] Decode map compression
- [ ] Extract overworld maps
- [ ] Extract town/dungeon maps
- [ ] Extract NPC data
- [ ] Extract warp/event data

### Deliverables
- assets/json/ with all data
- assets/graphics/ with all sprites/tiles
- assets/maps/ with all map data
- Complete format documentation

---

## Phase 3: Disassembly (Weeks 8-16)

### Goals
- Create complete 6502 assembly source
- Label all code and data
- Achieve byte-perfect reassembly

### Milestones

#### 3.1 Fixed Bank (Bank 15)
- [ ] Disassemble reset routine
- [ ] Disassemble NMI handler
- [ ] Disassemble IRQ handler
- [ ] Document core routines
- [ ] Label all subroutines

#### 3.2 Engine Banks (Banks 0-3)
- [ ] Disassemble main loop
- [ ] Disassemble battle engine
- [ ] Disassemble menu system
- [ ] Disassemble field engine

#### 3.3 Chapter Banks (Banks 4-7)
- [ ] Disassemble chapter 1 code
- [ ] Disassemble chapter 2 code
- [ ] Disassemble chapter 3 code
- [ ] Disassemble chapters 4-5 code

#### 3.4 Data Banks (Banks 8-14)
- [ ] Label data tables
- [ ] Create data include files
- [ ] Link to extracted assets

### Deliverables
- Complete source_files/ directory
- Fully labeled assembly
- Build system producing byte-identical ROM

---

## Phase 4: Universal Editor (Weeks 12-20)

### Goals
- Create GUI editor for all assets
- Enable visual editing and preview
- Integrate with build system

### Milestones

#### 4.1 Core Framework
- [ ] Create main window with tabs
- [ ] Implement project load/save
- [ ] Add undo/redo system
- [ ] Create build integration

#### 4.2 Data Editors
- [ ] Monster editor
- [ ] Item editor
- [ ] Spell editor
- [ ] Character editor
- [ ] Shop editor

#### 4.3 Graphics Editors
- [ ] CHR tile viewer
- [ ] Sprite editor
- [ ] Palette editor
- [ ] Animation preview

#### 4.4 Map Editor
- [ ] Tile map viewer
- [ ] NPC placement
- [ ] Event editor
- [ ] Warp editor

#### 4.5 Text Editor
- [ ] Dialog browser
- [ ] Text preview with encoding
- [ ] Search and replace

### Deliverables
- Fully functional universal_editor.py
- User documentation
- Example projects

---

## Phase 5: Build Pipeline (Weeks 16-22)

### Goals
- Implement complete build system
- Support modified asset reinsertion
- Enable automated testing

### Milestones

#### 5.1 Asset Conversion
- [ ] JSON → ASM converter
- [ ] PNG → CHR converter
- [ ] Map → binary converter
- [ ] Text → binary with compression

#### 5.2 Build System
- [ ] PowerShell build script
- [ ] Bank assembly
- [ ] ROM header generation
- [ ] CHR ROM concatenation

#### 5.3 Verification
- [ ] ROM comparison tool
- [ ] Checksum verification
- [ ] Automated testing

#### 5.4 CI/CD
- [ ] GitHub Actions workflow
- [ ] Automated builds
- [ ] Release generation

### Deliverables
- Working build.ps1
- GitHub Actions pipeline
- IPS/BPS patch generation

---

## Phase 6: Polish & Documentation (Weeks 20-24)

### Goals
- Complete all documentation
- Create tutorials
- Prepare for public release

### Milestones

#### 6.1 Technical Documentation
- [ ] Complete ROM map
- [ ] Complete RAM map
- [ ] All data format specs
- [ ] Algorithm documentation

#### 6.2 User Documentation
- [ ] Getting started guide
- [ ] Editor tutorials
- [ ] Modding guide
- [ ] Troubleshooting guide

#### 6.3 Quality Assurance
- [ ] Full playthrough test
- [ ] Editor testing
- [ ] Build system testing
- [ ] Cross-platform testing

### Deliverables
- Complete docs/ directory
- Video tutorials (optional)
- Release v1.0

---

## Phase 7: SNES Port Preparation (Future)

### Goals
- Prepare assets for SNES conversion
- Document NES → SNES requirements
- Create conversion specifications

### Milestones

#### 7.1 Format Analysis
- [ ] Compare NES and SNES formats
- [ ] Design intermediate format
- [ ] Create conversion specs

#### 7.2 Conversion Tools
- [ ] 2bpp → 4bpp graphics
- [ ] Audio format conversion
- [ ] Data structure mapping

#### 7.3 DQ3 SNES Analysis
- [ ] Analyze DQ3 SNES ROM
- [ ] Map insertion points
- [ ] Design integration approach

### Deliverables
- NES → SNES conversion guide
- Conversion tools
- Integration plan

---

## Success Metrics

### Phase 1 Success
- [ ] All documentation in place
- [ ] ROM analyzer working
- [ ] Team familiar with codebase

### Phase 2 Success
- [ ] All assets extracted
- [ ] Roundtrip conversion verified
- [ ] No data loss

### Phase 3 Success
- [ ] Source assembles to identical ROM
- [ ] All code labeled
- [ ] No unknown data regions

### Phase 4 Success
- [ ] All editors functional
- [ ] Edits persist correctly
- [ ] User-friendly interface

### Phase 5 Success
- [ ] Build produces valid ROM
- [ ] CI/CD pipeline working
- [ ] Patches generatable

### Phase 6 Success
- [ ] Documentation complete
- [ ] No critical bugs
- [ ] Release ready

---

## Risk Management

### Technical Risks

| Risk | Mitigation |
|------|------------|
| Unknown compression | Research other NES games, Enix engine analysis |
| Complex AI routines | Focus on data first, code later |
| Editor complexity | Start simple, iterate |
| Build system issues | Reference DW1 project |

### Resource Risks

| Risk | Mitigation |
|------|------------|
| Time constraints | Prioritize core features |
| Knowledge gaps | Document as we learn |
| Tool limitations | Develop custom tools |

---

## Version History

| Version | Date | Description |
|---------|------|-------------|
| 0.1 | 2025-12-01 | Initial roadmap creation |

---

## See Also

- [PROJECT_PLAN.md](PROJECT_PLAN.md) - Detailed project plan
- [GitHub Issues](../../issues) - Issue tracker
- [GitHub Project Board](../../projects) - Kanban board
