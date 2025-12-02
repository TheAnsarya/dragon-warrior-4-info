# Audio and Music Format Reference - Dragon Warrior IV

## Overview

This document details the audio system used in Dragon Warrior IV (NES), including the music engine, sound effect system, and data formats.

---

## NES Audio Hardware (2A03 APU)

### Available Channels

| Channel | Type | Capabilities |
|---------|------|--------------|
| Pulse 1 | Square wave | Variable duty cycle, envelope, sweep |
| Pulse 2 | Square wave | Variable duty cycle, envelope, sweep |
| Triangle | Triangle wave | Fixed volume, linear counter |
| Noise | Pseudo-random | Periodic/random mode, envelope |
| DMC | Delta modulation | 1-bit samples, 16 rate settings |

### Pulse Channel Features

```
Duty cycles: 12.5%, 25%, 50%, 75%
Volume envelope: 0-15, with decay option
Sweep: Automatic pitch bend up/down
Frequency range: ~54Hz to ~12.4kHz
```

### Triangle Channel

```
Fixed maximum volume
Linear counter for note length
Frequency range: ~27Hz to ~55kHz
Good for bass and wind instruments
```

### Noise Channel

```
Modes: Long sequence (32767 steps), Short sequence (93 steps)
15 preset frequencies
Volume envelope similar to pulse
Good for percussion, SFX
```

### DMC Channel

```
1-bit delta samples
16 playback rates
64 bytes to 4KB sample size
Used for voice, complex sounds
```

---

## Music Engine Architecture

### Typical NES Music Engine Components

```
┌──────────────────────────────────────────────────────┐
│                    MUSIC ENGINE                       │
├──────────────────────────────────────────────────────┤
│ Song Header                                           │
│   - Tempo                                            │
│   - Channel pointers                                 │
│   - Loop points                                      │
├──────────────────────────────────────────────────────┤
│ Channel Tracks (per channel)                          │
│   - Note sequence                                    │
│   - Instrument changes                               │
│   - Volume/effect commands                           │
├──────────────────────────────────────────────────────┤
│ Instrument Definitions                                │
│   - Duty cycle                                       │
│   - Envelope settings                                │
│   - Pitch/vibrato settings                           │
├──────────────────────────────────────────────────────┤
│ Pattern/Subroutine Data                               │
│   - Reusable note sequences                          │
│   - Called from track data                           │
└──────────────────────────────────────────────────────┘
```

### DW4 Music Engine (Estimated)

Based on typical Enix NES games:

```
Song Format:
  Byte 0: Tempo (frames per tick)
  Bytes 1-2: Pulse 1 track pointer
  Bytes 3-4: Pulse 2 track pointer
  Bytes 5-6: Triangle track pointer
  Bytes 7-8: Noise track pointer
  Bytes 9-10: DMC track pointer (optional)

Track Format:
  Note commands: $00-$7F
  Rest commands: $80-$8F
  Control commands: $90-$FF
```

---

## Note Encoding

### Pitch Values

```
Note value to frequency mapping:
Each octave = 12 semitones
Value = (octave * 12) + semitone

Octave range: Usually 2-6 (NES hardware limits)

Semitones:
  0 = C
  1 = C#/Db
  2 = D
  3 = D#/Eb
  4 = E
  5 = F
  6 = F#/Gb
  7 = G
  8 = G#/Ab
  9 = A
  10 = A#/Bb
  11 = B
```

### Frequency Table

```python
# Generate NES frequency values
def note_to_timer(note: int) -> int:
    """Convert note number to NES timer value."""
    # A4 = 440Hz, note 57
    freq = 440.0 * (2 ** ((note - 57) / 12.0))
    # NES timer value (for pulse/triangle)
    cpu_freq = 1789773  # NTSC
    timer = int(cpu_freq / (16 * freq) - 1)
    return max(0, min(timer, 0x7FF))
```

### Common Note Values

| Note | Octave | Value | Timer (approx) |
|------|--------|-------|----------------|
| C2 | 2 | 24 | $6B0 |
| C3 | 3 | 36 | $356 |
| C4 | 4 | 48 | $1AB |
| A4 | 4 | 57 | $0FD |
| C5 | 5 | 60 | $0D5 |
| C6 | 6 | 72 | $06A |

---

## Track Command Format

### Note Commands ($00-$7F)

```
Byte 0: Note value
  Bits 0-5: Note index (pitch)
  Bits 6-7: Duration modifier or octave

Following bytes may specify:
  - Duration (in ticks)
  - Velocity/volume
```

### Rest Commands

```
$80: Short rest (1 tick)
$81-$8F: Rest for N ticks
```

### Control Commands ($90-$FF)

| Command | Description |
|---------|-------------|
| $90 | Set instrument |
| $91 | Set volume |
| $92 | Set tempo |
| $93 | Pitch bend up |
| $94 | Pitch bend down |
| $95 | Vibrato on |
| $96 | Vibrato off |
| $97 | Set duty cycle |
| $98 | Loop start |
| $99 | Loop end |
| $9A | Call subroutine |
| $9B | Return |
| $FE | End of track |
| $FF | Loop to beginning |

---

## Instrument Definitions

### Instrument Structure

```
Instrument Entry:
  Byte 0: Duty cycle (for pulse)
          0 = 12.5%
          1 = 25%
          2 = 50%
          3 = 75%
  
  Byte 1: Volume envelope type
          0 = Constant
          1 = Decay
          2 = Attack-Decay
          3 = Custom envelope
  
  Byte 2: Initial volume (0-15)
  
  Byte 3: Decay rate (if applicable)
  
  Byte 4: Pitch modulation settings
          Bits 0-2: Vibrato depth
          Bits 3-5: Vibrato speed
          Bit 6: Sweep enable
          Bit 7: Sweep direction
```

