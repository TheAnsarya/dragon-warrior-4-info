# NES Architecture Reference for Dragon Warrior IV

## Overview

This document provides essential NES hardware knowledge needed for Dragon Warrior IV disassembly and modification work.

---

## CPU: Ricoh 2A03 (6502 variant)

### Registers

| Register | Size | Purpose |
|----------|------|---------|
| A | 8-bit | Accumulator (arithmetic, logic) |
| X | 8-bit | Index register (addressing, loops) |
| Y | 8-bit | Index register (addressing, loops) |
| S | 8-bit | Stack pointer ($0100-$01FF) |
| P | 8-bit | Processor status flags |
| PC | 16-bit | Program counter |

### Status Flags (P register)

```
Bit 7: N (Negative)    - Set if result bit 7 = 1
Bit 6: V (Overflow)    - Set on signed overflow
Bit 5: - (Unused)      - Always 1
Bit 4: B (Break)       - Set by BRK instruction
Bit 3: D (Decimal)     - Disabled on 2A03
Bit 2: I (Interrupt)   - IRQ disable flag
Bit 1: Z (Zero)        - Set if result = 0
Bit 0: C (Carry)       - Carry/borrow flag
```

### Addressing Modes

| Mode | Syntax | Example | Bytes | Cycles |
|------|--------|---------|-------|--------|
| Implied | - | CLC | 1 | 2 |
| Accumulator | A | ROL A | 1 | 2 |
| Immediate | #$xx | LDA #$42 | 2 | 2 |
| Zero Page | $xx | LDA $20 | 2 | 3 |
| Zero Page,X | $xx,X | LDA $20,X | 2 | 4 |
| Zero Page,Y | $xx,Y | LDX $20,Y | 2 | 4 |
| Absolute | $xxxx | LDA $4000 | 3 | 4 |
| Absolute,X | $xxxx,X | LDA $4000,X | 3 | 4+ |
| Absolute,Y | $xxxx,Y | LDA $4000,Y | 3 | 4+ |
| Indirect | ($xxxx) | JMP ($4000) | 3 | 5 |
| (Indirect,X) | ($xx,X) | LDA ($20,X) | 2 | 6 |
| (Indirect),Y | ($xx),Y | LDA ($20),Y | 2 | 5+ |
| Relative | $xx | BEQ label | 2 | 2-4 |

---

## Memory Map

### Full 64KB Address Space

```
$0000-$07FF   Internal RAM (2KB, mirrored 4x to $1FFF)
$2000-$2007   PPU registers (mirrored to $3FFF)
$4000-$4017   APU and I/O registers
$4018-$401F   APU and I/O (disabled)
$4020-$5FFF   Cartridge expansion area
$6000-$7FFF   WRAM/SRAM (battery-backed, 8KB on DW4)
$8000-$FFFF   PRG ROM (32KB window into larger ROM)
```

### Zero Page Usage ($00-$FF)

Zero page is precious - only 256 bytes accessible with fast 2-byte instructions.

Common uses:
- $00-$0F: Scratch variables
- $10-$1F: Temporary pointers
- $20-$3F: Engine state variables
- $40-$7F: Current context data
- $80-$FF: Varies by game

### Stack ($0100-$01FF)

- 256 bytes, grows downward from $01FF
- Stack pointer (S) is offset from $0100
- JSR pushes return address (minus 1)
- Interrupts push PC and status

### RAM ($0200-$07FF)

- General purpose RAM
- Often used for:
  - $0200-$02FF: OAM buffer (sprites)
  - $0300-$03FF: Game state
  - $0400-$07FF: Various buffers

---

## PPU: Picture Processing Unit (2C02)

### PPU Registers

| Address | Name | Read/Write | Description |
|---------|------|------------|-------------|
| $2000 | PPUCTRL | W | Control register 1 |
| $2001 | PPUMASK | W | Control register 2 |
| $2002 | PPUSTATUS | R | Status register |
| $2003 | OAMADDR | W | OAM address |
| $2004 | OAMDATA | R/W | OAM data |
| $2005 | PPUSCROLL | W×2 | Scroll position |
| $2006 | PPUADDR | W×2 | VRAM address |
| $2007 | PPUDATA | R/W | VRAM data |
| $4014 | OAMDMA | W | OAM DMA trigger |

### PPUCTRL ($2000) Bits

```
Bit 7: NMI enable          (0=off, 1=on)
Bit 6: PPU master/slave    (always 0)
Bit 5: Sprite size         (0=8x8, 1=8x16)
Bit 4: BG pattern table    (0=$0000, 1=$1000)
Bit 3: Sprite pattern      (0=$0000, 1=$1000)
Bit 2: VRAM increment      (0=+1, 1=+32)
Bits 1-0: Base nametable   (0-3 = $2000/$2400/$2800/$2C00)
```

