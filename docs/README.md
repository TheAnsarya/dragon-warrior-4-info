# Dragon Warrior IV Documentation

Comprehensive documentation for the Dragon Warrior IV (NES) disassembly and analysis project.

## Documentation Index

### 📁 Architecture
Technical documentation about the NES platform and game structure.

- [NES Architecture](architecture/NES_ARCHITECTURE.md) - Overview of NES hardware and capabilities
- [ROM Structure](architecture/ROM_STRUCTURE.md) - DW4 ROM layout and bank organization
- [RAM Reference](architecture/RAM_REFERENCE.md) - Memory map and variable documentation

### 📁 Data Formats
Documentation of game data formats for extraction and modification.

- [Audio Format](formats/AUDIO_FORMAT.md) - Music and sound effect data format
- [Data Tables](formats/DATA_TABLES.md) - Item, monster, and spell tables
- [Graphics Format](formats/GRAPHICS_FORMAT.md) - CHR/tile data and sprite format
- [Map Format](formats/MAP_FORMAT.md) - Map data compression and structure
- [Text Encoding](formats/TEXT_ENCODING.md) - Text table and dialog encoding

### 📁 Pipeline
Build system and CI/CD documentation.

- [Asset Pipeline](pipeline/ASSET_PIPELINE.md) - Asset extraction and reinsertion workflow
- [CI Workflows](pipeline/ci-workflows/README.md) - GitHub Actions and automation

### 📁 Project
Project planning and roadmap.

- [Project Plan](project/PROJECT_PLAN.md) - Overall project goals and approach
- [Roadmap](project/ROADMAP.md) - Development milestones and timeline

### 📁 Reference
Quick reference and guides.

- [Index](reference/INDEX.md) - Comprehensive topic index
- [Quick Reference](reference/QUICK_REFERENCE.md) - Common values and quick lookups
- [SNES Conversion](reference/SNES_CONVERSION.md) - Notes on SNES port differences

## Quick Links

| Resource | Description |
|----------|-------------|
| [data/dw4.tbl](../data/dw4.tbl) | Text encoding table |
| [data/game_data.json](../data/game_data.json) | Complete game data |
| [data/maps.json](../data/maps.json) | Map addresses and submaps |
| [tools/](../tools/) | Python extraction tools |
| [debug/Dragon Warrior IV.mlb](../debug/Dragon%20Warrior%20IV.mlb) | Mesen debug labels |

## Contributing

When adding documentation:
1. Place files in the appropriate subfolder
2. Use descriptive filenames with underscores (e.g., `DATA_TABLES.md`)
3. Update this index with links to new files
4. Use lowercase hexadecimal values (`$9d` not `$9D`)
5. Use tabs for indentation
