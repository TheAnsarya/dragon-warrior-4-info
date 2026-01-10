# Map and Tilemap Format Reference - Dragon Warrior IV

## Overview

This document details the map system used in Dragon Warrior IV (NES), including overworld maps, dungeon layouts, tile properties, and event scripting.

---

## Map System Overview

### Map Types

| Type | Description | Count |
|------|-------------|-------|
| Overworld | Large scrolling world maps | 5 (per chapter) |
| Town | Town/village interiors | ~30 |
| Dungeon | Cave/tower layouts | ~25 |
| Building | Shop/inn/church interiors | ~40 |
| Special | Cutscene/event maps | ~10 |

### Map IDs

From the Values.wikitext documentation:

| ID | Name | Type |
|----|------|------|
| $00 | Burland | Town |
| $01 | Burland Interior | Building |
| $02 | Izmit | Town |
| ... | ... | ... |
| $48 | Final Dungeon | Dungeon |

Total: 73+ primary map IDs with submaps

---

## Overworld Map Structure

### World Map Dimensions

```
Typical overworld: 128×128 tiles
Each tile = 16×16 pixels (metatile)
Total size: 2048×2048 pixels

May use wraparound (east-west connection)
```

### Map Data Format

```
Map Header:
  Byte 0-1: Width (in tiles)
  Byte 2-3: Height (in tiles)
  Byte 4: Tileset ID
  Byte 5: Palette ID
  Byte 6: Music ID
  Byte 7: Encounter table ID
  Byte 8-9: Event pointer
  Byte 10+: Tile data (compressed or raw)
```

### Compression Format

DW4 likely uses RLE or similar for map data:

```
RLE Format (estimated):
  Control byte:
    $00-$7F: Literal tile index
    $80-$FE: Repeat next tile (byte - $7F) times
    $FF: End of data or escape

Example:
  Input:  A A A A B C C
  RLE:    84 A B 82 C
  (84 = repeat 5 times, 82 = repeat 3 times)
```

### Alternative: Tile Row Format

```
Per-row storage:
  Byte 0-1: Row data offset
  Row data: RLE-compressed tile indices
```

---

## Metatile System

### Metatile Structure

Each 16×16 metatile = 4 hardware tiles (8×8 each):

```
┌────┬────┐
│ TL │ TR │  Bytes 0-3: Tile indices
├────┼────┤
│ BL │ BR │  Byte 4: Attribute (palette)
└────┴────┘  Byte 5: Properties (optional)
```

### Metatile Properties

```
Property byte bits:
  Bit 0: Walkable (0=blocked, 1=passable)
  Bit 1: Water (requires ship)
  Bit 2: Damage tile (poison, lava)
  Bit 3: Counter (can talk across)
  Bit 4: Stair down
  Bit 5: Stair up
  Bit 6: Warp point
  Bit 7: Save point
```

### Tileset Organization

Each tileset contains:
- 128-256 metatile definitions
- Tile graphics pointer (CHR bank)
- Palette set
- Property table

```
Tileset Entry:
  Bytes 0-1: Metatile data pointer
  Bytes 2-3: Properties pointer
  Byte 4: CHR bank for tiles
  Byte 5: Number of metatiles
```

---

## Indoor Map Structure

### Building/Dungeon Maps

```
Indoor Map Header:
  Byte 0: Width (tiles, usually 16-64)
  Byte 1: Height (tiles)
  Byte 2: Tileset ID
  Bytes 3-4: NPC data pointer
  Bytes 5-6: Event pointer
  Bytes 7-8: Warp data pointer
  Byte 9+: Tile data
```

### Small Maps (Single Screen)

```
Dimensions: Typically 16×15 tiles
Fits single NES screen (256×240 pixels)
No scrolling required
```

### Multi-Screen Maps

```
Larger maps use scrolling:
  - Horizontal scroll (left/right)
  - Vertical scroll (up/down)
  - Combined scrolling
  
Map boundary behavior:
  - Blocked edges
  - Wraparound
  - Warp to adjacent map
```

