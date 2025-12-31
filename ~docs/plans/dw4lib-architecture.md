# DW4Lib Tool Architecture - Phase 2 Planning

## Overview

DW4Lib is a C# .NET 9.0 library in the logsmall repository for Dragon Warrior IV (NES) ROM analysis, data extraction, and conversion to DQ3 Remake (SNES) format.

## Current Status (2025-01-01)

### Completed Components

| Component | Purpose | Status |
|-----------|---------|--------|
| `DataStructures/Monster.cs` | 16-byte NES monster format | ✅ Complete |
| `DataStructures/Item.cs` | 8-byte NES item format | ✅ Complete |
| `DataStructures/Spell.cs` | 6-byte NES spell format | ✅ Complete |
| `DataStructures/Character.cs` | 32-byte party member format | ✅ Complete |
| `ROM/DW4Rom.cs` | ROM reader with MMC3 mapping | ✅ Complete |
| `Text/DW4Text.cs` | Text encoding/decoding + DTE | ✅ Complete |
| `Converters/MonsterConverter.cs` | JSON export/import | ✅ Complete |
| `Converters/ItemConverter.cs` | JSON export/import | ✅ Complete |
| `Converters/SpellConverter.cs` | JSON export/import | ✅ Complete |
| `Converters/TextConverter.cs` | Text block extraction | ✅ Complete |
| `DQ3r/DQ3rMonster.cs` | SNES target monster format | ✅ Complete |
| `DQ3r/MonsterToDQ3r.cs` | DW4→DQ3r conversion | ✅ Complete |
| `DQ3r/DQ3rItem.cs` | SNES target item format | ✅ Complete |
| `DQ3r/ItemToDQ3r.cs` | DW4→DQ3r conversion | ✅ Complete |

### Pending Components

| Component | Purpose | Priority |
|-----------|---------|----------|
| `DQ3r/DQ3rSpell.cs` | SNES target spell format | High |
| `DQ3r/SpellToDQ3r.cs` | Spell conversion | High |
| `Converters/CharacterConverter.cs` | Save data JSON | Medium |
| `Maps/MapTile.cs` | Map tile data | Medium |
| `Maps/MapConverter.cs` | Map data extraction | Medium |
| `Graphics/SpriteExtractor.cs` | Sprite extraction | Low |
| `Audio/MusicExtractor.cs` | Music data extraction | Low |

## Architecture Design

### Layer 1: ROM Access (ROM/)
- `DW4Rom.cs` - ROM reading with MMC3 bank mapping
- Address translation: CPU→File offset
- Bank switching simulation

### Layer 2: Data Structures (DataStructures/)
- Native NES formats as C# classes
- `FromBytes()` / `ToBytes()` serialization
- Property accessors with bit manipulation

### Layer 3: Converters (Converters/)
- JSON serialization for human-readable output
- Round-trip support (import/export)
- Text extraction and decoding

### Layer 4: Target Formats (DQ3r/)
- DQ3 Remake (SNES) data structures
- Conversion logic with stat scaling
- Mapping tables for IDs

### Layer 5: Tools (CLI/GUI - Future)
- Command-line extractor
- Blazor WebAssembly editor
- Batch processing

## Key Technical Decisions

### Stat Scaling (NES 8-bit → SNES 16-bit)
```
HP:         4.0x multiplier (255 → ~1000)
Attack:     2.5x multiplier
Defense:    2.5x multiplier
Agility:    2.0x multiplier
Experience: 3.0x multiplier
Gold:       2.0x multiplier
```

### Text Encoding
- DW4 uses custom character set ($80-$B3 = A-Z, a-z, 0-9)
- DTE compression for common pairs ($E0-$FF)
- Control codes for dialog flow ($10 = END, $11 = LINE)

### Bank Mapping (MMC3)
- 64 x 8KB PRG banks
- $8000-$9FFF: Switchable
- $C000-$DFFF: Switchable or fixed to last bank

## Data Extraction Plan

### Phase 2A: Core Data (Current)
1. ✅ Monsters (Bank $06, 159 entries)
2. ✅ Items (Bank $07, 128 entries)
3. ✅ Spells (Bank $07, 64 entries)
4. 🔄 Names (Banks $24-$25, pointer tables)

### Phase 2B: Extended Data
5. Experience tables (Bank $27)
6. Level-up stat gains
7. Shop inventories
8. Encounter tables

### Phase 2C: Maps and Graphics
9. Map tilesets
10. Map layouts
11. Sprite graphics
12. Battle backgrounds

## JSON Output Format

### monsters.json
```json
{
  "metadata": {
    "game": "Dragon Warrior IV",
    "platform": "NES",
    "version": "1.0",
    "extractedAt": "2025-01-01T00:00:00Z"
  },
  "monsters": [
    {
      "id": 0,
      "name": "Slime",
      "hp": 8,
      "attack": 12,
      "defense": 6,
      "agility": 3,
      "experience": 1,
      "gold": 2,
      "itemDrop": 0,
      "dropRate": 0,
      "spell1": 0,
      "spell2": 0,
      "aiPattern": 0,
      "resistances": {
        "fire": false,
        "ice": false,
        "lightning": false,
        "wind": false,
        "sleep": false,
        "stopspell": false,
        "surround": false,
        "death": false
      },
      "spriteId": 0
    }
  ]
}
```

## Next Steps

1. **Create DQ3r spell converter** - Complete the spell format conversion
2. **Add unit tests** - Validate extraction accuracy
3. **Build CLI tool** - Command-line extraction utility
4. **Extract actual data** - Run against DW4 ROM
5. **Document differences** - Note DW4 vs DQ3r variations

## Related Files

- [DW4Lib/DW4Lib.csproj](../../../logsmall/DW4Lib/DW4Lib.csproj)
- [dragon-warrior-4-info/docs/](../../../dragon-warrior-4-info/docs/)
- [DW4 Comparison Docs](../session-logs/)
