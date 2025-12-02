# Graphics Format Reference - Dragon Warrior IV

## Overview

This document details the graphics formats used in Dragon Warrior IV (NES), including tile formats, sprite composition, and palette organization.

---

## NES Graphics Fundamentals

### Tile Format (CHR)

NES tiles are 8×8 pixels, stored as 2 bitplanes:

```
Tile Structure (16 bytes total):
┌─────────────────────────────────────┐
│ Bytes 0-7:  Bitplane 0 (low bits)   │
│ Bytes 8-15: Bitplane 1 (high bits)  │
└─────────────────────────────────────┘

Pixel value = (bitplane1_bit << 1) | bitplane0_bit
Result: 0-3 (4 colors per tile)
```

### Example Tile Encoding

```
Visual tile (8x8):
. 1 2 3 3 2 1 .     (. = 0, numbers = color index)
1 . . . . . . 1
2 . 3 3 3 3 . 2
3 . 3 . . 3 . 3
3 . 3 . . 3 . 3
2 . 3 3 3 3 . 2
1 . . . . . . 1
. 1 2 3 3 2 1 .

Binary encoding:
Bitplane 0 (bit 0 of each pixel):
01110110 = $76
10000001 = $81
00111100 = $3C
01010010 = $52
01010010 = $52
00111100 = $3C
10000001 = $81
01110110 = $76

Bitplane 1 (bit 1 of each pixel):
00111100 = $3C
00000000 = $00
01111110 = $7E
01011010 = $5A
01011010 = $5A
01111110 = $7E
00000000 = $00
00111100 = $3C

Final 16 bytes: 76 81 3C 52 52 3C 81 76 3C 00 7E 5A 5A 7E 00 3C
```

---

## CHR ROM Organization

### Bank Layout

DW4 has 128KB CHR ROM = 16 × 8KB banks = 8192 tiles total

Each 8KB bank:
- 512 tiles × 16 bytes = 8192 bytes
- Arranged as 16×32 tiles visually

### CHR Bank Contents (Estimated)

| Bank | Offset | Content |
|------|--------|---------|
| 0 | $40010 | Font, UI elements, text characters |
| 1 | $42010 | Hero/party field sprites |
| 2 | $44010 | NPC field sprites |
| 3 | $46010 | Overworld tiles |
| 4 | $48010 | Town/building tiles |
| 5 | $4A010 | Dungeon tiles |
| 6 | $4C010 | Cave tiles |
| 7 | $4E010 | Battle backgrounds |
| 8 | $50010 | Monster sprites (set 1) |
| 9 | $52010 | Monster sprites (set 2) |
| 10 | $54010 | Monster sprites (set 3) |
| 11 | $56010 | Monster sprites (set 4) |
| 12 | $58010 | Battle effects, UI |
| 13 | $5A010 | Character portraits |
| 14 | $5C010 | Title screen |
| 15 | $5E010 | Ending, misc |

---

## Sprite System

### OAM (Object Attribute Memory)

NES supports 64 sprites, each 4 bytes:

```
Byte 0: Y position (0-239)
Byte 1: Tile index
Byte 2: Attributes
        Bits 0-1: Palette (sprite palettes 4-7)
        Bit 5:    Priority (0=front, 1=behind BG)
        Bit 6:    Horizontal flip
        Bit 7:    Vertical flip
Byte 3: X position (0-255)
```

### Sprite Sizes

DW4 uses 8×16 sprite mode (PPUCTRL bit 5 = 1):

```
8×16 sprites:
- Tile index must be even
- Top tile = index
- Bottom tile = index + 1
- Both from same pattern table
```

### Metasprites (Composed Sprites)

Characters are composed of multiple hardware sprites:

```
Typical character sprite (16×24 or 16×32):
┌────┬────┐
│ 0  │ 1  │  ← Sprites 0,1 (top row)
├────┼────┤
│ 2  │ 3  │  ← Sprites 2,3 (middle row)
├────┼────┤
│ 4  │ 5  │  ← Sprites 4,5 (bottom row)
└────┴────┘

Each cell = one 8×8 or 8×16 hardware sprite
```

