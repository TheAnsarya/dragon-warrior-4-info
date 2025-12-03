# Dragon Warrior IV (NES) - Code Analysis

## Overview

This document contains detailed reverse engineering notes for Dragon Warrior IV (NES).

### ROM Information
- **File**: Dragon Warrior IV (1992-10)(Enix)(US).nes
- **PRG-ROM**: 512KB (32 x 16KB banks)
- **CHR-ROM**: 0 bytes (uses CHR-RAM)
- **Mapper**: 1 (MMC1 / SxROM)
- **Battery**: Yes (SRAM at $6000-$7FFF)

### Memory Map

| Address Range | Description |
|--------------|-------------|
| $0000-$00FF  | Zero Page - System variables |
| $0100-$01FF  | Stack |
| $0200-$02FF  | OAM shadow buffer |
| $0300-$04FF  | PPU update buffer, variables |
| $0500-$05FF  | System state, PPU mirrors |
| $0600-$07FF  | Work RAM |
| $6000-$7FFF  | Battery-backed SRAM (save data) |
| $8000-$BFFF  | Switchable PRG bank (MMC1) |
| $C000-$FFFF  | Fixed PRG bank (last 16KB) |

---

## CPU Vectors

| Vector | Address | Target | Description |
|--------|---------|--------|-------------|
| NMI    | $FFFA   | $0502  | Points to RAM - self-modifying code |
| RESET  | $FFFC   | $FFD8  | Entry point |
| IRQ    | $FFFE   | $C408  | IRQ/BRK handler |

### NMI Vector ($0502)
The NMI vector points to RAM at $0502, which contains a JMP instruction that's set up during initialization. On startup, this is configured to jump to $C15A.

**RAM Layout at $0500-$0507:**
```
$0500: vblank_flag    - VBlank synchronization flag
$0501: ppuctrl_shadow - Shadow of PPUCTRL ($2000)
$0502: $4C            - JMP opcode
$0503: $5A            - Low byte of NMI target
$0504: $C1            - High byte of NMI target ($C15A)
$0505: additional_ppu - Additional PPU control
$0506: ppumask_shadow - Shadow of PPUMASK ($2001)
$0507: current_bank   - Currently selected PRG bank
```

---

## MMC1 Mapper Registers

Dragon Warrior IV uses the MMC1 mapper (mapper 1). The MMC1 uses a serial interface where you write bits one at a time to configure the mapper.

### Serial Write Pattern
Each register write requires 5 writes, with the data shifted in bit by bit:
```asm
  STA  $xxFF    ; Write bit 0
  LSR  A        ; Shift next bit into position
  STA  $xxFF    ; Write bit 1
  LSR  A
  STA  $xxFF    ; Write bit 2
  LSR  A
  STA  $xxFF    ; Write bit 3
  LSR  A
  STA  $xxFF    ; Write bit 4 + latch
```

### Register Addresses
| Range       | Register | Description |
|-------------|----------|-------------|
| $8000-$9FFF | Control  | Mirroring, PRG/CHR bank mode |
| $A000-$BFFF | CHR Bank 0 | CHR-ROM bank at $0000 |
| $C000-$DFFF | CHR Bank 1 | CHR-ROM bank at $1000 |
| $E000-$FFFF | PRG Bank   | PRG-ROM bank at $8000 |

### Bank Configuration Routines

**sub_C118** - Configure Control Register ($9FFF):
```asm
sub_C118:
  STA  vblank_flag
  STA  $9FFF    ; 5 serial writes to Control register
  LSR  A
  STA  $9FFF
  ...
```

**sub_C12F** - Configure CHR Bank 1 ($BFFF):
```asm
sub_C12F:
  STA  ppuctrl_shadow
  STA  $BFFF    ; 5 serial writes to CHR Bank 1
  ...
```

**loc_C146** - Configure PRG Bank ($DFFF):
```asm
loc_C146:
  STA  $DFFF    ; 5 serial writes to PRG Bank
  ...
```

---

## RESET Handler ($FFD8)

```asm
RESET_entry:
  SEI                  ; Disable interrupts
  INC  $FFDF           ; Reset MMC1 (any write with bit 7 set)
  JMP  main_init       ; Jump to main initialization

main_init:
  CLD                  ; Clear decimal mode
  
  ; Wait for 2 VBlanks (PPU warmup)
loc_C03E:
  LDA  PPUSTATUS
  BPL  loc_C03E
loc_C043:
  LDA  PPUSTATUS
  BPL  loc_C043
  
  ; NOPs for timing
  NOP (x6)
  
  ; Configure PPU
  LDA  #$10
  STA  PPUCTRL         ; Enable NMI
  LDA  #$00
  STA  PPUMASK         ; Disable rendering
  
  ; Reset MMC1 registers (5 writes each)
  STA  $FFFF (x5)
  
  ; Set up NMI vector in RAM
  LDA  #$4C            ; JMP opcode
  STA  $0502
  LDA  <NMI_main       ; $5A
  STA  $0503
  LDA  >NMI_main       ; $C1
  STA  $0504
  
  ; Initialize stack
  LDX  #$FF
  TXS
  
  ; Clear RAM
  LDA  #$00
  TAX
loc_C07E:
  STA  $00,X           ; Zero page
  STA  $0300,X         ; PPU buffer
  STA  $0400,X         
  STA  $0505,X         ; System variables
  STA  $0600,X         ; Work RAM
  STA  $0700,X
  INX
  BNE  loc_C07E
  
  ; Initialize system variables
  LDA  #$0E
  STA  vblank_flag
  LDA  #$10
  STA  ppuctrl_shadow
  STA  $39
  
  ; Call initialization subroutine
  JSR  init_subroutine
  
  ; ... (PPU setup continues)
  
  ; Jump to main game loop
  JMP  loc_C968
```

