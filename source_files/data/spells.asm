; ============================================================================
; Dragon Warrior IV - Spell Data
; ============================================================================
; Generated from spells.json by json_to_asm.py
; ============================================================================

; Spell data structure (8 bytes per entry):
;   Offset  Size  Description
;   $00     1     MP cost
;   $01     1     Effect type
;   $02     1     Power/healing amount
;   $03     1     Target type
;   $04     1     Element
;   $05     1     Accuracy
;   $06     2     Flags

.segment "PRG_BANK_08"

; Spell count
SPELL_COUNT = 50

; Spell data table
spell_data_table:

spell_000:
	.byte $4a			; MP cost
	.byte $15			; Effect type
	.byte $c8			; Power
	.byte $10			; Target type
	.byte $07			; Element
	.byte $03			; Accuracy
	.word $0202		; Flags

spell_001:
	.byte $01			; MP cost
	.byte $03			; Effect type
	.byte $03			; Power
	.byte $42			; Target type
	.byte $25			; Element
	.byte $c0			; Accuracy
	.word $2021		; Flags

spell_002:
	.byte $51			; MP cost
	.byte $2c			; Effect type
	.byte $14			; Power
	.byte $10			; Target type
	.byte $00			; Element
	.byte $e0			; Accuracy
	.word $1063		; Flags

spell_003:
	.byte $73			; MP cost
	.byte $3f			; Effect type
	.byte $1f			; Power
	.byte $1c			; Target type
	.byte $fb			; Element
	.byte $fb			; Accuracy
	.word $1f42		; Flags

spell_004:
	.byte $35			; MP cost
	.byte $c0			; Effect type
	.byte $30			; Power
	.byte $23			; Target type
	.byte $98			; Element
	.byte $67			; Accuracy
	.word $0602		; Flags

spell_005:
	.byte $04			; MP cost
	.byte $04			; Effect type
	.byte $00			; Power
	.byte $3f			; Target type
	.byte $f8			; Element
	.byte $67			; Accuracy
	.word $060a		; Flags

spell_006:
	.byte $15			; MP cost
	.byte $15			; Effect type
	.byte $12			; Power
	.byte $4a			; Target type
	.byte $45			; Element
	.byte $c8			; Accuracy
	.word $40f0		; Flags

spell_007:
	.byte $7f			; MP cost
	.byte $03			; Effect type
	.byte $17			; Power
	.byte $13			; Target type
	.byte $14			; Element
	.byte $17			; Accuracy
	.word $1717		; Flags

spell_008:
	.byte $0c			; MP cost
	.byte $03			; Effect type
	.byte $07			; Power
	.byte $03			; Target type
	.byte $4a			; Element
	.byte $55			; Accuracy
	.word $c850		; Flags

spell_009:
	.byte $00			; MP cost
	.byte $ff			; Effect type
	.byte $17			; Power
	.byte $17			; Target type
	.byte $0b			; Element
	.byte $0b			; Accuracy
	.word $0b06		; Flags

spell_010:
	.byte $06			; MP cost
	.byte $05			; Effect type
	.byte $4a			; Power
	.byte $65			; Target type
	.byte $c8			; Element
	.byte $60			; Accuracy
	.word $01ff		; Flags

spell_011:
	.byte $03			; MP cost
	.byte $03			; Effect type
	.byte $07			; Power
	.byte $07			; Target type
	.byte $08			; Element
	.byte $07			; Accuracy
	.word $18e7		; Flags

spell_012:
	.byte $e7			; MP cost
	.byte $4a			; Effect type
	.byte $75			; Power
	.byte $c8			; Target type
	.byte $70			; Element
	.byte $e0			; Accuracy
	.word $c03f		; Flags

spell_013:
	.byte $0c			; MP cost
	.byte $bf			; Effect type
	.byte $67			; Power
	.byte $1c			; Target type
	.byte $4a			; Element
	.byte $24			; Accuracy
	.word $c821		; Flags

spell_014:
	.byte $3f			; MP cost
	.byte $3f			; Effect type
	.byte $90			; Power
	.byte $08			; Target type
	.byte $10			; Element
	.byte $60			; Accuracy
	.word $869c		; Flags