### PPUMASK ($2001) Bits

```
Bit 7: Emphasize blue
Bit 6: Emphasize green
Bit 5: Emphasize red
Bit 4: Show sprites
Bit 3: Show background
Bit 2: Show left 8px of sprites
Bit 1: Show left 8px of BG
Bit 0: Greyscale
```

### PPU Memory Map (VRAM)

```
$0000-$0FFF   Pattern Table 0 (4KB, CHR-ROM bank)
$1000-$1FFF   Pattern Table 1 (4KB, CHR-ROM bank)
$2000-$23FF   Nametable 0 (1KB)
$2400-$27FF   Nametable 1 (1KB)
$2800-$2BFF   Nametable 2 (mirror or RAM)
$2C00-$2FFF   Nametable 3 (mirror or RAM)
$3000-$3EFF   Mirror of $2000-$2EFF
$3F00-$3F1F   Palette RAM (32 bytes)
$3F20-$3FFF   Palette mirrors
```

### Tile/Pattern Format

Each 8x8 tile = 16 bytes (2 bitplanes):
```
Bytes 0-7:   Bit plane 0 (low bits)
Bytes 8-15:  Bit plane 1 (high bits)

Combined: 2 bits per pixel = 4 colors per tile
```

### Nametable Format

```
Bytes 0-959:     Tile indices (32×30 = 960 tiles)
Bytes 960-1023:  Attribute table (64 bytes)

Attribute byte: 4 palettes for 4 2×2 tile blocks
  Bits 7-6: Bottom-right 2×2
  Bits 5-4: Bottom-left 2×2
  Bits 3-2: Top-right 2×2
  Bits 1-0: Top-left 2×2
```

### OAM (Object Attribute Memory)

64 sprites × 4 bytes each = 256 bytes

```
Byte 0: Y position (0-239, 0-7 off top)
Byte 1: Tile index
Byte 2: Attributes
  Bit 7: Flip vertical
  Bit 6: Flip horizontal
  Bit 5: Priority (0=front, 1=behind BG)
  Bits 1-0: Palette (4-7)
Byte 3: X position (0-255)
```

### Sprite Limitations

- 64 sprites total
- 8 sprites per scanline (extras dropped)
- Sprite 0 hit for timing

---

## APU: Audio Processing Unit

### APU Registers

| Range | Channel |
|-------|---------|
| $4000-$4003 | Pulse 1 |
| $4004-$4007 | Pulse 2 |
| $4008-$400B | Triangle |
| $400C-$400F | Noise |
| $4010-$4013 | DMC (DPCM) |
| $4015 | Status/Channel enable |
| $4017 | Frame counter |

### Channel Capabilities

| Channel | Features |
|---------|----------|
| Pulse 1/2 | Volume envelope, sweep, duty cycle (12.5/25/50/75%) |
| Triangle | No volume control, always full volume |
| Noise | Periodic/random noise, volume envelope |
| DMC | 1-bit delta modulation, 16 rates |

---

## MMC3 Mapper (iNES Mapper 4)

Dragon Warrior IV uses MMC3 for bank switching.

### MMC3 Registers

| Address | Purpose |
|---------|---------|
| $8000 | Bank select |
| $8001 | Bank data |
| $A000 | Mirroring |
| $A001 | PRG RAM protect |
| $C000 | IRQ latch |
| $C001 | IRQ reload |
| $E000 | IRQ disable |
| $E001 | IRQ enable |

### Bank Select ($8000)

```
Bits 7: PRG ROM bank mode
  0 = $8000-$9FFF swappable, $C000-$DFFF fixed
  1 = $C000-$DFFF swappable, $8000-$9FFF fixed

Bit 6: CHR A12 inversion
  0 = 2 2KB banks at $0000, 4 1KB banks at $1000
  1 = 2 2KB banks at $1000, 4 1KB banks at $0000

Bits 2-0: Bank register to update with $8001
  0 = CHR bank 0 (2KB at $0000 or $1000)
  1 = CHR bank 1 (2KB at $0800 or $1800)
  2 = CHR bank 2 (1KB at $1000 or $0000)
  3 = CHR bank 3 (1KB at $1400 or $0400)
  4 = CHR bank 4 (1KB at $1800 or $0800)
  5 = CHR bank 5 (1KB at $1C00 or $0C00)
  6 = PRG bank 0 (8KB at $8000 or $C000)
  7 = PRG bank 1 (8KB at $A000)
```

### MMC3 PRG Banking for DW4

```
DW4 has 256KB PRG = 16 × 16KB banks
MMC3 uses 8KB granularity = 32 × 8KB banks

Window:
$8000-$9FFF: Switchable 8KB (or fixed to second-to-last)
$A000-$BFFF: Switchable 8KB
$C000-$DFFF: Switchable 8KB (or fixed to second-to-last)
$E000-$FFFF: Fixed to last 8KB bank

Typical usage:
- $8000-$9FFF: Code bank (switches often)
- $A000-$BFFF: Data bank (switches often)
- $C000-$DFFF: Common code (relatively fixed)
- $E000-$FFFF: Core routines, vectors (always fixed)
```

