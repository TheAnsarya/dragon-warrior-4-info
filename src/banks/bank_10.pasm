; ============================================================================
; Dragon Warrior IV - Bank $10 (PRG ROM $40000-$43fff)
; 🌷 Flower Toolchain
; ============================================================================
; Graphics data - character/NPC sprites
; ============================================================================

; Bank offset in ROM file (after 16-byte iNES header)
; File offset: $40010 - $4400f (16,384 bytes)
; CPU address: $8000-$BFFF when swapped in

; ============================================================================
; Bank $10 Overview
; ============================================================================
; Purpose: Graphics data - character/NPC sprites
;
; This bank is swapped into the $8000-$BFFF address range via the MMC3
; mapper when needed. The fixed bank ($C000-$FFFF) contains the core
; engine and can call into this bank's routines.
;
; TODO: Disassemble this bank from the original ROM using Peony.
; ============================================================================

; ============================================================================
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

; ============================================================================
; End of Bank
; ============================================================================
