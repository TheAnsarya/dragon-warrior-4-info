; ============================================================================
; Dragon Warrior IV - Item Data
; ============================================================================
; Generated from items.json by json_to_asm.py
; ============================================================================

; Item data structure (8 bytes per entry):
;   Offset  Size  Description
;   $00	 2	 Price (little endian)
;   $02	 1	 Attack bonus
;   $03	 1	 Defense bonus
;   $04	 1	 Agility bonus (signed)
;   $05	 1	 Equip flags
;   $06	 1	 Effect ID
;   $07	 1	 Item type

.segment "PRG_BANK_08"

; Item count
ITEM_COUNT = 100

; Item stat table
item_stats_table:

item_000:
	.word $154a		; Price
	.byte $c8			; Attack bonus
	.byte $10			; Defense bonus
	.byte $07			; Agility bonus
	.byte $03			; Equip flags
	.byte $02			; Effect ID
	.byte $02			; Item type

item_001:
	.word $0301		; Price
	.byte $03			; Attack bonus
	.byte $42			; Defense bonus
	.byte $25			; Agility bonus
	.byte $c0			; Equip flags
	.byte $20			; Effect ID
	.byte $21			; Item type

item_002:
	.word $2c51		; Price
	.byte $14			; Attack bonus
	.byte $10			; Defense bonus
	.byte $00			; Agility bonus
	.byte $e0			; Equip flags
	.byte $10			; Effect ID
	.byte $63			; Item type

item_003:
	.word $3f73		; Price
	.byte $1f			; Attack bonus
	.byte $1c			; Defense bonus
	.byte $fb			; Agility bonus
	.byte $fb			; Equip flags
	.byte $1f			; Effect ID
	.byte $42			; Item type

item_004:
	.word $c035		; Price
	.byte $30			; Attack bonus
	.byte $23			; Defense bonus
	.byte $98			; Agility bonus
	.byte $67			; Equip flags
	.byte $06			; Effect ID
	.byte $02			; Item type

item_005:
	.word $0404		; Price
	.byte $00			; Attack bonus
	.byte $3f			; Defense bonus
	.byte $f8			; Agility bonus
	.byte $67			; Equip flags
	.byte $06			; Effect ID
	.byte $0a			; Item type

item_006:
	.word $1515		; Price
	.byte $12			; Attack bonus
	.byte $4a			; Defense bonus
	.byte $45			; Agility bonus
	.byte $c8			; Equip flags
	.byte $40			; Effect ID
	.byte $f0			; Item type

item_007:
	.word $037f		; Price
	.byte $17			; Attack bonus
	.byte $13			; Defense bonus
	.byte $14			; Agility bonus
	.byte $17			; Equip flags
	.byte $17			; Effect ID
	.byte $17			; Item type

item_008:
	.word $030c		; Price
	.byte $07			; Attack bonus
	.byte $03			; Defense bonus
	.byte $4a			; Agility bonus
	.byte $55			; Equip flags
	.byte $c8			; Effect ID
	.byte $50			; Item type

item_009:
	.word $ff00		; Price
	.byte $17			; Attack bonus
	.byte $17			; Defense bonus
	.byte $0b			; Agility bonus
	.byte $0b			; Equip flags
	.byte $0b			; Effect ID
	.byte $06			; Item type

item_010:
	.word $0506		; Price
	.byte $4a			; Attack bonus
	.byte $65			; Defense bonus
	.byte $c8			; Agility bonus
	.byte $60			; Equip flags
	.byte $01			; Effect ID
	.byte $ff			; Item type

item_011:
	.word $0303		; Price
	.byte $07			; Attack bonus
	.byte $07			; Defense bonus
	.byte $08			; Agility bonus
	.byte $07			; Equip flags
	.byte $18			; Effect ID
	.byte $e7			; Item type

