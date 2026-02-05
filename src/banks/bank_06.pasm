; ============================================================================
; Dragon Warrior IV - Bank $06 (PRG ROM $18000-$1bfff)
; 🌷 Flower Toolchain
; ============================================================================
; Dialog engine, text display, DTE decompression
; ============================================================================

; Bank offset in ROM file (after 16-byte iNES header)
; File offset: $18010 - $1c00f (16,384 bytes)
; CPU address: $8000-$BFFF when swapped in

; ============================================================================
; Bank $06 Overview
; ============================================================================
; Purpose: Dialog engine, text display, DTE decompression
;
; This bank is swapped into the $8000-$BFFF address range via the MMC3
; mapper when needed. The fixed bank ($C000-$FFFF) contains the core
; engine and can call into this bank's routines.
;
; TODO: Disassemble this bank from the original ROM using Peony.
; ============================================================================

; ============================================================================
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

; ============================================================================
; End of Bank
; ============================================================================
