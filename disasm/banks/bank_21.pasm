; ============================================================
; Dragon Warrior IV - Bank 21 Disassembly
; ROM Offset: $54010
; CPU Address: $8000-$bfff
; ============================================================
;
; Discovered Subroutines: 131
; Jump Targets: 661
;
; ============================================================

	.db $ef			  ; $8000 - Unknown opcode
	LDA ($32),Y			  ; $8001: B1 32   
	LDY $5f,X				; $8003: B4 5F   
	.db $b3			  ; $8005 - Unknown opcode
	.db $cf			  ; $8006 - Unknown opcode
	.db $b2			  ; $8007 - Unknown opcode
	.db $5c			  ; $8008 - Unknown opcode
	TAY					  ; $8009: A8	  
	.db $74			  ; $800a - Unknown opcode
	.db $b3			  ; $800b - Unknown opcode
	TXA					  ; $800c: 8A	  
	.db $b3			  ; $800d - Unknown opcode
	LDA ($b3,X)			  ; $800e: A1 B3   
	DEX					  ; $8010: CA	  
	.db $b3			  ; $8011 - Unknown opcode
	BMI $7fbf				; $8012: 30 AB   
	BRK					  ; $8014: 00	  
	BRK					  ; $8015: 00	  
	LDA $cbb4,Y			  ; $8016: B9 B4 CB
	LDY $e3,X				; $8019: B4 E3   
	LDY $ee,X				; $801b: B4 EE   
	LDY $f8,X				; $801d: B4 F8   
	TYA					  ; $801f: 98	  
	.db $eb			  ; $8020 - Unknown opcode
	.db $9c			  ; $8021 - Unknown opcode
	.db $44			  ; $8022 - Unknown opcode
	LDX #$ba				 ; $8023: A2 BA   
	LDY $24				  ; $8025: A4 24   
	LDA $0c,X				; $8027: B5 0C   
	LDX #$6e				 ; $8029: A2 6E   
	LDY #$13				 ; $802b: A0 13   
	LDA $d2,X				; $802d: B5 D2   
	LDX $b833,Y			  ; $802f: BE 33 B8
	.db $64			  ; $8032 - Unknown opcode
	LDA $e24a				; $8033: AD 4A E2
	.db $3f			  ; $8036 - Unknown opcode
	.db $42			  ; $8037 - Unknown opcode
	BEQ $8079				; $8038: F0 3F   
	.db $44			  ; $803a - Unknown opcode
	STA $073f				; $803b: 8D 3F 07
	.db $1b			  ; $803e - Unknown opcode
	ASL $4710				; $803f: 0E 10 47
	.db $89			  ; $8042 - Unknown opcode
	.db $0b			  ; $8043 - Unknown opcode
	ASL $47				  ; $8044: 06 47   
	.db $87			  ; $8046 - Unknown opcode
	.db $07			  ; $8047 - Unknown opcode
	ORA ptr1_lo			  ; $8048: 05 06   
	CLC					  ; $804a: 18	  
	ASL $4710				; $804b: 0E 10 47
	DEY					  ; $804e: 88	  
	BRK					  ; $804f: 00	  
	ROL $9d,X				; $8050: 36 9D   
	ROL $470b,X			  ; $8052: 3E 0B 47
	TXA					  ; $8055: 8A	  
	ROL $073f,X			  ; $8056: 3E 3F 07
	ASL ptr0_hi,X			; $8059: 16 05   
	ASL ptr1_hi			  ; $805b: 06 07   
	.db $03			  ; $805d - Unknown opcode
	ASL $4a				  ; $805e: 06 4A   
	AND $3e4a,X			  ; $8060: 3D 4A 3E
	ROL $060b,X			  ; $8063: 3E 0B 06
	.db $07			  ; $8066 - Unknown opcode
	ORA ($6c),Y			  ; $8067: 11 6C   
	.db $47			  ; $8069 - Unknown opcode
	STX $0b				  ; $806a: 86 0B   
	.db $47			  ; $806c - Unknown opcode
	STA $46				  ; $806d: 85 46   
	ASL					  ; $806f: 0A	  
	ROL $073f,X			  ; $8070: 3E 3F 07
	ASL ptr0_hi,X			; $8073: 16 05   
	ASL $47				  ; $8075: 06 47   
	.db $32			  ; $8077 - Unknown opcode
	.db $07			  ; $8078 - Unknown opcode
loc_8079:
	ORA ($1e),Y			  ; $8079: 11 1E   
	LSR					  ; $807b: 4A	  
	.db $3f			  ; $807c - Unknown opcode
	ROL $450b,X			  ; $807d: 3E 0B 45
	CMP ($3f),Y			  ; $8080: D1 3F   
	.db $07			  ; $8082 - Unknown opcode
	.db $02			  ; $8083 - Unknown opcode
	ORA ($2a,X)			  ; $8084: 01 2A   
	STA $078b,X			  ; $8086: 9D 8B 07
	.db $0b			  ; $8089 - Unknown opcode
	.db $47			  ; $808a - Unknown opcode
	.db $8b			  ; $808b - Unknown opcode
	.db $3f			  ; $808c - Unknown opcode
	.db $07			  ; $808d - Unknown opcode
	ASL ptr0_hi,X			; $808e: 16 05   
	.db $07			  ; $8090 - Unknown opcode
	.db $14			  ; $8091 - Unknown opcode
	LSR					  ; $8092: 4A	  
	.db $34			  ; $8093 - Unknown opcode
	.db $0b			  ; $8094 - Unknown opcode
	LSR					  ; $8095: 4A	  
	ROL $0b,X				; $8096: 36 0B   
	.db $07			  ; $8098 - Unknown opcode
	.db $14			  ; $8099 - Unknown opcode
	.db $47			  ; $809a - Unknown opcode
	STY $450b				; $809b: 8C 0B 45
	JSR $073f				; $809e: 20 3F 07
	ASL ptr0_hi,X			; $80a1: 16 05   
	.db $07			  ; $80a3 - Unknown opcode
	.db $83			  ; $80a4 - Unknown opcode
	ASL $4a				  ; $80a5: 06 4A   
	SEC					  ; $80a7: 38	  
	.db $0b			  ; $80a8 - Unknown opcode
	LSR					  ; $80a9: 4A	  
	AND $070b,Y			  ; $80aa: 39 0B 07
	.db $1b			  ; $80ad - Unknown opcode
	ASL $80				  ; $80ae: 06 80   
	ASL $18				  ; $80b0: 06 18   
	.db $03			  ; $80b2 - Unknown opcode
	JSR $8e47				; $80b3: 20 47 8E ; -> sub_8E47
	BRK					  ; $80b6: 00	  
	LDX $a4,Y				; $80b7: B6 A4   
	ROL $470b,X			  ; $80b9: 3E 0B 47
	STA $073f				; $80bc: 8D 3F 07
	ASL ptr0_hi,X			; $80bf: 16 05   
	LSR					  ; $80c1: 4A	  
	.db $3a			  ; $80c2 - Unknown opcode
	.db $0b			  ; $80c3 - Unknown opcode
	.db $07			  ; $80c4 - Unknown opcode
	.db $1b			  ; $80c5 - Unknown opcode
	ASL $80				  ; $80c6: 06 80   
	ASL $18				  ; $80c8: 06 18   
	.db $03			  ; $80ca - Unknown opcode
	JSR $8e47				; $80cb: 20 47 8E ; -> sub_8E47
	BRK					  ; $80ce: 00	  
	LDX $a4,Y				; $80cf: B6 A4   
	ROL $470b,X			  ; $80d1: 3E 0B 47
	.db $8f			  ; $80d4 - Unknown opcode
	.db $3f			  ; $80d5 - Unknown opcode
	.db $07			  ; $80d6 - Unknown opcode
	.db $02			  ; $80d7 - Unknown opcode
	.db $12			  ; $80d8 - Unknown opcode
	ASL $0b				  ; $80d9: 06 0B   
	.db $07			  ; $80db - Unknown opcode
	ASL ptr0_hi,X			; $80dc: 16 05   
	LSR					  ; $80de: 4A	  
	.db $22			  ; $80df - Unknown opcode
	.db $0b			  ; $80e0 - Unknown opcode
	EOR $29				  ; $80e1: 45 29   
	.db $3f			  ; $80e3 - Unknown opcode
	EOR $28				  ; $80e4: 45 28   
	CLC					  ; $80e6: 18	  
	ASL $80				  ; $80e7: 06 80   
	.db $3f			  ; $80e9 - Unknown opcode
	.db $07			  ; $80ea - Unknown opcode
	ASL ptr0_hi,X			; $80eb: 16 05   
	.db $07			  ; $80ed - Unknown opcode
	.db $03			  ; $80ee - Unknown opcode
	ASL $4a				  ; $80ef: 06 4A   
	.db $3b			  ; $80f1 - Unknown opcode
	.db $0b			  ; $80f2 - Unknown opcode
	LSR					  ; $80f3: 4A	  
	.db $3c			  ; $80f4 - Unknown opcode
	.db $0b			  ; $80f5 - Unknown opcode
	ASL $45				  ; $80f6: 06 45   
	ROL $0618				; $80f8: 2E 18 06
	.db $80			  ; $80fb - Unknown opcode
	ROL $073f,X			  ; $80fc: 3E 3F 07
	ASL ptr0_hi,X			; $80ff: 16 05   
	LSR					  ; $8101: 4A	  
	.db $33			  ; $8102 - Unknown opcode
	.db $0b			  ; $8103 - Unknown opcode
	.db $07			  ; $8104 - Unknown opcode
	.db $1b			  ; $8105 - Unknown opcode
	PHP					  ; $8106: 08	  
	.db $80			  ; $8107 - Unknown opcode
	.db $47			  ; $8108 - Unknown opcode
	.db $9f			  ; $8109 - Unknown opcode
	.db $0b			  ; $810a - Unknown opcode
	ORA ($3e,X)			  ; $810b: 01 3E   
	STA $0790,X			  ; $810d: 9D 90 07
	.db $3f			  ; $8110 - Unknown opcode
	.db $47			  ; $8111 - Unknown opcode
	.db $93			  ; $8112 - Unknown opcode
	.db $07			  ; $8113 - Unknown opcode
	ORA ptr1_lo			  ; $8114: 05 06   
	.db $47			  ; $8116 - Unknown opcode
	STY $18,X				; $8117: 94 18   
	ASL $40				  ; $8119: 06 40   
	BRK					  ; $811b: 00	  
	LDX $a4,Y				; $811c: B6 A4   
	ROL $060b,X			  ; $811e: 3E 0B 06
	.db $47			  ; $8121 - Unknown opcode
	STA $3e,X				; $8122: 95 3E   
	.db $3f			  ; $8124 - Unknown opcode
	.db $47			  ; $8125 - Unknown opcode
	.db $9c			  ; $8126 - Unknown opcode
	BRK					  ; $8127: 00	  
	.db $57			  ; $8128 - Unknown opcode
	STA $433f,X			  ; $8129: 9D 3F 43
	.db $42			  ; $812c - Unknown opcode
	.db $3f			  ; $812d - Unknown opcode
	EOR $ff				  ; $812e: 45 FF   
	.db $3f			  ; $8130 - Unknown opcode
	.db $47			  ; $8131 - Unknown opcode
	STA current_bank,X	   ; $8132: 9D 07 05
	.db $47			  ; $8135 - Unknown opcode
	.db $9e			  ; $8136 - Unknown opcode
	.db $0b			  ; $8137 - Unknown opcode
	.db $47			  ; $8138 - Unknown opcode
	.db $9e			  ; $8139 - Unknown opcode
	.db $3f			  ; $813a - Unknown opcode
	.db $07			  ; $813b - Unknown opcode
	.db $14			  ; $813c - Unknown opcode
	ASL ptr1_hi			  ; $813d: 06 07   
	.db $1b			  ; $813f - Unknown opcode
	PHP					  ; $8140: 08	  
	.db $02			  ; $8141 - Unknown opcode
	.db $47			  ; $8142 - Unknown opcode
	INX					  ; $8143: E8	  
	.db $0b			  ; $8144 - Unknown opcode
	.db $07			  ; $8145 - Unknown opcode
	.db $1b			  ; $8146 - Unknown opcode
	PHP					  ; $8147: 08	  
	PHP					  ; $8148: 08	  
	.db $47			  ; $8149 - Unknown opcode
	.db $e2			  ; $814a - Unknown opcode
	.db $0b			  ; $814b - Unknown opcode
	.db $07			  ; $814c - Unknown opcode
	.db $1b			  ; $814d - Unknown opcode
	ASL $20				  ; $814e: 06 20   
	.db $07			  ; $8150 - Unknown opcode
	.db $13			  ; $8151 - Unknown opcode
	.db $07			  ; $8152 - Unknown opcode
	.db $47			  ; $8153 - Unknown opcode
	LDY $0b				  ; $8154: A4 0B   
	ASL $47				  ; $8156: 06 47   
	.db $a3			  ; $8158 - Unknown opcode
	CLC					  ; $8159: 18	  
	BRK					  ; $815a: 00	  
	.db $02			  ; $815b - Unknown opcode
	ROL $060b,X			  ; $815c: 3E 0B 06
	.db $47			  ; $815f - Unknown opcode
	LDY #$07				 ; $8160: A0 07   
	ORA $47				  ; $8162: 05 47   
	LDA ($0b,X)			  ; $8164: A1 0B   
	.db $47			  ; $8166 - Unknown opcode
	LDX #$3e				 ; $8167: A2 3E   
	ROL $060b,X			  ; $8169: 3E 0B 06
	.db $07			  ; $816c - Unknown opcode
	.db $1b			  ; $816d - Unknown opcode
	PHP					  ; $816e: 08	  
	.db $02			  ; $816f - Unknown opcode
	EOR $51				  ; $8170: 45 51   
	.db $0b			  ; $8172 - Unknown opcode
	.db $07			  ; $8173 - Unknown opcode
	.db $1b			  ; $8174 - Unknown opcode
	PHP					  ; $8175: 08	  
	PHP					  ; $8176: 08	  
	.db $47			  ; $8177 - Unknown opcode
	.db $e2			  ; $8178 - Unknown opcode
	.db $0b			  ; $8179 - Unknown opcode
	EOR $51				  ; $817a: 45 51   
	ROL $073f,X			  ; $817c: 3E 3F 07
	.db $1b			  ; $817f - Unknown opcode
	PHP					  ; $8180: 08	  
	PHP					  ; $8181: 08	  
	.db $47			  ; $8182 - Unknown opcode
	CPX $0b				  ; $8183: E4 0B   
	.db $07			  ; $8185 - Unknown opcode
	.db $14			  ; $8186 - Unknown opcode
	.db $47			  ; $8187 - Unknown opcode
	LDA #$0b				 ; $8188: A9 0B   
	.db $47			  ; $818a - Unknown opcode
	LDA $073f				; $818b: AD 3F 07
	.db $1b			  ; $818e - Unknown opcode
	PHP					  ; $818f: 08	  
	.db $02			  ; $8190 - Unknown opcode
	.db $47			  ; $8191 - Unknown opcode
	NOP					  ; $8192: EA	  
	.db $0b			  ; $8193 - Unknown opcode
	.db $07			  ; $8194 - Unknown opcode
	.db $1b			  ; $8195 - Unknown opcode
	PHP					  ; $8196: 08	  
	PHP					  ; $8197: 08	  
	.db $47			  ; $8198 - Unknown opcode
	SBC $0b				  ; $8199: E5 0B	; Arithmetic
	ASL $47				  ; $819b: 06 47   
	.db $af			  ; $819d - Unknown opcode
	.db $07			  ; $819e - Unknown opcode
	.db $93			  ; $819f - Unknown opcode
	.db $07			  ; $81a0 - Unknown opcode
	.db $47			  ; $81a1 - Unknown opcode
	BCS $81e2				; $81a2: B0 3E   
	.db $3f			  ; $81a4 - Unknown opcode
	.db $07			  ; $81a5 - Unknown opcode
	.db $13			  ; $81a6 - Unknown opcode
	.db $07			  ; $81a7 - Unknown opcode
	.db $47			  ; $81a8 - Unknown opcode
	LDY $470b				; $81a9: AC 0B 47
	LDX $073f				; $81ac: AE 3F 07
	.db $1b			  ; $81af - Unknown opcode
	PHP					  ; $81b0: 08	  
	.db $02			  ; $81b1 - Unknown opcode
	.db $47			  ; $81b2 - Unknown opcode
	SBC #$0b				 ; $81b3: E9 0B	; Arithmetic
	.db $07			  ; $81b5 - Unknown opcode
	.db $1b			  ; $81b6 - Unknown opcode
	PHP					  ; $81b7: 08	  
	PHP					  ; $81b8: 08	  
	.db $47			  ; $81b9 - Unknown opcode
	.db $e3			  ; $81ba - Unknown opcode
	.db $0b			  ; $81bb - Unknown opcode
	.db $07			  ; $81bc - Unknown opcode
	.db $13			  ; $81bd - Unknown opcode
	.db $07			  ; $81be - Unknown opcode
	.db $47			  ; $81bf - Unknown opcode
	.db $a7			  ; $81c0 - Unknown opcode
	.db $0b			  ; $81c1 - Unknown opcode
	.db $07			  ; $81c2 - Unknown opcode
	.db $14			  ; $81c3 - Unknown opcode
	.db $47			  ; $81c4 - Unknown opcode
	LDA $0b				  ; $81c5: A5 0B   
	.db $47			  ; $81c7 - Unknown opcode
	LDX $3f				  ; $81c8: A6 3F   
	.db $47			  ; $81ca - Unknown opcode
	TAX					  ; $81cb: AA	  
	CLC					  ; $81cc: 18	  
	.db $03			  ; $81cd - Unknown opcode
	.db $04			  ; $81ce - Unknown opcode
	.db $3f			  ; $81cf - Unknown opcode
	.db $07			  ; $81d0 - Unknown opcode
	.db $13			  ; $81d1 - Unknown opcode
	.db $07			  ; $81d2 - Unknown opcode
	.db $47			  ; $81d3 - Unknown opcode
	LDY $470b				; $81d4: AC 0B 47
	.db $ab			  ; $81d7 - Unknown opcode
	.db $3f			  ; $81d8 - Unknown opcode
	.db $07			  ; $81d9 - Unknown opcode
	.db $1b			  ; $81da - Unknown opcode
	ASL					  ; $81db: 0A	  
	RTI					  ; $81dc: 40	  
	.db $07			  ; $81dd - Unknown opcode
	.db $1b			  ; $81de - Unknown opcode
	BRK					  ; $81df: 00	  
	.db $02			  ; $81e0 - Unknown opcode
	.db $43			  ; $81e1 - Unknown opcode
loc_81E2:
	PLA					  ; $81e2: 68	  
	.db $0b			  ; $81e3 - Unknown opcode
	ASL ptr1_hi			  ; $81e4: 06 07   
	.db $13			  ; $81e6 - Unknown opcode
	.db $07			  ; $81e7 - Unknown opcode
	.db $47			  ; $81e8 - Unknown opcode
	LDY $470b				; $81e9: AC 0B 47
	LDA ($18),Y			  ; $81ec: B1 18   
	.db $03			  ; $81ee - Unknown opcode
	.db $02			  ; $81ef - Unknown opcode
	ROL $070b,X			  ; $81f0: 3E 0B 07
	.db $1b			  ; $81f3 - Unknown opcode
	ASL $0708				; $81f4: 0E 08 07
	.db $1b			  ; $81f7 - Unknown opcode
	BRK					  ; $81f8: 00	  
	.db $02			  ; $81f9 - Unknown opcode
	.db $43			  ; $81fa - Unknown opcode
	PLA					  ; $81fb: 68	  
	.db $0b			  ; $81fc - Unknown opcode
	ASL ptr1_hi			  ; $81fd: 06 07   
	.db $13			  ; $81ff - Unknown opcode
	.db $07			  ; $8200 - Unknown opcode
	.db $47			  ; $8201 - Unknown opcode
	LDY $470b				; $8202: AC 0B 47
	LDA ($18),Y			  ; $8205: B1 18   
	.db $03			  ; $8207 - Unknown opcode
	.db $02			  ; $8208 - Unknown opcode
	ROL $430b,X			  ; $8209: 3E 0B 43
	.db $22			  ; $820c - Unknown opcode
	.db $3f			  ; $820d - Unknown opcode
	.db $07			  ; $820e - Unknown opcode
	.db $1b			  ; $820f - Unknown opcode
	ASL					  ; $8210: 0A	  
	RTI					  ; $8211: 40	  
	.db $07			  ; $8212 - Unknown opcode
	.db $1b			  ; $8213 - Unknown opcode
	BRK					  ; $8214: 00	  
	.db $02			  ; $8215 - Unknown opcode
	.db $43			  ; $8216 - Unknown opcode
	ADC #$0b				 ; $8217: 69 0B	; Arithmetic
	ASL ptr1_hi			  ; $8219: 06 07   
	.db $13			  ; $821b - Unknown opcode
	.db $07			  ; $821c - Unknown opcode
	.db $47			  ; $821d - Unknown opcode
	LDY $470b				; $821e: AC 0B 47
	.db $b2			  ; $8221 - Unknown opcode
	ROL $070b,X			  ; $8222: 3E 0B 07
	.db $1b			  ; $8225 - Unknown opcode
	ASL $0708				; $8226: 0E 08 07
	.db $1b			  ; $8229 - Unknown opcode
	BRK					  ; $822a: 00	  
	.db $02			  ; $822b - Unknown opcode
	.db $43			  ; $822c - Unknown opcode
	ADC #$0b				 ; $822d: 69 0B	; Arithmetic
	ASL ptr1_hi			  ; $822f: 06 07   
	.db $13			  ; $8231 - Unknown opcode
	.db $07			  ; $8232 - Unknown opcode
	.db $47			  ; $8233 - Unknown opcode
	LDY $470b				; $8234: AC 0B 47
	.db $b2			  ; $8237 - Unknown opcode
	ROL $430b,X			  ; $8238: 3E 0B 43
	.db $22			  ; $823b - Unknown opcode
	.db $3f			  ; $823c - Unknown opcode
	LSR $0d				  ; $823d: 46 0D   
	CLC					  ; $823f: 18	  
	.db $03			  ; $8240 - Unknown opcode
	PHP					  ; $8241: 08	  
	.db $3f			  ; $8242 - Unknown opcode
	.db $07			  ; $8243 - Unknown opcode
	.db $13			  ; $8244 - Unknown opcode
	.db $07			  ; $8245 - Unknown opcode
	.db $47			  ; $8246 - Unknown opcode
	LDY $470b				; $8247: AC 0B 47
	.db $b3			  ; $824a - Unknown opcode
	.db $3f			  ; $824b - Unknown opcode
	.db $07			  ; $824c - Unknown opcode
	.db $1b			  ; $824d - Unknown opcode
	PHP					  ; $824e: 08	  
	PHP					  ; $824f: 08	  
	.db $43			  ; $8250 - Unknown opcode
	.db $4f			  ; $8251 - Unknown opcode
	.db $0b			  ; $8252 - Unknown opcode
	.db $47			  ; $8253 - Unknown opcode
	TAY					  ; $8254: A8	  
	.db $3f			  ; $8255 - Unknown opcode
	.db $07			  ; $8256 - Unknown opcode
	.db $1b			  ; $8257 - Unknown opcode
	PHP					  ; $8258: 08	  
	PHP					  ; $8259: 08	  
	.db $47			  ; $825a - Unknown opcode
	INC $0b				  ; $825b: E6 0B   
	.db $47			  ; $825d - Unknown opcode
	LDY $3f,X				; $825e: B4 3F   
	.db $07			  ; $8260 - Unknown opcode
	ASL ptr0_hi,X			; $8261: 16 05   
	ASL ptr1_hi			  ; $8263: 06 07   
	.db $14			  ; $8265 - Unknown opcode
loc_8266:
	ASL $47				  ; $8266: 06 47   
	.db $b7			  ; $8268 - Unknown opcode
	EOR #$c4				 ; $8269: 49 C4   
	ROL $060b,X			  ; $826b: 3E 0B 06
	CLC					  ; $826e: 18	  
	ASL					  ; $826f: 0A	  
	PHP					  ; $8270: 08	  
	EOR #$c5				 ; $8271: 49 C5   
	EOR #$c6				 ; $8273: 49 C6   
	ROL $0b3e,X			  ; $8275: 3E 3E 0B
	.db $07			  ; $8278 - Unknown opcode
	.db $1b			  ; $8279 - Unknown opcode
	PHP					  ; $827a: 08	  
	PHP					  ; $827b: 08	  
	.db $47			  ; $827c - Unknown opcode
	.db $e7			  ; $827d - Unknown opcode
	.db $0b			  ; $827e - Unknown opcode
	.db $07			  ; $827f - Unknown opcode
	.db $14			  ; $8280 - Unknown opcode
	.db $47			  ; $8281 - Unknown opcode
	.db $b7			  ; $8282 - Unknown opcode
	.db $0b			  ; $8283 - Unknown opcode
	.db $47			  ; $8284 - Unknown opcode
	CLV					  ; $8285: B8	  
	.db $3f			  ; $8286 - Unknown opcode
	.db $43			  ; $8287 - Unknown opcode
	STX $b400				; $8288: 8E 00 B4
	.db $af			  ; $828b - Unknown opcode
	.db $3f			  ; $828c - Unknown opcode
	.db $07			  ; $828d - Unknown opcode
	.db $1b			  ; $828e - Unknown opcode
	ASL $08				  ; $828f: 06 08   
	.db $43			  ; $8291 - Unknown opcode
	.db $47			  ; $8292 - Unknown opcode
	.db $0b			  ; $8293 - Unknown opcode
	.db $07			  ; $8294 - Unknown opcode
	.db $1b			  ; $8295 - Unknown opcode
	ASL $10				  ; $8296: 06 10   
	ASL $47				  ; $8298: 06 47   
	CMP ptr1_hi			  ; $829a: C5 07   
	ORA ptr1_lo			  ; $829c: 05 06   
	ORA ($5c,X)			  ; $829e: 01 5C   
	STA $07c6,X			  ; $82a0: 9D C6 07
	CLC					  ; $82a3: 18	  
	ASL $08				  ; $82a4: 06 08   
	BRK					  ; $82a6: 00	  
	.db $62			  ; $82a7 - Unknown opcode
	STA $0b3e,X			  ; $82a8: 9D 3E 0B
	ASL $47				  ; $82ab: 06 47   
	.db $c7			  ; $82ad - Unknown opcode
	BRK					  ; $82ae: 00	  
	BMI $8266				; $82af: 30 B5   
	ROL $0b3e,X			  ; $82b1: 3E 3E 0B
	.db $12			  ; $82b4 - Unknown opcode
	ORA $3f				  ; $82b5: 05 3F   
	.db $07			  ; $82b7 - Unknown opcode
	.db $1b			  ; $82b8 - Unknown opcode
	ASL $08				  ; $82b9: 06 08   
	.db $47			  ; $82bb - Unknown opcode
	INY					  ; $82bc: C8	  
	.db $0b			  ; $82bd - Unknown opcode
	.db $47			  ; $82be - Unknown opcode
	CPY #$3f				 ; $82bf: C0 3F   
	.db $07			  ; $82c1 - Unknown opcode
	.db $1b			  ; $82c2 - Unknown opcode
	ASL $08				  ; $82c3: 06 08   
	LSR $1a				  ; $82c5: 46 1A   
	.db $0b			  ; $82c7 - Unknown opcode
	.db $47			  ; $82c8 - Unknown opcode
	CMP ($3f,X)			  ; $82c9: C1 3F   
	.db $47			  ; $82cb - Unknown opcode
	.db $c2			  ; $82cc - Unknown opcode
	.db $07			  ; $82cd - Unknown opcode
	ORA ptr1_lo			  ; $82ce: 05 06   
	.db $47			  ; $82d0 - Unknown opcode
	.db $c3			  ; $82d1 - Unknown opcode
	CLC					  ; $82d2: 18	  
	ASL $10				  ; $82d3: 06 10   
	ROL $470b,X			  ; $82d5: 3E 0B 47
	CPY $3f				  ; $82d8: C4 3F   
	.db $07			  ; $82da - Unknown opcode
	ASL tmp2,X			   ; $82db: 16 02   
	.db $47			  ; $82dd - Unknown opcode
	CMP #$00				 ; $82de: C9 00	; Compare with 0
	BMI $8297				; $82e0: 30 B5   
	.db $3f			  ; $82e2 - Unknown opcode
	.db $07			  ; $82e3 - Unknown opcode
	ASL ptr0_hi,X			; $82e4: 16 05   
	EOR #$d7				 ; $82e6: 49 D7   
	.db $0b			  ; $82e8 - Unknown opcode
	.db $07			  ; $82e9 - Unknown opcode
	.db $14			  ; $82ea - Unknown opcode
	LSR $1a				  ; $82eb: 46 1A   
	.db $0b			  ; $82ed - Unknown opcode
	EOR $36				  ; $82ee: 45 36   
	.db $3f			  ; $82f0 - Unknown opcode
	.db $07			  ; $82f1 - Unknown opcode
	.db $1b			  ; $82f2 - Unknown opcode
	BRK					  ; $82f3: 00	  
	BPL $833d				; $82f4: 10 47   
	CMP ($0b),Y			  ; $82f6: D1 0B   
	.db $07			  ; $82f8 - Unknown opcode
	.db $1b			  ; $82f9 - Unknown opcode
	PHP					  ; $82fa: 08	  
	BPL $8344				; $82fb: 10 47   
	CPY $470b				; $82fd: CC 0B 47
	DEX					  ; $8300: CA	  
	.db $3f			  ; $8301 - Unknown opcode
	.db $07			  ; $8302 - Unknown opcode
	.db $1b			  ; $8303 - Unknown opcode
	BRK					  ; $8304: 00	  
	BPL $834e				; $8305: 10 47   
	.db $d2			  ; $8307 - Unknown opcode
	.db $0b			  ; $8308 - Unknown opcode
	.db $47			  ; $8309 - Unknown opcode
	.db $cb			  ; $830a - Unknown opcode
	.db $3f			  ; $830b - Unknown opcode
	.db $07			  ; $830c - Unknown opcode
	.db $1b			  ; $830d - Unknown opcode
	BRK					  ; $830e: 00	  
	BPL $8358				; $830f: 10 47   
	.db $d3			  ; $8311 - Unknown opcode
	.db $0b			  ; $8312 - Unknown opcode
	.db $47			  ; $8313 - Unknown opcode
	CMP $073f				; $8314: CD 3F 07
	.db $1b			  ; $8317 - Unknown opcode
	BRK					  ; $8318: 00	  
	BPL $8362				; $8319: 10 47   
	.db $d4			  ; $831b - Unknown opcode
	.db $0b			  ; $831c - Unknown opcode
	.db $47			  ; $831d - Unknown opcode
	DEC $073f				; $831e: CE 3F 07
	.db $1b			  ; $8321 - Unknown opcode
	BRK					  ; $8322: 00	  
	BPL $832b				; $8323: 10 06   
	.db $47			  ; $8325 - Unknown opcode
	CMP tmp0,X			   ; $8326: D5 00   
	ASL $3ebf				; $8328: 0E BF 3E
loc_832B:
	.db $0b			  ; $832b - Unknown opcode
	.db $47			  ; $832c - Unknown opcode
	.db $cf			  ; $832d - Unknown opcode
	.db $3f			  ; $832e - Unknown opcode
	.db $07			  ; $832f - Unknown opcode
	.db $1b			  ; $8330 - Unknown opcode
	BRK					  ; $8331: 00	  
	BPL $837b				; $8332: 10 47   
	DEC $0b,X				; $8334: D6 0B   
	.db $47			  ; $8336 - Unknown opcode
	BNE $8378				; $8337: D0 3F   
	ORA ($68,X)			  ; $8339: 01 68   
	STA $07dd,X			  ; $833b: 9D DD 07
	.db $3f			  ; $833e - Unknown opcode
	.db $07			  ; $833f - Unknown opcode
	.db $1b			  ; $8340 - Unknown opcode
	PHP					  ; $8341: 08	  
	.db $04			  ; $8342 - Unknown opcode
	ASL ptr1_hi			  ; $8343: 06 07   
	.db $14			  ; $8345 - Unknown opcode
	.db $07			  ; $8346 - Unknown opcode
	.db $02			  ; $8347 - Unknown opcode
	.db $12			  ; $8348 - Unknown opcode
	.db $02			  ; $8349 - Unknown opcode
	.db $0b			  ; $834a - Unknown opcode
	.db $47			  ; $834b - Unknown opcode
	.db $df			  ; $834c - Unknown opcode
	.db $0b			  ; $834d - Unknown opcode
loc_834E:
	.db $47			  ; $834e - Unknown opcode
	.db $df			  ; $834f - Unknown opcode
	ROL $070b,X			  ; $8350: 3E 0B 07
	.db $14			  ; $8353 - Unknown opcode
	.db $12			  ; $8354 - Unknown opcode
	.db $02			  ; $8355 - Unknown opcode
	.db $0b			  ; $8356 - Unknown opcode
	.db $47			  ; $8357 - Unknown opcode
loc_8358:
	DEC $073f,X			  ; $8358: DE 3F 07
	ASL ptr0_hi,X			; $835b: 16 05   
	ASL $49				  ; $835d: 06 49   
	STX ptr1_hi			  ; $835f: 86 07   
	.db $03			  ; $8361 - Unknown opcode
loc_8362:
	.db $07			  ; $8362 - Unknown opcode
	EOR #$87				 ; $8363: 49 87   
	ROL $070b,X			  ; $8365: 3E 0B 07
	.db $1b			  ; $8368 - Unknown opcode
	PHP					  ; $8369: 08	  
	.db $02			  ; $836a - Unknown opcode
	.db $47			  ; $836b - Unknown opcode
	SBC ($0b,X)			  ; $836c: E1 0B	; Arithmetic
	.db $47			  ; $836e - Unknown opcode
	CPX #$3f				 ; $836f: E0 3F   
	.db $07			  ; $8371 - Unknown opcode
	.db $02			  ; $8372 - Unknown opcode
	.db $12			  ; $8373 - Unknown opcode
	ASL $0b				  ; $8374: 06 0B   
	.db $07			  ; $8376 - Unknown opcode
	ASL ptr0_hi,X			; $8377: 16 05   
	EOR #$85				 ; $8379: 49 85   
loc_837B:
	.db $0b			  ; $837b - Unknown opcode
	.db $47			  ; $837c - Unknown opcode
	.db $eb			  ; $837d - Unknown opcode
	.db $3f			  ; $837e - Unknown opcode
	.db $07			  ; $837f - Unknown opcode
	.db $1b			  ; $8380 - Unknown opcode
	ORA #$40				 ; $8381: 09 40   
	.db $44			  ; $8383 - Unknown opcode
	.db $d2			  ; $8384 - Unknown opcode
	.db $0b			  ; $8385 - Unknown opcode
	ASL $47				  ; $8386: 06 47   
	SED					  ; $8388: F8	  
	.db $07			  ; $8389 - Unknown opcode
	.db $13			  ; $838a - Unknown opcode
	.db $07			  ; $838b - Unknown opcode
	.db $47			  ; $838c - Unknown opcode
	SBC $0918,Y			  ; $838d: F9 18 09 ; Arithmetic
	.db $80			  ; $8390 - Unknown opcode
	ROL $073f,X			  ; $8391: 3E 3F 07
	.db $1b			  ; $8394 - Unknown opcode
	ORA #$40				 ; $8395: 09 40   
	PHA					  ; $8397: 48	  
	ORA ($0b,X)			  ; $8398: 01 0B   
	ASL $47				  ; $839a: 06 47   
	.db $fa			  ; $839c - Unknown opcode
	.db $07			  ; $839d - Unknown opcode
	.db $93			  ; $839e - Unknown opcode
	.db $07			  ; $839f - Unknown opcode
	.db $47			  ; $83a0 - Unknown opcode
	.db $fb			  ; $83a1 - Unknown opcode
	ROL $073f,X			  ; $83a2: 3E 3F 07
	.db $1b			  ; $83a5 - Unknown opcode
	ORA #$40				 ; $83a6: 09 40   
	PHA					  ; $83a8: 48	  
	.db $02			  ; $83a9 - Unknown opcode
	.db $0b			  ; $83aa - Unknown opcode
	.db $47			  ; $83ab - Unknown opcode
	.db $fc			  ; $83ac - Unknown opcode
	.db $3f			  ; $83ad - Unknown opcode
	.db $07			  ; $83ae - Unknown opcode
	ASL tmp3,X			   ; $83af: 16 03   
	PHA					  ; $83b1: 48	  
	BVS $83bf				; $83b2: 70 0B   
	PHA					  ; $83b4: 48	  
	ASL $3f				  ; $83b5: 06 3F   
	.db $07			  ; $83b7 - Unknown opcode
	ASL tmp3,X			   ; $83b8: 16 03   
	PHA					  ; $83ba: 48	  
	.db $6f			  ; $83bb - Unknown opcode
	.db $0b			  ; $83bc - Unknown opcode
	PHA					  ; $83bd: 48	  
	.db $03			  ; $83be - Unknown opcode
loc_83BF:
	.db $3f			  ; $83bf - Unknown opcode
	.db $07			  ; $83c0 - Unknown opcode
	ASL tmp3,X			   ; $83c1: 16 03   
	ASL ptr1_hi			  ; $83c3: 06 07   
	.db $1b			  ; $83c5 - Unknown opcode
	ORA $4810				; $83c6: 0D 10 48
	ROR $070b,X			  ; $83c9: 7E 0B 07
	.db $1b			  ; $83cc - Unknown opcode
	ORA #$08				 ; $83cd: 09 08   
	PHA					  ; $83cf: 48	  
	ADC $480b,X			  ; $83d0: 7D 0B 48 ; Arithmetic
	.db $72			  ; $83d3 - Unknown opcode
	ROL $480b,X			  ; $83d4: 3E 0B 48
	.db $04			  ; $83d7 - Unknown opcode
	.db $3f			  ; $83d8 - Unknown opcode
	.db $07			  ; $83d9 - Unknown opcode
	ASL tmp3,X			   ; $83da: 16 03   
	ASL ptr1_hi			  ; $83dc: 06 07   
	.db $1b			  ; $83de - Unknown opcode
	ORA $4810				; $83df: 0D 10 48
	.db $7c			  ; $83e2 - Unknown opcode
	.db $0b			  ; $83e3 - Unknown opcode
	.db $07			  ; $83e4 - Unknown opcode
	.db $1b			  ; $83e5 - Unknown opcode
	ORA #$08				 ; $83e6: 09 08   
	ORA ($18,X)			  ; $83e8: 01 18   
	LDA ($73,X)			  ; $83ea: A1 73   
	PHP					  ; $83ec: 08	  
	.db $0b			  ; $83ed - Unknown opcode
	PHA					  ; $83ee: 48	  
	ADC ($3e),Y			  ; $83ef: 71 3E	; Arithmetic
	.db $0b			  ; $83f1 - Unknown opcode
	PHA					  ; $83f2: 48	  
	ORA $3f				  ; $83f3: 05 3F   
	.db $07			  ; $83f5 - Unknown opcode
	ASL tmp3,X			   ; $83f6: 16 03   
	LSR $45				  ; $83f8: 46 45   
	.db $0b			  ; $83fa - Unknown opcode
	PHA					  ; $83fb: 48	  
	ASL $3f				  ; $83fc: 06 3F   
loc_83FE:
	.db $07			  ; $83fe - Unknown opcode
	ASL tmp3,X			   ; $83ff: 16 03   
	LSR $7c				  ; $8401: 46 7C   
	.db $0b			  ; $8403 - Unknown opcode
	LSR $49				  ; $8404: 46 49   
	.db $3f			  ; $8406 - Unknown opcode
	.db $07			  ; $8407 - Unknown opcode
	.db $1b			  ; $8408 - Unknown opcode
	ORA #$40				 ; $8409: 09 40   
	PHA					  ; $840b: 48	  
	ASL $0b				  ; $840c: 06 0B   
	.db $47			  ; $840e - Unknown opcode
	SBC $073f,X			  ; $840f: FD 3F 07 ; Arithmetic
	.db $14			  ; $8412 - Unknown opcode
	.db $07			  ; $8413 - Unknown opcode
	ASL ptr0_hi,X			; $8414: 16 05   
	EOR tmp0				 ; $8416: 45 00   
	.db $0b			  ; $8418 - Unknown opcode
	.db $07			  ; $8419 - Unknown opcode
	.db $1b			  ; $841a - Unknown opcode
	ORA #$40				 ; $841b: 09 40   
	PHA					  ; $841d: 48	  
	.db $07			  ; $841e - Unknown opcode
	.db $0b			  ; $841f - Unknown opcode
	LSR $4e				  ; $8420: 46 4E   
	.db $0b			  ; $8422 - Unknown opcode
	.db $07			  ; $8423 - Unknown opcode
	ASL tmp2,X			   ; $8424: 16 02   
	EOR $4f				  ; $8426: 45 4F   
	.db $0b			  ; $8428 - Unknown opcode
	EOR $5c				  ; $8429: 45 5C   
	.db $3f			  ; $842b - Unknown opcode
	.db $07			  ; $842c - Unknown opcode
	.db $1b			  ; $842d - Unknown opcode
	ASL $4780				; $842e: 0E 80 47
	SBC $470b				; $8431: ED 0B 47 ; Arithmetic
	CPX $073f				; $8434: EC 3F 07
	ASL ptr0_hi,X			; $8437: 16 05   
	EOR #$1c				 ; $8439: 49 1C   
	.db $0b			  ; $843b - Unknown opcode
	.db $07			  ; $843c - Unknown opcode
	.db $1b			  ; $843d - Unknown opcode
	ORA #$80				 ; $843e: 09 80   
	ASL ptr1_hi			  ; $8440: 06 07   
	.db $13			  ; $8442 - Unknown opcode
	.db $07			  ; $8443 - Unknown opcode
	.db $47			  ; $8444 - Unknown opcode
	.db $ff			  ; $8445 - Unknown opcode
	.db $0b			  ; $8446 - Unknown opcode
	ASL $48				  ; $8447: 06 48   
	BRK					  ; $8449: 00	  
	BRK					  ; $844a: 00	  
	STY $3ea4				; $844b: 8C A4 3E
	ROL $470b,X			  ; $844e: 3E 0B 47
	INC $003f,X			  ; $8451: FE 3F 00
	BVS $83fe				; $8454: 70 A8   
	.db $3f			  ; $8456 - Unknown opcode
	BRK					  ; $8457: 00	  
	.db $97			  ; $8458 - Unknown opcode
	.db $a7			  ; $8459 - Unknown opcode
	.db $3f			  ; $845a - Unknown opcode
	BRK					  ; $845b: 00	  
	ADC $3faa,X			  ; $845c: 7D AA 3F ; Arithmetic
	.db $47			  ; $845f - Unknown opcode
	INC ptr1_hi,X			; $8460: F6 07   
	ORA tmp0				 ; $8462: 05 00   
	ROR $0baa				; $8464: 6E AA 0B
	.db $47			  ; $8467 - Unknown opcode
	.db $f7			  ; $8468 - Unknown opcode
	.db $3f			  ; $8469 - Unknown opcode
	PHA					  ; $846a: 48	  
	ASL $3f				  ; $846b: 06 3F   
	.db $07			  ; $846d - Unknown opcode
	ASL tmp3,X			   ; $846e: 16 03   
	PHA					  ; $8470: 48	  
	PLA					  ; $8471: 68	  
	.db $0b			  ; $8472 - Unknown opcode
	.db $47			  ; $8473 - Unknown opcode
	INC $073f				; $8474: EE 3F 07
	ASL ptr0_hi,X			; $8477: 16 05   
	EOR #$1a				 ; $8479: 49 1A   
	.db $0b			  ; $847b - Unknown opcode
	.db $07			  ; $847c - Unknown opcode
	ASL tmp3,X			   ; $847d: 16 03   
	ASL ptr1_hi			  ; $847f: 06 07   
	.db $1b			  ; $8481 - Unknown opcode
	.db $0b			  ; $8482 - Unknown opcode
	.db $80			  ; $8483 - Unknown opcode
	ASL $48				  ; $8484: 06 48   
	ROR $6a48				; $8486: 6E 48 6A
	ROL $070b,X			  ; $8489: 3E 0B 07
	ORA ($6d),Y			  ; $848c: 11 6D   
	ASL $48				  ; $848e: 06 48   
	.db $6b			  ; $8490 - Unknown opcode
	.db $07			  ; $8491 - Unknown opcode
	ORA ptr1_lo			  ; $8492: 05 06   
	PHA					  ; $8494: 48	  
	JMP ($5100)			  ; $8495: 6C 00 51
	LDY #$3e				 ; $8498: A0 3E   
	.db $0b			  ; $849a - Unknown opcode
	PHA					  ; $849b: 48	  
	ADC $0b3e				; $849c: 6D 3E 0B ; Arithmetic
	ASL $48				  ; $849f: 06 48   
	ADC #$48				 ; $84a1: 69 48	; Arithmetic
	ROR					  ; $84a3: 6A	  
	ROL $0b3e,X			  ; $84a4: 3E 3E 0B
	.db $07			  ; $84a7 - Unknown opcode
	.db $1b			  ; $84a8 - Unknown opcode
	ORA #$40				 ; $84a9: 09 40   
	PHA					  ; $84ab: 48	  
	.db $04			  ; $84ac - Unknown opcode
	.db $0b			  ; $84ad - Unknown opcode
	.db $07			  ; $84ae - Unknown opcode
	.db $14			  ; $84af - Unknown opcode
	.db $47			  ; $84b0 - Unknown opcode
	.db $ef			  ; $84b1 - Unknown opcode
	.db $0b			  ; $84b2 - Unknown opcode
	.db $47			  ; $84b3 - Unknown opcode
	BEQ $84f5				; $84b4: F0 3F   
	.db $07			  ; $84b6 - Unknown opcode
	ASL tmp3,X			   ; $84b7: 16 03   
	ASL $46				  ; $84b9: 06 46   
	.db $3b			  ; $84bb - Unknown opcode
	.db $07			  ; $84bc - Unknown opcode
	.db $1b			  ; $84bd - Unknown opcode
	.db $0b			  ; $84be - Unknown opcode
	RTI					  ; $84bf: 40	  
	ASL $48				  ; $84c0: 06 48   
	.db $62			  ; $84c2 - Unknown opcode
	.db $07			  ; $84c3 - Unknown opcode
	ORA tmp1				 ; $84c4: 05 01   
	.db $2b			  ; $84c6 - Unknown opcode
	LDY #$64				 ; $84c7: A0 64   
	PHP					  ; $84c9: 08	  
	.db $0b			  ; $84ca - Unknown opcode
	PHA					  ; $84cb: 48	  
	.db $63			  ; $84cc - Unknown opcode
	ROL $480b,X			  ; $84cd: 3E 0B 48
	ADC ($3e,X)			  ; $84d0: 61 3E	; Arithmetic
	.db $0b			  ; $84d2 - Unknown opcode
	.db $07			  ; $84d3 - Unknown opcode
	.db $1b			  ; $84d4 - Unknown opcode
	ORA #$40				 ; $84d5: 09 40   
	PHA					  ; $84d7: 48	  
	PHP					  ; $84d8: 08	  
	.db $0b			  ; $84d9 - Unknown opcode
	ASL ptr1_hi			  ; $84da: 06 07   
	.db $14			  ; $84dc - Unknown opcode
	ASL $46				  ; $84dd: 06 46   
	.db $3b			  ; $84df - Unknown opcode
	LSR $3c				  ; $84e0: 46 3C   
	ROL $450b,X			  ; $84e2: 3E 0B 45
	PHA					  ; $84e5: 48	  
	ROL $073f,X			  ; $84e6: 3E 3F 07
	ASL ptr0_hi,X			; $84e9: 16 05   
	.db $47			  ; $84eb - Unknown opcode
	SBC ($0b),Y			  ; $84ec: F1 0B	; Arithmetic
	.db $07			  ; $84ee - Unknown opcode
	ASL tmp3,X			   ; $84ef: 16 03   
	ASL $48				  ; $84f1: 06 48   
	CLI					  ; $84f3: 58	  
	.db $07			  ; $84f4 - Unknown opcode
loc_84F5:
	ORA $48				  ; $84f5: 05 48   
	EOR $480b,Y			  ; $84f7: 59 0B 48
	.db $5a			  ; $84fa - Unknown opcode
	ROL $070b,X			  ; $84fb: 3E 0B 07
	.db $1b			  ; $84fe - Unknown opcode
	ORA #$40				 ; $84ff: 09 40   
	PHA					  ; $8501: 48	  
	ORA #$0b				 ; $8502: 09 0B   
	.db $47			  ; $8504 - Unknown opcode
	SBC ($3f),Y			  ; $8505: F1 3F	; Arithmetic
	.db $07			  ; $8507 - Unknown opcode
	ASL ptr0_hi,X			; $8508: 16 05   
	EOR #$12				 ; $850a: 49 12   
	.db $0b			  ; $850c - Unknown opcode
	.db $07			  ; $850d - Unknown opcode
	ASL tmp3,X			   ; $850e: 16 03   
	PHA					  ; $8510: 48	  
	.db $5b			  ; $8511 - Unknown opcode
	.db $0b			  ; $8512 - Unknown opcode
	.db $47			  ; $8513 - Unknown opcode
	.db $f4			  ; $8514 - Unknown opcode
	.db $3f			  ; $8515 - Unknown opcode
	.db $07			  ; $8516 - Unknown opcode
	ASL ptr0_hi,X			; $8517: 16 05   
	LSR					  ; $8519: 4A	  
	SBC ($0b,X)			  ; $851a: E1 0B	; Arithmetic
	.db $07			  ; $851c - Unknown opcode
	ASL tmp3,X			   ; $851d: 16 03   
	PHA					  ; $851f: 48	  
	RTS					  ; $8520: 60	  
	.db $0b			  ; $8521 - Unknown opcode
	.db $47			  ; $8522 - Unknown opcode
	SBC $3f,X				; $8523: F5 3F	; Arithmetic
	.db $07			  ; $8525 - Unknown opcode
	ASL ptr0_hi,X			; $8526: 16 05   
	EOR #$11				 ; $8528: 49 11   
	.db $0b			  ; $852a - Unknown opcode
	.db $07			  ; $852b - Unknown opcode
	ASL tmp3,X			   ; $852c: 16 03   
	ORA ($16,X)			  ; $852e: 01 16   
	LDY #$5c				 ; $8530: A0 5C   
	PHP					  ; $8532: 08	  
	.db $0b			  ; $8533 - Unknown opcode
	.db $07			  ; $8534 - Unknown opcode
	.db $14			  ; $8535 - Unknown opcode
	.db $07			  ; $8536 - Unknown opcode
	.db $1b			  ; $8537 - Unknown opcode
	ORA #$40				 ; $8538: 09 40   
	PHA					  ; $853a: 48	  
	ASL $0b				  ; $853b: 06 0B   
	.db $47			  ; $853d - Unknown opcode
	.db $f2			  ; $853e - Unknown opcode
	.db $0b			  ; $853f - Unknown opcode
	.db $47			  ; $8540 - Unknown opcode
	.db $f3			  ; $8541 - Unknown opcode
	.db $3f			  ; $8542 - Unknown opcode
	.db $07			  ; $8543 - Unknown opcode
	.db $1b			  ; $8544 - Unknown opcode
	ORA #$04				 ; $8545: 09 04   
	PHA					  ; $8547: 48	  
	STA ($0b,X)			  ; $8548: 81 0B   
	ASL $48				  ; $854a: 06 48   
	.db $7f			  ; $854c - Unknown opcode
	.db $07			  ; $854d - Unknown opcode
	ORA ptr1_lo			  ; $854e: 05 06   
	ORA ($8c,X)			  ; $8550: 01 8C   
	STA $0880,X			  ; $8552: 9D 80 08
	PHA					  ; $8555: 48	  
	STA ($3e,X)			  ; $8556: 81 3E   
	.db $0b			  ; $8558 - Unknown opcode
	PHA					  ; $8559: 48	  
	.db $82			  ; $855a - Unknown opcode
	ROL $073f,X			  ; $855b: 3E 3F 07
	.db $02			  ; $855e - Unknown opcode
	BRK					  ; $855f: 00	  
	JMP $0ba2				; $8560: 4C A2 0B
	LSR $7a				  ; $8563: 46 7A   
	.db $3f			  ; $8565 - Unknown opcode
	.db $07			  ; $8566 - Unknown opcode
	.db $1b			  ; $8567 - Unknown opcode
	ASL					  ; $8568: 0A	  
	ORA (ptr1_lo,X)		  ; $8569: 01 06   
	.db $07			  ; $856b - Unknown opcode
	.db $02			  ; $856c - Unknown opcode
	BRK					  ; $856d: 00	  
	JMP $0ba2				; $856e: 4C A2 0B
	LSR $7a				  ; $8571: 46 7A   
	ROL $070b,X			  ; $8573: 3E 0B 07
	.db $02			  ; $8576 - Unknown opcode
	ASL $43				  ; $8577: 06 43   
	.db $23			  ; $8579 - Unknown opcode
	.db $07			  ; $857a - Unknown opcode
	ORA ptr1_lo			  ; $857b: 05 06   
	.db $43			  ; $857d - Unknown opcode
	BIT tmp0				 ; $857e: 24 00   
	.db $1f			  ; $8580 - Unknown opcode
	CLV					  ; $8581: B8	  
	ROL $430b,X			  ; $8582: 3E 0B 43
	AND $3e				  ; $8585: 25 3E   
	.db $0b			  ; $8587 - Unknown opcode
	ASL $43				  ; $8588: 06 43   
	ROL ptr1_hi			  ; $858a: 26 07   
	ORA tmp0				 ; $858c: 05 00   
	PLA					  ; $858e: 68	  
	LDY #$0b				 ; $858f: A0 0B   
	.db $43			  ; $8591 - Unknown opcode
	PLP					  ; $8592: 28	  
	ROL $073f,X			  ; $8593: 3E 3F 07
	ASL ptr0_hi,X			; $8596: 16 05   
	.db $07			  ; $8598 - Unknown opcode
	.db $83			  ; $8599 - Unknown opcode
	ORA $12				  ; $859a: 05 12   
	ORA ($0b,X)			  ; $859c: 01 0B   
	ASL ptr1_hi			  ; $859e: 06 07   
	.db $02			  ; $85a0 - Unknown opcode
	.db $12			  ; $85a1 - Unknown opcode
	ORA ($0b,X)			  ; $85a2: 01 0B   
	EOR #$7a				 ; $85a4: 49 7A   
	ROL $070b,X			  ; $85a6: 3E 0B 07
	.db $1b			  ; $85a9 - Unknown opcode
	.db $0b			  ; $85aa - Unknown opcode
	PHP					  ; $85ab: 08	  
	PHA					  ; $85ac: 48	  
	.db $9b			  ; $85ad - Unknown opcode
	.db $0b			  ; $85ae - Unknown opcode
	.db $07			  ; $85af - Unknown opcode
	.db $1b			  ; $85b0 - Unknown opcode
	ORA tmp2				 ; $85b1: 05 02   
	ASL $48				  ; $85b3: 06 48   
	STA current_bank,Y	   ; $85b5: 99 07 05
	ASL $48				  ; $85b8: 06 48   
	TXS					  ; $85ba: 9A	  
	BRK					  ; $85bb: 00	  
	STA $a0,X				; $85bc: 95 A0   
	PHA					  ; $85be: 48	  
	.db $9b			  ; $85bf - Unknown opcode
	CLC					  ; $85c0: 18	  
	.db $0b			  ; $85c1 - Unknown opcode
	PHP					  ; $85c2: 08	  
	BRK					  ; $85c3: 00	  
	CLC					  ; $85c4: 18	  
	.db $d2			  ; $85c5 - Unknown opcode
	ROL $480b,X			  ; $85c6: 3E 0B 48
	.db $9c			  ; $85c9 - Unknown opcode
	ROL $070b,X			  ; $85ca: 3E 0B 07
	.db $1b			  ; $85cd - Unknown opcode
	.db $0b			  ; $85ce - Unknown opcode
	.db $04			  ; $85cf - Unknown opcode
	.db $43			  ; $85d0 - Unknown opcode
	LDA $060b				; $85d1: AD 0B 06
	PHA					  ; $85d4: 48	  
	.db $4b			  ; $85d5 - Unknown opcode
	BRK					  ; $85d6: 00	  
	STA $18a0,X			  ; $85d7: 9D A0 18
	.db $0b			  ; $85da - Unknown opcode
	.db $04			  ; $85db - Unknown opcode
	ROL $073f,X			  ; $85dc: 3E 3F 07
	ASL ptr0_hi,X			; $85df: 16 05   
	.db $07			  ; $85e1 - Unknown opcode
	.db $83			  ; $85e2 - Unknown opcode
	ORA $49				  ; $85e3: 05 49   
	.db $77			  ; $85e5 - Unknown opcode
	.db $0b			  ; $85e6 - Unknown opcode
	ASL $49				  ; $85e7: 06 49   
	SEI					  ; $85e9: 78	  
	EOR #$79				 ; $85ea: 49 79   
	ROL $070b,X			  ; $85ec: 3E 0B 07
	.db $1b			  ; $85ef - Unknown opcode
	.db $0b			  ; $85f0 - Unknown opcode
	JSR $9f48				; $85f1: 20 48 9F ; -> sub_9F48
	.db $0b			  ; $85f4 - Unknown opcode
	PHA					  ; $85f5: 48	  
	.db $23			  ; $85f6 - Unknown opcode
	.db $3f			  ; $85f7 - Unknown opcode
	.db $07			  ; $85f8 - Unknown opcode
	.db $14			  ; $85f9 - Unknown opcode
	.db $07			  ; $85fa - Unknown opcode
	.db $1b			  ; $85fb - Unknown opcode
	BPL $863e				; $85fc: 10 40   
	ORA ($e0,X)			  ; $85fe: 01 E0   
	STA $080a,X			  ; $8600: 9D 0A 08
	.db $0b			  ; $8603 - Unknown opcode
	PHA					  ; $8604: 48	  
	ASL					  ; $8605: 0A	  
	.db $0b			  ; $8606 - Unknown opcode
	ORA ($da,X)			  ; $8607: 01 DA   
	STA $080a,X			  ; $8609: 9D 0A 08
	.db $3f			  ; $860c - Unknown opcode
	.db $07			  ; $860d - Unknown opcode
	.db $14			  ; $860e - Unknown opcode
	.db $07			  ; $860f - Unknown opcode
	ASL ptr0_hi,X			; $8610: 16 05   
	ORA ($cb,X)			  ; $8612: 01 CB   
	.db $ab			  ; $8614 - Unknown opcode
	STA ($09,X)			  ; $8615: 81 09   
	.db $0b			  ; $8617 - Unknown opcode
	.db $07			  ; $8618 - Unknown opcode
	.db $1b			  ; $8619 - Unknown opcode
	ORA $10				  ; $861a: 05 10   
	.db $07			  ; $861c - Unknown opcode
	.db $1b			  ; $861d - Unknown opcode
	ORA ptr0_lo			  ; $861e: 05 04   
	PHA					  ; $8620: 48	  
	EOR $0b				  ; $8621: 45 0B   
	PHA					  ; $8623: 48	  
	.db $1b			  ; $8624 - Unknown opcode
	.db $0b			  ; $8625 - Unknown opcode
	.db $07			  ; $8626 - Unknown opcode
	.db $1b			  ; $8627 - Unknown opcode
	ORA $20				  ; $8628: 05 20   
	PHA					  ; $862a: 48	  
	ORA $060b,Y			  ; $862b: 19 0B 06
	.db $07			  ; $862e - Unknown opcode
	.db $1b			  ; $862f - Unknown opcode
	ORA ptr0_lo			  ; $8630: 05 04   
	PHA					  ; $8632: 48	  
	.db $44			  ; $8633 - Unknown opcode
	.db $0b			  ; $8634 - Unknown opcode
	PHA					  ; $8635: 48	  
	ORA $48,X				; $8636: 15 48   
	ASL ptr1_hi,X			; $8638: 16 07   
	ORA ptr1_lo			  ; $863a: 05 06   
	PHA					  ; $863c: 48	  
	.db $17			  ; $863d - Unknown opcode
loc_863E:
	CLC					  ; $863e: 18	  
	ORA $20				  ; $863f: 05 20   
	ROL $480b,X			  ; $8641: 3E 0B 48
	CLC					  ; $8644: 18	  
	ROL $070b,X			  ; $8645: 3E 0B 07
	ASL ptr0_hi,X			; $8648: 16 05   
	EOR $cb				  ; $864a: 45 CB   
	.db $0b			  ; $864c - Unknown opcode
	.db $07			  ; $864d - Unknown opcode
	.db $1b			  ; $864e - Unknown opcode
	ORA ptr0_lo			  ; $864f: 05 04   
	PHA					  ; $8651: 48	  
	LSR					  ; $8652: 4A	  
	.db $0b			  ; $8653 - Unknown opcode
	PHA					  ; $8654: 48	  
	.db $22			  ; $8655 - Unknown opcode
	.db $3f			  ; $8656 - Unknown opcode
	.db $07			  ; $8657 - Unknown opcode
	.db $1b			  ; $8658 - Unknown opcode
	ORA ptr0_lo			  ; $8659: 05 04   
	PHA					  ; $865b: 48	  
	EOR #$0b				 ; $865c: 49 0B   
	PHA					  ; $865e: 48	  
	AND ($3f,X)			  ; $865f: 21 3F   
	.db $07			  ; $8661 - Unknown opcode
	.db $1b			  ; $8662 - Unknown opcode
	ORA ptr0_lo			  ; $8663: 05 04   
	ASL $48				  ; $8665: 06 48   
	LSR ptr1_hi			  ; $8667: 46 07   
	ORA $48				  ; $8669: 05 48   
	.db $47			  ; $866b - Unknown opcode
	.db $0b			  ; $866c - Unknown opcode
	PHA					  ; $866d: 48	  
	PHA					  ; $866e: 48	  
	ROL $070b,X			  ; $866f: 3E 0B 07
	.db $14			  ; $8672 - Unknown opcode
	ASL $48				  ; $8673: 06 48   
	.db $1c			  ; $8675 - Unknown opcode
	.db $07			  ; $8676 - Unknown opcode
	ORA $48				  ; $8677: 05 48   
	ORA $480b,X			  ; $8679: 1D 0B 48
	ASL $0b3e,X			  ; $867c: 1E 3E 0B
	PHA					  ; $867f: 48	  
	JSR $073f				; $8680: 20 3F 07
	ASL ptr0_hi,X			; $8683: 16 05   
	ASL $49				  ; $8685: 06 49   
	.db $7b			  ; $8687 - Unknown opcode
	.db $07			  ; $8688 - Unknown opcode
	.db $03			  ; $8689 - Unknown opcode
	ORA $49				  ; $868a: 05 49   
	.db $7c			  ; $868c - Unknown opcode
	ROL $070b,X			  ; $868d: 3E 0B 07
	.db $1b			  ; $8690 - Unknown opcode
	ORA ptr0_lo			  ; $8691: 05 04   
	PHA					  ; $8693: 48	  
	.db $43			  ; $8694 - Unknown opcode
	.db $0b			  ; $8695 - Unknown opcode
	PHA					  ; $8696: 48	  
	.db $12			  ; $8697 - Unknown opcode
	.db $3f			  ; $8698 - Unknown opcode
	.db $07			  ; $8699 - Unknown opcode
	.db $02			  ; $869a - Unknown opcode
	.db $12			  ; $869b - Unknown opcode
	.db $02			  ; $869c - Unknown opcode
	.db $0b			  ; $869d - Unknown opcode
	.db $07			  ; $869e - Unknown opcode
	ASL ptr0_hi,X			; $869f: 16 05   
	.db $07			  ; $86a1 - Unknown opcode
	.db $03			  ; $86a2 - Unknown opcode
	ORA $49				  ; $86a3: 05 49   
	SEI					  ; $86a5: 78	  
	.db $0b			  ; $86a6 - Unknown opcode
	.db $12			  ; $86a7 - Unknown opcode
	.db $02			  ; $86a8 - Unknown opcode
	.db $0b			  ; $86a9 - Unknown opcode
	.db $07			  ; $86aa - Unknown opcode
	.db $1b			  ; $86ab - Unknown opcode
	.db $0b			  ; $86ac - Unknown opcode
	JSR $9e48				; $86ad: 20 48 9E ; -> sub_9E48
	.db $0b			  ; $86b0 - Unknown opcode
	PHA					  ; $86b1: 48	  
	.db $1f			  ; $86b2 - Unknown opcode
	.db $3f			  ; $86b3 - Unknown opcode
	LSR map_number		   ; $86b4: 46 63   
	.db $07			  ; $86b6 - Unknown opcode
	.db $03			  ; $86b7 - Unknown opcode
	ORA tmp0				 ; $86b8: 05 00   
	STY $3fa4				; $86ba: 8C A4 3F
	.db $07			  ; $86bd - Unknown opcode
	.db $1b			  ; $86be - Unknown opcode
	.db $0b			  ; $86bf - Unknown opcode
	.db $04			  ; $86c0 - Unknown opcode
	ORA ($a2,X)			  ; $86c1: 01 A2   
	LDY #$4c				 ; $86c3: A0 4C   
	PHP					  ; $86c5: 08	  
	.db $0b			  ; $86c6 - Unknown opcode
	ASL $48				  ; $86c7: 06 48   
	BIT ptr1_hi			  ; $86c9: 24 07   
	ORA ptr1_lo			  ; $86cb: 05 06   
	PHA					  ; $86cd: 48	  
	AND ptr1_hi			  ; $86ce: 25 07   
	ORA ptr1_lo			  ; $86d0: 05 06   
	PHA					  ; $86d2: 48	  
	ROL tmp0				 ; $86d3: 26 00   
	SBC $3ea0,Y			  ; $86d5: F9 A0 3E ; Arithmetic
	.db $0b			  ; $86d8 - Unknown opcode
	PHA					  ; $86d9: 48	  
	.db $27			  ; $86da - Unknown opcode
	ROL $480b,X			  ; $86db: 3E 0B 48
	.db $27			  ; $86de - Unknown opcode
	ROL $073f,X			  ; $86df: 3E 3F 07
	ASL ptr0_hi,X			; $86e2: 16 05   
	EOR #$e8				 ; $86e4: 49 E8   
	.db $0b			  ; $86e6 - Unknown opcode
	.db $07			  ; $86e7 - Unknown opcode
	.db $1b			  ; $86e8 - Unknown opcode
	ASL $4340				; $86e9: 0E 40 43
	LDA ($0b),Y			  ; $86ec: B1 0B   
	PHA					  ; $86ee: 48	  
	ROL $3f,X				; $86ef: 36 3F   
	.db $07			  ; $86f1 - Unknown opcode
	ASL ptr0_hi,X			; $86f2: 16 05   
	EOR #$e9				 ; $86f4: 49 E9   
	.db $0b			  ; $86f6 - Unknown opcode
	ORA ($21,X)			  ; $86f7: 01 21   
	LDA $29				  ; $86f9: A5 29   
	PHP					  ; $86fb: 08	  
	.db $3f			  ; $86fc - Unknown opcode
	.db $07			  ; $86fd - Unknown opcode
	.db $1b			  ; $86fe - Unknown opcode
	PHP					  ; $86ff: 08	  
	ORA ($48,X)			  ; $8700: 01 48   
	.db $8f			  ; $8702 - Unknown opcode
	.db $0b			  ; $8703 - Unknown opcode
	.db $07			  ; $8704 - Unknown opcode
	.db $1b			  ; $8705 - Unknown opcode
	ORA tmp1				 ; $8706: 05 01   
	PHA					  ; $8708: 48	  
	.db $3c			  ; $8709 - Unknown opcode
	.db $0b			  ; $870a - Unknown opcode
	.db $07			  ; $870b - Unknown opcode
	ORA ($77),Y			  ; $870c: 11 77   
	PHA					  ; $870e: 48	  
	.db $3c			  ; $870f - Unknown opcode
	.db $0b			  ; $8710 - Unknown opcode
	.db $07			  ; $8711 - Unknown opcode
	.db $14			  ; $8712 - Unknown opcode
	.db $07			  ; $8713 - Unknown opcode
	.db $1b			  ; $8714 - Unknown opcode
	ORA $08				  ; $8715: 05 08   
	PHA					  ; $8717: 48	  
	SEC					  ; $8718: 38	  
	.db $0b			  ; $8719 - Unknown opcode
	ASL $48				  ; $871a: 06 48   
	.db $37			  ; $871c - Unknown opcode
	PHA					  ; $871d: 48	  
	SEC					  ; $871e: 38	  
	BRK					  ; $871f: 00	  
	DEC $3ea4,X			  ; $8720: DE A4 3E
	.db $0b			  ; $8723 - Unknown opcode
	ASL $48				  ; $8724: 06 48   
	AND $f001,Y			  ; $8726: 39 01 F0
	LDY $3a				  ; $8729: A4 3A   
	PHP					  ; $872b: 08	  
	ROL $073f,X			  ; $872c: 3E 3F 07
	ASL ptr0_hi,X			; $872f: 16 05   
	ASL $48				  ; $8731: 06 48   
	BCC $877e				; $8733: 90 49   
	.db $e3			  ; $8735 - Unknown opcode
	ROL $070b,X			  ; $8736: 3E 0B 07
	.db $1b			  ; $8739 - Unknown opcode
	PHP					  ; $873a: 08	  
	ORA (ptr1_lo,X)		  ; $873b: 01 06   
	PHA					  ; $873d: 48	  
	BCC $8788				; $873e: 90 48   
	STA ($3e),Y			  ; $8740: 91 3E   
	.db $0b			  ; $8742 - Unknown opcode
	LSR $6d				  ; $8743: 46 6D   
	.db $3f			  ; $8745 - Unknown opcode
	.db $07			  ; $8746 - Unknown opcode
	ASL ptr0_hi,X			; $8747: 16 05   
	.db $12			  ; $8749 - Unknown opcode
	.db $03			  ; $874a - Unknown opcode
	.db $0b			  ; $874b - Unknown opcode
	PHA					  ; $874c: 48	  
	PLP					  ; $874d: 28	  
	.db $3f			  ; $874e - Unknown opcode
	.db $07			  ; $874f - Unknown opcode
	ASL ptr0_hi,X			; $8750: 16 05   
	EOR #$eb				 ; $8752: 49 EB   
	.db $0b			  ; $8754 - Unknown opcode
	.db $07			  ; $8755 - Unknown opcode
	.db $1b			  ; $8756 - Unknown opcode
	ORA ptr0_lo			  ; $8757: 05 04   
	PHA					  ; $8759: 48	  
	ROL $480b,X			  ; $875a: 3E 0B 48
	AND $483f,X			  ; $875d: 3D 3F 48
	.db $3f			  ; $8760 - Unknown opcode
	.db $07			  ; $8761 - Unknown opcode
	ORA ($56),Y			  ; $8762: 11 56   
	ORA (tmp1,X)			 ; $8764: 01 01   
	LDA $40				  ; $8766: A5 40   
	PHP					  ; $8768: 08	  
	.db $3f			  ; $8769 - Unknown opcode
	.db $07			  ; $876a - Unknown opcode
	ASL ptr0_hi,X			; $876b: 16 05   
	EOR #$ea				 ; $876d: 49 EA   
	.db $0b			  ; $876f - Unknown opcode
	ASL $43				  ; $8770: 06 43   
	LSR					  ; $8772: 4A	  
	BRK					  ; $8773: 00	  
	.db $74			  ; $8774 - Unknown opcode
	TAX					  ; $8775: AA	  
	ROL $073f,X			  ; $8776: 3E 3F 07
	ASL ptr0_hi,X			; $8779: 16 05   
	EOR #$e4				 ; $877b: 49 E4   
	.db $0b			  ; $877d - Unknown opcode
loc_877E:
	.db $07			  ; $877e - Unknown opcode
	.db $1b			  ; $877f - Unknown opcode
	ORA tmp2				 ; $8780: 05 02   
	LSR $72				  ; $8782: 46 72   
	.db $0b			  ; $8784 - Unknown opcode
	LSR $6e				  ; $8785: 46 6E   
	.db $3f			  ; $8787 - Unknown opcode
loc_8788:
	.db $07			  ; $8788 - Unknown opcode
	ASL ptr0_hi,X			; $8789: 16 05   
	EOR #$e5				 ; $878b: 49 E5   
	.db $0b			  ; $878d - Unknown opcode
	.db $07			  ; $878e - Unknown opcode
	.db $1b			  ; $878f - Unknown opcode
	ORA tmp2				 ; $8790: 05 02   
	LSR $73				  ; $8792: 46 73   
	.db $0b			  ; $8794 - Unknown opcode
	LSR $6f				  ; $8795: 46 6F   
	.db $3f			  ; $8797 - Unknown opcode
	.db $07			  ; $8798 - Unknown opcode
	ASL ptr0_hi,X			; $8799: 16 05   
	EOR #$e6				 ; $879b: 49 E6   
	.db $0b			  ; $879d - Unknown opcode
	PHA					  ; $879e: 48	  
	.db $34			  ; $879f - Unknown opcode
	.db $3f			  ; $87a0 - Unknown opcode
	.db $07			  ; $87a1 - Unknown opcode
	ASL ptr0_hi,X			; $87a2: 16 05   
	EOR #$e7				 ; $87a4: 49 E7   
	.db $0b			  ; $87a6 - Unknown opcode
	PHA					  ; $87a7: 48	  
	AND $3f,X				; $87a8: 35 3F   
	.db $07			  ; $87aa - Unknown opcode
	.db $1b			  ; $87ab - Unknown opcode
	PHP					  ; $87ac: 08	  
	ORA ($48,X)			  ; $87ad: 01 48   
	STX $070b				; $87af: 8E 0B 07
	.db $1b			  ; $87b2 - Unknown opcode
	ORA tmp2				 ; $87b3: 05 02   
	ASL $46				  ; $87b5: 06 46   
	.db $74			  ; $87b7 - Unknown opcode
	CLC					  ; $87b8: 18	  
	.db $0b			  ; $87b9 - Unknown opcode
	BPL $87fa				; $87ba: 10 3E   
	.db $0b			  ; $87bc - Unknown opcode
	LSR $70				  ; $87bd: 46 70   
	.db $3f			  ; $87bf - Unknown opcode
	.db $07			  ; $87c0 - Unknown opcode
	.db $1b			  ; $87c1 - Unknown opcode
	ASL					  ; $87c2: 0A	  
	BPL $880d				; $87c3: 10 48   
	.db $97			  ; $87c5 - Unknown opcode
	.db $0b			  ; $87c6 - Unknown opcode
	.db $07			  ; $87c7 - Unknown opcode
	.db $1b			  ; $87c8 - Unknown opcode
	.db $0c			  ; $87c9 - Unknown opcode
	RTI					  ; $87ca: 40	  
	ASL $48				  ; $87cb: 06 48   
	TYA					  ; $87cd: 98	  
	CLC					  ; $87ce: 18	  
	.db $0c			  ; $87cf - Unknown opcode
	.db $80			  ; $87d0 - Unknown opcode
	ROL $060b,X			  ; $87d1: 3E 0B 06
	PHA					  ; $87d4: 48	  
	.db $92			  ; $87d5 - Unknown opcode
	.db $07			  ; $87d6 - Unknown opcode
	ORA ptr1_lo			  ; $87d7: 05 06   
	.db $07			  ; $87d9 - Unknown opcode
	.db $1b			  ; $87da - Unknown opcode
	.db $0b			  ; $87db - Unknown opcode
	JSR $0106				; $87dc: 20 06 01
	BIT $95a6				; $87df: 2C A6 95
	PHP					  ; $87e2: 08	  
	ROL $480b,X			  ; $87e3: 3E 0B 48
	STY $3e,X				; $87e6: 94 3E   
	.db $0b			  ; $87e8 - Unknown opcode
	PHA					  ; $87e9: 48	  
	.db $93			  ; $87ea - Unknown opcode
	ROL $073f,X			  ; $87eb: 3E 3F 07
	ASL ptr0_hi,X			; $87ee: 16 05   
	ORA ($97,X)			  ; $87f0: 01 97   
	TAX					  ; $87f2: AA	  
	ASL $09				  ; $87f3: 06 09   
	.db $0b			  ; $87f5 - Unknown opcode
	PHA					  ; $87f6: 48	  
	LDA $3f				  ; $87f7: A5 3F   
	.db $07			  ; $87f9 - Unknown opcode
loc_87FA:
	ASL ptr0_hi,X			; $87fa: 16 05   
	EOR #$05				 ; $87fc: 49 05   
	.db $0b			  ; $87fe - Unknown opcode
	PHA					  ; $87ff: 48	  
	LDX $3f				  ; $8800: A6 3F   
	.db $07			  ; $8802 - Unknown opcode
	ASL ptr0_hi,X			; $8803: 16 05   
	EOR #$04				 ; $8805: 49 04   
	.db $0b			  ; $8807 - Unknown opcode
	PHA					  ; $8808: 48	  
	.db $a7			  ; $8809 - Unknown opcode
	.db $3f			  ; $880a - Unknown opcode
	PHA					  ; $880b: 48	  
	EOR (ptr1_hi),Y		  ; $880c: 51 07   
	ORA $45				  ; $880e: 05 45   
	ORA ($0b,X)			  ; $8810: 01 0B   
	PHA					  ; $8812: 48	  
	.db $52			  ; $8813 - Unknown opcode
	.db $3f			  ; $8814 - Unknown opcode
	PHA					  ; $8815: 48	  
	.db $53			  ; $8816 - Unknown opcode
	.db $07			  ; $8817 - Unknown opcode
	ORA tmp1				 ; $8818: 05 01   
	DEC $9f,X				; $881a: D6 9F   
	.db $53			  ; $881c - Unknown opcode
	PHP					  ; $881d: 08	  
	.db $0b			  ; $881e - Unknown opcode
	PHA					  ; $881f: 48	  
	.db $57			  ; $8820 - Unknown opcode
	.db $3f			  ; $8821 - Unknown opcode
	.db $07			  ; $8822 - Unknown opcode
	.db $1b			  ; $8823 - Unknown opcode
	ORA $4810				; $8824: 0D 10 48
	STA $070b				; $8827: 8D 0B 07
	.db $1b			  ; $882a - Unknown opcode
	.db $0b			  ; $882b - Unknown opcode
	JSR $4806				; $882c: 20 06 48
	STY $0918				; $882f: 8C 18 09
	PHP					  ; $8832: 08	  
	ROL $070b,X			  ; $8833: 3E 0B 07
	.db $1b			  ; $8836 - Unknown opcode
	.db $0b			  ; $8837 - Unknown opcode
	RTI					  ; $8838: 40	  
	PHA					  ; $8839: 48	  
	.db $8b			  ; $883a - Unknown opcode
	.db $0b			  ; $883b - Unknown opcode
	.db $07			  ; $883c - Unknown opcode
	.db $1b			  ; $883d - Unknown opcode
	PHP					  ; $883e: 08	  
	ORA (ptr1_lo,X)		  ; $883f: 01 06   
	PHA					  ; $8841: 48	  
	TXA					  ; $8842: 8A	  
	CLC					  ; $8843: 18	  
	.db $0b			  ; $8844 - Unknown opcode
	RTI					  ; $8845: 40	  
	ROL $070b,X			  ; $8846: 3E 0B 07
	.db $1b			  ; $8849 - Unknown opcode
	ORA tmp1				 ; $884a: 05 01   
	PHA					  ; $884c: 48	  
	.db $89			  ; $884d - Unknown opcode
	.db $0b			  ; $884e - Unknown opcode
	ASL $48				  ; $884f: 06 48   
	STX ptr1_hi			  ; $8851: 86 07   
	ORA $48				  ; $8853: 05 48   
	.db $87			  ; $8855 - Unknown opcode
	.db $0b			  ; $8856 - Unknown opcode
	PHA					  ; $8857: 48	  
	DEY					  ; $8858: 88	  
	ROL $073f,X			  ; $8859: 3E 3F 07
	.db $1b			  ; $885c - Unknown opcode
	PHP					  ; $885d: 08	  
	ORA ($48,X)			  ; $885e: 01 48   
	STA $0b				  ; $8860: 85 0B   
	.db $07			  ; $8862 - Unknown opcode
	.db $1b			  ; $8863 - Unknown opcode
	ORA tmp1				 ; $8864: 05 01   
	PHA					  ; $8866: 48	  
	STY $0b				  ; $8867: 84 0B   
	PHA					  ; $8869: 48	  
	.db $83			  ; $886a - Unknown opcode
	.db $3f			  ; $886b - Unknown opcode
	.db $07			  ; $886c - Unknown opcode
	.db $02			  ; $886d - Unknown opcode
	.db $12			  ; $886e - Unknown opcode
	ASL $0b				  ; $886f: 06 0B   
	PHA					  ; $8871: 48	  
	STA $073f,X			  ; $8872: 9D 3F 07
	ASL ptr0_hi,X			; $8875: 16 05   
	.db $07			  ; $8877 - Unknown opcode
	.db $02			  ; $8878 - Unknown opcode
	.db $12			  ; $8879 - Unknown opcode
	.db $04			  ; $887a - Unknown opcode
	.db $0b			  ; $887b - Unknown opcode
	.db $07			  ; $887c - Unknown opcode
	.db $03			  ; $887d - Unknown opcode
	ORA $49				  ; $887e: 05 49   
	ORA #$0b				 ; $8880: 09 0B   
	EOR #$08				 ; $8882: 49 08   
	.db $0b			  ; $8884 - Unknown opcode
	.db $07			  ; $8885 - Unknown opcode
	.db $1b			  ; $8886 - Unknown opcode
	.db $0b			  ; $8887 - Unknown opcode
	ORA (ptr1_lo,X)		  ; $8888: 01 06   
	PHA					  ; $888a: 48	  
	LDY #$07				 ; $888b: A0 07   
	ORA $48				  ; $888d: 05 48   
	LDX #$0b				 ; $888f: A2 0B   
	PHA					  ; $8891: 48	  
	LDY $48				  ; $8892: A4 48   
	.db $a3			  ; $8894 - Unknown opcode
	BRK					  ; $8895: 00	  
	.db $83			  ; $8896 - Unknown opcode
	STA $0b3e,X			  ; $8897: 9D 3E 0B
	.db $07			  ; $889a - Unknown opcode
	.db $1b			  ; $889b - Unknown opcode
	.db $0c			  ; $889c - Unknown opcode
	.db $80			  ; $889d - Unknown opcode
	PHA					  ; $889e: 48	  
	LDA ($0b,X)			  ; $889f: A1 0B   
	.db $07			  ; $88a1 - Unknown opcode
	.db $14			  ; $88a2 - Unknown opcode
	ASL ptr1_hi			  ; $88a3: 06 07   
	.db $02			  ; $88a5 - Unknown opcode
	ASL $43				  ; $88a6: 06 43   
	.db $6b			  ; $88a8 - Unknown opcode
	.db $07			  ; $88a9 - Unknown opcode
	ORA tmp0				 ; $88aa: 05 00   
	STA $0b9e,Y			  ; $88ac: 99 9E 0B
	.db $43			  ; $88af - Unknown opcode
	JMP ($0b3e)			  ; $88b0: 6C 3E 0B
	ASL $48				  ; $88b3: 06 48   
	ROR ptr1_hi			  ; $88b5: 66 07   
	ORA ptr1_lo			  ; $88b7: 05 06   
	PHA					  ; $88b9: 48	  
	.db $0c			  ; $88ba - Unknown opcode
	BRK					  ; $88bb: 00	  
	LSR $9e,X				; $88bc: 56 9E   
	PHA					  ; $88be: 48	  
	ORA $8201				; $88bf: 0D 01 82
	.db $9e			  ; $88c2 - Unknown opcode
	ASL $3e08				; $88c3: 0E 08 3E
	.db $0b			  ; $88c6 - Unknown opcode
	PHA					  ; $88c7: 48	  
	.db $67			  ; $88c8 - Unknown opcode
	ROL $0b3e,X			  ; $88c9: 3E 3E 0B
	ASL $48				  ; $88cc: 06 48   
	ORA ($48),Y			  ; $88ce: 11 48   
	.db $0c			  ; $88d0 - Unknown opcode
	BRK					  ; $88d1: 00	  
	LSR $9e,X				; $88d2: 56 9E   
	PHA					  ; $88d4: 48	  
	ORA $8201				; $88d5: 0D 01 82
	.db $9e			  ; $88d8 - Unknown opcode
	ASL $3e08				; $88d9: 0E 08 3E
	.db $3f			  ; $88dc - Unknown opcode
	.db $07			  ; $88dd - Unknown opcode
	STY ptr1_lo,X			; $88de: 94 06   
	PHA					  ; $88e0: 48	  
	TAY					  ; $88e1: A8	  
	.db $07			  ; $88e2 - Unknown opcode
	.db $03			  ; $88e3 - Unknown opcode
	.db $03			  ; $88e4 - Unknown opcode
	PHA					  ; $88e5: 48	  
	LDA #$3e				 ; $88e6: A9 3E   
	.db $0b			  ; $88e8 - Unknown opcode
	ASL ptr1_hi			  ; $88e9: 06 07   
	ASL ptr0_hi,X			; $88eb: 16 05   
	ASL ptr1_hi			  ; $88ed: 06 07   
	.db $1b			  ; $88ef - Unknown opcode
	.db $1a			  ; $88f0 - Unknown opcode
	.db $02			  ; $88f1 - Unknown opcode
	LSR					  ; $88f2: 4A	  
	.db $1f			  ; $88f3 - Unknown opcode
	.db $0b			  ; $88f4 - Unknown opcode
	EOR #$fd				 ; $88f5: 49 FD   
	ROL $460b,X			  ; $88f7: 3E 0B 46
	BCC $893a				; $88fa: 90 3E   
	.db $3f			  ; $88fc - Unknown opcode
	.db $07			  ; $88fd - Unknown opcode
	ASL ptr0_hi,X			; $88fe: 16 05   
	.db $07			  ; $8900 - Unknown opcode
	.db $1b			  ; $8901 - Unknown opcode
	.db $1a			  ; $8902 - Unknown opcode
	.db $02			  ; $8903 - Unknown opcode
	LSR					  ; $8904: 4A	  
	JSR $4a0b				; $8905: 20 0B 4A
	CLC					  ; $8908: 18	  
	.db $0b			  ; $8909 - Unknown opcode
	.db $07			  ; $890a - Unknown opcode
	.db $13			  ; $890b - Unknown opcode
	.db $03			  ; $890c - Unknown opcode
	PHA					  ; $890d: 48	  
	.db $ab			  ; $890e - Unknown opcode
	.db $0b			  ; $890f - Unknown opcode
	PHA					  ; $8910: 48	  
	TAX					  ; $8911: AA	  
	.db $3f			  ; $8912 - Unknown opcode
	.db $07			  ; $8913 - Unknown opcode
	.db $03			  ; $8914 - Unknown opcode
	.db $03			  ; $8915 - Unknown opcode
	PHA					  ; $8916: 48	  
	LDY $480b				; $8917: AC 0B 48
	LDA $073f				; $891a: AD 3F 07
	ASL ptr0_hi,X			; $891d: 16 05   
	.db $07			  ; $891f - Unknown opcode
	.db $14			  ; $8920 - Unknown opcode
	EOR #$a4				 ; $8921: 49 A4   
	.db $0b			  ; $8923 - Unknown opcode
	EOR $cb				  ; $8924: 45 CB   
	.db $0b			  ; $8926 - Unknown opcode
	.db $07			  ; $8927 - Unknown opcode
	.db $14			  ; $8928 - Unknown opcode
	ASL $48				  ; $8929: 06 48   
	LDA $1b07,Y			  ; $892b: B9 07 1B
	ORA #$20				 ; $892e: 09 20   
	CLC					  ; $8930: 18	  
	ORA #$00				 ; $8931: 09 00   
	.db $0b			  ; $8933 - Unknown opcode
	PHA					  ; $8934: 48	  
	TSX					  ; $8935: BA	  
	ROL $480b,X			  ; $8936: 3E 0B 48
	.db $bb			  ; $8939 - Unknown opcode
loc_893A:
	.db $3f			  ; $893a - Unknown opcode
	.db $07			  ; $893b - Unknown opcode
	.db $03			  ; $893c - Unknown opcode
	.db $03			  ; $893d - Unknown opcode
	ASL $48				  ; $893e: 06 48   
	BCS $8949				; $8940: B0 07   
	ORA ptr1_lo			  ; $8942: 05 06   
	PHA					  ; $8944: 48	  
	LDA (tmp0),Y			 ; $8945: B1 00   
	STA $a6				  ; $8947: 85 A6   
loc_8949:
	PHA					  ; $8949: 48	  
	.db $b2			  ; $894a - Unknown opcode
	ROL $480b,X			  ; $894b: 3E 0B 48
	.db $b3			  ; $894e - Unknown opcode
	ROL $070b,X			  ; $894f: 3E 0B 07
	.db $03			  ; $8952 - Unknown opcode
	.db $02			  ; $8953 - Unknown opcode
	ASL $48				  ; $8954: 06 48   
	BCS $895f				; $8956: B0 07   
	ORA ptr1_lo			  ; $8958: 05 06   
	PHA					  ; $895a: 48	  
	LDA (tmp0),Y			 ; $895b: B1 00   
	STA $a6				  ; $895d: 85 A6   
loc_895F:
	PHA					  ; $895f: 48	  
	.db $b2			  ; $8960 - Unknown opcode
	ROL $480b,X			  ; $8961: 3E 0B 48
	.db $b3			  ; $8964 - Unknown opcode
	ROL $120b,X			  ; $8965: 3E 0B 12
	ASL $3f				  ; $8968: 06 3F   
	.db $07			  ; $896a - Unknown opcode
	ASL ptr0_hi,X			; $896b: 16 05   
	EOR #$9f				 ; $896d: 49 9F   
	.db $0b			  ; $896f - Unknown opcode
	.db $07			  ; $8970 - Unknown opcode
	.db $14			  ; $8971 - Unknown opcode
	.db $07			  ; $8972 - Unknown opcode
	.db $13			  ; $8973 - Unknown opcode
	.db $02			  ; $8974 - Unknown opcode
	PHA					  ; $8975: 48	  
	CLV					  ; $8976: B8	  
	.db $0b			  ; $8977 - Unknown opcode
	PHA					  ; $8978: 48	  
	.db $b7			  ; $8979 - Unknown opcode
	.db $3f			  ; $897a - Unknown opcode
	PHA					  ; $897b: 48	  
	LDX $1107,Y			  ; $897c: BE 07 11
	EOR $bf48,X			  ; $897f: 5D 48 BF
	PHA					  ; $8982: 48	  
	CPY #$18				 ; $8983: C0 18   
	ORA #$20				 ; $8985: 09 20   
	BRK					  ; $8987: 00	  
	LDX $a4,Y				; $8988: B6 A4   
	.db $3f			  ; $898a - Unknown opcode
	.db $07			  ; $898b - Unknown opcode
	.db $1b			  ; $898c - Unknown opcode
	ORA #$10				 ; $898d: 09 10   
	ASL $48				  ; $898f: 06 48   
	CPX #$07				 ; $8991: E0 07   
	ORA ptr1_lo			  ; $8993: 05 06   
	PHA					  ; $8995: 48	  
	SBC (tmp0,X)			 ; $8996: E1 00	; Arithmetic
	LDX $a4				  ; $8998: A6 A4   
	ROL $480b,X			  ; $899a: 3E 0B 48
	.db $e2			  ; $899d - Unknown opcode
	ROL $480b,X			  ; $899e: 3E 0B 48
	.db $df			  ; $89a1 - Unknown opcode
	.db $3f			  ; $89a2 - Unknown opcode
	PHA					  ; $89a3: 48	  
	.db $e3			  ; $89a4 - Unknown opcode
	CLC					  ; $89a5: 18	  
	ORA #$10				 ; $89a6: 09 10   
	.db $3f			  ; $89a8 - Unknown opcode
	.db $07			  ; $89a9 - Unknown opcode
	ASL ptr0_hi,X			; $89aa: 16 05   
	.db $07			  ; $89ac - Unknown opcode
	.db $1b			  ; $89ad - Unknown opcode
	ORA $4701,Y			  ; $89ae: 19 01 47
	ASL					  ; $89b1: 0A	  
	.db $0b			  ; $89b2 - Unknown opcode
	PHA					  ; $89b3: 48	  
	CPX $0b				  ; $89b4: E4 0B   
	.db $07			  ; $89b6 - Unknown opcode
	.db $1b			  ; $89b7 - Unknown opcode
	.db $02			  ; $89b8 - Unknown opcode
	ORA ($48,X)			  ; $89b9: 01 48   
	SBC $0b				  ; $89bb: E5 0B	; Arithmetic
	PHA					  ; $89bd: 48	  
	CPX $3f				  ; $89be: E4 3F   
	EOR $c7				  ; $89c0: 45 C7   
	.db $07			  ; $89c2 - Unknown opcode
	ASL ptr0_lo,X			; $89c3: 16 04   
	LSR $a2				  ; $89c5: 46 A2   
	.db $3f			  ; $89c7 - Unknown opcode
	PHA					  ; $89c8: 48	  
	.db $e7			  ; $89c9 - Unknown opcode
	BRK					  ; $89ca: 00	  
	LDX $3fa4				; $89cb: AE A4 3F
	.db $43			  ; $89ce - Unknown opcode
	TAX					  ; $89cf: AA	  
	.db $3f			  ; $89d0 - Unknown opcode
	.db $07			  ; $89d1 - Unknown opcode
	.db $1b			  ; $89d2 - Unknown opcode
	.db $0f			  ; $89d3 - Unknown opcode
	JSR $c745				; $89d4: 20 45 C7 ; Call to fixed bank
	.db $0b			  ; $89d7 - Unknown opcode
	ASL $48				  ; $89d8: 06 48   
	SBC #$18				 ; $89da: E9 18	; Arithmetic
	ASL					  ; $89dc: 0A	  
	PHP					  ; $89dd: 08	  
	ROL $0f18,X			  ; $89de: 3E 18 0F
	JSR $073f				; $89e1: 20 3F 07
	.db $1b			  ; $89e4 - Unknown opcode
	ORA $4801				; $89e5: 0D 01 48
	DEC $070b,X			  ; $89e8: DE 0B 07
	ORA ($7a),Y			  ; $89eb: 11 7A   
	ASL $48				  ; $89ed: 06 48   
	CMP $8c00,X			  ; $89ef: DD 00 8C
	LDY $3e				  ; $89f2: A4 3E   
	.db $0b			  ; $89f4 - Unknown opcode
	PHA					  ; $89f5: 48	  
	.db $dc			  ; $89f6 - Unknown opcode
	.db $3f			  ; $89f7 - Unknown opcode
	.db $07			  ; $89f8 - Unknown opcode
	.db $1b			  ; $89f9 - Unknown opcode
	.db $0f			  ; $89fa - Unknown opcode
	.db $80			  ; $89fb - Unknown opcode
	ASL $48				  ; $89fc: 06 48   
	.db $eb			  ; $89fe - Unknown opcode
	.db $07			  ; $89ff - Unknown opcode
	ORA ptr1_lo			  ; $8a00: 05 06   
	PHA					  ; $8a02: 48	  
	CPX $8300				; $8a03: EC 00 83
	TAX					  ; $8a06: AA	  
	ROL $480b,X			  ; $8a07: 3E 0B 48
	SBC $0b3e				; $8a0a: ED 3E 0B ; Arithmetic
	PHA					  ; $8a0d: 48	  
	NOP					  ; $8a0e: EA	  
	.db $3f			  ; $8a0f - Unknown opcode
	PHA					  ; $8a10: 48	  
	INC current_bank		 ; $8a11: EE 07 05
	PHA					  ; $8a14: 48	  
	.db $ef			  ; $8a15 - Unknown opcode
	.db $0b			  ; $8a16 - Unknown opcode
	PHA					  ; $8a17: 48	  
	BEQ $8a59				; $8a18: F0 3F   
	.db $07			  ; $8a1a - Unknown opcode
	.db $1b			  ; $8a1b - Unknown opcode
	.db $0f			  ; $8a1c - Unknown opcode
	.db $80			  ; $8a1d - Unknown opcode
	PHA					  ; $8a1e: 48	  
	.db $f4			  ; $8a1f - Unknown opcode
	.db $0b			  ; $8a20 - Unknown opcode
	ASL $48				  ; $8a21: 06 48   
	SBC (ptr1_hi),Y		  ; $8a23: F1 07	; Arithmetic
	ORA ($74),Y			  ; $8a25: 11 74   
	ASL tmp0				 ; $8a27: 06 00   
	.db $89			  ; $8a29 - Unknown opcode
	TAX					  ; $8a2a: AA	  
	PHA					  ; $8a2b: 48	  
	.db $f3			  ; $8a2c - Unknown opcode
	ROL $060b,X			  ; $8a2d: 3E 0B 06
	PHA					  ; $8a30: 48	  
	.db $f2			  ; $8a31 - Unknown opcode
	PHA					  ; $8a32: 48	  
	.db $f3			  ; $8a33 - Unknown opcode
	ROL $f448,X			  ; $8a34: 3E 48 F4
	ROL $0f18,X			  ; $8a37: 3E 18 0F
	.db $80			  ; $8a3a - Unknown opcode
	.db $3f			  ; $8a3b - Unknown opcode
	.db $07			  ; $8a3c - Unknown opcode
	.db $1b			  ; $8a3d - Unknown opcode
	ASL					  ; $8a3e: 0A	  
	.db $80			  ; $8a3f - Unknown opcode
	LSR $ba				  ; $8a40: 46 BA   
	.db $0b			  ; $8a42 - Unknown opcode
	.db $07			  ; $8a43 - Unknown opcode
	.db $1b			  ; $8a44 - Unknown opcode
	.db $13			  ; $8a45 - Unknown opcode
	JSR $1b07				; $8a46: 20 07 1B
	BPL $8a6b				; $8a49: 10 20   
	ASL $48				  ; $8a4b: 06 48   
	SBC tmp0,X			   ; $8a4d: F5 00	; Arithmetic
	ADC $48a6,Y			  ; $8a4f: 79 A6 48 ; Arithmetic
	INC $17,X				; $8a52: F6 17   
	BPL $8a35				; $8a54: 10 DF   
	ROL $480b,X			  ; $8a56: 3E 0B 48
loc_8A59:
	.db $f7			  ; $8a59 - Unknown opcode
	.db $0b			  ; $8a5a - Unknown opcode
	ASL $46				  ; $8a5b: 06 46   
	TSX					  ; $8a5d: BA	  
	CLC					  ; $8a5e: 18	  
	.db $13			  ; $8a5f - Unknown opcode
	BMI $8a7a				; $8a60: 30 18   
	ASL					  ; $8a62: 0A	  
	.db $80			  ; $8a63 - Unknown opcode
	ROL $493f,X			  ; $8a64: 3E 3F 49
	ORA (ptr1_hi,X)		  ; $8a67: 01 07   
	ASL $0249,X			  ; $8a69: 1E 49 02
	.db $0b			  ; $8a6c - Unknown opcode
	EOR #$03				 ; $8a6d: 49 03   
	.db $3f			  ; $8a6f - Unknown opcode
	.db $07			  ; $8a70 - Unknown opcode
	.db $1b			  ; $8a71 - Unknown opcode
	ASL $4820				; $8a72: 0E 20 48
	INC $480b,X			  ; $8a75: FE 0B 48
	SBC $073f,X			  ; $8a78: FD 3F 07 ; Arithmetic
	ASL ptr0_hi,X			; $8a7b: 16 05   
	.db $07			  ; $8a7d - Unknown opcode
	.db $03			  ; $8a7e - Unknown opcode
	ORA $45				  ; $8a7f: 05 45   
	.db $54			  ; $8a81 - Unknown opcode
	.db $0b			  ; $8a82 - Unknown opcode
	EOR #$19				 ; $8a83: 49 19   
	.db $0b			  ; $8a85 - Unknown opcode
	.db $07			  ; $8a86 - Unknown opcode
	.db $14			  ; $8a87 - Unknown opcode
	ASL ptr1_hi			  ; $8a88: 06 07   
	.db $1b			  ; $8a8a - Unknown opcode
	ORA $4508				; $8a8b: 0D 08 45
	.db $54			  ; $8a8e - Unknown opcode
	.db $0b			  ; $8a8f - Unknown opcode
	ASL $18				  ; $8a90: 06 18   
	ORA $4602				; $8a92: 0D 02 46
	.db $7b			  ; $8a95 - Unknown opcode
	ROL $0b3e,X			  ; $8a96: 3E 3E 0B
	EOR $54				  ; $8a99: 45 54   
	.db $3f			  ; $8a9b - Unknown opcode
	.db $07			  ; $8a9c - Unknown opcode
	.db $1b			  ; $8a9d - Unknown opcode
	.db $17			  ; $8a9e - Unknown opcode
	RTI					  ; $8a9f: 40	  
	EOR #$0b				 ; $8aa0: 49 0B   
	.db $0b			  ; $8aa2 - Unknown opcode
	EOR #$0a				 ; $8aa3: 49 0A   
	.db $3f			  ; $8aa5 - Unknown opcode
	.db $07			  ; $8aa6 - Unknown opcode
	.db $1b			  ; $8aa7 - Unknown opcode
	.db $17			  ; $8aa8 - Unknown opcode
	.db $80			  ; $8aa9 - Unknown opcode
	EOR #$0d				 ; $8aaa: 49 0D   
	.db $0b			  ; $8aac - Unknown opcode
	EOR #$0c				 ; $8aad: 49 0C   
	.db $3f			  ; $8aaf - Unknown opcode
	EOR #$0e				 ; $8ab0: 49 0E   
	.db $07			  ; $8ab2 - Unknown opcode
	ORA ptr1_lo			  ; $8ab3: 05 06   
	EOR #$10				 ; $8ab5: 49 10   
	BRK					  ; $8ab7: 00	  
	LDX $a4,Y				; $8ab8: B6 A4   
	CLC					  ; $8aba: 18	  
	.db $17			  ; $8abb - Unknown opcode
	.db $80			  ; $8abc - Unknown opcode
	CLC					  ; $8abd: 18	  
	ORA $3e04,Y			  ; $8abe: 19 04 3E
	.db $0b			  ; $8ac1 - Unknown opcode
	EOR #$0f				 ; $8ac2: 49 0F   
	.db $3f			  ; $8ac4 - Unknown opcode
	.db $07			  ; $8ac5 - Unknown opcode
	.db $03			  ; $8ac6 - Unknown opcode
	.db $02			  ; $8ac7 - Unknown opcode
	ASL $49				  ; $8ac8: 06 49   
	.db $14			  ; $8aca - Unknown opcode
	.db $07			  ; $8acb - Unknown opcode
	.db $13			  ; $8acc - Unknown opcode
	BRK					  ; $8acd: 00	  
	EOR #$17				 ; $8ace: 49 17   
	.db $0b			  ; $8ad0 - Unknown opcode
	EOR #$15				 ; $8ad1: 49 15   
	EOR #$16				 ; $8ad3: 49 16   
	BRK					  ; $8ad5: 00	  
	LDX $a4,Y				; $8ad6: B6 A4   
	CLC					  ; $8ad8: 18	  
	.db $17			  ; $8ad9 - Unknown opcode
	RTI					  ; $8ada: 40	  
	ROL $490b,X			  ; $8adb: 3E 0B 49
	.db $13			  ; $8ade - Unknown opcode
	.db $3f			  ; $8adf - Unknown opcode
	.db $07			  ; $8ae0 - Unknown opcode
	.db $02			  ; $8ae1 - Unknown opcode
	.db $12			  ; $8ae2 - Unknown opcode
	.db $03			  ; $8ae3 - Unknown opcode
	.db $0b			  ; $8ae4 - Unknown opcode
	EOR #$18				 ; $8ae5: 49 18   
	.db $3f			  ; $8ae7 - Unknown opcode
	LSR $49				  ; $8ae8: 46 49   
	.db $07			  ; $8aea - Unknown opcode
	ASL ptr0_hi,X			; $8aeb: 16 05   
	EOR #$1b				 ; $8aed: 49 1B   
	.db $3f			  ; $8aef - Unknown opcode
	.db $07			  ; $8af0 - Unknown opcode
	ASL ptr0_hi,X			; $8af1: 16 05   
	EOR #$1d				 ; $8af3: 49 1D   
	.db $0b			  ; $8af5 - Unknown opcode
	LSR $50				  ; $8af6: 46 50   
	.db $3f			  ; $8af8 - Unknown opcode
	.db $07			  ; $8af9 - Unknown opcode
	.db $1b			  ; $8afa - Unknown opcode
	.db $17			  ; $8afb - Unknown opcode
	.db $80			  ; $8afc - Unknown opcode
	EOR #$1e				 ; $8afd: 49 1E   
	.db $0b			  ; $8aff - Unknown opcode
	PHA					  ; $8b00: 48	  
	SED					  ; $8b01: F8	  
	.db $3f			  ; $8b02 - Unknown opcode
	.db $07			  ; $8b03 - Unknown opcode
	.db $1b			  ; $8b04 - Unknown opcode
	.db $17			  ; $8b05 - Unknown opcode
	.db $80			  ; $8b06 - Unknown opcode
	EOR #$1f				 ; $8b07: 49 1F   
	.db $0b			  ; $8b09 - Unknown opcode
	PHA					  ; $8b0a: 48	  
	SBC $073f,Y			  ; $8b0b: F9 3F 07 ; Arithmetic
	.db $1b			  ; $8b0e - Unknown opcode
	.db $17			  ; $8b0f - Unknown opcode
	.db $80			  ; $8b10 - Unknown opcode
	EOR #$20				 ; $8b11: 49 20   
	.db $0b			  ; $8b13 - Unknown opcode
	PHA					  ; $8b14: 48	  
	.db $ff			  ; $8b15 - Unknown opcode
	.db $3f			  ; $8b16 - Unknown opcode
	EOR #$00				 ; $8b17: 49 00   
	.db $07			  ; $8b19 - Unknown opcode
	.db $1b			  ; $8b1a - Unknown opcode
	.db $17			  ; $8b1b - Unknown opcode
	.db $80			  ; $8b1c - Unknown opcode
	EOR #$21				 ; $8b1d: 49 21   
	.db $3f			  ; $8b1f - Unknown opcode
	.db $07			  ; $8b20 - Unknown opcode
	ORA ($6f),Y			  ; $8b21: 11 6F   
	ASL $49				  ; $8b23: 06 49   
	.db $27			  ; $8b25 - Unknown opcode
	CLC					  ; $8b26: 18	  
	ORA $1810,Y			  ; $8b27: 19 10 18
	.db $17			  ; $8b2a - Unknown opcode
	ORA (tmp0,X)			 ; $8b2b: 01 00   
	INY					  ; $8b2d: C8	  
	TAX					  ; $8b2e: AA	  
	ROL $060b,X			  ; $8b2f: 3E 0B 06
	EOR #$22				 ; $8b32: 49 22   
	.db $07			  ; $8b34 - Unknown opcode
	ORA $49				  ; $8b35: 05 49   
	.db $23			  ; $8b37 - Unknown opcode
	.db $0b			  ; $8b38 - Unknown opcode
	EOR #$24				 ; $8b39: 49 24   
	ROL $073f,X			  ; $8b3b: 3E 3F 07
	.db $02			  ; $8b3e - Unknown opcode
	.db $12			  ; $8b3f - Unknown opcode
	ASL $0b				  ; $8b40: 06 0B   
	.db $07			  ; $8b42 - Unknown opcode
	.db $1b			  ; $8b43 - Unknown opcode
	ORA $4910,Y			  ; $8b44: 19 10 49
	PLP					  ; $8b47: 28	  
	.db $0b			  ; $8b48 - Unknown opcode
	EOR #$25				 ; $8b49: 49 25   
	.db $3f			  ; $8b4b - Unknown opcode
	.db $07			  ; $8b4c - Unknown opcode
	.db $1b			  ; $8b4d - Unknown opcode
	ORA $4910,Y			  ; $8b4e: 19 10 49
	AND #$0b				 ; $8b51: 29 0B   
	EOR #$26				 ; $8b53: 49 26   
	.db $3f			  ; $8b55 - Unknown opcode
	.db $43			  ; $8b56 - Unknown opcode
	.db $f3			  ; $8b57 - Unknown opcode
	BRK					  ; $8b58: 00	  
	.db $12			  ; $8b59 - Unknown opcode
	BCS $8b9b				; $8b5a: B0 3F   
	.db $44			  ; $8b5c - Unknown opcode
	CPY tmp0				 ; $8b5d: C4 00   
	CPY $3faa				; $8b5f: CC AA 3F
	BRK					  ; $8b62: 00	  
	CMP ($aa),Y			  ; $8b63: D1 AA   
	.db $3f			  ; $8b65 - Unknown opcode
	.db $07			  ; $8b66 - Unknown opcode
	.db $14			  ; $8b67 - Unknown opcode
	.db $07			  ; $8b68 - Unknown opcode
	.db $1b			  ; $8b69 - Unknown opcode
	ASL					  ; $8b6a: 0A	  
	BPL $8b7f				; $8b6b: 10 12   
	ASL $0b				  ; $8b6d: 06 0B   
	ASL $49				  ; $8b6f: 06 49   
	ROL					  ; $8b71: 2A	  
	.db $07			  ; $8b72 - Unknown opcode
	ORA ptr1_lo			  ; $8b73: 05 06   
	EOR #$2b				 ; $8b75: 49 2B   
	BRK					  ; $8b77: 00	  
	.db $89			  ; $8b78 - Unknown opcode
	LDY $3e				  ; $8b79: A4 3E   
	.db $0b			  ; $8b7b - Unknown opcode
	EOR #$2c				 ; $8b7c: 49 2C   
	ROL $060b,X			  ; $8b7e: 3E 0B 06
	CLC					  ; $8b81: 18	  
	ASL					  ; $8b82: 0A	  
	BPL $8b97				; $8b83: 10 12   
	ASL $3e				  ; $8b85: 06 3E   
	.db $3f			  ; $8b87 - Unknown opcode
	.db $07			  ; $8b88 - Unknown opcode
	ASL $2d49,X			  ; $8b89: 1E 49 2D
	.db $0b			  ; $8b8c - Unknown opcode
	EOR #$2e				 ; $8b8d: 49 2E   
	.db $3f			  ; $8b8f - Unknown opcode
	.db $07			  ; $8b90 - Unknown opcode
	.db $1b			  ; $8b91 - Unknown opcode
	ASL $1280				; $8b92: 0E 80 12
	ORA $0b				  ; $8b95: 05 0B   
loc_8B97:
	EOR #$36				 ; $8b97: 49 36   
	.db $3f			  ; $8b99 - Unknown opcode
	EOR #$34				 ; $8b9a: 49 34   
	.db $07			  ; $8b9c - Unknown opcode
	ORA $49				  ; $8b9d: 05 49   
	AND $0b,X				; $8b9f: 35 0B   
	EOR #$35				 ; $8ba1: 49 35   
	.db $3f			  ; $8ba3 - Unknown opcode
	.db $07			  ; $8ba4 - Unknown opcode
	.db $1b			  ; $8ba5 - Unknown opcode
	CLC					  ; $8ba6: 18	  
	RTI					  ; $8ba7: 40	  
	EOR #$3b				 ; $8ba8: 49 3B   
	.db $0b			  ; $8baa - Unknown opcode
	.db $07			  ; $8bab - Unknown opcode
	.db $1b			  ; $8bac - Unknown opcode
	ORA $0608,Y			  ; $8bad: 19 08 06
	ORA ($af,X)			  ; $8bb0: 01 AF   
	TAX					  ; $8bb2: AA	  
	SEC					  ; $8bb3: 38	  
	ORA #$18				 ; $8bb4: 09 18   
	CLC					  ; $8bb6: 18	  
	RTI					  ; $8bb7: 40	  
	ROL $060b,X			  ; $8bb8: 3E 0B 06
	EOR #$37				 ; $8bbb: 49 37   
	BRK					  ; $8bbd: 00	  
	LDY $3eaf				; $8bbe: AC AF 3E
	.db $3f			  ; $8bc1 - Unknown opcode
	.db $07			  ; $8bc2 - Unknown opcode
	.db $1b			  ; $8bc3 - Unknown opcode
	CLC					  ; $8bc4: 18	  
	BPL $8bc8				; $8bc5: 10 01   
	CMP $42aa,Y			  ; $8bc7: D9 AA 42
	ORA #$0b				 ; $8bca: 09 0B   
	EOR #$3f				 ; $8bcc: 49 3F   
	.db $3f			  ; $8bce - Unknown opcode
	EOR #$3e				 ; $8bcf: 49 3E   
	.db $07			  ; $8bd1 - Unknown opcode
	.db $1b			  ; $8bd2 - Unknown opcode
	CLC					  ; $8bd3: 18	  
	JSR $4149				; $8bd4: 20 49 41
	.db $3f			  ; $8bd7 - Unknown opcode
	.db $07			  ; $8bd8 - Unknown opcode
	.db $1b			  ; $8bd9 - Unknown opcode
	CLC					  ; $8bda: 18	  
	BPL $8c26				; $8bdb: 10 49   
	EOR $070b				; $8bdd: 4D 0B 07
	.db $1b			  ; $8be0 - Unknown opcode
	CLC					  ; $8be1: 18	  
	JSR $4049				; $8be2: 20 49 40
	.db $0b			  ; $8be5 - Unknown opcode
	EOR #$3d				 ; $8be6: 49 3D   
	.db $3f			  ; $8be8 - Unknown opcode
	.db $07			  ; $8be9 - Unknown opcode
	.db $1b			  ; $8bea - Unknown opcode
	CLC					  ; $8beb: 18	  
	BPL $8c37				; $8bec: 10 49   
	EOR $0b				  ; $8bee: 45 0B   
	EOR #$2f				 ; $8bf0: 49 2F   
	.db $3f			  ; $8bf2 - Unknown opcode
	.db $07			  ; $8bf3 - Unknown opcode
	.db $1b			  ; $8bf4 - Unknown opcode
	CLC					  ; $8bf5: 18	  
	BPL $8bfe				; $8bf6: 10 06   
	EOR #$46				 ; $8bf8: 49 46   
	.db $07			  ; $8bfa - Unknown opcode
	ORA $49				  ; $8bfb: 05 49   
	.db $47			  ; $8bfd - Unknown opcode
loc_8BFE:
	.db $0b			  ; $8bfe - Unknown opcode
	EOR #$48				 ; $8bff: 49 48   
	ROL $490b,X			  ; $8c01: 3E 0B 49
	BMI $8c45				; $8c04: 30 3F   
	.db $07			  ; $8c06 - Unknown opcode
	.db $1b			  ; $8c07 - Unknown opcode
	CLC					  ; $8c08: 18	  
	BPL $8c54				; $8c09: 10 49   
	EOR #$0b				 ; $8c0b: 49 0B   
	EOR #$31				 ; $8c0d: 49 31   
	.db $3f			  ; $8c0f - Unknown opcode
	.db $07			  ; $8c10 - Unknown opcode
	.db $1b			  ; $8c11 - Unknown opcode
	CLC					  ; $8c12: 18	  
	BPL $8c5e				; $8c13: 10 49   
	LSR					  ; $8c15: 4A	  
	.db $0b			  ; $8c16 - Unknown opcode
	EOR #$32				 ; $8c17: 49 32   
	.db $3f			  ; $8c19 - Unknown opcode
	.db $07			  ; $8c1a - Unknown opcode
	.db $1b			  ; $8c1b - Unknown opcode
	CLC					  ; $8c1c: 18	  
	BPL $8c68				; $8c1d: 10 49   
	.db $4b			  ; $8c1f - Unknown opcode
	.db $0b			  ; $8c20 - Unknown opcode
	EOR #$33				 ; $8c21: 49 33   
	.db $3f			  ; $8c23 - Unknown opcode
	.db $07			  ; $8c24 - Unknown opcode
	.db $1b			  ; $8c25 - Unknown opcode
loc_8C26:
	CLC					  ; $8c26: 18	  
	BPL $8c72				; $8c27: 10 49   
	JMP $490b				; $8c29: 4C 0B 49
	.db $3c			  ; $8c2c - Unknown opcode
	.db $3f			  ; $8c2d - Unknown opcode
	.db $07			  ; $8c2e - Unknown opcode
	.db $1b			  ; $8c2f - Unknown opcode
	CLC					  ; $8c30: 18	  
	PHP					  ; $8c31: 08	  
	EOR #$4f				 ; $8c32: 49 4F   
	.db $0b			  ; $8c34 - Unknown opcode
	ASL $49				  ; $8c35: 06 49   
loc_8C37:
	LSR $f500				; $8c37: 4E 00 F5
	TAX					  ; $8c3a: AA	  
	CLC					  ; $8c3b: 18	  
	CLC					  ; $8c3c: 18	  
	PHP					  ; $8c3d: 08	  
	ROL $073f,X			  ; $8c3e: 3E 3F 07
	.db $1b			  ; $8c41 - Unknown opcode
	ORA $4940,Y			  ; $8c42: 19 40 49
loc_8C45:
	ADC $0b,X				; $8c45: 75 0B	; Arithmetic
	EOR #$50				 ; $8c47: 49 50   
	.db $3f			  ; $8c49 - Unknown opcode
	.db $07			  ; $8c4a - Unknown opcode
	.db $1b			  ; $8c4b - Unknown opcode
	ROL tmp2				 ; $8c4c: 26 02   
	EOR #$57				 ; $8c4e: 49 57   
	.db $0b			  ; $8c50 - Unknown opcode
	ORA ($fb,X)			  ; $8c51: 01 FB   
	TAX					  ; $8c53: AA	  
loc_8C54:
	EOR ($09),Y			  ; $8c54: 51 09   
	.db $3f			  ; $8c56 - Unknown opcode
	.db $07			  ; $8c57 - Unknown opcode
	.db $1b			  ; $8c58 - Unknown opcode
	ORA $4980,Y			  ; $8c59: 19 80 49
	.db $74			  ; $8c5c - Unknown opcode
	.db $0b			  ; $8c5d - Unknown opcode
loc_8C5E:
	ASL $49				  ; $8c5e: 06 49   
	.db $5a			  ; $8c60 - Unknown opcode
	.db $07			  ; $8c61 - Unknown opcode
	ORA ptr1_lo			  ; $8c62: 05 06   
	EOR #$5b				 ; $8c64: 49 5B   
	BRK					  ; $8c66: 00	  
	EOR $ab,X				; $8c67: 55 AB   
	ROL $060b,X			  ; $8c69: 3E 0B 06
	EOR #$5c				 ; $8c6c: 49 5C   
	.db $47			  ; $8c6e - Unknown opcode
	BRK					  ; $8c6f: 00	  
	ROL $3f3e,X			  ; $8c70: 3E 3E 3F
	.db $07			  ; $8c73 - Unknown opcode
	.db $1b			  ; $8c74 - Unknown opcode
	ORA $4340,Y			  ; $8c75: 19 40 43
	SBC ($0b),Y			  ; $8c78: F1 0B	; Arithmetic
	EOR #$59				 ; $8c7a: 49 59   
	.db $3f			  ; $8c7c - Unknown opcode
	.db $07			  ; $8c7d - Unknown opcode
	.db $1b			  ; $8c7e - Unknown opcode
	ASL $08,X				; $8c7f: 16 08   
	ORA ($89,X)			  ; $8c81: 01 89   
	.db $ab			  ; $8c83 - Unknown opcode
	BRK					  ; $8c84: 00	  
	.db $07			  ; $8c85 - Unknown opcode
	.db $0b			  ; $8c86 - Unknown opcode
	.db $47			  ; $8c87 - Unknown opcode
	BRK					  ; $8c88: 00	  
	.db $3f			  ; $8c89 - Unknown opcode
	.db $07			  ; $8c8a - Unknown opcode
	.db $14			  ; $8c8b - Unknown opcode
	.db $07			  ; $8c8c - Unknown opcode
	.db $1b			  ; $8c8d - Unknown opcode
	ORA $4980,Y			  ; $8c8e: 19 80 49
	ADC ($0b),Y			  ; $8c91: 71 0B	; Arithmetic
	.db $07			  ; $8c93 - Unknown opcode
	ORA ($7e),Y			  ; $8c94: 11 7E   
	ASL $49				  ; $8c96: 06 49   
	.db $6b			  ; $8c98 - Unknown opcode
	BRK					  ; $8c99: 00	  
	.db $3c			  ; $8c9a - Unknown opcode
	BCS $8ce6				; $8c9b: B0 49   
	JMP ($6500)			  ; $8c9d: 6C 00 65
	.db $ab			  ; $8ca0 - Unknown opcode
	CLC					  ; $8ca1: 18	  
	ORA $3e80,Y			  ; $8ca2: 19 80 3E
	.db $0b			  ; $8ca5 - Unknown opcode
	EOR #$63				 ; $8ca6: 49 63   
	.db $0b			  ; $8ca8 - Unknown opcode
	.db $07			  ; $8ca9 - Unknown opcode
	.db $1b			  ; $8caa - Unknown opcode
	ORA $4580,Y			  ; $8cab: 19 80 45
	CPY $490b				; $8cae: CC 0B 49
	.db $64			  ; $8cb1 - Unknown opcode
	.db $3f			  ; $8cb2 - Unknown opcode
	EOR #$5d				 ; $8cb3: 49 5D   
	.db $07			  ; $8cb5 - Unknown opcode
	.db $9b			  ; $8cb6 - Unknown opcode
	ORA $4980,Y			  ; $8cb7: 19 80 49
	LSR $493f,X			  ; $8cba: 5E 3F 49
	.db $5f			  ; $8cbd - Unknown opcode
	.db $07			  ; $8cbe - Unknown opcode
	.db $1b			  ; $8cbf - Unknown opcode
	ORA $4980,Y			  ; $8cc0: 19 80 49
	ROR $490b				; $8cc3: 6E 0B 49
	RTS					  ; $8cc6: 60	  
	.db $3f			  ; $8cc7 - Unknown opcode
	.db $07			  ; $8cc8 - Unknown opcode
	.db $1b			  ; $8cc9 - Unknown opcode
	ORA $4980,Y			  ; $8cca: 19 80 49
	.db $6f			  ; $8ccd - Unknown opcode
	.db $0b			  ; $8cce - Unknown opcode
	EOR #$61				 ; $8ccf: 49 61   
	.db $3f			  ; $8cd1 - Unknown opcode
	.db $07			  ; $8cd2 - Unknown opcode
	.db $1b			  ; $8cd3 - Unknown opcode
	ORA $4980,Y			  ; $8cd4: 19 80 49
	BVS $8ce4				; $8cd7: 70 0B   
	.db $07			  ; $8cd9 - Unknown opcode
	.db $14			  ; $8cda - Unknown opcode
	EOR #$62				 ; $8cdb: 49 62   
	.db $0b			  ; $8cdd - Unknown opcode
	.db $07			  ; $8cde - Unknown opcode
	.db $1b			  ; $8cdf - Unknown opcode
	CLC					  ; $8ce0: 18	  
	ORA ($49,X)			  ; $8ce1: 01 49   
	ADC $490b				; $8ce3: 6D 0B 49 ; Arithmetic
loc_8CE6:
	.db $62			  ; $8ce6 - Unknown opcode
	.db $3f			  ; $8ce7 - Unknown opcode
	.db $07			  ; $8ce8 - Unknown opcode
	.db $1b			  ; $8ce9 - Unknown opcode
	ORA $4980,Y			  ; $8cea: 19 80 49
	.db $72			  ; $8ced - Unknown opcode
	.db $0b			  ; $8cee - Unknown opcode
	EOR #$65				 ; $8cef: 49 65   
	.db $3f			  ; $8cf1 - Unknown opcode
	.db $07			  ; $8cf2 - Unknown opcode
	.db $1b			  ; $8cf3 - Unknown opcode
	ORA $4980,Y			  ; $8cf4: 19 80 49
	.db $73			  ; $8cf7 - Unknown opcode
	.db $0b			  ; $8cf8 - Unknown opcode
	EOR #$66				 ; $8cf9: 49 66   
	.db $3f			  ; $8cfb - Unknown opcode
	.db $07			  ; $8cfc - Unknown opcode
	.db $1b			  ; $8cfd - Unknown opcode
	ORA $0080,Y			  ; $8cfe: 19 80 00
	.db $8b			  ; $8d01 - Unknown opcode
	.db $ab			  ; $8d02 - Unknown opcode
	.db $0b			  ; $8d03 - Unknown opcode
	.db $07			  ; $8d04 - Unknown opcode
	.db $83			  ; $8d05 - Unknown opcode
	.db $04			  ; $8d06 - Unknown opcode
	EOR #$67				 ; $8d07: 49 67   
	.db $0b			  ; $8d09 - Unknown opcode
	ORA ($78,X)			  ; $8d0a: 01 78   
	.db $ab			  ; $8d0c - Unknown opcode
	PLA					  ; $8d0d: 68	  
	ORA #$3f				 ; $8d0e: 09 3F   
	PHA					  ; $8d10: 48	  
	.db $13			  ; $8d11 - Unknown opcode
	.db $07			  ; $8d12 - Unknown opcode
	.db $03			  ; $8d13 - Unknown opcode
	ORA $48				  ; $8d14: 05 48   
	.db $14			  ; $8d16 - Unknown opcode
	.db $3f			  ; $8d17 - Unknown opcode
	.db $07			  ; $8d18 - Unknown opcode
	.db $02			  ; $8d19 - Unknown opcode
	.db $12			  ; $8d1a - Unknown opcode
	ASL $0b				  ; $8d1b: 06 0B   
	.db $07			  ; $8d1d - Unknown opcode
	.db $83			  ; $8d1e - Unknown opcode
	ORA $12				  ; $8d1f: 05 12   
	ASL $0b				  ; $8d21: 06 0B   
	EOR #$76				 ; $8d23: 49 76   
	.db $3f			  ; $8d25 - Unknown opcode
	.db $07			  ; $8d26 - Unknown opcode
	.db $83			  ; $8d27 - Unknown opcode
	ORA $49				  ; $8d28: 05 49   
	ADC $060b,X			  ; $8d2a: 7D 0B 06 ; Arithmetic
	EOR #$7e				 ; $8d2d: 49 7E   
	.db $07			  ; $8d2f - Unknown opcode
	ORA $49				  ; $8d30: 05 49   
	.db $7f			  ; $8d32 - Unknown opcode
	.db $0b			  ; $8d33 - Unknown opcode
	EOR #$80				 ; $8d34: 49 80   
	ROL $463f,X			  ; $8d36: 3E 3F 46
	TXS					  ; $8d39: 9A	  
	.db $07			  ; $8d3a - Unknown opcode
	ASL ptr0_hi,X			; $8d3b: 16 05   
	.db $07			  ; $8d3d - Unknown opcode
	.db $1b			  ; $8d3e - Unknown opcode
	ORA $4901,Y			  ; $8d3f: 19 01 49
	.db $b3			  ; $8d42 - Unknown opcode
	.db $0b			  ; $8d43 - Unknown opcode
	EOR #$88				 ; $8d44: 49 88   
	.db $3f			  ; $8d46 - Unknown opcode
	.db $07			  ; $8d47 - Unknown opcode
	ASL ptr0_hi,X			; $8d48: 16 05   
	.db $07			  ; $8d4a - Unknown opcode
	.db $1b			  ; $8d4b - Unknown opcode
	ORA $4901,Y			  ; $8d4c: 19 01 49
	LDA $0b,X				; $8d4f: B5 0B   
	EOR #$a7				 ; $8d51: 49 A7   
	.db $0b			  ; $8d53 - Unknown opcode
	PHA					  ; $8d54: 48	  
	CMP ($3f,X)			  ; $8d55: C1 3F   
	.db $07			  ; $8d57 - Unknown opcode
	.db $1b			  ; $8d58 - Unknown opcode
	ORA $0701,Y			  ; $8d59: 19 01 07
	.db $14			  ; $8d5c - Unknown opcode
	EOR #$ba				 ; $8d5d: 49 BA   
	.db $0b			  ; $8d5f - Unknown opcode
	EOR #$b6				 ; $8d60: 49 B6   
	.db $0b			  ; $8d62 - Unknown opcode
	.db $07			  ; $8d63 - Unknown opcode
	.db $14			  ; $8d64 - Unknown opcode
	PHA					  ; $8d65: 48	  
	.db $c7			  ; $8d66 - Unknown opcode
	.db $0b			  ; $8d67 - Unknown opcode
	PHA					  ; $8d68: 48	  
	.db $c2			  ; $8d69 - Unknown opcode
	.db $3f			  ; $8d6a - Unknown opcode
	.db $07			  ; $8d6b - Unknown opcode
	.db $1b			  ; $8d6c - Unknown opcode
	ORA $0701,Y			  ; $8d6d: 19 01 07
	.db $14			  ; $8d70 - Unknown opcode
	EOR #$bb				 ; $8d71: 49 BB   
	.db $0b			  ; $8d73 - Unknown opcode
	EOR #$b7				 ; $8d74: 49 B7   
	.db $0b			  ; $8d76 - Unknown opcode
	.db $07			  ; $8d77 - Unknown opcode
	.db $14			  ; $8d78 - Unknown opcode
	PHA					  ; $8d79: 48	  
	INY					  ; $8d7a: C8	  
	.db $0b			  ; $8d7b - Unknown opcode
	PHA					  ; $8d7c: 48	  
	.db $c3			  ; $8d7d - Unknown opcode
	.db $3f			  ; $8d7e - Unknown opcode
	.db $07			  ; $8d7f - Unknown opcode
	.db $1b			  ; $8d80 - Unknown opcode
	ORA $4901,Y			  ; $8d81: 19 01 49
	CLV					  ; $8d84: B8	  
	.db $0b			  ; $8d85 - Unknown opcode
	PHA					  ; $8d86: 48	  
	CPY $3f				  ; $8d87: C4 3F   
	.db $07			  ; $8d89 - Unknown opcode
	.db $1b			  ; $8d8a - Unknown opcode
	ORA $4901,Y			  ; $8d8b: 19 01 49
	LDA $070b,Y			  ; $8d8e: B9 0B 07
	.db $14			  ; $8d91 - Unknown opcode
	PHA					  ; $8d92: 48	  
	CMP $0b				  ; $8d93: C5 0B   
	PHA					  ; $8d95: 48	  
	DEC $3f				  ; $8d96: C6 3F   
	.db $07			  ; $8d98 - Unknown opcode
	.db $1b			  ; $8d99 - Unknown opcode
	ORA $0701,Y			  ; $8d9a: 19 01 07
	.db $14			  ; $8d9d - Unknown opcode
	EOR #$bc				 ; $8d9e: 49 BC   
	.db $0b			  ; $8da0 - Unknown opcode
	ASL $48				  ; $8da1: 06 48   
	DEX					  ; $8da3: CA	  
	EOR #$bd				 ; $8da4: 49 BD   
	ROL $070b,X			  ; $8da6: 3E 0B 07
	.db $14			  ; $8da9 - Unknown opcode
	PHA					  ; $8daa: 48	  
	CMP #$0b				 ; $8dab: C9 0B	; Compare with 11
	ASL $48				  ; $8dad: 06 48   
	DEX					  ; $8daf: CA	  
	PHA					  ; $8db0: 48	  
	.db $cb			  ; $8db1 - Unknown opcode
	ROL $073f,X			  ; $8db2: 3E 3F 07
	ASL ptr0_hi,X			; $8db5: 16 05   
	EOR $c7				  ; $8db7: 45 C7   
	.db $0b			  ; $8db9 - Unknown opcode
	PHA					  ; $8dba: 48	  
	INX					  ; $8dbb: E8	  
	.db $3f			  ; $8dbc - Unknown opcode
	.db $07			  ; $8dbd - Unknown opcode
	ASL ptr0_hi,X			; $8dbe: 16 05   
	EOR #$a8				 ; $8dc0: 49 A8   
	.db $0b			  ; $8dc2 - Unknown opcode
	PHA					  ; $8dc3: 48	  
	CPY $073f				; $8dc4: CC 3F 07
	ASL ptr0_hi,X			; $8dc7: 16 05   
	.db $07			  ; $8dc9 - Unknown opcode
	.db $1b			  ; $8dca - Unknown opcode
	ORA $4901,Y			  ; $8dcb: 19 01 49
	LDA ($0b),Y			  ; $8dce: B1 0B   
	EOR #$a9				 ; $8dd0: 49 A9   
	.db $0b			  ; $8dd2 - Unknown opcode
	PHA					  ; $8dd3: 48	  
	INC $3f				  ; $8dd4: E6 3F   
	EOR #$aa				 ; $8dd6: 49 AA   
	.db $07			  ; $8dd8 - Unknown opcode
	.db $03			  ; $8dd9 - Unknown opcode
	.db $02			  ; $8dda - Unknown opcode
	EOR #$ab				 ; $8ddb: 49 AB   
	.db $0b			  ; $8ddd - Unknown opcode
	.db $07			  ; $8dde - Unknown opcode
	.db $03			  ; $8ddf - Unknown opcode
	.db $03			  ; $8de0 - Unknown opcode
	EOR #$ab				 ; $8de1: 49 AB   
	EOR #$ac				 ; $8de3: 49 AC   
	BRK					  ; $8de5: 00	  
	SED					  ; $8de6: F8	  
	.db $ab			  ; $8de7 - Unknown opcode
	.db $3f			  ; $8de8 - Unknown opcode
	EOR #$b2				 ; $8de9: 49 B2   
	BRK					  ; $8deb: 00	  
	EOR $3fac,X			  ; $8dec: 5D AC 3F
	.db $07			  ; $8def - Unknown opcode
	.db $1b			  ; $8df0 - Unknown opcode
	ASL $4920				; $8df1: 0E 20 49
	BCS $8e01				; $8df4: B0 0B   
	.db $07			  ; $8df6 - Unknown opcode
	.db $03			  ; $8df7 - Unknown opcode
	BRK					  ; $8df8: 00	  
	.db $44			  ; $8df9 - Unknown opcode
	.db $02			  ; $8dfa - Unknown opcode
	.db $0b			  ; $8dfb - Unknown opcode
	.db $44			  ; $8dfc - Unknown opcode
	ORA ($3f,X)			  ; $8dfd: 01 3F   
	.db $07			  ; $8dff - Unknown opcode
	.db $1b			  ; $8e00 - Unknown opcode
loc_8E01:
	ORA $0601,Y			  ; $8e01: 19 01 06
	EOR #$89				 ; $8e04: 49 89   
	EOR #$b4				 ; $8e06: 49 B4   
	CLC					  ; $8e08: 18	  
	.db $1a			  ; $8e09 - Unknown opcode
	JSR $8c00				; $8e0a: 20 00 8C ; -> sub_8C00
	LDY $3e				  ; $8e0d: A4 3E   
	.db $0b			  ; $8e0f - Unknown opcode
	ASL $49				  ; $8e10: 06 49   
	.db $89			  ; $8e12 - Unknown opcode
	EOR #$8a				 ; $8e13: 49 8A   
	.db $07			  ; $8e15 - Unknown opcode
	STA ($72),Y			  ; $8e16: 91 72   
	EOR #$8b				 ; $8e18: 49 8B   
	ROL $013f,X			  ; $8e1a: 3E 3F 01
	.db $62			  ; $8e1d - Unknown opcode
	LDY $09ad				; $8e1e: AC AD 09
	.db $3f			  ; $8e21 - Unknown opcode
	PHA					  ; $8e22: 48	  
	.db $cf			  ; $8e23 - Unknown opcode
	.db $07			  ; $8e24 - Unknown opcode
	ASL ptr0_hi,X			; $8e25: 16 05   
	EOR #$8d				 ; $8e27: 49 8D   
	.db $3f			  ; $8e29 - Unknown opcode
	.db $07			  ; $8e2a - Unknown opcode
	ASL ptr0_hi,X			; $8e2b: 16 05   
	EOR #$8c				 ; $8e2d: 49 8C   
	.db $0b			  ; $8e2f - Unknown opcode
	PHA					  ; $8e30: 48	  
	CMP ($3f),Y			  ; $8e31: D1 3F   
	.db $07			  ; $8e33 - Unknown opcode
	ASL ptr0_hi,X			; $8e34: 16 05   
	EOR #$8e				 ; $8e36: 49 8E   
	.db $0b			  ; $8e38 - Unknown opcode
	PHA					  ; $8e39: 48	  
	BNE $8e7b				; $8e3a: D0 3F   
	.db $07			  ; $8e3c - Unknown opcode
	ASL ptr0_hi,X			; $8e3d: 16 05   
	EOR #$8f				 ; $8e3f: 49 8F   
	.db $0b			  ; $8e41 - Unknown opcode
	.db $12			  ; $8e42 - Unknown opcode
	ORA ($3f,X)			  ; $8e43: 01 3F   
	.db $07			  ; $8e45 - Unknown opcode
	ASL ptr0_hi,X			; $8e46: 16 05   
	EOR #$90				 ; $8e48: 49 90   
	.db $0b			  ; $8e4a - Unknown opcode
	PHA					  ; $8e4b: 48	  
	.db $d2			  ; $8e4c - Unknown opcode
	.db $3f			  ; $8e4d - Unknown opcode
	.db $07			  ; $8e4e - Unknown opcode
	ASL ptr0_hi,X			; $8e4f: 16 05   
	.db $07			  ; $8e51 - Unknown opcode
	.db $14			  ; $8e52 - Unknown opcode
	EOR #$93				 ; $8e53: 49 93   
	.db $0b			  ; $8e55 - Unknown opcode
	EOR #$91				 ; $8e56: 49 91   
	.db $0b			  ; $8e58 - Unknown opcode
	.db $07			  ; $8e59 - Unknown opcode
	.db $14			  ; $8e5a - Unknown opcode
	PHA					  ; $8e5b: 48	  
	.db $d3			  ; $8e5c - Unknown opcode
	.db $0b			  ; $8e5d - Unknown opcode
	PHA					  ; $8e5e: 48	  
	.db $d4			  ; $8e5f - Unknown opcode
	.db $3f			  ; $8e60 - Unknown opcode
	.db $07			  ; $8e61 - Unknown opcode
	ASL ptr0_hi,X			; $8e62: 16 05   
	EOR #$92				 ; $8e64: 49 92   
	.db $0b			  ; $8e66 - Unknown opcode
	PHA					  ; $8e67: 48	  
	CMP $3f,X				; $8e68: D5 3F   
	.db $07			  ; $8e6a - Unknown opcode
	ASL ptr0_hi,X			; $8e6b: 16 05   
	EOR #$94				 ; $8e6d: 49 94   
	.db $0b			  ; $8e6f - Unknown opcode
	PHA					  ; $8e70: 48	  
	DEC $3f,X				; $8e71: D6 3F   
	.db $07			  ; $8e73 - Unknown opcode
	ASL ptr0_hi,X			; $8e74: 16 05   
	ASL $49				  ; $8e76: 06 49   
	STA ptr1_hi,X			; $8e78: 95 07   
	.db $9b			  ; $8e7a - Unknown opcode
loc_8E7B:
	.db $17			  ; $8e7b - Unknown opcode
	.db $02			  ; $8e7c - Unknown opcode
	EOR #$96				 ; $8e7d: 49 96   
	ROL $480b,X			  ; $8e7f: 3E 0B 48
	.db $d7			  ; $8e82 - Unknown opcode
	.db $3f			  ; $8e83 - Unknown opcode
	.db $07			  ; $8e84 - Unknown opcode
	ASL ptr0_hi,X			; $8e85: 16 05   
	EOR #$97				 ; $8e87: 49 97   
	.db $0b			  ; $8e89 - Unknown opcode
	PHA					  ; $8e8a: 48	  
	CLD					  ; $8e8b: D8	  
	.db $3f			  ; $8e8c - Unknown opcode
	.db $07			  ; $8e8d - Unknown opcode
	ASL ptr0_hi,X			; $8e8e: 16 05   
	.db $07			  ; $8e90 - Unknown opcode
	.db $1b			  ; $8e91 - Unknown opcode
	.db $17			  ; $8e92 - Unknown opcode
	.db $02			  ; $8e93 - Unknown opcode
	ASL $49				  ; $8e94: 06 49   
	STA $1918,Y			  ; $8e96: 99 18 19
	.db $02			  ; $8e99 - Unknown opcode
	BRK					  ; $8e9a: 00	  
	STY $3ea4				; $8e9b: 8C A4 3E
	.db $0b			  ; $8e9e - Unknown opcode
	ASL $48				  ; $8e9f: 06 48   
	CMP $9849				; $8ea1: CD 49 98
	ROL $060b,X			  ; $8ea4: 3E 0B 06
	PHA					  ; $8ea7: 48	  
	CMP $ce48				; $8ea8: CD 48 CE
	ROL $073f,X			  ; $8eab: 3E 3F 07
	ASL ptr0_hi,X			; $8eae: 16 05   
	EOR #$9a				 ; $8eb0: 49 9A   
	.db $0b			  ; $8eb2 - Unknown opcode
	PHA					  ; $8eb3: 48	  
	CMP $073f,Y			  ; $8eb4: D9 3F 07
	ASL ptr0_hi,X			; $8eb7: 16 05   
	EOR #$9b				 ; $8eb9: 49 9B   
	.db $0b			  ; $8ebb - Unknown opcode
	PHA					  ; $8ebc: 48	  
	.db $da			  ; $8ebd - Unknown opcode
	.db $3f			  ; $8ebe - Unknown opcode
	.db $07			  ; $8ebf - Unknown opcode
	ASL ptr0_hi,X			; $8ec0: 16 05   
	EOR #$9c				 ; $8ec2: 49 9C   
	.db $0b			  ; $8ec4 - Unknown opcode
	PHA					  ; $8ec5: 48	  
	.db $db			  ; $8ec6 - Unknown opcode
	.db $3f			  ; $8ec7 - Unknown opcode
	.db $07			  ; $8ec8 - Unknown opcode
	.db $14			  ; $8ec9 - Unknown opcode
	ASL $48				  ; $8eca: 06 48   
	LDX $0307				; $8ecc: AE 07 03
	.db $02			  ; $8ecf - Unknown opcode
	PHA					  ; $8ed0: 48	  
	.db $af			  ; $8ed1 - Unknown opcode
	.db $0b			  ; $8ed2 - Unknown opcode
	.db $07			  ; $8ed3 - Unknown opcode
	.db $03			  ; $8ed4 - Unknown opcode
	.db $03			  ; $8ed5 - Unknown opcode
	PHA					  ; $8ed6: 48	  
	.db $af			  ; $8ed7 - Unknown opcode
	ROL $4a0b,X			  ; $8ed8: 3E 0B 4A
	PHP					  ; $8edb: 08	  
	.db $3f			  ; $8edc - Unknown opcode
	EOR #$9d				 ; $8edd: 49 9D   
	BRK					  ; $8edf: 00	  
	.db $1f			  ; $8ee0 - Unknown opcode
	CLV					  ; $8ee1: B8	  
	.db $3f			  ; $8ee2 - Unknown opcode
	.db $07			  ; $8ee3 - Unknown opcode
	ASL ptr0_hi,X			; $8ee4: 16 05   
	EOR #$9e				 ; $8ee6: 49 9E   
	.db $0b			  ; $8ee8 - Unknown opcode
	PHA					  ; $8ee9: 48	  
	LDX $3f,Y				; $8eea: B6 3F   
	.db $07			  ; $8eec - Unknown opcode
	ASL ptr0_hi,X			; $8eed: 16 05   
	ASL ptr1_hi			  ; $8eef: 06 07   
	.db $03			  ; $8ef1 - Unknown opcode
	.db $03			  ; $8ef2 - Unknown opcode
	ASL $49				  ; $8ef3: 06 49   
	LDY #$07				 ; $8ef5: A0 07   
	.db $03			  ; $8ef7 - Unknown opcode
	.db $02			  ; $8ef8 - Unknown opcode
	EOR #$a1				 ; $8ef9: 49 A1   
	EOR #$a2				 ; $8efb: 49 A2   
	ROL $070b,X			  ; $8efd: 3E 0B 07
	.db $03			  ; $8f00 - Unknown opcode
	.db $02			  ; $8f01 - Unknown opcode
	ASL $49				  ; $8f02: 06 49   
	LDA ($49,X)			  ; $8f04: A1 49   
	LDX #$3e				 ; $8f06: A2 3E   
	EOR #$a3				 ; $8f08: 49 A3   
	ROL $070b,X			  ; $8f0a: 3E 0B 07
	.db $83			  ; $8f0d - Unknown opcode
	ORA #$48				 ; $8f0e: 09 48   
	LDY $0b,X				; $8f10: B4 0B   
	PHA					  ; $8f12: 48	  
	LDA $3f,X				; $8f13: B5 3F   
	PHA					  ; $8f15: 48	  
	LDY $1607,X			  ; $8f16: BC 07 16
	ORA $49				  ; $8f19: 05 49   
	LDA $0b				  ; $8f1b: A5 0B   
	PHA					  ; $8f1d: 48	  
	LDA $073f,X			  ; $8f1e: BD 3F 07
	ASL ptr0_hi,X			; $8f21: 16 05   
	ASL $49				  ; $8f23: 06 49   
	LDX $46				  ; $8f25: A6 46   
	STA $0947,Y			  ; $8f27: 99 47 09
	ROL $060b,X			  ; $8f2a: 3E 0B 06
	LSR $98				  ; $8f2d: 46 98   
	LSR $99				  ; $8f2f: 46 99   
	ROL $493f,X			  ; $8f31: 3E 3F 49
	LDX $ee00,Y			  ; $8f34: BE 00 EE
	.db $ab			  ; $8f37 - Unknown opcode
	.db $3f			  ; $8f38 - Unknown opcode
	.db $07			  ; $8f39 - Unknown opcode
	.db $03			  ; $8f3a - Unknown opcode
	.db $02			  ; $8f3b - Unknown opcode
	EOR #$bf				 ; $8f3c: 49 BF   
	.db $0b			  ; $8f3e - Unknown opcode
	.db $07			  ; $8f3f - Unknown opcode
	.db $03			  ; $8f40 - Unknown opcode
	.db $03			  ; $8f41 - Unknown opcode
	EOR #$bf				 ; $8f42: 49 BF   
	.db $0b			  ; $8f44 - Unknown opcode
	EOR #$c0				 ; $8f45: 49 C0   
	EOR #$c1				 ; $8f47: 49 C1   
	BRK					  ; $8f49: 00	  
	.db $f3			  ; $8f4a - Unknown opcode
	.db $ab			  ; $8f4b - Unknown opcode
	.db $3f			  ; $8f4c - Unknown opcode
	.db $07			  ; $8f4d - Unknown opcode
	ASL ptr0_hi,X			; $8f4e: 16 05   
	EOR #$c2				 ; $8f50: 49 C2   
	.db $0b			  ; $8f52 - Unknown opcode
	.db $47			  ; $8f53 - Unknown opcode
	LDA $3f,X				; $8f54: B5 3F   
	.db $07			  ; $8f56 - Unknown opcode
	ASL ptr0_hi,X			; $8f57: 16 05   
	.db $07			  ; $8f59 - Unknown opcode
	.db $14			  ; $8f5a - Unknown opcode
	EOR #$c3				 ; $8f5b: 49 C3   
	.db $0b			  ; $8f5d - Unknown opcode
	EOR #$d0				 ; $8f5e: 49 D0   
	.db $0b			  ; $8f60 - Unknown opcode
	.db $07			  ; $8f61 - Unknown opcode
	.db $14			  ; $8f62 - Unknown opcode
	.db $47			  ; $8f63 - Unknown opcode
	LDX $0b,Y				; $8f64: B6 0B   
	.db $47			  ; $8f66 - Unknown opcode
	LDX $073f,Y			  ; $8f67: BE 3F 07
	ASL ptr0_hi,X			; $8f6a: 16 05   
	.db $07			  ; $8f6c - Unknown opcode
	.db $14			  ; $8f6d - Unknown opcode
	EOR #$c8				 ; $8f6e: 49 C8   
	.db $0b			  ; $8f70 - Unknown opcode
	EOR #$c7				 ; $8f71: 49 C7   
	.db $0b			  ; $8f73 - Unknown opcode
	.db $07			  ; $8f74 - Unknown opcode
	.db $14			  ; $8f75 - Unknown opcode
	.db $47			  ; $8f76 - Unknown opcode
	TSX					  ; $8f77: BA	  
	.db $0b			  ; $8f78 - Unknown opcode
	.db $47			  ; $8f79 - Unknown opcode
	LDA $073f,Y			  ; $8f7a: B9 3F 07
	.db $14			  ; $8f7d - Unknown opcode
	.db $07			  ; $8f7e - Unknown opcode
	ASL ptr0_hi,X			; $8f7f: 16 05   
	EOR #$c9				 ; $8f81: 49 C9   
	.db $0b			  ; $8f83 - Unknown opcode
	.db $47			  ; $8f84 - Unknown opcode
	LDY $450b,X			  ; $8f85: BC 0B 45
	DEX					  ; $8f88: CA	  
	.db $3f			  ; $8f89 - Unknown opcode
	.db $07			  ; $8f8a - Unknown opcode
	ASL ptr0_hi,X			; $8f8b: 16 05   
	.db $07			  ; $8f8d - Unknown opcode
	.db $14			  ; $8f8e - Unknown opcode
	EOR #$ca				 ; $8f8f: 49 CA   
	.db $0b			  ; $8f91 - Unknown opcode
	EOR #$cf				 ; $8f92: 49 CF   
	.db $0b			  ; $8f94 - Unknown opcode
	.db $07			  ; $8f95 - Unknown opcode
	.db $14			  ; $8f96 - Unknown opcode
	.db $47			  ; $8f97 - Unknown opcode
	.db $bb			  ; $8f98 - Unknown opcode
	.db $0b			  ; $8f99 - Unknown opcode
	.db $47			  ; $8f9a - Unknown opcode
	.db $bf			  ; $8f9b - Unknown opcode
	.db $3f			  ; $8f9c - Unknown opcode
	.db $07			  ; $8f9d - Unknown opcode
	ASL ptr0_hi,X			; $8f9e: 16 05   
	.db $07			  ; $8fa0 - Unknown opcode
	.db $14			  ; $8fa1 - Unknown opcode
	ASL ptr1_hi			  ; $8fa2: 06 07   
	.db $03			  ; $8fa4 - Unknown opcode
	.db $07			  ; $8fa5 - Unknown opcode
	EOR #$cc				 ; $8fa6: 49 CC   
	EOR #$cd				 ; $8fa8: 49 CD   
	ROL $490b,X			  ; $8faa: 3E 0B 49
	DEC $070b				; $8fad: CE 0B 07
	.db $14			  ; $8fb0 - Unknown opcode
	.db $47			  ; $8fb1 - Unknown opcode
	LDA $450b,X			  ; $8fb2: BD 0B 45
	CMP #$3f				 ; $8fb5: C9 3F	; Compare with 63
	.db $07			  ; $8fb7 - Unknown opcode
	ASL ptr0_hi,X			; $8fb8: 16 05   
	ASL $49				  ; $8fba: 06 49   
	CMP (ptr1_hi),Y		  ; $8fbc: D1 07   
	.db $03			  ; $8fbe - Unknown opcode
	.db $07			  ; $8fbf - Unknown opcode
	EOR #$d2				 ; $8fc0: 49 D2   
	ROL $460b,X			  ; $8fc2: 3E 0B 46
	.db $1c			  ; $8fc5 - Unknown opcode
	.db $3f			  ; $8fc6 - Unknown opcode
	.db $07			  ; $8fc7 - Unknown opcode
	ASL ptr0_hi,X			; $8fc8: 16 05   
	.db $07			  ; $8fca - Unknown opcode
	.db $03			  ; $8fcb - Unknown opcode
	.db $07			  ; $8fcc - Unknown opcode
	EOR #$d3				 ; $8fcd: 49 D3   
	.db $0b			  ; $8fcf - Unknown opcode
	EOR #$d4				 ; $8fd0: 49 D4   
	.db $0b			  ; $8fd2 - Unknown opcode
	LSR $1b				  ; $8fd3: 46 1B   
	.db $3f			  ; $8fd5 - Unknown opcode
	.db $07			  ; $8fd6 - Unknown opcode
	ASL ptr0_hi,X			; $8fd7: 16 05   
	EOR #$d5				 ; $8fd9: 49 D5   
	.db $0b			  ; $8fdb - Unknown opcode
	.db $07			  ; $8fdc - Unknown opcode
	.db $14			  ; $8fdd - Unknown opcode
	LSR $20				  ; $8fde: 46 20   
	.db $0b			  ; $8fe0 - Unknown opcode
	ASL $45				  ; $8fe1: 06 45   
	AND current_bank,Y	   ; $8fe3: 39 07 05
	EOR $3a				  ; $8fe6: 45 3A   
	.db $0b			  ; $8fe8 - Unknown opcode
	EOR $3b				  ; $8fe9: 45 3B   
	ROL $073f,X			  ; $8feb: 3E 3F 07
	ASL ptr0_hi,X			; $8fee: 16 05   
	EOR #$d6				 ; $8ff0: 49 D6   
	.db $0b			  ; $8ff2 - Unknown opcode
	.db $07			  ; $8ff3 - Unknown opcode
	.db $14			  ; $8ff4 - Unknown opcode
	LSR $1d				  ; $8ff5: 46 1D   
	.db $0b			  ; $8ff7 - Unknown opcode
	EOR $37				  ; $8ff8: 45 37   
	.db $3f			  ; $8ffa - Unknown opcode
	.db $07			  ; $8ffb - Unknown opcode
	ASL ptr0_hi,X			; $8ffc: 16 05   
	.db $07			  ; $8ffe - Unknown opcode
	.db $14			  ; $8fff - Unknown opcode
	EOR #$d8				 ; $9000: 49 D8   
	.db $0b			  ; $9002 - Unknown opcode
	EOR #$da				 ; $9003: 49 DA   
	.db $0b			  ; $9005 - Unknown opcode
	.db $07			  ; $9006 - Unknown opcode
	.db $14			  ; $9007 - Unknown opcode
	LSR system_flags		 ; $9008: 46 1F   
	.db $0b			  ; $900a - Unknown opcode
	EOR $38				  ; $900b: 45 38   
	.db $3f			  ; $900d - Unknown opcode
	.db $07			  ; $900e - Unknown opcode
	ASL ptr0_hi,X			; $900f: 16 05   
	EOR #$d9				 ; $9011: 49 D9   
	.db $0b			  ; $9013 - Unknown opcode
	.db $07			  ; $9014 - Unknown opcode
	.db $14			  ; $9015 - Unknown opcode
	LSR $1e				  ; $9016: 46 1E   
	.db $3f			  ; $9018 - Unknown opcode
	.db $07			  ; $9019 - Unknown opcode
	ASL ptr0_hi,X			; $901a: 16 05   
	EOR $c9				  ; $901c: 45 C9   
	.db $0b			  ; $901e - Unknown opcode
	EOR $35				  ; $901f: 45 35   
	.db $3f			  ; $9021 - Unknown opcode
	.db $07			  ; $9022 - Unknown opcode
	.db $02			  ; $9023 - Unknown opcode
	.db $12			  ; $9024 - Unknown opcode
	.db $02			  ; $9025 - Unknown opcode
	.db $0b			  ; $9026 - Unknown opcode
	EOR #$ec				 ; $9027: 49 EC   
	.db $3f			  ; $9029 - Unknown opcode
	.db $07			  ; $902a - Unknown opcode
	ASL ptr0_hi,X			; $902b: 16 05   
	EOR #$dc				 ; $902d: 49 DC   
	.db $0b			  ; $902f - Unknown opcode
	.db $47			  ; $9030 - Unknown opcode
	.db $d7			  ; $9031 - Unknown opcode
	.db $3f			  ; $9032 - Unknown opcode
loc_9033:
	.db $07			  ; $9033 - Unknown opcode
	.db $14			  ; $9034 - Unknown opcode
	.db $07			  ; $9035 - Unknown opcode
	ASL ptr0_hi,X			; $9036: 16 05   
	EOR #$dd				 ; $9038: 49 DD   
	.db $0b			  ; $903a - Unknown opcode
	.db $47			  ; $903b - Unknown opcode
	CLD					  ; $903c: D8	  
	.db $0b			  ; $903d - Unknown opcode
	EOR $c9				  ; $903e: 45 C9   
	.db $3f			  ; $9040 - Unknown opcode
	.db $07			  ; $9041 - Unknown opcode
	ASL ptr0_hi,X			; $9042: 16 05   
	EOR #$de				 ; $9044: 49 DE   
	.db $0b			  ; $9046 - Unknown opcode
	.db $07			  ; $9047 - Unknown opcode
	.db $14			  ; $9048 - Unknown opcode
	.db $47			  ; $9049 - Unknown opcode
	CMP $470b,Y			  ; $904a: D9 0B 47
	.db $dc			  ; $904d - Unknown opcode
	.db $3f			  ; $904e - Unknown opcode
	.db $07			  ; $904f - Unknown opcode
	.db $14			  ; $9050 - Unknown opcode
	.db $07			  ; $9051 - Unknown opcode
	ASL ptr0_hi,X			; $9052: 16 05   
	EOR #$df				 ; $9054: 49 DF   
	.db $0b			  ; $9056 - Unknown opcode
	.db $47			  ; $9057 - Unknown opcode
	.db $da			  ; $9058 - Unknown opcode
	.db $0b			  ; $9059 - Unknown opcode
	EOR $ca				  ; $905a: 45 CA   
	.db $3f			  ; $905c - Unknown opcode
	.db $07			  ; $905d - Unknown opcode
	ASL ptr0_hi,X			; $905e: 16 05   
	ASL $49				  ; $9060: 06 49   
	CPX #$07				 ; $9062: E0 07   
	STA $49				  ; $9064: 85 49   
	SBC ($49,X)			  ; $9066: E1 49	; Arithmetic
	.db $e2			  ; $9068 - Unknown opcode
	ROL $470b,X			  ; $9069: 3E 0B 47
	.db $db			  ; $906c - Unknown opcode
	.db $3f			  ; $906d - Unknown opcode
	.db $07			  ; $906e - Unknown opcode
	.db $03			  ; $906f - Unknown opcode
	.db $02			  ; $9070 - Unknown opcode
	.db $47			  ; $9071 - Unknown opcode
	.db $12			  ; $9072 - Unknown opcode
loc_9073:
	.db $0b			  ; $9073 - Unknown opcode
	.db $07			  ; $9074 - Unknown opcode
	.db $03			  ; $9075 - Unknown opcode
	.db $03			  ; $9076 - Unknown opcode
	.db $47			  ; $9077 - Unknown opcode
	.db $12			  ; $9078 - Unknown opcode
	.db $0b			  ; $9079 - Unknown opcode
	.db $47			  ; $907a - Unknown opcode
	.db $13			  ; $907b - Unknown opcode
	.db $3f			  ; $907c - Unknown opcode
	EOR #$ed				 ; $907d: 49 ED   
	BRK					  ; $907f: 00	  
	STY $3fa4				; $9080: 8C A4 3F
	EOR #$ee				 ; $9083: 49 EE   
	.db $07			  ; $9085 - Unknown opcode
	ORA $49				  ; $9086: 05 49   
	.db $ef			  ; $9088 - Unknown opcode
	.db $0b			  ; $9089 - Unknown opcode
	EOR #$ef				 ; $908a: 49 EF   
	.db $3f			  ; $908c - Unknown opcode
	EOR #$f0				 ; $908d: 49 F0   
	CLC					  ; $908f: 18	  
	.db $1a			  ; $9090 - Unknown opcode
	BPL $90d2				; $9091: 10 3F   
	.db $07			  ; $9093 - Unknown opcode
	.db $1b			  ; $9094 - Unknown opcode
	ASL $4980				; $9095: 0E 80 49
	.db $f2			  ; $9098 - Unknown opcode
	.db $0b			  ; $9099 - Unknown opcode
	EOR #$f1				 ; $909a: 49 F1   
	.db $3f			  ; $909c - Unknown opcode
	.db $07			  ; $909d - Unknown opcode
	.db $1b			  ; $909e - Unknown opcode
	ASL $4940				; $909f: 0E 40 49
	.db $f4			  ; $90a2 - Unknown opcode
	.db $0b			  ; $90a3 - Unknown opcode
	EOR #$f3				 ; $90a4: 49 F3   
	.db $3f			  ; $90a6 - Unknown opcode
	ORA ($fd,X)			  ; $90a7: 01 FD   
	.db $ab			  ; $90a9 - Unknown opcode
	SBC $09,X				; $90aa: F5 09	; Arithmetic
	CLC					  ; $90ac: 18	  
	.db $1a			  ; $90ad - Unknown opcode
	BPL $90ef				; $90ae: 10 3F   
	.db $07			  ; $90b0 - Unknown opcode
	ASL ptr0_hi,X			; $90b1: 16 05   
	EOR #$fb				 ; $90b3: 49 FB   
	.db $0b			  ; $90b5 - Unknown opcode
	.db $07			  ; $90b6 - Unknown opcode
	.db $14			  ; $90b7 - Unknown opcode
	LSR $8f				  ; $90b8: 46 8F   
	.db $0b			  ; $90ba - Unknown opcode
	EOR $67				  ; $90bb: 45 67   
	.db $3f			  ; $90bd - Unknown opcode
	.db $07			  ; $90be - Unknown opcode
	ASL ptr0_hi,X			; $90bf: 16 05   
	EOR #$fc				 ; $90c1: 49 FC   
	.db $0b			  ; $90c3 - Unknown opcode
	LSR $89				  ; $90c4: 46 89   
	.db $3f			  ; $90c6 - Unknown opcode
	.db $07			  ; $90c7 - Unknown opcode
	ASL ptr0_hi,X			; $90c8: 16 05   
	ASL $49				  ; $90ca: 06 49   
	INC current_bank,X	   ; $90cc: FE 07 05
	EOR #$ff				 ; $90cf: 49 FF   
	.db $0b			  ; $90d1 - Unknown opcode
loc_90D2:
	LSR					  ; $90d2: 4A	  
	BRK					  ; $90d3: 00	  
	ROL $070b,X			  ; $90d4: 3E 0B 07
	.db $14			  ; $90d7 - Unknown opcode
	LSR $8e				  ; $90d8: 46 8E   
	.db $0b			  ; $90da - Unknown opcode
	EOR $61				  ; $90db: 45 61   
	.db $3f			  ; $90dd - Unknown opcode
	.db $07			  ; $90de - Unknown opcode
	ASL ptr0_hi,X			; $90df: 16 05   
	.db $07			  ; $90e1 - Unknown opcode
	.db $14			  ; $90e2 - Unknown opcode
	ASL ptr1_hi			  ; $90e3: 06 07   
	.db $1b			  ; $90e5 - Unknown opcode
	.db $1a			  ; $90e6 - Unknown opcode
	.db $02			  ; $90e7 - Unknown opcode
	LSR					  ; $90e8: 4A	  
	ASL $4a0b,X			  ; $90e9: 1E 0B 4A
	ORA ($3e,X)			  ; $90ec: 01 3E   
	.db $0b			  ; $90ee - Unknown opcode
loc_90EF:
	LSR					  ; $90ef: 4A	  
	.db $02			  ; $90f0 - Unknown opcode
	.db $0b			  ; $90f1 - Unknown opcode
	.db $07			  ; $90f2 - Unknown opcode
	.db $14			  ; $90f3 - Unknown opcode
	LSR $8c				  ; $90f4: 46 8C   
	.db $0b			  ; $90f6 - Unknown opcode
	EOR $60				  ; $90f7: 45 60   
	.db $3f			  ; $90f9 - Unknown opcode
	.db $07			  ; $90fa - Unknown opcode
	ASL ptr0_hi,X			; $90fb: 16 05   
	.db $07			  ; $90fd - Unknown opcode
	.db $14			  ; $90fe - Unknown opcode
	LSR					  ; $90ff: 4A	  
	.db $04			  ; $9100 - Unknown opcode
	.db $0b			  ; $9101 - Unknown opcode
	LSR					  ; $9102: 4A	  
	.db $03			  ; $9103 - Unknown opcode
	.db $0b			  ; $9104 - Unknown opcode
	.db $07			  ; $9105 - Unknown opcode
	.db $14			  ; $9106 - Unknown opcode
	LSR $92				  ; $9107: 46 92   
	.db $0b			  ; $9109 - Unknown opcode
	EOR $66				  ; $910a: 45 66   
	.db $3f			  ; $910c - Unknown opcode
	.db $07			  ; $910d - Unknown opcode
	ASL ptr0_hi,X			; $910e: 16 05   
	LSR					  ; $9110: 4A	  
	ORA $0b				  ; $9111: 05 0B   
	EOR $69				  ; $9113: 45 69   
	.db $3f			  ; $9115 - Unknown opcode
	.db $07			  ; $9116 - Unknown opcode
	ASL ptr0_hi,X			; $9117: 16 05   
	LSR					  ; $9119: 4A	  
	ASL $0b				  ; $911a: 06 0B   
	EOR $6d				  ; $911c: 45 6D   
	.db $3f			  ; $911e - Unknown opcode
	.db $07			  ; $911f - Unknown opcode
	ASL ptr0_hi,X			; $9120: 16 05   
	LSR					  ; $9122: 4A	  
	.db $07			  ; $9123 - Unknown opcode
	.db $0b			  ; $9124 - Unknown opcode
	EOR $6b				  ; $9125: 45 6B   
	.db $3f			  ; $9127 - Unknown opcode
	.db $07			  ; $9128 - Unknown opcode
	ASL ptr0_hi,X			; $9129: 16 05   
	ORA ($37,X)			  ; $912b: 01 37   
	LDY $0a09				; $912d: AC 09 0A
	.db $0b			  ; $9130 - Unknown opcode
	EOR $6c				  ; $9131: 45 6C   
	.db $3f			  ; $9133 - Unknown opcode
	.db $07			  ; $9134 - Unknown opcode
	ASL ptr0_hi,X			; $9135: 16 05   
	ASL ptr1_hi			  ; $9137: 06 07   
	.db $1b			  ; $9139 - Unknown opcode
	.db $1a			  ; $913a - Unknown opcode
	.db $02			  ; $913b - Unknown opcode
	LSR					  ; $913c: 4A	  
	.db $1c			  ; $913d - Unknown opcode
	.db $0b			  ; $913e - Unknown opcode
	.db $07			  ; $913f - Unknown opcode
	.db $03			  ; $9140 - Unknown opcode
	.db $03			  ; $9141 - Unknown opcode
	LSR					  ; $9142: 4A	  
	ASL $4a0b				; $9143: 0E 0B 4A
	.db $0f			  ; $9146 - Unknown opcode
	ROL $070b,X			  ; $9147: 3E 0B 07
	.db $14			  ; $914a - Unknown opcode
	LSR $94				  ; $914b: 46 94   
	.db $0b			  ; $914d - Unknown opcode
	EOR $6e				  ; $914e: 45 6E   
	.db $3f			  ; $9150 - Unknown opcode
	.db $07			  ; $9151 - Unknown opcode
	ASL ptr0_hi,X			; $9152: 16 05   
	ASL ptr1_hi			  ; $9154: 06 07   
	.db $1b			  ; $9156 - Unknown opcode
	.db $1a			  ; $9157 - Unknown opcode
	.db $02			  ; $9158 - Unknown opcode
	LSR					  ; $9159: 4A	  
	ORA $4a0b,X			  ; $915a: 1D 0B 4A
	BPL $919d				; $915d: 10 3E   
	.db $0b			  ; $915f - Unknown opcode
	EOR $6f				  ; $9160: 45 6F   
	.db $3f			  ; $9162 - Unknown opcode
	.db $07			  ; $9163 - Unknown opcode
	.db $9b			  ; $9164 - Unknown opcode
	.db $1a			  ; $9165 - Unknown opcode
	BPL $916f				; $9166: 10 07   
	.db $14			  ; $9168 - Unknown opcode
	LSR					  ; $9169: 4A	  
	ORA ($0b),Y			  ; $916a: 11 0B   
	LSR					  ; $916c: 4A	  
	ORA $0b,X				; $916d: 15 0B   
loc_916F:
	ASL ptr1_hi			  ; $916f: 06 07   
	.db $14			  ; $9171 - Unknown opcode
	ASL $4a				  ; $9172: 06 4A   
	.db $12			  ; $9174 - Unknown opcode
	.db $07			  ; $9175 - Unknown opcode
	STA $4a				  ; $9176: 85 4A   
	.db $13			  ; $9178 - Unknown opcode
	.db $0b			  ; $9179 - Unknown opcode
	ASL $4a				  ; $917a: 06 4A   
	.db $14			  ; $917c - Unknown opcode
	BRK					  ; $917d: 00	  
	.db $c3			  ; $917e - Unknown opcode
	TAX					  ; $917f: AA	  
	ROL $0b3e,X			  ; $9180: 3E 3E 0B
	LSR					  ; $9183: 4A	  
	ASL $3e,X				; $9184: 16 3E   
	.db $3f			  ; $9186 - Unknown opcode
	.db $07			  ; $9187 - Unknown opcode
	.db $1b			  ; $9188 - Unknown opcode
	.db $1a			  ; $9189 - Unknown opcode
	.db $02			  ; $918a - Unknown opcode
	EOR $70				  ; $918b: 45 70   
	.db $0b			  ; $918d - Unknown opcode
	.db $07			  ; $918e - Unknown opcode
	ASL ptr0_hi,X			; $918f: 16 05   
	LSR					  ; $9191: 4A	  
	.db $17			  ; $9192 - Unknown opcode
	.db $0b			  ; $9193 - Unknown opcode
	EOR $70				  ; $9194: 45 70   
	.db $3f			  ; $9196 - Unknown opcode
	.db $07			  ; $9197 - Unknown opcode
	.db $1b			  ; $9198 - Unknown opcode
	.db $1a			  ; $9199 - Unknown opcode
	.db $02			  ; $919a - Unknown opcode
	EOR $73				  ; $919b: 45 73   
loc_919D:
	.db $0b			  ; $919d - Unknown opcode
	.db $07			  ; $919e - Unknown opcode
	ASL ptr0_hi,X			; $919f: 16 05   
	LSR					  ; $91a1: 4A	  
	ORA $450b,Y			  ; $91a2: 19 0B 45
	.db $73			  ; $91a5 - Unknown opcode
	.db $3f			  ; $91a6 - Unknown opcode
	.db $07			  ; $91a7 - Unknown opcode
	.db $1b			  ; $91a8 - Unknown opcode
	.db $1a			  ; $91a9 - Unknown opcode
	.db $02			  ; $91aa - Unknown opcode
	LSR					  ; $91ab: 4A	  
	AND ($0b,X)			  ; $91ac: 21 0B   
	.db $07			  ; $91ae - Unknown opcode
	ASL ptr0_hi,X			; $91af: 16 05   
	LSR					  ; $91b1: 4A	  
	.db $1a			  ; $91b2 - Unknown opcode
	.db $0b			  ; $91b3 - Unknown opcode
	EOR $74				  ; $91b4: 45 74   
	.db $3f			  ; $91b6 - Unknown opcode
	.db $07			  ; $91b7 - Unknown opcode
	.db $1b			  ; $91b8 - Unknown opcode
	.db $1a			  ; $91b9 - Unknown opcode
	.db $02			  ; $91ba - Unknown opcode
	EOR $76				  ; $91bb: 45 76   
	.db $0b			  ; $91bd - Unknown opcode
	.db $07			  ; $91be - Unknown opcode
	ASL ptr0_hi,X			; $91bf: 16 05   
	LSR					  ; $91c1: 4A	  
	.db $1b			  ; $91c2 - Unknown opcode
	.db $0b			  ; $91c3 - Unknown opcode
	EOR $76				  ; $91c4: 45 76   
	.db $3f			  ; $91c6 - Unknown opcode
	.db $07			  ; $91c7 - Unknown opcode
	ASL ptr0_hi,X			; $91c8: 16 05   
	LSR					  ; $91ca: 4A	  
	.db $23			  ; $91cb - Unknown opcode
	.db $0b			  ; $91cc - Unknown opcode
	.db $07			  ; $91cd - Unknown opcode
	.db $14			  ; $91ce - Unknown opcode
	EOR $e8				  ; $91cf: 45 E8   
	.db $0b			  ; $91d1 - Unknown opcode
	EOR $2b				  ; $91d2: 45 2B   
	.db $3f			  ; $91d4 - Unknown opcode
	.db $07			  ; $91d5 - Unknown opcode
	ASL ptr0_hi,X			; $91d6: 16 05   
	LSR					  ; $91d8: 4A	  
	BIT $0b				  ; $91d9: 24 0B   
	.db $07			  ; $91db - Unknown opcode
	.db $14			  ; $91dc - Unknown opcode
	EOR $e7				  ; $91dd: 45 E7   
	.db $0b			  ; $91df - Unknown opcode
	EOR $2a				  ; $91e0: 45 2A   
	.db $3f			  ; $91e2 - Unknown opcode
	.db $07			  ; $91e3 - Unknown opcode
	ASL ptr0_hi,X			; $91e4: 16 05   
	.db $07			  ; $91e6 - Unknown opcode
	.db $14			  ; $91e7 - Unknown opcode
	ASL ptr1_hi			  ; $91e8: 06 07   
	.db $03			  ; $91ea - Unknown opcode
	ASL $4a				  ; $91eb: 06 4A   
	AND $0b				  ; $91ed: 25 0B   
	LSR					  ; $91ef: 4A	  
	ROL $3e				  ; $91f0: 26 3E   
	.db $0b			  ; $91f2 - Unknown opcode
	LSR					  ; $91f3: 4A	  
	.db $27			  ; $91f4 - Unknown opcode
	.db $0b			  ; $91f5 - Unknown opcode
	.db $07			  ; $91f6 - Unknown opcode
	.db $14			  ; $91f7 - Unknown opcode
	EOR pos_y_lo			 ; $91f8: 45 EC   
	.db $0b			  ; $91fa - Unknown opcode
	EOR $27				  ; $91fb: 45 27   
	.db $3f			  ; $91fd - Unknown opcode
	.db $07			  ; $91fe - Unknown opcode
	ASL ptr0_hi,X			; $91ff: 16 05   
	LSR					  ; $9201: 4A	  
	PLP					  ; $9202: 28	  
	.db $0b			  ; $9203 - Unknown opcode
	EOR pos_x_hi			 ; $9204: 45 EB   
	.db $3f			  ; $9206 - Unknown opcode
	.db $07			  ; $9207 - Unknown opcode
	ASL ptr0_hi,X			; $9208: 16 05   
	.db $07			  ; $920a - Unknown opcode
	.db $14			  ; $920b - Unknown opcode
	LSR					  ; $920c: 4A	  
	AND #$0b				 ; $920d: 29 0B   
	LSR					  ; $920f: 4A	  
	.db $32			  ; $9210 - Unknown opcode
	.db $0b			  ; $9211 - Unknown opcode
	EOR pos_x_lo			 ; $9212: 45 EA   
	.db $3f			  ; $9214 - Unknown opcode
	.db $07			  ; $9215 - Unknown opcode
	ASL ptr0_hi,X			; $9216: 16 05   
	.db $07			  ; $9218 - Unknown opcode
	.db $14			  ; $9219 - Unknown opcode
	LSR					  ; $921a: 4A	  
	ROL					  ; $921b: 2A	  
	.db $0b			  ; $921c - Unknown opcode
	LSR					  ; $921d: 4A	  
	ROL $070b				; $921e: 2E 0B 07
	.db $14			  ; $9221 - Unknown opcode
	EOR $f2				  ; $9222: 45 F2   
	.db $0b			  ; $9224 - Unknown opcode
	EOR $25				  ; $9225: 45 25   
	.db $3f			  ; $9227 - Unknown opcode
	.db $07			  ; $9228 - Unknown opcode
	ASL ptr0_hi,X			; $9229: 16 05   
	LSR					  ; $922b: 4A	  
	.db $2b			  ; $922c - Unknown opcode
	.db $0b			  ; $922d - Unknown opcode
	EOR $ef				  ; $922e: 45 EF   
	.db $3f			  ; $9230 - Unknown opcode
	.db $07			  ; $9231 - Unknown opcode
	ASL ptr0_hi,X			; $9232: 16 05   
	.db $07			  ; $9234 - Unknown opcode
	.db $14			  ; $9235 - Unknown opcode
	LSR					  ; $9236: 4A	  
	BIT $450b				; $9237: 2C 0B 45
	DEX					  ; $923a: CA	  
	.db $0b			  ; $923b - Unknown opcode
	.db $07			  ; $923c - Unknown opcode
	.db $14			  ; $923d - Unknown opcode
	EOR $f0				  ; $923e: 45 F0   
	.db $0b			  ; $9240 - Unknown opcode
	EOR $2c				  ; $9241: 45 2C   
	.db $3f			  ; $9243 - Unknown opcode
	.db $07			  ; $9244 - Unknown opcode
	ASL ptr0_hi,X			; $9245: 16 05   
	LSR					  ; $9247: 4A	  
	AND $450b				; $9248: 2D 0B 45
	SBC ($3f),Y			  ; $924b: F1 3F	; Arithmetic
	.db $07			  ; $924d - Unknown opcode
	ASL ptr0_hi,X			; $924e: 16 05   
	LSR					  ; $9250: 4A	  
	.db $2f			  ; $9251 - Unknown opcode
	.db $0b			  ; $9252 - Unknown opcode
	EOR $26				  ; $9253: 45 26   
	.db $3f			  ; $9255 - Unknown opcode
	.db $07			  ; $9256 - Unknown opcode
	ASL ptr0_hi,X			; $9257: 16 05   
	.db $07			  ; $9259 - Unknown opcode
	.db $14			  ; $925a - Unknown opcode
	LSR					  ; $925b: 4A	  
	BMI $9269				; $925c: 30 0B   
	LSR					  ; $925e: 4A	  
	AND ($0b),Y			  ; $925f: 31 0B   
	EOR $e9				  ; $9261: 45 E9   
	.db $3f			  ; $9263 - Unknown opcode
	.db $07			  ; $9264 - Unknown opcode
	.db $14			  ; $9265 - Unknown opcode
	.db $07			  ; $9266 - Unknown opcode
	ASL ptr0_hi,X			; $9267: 16 05   
loc_9269:
	LSR					  ; $9269: 4A	  
	RTI					  ; $926a: 40	  
	.db $0b			  ; $926b - Unknown opcode
	EOR $e1				  ; $926c: 45 E1   
	.db $0b			  ; $926e - Unknown opcode
	EOR $21				  ; $926f: 45 21   
	.db $3f			  ; $9271 - Unknown opcode
	EOR $e3				  ; $9272: 45 E3   
	.db $07			  ; $9274 - Unknown opcode
	ASL tmp1,X			   ; $9275: 16 01   
	EOR $e4				  ; $9277: 45 E4   
	.db $3f			  ; $9279 - Unknown opcode
	.db $07			  ; $927a - Unknown opcode
	ASL ptr0_hi,X			; $927b: 16 05   
	LSR					  ; $927d: 4A	  
	AND $0b,X				; $927e: 35 0B   
	EOR $e5				  ; $9280: 45 E5   
	.db $3f			  ; $9282 - Unknown opcode
	.db $07			  ; $9283 - Unknown opcode
	ASL ptr0_hi,X			; $9284: 16 05   
	LSR					  ; $9286: 4A	  
	.db $37			  ; $9287 - Unknown opcode
	.db $0b			  ; $9288 - Unknown opcode
	EOR $e6				  ; $9289: 45 E6   
	.db $3f			  ; $928b - Unknown opcode
	.db $07			  ; $928c - Unknown opcode
	ASL ptr0_hi,X			; $928d: 16 05   
	.db $07			  ; $928f - Unknown opcode
	.db $83			  ; $9290 - Unknown opcode
	ASL $4a				  ; $9291: 06 4A   
	.db $42			  ; $9293 - Unknown opcode
	.db $0b			  ; $9294 - Unknown opcode
	LSR					  ; $9295: 4A	  
	EOR ($0b,X)			  ; $9296: 41 0B   
	EOR $d5				  ; $9298: 45 D5   
	.db $3f			  ; $929a - Unknown opcode
	.db $07			  ; $929b - Unknown opcode
	ASL ptr0_hi,X			; $929c: 16 05   
	.db $07			  ; $929e - Unknown opcode
	.db $83			  ; $929f - Unknown opcode
	ASL $4a				  ; $92a0: 06 4A   
	.db $44			  ; $92a2 - Unknown opcode
	.db $0b			  ; $92a3 - Unknown opcode
	LSR					  ; $92a4: 4A	  
	.db $43			  ; $92a5 - Unknown opcode
	.db $0b			  ; $92a6 - Unknown opcode
	EOR $d6				  ; $92a7: 45 D6   
	.db $3f			  ; $92a9 - Unknown opcode
	.db $07			  ; $92aa - Unknown opcode
	ASL ptr0_hi,X			; $92ab: 16 05   
	LSR					  ; $92ad: 4A	  
loc_92AE:
	EOR $0b				  ; $92ae: 45 0B   
	.db $07			  ; $92b0 - Unknown opcode
	.db $14			  ; $92b1 - Unknown opcode
	EOR $df				  ; $92b2: 45 DF   
	.db $0b			  ; $92b4 - Unknown opcode
	EOR $1c				  ; $92b5: 45 1C   
	.db $3f			  ; $92b7 - Unknown opcode
	.db $07			  ; $92b8 - Unknown opcode
	ASL ptr0_hi,X			; $92b9: 16 05   
	ASL $4a				  ; $92bb: 06 4A   
	LSR ptr1_hi			  ; $92bd: 46 07   
	ORA $4a				  ; $92bf: 05 4A   
	.db $47			  ; $92c1 - Unknown opcode
	.db $0b			  ; $92c2 - Unknown opcode
	LSR					  ; $92c3: 4A	  
	PHA					  ; $92c4: 48	  
	ROL $450b,X			  ; $92c5: 3E 0B 45
	CLD					  ; $92c8: D8	  
	.db $3f			  ; $92c9 - Unknown opcode
	.db $07			  ; $92ca - Unknown opcode
	ASL ptr0_hi,X			; $92cb: 16 05   
	LSR $45				  ; $92cd: 46 45   
	.db $0b			  ; $92cf - Unknown opcode
	EOR $d9				  ; $92d0: 45 D9   
	.db $3f			  ; $92d2 - Unknown opcode
	.db $07			  ; $92d3 - Unknown opcode
	ASL ptr0_hi,X			; $92d4: 16 05   
	.db $07			  ; $92d6 - Unknown opcode
	.db $83			  ; $92d7 - Unknown opcode
	ASL $4a				  ; $92d8: 06 4A   
	LSR					  ; $92da: 4A	  
	.db $0b			  ; $92db - Unknown opcode
	LSR					  ; $92dc: 4A	  
	EOR #$0b				 ; $92dd: 49 0B   
	EOR $da				  ; $92df: 45 DA   
	.db $3f			  ; $92e1 - Unknown opcode
	.db $07			  ; $92e2 - Unknown opcode
	ASL ptr0_hi,X			; $92e3: 16 05   
	LSR					  ; $92e5: 4A	  
	.db $4b			  ; $92e6 - Unknown opcode
	.db $0b			  ; $92e7 - Unknown opcode
	EOR $de				  ; $92e8: 45 DE   
	.db $3f			  ; $92ea - Unknown opcode
	.db $07			  ; $92eb - Unknown opcode
	ASL ptr0_hi,X			; $92ec: 16 05   
	LSR					  ; $92ee: 4A	  
	JMP $450b				; $92ef: 4C 0B 45
	CMP $4a3f,X			  ; $92f2: DD 3F 4A
	.db $4f			  ; $92f5 - Unknown opcode
	BRK					  ; $92f6: 00	  
	BMI $92ae				; $92f7: 30 B5   
	.db $3f			  ; $92f9 - Unknown opcode
	.db $07			  ; $92fa - Unknown opcode
	.db $1b			  ; $92fb - Unknown opcode
	ORA $4a40,X			  ; $92fc: 1D 40 4A
	PLA					  ; $92ff: 68	  
	.db $0b			  ; $9300 - Unknown opcode
	ASL $4a				  ; $9301: 06 4A   
	EOR tmp0,X			   ; $9303: 55 00   
	ADC $ac,X				; $9305: 75 AC	; Arithmetic
	ROL $073f,X			  ; $9307: 3E 3F 07
	.db $1b			  ; $930a - Unknown opcode
	ORA $0620,X			  ; $930b: 1D 20 06
	LSR					  ; $930e: 4A	  
	EOR $4d4a				; $930f: 4D 4A 4D
	LSR					  ; $9312: 4A	  
	LSR $0b3e				; $9313: 4E 3E 0B
	.db $07			  ; $9316 - Unknown opcode
	.db $1b			  ; $9317 - Unknown opcode
	ORA $4a80,X			  ; $9318: 1D 80 4A
	CLI					  ; $931b: 58	  
	.db $0b			  ; $931c - Unknown opcode
	ASL $4a				  ; $931d: 06 4A   
	EOR $4e4a				; $931f: 4D 4A 4E
	ROL $073f,X			  ; $9322: 3E 3F 07
	.db $1b			  ; $9325 - Unknown opcode
	ORA $4a20,X			  ; $9326: 1D 20 4A
	ADC $0b				  ; $9329: 65 0B	; Arithmetic
	.db $07			  ; $932b - Unknown opcode
	.db $1b			  ; $932c - Unknown opcode
	ORA $4a80,X			  ; $932d: 1D 80 4A
	EOR $4a0b,Y			  ; $9330: 59 0B 4A
	BVC $9374				; $9333: 50 3F   
	.db $07			  ; $9335 - Unknown opcode
	.db $1b			  ; $9336 - Unknown opcode
	ORA $4a20,X			  ; $9337: 1D 20 4A
	ROR $0b				  ; $933a: 66 0B   
	.db $07			  ; $933c - Unknown opcode
	.db $1b			  ; $933d - Unknown opcode
	ORA $4a80,X			  ; $933e: 1D 80 4A
	.db $5a			  ; $9341 - Unknown opcode
	.db $0b			  ; $9342 - Unknown opcode
	LSR					  ; $9343: 4A	  
	EOR ($3f),Y			  ; $9344: 51 3F   
	.db $07			  ; $9346 - Unknown opcode
	.db $1b			  ; $9347 - Unknown opcode
	ORA $4a20,X			  ; $9348: 1D 20 4A
	.db $62			  ; $934b - Unknown opcode
	.db $0b			  ; $934c - Unknown opcode
	.db $07			  ; $934d - Unknown opcode
	.db $1b			  ; $934e - Unknown opcode
	ORA $0140,X			  ; $934f: 1D 40 01
	DEY					  ; $9352: 88	  
	LDY $0a5f				; $9353: AC 5F 0A
	.db $0b			  ; $9356 - Unknown opcode
	.db $07			  ; $9357 - Unknown opcode
	.db $1b			  ; $9358 - Unknown opcode
	ORA $4a80,X			  ; $9359: 1D 80 4A
	.db $5b			  ; $935c - Unknown opcode
	.db $0b			  ; $935d - Unknown opcode
	LSR					  ; $935e: 4A	  
	.db $52			  ; $935f - Unknown opcode
	.db $3f			  ; $9360 - Unknown opcode
	.db $07			  ; $9361 - Unknown opcode
	.db $1b			  ; $9362 - Unknown opcode
	ORA $4a20,X			  ; $9363: 1D 20 4A
	.db $67			  ; $9366 - Unknown opcode
	.db $0b			  ; $9367 - Unknown opcode
	.db $07			  ; $9368 - Unknown opcode
	.db $1b			  ; $9369 - Unknown opcode
	ORA $0080,X			  ; $936a: 1D 80 00
	ORA $0bad,Y			  ; $936d: 19 AD 0B
	LSR					  ; $9370: 4A	  
	.db $54			  ; $9371 - Unknown opcode
	.db $3f			  ; $9372 - Unknown opcode
	.db $07			  ; $9373 - Unknown opcode
loc_9374:
	.db $1b			  ; $9374 - Unknown opcode
	ORA $0120,X			  ; $9375: 1D 20 01
	.db $d2			  ; $9378 - Unknown opcode
	LDY $0a69				; $9379: AC 69 0A
	.db $0b			  ; $937c - Unknown opcode
	ORA ($ae,X)			  ; $937d: 01 AE   
	LDY $0a56				; $937f: AC 56 0A
	.db $3f			  ; $9382 - Unknown opcode
	.db $07			  ; $9383 - Unknown opcode
	.db $1b			  ; $9384 - Unknown opcode
	ASL $0680				; $9385: 0E 80 06
	LSR					  ; $9388: 4A	  
	EOR $7a00,X			  ; $9389: 5D 00 7A
	LDY $0b3e				; $938c: AC 3E 0B
	ASL $18				  ; $938f: 06 18   
	ASL $4a80				; $9391: 0E 80 4A
	.db $5c			  ; $9394 - Unknown opcode
	BRK					  ; $9395: 00	  
	.db $82			  ; $9396 - Unknown opcode
	LDY $3f3e				; $9397: AC 3E 3F
	.db $07			  ; $939a - Unknown opcode
	.db $1b			  ; $939b - Unknown opcode
	ORA $4a40,X			  ; $939c: 1D 40 4A
	LSR $4a0b,X			  ; $939f: 5E 0B 4A
	.db $53			  ; $93a2 - Unknown opcode
	.db $3f			  ; $93a3 - Unknown opcode
	LSR					  ; $93a4: 4A	  
	ROR $8a00				; $93a5: 6E 00 8A
	LDA $003f				; $93a8: AD 3F 00
	.db $8f			  ; $93ab - Unknown opcode
	LDA $073f				; $93ac: AD 3F 07
	.db $1b			  ; $93af - Unknown opcode
	.db $1b			  ; $93b0 - Unknown opcode
	.db $ff			  ; $93b1 - Unknown opcode
	LSR					  ; $93b2: 4A	  
	.db $72			  ; $93b3 - Unknown opcode
	.db $0b			  ; $93b4 - Unknown opcode
	ASL $4a				  ; $93b5: 06 4A   
	.db $73			  ; $93b7 - Unknown opcode
	.db $07			  ; $93b8 - Unknown opcode
	ORA $4a				  ; $93b9: 05 4A   
	.db $74			  ; $93bb - Unknown opcode
	.db $0b			  ; $93bc - Unknown opcode
	LSR					  ; $93bd: 4A	  
	ADC $3e,X				; $93be: 75 3E	; Arithmetic
	.db $3f			  ; $93c0 - Unknown opcode
	.db $07			  ; $93c1 - Unknown opcode
	.db $1b			  ; $93c2 - Unknown opcode
	ORA $4a01,X			  ; $93c3: 1D 01 4A
	.db $83			  ; $93c6 - Unknown opcode
	.db $0b			  ; $93c7 - Unknown opcode
	.db $07			  ; $93c8 - Unknown opcode
	.db $1b			  ; $93c9 - Unknown opcode
	.db $1a			  ; $93ca - Unknown opcode
	ORA ($4a,X)			  ; $93cb: 01 4A   
	ADC $070b,Y			  ; $93cd: 79 0B 07 ; Arithmetic
	.db $1b			  ; $93d0 - Unknown opcode
	ASL $4a01				; $93d1: 0E 01 4A
	.db $77			  ; $93d4 - Unknown opcode
	.db $0b			  ; $93d5 - Unknown opcode
	LSR					  ; $93d6: 4A	  
	ROR $3f,X				; $93d7: 76 3F   
	.db $07			  ; $93d9 - Unknown opcode
	.db $1b			  ; $93da - Unknown opcode
	ORA $4a01,X			  ; $93db: 1D 01 4A
	STY $0b				  ; $93de: 84 0B   
	.db $07			  ; $93e0 - Unknown opcode
	.db $1b			  ; $93e1 - Unknown opcode
	.db $1a			  ; $93e2 - Unknown opcode
	ORA ($4a,X)			  ; $93e3: 01 4A   
	.db $7a			  ; $93e5 - Unknown opcode
	.db $0b			  ; $93e6 - Unknown opcode
	LSR					  ; $93e7: 4A	  
	SEI					  ; $93e8: 78	  
	.db $3f			  ; $93e9 - Unknown opcode
	.db $07			  ; $93ea - Unknown opcode
	.db $1b			  ; $93eb - Unknown opcode
	ORA $4a01,X			  ; $93ec: 1D 01 4A
	.db $82			  ; $93ef - Unknown opcode
	.db $0b			  ; $93f0 - Unknown opcode
	.db $47			  ; $93f1 - Unknown opcode
	.db $4f			  ; $93f2 - Unknown opcode
	.db $3f			  ; $93f3 - Unknown opcode
	.db $07			  ; $93f4 - Unknown opcode
	.db $1b			  ; $93f5 - Unknown opcode
	ORA $4a01,X			  ; $93f6: 1D 01 4A
	STA $0b				  ; $93f9: 85 0B   
	.db $07			  ; $93fb - Unknown opcode
	.db $1b			  ; $93fc - Unknown opcode
	.db $1a			  ; $93fd - Unknown opcode
	ORA ($4a,X)			  ; $93fe: 01 4A   
	.db $7b			  ; $9400 - Unknown opcode
	.db $0b			  ; $9401 - Unknown opcode
	.db $47			  ; $9402 - Unknown opcode
	BVC $9444				; $9403: 50 3F   
	.db $07			  ; $9405 - Unknown opcode
	.db $1b			  ; $9406 - Unknown opcode
	.db $13			  ; $9407 - Unknown opcode
	.db $02			  ; $9408 - Unknown opcode
	LSR					  ; $9409: 4A	  
	.db $8f			  ; $940a - Unknown opcode
	.db $0b			  ; $940b - Unknown opcode
	.db $07			  ; $940c - Unknown opcode
	.db $1b			  ; $940d - Unknown opcode
	ORA $0702,X			  ; $940e: 1D 02 07
	.db $1b			  ; $9411 - Unknown opcode
	ORA ($ff),Y			  ; $9412: 11 FF   
	ASL $4a				  ; $9414: 06 4A   
	STX $d400				; $9416: 8E 00 D4
	LDA $0b3e				; $9419: AD 3E 0B
	LSR					  ; $941c: 4A	  
	STA $070b				; $941d: 8D 0B 07
	ORA ($7d),Y			  ; $9420: 11 7D   
	ORA ($b0,X)			  ; $9422: 01 B0   
	LDA $0a89				; $9424: AD 89 0A
	.db $0b			  ; $9427 - Unknown opcode
	.db $07			  ; $9428 - Unknown opcode
	.db $14			  ; $9429 - Unknown opcode
	ASL $4a				  ; $942a: 06 4A   
	STX ptr1_hi			  ; $942c: 86 07   
	ORA $4a				  ; $942e: 05 4A   
	.db $87			  ; $9430 - Unknown opcode
	.db $0b			  ; $9431 - Unknown opcode
	LSR					  ; $9432: 4A	  
	.db $87			  ; $9433 - Unknown opcode
	ROL $4a0b,X			  ; $9434: 3E 0B 4A
	DEY					  ; $9437: 88	  
	.db $3f			  ; $9438 - Unknown opcode
	.db $07			  ; $9439 - Unknown opcode
	.db $1b			  ; $943a - Unknown opcode
	.db $13			  ; $943b - Unknown opcode
	.db $02			  ; $943c - Unknown opcode
	LSR					  ; $943d: 4A	  
	BCC $944b				; $943e: 90 0B   
	EOR $c0				  ; $9440: 45 C0   
	.db $3f			  ; $9442 - Unknown opcode
	.db $07			  ; $9443 - Unknown opcode
loc_9444:
	.db $1b			  ; $9444 - Unknown opcode
	.db $13			  ; $9445 - Unknown opcode
	.db $02			  ; $9446 - Unknown opcode
	LSR					  ; $9447: 4A	  
	STA ($0b),Y			  ; $9448: 91 0B   
	EOR $c1				  ; $944a: 45 C1   
	.db $3f			  ; $944c - Unknown opcode
	.db $07			  ; $944d - Unknown opcode
	.db $83			  ; $944e - Unknown opcode
	BRK					  ; $944f: 00	  
	ORA ($ca,X)			  ; $9450: 01 CA   
	LDX $0a92				; $9452: AE 92 0A
	.db $0b			  ; $9455 - Unknown opcode
	ORA ($ca,X)			  ; $9456: 01 CA   
	LDX $0a93				; $9458: AE 93 0A
	.db $3f			  ; $945b - Unknown opcode
	LSR					  ; $945c: 4A	  
	.db $7c			  ; $945d - Unknown opcode
	.db $07			  ; $945e - Unknown opcode
	ORA $4a				  ; $945f: 05 4A   
	ADC $060b,X			  ; $9461: 7D 0B 06 ; Arithmetic
	LSR					  ; $9464: 4A	  
	ROR $f100,X			  ; $9465: 7E 00 F1
	LDA $3f3e				; $9468: AD 3E 3F
	.db $07			  ; $946b - Unknown opcode
	.db $1b			  ; $946c - Unknown opcode
	JSR $4a20				; $946d: 20 20 4A
	STX $0b,Y				; $9470: 96 0B   
	LSR					  ; $9472: 4A	  
	STY $3f,X				; $9473: 94 3F   
	.db $07			  ; $9475 - Unknown opcode
	.db $1b			  ; $9476 - Unknown opcode
	JSR $4a20				; $9477: 20 20 4A
	.db $97			  ; $947a - Unknown opcode
loc_947B:
	.db $0b			  ; $947b - Unknown opcode
	LSR					  ; $947c: 4A	  
	STA $3f,X				; $947d: 95 3F   
	ORA ($f6,X)			  ; $947f: 01 F6   
	LDA $0a98				; $9481: AD 98 0A
	.db $3f			  ; $9484 - Unknown opcode
	.db $07			  ; $9485 - Unknown opcode
	.db $1b			  ; $9486 - Unknown opcode
	ROL $20				  ; $9487: 26 20   
	.db $44			  ; $9489 - Unknown opcode
	.db $b2			  ; $948a - Unknown opcode
	.db $0b			  ; $948b - Unknown opcode
	ORA ($26,X)			  ; $948c: 01 26   
	LDX $0aa7				; $948e: AE A7 0A
	.db $3f			  ; $9491 - Unknown opcode
	.db $07			  ; $9492 - Unknown opcode
	.db $1b			  ; $9493 - Unknown opcode
	ROL $20				  ; $9494: 26 20   
	LSR					  ; $9496: 4A	  
	.db $dc			  ; $9497 - Unknown opcode
	.db $0b			  ; $9498 - Unknown opcode
	ASL tmp1				 ; $9499: 06 01   
	DEX					  ; $949b: CA	  
	LDX $0ab2				; $949c: AE B2 0A
	ORA ($ca,X)			  ; $949f: 01 CA   
	LDX $0ab3				; $94a1: AE B3 0A
	ROL $073f,X			  ; $94a4: 3E 3F 07
	.db $1b			  ; $94a7 - Unknown opcode
	ROL $20				  ; $94a8: 26 20   
	ORA ($bc,X)			  ; $94aa: 01 BC   
	LDX $0adb				; $94ac: AE DB 0A
	.db $0b			  ; $94af - Unknown opcode
	ORA ($ca,X)			  ; $94b0: 01 CA   
	LDX $0ab4				; $94b2: AE B4 0A
	.db $3f			  ; $94b5 - Unknown opcode
	.db $07			  ; $94b6 - Unknown opcode
	.db $1b			  ; $94b7 - Unknown opcode
	ROL $20				  ; $94b8: 26 20   
	LSR					  ; $94ba: 4A	  
	.db $d4			  ; $94bb - Unknown opcode
	.db $0b			  ; $94bc - Unknown opcode
	ORA ($ca,X)			  ; $94bd: 01 CA   
	LDX $0abe				; $94bf: AE BE 0A
	.db $3f			  ; $94c2 - Unknown opcode
	.db $07			  ; $94c3 - Unknown opcode
	.db $1b			  ; $94c4 - Unknown opcode
	ROL $20				  ; $94c5: 26 20   
	LSR					  ; $94c7: 4A	  
	CMP $010b,Y			  ; $94c8: D9 0B 01
	BNE $947b				; $94cb: D0 AE   
	LDX $0a,Y				; $94cd: B6 0A   
	.db $3f			  ; $94cf - Unknown opcode
	.db $07			  ; $94d0 - Unknown opcode
	.db $1b			  ; $94d1 - Unknown opcode
	ROL $20				  ; $94d2: 26 20   
	ORA ($ca,X)			  ; $94d4: 01 CA   
	LDX $0ad8				; $94d6: AE D8 0A
	.db $0b			  ; $94d9 - Unknown opcode
	ORA ($0f,X)			  ; $94da: 01 0F   
	.db $af			  ; $94dc - Unknown opcode
	.db $bf			  ; $94dd - Unknown opcode
	ASL					  ; $94de: 0A	  
	.db $3f			  ; $94df - Unknown opcode
	ORA ($24,X)			  ; $94e0: 01 24   
	.db $af			  ; $94e2 - Unknown opcode
	CPY #$0a				 ; $94e3: C0 0A   
	.db $3f			  ; $94e5 - Unknown opcode
	.db $07			  ; $94e6 - Unknown opcode
	.db $1b			  ; $94e7 - Unknown opcode
	ASL $0680				; $94e8: 0E 80 06
	LSR					  ; $94eb: 4A	  
	INY					  ; $94ec: C8	  
	BRK					  ; $94ed: 00	  
	ADC $af				  ; $94ee: 65 AF	; Arithmetic
	ROL $060b,X			  ; $94f0: 3E 0B 06
	LSR					  ; $94f3: 4A	  
	.db $c7			  ; $94f4 - Unknown opcode
	CLC					  ; $94f5: 18	  
	ASL $3e80				; $94f6: 0E 80 3E
	.db $3f			  ; $94f9 - Unknown opcode
	LSR					  ; $94fa: 4A	  
	CMP #$00				 ; $94fb: C9 00	; Compare with 0
	ADC #$af				 ; $94fd: 69 AF	; Arithmetic
	.db $3f			  ; $94ff - Unknown opcode
	LSR					  ; $9500: 4A	  
	DEX					  ; $9501: CA	  
	BRK					  ; $9502: 00	  
	ROR $3faf				; $9503: 6E AF 3F
	LSR					  ; $9506: 4A	  
	.db $cb			  ; $9507 - Unknown opcode
	ORA ($72,X)			  ; $9508: 01 72   
	.db $af			  ; $950a - Unknown opcode
	CPY $3f0a				; $950b: CC 0A 3F
	.db $07			  ; $950e - Unknown opcode
	.db $9b			  ; $950f - Unknown opcode
	ASL $0601				; $9510: 0E 01 06
	EOR $c7				  ; $9513: 45 C7   
	LSR					  ; $9515: 4A	  
	BVS $9518				; $9516: 70 00   
loc_9518:
	LDA $3eaf,X			  ; $9518: BD AF 3E
	LSR					  ; $951b: 4A	  
	ADC ($3f),Y			  ; $951c: 71 3F	; Arithmetic
	CLC					  ; $951e: 18	  
	ORA $4804,Y			  ; $951f: 19 04 48
	.db $fa			  ; $9522 - Unknown opcode
	.db $07			  ; $9523 - Unknown opcode
	ORA $48				  ; $9524: 05 48   
	.db $fb			  ; $9526 - Unknown opcode
	.db $0b			  ; $9527 - Unknown opcode
	PHA					  ; $9528: 48	  
	.db $fc			  ; $9529 - Unknown opcode
	.db $3f			  ; $952a - Unknown opcode
	.db $07			  ; $952b - Unknown opcode
	.db $1b			  ; $952c - Unknown opcode
	PHP					  ; $952d: 08	  
	.db $80			  ; $952e - Unknown opcode
	ASL $47				  ; $952f: 06 47   
	STX tmp0,Y			   ; $9531: 96 00   
	STY $3ea4				; $9533: 8C A4 3E
	.db $0b			  ; $9536 - Unknown opcode
	ASL $47				  ; $9537: 06 47   
	.db $97			  ; $9539 - Unknown opcode
	.db $07			  ; $953a - Unknown opcode
	.db $03			  ; $953b - Unknown opcode
	PHP					  ; $953c: 08	  
	.db $47			  ; $953d - Unknown opcode
	TYA					  ; $953e: 98	  
	ROL $073f,X			  ; $953f: 3E 3F 07
	.db $1b			  ; $9542 - Unknown opcode
	ROL $20				  ; $9543: 26 20   
	ORA ($bc,X)			  ; $9545: 01 BC   
	LDX $0acd				; $9547: AE CD 0A
	.db $0b			  ; $954a - Unknown opcode
	LSR					  ; $954b: 4A	  
	LDA ($3f,X)			  ; $954c: A1 3F   
	.db $07			  ; $954e - Unknown opcode
	.db $1b			  ; $954f - Unknown opcode
	ROL $20				  ; $9550: 26 20   
	LSR					  ; $9552: 4A	  
	DEC $060b				; $9553: CE 0B 06
	LSR					  ; $9556: 4A	  
	LDA current_bank		 ; $9557: AD 07 05
	LSR					  ; $955a: 4A	  
	LDX $4a0b				; $955b: AE 0B 4A
	.db $af			  ; $955e - Unknown opcode
	ROL $073f,X			  ; $955f: 3E 3F 07
	.db $1b			  ; $9562 - Unknown opcode
	ROL $20				  ; $9563: 26 20   
	LSR					  ; $9565: 4A	  
	.db $cf			  ; $9566 - Unknown opcode
	.db $0b			  ; $9567 - Unknown opcode
	ASL $4a				  ; $9568: 06 4A   
	LDA current_bank		 ; $956a: AD 07 05
	LSR					  ; $956d: 4A	  
	BCS $957b				; $956e: B0 0B   
	LSR					  ; $9570: 4A	  
	.db $af			  ; $9571 - Unknown opcode
	ROL $073f,X			  ; $9572: 3E 3F 07
	.db $1b			  ; $9575 - Unknown opcode
	ROL $20				  ; $9576: 26 20   
	LSR					  ; $9578: 4A	  
	BNE $9586				; $9579: D0 0B   
loc_957B:
	LSR					  ; $957b: 4A	  
	LDY $3f				  ; $957c: A4 3F   
	.db $07			  ; $957e - Unknown opcode
	.db $1b			  ; $957f - Unknown opcode
	ROL $20				  ; $9580: 26 20   
	LSR					  ; $9582: 4A	  
	CMP ($0b),Y			  ; $9583: D1 0B   
	LSR					  ; $9585: 4A	  
loc_9586:
	LDA $3f				  ; $9586: A5 3F   
	.db $07			  ; $9588 - Unknown opcode
	.db $1b			  ; $9589 - Unknown opcode
	ROL $20				  ; $958a: 26 20   
	LSR					  ; $958c: 4A	  
	.db $d2			  ; $958d - Unknown opcode
	.db $0b			  ; $958e - Unknown opcode
	LSR					  ; $958f: 4A	  
	LDX $3f				  ; $9590: A6 3F   
	.db $07			  ; $9592 - Unknown opcode
	.db $1b			  ; $9593 - Unknown opcode
	ROL $20				  ; $9594: 26 20   
	LSR					  ; $9596: 4A	  
	.db $d3			  ; $9597 - Unknown opcode
	.db $0b			  ; $9598 - Unknown opcode
	.db $12			  ; $9599 - Unknown opcode
	ORA $3f				  ; $959a: 05 3F   
	.db $07			  ; $959c - Unknown opcode
	.db $1b			  ; $959d - Unknown opcode
	ROL $20				  ; $959e: 26 20   
	LSR					  ; $95a0: 4A	  
	CMP $0b,X				; $95a1: D5 0B   
	LSR					  ; $95a3: 4A	  
	LDY $073f,X			  ; $95a4: BC 3F 07
	.db $1b			  ; $95a7 - Unknown opcode
	ROL $20				  ; $95a8: 26 20   
	LSR					  ; $95aa: 4A	  
	DEC $0b,X				; $95ab: D6 0B   
	.db $47			  ; $95ad - Unknown opcode
	.db $7c			  ; $95ae - Unknown opcode
	.db $3f			  ; $95af - Unknown opcode
	.db $07			  ; $95b0 - Unknown opcode
	.db $1b			  ; $95b1 - Unknown opcode
	ROL $20				  ; $95b2: 26 20   
	LSR					  ; $95b4: 4A	  
	.db $d7			  ; $95b5 - Unknown opcode
	.db $0b			  ; $95b6 - Unknown opcode
	LSR					  ; $95b7: 4A	  
	LDA $073f,X			  ; $95b8: BD 3F 07
	.db $1b			  ; $95bb - Unknown opcode
	ROL $20				  ; $95bc: 26 20   
	LSR					  ; $95be: 4A	  
	.db $da			  ; $95bf - Unknown opcode
	.db $0b			  ; $95c0 - Unknown opcode
	LSR					  ; $95c1: 4A	  
	LDA $3f,X				; $95c2: B5 3F   
	.db $07			  ; $95c4 - Unknown opcode
	.db $1b			  ; $95c5 - Unknown opcode
	ROL $20				  ; $95c6: 26 20   
	ORA ($bc,X)			  ; $95c8: 01 BC   
	LDX $0acd				; $95ca: AE CD 0A
	.db $0b			  ; $95cd - Unknown opcode
	LSR					  ; $95ce: 4A	  
	LDA ($3f),Y			  ; $95cf: B1 3F   
	.db $07			  ; $95d1 - Unknown opcode
	.db $1b			  ; $95d2 - Unknown opcode
	ROL $20				  ; $95d3: 26 20   
	LSR					  ; $95d5: 4A	  
	.db $df			  ; $95d6 - Unknown opcode
	.db $0b			  ; $95d7 - Unknown opcode
	LSR					  ; $95d8: 4A	  
	LDX #$3f				 ; $95d9: A2 3F   
	.db $07			  ; $95db - Unknown opcode
	.db $1b			  ; $95dc - Unknown opcode
	ROL $20				  ; $95dd: 26 20   
	LSR					  ; $95df: 4A	  
	CPX #$0b				 ; $95e0: E0 0B   
	LSR					  ; $95e2: 4A	  
	.db $9f			  ; $95e3 - Unknown opcode
	.db $3f			  ; $95e4 - Unknown opcode
	.db $07			  ; $95e5 - Unknown opcode
	.db $1b			  ; $95e6 - Unknown opcode
	ROL $20				  ; $95e7: 26 20   
	LSR					  ; $95e9: 4A	  
	.db $e2			  ; $95ea - Unknown opcode
	.db $0b			  ; $95eb - Unknown opcode
	LSR					  ; $95ec: 4A	  
	LDY #$3f				 ; $95ed: A0 3F   
	.db $07			  ; $95ef - Unknown opcode
	.db $1b			  ; $95f0 - Unknown opcode
	ROL $20				  ; $95f1: 26 20   
	LSR					  ; $95f3: 4A	  
	CMP $4a0b,X			  ; $95f4: DD 0B 4A
	LDY $073f				; $95f7: AC 3F 07
	.db $1b			  ; $95fa - Unknown opcode
	ROL $20				  ; $95fb: 26 20   
	LSR					  ; $95fd: 4A	  
	DEC $4a0b,X			  ; $95fe: DE 0B 4A
	.db $a3			  ; $9601 - Unknown opcode
	.db $3f			  ; $9602 - Unknown opcode
	BRK					  ; $9603: 00	  
	TXS					  ; $9604: 9A	  
	LDA #$3f				 ; $9605: A9 3F   
	.db $07			  ; $9607 - Unknown opcode
	ASL ptr0_hi,X			; $9608: 16 05   
	EOR $c3				  ; $960a: 45 C3   
	.db $0b			  ; $960c - Unknown opcode
	EOR $d7				  ; $960d: 45 D7   
	.db $3f			  ; $960f - Unknown opcode
	.db $07			  ; $9610 - Unknown opcode
	.db $1b			  ; $9611 - Unknown opcode
	ORA $4a01,X			  ; $9612: 1D 01 4A
	.db $7f			  ; $9615 - Unknown opcode
	.db $0b			  ; $9616 - Unknown opcode
	LSR					  ; $9617: 4A	  
	ADC $073f				; $9618: 6D 3F 07 ; Arithmetic
	.db $1b			  ; $961b - Unknown opcode
	ORA $4a01,X			  ; $961c: 1D 01 4A
	.db $80			  ; $961f - Unknown opcode
	.db $0b			  ; $9620 - Unknown opcode
	.db $47			  ; $9621 - Unknown opcode
	.db $44			  ; $9622 - Unknown opcode
	.db $3f			  ; $9623 - Unknown opcode
	.db $07			  ; $9624 - Unknown opcode
	.db $1b			  ; $9625 - Unknown opcode
	ORA $4a01,X			  ; $9626: 1D 01 4A
	STA ($0b,X)			  ; $9629: 81 0B   
	LSR					  ; $962b: 4A	  
	.db $6f			  ; $962c - Unknown opcode
	.db $3f			  ; $962d - Unknown opcode
	.db $07			  ; $962e - Unknown opcode
	.db $1b			  ; $962f - Unknown opcode
	PHP					  ; $9630: 08	  
	.db $80			  ; $9631 - Unknown opcode
	ASL $45				  ; $9632: 06 45   
	.db $c7			  ; $9634 - Unknown opcode
	.db $47			  ; $9635 - Unknown opcode
	STA $0b3e,Y			  ; $9636: 99 3E 0B
	.db $47			  ; $9639 - Unknown opcode
	TXS					  ; $963a: 9A	  
	.db $47			  ; $963b - Unknown opcode
	.db $9b			  ; $963c - Unknown opcode
	.db $3f			  ; $963d - Unknown opcode
	BRK					  ; $963e: 00	  
	.db $17			  ; $963f - Unknown opcode
	BCS $9681				; $9640: B0 3F   
	.db $34			  ; $9642 - Unknown opcode
	.db $80			  ; $9643 - Unknown opcode
	.db $37			  ; $9644 - Unknown opcode
	.db $80			  ; $9645 - Unknown opcode
	.db $3a			  ; $9646 - Unknown opcode
	.db $80			  ; $9647 - Unknown opcode
	AND $5880,X			  ; $9648: 3D 80 58
	.db $80			  ; $964b - Unknown opcode
	.db $72			  ; $964c - Unknown opcode
	.db $80			  ; $964d - Unknown opcode
	.db $82			  ; $964e - Unknown opcode
	.db $80			  ; $964f - Unknown opcode
	STA $a080				; $9650: 8D 80 A0
	.db $80			  ; $9653 - Unknown opcode
	LDX $d680,Y			  ; $9654: BE 80 D6
	.db $80			  ; $9657 - Unknown opcode
	CPX $80				  ; $9658: E4 80   
	NOP					  ; $965a: EA	  
	.db $80			  ; $965b - Unknown opcode
	INC $1180,X			  ; $965c: FE 80 11
	STA ($25,X)			  ; $965f: 81 25   
	STA ($2b,X)			  ; $9661: 81 2B   
	STA ($2e,X)			  ; $9663: 81 2E   
	STA ($31,X)			  ; $9665: 81 31   
	STA ($3b,X)			  ; $9667: 81 3B   
	STA ($7e,X)			  ; $9669: 81 7E   
	STA ($8d,X)			  ; $966b: 81 8D   
	STA ($a5,X)			  ; $966d: 81 A5   
	STA ($ae,X)			  ; $966f: 81 AE   
	STA ($ca,X)			  ; $9671: 81 CA   
	STA ($d0,X)			  ; $9673: 81 D0   
	STA ($d9,X)			  ; $9675: 81 D9   
	STA ($0e,X)			  ; $9677: 81 0E   
	.db $82			  ; $9679 - Unknown opcode
	AND $4382,X			  ; $967a: 3D 82 43
	.db $82			  ; $967d - Unknown opcode
	JMP $5682				; $967e: 4C 82 56
loc_9681:
	.db $82			  ; $9681 - Unknown opcode
	RTS					  ; $9682: 60	  
	.db $82			  ; $9683 - Unknown opcode
	.db $87			  ; $9684 - Unknown opcode
	.db $82			  ; $9685 - Unknown opcode
	STA $b782				; $9686: 8D 82 B7
	.db $82			  ; $9689 - Unknown opcode
	CMP ($82,X)			  ; $968a: C1 82   
	.db $cb			  ; $968c - Unknown opcode
	.db $82			  ; $968d - Unknown opcode
	.db $da			  ; $968e - Unknown opcode
	.db $82			  ; $968f - Unknown opcode
	.db $e3			  ; $9690 - Unknown opcode
	.db $82			  ; $9691 - Unknown opcode
	SBC ($82),Y			  ; $9692: F1 82	; Arithmetic
	.db $02			  ; $9694 - Unknown opcode
	.db $83			  ; $9695 - Unknown opcode
	.db $0c			  ; $9696 - Unknown opcode
	.db $83			  ; $9697 - Unknown opcode
	ASL $83,X				; $9698: 16 83   
	JSR $2f83				; $969a: 20 83 2F
	.db $83			  ; $969d - Unknown opcode
	AND $3f83,Y			  ; $969e: 39 83 3F
	.db $83			  ; $96a1 - Unknown opcode
	.db $5a			  ; $96a2 - Unknown opcode
	.db $83			  ; $96a3 - Unknown opcode
	ADC ($83),Y			  ; $96a4: 71 83	; Arithmetic
	.db $7f			  ; $96a6 - Unknown opcode
	.db $83			  ; $96a7 - Unknown opcode
	.db $93			  ; $96a8 - Unknown opcode
	.db $83			  ; $96a9 - Unknown opcode
	LDY $83				  ; $96aa: A4 83   
	LDX $b783				; $96ac: AE 83 B7
	.db $83			  ; $96af - Unknown opcode
	CPY #$83				 ; $96b0: C0 83   
	CMP $f583,Y			  ; $96b2: D9 83 F5
	.db $83			  ; $96b5 - Unknown opcode
	INC $0783,X			  ; $96b6: FE 83 07
	STY $11				  ; $96b9: 84 11   
	STY $2c				  ; $96bb: 84 2C   
	STY $36				  ; $96bd: 84 36   
	STY $53				  ; $96bf: 84 53   
	STY $57				  ; $96c1: 84 57   
	STY $5b				  ; $96c3: 84 5B   
	STY $5f				  ; $96c5: 84 5F   
	STY $6a				  ; $96c7: 84 6A   
	STY $6d				  ; $96c9: 84 6D   
	STY $76				  ; $96cb: 84 76   
	STY $b6				  ; $96cd: 84 B6   
	STY $e8				  ; $96cf: 84 E8   
	STY ptr1_hi			  ; $96d1: 84 07   
	STA $16				  ; $96d3: 85 16   
	STA $25				  ; $96d5: 85 25   
	STA $43				  ; $96d7: 85 43   
	STA $5d				  ; $96d9: 85 5D   
	STA $66				  ; $96db: 85 66   
	STA $95				  ; $96dd: 85 95   
	STA $de				  ; $96df: 85 DE   
	STA $f8				  ; $96e1: 85 F8   
	STA $0d				  ; $96e3: 85 0D   
	STX $57				  ; $96e5: 86 57   
	STX $61				  ; $96e7: 86 61   
	STX $82				  ; $96e9: 86 82   
	STX $99				  ; $96eb: 86 99   
	STX $b4				  ; $96ed: 86 B4   
	STX $bd				  ; $96ef: 86 BD   
	STX $e1				  ; $96f1: 86 E1   
	STX $f1				  ; $96f3: 86 F1   
	STX $fd				  ; $96f5: 86 FD   
	STX $2e				  ; $96f7: 86 2E   
	.db $87			  ; $96f9 - Unknown opcode
	LSR $87				  ; $96fa: 46 87   
	.db $4f			  ; $96fc - Unknown opcode
	.db $87			  ; $96fd - Unknown opcode
	.db $5f			  ; $96fe - Unknown opcode
loc_96FF:
	.db $87			  ; $96ff - Unknown opcode
	ROR					  ; $9700: 6A	  
	.db $87			  ; $9701 - Unknown opcode
	SEI					  ; $9702: 78	  
	.db $87			  ; $9703 - Unknown opcode
	DEY					  ; $9704: 88	  
	.db $87			  ; $9705 - Unknown opcode
	TYA					  ; $9706: 98	  
	.db $87			  ; $9707 - Unknown opcode
	LDA ($87,X)			  ; $9708: A1 87   
	TAX					  ; $970a: AA	  
	.db $87			  ; $970b - Unknown opcode
	CPY #$87				 ; $970c: C0 87   
	SBC $f987				; $970e: ED 87 F9 ; Arithmetic
	.db $87			  ; $9711 - Unknown opcode
loc_9712:
	.db $02			  ; $9712 - Unknown opcode
	DEY					  ; $9713: 88	  
	.db $0b			  ; $9714 - Unknown opcode
	DEY					  ; $9715: 88	  
	ORA $88,X				; $9716: 15 88   
	.db $22			  ; $9718 - Unknown opcode
	DEY					  ; $9719: 88	  
	.db $5b			  ; $971a - Unknown opcode
	DEY					  ; $971b: 88	  
	JMP ($7488)			  ; $971c: 6C 88 74
	DEY					  ; $971f: 88	  
	CMP $fd88,X			  ; $9720: DD 88 FD
	DEY					  ; $9723: 88	  
	.db $13			  ; $9724 - Unknown opcode
	.db $89			  ; $9725 - Unknown opcode
	.db $1c			  ; $9726 - Unknown opcode
	.db $89			  ; $9727 - Unknown opcode
	.db $3b			  ; $9728 - Unknown opcode
	.db $89			  ; $9729 - Unknown opcode
	ROR					  ; $972a: 6A	  
	.db $89			  ; $972b - Unknown opcode
	.db $7b			  ; $972c - Unknown opcode
	.db $89			  ; $972d - Unknown opcode
	.db $8b			  ; $972e - Unknown opcode
	.db $89			  ; $972f - Unknown opcode
	.db $a3			  ; $9730 - Unknown opcode
	.db $89			  ; $9731 - Unknown opcode
	LDA #$89				 ; $9732: A9 89   
	CPY #$89				 ; $9734: C0 89   
	INY					  ; $9736: C8	  
	.db $89			  ; $9737 - Unknown opcode
	DEC $d189				; $9738: CE 89 D1
	.db $89			  ; $973b - Unknown opcode
	.db $e3			  ; $973c - Unknown opcode
	.db $89			  ; $973d - Unknown opcode
	SED					  ; $973e: F8	  
	.db $89			  ; $973f - Unknown opcode
	BPL $96cc				; $9740: 10 8A   
	.db $1a			  ; $9742 - Unknown opcode
	TXA					  ; $9743: 8A	  
	.db $3c			  ; $9744 - Unknown opcode
	TXA					  ; $9745: 8A	  
	ROR $8a				  ; $9746: 66 8A   
	BVS $96d4				; $9748: 70 8A   
	.db $7a			  ; $974a - Unknown opcode
	TXA					  ; $974b: 8A	  
	.db $9c			  ; $974c - Unknown opcode
	TXA					  ; $974d: 8A	  
	LDX $8a				  ; $974e: A6 8A   
	BCS $96dc				; $9750: B0 8A   
	CMP $8a				  ; $9752: C5 8A   
	CPX #$8a				 ; $9754: E0 8A   
	INX					  ; $9756: E8	  
	TXA					  ; $9757: 8A	  
	BEQ $96e4				; $9758: F0 8A   
	SBC $038a,Y			  ; $975a: F9 8A 03 ; Arithmetic
	.db $8b			  ; $975d - Unknown opcode
	ORA $178b				; $975e: 0D 8B 17
	.db $8b			  ; $9761 - Unknown opcode
	JSR $3d8b				; $9762: 20 8B 3D
	.db $8b			  ; $9765 - Unknown opcode
	JMP $568b				; $9766: 4C 8B 56
	.db $8b			  ; $9769 - Unknown opcode
	.db $5c			  ; $976a - Unknown opcode
	.db $8b			  ; $976b - Unknown opcode
	.db $62			  ; $976c - Unknown opcode
	.db $8b			  ; $976d - Unknown opcode
	ROR $8b				  ; $976e: 66 8B   
	DEY					  ; $9770: 88	  
	.db $8b			  ; $9771 - Unknown opcode
	BCC $96ff				; $9772: 90 8B   
	TXS					  ; $9774: 9A	  
	.db $8b			  ; $9775 - Unknown opcode
	LDY $8b				  ; $9776: A4 8B   
	.db $c2			  ; $9778 - Unknown opcode
	.db $8b			  ; $9779 - Unknown opcode
	.db $cf			  ; $977a - Unknown opcode
	.db $8b			  ; $977b - Unknown opcode
	CLD					  ; $977c: D8	  
	.db $8b			  ; $977d - Unknown opcode
	SBC #$8b				 ; $977e: E9 8B	; Arithmetic
	.db $f3			  ; $9780 - Unknown opcode
	.db $8b			  ; $9781 - Unknown opcode
	ASL $8c				  ; $9782: 06 8C   
	BPL $9712				; $9784: 10 8C   
	.db $1a			  ; $9786 - Unknown opcode
	STY $8c24				; $9787: 8C 24 8C
	ROL $408c				; $978a: 2E 8C 40
	STY $8c4a				; $978d: 8C 4A 8C
	.db $57			  ; $9790 - Unknown opcode
	STY $8c73				; $9791: 8C 73 8C
	ADC $8a8c,X			  ; $9794: 7D 8C 8A ; Arithmetic
	STY $8cb3				; $9797: 8C B3 8C
	LDY $c88c,X			  ; $979a: BC 8C C8
	STY $8cd2				; $979d: 8C D2 8C
	INX					  ; $97a0: E8	  
	STY $8cf2				; $97a1: 8C F2 8C
loc_97A4:
	.db $fc			  ; $97a4 - Unknown opcode
	STY $8d10				; $97a5: 8C 10 8D
	CLC					  ; $97a8: 18	  
	STA $8d26				; $97a9: 8D 26 8D
	SEC					  ; $97ac: 38	  
	STA $8d47				; $97ad: 8D 47 8D
loc_97B0:
	.db $57			  ; $97b0 - Unknown opcode
	STA $8d6b				; $97b1: 8D 6B 8D
	.db $7f			  ; $97b4 - Unknown opcode
	STA $8d89				; $97b5: 8D 89 8D
loc_97B8:
	TYA					  ; $97b8: 98	  
	STA $8db4				; $97b9: 8D B4 8D
	LDA $c68d,X			  ; $97bc: BD 8D C6
	STA $8dd6				; $97bf: 8D D6 8D
	SBC #$8d				 ; $97c2: E9 8D	; Arithmetic
loc_97C4:
	.db $ef			  ; $97c4 - Unknown opcode
	STA $8dff				; $97c5: 8D FF 8D
	.db $1c			  ; $97c8 - Unknown opcode
	STX $8e22				; $97c9: 8E 22 8E
	ROL					  ; $97cc: 2A	  
	STX $8e33				; $97cd: 8E 33 8E
loc_97D0:
	.db $3c			  ; $97d0 - Unknown opcode
	STX $8e45				; $97d1: 8E 45 8E
	LSR $618e				; $97d4: 4E 8E 61
	STX $8e6a				; $97d7: 8E 6A 8E
	.db $73			  ; $97da - Unknown opcode
loc_97DB:
	STX $8e84				; $97db: 8E 84 8E
	STA $ad8e				; $97de: 8D 8E AD
	STX $8eb6				; $97e1: 8E B6 8E
	.db $bf			  ; $97e4 - Unknown opcode
	STX $8ec8				; $97e5: 8E C8 8E
	CMP $e38e,X			  ; $97e8: DD 8E E3
loc_97EB:
	STX $8eec				; $97eb: 8E EC 8E
	ORA $8f,X				; $97ee: 15 8F   
	JSR $338f				; $97f0: 20 8F 33
	.db $8f			  ; $97f3 - Unknown opcode
	AND $4d8f,Y			  ; $97f4: 39 8F 4D
	.db $8f			  ; $97f7 - Unknown opcode
	LSR $8f,X				; $97f8: 56 8F   
	ADC #$8f				 ; $97fa: 69 8F	; Arithmetic
	.db $7c			  ; $97fc - Unknown opcode
	.db $8f			  ; $97fd - Unknown opcode
	TXA					  ; $97fe: 8A	  
	.db $8f			  ; $97ff - Unknown opcode
	STA $b78f,X			  ; $9800: 9D 8F B7
	.db $8f			  ; $9803 - Unknown opcode
	.db $c7			  ; $9804 - Unknown opcode
	.db $8f			  ; $9805 - Unknown opcode
	DEC $8f,X				; $9806: D6 8F   
	SBC $fb8f				; $9808: ED 8F FB ; Arithmetic
	.db $8f			  ; $980b - Unknown opcode
	ASL $1990				; $980c: 0E 90 19
loc_980F:
	BCC $9833				; $980f: 90 22   
	BCC $983d				; $9811: 90 2A   
	BCC $9848				; $9813: 90 33   
	BCC $9858				; $9815: 90 41   
	BCC $9868				; $9817: 90 4F   
	BCC $9878				; $9819: 90 5D   
	BCC $988b				; $981b: 90 6E   
	BCC $989c				; $981d: 90 7D   
	BCC $97a4				; $981f: 90 83   
	BCC $97b0				; $9821: 90 8D   
	BCC $97b8				; $9823: 90 93   
	BCC $97c4				; $9825: 90 9D   
	BCC $97d0				; $9827: 90 A7   
	BCC $97db				; $9829: 90 B0   
	BCC $97eb				; $982b: 90 BE   
loc_982D:
	BCC $97f6				; $982d: 90 C7   
	BCC $980f				; $982f: 90 DE   
	BCC $982d				; $9831: 90 FA   
loc_9833:
	BCC $9842				; $9833: 90 0D   
	STA ($16),Y			  ; $9835: 91 16   
	STA (system_flags),Y	 ; $9837: 91 1F   
	STA ($28),Y			  ; $9839: 91 28   
	STA ($34),Y			  ; $983b: 91 34   
loc_983D:
	STA ($51),Y			  ; $983d: 91 51   
	STA (map_number),Y	   ; $983f: 91 63   
	STA ($87),Y			  ; $9841: 91 87   
	STA ($97),Y			  ; $9843: 91 97   
	STA ($a7),Y			  ; $9845: 91 A7   
	STA ($b7),Y			  ; $9847: 91 B7   
	STA ($c7),Y			  ; $9849: 91 C7   
	STA ($d5),Y			  ; $984b: 91 D5   
	STA ($e3),Y			  ; $984d: 91 E3   
	STA ($fe),Y			  ; $984f: 91 FE   
	STA (ptr1_hi),Y		  ; $9851: 91 07   
	.db $92			  ; $9853 - Unknown opcode
	ORA $92,X				; $9854: 15 92   
	PLP					  ; $9856: 28	  
	.db $92			  ; $9857 - Unknown opcode
loc_9858:
	AND ($92),Y			  ; $9858: 31 92   
	.db $44			  ; $985a - Unknown opcode
	.db $92			  ; $985b - Unknown opcode
	EOR $5692				; $985c: 4D 92 56
	.db $92			  ; $985f - Unknown opcode
	.db $64			  ; $9860 - Unknown opcode
	.db $92			  ; $9861 - Unknown opcode
	.db $72			  ; $9862 - Unknown opcode
	.db $92			  ; $9863 - Unknown opcode
	.db $7a			  ; $9864 - Unknown opcode
	.db $92			  ; $9865 - Unknown opcode
	.db $83			  ; $9866 - Unknown opcode
	.db $92			  ; $9867 - Unknown opcode
loc_9868:
	STY $9b92				; $9868: 8C 92 9B
	.db $92			  ; $986b - Unknown opcode
	TAX					  ; $986c: AA	  
	.db $92			  ; $986d - Unknown opcode
	CLV					  ; $986e: B8	  
	.db $92			  ; $986f - Unknown opcode
	DEX					  ; $9870: CA	  
	.db $92			  ; $9871 - Unknown opcode
	.db $d3			  ; $9872 - Unknown opcode
	.db $92			  ; $9873 - Unknown opcode
	.db $e2			  ; $9874 - Unknown opcode
	.db $92			  ; $9875 - Unknown opcode
	.db $eb			  ; $9876 - Unknown opcode
	.db $92			  ; $9877 - Unknown opcode
loc_9878:
	.db $f4			  ; $9878 - Unknown opcode
	.db $92			  ; $9879 - Unknown opcode
	.db $fa			  ; $987a - Unknown opcode
	.db $92			  ; $987b - Unknown opcode
	ORA #$93				 ; $987c: 09 93   
	BIT $93				  ; $987e: 24 93   
	AND $93,X				; $9880: 35 93   
	LSR $93				  ; $9882: 46 93   
	ADC ($93,X)			  ; $9884: 61 93	; Arithmetic
	.db $73			  ; $9886 - Unknown opcode
	.db $93			  ; $9887 - Unknown opcode
	.db $83			  ; $9888 - Unknown opcode
	.db $93			  ; $9889 - Unknown opcode
	TXS					  ; $988a: 9A	  
loc_988B:
	.db $93			  ; $988b - Unknown opcode
	LDY $93				  ; $988c: A4 93   
	TAX					  ; $988e: AA	  
	.db $93			  ; $988f - Unknown opcode
	LDX $c193				; $9890: AE 93 C1
	.db $93			  ; $9893 - Unknown opcode
	CMP $ea93,Y			  ; $9894: D9 93 EA
	.db $93			  ; $9897 - Unknown opcode
	.db $f4			  ; $9898 - Unknown opcode
	.db $93			  ; $9899 - Unknown opcode
	ORA $94				  ; $989a: 05 94   
loc_989C:
	AND $4394,Y			  ; $989c: 39 94 43
	STY $4d,X				; $989f: 94 4D   
	STY $5c,X				; $98a1: 94 5C   
	STY $6b,X				; $98a3: 94 6B   
	STY $75,X				; $98a5: 94 75   
	STY $7f,X				; $98a7: 94 7F   
	STY $85,X				; $98a9: 94 85   
	STY $92,X				; $98ab: 94 92   
	STY $a6,X				; $98ad: 94 A6   
	STY $b6,X				; $98af: 94 B6   
	STY $c3,X				; $98b1: 94 C3   
	STY $d0,X				; $98b3: 94 D0   
	STY $e0,X				; $98b5: 94 E0   
	STY $e6,X				; $98b7: 94 E6   
	STY $fa,X				; $98b9: 94 FA   
	STY tmp0,X			   ; $98bb: 94 00   
	STA ptr1_lo,X			; $98bd: 95 06   
	STA $0e,X				; $98bf: 95 0E   
	STA $1e,X				; $98c1: 95 1E   
	STA $2b,X				; $98c3: 95 2B   
	STA $41,X				; $98c5: 95 41   
	STA $4e,X				; $98c7: 95 4E   
	STA $61,X				; $98c9: 95 61   
	STA $74,X				; $98cb: 95 74   
	STA $7e,X				; $98cd: 95 7E   
	STA $88,X				; $98cf: 95 88   
	STA $92,X				; $98d1: 95 92   
	STA $9c,X				; $98d3: 95 9C   
	STA $a6,X				; $98d5: 95 A6   
	STA $b0,X				; $98d7: 95 B0   
	STA $ba,X				; $98d9: 95 BA   
	STA $c4,X				; $98db: 95 C4   
	STA $d1,X				; $98dd: 95 D1   
	STA $db,X				; $98df: 95 DB   
	STA $e5,X				; $98e1: 95 E5   
	STA $ef,X				; $98e3: 95 EF   
	STA $f9,X				; $98e5: 95 F9   
	STA tmp3,X			   ; $98e7: 95 03   
	STX ptr1_hi,Y			; $98e9: 96 07   
	STX $10,Y				; $98eb: 96 10   
	STX $1a,Y				; $98ed: 96 1A   
	STX $24,Y				; $98ef: 96 24   
	STX $2e,Y				; $98f1: 96 2E   
	STX $3e,Y				; $98f3: 96 3E   
	STX $42,Y				; $98f5: 96 42   
	STX $20,Y				; $98f7: 96 20   
	AND $99				  ; $98f9: 25 99   
	LDA $e7				  ; $98fb: A5 E7   
	CMP #$01				 ; $98fd: C9 01	; Compare with 1
	BEQ $9910				; $98ff: F0 0F   
	BIT $e7				  ; $9901: 24 E7   
	BMI $990b				; $9903: 30 06   
	JSR $c8cc				; $9905: 20 CC C8 ; Call to fixed bank
	JMP $d1f3				; $9908: 4C F3 D1
loc_990B:
	BVS $9913				; $990b: 70 06   
loc_990D:
	JSR $d218				; $990d: 20 18 D2 ; Call to fixed bank
loc_9910:
	JMP $d1f3				; $9910: 4C F3 D1
loc_9913:
	RTS					  ; $9913: 60	  

; ---- Subroutine at $9914 (Bank 21) ----
sub_9914:
	INX					  ; $9914: E8	  
	INX					  ; $9915: E8	  
	INX					  ; $9916: E8	  
	INX					  ; $9917: E8	  
	INX					  ; $9918: E8	  

; ---- Subroutine at $9919 (Bank 21) ----
sub_9919:
	STA tmp0				 ; $9919: 85 00   
	TYA					  ; $991b: 98	  
	PHA					  ; $991c: 48	  
	LDA tmp0				 ; $991d: A5 00   
	BRK					  ; $991f: 00	  
	.db $04			  ; $9920 - Unknown opcode
	.db $6f			  ; $9921 - Unknown opcode
	PLA					  ; $9922: 68	  
	TAY					  ; $9923: A8	  
	RTS					  ; $9924: 60	  
	LDX #$00				 ; $9925: A2 00   
	STX $e7				  ; $9927: 86 E7   
	STX $fd				  ; $9929: 86 FD   
	STX $fe				  ; $992b: 86 FE   
	STX $ff				  ; $992d: 86 FF   
	STY $e9				  ; $992f: 84 E9   
	STA $e8				  ; $9931: 85 E8   
	SEC					  ; $9933: 38	  
	SBC #$06				 ; $9934: E9 06	; Arithmetic
	BRK					  ; $9936: 00	  
	ORA ($cf,X)			  ; $9937: 01 CF   
	JSR $b0bb				; $9939: 20 BB B0 ; -> sub_B0BB
	JSR $9956				; $993c: 20 56 99 ; -> sub_9956
	JSR $b0e6				; $993f: 20 E6 B0 ; -> sub_B0E6
	JSR $9962				; $9942: 20 62 99 ; -> sub_9962
	LDA tmp0				 ; $9945: A5 00   
	SEC					  ; $9947: 38	  
	SBC #$61				 ; $9948: E9 61	; Arithmetic
	STA tmp0				 ; $994a: 85 00   
	LDA tmp1				 ; $994c: A5 01   
	SBC #$01				 ; $994e: E9 01	; Arithmetic
	TAX					  ; $9950: AA	  
	LDA tmp0				 ; $9951: A5 00   
	JMP $9914				; $9953: 4C 14 99

; ---- Subroutine at $9956 (Bank 21) ----
sub_9956:
	PHA					  ; $9956: 48	  
	BRK					  ; $9957: 00	  
	LSR $ef				  ; $9958: 46 EF   
	STA $f9				  ; $995a: 85 F9   
	STA $fa				  ; $995c: 85 FA   
	STA $fb				  ; $995e: 85 FB   
	PLA					  ; $9960: 68	  
	RTS					  ; $9961: 60	  

; ---- Subroutine at $9962 (Bank 21) ----
sub_9962:
	LDA tmp1				 ; $9962: A5 01   
	BNE $9972				; $9964: D0 0C   
	LDA tmp0				 ; $9966: A5 00   
	CMP #$07				 ; $9968: C9 07	; Compare with 7
	BCS $9972				; $996a: B0 06   
	JSR $9cbf				; $996c: 20 BF 9C ; -> sub_9CBF
	PLA					  ; $996f: 68	  
	PLA					  ; $9970: 68	  
	RTS					  ; $9971: 60	  
loc_9972:
	JSR $b7fb				; $9972: 20 FB B7 ; -> sub_B7FB
	LDA tmp0				 ; $9975: A5 00   
	CMP #$61				 ; $9977: C9 61	; Compare with 97
	LDA tmp1				 ; $9979: A5 01   
	SBC #$01				 ; $997b: E9 01	; Arithmetic
	BCS $9984				; $997d: B0 05   
	PLA					  ; $997f: 68	  
	PLA					  ; $9980: 68	  
	JMP $999e				; $9981: 4C 9E 99
loc_9984:
	LDA tmp0				 ; $9984: A5 00   
	CMP #$61				 ; $9986: C9 61	; Compare with 97
	LDA tmp1				 ; $9988: A5 01   
	SBC #$01				 ; $998a: E9 01	; Arithmetic
	BCC $999d				; $998c: 90 0F   
	LDA tmp0				 ; $998e: A5 00   
	CMP #$79				 ; $9990: C9 79	; Compare with 121
	LDA tmp1				 ; $9992: A5 01   
	SBC #$01				 ; $9994: E9 01	; Arithmetic
	BPL $999d				; $9996: 10 05   
	JSR $9c92				; $9998: 20 92 9C ; -> sub_9C92
	PLA					  ; $999b: 68	  
	PLA					  ; $999c: 68	  
loc_999D:
	RTS					  ; $999d: 60	  
loc_999E:
	LDA tmp0				 ; $999e: A5 00   
	SEC					  ; $99a0: 38	  
	SBC #$07				 ; $99a1: E9 07	; Arithmetic
	STA tmp0				 ; $99a3: 85 00   
	BCS $99a9				; $99a5: B0 02   
	DEC tmp1				 ; $99a7: C6 01   
loc_99A9:
	ASL tmp0				 ; $99a9: 06 00   
	ROL tmp1				 ; $99ab: 26 01   
	LDA tmp0				 ; $99ad: A5 00   
	CLC					  ; $99af: 18	  
	ADC $98f6				; $99b0: 6D F6 98 ; Arithmetic
	STA tmp0				 ; $99b3: 85 00   
	LDA tmp1				 ; $99b5: A5 01   
	ADC $98f7				; $99b7: 6D F7 98 ; Arithmetic
	STA tmp1				 ; $99ba: 85 01   
	LDY #$01				 ; $99bc: A0 01   
	LDA (tmp0),Y			 ; $99be: B1 00   
	STA $db				  ; $99c0: 85 DB   
	DEY					  ; $99c2: 88	  
	LDA (tmp0),Y			 ; $99c3: B1 00   
	STA $da				  ; $99c5: 85 DA   
	LDA #$ff				 ; $99c7: A9 FF   
	STA $dc				  ; $99c9: 85 DC   
	JMP $9ba8				; $99cb: 4C A8 9B

; ---- Subroutine at $99ce (Bank 21) ----
sub_99CE:
	LDA ($da),Y			  ; $99ce: B1 DA   
	BMI $99d6				; $99d0: 30 04   
	LDX #$00				 ; $99d2: A2 00   
	BEQ $99d8				; $99d4: F0 02   
loc_99D6:
	LDX #$ff				 ; $99d6: A2 FF   
loc_99D8:
	STX $dc				  ; $99d8: 86 DC   
	INY					  ; $99da: C8	  
	AND #$3f				 ; $99db: 29 3F   
	CMP #$11				 ; $99dd: C9 11	; Compare with 17
	BNE $99e7				; $99df: D0 06   
	JSR $9a8c				; $99e1: 20 8C 9A ; -> sub_9A8C
	JMP $9a4c				; $99e4: 4C 4C 9A
loc_99E7:
	CMP #$02				 ; $99e7: C9 02	; Compare with 2
	BNE $99f1				; $99e9: D0 06   
	JSR $9a93				; $99eb: 20 93 9A ; -> sub_9A93
	JMP $9a4c				; $99ee: 4C 4C 9A
loc_99F1:
	CMP #$1e				 ; $99f1: C9 1E	; Compare with 30
	BNE $99fb				; $99f3: D0 06   
	JSR $9ac3				; $99f5: 20 C3 9A ; -> sub_9AC3
	JMP $9a4c				; $99f8: 4C 4C 9A
loc_99FB:
	CMP #$05				 ; $99fb: C9 05	; Compare with 5
	BNE $9a05				; $99fd: D0 06   
	JSR $9ac9				; $99ff: 20 C9 9A ; -> sub_9AC9
	JMP $9a4c				; $9a02: 4C 4C 9A
loc_9A05:
	CMP #$13				 ; $9a05: C9 13	; Compare with 19
	BNE $9a0f				; $9a07: D0 06   
	JSR $9ad1				; $9a09: 20 D1 9A ; -> sub_9AD1
	JMP $9a4c				; $9a0c: 4C 4C 9A
loc_9A0F:
	CMP #$03				 ; $9a0f: C9 03	; Compare with 3
	BNE $9a19				; $9a11: D0 06   
	JSR $9af5				; $9a13: 20 F5 9A ; -> sub_9AF5
	JMP $9a4c				; $9a16: 4C 4C 9A
loc_9A19:
	CMP #$14				 ; $9a19: C9 14	; Compare with 20
	BNE $9a23				; $9a1b: D0 06   
	JSR $9b09				; $9a1d: 20 09 9B ; -> sub_9B09
	JMP $9a4c				; $9a20: 4C 4C 9A
loc_9A23:
	CMP #$16				 ; $9a23: C9 16	; Compare with 22
	BNE $9a2d				; $9a25: D0 06   
	JSR $9b10				; $9a27: 20 10 9B ; -> sub_9B10
	JMP $9a4c				; $9a2a: 4C 4C 9A
loc_9A2D:
	CMP #$1b				 ; $9a2d: C9 1B	; Compare with 27
	BNE $9a37				; $9a2f: D0 06   
	JSR $9a96				; $9a31: 20 96 9A ; -> sub_9A96
	JMP $9a4c				; $9a34: 4C 4C 9A
loc_9A37:
	CMP #$1c				 ; $9a37: C9 1C	; Compare with 28
	BNE $9a41				; $9a39: D0 06   
	JSR $9aa3				; $9a3b: 20 A3 9A ; -> sub_9AA3
	JMP $9a4c				; $9a3e: 4C 4C 9A
loc_9A41:
	CMP #$1a				 ; $9a41: C9 1A	; Compare with 26
	BNE $9a4b				; $9a43: D0 06   
	JSR $9ab0				; $9a45: 20 B0 9A ; -> sub_9AB0
	JMP $9a4c				; $9a48: 4C 4C 9A
loc_9A4B:
	RTS					  ; $9a4b: 60	  
loc_9A4C:
	LDX $dc				  ; $9a4c: A6 DC   
	BNE $9a56				; $9a4e: D0 06   
	CMP #$00				 ; $9a50: C9 00	; Compare with 0
	BNE $9a6a				; $9a52: D0 16   
	BEQ $9a5a				; $9a54: F0 04   
loc_9A56:
	CMP #$00				 ; $9a56: C9 00	; Compare with 0
	BEQ $9a6a				; $9a58: F0 10   
loc_9A5A:
	JSR $9a7b				; $9a5a: 20 7B 9A ; -> sub_9A7B
	JSR $9ba8				; $9a5d: 20 A8 9B ; -> sub_9BA8
	LDA ($da),Y			  ; $9a60: B1 DA   
	CMP #$0b				 ; $9a62: C9 0B	; Compare with 11
	BNE $9a7a				; $9a64: D0 14   
	INY					  ; $9a66: C8	  
	JMP $9b1d				; $9a67: 4C 1D 9B
loc_9A6A:
	JSR $9b1d				; $9a6a: 20 1D 9B ; -> sub_9B1D
	LDA ($da),Y			  ; $9a6d: B1 DA   
	CMP #$0b				 ; $9a6f: C9 0B	; Compare with 11
	BNE $9a7a				; $9a71: D0 07   
	INY					  ; $9a73: C8	  
	JSR $9a7b				; $9a74: 20 7B 9A ; -> sub_9A7B
	JSR $9ba8				; $9a77: 20 A8 9B ; -> sub_9BA8
loc_9A7A:
	RTS					  ; $9a7a: 60	  

; ---- Subroutine at $9a7b (Bank 21) ----
sub_9A7B:
	LDA ($da),Y			  ; $9a7b: B1 DA   
	CMP #$06				 ; $9a7d: C9 06	; Compare with 6
	BEQ $9a86				; $9a7f: F0 05   
	LDA #$00				 ; $9a81: A9 00   
	STA $dc				  ; $9a83: 85 DC   
	RTS					  ; $9a85: 60	  
loc_9A86:
	INY					  ; $9a86: C8	  
	LDA #$ff				 ; $9a87: A9 FF   
	STA $dc				  ; $9a89: 85 DC   
	RTS					  ; $9a8b: 60	  

; ---- Subroutine at $9a8c (Bank 21) ----
sub_9A8C:
	LDA ($da),Y			  ; $9a8c: B1 DA   
	INY					  ; $9a8e: C8	  
	JSR $a769				; $9a8f: 20 69 A7 ; -> sub_A769
	RTS					  ; $9a92: 60	  

; ---- Subroutine at $9a93 (Bank 21) ----
sub_9A93:
	LDA $e9				  ; $9a93: A5 E9   
	RTS					  ; $9a95: 60	  

; ---- Subroutine at $9a96 (Bank 21) ----
sub_9A96:
	LDA ($da),Y			  ; $9a96: B1 DA   
	INY					  ; $9a98: C8	  
	TAX					  ; $9a99: AA	  
	LDA ($da),Y			  ; $9a9a: B1 DA   
	AND $627b,X			  ; $9a9c: 3D 7B 62
	BNE $9abf				; $9a9f: D0 1E   
	BEQ $9abb				; $9aa1: F0 18   

; ---- Subroutine at $9aa3 (Bank 21) ----
sub_9AA3:
	LDA ($da),Y			  ; $9aa3: B1 DA   
	INY					  ; $9aa5: C8	  
	TAX					  ; $9aa6: AA	  
	LDA ($da),Y			  ; $9aa7: B1 DA   
	ORA $627b,X			  ; $9aa9: 1D 7B 62
	BNE $9abf				; $9aac: D0 11   
	BEQ $9abb				; $9aae: F0 0B   

; ---- Subroutine at $9ab0 (Bank 21) ----
sub_9AB0:
	LDA ($da),Y			  ; $9ab0: B1 DA   
	INY					  ; $9ab2: C8	  
	TAX					  ; $9ab3: AA	  
	LDA ($da),Y			  ; $9ab4: B1 DA   
	CMP $627b,X			  ; $9ab6: DD 7B 62
	BNE $9abf				; $9ab9: D0 04   
loc_9ABB:
	LDA #$ff				 ; $9abb: A9 FF   
	BNE $9ac1				; $9abd: D0 02   
loc_9ABF:
	LDA #$00				 ; $9abf: A9 00   
loc_9AC1:
	INY					  ; $9ac1: C8	  
	RTS					  ; $9ac2: 60	  

; ---- Subroutine at $9ac3 (Bank 21) ----
sub_9AC3:
	LDX #$00				 ; $9ac3: A2 00   
	BRK					  ; $9ac5: 00	  
	AND #$73				 ; $9ac6: 29 73   
	RTS					  ; $9ac8: 60	  

; ---- Subroutine at $9ac9 (Bank 21) ----
sub_9AC9:
	LDA #$48				 ; $9ac9: A9 48   
	JSR $b7b5				; $9acb: 20 B5 B7 ; -> sub_B7B5
	ORA #$00				 ; $9ace: 09 00   
	RTS					  ; $9ad0: 60	  

; ---- Subroutine at $9ad1 (Bank 21) ----
sub_9AD1:
	LDA ($da),Y			  ; $9ad1: B1 DA   
	INY					  ; $9ad3: C8	  

; ---- Subroutine at $9ad4 (Bank 21) ----
sub_9AD4:
	BRK					  ; $9ad4: 00	  
	.db $63			  ; $9ad5 - Unknown opcode
	.db $73			  ; $9ad6 - Unknown opcode
	BCC $9aef				; $9ad7: 90 16   
	TAX					  ; $9ad9: AA	  
	LDA $615a				; $9ada: AD 5A 61
	CMP #$04				 ; $9add: C9 04	; Compare with 4
	BCC $9ae8				; $9adf: 90 07   
	BRK					  ; $9ae1: 00	  
	ROR					  ; $9ae2: 6A	  
	.db $73			  ; $9ae3 - Unknown opcode
	CMP #$01				 ; $9ae4: C9 01	; Compare with 1
	BEQ $9aef				; $9ae6: F0 07   
loc_9AE8:
	BRK					  ; $9ae8: 00	  
	.db $42			  ; $9ae9 - Unknown opcode
	.db $73			  ; $9aea - Unknown opcode
	CMP #$01				 ; $9aeb: C9 01	; Compare with 1
	BEQ $9af2				; $9aed: F0 03   
loc_9AEF:
	LDA #$01				 ; $9aef: A9 01   
	RTS					  ; $9af1: 60	  
loc_9AF2:
	LDA #$00				 ; $9af2: A9 00   
	RTS					  ; $9af4: 60	  

; ---- Subroutine at $9af5 (Bank 21) ----
sub_9AF5:
	LDA ($da),Y			  ; $9af5: B1 DA   
	INY					  ; $9af7: C8	  

; ---- Subroutine at $9af8 (Bank 21) ----
sub_9AF8:
	BRK					  ; $9af8: 00	  
	.db $63			  ; $9af9 - Unknown opcode
	.db $63			  ; $9afa - Unknown opcode
	RTI					  ; $9afb: 40	  
	BCC $9aef				; $9afc: 90 F1   
	TAX					  ; $9afe: AA	  
	BRK					  ; $9aff: 00	  
	.db $42			  ; $9b00 - Unknown opcode
	.db $63			  ; $9b01 - Unknown opcode
	RTI					  ; $9b02: 40	  
	CMP #$01				 ; $9b03: C9 01	; Compare with 1
	BEQ $9aef				; $9b05: F0 E8   
	BNE $9af2				; $9b07: D0 E9   

; ---- Subroutine at $9b09 (Bank 21) ----
sub_9B09:
	JSR $9ce5				; $9b09: 20 E5 9C ; -> sub_9CE5
	BCC $9af2				; $9b0c: 90 E4   
	BCS $9aef				; $9b0e: B0 DF   

; ---- Subroutine at $9b10 (Bank 21) ----
sub_9B10:
	LDA ($da),Y			  ; $9b10: B1 DA   
	INY					  ; $9b12: C8	  
	SEC					  ; $9b13: 38	  
	SBC #$01				 ; $9b14: E9 01	; Arithmetic
	CMP $615a				; $9b16: CD 5A 61
	BEQ $9af2				; $9b19: F0 D7   
	BNE $9aef				; $9b1b: D0 D2   

; ---- Subroutine at $9b1d (Bank 21) ----
sub_9B1D:
	LDA ($da),Y			  ; $9b1d: B1 DA   
	CMP #$06				 ; $9b1f: C9 06	; Compare with 6
	BEQ $9b25				; $9b21: F0 02   
	BNE $9b38				; $9b23: D0 13   
loc_9B25:
	INY					  ; $9b25: C8	  
loc_9B26:
	LDA ($da),Y			  ; $9b26: B1 DA   
	CMP #$3e				 ; $9b28: C9 3E	; Compare with 62
	BEQ $9b36				; $9b2a: F0 0A   
	CMP #$3f				 ; $9b2c: C9 3F	; Compare with 63
	BEQ $9b36				; $9b2e: F0 06   
	JSR $9b38				; $9b30: 20 38 9B ; -> sub_9B38
	JMP $9b26				; $9b33: 4C 26 9B
loc_9B36:
	INY					  ; $9b36: C8	  
	RTS					  ; $9b37: 60	  

; ---- Subroutine at $9b38 (Bank 21) ----
sub_9B38:
	LDA ($da),Y			  ; $9b38: B1 DA   
	STA tmp0				 ; $9b3a: 85 00   
	BIT tmp0				 ; $9b3c: 24 00   
	BVS $9b74				; $9b3e: 70 34   
	CMP #$17				 ; $9b40: C9 17	; Compare with 23
	BEQ $9b73				; $9b42: F0 2F   
	CMP #$18				 ; $9b44: C9 18	; Compare with 24
	BEQ $9b73				; $9b46: F0 2B   
	CMP #$19				 ; $9b48: C9 19	; Compare with 25
	BEQ $9b73				; $9b4a: F0 27   
	CMP #$12				 ; $9b4c: C9 12	; Compare with 18
	BEQ $9b74				; $9b4e: F0 24   
	CMP #$0b				 ; $9b50: C9 0B	; Compare with 11
	BEQ $9b75				; $9b52: F0 21   
	CMP #$01				 ; $9b54: C9 01	; Compare with 1
	BEQ $9b71				; $9b56: F0 19   
	CMP #$00				 ; $9b58: C9 00	; Compare with 0
	BEQ $9b73				; $9b5a: F0 17   
	CMP #$07				 ; $9b5c: C9 07	; Compare with 7
	BNE $9b75				; $9b5e: D0 15   
	INY					  ; $9b60: C8	  
	JSR $9b77				; $9b61: 20 77 9B ; -> sub_9B77
	JSR $9b1d				; $9b64: 20 1D 9B ; -> sub_9B1D
	LDA ($da),Y			  ; $9b67: B1 DA   
	CMP #$0b				 ; $9b69: C9 0B	; Compare with 11
	BNE $9b76				; $9b6b: D0 09   
	INY					  ; $9b6d: C8	  
	JMP $9b1d				; $9b6e: 4C 1D 9B
loc_9B71:
	INY					  ; $9b71: C8	  
	INY					  ; $9b72: C8	  
loc_9B73:
	INY					  ; $9b73: C8	  
loc_9B74:
	INY					  ; $9b74: C8	  
loc_9B75:
	INY					  ; $9b75: C8	  
loc_9B76:
	RTS					  ; $9b76: 60	  

; ---- Subroutine at $9b77 (Bank 21) ----
sub_9B77:
	LDA ($da),Y			  ; $9b77: B1 DA   
	AND #$3f				 ; $9b79: 29 3F   
	CMP #$11				 ; $9b7b: C9 11	; Compare with 17
	BEQ $9b74				; $9b7d: F0 F5   
	CMP #$02				 ; $9b7f: C9 02	; Compare with 2
	BEQ $9b75				; $9b81: F0 F2   
	CMP #$05				 ; $9b83: C9 05	; Compare with 5
	BEQ $9b75				; $9b85: F0 EE   
	CMP #$13				 ; $9b87: C9 13	; Compare with 19
	BEQ $9b74				; $9b89: F0 E9   
	CMP #$03				 ; $9b8b: C9 03	; Compare with 3
	BEQ $9b74				; $9b8d: F0 E5   
	CMP #$14				 ; $9b8f: C9 14	; Compare with 20
	BEQ $9b75				; $9b91: F0 E2   
	CMP #$16				 ; $9b93: C9 16	; Compare with 22
	BEQ $9b74				; $9b95: F0 DD   
	CMP #$1c				 ; $9b97: C9 1C	; Compare with 28
	BEQ $9b73				; $9b99: F0 D8   
	CMP #$1b				 ; $9b9b: C9 1B	; Compare with 27
	BEQ $9b73				; $9b9d: F0 D4   
	CMP #$1a				 ; $9b9f: C9 1A	; Compare with 26
	BEQ $9b73				; $9ba1: F0 D0   
	CMP #$1e				 ; $9ba3: C9 1E	; Compare with 30
	BEQ $9b75				; $9ba5: F0 CE   
	RTS					  ; $9ba7: 60	  

; ---- Subroutine at $9ba8 (Bank 21) ----
sub_9BA8:
	LDA ($da),Y			  ; $9ba8: B1 DA   
	INY					  ; $9baa: C8	  
	STA tmp0				 ; $9bab: 85 00   
	BIT tmp0				 ; $9bad: 24 00   
	BVC $9bbd				; $9baf: 50 0C   
	AND #$3f				 ; $9bb1: 29 3F   
	TAX					  ; $9bb3: AA	  
	LDA ($da),Y			  ; $9bb4: B1 DA   
	INY					  ; $9bb6: C8	  
	JSR $9919				; $9bb7: 20 19 99 ; -> sub_9919
	JMP $9c2e				; $9bba: 4C 2E 9C
loc_9BBD:
	CMP #$3f				 ; $9bbd: C9 3F	; Compare with 63
	BNE $9bc4				; $9bbf: D0 03   
	PLA					  ; $9bc1: 68	  
	PLA					  ; $9bc2: 68	  
	RTS					  ; $9bc3: 60	  
loc_9BC4:
	CMP #$07				 ; $9bc4: C9 07	; Compare with 7
	BNE $9bd4				; $9bc6: D0 0C   
	LDA $dc				  ; $9bc8: A5 DC   
	PHA					  ; $9bca: 48	  
	JSR $99ce				; $9bcb: 20 CE 99 ; -> sub_99CE
	PLA					  ; $9bce: 68	  
	STA $dc				  ; $9bcf: 85 DC   
	JMP $9c2e				; $9bd1: 4C 2E 9C
loc_9BD4:
	CMP #$18				 ; $9bd4: C9 18	; Compare with 24
	BNE $9be8				; $9bd6: D0 10   
	LDA ($da),Y			  ; $9bd8: B1 DA   
	INY					  ; $9bda: C8	  
	TAX					  ; $9bdb: AA	  
	LDA ($da),Y			  ; $9bdc: B1 DA   
	INY					  ; $9bde: C8	  
	ORA $627b,X			  ; $9bdf: 1D 7B 62
	STA $627b,X			  ; $9be2: 9D 7B 62
	JMP $9c2e				; $9be5: 4C 2E 9C
loc_9BE8:
	CMP #$17				 ; $9be8: C9 17	; Compare with 23
	BNE $9bfc				; $9bea: D0 10   
	LDA ($da),Y			  ; $9bec: B1 DA   
	INY					  ; $9bee: C8	  
	TAX					  ; $9bef: AA	  
	LDA ($da),Y			  ; $9bf0: B1 DA   
	INY					  ; $9bf2: C8	  
	AND $627b,X			  ; $9bf3: 3D 7B 62
	STA $627b,X			  ; $9bf6: 9D 7B 62
	JMP $9c2e				; $9bf9: 4C 2E 9C
loc_9BFC:
	CMP #$19				 ; $9bfc: C9 19	; Compare with 25
	BNE $9c0d				; $9bfe: D0 0D   
	LDA ($da),Y			  ; $9c00: B1 DA   
	INY					  ; $9c02: C8	  
	TAX					  ; $9c03: AA	  
	LDA ($da),Y			  ; $9c04: B1 DA   
	INY					  ; $9c06: C8	  
	STA $627b,X			  ; $9c07: 9D 7B 62
	JMP $9c2e				; $9c0a: 4C 2E 9C
loc_9C0D:
	CMP #$12				 ; $9c0d: C9 12	; Compare with 18
	BNE $9c17				; $9c0f: D0 06   
	JSR $9c63				; $9c11: 20 63 9C ; -> sub_9C63
	JMP $9c2e				; $9c14: 4C 2E 9C
loc_9C17:
	CMP #$00				 ; $9c17: C9 00	; Compare with 0
	BNE $9c21				; $9c19: D0 06   
	JSR $9c42				; $9c1b: 20 42 9C ; -> sub_9C42
	JMP $9c2e				; $9c1e: 4C 2E 9C
loc_9C21:
	CMP #$01				 ; $9c21: C9 01	; Compare with 1
	BNE $9c2d				; $9c23: D0 08   
	JSR $9c42				; $9c25: 20 42 9C ; -> sub_9C42
	INY					  ; $9c28: C8	  
	INY					  ; $9c29: C8	  
	JMP $9c2e				; $9c2a: 4C 2E 9C
loc_9C2D:
	RTS					  ; $9c2d: 60	  
loc_9C2E:
	LDA $dc				  ; $9c2e: A5 DC   
	BNE $9c33				; $9c30: D0 01   
	RTS					  ; $9c32: 60	  
loc_9C33:
	LDA ($da),Y			  ; $9c33: B1 DA   
	CMP #$3e				 ; $9c35: C9 3E	; Compare with 62
	BEQ $9c40				; $9c37: F0 07   
	CMP #$3f				 ; $9c39: C9 3F	; Compare with 63
	BEQ $9c40				; $9c3b: F0 03   
	JMP $9ba8				; $9c3d: 4C A8 9B
loc_9C40:
	INY					  ; $9c40: C8	  
	RTS					  ; $9c41: 60	  

; ---- Subroutine at $9c42 (Bank 21) ----
sub_9C42:
	LDA ($da),Y			  ; $9c42: B1 DA   
	INY					  ; $9c44: C8	  
	STA $de				  ; $9c45: 85 DE   
	LDA ($da),Y			  ; $9c47: B1 DA   
	STA $df				  ; $9c49: 85 DF   
	LDA $da				  ; $9c4b: A5 DA   
	PHA					  ; $9c4d: 48	  
	LDA $db				  ; $9c4e: A5 DB   
	PHA					  ; $9c50: 48	  
	LDA $dc				  ; $9c51: A5 DC   
	PHA					  ; $9c53: 48	  
	TYA					  ; $9c54: 98	  
	PHA					  ; $9c55: 48	  
	JSR $9c5c				; $9c56: 20 5C 9C ; -> sub_9C5C
	JMP $9c75				; $9c59: 4C 75 9C

; ---- Subroutine at $9c5c (Bank 21) ----
sub_9C5C:
	INY					  ; $9c5c: C8	  
	JSR $b056				; $9c5d: 20 56 B0 ; -> sub_B056
	JMP ($00de)			  ; $9c60: 6C DE 00

; ---- Subroutine at $9c63 (Bank 21) ----
sub_9C63:
	LDA $da				  ; $9c63: A5 DA   
	PHA					  ; $9c65: 48	  
	LDA $db				  ; $9c66: A5 DB   
	PHA					  ; $9c68: 48	  
	LDA $dc				  ; $9c69: A5 DC   
	PHA					  ; $9c6b: 48	  
	TYA					  ; $9c6c: 98	  
	PHA					  ; $9c6d: 48	  
	LDA ($da),Y			  ; $9c6e: B1 DA   
	STA tmp0				 ; $9c70: 85 00   
	JSR $9cbf				; $9c72: 20 BF 9C ; -> sub_9CBF
loc_9C75:
	PLA					  ; $9c75: 68	  
	TAY					  ; $9c76: A8	  
	INY					  ; $9c77: C8	  
	PLA					  ; $9c78: 68	  
	STA $dc				  ; $9c79: 85 DC   
	PLA					  ; $9c7b: 68	  
	STA $db				  ; $9c7c: 85 DB   
	PLA					  ; $9c7e: 68	  
	STA $da				  ; $9c7f: 85 DA   
	RTS					  ; $9c81: 60	  
	LDA ($da),Y			  ; $9c82: B1 DA   
	INY					  ; $9c84: C8	  
	CMP #$06				 ; $9c85: C9 06	; Compare with 6
	BNE $9c8d				; $9c87: D0 04   
	LDA #$01				 ; $9c89: A9 01   
	BNE $9c8f				; $9c8b: D0 02   
loc_9C8D:
	LDA #$00				 ; $9c8d: A9 00   
loc_9C8F:
	LDA $dc				  ; $9c8f: A5 DC   
	RTS					  ; $9c91: 60	  

; ---- Subroutine at $9c92 (Bank 21) ----
sub_9C92:
	LDA tmp0				 ; $9c92: A5 00   
	SEC					  ; $9c94: 38	  
	SBC #$61				 ; $9c95: E9 61	; Arithmetic
	STA $da				  ; $9c97: 85 DA   
	LDA tmp1				 ; $9c99: A5 01   
	SBC #$01				 ; $9c9b: E9 01	; Arithmetic
	STA $db				  ; $9c9d: 85 DB   
	TAX					  ; $9c9f: AA	  
	LDA $da				  ; $9ca0: A5 DA   
	JSR $9914				; $9ca2: 20 14 99 ; -> sub_9914
	JSR $9ac9				; $9ca5: 20 C9 9A ; -> sub_9AC9
	BEQ $9cae				; $9ca8: F0 04   
	LDA #$02				 ; $9caa: A9 02   
	BNE $9cb0				; $9cac: D0 02   
loc_9CAE:
	LDA #$01				 ; $9cae: A9 01   
loc_9CB0:
	STA tmp0				 ; $9cb0: 85 00   
	LDA $da				  ; $9cb2: A5 DA   
	CLC					  ; $9cb4: 18	  
	ADC tmp0				 ; $9cb5: 65 00	; Arithmetic
	LDX $db				  ; $9cb7: A6 DB   
	BCC $9cbc				; $9cb9: 90 01   
	INX					  ; $9cbb: E8	  
loc_9CBC:
	JMP $9914				; $9cbc: 4C 14 99

; ---- Subroutine at $9cbf (Bank 21) ----
sub_9CBF:
	CMP #$04				 ; $9cbf: C9 04	; Compare with 4
	BNE $9cc6				; $9cc1: D0 03   
	JMP $bbce				; $9cc3: 4C CE BB
loc_9CC6:
	CMP #$06				 ; $9cc6: C9 06	; Compare with 6
	BNE $9ccd				; $9cc8: D0 03   
	JMP $bf06				; $9cca: 4C 06 BF
loc_9CCD:
	CMP #$01				 ; $9ccd: C9 01	; Compare with 1
	BNE $9cd4				; $9ccf: D0 03   
	JMP $b822				; $9cd1: 4C 22 B8
loc_9CD4:
	CMP #$03				 ; $9cd4: C9 03	; Compare with 3
	BNE $9cdb				; $9cd6: D0 03   
	JMP $b829				; $9cd8: 4C 29 B8
loc_9CDB:
	CMP #$02				 ; $9cdb: C9 02	; Compare with 2
	BNE $9ce2				; $9cdd: D0 03   
	JMP $b830				; $9cdf: 4C 30 B8
loc_9CE2:
	JMP $b528				; $9ce2: 4C 28 B5

; ---- Subroutine at $9ce5 (Bank 21) ----
sub_9CE5:
	LDA $62ed				; $9ce5: AD ED 62
	CMP #$78				 ; $9ce8: C9 78	; Compare with 120
	RTS					  ; $9cea: 60	  
	LDA $615a				; $9ceb: AD 5A 61
	BEQ $9cf9				; $9cee: F0 09   
	CMP #$04				 ; $9cf0: C9 04	; Compare with 4
	BEQ $9d1f				; $9cf2: F0 2B   
	CMP #$02				 ; $9cf4: C9 02	; Compare with 2
	BEQ $9d14				; $9cf6: F0 1C   
	RTS					  ; $9cf8: 60	  
loc_9CF9:
	BRK					  ; $9cf9: 00	  
	ASL pos_x_hi			 ; $9cfa: 06 EB   
	.db $04			  ; $9cfc - Unknown opcode
	BEQ $9d13				; $9cfd: F0 14   
	LDA $6281				; $9cff: AD 81 62
	AND #$03				 ; $9d02: 29 03   
	CLC					  ; $9d04: 18	  
	ADC #$01				 ; $9d05: 69 01	; Arithmetic
	STA tmp0				 ; $9d07: 85 00   
	LDA $6281				; $9d09: AD 81 62
	AND #$f8				 ; $9d0c: 29 F8   
	ORA tmp0				 ; $9d0e: 05 00   
	STA $6281				; $9d10: 8D 81 62
loc_9D13:
	RTS					  ; $9d13: 60	  
loc_9D14:
	BRK					  ; $9d14: 00	  
	ORA $02eb				; $9d15: 0D EB 02
	BEQ $9d1e				; $9d18: F0 04   
	BRK					  ; $9d1a: 00	  
	ORA $08cb				; $9d1b: 0D CB 08
loc_9D1E:
	RTS					  ; $9d1e: 60	  
loc_9D1F:
	BRK					  ; $9d1f: 00	  
	.db $13			  ; $9d20 - Unknown opcode
	.db $eb			  ; $9d21 - Unknown opcode
	JSR $04f0				; $9d22: 20 F0 04
	BRK					  ; $9d25: 00	  
	.db $13			  ; $9d26 - Unknown opcode
	.db $cb			  ; $9d27 - Unknown opcode
	.db $04			  ; $9d28 - Unknown opcode
	RTS					  ; $9d29: 60	  
	LDY $45				  ; $9d2a: A4 45   
	CPY #$16				 ; $9d2c: C0 16   
	BNE $9d33				; $9d2e: D0 03   
	JMP $a66a				; $9d30: 4C 6A A6
loc_9D33:
	JMP $b829				; $9d33: 4C 29 B8
	LDX #$08				 ; $9d36: A2 08   
	LDA #$33				 ; $9d38: A9 33   
	STA $7046,X			  ; $9d3a: 9D 46 70
	RTS					  ; $9d3d: 60	  
	LDX #$00				 ; $9d3e: A2 00   
	LDA $6281				; $9d40: AD 81 62
	AND #$03				 ; $9d43: 29 03   
	BEQ $9d4f				; $9d45: F0 08   
	INX					  ; $9d47: E8	  
	CMP #$01				 ; $9d48: C9 01	; Compare with 1
	BEQ $9d4f				; $9d4a: F0 03   
	INX					  ; $9d4c: E8	  
	BNE $9d53				; $9d4d: D0 04   
loc_9D4F:
	BRK					  ; $9d4f: 00	  
	ASL $cb				  ; $9d50: 06 CB   
	.db $04			  ; $9d52 - Unknown opcode
loc_9D53:
	TXA					  ; $9d53: 8A	  
	JMP $a66a				; $9d54: 4C 6A A6
	LDA #$00				 ; $9d57: A9 00   
	JMP $b0d7				; $9d59: 4C D7 B0
	JSR $a66a				; $9d5c: 20 6A A6 ; -> sub_A66A
	JMP $b0b6				; $9d5f: 4C B6 B0
	LDA #$01				 ; $9d62: A9 01   
	BRK					  ; $9d64: 00	  
	.db $07			  ; $9d65 - Unknown opcode
	.db $cf			  ; $9d66 - Unknown opcode
	RTS					  ; $9d67: 60	  
	LDA #$07				 ; $9d68: A9 07   
	JSR $9ad4				; $9d6a: 20 D4 9A ; -> sub_9AD4
	BEQ $9d76				; $9d6d: F0 07   
	LDA #$07				 ; $9d6f: A9 07   
	BRK					  ; $9d71: 00	  
	.db $63			  ; $9d72 - Unknown opcode
	.db $73			  ; $9d73 - Unknown opcode
	STA $f9				  ; $9d74: 85 F9   
loc_9D76:
	BRK					  ; $9d76: 00	  
	PHP					  ; $9d77: 08	  
	.db $eb			  ; $9d78 - Unknown opcode
	.db $04			  ; $9d79 - Unknown opcode
	BEQ $9d7f				; $9d7a: F0 03   
	JMP $a664				; $9d7c: 4C 64 A6
loc_9D7F:
	BRK					  ; $9d7f: 00	  
	LSR $603b				; $9d80: 4E 3B 60
	LDA $62aa				; $9d83: AD AA 62
	ORA #$08				 ; $9d86: 09 08   
	STA $62aa				; $9d88: 8D AA 62
	RTS					  ; $9d8b: 60	  
	JSR $9d92				; $9d8c: 20 92 9D ; -> sub_9D92
	JMP $a664				; $9d8f: 4C 64 A6

; ---- Subroutine at $9d92 (Bank 21) ----
sub_9D92:
	LDA $07c7				; $9d92: AD C7 07
	STA $70				  ; $9d95: 85 70   
	STA $fe				  ; $9d97: 85 FE   
	LDA $07c8				; $9d99: AD C8 07
	STA $71				  ; $9d9c: 85 71   
	STA $ff				  ; $9d9e: 85 FF   
	LDA $07c6				; $9da0: AD C6 07
	STA $fd				  ; $9da3: 85 FD   
	BRK					  ; $9da5: 00	  
	.db $4b			  ; $9da6 - Unknown opcode
	.db $73			  ; $9da7 - Unknown opcode
	BRK					  ; $9da8: 00	  
	ORA #$cb				 ; $9da9: 09 CB   
	.db $04			  ; $9dab - Unknown opcode
	LDA #$00				 ; $9dac: A9 00   
	STA $07c6				; $9dae: 8D C6 07
	STA $07c7				; $9db1: 8D C7 07
	STA $07c8				; $9db4: 8D C8 07
	RTS					  ; $9db7: 60	  

; ---- Subroutine at $9db8 (Bank 21) ----
sub_9DB8:
	LDA $fd				  ; $9db8: A5 FD   
	STA tmp0				 ; $9dba: 85 00   
	LDA $fe				  ; $9dbc: A5 FE   
	STA tmp1				 ; $9dbe: 85 01   
	LDA $ff				  ; $9dc0: A5 FF   
	STA tmp2				 ; $9dc2: 85 02   
loc_9DC4:
	LSR tmp2				 ; $9dc4: 46 02   
	ROR tmp1				 ; $9dc6: 66 01   
	ROR tmp0				 ; $9dc8: 66 00   
	DEX					  ; $9dca: CA	  
	BNE $9dc4				; $9dcb: D0 F7   
	LDA tmp0				 ; $9dcd: A5 00   
	ORA tmp1				 ; $9dcf: 05 01   
	ORA tmp2				 ; $9dd1: 05 02   
	BNE $9dd9				; $9dd3: D0 04   
	LDA #$01				 ; $9dd5: A9 01   
	STA tmp0				 ; $9dd7: 85 00   
loc_9DD9:
	RTS					  ; $9dd9: 60	  
	JSR $a64c				; $9dda: 20 4C A6 ; -> sub_A64C
	JMP $9df0				; $9ddd: 4C F0 9D
	BRK					  ; $9de0: 00	  
	ORA #$eb				 ; $9de1: 09 EB   
	ORA ($d0,X)			  ; $9de3: 01 D0   
	.db $07			  ; $9de5 - Unknown opcode
	LDA $6285				; $9de6: AD 85 62
	AND #$02				 ; $9de9: 29 02   
	BNE $9e45				; $9deb: D0 58   
	JSR $a668				; $9ded: 20 68 A6 ; -> sub_A668
loc_9DF0:
	JSR $a660				; $9df0: 20 60 A6 ; -> sub_A660
	LDA #$80				 ; $9df3: A9 80   
	STA $dd				  ; $9df5: 85 DD   
	LDA #$1b				 ; $9df7: A9 1B   
	STA $44				  ; $9df9: 85 44   
	LDA #$05				 ; $9dfb: A9 05   
	STA $45				  ; $9dfd: 85 45   
	JSR $d210				; $9dff: 20 10 D2 ; Call to fixed bank
	JSR $a6bc				; $9e02: 20 BC A6 ; -> sub_A6BC
	LDX #$01				 ; $9e05: A2 01   
	LDA #$1b				 ; $9e07: A9 1B   
	STA $6f66,X			  ; $9e09: 9D 66 6F
	STA $6fa6,X			  ; $9e0c: 9D A6 6F
	LDA #$04				 ; $9e0f: A9 04   
	STA $6f86,X			  ; $9e11: 9D 86 6F
	STA $6fc6,X			  ; $9e14: 9D C6 6F
	JSR $a4c9				; $9e17: 20 C9 A4 ; -> sub_A4C9
	JSR $a6a9				; $9e1a: 20 A9 A6 ; -> sub_A6A9
	JSR $a65c				; $9e1d: 20 5C A6 ; -> sub_A65C
	JSR $a658				; $9e20: 20 58 A6 ; -> sub_A658
	LDA #$74				 ; $9e23: A9 74   
	JSR $a769				; $9e25: 20 69 A7 ; -> sub_A769
	BEQ $9e36				; $9e28: F0 0C   
	LDA #$05				 ; $9e2a: A9 05   
	JSR $a774				; $9e2c: 20 74 A7 ; -> sub_A774
	BCS $9e36				; $9e2f: B0 05   
	LDA #$74				 ; $9e31: A9 74   
	JSR $b089				; $9e33: 20 89 B0 ; -> sub_B089
loc_9E36:
	BRK					  ; $9e36: 00	  
	ORA #$db				 ; $9e37: 09 DB   
	.db $fa			  ; $9e39 - Unknown opcode
	BRK					  ; $9e3a: 00	  
	ASL					  ; $9e3b: 0A	  
	.db $cb			  ; $9e3c - Unknown opcode
	.db $02			  ; $9e3d - Unknown opcode
	BRK					  ; $9e3e: 00	  
	BPL $9e1c				; $9e3f: 10 DB   
	.db $7f			  ; $9e41 - Unknown opcode
	JMP $9e55				; $9e42: 4C 55 9E
loc_9E45:
	LDA $628b				; $9e45: AD 8B 62

; ---- Subroutine at $9e48 (Bank 21) ----
sub_9E48:
	AND #$80				 ; $9e48: 29 80   
	BEQ $9e52				; $9e4a: F0 06   
	JSR $a650				; $9e4c: 20 50 A6 ; -> sub_A650
	JMP $9e55				; $9e4f: 4C 55 9E
loc_9E52:
	JSR $a654				; $9e52: 20 54 A6 ; -> sub_A654
loc_9E55:
	RTS					  ; $9e55: 60	  
	JSR $d210				; $9e56: 20 10 D2 ; Call to fixed bank
	LDA #$00				 ; $9e59: A9 00   
	STA submap_number		; $9e5b: 85 64   
	LDA #$05				 ; $9e5d: A9 05   
	STA $44				  ; $9e5f: 85 44   
	LDA #$1c				 ; $9e61: A9 1C   
	STA $45				  ; $9e63: 85 45   
	JSR $a6bc				; $9e65: 20 BC A6 ; -> sub_A6BC
	JSR $b03f				; $9e68: 20 3F B0 ; -> sub_B03F
	LDA #$81				 ; $9e6b: A9 81   
	BRK					  ; $9e6d: 00	  
	AND ($ef),Y			  ; $9e6e: 31 EF   
	LDX #$0c				 ; $9e70: A2 0C   
	LDA $7006,X			  ; $9e72: BD 06 70
	AND #$fc				 ; $9e75: 29 FC   
	ORA #$03				 ; $9e77: 09 03   
	STA $7006,X			  ; $9e79: 9D 06 70
	JSR $a4c9				; $9e7c: 20 C9 A4 ; -> sub_A4C9
	JMP $c5bf				; $9e7f: 4C BF C5
	LDA #$74				 ; $9e82: A9 74   
	JSR $a769				; $9e84: 20 69 A7 ; -> sub_A769
	BEQ $9e98				; $9e87: F0 0F   
	LDA #$05				 ; $9e89: A9 05   
	JSR $a774				; $9e8b: 20 74 A7 ; -> sub_A774
	BCS $9e98				; $9e8e: B0 08   
	JSR $a664				; $9e90: 20 64 A6 ; -> sub_A664
	LDA #$74				 ; $9e93: A9 74   
	JSR $b089				; $9e95: 20 89 B0 ; -> sub_B089
loc_9E98:
	RTS					  ; $9e98: 60	  
	LDA $6254				; $9e99: AD 54 62
	ORA $6255				; $9e9c: 0D 55 62
	ORA $6256				; $9e9f: 0D 56 62
	BEQ $9ec8				; $9ea2: F0 24   
	LDA $6255				; $9ea4: AD 55 62
	STA $70				  ; $9ea7: 85 70   
	STA $fe				  ; $9ea9: 85 FE   
	LDA $6256				; $9eab: AD 56 62
	STA $71				  ; $9eae: 85 71   
	STA $ff				  ; $9eb0: 85 FF   
	LDA $6254				; $9eb2: AD 54 62
	STA $fd				  ; $9eb5: 85 FD   
	BRK					  ; $9eb7: 00	  
	.db $4b			  ; $9eb8 - Unknown opcode
	.db $73			  ; $9eb9 - Unknown opcode
	LDA #$00				 ; $9eba: A9 00   
	STA $6254				; $9ebc: 8D 54 62
	STA $6255				; $9ebf: 8D 55 62
	STA $6256				; $9ec2: 8D 56 62
	BRK					  ; $9ec5: 00	  
	ADC $203b				; $9ec6: 6D 3B 20 ; Arithmetic
	TXA					  ; $9ec9: 8A	  
	.db $b3			  ; $9eca - Unknown opcode
	CMP #$78				 ; $9ecb: C9 78	; Compare with 120
	BCC $9ed5				; $9ecd: 90 06   
	BRK					  ; $9ecf: 00	  
	.db $77			  ; $9ed0 - Unknown opcode
	.db $3b			  ; $9ed1 - Unknown opcode
	JMP $9f4e				; $9ed2: 4C 4E 9F
loc_9ED5:
	BRK					  ; $9ed5: 00	  
	ROR $a93b				; $9ed6: 6E 3B A9
	ORA tmp0				 ; $9ed9: 05 00   
	.db $63			  ; $9edb - Unknown opcode
	.db $73			  ; $9edc - Unknown opcode
	STA $da				  ; $9edd: 85 DA   
	TAX					  ; $9edf: AA	  
	BRK					  ; $9ee0: 00	  
	AND $c973				; $9ee1: 2D 73 C9
	BRK					  ; $9ee4: 00	  
	BNE $9ef3				; $9ee5: D0 0C   
	BRK					  ; $9ee7: 00	  
	.db $83			  ; $9ee8 - Unknown opcode
	.db $2b			  ; $9ee9 - Unknown opcode
	BRK					  ; $9eea: 00	  
	.db $34			  ; $9eeb - Unknown opcode
	.db $3b			  ; $9eec - Unknown opcode
	BRK					  ; $9eed: 00	  
	.db $83			  ; $9eee - Unknown opcode
	.db $2b			  ; $9eef - Unknown opcode
	JMP $9f4b				; $9ef0: 4C 4B 9F
loc_9EF3:
	LDX $da				  ; $9ef3: A6 DA   
	LDA #$1f				 ; $9ef5: A9 1F   
	JSR $b7b5				; $9ef7: 20 B5 B7 ; -> sub_B7B5
	CMP #$ff				 ; $9efa: C9 FF	; Compare with 255
	BEQ $9f4b				; $9efc: F0 4D   
	STA $db				  ; $9efe: 85 DB   
	LDX $da				  ; $9f00: A6 DA   
	BRK					  ; $9f02: 00	  
	BIT $2973				; $9f03: 2C 73 29
	.db $7f			  ; $9f06 - Unknown opcode
	STA $f9				  ; $9f07: 85 F9   
	BRK					  ; $9f09: 00	  
	.db $0f			  ; $9f0a - Unknown opcode
	.db $0f			  ; $9f0b - Unknown opcode
	BCS $9f45				; $9f0c: B0 37   
	LDA $f9				  ; $9f0e: A5 F9   
	STA tmp0				 ; $9f10: 85 00   
	JSR $b2cf				; $9f12: 20 CF B2 ; -> sub_B2CF
	JSR $a47c				; $9f15: 20 7C A4 ; -> sub_A47C
	LDA #$60				 ; $9f18: A9 60   
	JSR $a60d				; $9f1a: 20 0D A6 ; -> sub_A60D
	BRK					  ; $9f1d: 00	  
	.db $6f			  ; $9f1e - Unknown opcode
	.db $3b			  ; $9f1f - Unknown opcode
	JSR $9ac9				; $9f20: 20 C9 9A ; -> sub_9AC9
	BNE $9f3f				; $9f23: D0 1A   
	LDX $da				  ; $9f25: A6 DA   
	LDA $db				  ; $9f27: A5 DB   
	BRK					  ; $9f29: 00	  
	BMI $9f9f				; $9f2a: 30 73   
	LDA $f9				  ; $9f2c: A5 F9   
	JSR $b3a1				; $9f2e: 20 A1 B3 ; -> sub_B3A1
	BRK					  ; $9f31: 00	  
	BVS $9f6f				; $9f32: 70 3B   
loc_9F34:
	BRK					  ; $9f34: 00	  
	ADC ($3b),Y			  ; $9f35: 71 3B	; Arithmetic
	JSR $9ac9				; $9f37: 20 C9 9A ; -> sub_9AC9
	BNE $9f4b				; $9f3a: D0 0F   
	JMP $9ec8				; $9f3c: 4C C8 9E
loc_9F3F:
	BRK					  ; $9f3f: 00	  
	.db $72			  ; $9f40 - Unknown opcode
	.db $3b			  ; $9f41 - Unknown opcode
	JMP $9f34				; $9f42: 4C 34 9F
loc_9F45:
	BRK					  ; $9f45: 00	  
	.db $73			  ; $9f46 - Unknown opcode
	.db $3b			  ; $9f47 - Unknown opcode

; ---- Subroutine at $9f48 (Bank 21) ----
sub_9F48:
	JMP $9f34				; $9f48: 4C 34 9F
loc_9F4B:
	BRK					  ; $9f4b: 00	  
	.db $74			  ; $9f4c - Unknown opcode
	.db $3b			  ; $9f4d - Unknown opcode
loc_9F4E:
	JSR $9ac9				; $9f4e: 20 C9 9A ; -> sub_9AC9
	CMP #$00				 ; $9f51: C9 00	; Compare with 0
	BNE $9f6b				; $9f53: D0 16   
	JSR $b38a				; $9f55: 20 8A B3 ; -> sub_B38A
	ORA #$00				 ; $9f58: 09 00   
	BEQ $9f73				; $9f5a: F0 17   
	LDA #$63				 ; $9f5c: A9 63   
	JSR $b7b5				; $9f5e: 20 B5 B7 ; -> sub_B7B5
	JSR $b38a				; $9f61: 20 8A B3 ; -> sub_B38A
	CMP #$09				 ; $9f64: C9 09	; Compare with 9
	BCC $9f6b				; $9f66: 90 03   
	JSR $c8cc				; $9f68: 20 CC C8 ; Call to fixed bank
loc_9F6B:
	BRK					  ; $9f6b: 00	  
	ADC $3b,X				; $9f6c: 75 3B	; Arithmetic
loc_9F6E:
	LDA #$00				 ; $9f6e: A9 00   
	STA $e7				  ; $9f70: 85 E7   
	RTS					  ; $9f72: 60	  
loc_9F73:
	BRK					  ; $9f73: 00	  
	ROR $3b,X				; $9f74: 76 3B   
	JMP $9f6e				; $9f76: 4C 6E 9F

; ---- Subroutine at $9f79 (Bank 21) ----
sub_9F79:
	INC $628c				; $9f79: EE 8C 62
	INC $628d				; $9f7c: EE 8D 62
	BRK					  ; $9f7f: 00	  
	JSR $bfdb				; $9f80: 20 DB BF ; -> sub_BFDB
	LDA $615a				; $9f83: AD 5A 61
	CMP #$02				 ; $9f86: C9 02	; Compare with 2
	BNE $9fd5				; $9f88: D0 4B   
	BRK					  ; $9f8a: 00	  
	ORA $db				  ; $9f8b: 05 DB   
	.db $cf			  ; $9f8d - Unknown opcode
	LDX #$00				 ; $9f8e: A2 00   
loc_9F90:
	LDA $61db,X			  ; $9f90: BD DB 61
	CMP #$ff				 ; $9f93: C9 FF	; Compare with 255
	BEQ $9fd5				; $9f95: F0 3E   
	STA $da				  ; $9f97: 85 DA   
	STX $db				  ; $9f99: 86 DB   
	JSR $c891				; $9f9b: 20 91 C8 ; Call to fixed bank
	CMP #$c0				 ; $9f9e: C9 C0	; Compare with 192
	BCS $9fcf				; $9fa0: B0 2D   
	LDA $da				  ; $9fa2: A5 DA   
	LDX #$fd				 ; $9fa4: A2 FD   
	BRK					  ; $9fa6: 00	  
	ORA ($0f),Y			  ; $9fa7: 11 0F   
	JSR $a5fa				; $9fa9: 20 FA A5 ; -> sub_A5FA
	LDA $6254				; $9fac: AD 54 62
	CLC					  ; $9faf: 18	  
	ADC $fd				  ; $9fb0: 65 FD	; Arithmetic
	STA $6254				; $9fb2: 8D 54 62
	LDA $6255				; $9fb5: AD 55 62
	ADC $fe				  ; $9fb8: 65 FE	; Arithmetic
	STA $6255				; $9fba: 8D 55 62
	LDA $6256				; $9fbd: AD 56 62
	ADC $ff				  ; $9fc0: 65 FF	; Arithmetic
	STA $6256				; $9fc2: 8D 56 62
	LDA $db				  ; $9fc5: A5 DB   
	JSR $b3ca				; $9fc7: 20 CA B3 ; -> sub_B3CA
	LDX $db				  ; $9fca: A6 DB   
	JMP $9f90				; $9fcc: 4C 90 9F
loc_9FCF:
	LDX $db				  ; $9fcf: A6 DB   
	INX					  ; $9fd1: E8	  
	JMP $9f90				; $9fd2: 4C 90 9F
loc_9FD5:
	RTS					  ; $9fd5: 60	  
	BRK					  ; $9fd6: 00	  
	.db $0b			  ; $9fd7 - Unknown opcode
	.db $eb			  ; $9fd8 - Unknown opcode
	.db $04			  ; $9fd9 - Unknown opcode
	BNE $a00d				; $9fda: D0 31   
	LDY #$03				 ; $9fdc: A0 03   
	LDA #$90				 ; $9fde: A9 90   
	STA $6f				  ; $9fe0: 85 6F   
	LDA #$01				 ; $9fe2: A9 01   
loc_9FE4:
	STA $70				  ; $9fe4: 85 70   
	LDA #$00				 ; $9fe6: A9 00   
	STA $71				  ; $9fe8: 85 71   
	BRK					  ; $9fea: 00	  
	JMP $9033				; $9feb: 4C 33 90
	.db $22			  ; $9fee - Unknown opcode
	LDA #$00				 ; $9fef: A9 00   
	CPY #$03				 ; $9ff1: C0 03   
	BNE $9fff				; $9ff3: D0 0A   
	STA $628c				; $9ff5: 8D 8C 62
	BRK					  ; $9ff8: 00	  
	.db $13			  ; $9ff9 - Unknown opcode
	.db $cb			  ; $9ffa - Unknown opcode
	.db $80			  ; $9ffb - Unknown opcode
	JMP $a006				; $9ffc: 4C 06 A0
loc_9FFF:
	STA $628d				; $9fff: 8D 8D 62
	BRK					  ; $a002: 00	  
	.db $13			  ; $a003 - Unknown opcode
	.db $cb			  ; $a004 - Unknown opcode
	RTI					  ; $a005: 40	  
loc_A006:
	TYA					  ; $a006: 98	  
	JSR $a66a				; $a007: 20 6A A6 ; -> sub_A66A
	JMP $a4b6				; $a00a: 4C B6 A4
loc_A00D:
	LDA #$01				 ; $a00d: A9 01   
	BNE $a013				; $a00f: D0 02   
	DEY					  ; $a011: 88	  
	TYA					  ; $a012: 98	  
loc_A013:
	JMP $a66a				; $a013: 4C 6A A6
	JSR $a664				; $a016: 20 64 A6 ; -> sub_A664
	JSR $9ac9				; $a019: 20 C9 9A ; -> sub_9AC9
	BNE $a028				; $a01c: D0 0A   
	LDY #$02				 ; $a01e: A0 02   
	LDA #$58				 ; $a020: A9 58   
	STA $6f				  ; $a022: 85 6F   
	LDA #$02				 ; $a024: A9 02   
	BNE $9fe4				; $a026: D0 BC   
loc_A028:
	JMP $a65c				; $a028: 4C 5C A6
	LDA #$88				 ; $a02b: A9 88   
	STA $70				  ; $a02d: 85 70   
	LDA #$00				 ; $a02f: A9 00   
	STA $71				  ; $a031: 85 71   
	LDA #$b8				 ; $a033: A9 B8   
	BRK					  ; $a035: 00	  
	JMP $9073				; $a036: 4C 73 90
	.db $0f			  ; $a039 - Unknown opcode
	JSR $a668				; $a03a: 20 68 A6 ; -> sub_A668
	BRK					  ; $a03d: 00	  
	.db $0b			  ; $a03e - Unknown opcode
	.db $cb			  ; $a03f - Unknown opcode
	JSR $09a9				; $a040: 20 A9 09
	JSR $b0d7				; $a043: 20 D7 B0 ; -> sub_B0D7
	JMP $a04c				; $a046: 4C 4C A0
	JSR $a664				; $a049: 20 64 A6 ; -> sub_A664
loc_A04C:
	LDA #$00				 ; $a04c: A9 00   
	STA $e7				  ; $a04e: 85 E7   
	RTS					  ; $a050: 60	  
	LDA #$6d				 ; $a051: A9 6D   
	JSR $b09a				; $a053: 20 9A B0 ; -> sub_B09A
	LDA #$61				 ; $a056: A9 61   
	STA $70				  ; $a058: 85 70   
	LDA #$00				 ; $a05a: A9 00   
	STA $71				  ; $a05c: 85 71   
	LDA #$a8				 ; $a05e: A9 A8   
	BRK					  ; $a060: 00	  
	.db $4b			  ; $a061 - Unknown opcode
	.db $73			  ; $a062 - Unknown opcode
	BRK					  ; $a063: 00	  
	.db $0b			  ; $a064 - Unknown opcode
	.db $cb			  ; $a065 - Unknown opcode
	.db $80			  ; $a066 - Unknown opcode
	RTS					  ; $a067: 60	  
	JSR $b0ae				; $a068: 20 AE B0 ; -> sub_B0AE
	JMP $a495				; $a06b: 4C 95 A4
	JSR $c891				; $a06e: 20 91 C8 ; Call to fixed bank
	STA ptr0_lo			  ; $a071: 85 04   
	LDA #$00				 ; $a073: A9 00   
	STA ptr0_hi			  ; $a075: 85 05   
	STA $fe				  ; $a077: 85 FE   
	STA $ff				  ; $a079: 85 FF   
	LDX #$04				 ; $a07b: A2 04   
	LDA #$0b				 ; $a07d: A9 0B   
	JSR $c851				; $a07f: 20 51 C8 ; Call to fixed bank
	CLC					  ; $a082: 18	  
	ADC #$02				 ; $a083: 69 02	; Arithmetic
	STA $fd				  ; $a085: 85 FD   
	LDA $fe				  ; $a087: A5 FE   
	STA $70				  ; $a089: 85 70   
	LDA $ff				  ; $a08b: A5 FF   
	STA $71				  ; $a08d: 85 71   
	LDA $fd				  ; $a08f: A5 FD   
	BRK					  ; $a091: 00	  
	.db $4b			  ; $a092 - Unknown opcode
	.db $73			  ; $a093 - Unknown opcode
	RTS					  ; $a094: 60	  
	LDA #$08				 ; $a095: A9 08   
	BRK					  ; $a097: 00	  
	.db $07			  ; $a098 - Unknown opcode
	.db $cf			  ; $a099 - Unknown opcode
	JMP $b0ae				; $a09a: 4C AE B0
	LDA #$07				 ; $a09d: A9 07   
	JMP $b0d7				; $a09f: 4C D7 B0
	JSR $a66a				; $a0a2: 20 6A A6 ; -> sub_A66A
	LDA $e0				  ; $a0a5: A5 E0   
	PHA					  ; $a0a7: 48	  
	LDA $e1				  ; $a0a8: A5 E1   
	PHA					  ; $a0aa: 48	  
	JSR $d214				; $a0ab: 20 14 D2 ; Call to fixed bank
	BRK					  ; $a0ae: 00	  
	ORA $8f				  ; $a0af: 05 8F   
	JSR $a6c5				; $a0b1: 20 C5 A6 ; -> sub_A6C5
	JSR $a0ff				; $a0b4: 20 FF A0 ; -> sub_A0FF
	JSR $a4c9				; $a0b7: 20 C9 A4 ; -> sub_A4C9
	PLA					  ; $a0ba: 68	  
	STA $e1				  ; $a0bb: 85 E1   
	PLA					  ; $a0bd: 68	  
	STA $e0				  ; $a0be: 85 E0   
	JSR $a668				; $a0c0: 20 68 A6 ; -> sub_A668
loc_A0C3:
	JSR $9ac9				; $a0c3: 20 C9 9A ; -> sub_9AC9
	BEQ $a0ce				; $a0c6: F0 06   
	JSR $a660				; $a0c8: 20 60 A6 ; -> sub_A660
	JMP $a0c3				; $a0cb: 4C C3 A0
loc_A0CE:
	JSR $a65c				; $a0ce: 20 5C A6 ; -> sub_A65C
	LDA $e1				  ; $a0d1: A5 E1   
	PHA					  ; $a0d3: 48	  
	LDA $e0				  ; $a0d4: A5 E0   
	PHA					  ; $a0d6: 48	  
	LDA #$2a				 ; $a0d7: A9 2A   
	BRK					  ; $a0d9: 00	  
	.db $3a			  ; $a0da - Unknown opcode
	.db $ef			  ; $a0db - Unknown opcode
	PLA					  ; $a0dc: 68	  
	STA $e0				  ; $a0dd: 85 E0   
	PLA					  ; $a0df: 68	  
	STA $e1				  ; $a0e0: 85 E1   
	JSR $a658				; $a0e2: 20 58 A6 ; -> sub_A658
	LDX #$00				 ; $a0e5: A2 00   
	LDA #$11				 ; $a0e7: A9 11   
	STA $7046,X			  ; $a0e9: 9D 46 70
	LDX #$01				 ; $a0ec: A2 01   
	LDA #$22				 ; $a0ee: A9 22   
	STA $7046,X			  ; $a0f0: 9D 46 70
	JSR $d214				; $a0f3: 20 14 D2 ; Call to fixed bank
	JMP $b0ae				; $a0f6: 4C AE B0
	JSR $d214				; $a0f9: 20 14 D2 ; Call to fixed bank
	JSR $a6c5				; $a0fc: 20 C5 A6 ; -> sub_A6C5

; ---- Subroutine at $a0ff (Bank 21) ----
sub_A0FF:
	LDA #$82				 ; $a0ff: A9 82   
	PHA					  ; $a101: 48	  
	LDA #$01				 ; $a102: A9 01   
	STA submap_number		; $a104: 85 64   
	LDA #$04				 ; $a106: A9 04   
	STA $44				  ; $a108: 85 44   
	LDA #$0c				 ; $a10a: A9 0C   
	STA $45				  ; $a10c: 85 45   
	JSR $b03f				; $a10e: 20 3F B0 ; -> sub_B03F
	PLA					  ; $a111: 68	  
	BRK					  ; $a112: 00	  
	AND ($ef),Y			  ; $a113: 31 EF   
	JMP $c5bf				; $a115: 4C BF C5
	LDA $628f				; $a118: AD 8F 62
	AND #$0f				 ; $a11b: 29 0F   
	STA $e3				  ; $a11d: 85 E3   
	LDA $628f				; $a11f: AD 8F 62
	LSR					  ; $a122: 4A	  
	LSR					  ; $a123: 4A	  
	LSR					  ; $a124: 4A	  
	LSR					  ; $a125: 4A	  
	STA $e2				  ; $a126: 85 E2   
	LDA #$00				 ; $a128: A9 00   
	STA $fe				  ; $a12a: 85 FE   
	STA $ff				  ; $a12c: 85 FF   
	JSR $a66a				; $a12e: 20 6A A6 ; -> sub_A66A
	JSR $9ac9				; $a131: 20 C9 9A ; -> sub_9AC9
	BNE $a187				; $a134: D0 51   
	JSR $a668				; $a136: 20 68 A6 ; -> sub_A668
	BRK					  ; $a139: 00	  
	.db $83			  ; $a13a - Unknown opcode
	.db $2b			  ; $a13b - Unknown opcode
	LDA $e2				  ; $a13c: A5 E2   
	LDY #$28				 ; $a13e: A0 28   
	JSR $a1e7				; $a140: 20 E7 A1 ; -> sub_A1E7
	STA $e2				  ; $a143: 85 E2   
	STY $da				  ; $a145: 84 DA   
	LDA $e3				  ; $a147: A5 E3   
	LDY #$06				 ; $a149: A0 06   
	JSR $a1e7				; $a14b: 20 E7 A1 ; -> sub_A1E7
	STA $e3				  ; $a14e: 85 E3   
	STY $db				  ; $a150: 84 DB   
	TYA					  ; $a152: 98	  
	ORA $da				  ; $a153: 05 DA   
	BEQ $a184				; $a155: F0 2D   
	LDA $db				  ; $a157: A5 DB   
	BEQ $a164				; $a159: F0 09   
	JSR $a1db				; $a15b: 20 DB A1 ; -> sub_A1DB
	JSR $a660				; $a15e: 20 60 A6 ; -> sub_A660
	BRK					  ; $a161: 00	  
	.db $83			  ; $a162 - Unknown opcode
	.db $2b			  ; $a163 - Unknown opcode
loc_A164:
	LDA $da				  ; $a164: A5 DA   
	BEQ $a170				; $a166: F0 08   
	STA $fd				  ; $a168: 85 FD   
	JSR $a65c				; $a16a: 20 5C A6 ; -> sub_A65C
	BRK					  ; $a16d: 00	  
	.db $83			  ; $a16e - Unknown opcode
	.db $2b			  ; $a16f - Unknown opcode
loc_A170:
	JSR $a658				; $a170: 20 58 A6 ; -> sub_A658
	LDA $e2				  ; $a173: A5 E2   
	ASL					  ; $a175: 0A	  
	ASL					  ; $a176: 0A	  
	ASL					  ; $a177: 0A	  
	ASL					  ; $a178: 0A	  
	ORA $e3				  ; $a179: 05 E3   
	STA $628f				; $a17b: 8D 8F 62
	CMP #$77				 ; $a17e: C9 77	; Compare with 119
	BEQ $a1c0				; $a180: F0 3E   
	BNE $a187				; $a182: D0 03   
loc_A184:
	JSR $a654				; $a184: 20 54 A6 ; -> sub_A654
loc_A187:
	JSR $a650				; $a187: 20 50 A6 ; -> sub_A650
	LDA $628f				; $a18a: AD 8F 62
	AND #$0f				 ; $a18d: 29 0F   
	STA tmp0				 ; $a18f: 85 00   
	LDA #$07				 ; $a191: A9 07   
	SEC					  ; $a193: 38	  
	SBC tmp0				 ; $a194: E5 00	; Arithmetic
	BEQ $a1a1				; $a196: F0 09   
	JSR $a1db				; $a198: 20 DB A1 ; -> sub_A1DB
	JSR $a660				; $a19b: 20 60 A6 ; -> sub_A660
	BRK					  ; $a19e: 00	  
	.db $83			  ; $a19f - Unknown opcode
	.db $2b			  ; $a1a0 - Unknown opcode
loc_A1A1:
	LDA $628f				; $a1a1: AD 8F 62
	AND #$f0				 ; $a1a4: 29 F0   
	STA tmp0				 ; $a1a6: 85 00   
	LDA #$70				 ; $a1a8: A9 70   
	SEC					  ; $a1aa: 38	  
	SBC tmp0				 ; $a1ab: E5 00	; Arithmetic
	BEQ $a1bb				; $a1ad: F0 0C   
	LSR					  ; $a1af: 4A	  
	LSR					  ; $a1b0: 4A	  
	LSR					  ; $a1b1: 4A	  
	LSR					  ; $a1b2: 4A	  
	STA $fd				  ; $a1b3: 85 FD   
	JSR $a65c				; $a1b5: 20 5C A6 ; -> sub_A65C
	BRK					  ; $a1b8: 00	  
	.db $83			  ; $a1b9 - Unknown opcode
	.db $2b			  ; $a1ba - Unknown opcode
loc_A1BB:
	LDA #$07				 ; $a1bb: A9 07   
	JMP $a66a				; $a1bd: 4C 6A A6
loc_A1C0:
	LDA #$ea				 ; $a1c0: A9 EA   
	STA $70				  ; $a1c2: 85 70   
	LDA #$00				 ; $a1c4: A9 00   
	STA $71				  ; $a1c6: 85 71   
	LDA #$60				 ; $a1c8: A9 60   
	BRK					  ; $a1ca: 00	  
	.db $4b			  ; $a1cb - Unknown opcode
	.db $73			  ; $a1cc - Unknown opcode
	LDA #$08				 ; $a1cd: A9 08   
	JSR $a66a				; $a1cf: 20 6A A6 ; -> sub_A66A
	BRK					  ; $a1d2: 00	  
	ORA $10cb				; $a1d3: 0D CB 10
	LDA #$09				 ; $a1d6: A9 09   
	JMP $a66a				; $a1d8: 4C 6A A6

; ---- Subroutine at $a1db (Bank 21) ----
sub_A1DB:
	CLC					  ; $a1db: 18	  
	ADC #$01				 ; $a1dc: 69 01	; Arithmetic
	STA $0554				; $a1de: 8D 54 05
	LDA #$40				 ; $a1e1: A9 40   
	STA $0555				; $a1e3: 8D 55 05
	RTS					  ; $a1e6: 60	  

; ---- Subroutine at $a1e7 (Bank 21) ----
sub_A1E7:
	STY tmp1				 ; $a1e7: 84 01   
	LDY #$00				 ; $a1e9: A0 00   
	STA tmp0				 ; $a1eb: 85 00   
	CMP #$07				 ; $a1ed: C9 07	; Compare with 7
	BEQ $a209				; $a1ef: F0 18   
loc_A1F1:
	LDA tmp1				 ; $a1f1: A5 01   
	BRK					  ; $a1f3: 00	  
	ROR $73				  ; $a1f4: 66 73   
	BCC $a209				; $a1f6: 90 11   
	TAX					  ; $a1f8: AA	  
	LDA $73				  ; $a1f9: A5 73   
	BRK					  ; $a1fb: 00	  
	.db $2f			  ; $a1fc - Unknown opcode
	.db $73			  ; $a1fd - Unknown opcode
	INY					  ; $a1fe: C8	  
	INC tmp0				 ; $a1ff: E6 00   
	LDA tmp0				 ; $a201: A5 00   
	CMP #$07				 ; $a203: C9 07	; Compare with 7
	BCS $a209				; $a205: B0 02   
	BCC $a1f1				; $a207: 90 E8   
loc_A209:
	LDA tmp0				 ; $a209: A5 00   
	RTS					  ; $a20b: 60	  
	JSR $d218				; $a20c: 20 18 D2 ; Call to fixed bank
	BRK					  ; $a20f: 00	  
	ORA $cb				  ; $a210: 05 CB   
	ORA ($a2,X)			  ; $a212: 01 A2   
	.db $02			  ; $a214 - Unknown opcode
	LDA #$11				 ; $a215: A9 11   
	STA $7046,X			  ; $a217: 9D 46 70
	RTS					  ; $a21a: 60	  
	JSR $9a93				; $a21b: 20 93 9A ; -> sub_9A93
	BNE $a235				; $a21e: D0 15   
	BRK					  ; $a220: 00	  
	.db $23			  ; $a221 - Unknown opcode
	.db $3b			  ; $a222 - Unknown opcode
	JSR $9ac9				; $a223: 20 C9 9A ; -> sub_9AC9
	BEQ $a22b				; $a226: F0 03   
	JMP $a231				; $a228: 4C 31 A2

; ---- Subroutine at $a22b (Bank 21) ----
sub_A22B:
	BRK					  ; $a22b: 00	  
	BIT $3b				  ; $a22c: 24 3B   
	JMP $b830				; $a22e: 4C 30 B8
loc_A231:
	BRK					  ; $a231: 00	  
	AND $3b				  ; $a232: 25 3B   
	RTS					  ; $a234: 60	  
loc_A235:
	BRK					  ; $a235: 00	  
	ROL $3b				  ; $a236: 26 3B   
	JSR $9ac9				; $a238: 20 C9 9A ; -> sub_9AC9
	BEQ $a241				; $a23b: F0 04   
	BRK					  ; $a23d: 00	  
	PLP					  ; $a23e: 28	  
	.db $3b			  ; $a23f - Unknown opcode
loc_A240:
	RTS					  ; $a240: 60	  
loc_A241:
	JMP $a48c				; $a241: 4C 8C A4
	BRK					  ; $a244: 00	  
	ORA $20eb				; $a245: 0D EB 20
	BNE $a240				; $a248: D0 F6   
	BEQ $a252				; $a24a: F0 06   
	JSR $b0ae				; $a24c: 20 AE B0 ; -> sub_B0AE
	JMP $a2c8				; $a24f: 4C C8 A2
loc_A252:
	JSR $a2c8				; $a252: 20 C8 A2 ; -> sub_A2C8
	JMP $990d				; $a255: 4C 0D 99

; ---- Subroutine at $a258 (Bank 21) ----
sub_A258:
	JSR $c891				; $a258: 20 91 C8 ; Call to fixed bank
	STA tmp0				 ; $a25b: 85 00   
	LDA #$00				 ; $a25d: A9 00   
	STA tmp1				 ; $a25f: 85 01   
	LDX #$00				 ; $a261: A2 00   
	LDA $07c4				; $a263: AD C4 07
	JSR $c851				; $a266: 20 51 C8 ; Call to fixed bank
	STA $da				  ; $a269: 85 DA   
	RTS					  ; $a26b: 60	  
loc_A26C:
	LDA $da				  ; $a26c: A5 DA   
	CMP #$03				 ; $a26e: C9 03	; Compare with 3
	BCC $a282				; $a270: 90 10   
	SEC					  ; $a272: 38	  
	SBC #$03				 ; $a273: E9 03	; Arithmetic
	TAX					  ; $a275: AA	  
loc_A276:
	LDA $62e7,X			  ; $a276: BD E7 62
	BNE $a27f				; $a279: D0 04   
	INX					  ; $a27b: E8	  
	JMP $a276				; $a27c: 4C 76 A2
loc_A27F:
	DEC $62e7,X			  ; $a27f: DE E7 62
loc_A282:
	LDA tmp0				 ; $a282: A5 00   
	CLC					  ; $a284: 18	  
	ADC $07c6				; $a285: 6D C6 07 ; Arithmetic
	STA $07c6				; $a288: 8D C6 07
	LDA tmp1				 ; $a28b: A5 01   
	ADC $07c7				; $a28d: 6D C7 07 ; Arithmetic
	STA $07c7				; $a290: 8D C7 07
	LDA tmp2				 ; $a293: A5 02   
	ADC $07c8				; $a295: 6D C8 07 ; Arithmetic
	STA $07c8				; $a298: 8D C8 07
	LDA $07c6				; $a29b: AD C6 07
	CMP #$64				 ; $a29e: C9 64	; Compare with 100
	LDA $07c7				; $a2a0: AD C7 07
	SBC #$00				 ; $a2a3: E9 00	; Arithmetic
	LDA $07c8				; $a2a5: AD C8 07
	SBC #$00				 ; $a2a8: E9 00	; Arithmetic
	BCC $a2c7				; $a2aa: 90 1B   
	BRK					  ; $a2ac: 00	  
	ORA #$cb				 ; $a2ad: 09 CB   
	.db $04			  ; $a2af - Unknown opcode
	LDX #$0e				 ; $a2b0: A2 0E   
	LDA #$11				 ; $a2b2: A9 11   
	STA $7046,X			  ; $a2b4: 9D 46 70
	LDX #$0f				 ; $a2b7: A2 0F   
	LDA $07c6				; $a2b9: AD C6 07
	STA $fd				  ; $a2bc: 85 FD   
	LDA #$00				 ; $a2be: A9 00   
	STA $fe				  ; $a2c0: 85 FE   
	STA $ff				  ; $a2c2: 85 FF   
	JSR $9d92				; $a2c4: 20 92 9D ; -> sub_9D92
loc_A2C7:
	RTS					  ; $a2c7: 60	  

; ---- Subroutine at $a2c8 (Bank 21) ----
sub_A2C8:
	BRK					  ; $a2c8: 00	  
	ORA $20cb				; $a2c9: 0D CB 20
	LDA #$01				 ; $a2cc: A9 01   
	STA $07c5				; $a2ce: 8D C5 07
	BRK					  ; $a2d1: 00	  
	ORA #$cb				 ; $a2d2: 09 CB   
	ORA ($20,X)			  ; $a2d4: 01 20   
	CMP #$a4				 ; $a2d6: C9 A4	; Compare with 164
	JSR $c891				; $a2d8: 20 91 C8 ; Call to fixed bank
	CMP #$30				 ; $a2db: C9 30	; Compare with 48
	BCS $a2e2				; $a2dd: B0 03   
	JMP $a40e				; $a2df: 4C 0E A4
loc_A2E2:
	BRK					  ; $a2e2: 00	  
	AND #$3b				 ; $a2e3: 29 3B   
	JSR $9ac9				; $a2e5: 20 C9 9A ; -> sub_9AC9
	BEQ $a2ee				; $a2e8: F0 04   
	BRK					  ; $a2ea: 00	  
	ROL					  ; $a2eb: 2A	  
	.db $3b			  ; $a2ec - Unknown opcode
	RTS					  ; $a2ed: 60	  
loc_A2EE:
	BRK					  ; $a2ee: 00	  
	.db $2b			  ; $a2ef - Unknown opcode
	.db $3b			  ; $a2f0 - Unknown opcode
	JSR $9ac9				; $a2f1: 20 C9 9A ; -> sub_9AC9
	BEQ $a2fb				; $a2f4: F0 05   
	BRK					  ; $a2f6: 00	  
	BIT $b03b				; $a2f7: 2C 3B B0
	INC $20,X				; $a2fa: F6 20   
	.db $ef			  ; $a2fc - Unknown opcode
	LDA ($a9),Y			  ; $a2fd: B1 A9   
	RTS					  ; $a2ff: 60	  
	JSR $b7b5				; $a300: 20 B5 B7 ; -> sub_B7B5
	JSR $a258				; $a303: 20 58 A2 ; -> sub_A258
	TAX					  ; $a306: AA	  
	LDA $07bd,X			  ; $a307: BD BD 07
	STA $f9				  ; $a30a: 85 F9   
loc_A30C:
	LDA $f9				  ; $a30c: A5 F9   
	STA tmp0				 ; $a30e: 85 00   
	JSR $b2cf				; $a310: 20 CF B2 ; -> sub_B2CF
	JSR $a47c				; $a313: 20 7C A4 ; -> sub_A47C
	BRK					  ; $a316: 00	  
	AND $203b				; $a317: 2D 3B 20
	CMP #$9a				 ; $a31a: C9 9A	; Compare with 154
	BEQ $a33e				; $a31c: F0 20   
	JSR $c891				; $a31e: 20 91 C8 ; Call to fixed bank
	CMP #$40				 ; $a321: C9 40	; Compare with 64
	BCC $a361				; $a323: 90 3C   
	CMP #$80				 ; $a325: C9 80	; Compare with 128
	BCS $a32c				; $a327: B0 03   
	JMP $a394				; $a329: 4C 94 A3
loc_A32C:
	JSR $c891				; $a32c: 20 91 C8 ; Call to fixed bank
	CMP #$80				 ; $a32f: C9 80	; Compare with 128
	BCS $a336				; $a331: B0 03   
	JMP $a3c9				; $a333: 4C C9 A3
loc_A336:
	BRK					  ; $a336: 00	  
	ROL $003b				; $a337: 2E 3B 00
	.db $83			  ; $a33a - Unknown opcode
	.db $2b			  ; $a33b - Unknown opcode
	BCS $a30c				; $a33c: B0 CE   
loc_A33E:
	JSR $c891				; $a33e: 20 91 C8 ; Call to fixed bank
	CMP #$20				 ; $a341: C9 20	; Compare with 32
	BCS $a348				; $a343: B0 03   
	JMP $a3cd				; $a345: 4C CD A3
loc_A348:
	CMP #$40				 ; $a348: C9 40	; Compare with 64
	BCS $a34f				; $a34a: B0 03   
	JMP $a3d1				; $a34c: 4C D1 A3
loc_A34F:
	CMP #$60				 ; $a34f: C9 60	; Compare with 96
	BCS $a356				; $a351: B0 03   
	JMP $a3d5				; $a353: 4C D5 A3
loc_A356:
	BRK					  ; $a356: 00	  
	.db $2f			  ; $a357 - Unknown opcode
	.db $3b			  ; $a358 - Unknown opcode
	LDX #$04				 ; $a359: A2 04   
	JSR $9db8				; $a35b: 20 B8 9D ; -> sub_9DB8
	JMP $a26c				; $a35e: 4C 6C A2
loc_A361:
	JSR $a3ec				; $a361: 20 EC A3 ; -> sub_A3EC
	LDA $de				  ; $a364: A5 DE   
	SEC					  ; $a366: 38	  
	SBC $e1				  ; $a367: E5 E1	; Arithmetic
	STA $fd				  ; $a369: 85 FD   
	LDA $df				  ; $a36b: A5 DF   
	SBC $e2				  ; $a36d: E5 E2	; Arithmetic
	STA $fe				  ; $a36f: 85 FE   
	LDA $e0				  ; $a371: A5 E0   
	SBC $e3				  ; $a373: E5 E3	; Arithmetic
	STA $ff				  ; $a375: 85 FF   
	BRK					  ; $a377: 00	  
	BMI $a3b5				; $a378: 30 3B   
	JSR $9ac9				; $a37a: 20 C9 9A ; -> sub_9AC9
	BNE $a38b				; $a37d: D0 0C   
	LDA #$01				 ; $a37f: A9 01   
	STA tmp0				 ; $a381: 85 00   
	LDA #$00				 ; $a383: A9 00   
	STA tmp1				 ; $a385: 85 01   
	STA tmp2				 ; $a387: 85 02   
	BEQ $a33e				; $a389: F0 B3   
loc_A38B:
	JSR $c891				; $a38b: 20 91 C8 ; Call to fixed bank
	CMP #$80				 ; $a38e: C9 80	; Compare with 128
	BCC $a3c9				; $a390: 90 37   
	BCS $a336				; $a392: B0 A2   
loc_A394:
	JSR $a3ec				; $a394: 20 EC A3 ; -> sub_A3EC
	LDA $de				  ; $a397: A5 DE   
	CLC					  ; $a399: 18	  
	ADC $e1				  ; $a39a: 65 E1	; Arithmetic
	STA $fd				  ; $a39c: 85 FD   
	LDA $df				  ; $a39e: A5 DF   
	ADC $e2				  ; $a3a0: 65 E2	; Arithmetic
	STA $fe				  ; $a3a2: 85 FE   
	LDA $e0				  ; $a3a4: A5 E0   
	ADC $e3				  ; $a3a6: 65 E3	; Arithmetic
	STA $ff				  ; $a3a8: 85 FF   
	BRK					  ; $a3aa: 00	  
	AND ($3b),Y			  ; $a3ab: 31 3B   
	JSR $9ac9				; $a3ad: 20 C9 9A ; -> sub_9AC9
	BEQ $a3b7				; $a3b0: F0 05   
	LDA $f9				  ; $a3b2: A5 F9   
	JMP $a32c				; $a3b4: 4C 2C A3
loc_A3B7:
	JSR $c891				; $a3b7: 20 91 C8 ; Call to fixed bank
	CMP #$40				 ; $a3ba: C9 40	; Compare with 64
	BCS $a3c9				; $a3bc: B0 0B   
	BRK					  ; $a3be: 00	  
	.db $32			  ; $a3bf - Unknown opcode
	.db $3b			  ; $a3c0 - Unknown opcode
	LDX #$03				 ; $a3c1: A2 03   
	JSR $9db8				; $a3c3: 20 B8 9D ; -> sub_9DB8
	JMP $a26c				; $a3c6: 4C 6C A2
loc_A3C9:
	BRK					  ; $a3c9: 00	  
	.db $33			  ; $a3ca - Unknown opcode
	.db $3b			  ; $a3cb - Unknown opcode
	RTS					  ; $a3cc: 60	  
loc_A3CD:
	BRK					  ; $a3cd: 00	  
	AND $3b,X				; $a3ce: 35 3B   
	RTS					  ; $a3d0: 60	  
loc_A3D1:
	BRK					  ; $a3d1: 00	  
	ROL $3b,X				; $a3d2: 36 3B   
	RTS					  ; $a3d4: 60	  
loc_A3D5:
	BRK					  ; $a3d5: 00	  
	.db $37			  ; $a3d6 - Unknown opcode
	.db $3b			  ; $a3d7 - Unknown opcode
	JSR $9ac9				; $a3d8: 20 C9 9A ; -> sub_9AC9
	BEQ $a3e1				; $a3db: F0 04   
	BRK					  ; $a3dd: 00	  
	AND $603b,Y			  ; $a3de: 39 3B 60
loc_A3E1:
	BRK					  ; $a3e1: 00	  
	SEC					  ; $a3e2: 38	  
	.db $3b			  ; $a3e3 - Unknown opcode
	LDX #$04				 ; $a3e4: A2 04   
	JSR $9db8				; $a3e6: 20 B8 9D ; -> sub_9DB8
	JMP $a26c				; $a3e9: 4C 6C A2

; ---- Subroutine at $a3ec (Bank 21) ----
sub_A3EC:
	LDA $fd				  ; $a3ec: A5 FD   
	STA tmp0				 ; $a3ee: 85 00   
	STA $de				  ; $a3f0: 85 DE   
	LDA $fe				  ; $a3f2: A5 FE   
	STA tmp1				 ; $a3f4: 85 01   
	STA $df				  ; $a3f6: 85 DF   
	LDA $ff				  ; $a3f8: A5 FF   
	STA tmp2				 ; $a3fa: 85 02   
	STA $e0				  ; $a3fc: 85 E0   
	JSR $b424				; $a3fe: 20 24 B4 ; -> sub_B424
	LDA tmp0				 ; $a401: A5 00   
	STA $e1				  ; $a403: 85 E1   
	LDA tmp1				 ; $a405: A5 01   
	STA $e2				  ; $a407: 85 E2   
	LDA tmp2				 ; $a409: A5 02   
	STA $e3				  ; $a40b: 85 E3   
	RTS					  ; $a40d: 60	  
loc_A40E:
	BRK					  ; $a40e: 00	  
	AND #$3b				 ; $a40f: 29 3B   
	JSR $9ac9				; $a411: 20 C9 9A ; -> sub_9AC9
	BEQ $a41a				; $a414: F0 04   
	BRK					  ; $a416: 00	  
	.db $3b			  ; $a417 - Unknown opcode
	.db $3b			  ; $a418 - Unknown opcode
	RTS					  ; $a419: 60	  
loc_A41A:
	BRK					  ; $a41a: 00	  
	.db $3c			  ; $a41b - Unknown opcode
	.db $3b			  ; $a41c - Unknown opcode
	JSR $9ac9				; $a41d: 20 C9 9A ; -> sub_9AC9
	BEQ $a426				; $a420: F0 04   
	BRK					  ; $a422: 00	  
	AND $603b,X			  ; $a423: 3D 3B 60
loc_A426:
	JSR $c891				; $a426: 20 91 C8 ; Call to fixed bank
	CMP #$08				 ; $a429: C9 08	; Compare with 8
	BCC $a441				; $a42b: 90 14   
	JSR $c891				; $a42d: 20 91 C8 ; Call to fixed bank
	STA tmp0				 ; $a430: 85 00   
	LDA #$00				 ; $a432: A9 00   
	STA tmp1				 ; $a434: 85 01   
	LDX #$00				 ; $a436: A2 00   
	LDA #$05				 ; $a438: A9 05   
	JSR $c851				; $a43a: 20 51 C8 ; Call to fixed bank
	TAX					  ; $a43d: AA	  
	JMP $a443				; $a43e: 4C 43 A4
loc_A441:
	LDX #$05				 ; $a441: A2 05   
loc_A443:
	LDA $a476,X			  ; $a443: BD 76 A4
	STX $da				  ; $a446: 86 DA   
	STA $f9				  ; $a448: 85 F9   
	STA tmp0				 ; $a44a: 85 00   
	JSR $b35f				; $a44c: 20 5F B3 ; -> sub_B35F
	JSR $a47c				; $a44f: 20 7C A4 ; -> sub_A47C
	BRK					  ; $a452: 00	  
	ROL $203b,X			  ; $a453: 3E 3B 20
	CMP #$9a				 ; $a456: C9 9A	; Compare with 154
	BEQ $a45e				; $a458: F0 04   
	BRK					  ; $a45a: 00	  
	.db $3f			  ; $a45b - Unknown opcode
	.db $3b			  ; $a45c - Unknown opcode
	RTS					  ; $a45d: 60	  
loc_A45E:
	LDA $da				  ; $a45e: A5 DA   
	CMP #$03				 ; $a460: C9 03	; Compare with 3
	BCC $a472				; $a462: 90 0E   
	SEC					  ; $a464: 38	  
	SBC #$03				 ; $a465: E9 03	; Arithmetic
	TAX					  ; $a467: AA	  
	INC $62e7,X			  ; $a468: FE E7 62
	BNE $a472				; $a46b: D0 05   
	LDA #$ff				 ; $a46d: A9 FF   
	STA $62e7,X			  ; $a46f: 9D E7 62
loc_A472:
	BRK					  ; $a472: 00	  
	RTI					  ; $a473: 40	  
	.db $3b			  ; $a474 - Unknown opcode
	RTS					  ; $a475: 60	  
	ORA (tmp2,X)			 ; $a476: 01 02   
	ORA #$0b				 ; $a478: 09 0B   
	.db $04			  ; $a47a - Unknown opcode
	.db $23			  ; $a47b - Unknown opcode

; ---- Subroutine at $a47c (Bank 21) ----
sub_A47C:
	LDA tmp0				 ; $a47c: A5 00   
	STA $fd				  ; $a47e: 85 FD   
	LDA tmp1				 ; $a480: A5 01   
	STA $fe				  ; $a482: 85 FE   
	LDA tmp2				 ; $a484: A5 02   
	STA $ff				  ; $a486: 85 FF   
	RTS					  ; $a488: 60	  
	JSR $b0ae				; $a489: 20 AE B0 ; -> sub_B0AE

; ---- Subroutine at $a48c (Bank 21) ----
sub_A48C:
	JSR $a49e				; $a48c: 20 9E A4 ; -> sub_A49E
	JSR $b0ae				; $a48f: 20 AE B0 ; -> sub_B0AE
	JMP $d218				; $a492: 4C 18 D2
loc_A495:
	JSR $a49e				; $a495: 20 9E A4 ; -> sub_A49E
	JSR $b0ae				; $a498: 20 AE B0 ; -> sub_B0AE
	JMP $d210				; $a49b: 4C 10 D2

; ---- Subroutine at $a49e (Bank 21) ----
sub_A49E:
	LDX $e8				  ; $a49e: A6 E8   
	LDA #$11				 ; $a4a0: A9 11   
	STA $7040,X			  ; $a4a2: 9D 40 70
	RTS					  ; $a4a5: 60	  
	LDA #$05				 ; $a4a6: A9 05   
	BRK					  ; $a4a8: 00	  
	.db $07			  ; $a4a9 - Unknown opcode
	.db $cf			  ; $a4aa - Unknown opcode
	JMP $b0b2				; $a4ab: 4C B2 B0
	LDA #$04				 ; $a4ae: A9 04   
	BRK					  ; $a4b0: 00	  
	.db $07			  ; $a4b1 - Unknown opcode
	.db $cf			  ; $a4b2 - Unknown opcode
	JMP $b0b2				; $a4b3: 4C B2 B0
loc_A4B6:
	BRK					  ; $a4b6: 00	  
	.db $07			  ; $a4b7 - Unknown opcode
	.db $df			  ; $a4b8 - Unknown opcode
	RTS					  ; $a4b9: 60	  
	JSR $a4c9				; $a4ba: 20 C9 A4 ; -> sub_A4C9
	BRK					  ; $a4bd: 00	  
	.db $04			  ; $a4be - Unknown opcode
	.db $3b			  ; $a4bf - Unknown opcode
	BRK					  ; $a4c0: 00	  
	.db $42			  ; $a4c1 - Unknown opcode
	.db $3b			  ; $a4c2 - Unknown opcode
	JSR $c8cc				; $a4c3: 20 CC C8 ; Call to fixed bank
	JMP $d1f3				; $a4c6: 4C F3 D1

; ---- Subroutine at $a4c9 (Bank 21) ----
sub_A4C9:
	LDA tmp0				 ; $a4c9: A5 00   
	PHA					  ; $a4cb: 48	  
	LDA tmp1				 ; $a4cc: A5 01   
	PHA					  ; $a4ce: 48	  
	LDA #$43				 ; $a4cf: A9 43   
	JSR $b7b5				; $a4d1: 20 B5 B7 ; -> sub_B7B5
	BRK					  ; $a4d4: 00	  
	ORA $6f				  ; $a4d5: 05 6F   
	PLA					  ; $a4d7: 68	  
	STA tmp1				 ; $a4d8: 85 01   
	PLA					  ; $a4da: 68	  
	STA tmp0				 ; $a4db: 85 00   
	RTS					  ; $a4dd: 60	  
	BRK					  ; $a4de: 00	  
	ORA $cb				  ; $a4df: 05 CB   
	PHP					  ; $a4e1: 08	  
	BRK					  ; $a4e2: 00	  
	ASL $40cb				; $a4e3: 0E CB 40
	LDX #$01				 ; $a4e6: A2 01   
	LDA #$11				 ; $a4e8: A9 11   
	STA $7046,X			  ; $a4ea: 9D 46 70
	JMP $b0b6				; $a4ed: 4C B6 B0
	LDA #$77				 ; $a4f0: A9 77   
	JSR $b089				; $a4f2: 20 89 B0 ; -> sub_B089
	BCS $a4fd				; $a4f5: B0 06   
	JSR $a664				; $a4f7: 20 64 A6 ; -> sub_A664
	JMP $a668				; $a4fa: 4C 68 A6
loc_A4FD:
	BRK					  ; $a4fd: 00	  
	ROR					  ; $a4fe: 6A	  
	.db $3b			  ; $a4ff - Unknown opcode
	RTS					  ; $a500: 60	  
	JSR $a664				; $a501: 20 64 A6 ; -> sub_A664
loc_A504:
	JSR $9ac9				; $a504: 20 C9 9A ; -> sub_9AC9
	BEQ $a50f				; $a507: F0 06   
	JSR $a668				; $a509: 20 68 A6 ; -> sub_A668
	JMP $a504				; $a50c: 4C 04 A5
loc_A50F:
	JSR $a660				; $a50f: 20 60 A6 ; -> sub_A660
	LDA #$56				 ; $a512: A9 56   
	JSR $b09a				; $a514: 20 9A B0 ; -> sub_B09A
	BRK					  ; $a517: 00	  
	ORA $cb				  ; $a518: 05 CB   
	.db $04			  ; $a51a - Unknown opcode
	LDA #$06				 ; $a51b: A9 06   
	BRK					  ; $a51d: 00	  
	.db $07			  ; $a51e - Unknown opcode
	.db $cf			  ; $a51f - Unknown opcode
	RTS					  ; $a520: 60	  
	JSR $a664				; $a521: 20 64 A6 ; -> sub_A664
	JSR $9ac9				; $a524: 20 C9 9A ; -> sub_9AC9
	BEQ $a52c				; $a527: F0 03   
	JMP $a668				; $a529: 4C 68 A6
loc_A52C:
	LDA #$05				 ; $a52c: A9 05   
	BRK					  ; $a52e: 00	  
	.db $63			  ; $a52f - Unknown opcode
	.db $73			  ; $a530 - Unknown opcode
	TAX					  ; $a531: AA	  
	BRK					  ; $a532: 00	  
	AND $d053				; $a533: 2D 53 D0
	.db $03			  ; $a536 - Unknown opcode
	JMP $a660				; $a537: 4C 60 A6
	JSR $a65c				; $a53a: 20 5C A6 ; -> sub_A65C
	LDA #$05				 ; $a53d: A9 05   
	BRK					  ; $a53f: 00	  
	.db $63			  ; $a540 - Unknown opcode
	.db $73			  ; $a541 - Unknown opcode
	TAX					  ; $a542: AA	  
	LDA #$1f				 ; $a543: A9 1F   
	JSR $b7b5				; $a545: 20 B5 B7 ; -> sub_B7B5
	CMP #$ff				 ; $a548: C9 FF	; Compare with 255
	BNE $a54f				; $a54a: D0 03   
	JMP $a5e1				; $a54c: 4C E1 A5
loc_A54F:
	STA $e3				  ; $a54f: 85 E3   
	LDA #$05				 ; $a551: A9 05   
	BRK					  ; $a553: 00	  
	.db $63			  ; $a554 - Unknown opcode
	.db $73			  ; $a555 - Unknown opcode
	TAX					  ; $a556: AA	  
	LDA $e3				  ; $a557: A5 E3   
	BRK					  ; $a559: 00	  
	BIT $8573				; $a55a: 2C 73 85
	.db $e2			  ; $a55d - Unknown opcode
	BRK					  ; $a55e: 00	  
	.db $0b			  ; $a55f - Unknown opcode
	.db $0f			  ; $a560 - Unknown opcode
	CPX #$01				 ; $a561: E0 01   
	BEQ $a573				; $a563: F0 0E   
	CPX #$02				 ; $a565: E0 02   
	BEQ $a573				; $a567: F0 0A   
	CPX #$03				 ; $a569: E0 03   
	BEQ $a573				; $a56b: F0 06   
	JSR $a658				; $a56d: 20 58 A6 ; -> sub_A658
	JMP $a5cf				; $a570: 4C CF A5
loc_A573:
	LDA $e2				  ; $a573: A5 E2   
	BRK					  ; $a575: 00	  
	.db $0f			  ; $a576 - Unknown opcode
	.db $0f			  ; $a577 - Unknown opcode
	BCC $a582				; $a578: 90 08   
	LDA #$08				 ; $a57a: A9 08   
	JSR $a66a				; $a57c: 20 6A A6 ; -> sub_A66A
	JMP $a5cf				; $a57f: 4C CF A5
loc_A582:
	LDA $e2				  ; $a582: A5 E2   
	STA $f9				  ; $a584: 85 F9   
	STA tmp0				 ; $a586: 85 00   
	JSR $b2cf				; $a588: 20 CF B2 ; -> sub_B2CF
	JSR $a47c				; $a58b: 20 7C A4 ; -> sub_A47C
	LDA #$00				 ; $a58e: A9 00   
	STA ptr0_hi			  ; $a590: 85 05   
	JSR $c891				; $a592: 20 91 C8 ; Call to fixed bank
	CMP #$08				 ; $a595: C9 08	; Compare with 8
	BCC $a59f				; $a597: 90 06   
	JSR $a5e4				; $a599: 20 E4 A5 ; -> sub_A5E4
	JMP $a5a2				; $a59c: 4C A2 A5
loc_A59F:
	JSR $a5fa				; $a59f: 20 FA A5 ; -> sub_A5FA
loc_A5A2:
	LDA $fd				  ; $a5a2: A5 FD   
	STA $6f				  ; $a5a4: 85 6F   
	LDA $fe				  ; $a5a6: A5 FE   
	STA $70				  ; $a5a8: 85 70   
	LDA $ff				  ; $a5aa: A5 FF   
	STA $71				  ; $a5ac: 85 71   
	JSR $a654				; $a5ae: 20 54 A6 ; -> sub_A654
	JSR $9ac9				; $a5b1: 20 C9 9A ; -> sub_9AC9
	BEQ $a5be				; $a5b4: F0 08   
	JSR $a64c				; $a5b6: 20 4C A6 ; -> sub_A64C
	BRK					  ; $a5b9: 00	  
	.db $83			  ; $a5ba - Unknown opcode
	.db $2b			  ; $a5bb - Unknown opcode
	BCS $a5cf				; $a5bc: B0 11   
loc_A5BE:
	JSR $a650				; $a5be: 20 50 A6 ; -> sub_A650
	BRK					  ; $a5c1: 00	  
	.db $4b			  ; $a5c2 - Unknown opcode
	.db $33			  ; $a5c3 - Unknown opcode
	LDA #$05				 ; $a5c4: A9 05   
	BRK					  ; $a5c6: 00	  
	.db $63			  ; $a5c7 - Unknown opcode
	.db $73			  ; $a5c8 - Unknown opcode
	TAX					  ; $a5c9: AA	  
	LDA $e3				  ; $a5ca: A5 E3   
	BRK					  ; $a5cc: 00	  
	.db $2f			  ; $a5cd - Unknown opcode
	.db $73			  ; $a5ce - Unknown opcode
loc_A5CF:
	LDA #$09				 ; $a5cf: A9 09   
	JSR $a66a				; $a5d1: 20 6A A6 ; -> sub_A66A
	JSR $9ac9				; $a5d4: 20 C9 9A ; -> sub_9AC9
	BNE $a5dc				; $a5d7: D0 03   
	JMP $a52c				; $a5d9: 4C 2C A5
loc_A5DC:
	LDA #$0a				 ; $a5dc: A9 0A   
	JMP $a66a				; $a5de: 4C 6A A6
loc_A5E1:
	JMP $a64c				; $a5e1: 4C 4C A6

; ---- Subroutine at $a5e4 (Bank 21) ----
sub_A5E4:
	JSR $c891				; $a5e4: 20 91 C8 ; Call to fixed bank
	STA ptr0_lo			  ; $a5e7: 85 04   
	LDX #$04				 ; $a5e9: A2 04   
	LDA #$00				 ; $a5eb: A9 00   
	STA ptr0_hi			  ; $a5ed: 85 05   
	LDA #$1b				 ; $a5ef: A9 1B   
	JSR $c827				; $a5f1: 20 27 C8 ; Call to fixed bank
	CLC					  ; $a5f4: 18	  
	ADC #$36				 ; $a5f5: 69 36	; Arithmetic
	JMP $a60d				; $a5f7: 4C 0D A6

; ---- Subroutine at $a5fa (Bank 21) ----
sub_A5FA:
	JSR $c891				; $a5fa: 20 91 C8 ; Call to fixed bank
	STA ptr0_lo			  ; $a5fd: 85 04   
	LDA #$00				 ; $a5ff: A9 00   
	STA ptr0_hi			  ; $a601: 85 05   
	LDX #$04				 ; $a603: A2 04   
	LDA #$21				 ; $a605: A9 21   
	JSR $c827				; $a607: 20 27 C8 ; Call to fixed bank
	CLC					  ; $a60a: 18	  
	ADC #$60				 ; $a60b: 69 60	; Arithmetic

; ---- Subroutine at $a60d (Bank 21) ----
sub_A60D:
	LDX #$fd				 ; $a60d: A2 FD   
	BRK					  ; $a60f: 00	  
	BPL $a651				; $a610: 10 3F   
	LDX #$06				 ; $a612: A2 06   
loc_A614:
	LSR $1a				  ; $a614: 46 1A   
	ROR $ff				  ; $a616: 66 FF   
	ROR $fe				  ; $a618: 66 FE   
	ROR $fd				  ; $a61a: 66 FD   
	DEX					  ; $a61c: CA	  
	BNE $a614				; $a61d: D0 F5   
	LDA $ff				  ; $a61f: A5 FF   
	ORA $fe				  ; $a621: 05 FE   
	ORA $fd				  ; $a623: 05 FD   
	ORA $1a				  ; $a625: 05 1A   
	BNE $a62b				; $a627: D0 02   
	INC $fd				  ; $a629: E6 FD   
loc_A62B:
	RTS					  ; $a62b: 60	  
	LDA #$00				 ; $a62c: A9 00   
	STA $71				  ; $a62e: 85 71   
	LDA #$ea				 ; $a630: A9 EA   
	STA $70				  ; $a632: 85 70   
	LDA #$60				 ; $a634: A9 60   
	BRK					  ; $a636: 00	  
	JMP $9073				; $a637: 4C 73 90
	ASL $0c00				; $a63a: 0E 00 0C
	.db $cb			  ; $a63d - Unknown opcode
	RTI					  ; $a63e: 40	  
	BRK					  ; $a63f: 00	  
	ASL					  ; $a640: 0A	  
	.db $cb			  ; $a641 - Unknown opcode
	BPL $a664				; $a642: 10 20   
	PLA					  ; $a644: 68	  
	LDX $4c				  ; $a645: A6 4C   
	RTS					  ; $a647: 60	  
	LDX $4c				  ; $a648: A6 4C   
	.db $64			  ; $a64a - Unknown opcode
	LDX $a9				  ; $a64b: A6 A9   
	.db $07			  ; $a64d - Unknown opcode
	BNE $a66a				; $a64e: D0 1A   

; ---- Subroutine at $a650 (Bank 21) ----
sub_A650:
	LDA #$06				 ; $a650: A9 06   
	BNE $a66a				; $a652: D0 16   

; ---- Subroutine at $a654 (Bank 21) ----
sub_A654:
	LDA #$05				 ; $a654: A9 05   
	BNE $a66a				; $a656: D0 12   

; ---- Subroutine at $a658 (Bank 21) ----
sub_A658:
	LDA #$04				 ; $a658: A9 04   
	BNE $a66a				; $a65a: D0 0E   

; ---- Subroutine at $a65c (Bank 21) ----
sub_A65C:
	LDA #$03				 ; $a65c: A9 03   
	BNE $a66a				; $a65e: D0 0A   

; ---- Subroutine at $a660 (Bank 21) ----
sub_A660:
	LDA #$02				 ; $a660: A9 02   
	BNE $a66a				; $a662: D0 06   

; ---- Subroutine at $a664 (Bank 21) ----
sub_A664:
	LDA #$00				 ; $a664: A9 00   
	BEQ $a66a				; $a666: F0 02   

; ---- Subroutine at $a668 (Bank 21) ----
sub_A668:
	LDA #$01				 ; $a668: A9 01   

; ---- Subroutine at $a66a (Bank 21) ----
sub_A66A:
	STA $0f				  ; $a66a: 85 0F   
	LDA $e0				  ; $a66c: A5 E0   
	CLC					  ; $a66e: 18	  
	ADC $0f				  ; $a66f: 65 0F	; Arithmetic
	LDX $e1				  ; $a671: A6 E1   
loc_A673:
	BCC $a676				; $a673: 90 01   
	INX					  ; $a675: E8	  
loc_A676:
	JMP $9919				; $a676: 4C 19 99
	LDA #$0e				 ; $a679: A9 0E   
	STA $44				  ; $a67b: 85 44   
	LDA #$05				 ; $a67d: A9 05   
	STA $45				  ; $a67f: 85 45   
	LDA #$82				 ; $a681: A9 82   
	BNE $a689				; $a683: D0 04   
	LDA $3d				  ; $a685: A5 3D   
	ORA #$80				 ; $a687: 09 80   
loc_A689:
	STA $dd				  ; $a689: 85 DD   
	JSR $d210				; $a68b: 20 10 D2 ; Call to fixed bank
	JSR $a6bc				; $a68e: 20 BC A6 ; -> sub_A6BC
	JMP $a6a9				; $a691: 4C A9 A6

; ---- Subroutine at $a694 (Bank 21) ----
sub_A694:
	LDA map_number		   ; $a694: A5 63   
	CMP #$19				 ; $a696: C9 19	; Compare with 25
	BNE $a6a3				; $a698: D0 09   
	LDA submap_number		; $a69a: A5 64   
	CMP #$01				 ; $a69c: C9 01	; Compare with 1
	BNE $a6a3				; $a69e: D0 03   
	JMP $aff0				; $a6a0: 4C F0 AF
loc_A6A3:
	JSR $a6bc				; $a6a3: 20 BC A6 ; -> sub_A6BC
loc_A6A6:
	JSR $a6b7				; $a6a6: 20 B7 A6 ; -> sub_A6B7

; ---- Subroutine at $a6a9 (Bank 21) ----
sub_A6A9:
	LDA #$43				 ; $a6a9: A9 43   
	JSR $b7b5				; $a6ab: 20 B5 B7 ; -> sub_B7B5
	BRK					  ; $a6ae: 00	  
	ORA $6f				  ; $a6af: 05 6F   
	JSR $b03f				; $a6b1: 20 3F B0 ; -> sub_B03F
	JMP $c5bf				; $a6b4: 4C BF C5

; ---- Subroutine at $a6b7 (Bank 21) ----
sub_A6B7:
	LDA #$07				 ; $a6b7: A9 07   
	JMP $b7b5				; $a6b9: 4C B5 B7

; ---- Subroutine at $a6bc (Bank 21) ----
sub_A6BC:
	LDA $dd				  ; $a6bc: A5 DD   
	PHA					  ; $a6be: 48	  
	JSR $aea6				; $a6bf: 20 A6 AE ; -> sub_AEA6
	PLA					  ; $a6c2: 68	  
	STA $dd				  ; $a6c3: 85 DD   

; ---- Subroutine at $a6c5 (Bank 21) ----
sub_A6C5:
	LDX #$00				 ; $a6c5: A2 00   
loc_A6C7:
	LDA $da,X				; $a6c7: B5 DA   
	PHA					  ; $a6c9: 48	  
	INX					  ; $a6ca: E8	  
	CPX #$10				 ; $a6cb: E0 10   
	BCC $a6c7				; $a6cd: 90 F8   
	JSR $a732				; $a6cf: 20 32 A7 ; -> sub_A732
	JSR $a738				; $a6d2: 20 38 A7 ; -> sub_A738
	BRK					  ; $a6d5: 00	  
	.db $0f			  ; $a6d6 - Unknown opcode
	.db $fb			  ; $a6d7 - Unknown opcode
	LDA #$28				 ; $a6d8: A9 28   
	STA $62ed				; $a6da: 8D ED 62
	BRK					  ; $a6dd: 00	  
	BRK					  ; $a6de: 00	  
	.db $e7			  ; $a6df - Unknown opcode
	LDA $dd				  ; $a6e0: A5 DD   
	AND #$03				 ; $a6e2: 29 03   
	STA $3d				  ; $a6e4: 85 3D   
	LDA $dd				  ; $a6e6: A5 DD   
	AND #$83				 ; $a6e8: 29 83   
	BRK					  ; $a6ea: 00	  
	.db $3c			  ; $a6eb - Unknown opcode
	.db $ef			  ; $a6ec - Unknown opcode
	JSR $9f79				; $a6ed: 20 79 9F ; -> sub_9F79
	BRK					  ; $a6f0: 00	  
	ASL					  ; $a6f1: 0A	  
	.db $6f			  ; $a6f2 - Unknown opcode
	JSR $a728				; $a6f3: 20 28 A7 ; -> sub_A728
	LDX #$0f				 ; $a6f6: A2 0F   
loc_A6F8:
	PLA					  ; $a6f8: 68	  
	STA $da,X				; $a6f9: 95 DA   
	DEX					  ; $a6fb: CA	  
	BPL $a6f8				; $a6fc: 10 FA   
	RTS					  ; $a6fe: 60	  

; ---- Subroutine at $a6ff (Bank 21) ----
sub_A6FF:
	LDX #$00				 ; $a6ff: A2 00   
loc_A701:
	LDA $da,X				; $a701: B5 DA   
	PHA					  ; $a703: 48	  
	INX					  ; $a704: E8	  
	CPX #$10				 ; $a705: E0 10   
	BCC $a701				; $a707: 90 F8   
	JSR $a732				; $a709: 20 32 A7 ; -> sub_A732
	BRK					  ; $a70c: 00	  
	.db $0f			  ; $a70d - Unknown opcode
	.db $fb			  ; $a70e - Unknown opcode
	JSR $aea6				; $a70f: 20 A6 AE ; -> sub_AEA6
	LDA #$28				 ; $a712: A9 28   
	STA $62ed				; $a714: 8D ED 62
	JSR $9f79				; $a717: 20 79 9F ; -> sub_9F79
	JSR $a728				; $a71a: 20 28 A7 ; -> sub_A728
	LDX #$0f				 ; $a71d: A2 0F   
loc_A71F:
	PLA					  ; $a71f: 68	  
	STA $da,X				; $a720: 95 DA   
	DEX					  ; $a722: CA	  
	BPL $a71f				; $a723: 10 FA   
	JMP $a6a6				; $a725: 4C A6 A6

; ---- Subroutine at $a728 (Bank 21) ----
sub_A728:
	BRK					  ; $a728: 00	  
	PLP					  ; $a729: 28	  
	.db $0f			  ; $a72a - Unknown opcode
	LDA $0514				; $a72b: AD 14 05
	STA $05fd				; $a72e: 8D FD 05
	RTS					  ; $a731: 60	  

; ---- Subroutine at $a732 (Bank 21) ----
sub_A732:
	BRK					  ; $a732: 00	  
	.db $04			  ; $a733 - Unknown opcode
	.db $9f			  ; $a734 - Unknown opcode
	JMP $c5c5				; $a735: 4C C5 C5

; ---- Subroutine at $a738 (Bank 21) ----
sub_A738:
	LDA $615a				; $a738: AD 5A 61
	CMP #$04				 ; $a73b: C9 04	; Compare with 4
	BNE $a74b				; $a73d: D0 0C   
	LDA map_number		   ; $a73f: A5 63   
	CMP #$12				 ; $a741: C9 12	; Compare with 18
	BNE $a74b				; $a743: D0 06   
	LDA submap_number		; $a745: A5 64   
	CMP #$00				 ; $a747: C9 00	; Compare with 0
	BEQ $a74c				; $a749: F0 01   
loc_A74B:
	RTS					  ; $a74b: 60	  
loc_A74C:
	LDA $dd				  ; $a74c: A5 DD   
	PHA					  ; $a74e: 48	  
	LDA submap_number		; $a74f: A5 64   
	PHA					  ; $a751: 48	  
	LDA map_number		   ; $a752: A5 63   
	PHA					  ; $a754: 48	  
	LDA #$1c				 ; $a755: A9 1C   
	STA $dd				  ; $a757: 85 DD   
	BRK					  ; $a759: 00	  
	.db $07			  ; $a75a - Unknown opcode
	.db $cf			  ; $a75b - Unknown opcode
	PLA					  ; $a75c: 68	  
	STA map_number		   ; $a75d: 85 63   
	PLA					  ; $a75f: 68	  
	STA submap_number		; $a760: 85 64   
	BRK					  ; $a762: 00	  
	AND ($ef),Y			  ; $a763: 31 EF   
	PLA					  ; $a765: 68	  
	STA $dd				  ; $a766: 85 DD   
	RTS					  ; $a768: 60	  

; ---- Subroutine at $a769 (Bank 21) ----
sub_A769:
	BRK					  ; $a769: 00	  
	ROR $73				  ; $a76a: 66 73   
	BCC $a771				; $a76c: 90 03   
	LDA #$00				 ; $a76e: A9 00   
	RTS					  ; $a770: 60	  
loc_A771:
	LDA #$01				 ; $a771: A9 01   
	RTS					  ; $a773: 60	  

; ---- Subroutine at $a774 (Bank 21) ----
sub_A774:
	BRK					  ; $a774: 00	  
	.db $63			  ; $a775 - Unknown opcode
	.db $73			  ; $a776 - Unknown opcode
	TAX					  ; $a777: AA	  
	BRK					  ; $a778: 00	  
	AND $c973				; $a779: 2D 73 C9
	PHP					  ; $a77c: 08	  
	RTS					  ; $a77d: 60	  
	STA $0f				  ; $a77e: 85 0F   
	TXA					  ; $a780: 8A	  
	PHA					  ; $a781: 48	  
	BRK					  ; $a782: 00	  
	.db $62			  ; $a783 - Unknown opcode
	.db $33			  ; $a784 - Unknown opcode
	TAX					  ; $a785: AA	  
loc_A786:
	DEX					  ; $a786: CA	  
	BMI $a792				; $a787: 30 09   
	BRK					  ; $a789: 00	  
	.db $2b			  ; $a78a - Unknown opcode
	.db $73			  ; $a78b - Unknown opcode
	CMP $0f				  ; $a78c: C5 0F   
	BNE $a786				; $a78e: D0 F6   
	STX $0f				  ; $a790: 86 0F   
loc_A792:
	PLA					  ; $a792: 68	  
	TAX					  ; $a793: AA	  
	LDA $0f				  ; $a794: A5 0F   
	RTS					  ; $a796: 60	  
	BRK					  ; $a797: 00	  
	EOR $3b,X				; $a798: 55 3B   
loc_A79A:
	JSR $b046				; $a79a: 20 46 B0 ; -> sub_B046
	BRK					  ; $a79d: 00	  
	LSR $3b,X				; $a79e: 56 3B   
	JSR $a841				; $a7a0: 20 41 A8 ; -> sub_A841
	BCC $a7a8				; $a7a3: 90 03   
	JMP $a823				; $a7a5: 4C 23 A8
loc_A7A8:
	JSR $a85c				; $a7a8: 20 5C A8 ; -> sub_A85C
	STA $fd				  ; $a7ab: 85 FD   
	LDA #$00				 ; $a7ad: A9 00   
	STA $fe				  ; $a7af: 85 FE   
	STA $ff				  ; $a7b1: 85 FF   
	BRK					  ; $a7b3: 00	  
	AND $204b				; $a7b4: 2D 4B 20
	.db $b7			  ; $a7b7 - Unknown opcode
	LDX $a2				  ; $a7b8: A6 A2   
	SBC $62a9,X			  ; $a7ba: FD A9 62 ; Arithmetic
	JSR $b7b5				; $a7bd: 20 B5 B7 ; -> sub_B7B5
	CMP #$ff				 ; $a7c0: C9 FF	; Compare with 255
	BEQ $a835				; $a7c2: F0 71   
	LDA $fd				  ; $a7c4: A5 FD   
	ORA $fe				  ; $a7c6: 05 FE   
	ORA $ff				  ; $a7c8: 05 FF   
	BEQ $a835				; $a7ca: F0 69   
	LDA $fd				  ; $a7cc: A5 FD   
	STA $e2				  ; $a7ce: 85 E2   
	LDA $fe				  ; $a7d0: A5 FE   
	STA $e3				  ; $a7d2: 85 E3   
	LDA $ff				  ; $a7d4: A5 FF   
	STA $e4				  ; $a7d6: 85 E4   
	BRK					  ; $a7d8: 00	  
	.db $57			  ; $a7d9 - Unknown opcode
	.db $3b			  ; $a7da - Unknown opcode
	LDX #$fd				 ; $a7db: A2 FD   
	JSR $a85c				; $a7dd: 20 5C A8 ; -> sub_A85C
	BRK					  ; $a7e0: 00	  
	BPL $a822				; $a7e1: 10 3F   
	JSR $e52c				; $a7e3: 20 2C E5 ; Call to fixed bank
	BRK					  ; $a7e6: 00	  
	STA $203b				; $a7e7: 8D 3B 20
	CMP #$9a				 ; $a7ea: C9 9A	; Compare with 154
	BNE $a79a				; $a7ec: D0 AC   
	JSR $a84e				; $a7ee: 20 4E A8 ; -> sub_A84E
	BCC $a82f				; $a7f1: 90 3C   
	LDA $e2				  ; $a7f3: A5 E2   
	CLC					  ; $a7f5: 18	  
	ADC $62ad				; $a7f6: 6D AD 62 ; Arithmetic
	STA $fd				  ; $a7f9: 85 FD   
	LDA $e3				  ; $a7fb: A5 E3   
	ADC $62ae				; $a7fd: 6D AE 62 ; Arithmetic
	STA $fe				  ; $a800: 85 FE   
	LDA $e4				  ; $a802: A5 E4   
	ADC $62af				; $a804: 6D AF 62 ; Arithmetic
	STA $ff				  ; $a807: 85 FF   
	JSR $a83a				; $a809: 20 3A A8 ; -> sub_A83A
	BCS $a828				; $a80c: B0 1A   
	BRK					  ; $a80e: 00	  
	CLI					  ; $a80f: 58	  
	.db $3b			  ; $a810 - Unknown opcode
	LDA $fd				  ; $a811: A5 FD   
	STA $62ad				; $a813: 8D AD 62
	LDA $fe				  ; $a816: A5 FE   
	STA $62ae				; $a818: 8D AE 62
	LDA $ff				  ; $a81b: A5 FF   
	STA $62af				; $a81d: 8D AF 62
loc_A820:
	JMP $a6b7				; $a820: 4C B7 A6
loc_A823:
	BRK					  ; $a823: 00	  
	.db $83			  ; $a824 - Unknown opcode
	.db $2b			  ; $a825 - Unknown opcode
	BCS $a82b				; $a826: B0 03   
loc_A828:
	BRK					  ; $a828: 00	  
	.db $4b			  ; $a829 - Unknown opcode
	.db $33			  ; $a82a - Unknown opcode
loc_A82B:
	BRK					  ; $a82b: 00	  
	CMP $4b,X				; $a82c: D5 4B   
	RTS					  ; $a82e: 60	  
loc_A82F:
	BRK					  ; $a82f: 00	  
	EOR $4c3b,Y			  ; $a830: 59 3B 4C
	TXS					  ; $a833: 9A	  
	.db $a7			  ; $a834 - Unknown opcode
loc_A835:
	BRK					  ; $a835: 00	  
	.db $5a			  ; $a836 - Unknown opcode
	.db $3b			  ; $a837 - Unknown opcode
	BCS $a820				; $a838: B0 E6   

; ---- Subroutine at $a83a (Bank 21) ----
sub_A83A:
	LDA $fd				  ; $a83a: A5 FD   
	CMP #$40				 ; $a83c: C9 40	; Compare with 64
	JMP $a845				; $a83e: 4C 45 A8

; ---- Subroutine at $a841 (Bank 21) ----
sub_A841:
	LDA $fd				  ; $a841: A5 FD   
	CMP #$3f				 ; $a843: C9 3F	; Compare with 63
loc_A845:
	LDA $fe				  ; $a845: A5 FE   
	SBC #$42				 ; $a847: E9 42	; Arithmetic
	LDA $ff				  ; $a849: A5 FF   
	SBC #$0f				 ; $a84b: E9 0F	; Arithmetic
	RTS					  ; $a84d: 60	  

; ---- Subroutine at $a84e (Bank 21) ----
sub_A84E:
	LDA $fe				  ; $a84e: A5 FE   
	STA $70				  ; $a850: 85 70   
	LDA $ff				  ; $a852: A5 FF   
	STA $71				  ; $a854: 85 71   
	LDA $fd				  ; $a856: A5 FD   
	BRK					  ; $a858: 00	  
	JMP $6073				; $a859: 4C 73 60

; ---- Subroutine at $a85c (Bank 21) ----
sub_A85C:
	LDA $615a				; $a85c: AD 5A 61
	CMP #$01				 ; $a85f: C9 01	; Compare with 1
	BNE $a866				; $a861: D0 03   
	LDA #$0a				 ; $a863: A9 0A   
	RTS					  ; $a865: 60	  
loc_A866:
	CMP #$02				 ; $a866: C9 02	; Compare with 2
	BNE $a86d				; $a868: D0 03   
	LDA #$c8				 ; $a86a: A9 C8   
	RTS					  ; $a86c: 60	  
loc_A86D:
	LDA #$14				 ; $a86d: A9 14   
	RTS					  ; $a86f: 60	  
	BRK					  ; $a870: 00	  
	BVC $a8ae				; $a871: 50 3B   
	JSR $a960				; $a873: 20 60 A9 ; -> sub_A960
loc_A876:
	LDA #$00				 ; $a876: A9 00   
	STA $f9				  ; $a878: 85 F9   
	JSR $b046				; $a87a: 20 46 B0 ; -> sub_B046
	LDA $fd				  ; $a87d: A5 FD   
	ORA $fe				  ; $a87f: 05 FE   
	ORA $ff				  ; $a881: 05 FF   
	BNE $a889				; $a883: D0 04   
	BRK					  ; $a885: 00	  
	.db $cf			  ; $a886 - Unknown opcode
	.db $3b			  ; $a887 - Unknown opcode
	RTS					  ; $a888: 60	  
loc_A889:
	BRK					  ; $a889: 00	  
	EOR ($3b),Y			  ; $a88a: 51 3B   
	JSR $9ac9				; $a88c: 20 C9 9A ; -> sub_9AC9
	BNE $a89d				; $a88f: D0 0C   
	BRK					  ; $a891: 00	  
	.db $52			  ; $a892 - Unknown opcode
	.db $3b			  ; $a893 - Unknown opcode
	LDA #$3f				 ; $a894: A9 3F   
	JSR $b7b5				; $a896: 20 B5 B7 ; -> sub_B7B5
	CMP #$ff				 ; $a899: C9 FF	; Compare with 255
	BNE $a8a0				; $a89b: D0 03   
loc_A89D:
	JMP $a95c				; $a89d: 4C 5C A9
loc_A8A0:
	JSR $ba73				; $a8a0: 20 73 BA ; -> sub_BA73
	JSR $a47c				; $a8a3: 20 7C A4 ; -> sub_A47C
	LDA $62ad				; $a8a6: AD AD 62
	CMP $fd				  ; $a8a9: C5 FD   
	LDA $62ae				; $a8ab: AD AE 62
loc_A8AE:
	SBC $fe				  ; $a8ae: E5 FE	; Arithmetic
	LDA $62af				; $a8b0: AD AF 62
	SBC #$00				 ; $a8b3: E9 00	; Arithmetic
	BPL $a8bd				; $a8b5: 10 06   
	BRK					  ; $a8b7: 00	  
	CMP $4c3b,X			  ; $a8b8: DD 3B 4C
	EOR $00a9,Y			  ; $a8bb: 59 A9 00
	.db $53			  ; $a8be - Unknown opcode
	.db $3b			  ; $a8bf - Unknown opcode
	JSR $9ac9				; $a8c0: 20 C9 9A ; -> sub_9AC9
	BNE $a876				; $a8c3: D0 B1   
	LDA $da				  ; $a8c5: A5 DA   
	CMP #$01				 ; $a8c7: C9 01	; Compare with 1
	BEQ $a8dc				; $a8c9: F0 11   
loc_A8CB:
	BRK					  ; $a8cb: 00	  
	.db $77			  ; $a8cc - Unknown opcode
	.db $2b			  ; $a8cd - Unknown opcode
	LDX $dc				  ; $a8ce: A6 DC   
	LDA #$40				 ; $a8d0: A9 40   
	JSR $b7b5				; $a8d2: 20 B5 B7 ; -> sub_B7B5
	CMP #$ff				 ; $a8d5: C9 FF	; Compare with 255
	BNE $a8de				; $a8d7: D0 05   
	JMP $a95c				; $a8d9: 4C 5C A9
loc_A8DC:
	LDA #$00				 ; $a8dc: A9 00   
loc_A8DE:
	STA $db				  ; $a8de: 85 DB   
	STA $f9				  ; $a8e0: 85 F9   
	TAX					  ; $a8e2: AA	  
	BRK					  ; $a8e3: 00	  
	.db $2b			  ; $a8e4 - Unknown opcode
	.db $53			  ; $a8e5 - Unknown opcode
	CMP #$08				 ; $a8e6: C9 08	; Compare with 8
	BCC $a8ef				; $a8e8: 90 05   
	BRK					  ; $a8ea: 00	  
	BIT $4b				  ; $a8eb: 24 4B   
	BCS $a8f7				; $a8ed: B0 08   
loc_A8EF:
	JSR $ba55				; $a8ef: 20 55 BA ; -> sub_BA55
	BCC $a911				; $a8f2: 90 1D   
	BRK					  ; $a8f4: 00	  
	SEI					  ; $a8f5: 78	  
	.db $2b			  ; $a8f6 - Unknown opcode
loc_A8F7:
	LDA $da				  ; $a8f7: A5 DA   
	CMP #$01				 ; $a8f9: C9 01	; Compare with 1
	BEQ $a90c				; $a8fb: F0 0F   
	BRK					  ; $a8fd: 00	  
	.db $7b			  ; $a8fe - Unknown opcode
	.db $2b			  ; $a8ff - Unknown opcode
	LDA #$48				 ; $a900: A9 48   
	JSR $b7b5				; $a902: 20 B5 B7 ; -> sub_B7B5
	CMP #$00				 ; $a905: C9 00	; Compare with 0
	BEQ $a8cb				; $a907: F0 C2   
	JMP $a95c				; $a909: 4C 5C A9
loc_A90C:
	BRK					  ; $a90c: 00	  
	ADC $b02b,Y			  ; $a90d: 79 2B B0 ; Arithmetic
	.db $4b			  ; $a910 - Unknown opcode
loc_A911:
	LDX $db				  ; $a911: A6 DB   
	BRK					  ; $a913: 00	  
	ROR					  ; $a914: 6A	  
	.db $53			  ; $a915 - Unknown opcode
	TAX					  ; $a916: AA	  
	BEQ $a91e				; $a917: F0 05   
	BRK					  ; $a919: 00	  
	ADC $b02b,X			  ; $a91a: 7D 2B B0 ; Arithmetic
	CLC					  ; $a91d: 18	  
loc_A91E:
	BRK					  ; $a91e: 00	  
	.db $42			  ; $a91f - Unknown opcode
	.db $33			  ; $a920 - Unknown opcode
	CMP #$01				 ; $a921: C9 01	; Compare with 1
	BNE $a92a				; $a923: D0 05   
	BRK					  ; $a925: 00	  
	.db $8b			  ; $a926 - Unknown opcode
	.db $2b			  ; $a927 - Unknown opcode
	BCS $a936				; $a928: B0 0C   
loc_A92A:
	CMP #$02				 ; $a92a: C9 02	; Compare with 2
	BNE $a933				; $a92c: D0 05   
	BRK					  ; $a92e: 00	  
	ROR $b02b,X			  ; $a92f: 7E 2B B0
	.db $03			  ; $a932 - Unknown opcode
loc_A933:
	BRK					  ; $a933: 00	  
	.db $7f			  ; $a934 - Unknown opcode
	.db $2b			  ; $a935 - Unknown opcode
loc_A936:
	BRK					  ; $a936: 00	  
	.db $83			  ; $a937 - Unknown opcode
	.db $2b			  ; $a938 - Unknown opcode
	LDA $62ad				; $a939: AD AD 62
	SEC					  ; $a93c: 38	  
	SBC $fd				  ; $a93d: E5 FD	; Arithmetic
	STA $62ad				; $a93f: 8D AD 62
	LDA $62ae				; $a942: AD AE 62
	SBC $fe				  ; $a945: E5 FE	; Arithmetic
	STA $62ae				; $a947: 8D AE 62
	LDA $62af				; $a94a: AD AF 62
	SBC $ff				  ; $a94d: E5 FF	; Arithmetic
	STA $62af				; $a94f: 8D AF 62
	LDX $db				  ; $a952: A6 DB   
	LDA $dc				  ; $a954: A5 DC   
	BRK					  ; $a956: 00	  
	ROL $4c73				; $a957: 2E 73 4C
	ROR $a8,X				; $a95a: 76 A8   
loc_A95C:
	BRK					  ; $a95c: 00	  
	.db $54			  ; $a95d - Unknown opcode
	.db $3b			  ; $a95e - Unknown opcode
	RTS					  ; $a95f: 60	  

; ---- Subroutine at $a960 (Bank 21) ----
sub_A960:
	LDA #$01				 ; $a960: A9 01   
	STA $07c5				; $a962: 8D C5 07
	BRK					  ; $a965: 00	  
	.db $62			  ; $a966 - Unknown opcode
	.db $33			  ; $a967 - Unknown opcode
	STA $da				  ; $a968: 85 DA   
	JMP $b1ef				; $a96a: 4C EF B1

; ---- Subroutine at $a96d (Bank 21) ----
sub_A96D:
	LDX #$00				 ; $a96d: A2 00   
	STX tmp1				 ; $a96f: 86 01   
loc_A971:
	LDA #$00				 ; $a971: A9 00   
	STA tmp0				 ; $a973: 85 00   
loc_A975:
	LDA tmp0				 ; $a975: A5 00   
	BRK					  ; $a977: 00	  
	BIT $9073				; $a978: 2C 73 90
	ASL $69c9				; $a97b: 0E C9 69
	BNE $a98a				; $a97e: D0 0A   
	LDA tmp0				 ; $a980: A5 00   
	BRK					  ; $a982: 00	  
	BMI $a9f8				; $a983: 30 73   
	INC tmp1				 ; $a985: E6 01   
	JMP $a975				; $a987: 4C 75 A9
loc_A98A:
	INC tmp0				 ; $a98a: E6 00   
	LDA tmp0				 ; $a98c: A5 00   
	CMP #$08				 ; $a98e: C9 08	; Compare with 8
	BCC $a975				; $a990: 90 E3   
	INX					  ; $a992: E8	  
	CPX $da				  ; $a993: E4 DA   
	BCC $a971				; $a995: 90 DA   
	LDA tmp1				 ; $a997: A5 01   
	RTS					  ; $a999: 60	  
	JSR $a960				; $a99a: 20 60 A9 ; -> sub_A960
	JSR $a96d				; $a99d: 20 6D A9 ; -> sub_A96D
	STA $db				  ; $a9a0: 85 DB   
	BNE $a9ae				; $a9a2: D0 0A   
	BRK					  ; $a9a4: 00	  
	.db $27			  ; $a9a5 - Unknown opcode
	.db $eb			  ; $a9a6 - Unknown opcode
	.db $ff			  ; $a9a7 - Unknown opcode
	BNE $a9ae				; $a9a8: D0 04   
	BRK					  ; $a9aa: 00	  
	.db $b3			  ; $a9ab - Unknown opcode
	.db $4b			  ; $a9ac - Unknown opcode
	RTS					  ; $a9ad: 60	  
loc_A9AE:
	STA $fd				  ; $a9ae: 85 FD   
	BRK					  ; $a9b0: 00	  
	LDY $4b,X				; $a9b1: B4 4B   
	LDA $db				  ; $a9b3: A5 DB   
	BEQ $a9c3				; $a9b5: F0 0C   
	BRK					  ; $a9b7: 00	  
	LDA $4b,X				; $a9b8: B5 4B   
	CLC					  ; $a9ba: 18	  
	LDA $62a2				; $a9bb: AD A2 62
	ADC $db				  ; $a9be: 65 DB	; Arithmetic
	STA $62a2				; $a9c0: 8D A2 62
loc_A9C3:
	JSR $9956				; $a9c3: 20 56 99 ; -> sub_9956
	LDA $62a2				; $a9c6: AD A2 62
	STA $fd				  ; $a9c9: 85 FD   
	LDA #$00				 ; $a9cb: A9 00   
	STA $fe				  ; $a9cd: 85 FE   
	STA $ff				  ; $a9cf: 85 FF   
	BRK					  ; $a9d1: 00	  
	LDX $4b,Y				; $a9d2: B6 4B   
	JSR $9ac9				; $a9d4: 20 C9 9A ; -> sub_9AC9
	BEQ $a9dc				; $a9d7: F0 03   
	JMP $aa6a				; $a9d9: 4C 6A AA
loc_A9DC:
	BRK					  ; $a9dc: 00	  
	.db $b7			  ; $a9dd - Unknown opcode
	.db $4b			  ; $a9de - Unknown opcode
	LDA #$3f				 ; $a9df: A9 3F   
	JSR $b7b5				; $a9e1: 20 B5 B7 ; -> sub_B7B5
	CMP #$ff				 ; $a9e4: C9 FF	; Compare with 255
	BNE $a9eb				; $a9e6: D0 03   
	JMP $aa6a				; $a9e8: 4C 6A AA
loc_A9EB:
	TAX					  ; $a9eb: AA	  
	LDA $07bd,X			  ; $a9ec: BD BD 07
	STA $f9				  ; $a9ef: 85 F9   
	BRK					  ; $a9f1: 00	  
	CLV					  ; $a9f2: B8	  
	.db $4b			  ; $a9f3 - Unknown opcode
	JSR $9ac9				; $a9f4: 20 C9 9A ; -> sub_9AC9
	TAX					  ; $a9f7: AA	  
loc_A9F8:
	BNE $a9dc				; $a9f8: D0 E2   
	LDA $f9				  ; $a9fa: A5 F9   
	STA $dc				  ; $a9fc: 85 DC   
	STA tmp0				 ; $a9fe: 85 00   
	JSR $b2cf				; $aa00: 20 CF B2 ; -> sub_B2CF
	LDA tmp0				 ; $aa03: A5 00   
	STA $dd				  ; $aa05: 85 DD   
	LDA $62a2				; $aa07: AD A2 62
	CMP $dd				  ; $aa0a: C5 DD   
	BPL $aa13				; $aa0c: 10 05   
	BRK					  ; $aa0e: 00	  
	LDA $b04b,Y			  ; $aa0f: B9 4B B0
	.db $47			  ; $aa12 - Unknown opcode
loc_AA13:
	BRK					  ; $aa13: 00	  
	TSX					  ; $aa14: BA	  
	.db $4b			  ; $aa15 - Unknown opcode
	LDA $da				  ; $aa16: A5 DA   
	CMP #$01				 ; $aa18: C9 01	; Compare with 1
	BNE $aa20				; $aa1a: D0 04   
	LDA #$00				 ; $aa1c: A9 00   
	BEQ $aa2e				; $aa1e: F0 0E   
loc_AA20:
	BRK					  ; $aa20: 00	  
	.db $bb			  ; $aa21 - Unknown opcode
	.db $4b			  ; $aa22 - Unknown opcode
	LDX $dc				  ; $aa23: A6 DC   
	LDA #$40				 ; $aa25: A9 40   
	JSR $b7b5				; $aa27: 20 B5 B7 ; -> sub_B7B5
	CMP #$ff				 ; $aa2a: C9 FF	; Compare with 255
	BEQ $aa5a				; $aa2c: F0 2C   
loc_AA2E:
	TAX					  ; $aa2e: AA	  
	STA $de				  ; $aa2f: 85 DE   
	BRK					  ; $aa31: 00	  
	AND $c973				; $aa32: 2D 73 C9
	PHP					  ; $aa35: 08	  
	BCS $aa47				; $aa36: B0 0F   
	BRK					  ; $aa38: 00	  
	LDY $384b,X			  ; $aa39: BC 4B 38
	LDA $62a2				; $aa3c: AD A2 62
	SBC $dd				  ; $aa3f: E5 DD	; Arithmetic
	STA $62a2				; $aa41: 8D A2 62
	JMP $aa53				; $aa44: 4C 53 AA
loc_AA47:
	STX $f9				  ; $aa47: 86 F9   
	BRK					  ; $aa49: 00	  
	LDA $204b,X			  ; $aa4a: BD 4B 20
	CMP #$9a				 ; $aa4d: C9 9A	; Compare with 154
	BEQ $aa20				; $aa4f: F0 CF   
	BNE $aa6a				; $aa51: D0 17   
loc_AA53:
	LDX $de				  ; $aa53: A6 DE   
	LDA $dc				  ; $aa55: A5 DC   
	BRK					  ; $aa57: 00	  
	ROL $ad73				; $aa58: 2E 73 AD
	LDX #$62				 ; $aa5b: A2 62   
	BEQ $aa6a				; $aa5d: F0 0B   
	BRK					  ; $aa5f: 00	  
	LDX $204b,Y			  ; $aa60: BE 4B 20
	CMP #$9a				 ; $aa63: C9 9A	; Compare with 154
	BNE $aa6a				; $aa65: D0 03   
	JMP $a9dc				; $aa67: 4C DC A9
loc_AA6A:
	BRK					  ; $aa6a: 00	  
	.db $bf			  ; $aa6b - Unknown opcode
	.db $4b			  ; $aa6c - Unknown opcode
	RTS					  ; $aa6d: 60	  
	BRK					  ; $aa6e: 00	  
	BRK					  ; $aa6f: 00	  
	.db $7f			  ; $aa70 - Unknown opcode
	JMP $b0b2				; $aa71: 4C B2 B0
	JSR $d214				; $aa74: 20 14 D2 ; Call to fixed bank
	BRK					  ; $aa77: 00	  
	ASL					  ; $aa78: 0A	  
	.db $df			  ; $aa79 - Unknown opcode
	JMP $b0ae				; $aa7a: 4C AE B0
	BRK					  ; $aa7d: 00	  
	.db $14			  ; $aa7e - Unknown opcode
	.db $8f			  ; $aa7f - Unknown opcode
	JMP $b0ae				; $aa80: 4C AE B0
	LDA #$0b				 ; $aa83: A9 0B   
	BRK					  ; $aa85: 00	  
	.db $07			  ; $aa86 - Unknown opcode
	.db $cf			  ; $aa87 - Unknown opcode
	RTS					  ; $aa88: 60	  
	LDA #$74				 ; $aa89: A9 74   
	BRK					  ; $aa8b: 00	  
	ROR $73				  ; $aa8c: 66 73   
	BCC $aa96				; $aa8e: 90 06   
	TAX					  ; $aa90: AA	  
	LDA $73				  ; $aa91: A5 73   
	BRK					  ; $aa93: 00	  
	.db $2f			  ; $aa94 - Unknown opcode
	.db $73			  ; $aa95 - Unknown opcode
loc_AA96:
	RTS					  ; $aa96: 60	  
	LDA #$05				 ; $aa97: A9 05   
	BRK					  ; $aa99: 00	  
	.db $63			  ; $aa9a - Unknown opcode
	.db $73			  ; $aa9b - Unknown opcode
	BCC $aaaa				; $aa9c: 90 0C   
	TAX					  ; $aa9e: AA	  
	BRK					  ; $aa9f: 00	  
	.db $42			  ; $aaa0 - Unknown opcode
	.db $73			  ; $aaa1 - Unknown opcode
	CMP #$01				 ; $aaa2: C9 01	; Compare with 1
	BEQ $aaaa				; $aaa4: F0 04   
	LDA #$01				 ; $aaa6: A9 01   
	BNE $aaac				; $aaa8: D0 02   
loc_AAAA:
	LDA #$00				 ; $aaaa: A9 00   
loc_AAAC:
	JMP $a66a				; $aaac: 4C 6A A6
	JSR $a66a				; $aaaf: 20 6A A6 ; -> sub_A66A
loc_AAB2:
	JSR $9ac9				; $aab2: 20 C9 9A ; -> sub_9AC9
	BEQ $aabd				; $aab5: F0 06   
	JSR $a668				; $aab7: 20 68 A6 ; -> sub_A668
	JMP $aab2				; $aaba: 4C B2 AA
loc_AABD:
	JSR $a660				; $aabd: 20 60 A6 ; -> sub_A660
	JMP $a65c				; $aac0: 4C 5C A6
	LDA #$17				 ; $aac3: A9 17   
	JMP $b0d7				; $aac5: 4C D7 B0
	LDA #$18				 ; $aac8: A9 18   
	BNE $aace				; $aaca: D0 02   
	LDA #$11				 ; $aacc: A9 11   
loc_AACE:
	JMP $b0ce				; $aace: 4C CE B0
	LDA #$13				 ; $aad1: A9 13   
	BRK					  ; $aad3: 00	  
	.db $07			  ; $aad4 - Unknown opcode
	.db $cf			  ; $aad5 - Unknown opcode
	JMP $b0ae				; $aad6: 4C AE B0
	JSR $a66a				; $aad9: 20 6A A6 ; -> sub_A66A
loc_AADC:
	JSR $9ac9				; $aadc: 20 C9 9A ; -> sub_9AC9
	BEQ $aae7				; $aadf: F0 06   
	JSR $a668				; $aae1: 20 68 A6 ; -> sub_A668
	JMP $aadc				; $aae4: 4C DC AA
loc_AAE7:
	JSR $a660				; $aae7: 20 60 A6 ; -> sub_A660
	LDA #$0d				 ; $aaea: A9 0D   
	BRK					  ; $aaec: 00	  
	.db $07			  ; $aaed - Unknown opcode
	.db $cf			  ; $aaee - Unknown opcode
	JSR $d214				; $aaef: 20 14 D2 ; Call to fixed bank
	JMP $b0ae				; $aaf2: 4C AE B0
	LDA #$0c				 ; $aaf5: A9 0C   
	BRK					  ; $aaf7: 00	  
	.db $07			  ; $aaf8 - Unknown opcode
	.db $cf			  ; $aaf9 - Unknown opcode
	RTS					  ; $aafa: 60	  
	STA $f9				  ; $aafb: 85 F9   
	JSR $a66a				; $aafd: 20 6A A6 ; -> sub_A66A
	JSR $9ac9				; $ab00: 20 C9 9A ; -> sub_9AC9
	BNE $ab08				; $ab03: D0 03   
	JMP $a668				; $ab05: 4C 68 A6
loc_AB08:
	JSR $a660				; $ab08: 20 60 A6 ; -> sub_A660
	JSR $9ac9				; $ab0b: 20 C9 9A ; -> sub_9AC9
	BEQ $ab13				; $ab0e: F0 03   
	JMP $a65c				; $ab10: 4C 5C A6
loc_AB13:
	JSR $a658				; $ab13: 20 58 A6 ; -> sub_A658
	BRK					  ; $ab16: 00	  
	ADC $33				  ; $ab17: 65 33	; Arithmetic
	BCC $ab2d				; $ab19: 90 12   
	STA $f9				  ; $ab1b: 85 F9   
	TAX					  ; $ab1d: AA	  
	LDA #$6e				 ; $ab1e: A9 6E   
	BRK					  ; $ab20: 00	  
	ROL $0073				; $ab21: 2E 73 00
	ROL $cb				  ; $ab24: 26 CB   
	.db $02			  ; $ab26 - Unknown opcode
	JSR $a654				; $ab27: 20 54 A6 ; -> sub_A654
	JMP $a650				; $ab2a: 4C 50 A6
loc_AB2D:
	JMP $a64c				; $ab2d: 4C 4C A6
	JSR $a4c9				; $ab30: 20 C9 A4 ; -> sub_A4C9
	BRK					  ; $ab33: 00	  
	CLC					  ; $ab34: 18	  
	.db $cb			  ; $ab35 - Unknown opcode
	JSR $c700				; $ab36: 20 00 C7 ; Call to fixed bank
	.db $3b			  ; $ab39 - Unknown opcode
loc_AB3A:
	JSR $9ac9				; $ab3a: 20 C9 9A ; -> sub_9AC9
	BEQ $ab44				; $ab3d: F0 05   
	BRK					  ; $ab3f: 00	  
	INY					  ; $ab40: C8	  
	.db $3b			  ; $ab41 - Unknown opcode
	BCS $ab3a				; $ab42: B0 F6   
loc_AB44:
	BRK					  ; $ab44: 00	  
	CMP #$3b				 ; $ab45: C9 3B	; Compare with 59
loc_AB47:
	BRK					  ; $ab47: 00	  
	DEX					  ; $ab48: CA	  
	.db $3b			  ; $ab49 - Unknown opcode
	JSR $9ac9				; $ab4a: 20 C9 9A ; -> sub_9AC9
	BEQ $ab47				; $ab4d: F0 F8   
	BRK					  ; $ab4f: 00	  
	.db $6b			  ; $ab50 - Unknown opcode
	.db $2b			  ; $ab51 - Unknown opcode
	JMP $990d				; $ab52: 4C 0D 99
	LDX #$03				 ; $ab55: A2 03   
	LDA #$11				 ; $ab57: A9 11   
	STA $7046,X			  ; $ab59: 9D 46 70
	BRK					  ; $ab5c: 00	  
	.db $17			  ; $ab5d - Unknown opcode
	.db $cb			  ; $ab5e - Unknown opcode
	BPL $ab0a				; $ab5f: 10 A9   
	ORA $4c,X				; $ab61: 15 4C   
	.db $d7			  ; $ab63 - Unknown opcode
	BCS $ab0f				; $ab64: B0 A9   
	ROR $6600,X			  ; $ab66: 7E 00 66
	.db $73			  ; $ab69 - Unknown opcode
	TAX					  ; $ab6a: AA	  
	LDA $73				  ; $ab6b: A5 73   
	STA $f9				  ; $ab6d: 85 F9   
	BRK					  ; $ab6f: 00	  
	BMI $abe5				; $ab70: 30 73   
	LDA #$7b				 ; $ab72: A9 7B   
	BRK					  ; $ab74: 00	  
	ROL $6073				; $ab75: 2E 73 60
	JSR $a66a				; $ab78: 20 6A A6 ; -> sub_A66A
	BRK					  ; $ab7b: 00	  
	.db $62			  ; $ab7c - Unknown opcode
	.db $23			  ; $ab7d - Unknown opcode
	RTI					  ; $ab7e: 40	  
	CMP #$01				 ; $ab7f: C9 01	; Compare with 1
	BCC $ab86				; $ab81: 90 03   
	JSR $a668				; $ab83: 20 68 A6 ; -> sub_A668
loc_AB86:
	JMP $a660				; $ab86: 4C 60 A6
	LDA #$ff				 ; $ab89: A9 FF   
	STA $da				  ; $ab8b: 85 DA   
	BRK					  ; $ab8d: 00	  
	ASL pos_x_hi,X		   ; $ab8e: 16 EB   
	PHP					  ; $ab90: 08	  
	BNE $ab97				; $ab91: D0 04   
	BRK					  ; $ab93: 00	  
	INC $603b				; $ab94: EE 3B 60
loc_AB97:
	LDA #$00				 ; $ab97: A9 00   
	BRK					  ; $ab99: 00	  
	.db $63			  ; $ab9a - Unknown opcode
	.db $73			  ; $ab9b - Unknown opcode
	STA $f9				  ; $ab9c: 85 F9   
	BRK					  ; $ab9e: 00	  
	.db $62			  ; $ab9f - Unknown opcode
	.db $23			  ; $aba0 - Unknown opcode
	EOR ($c9,X)			  ; $aba1: 41 C9   
	ORA ($d0,X)			  ; $aba3: 01 D0   
	.db $14			  ; $aba5 - Unknown opcode
	LDA #$04				 ; $aba6: A9 04   
	BRK					  ; $aba8: 00	  
	.db $63			  ; $aba9 - Unknown opcode
	.db $63			  ; $abaa - Unknown opcode
	EOR ($90,X)			  ; $abab: 41 90   
	.db $0c			  ; $abad - Unknown opcode
	LDA $da				  ; $abae: A5 DA   
	BEQ $abb6				; $abb0: F0 04   
	BRK					  ; $abb2: 00	  
	CMP $604b				; $abb3: CD 4B 60
loc_ABB6:
	BRK					  ; $abb6: 00	  
	.db $5f			  ; $abb7 - Unknown opcode
	.db $4b			  ; $abb8 - Unknown opcode
	RTS					  ; $abb9: 60	  
	BRK					  ; $abba: 00	  
	EOR $204b,X			  ; $abbb: 5D 4B 20
	.db $14			  ; $abbe - Unknown opcode
	.db $d2			  ; $abbf - Unknown opcode
	JSR $d1f3				; $abc0: 20 F3 D1 ; Call to fixed bank
	LDA #$24				 ; $abc3: A9 24   
	BRK					  ; $abc5: 00	  
	.db $07			  ; $abc6 - Unknown opcode
	.db $cf			  ; $abc7 - Unknown opcode
	JMP $b0ae				; $abc8: 4C AE B0
	LDX $e8				  ; $abcb: A6 E8   
	LDA $6f60,X			  ; $abcd: BD 60 6F
	CMP #$18				 ; $abd0: C9 18	; Compare with 24
	BNE $abdb				; $abd2: D0 07   
	LDA $6f80,X			  ; $abd4: BD 80 6F
	CMP #$0b				 ; $abd7: C9 0B	; Compare with 11
	BEQ $abde				; $abd9: F0 03   
loc_ABDB:
	JMP $a660				; $abdb: 4C 60 A6
loc_ABDE:
	LDA #$05				 ; $abde: A9 05   
	JSR $9af8				; $abe0: 20 F8 9A ; -> sub_9AF8
	BNE $abeb				; $abe3: D0 06   
loc_ABE5:
	JSR $a664				; $abe5: 20 64 A6 ; -> sub_A664
	JMP $a49e				; $abe8: 4C 9E A4
loc_ABEB:
	JMP $a668				; $abeb: 4C 68 A6
	LDA #$0e				 ; $abee: A9 0E   
	JMP $b0d7				; $abf0: 4C D7 B0
	LDA #$0f				 ; $abf3: A9 0F   
	JMP $b0d7				; $abf5: 4C D7 B0
	LDA #$14				 ; $abf8: A9 14   
	JMP $b0d7				; $abfa: 4C D7 B0
	BRK					  ; $abfd: 00	  
	.db $1a			  ; $abfe - Unknown opcode
	.db $eb			  ; $abff - Unknown opcode
	.db $04			  ; $ac00 - Unknown opcode
	BNE $ac34				; $ac01: D0 31   
	BRK					  ; $ac03: 00	  
	.db $1a			  ; $ac04 - Unknown opcode
	.db $eb			  ; $ac05 - Unknown opcode
	PHP					  ; $ac06: 08	  
	BNE $ac21				; $ac07: D0 18   
	JSR $a664				; $ac09: 20 64 A6 ; -> sub_A664
	LDA #$0d				 ; $ac0c: A9 0D   
	JSR $9af8				; $ac0e: 20 F8 9A ; -> sub_9AF8
	BEQ $ac16				; $ac11: F0 03   
loc_AC13:
	JMP $a668				; $ac13: 4C 68 A6
loc_AC16:
	CPX #$00				 ; $ac16: E0 00   
	BNE $ac13				; $ac18: D0 F9   
	JSR $a660				; $ac1a: 20 60 A6 ; -> sub_A660
	BRK					  ; $ac1d: 00	  
	.db $1a			  ; $ac1e - Unknown opcode
	.db $cb			  ; $ac1f - Unknown opcode
	PHP					  ; $ac20: 08	  
loc_AC21:
	LDA #$4b				 ; $ac21: A9 4B   
	JSR $b089				; $ac23: 20 89 B0 ; -> sub_B089
	BCS $ac31				; $ac26: B0 09   
	BRK					  ; $ac28: 00	  
	.db $1a			  ; $ac29 - Unknown opcode
	.db $cb			  ; $ac2a - Unknown opcode
	.db $04			  ; $ac2b - Unknown opcode
	STX $f9				  ; $ac2c: 86 F9   
	JMP $a65c				; $ac2e: 4C 5C A6
loc_AC31:
	JMP $a658				; $ac31: 4C 58 A6
loc_AC34:
	JMP $a654				; $ac34: 4C 54 A6
	BRK					  ; $ac37: 00	  
	.db $62			  ; $ac38 - Unknown opcode
	.db $23			  ; $ac39 - Unknown opcode
	RTI					  ; $ac3a: 40	  
	CMP #$02				 ; $ac3b: C9 02	; Compare with 2
	BCS $ac5a				; $ac3d: B0 1B   
	LDA #$00				 ; $ac3f: A9 00   
	BRK					  ; $ac41: 00	  
	AND #$63				 ; $ac42: 29 63   
	RTI					  ; $ac44: 40	  
	CMP #$01				 ; $ac45: C9 01	; Compare with 1
	BNE $ac4c				; $ac47: D0 03   
	JMP $a668				; $ac49: 4C 68 A6
loc_AC4C:
	JSR $a660				; $ac4c: 20 60 A6 ; -> sub_A660
	JSR $9ac9				; $ac4f: 20 C9 9A ; -> sub_9AC9
	BEQ $ac57				; $ac52: F0 03   
	JMP $a65c				; $ac54: 4C 5C A6
loc_AC57:
	JMP $a658				; $ac57: 4C 58 A6
loc_AC5A:
	JMP $a664				; $ac5a: 4C 64 A6
	LDA #$16				 ; $ac5d: A9 16   
	JMP $b0d7				; $ac5f: 4C D7 B0
	JSR $c891				; $ac62: 20 91 C8 ; Call to fixed bank
	STA $da				  ; $ac65: 85 DA   
	LDA #$00				 ; $ac67: A9 00   
	STA $db				  ; $ac69: 85 DB   
	LDA #$03				 ; $ac6b: A9 03   
	LDX #$da				 ; $ac6d: A2 DA   
	JSR $c827				; $ac6f: 20 27 C8 ; Call to fixed bank
	JMP $a66a				; $ac72: 4C 6A A6
	LDA #$19				 ; $ac75: A9 19   
	JMP $b0d7				; $ac77: 4C D7 B0
	LDA #$1a				 ; $ac7a: A9 1A   
	BRK					  ; $ac7c: 00	  
	.db $07			  ; $ac7d - Unknown opcode
	.db $cf			  ; $ac7e - Unknown opcode
	JMP $b0ae				; $ac7f: 4C AE B0
	JSR $a48c				; $ac82: 20 8C A4 ; -> sub_A48C
	JMP $b0ae				; $ac85: 4C AE B0
	BRK					  ; $ac88: 00	  
	ORA $10eb,X			  ; $ac89: 1D EB 10
	BNE $ac91				; $ac8c: D0 03   
	JSR $a664				; $ac8e: 20 64 A6 ; -> sub_A664
loc_AC91:
	JSR $a668				; $ac91: 20 68 A6 ; -> sub_A668
	LDA #$73				 ; $ac94: A9 73   
	JSR $b089				; $ac96: 20 89 B0 ; -> sub_B089
	BCS $aca7				; $ac99: B0 0C   
	STX $f9				  ; $ac9b: 86 F9   
	BRK					  ; $ac9d: 00	  
	ORA $20cb,X			  ; $ac9e: 1D CB 20
	JSR $a660				; $aca1: 20 60 A6 ; -> sub_A660
	JMP $a65c				; $aca4: 4C 5C A6
loc_ACA7:
	BRK					  ; $aca7: 00	  
	ORA $10cb,X			  ; $aca8: 1D CB 10
	JMP $a658				; $acab: 4C 58 A6
	BRK					  ; $acae: 00	  
	.db $0b			  ; $acaf - Unknown opcode
	.db $df			  ; $acb0 - Unknown opcode
	BRK					  ; $acb1: 00	  
	ASL $40eb,X			  ; $acb2: 1E EB 40
	BNE $acce				; $acb5: D0 17   
	LDA $6299				; $acb7: AD 99 62
	AND #$3f				 ; $acba: 29 3F   
	CMP #$07				 ; $acbc: C9 07	; Compare with 7
	BEQ $accb				; $acbe: F0 0B   
	CMP #$02				 ; $acc0: C9 02	; Compare with 2
	BEQ $accb				; $acc2: F0 07   
	CMP #$03				 ; $acc4: C9 03	; Compare with 3
	BEQ $accb				; $acc6: F0 03   
	JMP $a664				; $acc8: 4C 64 A6
loc_ACCB:
	JMP $a668				; $accb: 4C 68 A6
loc_ACCE:
	BRK					  ; $acce: 00	  
	CMP #$4b				 ; $accf: C9 4B	; Compare with 75
	RTS					  ; $acd1: 60	  
	BRK					  ; $acd2: 00	  
	.db $0b			  ; $acd3 - Unknown opcode
	.db $df			  ; $acd4 - Unknown opcode
	LDY $e9				  ; $acd5: A4 E9   
	BRK					  ; $acd7: 00	  
	ASL $40eb,X			  ; $acd8: 1E EB 40
	BNE $ad04				; $acdb: D0 27   
	LDA $6299				; $acdd: AD 99 62
	AND #$3f				 ; $ace0: 29 3F   
	CMP #$07				 ; $ace2: C9 07	; Compare with 7
	BEQ $acf9				; $ace4: F0 13   
	CMP #$02				 ; $ace6: C9 02	; Compare with 2
	BEQ $acf9				; $ace8: F0 0F   
	CMP #$03				 ; $acea: C9 03	; Compare with 3
	BEQ $acf9				; $acec: F0 0B   
	CPY #$01				 ; $acee: C0 01   
	BNE $acf5				; $acf0: D0 03   
	JMP $a664				; $acf2: 4C 64 A6
loc_ACF5:
	LDA #$02				 ; $acf5: A9 02   
	BNE $ad0e				; $acf7: D0 15   
loc_ACF9:
	CPY #$01				 ; $acf9: C0 01   
	BNE $ad00				; $acfb: D0 03   
	JMP $a668				; $acfd: 4C 68 A6
loc_AD00:
	LDA #$03				 ; $ad00: A9 03   
	BNE $ad0e				; $ad02: D0 0A   
loc_AD04:
	BRK					  ; $ad04: 00	  
	CMP #$4b				 ; $ad05: C9 4B	; Compare with 75
	LDY $e9				  ; $ad07: A4 E9   
	CPY #$01				 ; $ad09: C0 01   
	BNE $ad11				; $ad0b: D0 04   
	RTS					  ; $ad0d: 60	  
loc_AD0E:
	JSR $a66a				; $ad0e: 20 6A A6 ; -> sub_A66A
loc_AD11:
	LDA #$1f				 ; $ad11: A9 1F   
	BRK					  ; $ad13: 00	  
	.db $07			  ; $ad14 - Unknown opcode
	.db $cf			  ; $ad15 - Unknown opcode
	JMP $b0ae				; $ad16: 4C AE B0
	BRK					  ; $ad19: 00	  
	.db $42			  ; $ad1a - Unknown opcode
	.db $4b			  ; $ad1b - Unknown opcode
	JSR $9ac9				; $ad1c: 20 C9 9A ; -> sub_9AC9
	BNE $ad5b				; $ad1f: D0 3A   
	BRK					  ; $ad21: 00	  
	.db $43			  ; $ad22 - Unknown opcode
	.db $4b			  ; $ad23 - Unknown opcode
	LDX #$02				 ; $ad24: A2 02   
	LDA #$42				 ; $ad26: A9 42   
	JSR $b7b5				; $ad28: 20 B5 B7 ; -> sub_B7B5
	CMP #$ff				 ; $ad2b: C9 FF	; Compare with 255
	BEQ $ad5b				; $ad2d: F0 2C   
	STA $da				  ; $ad2f: 85 DA   
	STA $f9				  ; $ad31: 85 F9   
	CMP #$00				 ; $ad33: C9 00	; Compare with 0
	BEQ $ad5f				; $ad35: F0 28   
	TAX					  ; $ad37: AA	  
	BRK					  ; $ad38: 00	  
	.db $2b			  ; $ad39 - Unknown opcode
	.db $73			  ; $ad3a - Unknown opcode
	CMP #$00				 ; $ad3b: C9 00	; Compare with 0
	BEQ $ad5f				; $ad3d: F0 20   
	CMP #$08				 ; $ad3f: C9 08	; Compare with 8
	BCS $ad5f				; $ad41: B0 1C   
	STA $f9				  ; $ad43: 85 F9   
	LDA #$1b				 ; $ad45: A9 1B   
	LDY $da				  ; $ad47: A4 DA   
	BRK					  ; $ad49: 00	  
	.db $07			  ; $ad4a - Unknown opcode
	.db $cf			  ; $ad4b - Unknown opcode
	LDX #$ff				 ; $ad4c: A2 FF   
	STX $e4				  ; $ad4e: 86 E4   
	BRK					  ; $ad50: 00	  
	.db $63			  ; $ad51 - Unknown opcode
	.db $73			  ; $ad52 - Unknown opcode
	STA $f9				  ; $ad53: 85 F9   
	BRK					  ; $ad55: 00	  
	BIT $004b				; $ad56: 2C 4B 00
	.db $83			  ; $ad59 - Unknown opcode
	.db $2b			  ; $ad5a - Unknown opcode
loc_AD5B:
	BRK					  ; $ad5b: 00	  
	EOR ($4b,X)			  ; $ad5c: 41 4B   
	RTS					  ; $ad5e: 60	  
loc_AD5F:
	BRK					  ; $ad5f: 00	  
	LSR $b04b				; $ad60: 4E 4B B0
	CPY #$20				 ; $ad63: C0 20   
	CMP #$a4				 ; $ad65: C9 A4	; Compare with 164
	BRK					  ; $ad67: 00	  
	.db $3b			  ; $ad68 - Unknown opcode
	.db $4b			  ; $ad69 - Unknown opcode
	JSR $9ac9				; $ad6a: 20 C9 9A ; -> sub_9AC9
	BNE $ad77				; $ad6d: D0 08   
loc_AD6F:
	BRK					  ; $ad6f: 00	  
	.db $3c			  ; $ad70 - Unknown opcode
	.db $4b			  ; $ad71 - Unknown opcode
	JSR $9ac9				; $ad72: 20 C9 9A ; -> sub_9AC9
	BEQ $ad6f				; $ad75: F0 F8   
loc_AD77:
	BRK					  ; $ad77: 00	  
	AND $204b,X			  ; $ad78: 3D 4B 20
	CMP #$9a				 ; $ad7b: C9 9A	; Compare with 154
	BNE $ad85				; $ad7d: D0 06   
	BRK					  ; $ad7f: 00	  
	ROL $4c4b,X			  ; $ad80: 3E 4B 4C
	ORA $0099				; $ad83: 0D 99 00
	.db $3f			  ; $ad86 - Unknown opcode
	.db $4b			  ; $ad87 - Unknown opcode
	BCS $ad77				; $ad88: B0 ED   
	LDA #$1d				 ; $ad8a: A9 1D   
	JMP $b0d7				; $ad8c: 4C D7 B0
	LDX $e8				  ; $ad8f: A6 E8   
	LDA $6f80,X			  ; $ad91: BD 80 6F
	TAY					  ; $ad94: A8	  
	LDA $6f60,X			  ; $ad95: BD 60 6F
	CMP #$1c				 ; $ad98: C9 1C	; Compare with 28
	BNE $ad9f				; $ad9a: D0 03   
	JMP $b528				; $ad9c: 4C 28 B5
loc_AD9F:
	CMP #$1d				 ; $ad9f: C9 1D	; Compare with 29
	BNE $adad				; $ada1: D0 0A   
	CPY #$12				 ; $ada3: C0 12   
	BNE $adaa				; $ada5: D0 03   
	JMP $b830				; $ada7: 4C 30 B8
loc_ADAA:
	JMP $b829				; $adaa: 4C 29 B8
loc_ADAD:
	JMP $b822				; $adad: 4C 22 B8
	JSR $a664				; $adb0: 20 64 A6 ; -> sub_A664
	JSR $9ac9				; $adb3: 20 C9 9A ; -> sub_9AC9
	BEQ $adbb				; $adb6: F0 03   
	JMP $a668				; $adb8: 4C 68 A6
loc_ADBB:
	JSR $a660				; $adbb: 20 60 A6 ; -> sub_A660
loc_ADBE:
	JSR $9ac9				; $adbe: 20 C9 9A ; -> sub_9AC9
	BEQ $adc9				; $adc1: F0 06   
	JSR $a65c				; $adc3: 20 5C A6 ; -> sub_A65C
	JMP $adbe				; $adc6: 4C BE AD
loc_ADC9:
	BRK					  ; $adc9: 00	  
	ORA ($db),Y			  ; $adca: 11 DB   
	BRK					  ; $adcc: 00	  
	BRK					  ; $adcd: 00	  
	ORA $02cb,X			  ; $adce: 1D CB 02
	JMP $a658				; $add1: 4C 58 A6
	LDA #$1e				 ; $add4: A9 1E   
	BRK					  ; $add6: 00	  
	.db $07			  ; $add7 - Unknown opcode
	.db $cf			  ; $add8 - Unknown opcode
	RTS					  ; $add9: 60	  
	LDA #$00				 ; $adda: A9 00   
	BRK					  ; $addc: 00	  
	.db $63			  ; $addd - Unknown opcode
	.db $73			  ; $adde - Unknown opcode
	STA $f9				  ; $addf: 85 F9   
	STA $fa				  ; $ade1: 85 FA   
	LDA #$00				 ; $ade3: A9 00   
	BRK					  ; $ade5: 00	  
	.db $63			  ; $ade6 - Unknown opcode
	.db $63			  ; $ade7 - Unknown opcode
	EOR ($90,X)			  ; $ade8: 41 90   
	.db $03			  ; $adea - Unknown opcode
	JMP $a668				; $adeb: 4C 68 A6
	JMP $a664				; $adee: 4C 64 A6
	LDA #$22				 ; $adf1: A9 22   
	JMP $b0ce				; $adf3: 4C CE B0
	JSR $a66a				; $adf6: 20 6A A6 ; -> sub_A66A
	JSR $9ac9				; $adf9: 20 C9 9A ; -> sub_9AC9
	BEQ $ae01				; $adfc: F0 03   
	JMP $a668				; $adfe: 4C 68 A6
loc_AE01:
	JSR $a660				; $ae01: 20 60 A6 ; -> sub_A660
	BRK					  ; $ae04: 00	  
	.db $62			  ; $ae05 - Unknown opcode
	.db $23			  ; $ae06 - Unknown opcode
	RTI					  ; $ae07: 40	  
	CMP #$04				 ; $ae08: C9 04	; Compare with 4
	BCC $ae0f				; $ae0a: 90 03   
	JMP $a65c				; $ae0c: 4C 5C A6
loc_AE0F:
	JSR $a658				; $ae0f: 20 58 A6 ; -> sub_A658
	LDA #$14				 ; $ae12: A9 14   
	JSR $a769				; $ae14: 20 69 A7 ; -> sub_A769
	BEQ $ae1c				; $ae17: F0 03   
	JSR $a654				; $ae19: 20 54 A6 ; -> sub_A654
loc_AE1C:
	JSR $a650				; $ae1c: 20 50 A6 ; -> sub_A650
	BRK					  ; $ae1f: 00	  
	JSR $20cb				; $ae20: 20 CB 20
	JMP $a4b6				; $ae23: 4C B6 A4
	BRK					  ; $ae26: 00	  
	JSR $10eb				; $ae27: 20 EB 10
	BNE $ae98				; $ae2a: D0 6C   
	JSR $a66a				; $ae2c: 20 6A A6 ; -> sub_A66A
	LDA #$00				 ; $ae2f: A9 00   
	BRK					  ; $ae31: 00	  
	.db $63			  ; $ae32 - Unknown opcode
	.db $73			  ; $ae33 - Unknown opcode
	STA $f9				  ; $ae34: 85 F9   
	TAX					  ; $ae36: AA	  
	BRK					  ; $ae37: 00	  
	LSR $93				  ; $ae38: 46 93   
	.db $07			  ; $ae3a - Unknown opcode
	BCS $ae61				; $ae3b: B0 24   
	LDA $e0				  ; $ae3d: A5 E0   
	PHA					  ; $ae3f: 48	  
	LDA $e1				  ; $ae40: A5 E1   
	PHA					  ; $ae42: 48	  
	BRK					  ; $ae43: 00	  
	ORA $8f				  ; $ae44: 05 8F   
	LDA $f9				  ; $ae46: A5 F9   
	BRK					  ; $ae48: 00	  
	.db $44			  ; $ae49 - Unknown opcode
	.db $93			  ; $ae4a - Unknown opcode
	.db $07			  ; $ae4b - Unknown opcode
	BRK					  ; $ae4c: 00	  
	ORA $53				  ; $ae4d: 05 53   
	BRK					  ; $ae4f: 00	  
	ASL $0053				; $ae50: 0E 53 00
	.db $3b			  ; $ae53 - Unknown opcode
	.db $ef			  ; $ae54 - Unknown opcode
	BRK					  ; $ae55: 00	  
	.db $27			  ; $ae56 - Unknown opcode
	.db $0f			  ; $ae57 - Unknown opcode
	PLA					  ; $ae58: 68	  
	STA $e1				  ; $ae59: 85 E1   
	PLA					  ; $ae5b: 68	  
	STA $e0				  ; $ae5c: 85 E0   
	JSR $a668				; $ae5e: 20 68 A6 ; -> sub_A668
loc_AE61:
	JSR $a660				; $ae61: 20 60 A6 ; -> sub_A660
	LDA $f9				  ; $ae64: A5 F9   
	PHA					  ; $ae66: 48	  
	LDA $e0				  ; $ae67: A5 E0   
	PHA					  ; $ae69: 48	  
	LDA $e1				  ; $ae6a: A5 E1   
	PHA					  ; $ae6c: 48	  
	LDA #$2d				 ; $ae6d: A9 2D   
	BRK					  ; $ae6f: 00	  
	.db $07			  ; $ae70 - Unknown opcode
	.db $cf			  ; $ae71 - Unknown opcode
	PLA					  ; $ae72: 68	  
	STA $e1				  ; $ae73: 85 E1   
	PLA					  ; $ae75: 68	  
	STA $e0				  ; $ae76: 85 E0   
	PLA					  ; $ae78: 68	  
	STA $f9				  ; $ae79: 85 F9   
	JSR $a4c9				; $ae7b: 20 C9 A4 ; -> sub_A4C9
	LDA #$14				 ; $ae7e: A9 14   
	BRK					  ; $ae80: 00	  
	ROR $73				  ; $ae81: 66 73   
	TAX					  ; $ae83: AA	  
	LDA $73				  ; $ae84: A5 73   
	BRK					  ; $ae86: 00	  
	BMI $aefc				; $ae87: 30 73   
	LDA #$21				 ; $ae89: A9 21   
	BRK					  ; $ae8b: 00	  
	ROL $2073				; $ae8c: 2E 73 20
	.db $5c			  ; $ae8f - Unknown opcode
	LDX tmp0				 ; $ae90: A6 00   
	ORA $8f				  ; $ae92: 05 8F   
	BRK					  ; $ae94: 00	  
	JSR $10cb				; $ae95: 20 CB 10
loc_AE98:
	LDA #$00				 ; $ae98: A9 00   
	BRK					  ; $ae9a: 00	  
	.db $63			  ; $ae9b - Unknown opcode
	.db $63			  ; $ae9c - Unknown opcode
	EOR ($b0,X)			  ; $ae9d: 41 B0   
	.db $03			  ; $ae9f - Unknown opcode
	JSR $9956				; $aea0: 20 56 99 ; -> sub_9956
	JMP $a658				; $aea3: 4C 58 A6

; ---- Subroutine at $aea6 (Bank 21) ----
sub_AEA6:
	BRK					  ; $aea6: 00	  
	.db $62			  ; $aea7 - Unknown opcode
	.db $23			  ; $aea8 - Unknown opcode
	ORA ($85,X)			  ; $aea9: 01 85   
	CMP $00a2,X			  ; $aeab: DD A2 00
loc_AEAE:
	BRK					  ; $aeae: 00	  
	ORA $43				  ; $aeaf: 05 43   
	ORA (tmp0,X)			 ; $aeb1: 01 00   
	ASL $0143				; $aeb3: 0E 43 01
	INX					  ; $aeb6: E8	  
	CPX $dd				  ; $aeb7: E4 DD   
	BCC $aeae				; $aeb9: 90 F3   
	RTS					  ; $aebb: 60	  
	LDA #$00				 ; $aebc: A9 00   
	BRK					  ; $aebe: 00	  
	.db $63			  ; $aebf - Unknown opcode
	.db $73			  ; $aec0 - Unknown opcode
	STA $f9				  ; $aec1: 85 F9   
	STA $fa				  ; $aec3: 85 FA   
	STA $fb				  ; $aec5: 85 FB   
loc_AEC7:
	JMP $a664				; $aec7: 4C 64 A6
	JSR $b067				; $aeca: 20 67 B0 ; -> sub_B067
	JMP $aec7				; $aecd: 4C C7 AE
	BRK					  ; $aed0: 00	  
	JSR $04eb				; $aed1: 20 EB 04
	BNE $aeec				; $aed4: D0 16   
	JSR $a66a				; $aed6: 20 6A A6 ; -> sub_A66A
	BRK					  ; $aed9: 00	  
	JSR $04cb				; $aeda: 20 CB 04
	LDA #$5b				 ; $aedd: A9 5B   
	JSR $b089				; $aedf: 20 89 B0 ; -> sub_B089
	BCC $aee7				; $aee2: 90 03   
loc_AEE4:
	JMP $a660				; $aee4: 4C 60 A6
loc_AEE7:
	STX $f9				  ; $aee7: 86 F9   
loc_AEE9:
	JMP $a668				; $aee9: 4C 68 A6
loc_AEEC:
	JSR $a65c				; $aeec: 20 5C A6 ; -> sub_A65C
	LDA #$5b				 ; $aeef: A9 5B   
	BRK					  ; $aef1: 00	  
	.db $3a			  ; $aef2 - Unknown opcode
	.db $0f			  ; $aef3 - Unknown opcode
	BCS $aefd				; $aef4: B0 07   
	LDA #$5b				 ; $aef6: A9 5B   
	BRK					  ; $aef8: 00	  
	.db $47			  ; $aef9 - Unknown opcode
	.db $ef			  ; $aefa - Unknown opcode
	BCC $af00				; $aefb: 90 03   
loc_AEFD:
	JMP $a658				; $aefd: 4C 58 A6
loc_AF00:
	LDA #$5b				 ; $af00: A9 5B   
	JSR $b089				; $af02: 20 89 B0 ; -> sub_B089
	BCS $aee4				; $af05: B0 DD   
	STX $f9				  ; $af07: 86 F9   
	JSR $a654				; $af09: 20 54 A6 ; -> sub_A654
	JMP $aee9				; $af0c: 4C E9 AE
	BRK					  ; $af0f: 00	  
	JSR $08eb				; $af10: 20 EB 08
	BNE $af20				; $af13: D0 0B   
	JSR $a66a				; $af15: 20 6A A6 ; -> sub_A66A
	LDA #$29				 ; $af18: A9 29   
	BRK					  ; $af1a: 00	  
	.db $07			  ; $af1b - Unknown opcode
	.db $cf			  ; $af1c - Unknown opcode
	JMP $b0ae				; $af1d: 4C AE B0
loc_AF20:
	BRK					  ; $af20: 00	  
	ADC ($4b),Y			  ; $af21: 71 4B	; Arithmetic
	RTS					  ; $af23: 60	  
	JSR $a66a				; $af24: 20 6A A6 ; -> sub_A66A
	LDA $62a4				; $af27: AD A4 62
	AND #$f0				 ; $af2a: 29 F0   
	CMP #$f0				 ; $af2c: C9 F0	; Compare with 240
	BEQ $af36				; $af2e: F0 06   
	JSR $a668				; $af30: 20 68 A6 ; -> sub_A668
	JMP $af39				; $af33: 4C 39 AF
loc_AF36:
	JSR $a660				; $af36: 20 60 A6 ; -> sub_A660
loc_AF39:
	JSR $a65c				; $af39: 20 5C A6 ; -> sub_A65C
	LDA $e0				  ; $af3c: A5 E0   
	PHA					  ; $af3e: 48	  
	LDA $e1				  ; $af3f: A5 E1   
	PHA					  ; $af41: 48	  
	BRK					  ; $af42: 00	  
	ORA $8f				  ; $af43: 05 8F   
	JSR $aea6				; $af45: 20 A6 AE ; -> sub_AEA6
	BRK					  ; $af48: 00	  
	.db $3b			  ; $af49 - Unknown opcode
	.db $ef			  ; $af4a - Unknown opcode
	BRK					  ; $af4b: 00	  
	.db $27			  ; $af4c - Unknown opcode
	.db $0f			  ; $af4d - Unknown opcode
	PLA					  ; $af4e: 68	  
	STA $e1				  ; $af4f: 85 E1   
	PLA					  ; $af51: 68	  
	STA $e0				  ; $af52: 85 E0   
	JSR $a658				; $af54: 20 58 A6 ; -> sub_A658
	JSR $9ac9				; $af57: 20 C9 9A ; -> sub_9AC9
	BNE $af62				; $af5a: D0 06   
	BRK					  ; $af5c: 00	  
	ASL $202f				; $af5d: 0E 2F 20
	.db $54			  ; $af60 - Unknown opcode
	LDX $4c				  ; $af61: A6 4C   
	BVC $af0b				; $af63: 50 A6   
	LDA #$25				 ; $af65: A9 25   
	BNE $af6b				; $af67: D0 02   
	LDA #$26				 ; $af69: A9 26   
loc_AF6B:
	JMP $b0d7				; $af6b: 4C D7 B0
	LDA #$27				 ; $af6e: A9 27   
	BNE $af6b				; $af70: D0 F9   
	LDX #$01				 ; $af72: A2 01   
	LDA $6fe6,X			  ; $af74: BD E6 6F
	STA $db				  ; $af77: 85 DB   
	LDA #$17				 ; $af79: A9 17   
	STA $da				  ; $af7b: 85 DA   
	BRK					  ; $af7d: 00	  
	LDY #$fb				 ; $af7e: A0 FB   
loc_AF80:
	LDX #$00				 ; $af80: A2 00   
	LDA $6fe6,X			  ; $af82: BD E6 6F
	TAY					  ; $af85: A8	  
	LDA $db				  ; $af86: A5 DB   
	STY $db				  ; $af88: 84 DB   
	STA $6fe6,X			  ; $af8a: 9D E6 6F
	LDA $da				  ; $af8d: A5 DA   
	PHA					  ; $af8f: 48	  
	LDA $db				  ; $af90: A5 DB   
	PHA					  ; $af92: 48	  
	LDX #$06				 ; $af93: A2 06   
	JSR $d7fc				; $af95: 20 FC D7 ; Call to fixed bank
	PLA					  ; $af98: 68	  
	STA $db				  ; $af99: 85 DB   
	PLA					  ; $af9b: 68	  
	STA $da				  ; $af9c: 85 DA   
	JSR $ff74				; $af9e: 20 74 FF ; Call to fixed bank
	DEC $da				  ; $afa1: C6 DA   
	BNE $af80				; $afa3: D0 DB   
	JSR $a664				; $afa5: 20 64 A6 ; -> sub_A664
	LDA #$28				 ; $afa8: A9 28   
	BNE $af6b				; $afaa: D0 BF   
	LDA #$2e				 ; $afac: A9 2E   
	BRK					  ; $afae: 00	  
	.db $07			  ; $afaf - Unknown opcode
	.db $cf			  ; $afb0 - Unknown opcode
	JMP $a495				; $afb1: 4C 95 A4
	JSR $d214				; $afb4: 20 14 D2 ; Call to fixed bank
	BRK					  ; $afb7: 00	  
	ORA ($df),Y			  ; $afb8: 11 DF   
	JMP $b0ae				; $afba: 4C AE B0

; ---- Subroutine at $afbd (Bank 21) ----
sub_AFBD:
	LDX #$01				 ; $afbd: A2 01   
	LDA $6fe6,X			  ; $afbf: BD E6 6F
	LDX #$00				 ; $afc2: A2 00   
	STA $6fe6,X			  ; $afc4: 9D E6 6F
	LDA #$44				 ; $afc7: A9 44   
	STA $7046,X			  ; $afc9: 9D 46 70
	LDA $3d				  ; $afcc: A5 3D   
	EOR #$02				 ; $afce: 49 02   
	STA tmp0				 ; $afd0: 85 00   
	LDA $7006,X			  ; $afd2: BD 06 70
	AND #$fc				 ; $afd5: 29 FC   
	ORA tmp0				 ; $afd7: 05 00   
	STA $7006,X			  ; $afd9: 9D 06 70
	BRK					  ; $afdc: 00	  
	ASL $01cb				; $afdd: 0E CB 01
	LDA $70e6,X			  ; $afe0: BD E6 70
	ORA #$80				 ; $afe3: 09 80   
	STA $70e6,X			  ; $afe5: 9D E6 70
	LDX #$06				 ; $afe8: A2 06   
	JSR $d7fc				; $afea: 20 FC D7 ; Call to fixed bank
	JMP $ff74				; $afed: 4C 74 FF
loc_AFF0:
	JSR $d214				; $aff0: 20 14 D2 ; Call to fixed bank
	LDA #$00				 ; $aff3: A9 00   
	STA submap_number		; $aff5: 85 64   
	JSR $a6bc				; $aff7: 20 BC A6 ; -> sub_A6BC
	JSR $b03f				; $affa: 20 3F B0 ; -> sub_B03F
	LDA #$80				 ; $affd: A9 80   
	BRK					  ; $afff: 00	  
	AND ($ef),Y			  ; $b000: 31 EF   
	LDA $7000				; $b002: AD 00 70
	AND #$fc				 ; $b005: 29 FC   
	ORA #$03				 ; $b007: 09 03   
	STA $7000				; $b009: 8D 00 70
	JSR $a4c9				; $b00c: 20 C9 A4 ; -> sub_A4C9
	JMP $c5bf				; $b00f: 4C BF C5
	LDA #$31				 ; $b012: A9 31   
	JMP $b0ce				; $b014: 4C CE B0
	BRK					  ; $b017: 00	  
	.db $62			  ; $b018 - Unknown opcode
	.db $23			  ; $b019 - Unknown opcode
	EOR #$c9				 ; $b01a: 49 C9   
	ORA ($d0,X)			  ; $b01c: 01 D0   
	.db $0b			  ; $b01e - Unknown opcode
	LDA #$06				 ; $b01f: A9 06   
	BRK					  ; $b021: 00	  
	.db $63			  ; $b022 - Unknown opcode
	.db $63			  ; $b023 - Unknown opcode
	EOR #$90				 ; $b024: 49 90   
	.db $03			  ; $b026 - Unknown opcode
	JMP $bf06				; $b027: 4C 06 BF
	BRK					  ; $b02a: 00	  
	INY					  ; $b02b: C8	  
	.db $4b			  ; $b02c - Unknown opcode
	JMP $bf0e				; $b02d: 4C 0E BF

; ---- Subroutine at $b030 (Bank 21) ----
sub_B030:
	BRK					  ; $b030: 00	  
	BPL $b02e				; $b031: 10 FB   
	JMP $b03f				; $b033: 4C 3F B0

; ---- Subroutine at $b036 (Bank 21) ----
sub_B036:
	BRK					  ; $b036: 00	  
	.db $33			  ; $b037 - Unknown opcode
	.db $fb			  ; $b038 - Unknown opcode
	JMP $b03f				; $b039: 4C 3F B0
	BRK					  ; $b03c: 00	  
	AND $00fb				; $b03d: 2D FB 00
	.db $07			  ; $b040 - Unknown opcode
	.db $9f			  ; $b041 - Unknown opcode
	BRK					  ; $b042: 00	  
	ORA #$9f				 ; $b043: 09 9F   
	RTS					  ; $b045: 60	  

; ---- Subroutine at $b046 (Bank 21) ----
sub_B046:
	LDA $62ad				; $b046: AD AD 62
	STA $fd				  ; $b049: 85 FD   
	LDA $62ae				; $b04b: AD AE 62
	STA $fe				  ; $b04e: 85 FE   
	LDA $62af				; $b050: AD AF 62
	STA $ff				  ; $b053: 85 FF   
	RTS					  ; $b055: 60	  

; ---- Subroutine at $b056 (Bank 21) ----
sub_B056:
	TYA					  ; $b056: 98	  
	PHA					  ; $b057: 48	  
	LDA ($da),Y			  ; $b058: B1 DA   
	INY					  ; $b05a: C8	  
	STA $e0				  ; $b05b: 85 E0   
	LDA ($da),Y			  ; $b05d: B1 DA   
	INY					  ; $b05f: C8	  
	STA $e1				  ; $b060: 85 E1   
	PLA					  ; $b062: 68	  
	TAY					  ; $b063: A8	  
	LDA #$00				 ; $b064: A9 00   
	RTS					  ; $b066: 60	  

; ---- Subroutine at $b067 (Bank 21) ----
sub_B067:
	LDX #$00				 ; $b067: A2 00   
loc_B069:
	LDA $615d,X			  ; $b069: BD 5D 61
	STA $0554,X			  ; $b06c: 9D 54 05
	INX					  ; $b06f: E8	  
	CPX #$04				 ; $b070: E0 04   
	BCC $b069				; $b072: 90 F5   
	LDA #$40				 ; $b074: A9 40   
	STA $0558				; $b076: 8D 58 05
	DEX					  ; $b079: CA	  
loc_B07A:
	LDA $0554,X			  ; $b07a: BD 54 05
	BNE $b083				; $b07d: D0 04   
	DEX					  ; $b07f: CA	  
	BPL $b07a				; $b080: 10 F8   
	RTS					  ; $b082: 60	  
loc_B083:
	LDA #$40				 ; $b083: A9 40   
	STA $0555,X			  ; $b085: 9D 55 05
	RTS					  ; $b088: 60	  

; ---- Subroutine at $b089 (Bank 21) ----
sub_B089:
	STA tmp0				 ; $b089: 85 00   
	BRK					  ; $b08b: 00	  
	ADC $33				  ; $b08c: 65 33	; Arithmetic
	BCC $b098				; $b08e: 90 08   
	TAX					  ; $b090: AA	  
	LDA tmp0				 ; $b091: A5 00   
	BRK					  ; $b093: 00	  
	ROL $1873				; $b094: 2E 73 18
	RTS					  ; $b097: 60	  
loc_B098:
	SEC					  ; $b098: 38	  
	RTS					  ; $b099: 60	  

; ---- Subroutine at $b09a (Bank 21) ----
sub_B09A:
	STA $e0				  ; $b09a: 85 E0   
	TYA					  ; $b09c: 98	  
	PHA					  ; $b09d: 48	  
	LDA $e0				  ; $b09e: A5 E0   
	BRK					  ; $b0a0: 00	  
	ROR $73				  ; $b0a1: 66 73   
	BCC $b0ab				; $b0a3: 90 06   
	TAX					  ; $b0a5: AA	  
	LDA $73				  ; $b0a6: A5 73   
	BRK					  ; $b0a8: 00	  
	BMI $b11e				; $b0a9: 30 73   
loc_B0AB:
	PLA					  ; $b0ab: 68	  
	TAY					  ; $b0ac: A8	  
	RTS					  ; $b0ad: 60	  

; ---- Subroutine at $b0ae (Bank 21) ----
sub_B0AE:
	LDA #$01				 ; $b0ae: A9 01   
	BNE $b0b8				; $b0b0: D0 06   
loc_B0B2:
	LDA #$c0				 ; $b0b2: A9 C0   
	BNE $b0b8				; $b0b4: D0 02   
loc_B0B6:
	LDA #$80				 ; $b0b6: A9 80   
loc_B0B8:
	STA $e7				  ; $b0b8: 85 E7   
	RTS					  ; $b0ba: 60	  

; ---- Subroutine at $b0bb (Bank 21) ----
sub_B0BB:
	PHA					  ; $b0bb: 48	  
	BRK					  ; $b0bc: 00	  
	.db $62			  ; $b0bd - Unknown opcode
	.db $23			  ; $b0be - Unknown opcode
	EOR ($c9,X)			  ; $b0bf: 41 C9   
	BRK					  ; $b0c1: 00	  
	BNE $b0cc				; $b0c2: D0 08   
	JSR $b7fb				; $b0c4: 20 FB B7 ; -> sub_B7FB
	BRK					  ; $b0c7: 00	  
	.db $54			  ; $b0c8 - Unknown opcode
	.db $4b			  ; $b0c9 - Unknown opcode
	PLA					  ; $b0ca: 68	  
	PLA					  ; $b0cb: 68	  
loc_B0CC:
	PLA					  ; $b0cc: 68	  
	RTS					  ; $b0cd: 60	  

; ---- Subroutine at $b0ce (Bank 21) ----
sub_B0CE:
	PHA					  ; $b0ce: 48	  
	TYA					  ; $b0cf: 98	  
	PHA					  ; $b0d0: 48	  
	JSR $d214				; $b0d1: 20 14 D2 ; Call to fixed bank
	JMP $b0dd				; $b0d4: 4C DD B0

; ---- Subroutine at $b0d7 (Bank 21) ----
sub_B0D7:
	PHA					  ; $b0d7: 48	  
	TYA					  ; $b0d8: 98	  
	PHA					  ; $b0d9: 48	  
	JSR $d218				; $b0da: 20 18 D2 ; Call to fixed bank
loc_B0DD:
	PLA					  ; $b0dd: 68	  
	TAY					  ; $b0de: A8	  
	PLA					  ; $b0df: 68	  
	BRK					  ; $b0e0: 00	  
	.db $07			  ; $b0e1 - Unknown opcode
	.db $cf			  ; $b0e2 - Unknown opcode
	JMP $b0ae				; $b0e3: 4C AE B0

; ---- Subroutine at $b0e6 (Bank 21) ----
sub_B0E6:
	STA $da				  ; $b0e6: 85 DA   
	LDA $65				  ; $b0e8: A5 65   
	CMP #$03				 ; $b0ea: C9 03	; Compare with 3
	BNE $b0ef				; $b0ec: D0 01   
	RTS					  ; $b0ee: 60	  
loc_B0EF:
	LDA map_number		   ; $b0ef: A5 63   
	CMP #$03				 ; $b0f1: C9 03	; Compare with 3
	BNE $b139				; $b0f3: D0 44   
	LDA $da				  ; $b0f5: A5 DA   
	AND #$7f				 ; $b0f7: 29 7F   
	STA $da				  ; $b0f9: 85 DA   
	CMP #$19				 ; $b0fb: C9 19	; Compare with 25
	BNE $b102				; $b0fd: D0 03   
loc_B0FF:
	JMP $b189				; $b0ff: 4C 89 B1
loc_B102:
	CMP #$05				 ; $b102: C9 05	; Compare with 5
	BEQ $b0ff				; $b104: F0 F9   
	CMP #$0c				 ; $b106: C9 0C	; Compare with 12
	BEQ $b0ff				; $b108: F0 F5   
	BRK					  ; $b10a: 00	  
	.db $1b			  ; $b10b - Unknown opcode
	.db $eb			  ; $b10c - Unknown opcode
	.db $ff			  ; $b10d - Unknown opcode
	BEQ $b116				; $b10e: F0 06   
	BRK					  ; $b110: 00	  
	.db $1c			  ; $b111 - Unknown opcode
	.db $eb			  ; $b112 - Unknown opcode
	.db $80			  ; $b113 - Unknown opcode
	BNE $b145				; $b114: D0 2F   
loc_B116:
	LDA $da				  ; $b116: A5 DA   
	CMP #$08				 ; $b118: C9 08	; Compare with 8
	BEQ $b145				; $b11a: F0 29   
	LDA submap_number		; $b11c: A5 64   
loc_B11E:
	CMP #$00				 ; $b11e: C9 00	; Compare with 0
	BNE $b12b				; $b120: D0 09   
	LDA $e8				  ; $b122: A5 E8   
	CMP #$06				 ; $b124: C9 06	; Compare with 6
	BNE $b12b				; $b126: D0 03   
	JSR $afbd				; $b128: 20 BD AF ; -> sub_AFBD
loc_B12B:
	JSR $b7fb				; $b12b: 20 FB B7 ; -> sub_B7FB
	BRK					  ; $b12e: 00	  
	.db $1c			  ; $b12f - Unknown opcode
	.db $87			  ; $b130 - Unknown opcode
	LDA #$20				 ; $b131: A9 20   
	JSR $b0ce				; $b133: 20 CE B0 ; -> sub_B0CE
	PLA					  ; $b136: 68	  
	PLA					  ; $b137: 68	  
	RTS					  ; $b138: 60	  
loc_B139:
	BRK					  ; $b139: 00	  
	.db $1b			  ; $b13a - Unknown opcode
	.db $eb			  ; $b13b - Unknown opcode
	.db $ff			  ; $b13c - Unknown opcode
	BEQ $b146				; $b13d: F0 07   
	BRK					  ; $b13f: 00	  
	.db $1c			  ; $b140 - Unknown opcode
	.db $eb			  ; $b141 - Unknown opcode
	.db $80			  ; $b142 - Unknown opcode
	BNE $b16e				; $b143: D0 29   
loc_B145:
	RTS					  ; $b145: 60	  
loc_B146:
	LDA #$08				 ; $b146: A9 08   
	BRK					  ; $b148: 00	  
	.db $63			  ; $b149 - Unknown opcode
	.db $73			  ; $b14a - Unknown opcode
	BCC $b152				; $b14b: 90 05   
	TAX					  ; $b14d: AA	  
	BEQ $b162				; $b14e: F0 12   
	BNE $b145				; $b150: D0 F3   
loc_B152:
	LDA map_number		   ; $b152: A5 63   
	CMP #$46				 ; $b154: C9 46	; Compare with 70
	BEQ $b145				; $b156: F0 ED   
	LDA #$0f				 ; $b158: A9 0F   
	BRK					  ; $b15a: 00	  
	.db $63			  ; $b15b - Unknown opcode
	.db $73			  ; $b15c - Unknown opcode
	BCC $b145				; $b15d: 90 E6   
	TAX					  ; $b15f: AA	  
	BNE $b145				; $b160: D0 E3   
loc_B162:
	BRK					  ; $b162: 00	  
	LSR $93				  ; $b163: 46 93   
	.db $07			  ; $b165 - Unknown opcode
	BCC $b145				; $b166: 90 DD   
	LDA map_number		   ; $b168: A5 63   
	CMP #$41				 ; $b16a: C9 41	; Compare with 65
	BEQ $b145				; $b16c: F0 D7   
loc_B16E:
	JSR $b7fb				; $b16e: 20 FB B7 ; -> sub_B7FB
	LDX #$04				 ; $b171: A2 04   
	LDY #$ff				 ; $b173: A0 FF   
loc_B175:
	INY					  ; $b175: C8	  
	LDA $b1b3,Y			  ; $b176: B9 B3 B1
	CMP #$ff				 ; $b179: C9 FF	; Compare with 255
	BEQ $b145				; $b17b: F0 C8   
	CMP $da				  ; $b17d: C5 DA   
	BNE $b175				; $b17f: D0 F4   
	PLA					  ; $b181: 68	  
	PLA					  ; $b182: 68	  
	LDA $b1d1,Y			  ; $b183: B9 D1 B1
	JMP $9919				; $b186: 4C 19 99
loc_B189:
	BRK					  ; $b189: 00	  
	.db $1b			  ; $b18a - Unknown opcode
	.db $eb			  ; $b18b - Unknown opcode
	.db $ff			  ; $b18c - Unknown opcode
	BEQ $b195				; $b18d: F0 06   
	BRK					  ; $b18f: 00	  
	.db $1c			  ; $b190 - Unknown opcode
	.db $eb			  ; $b191 - Unknown opcode
	.db $80			  ; $b192 - Unknown opcode
	BNE $b196				; $b193: D0 01   
loc_B195:
	RTS					  ; $b195: 60	  
loc_B196:
	JSR $b7fb				; $b196: 20 FB B7 ; -> sub_B7FB
	LDA $da				  ; $b199: A5 DA   
	CMP #$19				 ; $b19b: C9 19	; Compare with 25
	BNE $b1a4				; $b19d: D0 05   
	BRK					  ; $b19f: 00	  
	.db $4f			  ; $b1a0 - Unknown opcode
	.db $4b			  ; $b1a1 - Unknown opcode
	BCS $b1b0				; $b1a2: B0 0C   
loc_B1A4:
	CMP #$05				 ; $b1a4: C9 05	; Compare with 5
	BNE $b1ad				; $b1a6: D0 05   
	BRK					  ; $b1a8: 00	  
	BVC $b1f6				; $b1a9: 50 4B   
	BCS $b1b0				; $b1ab: B0 03   
loc_B1AD:
	BRK					  ; $b1ad: 00	  
	EOR ($4b),Y			  ; $b1ae: 51 4B   
loc_B1B0:
	PLA					  ; $b1b0: 68	  
	PLA					  ; $b1b1: 68	  
	RTS					  ; $b1b2: 60	  
	BRK					  ; $b1b3: 00	  
	ORA (tmp2,X)			 ; $b1b4: 01 02   
	.db $03			  ; $b1b6 - Unknown opcode
	.db $04			  ; $b1b7 - Unknown opcode
	ORA $11				  ; $b1b8: 05 11   
	ASL ptr1_hi			  ; $b1ba: 06 07   
	PHP					  ; $b1bc: 08	  
	ORA #$3f				 ; $b1bd: 09 3F   
	ASL					  ; $b1bf: 0A	  
	.db $0b			  ; $b1c0 - Unknown opcode
	.db $0c			  ; $b1c1 - Unknown opcode
	ASL $102b				; $b1c2: 0E 2B 10
	.db $12			  ; $b1c5 - Unknown opcode
	.db $13			  ; $b1c6 - Unknown opcode
	ORA $16,X				; $b1c7: 15 16   
	.db $17			  ; $b1c9 - Unknown opcode
	ORA $271a,Y			  ; $b1ca: 19 1A 27
	PLP					  ; $b1cd: 28	  
	PHA					  ; $b1ce: 48	  
	AND #$ff				 ; $b1cf: 29 FF   
	ASL					  ; $b1d1: 0A	  
	.db $0b			  ; $b1d2 - Unknown opcode
	.db $0c			  ; $b1d3 - Unknown opcode
	ORA $0f0e				; $b1d4: 0D 0E 0F
	.db $0f			  ; $b1d7 - Unknown opcode
	BPL $b1eb				; $b1d8: 10 11   
	.db $12			  ; $b1da - Unknown opcode
	.db $13			  ; $b1db - Unknown opcode
	.db $13			  ; $b1dc - Unknown opcode
	.db $14			  ; $b1dd - Unknown opcode
	ORA $16,X				; $b1de: 15 16   
	.db $17			  ; $b1e0 - Unknown opcode
	.db $17			  ; $b1e1 - Unknown opcode
	.db $14			  ; $b1e2 - Unknown opcode
	CLC					  ; $b1e3: 18	  
	ORA $1b1a,Y			  ; $b1e4: 19 1A 1B
	.db $1c			  ; $b1e7 - Unknown opcode
	ORA $1f1e,X			  ; $b1e8: 1D 1E 1F
loc_B1EB:
	JSR $0f20				; $b1eb: 20 20 0F
	.db $ff			  ; $b1ee - Unknown opcode

; ---- Subroutine at $b1ef (Bank 21) ----
sub_B1EF:
	PHA					  ; $b1ef: 48	  
	TXA					  ; $b1f0: 8A	  
	PHA					  ; $b1f1: 48	  
	TYA					  ; $b1f2: 98	  
	PHA					  ; $b1f3: 48	  
	LDA $da				  ; $b1f4: A5 DA   
loc_B1F6:
	PHA					  ; $b1f6: 48	  
	LDA $db				  ; $b1f7: A5 DB   
	PHA					  ; $b1f9: 48	  
	LDA $07c5				; $b1fa: AD C5 07
	SEC					  ; $b1fd: 38	  
	SBC #$01				 ; $b1fe: E9 01	; Arithmetic
	ASL					  ; $b200: 0A	  
	TAY					  ; $b201: A8	  
	LDA #$2c				 ; $b202: A9 2C   
	STA $da				  ; $b204: 85 DA   
	LDA #$80				 ; $b206: A9 80   
	STA $db				  ; $b208: 85 DB   
	JSR $bfa4				; $b20a: 20 A4 BF ; -> sub_BFA4
	PHA					  ; $b20d: 48	  
	INY					  ; $b20e: C8	  
	JSR $bfa4				; $b20f: 20 A4 BF ; -> sub_BFA4
	STA $db				  ; $b212: 85 DB   
	PLA					  ; $b214: 68	  
	STA $da				  ; $b215: 85 DA   
	LDY #$00				 ; $b217: A0 00   
	JSR $b2a3				; $b219: 20 A3 B2 ; -> sub_B2A3
loc_B21C:
	JSR $bfa4				; $b21c: 20 A4 BF ; -> sub_BFA4
	BMI $b22b				; $b21f: 30 0A   
	STA $07bd,Y			  ; $b221: 99 BD 07
	INY					  ; $b224: C8	  
	CPY #$08				 ; $b225: C0 08   
	BCC $b21c				; $b227: 90 F3   
	BCS $b237				; $b229: B0 0C   
loc_B22B:
	AND #$7f				 ; $b22b: 29 7F   
	STA $07bd,Y			  ; $b22d: 99 BD 07
	INY					  ; $b230: C8	  
	JSR $b243				; $b231: 20 43 B2 ; -> sub_B243
	STY $07c4				; $b234: 8C C4 07
loc_B237:
	PLA					  ; $b237: 68	  
	STA $db				  ; $b238: 85 DB   
	PLA					  ; $b23a: 68	  
	STA $da				  ; $b23b: 85 DA   
	PLA					  ; $b23d: 68	  
	TAY					  ; $b23e: A8	  
	PLA					  ; $b23f: 68	  
	TAX					  ; $b240: AA	  
	PLA					  ; $b241: 68	  
	RTS					  ; $b242: 60	  

; ---- Subroutine at $b243 (Bank 21) ----
sub_B243:
	JSR $b28c				; $b243: 20 8C B2 ; -> sub_B28C
	BCC $b25c				; $b246: 90 14   
	LDX #$00				 ; $b248: A2 00   
loc_B24A:
	LDA $62e7,X			  ; $b24a: BD E7 62
	BEQ $b256				; $b24d: F0 07   
	LDA $a479,X			  ; $b24f: BD 79 A4
	STA $07bd,Y			  ; $b252: 99 BD 07
	INY					  ; $b255: C8	  
loc_B256:
	INX					  ; $b256: E8	  
	CPX #$03				 ; $b257: E0 03   
	BCC $b24a				; $b259: 90 EF   
	RTS					  ; $b25b: 60	  
loc_B25C:
	LDX submap_number		; $b25c: A6 64   
	LDA map_number		   ; $b25e: A5 63   
	CMP #$09				 ; $b260: C9 09	; Compare with 9
	BNE $b28b				; $b262: D0 27   
	CPX #$00				 ; $b264: E0 00   
	BNE $b28b				; $b266: D0 23   
	LDA $07c5				; $b268: AD C5 07
	CMP #$01				 ; $b26b: C9 01	; Compare with 1
	BNE $b28b				; $b26d: D0 1C   
	JSR $9ce5				; $b26f: 20 E5 9C ; -> sub_9CE5
	BCS $b28b				; $b272: B0 17   
	LDA #$06				 ; $b274: A9 06   
	STA $07bd				; $b276: 8D BD 07
	LDA #$23				 ; $b279: A9 23   
	STA $07be				; $b27b: 8D BE 07
	LDA #$07				 ; $b27e: A9 07   
	STA $07bf				; $b280: 8D BF 07
	LDA #$10				 ; $b283: A9 10   
	STA $07c0				; $b285: 8D C0 07
	LDY #$04				 ; $b288: A0 04   
	RTS					  ; $b28a: 60	  
loc_B28B:
	RTS					  ; $b28b: 60	  

; ---- Subroutine at $b28c (Bank 21) ----
sub_B28C:
	LDA map_number		   ; $b28c: A5 63   
	CMP #$16				 ; $b28e: C9 16	; Compare with 22
	BNE $b2a1				; $b290: D0 0F   
	LDA submap_number		; $b292: A5 64   
	CMP #$00				 ; $b294: C9 00	; Compare with 0
	BNE $b2a1				; $b296: D0 09   
	LDA $07c5				; $b298: AD C5 07
	CMP #$01				 ; $b29b: C9 01	; Compare with 1
	BNE $b2a1				; $b29d: D0 02   
	SEC					  ; $b29f: 38	  
	RTS					  ; $b2a0: 60	  
loc_B2A1:
	CLC					  ; $b2a1: 18	  
	RTS					  ; $b2a2: 60	  

; ---- Subroutine at $b2a3 (Bank 21) ----
sub_B2A3:
	JSR $bfa4				; $b2a3: 20 A4 BF ; -> sub_BFA4
	JSR $b2c8				; $b2a6: 20 C8 B2 ; -> sub_B2C8
	CMP #$ff				 ; $b2a9: C9 FF	; Compare with 255
	BEQ $b2bb				; $b2ab: F0 0E   
	CMP map_number		   ; $b2ad: C5 63   
	BNE $b2bc				; $b2af: D0 0B   
	JSR $bfa4				; $b2b1: 20 A4 BF ; -> sub_BFA4
	JSR $b2c8				; $b2b4: 20 C8 B2 ; -> sub_B2C8
	CMP submap_number		; $b2b7: C5 64   
	BNE $b2bc				; $b2b9: D0 01   
loc_B2BB:
	RTS					  ; $b2bb: 60	  
loc_B2BC:
	JSR $bfa4				; $b2bc: 20 A4 BF ; -> sub_BFA4
	JSR $b2c8				; $b2bf: 20 C8 B2 ; -> sub_B2C8
	ORA #$00				 ; $b2c2: 09 00   
	BMI $b2a3				; $b2c4: 30 DD   
	BPL $b2bc				; $b2c6: 10 F4   

; ---- Subroutine at $b2c8 (Bank 21) ----
sub_B2C8:
	INC $da				  ; $b2c8: E6 DA   
	BNE $b2ce				; $b2ca: D0 02   
	INC $db				  ; $b2cc: E6 DB   
loc_B2CE:
	RTS					  ; $b2ce: 60	  

; ---- Subroutine at $b2cf (Bank 21) ----
sub_B2CF:
	PHA					  ; $b2cf: 48	  
	TXA					  ; $b2d0: 8A	  
	PHA					  ; $b2d1: 48	  
	TYA					  ; $b2d2: 98	  
	PHA					  ; $b2d3: 48	  
	LDA map_number		   ; $b2d4: A5 63   
	CMP #$18				 ; $b2d6: C9 18	; Compare with 24
	BNE $b2f4				; $b2d8: D0 1A   
	LDA tmp0				 ; $b2da: A5 00   
	CMP #$06				 ; $b2dc: C9 06	; Compare with 6
	BNE $b2ec				; $b2de: D0 0C   
	LDA #$0a				 ; $b2e0: A9 0A   
loc_B2E2:
	STA tmp0				 ; $b2e2: 85 00   
	LDA #$00				 ; $b2e4: A9 00   
	STA tmp1				 ; $b2e6: 85 01   
	STA tmp2				 ; $b2e8: 85 02   
	BEQ $b347				; $b2ea: F0 5B   
loc_B2EC:
	CMP #$79				 ; $b2ec: C9 79	; Compare with 121
	BNE $b2f4				; $b2ee: D0 04   
	LDA #$02				 ; $b2f0: A9 02   
	BNE $b2e2				; $b2f2: D0 EE   
loc_B2F4:
	CMP #$22				 ; $b2f4: C9 22	; Compare with 34
	BNE $b316				; $b2f6: D0 1E   
	LDA tmp0				 ; $b2f8: A5 00   
	CMP #$17				 ; $b2fa: C9 17	; Compare with 23
	BNE $b302				; $b2fc: D0 04   
	LDA #$01				 ; $b2fe: A9 01   
	BNE $b2e2				; $b300: D0 E0   
loc_B302:
	CMP #$4e				 ; $b302: C9 4E	; Compare with 78
	BNE $b30a				; $b304: D0 04   
	LDA #$04				 ; $b306: A9 04   
	BNE $b2e2				; $b308: D0 D8   
loc_B30A:
	CMP #$1c				 ; $b30a: C9 1C	; Compare with 28
	BNE $b312				; $b30c: D0 04   
	LDA #$06				 ; $b30e: A9 06   
	BNE $b2e2				; $b310: D0 D0   
loc_B312:
	LDA #$14				 ; $b312: A9 14   
	BNE $b2e2				; $b314: D0 CC   
loc_B316:
	CMP #$04				 ; $b316: C9 04	; Compare with 4
	BNE $b340				; $b318: D0 26   
	LDA submap_number		; $b31a: A5 64   
	CMP #$01				 ; $b31c: C9 01	; Compare with 1
	BNE $b340				; $b31e: D0 20   
	LDX #$00				 ; $b320: A2 00   
loc_B322:
	LDA $b34d,X			  ; $b322: BD 4D B3
	CMP tmp0				 ; $b325: C5 00   
	BEQ $b330				; $b327: F0 07   
	INX					  ; $b329: E8	  
	INX					  ; $b32a: E8	  
	INX					  ; $b32b: E8	  
	CPX #$12				 ; $b32c: E0 12   
	BCC $b322				; $b32e: 90 F2   
loc_B330:
	LDA $b34e,X			  ; $b330: BD 4E B3
	STA tmp0				 ; $b333: 85 00   
	LDA $b34f,X			  ; $b335: BD 4F B3
	STA tmp1				 ; $b338: 85 01   
	LDA #$00				 ; $b33a: A9 00   
	STA tmp2				 ; $b33c: 85 02   
	BEQ $b347				; $b33e: F0 07   
loc_B340:
	LDA tmp0				 ; $b340: A5 00   
	LDX #$00				 ; $b342: A2 00   
	BRK					  ; $b344: 00	  
	ORA ($0f),Y			  ; $b345: 11 0F   
loc_B347:
	PLA					  ; $b347: 68	  
	TAY					  ; $b348: A8	  
	PLA					  ; $b349: 68	  
	TAX					  ; $b34a: AA	  
	PLA					  ; $b34b: 68	  
	RTS					  ; $b34c: 60	  
	.db $5a			  ; $b34d - Unknown opcode
	ASL $5900,X			  ; $b34e: 1E 00 59
	.db $f4			  ; $b351 - Unknown opcode
	ORA ($22,X)			  ; $b352: 01 22   
	INX					  ; $b354: E8	  
	.db $03			  ; $b355 - Unknown opcode
	ROR $c4				  ; $b356: 66 C4   
	ORA #$50				 ; $b358: 09 50   
	LDY #$0f				 ; $b35a: A0 0F   
	EOR $50				  ; $b35c: 45 50   
	.db $c3			  ; $b35e - Unknown opcode

; ---- Subroutine at $b35f (Bank 21) ----
sub_B35F:
	PHA					  ; $b35f: 48	  
	TXA					  ; $b360: 8A	  
	PHA					  ; $b361: 48	  
	TYA					  ; $b362: 98	  
	PHA					  ; $b363: 48	  
	LDA tmp0				 ; $b364: A5 00   
	LDX #$00				 ; $b366: A2 00   
	BRK					  ; $b368: 00	  
	ORA ($0f),Y			  ; $b369: 11 0F   
	JSR $b47c				; $b36b: 20 7C B4 ; -> sub_B47C
	PLA					  ; $b36e: 68	  
	TAY					  ; $b36f: A8	  
	PLA					  ; $b370: 68	  
	TAX					  ; $b371: AA	  
	PLA					  ; $b372: 68	  
	RTS					  ; $b373: 60	  
	LDA #$00				 ; $b374: A9 00   
	STA $625b				; $b376: 8D 5B 62
	STA $625c				; $b379: 8D 5C 62
	LDY #$7f				 ; $b37c: A0 7F   
loc_B37E:
	STA $61db,Y			  ; $b37e: 99 DB 61
	DEY					  ; $b381: 88	  
	BNE $b37e				; $b382: D0 FA   
	LDA #$ff				 ; $b384: A9 FF   
	STA $61db				; $b386: 8D DB 61
	RTS					  ; $b389: 60	  

; ---- Subroutine at $b38a (Bank 21) ----
sub_B38A:
	TYA					  ; $b38a: 98	  
	PHA					  ; $b38b: 48	  
	LDY #$00				 ; $b38c: A0 00   
loc_B38E:
	LDA $61db,Y			  ; $b38e: B9 DB 61
	CMP #$ff				 ; $b391: C9 FF	; Compare with 255
	BEQ $b39a				; $b393: F0 05   
	INY					  ; $b395: C8	  
	CPY #$80				 ; $b396: C0 80   
	BCC $b38e				; $b398: 90 F4   
loc_B39A:
	STY $e7				  ; $b39a: 84 E7   
	PLA					  ; $b39c: 68	  
	TAY					  ; $b39d: A8	  
	LDA $e7				  ; $b39e: A5 E7   
	RTS					  ; $b3a0: 60	  

; ---- Subroutine at $b3a1 (Bank 21) ----
sub_B3A1:
	AND #$7f				 ; $b3a1: 29 7F   
	STA $e8				  ; $b3a3: 85 E8   
	PHA					  ; $b3a5: 48	  
	TYA					  ; $b3a6: 98	  
	PHA					  ; $b3a7: 48	  
	LDA #$80				 ; $b3a8: A9 80   
	STA $e9				  ; $b3aa: 85 E9   
	JSR $b38a				; $b3ac: 20 8A B3 ; -> sub_B38A
	CMP $e9				  ; $b3af: C5 E9   
	BCS $b3c5				; $b3b1: B0 12   
	TAY					  ; $b3b3: A8	  
	CMP #$7f				 ; $b3b4: C9 7F	; Compare with 127
	BEQ $b3bd				; $b3b6: F0 05   
	LDA #$ff				 ; $b3b8: A9 FF   
	STA $61dc,Y			  ; $b3ba: 99 DC 61
loc_B3BD:
	LDA $e8				  ; $b3bd: A5 E8   
	STA $61db,Y			  ; $b3bf: 99 DB 61
	CLC					  ; $b3c2: 18	  
	BCC $b3c6				; $b3c3: 90 01   
loc_B3C5:
	SEC					  ; $b3c5: 38	  
loc_B3C6:
	PLA					  ; $b3c6: 68	  
	TAY					  ; $b3c7: A8	  
	PLA					  ; $b3c8: 68	  
	RTS					  ; $b3c9: 60	  

; ---- Subroutine at $b3ca (Bank 21) ----
sub_B3CA:
	STA $e8				  ; $b3ca: 85 E8   
	TYA					  ; $b3cc: 98	  
	PHA					  ; $b3cd: 48	  
	LDY $e8				  ; $b3ce: A4 E8   
	LDA $61db,Y			  ; $b3d0: B9 DB 61
	STA $e8				  ; $b3d3: 85 E8   
	CPY #$7f				 ; $b3d5: C0 7F   
	BEQ $b3e8				; $b3d7: F0 0F   
loc_B3D9:
	LDA $61dc,Y			  ; $b3d9: B9 DC 61
	STA $61db,Y			  ; $b3dc: 99 DB 61
	INY					  ; $b3df: C8	  
	CPY #$7f				 ; $b3e0: C0 7F   
	BCS $b3e8				; $b3e2: B0 04   
	CMP #$ff				 ; $b3e4: C9 FF	; Compare with 255
	BNE $b3d9				; $b3e6: D0 F1   
loc_B3E8:
	LDA #$ff				 ; $b3e8: A9 FF   
	STA $61db,Y			  ; $b3ea: 99 DB 61
	PLA					  ; $b3ed: 68	  
	TAY					  ; $b3ee: A8	  
	LDA $e8				  ; $b3ef: A5 E8   
	RTS					  ; $b3f1: 60	  

; ---- Subroutine at $b3f2 (Bank 21) ----
sub_B3F2:
	ASL tmp0				 ; $b3f2: 06 00   
	ROL tmp1				 ; $b3f4: 26 01   
	ROL tmp2				 ; $b3f6: 26 02   
	LDA tmp0				 ; $b3f8: A5 00   
	STA tmp3				 ; $b3fa: 85 03   
	LDA tmp1				 ; $b3fc: A5 01   
	STA ptr0_lo			  ; $b3fe: 85 04   
	LDA tmp2				 ; $b400: A5 02   
	STA ptr0_hi			  ; $b402: 85 05   
	ASL tmp0				 ; $b404: 06 00   
	ROL tmp1				 ; $b406: 26 01   
	ROL tmp2				 ; $b408: 26 02   
	ASL tmp0				 ; $b40a: 06 00   
	ROL tmp1				 ; $b40c: 26 01   
	ROL tmp2				 ; $b40e: 26 02   
	LDA tmp0				 ; $b410: A5 00   
	CLC					  ; $b412: 18	  
	ADC tmp3				 ; $b413: 65 03	; Arithmetic
	STA tmp0				 ; $b415: 85 00   
	LDA tmp1				 ; $b417: A5 01   
	ADC ptr0_lo			  ; $b419: 65 04	; Arithmetic
	STA tmp1				 ; $b41b: 85 01   
	LDA tmp2				 ; $b41d: A5 02   
	ADC ptr0_hi			  ; $b41f: 65 05	; Arithmetic
	STA tmp2				 ; $b421: 85 02   
	RTS					  ; $b423: 60	  

; ---- Subroutine at $b424 (Bank 21) ----
sub_B424:
	JSR $b432				; $b424: 20 32 B4 ; -> sub_B432
	LDA tmp0				 ; $b427: A5 00   
	ORA tmp1				 ; $b429: 05 01   
	ORA tmp2				 ; $b42b: 05 02   
	BNE $b431				; $b42d: D0 02   
	INC tmp0				 ; $b42f: E6 00   
loc_B431:
	RTS					  ; $b431: 60	  

; ---- Subroutine at $b432 (Bank 21) ----
sub_B432:
	LDY #$02				 ; $b432: A0 02   
loc_B434:
	LDA tmp0,Y			   ; $b434: B9 00 00
	STA tmp3,Y			   ; $b437: 99 03 00
	DEY					  ; $b43a: 88	  
	BPL $b434				; $b43b: 10 F7   
	LDA #$00				 ; $b43d: A9 00   
	STA tmp0				 ; $b43f: 85 00   
	STA tmp1				 ; $b441: 85 01   
	STA tmp2				 ; $b443: 85 02   
	STA $e8				  ; $b445: 85 E8   
	LDA #$20				 ; $b447: A9 20   
	STA $e9				  ; $b449: 85 E9   
	LDY #$03				 ; $b44b: A0 03   
loc_B44D:
	ASL tmp3				 ; $b44d: 06 03   
	ROL ptr0_lo			  ; $b44f: 26 04   
	ROL ptr0_hi			  ; $b451: 26 05   
	DEY					  ; $b453: 88	  
	BNE $b44d				; $b454: D0 F7   
	LDY #$0e				 ; $b456: A0 0E   
loc_B458:
	LDA ptr0_hi			  ; $b458: A5 05   
	CMP #$0a				 ; $b45a: C9 0A	; Compare with 10
	BCC $b46e				; $b45c: 90 10   
	SBC #$0a				 ; $b45e: E9 0A	; Arithmetic
	STA ptr0_hi			  ; $b460: 85 05   
	LDA tmp1				 ; $b462: A5 01   
	ORA $e9				  ; $b464: 05 E9   
	STA tmp1				 ; $b466: 85 01   
	LDA tmp0				 ; $b468: A5 00   
	ORA $e8				  ; $b46a: 05 E8   
	STA tmp0				 ; $b46c: 85 00   
loc_B46E:
	LSR $e9				  ; $b46e: 46 E9   
	ROR $e8				  ; $b470: 66 E8   
	ASL tmp3				 ; $b472: 06 03   
	ROL ptr0_lo			  ; $b474: 26 04   
	ROL ptr0_hi			  ; $b476: 26 05   
	DEY					  ; $b478: 88	  
	BNE $b458				; $b479: D0 DD   
	RTS					  ; $b47b: 60	  

; ---- Subroutine at $b47c (Bank 21) ----
sub_B47C:
	LDY #$02				 ; $b47c: A0 02   
loc_B47E:
	LDA tmp0,Y			   ; $b47e: B9 00 00
	STA tmp3,Y			   ; $b481: 99 03 00
	DEY					  ; $b484: 88	  
	BPL $b47e				; $b485: 10 F7   
	LDA tmp3				 ; $b487: A5 03   
	CLC					  ; $b489: 18	  
	ADC #$03				 ; $b48a: 69 03	; Arithmetic
	STA tmp3				 ; $b48c: 85 03   
	LDA ptr0_lo			  ; $b48e: A5 04   
	ADC #$00				 ; $b490: 69 00	; Arithmetic
	STA ptr0_lo			  ; $b492: 85 04   
	LDA ptr0_hi			  ; $b494: A5 05   
	ADC #$00				 ; $b496: 69 00	; Arithmetic
	STA ptr0_hi			  ; $b498: 85 05   
	LDY #$02				 ; $b49a: A0 02   
loc_B49C:
	LSR ptr0_hi			  ; $b49c: 46 05   
	ROR ptr0_lo			  ; $b49e: 66 04   
	ROR tmp3				 ; $b4a0: 66 03   
	DEY					  ; $b4a2: 88	  
	BNE $b49c				; $b4a3: D0 F7   
	LDA tmp0				 ; $b4a5: A5 00   
	SEC					  ; $b4a7: 38	  
	SBC tmp3				 ; $b4a8: E5 03	; Arithmetic
	STA tmp0				 ; $b4aa: 85 00   
	LDA tmp1				 ; $b4ac: A5 01   
	SBC ptr0_lo			  ; $b4ae: E5 04	; Arithmetic
	STA tmp1				 ; $b4b0: 85 01   
	LDA tmp2				 ; $b4b2: A5 02   
	SBC ptr0_hi			  ; $b4b4: E5 05	; Arithmetic
	STA tmp2				 ; $b4b6: 85 02   
	RTS					  ; $b4b8: 60	  

; ---- Subroutine at $b4b9 (Bank 21) ----
sub_B4B9:
	LDA tmp0				 ; $b4b9: A5 00   
	CLC					  ; $b4bb: 18	  
	ADC $625b				; $b4bc: 6D 5B 62 ; Arithmetic
	STA $625b				; $b4bf: 8D 5B 62
	LDA tmp1				 ; $b4c2: A5 01   
	ADC $625c				; $b4c4: 6D 5C 62 ; Arithmetic
	STA $625c				; $b4c7: 8D 5C 62
	RTS					  ; $b4ca: 60	  

; ---- Subroutine at $b4cb (Bank 21) ----
sub_B4CB:
	LDA $625b				; $b4cb: AD 5B 62
	SEC					  ; $b4ce: 38	  
	SBC tmp0				 ; $b4cf: E5 00	; Arithmetic
	STA tmp3				 ; $b4d1: 85 03   
	LDA $625c				; $b4d3: AD 5C 62
	SBC tmp1				 ; $b4d6: E5 01	; Arithmetic
	BCC $b4e2				; $b4d8: 90 08   
	STA $625c				; $b4da: 8D 5C 62
	LDA tmp3				 ; $b4dd: A5 03   
	STA $625b				; $b4df: 8D 5B 62
loc_B4E2:
	RTS					  ; $b4e2: 60	  

; ---- Subroutine at $b4e3 (Bank 21) ----
sub_B4E3:
	LDA $625c				; $b4e3: AD 5C 62
	STA tmp1				 ; $b4e6: 85 01   
	LDA $625b				; $b4e8: AD 5B 62
	STA tmp0				 ; $b4eb: 85 00   
	RTS					  ; $b4ed: 60	  

; ---- Subroutine at $b4ee (Bank 21) ----
sub_B4EE:
	PHA					  ; $b4ee: 48	  
	TXA					  ; $b4ef: 8A	  
	PHA					  ; $b4f0: 48	  
	LDA tmp3				 ; $b4f1: A5 03   
	PHA					  ; $b4f3: 48	  
	LDA ptr0_lo			  ; $b4f4: A5 04   
	PHA					  ; $b4f6: 48	  
	LDA ptr0_hi			  ; $b4f7: A5 05   
	PHA					  ; $b4f9: 48	  
	LDA #$00				 ; $b4fa: A9 00   
	STA tmp2				 ; $b4fc: 85 02   
	LDX #$03				 ; $b4fe: A2 03   
loc_B500:
	JSR $b3f2				; $b500: 20 F2 B3 ; -> sub_B3F2
	DEX					  ; $b503: CA	  
	BNE $b500				; $b504: D0 FA   
	PLA					  ; $b506: 68	  
	STA ptr0_hi			  ; $b507: 85 05   
	PLA					  ; $b509: 68	  
	STA ptr0_lo			  ; $b50a: 85 04   
	PLA					  ; $b50c: 68	  
	STA tmp3				 ; $b50d: 85 03   
	PLA					  ; $b50f: 68	  
	TAX					  ; $b510: AA	  
	PLA					  ; $b511: 68	  
	RTS					  ; $b512: 60	  
	BRK					  ; $b513: 00	  
	.db $22			  ; $b514 - Unknown opcode
	.db $2f			  ; $b515 - Unknown opcode
	LDA #$43				 ; $b516: A9 43   
	JSR $b7b5				; $b518: 20 B5 B7 ; -> sub_B7B5
	BRK					  ; $b51b: 00	  
	ORA $6f				  ; $b51c: 05 6F   
	JSR $9956				; $b51e: 20 56 99 ; -> sub_9956
	BRK					  ; $b521: 00	  
	LDY $3b,X				; $b522: B4 3B   
	BRK					  ; $b524: 00	  
	CLC					  ; $b525: 18	  
	.db $3b			  ; $b526 - Unknown opcode
	RTS					  ; $b527: 60	  
loc_B528:
	LDA #$50				 ; $b528: A9 50   
	JSR $b7b5				; $b52a: 20 B5 B7 ; -> sub_B7B5
	BRK					  ; $b52d: 00	  
	ORA $6f				  ; $b52e: 05 6F   
	BRK					  ; $b530: 00	  
	.db $22			  ; $b531 - Unknown opcode
	.db $2f			  ; $b532 - Unknown opcode
	LDA #$00				 ; $b533: A9 00   
	STA $f9				  ; $b535: 85 F9   
	LDA $62ed				; $b537: AD ED 62
	CMP #$78				 ; $b53a: C9 78	; Compare with 120
	BCS $b543				; $b53c: B0 05   
	BRK					  ; $b53e: 00	  
	.db $1b			  ; $b53f - Unknown opcode
	.db $2b			  ; $b540 - Unknown opcode
	BCS $b546				; $b541: B0 03   
loc_B543:
	BRK					  ; $b543: 00	  
	.db $1c			  ; $b544 - Unknown opcode
	.db $2b			  ; $b545 - Unknown opcode
loc_B546:
	BRK					  ; $b546: 00	  
	.db $62			  ; $b547 - Unknown opcode
	.db $33			  ; $b548 - Unknown opcode
	STA $da				  ; $b549: 85 DA   
	LDA map_number		   ; $b54b: A5 63   
	CMP #$46				 ; $b54d: C9 46	; Compare with 70
	BEQ $b569				; $b54f: F0 18   
	CMP #$0e				 ; $b551: C9 0E	; Compare with 14
	BEQ $b569				; $b553: F0 14   
	LDA map_number		   ; $b555: A5 63   
	CMP #$04				 ; $b557: C9 04	; Compare with 4
	BNE $b561				; $b559: D0 06   
	LDA submap_number		; $b55b: A5 64   
	CMP #$0e				 ; $b55d: C9 0E	; Compare with 14
	BEQ $b569				; $b55f: F0 08   
loc_B561:
	LDA #$41				 ; $b561: A9 41   
	JSR $b7b5				; $b563: 20 B5 B7 ; -> sub_B7B5
	JMP $b575				; $b566: 4C 75 B5
loc_B569:
	LDA #$6d				 ; $b569: A9 6D   
	JSR $b7b5				; $b56b: 20 B5 B7 ; -> sub_B7B5
	CMP #$ff				 ; $b56e: C9 FF	; Compare with 255
	BEQ $b592				; $b570: F0 20   
	CLC					  ; $b572: 18	  
	ADC #$02				 ; $b573: 69 02	; Arithmetic
loc_B575:
	CMP #$00				 ; $b575: C9 00	; Compare with 0
	BNE $b57c				; $b577: D0 03   
	JMP $b6be				; $b579: 4C BE B6
loc_B57C:
	CMP #$03				 ; $b57c: C9 03	; Compare with 3
	BEQ $b59a				; $b57e: F0 1A   
	CMP #$04				 ; $b580: C9 04	; Compare with 4
	BEQ $b5e3				; $b582: F0 5F   
	CMP #$02				 ; $b584: C9 02	; Compare with 2
	BNE $b58b				; $b586: D0 03   
	JMP $b636				; $b588: 4C 36 B6
loc_B58B:
	CMP #$01				 ; $b58b: C9 01	; Compare with 1
	BNE $b592				; $b58d: D0 03   
	JMP $b700				; $b58f: 4C 00 B7
loc_B592:
	JMP $b7b1				; $b592: 4C B1 B7
loc_B595:
	BRK					  ; $b595: 00	  
	BIT $b02b				; $b596: 2C 2B B0
	LDY $daa5				; $b599: AC A5 DA
	CMP #$01				 ; $b59c: C9 01	; Compare with 1
	BEQ $b5b1				; $b59e: F0 11   
	BRK					  ; $b5a0: 00	  
	ORA $a22b,X			  ; $b5a1: 1D 2B A2
	BRK					  ; $b5a4: 00	  
	LDA #$42				 ; $b5a5: A9 42   
	JSR $b7b5				; $b5a7: 20 B5 B7 ; -> sub_B7B5
	CMP #$ff				 ; $b5aa: C9 FF	; Compare with 255
	BNE $b5b3				; $b5ac: D0 05   
	JMP $b595				; $b5ae: 4C 95 B5
loc_B5B1:
	LDA #$00				 ; $b5b1: A9 00   
loc_B5B3:
	TAX					  ; $b5b3: AA	  
	STA $f9				  ; $b5b4: 85 F9   
	STA $db				  ; $b5b6: 85 DB   
	BRK					  ; $b5b8: 00	  
	LSR $93				  ; $b5b9: 46 93   
	ORA $b0				  ; $b5bb: 05 B0   
	ORA #$00				 ; $b5bd: 09 00   
	ASL $002b,X			  ; $b5bf: 1E 2B 00
	.db $83			  ; $b5c2 - Unknown opcode
	.db $2b			  ; $b5c3 - Unknown opcode
	JMP $b595				; $b5c4: 4C 95 B5
	LDA #$05				 ; $b5c7: A9 05   
	STA $e2				  ; $b5c9: 85 E2   
	LDA #$00				 ; $b5cb: A9 00   
	STA $e3				  ; $b5cd: 85 E3   
	STA $e4				  ; $b5cf: 85 E4   
	JSR $b766				; $b5d1: 20 66 B7 ; -> sub_B766
	BRK					  ; $b5d4: 00	  
	.db $1f			  ; $b5d5 - Unknown opcode
	.db $2b			  ; $b5d6 - Unknown opcode
	JSR $b7a6				; $b5d7: 20 A6 B7 ; -> sub_B7A6
	LDX $db				  ; $b5da: A6 DB   
	BRK					  ; $b5dc: 00	  
	EOR $93				  ; $b5dd: 45 93   
	ORA $4c				  ; $b5df: 05 4C   
	STA $b5,X				; $b5e1: 95 B5   
loc_B5E3:
	LDA $da				  ; $b5e3: A5 DA   
	CMP #$01				 ; $b5e5: C9 01	; Compare with 1
	BEQ $b5fa				; $b5e7: F0 11   
	BRK					  ; $b5e9: 00	  
	JSR $a22b				; $b5ea: 20 2B A2 ; -> sub_A22B
	ORA ($a9,X)			  ; $b5ed: 01 A9   
	.db $42			  ; $b5ef - Unknown opcode
	JSR $b7b5				; $b5f0: 20 B5 B7 ; -> sub_B7B5
	CMP #$ff				 ; $b5f3: C9 FF	; Compare with 255
	BNE $b5fc				; $b5f5: D0 05   
	JMP $b595				; $b5f7: 4C 95 B5
loc_B5FA:
	LDA #$00				 ; $b5fa: A9 00   
loc_B5FC:
	TAX					  ; $b5fc: AA	  
	STA $f9				  ; $b5fd: 85 F9   
	STA $db				  ; $b5ff: 85 DB   
	BRK					  ; $b601: 00	  
	LSR $93				  ; $b602: 46 93   
	.db $04			  ; $b604 - Unknown opcode
	BCS $b610				; $b605: B0 09   
	BRK					  ; $b607: 00	  
	AND ($2b,X)			  ; $b608: 21 2B   
	BRK					  ; $b60a: 00	  
	.db $83			  ; $b60b - Unknown opcode
	.db $2b			  ; $b60c - Unknown opcode
	JMP $b595				; $b60d: 4C 95 B5
loc_B610:
	LDX $db				  ; $b610: A6 DB   
	BRK					  ; $b612: 00	  
	.db $0f			  ; $b613 - Unknown opcode
	.db $53			  ; $b614 - Unknown opcode
	STA $e2				  ; $b615: 85 E2   
	LDA #$00				 ; $b617: A9 00   
	STA $e3				  ; $b619: 85 E3   
	STA $e4				  ; $b61b: 85 E4   
	LDA #$1e				 ; $b61d: A9 1E   
	LDX #$e2				 ; $b61f: A2 E2   
	JSR $c827				; $b621: 20 27 C8 ; Call to fixed bank
	JSR $b766				; $b624: 20 66 B7 ; -> sub_B766
	BRK					  ; $b627: 00	  
	.db $22			  ; $b628 - Unknown opcode
	.db $2b			  ; $b629 - Unknown opcode
	JSR $b7a6				; $b62a: 20 A6 B7 ; -> sub_B7A6
	LDX $db				  ; $b62d: A6 DB   
	BRK					  ; $b62f: 00	  
	EOR $93				  ; $b630: 45 93   
	.db $04			  ; $b632 - Unknown opcode
	JMP $b595				; $b633: 4C 95 B5
loc_B636:
	LDA $da				  ; $b636: A5 DA   
	CMP #$01				 ; $b638: C9 01	; Compare with 1
	BEQ $b64d				; $b63a: F0 11   
	BRK					  ; $b63c: 00	  
	.db $23			  ; $b63d - Unknown opcode
	.db $2b			  ; $b63e - Unknown opcode
	LDX #$02				 ; $b63f: A2 02   
	LDA #$42				 ; $b641: A9 42   
	JSR $b7b5				; $b643: 20 B5 B7 ; -> sub_B7B5
	CMP #$ff				 ; $b646: C9 FF	; Compare with 255
	BNE $b64f				; $b648: D0 05   
	JMP $b595				; $b64a: 4C 95 B5
loc_B64D:
	LDA #$00				 ; $b64d: A9 00   
loc_B64F:
	TAX					  ; $b64f: AA	  
	STA $f9				  ; $b650: 85 F9   
	STA $db				  ; $b652: 85 DB   
	BRK					  ; $b654: 00	  
	LSR $93				  ; $b655: 46 93   
	.db $07			  ; $b657 - Unknown opcode
	BCC $b663				; $b658: 90 09   
	BRK					  ; $b65a: 00	  
	BIT $2b				  ; $b65b: 24 2B   
	BRK					  ; $b65d: 00	  
	.db $83			  ; $b65e - Unknown opcode
	.db $2b			  ; $b65f - Unknown opcode
	JMP $b595				; $b660: 4C 95 B5
loc_B663:
	LDX #$00				 ; $b663: A2 00   
	STX $e3				  ; $b665: 86 E3   
	STX $e4				  ; $b667: 86 E4   
	LDX $db				  ; $b669: A6 DB   
	BRK					  ; $b66b: 00	  
	.db $2b			  ; $b66c - Unknown opcode
	.db $53			  ; $b66d - Unknown opcode
	CMP #$08				 ; $b66e: C9 08	; Compare with 8
	BCC $b678				; $b670: 90 06   
	LDA #$0a				 ; $b672: A9 0A   
	STA $e2				  ; $b674: 85 E2   
	BNE $b69d				; $b676: D0 25   
loc_B678:
	LDX $db				  ; $b678: A6 DB   
	BRK					  ; $b67a: 00	  
	.db $0f			  ; $b67b - Unknown opcode
	.db $53			  ; $b67c - Unknown opcode
	STA $e2				  ; $b67d: 85 E2   
	LDX #$e2				 ; $b67f: A2 E2   
	JSR $c827				; $b681: 20 27 C8 ; Call to fixed bank
	LDA $e2				  ; $b684: A5 E2   
	CLC					  ; $b686: 18	  
	ADC #$0a				 ; $b687: 69 0A	; Arithmetic
	STA $e2				  ; $b689: 85 E2   
	BCC $b68f				; $b68b: 90 02   
	INC $e3				  ; $b68d: E6 E3   
loc_B68F:
	LDX #$e2				 ; $b68f: A2 E2   
	LDA #$0a				 ; $b691: A9 0A   
	JSR $c851				; $b693: 20 51 C8 ; Call to fixed bank
	LDX #$e2				 ; $b696: A2 E2   
	LDA #$0a				 ; $b698: A9 0A   
	JSR $c827				; $b69a: 20 27 C8 ; Call to fixed bank
loc_B69D:
	JSR $b766				; $b69d: 20 66 B7 ; -> sub_B766
	BRK					  ; $b6a0: 00	  
	AND $2b				  ; $b6a1: 25 2B   
	BRK					  ; $b6a3: 00	  
	ROL $2b				  ; $b6a4: 26 2B   
	JSR $b7a6				; $b6a6: 20 A6 B7 ; -> sub_B7A6
	LDX $db				  ; $b6a9: A6 DB   
	BRK					  ; $b6ab: 00	  
	.db $44			  ; $b6ac - Unknown opcode
	.db $93			  ; $b6ad - Unknown opcode
	.db $07			  ; $b6ae - Unknown opcode
	BRK					  ; $b6af: 00	  
	ORA $53				  ; $b6b0: 05 53   
	BRK					  ; $b6b2: 00	  
	ASL $0053				; $b6b3: 0E 53 00
	.db $3b			  ; $b6b6 - Unknown opcode
	.db $ef			  ; $b6b7 - Unknown opcode
	BRK					  ; $b6b8: 00	  
	.db $27			  ; $b6b9 - Unknown opcode
	.db $0f			  ; $b6ba - Unknown opcode
	JMP $b595				; $b6bb: 4C 95 B5
loc_B6BE:
	LDA #$00				 ; $b6be: A9 00   
	STA $dc				  ; $b6c0: 85 DC   
	BRK					  ; $b6c2: 00	  
	PLP					  ; $b6c3: 28	  
	.db $2b			  ; $b6c4 - Unknown opcode
	LDA #$48				 ; $b6c5: A9 48   
	JSR $b7b5				; $b6c7: 20 B5 B7 ; -> sub_B7B5
	CMP #$00				 ; $b6ca: C9 00	; Compare with 0
	BEQ $b6d5				; $b6cc: F0 07   
	BRK					  ; $b6ce: 00	  
	.db $2b			  ; $b6cf - Unknown opcode
	.db $2b			  ; $b6d0 - Unknown opcode
	DEC $dc				  ; $b6d1: C6 DC   
	BNE $b6e1				; $b6d3: D0 0C   
loc_B6D5:
	JSR $b036				; $b6d5: 20 36 B0 ; -> sub_B036
	BRK					  ; $b6d8: 00	  
	.db $37			  ; $b6d9 - Unknown opcode
	.db $ef			  ; $b6da - Unknown opcode
	BRK					  ; $b6db: 00	  
	ASL $002f				; $b6dc: 0E 2F 00
	AND #$2b				 ; $b6df: 29 2B   
loc_B6E1:
	LDA #$48				 ; $b6e1: A9 48   
	JSR $b7b5				; $b6e3: 20 B5 B7 ; -> sub_B7B5
	TAX					  ; $b6e6: AA	  
	BEQ $b739				; $b6e7: F0 50   
	LDA $dc				  ; $b6e9: A5 DC   
	BEQ $b73d				; $b6eb: F0 50   
	BRK					  ; $b6ed: 00	  
	AND ($4b),Y			  ; $b6ee: 31 4B   
	INC $dc				  ; $b6f0: E6 DC   
	LDA #$48				 ; $b6f2: A9 48   
	JSR $b7b5				; $b6f4: 20 B5 B7 ; -> sub_B7B5
	TAX					  ; $b6f7: AA	  
	BEQ $b73d				; $b6f8: F0 43   
	BRK					  ; $b6fa: 00	  
	.db $33			  ; $b6fb - Unknown opcode
	.db $4b			  ; $b6fc - Unknown opcode
	JMP $b739				; $b6fd: 4C 39 B7
loc_B700:
	BRK					  ; $b700: 00	  
	ROL					  ; $b701: 2A	  
	.db $2b			  ; $b702 - Unknown opcode
	BRK					  ; $b703: 00	  
	.db $62			  ; $b704 - Unknown opcode
	.db $23			  ; $b705 - Unknown opcode
	PHP					  ; $b706: 08	  
	STA $dc				  ; $b707: 85 DC   
	LDA #$00				 ; $b709: A9 00   
	STA $da				  ; $b70b: 85 DA   
loc_B70D:
	LDA $da				  ; $b70d: A5 DA   
	STA $6e				  ; $b70f: 85 6E   
	LDA #$08				 ; $b711: A9 08   
	BRK					  ; $b713: 00	  
	AND $850f				; $b714: 2D 0F 85
	SBC $daa6,Y			  ; $b717: F9 A6 DA ; Arithmetic
	BRK					  ; $b71a: 00	  
	.db $0f			  ; $b71b - Unknown opcode
	.db $2f			  ; $b71c - Unknown opcode
	BCS $b730				; $b71d: B0 11   
	LDA tmp0				 ; $b71f: A5 00   
	STA $fd				  ; $b721: 85 FD   
	LDA tmp1				 ; $b723: A5 01   
	STA $fe				  ; $b725: 85 FE   
	LDA tmp2				 ; $b727: A5 02   
	STA $ff				  ; $b729: 85 FF   
	BRK					  ; $b72b: 00	  
	.db $17			  ; $b72c - Unknown opcode
	.db $3b			  ; $b72d - Unknown opcode
	BCS $b733				; $b72e: B0 03   
loc_B730:
	BRK					  ; $b730: 00	  
	.db $af			  ; $b731 - Unknown opcode
	.db $3b			  ; $b732 - Unknown opcode
loc_B733:
	INC $da				  ; $b733: E6 DA   
	DEC $dc				  ; $b735: C6 DC   
	BNE $b70d				; $b737: D0 D4   
loc_B739:
	BRK					  ; $b739: 00	  
	CLC					  ; $b73a: 18	  
	.db $3b			  ; $b73b - Unknown opcode
	RTS					  ; $b73c: 60	  
loc_B73D:
	BRK					  ; $b73d: 00	  
	.db $93			  ; $b73e - Unknown opcode
	.db $2b			  ; $b73f - Unknown opcode
	BRK					  ; $b740: 00	  
	.db $04			  ; $b741 - Unknown opcode
	.db $9f			  ; $b742 - Unknown opcode
	JSR $c5c5				; $b743: 20 C5 C5 ; Call to fixed bank
	JSR $c54e				; $b746: 20 4E C5 ; Call to fixed bank
	LDA #$43				 ; $b749: A9 43   
	JSR $b7b5				; $b74b: 20 B5 B7 ; -> sub_B7B5
	BRK					  ; $b74e: 00	  
	ORA $6f				  ; $b74f: 05 6F   
	JSR $e4f6				; $b751: 20 F6 E4 ; Call to fixed bank
	BRK					  ; $b754: 00	  
	ORA #$cf				 ; $b755: 09 CF   
	JSR $e501				; $b757: 20 01 E5 ; Call to fixed bank
	JSR $ff74				; $b75a: 20 74 FF ; Call to fixed bank
	JSR $c5bf				; $b75d: 20 BF C5 ; Call to fixed bank
	BRK					  ; $b760: 00	  
	STY $2b,X				; $b761: 94 2B   
	JMP $c0e9				; $b763: 4C E9 C0

; ---- Subroutine at $b766 (Bank 21) ----
sub_B766:
	LDA $e2				  ; $b766: A5 E2   
	STA $fd				  ; $b768: 85 FD   
	LDA $e3				  ; $b76a: A5 E3   
	STA $fe				  ; $b76c: 85 FE   
	LDA $e4				  ; $b76e: A5 E4   
	STA $ff				  ; $b770: 85 FF   
	BRK					  ; $b772: 00	  
	ROL $a92b				; $b773: 2E 2B A9
	.db $07			  ; $b776 - Unknown opcode
	JSR $b7b5				; $b777: 20 B5 B7 ; -> sub_B7B5
	LDA #$48				 ; $b77a: A9 48   
	JSR $b7b5				; $b77c: 20 B5 B7 ; -> sub_B7B5
	CMP #$00				 ; $b77f: C9 00	; Compare with 0
	BEQ $b78b				; $b781: F0 08   
	BRK					  ; $b783: 00	  
	BMI $b7b1				; $b784: 30 2B   
	PLA					  ; $b786: 68	  
	PLA					  ; $b787: 68	  
	JMP $b7b4				; $b788: 4C B4 B7
loc_B78B:
	LDA $e3				  ; $b78b: A5 E3   
	STA $70				  ; $b78d: 85 70   
	LDA $e4				  ; $b78f: A5 E4   
	STA $71				  ; $b791: 85 71   
	LDA $e2				  ; $b793: A5 E2   
	BRK					  ; $b795: 00	  
	JMP $9073				; $b796: 4C 73 90
	ORA ($60,X)			  ; $b799: 01 60   
	BRK					  ; $b79b: 00	  
	.db $2f			  ; $b79c - Unknown opcode
	.db $2b			  ; $b79d - Unknown opcode
	BRK					  ; $b79e: 00	  
	.db $83			  ; $b79f - Unknown opcode
	.db $2b			  ; $b7a0 - Unknown opcode
	PLA					  ; $b7a1: 68	  
	PLA					  ; $b7a2: 68	  
	JMP $b595				; $b7a3: 4C 95 B5

; ---- Subroutine at $b7a6 (Bank 21) ----
sub_B7A6:
	BRK					  ; $b7a6: 00	  
	.db $04			  ; $b7a7 - Unknown opcode
	.db $9f			  ; $b7a8 - Unknown opcode
	JSR $b030				; $b7a9: 20 30 B0 ; -> sub_B030
	LDA #$07				 ; $b7ac: A9 07   
	JMP $b7b5				; $b7ae: 4C B5 B7
loc_B7B1:
	BRK					  ; $b7b1: 00	  
	AND $602b				; $b7b2: 2D 2B 60

; ---- Subroutine at $b7b5 (Bank 21) ----
sub_B7B5:
	STX $0e				  ; $b7b5: 86 0E   
	STA $0f				  ; $b7b7: 85 0F   
	TYA					  ; $b7b9: 98	  
	PHA					  ; $b7ba: 48	  
	TXA					  ; $b7bb: 8A	  
	PHA					  ; $b7bc: 48	  
	LDX #$00				 ; $b7bd: A2 00   
loc_B7BF:
	LDA $da,X				; $b7bf: B5 DA   
	PHA					  ; $b7c1: 48	  
	INX					  ; $b7c2: E8	  
	CPX #$10				 ; $b7c3: E0 10   
	BCC $b7bf				; $b7c5: 90 F8   
	LDA submap_number		; $b7c7: A5 64   
	CMP #$fe				 ; $b7c9: C9 FE	; Compare with 254
	BNE $b7d5				; $b7cb: D0 08   
	LDA $6bde				; $b7cd: AD DE 6B
	ORA #$80				 ; $b7d0: 09 80   
	STA $6bde				; $b7d2: 8D DE 6B
loc_B7D5:
	LDA $0f				  ; $b7d5: A5 0F   
	LDX $0e				  ; $b7d7: A6 0E   
	BRK					  ; $b7d9: 00	  
	BRK					  ; $b7da: 00	  
	.db $6f			  ; $b7db - Unknown opcode
	STA $0f				  ; $b7dc: 85 0F   
	LDA submap_number		; $b7de: A5 64   
	CMP #$fe				 ; $b7e0: C9 FE	; Compare with 254
	BNE $b7ec				; $b7e2: D0 08   
	LDA $6bde				; $b7e4: AD DE 6B
	AND #$7f				 ; $b7e7: 29 7F   
	STA $6bde				; $b7e9: 8D DE 6B
loc_B7EC:
	LDX #$0f				 ; $b7ec: A2 0F   
loc_B7EE:
	PLA					  ; $b7ee: 68	  
	STA $da,X				; $b7ef: 95 DA   
	DEX					  ; $b7f1: CA	  
	BPL $b7ee				; $b7f2: 10 FA   
	PLA					  ; $b7f4: 68	  
	TAX					  ; $b7f5: AA	  
	PLA					  ; $b7f6: 68	  
	TAY					  ; $b7f7: A8	  
	LDA $0f				  ; $b7f8: A5 0F   
	RTS					  ; $b7fa: 60	  

; ---- Subroutine at $b7fb (Bank 21) ----
sub_B7FB:
	LDA tmp0				 ; $b7fb: A5 00   
	PHA					  ; $b7fd: 48	  
	LDA tmp1				 ; $b7fe: A5 01   
	PHA					  ; $b800: 48	  
	BRK					  ; $b801: 00	  
	ORA $6f				  ; $b802: 05 6F   
	LDA #$50				 ; $b804: A9 50   
	JSR $b7b5				; $b806: 20 B5 B7 ; -> sub_B7B5
	PLA					  ; $b809: 68	  
	STA tmp1				 ; $b80a: 85 01   
	PLA					  ; $b80c: 68	  
	STA tmp0				 ; $b80d: 85 00   
	RTS					  ; $b80f: 60	  

; ---- Subroutine at $b810 (Bank 21) ----
sub_B810:
	BRK					  ; $b810: 00	  
	.db $62			  ; $b811 - Unknown opcode
	.db $33			  ; $b812 - Unknown opcode
	STA $da				  ; $b813: 85 DA   
	LDA #$69				 ; $b815: A9 69   
	JSR $b7b5				; $b817: 20 B5 B7 ; -> sub_B7B5
	LDA #$3e				 ; $b81a: A9 3E   
	JMP $b7b5				; $b81c: 4C B5 B7
	JMP $b825				; $b81f: 4C 25 B8
loc_B822:
	JSR $b7fb				; $b822: 20 FB B7 ; -> sub_B7FB
loc_B825:
	LDA #$01				 ; $b825: A9 01   
	BNE $b835				; $b827: D0 0C   
loc_B829:
	JSR $b7fb				; $b829: 20 FB B7 ; -> sub_B7FB
	LDA #$03				 ; $b82c: A9 03   
	BNE $b835				; $b82e: D0 05   
loc_B830:
	JSR $b7fb				; $b830: 20 FB B7 ; -> sub_B7FB

; ---- Subroutine at $b833 (Bank 21) ----
sub_B833:
	LDA #$02				 ; $b833: A9 02   
loc_B835:
	STA $07c5				; $b835: 8D C5 07
	LDA #$00				 ; $b838: A9 00   
	JSR $baef				; $b83a: 20 EF BA ; -> sub_BAEF
loc_B83D:
	JSR $b810				; $b83d: 20 10 B8 ; -> sub_B810
	CMP #$00				 ; $b840: C9 00	; Compare with 0
	BEQ $b84e				; $b842: F0 0A   
	CMP #$01				 ; $b844: C9 01	; Compare with 1
	BNE $b84b				; $b846: D0 03   
	JMP $b92b				; $b848: 4C 2B B9
loc_B84B:
	JMP $ba0a				; $b84b: 4C 0A BA
loc_B84E:
	JSR $b1ef				; $b84e: 20 EF B1 ; -> sub_B1EF
	LDA #$01				 ; $b851: A9 01   
	JSR $baef				; $b853: 20 EF BA ; -> sub_BAEF
	LDA #$3f				 ; $b856: A9 3F   
	JSR $b7b5				; $b858: 20 B5 B7 ; -> sub_B7B5
	CMP #$ff				 ; $b85b: C9 FF	; Compare with 255
	BNE $b862				; $b85d: D0 03   
	JMP $ba02				; $b85f: 4C 02 BA
loc_B862:
	JSR $ba5d				; $b862: 20 5D BA ; -> sub_BA5D
	BCS $b86f				; $b865: B0 08   
	LDA #$02				 ; $b867: A9 02   
	JSR $baef				; $b869: 20 EF BA ; -> sub_BAEF
	JMP $b928				; $b86c: 4C 28 B9
loc_B86F:
	LDA #$03				 ; $b86f: A9 03   
	JSR $baef				; $b871: 20 EF BA ; -> sub_BAEF
	JSR $bacd				; $b874: 20 CD BA ; -> sub_BACD
	LDA $da				  ; $b877: A5 DA   
	CMP #$01				 ; $b879: C9 01	; Compare with 1
	BEQ $b890				; $b87b: F0 13   
loc_B87D:
	LDA #$04				 ; $b87d: A9 04   
	JSR $baef				; $b87f: 20 EF BA ; -> sub_BAEF
	LDX $dc				  ; $b882: A6 DC   
	LDA #$40				 ; $b884: A9 40   
	JSR $b7b5				; $b886: 20 B5 B7 ; -> sub_B7B5
	CMP #$ff				 ; $b889: C9 FF	; Compare with 255
	BNE $b892				; $b88b: D0 05   
	JMP $b9f3				; $b88d: 4C F3 B9
loc_B890:
	LDA #$00				 ; $b890: A9 00   
loc_B892:
	STA $db				  ; $b892: 85 DB   
	STA $f9				  ; $b894: 85 F9   
	TAX					  ; $b896: AA	  
	BRK					  ; $b897: 00	  
	.db $2b			  ; $b898 - Unknown opcode
	.db $53			  ; $b899 - Unknown opcode
	CMP #$08				 ; $b89a: C9 08	; Compare with 8
	BNE $b8a8				; $b89c: D0 0A   
	LDA #$05				 ; $b89e: A9 05   
	JSR $baef				; $b8a0: 20 EF BA ; -> sub_BAEF
	BRK					  ; $b8a3: 00	  
	.db $83			  ; $b8a4 - Unknown opcode
	.db $2b			  ; $b8a5 - Unknown opcode
	BCS $b8c0				; $b8a6: B0 18   
loc_B8A8:
	CMP #$09				 ; $b8a8: C9 09	; Compare with 9
	BCC $b8b6				; $b8aa: 90 0A   
	LDA #$06				 ; $b8ac: A9 06   
	JSR $baef				; $b8ae: 20 EF BA ; -> sub_BAEF
	BRK					  ; $b8b1: 00	  
	.db $83			  ; $b8b2 - Unknown opcode
	.db $2b			  ; $b8b3 - Unknown opcode
	BCS $b8c0				; $b8b4: B0 0A   
loc_B8B6:
	JSR $ba55				; $b8b6: 20 55 BA ; -> sub_BA55
	BCC $b8db				; $b8b9: 90 20   
	LDA #$07				 ; $b8bb: A9 07   
	JSR $baef				; $b8bd: 20 EF BA ; -> sub_BAEF
loc_B8C0:
	LDA $da				  ; $b8c0: A5 DA   
	CMP #$01				 ; $b8c2: C9 01	; Compare with 1
	BEQ $b8d3				; $b8c4: F0 0D   
loc_B8C6:
	LDA #$08				 ; $b8c6: A9 08   
	JSR $baef				; $b8c8: 20 EF BA ; -> sub_BAEF
	JSR $9ac9				; $b8cb: 20 C9 9A ; -> sub_9AC9
	BEQ $b87d				; $b8ce: F0 AD   
	JMP $b9f3				; $b8d0: 4C F3 B9
loc_B8D3:
	LDA #$09				 ; $b8d3: A9 09   
	JSR $baef				; $b8d5: 20 EF BA ; -> sub_BAEF
	JMP $b9ff				; $b8d8: 4C FF B9
loc_B8DB:
	JSR $ba3e				; $b8db: 20 3E BA ; -> sub_BA3E
	BCS $b8f3				; $b8de: B0 13   
	LDA #$0a				 ; $b8e0: A9 0A   
	JSR $baef				; $b8e2: 20 EF BA ; -> sub_BAEF
	JSR $9ac9				; $b8e5: 20 C9 9A ; -> sub_9AC9
	BEQ $b8f3				; $b8e8: F0 09   
	LDA $da				  ; $b8ea: A5 DA   
	CMP #$01				 ; $b8ec: C9 01	; Compare with 1
	BNE $b8c6				; $b8ee: D0 D6   
	JMP $b9ff				; $b8f0: 4C FF B9
loc_B8F3:
	LDX $db				  ; $b8f3: A6 DB   
	BRK					  ; $b8f5: 00	  
	ROR					  ; $b8f6: 6A	  
	.db $53			  ; $b8f7 - Unknown opcode
	TAX					  ; $b8f8: AA	  
	BEQ $b903				; $b8f9: F0 08   
	LDA #$0b				 ; $b8fb: A9 0B   
	JSR $baef				; $b8fd: 20 EF BA ; -> sub_BAEF
	JMP $b925				; $b900: 4C 25 B9
loc_B903:
	LDX $db				  ; $b903: A6 DB   
	BRK					  ; $b905: 00	  
	.db $42			  ; $b906 - Unknown opcode
	.db $53			  ; $b907 - Unknown opcode
	CMP #$01				 ; $b908: C9 01	; Compare with 1
	BNE $b914				; $b90a: D0 08   
	LDA #$0c				 ; $b90c: A9 0C   
	JSR $baef				; $b90e: 20 EF BA ; -> sub_BAEF
	JMP $b925				; $b911: 4C 25 B9
loc_B914:
	CMP #$02				 ; $b914: C9 02	; Compare with 2
	BNE $b920				; $b916: D0 08   
	LDA #$0d				 ; $b918: A9 0D   
	JSR $baef				; $b91a: 20 EF BA ; -> sub_BAEF
	JMP $b925				; $b91d: 4C 25 B9
loc_B920:
	LDA #$0e				 ; $b920: A9 0E   
	JSR $baef				; $b922: 20 EF BA ; -> sub_BAEF
loc_B925:
	JSR $baa0				; $b925: 20 A0 BA ; -> sub_BAA0
loc_B928:
	JMP $b9ff				; $b928: 4C FF B9
loc_B92B:
	LDA $da				  ; $b92b: A5 DA   
	CMP #$01				 ; $b92d: C9 01	; Compare with 1
	BEQ $b945				; $b92f: F0 14   
	LDA #$0f				 ; $b931: A9 0F   
	JSR $baef				; $b933: 20 EF BA ; -> sub_BAEF
	LDA #$49				 ; $b936: A9 49   
	JSR $b7b5				; $b938: 20 B5 B7 ; -> sub_B7B5
	CMP #$ff				 ; $b93b: C9 FF	; Compare with 255
	BNE $b947				; $b93d: D0 08   
	BRK					  ; $b93f: 00	  
	DEC $4b,X				; $b940: D6 4B   
	JMP $b9f3				; $b942: 4C F3 B9
loc_B945:
	LDA #$00				 ; $b945: A9 00   
loc_B947:
	STA $db				  ; $b947: 85 DB   
	STA $f9				  ; $b949: 85 F9   
	TAX					  ; $b94b: AA	  
	BRK					  ; $b94c: 00	  
	.db $2b			  ; $b94d - Unknown opcode
	.db $73			  ; $b94e - Unknown opcode
	CMP #$08				 ; $b94f: C9 08	; Compare with 8
	BNE $b95e				; $b951: D0 0B   
	LDA #$10				 ; $b953: A9 10   
	JSR $baef				; $b955: 20 EF BA ; -> sub_BAEF
	BRK					  ; $b958: 00	  
	.db $83			  ; $b959 - Unknown opcode
	.db $2b			  ; $b95a - Unknown opcode
	JMP $b97b				; $b95b: 4C 7B B9
loc_B95E:
	CMP #$09				 ; $b95e: C9 09	; Compare with 9
	BCC $b96d				; $b960: 90 0B   
	BRK					  ; $b962: 00	  
	DEC $4b,X				; $b963: D6 4B   
	LDA #$11				 ; $b965: A9 11   
	JSR $baef				; $b967: 20 EF BA ; -> sub_BAEF
	JMP $b97b				; $b96a: 4C 7B B9
loc_B96D:
	LDX $db				  ; $b96d: A6 DB   
	BRK					  ; $b96f: 00	  
	AND $c953				; $b970: 2D 53 C9
	BRK					  ; $b973: 00	  
	BNE $b987				; $b974: D0 11   
	LDA #$12				 ; $b976: A9 12   
	JSR $baef				; $b978: 20 EF BA ; -> sub_BAEF
loc_B97B:
	LDA $da				  ; $b97b: A5 DA   
	CMP #$01				 ; $b97d: C9 01	; Compare with 1
	BNE $b984				; $b97f: D0 03   
	JMP $b9ff				; $b981: 4C FF B9
loc_B984:
	JMP $b9f0				; $b984: 4C F0 B9
loc_B987:
	BRK					  ; $b987: 00	  
	DEC $4b,X				; $b988: D6 4B   
	LDA #$13				 ; $b98a: A9 13   
	JSR $baef				; $b98c: 20 EF BA ; -> sub_BAEF
	JSR $ba20				; $b98f: 20 20 BA ; -> sub_BA20
	BCC $b997				; $b992: 90 03   
	JMP $b9f3				; $b994: 4C F3 B9
loc_B997:
	LDA #$14				 ; $b997: A9 14   
	JSR $baef				; $b999: 20 EF BA ; -> sub_BAEF
	LDA $db				  ; $b99c: A5 DB   
	STA $f9				  ; $b99e: 85 F9   
	LDA $dc				  ; $b9a0: A5 DC   
	BRK					  ; $b9a2: 00	  
	.db $0f			  ; $b9a3 - Unknown opcode
	.db $0f			  ; $b9a4 - Unknown opcode
	BCC $b9af				; $b9a5: 90 08   
	LDA #$15				 ; $b9a7: A9 15   
	JSR $baef				; $b9a9: 20 EF BA ; -> sub_BAEF
	JMP $b9f0				; $b9ac: 4C F0 B9
loc_B9AF:
	LDA $dc				  ; $b9af: A5 DC   
	STA tmp0				 ; $b9b1: 85 00   
	JSR $b35f				; $b9b3: 20 5F B3 ; -> sub_B35F
	JSR $a47c				; $b9b6: 20 7C A4 ; -> sub_A47C
	LDA #$16				 ; $b9b9: A9 16   
	JSR $baef				; $b9bb: 20 EF BA ; -> sub_BAEF
	JSR $9ac9				; $b9be: 20 C9 9A ; -> sub_9AC9
	BEQ $b9cb				; $b9c1: F0 08   
	LDA #$17				 ; $b9c3: A9 17   
	JSR $baef				; $b9c5: 20 EF BA ; -> sub_BAEF
	JMP $b9f0				; $b9c8: 4C F0 B9
loc_B9CB:
	LDA #$18				 ; $b9cb: A9 18   
	JSR $baef				; $b9cd: 20 EF BA ; -> sub_BAEF
	LDX $db				  ; $b9d0: A6 DB   
	BRK					  ; $b9d2: 00	  
	ROR					  ; $b9d3: 6A	  
	.db $53			  ; $b9d4 - Unknown opcode
	TAX					  ; $b9d5: AA	  
	BEQ $b9e0				; $b9d6: F0 08   
	BRK					  ; $b9d8: 00	  
	.db $83			  ; $b9d9 - Unknown opcode
	.db $2b			  ; $b9da - Unknown opcode
	LDA #$19				 ; $b9db: A9 19   
	JSR $baef				; $b9dd: 20 EF BA ; -> sub_BAEF
loc_B9E0:
	JSR $ba10				; $b9e0: 20 10 BA ; -> sub_BA10
	BCC $b9ed				; $b9e3: 90 08   
	LDA #$1a				 ; $b9e5: A9 1A   
	JSR $baef				; $b9e7: 20 EF BA ; -> sub_BAEF
	JMP $b9ff				; $b9ea: 4C FF B9
loc_B9ED:
	JSR $ba82				; $b9ed: 20 82 BA ; -> sub_BA82
loc_B9F0:
	JMP $b9ff				; $b9f0: 4C FF B9
loc_B9F3:
	LDA $07c5				; $b9f3: AD C5 07
	CMP #$02				 ; $b9f6: C9 02	; Compare with 2
	BNE $ba02				; $b9f8: D0 08   
	LDA #$1b				 ; $b9fa: A9 1B   
	JSR $baef				; $b9fc: 20 EF BA ; -> sub_BAEF
loc_B9FF:
	BRK					  ; $b9ff: 00	  
	.db $83			  ; $ba00 - Unknown opcode
	.db $2b			  ; $ba01 - Unknown opcode
loc_BA02:
	LDA #$1c				 ; $ba02: A9 1C   
	JSR $baef				; $ba04: 20 EF BA ; -> sub_BAEF
	JMP $b83d				; $ba07: 4C 3D B8
loc_BA0A:
	LDA #$1d				 ; $ba0a: A9 1D   
	JSR $baef				; $ba0c: 20 EF BA ; -> sub_BAEF
	RTS					  ; $ba0f: 60	  

; ---- Subroutine at $ba10 (Bank 21) ----
sub_BA10:
	LDA $dd				  ; $ba10: A5 DD   
	BPL $ba1e				; $ba12: 10 0A   
	BRK					  ; $ba14: 00	  
	.db $0c			  ; $ba15 - Unknown opcode
	.db $0f			  ; $ba16 - Unknown opcode
	BCC $ba1e				; $ba17: 90 05   
	JSR $bac0				; $ba19: 20 C0 BA ; -> sub_BAC0
	SEC					  ; $ba1c: 38	  
	RTS					  ; $ba1d: 60	  
loc_BA1E:
	CLC					  ; $ba1e: 18	  
	RTS					  ; $ba1f: 60	  

; ---- Subroutine at $ba20 (Bank 21) ----
sub_BA20:
	LDX $db				  ; $ba20: A6 DB   
	LDA #$6a				 ; $ba22: A9 6A   
	JSR $b7b5				; $ba24: 20 B5 B7 ; -> sub_B7B5
	CMP #$ff				 ; $ba27: C9 FF	; Compare with 255
	BNE $ba2d				; $ba29: D0 02   
	SEC					  ; $ba2b: 38	  
	RTS					  ; $ba2c: 60	  
loc_BA2D:
	STA $df				  ; $ba2d: 85 DF   
	LDX $db				  ; $ba2f: A6 DB   
	BRK					  ; $ba31: 00	  
	BIT $8573				; $ba32: 2C 73 85
	.db $dc			  ; $ba35 - Unknown opcode
	STA $f9				  ; $ba36: 85 F9   
	LDA $73				  ; $ba38: A5 73   
	STA $dd				  ; $ba3a: 85 DD   
	CLC					  ; $ba3c: 18	  
	RTS					  ; $ba3d: 60	  

; ---- Subroutine at $ba3e (Bank 21) ----
sub_BA3E:
	LDA $dc				  ; $ba3e: A5 DC   
	BRK					  ; $ba40: 00	  
	.db $0b			  ; $ba41 - Unknown opcode
	.db $0f			  ; $ba42 - Unknown opcode
	CPX #$04				 ; $ba43: E0 04   
	BEQ $ba53				; $ba45: F0 0C   
	LDX $db				  ; $ba47: A6 DB   
	BRK					  ; $ba49: 00	  
	.db $2b			  ; $ba4a - Unknown opcode
	.db $53			  ; $ba4b - Unknown opcode
	TAX					  ; $ba4c: AA	  
	LDA $dc				  ; $ba4d: A5 DC   
	BRK					  ; $ba4f: 00	  
	ASL					  ; $ba50: 0A	  
	.db $0f			  ; $ba51 - Unknown opcode
	RTS					  ; $ba52: 60	  
loc_BA53:
	SEC					  ; $ba53: 38	  
	RTS					  ; $ba54: 60	  

; ---- Subroutine at $ba55 (Bank 21) ----
sub_BA55:
	LDX $db				  ; $ba55: A6 DB   
	BRK					  ; $ba57: 00	  
	AND $c953				; $ba58: 2D 53 C9
	PHP					  ; $ba5b: 08	  
	RTS					  ; $ba5c: 60	  

; ---- Subroutine at $ba5d (Bank 21) ----
sub_BA5D:
	JSR $ba73				; $ba5d: 20 73 BA ; -> sub_BA73
	JSR $a47c				; $ba60: 20 7C A4 ; -> sub_A47C
	BRK					  ; $ba63: 00	  
	LSR					  ; $ba64: 4A	  
	.db $33			  ; $ba65 - Unknown opcode
	LDA $72				  ; $ba66: A5 72   
	CMP $fd				  ; $ba68: C5 FD   
	LDA $73				  ; $ba6a: A5 73   
	SBC $fe				  ; $ba6c: E5 FE	; Arithmetic
	LDA $74				  ; $ba6e: A5 74   
	SBC $ff				  ; $ba70: E5 FF	; Arithmetic
	RTS					  ; $ba72: 60	  

; ---- Subroutine at $ba73 (Bank 21) ----
sub_BA73:
	STA $df				  ; $ba73: 85 DF   
	TAX					  ; $ba75: AA	  
	LDA $07bd,X			  ; $ba76: BD BD 07
	STA $dc				  ; $ba79: 85 DC   
	STA tmp0				 ; $ba7b: 85 00   
	STA $f9				  ; $ba7d: 85 F9   
	JMP $b2cf				; $ba7f: 4C CF B2

; ---- Subroutine at $ba82 (Bank 21) ----
sub_BA82:
	LDA $dc				  ; $ba82: A5 DC   
	STA tmp0				 ; $ba84: 85 00   
	JSR $b35f				; $ba86: 20 5F B3 ; -> sub_B35F
	LDA tmp1				 ; $ba89: A5 01   
	STA $70				  ; $ba8b: 85 70   
	LDA tmp2				 ; $ba8d: A5 02   
	STA $71				  ; $ba8f: 85 71   
	LDA tmp0				 ; $ba91: A5 00   
	BRK					  ; $ba93: 00	  
	.db $4b			  ; $ba94 - Unknown opcode
	.db $73			  ; $ba95 - Unknown opcode
	LDX $db				  ; $ba96: A6 DB   
	LDA $df				  ; $ba98: A5 DF   
	BRK					  ; $ba9a: 00	  
	BMI $bb10				; $ba9b: 30 73   
	JMP $a6b7				; $ba9d: 4C B7 A6

; ---- Subroutine at $baa0 (Bank 21) ----
sub_BAA0:
	LDA $dc				  ; $baa0: A5 DC   
	STA tmp0				 ; $baa2: 85 00   
	JSR $b2cf				; $baa4: 20 CF B2 ; -> sub_B2CF
	LDA tmp1				 ; $baa7: A5 01   
	STA $70				  ; $baa9: 85 70   
	LDA tmp2				 ; $baab: A5 02   
	STA $71				  ; $baad: 85 71   
	LDA tmp0				 ; $baaf: A5 00   
	BRK					  ; $bab1: 00	  
	JMP $a673				; $bab2: 4C 73 A6
	.db $db			  ; $bab5 - Unknown opcode
	LDA $dc				  ; $bab6: A5 DC   
	AND #$7f				 ; $bab8: 29 7F   
	BRK					  ; $baba: 00	  
	ROL $4c73				; $babb: 2E 73 4C
	.db $b7			  ; $babe - Unknown opcode
	LDX tmp0				 ; $babf: A6 00   
	.db $04			  ; $bac1 - Unknown opcode
	.db $9f			  ; $bac2 - Unknown opcode
	BRK					  ; $bac3: 00	  
	.db $12			  ; $bac4 - Unknown opcode
	.db $fb			  ; $bac5 - Unknown opcode
	BRK					  ; $bac6: 00	  
	.db $07			  ; $bac7 - Unknown opcode
	.db $9f			  ; $bac8 - Unknown opcode
	BRK					  ; $bac9: 00	  
	ORA #$9f				 ; $baca: 09 9F   
	RTS					  ; $bacc: 60	  

; ---- Subroutine at $bacd (Bank 21) ----
sub_BACD:
	LDA $07c5				; $bacd: AD C5 07
	CMP #$02				 ; $bad0: C9 02	; Compare with 2
	BNE $baee				; $bad2: D0 1A   
	LDA map_number		   ; $bad4: A5 63   
	CMP #$18				 ; $bad6: C9 18	; Compare with 24
	BNE $baee				; $bad8: D0 14   
	LDA submap_number		; $bada: A5 64   
	CMP #$00				 ; $badc: C9 00	; Compare with 0
	BNE $baee				; $bade: D0 0E   
	LDA $dc				  ; $bae0: A5 DC   
	CMP #$53				 ; $bae2: C9 53	; Compare with 83
	BEQ $baea				; $bae4: F0 04   
	LDA #$00				 ; $bae6: A9 00   
	BEQ $baec				; $bae8: F0 02   
loc_BAEA:
	LDA #$79				 ; $baea: A9 79   
loc_BAEC:
	STA $dc				  ; $baec: 85 DC   
loc_BAEE:
	RTS					  ; $baee: 60	  

; ---- Subroutine at $baef (Bank 21) ----
sub_BAEF:
	ASL					  ; $baef: 0A	  
	TAY					  ; $baf0: A8	  
	LDX $07c5				; $baf1: AE C5 07
	CPX #$01				 ; $baf4: E0 01   
	BNE $bb02				; $baf6: D0 0A   
	LDA $bb1a,Y			  ; $baf8: B9 1A BB
	TAX					  ; $bafb: AA	  
	LDA $bb1b,Y			  ; $bafc: B9 1B BB
	JMP $9919				; $baff: 4C 19 99
loc_BB02:
	CPX #$03				 ; $bb02: E0 03   
	BNE $bb10				; $bb04: D0 0A   
	LDA $bb92,Y			  ; $bb06: B9 92 BB
	TAX					  ; $bb09: AA	  
	LDA $bb93,Y			  ; $bb0a: B9 93 BB
	JMP $9919				; $bb0d: 4C 19 99
loc_BB10:
	LDA $bb56,Y			  ; $bb10: B9 56 BB
	TAX					  ; $bb13: AA	  
	LDA $bb57,Y			  ; $bb14: B9 57 BB
	JMP $9919				; $bb17: 4C 19 99
	.db $02			  ; $bb1a - Unknown opcode
	.db $5a			  ; $bb1b - Unknown opcode
	.db $02			  ; $bb1c - Unknown opcode
	.db $5b			  ; $bb1d - Unknown opcode
	.db $02			  ; $bb1e - Unknown opcode
	.db $5c			  ; $bb1f - Unknown opcode
	.db $02			  ; $bb20 - Unknown opcode
	EOR $5e02,X			  ; $bb21: 5D 02 5E
	.db $04			  ; $bb24 - Unknown opcode
	.db $23			  ; $bb25 - Unknown opcode
	.db $04			  ; $bb26 - Unknown opcode
	BIT tmp2				 ; $bb27: 24 02   
	.db $5f			  ; $bb29 - Unknown opcode
	.db $02			  ; $bb2a - Unknown opcode
	ADC (tmp2,X)			 ; $bb2b: 61 02	; Arithmetic
	RTS					  ; $bb2d: 60	  
	.db $02			  ; $bb2e - Unknown opcode
	.db $62			  ; $bb2f - Unknown opcode
	.db $02			  ; $bb30 - Unknown opcode
	.db $63			  ; $bb31 - Unknown opcode
	.db $02			  ; $bb32 - Unknown opcode
	.db $64			  ; $bb33 - Unknown opcode
	.db $02			  ; $bb34 - Unknown opcode
	ADC tmp2				 ; $bb35: 65 02	; Arithmetic
	ROR tmp2				 ; $bb37: 66 02   
	.db $67			  ; $bb39 - Unknown opcode
	.db $04			  ; $bb3a - Unknown opcode
	AND ptr0_lo			  ; $bb3b: 25 04   
	ROL tmp2				 ; $bb3d: 26 02   
	PLA					  ; $bb3f: 68	  
	.db $02			  ; $bb40 - Unknown opcode
	ADC #$02				 ; $bb41: 69 02	; Arithmetic
	ROR					  ; $bb43: 6A	  
	.db $02			  ; $bb44 - Unknown opcode
	JMP ($6d02)			  ; $bb45: 6C 02 6D
	.db $02			  ; $bb48 - Unknown opcode
	ROR $6f02				; $bb49: 6E 02 6F
	.db $02			  ; $bb4c - Unknown opcode
	BVS $bb51				; $bb4d: 70 02   
	ADC (tmp0),Y			 ; $bb4f: 71 00	; Arithmetic
loc_BB51:
	BRK					  ; $bb51: 00	  
	.db $02			  ; $bb52 - Unknown opcode
	.db $8f			  ; $bb53 - Unknown opcode
	.db $02			  ; $bb54 - Unknown opcode
	.db $72			  ; $bb55 - Unknown opcode
	.db $02			  ; $bb56 - Unknown opcode
	BRK					  ; $bb57: 00	  
	.db $02			  ; $bb58 - Unknown opcode
	ORA (tmp2,X)			 ; $bb59: 01 02   
	.db $02			  ; $bb5b - Unknown opcode
	.db $02			  ; $bb5c - Unknown opcode
	.db $03			  ; $bb5d - Unknown opcode
	.db $02			  ; $bb5e - Unknown opcode
	.db $04			  ; $bb5f - Unknown opcode
	.db $04			  ; $bb60 - Unknown opcode
	.db $23			  ; $bb61 - Unknown opcode
	.db $04			  ; $bb62 - Unknown opcode
	BIT tmp2				 ; $bb63: 24 02   
	ORA tmp2				 ; $bb65: 05 02   
	.db $07			  ; $bb67 - Unknown opcode
	.db $02			  ; $bb68 - Unknown opcode
	ASL tmp2				 ; $bb69: 06 02   
	PHP					  ; $bb6b: 08	  
	.db $02			  ; $bb6c - Unknown opcode
	ORA #$02				 ; $bb6d: 09 02   
	STX $0a02				; $bb6f: 8E 02 0A
	.db $02			  ; $bb72 - Unknown opcode
	.db $0b			  ; $bb73 - Unknown opcode
	.db $02			  ; $bb74 - Unknown opcode
	ORA $2504				; $bb75: 0D 04 25
	.db $04			  ; $bb78 - Unknown opcode
	ROL tmp2				 ; $bb79: 26 02   
	ASL $0f02				; $bb7b: 0E 02 0F
	.db $02			  ; $bb7e - Unknown opcode
	BPL $bb83				; $bb7f: 10 02   
	ORA (tmp2),Y			 ; $bb81: 11 02   
loc_BB83:
	.db $12			  ; $bb83 - Unknown opcode
	.db $02			  ; $bb84 - Unknown opcode
	.db $13			  ; $bb85 - Unknown opcode
	.db $02			  ; $bb86 - Unknown opcode
	.db $14			  ; $bb87 - Unknown opcode
	.db $02			  ; $bb88 - Unknown opcode
	ORA tmp2,X			   ; $bb89: 15 02   
	ASL tmp2,X			   ; $bb8b: 16 02   
	CLC					  ; $bb8d: 18	  
	.db $02			  ; $bb8e - Unknown opcode
	ORA $1a02,Y			  ; $bb8f: 19 02 1A
	.db $02			  ; $bb92 - Unknown opcode
	.db $73			  ; $bb93 - Unknown opcode
	.db $02			  ; $bb94 - Unknown opcode
	.db $74			  ; $bb95 - Unknown opcode
	.db $02			  ; $bb96 - Unknown opcode
	ADC tmp2,X			   ; $bb97: 75 02	; Arithmetic
	ROR tmp2,X			   ; $bb99: 76 02   
	.db $77			  ; $bb9b - Unknown opcode
	.db $04			  ; $bb9c - Unknown opcode
	.db $23			  ; $bb9d - Unknown opcode
	.db $04			  ; $bb9e - Unknown opcode
	BIT tmp2				 ; $bb9f: 24 02   
	SEI					  ; $bba1: 78	  
	.db $02			  ; $bba2 - Unknown opcode
	.db $7b			  ; $bba3 - Unknown opcode
	.db $02			  ; $bba4 - Unknown opcode
	ADC $7c02,Y			  ; $bba5: 79 02 7C ; Arithmetic
	.db $02			  ; $bba8 - Unknown opcode
	ADC $8b02,X			  ; $bba9: 7D 02 8B ; Arithmetic
	.db $02			  ; $bbac - Unknown opcode
	ROR $7f02,X			  ; $bbad: 7E 02 7F
	.db $02			  ; $bbb0 - Unknown opcode
	.db $80			  ; $bbb1 - Unknown opcode
	.db $04			  ; $bbb2 - Unknown opcode
	AND ptr0_lo			  ; $bbb3: 25 04   
	ROL tmp2				 ; $bbb5: 26 02   
	STA (tmp2,X)			 ; $bbb7: 81 02   
	.db $82			  ; $bbb9 - Unknown opcode
	.db $02			  ; $bbba - Unknown opcode
	.db $7a			  ; $bbbb - Unknown opcode
	.db $02			  ; $bbbc - Unknown opcode
	STY tmp2				 ; $bbbd: 84 02   
	STX tmp2				 ; $bbbf: 86 02   
	.db $87			  ; $bbc1 - Unknown opcode
	.db $02			  ; $bbc2 - Unknown opcode
	DEY					  ; $bbc3: 88	  
	.db $02			  ; $bbc4 - Unknown opcode
	.db $89			  ; $bbc5 - Unknown opcode
	.db $02			  ; $bbc6 - Unknown opcode
	TXA					  ; $bbc7: 8A	  
	BRK					  ; $bbc8: 00	  
	BRK					  ; $bbc9: 00	  
	.db $02			  ; $bbca - Unknown opcode
	STY $8d02				; $bbcb: 8C 02 8D
loc_BBCE:
	JSR $b7fb				; $bbce: 20 FB B7 ; -> sub_B7FB
	BRK					  ; $bbd1: 00	  
	.db $62			  ; $bbd2 - Unknown opcode
	.db $33			  ; $bbd3 - Unknown opcode
	STA $da				  ; $bbd4: 85 DA   
	BRK					  ; $bbd6: 00	  
	SEC					  ; $bbd7: 38	  
	.db $2b			  ; $bbd8 - Unknown opcode
loc_BBD9:
	LDA #$69				 ; $bbd9: A9 69   
	JSR $b7b5				; $bbdb: 20 B5 B7 ; -> sub_B7B5
	LDA #$44				 ; $bbde: A9 44   
	JSR $b7b5				; $bbe0: 20 B5 B7 ; -> sub_B7B5
	CMP #$00				 ; $bbe3: C9 00	; Compare with 0
	BEQ $bbf1				; $bbe5: F0 0A   
	CMP #$01				 ; $bbe7: C9 01	; Compare with 1
	BEQ $bbee				; $bbe9: F0 03   
	JMP $bec8				; $bbeb: 4C C8 BE
loc_BBEE:
	JMP $bd06				; $bbee: 4C 06 BD
loc_BBF1:
	BRK					  ; $bbf1: 00	  
	AND $a92b,Y			  ; $bbf2: 39 2B A9
	EOR $20				  ; $bbf5: 45 20   
	LDA $b7,X				; $bbf7: B5 B7   
	CMP #$00				 ; $bbf9: C9 00	; Compare with 0
	BEQ $bc07				; $bbfb: F0 0A   
	CMP #$01				 ; $bbfd: C9 01	; Compare with 1
	BEQ $bc04				; $bbff: F0 03   
	JMP $bec2				; $bc01: 4C C2 BE
loc_BC04:
	JMP $bc7d				; $bc04: 4C 7D BC
loc_BC07:
	JSR $b4e3				; $bc07: 20 E3 B4 ; -> sub_B4E3
	LDA tmp0				 ; $bc0a: A5 00   
	CMP #$e7				 ; $bc0c: C9 E7	; Compare with 231
	LDA tmp1				 ; $bc0e: A5 01   
	SBC #$03				 ; $bc10: E9 03	; Arithmetic
	BMI $bc1a				; $bc12: 30 06   
loc_BC14:
	BRK					  ; $bc14: 00	  
	.db $92			  ; $bc15 - Unknown opcode
	.db $2b			  ; $bc16 - Unknown opcode
	JMP $bebc				; $bc17: 4C BC BE
loc_BC1A:
	BRK					  ; $bc1a: 00	  
	.db $3a			  ; $bc1b - Unknown opcode
	.db $2b			  ; $bc1c - Unknown opcode
	LDA #$46				 ; $bc1d: A9 46   
	JSR $b7b5				; $bc1f: 20 B5 B7 ; -> sub_B7B5
	TAX					  ; $bc22: AA	  
	BEQ $bc29				; $bc23: F0 04   
	CMP #$ff				 ; $bc25: C9 FF	; Compare with 255
	BNE $bc2c				; $bc27: D0 03   
loc_BC29:
	JMP $beb7				; $bc29: 4C B7 BE
loc_BC2C:
	STA tmp0				 ; $bc2c: 85 00   
	STA $dc				  ; $bc2e: 85 DC   
	LDA #$00				 ; $bc30: A9 00   
	STA tmp1				 ; $bc32: 85 01   
	JSR $becc				; $bc34: 20 CC BE ; -> sub_BECC
	LDA tmp1				 ; $bc37: A5 01   
	STA $70				  ; $bc39: 85 70   
	LDA tmp2				 ; $bc3b: A5 02   
	STA $71				  ; $bc3d: 85 71   
	LDA tmp0				 ; $bc3f: A5 00   
	BRK					  ; $bc41: 00	  
	JMP $b073				; $bc42: 4C 73 B0
	ASL tmp0				 ; $bc45: 06 00   
	.db $3b			  ; $bc47 - Unknown opcode
	.db $2b			  ; $bc48 - Unknown opcode
	JMP $bebf				; $bc49: 4C BF BE
	JSR $b4e3				; $bc4c: 20 E3 B4 ; -> sub_B4E3
	LDA tmp0				 ; $bc4f: A5 00   
	CLC					  ; $bc51: 18	  
	ADC $dc				  ; $bc52: 65 DC	; Arithmetic
	STA tmp2				 ; $bc54: 85 02   
	LDA tmp1				 ; $bc56: A5 01   
	ADC #$00				 ; $bc58: 69 00	; Arithmetic
	STA tmp3				 ; $bc5a: 85 03   
	LDA tmp2				 ; $bc5c: A5 02   
	CMP #$e8				 ; $bc5e: C9 E8	; Compare with 232
	LDA tmp3				 ; $bc60: A5 03   
	SBC #$03				 ; $bc62: E9 03	; Arithmetic
	BCC $bc6c				; $bc64: 90 06   
	BRK					  ; $bc66: 00	  
	.db $4b			  ; $bc67 - Unknown opcode
	.db $33			  ; $bc68 - Unknown opcode
	JMP $bc14				; $bc69: 4C 14 BC
loc_BC6C:
	LDA $dc				  ; $bc6c: A5 DC   
	STA tmp0				 ; $bc6e: 85 00   
	LDA #$00				 ; $bc70: A9 00   
	STA tmp1				 ; $bc72: 85 01   
	JSR $b4b9				; $bc74: 20 B9 B4 ; -> sub_B4B9
	BRK					  ; $bc77: 00	  
	.db $3c			  ; $bc78 - Unknown opcode
	.db $2b			  ; $bc79 - Unknown opcode
	JMP $bebc				; $bc7a: 4C BC BE
loc_BC7D:
	JSR $b38a				; $bc7d: 20 8A B3 ; -> sub_B38A
	CMP #$80				 ; $bc80: C9 80	; Compare with 128
	BCC $bc8a				; $bc82: 90 06   
	BRK					  ; $bc84: 00	  
	BCC $bcb2				; $bc85: 90 2B   
	JMP $bebc				; $bc87: 4C BC BE
loc_BC8A:
	LDA $da				  ; $bc8a: A5 DA   
	CMP #$01				 ; $bc8c: C9 01	; Compare with 1
	BEQ $bc9f				; $bc8e: F0 0F   
	BRK					  ; $bc90: 00	  
	AND $a92b,X			  ; $bc91: 3D 2B A9
	EOR #$20				 ; $bc94: 49 20   
	LDA $b7,X				; $bc96: B5 B7   
	CMP #$ff				 ; $bc98: C9 FF	; Compare with 255
	BNE $bca1				; $bc9a: D0 05   
	JMP $beb7				; $bc9c: 4C B7 BE
loc_BC9F:
	LDA #$00				 ; $bc9f: A9 00   
loc_BCA1:
	STA $db				  ; $bca1: 85 DB   
	TAX					  ; $bca3: AA	  
	STX $f9				  ; $bca4: 86 F9   
	BRK					  ; $bca6: 00	  
	.db $2b			  ; $bca7 - Unknown opcode
	.db $53			  ; $bca8 - Unknown opcode
	CMP #$08				 ; $bca9: C9 08	; Compare with 8
	BCC $bcb3				; $bcab: 90 06   
	BRK					  ; $bcad: 00	  
	.db $0c			  ; $bcae - Unknown opcode
	.db $2b			  ; $bcaf - Unknown opcode
	JMP $bebf				; $bcb0: 4C BF BE
loc_BCB3:
	BRK					  ; $bcb3: 00	  
	AND $aa53				; $bcb4: 2D 53 AA
	BNE $bcbf				; $bcb7: D0 06   
	BRK					  ; $bcb9: 00	  
	ROL $4c2b,X			  ; $bcba: 3E 2B 4C
	.db $bf			  ; $bcbd - Unknown opcode
	LDX $3f00,Y			  ; $bcbe: BE 00 3F
	.db $2b			  ; $bcc1 - Unknown opcode
	JSR $ba20				; $bcc2: 20 20 BA ; -> sub_BA20
	BCC $bcca				; $bcc5: 90 03   
	JMP $beb7				; $bcc7: 4C B7 BE
loc_BCCA:
	BRK					  ; $bcca: 00	  
	RTI					  ; $bccb: 40	  
	.db $2b			  ; $bccc - Unknown opcode
	JSR $9ac9				; $bccd: 20 C9 9A ; -> sub_9AC9
	BEQ $bcd5				; $bcd0: F0 03   
	JMP $beb7				; $bcd2: 4C B7 BE
loc_BCD5:
	JSR $ba10				; $bcd5: 20 10 BA ; -> sub_BA10
	BCC $bcdf				; $bcd8: 90 05   
	BRK					  ; $bcda: 00	  
	EOR ($2b,X)			  ; $bcdb: 41 2B   
	BCS $bcee				; $bcdd: B0 0F   
loc_BCDF:
	BRK					  ; $bcdf: 00	  
	.db $42			  ; $bce0 - Unknown opcode
	.db $2b			  ; $bce1 - Unknown opcode
	LDA $dc				  ; $bce2: A5 DC   
	JSR $b3a1				; $bce4: 20 A1 B3 ; -> sub_B3A1
	LDX $db				  ; $bce7: A6 DB   
	LDA $df				  ; $bce9: A5 DF   
	BRK					  ; $bceb: 00	  
	BMI $bd61				; $bcec: 30 73   
loc_BCEE:
	JSR $b38a				; $bcee: 20 8A B3 ; -> sub_B38A
	CMP #$80				 ; $bcf1: C9 80	; Compare with 128
	BCS $bd00				; $bcf3: B0 0B   
	BRK					  ; $bcf5: 00	  
	.db $83			  ; $bcf6 - Unknown opcode
	.db $2b			  ; $bcf7 - Unknown opcode
	BRK					  ; $bcf8: 00	  
	.db $43			  ; $bcf9 - Unknown opcode
	.db $2b			  ; $bcfa - Unknown opcode
	JSR $9ac9				; $bcfb: 20 C9 9A ; -> sub_9AC9
	BEQ $bd03				; $bcfe: F0 03   
loc_BD00:
	JMP $bec2				; $bd00: 4C C2 BE
loc_BD03:
	JMP $bc8a				; $bd03: 4C 8A BC
loc_BD06:
	BRK					  ; $bd06: 00	  
	.db $44			  ; $bd07 - Unknown opcode
	.db $2b			  ; $bd08 - Unknown opcode
	LDA #$45				 ; $bd09: A9 45   
	JSR $b7b5				; $bd0b: 20 B5 B7 ; -> sub_B7B5
	CMP #$00				 ; $bd0e: C9 00	; Compare with 0
	BEQ $bd1c				; $bd10: F0 0A   
	CMP #$01				 ; $bd12: C9 01	; Compare with 1
	BEQ $bd19				; $bd14: F0 03   
	JMP $bec2				; $bd16: 4C C2 BE
loc_BD19:
	JMP $bdaa				; $bd19: 4C AA BD
loc_BD1C:
	JSR $b4e3				; $bd1c: 20 E3 B4 ; -> sub_B4E3
	LDA tmp0				 ; $bd1f: A5 00   
	ORA tmp1				 ; $bd21: 05 01   
	BNE $bd2b				; $bd23: D0 06   
	BRK					  ; $bd25: 00	  
	EOR $2b				  ; $bd26: 45 2B   
	JMP $bebc				; $bd28: 4C BC BE
loc_BD2B:
	JSR $becc				; $bd2b: 20 CC BE ; -> sub_BECC
	BRK					  ; $bd2e: 00	  
	LSR $2b				  ; $bd2f: 46 2B   
loc_BD31:
	LDA #$46				 ; $bd31: A9 46   
	JSR $b7b5				; $bd33: 20 B5 B7 ; -> sub_B7B5
	TAX					  ; $bd36: AA	  
	BEQ $bd3d				; $bd37: F0 04   
	CMP #$ff				 ; $bd39: C9 FF	; Compare with 255
	BNE $bd40				; $bd3b: D0 03   
loc_BD3D:
	JMP $beb7				; $bd3d: 4C B7 BE
loc_BD40:
	STA $e2				  ; $bd40: 85 E2   
	STA tmp0				 ; $bd42: 85 00   
	LDA #$00				 ; $bd44: A9 00   
	STA tmp1				 ; $bd46: 85 01   
	JSR $becc				; $bd48: 20 CC BE ; -> sub_BECC
	BRK					  ; $bd4b: 00	  
	STA ($2b),Y			  ; $bd4c: 91 2B   
	LDA $e2				  ; $bd4e: A5 E2   
	STA tmp0				 ; $bd50: 85 00   
	LDA #$00				 ; $bd52: A9 00   
	STA tmp1				 ; $bd54: 85 01   
	JSR $b4cb				; $bd56: 20 CB B4 ; -> sub_B4CB
	BCS $bd63				; $bd59: B0 08   
	BRK					  ; $bd5b: 00	  
	.db $83			  ; $bd5c - Unknown opcode
	.db $2b			  ; $bd5d - Unknown opcode
	BRK					  ; $bd5e: 00	  
	.db $47			  ; $bd5f - Unknown opcode
	.db $2b			  ; $bd60 - Unknown opcode
loc_BD61:
	BCS $bd31				; $bd61: B0 CE   
loc_BD63:
	LDA $e2				  ; $bd63: A5 E2   
	STA tmp0				 ; $bd65: 85 00   
	LDA #$00				 ; $bd67: A9 00   
	STA tmp1				 ; $bd69: 85 01   
	JSR $b4ee				; $bd6b: 20 EE B4 ; -> sub_B4EE
	LDA tmp1				 ; $bd6e: A5 01   
	STA $70				  ; $bd70: 85 70   
	LDA tmp2				 ; $bd72: A5 02   
	STA $71				  ; $bd74: 85 71   
	LDA tmp0				 ; $bd76: A5 00   
	BRK					  ; $bd78: 00	  
	.db $4b			  ; $bd79 - Unknown opcode
	.db $73			  ; $bd7a - Unknown opcode
	CMP tmp0				 ; $bd7b: C5 00   
	LDA $73				  ; $bd7d: A5 73   
	SBC tmp1				 ; $bd7f: E5 01	; Arithmetic
	LDA $74				  ; $bd81: A5 74   
	SBC tmp2				 ; $bd83: E5 02	; Arithmetic
	BCC $bd8d				; $bd85: 90 06   
	BRK					  ; $bd87: 00	  
	PHA					  ; $bd88: 48	  
	.db $2b			  ; $bd89 - Unknown opcode
loc_BD8A:
	JMP $bebc				; $bd8a: 4C BC BE
loc_BD8D:
	LDA $73				  ; $bd8d: A5 73   
	STA $70				  ; $bd8f: 85 70   
	LDA $74				  ; $bd91: A5 74   
	STA $71				  ; $bd93: 85 71   
	LDA $72				  ; $bd95: A5 72   
	BRK					  ; $bd97: 00	  
	JMP $a573				; $bd98: 4C 73 A5
	.db $e2			  ; $bd9b - Unknown opcode
	STA tmp0				 ; $bd9c: 85 00   
	LDA #$00				 ; $bd9e: A9 00   
	STA tmp1				 ; $bda0: 85 01   
	JSR $b4b9				; $bda2: 20 B9 B4 ; -> sub_B4B9
	BRK					  ; $bda5: 00	  
	.db $2b			  ; $bda6 - Unknown opcode
	.db $4b			  ; $bda7 - Unknown opcode
	BCS $bd8a				; $bda8: B0 E0   
loc_BDAA:
	JSR $b38a				; $bdaa: 20 8A B3 ; -> sub_B38A
	CMP #$00				 ; $bdad: C9 00	; Compare with 0
	BNE $bdb7				; $bdaf: D0 06   
	BRK					  ; $bdb1: 00	  
	EOR #$2b				 ; $bdb2: 49 2B   
	JMP $bebc				; $bdb4: 4C BC BE
loc_BDB7:
	BRK					  ; $bdb7: 00	  
	LSR					  ; $bdb8: 4A	  
	.db $2b			  ; $bdb9 - Unknown opcode
	LDA #$47				 ; $bdba: A9 47   
	JSR $b7b5				; $bdbc: 20 B5 B7 ; -> sub_B7B5
	CMP #$ff				 ; $bdbf: C9 FF	; Compare with 255
	BNE $bdc6				; $bdc1: D0 03   
	JMP $beb7				; $bdc3: 4C B7 BE
loc_BDC6:
	TAX					  ; $bdc6: AA	  
	STA $dd				  ; $bdc7: 85 DD   
	LDA $61db,X			  ; $bdc9: BD DB 61
	STA $dc				  ; $bdcc: 85 DC   
	STA $f9				  ; $bdce: 85 F9   
	BRK					  ; $bdd0: 00	  
	.db $4b			  ; $bdd1 - Unknown opcode
	.db $2b			  ; $bdd2 - Unknown opcode
	JSR $9ac9				; $bdd3: 20 C9 9A ; -> sub_9AC9
	BEQ $bddb				; $bdd6: F0 03   
	JMP $beb7				; $bdd8: 4C B7 BE
loc_BDDB:
	BRK					  ; $bddb: 00	  
	LSR					  ; $bddc: 4A	  
	.db $33			  ; $bddd - Unknown opcode
	CMP #$0a				 ; $bdde: C9 0A	; Compare with 10
	LDA $73				  ; $bde0: A5 73   
	SBC #$00				 ; $bde2: E9 00	; Arithmetic
	LDA $74				  ; $bde4: A5 74   
	SBC #$00				 ; $bde6: E9 00	; Arithmetic
	BCS $be0a				; $bde8: B0 20   
	BRK					  ; $bdea: 00	  
	JMP $202b				; $bdeb: 4C 2B 20
	.db $e3			  ; $bdee - Unknown opcode
	LDY $a5,X				; $bdef: B4 A5   
	BRK					  ; $bdf1: 00	  
	ORA tmp1				 ; $bdf2: 05 01   
	BNE $bdf9				; $bdf4: D0 03   
	JMP $bebc				; $bdf6: 4C BC BE
loc_BDF9:
	BRK					  ; $bdf9: 00	  
	.db $83			  ; $bdfa - Unknown opcode
	.db $2b			  ; $bdfb - Unknown opcode
	BRK					  ; $bdfc: 00	  
	EOR $202b				; $bdfd: 4D 2B 20
	CMP #$9a				 ; $be00: C9 9A	; Compare with 154
	BEQ $be07				; $be02: F0 03   
	JMP $bebc				; $be04: 4C BC BE
loc_BE07:
	JMP $bd1c				; $be07: 4C 1C BD
loc_BE0A:
	LDA $da				  ; $be0a: A5 DA   
	CMP #$01				 ; $be0c: C9 01	; Compare with 1
	BEQ $be21				; $be0e: F0 11   
	BRK					  ; $be10: 00	  
	LSR $a62b				; $be11: 4E 2B A6
	.db $dc			  ; $be14 - Unknown opcode
	LDA #$40				 ; $be15: A9 40   
	JSR $b7b5				; $be17: 20 B5 B7 ; -> sub_B7B5
	CMP #$ff				 ; $be1a: C9 FF	; Compare with 255
	BNE $be23				; $be1c: D0 05   
	JMP $beb7				; $be1e: 4C B7 BE
loc_BE21:
	LDA #$00				 ; $be21: A9 00   
loc_BE23:
	STA $db				  ; $be23: 85 DB   
	STA $f9				  ; $be25: 85 F9   
	TAX					  ; $be27: AA	  
	BRK					  ; $be28: 00	  
	.db $2b			  ; $be29 - Unknown opcode
	.db $73			  ; $be2a - Unknown opcode
	CMP #$08				 ; $be2b: C9 08	; Compare with 8
	BCC $be37				; $be2d: 90 08   
	BRK					  ; $be2f: 00	  
	BIT $4b				  ; $be30: 24 4B   
	BRK					  ; $be32: 00	  
	.db $83			  ; $be33 - Unknown opcode
	.db $2b			  ; $be34 - Unknown opcode
	BCS $be4d				; $be35: B0 16   
loc_BE37:
	BRK					  ; $be37: 00	  
	AND $c933				; $be38: 2D 33 C9
	PHP					  ; $be3b: 08	  
	BCC $be58				; $be3c: 90 1A   
	BRK					  ; $be3e: 00	  
	.db $4f			  ; $be3f - Unknown opcode
	.db $2b			  ; $be40 - Unknown opcode
	LDA $da				  ; $be41: A5 DA   
	CMP #$01				 ; $be43: C9 01	; Compare with 1
	BNE $be4d				; $be45: D0 06   
	BRK					  ; $be47: 00	  
	BVC $be75				; $be48: 50 2B   
	JMP $bebc				; $be4a: 4C BC BE
loc_BE4D:
	BRK					  ; $be4d: 00	  
	EOR ($2b),Y			  ; $be4e: 51 2B   
	JSR $9ac9				; $be50: 20 C9 9A ; -> sub_9AC9
	BEQ $be13				; $be53: F0 BE   
	JMP $beb7				; $be55: 4C B7 BE
loc_BE58:
	JSR $ba3e				; $be58: 20 3E BA ; -> sub_BA3E
	BCS $be71				; $be5b: B0 14   
	LDA $db				  ; $be5d: A5 DB   
	STA $f9				  ; $be5f: 85 F9   
	LDA $dc				  ; $be61: A5 DC   
	AND #$7f				 ; $be63: 29 7F   
	STA $fa				  ; $be65: 85 FA   
	BRK					  ; $be67: 00	  
	.db $52			  ; $be68 - Unknown opcode
	.db $2b			  ; $be69 - Unknown opcode
	JSR $9ac9				; $be6a: 20 C9 9A ; -> sub_9AC9
	BEQ $be71				; $be6d: F0 02   
	BNE $be4d				; $be6f: D0 DC   
loc_BE71:
	LDA $db				  ; $be71: A5 DB   
	BRK					  ; $be73: 00	  
	ROR					  ; $be74: 6A	  
loc_BE75:
	.db $33			  ; $be75 - Unknown opcode
	LDA #$00				 ; $be76: A9 00   
	BEQ $be7f				; $be78: F0 05   
	BRK					  ; $be7a: 00	  
	.db $53			  ; $be7b - Unknown opcode
	.db $2b			  ; $be7c - Unknown opcode
	BCS $be9b				; $be7d: B0 1C   
loc_BE7F:
	LDA $db				  ; $be7f: A5 DB   
	STA $6e				  ; $be81: 85 6E   
	BRK					  ; $be83: 00	  
	.db $42			  ; $be84 - Unknown opcode
	.db $33			  ; $be85 - Unknown opcode
	CMP #$01				 ; $be86: C9 01	; Compare with 1
	BNE $be8f				; $be88: D0 05   
	BRK					  ; $be8a: 00	  
	.db $54			  ; $be8b - Unknown opcode
	.db $2b			  ; $be8c - Unknown opcode
	BCS $be9b				; $be8d: B0 0C   
loc_BE8F:
	CMP #$02				 ; $be8f: C9 02	; Compare with 2
	BNE $be98				; $be91: D0 05   
	BRK					  ; $be93: 00	  
	EOR $2b,X				; $be94: 55 2B   
	BCS $be9b				; $be96: B0 03   
loc_BE98:
	BRK					  ; $be98: 00	  
	LSR $2b,X				; $be99: 56 2B   
loc_BE9B:
	LDX $db				  ; $be9b: A6 DB   
	LDA $dc				  ; $be9d: A5 DC   
	AND #$7f				 ; $be9f: 29 7F   
	BRK					  ; $bea1: 00	  
	ROL $a973				; $bea2: 2E 73 A9
	BRK					  ; $bea5: 00	  
	STA $70				  ; $bea6: 85 70   
	STA $71				  ; $bea8: 85 71   
	LDA #$0a				 ; $beaa: A9 0A   
	BRK					  ; $beac: 00	  
	JMP $a573				; $bead: 4C 73 A5
	CMP $ca20,X			  ; $beb0: DD 20 CA
	.db $b3			  ; $beb3 - Unknown opcode
	JMP $bebc				; $beb4: 4C BC BE
loc_BEB7:
	BRK					  ; $beb7: 00	  
	.db $57			  ; $beb8 - Unknown opcode
	.db $2b			  ; $beb9 - Unknown opcode
	BCS $bec2				; $beba: B0 06   
loc_BEBC:
	JSR $a6b7				; $bebc: 20 B7 A6 ; -> sub_A6B7
loc_BEBF:
	BRK					  ; $bebf: 00	  
	.db $83			  ; $bec0 - Unknown opcode
	.db $2b			  ; $bec1 - Unknown opcode
loc_BEC2:
	BRK					  ; $bec2: 00	  
	CLI					  ; $bec3: 58	  
	.db $2b			  ; $bec4 - Unknown opcode
	JMP $bbd9				; $bec5: 4C D9 BB
loc_BEC8:
	BRK					  ; $bec8: 00	  
	EOR $602b,Y			  ; $bec9: 59 2B 60

; ---- Subroutine at $becc (Bank 21) ----
sub_BECC:
	JSR $b4ee				; $becc: 20 EE B4 ; -> sub_B4EE
	JMP $a47c				; $becf: 4C 7C A4
	LDA $0553				; $bed2: AD 53 05
	AND #$7f				 ; $bed5: 29 7F   
	STA $0553				; $bed7: 8D 53 05
	LDA map_number		   ; $beda: A5 63   
	PHA					  ; $bedc: 48	  
	LDA submap_number		; $bedd: A5 64   
	PHA					  ; $bedf: 48	  
	LDA #$fe				 ; $bee0: A9 FE   
	STA submap_number		; $bee2: 85 64   
	STA map_number		   ; $bee4: 85 63   
	JSR $a4c9				; $bee6: 20 C9 A4 ; -> sub_A4C9
	JSR $c891				; $bee9: 20 91 C8 ; Call to fixed bank
	CMP #$10				 ; $beec: C9 10	; Compare with 16
	BCS $bef6				; $beee: B0 06   
	JSR $bf0e				; $bef0: 20 0E BF ; -> sub_BF0E
	JMP $bef9				; $bef3: 4C F9 BE
loc_BEF6:
	JSR $b833				; $bef6: 20 33 B8 ; -> sub_B833
loc_BEF9:
	JSR $d218				; $bef9: 20 18 D2 ; Call to fixed bank
	PLA					  ; $befc: 68	  
	STA submap_number		; $befd: 85 64   
	PLA					  ; $beff: 68	  
	STA map_number		   ; $bf00: 85 63   
	BRK					  ; $bf02: 00	  
	ORA #$9f				 ; $bf03: 09 9F   
	RTS					  ; $bf05: 60	  
loc_BF06:
	LDA #$50				 ; $bf06: A9 50   
	JSR $b7b5				; $bf08: 20 B5 B7 ; -> sub_B7B5
	BRK					  ; $bf0b: 00	  
	ORA $6f				  ; $bf0c: 05 6F   

; ---- Subroutine at $bf0e (Bank 21) ----
sub_BF0E:
	JSR $9ce5				; $bf0e: 20 E5 9C ; -> sub_9CE5
	BCS $bf18				; $bf11: B0 05   
	BRK					  ; $bf13: 00	  
	AND ($2b),Y			  ; $bf14: 31 2B   
	BCS $bf1b				; $bf16: B0 03   
loc_BF18:
	BRK					  ; $bf18: 00	  
	.db $32			  ; $bf19 - Unknown opcode
	.db $2b			  ; $bf1a - Unknown opcode
loc_BF1B:
	JSR $bf4f				; $bf1b: 20 4F BF ; -> sub_BF4F
	BRK					  ; $bf1e: 00	  
	.db $33			  ; $bf1f - Unknown opcode
	.db $2b			  ; $bf20 - Unknown opcode
	JSR $a6b7				; $bf21: 20 B7 A6 ; -> sub_A6B7
	JSR $9ac9				; $bf24: 20 C9 9A ; -> sub_9AC9
	BEQ $bf2d				; $bf27: F0 04   
	BRK					  ; $bf29: 00	  
	.db $34			  ; $bf2a - Unknown opcode
	.db $2b			  ; $bf2b - Unknown opcode
	RTS					  ; $bf2c: 60	  
loc_BF2D:
	JSR $a84e				; $bf2d: 20 4E A8 ; -> sub_A84E
	BCS $bf36				; $bf30: B0 04   
	BRK					  ; $bf32: 00	  
	AND $2b,X				; $bf33: 35 2B   
	RTS					  ; $bf35: 60	  
loc_BF36:
	BRK					  ; $bf36: 00	  
	ROL $2b,X				; $bf37: 36 2B   
	JSR $d210				; $bf39: 20 10 D2 ; Call to fixed bank
	LDA submap_number		; $bf3c: A5 64   
	CMP #$fe				 ; $bf3e: C9 FE	; Compare with 254
	BEQ $bf48				; $bf40: F0 06   
	JSR $a694				; $bf42: 20 94 A6 ; -> sub_A694
	JMP $bf4b				; $bf45: 4C 4B BF
loc_BF48:
	JSR $a6ff				; $bf48: 20 FF A6 ; -> sub_A6FF
loc_BF4B:
	BRK					  ; $bf4b: 00	  
	.db $37			  ; $bf4c - Unknown opcode
	.db $2b			  ; $bf4d - Unknown opcode
loc_BF4E:
	RTS					  ; $bf4e: 60	  

; ---- Subroutine at $bf4f (Bank 21) ----
sub_BF4F:
	LDA #$00				 ; $bf4f: A9 00   
	STA $fe				  ; $bf51: 85 FE   
	STA $ff				  ; $bf53: 85 FF   
	LDA #$18				 ; $bf55: A9 18   
	LDX #$da				 ; $bf57: A2 DA   
	BRK					  ; $bf59: 00	  
	.db $87			  ; $bf5a - Unknown opcode
	.db $8f			  ; $bf5b - Unknown opcode
	LDA map_number		   ; $bf5c: A5 63   
	CMP #$fe				 ; $bf5e: C9 FE	; Compare with 254
	BEQ $bf8a				; $bf60: F0 28   
	LDY #$00				 ; $bf62: A0 00   
loc_BF64:
	JSR $bfa4				; $bf64: 20 A4 BF ; -> sub_BFA4
	CMP #$ff				 ; $bf67: C9 FF	; Compare with 255
	BEQ $bf4e				; $bf69: F0 E3   
	CMP map_number		   ; $bf6b: C5 63   
	BNE $bf9e				; $bf6d: D0 2F   
	INY					  ; $bf6f: C8	  
	JSR $bfa4				; $bf70: 20 A4 BF ; -> sub_BFA4
	CMP submap_number		; $bf73: C5 64   
	BNE $bf9f				; $bf75: D0 28   
	LDA $3d				  ; $bf77: A5 3D   
	ORA #$80				 ; $bf79: 09 80   
	STA $dd				  ; $bf7b: 85 DD   
	INY					  ; $bf7d: C8	  
	LDA map_number		   ; $bf7e: A5 63   
	CMP #$10				 ; $bf80: C9 10	; Compare with 16
	BNE $bf8e				; $bf82: D0 0A   
	LDA $45				  ; $bf84: A5 45   
	CMP #$14				 ; $bf86: C9 14	; Compare with 20
	BCS $bf8e				; $bf88: B0 04   
loc_BF8A:
	LDA #$0a				 ; $bf8a: A9 0A   
	BNE $bf93				; $bf8c: D0 05   
loc_BF8E:
	LDA ($da),Y			  ; $bf8e: B1 DA   
	JSR $bfa4				; $bf90: 20 A4 BF ; -> sub_BFA4
loc_BF93:
	STA $fd				  ; $bf93: 85 FD   
	BRK					  ; $bf95: 00	  
	.db $62			  ; $bf96 - Unknown opcode
	.db $23			  ; $bf97 - Unknown opcode
	ORA ($a2,X)			  ; $bf98: 01 A2   
	SBC $274c,X			  ; $bf9a: FD 4C 27 ; Arithmetic
	INY					  ; $bf9d: C8	  
loc_BF9E:
	INY					  ; $bf9e: C8	  
loc_BF9F:
	INY					  ; $bf9f: C8	  
	INY					  ; $bfa0: C8	  
	JMP $bf64				; $bfa1: 4C 64 BF

; ---- Subroutine at $bfa4 (Bank 21) ----
sub_BFA4:
	STX $e9				  ; $bfa4: 86 E9   
	LDX #$da				 ; $bfa6: A2 DA   
	LDA #$18				 ; $bfa8: A9 18   
	JSR $c3ea				; $bfaa: 20 EA C3 ; Call to fixed bank
	LDX $e9				  ; $bfad: A6 E9   
	ORA #$00				 ; $bfaf: 09 00   
	RTS					  ; $bfb1: 60	  
	.db $ff			  ; $bfb2 - Unknown opcode
	.db $ff			  ; $bfb3 - Unknown opcode
	.db $ff			  ; $bfb4 - Unknown opcode
	.db $ff			  ; $bfb5 - Unknown opcode
	.db $ff			  ; $bfb6 - Unknown opcode
	.db $ff			  ; $bfb7 - Unknown opcode
	.db $ff			  ; $bfb8 - Unknown opcode
	.db $ff			  ; $bfb9 - Unknown opcode
	.db $ff			  ; $bfba - Unknown opcode
	.db $ff			  ; $bfbb - Unknown opcode
	.db $ff			  ; $bfbc - Unknown opcode
	.db $ff			  ; $bfbd - Unknown opcode
	.db $ff			  ; $bfbe - Unknown opcode
	.db $ff			  ; $bfbf - Unknown opcode
	.db $ff			  ; $bfc0 - Unknown opcode
	.db $ff			  ; $bfc1 - Unknown opcode
	.db $ff			  ; $bfc2 - Unknown opcode
	.db $ff			  ; $bfc3 - Unknown opcode
	.db $ff			  ; $bfc4 - Unknown opcode
	.db $ff			  ; $bfc5 - Unknown opcode
	.db $ff			  ; $bfc6 - Unknown opcode
	.db $ff			  ; $bfc7 - Unknown opcode
	.db $ff			  ; $bfc8 - Unknown opcode
	.db $ff			  ; $bfc9 - Unknown opcode
	.db $ff			  ; $bfca - Unknown opcode
	.db $ff			  ; $bfcb - Unknown opcode
	.db $ff			  ; $bfcc - Unknown opcode
	.db $ff			  ; $bfcd - Unknown opcode
	.db $ff			  ; $bfce - Unknown opcode
	.db $ff			  ; $bfcf - Unknown opcode
	.db $ff			  ; $bfd0 - Unknown opcode
	.db $ff			  ; $bfd1 - Unknown opcode
	.db $ff			  ; $bfd2 - Unknown opcode
	.db $ff			  ; $bfd3 - Unknown opcode
	.db $ff			  ; $bfd4 - Unknown opcode
	.db $ff			  ; $bfd5 - Unknown opcode
	.db $ff			  ; $bfd6 - Unknown opcode
	.db $ff			  ; $bfd7 - Unknown opcode
	SEI					  ; $bfd8: 78	  
	INC $bfdf				; $bfd9: EE DF BF
	JMP $ff8e				; $bfdc: 4C 8E FF
	.db $80			  ; $bfdf - Unknown opcode
	JSR $5244				; $bfe0: 20 44 52
	EOR ($47,X)			  ; $bfe3: 41 47   
	.db $4f			  ; $bfe5 - Unknown opcode
	LSR $5120				; $bfe6: 4E 20 51
	EOR $45,X				; $bfe9: 55 45   
	.db $53			  ; $bfeb - Unknown opcode
	.db $54			  ; $bfec - Unknown opcode
	JSR $5649				; $bfed: 20 49 56
	BRK					  ; $bff0: 00	  
	BRK					  ; $bff1: 00	  
	BRK					  ; $bff2: 00	  
	BRK					  ; $bff3: 00	  
	PHA					  ; $bff4: 48	  
	.db $04			  ; $bff5 - Unknown opcode
	ORA ($0e,X)			  ; $bff6: 01 0E   
	.db $07			  ; $bff8 - Unknown opcode
	.db $9e			  ; $bff9 - Unknown opcode
	CLD					  ; $bffa: D8	  
	.db $bf			  ; $bffb - Unknown opcode
	CLD					  ; $bffc: D8	  
	.db $bf			  ; $bffd - Unknown opcode
	CLD					  ; $bffe: D8	  
	.db $bf			  ; $bfff - Unknown opcode