item_012:
	.word $4ae7		; Price
	.byte $75			; Attack bonus
	.byte $c8			; Defense bonus
	.byte $70			; Agility bonus
	.byte $e0			; Equip flags
	.byte $c0			; Effect ID
	.byte $3f			; Item type

item_013:
	.word $bf0c		; Price
	.byte $67			; Attack bonus
	.byte $1c			; Defense bonus
	.byte $4a			; Agility bonus
	.byte $24			; Equip flags
	.byte $c8			; Effect ID
	.byte $21			; Item type

item_014:
	.word $3f3f		; Price
	.byte $90			; Attack bonus
	.byte $08			; Defense bonus
	.byte $10			; Agility bonus
	.byte $60			; Equip flags
	.byte $86			; Effect ID
	.byte $9c			; Item type

item_015:
	.word $3890		; Price
	.byte $f0			; Attack bonus
	.byte $e0			; Defense bonus
	.byte $80			; Agility bonus
	.byte $80			; Equip flags
	.byte $4a			; Effect ID
	.byte $34			; Item type

item_016:
	.word $31c8		; Price
	.byte $18			; Attack bonus
	.byte $ff			; Defense bonus
	.byte $3c			; Agility bonus
	.byte $78			; Equip flags
	.byte $38			; Effect ID
	.byte $18			; Item type

item_017:
	.word $6828		; Price
	.byte $68			; Attack bonus
	.byte $a8			; Defense bonus
	.byte $80			; Agility bonus
	.byte $80			; Equip flags
	.byte $4a			; Effect ID
	.byte $44			; Item type

item_018:
	.word $41c8		; Price
	.byte $00			; Attack bonus
	.byte $ff			; Defense bonus
	.byte $b4			; Agility bonus
	.byte $54			; Equip flags
	.byte $56			; Effect ID
	.byte $57			; Item type

item_019:
	.word $6b5b		; Price
	.byte $6b			; Attack bonus
	.byte $6d			; Defense bonus
	.byte $4a			; Agility bonus
	.byte $54			; Equip flags
	.byte $c8			; Effect ID
	.byte $51			; Item type

item_020:
	.word $ff00		; Price
	.byte $ad			; Attack bonus
	.byte $b6			; Defense bonus
	.byte $b7			; Agility bonus
	.byte $b7			; Equip flags
	.byte $57			; Effect ID
	.byte $db			; Item type

item_021:
	.word $dbdb		; Price
	.byte $4a			; Attack bonus
	.byte $64			; Defense bonus
	.byte $c8			; Agility bonus
	.byte $61			; Equip flags
	.byte $01			; Effect ID
	.byte $ff			; Item type

item_022:
	.word $dddd		; Price
	.byte $ee			; Attack bonus
	.byte $ef			; Defense bonus
	.byte $f7			; Agility bonus
	.byte $f7			; Equip flags
	.byte $7b			; Effect ID
	.byte $9d			; Item type

item_023:
	.word $4a80		; Price
	.byte $74			; Attack bonus
	.byte $c8			; Defense bonus
	.byte $71			; Agility bonus
	.byte $c0			; Equip flags
	.byte $c0			; Effect ID
	.byte $86			; Item type

item_024:
	.word $e001		; Price
	.byte $80			; Attack bonus
	.byte $4a			; Defense bonus
	.byte $23			; Agility bonus
	.byte $c8			; Equip flags
	.byte $22			; Effect ID
	.byte $07			; Item type

item_025:
	.word $0307		; Price
	.byte $0d			; Attack bonus
	.byte $1a			; Defense bonus
	.byte $03			; Agility bonus
	.byte $0d			; Equip flags
	.byte $18			; Effect ID
	.byte $42			; Item type

item_026:
	.word $c033		; Price
	.byte $32			; Attack bonus
	.byte $55			; Defense bonus
	.byte $d2			; Agility bonus
	.byte $af			; Equip flags
	.byte $55			; Effect ID
	.byte $50			; Item type

