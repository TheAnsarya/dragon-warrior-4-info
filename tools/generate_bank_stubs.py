#!/usr/bin/env python3
"""
Generate bank stub files for Dragon Warrior IV disassembly.
🌷 Flower Toolchain

This script creates placeholder bank files for the Poppy assembler.
Each bank file contains a header describing its ROM offset and purpose.
"""

import os
from pathlib import Path

# Bank descriptions based on DW4 ROM analysis
BANK_DESCRIPTIONS = {
    0x00: "Core game engine, reset handler, main loop, NMI/IRQ handlers",
    0x01: "Map engine, overworld logic, tile collision, NPC movement",
    0x02: "Battle engine - core combat routines and turn order",
    0x03: "Battle engine - damage calculation, spell effects",
    0x04: "Battle graphics, animations, enemy sprites",
    0x05: "Menu system, status screens, inventory display",
    0x06: "Dialog engine, text display, DTE decompression",
    0x07: "Text data - Chapter 1 & 2 dialog strings",
    0x08: "Monster data bank - stats, AI patterns, drops",
    0x09: "Item/Spell/Shop data bank - game mechanics data",
    0x0a: "Character data, level-up tables, stat growth",
    0x0b: "Map data bank 1 - Chapter 1 & 2 maps",
    0x0c: "Map data bank 2 - Chapter 3 & 4 maps",
    0x0d: "Map data bank 3 - Chapter 5 maps (world map)",
    0x0e: "Audio engine, music data (NSF)",
    0x0f: "Sound effects, audio samples",
    0x10: "Graphics data - character/NPC sprites",
    0x11: "Graphics data - background tilesets 1",
    0x12: "Graphics data - background tilesets 2",
    0x13: "Graphics data - battle backgrounds",
    0x14: "Text data - Chapter 3 dialog strings",
    0x15: "Text data - Chapter 4 dialog strings",
    0x16: "Text data - Chapter 5 dialog strings",
    0x17: "Item/monster name strings",
    0x18: "Cutscene scripts, event data",
    0x19: "Chapter-specific routines (Chapter 1)",
    0x1a: "Chapter-specific routines (Chapter 2)",
    0x1b: "Chapter-specific routines (Chapter 3)",
    0x1c: "Chapter-specific routines (Chapter 4)",
    0x1d: "Chapter-specific routines (Chapter 5)",
    0x1e: "Fixed bank 1 - commonly used subroutines",
    0x1f: "Fixed bank 2 - interrupt handlers, vectors",
}

