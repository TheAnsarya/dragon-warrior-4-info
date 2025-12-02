# Data Tables Reference - Dragon Warrior IV

## Overview

This document details the structure and format of all data tables in Dragon Warrior IV, essential for asset extraction and modification.

---

## Monster Data Tables

### Monster Stats Structure (per monster)

Each monster entry is approximately 16-24 bytes:

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| $00 | 2 | HP | Hit points (0-999) |
| $02 | 1 | MP | Magic points (0-255) |
| $03 | 1 | Attack | Attack power |
| $04 | 1 | Defense | Defense power |
| $05 | 1 | Agility | Speed stat |
| $06 | 2 | EXP | Experience reward |
| $08 | 2 | Gold | Gold reward |
| $0A | 1 | Drop Item | Item ID (0 = no drop) |
| $0B | 1 | Drop Rate | Drop probability (X/256) |
| $0C | 1 | AI Script | Behavior pattern ID |
| $0D | 1 | Sprite ID | Graphics index |
| $0E | 1 | Element | Elemental affinity flags |
| $0F | 1 | Status Resist | Status immunity flags |

### Monster Count

DW4 has approximately 200+ monsters including:
- Chapter-specific enemies
- Boss monsters
- Arena monsters
- Rare encounters

### Monster Element Flags

```
Bit 0: Fire resistance
Bit 1: Ice resistance
Bit 2: Lightning resistance
Bit 3: Wind resistance
Bit 4: Heal reversal (undead)
Bit 5: Magic resist
Bit 6: Physical resist
Bit 7: Status immune
```

### Monster AI Scripts

AI behavior patterns:
- 0x00: Basic attack only
- 0x01-0x0F: Spell patterns
- 0x10-0x1F: Skill patterns
- 0x20+: Complex conditional behavior

---

## Item Data Tables

### Equipment Stats Structure

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| $00 | 1 | Type | 0=Weapon, 1=Armor, 2=Shield, 3=Helmet, 4=Accessory |
| $01 | 1 | Attack | Attack bonus (weapons) |
| $02 | 1 | Defense | Defense bonus |
| $03 | 2 | Price | Purchase price |
| $05 | 1 | Equip Flags | Who can equip (bitmask) |
| $06 | 1 | Effect | Special effect ID |
| $07 | 1 | Element | Elemental affinity |

### Equipment Flags (Who Can Equip)

```
Bit 0: Hero
Bit 1: Ragnar
Bit 2: Alena
Bit 3: Brey (Cristo in JP)
Bit 4: Cristo (Brey in JP)
Bit 5: Taloon
Bit 6: Nara
Bit 7: Mara
```

### Item Types (from RAM map)

| Range | Type |
|-------|------|
| $00-$50 | Equipment |
| $52-$7E | Consumable items |

### Consumable Item Structure

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| $00 | 1 | Effect Type | What the item does |
| $01 | 1 | Power | Effect magnitude |
| $02 | 2 | Price | Shop price |
| $04 | 1 | Target | Who can use it |
| $05 | 1 | Flags | Battle/field usable |

### Equipment Effect IDs

| ID | Effect |
|----|--------|
| $00 | None |
| $01 | Casts Heal when used |
| $02 | Casts Blaze when used |
| $03-$0F | Various spell effects |
| $10 | +5 Attack in caves |
| $11 | +10 Defense vs dragons |
| ... | ... |
| $80+ | Cursed effects |

---

## Spell Data Tables

### Spell Structure

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| $00 | 1 | MP Cost | Magic points required |
| $01 | 1 | Effect Type | Damage/Heal/Status/Buff |
| $02 | 1 | Power | Base damage/heal amount |
| $03 | 1 | Target Type | Single/Group/All |
| $04 | 1 | Element | Fire/Ice/Lightning/etc |
| $05 | 1 | Flags | Field/Battle usable |

### Spell Target Types

| Value | Target |
|-------|--------|
| $00 | Single enemy |
| $01 | Enemy group |
| $02 | All enemies |
| $03 | Self |
| $04 | Single ally |
| $05 | All allies |
| $06 | Field only |