item_027:
	.word $3420		; Price
	.byte $44			; Attack bonus
	.byte $50			; Defense bonus
	.byte $d0			; Agility bonus
	.byte $af			; Equip flags
	.byte $55			; Effect ID
	.byte $52			; Item type

item_028:
	.word $1625		; Price
	.byte $05			; Attack bonus
	.byte $4a			; Defense bonus
	.byte $43			; Agility bonus
	.byte $c8			; Equip flags
	.byte $42			; Effect ID
	.byte $c0			; Item type

item_029:
	.word $4ac7		; Price
	.byte $31			; Attack bonus
	.byte $80			; Defense bonus
	.byte $81			; Agility bonus
	.byte $c0			; Equip flags
	.byte $02			; Effect ID
	.byte $01			; Item type

item_030:
	.word $5342		; Price
	.byte $c0			; Attack bonus
	.byte $52			; Defense bonus
	.byte $e0			; Agility bonus
	.byte $f0			; Equip flags
	.byte $30			; Effect ID
	.byte $c0			; Item type

item_031:
	.word $7c78		; Price
	.byte $be			; Attack bonus
	.byte $bf			; Defense bonus
	.byte $01			; Agility bonus
	.byte $03			; Equip flags
	.byte $07			; Effect ID
	.byte $07			; Item type

item_032:
	.word $0103		; Price
	.byte $00			; Attack bonus
	.byte $00			; Defense bonus
	.byte $4a			; Agility bonus
	.byte $63			; Equip flags
	.byte $c8			; Effect ID
	.byte $62			; Item type

item_033:
	.word $ff00		; Price
	.byte $df			; Attack bonus
	.byte $e7			; Defense bonus
	.byte $f8			; Agility bonus
	.byte $3f			; Equip flags
	.byte $cf			; Effect ID
	.byte $f0			; Item type

item_034:
	.word $ffff		; Price
	.byte $4a			; Attack bonus
	.byte $73			; Defense bonus
	.byte $c8			; Agility bonus
	.byte $72			; Equip flags
	.byte $00			; Effect ID
	.byte $e0			; Item type

item_035:
	.word $9f7f		; Price
	.byte $03			; Attack bonus
	.byte $0a			; Defense bonus
	.byte $18			; Agility bonus
	.byte $05			; Equip flags
	.byte $88			; Effect ID
	.byte $10			; Item type

item_036:
	.word $3f05		; Price
	.byte $1f			; Attack bonus
	.byte $0f			; Defense bonus
	.byte $0f			; Agility bonus
	.byte $0f			; Equip flags
	.byte $07			; Effect ID
	.byte $37			; Item type

item_037:
	.word $101f		; Price
	.byte $10			; Attack bonus
	.byte $10			; Defense bonus
	.byte $38			; Agility bonus
	.byte $c8			; Equip flags
	.byte $89			; Effect ID
	.byte $14			; Item type

item_038:
	.word $7e0d		; Price
	.byte $f7			; Attack bonus
	.byte $3b			; Defense bonus
	.byte $bd			; Agility bonus
	.byte $bd			; Equip flags
	.byte $81			; Effect ID
	.byte $ff			; Item type

item_039:
	.word $81c3		; Price
	.byte $81			; Attack bonus
	.byte $42			; Defense bonus
	.byte $42			; Agility bonus
	.byte $81			; Equip flags
	.byte $00			; Effect ID
	.byte $00			; Item type

item_040:
	.word $1c0a		; Price
	.byte $0d			; Attack bonus
	.byte $88			; Defense bonus
	.byte $0c			; Agility bonus
	.byte $0d			; Equip flags
	.byte $c7			; Effect ID
	.byte $ff			; Item type

item_041:
	.word $1f0f		; Price
	.byte $1f			; Attack bonus
	.byte $0f			; Defense bonus
	.byte $0f			; Agility bonus
	.byte $06			; Equip flags
	.byte $05			; Effect ID
	.byte $03			; Item type