---

## NPC and Event System

### NPC Data Format

```
NPC Entry:
  Byte 0: NPC ID
  Byte 1: X position (tile)
  Byte 2: Y position (tile)
  Byte 3: Movement pattern
          0 = Stationary
          1 = Wander (1 tile radius)
          2 = Wander (2 tile radius)
          3 = Patrol horizontal
          4 = Patrol vertical
          5 = Follow player
          6+ = Custom paths
  Byte 4: Facing direction (0-3 = D/U/L/R)
  Byte 5: Sprite ID
  Bytes 6-7: Dialog/event pointer
```

### NPC List Structure

```
Map NPC Table:
  Byte 0: NPC count
  Bytes 1+: NPC entries (8 bytes each)
  Terminator: $FF
```

### Event Trigger Types

```
Trigger byte:
  Bit 0-1: Trigger type
           0 = Talk (facing NPC)
           1 = Touch (step on tile)
           2 = Examine (A button on tile)
           3 = Automatic
  Bit 2-3: Activation flags
  Bit 4-7: Event ID high bits
```

---

## Warp/Transition System

### Warp Entry Format

```
Warp Entry:
  Byte 0: Source X
  Byte 1: Source Y
  Byte 2: Source map ID
  Byte 3: Destination map ID
  Byte 4: Destination X
  Byte 5: Destination Y
  Byte 6: Destination submap (if applicable)
  Byte 7: Flags
          Bit 0: Fade type (0=instant, 1=fade)
          Bit 1: Change music
          Bit 2: Change palette
          Bit 3-7: Reserved
```

### Door/Stair Transitions

```
Standard transitions:
  - Building entrances
  - Stair connections
  - Cave entrances
  - Tower floor changes

Special transitions:
  - Travel gates
  - Chapter transitions
  - Cutscene warps
```

---

## Encounter System

### Encounter Zone Format

```
Encounter Zone:
  Byte 0: Zone X start (tile / 4)
  Byte 1: Zone Y start
  Byte 2: Zone width
  Byte 3: Zone height
  Byte 4: Encounter table ID
  Byte 5: Encounter rate (1-255)
```

### Encounter Table Format

```
Encounter Table Entry:
  Byte 0: Monster group ID
  Byte 1: Weight (probability)
  ...
  Terminator: $FF

Monster Group:
  Byte 0: Monster ID 1
  Byte 1: Count (1-4)
  Byte 2: Monster ID 2 (or $FF)
  Byte 3: Count 2
  ...
```

---

## Treasure Chest System

### Chest Entry Format

```
Chest Entry:
  Byte 0: X position
  Byte 1: Y position
  Byte 2: Contents type
          0 = Gold
          1 = Item
          2 = Equipment
          3 = Empty (message only)
          4 = Trap (mimic, etc.)
  Byte 3: Contents ID or amount
  Byte 4: Chest flag index (bit position)
```

### Chest Flag Storage

From RAM map ($625D-$6277):
- 27 bytes = 216 bits
- Each bit = one chest opened
- Persists in save file

---

## Map Data Extraction

### Finding Map Data

1. Find map loading routine
2. Trace pointer table location
3. Document compression format
4. Extract and decompress each map

### Extraction Script

```python
def extract_maps(rom_data: bytes, map_table_offset: int, 
                 map_count: int) -> list:
    """Extract all map data."""
    maps = []
    
    for map_id in range(map_count):
        ptr_offset = map_table_offset + (map_id * 2)
        ptr = rom_data[ptr_offset] | (rom_data[ptr_offset + 1] << 8)
        
        # Convert to file offset
        file_offset = ptr_to_file_offset(ptr)
        
        # Read header and data
        header = read_map_header(rom_data, file_offset)
        tile_data = decompress_map(rom_data, 
                                    file_offset + header['header_size'],
                                    header['width'] * header['height'])
        
        maps.append({
            'id': map_id,
            'name': get_map_name(map_id),
            'width': header['width'],
            'height': header['height'],
            'tileset': header['tileset'],
            'tiles': tile_data,
            'npcs': extract_npcs(rom_data, header['npc_ptr']),
            'warps': extract_warps(rom_data, header['warp_ptr'])
        })
    
    return maps
```