---

## NMI Handler ($C15A)

The NMI handler is called every VBlank (60 times/second on NTSC).

```asm
NMI_main:
  ; Save registers
  PHA
  TXA
  PHA
  TYA
  PHA
  
  ; Check state flag at $1F
  LDA  $1F
  BMI  loc_C181        ; Skip if negative (busy)
  
  ; Check return address on stack
  TSX
  LDY  $0106,X         ; High byte of return address
  INY
  BNE  loc_C181        ; Skip if not in specific range
  
  LDA  $0105,X         ; Low byte of return address
  CMP  #$77
  BCC  loc_C181
  CMP  #$81
  BCS  loc_C181
  
  ; Update PPU
  LDA  PPUSTATUS       ; Clear VBlank flag
  JSR  sub_C222        ; PPU buffer transfer
  JSR  sub_C303        ; OAM DMA
  JSR  sub_C2EA        ; Set scroll/PPU registers
  
loc_C181:
  ; ... (more state checks)
  
  ; Update frame counter
  INC  $050C
  
  ; ... (read return address for state check)
  
  ; Restore and return
  PLA
  TAY
  PLA
  TAX
  PLA
  RTI
```

### sub_C222 - PPU Buffer Transfer
Transfers buffered tile updates to VRAM. Reads from $0300 buffer.

### sub_C2EA - Set PPU Registers
```asm
sub_C2EA:
  LDA  $0505
  STA  PPUCTRL
  LDA  $0506
  STA  PPUMASK
  LDA  $0508
  STA  PPUSCROLL
  LDA  $0509
  STA  PPUSCROLL
  RTS
```

---

## IRQ Handler ($C408)

The IRQ handler is used for extended opcodes via BRK instructions. It reads the byte following BRK to determine the operation.

```asm
IRQ_handler:
  SEI
  PHP
  BIT  APU_STATUS
  STA  $20             ; Save A
  STX  $21             ; Save X
  STY  $22             ; Save Y
  
  ; Get BRK instruction address
  TSX
  LDA  $0103,X         ; Low byte of return address
  SEC
  SBC  #$01            ; Point to BRK operand
  STA  $26
  LDA  $0104,X
  SBC  #$00
  STA  $27
  
  ; Read BRK operand
  LDY  #$01
  LDA  ($26),Y
  ; ... dispatch based on operand
```

### BRK Extended Opcodes
The game uses BRK instructions as extended opcodes. The byte following BRK determines the operation.

---

## Zero Page Variables

| Address | Name | Description |
|---------|------|-------------|
| $10-$11 | ptr | General-purpose pointer |
| $12 | frame_ctr_zp | Frame counter copy (for timing) |
| $14 | scroll_temp | Scroll temporary |
| $1F | state_flags | System state flags (bit 7 = busy) |
| $20-$22 | reg_save | Saved A/X/Y during IRQ |
| $23-$24 | irq_param | IRQ dispatch parameters |
| $26-$27 | brk_ptr | Pointer to BRK operand |
| $39 | ppu_mirror | PPU control mirror |
| $3C | unknown_3C | Used in map handler |
| $3E | unknown_3E | Used in movement update |
| $41 | unknown_41 | Used in map handler |
| $51 | unknown_51 | Bank number temp |
| $56 | unknown_56 | Used in map handler |
| $58 | unknown_58 | Bank save |
| $63 | MapNumber | Current map number |
| $64 | SubmapNumber | Current submap number |
| $67 | target_bank | Target bank for switch |
| $78 | temp | Temporary storage |
| $7B | scroll_x | Scroll X position |
| $7C | scroll_y | Scroll Y position |
| $7F | scroll_counter | Scroll counter |
| $EA-$EB | position_x | Player X position (16-bit) |
| $EC-$ED | position_y | Player Y position (16-bit) |

## Work RAM Variables ($0500-$07FF)

