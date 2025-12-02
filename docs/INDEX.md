# Dragon Warrior IV Documentation Index

Welcome to the comprehensive documentation for the Dragon Warrior IV NES Disassembly Project.

## 📚 Documentation Overview

This documentation covers everything needed to understand, disassemble, and work with Dragon Warrior IV for NES.

## 📖 Reading Order

For newcomers, we recommend reading the documentation in this order:

### 1. Foundation (Start Here)
| Document | Description | Prerequisite Knowledge |
|----------|-------------|------------------------|
| [NES Architecture](NES_ARCHITECTURE.md) | NES hardware fundamentals | None |
| [ROM Structure](ROM_STRUCTURE.md) | How DW4 ROM is organized | Basic NES knowledge |

### 2. Asset Understanding
| Document | Description | Prerequisite Knowledge |
|----------|-------------|------------------------|
| [Data Tables](DATA_TABLES.md) | Monster, item, spell, character data | ROM structure |
| [Text Encoding](TEXT_ENCODING.md) | How text is stored and encoded | ROM structure |
| [Graphics Format](GRAPHICS_FORMAT.md) | CHR data and sprite composition | NES PPU basics |
| [Audio Format](AUDIO_FORMAT.md) | Music and sound effect data | NES APU basics |
| [Map Format](MAP_FORMAT.md) | Map structure and compression | ROM structure |

### 3. Development
| Document | Description | Prerequisite Knowledge |
|----------|-------------|------------------------|
| [Asset Pipeline](ASSET_PIPELINE.md) | Extraction and reinsertion workflow | All above |
| [Quick Reference](QUICK_REFERENCE.md) | Common addresses and commands | All above |
| [Roadmap](ROADMAP.md) | Project timeline and milestones | None |

## 📂 Document Descriptions

### Core Documentation

#### [NES_ARCHITECTURE.md](NES_ARCHITECTURE.md)
Complete NES hardware reference covering:
- CPU (Ricoh 2A03/6502)
- PPU (Picture Processing Unit)
- APU (Audio Processing Unit)
- Memory mapping
- Addressing modes
- MMC3 mapper details

#### [ROM_STRUCTURE.md](ROM_STRUCTURE.md)
Dragon Warrior IV specific ROM organization:
- iNES header format
- PRG ROM bank layout (16 banks × 16KB)
- CHR ROM bank layout (16 banks × 8KB)
- Address calculation formulas
- Bank switching mechanics

#### [DATA_TABLES.md](DATA_TABLES.md)
Game data structure documentation:
- Monster records (14 bytes each)
- Item records (8 bytes each)
- Spell records (6 bytes each)
- Character records (30 bytes each)
- Stat growth tables

### Asset Documentation

#### [TEXT_ENCODING.md](TEXT_ENCODING.md)
Text system documentation:
- Custom TBL format
- Control codes and special characters
- String compression
- Pointer table format
- Dialogue system

#### [GRAPHICS_FORMAT.md](GRAPHICS_FORMAT.md)
Graphics system documentation:
- 2bpp CHR tile format
- Sprite composition
- Palette organization
- Tile arrangement
- Animation data

#### [AUDIO_FORMAT.md](AUDIO_FORMAT.md)
Audio system documentation:
- NES APU channels
- Music engine structure
- Note/instrument format
- SFX data organization

#### [MAP_FORMAT.md](MAP_FORMAT.md)
Map system documentation:
- Map header structure
- Tile data format
- RLE compression
- Event triggers
- NPC placement

### Development Documentation

#### [ASSET_PIPELINE.md](ASSET_PIPELINE.md)
Workflow documentation:
- 5-stage pipeline overview
- Tool descriptions
- File format specifications
- Build process

#### [QUICK_REFERENCE.md](QUICK_REFERENCE.md)
Quick lookup tables:
- Common memory addresses
- Data structure offsets
- Tool commands
- Build commands

#### [ROADMAP.md](ROADMAP.md)
Project planning:
- Milestone definitions
- Timeline estimates
- Deliverables per phase

## 🔗 External Resources

### GameInfo Wiki Files
Located in `../GameInfo/Dragon Warrior 4 (NES)/Wiki/`:
- RAM Map (runtime memory documentation)
- SRAM Map (save data format)
- TBL (text table)
- Values (game constants)
- Map List
- Debug Labels (Mesen MLB format)

### Online Resources
- [NESdev Wiki](https://www.nesdev.org/wiki/) - NES development reference
- [Data Crystal](https://datacrystal.romhacking.net/) - ROM hacking wiki
- [RHDN](https://www.romhacking.net/) - ROM hacking community

## 🏷️ Document Categories

### By Topic
| Topic | Documents |
|-------|-----------|
| **Hardware** | NES Architecture |
| **ROM** | ROM Structure, Asset Pipeline |
| **Data** | Data Tables, Text Encoding |
| **Graphics** | Graphics Format |
| **Audio** | Audio Format |
| **Maps** | Map Format |
| **Tools** | Asset Pipeline, Quick Reference |
| **Planning** | Roadmap |

### By Skill Level
| Level | Documents |
|-------|-----------|
| **Beginner** | NES Architecture, Roadmap |
| **Intermediate** | ROM Structure, Data Tables, Text Encoding |
| **Advanced** | Graphics Format, Audio Format, Map Format, Asset Pipeline |

## 📊 JSON Schemas

Located in `assets/schemas/`:
- `monsters.schema.json` - Monster data validation
- `items.schema.json` - Item data validation  
- `spells.schema.json` - Spell data validation
- `characters.schema.json` - Character data validation

These schemas define the JSON format for extracted game data and enable validation in editors.

## 🔄 Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0.0 | 2025-12-01 | Initial documentation suite |

## 📝 Contributing

When adding new documentation:
1. Follow the existing format and style
2. Update this index file
3. Add cross-references to related documents
4. Include practical examples where possible

---

*Last updated: 2025-12-01*