item_042:
	.word $2010		; Price
	.byte $01			; Attack bonus
	.byte $02			; Defense bonus
	.byte $04			; Agility bonus
	.byte $0a			; Equip flags
	.byte $1c			; Effect ID
	.byte $15			; Item type

item_043:
	.word $0c88		; Price
	.byte $15			; Attack bonus
	.byte $7f			; Defense bonus
	.byte $e3			; Agility bonus
	.byte $07			; Equip flags
	.byte $02			; Effect ID
	.byte $08			; Item type

item_044:
	.word $1010		; Price
	.byte $08			; Attack bonus
	.byte $10			; Defense bonus
	.byte $10			; Agility bonus
	.byte $20			; Equip flags
	.byte $20			; Effect ID
	.byte $20			; Item type

item_045:
	.word $0220		; Price
	.byte $1c			; Attack bonus
	.byte $1d			; Defense bonus
	.byte $80			; Agility bonus
	.byte $0c			; Equip flags
	.byte $1d			; Effect ID
	.byte $18			; Item type

item_046:
	.word $1818		; Price
	.byte $08			; Attack bonus
	.byte $0c			; Defense bonus
	.byte $07			; Agility bonus
	.byte $01			; Equip flags
	.byte $00			; Effect ID
	.byte $20			; Item type

item_047:
	.word $2020		; Price
	.byte $10			; Attack bonus
	.byte $10			; Defense bonus
	.byte $08			; Agility bonus
	.byte $06			; Equip flags
	.byte $01			; Effect ID
	.byte $88			; Item type

item_048:
	.word $1d14		; Price
	.byte $01			; Attack bonus
	.byte $0f			; Defense bonus
	.byte $c3			; Agility bonus
	.byte $e7			; Equip flags
	.byte $ff			; Effect ID
	.byte $3c			; Item type

item_049:
	.word $0bc3		; Price
	.byte $18			; Attack bonus
	.byte $25			; Defense bonus
	.byte $89			; Agility bonus
	.byte $10			; Equip flags
	.byte $25			; Effect ID
	.byte $0c			; Item type

item_050:
	.word $cfcf		; Price
	.byte $20			; Attack bonus
	.byte $30			; Defense bonus
	.byte $01			; Agility bonus
	.byte $03			; Equip flags
	.byte $03			; Effect ID
	.byte $01			; Item type

item_051:
	.word $3027		; Price
	.byte $01			; Attack bonus
	.byte $03			; Defense bonus
	.byte $03			; Agility bonus
	.byte $01			; Equip flags
	.byte $c0			; Effect ID
	.byte $30			; Item type

item_052:
	.word $0f03		; Price
	.byte $1f			; Attack bonus
	.byte $1f			; Defense bonus
	.byte $3f			; Agility bonus
	.byte $3f			; Equip flags
	.byte $7d			; Effect ID
	.byte $78			; Item type

item_053:
	.word $0500		; Price
	.byte $0c			; Attack bonus
	.byte $08			; Defense bonus
	.byte $00			; Agility bonus
	.byte $20			; Equip flags
	.byte $02			; Effect ID
	.byte $05			; Item type

item_054:
	.word $40c8		; Price
	.byte $8f			; Attack bonus
	.byte $f0			; Defense bonus
	.byte $fd			; Agility bonus
	.byte $fb			; Equip flags
	.byte $fc			; Effect ID
	.byte $7f			; Item type

item_055:
	.word $0a02		; Price
	.byte $55			; Attack bonus
	.byte $a5			; Defense bonus
	.byte $2a			; Agility bonus
	.byte $c8			; Equip flags
	.byte $50			; Effect ID
	.byte $fc			; Item type

