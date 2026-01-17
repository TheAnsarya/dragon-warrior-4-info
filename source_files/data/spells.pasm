; ============================================================================
; Dragon Warrior IV - Spell Data
; ============================================================================
; Generated from spells.json by json_to_asm.py
; ============================================================================

; Spell data structure (8 bytes per entry):
;   Offset  Size  Description
;   $00	 1	 MP cost
;   $01	 1	 Effect type
;   $02	 1	 Power/healing amount
;   $03	 1	 Target type
;   $04	 1	 Element
;   $05	 1	 Accuracy
;   $06	 2	 Flags

.segment "PRG_BANK_08"

; Spell count
SPELL_COUNT = 50

; Spell data table
spell_data_table:

spell_000:
	.db $4a			; MP cost
	.db $15			; Effect type
	.db $c8			; Power
	.db $10			; Target type
	.db $07			; Element
	.db $03			; Accuracy
	.dw $0202		; Flags

spell_001:
	.db $01			; MP cost
	.db $03			; Effect type
	.db $03			; Power
	.db $42			; Target type
	.db $25			; Element
	.db $c0			; Accuracy
	.dw $2021		; Flags

spell_002:
	.db $51			; MP cost
	.db $2c			; Effect type
	.db $14			; Power
	.db $10			; Target type
	.db $00			; Element
	.db $e0			; Accuracy
	.dw $1063		; Flags

spell_003:
	.db $73			; MP cost
	.db $3f			; Effect type
	.db $1f			; Power
	.db $1c			; Target type
	.db $fb			; Element
	.db $fb			; Accuracy
	.dw $1f42		; Flags

spell_004:
	.db $35			; MP cost
	.db $c0			; Effect type
	.db $30			; Power
	.db $23			; Target type
	.db $98			; Element
	.db $67			; Accuracy
	.dw $0602		; Flags

spell_005:
	.db $04			; MP cost
	.db $04			; Effect type
	.db $00			; Power
	.db $3f			; Target type
	.db $f8			; Element
	.db $67			; Accuracy
	.dw $060a		; Flags

spell_006:
	.db $15			; MP cost
	.db $15			; Effect type
	.db $12			; Power
	.db $4a			; Target type
	.db $45			; Element
	.db $c8			; Accuracy
	.dw $40f0		; Flags

spell_007:
	.db $7f			; MP cost
	.db $03			; Effect type
	.db $17			; Power
	.db $13			; Target type
	.db $14			; Element
	.db $17			; Accuracy
	.dw $1717		; Flags

spell_008:
	.db $0c			; MP cost
	.db $03			; Effect type
	.db $07			; Power
	.db $03			; Target type
	.db $4a			; Element
	.db $55			; Accuracy
	.dw $c850		; Flags

spell_009:
	.db $00			; MP cost
	.db $ff			; Effect type
	.db $17			; Power
	.db $17			; Target type
	.db $0b			; Element
	.db $0b			; Accuracy
	.dw $0b06		; Flags

spell_010:
	.db $06			; MP cost
	.db $05			; Effect type
	.db $4a			; Power
	.db $65			; Target type
	.db $c8			; Element
	.db $60			; Accuracy
	.dw $01ff		; Flags

spell_011:
	.db $03			; MP cost
	.db $03			; Effect type
	.db $07			; Power
	.db $07			; Target type
	.db $08			; Element
	.db $07			; Accuracy
	.dw $18e7		; Flags

spell_012:
	.db $e7			; MP cost
	.db $4a			; Effect type
	.db $75			; Power
	.db $c8			; Target type
	.db $70			; Element
	.db $e0			; Accuracy
	.dw $c03f		; Flags

spell_013:
	.db $0c			; MP cost
	.db $bf			; Effect type
	.db $67			; Power
	.db $1c			; Target type
	.db $4a			; Element
	.db $24			; Accuracy
	.dw $c821		; Flags

spell_014:
	.db $3f			; MP cost
	.db $3f			; Effect type
	.db $90			; Power
	.db $08			; Target type
	.db $10			; Element
	.db $60			; Accuracy
	.dw $869c		; Flags

