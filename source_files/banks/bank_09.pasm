; ============================================================================
; Dragon Warrior IV - Bank 09 (Item/Spell Data)
; ============================================================================
; ROM Offset: $24010-$28000 | CPU Address: $8000-$bfff (when mapped)
; TODO: Disassemble actual bank contents - includes item and spell tables
; ============================================================================

.org $8000

Bank09_Start:
	; Item/Spell data placeholder

; Include generated data
.include "source_files/generated/data/items.asm"
.include "source_files/generated/data/spells.asm"

.org $c000, $ff