item_056:
	.word $ca00		; Price
	.byte $12			; Attack bonus
	.byte $22			; Defense bonus
	.byte $02			; Agility bonus
	.byte $01			; Equip flags
	.byte $01			; Effect ID
	.byte $c8			; Item type

item_057:
	.word $0331		; Price
	.byte $ff			; Attack bonus
	.byte $c0			; Defense bonus
	.byte $f0			; Agility bonus
	.byte $f8			; Equip flags
	.byte $f8			; Effect ID
	.byte $fc			; Item type

item_058:
	.word $befc		; Price
	.byte $1e			; Attack bonus
	.byte $44			; Defense bonus
	.byte $a2			; Agility bonus
	.byte $c8			; Equip flags
	.byte $41			; Effect ID
	.byte $8f			; Item type

item_059:
	.word $bff0		; Price
	.byte $df			; Attack bonus
	.byte $3f			; Defense bonus
	.byte $fe			; Agility bonus
	.byte $42			; Equip flags
	.byte $a8			; Effect ID
	.byte $56			; Item type

item_060:
	.word $aa55		; Price
	.byte $c8			; Attack bonus
	.byte $51			; Defense bonus
	.byte $f2			; Agility bonus
	.byte $00			; Equip flags
	.byte $aa			; Effect ID
	.byte $21			; Item type

item_061:
	.word $4020		; Price
	.byte $80			; Attack bonus
	.byte $c8			; Defense bonus
	.byte $50			; Agility bonus
	.byte $ef			; Equip flags
	.byte $00			; Effect ID
	.byte $40			; Item type

item_062:
	.word $40e0		; Price
	.byte $02			; Attack bonus
	.byte $60			; Defense bonus
	.byte $60			; Agility bonus
	.byte $04			; Equip flags
	.byte $c9			; Effect ID
	.byte $60			; Item type

item_063:
	.word $ea1f		; Price
	.byte $fe			; Attack bonus
	.byte $00			; Defense bonus
	.byte $01			; Agility bonus
	.byte $07			; Equip flags
	.byte $17			; Effect ID
	.byte $63			; Item type

item_064:
	.word $3c1e		; Price
	.byte $00			; Attack bonus
	.byte $01			; Defense bonus
	.byte $07			; Agility bonus
	.byte $7f			; Equip flags
	.byte $3f			; Effect ID
	.byte $c8			; Item type

item_065:
	.word $fb51		; Price
	.byte $03			; Attack bonus
	.byte $3c			; Defense bonus
	.byte $7f			; Agility bonus
	.byte $60			; Equip flags
	.byte $60			; Effect ID
	.byte $01			; Item type

item_066:
	.word $0103		; Price
	.byte $3c			; Attack bonus
	.byte $7e			; Defense bonus
	.byte $c9			; Agility bonus
	.byte $61			; Equip flags
	.byte $ff			; Effect ID
	.byte $f9			; Item type

item_067:
	.word $d75b		; Price
	.byte $7d			; Attack bonus
	.byte $83			; Defense bonus
	.byte $7f			; Agility bonus
	.byte $fc			; Equip flags
	.byte $d6			; Effect ID
	.byte $83			; Item type

item_068:
	.word $7dd7		; Price
	.byte $83			; Attack bonus
	.byte $fc			; Defense bonus
	.byte $c8			; Agility bonus
	.byte $52			; Equip flags
	.byte $12			; Effect ID
	.byte $00			; Item type

item_069:
	.word $2080		; Price
	.byte $c8			; Attack bonus
	.byte $62			; Defense bonus
	.byte $7e			; Agility bonus
	.byte $fe			; Equip flags
	.byte $80			; Effect ID
	.byte $f0			; Item type

item_070:
	.word $e3f6		; Price
	.byte $ff			; Attack bonus
	.byte $fc			; Defense bonus
	.byte $c0			; Agility bonus
	.byte $30			; Equip flags
	.byte $fe			; Effect ID
	.byte $ff			; Item type