### Spell Effect Types

| Value | Effect |
|-------|--------|
| $00-$0F | Damage spells |
| $10-$1F | Healing spells |
| $20-$2F | Buff spells |
| $30-$3F | Debuff spells |
| $40-$4F | Status spells |
| $50-$5F | Utility (Return, Outside) |

### Known Spells

| ID | Name | MP | Type |
|----|------|-----|------|
| $01 | Heal | 3 | Heal single ally |
| $02 | Healmore | 5 | Heal single ally (strong) |
| $03 | Healall | 7 | Full heal single |
| $04 | Healus | 10 | Heal all allies |
| $05 | Healusall | 18 | Full heal all |
| $10 | Blaze | 2 | Fire damage single |
| $11 | Blazemore | 4 | Fire damage group |
| ... | ... | ... | ... |

---

## Character Data Tables

### Character Base Stats

Each character has base stats and growth tables:

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| $00 | 1 | Base STR | Starting strength |
| $01 | 1 | Base AGI | Starting agility |
| $02 | 1 | Base VIT | Starting vitality |
| $03 | 1 | Base INT | Starting intelligence |
| $04 | 1 | Base LUCK | Starting luck |
| $05-$09 | 5 | Growth multipliers | Per-level increase rates |

### Level-Up Stat Growth

For each character, level 1-99 stat growth table:

```
Per level entry:
  Byte 0: HP gain
  Byte 1: MP gain
  Byte 2: STR gain (partial)
  Byte 3: AGI gain (partial)
  Byte 4: Other stat gains
```

### Spell Learning Table

Per character, list of spells learned and levels:

```
Entry format:
  Byte 0: Level required
  Byte 1: Spell ID
  
Terminator: $FF $FF
```

### Character IDs

| ID | Name | Chapter |
|----|------|---------|
| 0 | Hero | 5 |
| 1 | Ragnar | 1 |
| 2 | Alena | 2 |
| 3 | Brey | 2 |
| 4 | Cristo | 2 |
| 5 | Taloon | 3 |
| 6 | Nara | 4 |
| 7 | Mara | 4 |

---

## Shop Data Tables

### Shop Structure

```
Shop Entry:
  Byte 0: Item count
  Bytes 1-N: Item IDs (one per slot)
  Terminator: $FF
```

### Shop Types

| Type | Description |
|------|-------------|
| 0 | Weapon shop |
| 1 | Armor shop |
| 2 | Item shop |
| 3 | Inn |
| 4 | Church (services) |

### Price Calculation

```
Buy Price = Base Price
Sell Price = Base Price / 2 (rounded down)
```

---

## Map Data Tables

### Overworld Map Structure

| Field | Size | Description |
|-------|------|-------------|
| Width | 1 byte | Map width in tiles |
| Height | 1 byte | Map height in tiles |
| Tileset ID | 1 byte | Which tileset to use |
| Tile Data | Variable | RLE or raw tile indices |

### Map Tile Properties

Each tileset has a property table:

| Property | Bit | Description |
|----------|-----|-------------|
| Walkable | 0 | Can walk on tile |
| Water | 1 | Requires ship |
| Damage | 2 | Damages party (poison/lava) |
| Encounter | 3 | Random encounters enabled |
| NPC Block | 4 | Blocks NPC movement |
| Event | 5 | Triggers event |
| Warp | 6 | Map transition |
| Save | 7 | Can save here |

### Warp/Exit Data

```
Warp Entry:
  Byte 0: Source map ID
  Byte 1: Source X
  Byte 2: Source Y
  Byte 3: Dest map ID
  Byte 4: Dest X
  Byte 5: Dest Y
  Byte 6: Flags (facing direction, etc)
```

### Map IDs (from Values.wikitext)

| ID | Name |
|----|------|
| $00 | Burland |
| $01 | Burland Interior |
| ... | ... |
| $48 | Final Dungeon |

