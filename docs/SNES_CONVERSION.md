# Dragon Warrior IV NES to SNES Conversion Guide

This document outlines the technical considerations for converting Dragon Warrior IV assets from NES to SNES format for use in Dragon Quest 3: Remix.

## 🎯 Conversion Overview

### Source Platform: NES
- CPU: Ricoh 2A03 (6502-based, 1.79 MHz)
- PPU: 2C02 (256×240, 64 colors, 4 palettes)
- APU: 5 channels (2 pulse, 1 triangle, 1 noise, 1 DMC)
- ROM: 256KB PRG + 128KB CHR (DW4)
- Mapper: MMC3 (iNES Mapper 4)

### Target Platform: SNES
- CPU: Ricoh 5A22 (65816, 3.58 MHz)
- PPU: S-PPU1/S-PPU2 (256×224/239, 32,768 colors, 8 palettes)
- APU: SPC700 + DSP (8 ADPCM channels)
- ROM: Variable (DQ3 SNES ~2MB)
- Enhancement: SA-1 in some versions

## 📊 Graphics Conversion

### Tile Format Conversion

#### NES (2bpp planar)
```
Tile: 8x8 pixels, 16 bytes
- Bytes 0-7: Bit plane 0
- Bytes 8-15: Bit plane 1
- 4 colors per tile (from palette)
```

#### SNES (4bpp planar)
```
Tile: 8x8 pixels, 32 bytes
- Bytes 0-15: Bit planes 0,1 (interleaved)
- Bytes 16-31: Bit planes 2,3 (interleaved)
- 16 colors per tile (from palette)
```

### Conversion Process
1. **Extract NES tiles** → 2bpp binary data
2. **Expand to 4bpp** → Add 2 empty bit planes (or map colors)
3. **Remap palette indices** → 0-3 to appropriate 0-15 range
4. **Adjust palette** → Expand NES colors to SNES RGB555

### Palette Conversion

#### NES Palette (fixed 64 colors)
```
$0D = Black
$00 = Gray
$10 = Light Gray
$30 = White
$16 = Red
$2A = Green
$12 = Blue
(etc. - fixed color lookup)
```

#### SNES Palette (RGB555)
```
15-bit color: 0BBBBBGGGGGRRRRR
Each component: 0-31 (5 bits)
```

### Conversion Formula
```python
def nes_to_snes_color(nes_color_index):
    # NES color lookup table (approximate RGB values)
    nes_rgb = NES_PALETTE_RGB[nes_color_index]
    r = (nes_rgb[0] >> 3) & 0x1F  # 8-bit to 5-bit
    g = (nes_rgb[1] >> 3) & 0x1F
    b = (nes_rgb[2] >> 3) & 0x1F
    return (b << 10) | (g << 5) | r
```

### Sprite Differences

| Feature | NES | SNES |
|---------|-----|------|
| Max sprites | 64 | 128 |
| Sprite sizes | 8×8 or 8×16 | 8×8, 16×16, 32×32, 64×64 |
| Colors/sprite | 3 + transparent | 15 + transparent |
| Palettes | 4 sprite palettes | 8 sprite palettes |
| Per-line limit | 8 sprites | 32 sprites |

### Sprite Conversion Strategy
1. **Keep 16×16 composition** - DW4 uses 4 8×8 tiles per character
2. **Expand palette** - Use SNES 4bpp, map NES 3 colors
3. **Consider larger sprites** - SNES can use native 16×16

## 🎵 Audio Conversion

### NES APU to SNES SPC700

#### NES Channels
| Channel | Type | Notes |
|---------|------|-------|
| Pulse 1 | Square wave | Duty cycle: 12.5%, 25%, 50%, 75% |
| Pulse 2 | Square wave | Same as Pulse 1 |
| Triangle | Triangle wave | Fixed waveform, no volume control |
| Noise | Pseudo-random | Short/long mode |
| DMC | Sample | 1-bit delta |

#### SNES Channels
| Feature | Specification |
|---------|---------------|
| Channels | 8 |
| Sample format | 4-bit ADPCM (BRR) |
| Sample rate | 32 kHz max |
| Effects | Hardware echo, pitch modulation |

### Conversion Approach

#### Option 1: Direct Port
1. Convert NES sequences to SNES format
2. Create BRR samples mimicking NES waveforms
3. Square wave → sampled square
4. Triangle wave → sampled triangle
5. Maintain original composition

#### Option 2: Enhanced Port
1. Keep melodies and composition
2. Use higher quality samples
3. Add reverb/echo effects
4. Potentially upgrade instrument sounds

### Music Data Conversion
```
NES Music Data:
- Note + Duration
- Instrument/duty cycle
- Volume envelope
- Effects (vibrato, etc.)

SNES Music Data:
- Note + Duration
- Sample index
- Volume + Pan
- ADSR envelope
- Pitch bend
```

## 📝 Text Conversion

### Character Encoding

#### NES DW4 Encoding
- Custom TBL format
- Single-byte characters
- Control codes $00-$1F
- Compression in some areas

#### SNES DQ3 Encoding
- Different TBL format
- May use 2-byte for Japanese
- Different control codes
- VWF (Variable Width Font) possible