### Metasprite Data Format

```
Metasprite entry:
  Byte 0: Number of sprites
  For each sprite:
    Byte 0: X offset from origin
    Byte 1: Y offset from origin
    Byte 2: Tile index
    Byte 3: Attributes (palette, flip)
  Terminator: $FF or end after count
```

---

## Palette System

### NES Palette Architecture

```
Background Palettes ($3F00-$3F0F):
  $3F00: Universal background color
  $3F01-$3F03: BG Palette 0
  $3F05-$3F07: BG Palette 1
  $3F09-$3F0B: BG Palette 2
  $3F0D-$3F0F: BG Palette 3

Sprite Palettes ($3F10-$3F1F):
  $3F10: Mirror of $3F00 (transparent)
  $3F11-$3F13: Sprite Palette 0
  $3F15-$3F17: Sprite Palette 1
  $3F19-$3F1B: Sprite Palette 2
  $3F1D-$3F1F: Sprite Palette 3
```

### Color 0 Behavior

- BG color 0 in any palette = universal BG ($3F00)
- Sprite color 0 = transparent

### NES Color Values

```
NES palette uses 6-bit color indices (0x00-0x3F)
64 colors total, many duplicates

Common values:
0x0F = Black
0x00 = Gray
0x20 = White
0x16 = Red
0x2A = Green
0x12 = Blue
0x27 = Orange/tan (skin tone)
```

### DW4 Common Palettes

**Field/Overworld:**
- Palette 0: Grass, trees (greens)
- Palette 1: Water, ice (blues)
- Palette 2: Buildings, dirt (browns)
- Palette 3: Characters, UI (varied)

**Battle:**
- Palette 0-1: Monster colors
- Palette 2-3: Effects, UI

---

## Background System

### Nametable Structure

```
32×30 tiles = 960 bytes of tile indices
+ 64 bytes attribute table
= 1024 bytes per nametable
```

### Attribute Table

```
Each byte controls 4×4 tiles (32×32 pixels)
Divided into four 2×2 tile quadrants:

  ┌─────┬─────┐
  │ TL  │ TR  │  TL = bits 0-1
  ├─────┼─────┤  TR = bits 2-3
  │ BL  │ BR  │  BL = bits 4-5
  └─────┴─────┘  BR = bits 6-7
```

### Metatiles

DW4 likely uses 16×16 metatiles for maps:

```
Metatile = 4 tiles (2×2):
┌────┬────┐
│ TL │ TR │
├────┼────┤
│ BL │ BR │
└────┴────┘

Metatile entry:
  Byte 0: Top-left tile index
  Byte 1: Top-right tile index
  Byte 2: Bottom-left tile index
  Byte 3: Bottom-right tile index
  Byte 4: Attribute (palette) - optional
  Byte 5: Properties (collision, etc) - optional
```

---

## Animation System

### Sprite Animation

```
Animation data structure:
  Byte 0: Number of frames
  Byte 1: Frame delay (in game frames)
  For each frame:
    Byte: Metasprite index
  Terminator or loop back
```

### Character Animations

| Animation | Frames | Description |
|-----------|--------|-------------|
| Idle | 2 | Standing still, slight movement |
| Walk Down | 2-4 | Walking toward camera |
| Walk Up | 2-4 | Walking away |
| Walk Left | 2-4 | Walking left (flipped for right) |
| Attack | 3-4 | Battle attack animation |
| Cast | 2-3 | Spell casting |
| Hurt | 1-2 | Taking damage |

### Tile Animation

Background tiles can animate (water, torches):
- Store multiple versions in CHR
- Swap CHR bank regions periodically
- Or swap entire CHR bank

---

## Graphics Extraction

### CHR Extraction Script