See `GameInfo/Dragon Warrior 4 (NES)/Wiki/Values.wikitext` for complete list.

---

## Experience Tables

### EXP Required Per Level

| Level | Total EXP | To Next |
|-------|-----------|---------|
| 1 | 0 | varies |
| 2 | varies | varies |
| ... | ... | ... |
| 99 | varies | -- |

Each character has their own EXP curve.

---

## Encounter Tables

### Random Encounter Structure

```
Encounter Entry:
  Byte 0: Monster ID 1
  Byte 1: Count range (low nibble min, high nibble max)
  Byte 2: Monster ID 2 (or $FF for none)
  Byte 3: Count range 2
  ...
  Terminator: $FF
```

### Encounter Rate

```
Base rate: ~8 steps per encounter check
Modified by:
  - Terrain type
  - Holy water effect
  - Fairy water effect
  - Character level vs zone level
```

---

## Treasure Data

### Treasure Chest Structure

```
Chest Entry:
  Byte 0: Map ID
  Byte 1: X position
  Byte 2: Y position
  Byte 3: Contents type (item/gold/trap)
  Byte 4: Contents ID/amount
  Byte 5: Chest flag index
```

### Treasure Flag Mapping

Flags stored at $625D-$6277 (27 bytes = 216 bits):
- Each bit = one chest opened
- Bit 0 of $625D = first chest
- Organized by map order

---

## Event Scripts

### Event Structure

```
Event Header:
  Byte 0: Event type
  Byte 1-2: Condition flags
  Byte 3-4: Script pointer

Event Types:
  $00: NPC dialog
  $01: Treasure
  $02: Door
  $03: Warp
  $04: Boss battle
  $05: Cutscene
  ...
```

---

## Data Table Locations (Estimated)

| Table | Bank | Approx Offset | Size Est. |
|-------|------|---------------|-----------|
| Monster Stats | 08 | $20010 | 4KB |
| Monster Names | 08 | TBD | 2KB |
| Item Stats | 09 | $24010 | 2KB |
| Item Names | 09 | TBD | 2KB |
| Spell Data | 09 | TBD | 1KB |
| Spell Names | 09 | TBD | 512B |
| Character Base | Various | TBD | 512B |
| Character Growth | Various | TBD | 3KB |
| Shop Data | 09 | TBD | 1KB |
| Map Data | 10-11 | $28010 | 32KB |
| Warp Tables | 10 | TBD | 2KB |
| Encounter Tables | 08 | TBD | 4KB |
| Treasure Data | Various | TBD | 2KB |

---

## JSON Schema Examples

### monsters.schema.json
```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "type": "object",
  "properties": {
    "monsters": {
      "type": "array",
      "items": {
        "type": "object",
        "required": ["id", "name", "hp", "attack", "defense"],
        "properties": {
          "id": {"type": "integer", "minimum": 0, "maximum": 255},
          "name": {"type": "string", "maxLength": 12},
          "hp": {"type": "integer", "minimum": 0, "maximum": 999},
          "mp": {"type": "integer", "minimum": 0, "maximum": 255},
          "attack": {"type": "integer", "minimum": 0, "maximum": 255},
          "defense": {"type": "integer", "minimum": 0, "maximum": 255},
          "agility": {"type": "integer", "minimum": 0, "maximum": 255},
          "exp": {"type": "integer", "minimum": 0, "maximum": 65535},
          "gold": {"type": "integer", "minimum": 0, "maximum": 65535}
        }
      }
    }
  }
}
```

---

## See Also

- [ROM_STRUCTURE.md](ROM_STRUCTURE.md) - Bank layout
- [ASSET_PIPELINE.md](ASSET_PIPELINE.md) - Extraction process
- [GameInfo/Dragon Warrior 4 (NES)/Wiki/Values.wikitext](../../GameInfo/) - Value enums
- [GameInfo/Dragon Warrior 4 (NES)/Wiki/RAM Map.wikitext](../../GameInfo/) - RAM structure
