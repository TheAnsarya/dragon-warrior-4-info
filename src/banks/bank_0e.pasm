; ============================================================================
; Dragon Warrior IV - Bank $0e (PRG ROM $38000-$3bfff)
; 🌷 Flower Toolchain
; ============================================================================
; Audio engine, music data (NSF)
; ============================================================================

; Bank offset in ROM file (after 16-byte iNES header)
; File offset: $38010 - $3c00f (16,384 bytes)
; CPU address: $8000-$BFFF when swapped in

; ============================================================================
; Bank $0e Overview
; ============================================================================
; Purpose: Audio engine, music data (NSF)
;
; This bank is swapped into the $8000-$BFFF address range via the MMC3
; mapper when needed. The fixed bank ($C000-$FFFF) contains the core
; engine and can call into this bank's routines.
;
; TODO: Disassemble this bank from the original ROM using Peony.
; ============================================================================

; ============================================================================
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

; ============================================================================
; End of Bank
; ============================================================================