```python
def extract_chr_bank(rom_data: bytes, bank: int) -> bytes:
    """Extract a single 8KB CHR bank."""
    chr_start = 0x40010  # After iNES header + PRG
    bank_offset = chr_start + (bank * 0x2000)
    return rom_data[bank_offset:bank_offset + 0x2000]

def chr_to_png(chr_data: bytes, palette: list) -> Image:
    """Convert CHR data to PNG image."""
    # 512 tiles per 8KB bank
    # Arrange as 16×32 tiles = 128×256 pixels
    img = Image.new('P', (128, 256))
    img.putpalette(palette_to_rgb(palette))
    
    for tile_idx in range(512):
        tile_offset = tile_idx * 16
        tile = decode_tile(chr_data[tile_offset:tile_offset+16])
        
        x = (tile_idx % 16) * 8
        y = (tile_idx // 16) * 8
        paste_tile(img, tile, x, y)
    
    return img

def decode_tile(data: bytes) -> list:
    """Decode 16 bytes to 8×8 pixel array."""
    pixels = []
    for row in range(8):
        plane0 = data[row]
        plane1 = data[row + 8]
        row_pixels = []
        for bit in range(7, -1, -1):
            pixel = ((plane1 >> bit) & 1) << 1
            pixel |= (plane0 >> bit) & 1
            row_pixels.append(pixel)
        pixels.append(row_pixels)
    return pixels
```

### Sprite Sheet Organization

For exported sprite sheets:

```
Character Sprite Sheet (64×96 per character):
┌────────────────────────────────────────┐
│ Down   Down   Down   Down              │
│ Idle   Walk1  Walk2  Walk3             │
├────────────────────────────────────────┤
│ Up     Up     Up     Up                │
│ Idle   Walk1  Walk2  Walk3             │
├────────────────────────────────────────┤
│ Side   Side   Side   Side              │
│ Idle   Walk1  Walk2  Walk3             │
└────────────────────────────────────────┘
```

---

## Graphics Reinsertion

### PNG to CHR

```python
def png_to_chr(img: Image) -> bytes:
    """Convert indexed PNG back to CHR data."""
    assert img.mode == 'P', "Image must be indexed"
    assert img.size[0] % 8 == 0 and img.size[1] % 8 == 0
    
    tiles_x = img.size[0] // 8
    tiles_y = img.size[1] // 8
    chr_data = bytearray()
    
    for ty in range(tiles_y):
        for tx in range(tiles_x):
            tile = extract_tile(img, tx * 8, ty * 8)
            chr_data.extend(encode_tile(tile))
    
    return bytes(chr_data)

def encode_tile(pixels: list) -> bytes:
    """Encode 8×8 pixel array to 16 bytes."""
    plane0 = bytearray(8)
    plane1 = bytearray(8)
    
    for row in range(8):
        for col in range(8):
            pixel = pixels[row][col] & 0x03
            bit_pos = 7 - col
            if pixel & 1:
                plane0[row] |= (1 << bit_pos)
            if pixel & 2:
                plane1[row] |= (1 << bit_pos)
    
    return bytes(plane0) + bytes(plane1)
```

### Palette File Format

```
.pal file format (standard NES palette):
64 entries × 3 bytes (RGB) = 192 bytes

Or custom format for specific palettes:
4 colors × 3 bytes = 12 bytes per palette
```

---

## File Formats for Editing

### Recommended Export Format

| Content | Format | Tools |
|---------|--------|-------|
| Tile sheets | PNG (indexed) | GIMP, Aseprite |
| Palettes | .pal or .gpl | GIMP, custom |
| Animations | JSON | Text editor |
| Metasprites | JSON | Text editor |

### PNG Requirements

- Color mode: Indexed (max 4 colors per tile)
- Transparency: Color index 0
- Dimensions: Multiple of 8 pixels
- No anti-aliasing or gradients

---

## See Also

- [NES_ARCHITECTURE.md](NES_ARCHITECTURE.md) - PPU details
- [ASSET_PIPELINE.md](ASSET_PIPELINE.md) - Extraction workflow
- [DATA_TABLES.md](DATA_TABLES.md) - Sprite/animation pointers