item_071:
	.word $fcff		; Price
	.byte $c0			; Attack bonus
	.byte $c0			; Defense bonus
	.byte $30			; Agility bonus
	.byte $00			; Equip flags
	.byte $00			; Effect ID
	.byte $01			; Item type

item_072:
	.word $0301		; Price
	.byte $0f			; Attack bonus
	.byte $7e			; Defense bonus
	.byte $78			; Agility bonus
	.byte $01			; Equip flags
	.byte $03			; Effect ID
	.byte $07			; Item type

item_073:
	.word $1f0f		; Price
	.byte $3f			; Attack bonus
	.byte $7e			; Defense bonus
	.byte $78			; Agility bonus
	.byte $c8			; Equip flags
	.byte $40			; Effect ID
	.byte $f0			; Item type

item_074:
	.word $20ff		; Price
	.byte $20			; Attack bonus
	.byte $30			; Defense bonus
	.byte $0e			; Agility bonus
	.byte $20			; Equip flags
	.byte $23			; Effect ID
	.byte $f5			; Item type

item_075:
	.word $667f		; Price
	.byte $68			; Attack bonus
	.byte $32			; Defense bonus
	.byte $0e			; Agility bonus
	.byte $c8			; Equip flags
	.byte $50			; Effect ID
	.byte $61			; Item type

item_076:
	.word $feff		; Price
	.byte $5c			; Attack bonus
	.byte $81			; Defense bonus
	.byte $03			; Agility bonus
	.byte $03			; Equip flags
	.byte $06			; Effect ID
	.byte $05			; Item type

item_077:
	.word $0201		; Price
	.byte $0c			; Attack bonus
	.byte $04			; Defense bonus
	.byte $c8			; Agility bonus
	.byte $60			; Equip flags
	.byte $e6			; Effect ID
	.byte $9e			; Item type

item_078:
	.word $0c01		; Price
	.byte $17			; Attack bonus
	.byte $0a			; Defense bonus
	.byte $04			; Agility bonus
	.byte $04			; Equip flags
	.byte $05			; Effect ID
	.byte $03			; Item type

item_079:
	.word $0201		; Price
	.byte $c8			; Attack bonus
	.byte $21			; Defense bonus
	.byte $1f			; Agility bonus
	.byte $1f			; Equip flags
	.byte $06			; Effect ID
	.byte $1c			; Item type

item_080:
	.word $6f3c		; Price
	.byte $ff			; Attack bonus
	.byte $07			; Defense bonus
	.byte $1f			; Agility bonus
	.byte $3f			; Equip flags
	.byte $7f			; Effect ID
	.byte $ff			; Item type

item_081:
	.word $31c0		; Price
	.byte $7f			; Attack bonus
	.byte $cf			; Defense bonus
	.byte $9f			; Agility bonus
	.byte $fc			; Equip flags
	.byte $e0			; Effect ID
	.byte $80			; Item type

item_082:
	.word $0f01		; Price
	.byte $ff			; Attack bonus
	.byte $ff			; Defense bonus
	.byte $ff			; Agility bonus
	.byte $fc			; Equip flags
	.byte $e2			; Effect ID
	.byte $9f			; Item type

item_083:
	.word $a06e		; Price
	.byte $c8			; Attack bonus
	.byte $41			; Defense bonus
	.byte $c4			; Agility bonus
	.byte $ff			; Equip flags
	.byte $3f			; Effect ID
	.byte $7f			; Item type

item_084:
	.word $febf		; Price
	.byte $78			; Attack bonus
	.byte $d2			; Defense bonus
	.byte $e1			; Agility bonus
	.byte $f3			; Equip flags
	.byte $80			; Effect ID
	.byte $80			; Item type

item_085:
	.word $c002		; Price
	.byte $51			; Attack bonus
	.byte $bc			; Defense bonus
	.byte $b8			; Agility bonus
	.byte $f2			; Equip flags
	.byte $6f			; Effect ID
	.byte $ff			; Item type

