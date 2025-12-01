; ============================================================================
; Dragon Warrior IV (NES) - Complete Disassembly
; Main Assembly File
; ============================================================================
;
; This is the main entry point for assembling the Dragon Warrior IV ROM.
; The original ROM is:
;   Dragon Warrior IV (1992-10)(Enix)(US).nes
;   MD5: a5a781e5ae7c75765969eba2beb4e27f
;
; Assembler: Ophis
; Build: powershell -File build.ps1
;
; ============================================================================

; ----------------------------------------------------------------------------
; Include Files
; ----------------------------------------------------------------------------

.include "source_files/defines.asm"
.include "source_files/macros.asm"
.include "source_files/memory.asm"

; ----------------------------------------------------------------------------
; iNES Header
; ----------------------------------------------------------------------------
; Header format for NES 2.0 compatible emulators

.byte "NES", $1A			; Magic number
.byte $10					; PRG ROM size: 16 * 16KB = 256KB
.byte $10					; CHR ROM size: 16 * 8KB = 128KB
.byte %01000010				; Flags 6: Vertical mirroring, battery, mapper low nibble (4)
.byte %01000000				; Flags 7: Mapper high nibble (4) = MMC3
.byte $00					; PRG RAM size
.byte $00					; Flags 9: NTSC
.byte $00					; Flags 10: No special TV system
.byte $00, $00, $00, $00, $00	; Padding

; ----------------------------------------------------------------------------
; PRG ROM Banks
; ----------------------------------------------------------------------------

; Bank 00 - Main Game Engine
.include "source_files/banks/bank_00.asm"

; Bank 01 - Battle System
.include "source_files/banks/bank_01.asm"

; Bank 02 - Menu Systems
.include "source_files/banks/bank_02.asm"

; Bank 03 - Field/Map Engine
.include "source_files/banks/bank_03.asm"

; Bank 04 - Chapter 1 (Ragnar)
.include "source_files/banks/bank_04.asm"

; Bank 05 - Chapter 2 (Alena)
.include "source_files/banks/bank_05.asm"

; Bank 06 - Chapter 3 (Taloon)
.include "source_files/banks/bank_06.asm"

; Bank 07 - Chapter 4 (Nara/Mara)
.include "source_files/banks/bank_07.asm"

; Bank 08 - Monster Data
.include "source_files/banks/bank_08.asm"

; Bank 09 - Item/Spell Data
.include "source_files/banks/bank_09.asm"

; Bank 10 - Map Data
.include "source_files/banks/bank_10.asm"

; Bank 11 - NPC Data
.include "source_files/banks/bank_11.asm"

; Bank 12 - Dialog Text (Part 1)
.include "source_files/banks/bank_12.asm"

; Bank 13 - Dialog Text (Part 2)
.include "source_files/banks/bank_13.asm"

; Bank 14 - Dialog Text (Part 3)
.include "source_files/banks/bank_14.asm"

; Bank 15 - Fixed Bank (Vectors, Init, Core Routines)
.include "source_files/banks/bank_15.asm"

; ----------------------------------------------------------------------------
; CHR ROM Banks
; ----------------------------------------------------------------------------

; CHR Bank 00-15 - Graphics Data
.include "source_files/chr/chr_banks.asm"

; ============================================================================
; End of main.asm
; ============================================================================
