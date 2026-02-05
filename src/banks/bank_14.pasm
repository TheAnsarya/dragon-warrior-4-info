; ============================================================================
; Dragon Warrior IV - Bank $14 (PRG ROM $50000-$53fff)
; 🌷 Flower Toolchain
; ============================================================================
; Text data - Chapter 3 dialog strings
; ============================================================================

; Bank offset in ROM file (after 16-byte iNES header)
; File offset: $50010 - $5400f (16,384 bytes)
; CPU address: $8000-$BFFF when swapped in

; ============================================================================
; Bank $14 Overview
; ============================================================================
; Purpose: Text data - Chapter 3 dialog strings
;
; This bank is swapped into the $8000-$BFFF address range via the MMC3
; mapper when needed. The fixed bank ($C000-$FFFF) contains the core
; engine and can call into this bank's routines.
;
; TODO: Disassemble this bank from the original ROM using Peony.
; ============================================================================

; ============================================================================
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

; ============================================================================
; End of Bank
; ============================================================================