### Conversion Steps
1. **Extract all text** with NES TBL
2. **Decode to Unicode/ASCII**
3. **Re-encode** with SNES TBL
4. **Adjust pointers** in SNES ROM
5. **Handle window sizes** (different dimensions)

### Text Pointer Tables
```
NES: 2-byte pointers (bank-relative)
SNES: 3-byte pointers (24-bit addressing)
```

## 🗺️ Map Conversion

### Tilemap Format

#### NES Nametables
- 32×30 tiles (256×240 pixels)
- 1 byte per tile (index)
- Attribute table for palettes

#### SNES Tilemaps
- Variable size (up to 64×64)
- 2 bytes per tile (index + attributes)
- Inline palette/flip info

### Map Conversion Process
1. **Extract tile indices** from NES maps
2. **Convert to SNES tilemap format**
3. **Remap tile indices** (if tiles reorganized)
4. **Set attributes** (palette, priority, flip)

### Map Data Compression
```
NES: Simple RLE or custom compression
SNES: LZ-based compression common
```

## 📊 Data Table Conversion

### Monster Data

#### NES Format (14 bytes)
```
Offset 0: HP (low)
Offset 1: HP (high)
Offset 2: MP
Offset 3: Attack
Offset 4: Defense
Offset 5: Agility
Offset 6: XP (low)
Offset 7: XP (high)
Offset 8: Gold (low)
Offset 9: Gold (high)
Offset 10: Actions
Offset 11: Resistances
Offset 12: Drop item
Offset 13: Flags
```

#### SNES Format (varies)
- Likely larger records
- Additional fields
- Different byte ordering possible

### Conversion Strategy
1. Extract to JSON (platform-neutral)
2. Verify all fields mapped
3. Convert JSON to SNES binary format
4. Insert at appropriate SNES ROM location

## 🔧 Tools Needed

### Extraction Tools (NES side)
- [x] ROM Analyzer
- [ ] Graphics Extractor (CHR → PNG)
- [ ] Music Extractor (NSF format)
- [ ] Text Extractor (with TBL)
- [ ] Data Extractor (JSON output)
- [ ] Map Extractor

### Conversion Tools
- [ ] 2bpp to 4bpp converter
- [ ] NES to SNES palette converter
- [ ] Music format converter
- [ ] Text re-encoder
- [ ] Map format converter

### Insertion Tools (SNES side)
- [ ] Graphics Inserter
- [ ] Music Inserter
- [ ] Text Inserter
- [ ] Data Inserter
- [ ] Map Inserter

## 📁 File Format Pipeline

```
NES Assets                    Intermediate              SNES Assets
-----------                   ------------              -----------
CHR tiles (.chr)    →    PNG images    →    SNES tiles (.bin)
Music data          →    MML/JSON      →    SPC music (.bin)
Text data           →    UTF-8 text    →    SNES text (.bin)
Monster data        →    JSON          →    SNES data (.bin)
Map data            →    JSON/TMX      →    SNES maps (.bin)
```

## ⚠️ Known Challenges

### Graphics
- **Color limitations**: NES 4 colors vs SNES 16 - need to expand palettes
- **Sprite composition**: May need to reorganize for SNES sprite sizes
- **Tile count**: SNES has more VRAM, can expand tileset

### Audio
- **Waveform fidelity**: Square/Triangle may sound different as samples
- **Channel mapping**: 5 NES channels to 8 SNES channels
- **Sample memory**: BRR samples need careful optimization

### Data
- **Struct differences**: Field sizes and ordering may differ
- **Pointer sizes**: 16-bit vs 24-bit addressing
- **Compression**: Different algorithms between platforms

### Integration
- **DQ3 engine compatibility**: Need to match DQ3 SNES data formats
- **Space constraints**: SNES ROM may have different free space
- **Testing**: Extensive testing needed for balance/bugs

## 📋 Checklist by Asset Type

### Graphics Conversion
- [ ] Extract all CHR banks
- [ ] Identify tile usage (BG vs sprite)
- [ ] Convert 2bpp → 4bpp
- [ ] Create SNES palettes
- [ ] Test in SNES environment

### Audio Conversion
- [ ] Extract music sequences
- [ ] Create BRR samples
- [ ] Convert to SNES music format
- [ ] Test playback
- [ ] Balance volume/mixing

### Text Conversion
- [ ] Extract all text strings
- [ ] Create mapping table
- [ ] Re-encode for SNES
- [ ] Update pointer tables
- [ ] Test in-game display

### Data Conversion
- [ ] Extract all data tables
- [ ] Document format differences
- [ ] Create conversion scripts
- [ ] Validate converted data
- [ ] Test in-game behavior

### Map Conversion
- [ ] Extract all maps
- [ ] Convert tilemap format
- [ ] Handle compression differences
- [ ] Update event scripts
- [ ] Test map loading/transitions

## 📚 Resources

### NES Documentation
- [NESdev Wiki](https://www.nesdev.org/wiki/)
- This project's docs/ folder

### SNES Documentation
- [SNES Dev Wiki](https://wiki.superfamicom.org/)
- [Anomie's SNES Docs](https://www.romhacking.net/documents/)

### DQ3 SNES Resources
- Dragon Quest III SNES disassembly (if available)
- ROM map documentation

---

*Last updated: 2025-12-01*