### Volume Envelope

```
Envelope data (if custom):
  Series of volume values (0-15)
  Applied frame-by-frame
  $FF = hold last value
  $FE = loop to position
```

---

## Sound Effects

### SFX Priority System

```
Priority levels:
  0 = Background (lowest)
  1 = Normal
  2 = Important
  3 = Critical (highest)

Higher priority interrupts lower
Music channels may be hijacked for SFX
```

### SFX Format

```
SFX Entry:
  Byte 0: Channel mask (which channels to use)
  Byte 1: Priority level
  Byte 2-3: Data pointer

SFX Data:
  Similar to music track format
  Usually shorter sequences
  Often uses noise for percussion/impacts
```

### Common Sound Effects

| ID | Description | Channels |
|----|-------------|----------|
| $00 | Menu cursor | Pulse 1 |
| $01 | Menu confirm | Pulse 1 |
| $02 | Menu cancel | Pulse 1 |
| $03 | Text advance | Pulse 1 |
| $04 | Battle hit | Noise |
| $05 | Battle miss | Noise |
| $06 | Spell cast | Pulse 1+2 |
| $07 | Healing | Triangle |
| $08 | Level up | All |
| $09 | Door open | Noise |
| $0A | Chest open | Pulse 1 |
| ... | ... | ... |

---

## Music Track List

### DW4 Music (Estimated)

| ID | Name | Context |
|----|------|---------|
| $00 | Title Screen | Title |
| $01 | Overworld (Chapter 1) | Ragnar |
| $02 | Overworld (Chapter 2) | Alena |
| $03 | Overworld (Chapter 3) | Taloon |
| $04 | Overworld (Chapter 4) | Sisters |
| $05 | Overworld (Chapter 5) | Hero |
| $06 | Battle Theme | Random encounters |
| $07 | Boss Battle | Boss fights |
| $08 | Victory Fanfare | Battle won |
| $09 | Game Over | Party defeated |
| $0A | Town Theme | Generic town |
| $0B | Castle Theme | Castle interiors |
| $0C | Cave/Dungeon | Underground |
| $0D | Tower Theme | Tower areas |
| $0E | Ship Theme | Sailing |
| $0F | Inn/Rest | Staying at inn |
| $10 | Church | Church services |
| $11 | Shop | Shopping |
| $12 | Casino | Casino |
| $13 | Scary/Tense | Dangerous areas |
| $14-$1F | Chapter-specific | Various |
| $20+ | Event music | Cutscenes |

---

## Data Extraction

### Finding Music Data

1. Set breakpoints on APU register writes ($4000-$4017)
2. Trace back to music engine routine
3. Find music data pointers
4. Document format through analysis

### Extraction Script

```python
def extract_music_data(rom_data: bytes, music_table_offset: int, 
                       track_count: int) -> list:
    """Extract all music tracks from ROM."""
    tracks = []
    
    for i in range(track_count):
        ptr_offset = music_table_offset + (i * 2)
        ptr = rom_data[ptr_offset] | (rom_data[ptr_offset + 1] << 8)
        
        # Read track header
        # (Format depends on specific engine)
        track_data = read_track(rom_data, ptr)
        
        tracks.append({
            'id': i,
            'pointer': ptr,
            'data': track_data
        })
    
    return tracks
```

---

## JSON Export Format

### Music Track

```json
{
  "id": 6,
  "name": "Battle Theme",
  "tempo": 6,
  "channels": {
    "pulse1": {
      "instrument": 0,
      "notes": [
        {"pitch": "C4", "duration": 4},
        {"pitch": "E4", "duration": 4},
        {"pitch": "G4", "duration": 8},
        {"type": "rest", "duration": 4}
      ]
    },
    "pulse2": { "...": "..." },
    "triangle": { "...": "..." },
    "noise": { "...": "..." }
  }
}
```

### Sound Effect

```json
{
  "id": 0,
  "name": "Menu Cursor",
  "priority": 1,
  "channel": "pulse1",
  "data": [
    {"note": "C6", "duration": 2, "volume": 15},
    {"note": "E6", "duration": 2, "volume": 12}
  ]
}
```

---

## Conversion Considerations

### NES → Modern Format

For playback or conversion:

| NES Format | Modern Equivalent |
|------------|-------------------|
| Pulse duty | Square wave synth |
| Triangle | Triangle/sine wave |
| Noise | White/pink noise |
| DMC | PCM samples |

### NES → SNES (for port)

SNES SPC700 differences:
- 8 channels (vs 5)
- Sample-based (vs synthesized)
- More complex instruments
- Higher quality audio

Conversion approach:
1. Map NES channels to SNES
2. Create sample instruments mimicking NES sounds
3. Adjust tempo/timing for different hardware
4. Enhance with additional channels if desired

---

## Tools and References

### Recommended Tools

- **FamiTracker**: NES music composition/analysis
- **NSFPlay**: NSF playback and debugging
- **Mesen**: NES emulator with APU visualization
- **NSF2MML**: Convert NSF to text format

### NSF Export

NSF (NES Sound Format) can be ripped for standalone playback:

```
NSF Header (128 bytes):
  "NESM" magic
  Version
  Song count
  Starting song
  Load/Init/Play addresses
  Song name, artist, copyright
  NTSC/PAL speed values
  Bank switching info
  Chip extensions
```

---

## See Also

- [NES_ARCHITECTURE.md](NES_ARCHITECTURE.md) - APU registers
- [ROM_STRUCTURE.md](ROM_STRUCTURE.md) - Bank locations
- [ASSET_PIPELINE.md](ASSET_PIPELINE.md) - Extraction workflow
