; ============================================================================
; Dragon Warrior IV - Bank 08 (Monster Data)
; ============================================================================
; ROM Offset: $20010-$24000 | CPU Address: $8000-$BFFF (when mapped)
; TODO: Disassemble actual bank contents - includes monster stats table
; ============================================================================

.org $8000

Bank08_Start:
	; Monster data placeholder

; Include generated monster data
.include "source_files/generated/data/monsters.asm"

.advance $C000, $FF