spell_015:
	.db $90			; MP cost
	.db $38			; Effect type
	.db $f0			; Power
	.db $e0			; Target type
	.db $80			; Element
	.db $80			; Accuracy
	.dw $4a34		; Flags

spell_016:
	.db $c8			; MP cost
	.db $31			; Effect type
	.db $18			; Power
	.db $ff			; Target type
	.db $3c			; Element
	.db $78			; Accuracy
	.dw $3818		; Flags

spell_017:
	.db $28			; MP cost
	.db $68			; Effect type
	.db $68			; Power
	.db $a8			; Target type
	.db $80			; Element
	.db $80			; Accuracy
	.dw $4a44		; Flags

spell_018:
	.db $c8			; MP cost
	.db $41			; Effect type
	.db $00			; Power
	.db $ff			; Target type
	.db $b4			; Element
	.db $54			; Accuracy
	.dw $5657		; Flags

spell_019:
	.db $5b			; MP cost
	.db $6b			; Effect type
	.db $6b			; Power
	.db $6d			; Target type
	.db $4a			; Element
	.db $54			; Accuracy
	.dw $c851		; Flags

spell_020:
	.db $00			; MP cost
	.db $ff			; Effect type
	.db $ad			; Power
	.db $b6			; Target type
	.db $b7			; Element
	.db $b7			; Accuracy
	.dw $57db		; Flags

spell_021:
	.db $db			; MP cost
	.db $db			; Effect type
	.db $4a			; Power
	.db $64			; Target type
	.db $c8			; Element
	.db $61			; Accuracy
	.dw $01ff		; Flags

spell_022:
	.db $dd			; MP cost
	.db $dd			; Effect type
	.db $ee			; Power
	.db $ef			; Target type
	.db $f7			; Element
	.db $f7			; Accuracy
	.dw $7b9d		; Flags

spell_023:
	.db $80			; MP cost
	.db $4a			; Effect type
	.db $74			; Power
	.db $c8			; Target type
	.db $71			; Element
	.db $c0			; Accuracy
	.dw $c086		; Flags

spell_024:
	.db $01			; MP cost
	.db $e0			; Effect type
	.db $80			; Power
	.db $4a			; Target type
	.db $23			; Element
	.db $c8			; Accuracy
	.dw $2207		; Flags

spell_025:
	.db $07			; MP cost
	.db $03			; Effect type
	.db $0d			; Power
	.db $1a			; Target type
	.db $03			; Element
	.db $0d			; Accuracy
	.dw $1842		; Flags

spell_026:
	.db $33			; MP cost
	.db $c0			; Effect type
	.db $32			; Power
	.db $55			; Target type
	.db $d2			; Element
	.db $af			; Accuracy
	.dw $5550		; Flags

spell_027:
	.db $20			; MP cost
	.db $34			; Effect type
	.db $44			; Power
	.db $50			; Target type
	.db $d0			; Element
	.db $af			; Accuracy
	.dw $5552		; Flags

spell_028:
	.db $25			; MP cost
	.db $16			; Effect type
	.db $05			; Power
	.db $4a			; Target type
	.db $43			; Element
	.db $c8			; Accuracy
	.dw $42c0		; Flags

spell_029:
	.db $c7			; MP cost
	.db $4a			; Effect type
	.db $31			; Power
	.db $80			; Target type
	.db $81			; Element
	.db $c0			; Accuracy
	.dw $0201		; Flags

spell_030:
	.db $42			; MP cost
	.db $53			; Effect type
	.db $c0			; Power
	.db $52			; Target type
	.db $e0			; Element
	.db $f0			; Accuracy
	.dw $30c0		; Flags

spell_031:
	.db $78			; MP cost
	.db $7c			; Effect type
	.db $be			; Power
	.db $bf			; Target type
	.db $01			; Element
	.db $03			; Accuracy
	.dw $0707		; Flags