spell_015:
	.byte $90			; MP cost
	.byte $38			; Effect type
	.byte $f0			; Power
	.byte $e0			; Target type
	.byte $80			; Element
	.byte $80			; Accuracy
	.word $4a34		; Flags

spell_016:
	.byte $c8			; MP cost
	.byte $31			; Effect type
	.byte $18			; Power
	.byte $ff			; Target type
	.byte $3c			; Element
	.byte $78			; Accuracy
	.word $3818		; Flags

spell_017:
	.byte $28			; MP cost
	.byte $68			; Effect type
	.byte $68			; Power
	.byte $a8			; Target type
	.byte $80			; Element
	.byte $80			; Accuracy
	.word $4a44		; Flags

spell_018:
	.byte $c8			; MP cost
	.byte $41			; Effect type
	.byte $00			; Power
	.byte $ff			; Target type
	.byte $b4			; Element
	.byte $54			; Accuracy
	.word $5657		; Flags

spell_019:
	.byte $5b			; MP cost
	.byte $6b			; Effect type
	.byte $6b			; Power
	.byte $6d			; Target type
	.byte $4a			; Element
	.byte $54			; Accuracy
	.word $c851		; Flags

spell_020:
	.byte $00			; MP cost
	.byte $ff			; Effect type
	.byte $ad			; Power
	.byte $b6			; Target type
	.byte $b7			; Element
	.byte $b7			; Accuracy
	.word $57db		; Flags

spell_021:
	.byte $db			; MP cost
	.byte $db			; Effect type
	.byte $4a			; Power
	.byte $64			; Target type
	.byte $c8			; Element
	.byte $61			; Accuracy
	.word $01ff		; Flags

spell_022:
	.byte $dd			; MP cost
	.byte $dd			; Effect type
	.byte $ee			; Power
	.byte $ef			; Target type
	.byte $f7			; Element
	.byte $f7			; Accuracy
	.word $7b9d		; Flags

spell_023:
	.byte $80			; MP cost
	.byte $4a			; Effect type
	.byte $74			; Power
	.byte $c8			; Target type
	.byte $71			; Element
	.byte $c0			; Accuracy
	.word $c086		; Flags

spell_024:
	.byte $01			; MP cost
	.byte $e0			; Effect type
	.byte $80			; Power
	.byte $4a			; Target type
	.byte $23			; Element
	.byte $c8			; Accuracy
	.word $2207		; Flags

spell_025:
	.byte $07			; MP cost
	.byte $03			; Effect type
	.byte $0d			; Power
	.byte $1a			; Target type
	.byte $03			; Element
	.byte $0d			; Accuracy
	.word $1842		; Flags

spell_026:
	.byte $33			; MP cost
	.byte $c0			; Effect type
	.byte $32			; Power
	.byte $55			; Target type
	.byte $d2			; Element
	.byte $af			; Accuracy
	.word $5550		; Flags

spell_027:
	.byte $20			; MP cost
	.byte $34			; Effect type
	.byte $44			; Power
	.byte $50			; Target type
	.byte $d0			; Element
	.byte $af			; Accuracy
	.word $5552		; Flags

spell_028:
	.byte $25			; MP cost
	.byte $16			; Effect type
	.byte $05			; Power
	.byte $4a			; Target type
	.byte $43			; Element
	.byte $c8			; Accuracy
	.word $42c0		; Flags

spell_029:
	.byte $c7			; MP cost
	.byte $4a			; Effect type
	.byte $31			; Power
	.byte $80			; Target type
	.byte $81			; Element
	.byte $c0			; Accuracy
	.word $0201		; Flags

spell_030:
	.byte $42			; MP cost
	.byte $53			; Effect type
	.byte $c0			; Power
	.byte $52			; Target type
	.byte $e0			; Element
	.byte $f0			; Accuracy
	.word $30c0		; Flags

spell_031:
	.byte $78			; MP cost
	.byte $7c			; Effect type
	.byte $be			; Power
	.byte $bf			; Target type
	.byte $01			; Element
	.byte $03			; Accuracy
	.word $0707		; Flags

spell_032:
	.byte $03			; MP cost
	.byte $01			; Effect type
	.byte $00			; Power
	.byte $00			; Target type
	.byte $4a			; Element
	.byte $63			; Accuracy
	.word $c862		; Flags