def generate_bank_file(bank_num: int, output_dir: Path) -> None:
    """Generate a single bank stub file."""
    
    rom_offset_start = bank_num * 0x4000 + 0x10  # After iNES header
    rom_offset_end = rom_offset_start + 0x3fff
    
    description = BANK_DESCRIPTIONS.get(bank_num, "Unknown/Reserved")
    
    # Skip banks we've already created manually
    if bank_num in [0x00, 0x01, 0x08, 0x09]:
        print(f"  Skipping bank ${bank_num:02x} (already exists)")
        return
    
    content = f"""; ============================================================================
; Dragon Warrior IV - Bank ${bank_num:02x} (PRG ROM ${bank_num * 0x4000:05x}-${bank_num * 0x4000 + 0x3fff:05x})
; 🌷 Flower Toolchain
; ============================================================================
; {description}
; ============================================================================

; Bank offset in ROM file (after 16-byte iNES header)
; File offset: ${rom_offset_start:05x} - ${rom_offset_end:05x} (16,384 bytes)
; CPU address: $8000-$BFFF when swapped in

; ============================================================================
; Bank ${bank_num:02x} Overview
; ============================================================================
; Purpose: {description}
;
; This bank is swapped into the $8000-$BFFF address range via the MMC3
; mapper when needed. The fixed bank ($C000-$FFFF) contains the core
; engine and can call into this bank's routines.
;
; TODO: Disassemble this bank from the original ROM using Peony.
; ============================================================================

"""
    
    # Add bank-specific content templates
    if bank_num in [0x02, 0x03]:
        content += """; ============================================================================
; Battle System Routines
; ============================================================================
; This bank contains battle engine code.
;
; Key routines to identify:
;   - Turn order calculation (based on agility)
;   - Damage formula implementation
;   - Critical hit determination
;   - Spell effect processing
;   - Experience/gold reward calculation
; ============================================================================

; TODO: Disassemble battle routines

; Placeholder label for battle entry point
battle_bank_entry:
    rts

"""
    elif bank_num in [0x07, 0x14, 0x15, 0x16, 0x17]:
        content += """; ============================================================================
; Text Data
; ============================================================================
; This bank contains compressed text strings for dialog and messages.
;
; DW4 uses DTE (Dual Tile Encoding) compression where certain byte values
; represent common 2-letter combinations (th, he, in, etc.)
;
; Text format:
;   - Strings are terminated with $FF
;   - Control codes for line breaks, pauses, names, etc.
;   - Text table (.tbl) file needed for decoding
; ============================================================================

; TODO: Extract and decode text using text extraction tools

; Text pointer table (will be filled by extraction)
text_ptr_table:
    .fill 512        ; Placeholder for text pointers

; Text data (will be filled by extraction)
text_data:
    .fill 15000      ; Placeholder for compressed text

"""
    elif bank_num in [0x0b, 0x0c, 0x0d]:
        content += """; ============================================================================
; Map Data
; ============================================================================
; This bank contains map tile data, event definitions, and warp points.
;
; Map format:
;   - Header: width, height, tileset, music, etc.
;   - Tile data: RLE compressed
;   - NPC list: positions, sprites, scripts
;   - Event list: warps, treasure, doors
; ============================================================================

; TODO: Extract map data

; Map header pointer table
map_header_ptrs:
    .fill 146        ; 73 maps × 2 bytes

; Map data (will be filled by extraction)
map_data:
    .fill 14000      ; Placeholder

"""
    elif bank_num in [0x10, 0x11, 0x12, 0x13]:
        content += """; ============================================================================
; Graphics Data
; ============================================================================
; This bank contains CHR (character/tile) data in NES 2bpp format.
;
; Format: 8 bytes for low bitplane + 8 bytes for high bitplane = 16 bytes/tile
; Each tile is 8x8 pixels with 4 colors (from palette).
;
; This data is typically loaded into CHR-RAM by the game engine.
; ============================================================================

; TODO: Extract and convert graphics to PNG for editing

; Graphics data (placeholder)
chr_data:
    .fill 16384      ; Full bank of CHR data

"""
    elif bank_num == 0x0e:
        content += """; ============================================================================
; Audio Engine
; ============================================================================
; This bank contains the music driver and song data.
;
; DW4 uses a custom audio engine with:
;   - 2 pulse channels (melody, harmony)
;   - 1 triangle channel (bass)
;   - 1 noise channel (percussion)
;   - DPCM samples (optional)
;
; Songs are defined as sequences of notes, durations, and effects.
; ============================================================================

; TODO: Extract audio data and document format

; Audio driver entry point
audio_init:
    rts

audio_update:
    rts

audio_play_music:
    rts

audio_play_sfx:
    rts

; Song pointer table
song_ptrs:
    .fill 64         ; 32 songs × 2 bytes

; Song data (placeholder)
song_data:
    .fill 14000

"""
    elif bank_num in [0x19, 0x1a, 0x1b, 0x1c, 0x1d]:
        chapter = bank_num - 0x18
        content += f"""; ============================================================================
; Chapter {chapter} Specific Code
; ============================================================================
; This bank contains routines and data unique to Chapter {chapter}.
;
; Chapters in DW4:
;   Chapter 1: Ragnar's Quest
;   Chapter 2: Alena's Adventure
;   Chapter 3: Taloon's Saga
;   Chapter 4: Sisters' Tale
;   Chapter 5: Hero's Journey (main game)
;
; Chapter-specific content includes:
;   - Unique events and cutscenes
;   - Chapter boss battles
;   - Special items and mechanics
; ============================================================================

; TODO: Disassemble chapter-specific routines

; Chapter entry point
chapter_{chapter}_init:
    rts

chapter_{chapter}_update:
    rts

"""
    else:
        content += """; ============================================================================
; Bank Contents
; ============================================================================
; TODO: Analyze and document this bank's contents.
;
; Steps to disassemble:
;   1. Run Peony on the original ROM to generate initial disassembly
;   2. Identify code vs data regions using CDL from emulator
;   3. Label subroutines and document their purposes
;   4. Add comments explaining the game logic
; ============================================================================

; Placeholder
bank_entry:
    rts

"""

    content += """; ============================================================================
; End of Bank
; ============================================================================
"""
    
    # Write file
    output_file = output_dir / f"bank_{bank_num:02x}.pasm"
    with open(output_file, 'w', encoding='utf-8-sig', newline='\r\n') as f:
        f.write(content)
    
    print(f"  Created bank ${bank_num:02x}: {output_file.name}")


def main():
    """Generate all bank stub files."""
    
    # Get output directory
    script_dir = Path(__file__).parent
    project_dir = script_dir.parent
    banks_dir = project_dir / "src" / "banks"
    
    # Create banks directory if needed
    banks_dir.mkdir(parents=True, exist_ok=True)
    
    print("Generating bank stub files for Dragon Warrior IV...")
    print(f"Output directory: {banks_dir}")
    print()
    
    # Generate all 32 banks (00-1F for 512KB PRG ROM, but DW4 is 256KB = 16 banks)
    # DW4 has 16 banks (0x00-0x0F) in 256KB PRG ROM
    # Actually with MMC3, it can address more - let's do 32 banks
    for bank_num in range(0x20):  # Banks $00-$1F
        generate_bank_file(bank_num, banks_dir)
    
    print()
    print(f"Generated stub files for 32 banks.")
    print("Next steps:")
    print("  1. Use Peony to disassemble the original ROM")
    print("  2. Replace placeholders with actual disassembly")
    print("  3. Add comments and labels")
    print("  4. Verify roundtrip: Poppy build → identical ROM")


if __name__ == "__main__":
    main()