| Address | Name | Description |
|---------|------|-------------|
| $0500 | vblank_flag | VBlank synchronization flag |
| $0501 | ppuctrl_shadow | Shadow of PPUCTRL ($2000) |
| $0502-$0504 | NMI_vector | JMP instruction + target address |
| $0505 | ppuctrl_extra | Additional PPU control |
| $0506 | ppumask_shadow | Shadow of PPUMASK ($2001) |
| $0507 | current_bank | Currently selected PRG bank |
| $0508 | scroll_x_shadow | Scroll X shadow |
| $0509 | scroll_y_shadow | Scroll Y shadow |
| $050A | ppu_temp | PPU temporary |
| $050B | ppu_buffer_count | PPU buffer entry count |
| $050C | frame_counter | Frame counter (NMI increments) |
| $0513 | shuffle_index | OAM shuffle index |
| $0519 | nmi_skip_flag | NMI skip update flag |
| $0526 | timer_counter | Timer/counter (CBB4 adds 8) |
| $0529 | controller_state | Controller button state |
| $052E | input_delay | Input delay counter |
| $058F | movement_speed | Movement speed/delta |
| $05FC | palette_color | Palette color value |
| $07CA | bank_call_result | Bank call result storage |
| $07CC | bank_call_save | Bank call saved bank |

---

## Key Subroutines

### Fixed Bank Routines ($C000-$FFFF)

| Address | Name | Description |
|---------|------|-------------|
| $C03D | main_init | Main initialization |
| $C104 | init_subroutine | Additional init |
| $C118 | mmc1_write_control | MMC1 Control register write ($9FFF) |
| $C12F | mmc1_write_chr1 | MMC1 CHR Bank 1 write ($BFFF) |
| $C146 | mmc1_write_prg | MMC1 PRG Bank write ($DFFF) |
| $C15A | NMI_main | NMI handler |
| $C222 | ppu_buffer_transfer | Transfer PPU update buffer to VRAM |
| $C2EA | ppu_set_scroll | Set PPU scroll/control registers |
| $C303 | oam_dma | OAM DMA transfer |
| $C408 | IRQ_handler | IRQ/BRK handler |
| $C52F | clear_system_state | Clear system state variables |
| $C543 | clear_oam_buffer | Fill OAM buffer with $F7 (hide sprites) |
| $C913 | sub_C913 | Wrapper for OAM shuffle |
| $C91F | oam_shuffle | Shuffle OAM entries (flicker reduction) |
| $C968 | main_loop_entry | Main game loop entry point |
| $C97D | main_loop | Main game loop (infinite) |
| $C983 | setup_bank_trampoline | Copy bank switch code to SRAM |
| $C9ED | main_frame_handler | Main frame processing handler |

### Main Frame Handler Subroutines

The `main_frame_handler` ($C9ED) calls these in sequence:

| Address | Name | Description |
|---------|------|-------------|
| $CBB4 | sub_CBB4 | Timer/counter update ($0526 += 8) |
| $CB98 | read_controller | Read controller input via $4016 |
| $CA21 | sub_CA21 | Unknown processing |
| $D542 | map_handler | Map/scroll position handler |
| $E06E | movement_update | Update player position based on direction |

### Controller Reading ($CB98)

```asm
sub_CB98:
  LDA  $052E           ; Check delay counter
  BEQ  loc_CBA1
  DEC  $052E           ; Decrement delay
  RTS

loc_CBA1:
  LDX  #$01            ; Strobe controller
  STX  $4016
  DEX
  STX  $4016
  LDA  $4016           ; Read button state
  ORA  $0529           ; Combine with previous state
  STA  $0529
  RTS
```

### Movement Update ($E06E)

Reads direction from $7000 and updates position:
- Direction 0: Subtract from Y (move up)
- Direction 1: Add to X (move right)
- Direction 2: Add to Y (move down)
- Direction 3: Subtract from X (move left)

Position stored in:
- $EA-$EB: X position (16-bit)
- $EC-$ED: Y position (16-bit)
- $058F: Movement speed/delta

### High ROM Utilities ($FF00-$FFFF)

| Address | Name | Description |
|---------|------|-------------|
| $FF74 | wait_vblank | Wait for VBlank (frame sync) |
| $FF8E | jump_main_init | Jump to main_init |
| $FF91 | bank_switch | Bank switch routine |

---

## Save Data Structure ($6000-$7FFF)

See [game_data.json](../data/game_data.json) for detailed structure.

### Quick Reference
- **$6001-$60F0**: Party member data (8 characters × 30 bytes each)
- **$6157-$6159**: Gold (3 bytes, little-endian)
- **$615A**: Chapter number (0-4)
- **$615B**: Battle tactics setting
- **$625D-$6277**: Treasure chest flags (27 bytes)
- **$62A2**: Small Medals count
- **$62AD-$62AF**: Casino coins (3 bytes)
- **$62ED**: Day/Night counter

---

## Analysis Notes

### Mapper Mystery Resolved
The iNES header declares mapper 1 (MMC1), which matches the code. The serial write pattern (5 writes with LSR between) is characteristic of MMC1, not MMC3.

### Self-Modifying NMI
The NMI vector points to RAM ($0502) which contains a JMP instruction. This allows the game to change the NMI handler dynamically during execution (e.g., during title screen vs. gameplay).

### Extended Opcodes via BRK
The game uses BRK instructions as a form of extended opcode. The byte following BRK is read by the IRQ handler to determine what action to take. This is a space-saving technique.

### Next Steps
1. Disassemble loc_C968 (main game loop)
2. Trace bank switching to understand which banks contain what
3. Identify battle system entry points
4. Map menu and text system routines