### MMC3 CHR Banking for DW4

```
DW4 has 128KB CHR = 16 × 8KB banks
MMC3 splits into 2KB and 1KB banks

Pattern Table $0000-$0FFF (BG tiles):
  Uses 2 × 2KB banks OR 4 × 1KB banks

Pattern Table $1000-$1FFF (Sprite tiles):
  Uses 2 × 2KB banks OR 4 × 1KB banks

DW4 likely swaps CHR banks for:
- Different tile sets per area
- Battle graphics vs field graphics
- Chapter-specific sprites
```

### MMC3 Scanline Counter

- IRQ can trigger at specific scanline
- Used for split-screen effects, status bars
- C000 sets target scanline
- C001 reloads counter
- E000 acknowledges and disables
- E001 enables

---

## Timing

### Frame Timing (NTSC)

```
CPU Clock: 1.789773 MHz
PPU Clock: 5.369318 MHz (3× CPU)

Scanlines per frame: 262
  0-239:   Visible (240 lines)
  240:     Post-render
  241-260: VBlank (NMI occurs at 241)
  261:     Pre-render

Cycles per scanline: 341 PPU cycles = 113.67 CPU cycles
Cycles per frame: 89,342 PPU cycles ≈ 29,781 CPU cycles

VBlank duration: ~2,273 CPU cycles (time for VRAM updates)
```

### Safe VRAM Access

- VRAM can only be safely updated during VBlank
- Or when rendering is disabled (PPUMASK bits 3-4 = 0)
- Maximum ~170 bytes per VBlank if using PPUDATA
- OAM DMA takes 513-514 cycles

---

## File vs ROM Addressing

### iNES File Layout

```
Offset 0x00000-0x0000F: 16-byte iNES header
Offset 0x00010-0x4000F: PRG ROM (256KB)
Offset 0x40010-0x6000F: CHR ROM (128KB)
```

### Address Conversion Formulas

**File offset → CPU address:**
```
If file_offset >= 0x10 and file_offset < 0x40010:
    prg_offset = file_offset - 0x10
    bank = prg_offset / 0x4000   # 16KB bank number
    offset_in_bank = prg_offset % 0x4000
    
    # CPU address depends on which window bank is loaded into
    # For fixed bank (bank 15):
    cpu_address = 0xC000 + offset_in_bank
```

**CPU address → File offset (for fixed bank $E000-$FFFF):**
```
file_offset = cpu_address - 0xE000 + 0x3C010
# (Last 8KB of PRG starts at 0x3C010 in file)
```

**File offset → CHR bank:**
```
chr_offset = file_offset - 0x40010
chr_bank = chr_offset / 0x2000  # 8KB CHR bank number
```

### Important Addresses in DW4

| CPU Address | File Offset | Description |
|-------------|-------------|-------------|
| $FFFA | $3FFFA | NMI vector |
| $FFFC | $3FFFC | Reset vector |
| $FFFE | $3FFFE | IRQ vector |
| $8000 | Varies | Bank-switched code |
| $6000 | SRAM | Save data (not in ROM) |

---

## Quick Reference Tables

### Common Opcodes

| Opcode | Hex | Description |
|--------|-----|-------------|
| LDA | A9/A5/AD | Load A |
| STA | 85/8D | Store A |
| LDX | A2/A6/AE | Load X |
| STX | 86/8E | Store X |
| LDY | A0/A4/AC | Load Y |
| STY | 84/8C | Store Y |
| JSR | 20 | Jump subroutine |
| RTS | 60 | Return from subroutine |
| JMP | 4C/6C | Jump |
| BEQ | F0 | Branch if equal |
| BNE | D0 | Branch if not equal |
| CMP | C9/C5/CD | Compare A |
| INX | E8 | Increment X |
| DEX | CA | Decrement X |
| INY | C8 | Increment Y |
| DEY | 88 | Decrement Y |
| PHA | 48 | Push A |
| PLA | 68 | Pull A |
| SEI | 78 | Disable IRQ |
| CLI | 58 | Enable IRQ |
| RTI | 40 | Return from interrupt |

### Branch Instruction Timing

| Condition | Not Taken | Taken (same page) | Taken (cross page) |
|-----------|-----------|-------------------|-------------------|
| BEQ/BNE/etc | 2 cycles | 3 cycles | 4 cycles |

---

## See Also

- [MMC3 Reference](https://www.nesdev.org/wiki/MMC3)
- [6502 Reference](http://www.obelisk.me.uk/6502/)
- [NESdev Wiki](https://www.nesdev.org/wiki/)