item_086:
	.word $fffe		; Price
	.byte $ff			; Attack bonus
	.byte $00			; Defense bonus
	.byte $00			; Agility bonus
	.byte $02			; Equip flags
	.byte $03			; Effect ID
	.byte $07			; Item type

item_087:
	.word $0706		; Price
	.byte $03			; Attack bonus
	.byte $c8			; Defense bonus
	.byte $61			; Agility bonus
	.byte $3c			; Equip flags
	.byte $e0			; Effect ID
	.byte $df			; Item type

item_088:
	.word $1f7f		; Price
	.byte $40			; Attack bonus
	.byte $5b			; Defense bonus
	.byte $87			; Agility bonus
	.byte $e0			; Equip flags
	.byte $c8			; Effect ID
	.byte $22			; Item type

item_089:
	.word $0f1f		; Price
	.byte $10			; Attack bonus
	.byte $38			; Defense bonus
	.byte $fe			; Agility bonus
	.byte $3f			; Equip flags
	.byte $80			; Effect ID
	.byte $f0			; Item type

item_090:
	.word $fef8		; Price
	.byte $ff			; Attack bonus
	.byte $c8			; Defense bonus
	.byte $32			; Agility bonus
	.byte $ef			; Equip flags
	.byte $e3			; Effect ID
	.byte $e1			; Item type

item_091:
	.word $ffb0		; Price
	.byte $d0			; Attack bonus
	.byte $f5			; Defense bonus
	.byte $ff			; Agility bonus
	.byte $ff			; Equip flags
	.byte $ff			; Effect ID
	.byte $b7			; Item type

item_092:
	.word $05d8		; Price
	.byte $01			; Attack bonus
	.byte $c8			; Defense bonus
	.byte $42			; Agility bonus
	.byte $04			; Equip flags
	.byte $ff			; Effect ID
	.byte $fe			; Item type

item_093:
	.word $fafe		; Price
	.byte $ff			; Attack bonus
	.byte $3d			; Defense bonus
	.byte $95			; Agility bonus
	.byte $0f			; Equip flags
	.byte $9f			; Effect ID
	.byte $80			; Item type

item_094:
	.word $52c0		; Price
	.byte $7e			; Attack bonus
	.byte $1f			; Defense bonus
	.byte $ce			; Agility bonus
	.byte $7f			; Equip flags
	.byte $7f			; Effect ID
	.byte $ff			; Item type

item_095:
	.word $fef7		; Price
	.byte $00			; Attack bonus
	.byte $00			; Defense bonus
	.byte $c0			; Agility bonus
	.byte $40			; Equip flags
	.byte $40			; Effect ID
	.byte $c0			; Item type

item_096:
	.word $80c0		; Price
	.byte $c8			; Attack bonus
	.byte $62			; Defense bonus
	.byte $3f			; Agility bonus
	.byte $e6			; Equip flags
	.byte $fb			; Effect ID
	.byte $fa			; Item type

item_097:
	.word $03f8		; Price
	.byte $01			; Attack bonus
	.byte $02			; Defense bonus
	.byte $f7			; Agility bonus
	.byte $d0			; Equip flags
	.byte $0c			; Effect ID
	.byte $06			; Item type

item_098:
	.word $c901		; Price
	.byte $33			; Attack bonus
	.byte $c0			; Defense bonus
	.byte $7e			; Agility bonus
	.byte $3e			; Equip flags
	.byte $a0			; Effect ID
	.byte $3c			; Item type

item_099:
	.word $0c0c		; Price
	.byte $70			; Attack bonus
	.byte $f0			; Defense bonus
	.byte $f8			; Agility bonus
	.byte $3c			; Equip flags
	.byte $cc			; Effect ID
	.byte $0c			; Item type

; ============================================================================
; End of item data
; ============================================================================