spell_032:
	.db $03			; MP cost
	.db $01			; Effect type
	.db $00			; Power
	.db $00			; Target type
	.db $4a			; Element
	.db $63			; Accuracy
	.dw $c862		; Flags

spell_033:
	.db $00			; MP cost
	.db $ff			; Effect type
	.db $df			; Power
	.db $e7			; Target type
	.db $f8			; Element
	.db $3f			; Accuracy
	.dw $cff0		; Flags

spell_034:
	.db $ff			; MP cost
	.db $ff			; Effect type
	.db $4a			; Power
	.db $73			; Target type
	.db $c8			; Element
	.db $72			; Accuracy
	.dw $00e0		; Flags

spell_035:
	.db $7f			; MP cost
	.db $9f			; Effect type
	.db $03			; Power
	.db $0a			; Target type
	.db $18			; Element
	.db $05			; Accuracy
	.dw $8810		; Flags

spell_036:
	.db $05			; MP cost
	.db $3f			; Effect type
	.db $1f			; Power
	.db $0f			; Target type
	.db $0f			; Element
	.db $0f			; Accuracy
	.dw $0737		; Flags

spell_037:
	.db $1f			; MP cost
	.db $10			; Effect type
	.db $10			; Power
	.db $10			; Target type
	.db $38			; Element
	.db $c8			; Accuracy
	.dw $8914		; Flags

spell_038:
	.db $0d			; MP cost
	.db $7e			; Effect type
	.db $f7			; Power
	.db $3b			; Target type
	.db $bd			; Element
	.db $bd			; Accuracy
	.dw $81ff		; Flags

spell_039:
	.db $c3			; MP cost
	.db $81			; Effect type
	.db $81			; Power
	.db $42			; Target type
	.db $42			; Element
	.db $81			; Accuracy
	.dw $0000		; Flags

spell_040:
	.db $0a			; MP cost
	.db $1c			; Effect type
	.db $0d			; Power
	.db $88			; Target type
	.db $0c			; Element
	.db $0d			; Accuracy
	.dw $c7ff		; Flags

spell_041:
	.db $0f			; MP cost
	.db $1f			; Effect type
	.db $1f			; Power
	.db $0f			; Target type
	.db $0f			; Element
	.db $06			; Accuracy
	.dw $0503		; Flags

spell_042:
	.db $10			; MP cost
	.db $20			; Effect type
	.db $01			; Power
	.db $02			; Target type
	.db $04			; Element
	.db $0a			; Accuracy
	.dw $1c15		; Flags

spell_043:
	.db $88			; MP cost
	.db $0c			; Effect type
	.db $15			; Power
	.db $7f			; Target type
	.db $e3			; Element
	.db $07			; Accuracy
	.dw $0208		; Flags

spell_044:
	.db $10			; MP cost
	.db $10			; Effect type
	.db $08			; Power
	.db $10			; Target type
	.db $10			; Element
	.db $20			; Accuracy
	.dw $2020		; Flags

spell_045:
	.db $20			; MP cost
	.db $02			; Effect type
	.db $1c			; Power
	.db $1d			; Target type
	.db $80			; Element
	.db $0c			; Accuracy
	.dw $1d18		; Flags

spell_046:
	.db $18			; MP cost
	.db $18			; Effect type
	.db $08			; Power
	.db $0c			; Target type
	.db $07			; Element
	.db $01			; Accuracy
	.dw $0020		; Flags

spell_047:
	.db $20			; MP cost
	.db $20			; Effect type
	.db $10			; Power
	.db $10			; Target type
	.db $08			; Element
	.db $06			; Accuracy
	.dw $0188		; Flags

spell_048:
	.db $14			; MP cost
	.db $1d			; Effect type
	.db $01			; Power
	.db $0f			; Target type
	.db $c3			; Element
	.db $e7			; Accuracy
	.dw $ff3c		; Flags

spell_049:
	.db $c3			; MP cost
	.db $0b			; Effect type
	.db $18			; Power
	.db $25			; Target type
	.db $89			; Element
	.db $10			; Accuracy
	.dw $250c		; Flags

; ============================================================================
; End of spell data
; ============================================================================
