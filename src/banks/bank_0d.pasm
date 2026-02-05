; ============================================================================
; Dragon Warrior IV - Bank $0d (PRG ROM $34000-$37fff)
; 🌷 Flower Toolchain
; ============================================================================
; Map data bank 3 - Chapter 5 maps (world map)
; ============================================================================

; Bank offset in ROM file (after 16-byte iNES header)
; File offset: $34010 - $3800f (16,384 bytes)
; CPU address: $8000-$BFFF when swapped in

; ============================================================================
; Bank $0d Overview
; ============================================================================
; Purpose: Map data bank 3 - Chapter 5 maps (world map)
;
; This bank is swapped into the $8000-$BFFF address range via the MMC3
; mapper when needed. The fixed bank ($C000-$FFFF) contains the core
; engine and can call into this bank's routines.
;
; TODO: Disassemble this bank from the original ROM using Peony.
; ============================================================================

; ============================================================================
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

; ============================================================================
; End of Bank
; ============================================================================