spell_033:
	.byte $00			; MP cost
	.byte $ff			; Effect type
	.byte $df			; Power
	.byte $e7			; Target type
	.byte $f8			; Element
	.byte $3f			; Accuracy
	.word $cff0		; Flags

spell_034:
	.byte $ff			; MP cost
	.byte $ff			; Effect type
	.byte $4a			; Power
	.byte $73			; Target type
	.byte $c8			; Element
	.byte $72			; Accuracy
	.word $00e0		; Flags

spell_035:
	.byte $7f			; MP cost
	.byte $9f			; Effect type
	.byte $03			; Power
	.byte $0a			; Target type
	.byte $18			; Element
	.byte $05			; Accuracy
	.word $8810		; Flags

spell_036:
	.byte $05			; MP cost
	.byte $3f			; Effect type
	.byte $1f			; Power
	.byte $0f			; Target type
	.byte $0f			; Element
	.byte $0f			; Accuracy
	.word $0737		; Flags

spell_037:
	.byte $1f			; MP cost
	.byte $10			; Effect type
	.byte $10			; Power
	.byte $10			; Target type
	.byte $38			; Element
	.byte $c8			; Accuracy
	.word $8914		; Flags

spell_038:
	.byte $0d			; MP cost
	.byte $7e			; Effect type
	.byte $f7			; Power
	.byte $3b			; Target type
	.byte $bd			; Element
	.byte $bd			; Accuracy
	.word $81ff		; Flags

spell_039:
	.byte $c3			; MP cost
	.byte $81			; Effect type
	.byte $81			; Power
	.byte $42			; Target type
	.byte $42			; Element
	.byte $81			; Accuracy
	.word $0000		; Flags

spell_040:
	.byte $0a			; MP cost
	.byte $1c			; Effect type
	.byte $0d			; Power
	.byte $88			; Target type
	.byte $0c			; Element
	.byte $0d			; Accuracy
	.word $c7ff		; Flags

spell_041:
	.byte $0f			; MP cost
	.byte $1f			; Effect type
	.byte $1f			; Power
	.byte $0f			; Target type
	.byte $0f			; Element
	.byte $06			; Accuracy
	.word $0503		; Flags

spell_042:
	.byte $10			; MP cost
	.byte $20			; Effect type
	.byte $01			; Power
	.byte $02			; Target type
	.byte $04			; Element
	.byte $0a			; Accuracy
	.word $1c15		; Flags

spell_043:
	.byte $88			; MP cost
	.byte $0c			; Effect type
	.byte $15			; Power
	.byte $7f			; Target type
	.byte $e3			; Element
	.byte $07			; Accuracy
	.word $0208		; Flags

spell_044:
	.byte $10			; MP cost
	.byte $10			; Effect type
	.byte $08			; Power
	.byte $10			; Target type
	.byte $10			; Element
	.byte $20			; Accuracy
	.word $2020		; Flags

spell_045:
	.byte $20			; MP cost
	.byte $02			; Effect type
	.byte $1c			; Power
	.byte $1d			; Target type
	.byte $80			; Element
	.byte $0c			; Accuracy
	.word $1d18		; Flags

spell_046:
	.byte $18			; MP cost
	.byte $18			; Effect type
	.byte $08			; Power
	.byte $0c			; Target type
	.byte $07			; Element
	.byte $01			; Accuracy
	.word $0020		; Flags

spell_047:
	.byte $20			; MP cost
	.byte $20			; Effect type
	.byte $10			; Power
	.byte $10			; Target type
	.byte $08			; Element
	.byte $06			; Accuracy
	.word $0188		; Flags

spell_048:
	.byte $14			; MP cost
	.byte $1d			; Effect type
	.byte $01			; Power
	.byte $0f			; Target type
	.byte $c3			; Element
	.byte $e7			; Accuracy
	.word $ff3c		; Flags

spell_049:
	.byte $c3			; MP cost
	.byte $0b			; Effect type
	.byte $18			; Power
	.byte $25			; Target type
	.byte $89			; Element
	.byte $10			; Accuracy
	.word $250c		; Flags

; ============================================================================
; End of spell data
; ============================================================================