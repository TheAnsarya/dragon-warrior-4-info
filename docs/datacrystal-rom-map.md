# Dragon Warrior IV (NES) - Data Crystal ROM Map Integration

Source: https://datacrystal.tcrf.net/wiki/Dragon_Warrior_IV_(NES)/ROM_map

## Bank $08 (File offset $20000)

### Tilesets

| Address | Description |
|---------|-------------|
| $8229 | Table with three possible base addresses for graphics tile data |
| $8ADB-$979A | Tileset Data (51 tilesets, 64 bytes each) |
| $A1BB | Table of Tile Increment Patterns |
| $A28D | Table used with Tile Increment Pattern $0F |
| $A80D | Table of tiles (3 bytes per entry) |
| $AEB7 | Table used with Tile Increment Pattern $0E |

### Tileset Format

Each tileset is 64 bytes (32 tile entries × 2 bytes):
- Byte 0: `yyyAAXXX`
  - `yyy` = Smoothing flags for front-facing tiles
  - `AA` = Attribute data (color palette)
  - `XXX` = High bits of tile number
- Byte 1: `xxxxxxxx` = Low 8 bits of tile number

### Tile Data Format (at $A80D)

3 bytes per entry:
- Byte 0: Low byte of physical tile number
- Byte 1: `AAAABBCC`
  - `AAAA` = Tile Increment Pattern
  - `BB` = Graphics page
  - `CC` = High 2 bits of physical tile number
- Byte 2: Tile Behavior

### Tile Increment Patterns (at $A1BB)

14 patterns, 3 bytes each (signed displacement from previous tile):

```
00: 01 01 01
01: 00 00 00
02: 00 01 00
03: 01 00 FF
04: 01 FF 01
05: 01 01 00
06: 00 01 01
07: 00 02 FF
08: 01 01 01
09: 00 01 01
0A: 03 01 01
0B: 01 03 01
0C: FF 05 FF
0D: FF 03 FF
```

## Bank $09 (File offset $24000)

### Map Data

Maps $00-$2C (partial):
- $00 Keeleon: $8000, $8085, $812B, $81AE, $81C1
- $01 Santeem: $8206, $82DD, $8344
- $02 Burland: $8398, $850C, $85DE, $865D
- $03 Dire Palace: $869B, $87B5, $8834, $88CF
- $04 Endor: $88E7, $8A45, $8AAB, $8B7D, $8B96, $8BB5, $8C04, $8C77, $8DD6, $8DF4, $8E0F, $8E2C, $8E5A, $8E92, $8EC9
- $05 Bonmalmo: $8F28, $8F62
- ... (continues)

## Bank $0A (File offset $28000)

### Map Data

Maps $2D-$45:
- $2D Aktemto Mine: $803E, $82EF (+ 8 submaps on Bank $09)
- $2E Shrine of Breaking Waves: $830C, $847D
- ... (continues)
- $45 Necrosaro's Palace: (5 submaps here, 3 on Bank $0B)

## Bank $0B (File offset $2C000)

### Map Data

Maps $45-$48:
- $45 Necrosaro's Palace: $8075, $80C1, $8158
- $46 Zenethia: $81A8, $8313, $834D, $83B9
- $47 Shrine of the Horn: $84C1, $857A
- $48 Shrine of Colossus: $85A8, $8618, $875B, $8848, $8945, $89AF, $8A5B, $8B46, $8BDC, $8C49

### Overworld Map Data

| Address | Description |
|---------|-------------|
| $8CEE | Main Overworld Map Data |
| $A590 | Main Overworld Row Pointers |
| $A990 | Gottside Overworld Map Data |
| $AB65 | Gottside Overworld Row Pointers |
| $AC65 | Underworld Map Data |
| $AE89 | Underworld Row Pointers |

### Overworld Row Pointer Format

- Bytes 0-1: Pointer to map data
- Byte 2: Compressed data size to X=128
- Byte 3: Compressed data size to X=256

### Overworld Data Compression

- Bits 0-4 (`...xxxxx`): Length (add 1)
- Bits 5-7 (`xxx.....`): Tile
- Special: If byte >= $E8 (Tile 7 + length >= 8), subtract $E0 for tile number

## Bank $0C (File offset $30000)

### Graphics

- $8000: Map Tile Graphics (page 0)

## Bank $0D (File offset $34000)

### Graphics

- $8001: Map Tile Graphics (page 1)
- $9F14: Map Tile Graphics (page 2)
- $B304: Character Sprite Graphics
- $BE44-$BFD4: Empty space

## Bank $0E (File offset $38000)

### Code

- $8008-$8090: Code

### Graphics

- $8097-$BAD7: Character Sprite Graphics

### Map Palette Decision

- $BAF7-$BB52: Palette decision code
- $BB53-$BB66: Map override list (terminated by $80-$FF)
- $BB67-$BB74: Override values
- $BB75-$BB87: Submap numbers ($80-$FF = any)
- $BB88-$BC09: Palette number table
- $BC0A-$BCE1: Color set bytes (4 per palette)
- $BCE2-$BE12: Actual palette colors (3 per color set)

## Bank $17 (File offset $5C000)

### Map Pointers

- $B08D-$B11F: Pointer table for map information (73 maps)
- $B121-$B4AE: Map information data (3 bytes per submap)

### Map Information Format

- Byte 0: Tileset Number
- Bytes 1-2: Map Data Address (little-endian)

Note: Bank number for map data is from function at Bank $0F, Address $E9AD.

## Map List

Total: 73 maps (IDs $00-$48)

| ID | Name | Bank | Submaps |
|----|------|------|---------|
| $00 | Keeleon | $09 | 5 |
| $01 | Santeem | $09 | 3 |
| $02 | Burland | $09 | 4 |
| $03 | Dire Palace | $09 | 4 |
| $04 | Endor | $09 | 15 |
| $05 | Bonmalmo | $09 | 2 |
| $06 | Branca | $09 | 4 |
| $07 | Soretta | $09 | 2 |
| $08 | Gardenbur | $09 | 5 |
| $09 | Stancia | $09 | 8 |
| $0A | Aktemto | $09 | 1 |
| $0B | Riverton | $09 | 2 |
| $0C | Bazaar | $09 | 1 |
| $0D | Mintos | $09 | 3 |
| $0E | Tempe | $09 | 1 |
| $0F | Frenor | $09 | 2 |
| $10 | Aneaux | $09 | 4 |
| $11 | Haville | $09 | 6 |
| $12 | Izmit | $09 | 3 |
| $13 | Surene | $09 | 5 |
| $14 | Hometown | $09 | 3 |
| $15 | Monbaraba | $09 | 4 |
| $16 | Lakanaba | $09 | 3 |
| $17 | Kievs | $09 | 2 |
| $18 | Foxville | $09 | 2 |
| $19 | Seaside Village | $09 | 3 |
| $1A | Gottside | $09 | 2 |
| $1B | Rosaville | $09 | 5 |
| $1C | Secret Playground | $09 | 2 |
| $1D | House of Prophecy | $09 | 1 |
| $1E | Shrine to Endor | $09 | 1 |
| $1F | Inn Shrine | $09 | 1 |
| $20 | Woodsman's Shack | $09 | 1 |
| $21 | Desert Inn | $09 | 1 |
| $22 | Small Medal King | $09 | 2 |
| ... | ... | ... | ... |