---

## JSON Export Format

### Map Data

```json
{
	"id": 0,
	"name": "Burland",
  "type": "town",
  "width": 32,
  "height": 32,
  "tileset": 2,
  "music": 10,
  "palette": 1,
  "tiles": [
    [0, 1, 1, 1, 2, "..."],
    ["..."]
  ],
  "npcs": [
    {
      "id": 0,
      "name": "Soldier",
      "x": 10,
      "y": 8,
      "sprite": 5,
      "movement": "stationary",
      "facing": "down",
      "dialog": "Welcome to Burland Castle!"
    }
  ],
  "warps": [
    {
      "from": {"x": 15, "y": 31},
      "to": {"map": 1, "x": 8, "y": 1},
      "type": "door"
    }
  ],
  "chests": [
    {
      "x": 20,
      "y": 5,
      "contents": {"type": "item", "id": 12},
      "flag": 45
    }
  ]
}
```

### Tileset Data

```json
{
  "id": 2,
  "name": "Town Tileset",
  "chr_bank": 4,
  "metatiles": [
    {
      "id": 0,
      "tiles": [0, 1, 16, 17],
      "palette": 0,
      "walkable": true,
      "properties": []
    },
    {
      "id": 1,
      "tiles": [2, 3, 18, 19],
      "palette": 1,
      "walkable": false,
      "properties": ["water"]
    }
  ]
}
```

---

## TMX Export (Tiled Format)

For compatibility with Tiled map editor:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<map version="1.10" tiledversion="1.10.0" 
     orientation="orthogonal" 
     renderorder="right-down"
     width="32" height="32" 
     tilewidth="16" tileheight="16">
     
    <tileset firstgid="1" source="town_tileset.tsx"/>
    
    <layer id="1" name="Background" width="32" height="32">
        <data encoding="csv">
            1,2,2,2,3,...
        </data>
    </layer>
    
    <objectgroup id="2" name="NPCs">
        <object id="1" name="Soldier" type="npc" 
                x="160" y="128" width="16" height="16">
            <properties>
                <property name="sprite" type="int" value="5"/>
                <property name="dialog" value="Welcome!"/>
            </properties>
        </object>
    </objectgroup>
    
    <objectgroup id="3" name="Warps">
        <object id="2" type="warp" x="240" y="496" width="16" height="16">
            <properties>
                <property name="dest_map" type="int" value="1"/>
                <property name="dest_x" type="int" value="8"/>
                <property name="dest_y" type="int" value="1"/>
            </properties>
        </object>
    </objectgroup>
</map>
```

---

## Special Map Features

### Day/Night Cycle

DW4 has day/night affecting:
- NPC positions/dialog
- Shop availability
- Encounter rates
- Palette changes

```
Time of day stored in RAM
Palettes swap for night versions
Some NPCs only appear at certain times
```

### Chapter-Specific Maps

Same map ID may have different:
- NPCs per chapter
- Events per chapter
- Access restrictions

```
Chapter-based loading:
  Load base map
  Apply chapter overlay (NPCs, events)
```

### Wagon System

Party wagon appears on overworld:
- Follows party
- Contains extra party members
- Certain terrain only

---

## See Also

- [DATA_TABLES.md](DATA_TABLES.md) - Event data structures
- [GRAPHICS_FORMAT.md](GRAPHICS_FORMAT.md) - Tileset graphics
- [ROM_STRUCTURE.md](ROM_STRUCTURE.md) - Bank locations
- [GameInfo/Dragon Warrior 4 (NES)/Wiki/Map List.wikitext](../../GameInfo/)
