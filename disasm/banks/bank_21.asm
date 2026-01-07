; ============================================================
; Dragon Warrior IV - Bank 21 Disassembly
; ROM Offset: $54010
; CPU Address: $8000-$BFFF
; ============================================================
;
; Discovered Subroutines: 131
; Jump Targets: 661
;
; ============================================================

	.byte $EF			  ; $8000 - Unknown opcode
	LDA ($32),Y			  ; $8001: B1 32   
	LDY $5F,X				; $8003: B4 5F   
	.byte $B3			  ; $8005 - Unknown opcode
	.byte $CF			  ; $8006 - Unknown opcode
	.byte $B2			  ; $8007 - Unknown opcode
	.byte $5C			  ; $8008 - Unknown opcode
	TAY					  ; $8009: A8	  
	.byte $74			  ; $800A - Unknown opcode
	.byte $B3			  ; $800B - Unknown opcode
	TXA					  ; $800C: 8A	  
	.byte $B3			  ; $800D - Unknown opcode
	LDA ($B3,X)			  ; $800E: A1 B3   
	DEX					  ; $8010: CA	  
	.byte $B3			  ; $8011 - Unknown opcode
	BMI $7FBF				; $8012: 30 AB   
	BRK					  ; $8014: 00	  
	BRK					  ; $8015: 00	  
	LDA $CBB4,Y			  ; $8016: B9 B4 CB
	LDY $E3,X				; $8019: B4 E3   
	LDY $EE,X				; $801B: B4 EE   
	LDY $F8,X				; $801D: B4 F8   
	TYA					  ; $801F: 98	  
	.byte $EB			  ; $8020 - Unknown opcode
	.byte $9C			  ; $8021 - Unknown opcode
	.byte $44			  ; $8022 - Unknown opcode
	LDX #$BA				 ; $8023: A2 BA   
	LDY $24				  ; $8025: A4 24   
	LDA $0C,X				; $8027: B5 0C   
	LDX #$6E				 ; $8029: A2 6E   
	LDY #$13				 ; $802B: A0 13   
	LDA $D2,X				; $802D: B5 D2   
	LDX $B833,Y			  ; $802F: BE 33 B8
	.byte $64			  ; $8032 - Unknown opcode
	LDA $E24A				; $8033: AD 4A E2
	.byte $3F			  ; $8036 - Unknown opcode
	.byte $42			  ; $8037 - Unknown opcode
	BEQ $8079				; $8038: F0 3F   
	.byte $44			  ; $803A - Unknown opcode
	STA $073F				; $803B: 8D 3F 07
	.byte $1B			  ; $803E - Unknown opcode
	ASL $4710				; $803F: 0E 10 47
	.byte $89			  ; $8042 - Unknown opcode
	.byte $0B			  ; $8043 - Unknown opcode
	ASL $47				  ; $8044: 06 47   
	.byte $87			  ; $8046 - Unknown opcode
	.byte $07			  ; $8047 - Unknown opcode
	ORA ptr1_lo			  ; $8048: 05 06   
	CLC					  ; $804A: 18	  
	ASL $4710				; $804B: 0E 10 47
	DEY					  ; $804E: 88	  
	BRK					  ; $804F: 00	  
	ROL $9D,X				; $8050: 36 9D   
	ROL $470B,X			  ; $8052: 3E 0B 47
	TXA					  ; $8055: 8A	  
	ROL $073F,X			  ; $8056: 3E 3F 07
	ASL ptr0_hi,X			; $8059: 16 05   
	ASL ptr1_hi			  ; $805B: 06 07   
	.byte $03			  ; $805D - Unknown opcode
	ASL $4A				  ; $805E: 06 4A   
	AND $3E4A,X			  ; $8060: 3D 4A 3E
	ROL $060B,X			  ; $8063: 3E 0B 06
	.byte $07			  ; $8066 - Unknown opcode
	ORA ($6C),Y			  ; $8067: 11 6C   
	.byte $47			  ; $8069 - Unknown opcode
	STX $0B				  ; $806A: 86 0B   
	.byte $47			  ; $806C - Unknown opcode
	STA $46				  ; $806D: 85 46   
	ASL					  ; $806F: 0A	  
	ROL $073F,X			  ; $8070: 3E 3F 07
	ASL ptr0_hi,X			; $8073: 16 05   
	ASL $47				  ; $8075: 06 47   
	.byte $32			  ; $8077 - Unknown opcode
	.byte $07			  ; $8078 - Unknown opcode
loc_8079:
	ORA ($1E),Y			  ; $8079: 11 1E   
	LSR					  ; $807B: 4A	  
	.byte $3F			  ; $807C - Unknown opcode
	ROL $450B,X			  ; $807D: 3E 0B 45
	CMP ($3F),Y			  ; $8080: D1 3F   
	.byte $07			  ; $8082 - Unknown opcode
	.byte $02			  ; $8083 - Unknown opcode
	ORA ($2A,X)			  ; $8084: 01 2A   
	STA $078B,X			  ; $8086: 9D 8B 07
	.byte $0B			  ; $8089 - Unknown opcode
	.byte $47			  ; $808A - Unknown opcode
	.byte $8B			  ; $808B - Unknown opcode
	.byte $3F			  ; $808C - Unknown opcode
	.byte $07			  ; $808D - Unknown opcode
	ASL ptr0_hi,X			; $808E: 16 05   
	.byte $07			  ; $8090 - Unknown opcode
	.byte $14			  ; $8091 - Unknown opcode
	LSR					  ; $8092: 4A	  
	.byte $34			  ; $8093 - Unknown opcode
	.byte $0B			  ; $8094 - Unknown opcode
	LSR					  ; $8095: 4A	  
	ROL $0B,X				; $8096: 36 0B   
	.byte $07			  ; $8098 - Unknown opcode
	.byte $14			  ; $8099 - Unknown opcode
	.byte $47			  ; $809A - Unknown opcode
	STY $450B				; $809B: 8C 0B 45
	JSR $073F				; $809E: 20 3F 07
	ASL ptr0_hi,X			; $80A1: 16 05   
	.byte $07			  ; $80A3 - Unknown opcode
	.byte $83			  ; $80A4 - Unknown opcode
	ASL $4A				  ; $80A5: 06 4A   
	SEC					  ; $80A7: 38	  
	.byte $0B			  ; $80A8 - Unknown opcode
	LSR					  ; $80A9: 4A	  
	AND $070B,Y			  ; $80AA: 39 0B 07
	.byte $1B			  ; $80AD - Unknown opcode
	ASL $80				  ; $80AE: 06 80   
	ASL $18				  ; $80B0: 06 18   
	.byte $03			  ; $80B2 - Unknown opcode
	JSR $8E47				; $80B3: 20 47 8E ; -> sub_8E47
	BRK					  ; $80B6: 00	  
	LDX $A4,Y				; $80B7: B6 A4   
	ROL $470B,X			  ; $80B9: 3E 0B 47
	STA $073F				; $80BC: 8D 3F 07
	ASL ptr0_hi,X			; $80BF: 16 05   
	LSR					  ; $80C1: 4A	  
	.byte $3A			  ; $80C2 - Unknown opcode
	.byte $0B			  ; $80C3 - Unknown opcode
	.byte $07			  ; $80C4 - Unknown opcode
	.byte $1B			  ; $80C5 - Unknown opcode
	ASL $80				  ; $80C6: 06 80   
	ASL $18				  ; $80C8: 06 18   
	.byte $03			  ; $80CA - Unknown opcode
	JSR $8E47				; $80CB: 20 47 8E ; -> sub_8E47
	BRK					  ; $80CE: 00	  
	LDX $A4,Y				; $80CF: B6 A4   
	ROL $470B,X			  ; $80D1: 3E 0B 47
	.byte $8F			  ; $80D4 - Unknown opcode
	.byte $3F			  ; $80D5 - Unknown opcode
	.byte $07			  ; $80D6 - Unknown opcode
	.byte $02			  ; $80D7 - Unknown opcode
	.byte $12			  ; $80D8 - Unknown opcode
	ASL $0B				  ; $80D9: 06 0B   
	.byte $07			  ; $80DB - Unknown opcode
	ASL ptr0_hi,X			; $80DC: 16 05   
	LSR					  ; $80DE: 4A	  
	.byte $22			  ; $80DF - Unknown opcode
	.byte $0B			  ; $80E0 - Unknown opcode
	EOR $29				  ; $80E1: 45 29   
	.byte $3F			  ; $80E3 - Unknown opcode
	EOR $28				  ; $80E4: 45 28   
	CLC					  ; $80E6: 18	  
	ASL $80				  ; $80E7: 06 80   
	.byte $3F			  ; $80E9 - Unknown opcode
	.byte $07			  ; $80EA - Unknown opcode
	ASL ptr0_hi,X			; $80EB: 16 05   
	.byte $07			  ; $80ED - Unknown opcode
	.byte $03			  ; $80EE - Unknown opcode
	ASL $4A				  ; $80EF: 06 4A   
	.byte $3B			  ; $80F1 - Unknown opcode
	.byte $0B			  ; $80F2 - Unknown opcode
	LSR					  ; $80F3: 4A	  
	.byte $3C			  ; $80F4 - Unknown opcode
	.byte $0B			  ; $80F5 - Unknown opcode
	ASL $45				  ; $80F6: 06 45   
	ROL $0618				; $80F8: 2E 18 06
	.byte $80			  ; $80FB - Unknown opcode
	ROL $073F,X			  ; $80FC: 3E 3F 07
	ASL ptr0_hi,X			; $80FF: 16 05   
	LSR					  ; $8101: 4A	  
	.byte $33			  ; $8102 - Unknown opcode
	.byte $0B			  ; $8103 - Unknown opcode
	.byte $07			  ; $8104 - Unknown opcode
	.byte $1B			  ; $8105 - Unknown opcode
	PHP					  ; $8106: 08	  
	.byte $80			  ; $8107 - Unknown opcode
	.byte $47			  ; $8108 - Unknown opcode
	.byte $9F			  ; $8109 - Unknown opcode
	.byte $0B			  ; $810A - Unknown opcode
	ORA ($3E,X)			  ; $810B: 01 3E   
	STA $0790,X			  ; $810D: 9D 90 07
	.byte $3F			  ; $8110 - Unknown opcode
	.byte $47			  ; $8111 - Unknown opcode
	.byte $93			  ; $8112 - Unknown opcode
	.byte $07			  ; $8113 - Unknown opcode
	ORA ptr1_lo			  ; $8114: 05 06   
	.byte $47			  ; $8116 - Unknown opcode
	STY $18,X				; $8117: 94 18   
	ASL $40				  ; $8119: 06 40   
	BRK					  ; $811B: 00	  
	LDX $A4,Y				; $811C: B6 A4   
	ROL $060B,X			  ; $811E: 3E 0B 06
	.byte $47			  ; $8121 - Unknown opcode
	STA $3E,X				; $8122: 95 3E   
	.byte $3F			  ; $8124 - Unknown opcode
	.byte $47			  ; $8125 - Unknown opcode
	.byte $9C			  ; $8126 - Unknown opcode
	BRK					  ; $8127: 00	  
	.byte $57			  ; $8128 - Unknown opcode
	STA $433F,X			  ; $8129: 9D 3F 43
	.byte $42			  ; $812C - Unknown opcode
	.byte $3F			  ; $812D - Unknown opcode
	EOR $FF				  ; $812E: 45 FF   
	.byte $3F			  ; $8130 - Unknown opcode
	.byte $47			  ; $8131 - Unknown opcode
	STA current_bank,X	   ; $8132: 9D 07 05
	.byte $47			  ; $8135 - Unknown opcode
	.byte $9E			  ; $8136 - Unknown opcode
	.byte $0B			  ; $8137 - Unknown opcode
	.byte $47			  ; $8138 - Unknown opcode
	.byte $9E			  ; $8139 - Unknown opcode
	.byte $3F			  ; $813A - Unknown opcode
	.byte $07			  ; $813B - Unknown opcode
	.byte $14			  ; $813C - Unknown opcode
	ASL ptr1_hi			  ; $813D: 06 07   
	.byte $1B			  ; $813F - Unknown opcode
	PHP					  ; $8140: 08	  
	.byte $02			  ; $8141 - Unknown opcode
	.byte $47			  ; $8142 - Unknown opcode
	INX					  ; $8143: E8	  
	.byte $0B			  ; $8144 - Unknown opcode
	.byte $07			  ; $8145 - Unknown opcode
	.byte $1B			  ; $8146 - Unknown opcode
	PHP					  ; $8147: 08	  
	PHP					  ; $8148: 08	  
	.byte $47			  ; $8149 - Unknown opcode
	.byte $E2			  ; $814A - Unknown opcode
	.byte $0B			  ; $814B - Unknown opcode
	.byte $07			  ; $814C - Unknown opcode
	.byte $1B			  ; $814D - Unknown opcode
	ASL $20				  ; $814E: 06 20   
	.byte $07			  ; $8150 - Unknown opcode
	.byte $13			  ; $8151 - Unknown opcode
	.byte $07			  ; $8152 - Unknown opcode
	.byte $47			  ; $8153 - Unknown opcode
	LDY $0B				  ; $8154: A4 0B   
	ASL $47				  ; $8156: 06 47   
	.byte $A3			  ; $8158 - Unknown opcode
	CLC					  ; $8159: 18	  
	BRK					  ; $815A: 00	  
	.byte $02			  ; $815B - Unknown opcode
	ROL $060B,X			  ; $815C: 3E 0B 06
	.byte $47			  ; $815F - Unknown opcode
	LDY #$07				 ; $8160: A0 07   
	ORA $47				  ; $8162: 05 47   
	LDA ($0B,X)			  ; $8164: A1 0B   
	.byte $47			  ; $8166 - Unknown opcode
	LDX #$3E				 ; $8167: A2 3E   
	ROL $060B,X			  ; $8169: 3E 0B 06
	.byte $07			  ; $816C - Unknown opcode
	.byte $1B			  ; $816D - Unknown opcode
	PHP					  ; $816E: 08	  
	.byte $02			  ; $816F - Unknown opcode
	EOR $51				  ; $8170: 45 51   
	.byte $0B			  ; $8172 - Unknown opcode
	.byte $07			  ; $8173 - Unknown opcode
	.byte $1B			  ; $8174 - Unknown opcode
	PHP					  ; $8175: 08	  
	PHP					  ; $8176: 08	  
	.byte $47			  ; $8177 - Unknown opcode
	.byte $E2			  ; $8178 - Unknown opcode
	.byte $0B			  ; $8179 - Unknown opcode
	EOR $51				  ; $817A: 45 51   
	ROL $073F,X			  ; $817C: 3E 3F 07
	.byte $1B			  ; $817F - Unknown opcode
	PHP					  ; $8180: 08	  
	PHP					  ; $8181: 08	  
	.byte $47			  ; $8182 - Unknown opcode
	CPX $0B				  ; $8183: E4 0B   
	.byte $07			  ; $8185 - Unknown opcode
	.byte $14			  ; $8186 - Unknown opcode
	.byte $47			  ; $8187 - Unknown opcode
	LDA #$0B				 ; $8188: A9 0B   
	.byte $47			  ; $818A - Unknown opcode
	LDA $073F				; $818B: AD 3F 07
	.byte $1B			  ; $818E - Unknown opcode
	PHP					  ; $818F: 08	  
	.byte $02			  ; $8190 - Unknown opcode
	.byte $47			  ; $8191 - Unknown opcode
	NOP					  ; $8192: EA	  
	.byte $0B			  ; $8193 - Unknown opcode
	.byte $07			  ; $8194 - Unknown opcode
	.byte $1B			  ; $8195 - Unknown opcode
	PHP					  ; $8196: 08	  
	PHP					  ; $8197: 08	  
	.byte $47			  ; $8198 - Unknown opcode
	SBC $0B				  ; $8199: E5 0B	; Arithmetic
	ASL $47				  ; $819B: 06 47   
	.byte $AF			  ; $819D - Unknown opcode
	.byte $07			  ; $819E - Unknown opcode
	.byte $93			  ; $819F - Unknown opcode
	.byte $07			  ; $81A0 - Unknown opcode
	.byte $47			  ; $81A1 - Unknown opcode
	BCS $81E2				; $81A2: B0 3E   
	.byte $3F			  ; $81A4 - Unknown opcode
	.byte $07			  ; $81A5 - Unknown opcode
	.byte $13			  ; $81A6 - Unknown opcode
	.byte $07			  ; $81A7 - Unknown opcode
	.byte $47			  ; $81A8 - Unknown opcode
	LDY $470B				; $81A9: AC 0B 47
	LDX $073F				; $81AC: AE 3F 07
	.byte $1B			  ; $81AF - Unknown opcode
	PHP					  ; $81B0: 08	  
	.byte $02			  ; $81B1 - Unknown opcode
	.byte $47			  ; $81B2 - Unknown opcode
	SBC #$0B				 ; $81B3: E9 0B	; Arithmetic
	.byte $07			  ; $81B5 - Unknown opcode
	.byte $1B			  ; $81B6 - Unknown opcode
	PHP					  ; $81B7: 08	  
	PHP					  ; $81B8: 08	  
	.byte $47			  ; $81B9 - Unknown opcode
	.byte $E3			  ; $81BA - Unknown opcode
	.byte $0B			  ; $81BB - Unknown opcode
	.byte $07			  ; $81BC - Unknown opcode
	.byte $13			  ; $81BD - Unknown opcode
	.byte $07			  ; $81BE - Unknown opcode
	.byte $47			  ; $81BF - Unknown opcode
	.byte $A7			  ; $81C0 - Unknown opcode
	.byte $0B			  ; $81C1 - Unknown opcode
	.byte $07			  ; $81C2 - Unknown opcode
	.byte $14			  ; $81C3 - Unknown opcode
	.byte $47			  ; $81C4 - Unknown opcode
	LDA $0B				  ; $81C5: A5 0B   
	.byte $47			  ; $81C7 - Unknown opcode
	LDX $3F				  ; $81C8: A6 3F   
	.byte $47			  ; $81CA - Unknown opcode
	TAX					  ; $81CB: AA	  
	CLC					  ; $81CC: 18	  
	.byte $03			  ; $81CD - Unknown opcode
	.byte $04			  ; $81CE - Unknown opcode
	.byte $3F			  ; $81CF - Unknown opcode
	.byte $07			  ; $81D0 - Unknown opcode
	.byte $13			  ; $81D1 - Unknown opcode
	.byte $07			  ; $81D2 - Unknown opcode
	.byte $47			  ; $81D3 - Unknown opcode
	LDY $470B				; $81D4: AC 0B 47
	.byte $AB			  ; $81D7 - Unknown opcode
	.byte $3F			  ; $81D8 - Unknown opcode
	.byte $07			  ; $81D9 - Unknown opcode
	.byte $1B			  ; $81DA - Unknown opcode
	ASL					  ; $81DB: 0A	  
	RTI					  ; $81DC: 40	  
	.byte $07			  ; $81DD - Unknown opcode
	.byte $1B			  ; $81DE - Unknown opcode
	BRK					  ; $81DF: 00	  
	.byte $02			  ; $81E0 - Unknown opcode
	.byte $43			  ; $81E1 - Unknown opcode
loc_81E2:
	PLA					  ; $81E2: 68	  
	.byte $0B			  ; $81E3 - Unknown opcode
	ASL ptr1_hi			  ; $81E4: 06 07   
	.byte $13			  ; $81E6 - Unknown opcode
	.byte $07			  ; $81E7 - Unknown opcode
	.byte $47			  ; $81E8 - Unknown opcode
	LDY $470B				; $81E9: AC 0B 47
	LDA ($18),Y			  ; $81EC: B1 18   
	.byte $03			  ; $81EE - Unknown opcode
	.byte $02			  ; $81EF - Unknown opcode
	ROL $070B,X			  ; $81F0: 3E 0B 07
	.byte $1B			  ; $81F3 - Unknown opcode
	ASL $0708				; $81F4: 0E 08 07
	.byte $1B			  ; $81F7 - Unknown opcode
	BRK					  ; $81F8: 00	  
	.byte $02			  ; $81F9 - Unknown opcode
	.byte $43			  ; $81FA - Unknown opcode
	PLA					  ; $81FB: 68	  
	.byte $0B			  ; $81FC - Unknown opcode
	ASL ptr1_hi			  ; $81FD: 06 07   
	.byte $13			  ; $81FF - Unknown opcode
	.byte $07			  ; $8200 - Unknown opcode
	.byte $47			  ; $8201 - Unknown opcode
	LDY $470B				; $8202: AC 0B 47
	LDA ($18),Y			  ; $8205: B1 18   
	.byte $03			  ; $8207 - Unknown opcode
	.byte $02			  ; $8208 - Unknown opcode
	ROL $430B,X			  ; $8209: 3E 0B 43
	.byte $22			  ; $820C - Unknown opcode
	.byte $3F			  ; $820D - Unknown opcode
	.byte $07			  ; $820E - Unknown opcode
	.byte $1B			  ; $820F - Unknown opcode
	ASL					  ; $8210: 0A	  
	RTI					  ; $8211: 40	  
	.byte $07			  ; $8212 - Unknown opcode
	.byte $1B			  ; $8213 - Unknown opcode
	BRK					  ; $8214: 00	  
	.byte $02			  ; $8215 - Unknown opcode
	.byte $43			  ; $8216 - Unknown opcode
	ADC #$0B				 ; $8217: 69 0B	; Arithmetic
	ASL ptr1_hi			  ; $8219: 06 07   
	.byte $13			  ; $821B - Unknown opcode
	.byte $07			  ; $821C - Unknown opcode
	.byte $47			  ; $821D - Unknown opcode
	LDY $470B				; $821E: AC 0B 47
	.byte $B2			  ; $8221 - Unknown opcode
	ROL $070B,X			  ; $8222: 3E 0B 07
	.byte $1B			  ; $8225 - Unknown opcode
	ASL $0708				; $8226: 0E 08 07
	.byte $1B			  ; $8229 - Unknown opcode
	BRK					  ; $822A: 00	  
	.byte $02			  ; $822B - Unknown opcode
	.byte $43			  ; $822C - Unknown opcode
	ADC #$0B				 ; $822D: 69 0B	; Arithmetic
	ASL ptr1_hi			  ; $822F: 06 07   
	.byte $13			  ; $8231 - Unknown opcode
	.byte $07			  ; $8232 - Unknown opcode
	.byte $47			  ; $8233 - Unknown opcode
	LDY $470B				; $8234: AC 0B 47
	.byte $B2			  ; $8237 - Unknown opcode
	ROL $430B,X			  ; $8238: 3E 0B 43
	.byte $22			  ; $823B - Unknown opcode
	.byte $3F			  ; $823C - Unknown opcode
	LSR $0D				  ; $823D: 46 0D   
	CLC					  ; $823F: 18	  
	.byte $03			  ; $8240 - Unknown opcode
	PHP					  ; $8241: 08	  
	.byte $3F			  ; $8242 - Unknown opcode
	.byte $07			  ; $8243 - Unknown opcode
	.byte $13			  ; $8244 - Unknown opcode
	.byte $07			  ; $8245 - Unknown opcode
	.byte $47			  ; $8246 - Unknown opcode
	LDY $470B				; $8247: AC 0B 47
	.byte $B3			  ; $824A - Unknown opcode
	.byte $3F			  ; $824B - Unknown opcode
	.byte $07			  ; $824C - Unknown opcode
	.byte $1B			  ; $824D - Unknown opcode
	PHP					  ; $824E: 08	  
	PHP					  ; $824F: 08	  
	.byte $43			  ; $8250 - Unknown opcode
	.byte $4F			  ; $8251 - Unknown opcode
	.byte $0B			  ; $8252 - Unknown opcode
	.byte $47			  ; $8253 - Unknown opcode
	TAY					  ; $8254: A8	  
	.byte $3F			  ; $8255 - Unknown opcode
	.byte $07			  ; $8256 - Unknown opcode
	.byte $1B			  ; $8257 - Unknown opcode
	PHP					  ; $8258: 08	  
	PHP					  ; $8259: 08	  
	.byte $47			  ; $825A - Unknown opcode
	INC $0B				  ; $825B: E6 0B   
	.byte $47			  ; $825D - Unknown opcode
	LDY $3F,X				; $825E: B4 3F   
	.byte $07			  ; $8260 - Unknown opcode
	ASL ptr0_hi,X			; $8261: 16 05   
	ASL ptr1_hi			  ; $8263: 06 07   
	.byte $14			  ; $8265 - Unknown opcode
loc_8266:
	ASL $47				  ; $8266: 06 47   
	.byte $B7			  ; $8268 - Unknown opcode
	EOR #$C4				 ; $8269: 49 C4   
	ROL $060B,X			  ; $826B: 3E 0B 06
	CLC					  ; $826E: 18	  
	ASL					  ; $826F: 0A	  
	PHP					  ; $8270: 08	  
	EOR #$C5				 ; $8271: 49 C5   
	EOR #$C6				 ; $8273: 49 C6   
	ROL $0B3E,X			  ; $8275: 3E 3E 0B
	.byte $07			  ; $8278 - Unknown opcode
	.byte $1B			  ; $8279 - Unknown opcode
	PHP					  ; $827A: 08	  
	PHP					  ; $827B: 08	  
	.byte $47			  ; $827C - Unknown opcode
	.byte $E7			  ; $827D - Unknown opcode
	.byte $0B			  ; $827E - Unknown opcode
	.byte $07			  ; $827F - Unknown opcode
	.byte $14			  ; $8280 - Unknown opcode
	.byte $47			  ; $8281 - Unknown opcode
	.byte $B7			  ; $8282 - Unknown opcode
	.byte $0B			  ; $8283 - Unknown opcode
	.byte $47			  ; $8284 - Unknown opcode
	CLV					  ; $8285: B8	  
	.byte $3F			  ; $8286 - Unknown opcode
	.byte $43			  ; $8287 - Unknown opcode
	STX $B400				; $8288: 8E 00 B4
	.byte $AF			  ; $828B - Unknown opcode
	.byte $3F			  ; $828C - Unknown opcode
	.byte $07			  ; $828D - Unknown opcode
	.byte $1B			  ; $828E - Unknown opcode
	ASL $08				  ; $828F: 06 08   
	.byte $43			  ; $8291 - Unknown opcode
	.byte $47			  ; $8292 - Unknown opcode
	.byte $0B			  ; $8293 - Unknown opcode
	.byte $07			  ; $8294 - Unknown opcode
	.byte $1B			  ; $8295 - Unknown opcode
	ASL $10				  ; $8296: 06 10   
	ASL $47				  ; $8298: 06 47   
	CMP ptr1_hi			  ; $829A: C5 07   
	ORA ptr1_lo			  ; $829C: 05 06   
	ORA ($5C,X)			  ; $829E: 01 5C   
	STA $07C6,X			  ; $82A0: 9D C6 07
	CLC					  ; $82A3: 18	  
	ASL $08				  ; $82A4: 06 08   
	BRK					  ; $82A6: 00	  
	.byte $62			  ; $82A7 - Unknown opcode
	STA $0B3E,X			  ; $82A8: 9D 3E 0B
	ASL $47				  ; $82AB: 06 47   
	.byte $C7			  ; $82AD - Unknown opcode
	BRK					  ; $82AE: 00	  
	BMI $8266				; $82AF: 30 B5   
	ROL $0B3E,X			  ; $82B1: 3E 3E 0B
	.byte $12			  ; $82B4 - Unknown opcode
	ORA $3F				  ; $82B5: 05 3F   
	.byte $07			  ; $82B7 - Unknown opcode
	.byte $1B			  ; $82B8 - Unknown opcode
	ASL $08				  ; $82B9: 06 08   
	.byte $47			  ; $82BB - Unknown opcode
	INY					  ; $82BC: C8	  
	.byte $0B			  ; $82BD - Unknown opcode
	.byte $47			  ; $82BE - Unknown opcode
	CPY #$3F				 ; $82BF: C0 3F   
	.byte $07			  ; $82C1 - Unknown opcode
	.byte $1B			  ; $82C2 - Unknown opcode
	ASL $08				  ; $82C3: 06 08   
	LSR $1A				  ; $82C5: 46 1A   
	.byte $0B			  ; $82C7 - Unknown opcode
	.byte $47			  ; $82C8 - Unknown opcode
	CMP ($3F,X)			  ; $82C9: C1 3F   
	.byte $47			  ; $82CB - Unknown opcode
	.byte $C2			  ; $82CC - Unknown opcode
	.byte $07			  ; $82CD - Unknown opcode
	ORA ptr1_lo			  ; $82CE: 05 06   
	.byte $47			  ; $82D0 - Unknown opcode
	.byte $C3			  ; $82D1 - Unknown opcode
	CLC					  ; $82D2: 18	  
	ASL $10				  ; $82D3: 06 10   
	ROL $470B,X			  ; $82D5: 3E 0B 47
	CPY $3F				  ; $82D8: C4 3F   
	.byte $07			  ; $82DA - Unknown opcode
	ASL tmp2,X			   ; $82DB: 16 02   
	.byte $47			  ; $82DD - Unknown opcode
	CMP #$00				 ; $82DE: C9 00	; Compare with 0
	BMI $8297				; $82E0: 30 B5   
	.byte $3F			  ; $82E2 - Unknown opcode
	.byte $07			  ; $82E3 - Unknown opcode
	ASL ptr0_hi,X			; $82E4: 16 05   
	EOR #$D7				 ; $82E6: 49 D7   
	.byte $0B			  ; $82E8 - Unknown opcode
	.byte $07			  ; $82E9 - Unknown opcode
	.byte $14			  ; $82EA - Unknown opcode
	LSR $1A				  ; $82EB: 46 1A   
	.byte $0B			  ; $82ED - Unknown opcode
	EOR $36				  ; $82EE: 45 36   
	.byte $3F			  ; $82F0 - Unknown opcode
	.byte $07			  ; $82F1 - Unknown opcode
	.byte $1B			  ; $82F2 - Unknown opcode
	BRK					  ; $82F3: 00	  
	BPL $833D				; $82F4: 10 47   
	CMP ($0B),Y			  ; $82F6: D1 0B   
	.byte $07			  ; $82F8 - Unknown opcode
	.byte $1B			  ; $82F9 - Unknown opcode
	PHP					  ; $82FA: 08	  
	BPL $8344				; $82FB: 10 47   
	CPY $470B				; $82FD: CC 0B 47
	DEX					  ; $8300: CA	  
	.byte $3F			  ; $8301 - Unknown opcode
	.byte $07			  ; $8302 - Unknown opcode
	.byte $1B			  ; $8303 - Unknown opcode
	BRK					  ; $8304: 00	  
	BPL $834E				; $8305: 10 47   
	.byte $D2			  ; $8307 - Unknown opcode
	.byte $0B			  ; $8308 - Unknown opcode
	.byte $47			  ; $8309 - Unknown opcode
	.byte $CB			  ; $830A - Unknown opcode
	.byte $3F			  ; $830B - Unknown opcode
	.byte $07			  ; $830C - Unknown opcode
	.byte $1B			  ; $830D - Unknown opcode
	BRK					  ; $830E: 00	  
	BPL $8358				; $830F: 10 47   
	.byte $D3			  ; $8311 - Unknown opcode
	.byte $0B			  ; $8312 - Unknown opcode
	.byte $47			  ; $8313 - Unknown opcode
	CMP $073F				; $8314: CD 3F 07
	.byte $1B			  ; $8317 - Unknown opcode
	BRK					  ; $8318: 00	  
	BPL $8362				; $8319: 10 47   
	.byte $D4			  ; $831B - Unknown opcode
	.byte $0B			  ; $831C - Unknown opcode
	.byte $47			  ; $831D - Unknown opcode
	DEC $073F				; $831E: CE 3F 07
	.byte $1B			  ; $8321 - Unknown opcode
	BRK					  ; $8322: 00	  
	BPL $832B				; $8323: 10 06   
	.byte $47			  ; $8325 - Unknown opcode
	CMP tmp0,X			   ; $8326: D5 00   
	ASL $3EBF				; $8328: 0E BF 3E
loc_832B:
	.byte $0B			  ; $832B - Unknown opcode
	.byte $47			  ; $832C - Unknown opcode
	.byte $CF			  ; $832D - Unknown opcode
	.byte $3F			  ; $832E - Unknown opcode
	.byte $07			  ; $832F - Unknown opcode
	.byte $1B			  ; $8330 - Unknown opcode
	BRK					  ; $8331: 00	  
	BPL $837B				; $8332: 10 47   
	DEC $0B,X				; $8334: D6 0B   
	.byte $47			  ; $8336 - Unknown opcode
	BNE $8378				; $8337: D0 3F   
	ORA ($68,X)			  ; $8339: 01 68   
	STA $07DD,X			  ; $833B: 9D DD 07
	.byte $3F			  ; $833E - Unknown opcode
	.byte $07			  ; $833F - Unknown opcode
	.byte $1B			  ; $8340 - Unknown opcode
	PHP					  ; $8341: 08	  
	.byte $04			  ; $8342 - Unknown opcode
	ASL ptr1_hi			  ; $8343: 06 07   
	.byte $14			  ; $8345 - Unknown opcode
	.byte $07			  ; $8346 - Unknown opcode
	.byte $02			  ; $8347 - Unknown opcode
	.byte $12			  ; $8348 - Unknown opcode
	.byte $02			  ; $8349 - Unknown opcode
	.byte $0B			  ; $834A - Unknown opcode
	.byte $47			  ; $834B - Unknown opcode
	.byte $DF			  ; $834C - Unknown opcode
	.byte $0B			  ; $834D - Unknown opcode
loc_834E:
	.byte $47			  ; $834E - Unknown opcode
	.byte $DF			  ; $834F - Unknown opcode
	ROL $070B,X			  ; $8350: 3E 0B 07
	.byte $14			  ; $8353 - Unknown opcode
	.byte $12			  ; $8354 - Unknown opcode
	.byte $02			  ; $8355 - Unknown opcode
	.byte $0B			  ; $8356 - Unknown opcode
	.byte $47			  ; $8357 - Unknown opcode
loc_8358:
	DEC $073F,X			  ; $8358: DE 3F 07
	ASL ptr0_hi,X			; $835B: 16 05   
	ASL $49				  ; $835D: 06 49   
	STX ptr1_hi			  ; $835F: 86 07   
	.byte $03			  ; $8361 - Unknown opcode
loc_8362:
	.byte $07			  ; $8362 - Unknown opcode
	EOR #$87				 ; $8363: 49 87   
	ROL $070B,X			  ; $8365: 3E 0B 07
	.byte $1B			  ; $8368 - Unknown opcode
	PHP					  ; $8369: 08	  
	.byte $02			  ; $836A - Unknown opcode
	.byte $47			  ; $836B - Unknown opcode
	SBC ($0B,X)			  ; $836C: E1 0B	; Arithmetic
	.byte $47			  ; $836E - Unknown opcode
	CPX #$3F				 ; $836F: E0 3F   
	.byte $07			  ; $8371 - Unknown opcode
	.byte $02			  ; $8372 - Unknown opcode
	.byte $12			  ; $8373 - Unknown opcode
	ASL $0B				  ; $8374: 06 0B   
	.byte $07			  ; $8376 - Unknown opcode
	ASL ptr0_hi,X			; $8377: 16 05   
	EOR #$85				 ; $8379: 49 85   
loc_837B:
	.byte $0B			  ; $837B - Unknown opcode
	.byte $47			  ; $837C - Unknown opcode
	.byte $EB			  ; $837D - Unknown opcode
	.byte $3F			  ; $837E - Unknown opcode
	.byte $07			  ; $837F - Unknown opcode
	.byte $1B			  ; $8380 - Unknown opcode
	ORA #$40				 ; $8381: 09 40   
	.byte $44			  ; $8383 - Unknown opcode
	.byte $D2			  ; $8384 - Unknown opcode
	.byte $0B			  ; $8385 - Unknown opcode
	ASL $47				  ; $8386: 06 47   
	SED					  ; $8388: F8	  
	.byte $07			  ; $8389 - Unknown opcode
	.byte $13			  ; $838A - Unknown opcode
	.byte $07			  ; $838B - Unknown opcode
	.byte $47			  ; $838C - Unknown opcode
	SBC $0918,Y			  ; $838D: F9 18 09 ; Arithmetic
	.byte $80			  ; $8390 - Unknown opcode
	ROL $073F,X			  ; $8391: 3E 3F 07
	.byte $1B			  ; $8394 - Unknown opcode
	ORA #$40				 ; $8395: 09 40   
	PHA					  ; $8397: 48	  
	ORA ($0B,X)			  ; $8398: 01 0B   
	ASL $47				  ; $839A: 06 47   
	.byte $FA			  ; $839C - Unknown opcode
	.byte $07			  ; $839D - Unknown opcode
	.byte $93			  ; $839E - Unknown opcode
	.byte $07			  ; $839F - Unknown opcode
	.byte $47			  ; $83A0 - Unknown opcode
	.byte $FB			  ; $83A1 - Unknown opcode
	ROL $073F,X			  ; $83A2: 3E 3F 07
	.byte $1B			  ; $83A5 - Unknown opcode
	ORA #$40				 ; $83A6: 09 40   
	PHA					  ; $83A8: 48	  
	.byte $02			  ; $83A9 - Unknown opcode
	.byte $0B			  ; $83AA - Unknown opcode
	.byte $47			  ; $83AB - Unknown opcode
	.byte $FC			  ; $83AC - Unknown opcode
	.byte $3F			  ; $83AD - Unknown opcode
	.byte $07			  ; $83AE - Unknown opcode
	ASL tmp3,X			   ; $83AF: 16 03   
	PHA					  ; $83B1: 48	  
	BVS $83BF				; $83B2: 70 0B   
	PHA					  ; $83B4: 48	  
	ASL $3F				  ; $83B5: 06 3F   
	.byte $07			  ; $83B7 - Unknown opcode
	ASL tmp3,X			   ; $83B8: 16 03   
	PHA					  ; $83BA: 48	  
	.byte $6F			  ; $83BB - Unknown opcode
	.byte $0B			  ; $83BC - Unknown opcode
	PHA					  ; $83BD: 48	  
	.byte $03			  ; $83BE - Unknown opcode
loc_83BF:
	.byte $3F			  ; $83BF - Unknown opcode
	.byte $07			  ; $83C0 - Unknown opcode
	ASL tmp3,X			   ; $83C1: 16 03   
	ASL ptr1_hi			  ; $83C3: 06 07   
	.byte $1B			  ; $83C5 - Unknown opcode
	ORA $4810				; $83C6: 0D 10 48
	ROR $070B,X			  ; $83C9: 7E 0B 07
	.byte $1B			  ; $83CC - Unknown opcode
	ORA #$08				 ; $83CD: 09 08   
	PHA					  ; $83CF: 48	  
	ADC $480B,X			  ; $83D0: 7D 0B 48 ; Arithmetic
	.byte $72			  ; $83D3 - Unknown opcode
	ROL $480B,X			  ; $83D4: 3E 0B 48
	.byte $04			  ; $83D7 - Unknown opcode
	.byte $3F			  ; $83D8 - Unknown opcode
	.byte $07			  ; $83D9 - Unknown opcode
	ASL tmp3,X			   ; $83DA: 16 03   
	ASL ptr1_hi			  ; $83DC: 06 07   
	.byte $1B			  ; $83DE - Unknown opcode
	ORA $4810				; $83DF: 0D 10 48
	.byte $7C			  ; $83E2 - Unknown opcode
	.byte $0B			  ; $83E3 - Unknown opcode
	.byte $07			  ; $83E4 - Unknown opcode
	.byte $1B			  ; $83E5 - Unknown opcode
	ORA #$08				 ; $83E6: 09 08   
	ORA ($18,X)			  ; $83E8: 01 18   
	LDA ($73,X)			  ; $83EA: A1 73   
	PHP					  ; $83EC: 08	  
	.byte $0B			  ; $83ED - Unknown opcode
	PHA					  ; $83EE: 48	  
	ADC ($3E),Y			  ; $83EF: 71 3E	; Arithmetic
	.byte $0B			  ; $83F1 - Unknown opcode
	PHA					  ; $83F2: 48	  
	ORA $3F				  ; $83F3: 05 3F   
	.byte $07			  ; $83F5 - Unknown opcode
	ASL tmp3,X			   ; $83F6: 16 03   
	LSR $45				  ; $83F8: 46 45   
	.byte $0B			  ; $83FA - Unknown opcode
	PHA					  ; $83FB: 48	  
	ASL $3F				  ; $83FC: 06 3F   
loc_83FE:
	.byte $07			  ; $83FE - Unknown opcode
	ASL tmp3,X			   ; $83FF: 16 03   
	LSR $7C				  ; $8401: 46 7C   
	.byte $0B			  ; $8403 - Unknown opcode
	LSR $49				  ; $8404: 46 49   
	.byte $3F			  ; $8406 - Unknown opcode
	.byte $07			  ; $8407 - Unknown opcode
	.byte $1B			  ; $8408 - Unknown opcode
	ORA #$40				 ; $8409: 09 40   
	PHA					  ; $840B: 48	  
	ASL $0B				  ; $840C: 06 0B   
	.byte $47			  ; $840E - Unknown opcode
	SBC $073F,X			  ; $840F: FD 3F 07 ; Arithmetic
	.byte $14			  ; $8412 - Unknown opcode
	.byte $07			  ; $8413 - Unknown opcode
	ASL ptr0_hi,X			; $8414: 16 05   
	EOR tmp0				 ; $8416: 45 00   
	.byte $0B			  ; $8418 - Unknown opcode
	.byte $07			  ; $8419 - Unknown opcode
	.byte $1B			  ; $841A - Unknown opcode
	ORA #$40				 ; $841B: 09 40   
	PHA					  ; $841D: 48	  
	.byte $07			  ; $841E - Unknown opcode
	.byte $0B			  ; $841F - Unknown opcode
	LSR $4E				  ; $8420: 46 4E   
	.byte $0B			  ; $8422 - Unknown opcode
	.byte $07			  ; $8423 - Unknown opcode
	ASL tmp2,X			   ; $8424: 16 02   
	EOR $4F				  ; $8426: 45 4F   
	.byte $0B			  ; $8428 - Unknown opcode
	EOR $5C				  ; $8429: 45 5C   
	.byte $3F			  ; $842B - Unknown opcode
	.byte $07			  ; $842C - Unknown opcode
	.byte $1B			  ; $842D - Unknown opcode
	ASL $4780				; $842E: 0E 80 47
	SBC $470B				; $8431: ED 0B 47 ; Arithmetic
	CPX $073F				; $8434: EC 3F 07
	ASL ptr0_hi,X			; $8437: 16 05   
	EOR #$1C				 ; $8439: 49 1C   
	.byte $0B			  ; $843B - Unknown opcode
	.byte $07			  ; $843C - Unknown opcode
	.byte $1B			  ; $843D - Unknown opcode
	ORA #$80				 ; $843E: 09 80   
	ASL ptr1_hi			  ; $8440: 06 07   
	.byte $13			  ; $8442 - Unknown opcode
	.byte $07			  ; $8443 - Unknown opcode
	.byte $47			  ; $8444 - Unknown opcode
	.byte $FF			  ; $8445 - Unknown opcode
	.byte $0B			  ; $8446 - Unknown opcode
	ASL $48				  ; $8447: 06 48   
	BRK					  ; $8449: 00	  
	BRK					  ; $844A: 00	  
	STY $3EA4				; $844B: 8C A4 3E
	ROL $470B,X			  ; $844E: 3E 0B 47
	INC $003F,X			  ; $8451: FE 3F 00
	BVS $83FE				; $8454: 70 A8   
	.byte $3F			  ; $8456 - Unknown opcode
	BRK					  ; $8457: 00	  
	.byte $97			  ; $8458 - Unknown opcode
	.byte $A7			  ; $8459 - Unknown opcode
	.byte $3F			  ; $845A - Unknown opcode
	BRK					  ; $845B: 00	  
	ADC $3FAA,X			  ; $845C: 7D AA 3F ; Arithmetic
	.byte $47			  ; $845F - Unknown opcode
	INC ptr1_hi,X			; $8460: F6 07   
	ORA tmp0				 ; $8462: 05 00   
	ROR $0BAA				; $8464: 6E AA 0B
	.byte $47			  ; $8467 - Unknown opcode
	.byte $F7			  ; $8468 - Unknown opcode
	.byte $3F			  ; $8469 - Unknown opcode
	PHA					  ; $846A: 48	  
	ASL $3F				  ; $846B: 06 3F   
	.byte $07			  ; $846D - Unknown opcode
	ASL tmp3,X			   ; $846E: 16 03   
	PHA					  ; $8470: 48	  
	PLA					  ; $8471: 68	  
	.byte $0B			  ; $8472 - Unknown opcode
	.byte $47			  ; $8473 - Unknown opcode
	INC $073F				; $8474: EE 3F 07
	ASL ptr0_hi,X			; $8477: 16 05   
	EOR #$1A				 ; $8479: 49 1A   
	.byte $0B			  ; $847B - Unknown opcode
	.byte $07			  ; $847C - Unknown opcode
	ASL tmp3,X			   ; $847D: 16 03   
	ASL ptr1_hi			  ; $847F: 06 07   
	.byte $1B			  ; $8481 - Unknown opcode
	.byte $0B			  ; $8482 - Unknown opcode
	.byte $80			  ; $8483 - Unknown opcode
	ASL $48				  ; $8484: 06 48   
	ROR $6A48				; $8486: 6E 48 6A
	ROL $070B,X			  ; $8489: 3E 0B 07
	ORA ($6D),Y			  ; $848C: 11 6D   
	ASL $48				  ; $848E: 06 48   
	.byte $6B			  ; $8490 - Unknown opcode
	.byte $07			  ; $8491 - Unknown opcode
	ORA ptr1_lo			  ; $8492: 05 06   
	PHA					  ; $8494: 48	  
	JMP ($5100)			  ; $8495: 6C 00 51
	LDY #$3E				 ; $8498: A0 3E   
	.byte $0B			  ; $849A - Unknown opcode
	PHA					  ; $849B: 48	  
	ADC $0B3E				; $849C: 6D 3E 0B ; Arithmetic
	ASL $48				  ; $849F: 06 48   
	ADC #$48				 ; $84A1: 69 48	; Arithmetic
	ROR					  ; $84A3: 6A	  
	ROL $0B3E,X			  ; $84A4: 3E 3E 0B
	.byte $07			  ; $84A7 - Unknown opcode
	.byte $1B			  ; $84A8 - Unknown opcode
	ORA #$40				 ; $84A9: 09 40   
	PHA					  ; $84AB: 48	  
	.byte $04			  ; $84AC - Unknown opcode
	.byte $0B			  ; $84AD - Unknown opcode
	.byte $07			  ; $84AE - Unknown opcode
	.byte $14			  ; $84AF - Unknown opcode
	.byte $47			  ; $84B0 - Unknown opcode
	.byte $EF			  ; $84B1 - Unknown opcode
	.byte $0B			  ; $84B2 - Unknown opcode
	.byte $47			  ; $84B3 - Unknown opcode
	BEQ $84F5				; $84B4: F0 3F   
	.byte $07			  ; $84B6 - Unknown opcode
	ASL tmp3,X			   ; $84B7: 16 03   
	ASL $46				  ; $84B9: 06 46   
	.byte $3B			  ; $84BB - Unknown opcode
	.byte $07			  ; $84BC - Unknown opcode
	.byte $1B			  ; $84BD - Unknown opcode
	.byte $0B			  ; $84BE - Unknown opcode
	RTI					  ; $84BF: 40	  
	ASL $48				  ; $84C0: 06 48   
	.byte $62			  ; $84C2 - Unknown opcode
	.byte $07			  ; $84C3 - Unknown opcode
	ORA tmp1				 ; $84C4: 05 01   
	.byte $2B			  ; $84C6 - Unknown opcode
	LDY #$64				 ; $84C7: A0 64   
	PHP					  ; $84C9: 08	  
	.byte $0B			  ; $84CA - Unknown opcode
	PHA					  ; $84CB: 48	  
	.byte $63			  ; $84CC - Unknown opcode
	ROL $480B,X			  ; $84CD: 3E 0B 48
	ADC ($3E,X)			  ; $84D0: 61 3E	; Arithmetic
	.byte $0B			  ; $84D2 - Unknown opcode
	.byte $07			  ; $84D3 - Unknown opcode
	.byte $1B			  ; $84D4 - Unknown opcode
	ORA #$40				 ; $84D5: 09 40   
	PHA					  ; $84D7: 48	  
	PHP					  ; $84D8: 08	  
	.byte $0B			  ; $84D9 - Unknown opcode
	ASL ptr1_hi			  ; $84DA: 06 07   
	.byte $14			  ; $84DC - Unknown opcode
	ASL $46				  ; $84DD: 06 46   
	.byte $3B			  ; $84DF - Unknown opcode
	LSR $3C				  ; $84E0: 46 3C   
	ROL $450B,X			  ; $84E2: 3E 0B 45
	PHA					  ; $84E5: 48	  
	ROL $073F,X			  ; $84E6: 3E 3F 07
	ASL ptr0_hi,X			; $84E9: 16 05   
	.byte $47			  ; $84EB - Unknown opcode
	SBC ($0B),Y			  ; $84EC: F1 0B	; Arithmetic
	.byte $07			  ; $84EE - Unknown opcode
	ASL tmp3,X			   ; $84EF: 16 03   
	ASL $48				  ; $84F1: 06 48   
	CLI					  ; $84F3: 58	  
	.byte $07			  ; $84F4 - Unknown opcode
loc_84F5:
	ORA $48				  ; $84F5: 05 48   
	EOR $480B,Y			  ; $84F7: 59 0B 48
	.byte $5A			  ; $84FA - Unknown opcode
	ROL $070B,X			  ; $84FB: 3E 0B 07
	.byte $1B			  ; $84FE - Unknown opcode
	ORA #$40				 ; $84FF: 09 40   
	PHA					  ; $8501: 48	  
	ORA #$0B				 ; $8502: 09 0B   
	.byte $47			  ; $8504 - Unknown opcode
	SBC ($3F),Y			  ; $8505: F1 3F	; Arithmetic
	.byte $07			  ; $8507 - Unknown opcode
	ASL ptr0_hi,X			; $8508: 16 05   
	EOR #$12				 ; $850A: 49 12   
	.byte $0B			  ; $850C - Unknown opcode
	.byte $07			  ; $850D - Unknown opcode
	ASL tmp3,X			   ; $850E: 16 03   
	PHA					  ; $8510: 48	  
	.byte $5B			  ; $8511 - Unknown opcode
	.byte $0B			  ; $8512 - Unknown opcode
	.byte $47			  ; $8513 - Unknown opcode
	.byte $F4			  ; $8514 - Unknown opcode
	.byte $3F			  ; $8515 - Unknown opcode
	.byte $07			  ; $8516 - Unknown opcode
	ASL ptr0_hi,X			; $8517: 16 05   
	LSR					  ; $8519: 4A	  
	SBC ($0B,X)			  ; $851A: E1 0B	; Arithmetic
	.byte $07			  ; $851C - Unknown opcode
	ASL tmp3,X			   ; $851D: 16 03   
	PHA					  ; $851F: 48	  
	RTS					  ; $8520: 60	  
	.byte $0B			  ; $8521 - Unknown opcode
	.byte $47			  ; $8522 - Unknown opcode
	SBC $3F,X				; $8523: F5 3F	; Arithmetic
	.byte $07			  ; $8525 - Unknown opcode
	ASL ptr0_hi,X			; $8526: 16 05   
	EOR #$11				 ; $8528: 49 11   
	.byte $0B			  ; $852A - Unknown opcode
	.byte $07			  ; $852B - Unknown opcode
	ASL tmp3,X			   ; $852C: 16 03   
	ORA ($16,X)			  ; $852E: 01 16   
	LDY #$5C				 ; $8530: A0 5C   
	PHP					  ; $8532: 08	  
	.byte $0B			  ; $8533 - Unknown opcode
	.byte $07			  ; $8534 - Unknown opcode
	.byte $14			  ; $8535 - Unknown opcode
	.byte $07			  ; $8536 - Unknown opcode
	.byte $1B			  ; $8537 - Unknown opcode
	ORA #$40				 ; $8538: 09 40   
	PHA					  ; $853A: 48	  
	ASL $0B				  ; $853B: 06 0B   
	.byte $47			  ; $853D - Unknown opcode
	.byte $F2			  ; $853E - Unknown opcode
	.byte $0B			  ; $853F - Unknown opcode
	.byte $47			  ; $8540 - Unknown opcode
	.byte $F3			  ; $8541 - Unknown opcode
	.byte $3F			  ; $8542 - Unknown opcode
	.byte $07			  ; $8543 - Unknown opcode
	.byte $1B			  ; $8544 - Unknown opcode
	ORA #$04				 ; $8545: 09 04   
	PHA					  ; $8547: 48	  
	STA ($0B,X)			  ; $8548: 81 0B   
	ASL $48				  ; $854A: 06 48   
	.byte $7F			  ; $854C - Unknown opcode
	.byte $07			  ; $854D - Unknown opcode
	ORA ptr1_lo			  ; $854E: 05 06   
	ORA ($8C,X)			  ; $8550: 01 8C   
	STA $0880,X			  ; $8552: 9D 80 08
	PHA					  ; $8555: 48	  
	STA ($3E,X)			  ; $8556: 81 3E   
	.byte $0B			  ; $8558 - Unknown opcode
	PHA					  ; $8559: 48	  
	.byte $82			  ; $855A - Unknown opcode
	ROL $073F,X			  ; $855B: 3E 3F 07
	.byte $02			  ; $855E - Unknown opcode
	BRK					  ; $855F: 00	  
	JMP $0BA2				; $8560: 4C A2 0B
	LSR $7A				  ; $8563: 46 7A   
	.byte $3F			  ; $8565 - Unknown opcode
	.byte $07			  ; $8566 - Unknown opcode
	.byte $1B			  ; $8567 - Unknown opcode
	ASL					  ; $8568: 0A	  
	ORA (ptr1_lo,X)		  ; $8569: 01 06   
	.byte $07			  ; $856B - Unknown opcode
	.byte $02			  ; $856C - Unknown opcode
	BRK					  ; $856D: 00	  
	JMP $0BA2				; $856E: 4C A2 0B
	LSR $7A				  ; $8571: 46 7A   
	ROL $070B,X			  ; $8573: 3E 0B 07
	.byte $02			  ; $8576 - Unknown opcode
	ASL $43				  ; $8577: 06 43   
	.byte $23			  ; $8579 - Unknown opcode
	.byte $07			  ; $857A - Unknown opcode
	ORA ptr1_lo			  ; $857B: 05 06   
	.byte $43			  ; $857D - Unknown opcode
	BIT tmp0				 ; $857E: 24 00   
	.byte $1F			  ; $8580 - Unknown opcode
	CLV					  ; $8581: B8	  
	ROL $430B,X			  ; $8582: 3E 0B 43
	AND $3E				  ; $8585: 25 3E   
	.byte $0B			  ; $8587 - Unknown opcode
	ASL $43				  ; $8588: 06 43   
	ROL ptr1_hi			  ; $858A: 26 07   
	ORA tmp0				 ; $858C: 05 00   
	PLA					  ; $858E: 68	  
	LDY #$0B				 ; $858F: A0 0B   
	.byte $43			  ; $8591 - Unknown opcode
	PLP					  ; $8592: 28	  
	ROL $073F,X			  ; $8593: 3E 3F 07
	ASL ptr0_hi,X			; $8596: 16 05   
	.byte $07			  ; $8598 - Unknown opcode
	.byte $83			  ; $8599 - Unknown opcode
	ORA $12				  ; $859A: 05 12   
	ORA ($0B,X)			  ; $859C: 01 0B   
	ASL ptr1_hi			  ; $859E: 06 07   
	.byte $02			  ; $85A0 - Unknown opcode
	.byte $12			  ; $85A1 - Unknown opcode
	ORA ($0B,X)			  ; $85A2: 01 0B   
	EOR #$7A				 ; $85A4: 49 7A   
	ROL $070B,X			  ; $85A6: 3E 0B 07
	.byte $1B			  ; $85A9 - Unknown opcode
	.byte $0B			  ; $85AA - Unknown opcode
	PHP					  ; $85AB: 08	  
	PHA					  ; $85AC: 48	  
	.byte $9B			  ; $85AD - Unknown opcode
	.byte $0B			  ; $85AE - Unknown opcode
	.byte $07			  ; $85AF - Unknown opcode
	.byte $1B			  ; $85B0 - Unknown opcode
	ORA tmp2				 ; $85B1: 05 02   
	ASL $48				  ; $85B3: 06 48   
	STA current_bank,Y	   ; $85B5: 99 07 05
	ASL $48				  ; $85B8: 06 48   
	TXS					  ; $85BA: 9A	  
	BRK					  ; $85BB: 00	  
	STA $A0,X				; $85BC: 95 A0   
	PHA					  ; $85BE: 48	  
	.byte $9B			  ; $85BF - Unknown opcode
	CLC					  ; $85C0: 18	  
	.byte $0B			  ; $85C1 - Unknown opcode
	PHP					  ; $85C2: 08	  
	BRK					  ; $85C3: 00	  
	CLC					  ; $85C4: 18	  
	.byte $D2			  ; $85C5 - Unknown opcode
	ROL $480B,X			  ; $85C6: 3E 0B 48
	.byte $9C			  ; $85C9 - Unknown opcode
	ROL $070B,X			  ; $85CA: 3E 0B 07
	.byte $1B			  ; $85CD - Unknown opcode
	.byte $0B			  ; $85CE - Unknown opcode
	.byte $04			  ; $85CF - Unknown opcode
	.byte $43			  ; $85D0 - Unknown opcode
	LDA $060B				; $85D1: AD 0B 06
	PHA					  ; $85D4: 48	  
	.byte $4B			  ; $85D5 - Unknown opcode
	BRK					  ; $85D6: 00	  
	STA $18A0,X			  ; $85D7: 9D A0 18
	.byte $0B			  ; $85DA - Unknown opcode
	.byte $04			  ; $85DB - Unknown opcode
	ROL $073F,X			  ; $85DC: 3E 3F 07
	ASL ptr0_hi,X			; $85DF: 16 05   
	.byte $07			  ; $85E1 - Unknown opcode
	.byte $83			  ; $85E2 - Unknown opcode
	ORA $49				  ; $85E3: 05 49   
	.byte $77			  ; $85E5 - Unknown opcode
	.byte $0B			  ; $85E6 - Unknown opcode
	ASL $49				  ; $85E7: 06 49   
	SEI					  ; $85E9: 78	  
	EOR #$79				 ; $85EA: 49 79   
	ROL $070B,X			  ; $85EC: 3E 0B 07
	.byte $1B			  ; $85EF - Unknown opcode
	.byte $0B			  ; $85F0 - Unknown opcode
	JSR $9F48				; $85F1: 20 48 9F ; -> sub_9F48
	.byte $0B			  ; $85F4 - Unknown opcode
	PHA					  ; $85F5: 48	  
	.byte $23			  ; $85F6 - Unknown opcode
	.byte $3F			  ; $85F7 - Unknown opcode
	.byte $07			  ; $85F8 - Unknown opcode
	.byte $14			  ; $85F9 - Unknown opcode
	.byte $07			  ; $85FA - Unknown opcode
	.byte $1B			  ; $85FB - Unknown opcode
	BPL $863E				; $85FC: 10 40   
	ORA ($E0,X)			  ; $85FE: 01 E0   
	STA $080A,X			  ; $8600: 9D 0A 08
	.byte $0B			  ; $8603 - Unknown opcode
	PHA					  ; $8604: 48	  
	ASL					  ; $8605: 0A	  
	.byte $0B			  ; $8606 - Unknown opcode
	ORA ($DA,X)			  ; $8607: 01 DA   
	STA $080A,X			  ; $8609: 9D 0A 08
	.byte $3F			  ; $860C - Unknown opcode
	.byte $07			  ; $860D - Unknown opcode
	.byte $14			  ; $860E - Unknown opcode
	.byte $07			  ; $860F - Unknown opcode
	ASL ptr0_hi,X			; $8610: 16 05   
	ORA ($CB,X)			  ; $8612: 01 CB   
	.byte $AB			  ; $8614 - Unknown opcode
	STA ($09,X)			  ; $8615: 81 09   
	.byte $0B			  ; $8617 - Unknown opcode
	.byte $07			  ; $8618 - Unknown opcode
	.byte $1B			  ; $8619 - Unknown opcode
	ORA $10				  ; $861A: 05 10   
	.byte $07			  ; $861C - Unknown opcode
	.byte $1B			  ; $861D - Unknown opcode
	ORA ptr0_lo			  ; $861E: 05 04   
	PHA					  ; $8620: 48	  
	EOR $0B				  ; $8621: 45 0B   
	PHA					  ; $8623: 48	  
	.byte $1B			  ; $8624 - Unknown opcode
	.byte $0B			  ; $8625 - Unknown opcode
	.byte $07			  ; $8626 - Unknown opcode
	.byte $1B			  ; $8627 - Unknown opcode
	ORA $20				  ; $8628: 05 20   
	PHA					  ; $862A: 48	  
	ORA $060B,Y			  ; $862B: 19 0B 06
	.byte $07			  ; $862E - Unknown opcode
	.byte $1B			  ; $862F - Unknown opcode
	ORA ptr0_lo			  ; $8630: 05 04   
	PHA					  ; $8632: 48	  
	.byte $44			  ; $8633 - Unknown opcode
	.byte $0B			  ; $8634 - Unknown opcode
	PHA					  ; $8635: 48	  
	ORA $48,X				; $8636: 15 48   
	ASL ptr1_hi,X			; $8638: 16 07   
	ORA ptr1_lo			  ; $863A: 05 06   
	PHA					  ; $863C: 48	  
	.byte $17			  ; $863D - Unknown opcode
loc_863E:
	CLC					  ; $863E: 18	  
	ORA $20				  ; $863F: 05 20   
	ROL $480B,X			  ; $8641: 3E 0B 48
	CLC					  ; $8644: 18	  
	ROL $070B,X			  ; $8645: 3E 0B 07
	ASL ptr0_hi,X			; $8648: 16 05   
	EOR $CB				  ; $864A: 45 CB   
	.byte $0B			  ; $864C - Unknown opcode
	.byte $07			  ; $864D - Unknown opcode
	.byte $1B			  ; $864E - Unknown opcode
	ORA ptr0_lo			  ; $864F: 05 04   
	PHA					  ; $8651: 48	  
	LSR					  ; $8652: 4A	  
	.byte $0B			  ; $8653 - Unknown opcode
	PHA					  ; $8654: 48	  
	.byte $22			  ; $8655 - Unknown opcode
	.byte $3F			  ; $8656 - Unknown opcode
	.byte $07			  ; $8657 - Unknown opcode
	.byte $1B			  ; $8658 - Unknown opcode
	ORA ptr0_lo			  ; $8659: 05 04   
	PHA					  ; $865B: 48	  
	EOR #$0B				 ; $865C: 49 0B   
	PHA					  ; $865E: 48	  
	AND ($3F,X)			  ; $865F: 21 3F   
	.byte $07			  ; $8661 - Unknown opcode
	.byte $1B			  ; $8662 - Unknown opcode
	ORA ptr0_lo			  ; $8663: 05 04   
	ASL $48				  ; $8665: 06 48   
	LSR ptr1_hi			  ; $8667: 46 07   
	ORA $48				  ; $8669: 05 48   
	.byte $47			  ; $866B - Unknown opcode
	.byte $0B			  ; $866C - Unknown opcode
	PHA					  ; $866D: 48	  
	PHA					  ; $866E: 48	  
	ROL $070B,X			  ; $866F: 3E 0B 07
	.byte $14			  ; $8672 - Unknown opcode
	ASL $48				  ; $8673: 06 48   
	.byte $1C			  ; $8675 - Unknown opcode
	.byte $07			  ; $8676 - Unknown opcode
	ORA $48				  ; $8677: 05 48   
	ORA $480B,X			  ; $8679: 1D 0B 48
	ASL $0B3E,X			  ; $867C: 1E 3E 0B
	PHA					  ; $867F: 48	  
	JSR $073F				; $8680: 20 3F 07
	ASL ptr0_hi,X			; $8683: 16 05   
	ASL $49				  ; $8685: 06 49   
	.byte $7B			  ; $8687 - Unknown opcode
	.byte $07			  ; $8688 - Unknown opcode
	.byte $03			  ; $8689 - Unknown opcode
	ORA $49				  ; $868A: 05 49   
	.byte $7C			  ; $868C - Unknown opcode
	ROL $070B,X			  ; $868D: 3E 0B 07
	.byte $1B			  ; $8690 - Unknown opcode
	ORA ptr0_lo			  ; $8691: 05 04   
	PHA					  ; $8693: 48	  
	.byte $43			  ; $8694 - Unknown opcode
	.byte $0B			  ; $8695 - Unknown opcode
	PHA					  ; $8696: 48	  
	.byte $12			  ; $8697 - Unknown opcode
	.byte $3F			  ; $8698 - Unknown opcode
	.byte $07			  ; $8699 - Unknown opcode
	.byte $02			  ; $869A - Unknown opcode
	.byte $12			  ; $869B - Unknown opcode
	.byte $02			  ; $869C - Unknown opcode
	.byte $0B			  ; $869D - Unknown opcode
	.byte $07			  ; $869E - Unknown opcode
	ASL ptr0_hi,X			; $869F: 16 05   
	.byte $07			  ; $86A1 - Unknown opcode
	.byte $03			  ; $86A2 - Unknown opcode
	ORA $49				  ; $86A3: 05 49   
	SEI					  ; $86A5: 78	  
	.byte $0B			  ; $86A6 - Unknown opcode
	.byte $12			  ; $86A7 - Unknown opcode
	.byte $02			  ; $86A8 - Unknown opcode
	.byte $0B			  ; $86A9 - Unknown opcode
	.byte $07			  ; $86AA - Unknown opcode
	.byte $1B			  ; $86AB - Unknown opcode
	.byte $0B			  ; $86AC - Unknown opcode
	JSR $9E48				; $86AD: 20 48 9E ; -> sub_9E48
	.byte $0B			  ; $86B0 - Unknown opcode
	PHA					  ; $86B1: 48	  
	.byte $1F			  ; $86B2 - Unknown opcode
	.byte $3F			  ; $86B3 - Unknown opcode
	LSR map_number		   ; $86B4: 46 63   
	.byte $07			  ; $86B6 - Unknown opcode
	.byte $03			  ; $86B7 - Unknown opcode
	ORA tmp0				 ; $86B8: 05 00   
	STY $3FA4				; $86BA: 8C A4 3F
	.byte $07			  ; $86BD - Unknown opcode
	.byte $1B			  ; $86BE - Unknown opcode
	.byte $0B			  ; $86BF - Unknown opcode
	.byte $04			  ; $86C0 - Unknown opcode
	ORA ($A2,X)			  ; $86C1: 01 A2   
	LDY #$4C				 ; $86C3: A0 4C   
	PHP					  ; $86C5: 08	  
	.byte $0B			  ; $86C6 - Unknown opcode
	ASL $48				  ; $86C7: 06 48   
	BIT ptr1_hi			  ; $86C9: 24 07   
	ORA ptr1_lo			  ; $86CB: 05 06   
	PHA					  ; $86CD: 48	  
	AND ptr1_hi			  ; $86CE: 25 07   
	ORA ptr1_lo			  ; $86D0: 05 06   
	PHA					  ; $86D2: 48	  
	ROL tmp0				 ; $86D3: 26 00   
	SBC $3EA0,Y			  ; $86D5: F9 A0 3E ; Arithmetic
	.byte $0B			  ; $86D8 - Unknown opcode
	PHA					  ; $86D9: 48	  
	.byte $27			  ; $86DA - Unknown opcode
	ROL $480B,X			  ; $86DB: 3E 0B 48
	.byte $27			  ; $86DE - Unknown opcode
	ROL $073F,X			  ; $86DF: 3E 3F 07
	ASL ptr0_hi,X			; $86E2: 16 05   
	EOR #$E8				 ; $86E4: 49 E8   
	.byte $0B			  ; $86E6 - Unknown opcode
	.byte $07			  ; $86E7 - Unknown opcode
	.byte $1B			  ; $86E8 - Unknown opcode
	ASL $4340				; $86E9: 0E 40 43
	LDA ($0B),Y			  ; $86EC: B1 0B   
	PHA					  ; $86EE: 48	  
	ROL $3F,X				; $86EF: 36 3F   
	.byte $07			  ; $86F1 - Unknown opcode
	ASL ptr0_hi,X			; $86F2: 16 05   
	EOR #$E9				 ; $86F4: 49 E9   
	.byte $0B			  ; $86F6 - Unknown opcode
	ORA ($21,X)			  ; $86F7: 01 21   
	LDA $29				  ; $86F9: A5 29   
	PHP					  ; $86FB: 08	  
	.byte $3F			  ; $86FC - Unknown opcode
	.byte $07			  ; $86FD - Unknown opcode
	.byte $1B			  ; $86FE - Unknown opcode
	PHP					  ; $86FF: 08	  
	ORA ($48,X)			  ; $8700: 01 48   
	.byte $8F			  ; $8702 - Unknown opcode
	.byte $0B			  ; $8703 - Unknown opcode
	.byte $07			  ; $8704 - Unknown opcode
	.byte $1B			  ; $8705 - Unknown opcode
	ORA tmp1				 ; $8706: 05 01   
	PHA					  ; $8708: 48	  
	.byte $3C			  ; $8709 - Unknown opcode
	.byte $0B			  ; $870A - Unknown opcode
	.byte $07			  ; $870B - Unknown opcode
	ORA ($77),Y			  ; $870C: 11 77   
	PHA					  ; $870E: 48	  
	.byte $3C			  ; $870F - Unknown opcode
	.byte $0B			  ; $8710 - Unknown opcode
	.byte $07			  ; $8711 - Unknown opcode
	.byte $14			  ; $8712 - Unknown opcode
	.byte $07			  ; $8713 - Unknown opcode
	.byte $1B			  ; $8714 - Unknown opcode
	ORA $08				  ; $8715: 05 08   
	PHA					  ; $8717: 48	  
	SEC					  ; $8718: 38	  
	.byte $0B			  ; $8719 - Unknown opcode
	ASL $48				  ; $871A: 06 48   
	.byte $37			  ; $871C - Unknown opcode
	PHA					  ; $871D: 48	  
	SEC					  ; $871E: 38	  
	BRK					  ; $871F: 00	  
	DEC $3EA4,X			  ; $8720: DE A4 3E
	.byte $0B			  ; $8723 - Unknown opcode
	ASL $48				  ; $8724: 06 48   
	AND $F001,Y			  ; $8726: 39 01 F0
	LDY $3A				  ; $8729: A4 3A   
	PHP					  ; $872B: 08	  
	ROL $073F,X			  ; $872C: 3E 3F 07
	ASL ptr0_hi,X			; $872F: 16 05   
	ASL $48				  ; $8731: 06 48   
	BCC $877E				; $8733: 90 49   
	.byte $E3			  ; $8735 - Unknown opcode
	ROL $070B,X			  ; $8736: 3E 0B 07
	.byte $1B			  ; $8739 - Unknown opcode
	PHP					  ; $873A: 08	  
	ORA (ptr1_lo,X)		  ; $873B: 01 06   
	PHA					  ; $873D: 48	  
	BCC $8788				; $873E: 90 48   
	STA ($3E),Y			  ; $8740: 91 3E   
	.byte $0B			  ; $8742 - Unknown opcode
	LSR $6D				  ; $8743: 46 6D   
	.byte $3F			  ; $8745 - Unknown opcode
	.byte $07			  ; $8746 - Unknown opcode
	ASL ptr0_hi,X			; $8747: 16 05   
	.byte $12			  ; $8749 - Unknown opcode
	.byte $03			  ; $874A - Unknown opcode
	.byte $0B			  ; $874B - Unknown opcode
	PHA					  ; $874C: 48	  
	PLP					  ; $874D: 28	  
	.byte $3F			  ; $874E - Unknown opcode
	.byte $07			  ; $874F - Unknown opcode
	ASL ptr0_hi,X			; $8750: 16 05   
	EOR #$EB				 ; $8752: 49 EB   
	.byte $0B			  ; $8754 - Unknown opcode
	.byte $07			  ; $8755 - Unknown opcode
	.byte $1B			  ; $8756 - Unknown opcode
	ORA ptr0_lo			  ; $8757: 05 04   
	PHA					  ; $8759: 48	  
	ROL $480B,X			  ; $875A: 3E 0B 48
	AND $483F,X			  ; $875D: 3D 3F 48
	.byte $3F			  ; $8760 - Unknown opcode
	.byte $07			  ; $8761 - Unknown opcode
	ORA ($56),Y			  ; $8762: 11 56   
	ORA (tmp1,X)			 ; $8764: 01 01   
	LDA $40				  ; $8766: A5 40   
	PHP					  ; $8768: 08	  
	.byte $3F			  ; $8769 - Unknown opcode
	.byte $07			  ; $876A - Unknown opcode
	ASL ptr0_hi,X			; $876B: 16 05   
	EOR #$EA				 ; $876D: 49 EA   
	.byte $0B			  ; $876F - Unknown opcode
	ASL $43				  ; $8770: 06 43   
	LSR					  ; $8772: 4A	  
	BRK					  ; $8773: 00	  
	.byte $74			  ; $8774 - Unknown opcode
	TAX					  ; $8775: AA	  
	ROL $073F,X			  ; $8776: 3E 3F 07
	ASL ptr0_hi,X			; $8779: 16 05   
	EOR #$E4				 ; $877B: 49 E4   
	.byte $0B			  ; $877D - Unknown opcode
loc_877E:
	.byte $07			  ; $877E - Unknown opcode
	.byte $1B			  ; $877F - Unknown opcode
	ORA tmp2				 ; $8780: 05 02   
	LSR $72				  ; $8782: 46 72   
	.byte $0B			  ; $8784 - Unknown opcode
	LSR $6E				  ; $8785: 46 6E   
	.byte $3F			  ; $8787 - Unknown opcode
loc_8788:
	.byte $07			  ; $8788 - Unknown opcode
	ASL ptr0_hi,X			; $8789: 16 05   
	EOR #$E5				 ; $878B: 49 E5   
	.byte $0B			  ; $878D - Unknown opcode
	.byte $07			  ; $878E - Unknown opcode
	.byte $1B			  ; $878F - Unknown opcode
	ORA tmp2				 ; $8790: 05 02   
	LSR $73				  ; $8792: 46 73   
	.byte $0B			  ; $8794 - Unknown opcode
	LSR $6F				  ; $8795: 46 6F   
	.byte $3F			  ; $8797 - Unknown opcode
	.byte $07			  ; $8798 - Unknown opcode
	ASL ptr0_hi,X			; $8799: 16 05   
	EOR #$E6				 ; $879B: 49 E6   
	.byte $0B			  ; $879D - Unknown opcode
	PHA					  ; $879E: 48	  
	.byte $34			  ; $879F - Unknown opcode
	.byte $3F			  ; $87A0 - Unknown opcode
	.byte $07			  ; $87A1 - Unknown opcode
	ASL ptr0_hi,X			; $87A2: 16 05   
	EOR #$E7				 ; $87A4: 49 E7   
	.byte $0B			  ; $87A6 - Unknown opcode
	PHA					  ; $87A7: 48	  
	AND $3F,X				; $87A8: 35 3F   
	.byte $07			  ; $87AA - Unknown opcode
	.byte $1B			  ; $87AB - Unknown opcode
	PHP					  ; $87AC: 08	  
	ORA ($48,X)			  ; $87AD: 01 48   
	STX $070B				; $87AF: 8E 0B 07
	.byte $1B			  ; $87B2 - Unknown opcode
	ORA tmp2				 ; $87B3: 05 02   
	ASL $46				  ; $87B5: 06 46   
	.byte $74			  ; $87B7 - Unknown opcode
	CLC					  ; $87B8: 18	  
	.byte $0B			  ; $87B9 - Unknown opcode
	BPL $87FA				; $87BA: 10 3E   
	.byte $0B			  ; $87BC - Unknown opcode
	LSR $70				  ; $87BD: 46 70   
	.byte $3F			  ; $87BF - Unknown opcode
	.byte $07			  ; $87C0 - Unknown opcode
	.byte $1B			  ; $87C1 - Unknown opcode
	ASL					  ; $87C2: 0A	  
	BPL $880D				; $87C3: 10 48   
	.byte $97			  ; $87C5 - Unknown opcode
	.byte $0B			  ; $87C6 - Unknown opcode
	.byte $07			  ; $87C7 - Unknown opcode
	.byte $1B			  ; $87C8 - Unknown opcode
	.byte $0C			  ; $87C9 - Unknown opcode
	RTI					  ; $87CA: 40	  
	ASL $48				  ; $87CB: 06 48   
	TYA					  ; $87CD: 98	  
	CLC					  ; $87CE: 18	  
	.byte $0C			  ; $87CF - Unknown opcode
	.byte $80			  ; $87D0 - Unknown opcode
	ROL $060B,X			  ; $87D1: 3E 0B 06
	PHA					  ; $87D4: 48	  
	.byte $92			  ; $87D5 - Unknown opcode
	.byte $07			  ; $87D6 - Unknown opcode
	ORA ptr1_lo			  ; $87D7: 05 06   
	.byte $07			  ; $87D9 - Unknown opcode
	.byte $1B			  ; $87DA - Unknown opcode
	.byte $0B			  ; $87DB - Unknown opcode
	JSR $0106				; $87DC: 20 06 01
	BIT $95A6				; $87DF: 2C A6 95
	PHP					  ; $87E2: 08	  
	ROL $480B,X			  ; $87E3: 3E 0B 48
	STY $3E,X				; $87E6: 94 3E   
	.byte $0B			  ; $87E8 - Unknown opcode
	PHA					  ; $87E9: 48	  
	.byte $93			  ; $87EA - Unknown opcode
	ROL $073F,X			  ; $87EB: 3E 3F 07
	ASL ptr0_hi,X			; $87EE: 16 05   
	ORA ($97,X)			  ; $87F0: 01 97   
	TAX					  ; $87F2: AA	  
	ASL $09				  ; $87F3: 06 09   
	.byte $0B			  ; $87F5 - Unknown opcode
	PHA					  ; $87F6: 48	  
	LDA $3F				  ; $87F7: A5 3F   
	.byte $07			  ; $87F9 - Unknown opcode
loc_87FA:
	ASL ptr0_hi,X			; $87FA: 16 05   
	EOR #$05				 ; $87FC: 49 05   
	.byte $0B			  ; $87FE - Unknown opcode
	PHA					  ; $87FF: 48	  
	LDX $3F				  ; $8800: A6 3F   
	.byte $07			  ; $8802 - Unknown opcode
	ASL ptr0_hi,X			; $8803: 16 05   
	EOR #$04				 ; $8805: 49 04   
	.byte $0B			  ; $8807 - Unknown opcode
	PHA					  ; $8808: 48	  
	.byte $A7			  ; $8809 - Unknown opcode
	.byte $3F			  ; $880A - Unknown opcode
	PHA					  ; $880B: 48	  
	EOR (ptr1_hi),Y		  ; $880C: 51 07   
	ORA $45				  ; $880E: 05 45   
	ORA ($0B,X)			  ; $8810: 01 0B   
	PHA					  ; $8812: 48	  
	.byte $52			  ; $8813 - Unknown opcode
	.byte $3F			  ; $8814 - Unknown opcode
	PHA					  ; $8815: 48	  
	.byte $53			  ; $8816 - Unknown opcode
	.byte $07			  ; $8817 - Unknown opcode
	ORA tmp1				 ; $8818: 05 01   
	DEC $9F,X				; $881A: D6 9F   
	.byte $53			  ; $881C - Unknown opcode
	PHP					  ; $881D: 08	  
	.byte $0B			  ; $881E - Unknown opcode
	PHA					  ; $881F: 48	  
	.byte $57			  ; $8820 - Unknown opcode
	.byte $3F			  ; $8821 - Unknown opcode
	.byte $07			  ; $8822 - Unknown opcode
	.byte $1B			  ; $8823 - Unknown opcode
	ORA $4810				; $8824: 0D 10 48
	STA $070B				; $8827: 8D 0B 07
	.byte $1B			  ; $882A - Unknown opcode
	.byte $0B			  ; $882B - Unknown opcode
	JSR $4806				; $882C: 20 06 48
	STY $0918				; $882F: 8C 18 09
	PHP					  ; $8832: 08	  
	ROL $070B,X			  ; $8833: 3E 0B 07
	.byte $1B			  ; $8836 - Unknown opcode
	.byte $0B			  ; $8837 - Unknown opcode
	RTI					  ; $8838: 40	  
	PHA					  ; $8839: 48	  
	.byte $8B			  ; $883A - Unknown opcode
	.byte $0B			  ; $883B - Unknown opcode
	.byte $07			  ; $883C - Unknown opcode
	.byte $1B			  ; $883D - Unknown opcode
	PHP					  ; $883E: 08	  
	ORA (ptr1_lo,X)		  ; $883F: 01 06   
	PHA					  ; $8841: 48	  
	TXA					  ; $8842: 8A	  
	CLC					  ; $8843: 18	  
	.byte $0B			  ; $8844 - Unknown opcode
	RTI					  ; $8845: 40	  
	ROL $070B,X			  ; $8846: 3E 0B 07
	.byte $1B			  ; $8849 - Unknown opcode
	ORA tmp1				 ; $884A: 05 01   
	PHA					  ; $884C: 48	  
	.byte $89			  ; $884D - Unknown opcode
	.byte $0B			  ; $884E - Unknown opcode
	ASL $48				  ; $884F: 06 48   
	STX ptr1_hi			  ; $8851: 86 07   
	ORA $48				  ; $8853: 05 48   
	.byte $87			  ; $8855 - Unknown opcode
	.byte $0B			  ; $8856 - Unknown opcode
	PHA					  ; $8857: 48	  
	DEY					  ; $8858: 88	  
	ROL $073F,X			  ; $8859: 3E 3F 07
	.byte $1B			  ; $885C - Unknown opcode
	PHP					  ; $885D: 08	  
	ORA ($48,X)			  ; $885E: 01 48   
	STA $0B				  ; $8860: 85 0B   
	.byte $07			  ; $8862 - Unknown opcode
	.byte $1B			  ; $8863 - Unknown opcode
	ORA tmp1				 ; $8864: 05 01   
	PHA					  ; $8866: 48	  
	STY $0B				  ; $8867: 84 0B   
	PHA					  ; $8869: 48	  
	.byte $83			  ; $886A - Unknown opcode
	.byte $3F			  ; $886B - Unknown opcode
	.byte $07			  ; $886C - Unknown opcode
	.byte $02			  ; $886D - Unknown opcode
	.byte $12			  ; $886E - Unknown opcode
	ASL $0B				  ; $886F: 06 0B   
	PHA					  ; $8871: 48	  
	STA $073F,X			  ; $8872: 9D 3F 07
	ASL ptr0_hi,X			; $8875: 16 05   
	.byte $07			  ; $8877 - Unknown opcode
	.byte $02			  ; $8878 - Unknown opcode
	.byte $12			  ; $8879 - Unknown opcode
	.byte $04			  ; $887A - Unknown opcode
	.byte $0B			  ; $887B - Unknown opcode
	.byte $07			  ; $887C - Unknown opcode
	.byte $03			  ; $887D - Unknown opcode
	ORA $49				  ; $887E: 05 49   
	ORA #$0B				 ; $8880: 09 0B   
	EOR #$08				 ; $8882: 49 08   
	.byte $0B			  ; $8884 - Unknown opcode
	.byte $07			  ; $8885 - Unknown opcode
	.byte $1B			  ; $8886 - Unknown opcode
	.byte $0B			  ; $8887 - Unknown opcode
	ORA (ptr1_lo,X)		  ; $8888: 01 06   
	PHA					  ; $888A: 48	  
	LDY #$07				 ; $888B: A0 07   
	ORA $48				  ; $888D: 05 48   
	LDX #$0B				 ; $888F: A2 0B   
	PHA					  ; $8891: 48	  
	LDY $48				  ; $8892: A4 48   
	.byte $A3			  ; $8894 - Unknown opcode
	BRK					  ; $8895: 00	  
	.byte $83			  ; $8896 - Unknown opcode
	STA $0B3E,X			  ; $8897: 9D 3E 0B
	.byte $07			  ; $889A - Unknown opcode
	.byte $1B			  ; $889B - Unknown opcode
	.byte $0C			  ; $889C - Unknown opcode
	.byte $80			  ; $889D - Unknown opcode
	PHA					  ; $889E: 48	  
	LDA ($0B,X)			  ; $889F: A1 0B   
	.byte $07			  ; $88A1 - Unknown opcode
	.byte $14			  ; $88A2 - Unknown opcode
	ASL ptr1_hi			  ; $88A3: 06 07   
	.byte $02			  ; $88A5 - Unknown opcode
	ASL $43				  ; $88A6: 06 43   
	.byte $6B			  ; $88A8 - Unknown opcode
	.byte $07			  ; $88A9 - Unknown opcode
	ORA tmp0				 ; $88AA: 05 00   
	STA $0B9E,Y			  ; $88AC: 99 9E 0B
	.byte $43			  ; $88AF - Unknown opcode
	JMP ($0B3E)			  ; $88B0: 6C 3E 0B
	ASL $48				  ; $88B3: 06 48   
	ROR ptr1_hi			  ; $88B5: 66 07   
	ORA ptr1_lo			  ; $88B7: 05 06   
	PHA					  ; $88B9: 48	  
	.byte $0C			  ; $88BA - Unknown opcode
	BRK					  ; $88BB: 00	  
	LSR $9E,X				; $88BC: 56 9E   
	PHA					  ; $88BE: 48	  
	ORA $8201				; $88BF: 0D 01 82
	.byte $9E			  ; $88C2 - Unknown opcode
	ASL $3E08				; $88C3: 0E 08 3E
	.byte $0B			  ; $88C6 - Unknown opcode
	PHA					  ; $88C7: 48	  
	.byte $67			  ; $88C8 - Unknown opcode
	ROL $0B3E,X			  ; $88C9: 3E 3E 0B
	ASL $48				  ; $88CC: 06 48   
	ORA ($48),Y			  ; $88CE: 11 48   
	.byte $0C			  ; $88D0 - Unknown opcode
	BRK					  ; $88D1: 00	  
	LSR $9E,X				; $88D2: 56 9E   
	PHA					  ; $88D4: 48	  
	ORA $8201				; $88D5: 0D 01 82
	.byte $9E			  ; $88D8 - Unknown opcode
	ASL $3E08				; $88D9: 0E 08 3E
	.byte $3F			  ; $88DC - Unknown opcode
	.byte $07			  ; $88DD - Unknown opcode
	STY ptr1_lo,X			; $88DE: 94 06   
	PHA					  ; $88E0: 48	  
	TAY					  ; $88E1: A8	  
	.byte $07			  ; $88E2 - Unknown opcode
	.byte $03			  ; $88E3 - Unknown opcode
	.byte $03			  ; $88E4 - Unknown opcode
	PHA					  ; $88E5: 48	  
	LDA #$3E				 ; $88E6: A9 3E   
	.byte $0B			  ; $88E8 - Unknown opcode
	ASL ptr1_hi			  ; $88E9: 06 07   
	ASL ptr0_hi,X			; $88EB: 16 05   
	ASL ptr1_hi			  ; $88ED: 06 07   
	.byte $1B			  ; $88EF - Unknown opcode
	.byte $1A			  ; $88F0 - Unknown opcode
	.byte $02			  ; $88F1 - Unknown opcode
	LSR					  ; $88F2: 4A	  
	.byte $1F			  ; $88F3 - Unknown opcode
	.byte $0B			  ; $88F4 - Unknown opcode
	EOR #$FD				 ; $88F5: 49 FD   
	ROL $460B,X			  ; $88F7: 3E 0B 46
	BCC $893A				; $88FA: 90 3E   
	.byte $3F			  ; $88FC - Unknown opcode
	.byte $07			  ; $88FD - Unknown opcode
	ASL ptr0_hi,X			; $88FE: 16 05   
	.byte $07			  ; $8900 - Unknown opcode
	.byte $1B			  ; $8901 - Unknown opcode
	.byte $1A			  ; $8902 - Unknown opcode
	.byte $02			  ; $8903 - Unknown opcode
	LSR					  ; $8904: 4A	  
	JSR $4A0B				; $8905: 20 0B 4A
	CLC					  ; $8908: 18	  
	.byte $0B			  ; $8909 - Unknown opcode
	.byte $07			  ; $890A - Unknown opcode
	.byte $13			  ; $890B - Unknown opcode
	.byte $03			  ; $890C - Unknown opcode
	PHA					  ; $890D: 48	  
	.byte $AB			  ; $890E - Unknown opcode
	.byte $0B			  ; $890F - Unknown opcode
	PHA					  ; $8910: 48	  
	TAX					  ; $8911: AA	  
	.byte $3F			  ; $8912 - Unknown opcode
	.byte $07			  ; $8913 - Unknown opcode
	.byte $03			  ; $8914 - Unknown opcode
	.byte $03			  ; $8915 - Unknown opcode
	PHA					  ; $8916: 48	  
	LDY $480B				; $8917: AC 0B 48
	LDA $073F				; $891A: AD 3F 07
	ASL ptr0_hi,X			; $891D: 16 05   
	.byte $07			  ; $891F - Unknown opcode
	.byte $14			  ; $8920 - Unknown opcode
	EOR #$A4				 ; $8921: 49 A4   
	.byte $0B			  ; $8923 - Unknown opcode
	EOR $CB				  ; $8924: 45 CB   
	.byte $0B			  ; $8926 - Unknown opcode
	.byte $07			  ; $8927 - Unknown opcode
	.byte $14			  ; $8928 - Unknown opcode
	ASL $48				  ; $8929: 06 48   
	LDA $1B07,Y			  ; $892B: B9 07 1B
	ORA #$20				 ; $892E: 09 20   
	CLC					  ; $8930: 18	  
	ORA #$00				 ; $8931: 09 00   
	.byte $0B			  ; $8933 - Unknown opcode
	PHA					  ; $8934: 48	  
	TSX					  ; $8935: BA	  
	ROL $480B,X			  ; $8936: 3E 0B 48
	.byte $BB			  ; $8939 - Unknown opcode
loc_893A:
	.byte $3F			  ; $893A - Unknown opcode
	.byte $07			  ; $893B - Unknown opcode
	.byte $03			  ; $893C - Unknown opcode
	.byte $03			  ; $893D - Unknown opcode
	ASL $48				  ; $893E: 06 48   
	BCS $8949				; $8940: B0 07   
	ORA ptr1_lo			  ; $8942: 05 06   
	PHA					  ; $8944: 48	  
	LDA (tmp0),Y			 ; $8945: B1 00   
	STA $A6				  ; $8947: 85 A6   
loc_8949:
	PHA					  ; $8949: 48	  
	.byte $B2			  ; $894A - Unknown opcode
	ROL $480B,X			  ; $894B: 3E 0B 48
	.byte $B3			  ; $894E - Unknown opcode
	ROL $070B,X			  ; $894F: 3E 0B 07
	.byte $03			  ; $8952 - Unknown opcode
	.byte $02			  ; $8953 - Unknown opcode
	ASL $48				  ; $8954: 06 48   
	BCS $895F				; $8956: B0 07   
	ORA ptr1_lo			  ; $8958: 05 06   
	PHA					  ; $895A: 48	  
	LDA (tmp0),Y			 ; $895B: B1 00   
	STA $A6				  ; $895D: 85 A6   
loc_895F:
	PHA					  ; $895F: 48	  
	.byte $B2			  ; $8960 - Unknown opcode
	ROL $480B,X			  ; $8961: 3E 0B 48
	.byte $B3			  ; $8964 - Unknown opcode
	ROL $120B,X			  ; $8965: 3E 0B 12
	ASL $3F				  ; $8968: 06 3F   
	.byte $07			  ; $896A - Unknown opcode
	ASL ptr0_hi,X			; $896B: 16 05   
	EOR #$9F				 ; $896D: 49 9F   
	.byte $0B			  ; $896F - Unknown opcode
	.byte $07			  ; $8970 - Unknown opcode
	.byte $14			  ; $8971 - Unknown opcode
	.byte $07			  ; $8972 - Unknown opcode
	.byte $13			  ; $8973 - Unknown opcode
	.byte $02			  ; $8974 - Unknown opcode
	PHA					  ; $8975: 48	  
	CLV					  ; $8976: B8	  
	.byte $0B			  ; $8977 - Unknown opcode
	PHA					  ; $8978: 48	  
	.byte $B7			  ; $8979 - Unknown opcode
	.byte $3F			  ; $897A - Unknown opcode
	PHA					  ; $897B: 48	  
	LDX $1107,Y			  ; $897C: BE 07 11
	EOR $BF48,X			  ; $897F: 5D 48 BF
	PHA					  ; $8982: 48	  
	CPY #$18				 ; $8983: C0 18   
	ORA #$20				 ; $8985: 09 20   
	BRK					  ; $8987: 00	  
	LDX $A4,Y				; $8988: B6 A4   
	.byte $3F			  ; $898A - Unknown opcode
	.byte $07			  ; $898B - Unknown opcode
	.byte $1B			  ; $898C - Unknown opcode
	ORA #$10				 ; $898D: 09 10   
	ASL $48				  ; $898F: 06 48   
	CPX #$07				 ; $8991: E0 07   
	ORA ptr1_lo			  ; $8993: 05 06   
	PHA					  ; $8995: 48	  
	SBC (tmp0,X)			 ; $8996: E1 00	; Arithmetic
	LDX $A4				  ; $8998: A6 A4   
	ROL $480B,X			  ; $899A: 3E 0B 48
	.byte $E2			  ; $899D - Unknown opcode
	ROL $480B,X			  ; $899E: 3E 0B 48
	.byte $DF			  ; $89A1 - Unknown opcode
	.byte $3F			  ; $89A2 - Unknown opcode
	PHA					  ; $89A3: 48	  
	.byte $E3			  ; $89A4 - Unknown opcode
	CLC					  ; $89A5: 18	  
	ORA #$10				 ; $89A6: 09 10   
	.byte $3F			  ; $89A8 - Unknown opcode
	.byte $07			  ; $89A9 - Unknown opcode
	ASL ptr0_hi,X			; $89AA: 16 05   
	.byte $07			  ; $89AC - Unknown opcode
	.byte $1B			  ; $89AD - Unknown opcode
	ORA $4701,Y			  ; $89AE: 19 01 47
	ASL					  ; $89B1: 0A	  
	.byte $0B			  ; $89B2 - Unknown opcode
	PHA					  ; $89B3: 48	  
	CPX $0B				  ; $89B4: E4 0B   
	.byte $07			  ; $89B6 - Unknown opcode
	.byte $1B			  ; $89B7 - Unknown opcode
	.byte $02			  ; $89B8 - Unknown opcode
	ORA ($48,X)			  ; $89B9: 01 48   
	SBC $0B				  ; $89BB: E5 0B	; Arithmetic
	PHA					  ; $89BD: 48	  
	CPX $3F				  ; $89BE: E4 3F   
	EOR $C7				  ; $89C0: 45 C7   
	.byte $07			  ; $89C2 - Unknown opcode
	ASL ptr0_lo,X			; $89C3: 16 04   
	LSR $A2				  ; $89C5: 46 A2   
	.byte $3F			  ; $89C7 - Unknown opcode
	PHA					  ; $89C8: 48	  
	.byte $E7			  ; $89C9 - Unknown opcode
	BRK					  ; $89CA: 00	  
	LDX $3FA4				; $89CB: AE A4 3F
	.byte $43			  ; $89CE - Unknown opcode
	TAX					  ; $89CF: AA	  
	.byte $3F			  ; $89D0 - Unknown opcode
	.byte $07			  ; $89D1 - Unknown opcode
	.byte $1B			  ; $89D2 - Unknown opcode
	.byte $0F			  ; $89D3 - Unknown opcode
	JSR $C745				; $89D4: 20 45 C7 ; Call to fixed bank
	.byte $0B			  ; $89D7 - Unknown opcode
	ASL $48				  ; $89D8: 06 48   
	SBC #$18				 ; $89DA: E9 18	; Arithmetic
	ASL					  ; $89DC: 0A	  
	PHP					  ; $89DD: 08	  
	ROL $0F18,X			  ; $89DE: 3E 18 0F
	JSR $073F				; $89E1: 20 3F 07
	.byte $1B			  ; $89E4 - Unknown opcode
	ORA $4801				; $89E5: 0D 01 48
	DEC $070B,X			  ; $89E8: DE 0B 07
	ORA ($7A),Y			  ; $89EB: 11 7A   
	ASL $48				  ; $89ED: 06 48   
	CMP $8C00,X			  ; $89EF: DD 00 8C
	LDY $3E				  ; $89F2: A4 3E   
	.byte $0B			  ; $89F4 - Unknown opcode
	PHA					  ; $89F5: 48	  
	.byte $DC			  ; $89F6 - Unknown opcode
	.byte $3F			  ; $89F7 - Unknown opcode
	.byte $07			  ; $89F8 - Unknown opcode
	.byte $1B			  ; $89F9 - Unknown opcode
	.byte $0F			  ; $89FA - Unknown opcode
	.byte $80			  ; $89FB - Unknown opcode
	ASL $48				  ; $89FC: 06 48   
	.byte $EB			  ; $89FE - Unknown opcode
	.byte $07			  ; $89FF - Unknown opcode
	ORA ptr1_lo			  ; $8A00: 05 06   
	PHA					  ; $8A02: 48	  
	CPX $8300				; $8A03: EC 00 83
	TAX					  ; $8A06: AA	  
	ROL $480B,X			  ; $8A07: 3E 0B 48
	SBC $0B3E				; $8A0A: ED 3E 0B ; Arithmetic
	PHA					  ; $8A0D: 48	  
	NOP					  ; $8A0E: EA	  
	.byte $3F			  ; $8A0F - Unknown opcode
	PHA					  ; $8A10: 48	  
	INC current_bank		 ; $8A11: EE 07 05
	PHA					  ; $8A14: 48	  
	.byte $EF			  ; $8A15 - Unknown opcode
	.byte $0B			  ; $8A16 - Unknown opcode
	PHA					  ; $8A17: 48	  
	BEQ $8A59				; $8A18: F0 3F   
	.byte $07			  ; $8A1A - Unknown opcode
	.byte $1B			  ; $8A1B - Unknown opcode
	.byte $0F			  ; $8A1C - Unknown opcode
	.byte $80			  ; $8A1D - Unknown opcode
	PHA					  ; $8A1E: 48	  
	.byte $F4			  ; $8A1F - Unknown opcode
	.byte $0B			  ; $8A20 - Unknown opcode
	ASL $48				  ; $8A21: 06 48   
	SBC (ptr1_hi),Y		  ; $8A23: F1 07	; Arithmetic
	ORA ($74),Y			  ; $8A25: 11 74   
	ASL tmp0				 ; $8A27: 06 00   
	.byte $89			  ; $8A29 - Unknown opcode
	TAX					  ; $8A2A: AA	  
	PHA					  ; $8A2B: 48	  
	.byte $F3			  ; $8A2C - Unknown opcode
	ROL $060B,X			  ; $8A2D: 3E 0B 06
	PHA					  ; $8A30: 48	  
	.byte $F2			  ; $8A31 - Unknown opcode
	PHA					  ; $8A32: 48	  
	.byte $F3			  ; $8A33 - Unknown opcode
	ROL $F448,X			  ; $8A34: 3E 48 F4
	ROL $0F18,X			  ; $8A37: 3E 18 0F
	.byte $80			  ; $8A3A - Unknown opcode
	.byte $3F			  ; $8A3B - Unknown opcode
	.byte $07			  ; $8A3C - Unknown opcode
	.byte $1B			  ; $8A3D - Unknown opcode
	ASL					  ; $8A3E: 0A	  
	.byte $80			  ; $8A3F - Unknown opcode
	LSR $BA				  ; $8A40: 46 BA   
	.byte $0B			  ; $8A42 - Unknown opcode
	.byte $07			  ; $8A43 - Unknown opcode
	.byte $1B			  ; $8A44 - Unknown opcode
	.byte $13			  ; $8A45 - Unknown opcode
	JSR $1B07				; $8A46: 20 07 1B
	BPL $8A6B				; $8A49: 10 20   
	ASL $48				  ; $8A4B: 06 48   
	SBC tmp0,X			   ; $8A4D: F5 00	; Arithmetic
	ADC $48A6,Y			  ; $8A4F: 79 A6 48 ; Arithmetic
	INC $17,X				; $8A52: F6 17   
	BPL $8A35				; $8A54: 10 DF   
	ROL $480B,X			  ; $8A56: 3E 0B 48
loc_8A59:
	.byte $F7			  ; $8A59 - Unknown opcode
	.byte $0B			  ; $8A5A - Unknown opcode
	ASL $46				  ; $8A5B: 06 46   
	TSX					  ; $8A5D: BA	  
	CLC					  ; $8A5E: 18	  
	.byte $13			  ; $8A5F - Unknown opcode
	BMI $8A7A				; $8A60: 30 18   
	ASL					  ; $8A62: 0A	  
	.byte $80			  ; $8A63 - Unknown opcode
	ROL $493F,X			  ; $8A64: 3E 3F 49
	ORA (ptr1_hi,X)		  ; $8A67: 01 07   
	ASL $0249,X			  ; $8A69: 1E 49 02
	.byte $0B			  ; $8A6C - Unknown opcode
	EOR #$03				 ; $8A6D: 49 03   
	.byte $3F			  ; $8A6F - Unknown opcode
	.byte $07			  ; $8A70 - Unknown opcode
	.byte $1B			  ; $8A71 - Unknown opcode
	ASL $4820				; $8A72: 0E 20 48
	INC $480B,X			  ; $8A75: FE 0B 48
	SBC $073F,X			  ; $8A78: FD 3F 07 ; Arithmetic
	ASL ptr0_hi,X			; $8A7B: 16 05   
	.byte $07			  ; $8A7D - Unknown opcode
	.byte $03			  ; $8A7E - Unknown opcode
	ORA $45				  ; $8A7F: 05 45   
	.byte $54			  ; $8A81 - Unknown opcode
	.byte $0B			  ; $8A82 - Unknown opcode
	EOR #$19				 ; $8A83: 49 19   
	.byte $0B			  ; $8A85 - Unknown opcode
	.byte $07			  ; $8A86 - Unknown opcode
	.byte $14			  ; $8A87 - Unknown opcode
	ASL ptr1_hi			  ; $8A88: 06 07   
	.byte $1B			  ; $8A8A - Unknown opcode
	ORA $4508				; $8A8B: 0D 08 45
	.byte $54			  ; $8A8E - Unknown opcode
	.byte $0B			  ; $8A8F - Unknown opcode
	ASL $18				  ; $8A90: 06 18   
	ORA $4602				; $8A92: 0D 02 46
	.byte $7B			  ; $8A95 - Unknown opcode
	ROL $0B3E,X			  ; $8A96: 3E 3E 0B
	EOR $54				  ; $8A99: 45 54   
	.byte $3F			  ; $8A9B - Unknown opcode
	.byte $07			  ; $8A9C - Unknown opcode
	.byte $1B			  ; $8A9D - Unknown opcode
	.byte $17			  ; $8A9E - Unknown opcode
	RTI					  ; $8A9F: 40	  
	EOR #$0B				 ; $8AA0: 49 0B   
	.byte $0B			  ; $8AA2 - Unknown opcode
	EOR #$0A				 ; $8AA3: 49 0A   
	.byte $3F			  ; $8AA5 - Unknown opcode
	.byte $07			  ; $8AA6 - Unknown opcode
	.byte $1B			  ; $8AA7 - Unknown opcode
	.byte $17			  ; $8AA8 - Unknown opcode
	.byte $80			  ; $8AA9 - Unknown opcode
	EOR #$0D				 ; $8AAA: 49 0D   
	.byte $0B			  ; $8AAC - Unknown opcode
	EOR #$0C				 ; $8AAD: 49 0C   
	.byte $3F			  ; $8AAF - Unknown opcode
	EOR #$0E				 ; $8AB0: 49 0E   
	.byte $07			  ; $8AB2 - Unknown opcode
	ORA ptr1_lo			  ; $8AB3: 05 06   
	EOR #$10				 ; $8AB5: 49 10   
	BRK					  ; $8AB7: 00	  
	LDX $A4,Y				; $8AB8: B6 A4   
	CLC					  ; $8ABA: 18	  
	.byte $17			  ; $8ABB - Unknown opcode
	.byte $80			  ; $8ABC - Unknown opcode
	CLC					  ; $8ABD: 18	  
	ORA $3E04,Y			  ; $8ABE: 19 04 3E
	.byte $0B			  ; $8AC1 - Unknown opcode
	EOR #$0F				 ; $8AC2: 49 0F   
	.byte $3F			  ; $8AC4 - Unknown opcode
	.byte $07			  ; $8AC5 - Unknown opcode
	.byte $03			  ; $8AC6 - Unknown opcode
	.byte $02			  ; $8AC7 - Unknown opcode
	ASL $49				  ; $8AC8: 06 49   
	.byte $14			  ; $8ACA - Unknown opcode
	.byte $07			  ; $8ACB - Unknown opcode
	.byte $13			  ; $8ACC - Unknown opcode
	BRK					  ; $8ACD: 00	  
	EOR #$17				 ; $8ACE: 49 17   
	.byte $0B			  ; $8AD0 - Unknown opcode
	EOR #$15				 ; $8AD1: 49 15   
	EOR #$16				 ; $8AD3: 49 16   
	BRK					  ; $8AD5: 00	  
	LDX $A4,Y				; $8AD6: B6 A4   
	CLC					  ; $8AD8: 18	  
	.byte $17			  ; $8AD9 - Unknown opcode
	RTI					  ; $8ADA: 40	  
	ROL $490B,X			  ; $8ADB: 3E 0B 49
	.byte $13			  ; $8ADE - Unknown opcode
	.byte $3F			  ; $8ADF - Unknown opcode
	.byte $07			  ; $8AE0 - Unknown opcode
	.byte $02			  ; $8AE1 - Unknown opcode
	.byte $12			  ; $8AE2 - Unknown opcode
	.byte $03			  ; $8AE3 - Unknown opcode
	.byte $0B			  ; $8AE4 - Unknown opcode
	EOR #$18				 ; $8AE5: 49 18   
	.byte $3F			  ; $8AE7 - Unknown opcode
	LSR $49				  ; $8AE8: 46 49   
	.byte $07			  ; $8AEA - Unknown opcode
	ASL ptr0_hi,X			; $8AEB: 16 05   
	EOR #$1B				 ; $8AED: 49 1B   
	.byte $3F			  ; $8AEF - Unknown opcode
	.byte $07			  ; $8AF0 - Unknown opcode
	ASL ptr0_hi,X			; $8AF1: 16 05   
	EOR #$1D				 ; $8AF3: 49 1D   
	.byte $0B			  ; $8AF5 - Unknown opcode
	LSR $50				  ; $8AF6: 46 50   
	.byte $3F			  ; $8AF8 - Unknown opcode
	.byte $07			  ; $8AF9 - Unknown opcode
	.byte $1B			  ; $8AFA - Unknown opcode
	.byte $17			  ; $8AFB - Unknown opcode
	.byte $80			  ; $8AFC - Unknown opcode
	EOR #$1E				 ; $8AFD: 49 1E   
	.byte $0B			  ; $8AFF - Unknown opcode
	PHA					  ; $8B00: 48	  
	SED					  ; $8B01: F8	  
	.byte $3F			  ; $8B02 - Unknown opcode
	.byte $07			  ; $8B03 - Unknown opcode
	.byte $1B			  ; $8B04 - Unknown opcode
	.byte $17			  ; $8B05 - Unknown opcode
	.byte $80			  ; $8B06 - Unknown opcode
	EOR #$1F				 ; $8B07: 49 1F   
	.byte $0B			  ; $8B09 - Unknown opcode
	PHA					  ; $8B0A: 48	  
	SBC $073F,Y			  ; $8B0B: F9 3F 07 ; Arithmetic
	.byte $1B			  ; $8B0E - Unknown opcode
	.byte $17			  ; $8B0F - Unknown opcode
	.byte $80			  ; $8B10 - Unknown opcode
	EOR #$20				 ; $8B11: 49 20   
	.byte $0B			  ; $8B13 - Unknown opcode
	PHA					  ; $8B14: 48	  
	.byte $FF			  ; $8B15 - Unknown opcode
	.byte $3F			  ; $8B16 - Unknown opcode
	EOR #$00				 ; $8B17: 49 00   
	.byte $07			  ; $8B19 - Unknown opcode
	.byte $1B			  ; $8B1A - Unknown opcode
	.byte $17			  ; $8B1B - Unknown opcode
	.byte $80			  ; $8B1C - Unknown opcode
	EOR #$21				 ; $8B1D: 49 21   
	.byte $3F			  ; $8B1F - Unknown opcode
	.byte $07			  ; $8B20 - Unknown opcode
	ORA ($6F),Y			  ; $8B21: 11 6F   
	ASL $49				  ; $8B23: 06 49   
	.byte $27			  ; $8B25 - Unknown opcode
	CLC					  ; $8B26: 18	  
	ORA $1810,Y			  ; $8B27: 19 10 18
	.byte $17			  ; $8B2A - Unknown opcode
	ORA (tmp0,X)			 ; $8B2B: 01 00   
	INY					  ; $8B2D: C8	  
	TAX					  ; $8B2E: AA	  
	ROL $060B,X			  ; $8B2F: 3E 0B 06
	EOR #$22				 ; $8B32: 49 22   
	.byte $07			  ; $8B34 - Unknown opcode
	ORA $49				  ; $8B35: 05 49   
	.byte $23			  ; $8B37 - Unknown opcode
	.byte $0B			  ; $8B38 - Unknown opcode
	EOR #$24				 ; $8B39: 49 24   
	ROL $073F,X			  ; $8B3B: 3E 3F 07
	.byte $02			  ; $8B3E - Unknown opcode
	.byte $12			  ; $8B3F - Unknown opcode
	ASL $0B				  ; $8B40: 06 0B   
	.byte $07			  ; $8B42 - Unknown opcode
	.byte $1B			  ; $8B43 - Unknown opcode
	ORA $4910,Y			  ; $8B44: 19 10 49
	PLP					  ; $8B47: 28	  
	.byte $0B			  ; $8B48 - Unknown opcode
	EOR #$25				 ; $8B49: 49 25   
	.byte $3F			  ; $8B4B - Unknown opcode
	.byte $07			  ; $8B4C - Unknown opcode
	.byte $1B			  ; $8B4D - Unknown opcode
	ORA $4910,Y			  ; $8B4E: 19 10 49
	AND #$0B				 ; $8B51: 29 0B   
	EOR #$26				 ; $8B53: 49 26   
	.byte $3F			  ; $8B55 - Unknown opcode
	.byte $43			  ; $8B56 - Unknown opcode
	.byte $F3			  ; $8B57 - Unknown opcode
	BRK					  ; $8B58: 00	  
	.byte $12			  ; $8B59 - Unknown opcode
	BCS $8B9B				; $8B5A: B0 3F   
	.byte $44			  ; $8B5C - Unknown opcode
	CPY tmp0				 ; $8B5D: C4 00   
	CPY $3FAA				; $8B5F: CC AA 3F
	BRK					  ; $8B62: 00	  
	CMP ($AA),Y			  ; $8B63: D1 AA   
	.byte $3F			  ; $8B65 - Unknown opcode
	.byte $07			  ; $8B66 - Unknown opcode
	.byte $14			  ; $8B67 - Unknown opcode
	.byte $07			  ; $8B68 - Unknown opcode
	.byte $1B			  ; $8B69 - Unknown opcode
	ASL					  ; $8B6A: 0A	  
	BPL $8B7F				; $8B6B: 10 12   
	ASL $0B				  ; $8B6D: 06 0B   
	ASL $49				  ; $8B6F: 06 49   
	ROL					  ; $8B71: 2A	  
	.byte $07			  ; $8B72 - Unknown opcode
	ORA ptr1_lo			  ; $8B73: 05 06   
	EOR #$2B				 ; $8B75: 49 2B   
	BRK					  ; $8B77: 00	  
	.byte $89			  ; $8B78 - Unknown opcode
	LDY $3E				  ; $8B79: A4 3E   
	.byte $0B			  ; $8B7B - Unknown opcode
	EOR #$2C				 ; $8B7C: 49 2C   
	ROL $060B,X			  ; $8B7E: 3E 0B 06
	CLC					  ; $8B81: 18	  
	ASL					  ; $8B82: 0A	  
	BPL $8B97				; $8B83: 10 12   
	ASL $3E				  ; $8B85: 06 3E   
	.byte $3F			  ; $8B87 - Unknown opcode
	.byte $07			  ; $8B88 - Unknown opcode
	ASL $2D49,X			  ; $8B89: 1E 49 2D
	.byte $0B			  ; $8B8C - Unknown opcode
	EOR #$2E				 ; $8B8D: 49 2E   
	.byte $3F			  ; $8B8F - Unknown opcode
	.byte $07			  ; $8B90 - Unknown opcode
	.byte $1B			  ; $8B91 - Unknown opcode
	ASL $1280				; $8B92: 0E 80 12
	ORA $0B				  ; $8B95: 05 0B   
loc_8B97:
	EOR #$36				 ; $8B97: 49 36   
	.byte $3F			  ; $8B99 - Unknown opcode
	EOR #$34				 ; $8B9A: 49 34   
	.byte $07			  ; $8B9C - Unknown opcode
	ORA $49				  ; $8B9D: 05 49   
	AND $0B,X				; $8B9F: 35 0B   
	EOR #$35				 ; $8BA1: 49 35   
	.byte $3F			  ; $8BA3 - Unknown opcode
	.byte $07			  ; $8BA4 - Unknown opcode
	.byte $1B			  ; $8BA5 - Unknown opcode
	CLC					  ; $8BA6: 18	  
	RTI					  ; $8BA7: 40	  
	EOR #$3B				 ; $8BA8: 49 3B   
	.byte $0B			  ; $8BAA - Unknown opcode
	.byte $07			  ; $8BAB - Unknown opcode
	.byte $1B			  ; $8BAC - Unknown opcode
	ORA $0608,Y			  ; $8BAD: 19 08 06
	ORA ($AF,X)			  ; $8BB0: 01 AF   
	TAX					  ; $8BB2: AA	  
	SEC					  ; $8BB3: 38	  
	ORA #$18				 ; $8BB4: 09 18   
	CLC					  ; $8BB6: 18	  
	RTI					  ; $8BB7: 40	  
	ROL $060B,X			  ; $8BB8: 3E 0B 06
	EOR #$37				 ; $8BBB: 49 37   
	BRK					  ; $8BBD: 00	  
	LDY $3EAF				; $8BBE: AC AF 3E
	.byte $3F			  ; $8BC1 - Unknown opcode
	.byte $07			  ; $8BC2 - Unknown opcode
	.byte $1B			  ; $8BC3 - Unknown opcode
	CLC					  ; $8BC4: 18	  
	BPL $8BC8				; $8BC5: 10 01   
	CMP $42AA,Y			  ; $8BC7: D9 AA 42
	ORA #$0B				 ; $8BCA: 09 0B   
	EOR #$3F				 ; $8BCC: 49 3F   
	.byte $3F			  ; $8BCE - Unknown opcode
	EOR #$3E				 ; $8BCF: 49 3E   
	.byte $07			  ; $8BD1 - Unknown opcode
	.byte $1B			  ; $8BD2 - Unknown opcode
	CLC					  ; $8BD3: 18	  
	JSR $4149				; $8BD4: 20 49 41
	.byte $3F			  ; $8BD7 - Unknown opcode
	.byte $07			  ; $8BD8 - Unknown opcode
	.byte $1B			  ; $8BD9 - Unknown opcode
	CLC					  ; $8BDA: 18	  
	BPL $8C26				; $8BDB: 10 49   
	EOR $070B				; $8BDD: 4D 0B 07
	.byte $1B			  ; $8BE0 - Unknown opcode
	CLC					  ; $8BE1: 18	  
	JSR $4049				; $8BE2: 20 49 40
	.byte $0B			  ; $8BE5 - Unknown opcode
	EOR #$3D				 ; $8BE6: 49 3D   
	.byte $3F			  ; $8BE8 - Unknown opcode
	.byte $07			  ; $8BE9 - Unknown opcode
	.byte $1B			  ; $8BEA - Unknown opcode
	CLC					  ; $8BEB: 18	  
	BPL $8C37				; $8BEC: 10 49   
	EOR $0B				  ; $8BEE: 45 0B   
	EOR #$2F				 ; $8BF0: 49 2F   
	.byte $3F			  ; $8BF2 - Unknown opcode
	.byte $07			  ; $8BF3 - Unknown opcode
	.byte $1B			  ; $8BF4 - Unknown opcode
	CLC					  ; $8BF5: 18	  
	BPL $8BFE				; $8BF6: 10 06   
	EOR #$46				 ; $8BF8: 49 46   
	.byte $07			  ; $8BFA - Unknown opcode
	ORA $49				  ; $8BFB: 05 49   
	.byte $47			  ; $8BFD - Unknown opcode
loc_8BFE:
	.byte $0B			  ; $8BFE - Unknown opcode
	EOR #$48				 ; $8BFF: 49 48   
	ROL $490B,X			  ; $8C01: 3E 0B 49
	BMI $8C45				; $8C04: 30 3F   
	.byte $07			  ; $8C06 - Unknown opcode
	.byte $1B			  ; $8C07 - Unknown opcode
	CLC					  ; $8C08: 18	  
	BPL $8C54				; $8C09: 10 49   
	EOR #$0B				 ; $8C0B: 49 0B   
	EOR #$31				 ; $8C0D: 49 31   
	.byte $3F			  ; $8C0F - Unknown opcode
	.byte $07			  ; $8C10 - Unknown opcode
	.byte $1B			  ; $8C11 - Unknown opcode
	CLC					  ; $8C12: 18	  
	BPL $8C5E				; $8C13: 10 49   
	LSR					  ; $8C15: 4A	  
	.byte $0B			  ; $8C16 - Unknown opcode
	EOR #$32				 ; $8C17: 49 32   
	.byte $3F			  ; $8C19 - Unknown opcode
	.byte $07			  ; $8C1A - Unknown opcode
	.byte $1B			  ; $8C1B - Unknown opcode
	CLC					  ; $8C1C: 18	  
	BPL $8C68				; $8C1D: 10 49   
	.byte $4B			  ; $8C1F - Unknown opcode
	.byte $0B			  ; $8C20 - Unknown opcode
	EOR #$33				 ; $8C21: 49 33   
	.byte $3F			  ; $8C23 - Unknown opcode
	.byte $07			  ; $8C24 - Unknown opcode
	.byte $1B			  ; $8C25 - Unknown opcode
loc_8C26:
	CLC					  ; $8C26: 18	  
	BPL $8C72				; $8C27: 10 49   
	JMP $490B				; $8C29: 4C 0B 49
	.byte $3C			  ; $8C2C - Unknown opcode
	.byte $3F			  ; $8C2D - Unknown opcode
	.byte $07			  ; $8C2E - Unknown opcode
	.byte $1B			  ; $8C2F - Unknown opcode
	CLC					  ; $8C30: 18	  
	PHP					  ; $8C31: 08	  
	EOR #$4F				 ; $8C32: 49 4F   
	.byte $0B			  ; $8C34 - Unknown opcode
	ASL $49				  ; $8C35: 06 49   
loc_8C37:
	LSR $F500				; $8C37: 4E 00 F5
	TAX					  ; $8C3A: AA	  
	CLC					  ; $8C3B: 18	  
	CLC					  ; $8C3C: 18	  
	PHP					  ; $8C3D: 08	  
	ROL $073F,X			  ; $8C3E: 3E 3F 07
	.byte $1B			  ; $8C41 - Unknown opcode
	ORA $4940,Y			  ; $8C42: 19 40 49
loc_8C45:
	ADC $0B,X				; $8C45: 75 0B	; Arithmetic
	EOR #$50				 ; $8C47: 49 50   
	.byte $3F			  ; $8C49 - Unknown opcode
	.byte $07			  ; $8C4A - Unknown opcode
	.byte $1B			  ; $8C4B - Unknown opcode
	ROL tmp2				 ; $8C4C: 26 02   
	EOR #$57				 ; $8C4E: 49 57   
	.byte $0B			  ; $8C50 - Unknown opcode
	ORA ($FB,X)			  ; $8C51: 01 FB   
	TAX					  ; $8C53: AA	  
loc_8C54:
	EOR ($09),Y			  ; $8C54: 51 09   
	.byte $3F			  ; $8C56 - Unknown opcode
	.byte $07			  ; $8C57 - Unknown opcode
	.byte $1B			  ; $8C58 - Unknown opcode
	ORA $4980,Y			  ; $8C59: 19 80 49
	.byte $74			  ; $8C5C - Unknown opcode
	.byte $0B			  ; $8C5D - Unknown opcode
loc_8C5E:
	ASL $49				  ; $8C5E: 06 49   
	.byte $5A			  ; $8C60 - Unknown opcode
	.byte $07			  ; $8C61 - Unknown opcode
	ORA ptr1_lo			  ; $8C62: 05 06   
	EOR #$5B				 ; $8C64: 49 5B   
	BRK					  ; $8C66: 00	  
	EOR $AB,X				; $8C67: 55 AB   
	ROL $060B,X			  ; $8C69: 3E 0B 06
	EOR #$5C				 ; $8C6C: 49 5C   
	.byte $47			  ; $8C6E - Unknown opcode
	BRK					  ; $8C6F: 00	  
	ROL $3F3E,X			  ; $8C70: 3E 3E 3F
	.byte $07			  ; $8C73 - Unknown opcode
	.byte $1B			  ; $8C74 - Unknown opcode
	ORA $4340,Y			  ; $8C75: 19 40 43
	SBC ($0B),Y			  ; $8C78: F1 0B	; Arithmetic
	EOR #$59				 ; $8C7A: 49 59   
	.byte $3F			  ; $8C7C - Unknown opcode
	.byte $07			  ; $8C7D - Unknown opcode
	.byte $1B			  ; $8C7E - Unknown opcode
	ASL $08,X				; $8C7F: 16 08   
	ORA ($89,X)			  ; $8C81: 01 89   
	.byte $AB			  ; $8C83 - Unknown opcode
	BRK					  ; $8C84: 00	  
	.byte $07			  ; $8C85 - Unknown opcode
	.byte $0B			  ; $8C86 - Unknown opcode
	.byte $47			  ; $8C87 - Unknown opcode
	BRK					  ; $8C88: 00	  
	.byte $3F			  ; $8C89 - Unknown opcode
	.byte $07			  ; $8C8A - Unknown opcode
	.byte $14			  ; $8C8B - Unknown opcode
	.byte $07			  ; $8C8C - Unknown opcode
	.byte $1B			  ; $8C8D - Unknown opcode
	ORA $4980,Y			  ; $8C8E: 19 80 49
	ADC ($0B),Y			  ; $8C91: 71 0B	; Arithmetic
	.byte $07			  ; $8C93 - Unknown opcode
	ORA ($7E),Y			  ; $8C94: 11 7E   
	ASL $49				  ; $8C96: 06 49   
	.byte $6B			  ; $8C98 - Unknown opcode
	BRK					  ; $8C99: 00	  
	.byte $3C			  ; $8C9A - Unknown opcode
	BCS $8CE6				; $8C9B: B0 49   
	JMP ($6500)			  ; $8C9D: 6C 00 65
	.byte $AB			  ; $8CA0 - Unknown opcode
	CLC					  ; $8CA1: 18	  
	ORA $3E80,Y			  ; $8CA2: 19 80 3E
	.byte $0B			  ; $8CA5 - Unknown opcode
	EOR #$63				 ; $8CA6: 49 63   
	.byte $0B			  ; $8CA8 - Unknown opcode
	.byte $07			  ; $8CA9 - Unknown opcode
	.byte $1B			  ; $8CAA - Unknown opcode
	ORA $4580,Y			  ; $8CAB: 19 80 45
	CPY $490B				; $8CAE: CC 0B 49
	.byte $64			  ; $8CB1 - Unknown opcode
	.byte $3F			  ; $8CB2 - Unknown opcode
	EOR #$5D				 ; $8CB3: 49 5D   
	.byte $07			  ; $8CB5 - Unknown opcode
	.byte $9B			  ; $8CB6 - Unknown opcode
	ORA $4980,Y			  ; $8CB7: 19 80 49
	LSR $493F,X			  ; $8CBA: 5E 3F 49
	.byte $5F			  ; $8CBD - Unknown opcode
	.byte $07			  ; $8CBE - Unknown opcode
	.byte $1B			  ; $8CBF - Unknown opcode
	ORA $4980,Y			  ; $8CC0: 19 80 49
	ROR $490B				; $8CC3: 6E 0B 49
	RTS					  ; $8CC6: 60	  
	.byte $3F			  ; $8CC7 - Unknown opcode
	.byte $07			  ; $8CC8 - Unknown opcode
	.byte $1B			  ; $8CC9 - Unknown opcode
	ORA $4980,Y			  ; $8CCA: 19 80 49
	.byte $6F			  ; $8CCD - Unknown opcode
	.byte $0B			  ; $8CCE - Unknown opcode
	EOR #$61				 ; $8CCF: 49 61   
	.byte $3F			  ; $8CD1 - Unknown opcode
	.byte $07			  ; $8CD2 - Unknown opcode
	.byte $1B			  ; $8CD3 - Unknown opcode
	ORA $4980,Y			  ; $8CD4: 19 80 49
	BVS $8CE4				; $8CD7: 70 0B   
	.byte $07			  ; $8CD9 - Unknown opcode
	.byte $14			  ; $8CDA - Unknown opcode
	EOR #$62				 ; $8CDB: 49 62   
	.byte $0B			  ; $8CDD - Unknown opcode
	.byte $07			  ; $8CDE - Unknown opcode
	.byte $1B			  ; $8CDF - Unknown opcode
	CLC					  ; $8CE0: 18	  
	ORA ($49,X)			  ; $8CE1: 01 49   
	ADC $490B				; $8CE3: 6D 0B 49 ; Arithmetic
loc_8CE6:
	.byte $62			  ; $8CE6 - Unknown opcode
	.byte $3F			  ; $8CE7 - Unknown opcode
	.byte $07			  ; $8CE8 - Unknown opcode
	.byte $1B			  ; $8CE9 - Unknown opcode
	ORA $4980,Y			  ; $8CEA: 19 80 49
	.byte $72			  ; $8CED - Unknown opcode
	.byte $0B			  ; $8CEE - Unknown opcode
	EOR #$65				 ; $8CEF: 49 65   
	.byte $3F			  ; $8CF1 - Unknown opcode
	.byte $07			  ; $8CF2 - Unknown opcode
	.byte $1B			  ; $8CF3 - Unknown opcode
	ORA $4980,Y			  ; $8CF4: 19 80 49
	.byte $73			  ; $8CF7 - Unknown opcode
	.byte $0B			  ; $8CF8 - Unknown opcode
	EOR #$66				 ; $8CF9: 49 66   
	.byte $3F			  ; $8CFB - Unknown opcode
	.byte $07			  ; $8CFC - Unknown opcode
	.byte $1B			  ; $8CFD - Unknown opcode
	ORA $0080,Y			  ; $8CFE: 19 80 00
	.byte $8B			  ; $8D01 - Unknown opcode
	.byte $AB			  ; $8D02 - Unknown opcode
	.byte $0B			  ; $8D03 - Unknown opcode
	.byte $07			  ; $8D04 - Unknown opcode
	.byte $83			  ; $8D05 - Unknown opcode
	.byte $04			  ; $8D06 - Unknown opcode
	EOR #$67				 ; $8D07: 49 67   
	.byte $0B			  ; $8D09 - Unknown opcode
	ORA ($78,X)			  ; $8D0A: 01 78   
	.byte $AB			  ; $8D0C - Unknown opcode
	PLA					  ; $8D0D: 68	  
	ORA #$3F				 ; $8D0E: 09 3F   
	PHA					  ; $8D10: 48	  
	.byte $13			  ; $8D11 - Unknown opcode
	.byte $07			  ; $8D12 - Unknown opcode
	.byte $03			  ; $8D13 - Unknown opcode
	ORA $48				  ; $8D14: 05 48   
	.byte $14			  ; $8D16 - Unknown opcode
	.byte $3F			  ; $8D17 - Unknown opcode
	.byte $07			  ; $8D18 - Unknown opcode
	.byte $02			  ; $8D19 - Unknown opcode
	.byte $12			  ; $8D1A - Unknown opcode
	ASL $0B				  ; $8D1B: 06 0B   
	.byte $07			  ; $8D1D - Unknown opcode
	.byte $83			  ; $8D1E - Unknown opcode
	ORA $12				  ; $8D1F: 05 12   
	ASL $0B				  ; $8D21: 06 0B   
	EOR #$76				 ; $8D23: 49 76   
	.byte $3F			  ; $8D25 - Unknown opcode
	.byte $07			  ; $8D26 - Unknown opcode
	.byte $83			  ; $8D27 - Unknown opcode
	ORA $49				  ; $8D28: 05 49   
	ADC $060B,X			  ; $8D2A: 7D 0B 06 ; Arithmetic
	EOR #$7E				 ; $8D2D: 49 7E   
	.byte $07			  ; $8D2F - Unknown opcode
	ORA $49				  ; $8D30: 05 49   
	.byte $7F			  ; $8D32 - Unknown opcode
	.byte $0B			  ; $8D33 - Unknown opcode
	EOR #$80				 ; $8D34: 49 80   
	ROL $463F,X			  ; $8D36: 3E 3F 46
	TXS					  ; $8D39: 9A	  
	.byte $07			  ; $8D3A - Unknown opcode
	ASL ptr0_hi,X			; $8D3B: 16 05   
	.byte $07			  ; $8D3D - Unknown opcode
	.byte $1B			  ; $8D3E - Unknown opcode
	ORA $4901,Y			  ; $8D3F: 19 01 49
	.byte $B3			  ; $8D42 - Unknown opcode
	.byte $0B			  ; $8D43 - Unknown opcode
	EOR #$88				 ; $8D44: 49 88   
	.byte $3F			  ; $8D46 - Unknown opcode
	.byte $07			  ; $8D47 - Unknown opcode
	ASL ptr0_hi,X			; $8D48: 16 05   
	.byte $07			  ; $8D4A - Unknown opcode
	.byte $1B			  ; $8D4B - Unknown opcode
	ORA $4901,Y			  ; $8D4C: 19 01 49
	LDA $0B,X				; $8D4F: B5 0B   
	EOR #$A7				 ; $8D51: 49 A7   
	.byte $0B			  ; $8D53 - Unknown opcode
	PHA					  ; $8D54: 48	  
	CMP ($3F,X)			  ; $8D55: C1 3F   
	.byte $07			  ; $8D57 - Unknown opcode
	.byte $1B			  ; $8D58 - Unknown opcode
	ORA $0701,Y			  ; $8D59: 19 01 07
	.byte $14			  ; $8D5C - Unknown opcode
	EOR #$BA				 ; $8D5D: 49 BA   
	.byte $0B			  ; $8D5F - Unknown opcode
	EOR #$B6				 ; $8D60: 49 B6   
	.byte $0B			  ; $8D62 - Unknown opcode
	.byte $07			  ; $8D63 - Unknown opcode
	.byte $14			  ; $8D64 - Unknown opcode
	PHA					  ; $8D65: 48	  
	.byte $C7			  ; $8D66 - Unknown opcode
	.byte $0B			  ; $8D67 - Unknown opcode
	PHA					  ; $8D68: 48	  
	.byte $C2			  ; $8D69 - Unknown opcode
	.byte $3F			  ; $8D6A - Unknown opcode
	.byte $07			  ; $8D6B - Unknown opcode
	.byte $1B			  ; $8D6C - Unknown opcode
	ORA $0701,Y			  ; $8D6D: 19 01 07
	.byte $14			  ; $8D70 - Unknown opcode
	EOR #$BB				 ; $8D71: 49 BB   
	.byte $0B			  ; $8D73 - Unknown opcode
	EOR #$B7				 ; $8D74: 49 B7   
	.byte $0B			  ; $8D76 - Unknown opcode
	.byte $07			  ; $8D77 - Unknown opcode
	.byte $14			  ; $8D78 - Unknown opcode
	PHA					  ; $8D79: 48	  
	INY					  ; $8D7A: C8	  
	.byte $0B			  ; $8D7B - Unknown opcode
	PHA					  ; $8D7C: 48	  
	.byte $C3			  ; $8D7D - Unknown opcode
	.byte $3F			  ; $8D7E - Unknown opcode
	.byte $07			  ; $8D7F - Unknown opcode
	.byte $1B			  ; $8D80 - Unknown opcode
	ORA $4901,Y			  ; $8D81: 19 01 49
	CLV					  ; $8D84: B8	  
	.byte $0B			  ; $8D85 - Unknown opcode
	PHA					  ; $8D86: 48	  
	CPY $3F				  ; $8D87: C4 3F   
	.byte $07			  ; $8D89 - Unknown opcode
	.byte $1B			  ; $8D8A - Unknown opcode
	ORA $4901,Y			  ; $8D8B: 19 01 49
	LDA $070B,Y			  ; $8D8E: B9 0B 07
	.byte $14			  ; $8D91 - Unknown opcode
	PHA					  ; $8D92: 48	  
	CMP $0B				  ; $8D93: C5 0B   
	PHA					  ; $8D95: 48	  
	DEC $3F				  ; $8D96: C6 3F   
	.byte $07			  ; $8D98 - Unknown opcode
	.byte $1B			  ; $8D99 - Unknown opcode
	ORA $0701,Y			  ; $8D9A: 19 01 07
	.byte $14			  ; $8D9D - Unknown opcode
	EOR #$BC				 ; $8D9E: 49 BC   
	.byte $0B			  ; $8DA0 - Unknown opcode
	ASL $48				  ; $8DA1: 06 48   
	DEX					  ; $8DA3: CA	  
	EOR #$BD				 ; $8DA4: 49 BD   
	ROL $070B,X			  ; $8DA6: 3E 0B 07
	.byte $14			  ; $8DA9 - Unknown opcode
	PHA					  ; $8DAA: 48	  
	CMP #$0B				 ; $8DAB: C9 0B	; Compare with 11
	ASL $48				  ; $8DAD: 06 48   
	DEX					  ; $8DAF: CA	  
	PHA					  ; $8DB0: 48	  
	.byte $CB			  ; $8DB1 - Unknown opcode
	ROL $073F,X			  ; $8DB2: 3E 3F 07
	ASL ptr0_hi,X			; $8DB5: 16 05   
	EOR $C7				  ; $8DB7: 45 C7   
	.byte $0B			  ; $8DB9 - Unknown opcode
	PHA					  ; $8DBA: 48	  
	INX					  ; $8DBB: E8	  
	.byte $3F			  ; $8DBC - Unknown opcode
	.byte $07			  ; $8DBD - Unknown opcode
	ASL ptr0_hi,X			; $8DBE: 16 05   
	EOR #$A8				 ; $8DC0: 49 A8   
	.byte $0B			  ; $8DC2 - Unknown opcode
	PHA					  ; $8DC3: 48	  
	CPY $073F				; $8DC4: CC 3F 07
	ASL ptr0_hi,X			; $8DC7: 16 05   
	.byte $07			  ; $8DC9 - Unknown opcode
	.byte $1B			  ; $8DCA - Unknown opcode
	ORA $4901,Y			  ; $8DCB: 19 01 49
	LDA ($0B),Y			  ; $8DCE: B1 0B   
	EOR #$A9				 ; $8DD0: 49 A9   
	.byte $0B			  ; $8DD2 - Unknown opcode
	PHA					  ; $8DD3: 48	  
	INC $3F				  ; $8DD4: E6 3F   
	EOR #$AA				 ; $8DD6: 49 AA   
	.byte $07			  ; $8DD8 - Unknown opcode
	.byte $03			  ; $8DD9 - Unknown opcode
	.byte $02			  ; $8DDA - Unknown opcode
	EOR #$AB				 ; $8DDB: 49 AB   
	.byte $0B			  ; $8DDD - Unknown opcode
	.byte $07			  ; $8DDE - Unknown opcode
	.byte $03			  ; $8DDF - Unknown opcode
	.byte $03			  ; $8DE0 - Unknown opcode
	EOR #$AB				 ; $8DE1: 49 AB   
	EOR #$AC				 ; $8DE3: 49 AC   
	BRK					  ; $8DE5: 00	  
	SED					  ; $8DE6: F8	  
	.byte $AB			  ; $8DE7 - Unknown opcode
	.byte $3F			  ; $8DE8 - Unknown opcode
	EOR #$B2				 ; $8DE9: 49 B2   
	BRK					  ; $8DEB: 00	  
	EOR $3FAC,X			  ; $8DEC: 5D AC 3F
	.byte $07			  ; $8DEF - Unknown opcode
	.byte $1B			  ; $8DF0 - Unknown opcode
	ASL $4920				; $8DF1: 0E 20 49
	BCS $8E01				; $8DF4: B0 0B   
	.byte $07			  ; $8DF6 - Unknown opcode
	.byte $03			  ; $8DF7 - Unknown opcode
	BRK					  ; $8DF8: 00	  
	.byte $44			  ; $8DF9 - Unknown opcode
	.byte $02			  ; $8DFA - Unknown opcode
	.byte $0B			  ; $8DFB - Unknown opcode
	.byte $44			  ; $8DFC - Unknown opcode
	ORA ($3F,X)			  ; $8DFD: 01 3F   
	.byte $07			  ; $8DFF - Unknown opcode
	.byte $1B			  ; $8E00 - Unknown opcode
loc_8E01:
	ORA $0601,Y			  ; $8E01: 19 01 06
	EOR #$89				 ; $8E04: 49 89   
	EOR #$B4				 ; $8E06: 49 B4   
	CLC					  ; $8E08: 18	  
	.byte $1A			  ; $8E09 - Unknown opcode
	JSR $8C00				; $8E0A: 20 00 8C ; -> sub_8C00
	LDY $3E				  ; $8E0D: A4 3E   
	.byte $0B			  ; $8E0F - Unknown opcode
	ASL $49				  ; $8E10: 06 49   
	.byte $89			  ; $8E12 - Unknown opcode
	EOR #$8A				 ; $8E13: 49 8A   
	.byte $07			  ; $8E15 - Unknown opcode
	STA ($72),Y			  ; $8E16: 91 72   
	EOR #$8B				 ; $8E18: 49 8B   
	ROL $013F,X			  ; $8E1A: 3E 3F 01
	.byte $62			  ; $8E1D - Unknown opcode
	LDY $09AD				; $8E1E: AC AD 09
	.byte $3F			  ; $8E21 - Unknown opcode
	PHA					  ; $8E22: 48	  
	.byte $CF			  ; $8E23 - Unknown opcode
	.byte $07			  ; $8E24 - Unknown opcode
	ASL ptr0_hi,X			; $8E25: 16 05   
	EOR #$8D				 ; $8E27: 49 8D   
	.byte $3F			  ; $8E29 - Unknown opcode
	.byte $07			  ; $8E2A - Unknown opcode
	ASL ptr0_hi,X			; $8E2B: 16 05   
	EOR #$8C				 ; $8E2D: 49 8C   
	.byte $0B			  ; $8E2F - Unknown opcode
	PHA					  ; $8E30: 48	  
	CMP ($3F),Y			  ; $8E31: D1 3F   
	.byte $07			  ; $8E33 - Unknown opcode
	ASL ptr0_hi,X			; $8E34: 16 05   
	EOR #$8E				 ; $8E36: 49 8E   
	.byte $0B			  ; $8E38 - Unknown opcode
	PHA					  ; $8E39: 48	  
	BNE $8E7B				; $8E3A: D0 3F   
	.byte $07			  ; $8E3C - Unknown opcode
	ASL ptr0_hi,X			; $8E3D: 16 05   
	EOR #$8F				 ; $8E3F: 49 8F   
	.byte $0B			  ; $8E41 - Unknown opcode
	.byte $12			  ; $8E42 - Unknown opcode
	ORA ($3F,X)			  ; $8E43: 01 3F   
	.byte $07			  ; $8E45 - Unknown opcode
	ASL ptr0_hi,X			; $8E46: 16 05   
	EOR #$90				 ; $8E48: 49 90   
	.byte $0B			  ; $8E4A - Unknown opcode
	PHA					  ; $8E4B: 48	  
	.byte $D2			  ; $8E4C - Unknown opcode
	.byte $3F			  ; $8E4D - Unknown opcode
	.byte $07			  ; $8E4E - Unknown opcode
	ASL ptr0_hi,X			; $8E4F: 16 05   
	.byte $07			  ; $8E51 - Unknown opcode
	.byte $14			  ; $8E52 - Unknown opcode
	EOR #$93				 ; $8E53: 49 93   
	.byte $0B			  ; $8E55 - Unknown opcode
	EOR #$91				 ; $8E56: 49 91   
	.byte $0B			  ; $8E58 - Unknown opcode
	.byte $07			  ; $8E59 - Unknown opcode
	.byte $14			  ; $8E5A - Unknown opcode
	PHA					  ; $8E5B: 48	  
	.byte $D3			  ; $8E5C - Unknown opcode
	.byte $0B			  ; $8E5D - Unknown opcode
	PHA					  ; $8E5E: 48	  
	.byte $D4			  ; $8E5F - Unknown opcode
	.byte $3F			  ; $8E60 - Unknown opcode
	.byte $07			  ; $8E61 - Unknown opcode
	ASL ptr0_hi,X			; $8E62: 16 05   
	EOR #$92				 ; $8E64: 49 92   
	.byte $0B			  ; $8E66 - Unknown opcode
	PHA					  ; $8E67: 48	  
	CMP $3F,X				; $8E68: D5 3F   
	.byte $07			  ; $8E6A - Unknown opcode
	ASL ptr0_hi,X			; $8E6B: 16 05   
	EOR #$94				 ; $8E6D: 49 94   
	.byte $0B			  ; $8E6F - Unknown opcode
	PHA					  ; $8E70: 48	  
	DEC $3F,X				; $8E71: D6 3F   
	.byte $07			  ; $8E73 - Unknown opcode
	ASL ptr0_hi,X			; $8E74: 16 05   
	ASL $49				  ; $8E76: 06 49   
	STA ptr1_hi,X			; $8E78: 95 07   
	.byte $9B			  ; $8E7A - Unknown opcode
loc_8E7B:
	.byte $17			  ; $8E7B - Unknown opcode
	.byte $02			  ; $8E7C - Unknown opcode
	EOR #$96				 ; $8E7D: 49 96   
	ROL $480B,X			  ; $8E7F: 3E 0B 48
	.byte $D7			  ; $8E82 - Unknown opcode
	.byte $3F			  ; $8E83 - Unknown opcode
	.byte $07			  ; $8E84 - Unknown opcode
	ASL ptr0_hi,X			; $8E85: 16 05   
	EOR #$97				 ; $8E87: 49 97   
	.byte $0B			  ; $8E89 - Unknown opcode
	PHA					  ; $8E8A: 48	  
	CLD					  ; $8E8B: D8	  
	.byte $3F			  ; $8E8C - Unknown opcode
	.byte $07			  ; $8E8D - Unknown opcode
	ASL ptr0_hi,X			; $8E8E: 16 05   
	.byte $07			  ; $8E90 - Unknown opcode
	.byte $1B			  ; $8E91 - Unknown opcode
	.byte $17			  ; $8E92 - Unknown opcode
	.byte $02			  ; $8E93 - Unknown opcode
	ASL $49				  ; $8E94: 06 49   
	STA $1918,Y			  ; $8E96: 99 18 19
	.byte $02			  ; $8E99 - Unknown opcode
	BRK					  ; $8E9A: 00	  
	STY $3EA4				; $8E9B: 8C A4 3E
	.byte $0B			  ; $8E9E - Unknown opcode
	ASL $48				  ; $8E9F: 06 48   
	CMP $9849				; $8EA1: CD 49 98
	ROL $060B,X			  ; $8EA4: 3E 0B 06
	PHA					  ; $8EA7: 48	  
	CMP $CE48				; $8EA8: CD 48 CE
	ROL $073F,X			  ; $8EAB: 3E 3F 07
	ASL ptr0_hi,X			; $8EAE: 16 05   
	EOR #$9A				 ; $8EB0: 49 9A   
	.byte $0B			  ; $8EB2 - Unknown opcode
	PHA					  ; $8EB3: 48	  
	CMP $073F,Y			  ; $8EB4: D9 3F 07
	ASL ptr0_hi,X			; $8EB7: 16 05   
	EOR #$9B				 ; $8EB9: 49 9B   
	.byte $0B			  ; $8EBB - Unknown opcode
	PHA					  ; $8EBC: 48	  
	.byte $DA			  ; $8EBD - Unknown opcode
	.byte $3F			  ; $8EBE - Unknown opcode
	.byte $07			  ; $8EBF - Unknown opcode
	ASL ptr0_hi,X			; $8EC0: 16 05   
	EOR #$9C				 ; $8EC2: 49 9C   
	.byte $0B			  ; $8EC4 - Unknown opcode
	PHA					  ; $8EC5: 48	  
	.byte $DB			  ; $8EC6 - Unknown opcode
	.byte $3F			  ; $8EC7 - Unknown opcode
	.byte $07			  ; $8EC8 - Unknown opcode
	.byte $14			  ; $8EC9 - Unknown opcode
	ASL $48				  ; $8ECA: 06 48   
	LDX $0307				; $8ECC: AE 07 03
	.byte $02			  ; $8ECF - Unknown opcode
	PHA					  ; $8ED0: 48	  
	.byte $AF			  ; $8ED1 - Unknown opcode
	.byte $0B			  ; $8ED2 - Unknown opcode
	.byte $07			  ; $8ED3 - Unknown opcode
	.byte $03			  ; $8ED4 - Unknown opcode
	.byte $03			  ; $8ED5 - Unknown opcode
	PHA					  ; $8ED6: 48	  
	.byte $AF			  ; $8ED7 - Unknown opcode
	ROL $4A0B,X			  ; $8ED8: 3E 0B 4A
	PHP					  ; $8EDB: 08	  
	.byte $3F			  ; $8EDC - Unknown opcode
	EOR #$9D				 ; $8EDD: 49 9D   
	BRK					  ; $8EDF: 00	  
	.byte $1F			  ; $8EE0 - Unknown opcode
	CLV					  ; $8EE1: B8	  
	.byte $3F			  ; $8EE2 - Unknown opcode
	.byte $07			  ; $8EE3 - Unknown opcode
	ASL ptr0_hi,X			; $8EE4: 16 05   
	EOR #$9E				 ; $8EE6: 49 9E   
	.byte $0B			  ; $8EE8 - Unknown opcode
	PHA					  ; $8EE9: 48	  
	LDX $3F,Y				; $8EEA: B6 3F   
	.byte $07			  ; $8EEC - Unknown opcode
	ASL ptr0_hi,X			; $8EED: 16 05   
	ASL ptr1_hi			  ; $8EEF: 06 07   
	.byte $03			  ; $8EF1 - Unknown opcode
	.byte $03			  ; $8EF2 - Unknown opcode
	ASL $49				  ; $8EF3: 06 49   
	LDY #$07				 ; $8EF5: A0 07   
	.byte $03			  ; $8EF7 - Unknown opcode
	.byte $02			  ; $8EF8 - Unknown opcode
	EOR #$A1				 ; $8EF9: 49 A1   
	EOR #$A2				 ; $8EFB: 49 A2   
	ROL $070B,X			  ; $8EFD: 3E 0B 07
	.byte $03			  ; $8F00 - Unknown opcode
	.byte $02			  ; $8F01 - Unknown opcode
	ASL $49				  ; $8F02: 06 49   
	LDA ($49,X)			  ; $8F04: A1 49   
	LDX #$3E				 ; $8F06: A2 3E   
	EOR #$A3				 ; $8F08: 49 A3   
	ROL $070B,X			  ; $8F0A: 3E 0B 07
	.byte $83			  ; $8F0D - Unknown opcode
	ORA #$48				 ; $8F0E: 09 48   
	LDY $0B,X				; $8F10: B4 0B   
	PHA					  ; $8F12: 48	  
	LDA $3F,X				; $8F13: B5 3F   
	PHA					  ; $8F15: 48	  
	LDY $1607,X			  ; $8F16: BC 07 16
	ORA $49				  ; $8F19: 05 49   
	LDA $0B				  ; $8F1B: A5 0B   
	PHA					  ; $8F1D: 48	  
	LDA $073F,X			  ; $8F1E: BD 3F 07
	ASL ptr0_hi,X			; $8F21: 16 05   
	ASL $49				  ; $8F23: 06 49   
	LDX $46				  ; $8F25: A6 46   
	STA $0947,Y			  ; $8F27: 99 47 09
	ROL $060B,X			  ; $8F2A: 3E 0B 06
	LSR $98				  ; $8F2D: 46 98   
	LSR $99				  ; $8F2F: 46 99   
	ROL $493F,X			  ; $8F31: 3E 3F 49
	LDX $EE00,Y			  ; $8F34: BE 00 EE
	.byte $AB			  ; $8F37 - Unknown opcode
	.byte $3F			  ; $8F38 - Unknown opcode
	.byte $07			  ; $8F39 - Unknown opcode
	.byte $03			  ; $8F3A - Unknown opcode
	.byte $02			  ; $8F3B - Unknown opcode
	EOR #$BF				 ; $8F3C: 49 BF   
	.byte $0B			  ; $8F3E - Unknown opcode
	.byte $07			  ; $8F3F - Unknown opcode
	.byte $03			  ; $8F40 - Unknown opcode
	.byte $03			  ; $8F41 - Unknown opcode
	EOR #$BF				 ; $8F42: 49 BF   
	.byte $0B			  ; $8F44 - Unknown opcode
	EOR #$C0				 ; $8F45: 49 C0   
	EOR #$C1				 ; $8F47: 49 C1   
	BRK					  ; $8F49: 00	  
	.byte $F3			  ; $8F4A - Unknown opcode
	.byte $AB			  ; $8F4B - Unknown opcode
	.byte $3F			  ; $8F4C - Unknown opcode
	.byte $07			  ; $8F4D - Unknown opcode
	ASL ptr0_hi,X			; $8F4E: 16 05   
	EOR #$C2				 ; $8F50: 49 C2   
	.byte $0B			  ; $8F52 - Unknown opcode
	.byte $47			  ; $8F53 - Unknown opcode
	LDA $3F,X				; $8F54: B5 3F   
	.byte $07			  ; $8F56 - Unknown opcode
	ASL ptr0_hi,X			; $8F57: 16 05   
	.byte $07			  ; $8F59 - Unknown opcode
	.byte $14			  ; $8F5A - Unknown opcode
	EOR #$C3				 ; $8F5B: 49 C3   
	.byte $0B			  ; $8F5D - Unknown opcode
	EOR #$D0				 ; $8F5E: 49 D0   
	.byte $0B			  ; $8F60 - Unknown opcode
	.byte $07			  ; $8F61 - Unknown opcode
	.byte $14			  ; $8F62 - Unknown opcode
	.byte $47			  ; $8F63 - Unknown opcode
	LDX $0B,Y				; $8F64: B6 0B   
	.byte $47			  ; $8F66 - Unknown opcode
	LDX $073F,Y			  ; $8F67: BE 3F 07
	ASL ptr0_hi,X			; $8F6A: 16 05   
	.byte $07			  ; $8F6C - Unknown opcode
	.byte $14			  ; $8F6D - Unknown opcode
	EOR #$C8				 ; $8F6E: 49 C8   
	.byte $0B			  ; $8F70 - Unknown opcode
	EOR #$C7				 ; $8F71: 49 C7   
	.byte $0B			  ; $8F73 - Unknown opcode
	.byte $07			  ; $8F74 - Unknown opcode
	.byte $14			  ; $8F75 - Unknown opcode
	.byte $47			  ; $8F76 - Unknown opcode
	TSX					  ; $8F77: BA	  
	.byte $0B			  ; $8F78 - Unknown opcode
	.byte $47			  ; $8F79 - Unknown opcode
	LDA $073F,Y			  ; $8F7A: B9 3F 07
	.byte $14			  ; $8F7D - Unknown opcode
	.byte $07			  ; $8F7E - Unknown opcode
	ASL ptr0_hi,X			; $8F7F: 16 05   
	EOR #$C9				 ; $8F81: 49 C9   
	.byte $0B			  ; $8F83 - Unknown opcode
	.byte $47			  ; $8F84 - Unknown opcode
	LDY $450B,X			  ; $8F85: BC 0B 45
	DEX					  ; $8F88: CA	  
	.byte $3F			  ; $8F89 - Unknown opcode
	.byte $07			  ; $8F8A - Unknown opcode
	ASL ptr0_hi,X			; $8F8B: 16 05   
	.byte $07			  ; $8F8D - Unknown opcode
	.byte $14			  ; $8F8E - Unknown opcode
	EOR #$CA				 ; $8F8F: 49 CA   
	.byte $0B			  ; $8F91 - Unknown opcode
	EOR #$CF				 ; $8F92: 49 CF   
	.byte $0B			  ; $8F94 - Unknown opcode
	.byte $07			  ; $8F95 - Unknown opcode
	.byte $14			  ; $8F96 - Unknown opcode
	.byte $47			  ; $8F97 - Unknown opcode
	.byte $BB			  ; $8F98 - Unknown opcode
	.byte $0B			  ; $8F99 - Unknown opcode
	.byte $47			  ; $8F9A - Unknown opcode
	.byte $BF			  ; $8F9B - Unknown opcode
	.byte $3F			  ; $8F9C - Unknown opcode
	.byte $07			  ; $8F9D - Unknown opcode
	ASL ptr0_hi,X			; $8F9E: 16 05   
	.byte $07			  ; $8FA0 - Unknown opcode
	.byte $14			  ; $8FA1 - Unknown opcode
	ASL ptr1_hi			  ; $8FA2: 06 07   
	.byte $03			  ; $8FA4 - Unknown opcode
	.byte $07			  ; $8FA5 - Unknown opcode
	EOR #$CC				 ; $8FA6: 49 CC   
	EOR #$CD				 ; $8FA8: 49 CD   
	ROL $490B,X			  ; $8FAA: 3E 0B 49
	DEC $070B				; $8FAD: CE 0B 07
	.byte $14			  ; $8FB0 - Unknown opcode
	.byte $47			  ; $8FB1 - Unknown opcode
	LDA $450B,X			  ; $8FB2: BD 0B 45
	CMP #$3F				 ; $8FB5: C9 3F	; Compare with 63
	.byte $07			  ; $8FB7 - Unknown opcode
	ASL ptr0_hi,X			; $8FB8: 16 05   
	ASL $49				  ; $8FBA: 06 49   
	CMP (ptr1_hi),Y		  ; $8FBC: D1 07   
	.byte $03			  ; $8FBE - Unknown opcode
	.byte $07			  ; $8FBF - Unknown opcode
	EOR #$D2				 ; $8FC0: 49 D2   
	ROL $460B,X			  ; $8FC2: 3E 0B 46
	.byte $1C			  ; $8FC5 - Unknown opcode
	.byte $3F			  ; $8FC6 - Unknown opcode
	.byte $07			  ; $8FC7 - Unknown opcode
	ASL ptr0_hi,X			; $8FC8: 16 05   
	.byte $07			  ; $8FCA - Unknown opcode
	.byte $03			  ; $8FCB - Unknown opcode
	.byte $07			  ; $8FCC - Unknown opcode
	EOR #$D3				 ; $8FCD: 49 D3   
	.byte $0B			  ; $8FCF - Unknown opcode
	EOR #$D4				 ; $8FD0: 49 D4   
	.byte $0B			  ; $8FD2 - Unknown opcode
	LSR $1B				  ; $8FD3: 46 1B   
	.byte $3F			  ; $8FD5 - Unknown opcode
	.byte $07			  ; $8FD6 - Unknown opcode
	ASL ptr0_hi,X			; $8FD7: 16 05   
	EOR #$D5				 ; $8FD9: 49 D5   
	.byte $0B			  ; $8FDB - Unknown opcode
	.byte $07			  ; $8FDC - Unknown opcode
	.byte $14			  ; $8FDD - Unknown opcode
	LSR $20				  ; $8FDE: 46 20   
	.byte $0B			  ; $8FE0 - Unknown opcode
	ASL $45				  ; $8FE1: 06 45   
	AND current_bank,Y	   ; $8FE3: 39 07 05
	EOR $3A				  ; $8FE6: 45 3A   
	.byte $0B			  ; $8FE8 - Unknown opcode
	EOR $3B				  ; $8FE9: 45 3B   
	ROL $073F,X			  ; $8FEB: 3E 3F 07
	ASL ptr0_hi,X			; $8FEE: 16 05   
	EOR #$D6				 ; $8FF0: 49 D6   
	.byte $0B			  ; $8FF2 - Unknown opcode
	.byte $07			  ; $8FF3 - Unknown opcode
	.byte $14			  ; $8FF4 - Unknown opcode
	LSR $1D				  ; $8FF5: 46 1D   
	.byte $0B			  ; $8FF7 - Unknown opcode
	EOR $37				  ; $8FF8: 45 37   
	.byte $3F			  ; $8FFA - Unknown opcode
	.byte $07			  ; $8FFB - Unknown opcode
	ASL ptr0_hi,X			; $8FFC: 16 05   
	.byte $07			  ; $8FFE - Unknown opcode
	.byte $14			  ; $8FFF - Unknown opcode
	EOR #$D8				 ; $9000: 49 D8   
	.byte $0B			  ; $9002 - Unknown opcode
	EOR #$DA				 ; $9003: 49 DA   
	.byte $0B			  ; $9005 - Unknown opcode
	.byte $07			  ; $9006 - Unknown opcode
	.byte $14			  ; $9007 - Unknown opcode
	LSR system_flags		 ; $9008: 46 1F   
	.byte $0B			  ; $900A - Unknown opcode
	EOR $38				  ; $900B: 45 38   
	.byte $3F			  ; $900D - Unknown opcode
	.byte $07			  ; $900E - Unknown opcode
	ASL ptr0_hi,X			; $900F: 16 05   
	EOR #$D9				 ; $9011: 49 D9   
	.byte $0B			  ; $9013 - Unknown opcode
	.byte $07			  ; $9014 - Unknown opcode
	.byte $14			  ; $9015 - Unknown opcode
	LSR $1E				  ; $9016: 46 1E   
	.byte $3F			  ; $9018 - Unknown opcode
	.byte $07			  ; $9019 - Unknown opcode
	ASL ptr0_hi,X			; $901A: 16 05   
	EOR $C9				  ; $901C: 45 C9   
	.byte $0B			  ; $901E - Unknown opcode
	EOR $35				  ; $901F: 45 35   
	.byte $3F			  ; $9021 - Unknown opcode
	.byte $07			  ; $9022 - Unknown opcode
	.byte $02			  ; $9023 - Unknown opcode
	.byte $12			  ; $9024 - Unknown opcode
	.byte $02			  ; $9025 - Unknown opcode
	.byte $0B			  ; $9026 - Unknown opcode
	EOR #$EC				 ; $9027: 49 EC   
	.byte $3F			  ; $9029 - Unknown opcode
	.byte $07			  ; $902A - Unknown opcode
	ASL ptr0_hi,X			; $902B: 16 05   
	EOR #$DC				 ; $902D: 49 DC   
	.byte $0B			  ; $902F - Unknown opcode
	.byte $47			  ; $9030 - Unknown opcode
	.byte $D7			  ; $9031 - Unknown opcode
	.byte $3F			  ; $9032 - Unknown opcode
loc_9033:
	.byte $07			  ; $9033 - Unknown opcode
	.byte $14			  ; $9034 - Unknown opcode
	.byte $07			  ; $9035 - Unknown opcode
	ASL ptr0_hi,X			; $9036: 16 05   
	EOR #$DD				 ; $9038: 49 DD   
	.byte $0B			  ; $903A - Unknown opcode
	.byte $47			  ; $903B - Unknown opcode
	CLD					  ; $903C: D8	  
	.byte $0B			  ; $903D - Unknown opcode
	EOR $C9				  ; $903E: 45 C9   
	.byte $3F			  ; $9040 - Unknown opcode
	.byte $07			  ; $9041 - Unknown opcode
	ASL ptr0_hi,X			; $9042: 16 05   
	EOR #$DE				 ; $9044: 49 DE   
	.byte $0B			  ; $9046 - Unknown opcode
	.byte $07			  ; $9047 - Unknown opcode
	.byte $14			  ; $9048 - Unknown opcode
	.byte $47			  ; $9049 - Unknown opcode
	CMP $470B,Y			  ; $904A: D9 0B 47
	.byte $DC			  ; $904D - Unknown opcode
	.byte $3F			  ; $904E - Unknown opcode
	.byte $07			  ; $904F - Unknown opcode
	.byte $14			  ; $9050 - Unknown opcode
	.byte $07			  ; $9051 - Unknown opcode
	ASL ptr0_hi,X			; $9052: 16 05   
	EOR #$DF				 ; $9054: 49 DF   
	.byte $0B			  ; $9056 - Unknown opcode
	.byte $47			  ; $9057 - Unknown opcode
	.byte $DA			  ; $9058 - Unknown opcode
	.byte $0B			  ; $9059 - Unknown opcode
	EOR $CA				  ; $905A: 45 CA   
	.byte $3F			  ; $905C - Unknown opcode
	.byte $07			  ; $905D - Unknown opcode
	ASL ptr0_hi,X			; $905E: 16 05   
	ASL $49				  ; $9060: 06 49   
	CPX #$07				 ; $9062: E0 07   
	STA $49				  ; $9064: 85 49   
	SBC ($49,X)			  ; $9066: E1 49	; Arithmetic
	.byte $E2			  ; $9068 - Unknown opcode
	ROL $470B,X			  ; $9069: 3E 0B 47
	.byte $DB			  ; $906C - Unknown opcode
	.byte $3F			  ; $906D - Unknown opcode
	.byte $07			  ; $906E - Unknown opcode
	.byte $03			  ; $906F - Unknown opcode
	.byte $02			  ; $9070 - Unknown opcode
	.byte $47			  ; $9071 - Unknown opcode
	.byte $12			  ; $9072 - Unknown opcode
loc_9073:
	.byte $0B			  ; $9073 - Unknown opcode
	.byte $07			  ; $9074 - Unknown opcode
	.byte $03			  ; $9075 - Unknown opcode
	.byte $03			  ; $9076 - Unknown opcode
	.byte $47			  ; $9077 - Unknown opcode
	.byte $12			  ; $9078 - Unknown opcode
	.byte $0B			  ; $9079 - Unknown opcode
	.byte $47			  ; $907A - Unknown opcode
	.byte $13			  ; $907B - Unknown opcode
	.byte $3F			  ; $907C - Unknown opcode
	EOR #$ED				 ; $907D: 49 ED   
	BRK					  ; $907F: 00	  
	STY $3FA4				; $9080: 8C A4 3F
	EOR #$EE				 ; $9083: 49 EE   
	.byte $07			  ; $9085 - Unknown opcode
	ORA $49				  ; $9086: 05 49   
	.byte $EF			  ; $9088 - Unknown opcode
	.byte $0B			  ; $9089 - Unknown opcode
	EOR #$EF				 ; $908A: 49 EF   
	.byte $3F			  ; $908C - Unknown opcode
	EOR #$F0				 ; $908D: 49 F0   
	CLC					  ; $908F: 18	  
	.byte $1A			  ; $9090 - Unknown opcode
	BPL $90D2				; $9091: 10 3F   
	.byte $07			  ; $9093 - Unknown opcode
	.byte $1B			  ; $9094 - Unknown opcode
	ASL $4980				; $9095: 0E 80 49
	.byte $F2			  ; $9098 - Unknown opcode
	.byte $0B			  ; $9099 - Unknown opcode
	EOR #$F1				 ; $909A: 49 F1   
	.byte $3F			  ; $909C - Unknown opcode
	.byte $07			  ; $909D - Unknown opcode
	.byte $1B			  ; $909E - Unknown opcode
	ASL $4940				; $909F: 0E 40 49
	.byte $F4			  ; $90A2 - Unknown opcode
	.byte $0B			  ; $90A3 - Unknown opcode
	EOR #$F3				 ; $90A4: 49 F3   
	.byte $3F			  ; $90A6 - Unknown opcode
	ORA ($FD,X)			  ; $90A7: 01 FD   
	.byte $AB			  ; $90A9 - Unknown opcode
	SBC $09,X				; $90AA: F5 09	; Arithmetic
	CLC					  ; $90AC: 18	  
	.byte $1A			  ; $90AD - Unknown opcode
	BPL $90EF				; $90AE: 10 3F   
	.byte $07			  ; $90B0 - Unknown opcode
	ASL ptr0_hi,X			; $90B1: 16 05   
	EOR #$FB				 ; $90B3: 49 FB   
	.byte $0B			  ; $90B5 - Unknown opcode
	.byte $07			  ; $90B6 - Unknown opcode
	.byte $14			  ; $90B7 - Unknown opcode
	LSR $8F				  ; $90B8: 46 8F   
	.byte $0B			  ; $90BA - Unknown opcode
	EOR $67				  ; $90BB: 45 67   
	.byte $3F			  ; $90BD - Unknown opcode
	.byte $07			  ; $90BE - Unknown opcode
	ASL ptr0_hi,X			; $90BF: 16 05   
	EOR #$FC				 ; $90C1: 49 FC   
	.byte $0B			  ; $90C3 - Unknown opcode
	LSR $89				  ; $90C4: 46 89   
	.byte $3F			  ; $90C6 - Unknown opcode
	.byte $07			  ; $90C7 - Unknown opcode
	ASL ptr0_hi,X			; $90C8: 16 05   
	ASL $49				  ; $90CA: 06 49   
	INC current_bank,X	   ; $90CC: FE 07 05
	EOR #$FF				 ; $90CF: 49 FF   
	.byte $0B			  ; $90D1 - Unknown opcode
loc_90D2:
	LSR					  ; $90D2: 4A	  
	BRK					  ; $90D3: 00	  
	ROL $070B,X			  ; $90D4: 3E 0B 07
	.byte $14			  ; $90D7 - Unknown opcode
	LSR $8E				  ; $90D8: 46 8E   
	.byte $0B			  ; $90DA - Unknown opcode
	EOR $61				  ; $90DB: 45 61   
	.byte $3F			  ; $90DD - Unknown opcode
	.byte $07			  ; $90DE - Unknown opcode
	ASL ptr0_hi,X			; $90DF: 16 05   
	.byte $07			  ; $90E1 - Unknown opcode
	.byte $14			  ; $90E2 - Unknown opcode
	ASL ptr1_hi			  ; $90E3: 06 07   
	.byte $1B			  ; $90E5 - Unknown opcode
	.byte $1A			  ; $90E6 - Unknown opcode
	.byte $02			  ; $90E7 - Unknown opcode
	LSR					  ; $90E8: 4A	  
	ASL $4A0B,X			  ; $90E9: 1E 0B 4A
	ORA ($3E,X)			  ; $90EC: 01 3E   
	.byte $0B			  ; $90EE - Unknown opcode
loc_90EF:
	LSR					  ; $90EF: 4A	  
	.byte $02			  ; $90F0 - Unknown opcode
	.byte $0B			  ; $90F1 - Unknown opcode
	.byte $07			  ; $90F2 - Unknown opcode
	.byte $14			  ; $90F3 - Unknown opcode
	LSR $8C				  ; $90F4: 46 8C   
	.byte $0B			  ; $90F6 - Unknown opcode
	EOR $60				  ; $90F7: 45 60   
	.byte $3F			  ; $90F9 - Unknown opcode
	.byte $07			  ; $90FA - Unknown opcode
	ASL ptr0_hi,X			; $90FB: 16 05   
	.byte $07			  ; $90FD - Unknown opcode
	.byte $14			  ; $90FE - Unknown opcode
	LSR					  ; $90FF: 4A	  
	.byte $04			  ; $9100 - Unknown opcode
	.byte $0B			  ; $9101 - Unknown opcode
	LSR					  ; $9102: 4A	  
	.byte $03			  ; $9103 - Unknown opcode
	.byte $0B			  ; $9104 - Unknown opcode
	.byte $07			  ; $9105 - Unknown opcode
	.byte $14			  ; $9106 - Unknown opcode
	LSR $92				  ; $9107: 46 92   
	.byte $0B			  ; $9109 - Unknown opcode
	EOR $66				  ; $910A: 45 66   
	.byte $3F			  ; $910C - Unknown opcode
	.byte $07			  ; $910D - Unknown opcode
	ASL ptr0_hi,X			; $910E: 16 05   
	LSR					  ; $9110: 4A	  
	ORA $0B				  ; $9111: 05 0B   
	EOR $69				  ; $9113: 45 69   
	.byte $3F			  ; $9115 - Unknown opcode
	.byte $07			  ; $9116 - Unknown opcode
	ASL ptr0_hi,X			; $9117: 16 05   
	LSR					  ; $9119: 4A	  
	ASL $0B				  ; $911A: 06 0B   
	EOR $6D				  ; $911C: 45 6D   
	.byte $3F			  ; $911E - Unknown opcode
	.byte $07			  ; $911F - Unknown opcode
	ASL ptr0_hi,X			; $9120: 16 05   
	LSR					  ; $9122: 4A	  
	.byte $07			  ; $9123 - Unknown opcode
	.byte $0B			  ; $9124 - Unknown opcode
	EOR $6B				  ; $9125: 45 6B   
	.byte $3F			  ; $9127 - Unknown opcode
	.byte $07			  ; $9128 - Unknown opcode
	ASL ptr0_hi,X			; $9129: 16 05   
	ORA ($37,X)			  ; $912B: 01 37   
	LDY $0A09				; $912D: AC 09 0A
	.byte $0B			  ; $9130 - Unknown opcode
	EOR $6C				  ; $9131: 45 6C   
	.byte $3F			  ; $9133 - Unknown opcode
	.byte $07			  ; $9134 - Unknown opcode
	ASL ptr0_hi,X			; $9135: 16 05   
	ASL ptr1_hi			  ; $9137: 06 07   
	.byte $1B			  ; $9139 - Unknown opcode
	.byte $1A			  ; $913A - Unknown opcode
	.byte $02			  ; $913B - Unknown opcode
	LSR					  ; $913C: 4A	  
	.byte $1C			  ; $913D - Unknown opcode
	.byte $0B			  ; $913E - Unknown opcode
	.byte $07			  ; $913F - Unknown opcode
	.byte $03			  ; $9140 - Unknown opcode
	.byte $03			  ; $9141 - Unknown opcode
	LSR					  ; $9142: 4A	  
	ASL $4A0B				; $9143: 0E 0B 4A
	.byte $0F			  ; $9146 - Unknown opcode
	ROL $070B,X			  ; $9147: 3E 0B 07
	.byte $14			  ; $914A - Unknown opcode
	LSR $94				  ; $914B: 46 94   
	.byte $0B			  ; $914D - Unknown opcode
	EOR $6E				  ; $914E: 45 6E   
	.byte $3F			  ; $9150 - Unknown opcode
	.byte $07			  ; $9151 - Unknown opcode
	ASL ptr0_hi,X			; $9152: 16 05   
	ASL ptr1_hi			  ; $9154: 06 07   
	.byte $1B			  ; $9156 - Unknown opcode
	.byte $1A			  ; $9157 - Unknown opcode
	.byte $02			  ; $9158 - Unknown opcode
	LSR					  ; $9159: 4A	  
	ORA $4A0B,X			  ; $915A: 1D 0B 4A
	BPL $919D				; $915D: 10 3E   
	.byte $0B			  ; $915F - Unknown opcode
	EOR $6F				  ; $9160: 45 6F   
	.byte $3F			  ; $9162 - Unknown opcode
	.byte $07			  ; $9163 - Unknown opcode
	.byte $9B			  ; $9164 - Unknown opcode
	.byte $1A			  ; $9165 - Unknown opcode
	BPL $916F				; $9166: 10 07   
	.byte $14			  ; $9168 - Unknown opcode
	LSR					  ; $9169: 4A	  
	ORA ($0B),Y			  ; $916A: 11 0B   
	LSR					  ; $916C: 4A	  
	ORA $0B,X				; $916D: 15 0B   
loc_916F:
	ASL ptr1_hi			  ; $916F: 06 07   
	.byte $14			  ; $9171 - Unknown opcode
	ASL $4A				  ; $9172: 06 4A   
	.byte $12			  ; $9174 - Unknown opcode
	.byte $07			  ; $9175 - Unknown opcode
	STA $4A				  ; $9176: 85 4A   
	.byte $13			  ; $9178 - Unknown opcode
	.byte $0B			  ; $9179 - Unknown opcode
	ASL $4A				  ; $917A: 06 4A   
	.byte $14			  ; $917C - Unknown opcode
	BRK					  ; $917D: 00	  
	.byte $C3			  ; $917E - Unknown opcode
	TAX					  ; $917F: AA	  
	ROL $0B3E,X			  ; $9180: 3E 3E 0B
	LSR					  ; $9183: 4A	  
	ASL $3E,X				; $9184: 16 3E   
	.byte $3F			  ; $9186 - Unknown opcode
	.byte $07			  ; $9187 - Unknown opcode
	.byte $1B			  ; $9188 - Unknown opcode
	.byte $1A			  ; $9189 - Unknown opcode
	.byte $02			  ; $918A - Unknown opcode
	EOR $70				  ; $918B: 45 70   
	.byte $0B			  ; $918D - Unknown opcode
	.byte $07			  ; $918E - Unknown opcode
	ASL ptr0_hi,X			; $918F: 16 05   
	LSR					  ; $9191: 4A	  
	.byte $17			  ; $9192 - Unknown opcode
	.byte $0B			  ; $9193 - Unknown opcode
	EOR $70				  ; $9194: 45 70   
	.byte $3F			  ; $9196 - Unknown opcode
	.byte $07			  ; $9197 - Unknown opcode
	.byte $1B			  ; $9198 - Unknown opcode
	.byte $1A			  ; $9199 - Unknown opcode
	.byte $02			  ; $919A - Unknown opcode
	EOR $73				  ; $919B: 45 73   
loc_919D:
	.byte $0B			  ; $919D - Unknown opcode
	.byte $07			  ; $919E - Unknown opcode
	ASL ptr0_hi,X			; $919F: 16 05   
	LSR					  ; $91A1: 4A	  
	ORA $450B,Y			  ; $91A2: 19 0B 45
	.byte $73			  ; $91A5 - Unknown opcode
	.byte $3F			  ; $91A6 - Unknown opcode
	.byte $07			  ; $91A7 - Unknown opcode
	.byte $1B			  ; $91A8 - Unknown opcode
	.byte $1A			  ; $91A9 - Unknown opcode
	.byte $02			  ; $91AA - Unknown opcode
	LSR					  ; $91AB: 4A	  
	AND ($0B,X)			  ; $91AC: 21 0B   
	.byte $07			  ; $91AE - Unknown opcode
	ASL ptr0_hi,X			; $91AF: 16 05   
	LSR					  ; $91B1: 4A	  
	.byte $1A			  ; $91B2 - Unknown opcode
	.byte $0B			  ; $91B3 - Unknown opcode
	EOR $74				  ; $91B4: 45 74   
	.byte $3F			  ; $91B6 - Unknown opcode
	.byte $07			  ; $91B7 - Unknown opcode
	.byte $1B			  ; $91B8 - Unknown opcode
	.byte $1A			  ; $91B9 - Unknown opcode
	.byte $02			  ; $91BA - Unknown opcode
	EOR $76				  ; $91BB: 45 76   
	.byte $0B			  ; $91BD - Unknown opcode
	.byte $07			  ; $91BE - Unknown opcode
	ASL ptr0_hi,X			; $91BF: 16 05   
	LSR					  ; $91C1: 4A	  
	.byte $1B			  ; $91C2 - Unknown opcode
	.byte $0B			  ; $91C3 - Unknown opcode
	EOR $76				  ; $91C4: 45 76   
	.byte $3F			  ; $91C6 - Unknown opcode
	.byte $07			  ; $91C7 - Unknown opcode
	ASL ptr0_hi,X			; $91C8: 16 05   
	LSR					  ; $91CA: 4A	  
	.byte $23			  ; $91CB - Unknown opcode
	.byte $0B			  ; $91CC - Unknown opcode
	.byte $07			  ; $91CD - Unknown opcode
	.byte $14			  ; $91CE - Unknown opcode
	EOR $E8				  ; $91CF: 45 E8   
	.byte $0B			  ; $91D1 - Unknown opcode
	EOR $2B				  ; $91D2: 45 2B   
	.byte $3F			  ; $91D4 - Unknown opcode
	.byte $07			  ; $91D5 - Unknown opcode
	ASL ptr0_hi,X			; $91D6: 16 05   
	LSR					  ; $91D8: 4A	  
	BIT $0B				  ; $91D9: 24 0B   
	.byte $07			  ; $91DB - Unknown opcode
	.byte $14			  ; $91DC - Unknown opcode
	EOR $E7				  ; $91DD: 45 E7   
	.byte $0B			  ; $91DF - Unknown opcode
	EOR $2A				  ; $91E0: 45 2A   
	.byte $3F			  ; $91E2 - Unknown opcode
	.byte $07			  ; $91E3 - Unknown opcode
	ASL ptr0_hi,X			; $91E4: 16 05   
	.byte $07			  ; $91E6 - Unknown opcode
	.byte $14			  ; $91E7 - Unknown opcode
	ASL ptr1_hi			  ; $91E8: 06 07   
	.byte $03			  ; $91EA - Unknown opcode
	ASL $4A				  ; $91EB: 06 4A   
	AND $0B				  ; $91ED: 25 0B   
	LSR					  ; $91EF: 4A	  
	ROL $3E				  ; $91F0: 26 3E   
	.byte $0B			  ; $91F2 - Unknown opcode
	LSR					  ; $91F3: 4A	  
	.byte $27			  ; $91F4 - Unknown opcode
	.byte $0B			  ; $91F5 - Unknown opcode
	.byte $07			  ; $91F6 - Unknown opcode
	.byte $14			  ; $91F7 - Unknown opcode
	EOR pos_y_lo			 ; $91F8: 45 EC   
	.byte $0B			  ; $91FA - Unknown opcode
	EOR $27				  ; $91FB: 45 27   
	.byte $3F			  ; $91FD - Unknown opcode
	.byte $07			  ; $91FE - Unknown opcode
	ASL ptr0_hi,X			; $91FF: 16 05   
	LSR					  ; $9201: 4A	  
	PLP					  ; $9202: 28	  
	.byte $0B			  ; $9203 - Unknown opcode
	EOR pos_x_hi			 ; $9204: 45 EB   
	.byte $3F			  ; $9206 - Unknown opcode
	.byte $07			  ; $9207 - Unknown opcode
	ASL ptr0_hi,X			; $9208: 16 05   
	.byte $07			  ; $920A - Unknown opcode
	.byte $14			  ; $920B - Unknown opcode
	LSR					  ; $920C: 4A	  
	AND #$0B				 ; $920D: 29 0B   
	LSR					  ; $920F: 4A	  
	.byte $32			  ; $9210 - Unknown opcode
	.byte $0B			  ; $9211 - Unknown opcode
	EOR pos_x_lo			 ; $9212: 45 EA   
	.byte $3F			  ; $9214 - Unknown opcode
	.byte $07			  ; $9215 - Unknown opcode
	ASL ptr0_hi,X			; $9216: 16 05   
	.byte $07			  ; $9218 - Unknown opcode
	.byte $14			  ; $9219 - Unknown opcode
	LSR					  ; $921A: 4A	  
	ROL					  ; $921B: 2A	  
	.byte $0B			  ; $921C - Unknown opcode
	LSR					  ; $921D: 4A	  
	ROL $070B				; $921E: 2E 0B 07
	.byte $14			  ; $9221 - Unknown opcode
	EOR $F2				  ; $9222: 45 F2   
	.byte $0B			  ; $9224 - Unknown opcode
	EOR $25				  ; $9225: 45 25   
	.byte $3F			  ; $9227 - Unknown opcode
	.byte $07			  ; $9228 - Unknown opcode
	ASL ptr0_hi,X			; $9229: 16 05   
	LSR					  ; $922B: 4A	  
	.byte $2B			  ; $922C - Unknown opcode
	.byte $0B			  ; $922D - Unknown opcode
	EOR $EF				  ; $922E: 45 EF   
	.byte $3F			  ; $9230 - Unknown opcode
	.byte $07			  ; $9231 - Unknown opcode
	ASL ptr0_hi,X			; $9232: 16 05   
	.byte $07			  ; $9234 - Unknown opcode
	.byte $14			  ; $9235 - Unknown opcode
	LSR					  ; $9236: 4A	  
	BIT $450B				; $9237: 2C 0B 45
	DEX					  ; $923A: CA	  
	.byte $0B			  ; $923B - Unknown opcode
	.byte $07			  ; $923C - Unknown opcode
	.byte $14			  ; $923D - Unknown opcode
	EOR $F0				  ; $923E: 45 F0   
	.byte $0B			  ; $9240 - Unknown opcode
	EOR $2C				  ; $9241: 45 2C   
	.byte $3F			  ; $9243 - Unknown opcode
	.byte $07			  ; $9244 - Unknown opcode
	ASL ptr0_hi,X			; $9245: 16 05   
	LSR					  ; $9247: 4A	  
	AND $450B				; $9248: 2D 0B 45
	SBC ($3F),Y			  ; $924B: F1 3F	; Arithmetic
	.byte $07			  ; $924D - Unknown opcode
	ASL ptr0_hi,X			; $924E: 16 05   
	LSR					  ; $9250: 4A	  
	.byte $2F			  ; $9251 - Unknown opcode
	.byte $0B			  ; $9252 - Unknown opcode
	EOR $26				  ; $9253: 45 26   
	.byte $3F			  ; $9255 - Unknown opcode
	.byte $07			  ; $9256 - Unknown opcode
	ASL ptr0_hi,X			; $9257: 16 05   
	.byte $07			  ; $9259 - Unknown opcode
	.byte $14			  ; $925A - Unknown opcode
	LSR					  ; $925B: 4A	  
	BMI $9269				; $925C: 30 0B   
	LSR					  ; $925E: 4A	  
	AND ($0B),Y			  ; $925F: 31 0B   
	EOR $E9				  ; $9261: 45 E9   
	.byte $3F			  ; $9263 - Unknown opcode
	.byte $07			  ; $9264 - Unknown opcode
	.byte $14			  ; $9265 - Unknown opcode
	.byte $07			  ; $9266 - Unknown opcode
	ASL ptr0_hi,X			; $9267: 16 05   
loc_9269:
	LSR					  ; $9269: 4A	  
	RTI					  ; $926A: 40	  
	.byte $0B			  ; $926B - Unknown opcode
	EOR $E1				  ; $926C: 45 E1   
	.byte $0B			  ; $926E - Unknown opcode
	EOR $21				  ; $926F: 45 21   
	.byte $3F			  ; $9271 - Unknown opcode
	EOR $E3				  ; $9272: 45 E3   
	.byte $07			  ; $9274 - Unknown opcode
	ASL tmp1,X			   ; $9275: 16 01   
	EOR $E4				  ; $9277: 45 E4   
	.byte $3F			  ; $9279 - Unknown opcode
	.byte $07			  ; $927A - Unknown opcode
	ASL ptr0_hi,X			; $927B: 16 05   
	LSR					  ; $927D: 4A	  
	AND $0B,X				; $927E: 35 0B   
	EOR $E5				  ; $9280: 45 E5   
	.byte $3F			  ; $9282 - Unknown opcode
	.byte $07			  ; $9283 - Unknown opcode
	ASL ptr0_hi,X			; $9284: 16 05   
	LSR					  ; $9286: 4A	  
	.byte $37			  ; $9287 - Unknown opcode
	.byte $0B			  ; $9288 - Unknown opcode
	EOR $E6				  ; $9289: 45 E6   
	.byte $3F			  ; $928B - Unknown opcode
	.byte $07			  ; $928C - Unknown opcode
	ASL ptr0_hi,X			; $928D: 16 05   
	.byte $07			  ; $928F - Unknown opcode
	.byte $83			  ; $9290 - Unknown opcode
	ASL $4A				  ; $9291: 06 4A   
	.byte $42			  ; $9293 - Unknown opcode
	.byte $0B			  ; $9294 - Unknown opcode
	LSR					  ; $9295: 4A	  
	EOR ($0B,X)			  ; $9296: 41 0B   
	EOR $D5				  ; $9298: 45 D5   
	.byte $3F			  ; $929A - Unknown opcode
	.byte $07			  ; $929B - Unknown opcode
	ASL ptr0_hi,X			; $929C: 16 05   
	.byte $07			  ; $929E - Unknown opcode
	.byte $83			  ; $929F - Unknown opcode
	ASL $4A				  ; $92A0: 06 4A   
	.byte $44			  ; $92A2 - Unknown opcode
	.byte $0B			  ; $92A3 - Unknown opcode
	LSR					  ; $92A4: 4A	  
	.byte $43			  ; $92A5 - Unknown opcode
	.byte $0B			  ; $92A6 - Unknown opcode
	EOR $D6				  ; $92A7: 45 D6   
	.byte $3F			  ; $92A9 - Unknown opcode
	.byte $07			  ; $92AA - Unknown opcode
	ASL ptr0_hi,X			; $92AB: 16 05   
	LSR					  ; $92AD: 4A	  
loc_92AE:
	EOR $0B				  ; $92AE: 45 0B   
	.byte $07			  ; $92B0 - Unknown opcode
	.byte $14			  ; $92B1 - Unknown opcode
	EOR $DF				  ; $92B2: 45 DF   
	.byte $0B			  ; $92B4 - Unknown opcode
	EOR $1C				  ; $92B5: 45 1C   
	.byte $3F			  ; $92B7 - Unknown opcode
	.byte $07			  ; $92B8 - Unknown opcode
	ASL ptr0_hi,X			; $92B9: 16 05   
	ASL $4A				  ; $92BB: 06 4A   
	LSR ptr1_hi			  ; $92BD: 46 07   
	ORA $4A				  ; $92BF: 05 4A   
	.byte $47			  ; $92C1 - Unknown opcode
	.byte $0B			  ; $92C2 - Unknown opcode
	LSR					  ; $92C3: 4A	  
	PHA					  ; $92C4: 48	  
	ROL $450B,X			  ; $92C5: 3E 0B 45
	CLD					  ; $92C8: D8	  
	.byte $3F			  ; $92C9 - Unknown opcode
	.byte $07			  ; $92CA - Unknown opcode
	ASL ptr0_hi,X			; $92CB: 16 05   
	LSR $45				  ; $92CD: 46 45   
	.byte $0B			  ; $92CF - Unknown opcode
	EOR $D9				  ; $92D0: 45 D9   
	.byte $3F			  ; $92D2 - Unknown opcode
	.byte $07			  ; $92D3 - Unknown opcode
	ASL ptr0_hi,X			; $92D4: 16 05   
	.byte $07			  ; $92D6 - Unknown opcode
	.byte $83			  ; $92D7 - Unknown opcode
	ASL $4A				  ; $92D8: 06 4A   
	LSR					  ; $92DA: 4A	  
	.byte $0B			  ; $92DB - Unknown opcode
	LSR					  ; $92DC: 4A	  
	EOR #$0B				 ; $92DD: 49 0B   
	EOR $DA				  ; $92DF: 45 DA   
	.byte $3F			  ; $92E1 - Unknown opcode
	.byte $07			  ; $92E2 - Unknown opcode
	ASL ptr0_hi,X			; $92E3: 16 05   
	LSR					  ; $92E5: 4A	  
	.byte $4B			  ; $92E6 - Unknown opcode
	.byte $0B			  ; $92E7 - Unknown opcode
	EOR $DE				  ; $92E8: 45 DE   
	.byte $3F			  ; $92EA - Unknown opcode
	.byte $07			  ; $92EB - Unknown opcode
	ASL ptr0_hi,X			; $92EC: 16 05   
	LSR					  ; $92EE: 4A	  
	JMP $450B				; $92EF: 4C 0B 45
	CMP $4A3F,X			  ; $92F2: DD 3F 4A
	.byte $4F			  ; $92F5 - Unknown opcode
	BRK					  ; $92F6: 00	  
	BMI $92AE				; $92F7: 30 B5   
	.byte $3F			  ; $92F9 - Unknown opcode
	.byte $07			  ; $92FA - Unknown opcode
	.byte $1B			  ; $92FB - Unknown opcode
	ORA $4A40,X			  ; $92FC: 1D 40 4A
	PLA					  ; $92FF: 68	  
	.byte $0B			  ; $9300 - Unknown opcode
	ASL $4A				  ; $9301: 06 4A   
	EOR tmp0,X			   ; $9303: 55 00   
	ADC $AC,X				; $9305: 75 AC	; Arithmetic
	ROL $073F,X			  ; $9307: 3E 3F 07
	.byte $1B			  ; $930A - Unknown opcode
	ORA $0620,X			  ; $930B: 1D 20 06
	LSR					  ; $930E: 4A	  
	EOR $4D4A				; $930F: 4D 4A 4D
	LSR					  ; $9312: 4A	  
	LSR $0B3E				; $9313: 4E 3E 0B
	.byte $07			  ; $9316 - Unknown opcode
	.byte $1B			  ; $9317 - Unknown opcode
	ORA $4A80,X			  ; $9318: 1D 80 4A
	CLI					  ; $931B: 58	  
	.byte $0B			  ; $931C - Unknown opcode
	ASL $4A				  ; $931D: 06 4A   
	EOR $4E4A				; $931F: 4D 4A 4E
	ROL $073F,X			  ; $9322: 3E 3F 07
	.byte $1B			  ; $9325 - Unknown opcode
	ORA $4A20,X			  ; $9326: 1D 20 4A
	ADC $0B				  ; $9329: 65 0B	; Arithmetic
	.byte $07			  ; $932B - Unknown opcode
	.byte $1B			  ; $932C - Unknown opcode
	ORA $4A80,X			  ; $932D: 1D 80 4A
	EOR $4A0B,Y			  ; $9330: 59 0B 4A
	BVC $9374				; $9333: 50 3F   
	.byte $07			  ; $9335 - Unknown opcode
	.byte $1B			  ; $9336 - Unknown opcode
	ORA $4A20,X			  ; $9337: 1D 20 4A
	ROR $0B				  ; $933A: 66 0B   
	.byte $07			  ; $933C - Unknown opcode
	.byte $1B			  ; $933D - Unknown opcode
	ORA $4A80,X			  ; $933E: 1D 80 4A
	.byte $5A			  ; $9341 - Unknown opcode
	.byte $0B			  ; $9342 - Unknown opcode
	LSR					  ; $9343: 4A	  
	EOR ($3F),Y			  ; $9344: 51 3F   
	.byte $07			  ; $9346 - Unknown opcode
	.byte $1B			  ; $9347 - Unknown opcode
	ORA $4A20,X			  ; $9348: 1D 20 4A
	.byte $62			  ; $934B - Unknown opcode
	.byte $0B			  ; $934C - Unknown opcode
	.byte $07			  ; $934D - Unknown opcode
	.byte $1B			  ; $934E - Unknown opcode
	ORA $0140,X			  ; $934F: 1D 40 01
	DEY					  ; $9352: 88	  
	LDY $0A5F				; $9353: AC 5F 0A
	.byte $0B			  ; $9356 - Unknown opcode
	.byte $07			  ; $9357 - Unknown opcode
	.byte $1B			  ; $9358 - Unknown opcode
	ORA $4A80,X			  ; $9359: 1D 80 4A
	.byte $5B			  ; $935C - Unknown opcode
	.byte $0B			  ; $935D - Unknown opcode
	LSR					  ; $935E: 4A	  
	.byte $52			  ; $935F - Unknown opcode
	.byte $3F			  ; $9360 - Unknown opcode
	.byte $07			  ; $9361 - Unknown opcode
	.byte $1B			  ; $9362 - Unknown opcode
	ORA $4A20,X			  ; $9363: 1D 20 4A
	.byte $67			  ; $9366 - Unknown opcode
	.byte $0B			  ; $9367 - Unknown opcode
	.byte $07			  ; $9368 - Unknown opcode
	.byte $1B			  ; $9369 - Unknown opcode
	ORA $0080,X			  ; $936A: 1D 80 00
	ORA $0BAD,Y			  ; $936D: 19 AD 0B
	LSR					  ; $9370: 4A	  
	.byte $54			  ; $9371 - Unknown opcode
	.byte $3F			  ; $9372 - Unknown opcode
	.byte $07			  ; $9373 - Unknown opcode
loc_9374:
	.byte $1B			  ; $9374 - Unknown opcode
	ORA $0120,X			  ; $9375: 1D 20 01
	.byte $D2			  ; $9378 - Unknown opcode
	LDY $0A69				; $9379: AC 69 0A
	.byte $0B			  ; $937C - Unknown opcode
	ORA ($AE,X)			  ; $937D: 01 AE   
	LDY $0A56				; $937F: AC 56 0A
	.byte $3F			  ; $9382 - Unknown opcode
	.byte $07			  ; $9383 - Unknown opcode
	.byte $1B			  ; $9384 - Unknown opcode
	ASL $0680				; $9385: 0E 80 06
	LSR					  ; $9388: 4A	  
	EOR $7A00,X			  ; $9389: 5D 00 7A
	LDY $0B3E				; $938C: AC 3E 0B
	ASL $18				  ; $938F: 06 18   
	ASL $4A80				; $9391: 0E 80 4A
	.byte $5C			  ; $9394 - Unknown opcode
	BRK					  ; $9395: 00	  
	.byte $82			  ; $9396 - Unknown opcode
	LDY $3F3E				; $9397: AC 3E 3F
	.byte $07			  ; $939A - Unknown opcode
	.byte $1B			  ; $939B - Unknown opcode
	ORA $4A40,X			  ; $939C: 1D 40 4A
	LSR $4A0B,X			  ; $939F: 5E 0B 4A
	.byte $53			  ; $93A2 - Unknown opcode
	.byte $3F			  ; $93A3 - Unknown opcode
	LSR					  ; $93A4: 4A	  
	ROR $8A00				; $93A5: 6E 00 8A
	LDA $003F				; $93A8: AD 3F 00
	.byte $8F			  ; $93AB - Unknown opcode
	LDA $073F				; $93AC: AD 3F 07
	.byte $1B			  ; $93AF - Unknown opcode
	.byte $1B			  ; $93B0 - Unknown opcode
	.byte $FF			  ; $93B1 - Unknown opcode
	LSR					  ; $93B2: 4A	  
	.byte $72			  ; $93B3 - Unknown opcode
	.byte $0B			  ; $93B4 - Unknown opcode
	ASL $4A				  ; $93B5: 06 4A   
	.byte $73			  ; $93B7 - Unknown opcode
	.byte $07			  ; $93B8 - Unknown opcode
	ORA $4A				  ; $93B9: 05 4A   
	.byte $74			  ; $93BB - Unknown opcode
	.byte $0B			  ; $93BC - Unknown opcode
	LSR					  ; $93BD: 4A	  
	ADC $3E,X				; $93BE: 75 3E	; Arithmetic
	.byte $3F			  ; $93C0 - Unknown opcode
	.byte $07			  ; $93C1 - Unknown opcode
	.byte $1B			  ; $93C2 - Unknown opcode
	ORA $4A01,X			  ; $93C3: 1D 01 4A
	.byte $83			  ; $93C6 - Unknown opcode
	.byte $0B			  ; $93C7 - Unknown opcode
	.byte $07			  ; $93C8 - Unknown opcode
	.byte $1B			  ; $93C9 - Unknown opcode
	.byte $1A			  ; $93CA - Unknown opcode
	ORA ($4A,X)			  ; $93CB: 01 4A   
	ADC $070B,Y			  ; $93CD: 79 0B 07 ; Arithmetic
	.byte $1B			  ; $93D0 - Unknown opcode
	ASL $4A01				; $93D1: 0E 01 4A
	.byte $77			  ; $93D4 - Unknown opcode
	.byte $0B			  ; $93D5 - Unknown opcode
	LSR					  ; $93D6: 4A	  
	ROR $3F,X				; $93D7: 76 3F   
	.byte $07			  ; $93D9 - Unknown opcode
	.byte $1B			  ; $93DA - Unknown opcode
	ORA $4A01,X			  ; $93DB: 1D 01 4A
	STY $0B				  ; $93DE: 84 0B   
	.byte $07			  ; $93E0 - Unknown opcode
	.byte $1B			  ; $93E1 - Unknown opcode
	.byte $1A			  ; $93E2 - Unknown opcode
	ORA ($4A,X)			  ; $93E3: 01 4A   
	.byte $7A			  ; $93E5 - Unknown opcode
	.byte $0B			  ; $93E6 - Unknown opcode
	LSR					  ; $93E7: 4A	  
	SEI					  ; $93E8: 78	  
	.byte $3F			  ; $93E9 - Unknown opcode
	.byte $07			  ; $93EA - Unknown opcode
	.byte $1B			  ; $93EB - Unknown opcode
	ORA $4A01,X			  ; $93EC: 1D 01 4A
	.byte $82			  ; $93EF - Unknown opcode
	.byte $0B			  ; $93F0 - Unknown opcode
	.byte $47			  ; $93F1 - Unknown opcode
	.byte $4F			  ; $93F2 - Unknown opcode
	.byte $3F			  ; $93F3 - Unknown opcode
	.byte $07			  ; $93F4 - Unknown opcode
	.byte $1B			  ; $93F5 - Unknown opcode
	ORA $4A01,X			  ; $93F6: 1D 01 4A
	STA $0B				  ; $93F9: 85 0B   
	.byte $07			  ; $93FB - Unknown opcode
	.byte $1B			  ; $93FC - Unknown opcode
	.byte $1A			  ; $93FD - Unknown opcode
	ORA ($4A,X)			  ; $93FE: 01 4A   
	.byte $7B			  ; $9400 - Unknown opcode
	.byte $0B			  ; $9401 - Unknown opcode
	.byte $47			  ; $9402 - Unknown opcode
	BVC $9444				; $9403: 50 3F   
	.byte $07			  ; $9405 - Unknown opcode
	.byte $1B			  ; $9406 - Unknown opcode
	.byte $13			  ; $9407 - Unknown opcode
	.byte $02			  ; $9408 - Unknown opcode
	LSR					  ; $9409: 4A	  
	.byte $8F			  ; $940A - Unknown opcode
	.byte $0B			  ; $940B - Unknown opcode
	.byte $07			  ; $940C - Unknown opcode
	.byte $1B			  ; $940D - Unknown opcode
	ORA $0702,X			  ; $940E: 1D 02 07
	.byte $1B			  ; $9411 - Unknown opcode
	ORA ($FF),Y			  ; $9412: 11 FF   
	ASL $4A				  ; $9414: 06 4A   
	STX $D400				; $9416: 8E 00 D4
	LDA $0B3E				; $9419: AD 3E 0B
	LSR					  ; $941C: 4A	  
	STA $070B				; $941D: 8D 0B 07
	ORA ($7D),Y			  ; $9420: 11 7D   
	ORA ($B0,X)			  ; $9422: 01 B0   
	LDA $0A89				; $9424: AD 89 0A
	.byte $0B			  ; $9427 - Unknown opcode
	.byte $07			  ; $9428 - Unknown opcode
	.byte $14			  ; $9429 - Unknown opcode
	ASL $4A				  ; $942A: 06 4A   
	STX ptr1_hi			  ; $942C: 86 07   
	ORA $4A				  ; $942E: 05 4A   
	.byte $87			  ; $9430 - Unknown opcode
	.byte $0B			  ; $9431 - Unknown opcode
	LSR					  ; $9432: 4A	  
	.byte $87			  ; $9433 - Unknown opcode
	ROL $4A0B,X			  ; $9434: 3E 0B 4A
	DEY					  ; $9437: 88	  
	.byte $3F			  ; $9438 - Unknown opcode
	.byte $07			  ; $9439 - Unknown opcode
	.byte $1B			  ; $943A - Unknown opcode
	.byte $13			  ; $943B - Unknown opcode
	.byte $02			  ; $943C - Unknown opcode
	LSR					  ; $943D: 4A	  
	BCC $944B				; $943E: 90 0B   
	EOR $C0				  ; $9440: 45 C0   
	.byte $3F			  ; $9442 - Unknown opcode
	.byte $07			  ; $9443 - Unknown opcode
loc_9444:
	.byte $1B			  ; $9444 - Unknown opcode
	.byte $13			  ; $9445 - Unknown opcode
	.byte $02			  ; $9446 - Unknown opcode
	LSR					  ; $9447: 4A	  
	STA ($0B),Y			  ; $9448: 91 0B   
	EOR $C1				  ; $944A: 45 C1   
	.byte $3F			  ; $944C - Unknown opcode
	.byte $07			  ; $944D - Unknown opcode
	.byte $83			  ; $944E - Unknown opcode
	BRK					  ; $944F: 00	  
	ORA ($CA,X)			  ; $9450: 01 CA   
	LDX $0A92				; $9452: AE 92 0A
	.byte $0B			  ; $9455 - Unknown opcode
	ORA ($CA,X)			  ; $9456: 01 CA   
	LDX $0A93				; $9458: AE 93 0A
	.byte $3F			  ; $945B - Unknown opcode
	LSR					  ; $945C: 4A	  
	.byte $7C			  ; $945D - Unknown opcode
	.byte $07			  ; $945E - Unknown opcode
	ORA $4A				  ; $945F: 05 4A   
	ADC $060B,X			  ; $9461: 7D 0B 06 ; Arithmetic
	LSR					  ; $9464: 4A	  
	ROR $F100,X			  ; $9465: 7E 00 F1
	LDA $3F3E				; $9468: AD 3E 3F
	.byte $07			  ; $946B - Unknown opcode
	.byte $1B			  ; $946C - Unknown opcode
	JSR $4A20				; $946D: 20 20 4A
	STX $0B,Y				; $9470: 96 0B   
	LSR					  ; $9472: 4A	  
	STY $3F,X				; $9473: 94 3F   
	.byte $07			  ; $9475 - Unknown opcode
	.byte $1B			  ; $9476 - Unknown opcode
	JSR $4A20				; $9477: 20 20 4A
	.byte $97			  ; $947A - Unknown opcode
loc_947B:
	.byte $0B			  ; $947B - Unknown opcode
	LSR					  ; $947C: 4A	  
	STA $3F,X				; $947D: 95 3F   
	ORA ($F6,X)			  ; $947F: 01 F6   
	LDA $0A98				; $9481: AD 98 0A
	.byte $3F			  ; $9484 - Unknown opcode
	.byte $07			  ; $9485 - Unknown opcode
	.byte $1B			  ; $9486 - Unknown opcode
	ROL $20				  ; $9487: 26 20   
	.byte $44			  ; $9489 - Unknown opcode
	.byte $B2			  ; $948A - Unknown opcode
	.byte $0B			  ; $948B - Unknown opcode
	ORA ($26,X)			  ; $948C: 01 26   
	LDX $0AA7				; $948E: AE A7 0A
	.byte $3F			  ; $9491 - Unknown opcode
	.byte $07			  ; $9492 - Unknown opcode
	.byte $1B			  ; $9493 - Unknown opcode
	ROL $20				  ; $9494: 26 20   
	LSR					  ; $9496: 4A	  
	.byte $DC			  ; $9497 - Unknown opcode
	.byte $0B			  ; $9498 - Unknown opcode
	ASL tmp1				 ; $9499: 06 01   
	DEX					  ; $949B: CA	  
	LDX $0AB2				; $949C: AE B2 0A
	ORA ($CA,X)			  ; $949F: 01 CA   
	LDX $0AB3				; $94A1: AE B3 0A
	ROL $073F,X			  ; $94A4: 3E 3F 07
	.byte $1B			  ; $94A7 - Unknown opcode
	ROL $20				  ; $94A8: 26 20   
	ORA ($BC,X)			  ; $94AA: 01 BC   
	LDX $0ADB				; $94AC: AE DB 0A
	.byte $0B			  ; $94AF - Unknown opcode
	ORA ($CA,X)			  ; $94B0: 01 CA   
	LDX $0AB4				; $94B2: AE B4 0A
	.byte $3F			  ; $94B5 - Unknown opcode
	.byte $07			  ; $94B6 - Unknown opcode
	.byte $1B			  ; $94B7 - Unknown opcode
	ROL $20				  ; $94B8: 26 20   
	LSR					  ; $94BA: 4A	  
	.byte $D4			  ; $94BB - Unknown opcode
	.byte $0B			  ; $94BC - Unknown opcode
	ORA ($CA,X)			  ; $94BD: 01 CA   
	LDX $0ABE				; $94BF: AE BE 0A
	.byte $3F			  ; $94C2 - Unknown opcode
	.byte $07			  ; $94C3 - Unknown opcode
	.byte $1B			  ; $94C4 - Unknown opcode
	ROL $20				  ; $94C5: 26 20   
	LSR					  ; $94C7: 4A	  
	CMP $010B,Y			  ; $94C8: D9 0B 01
	BNE $947B				; $94CB: D0 AE   
	LDX $0A,Y				; $94CD: B6 0A   
	.byte $3F			  ; $94CF - Unknown opcode
	.byte $07			  ; $94D0 - Unknown opcode
	.byte $1B			  ; $94D1 - Unknown opcode
	ROL $20				  ; $94D2: 26 20   
	ORA ($CA,X)			  ; $94D4: 01 CA   
	LDX $0AD8				; $94D6: AE D8 0A
	.byte $0B			  ; $94D9 - Unknown opcode
	ORA ($0F,X)			  ; $94DA: 01 0F   
	.byte $AF			  ; $94DC - Unknown opcode
	.byte $BF			  ; $94DD - Unknown opcode
	ASL					  ; $94DE: 0A	  
	.byte $3F			  ; $94DF - Unknown opcode
	ORA ($24,X)			  ; $94E0: 01 24   
	.byte $AF			  ; $94E2 - Unknown opcode
	CPY #$0A				 ; $94E3: C0 0A   
	.byte $3F			  ; $94E5 - Unknown opcode
	.byte $07			  ; $94E6 - Unknown opcode
	.byte $1B			  ; $94E7 - Unknown opcode
	ASL $0680				; $94E8: 0E 80 06
	LSR					  ; $94EB: 4A	  
	INY					  ; $94EC: C8	  
	BRK					  ; $94ED: 00	  
	ADC $AF				  ; $94EE: 65 AF	; Arithmetic
	ROL $060B,X			  ; $94F0: 3E 0B 06
	LSR					  ; $94F3: 4A	  
	.byte $C7			  ; $94F4 - Unknown opcode
	CLC					  ; $94F5: 18	  
	ASL $3E80				; $94F6: 0E 80 3E
	.byte $3F			  ; $94F9 - Unknown opcode
	LSR					  ; $94FA: 4A	  
	CMP #$00				 ; $94FB: C9 00	; Compare with 0
	ADC #$AF				 ; $94FD: 69 AF	; Arithmetic
	.byte $3F			  ; $94FF - Unknown opcode
	LSR					  ; $9500: 4A	  
	DEX					  ; $9501: CA	  
	BRK					  ; $9502: 00	  
	ROR $3FAF				; $9503: 6E AF 3F
	LSR					  ; $9506: 4A	  
	.byte $CB			  ; $9507 - Unknown opcode
	ORA ($72,X)			  ; $9508: 01 72   
	.byte $AF			  ; $950A - Unknown opcode
	CPY $3F0A				; $950B: CC 0A 3F
	.byte $07			  ; $950E - Unknown opcode
	.byte $9B			  ; $950F - Unknown opcode
	ASL $0601				; $9510: 0E 01 06
	EOR $C7				  ; $9513: 45 C7   
	LSR					  ; $9515: 4A	  
	BVS $9518				; $9516: 70 00   
loc_9518:
	LDA $3EAF,X			  ; $9518: BD AF 3E
	LSR					  ; $951B: 4A	  
	ADC ($3F),Y			  ; $951C: 71 3F	; Arithmetic
	CLC					  ; $951E: 18	  
	ORA $4804,Y			  ; $951F: 19 04 48
	.byte $FA			  ; $9522 - Unknown opcode
	.byte $07			  ; $9523 - Unknown opcode
	ORA $48				  ; $9524: 05 48   
	.byte $FB			  ; $9526 - Unknown opcode
	.byte $0B			  ; $9527 - Unknown opcode
	PHA					  ; $9528: 48	  
	.byte $FC			  ; $9529 - Unknown opcode
	.byte $3F			  ; $952A - Unknown opcode
	.byte $07			  ; $952B - Unknown opcode
	.byte $1B			  ; $952C - Unknown opcode
	PHP					  ; $952D: 08	  
	.byte $80			  ; $952E - Unknown opcode
	ASL $47				  ; $952F: 06 47   
	STX tmp0,Y			   ; $9531: 96 00   
	STY $3EA4				; $9533: 8C A4 3E
	.byte $0B			  ; $9536 - Unknown opcode
	ASL $47				  ; $9537: 06 47   
	.byte $97			  ; $9539 - Unknown opcode
	.byte $07			  ; $953A - Unknown opcode
	.byte $03			  ; $953B - Unknown opcode
	PHP					  ; $953C: 08	  
	.byte $47			  ; $953D - Unknown opcode
	TYA					  ; $953E: 98	  
	ROL $073F,X			  ; $953F: 3E 3F 07
	.byte $1B			  ; $9542 - Unknown opcode
	ROL $20				  ; $9543: 26 20   
	ORA ($BC,X)			  ; $9545: 01 BC   
	LDX $0ACD				; $9547: AE CD 0A
	.byte $0B			  ; $954A - Unknown opcode
	LSR					  ; $954B: 4A	  
	LDA ($3F,X)			  ; $954C: A1 3F   
	.byte $07			  ; $954E - Unknown opcode
	.byte $1B			  ; $954F - Unknown opcode
	ROL $20				  ; $9550: 26 20   
	LSR					  ; $9552: 4A	  
	DEC $060B				; $9553: CE 0B 06
	LSR					  ; $9556: 4A	  
	LDA current_bank		 ; $9557: AD 07 05
	LSR					  ; $955A: 4A	  
	LDX $4A0B				; $955B: AE 0B 4A
	.byte $AF			  ; $955E - Unknown opcode
	ROL $073F,X			  ; $955F: 3E 3F 07
	.byte $1B			  ; $9562 - Unknown opcode
	ROL $20				  ; $9563: 26 20   
	LSR					  ; $9565: 4A	  
	.byte $CF			  ; $9566 - Unknown opcode
	.byte $0B			  ; $9567 - Unknown opcode
	ASL $4A				  ; $9568: 06 4A   
	LDA current_bank		 ; $956A: AD 07 05
	LSR					  ; $956D: 4A	  
	BCS $957B				; $956E: B0 0B   
	LSR					  ; $9570: 4A	  
	.byte $AF			  ; $9571 - Unknown opcode
	ROL $073F,X			  ; $9572: 3E 3F 07
	.byte $1B			  ; $9575 - Unknown opcode
	ROL $20				  ; $9576: 26 20   
	LSR					  ; $9578: 4A	  
	BNE $9586				; $9579: D0 0B   
loc_957B:
	LSR					  ; $957B: 4A	  
	LDY $3F				  ; $957C: A4 3F   
	.byte $07			  ; $957E - Unknown opcode
	.byte $1B			  ; $957F - Unknown opcode
	ROL $20				  ; $9580: 26 20   
	LSR					  ; $9582: 4A	  
	CMP ($0B),Y			  ; $9583: D1 0B   
	LSR					  ; $9585: 4A	  
loc_9586:
	LDA $3F				  ; $9586: A5 3F   
	.byte $07			  ; $9588 - Unknown opcode
	.byte $1B			  ; $9589 - Unknown opcode
	ROL $20				  ; $958A: 26 20   
	LSR					  ; $958C: 4A	  
	.byte $D2			  ; $958D - Unknown opcode
	.byte $0B			  ; $958E - Unknown opcode
	LSR					  ; $958F: 4A	  
	LDX $3F				  ; $9590: A6 3F   
	.byte $07			  ; $9592 - Unknown opcode
	.byte $1B			  ; $9593 - Unknown opcode
	ROL $20				  ; $9594: 26 20   
	LSR					  ; $9596: 4A	  
	.byte $D3			  ; $9597 - Unknown opcode
	.byte $0B			  ; $9598 - Unknown opcode
	.byte $12			  ; $9599 - Unknown opcode
	ORA $3F				  ; $959A: 05 3F   
	.byte $07			  ; $959C - Unknown opcode
	.byte $1B			  ; $959D - Unknown opcode
	ROL $20				  ; $959E: 26 20   
	LSR					  ; $95A0: 4A	  
	CMP $0B,X				; $95A1: D5 0B   
	LSR					  ; $95A3: 4A	  
	LDY $073F,X			  ; $95A4: BC 3F 07
	.byte $1B			  ; $95A7 - Unknown opcode
	ROL $20				  ; $95A8: 26 20   
	LSR					  ; $95AA: 4A	  
	DEC $0B,X				; $95AB: D6 0B   
	.byte $47			  ; $95AD - Unknown opcode
	.byte $7C			  ; $95AE - Unknown opcode
	.byte $3F			  ; $95AF - Unknown opcode
	.byte $07			  ; $95B0 - Unknown opcode
	.byte $1B			  ; $95B1 - Unknown opcode
	ROL $20				  ; $95B2: 26 20   
	LSR					  ; $95B4: 4A	  
	.byte $D7			  ; $95B5 - Unknown opcode
	.byte $0B			  ; $95B6 - Unknown opcode
	LSR					  ; $95B7: 4A	  
	LDA $073F,X			  ; $95B8: BD 3F 07
	.byte $1B			  ; $95BB - Unknown opcode
	ROL $20				  ; $95BC: 26 20   
	LSR					  ; $95BE: 4A	  
	.byte $DA			  ; $95BF - Unknown opcode
	.byte $0B			  ; $95C0 - Unknown opcode
	LSR					  ; $95C1: 4A	  
	LDA $3F,X				; $95C2: B5 3F   
	.byte $07			  ; $95C4 - Unknown opcode
	.byte $1B			  ; $95C5 - Unknown opcode
	ROL $20				  ; $95C6: 26 20   
	ORA ($BC,X)			  ; $95C8: 01 BC   
	LDX $0ACD				; $95CA: AE CD 0A
	.byte $0B			  ; $95CD - Unknown opcode
	LSR					  ; $95CE: 4A	  
	LDA ($3F),Y			  ; $95CF: B1 3F   
	.byte $07			  ; $95D1 - Unknown opcode
	.byte $1B			  ; $95D2 - Unknown opcode
	ROL $20				  ; $95D3: 26 20   
	LSR					  ; $95D5: 4A	  
	.byte $DF			  ; $95D6 - Unknown opcode
	.byte $0B			  ; $95D7 - Unknown opcode
	LSR					  ; $95D8: 4A	  
	LDX #$3F				 ; $95D9: A2 3F   
	.byte $07			  ; $95DB - Unknown opcode
	.byte $1B			  ; $95DC - Unknown opcode
	ROL $20				  ; $95DD: 26 20   
	LSR					  ; $95DF: 4A	  
	CPX #$0B				 ; $95E0: E0 0B   
	LSR					  ; $95E2: 4A	  
	.byte $9F			  ; $95E3 - Unknown opcode
	.byte $3F			  ; $95E4 - Unknown opcode
	.byte $07			  ; $95E5 - Unknown opcode
	.byte $1B			  ; $95E6 - Unknown opcode
	ROL $20				  ; $95E7: 26 20   
	LSR					  ; $95E9: 4A	  
	.byte $E2			  ; $95EA - Unknown opcode
	.byte $0B			  ; $95EB - Unknown opcode
	LSR					  ; $95EC: 4A	  
	LDY #$3F				 ; $95ED: A0 3F   
	.byte $07			  ; $95EF - Unknown opcode
	.byte $1B			  ; $95F0 - Unknown opcode
	ROL $20				  ; $95F1: 26 20   
	LSR					  ; $95F3: 4A	  
	CMP $4A0B,X			  ; $95F4: DD 0B 4A
	LDY $073F				; $95F7: AC 3F 07
	.byte $1B			  ; $95FA - Unknown opcode
	ROL $20				  ; $95FB: 26 20   
	LSR					  ; $95FD: 4A	  
	DEC $4A0B,X			  ; $95FE: DE 0B 4A
	.byte $A3			  ; $9601 - Unknown opcode
	.byte $3F			  ; $9602 - Unknown opcode
	BRK					  ; $9603: 00	  
	TXS					  ; $9604: 9A	  
	LDA #$3F				 ; $9605: A9 3F   
	.byte $07			  ; $9607 - Unknown opcode
	ASL ptr0_hi,X			; $9608: 16 05   
	EOR $C3				  ; $960A: 45 C3   
	.byte $0B			  ; $960C - Unknown opcode
	EOR $D7				  ; $960D: 45 D7   
	.byte $3F			  ; $960F - Unknown opcode
	.byte $07			  ; $9610 - Unknown opcode
	.byte $1B			  ; $9611 - Unknown opcode
	ORA $4A01,X			  ; $9612: 1D 01 4A
	.byte $7F			  ; $9615 - Unknown opcode
	.byte $0B			  ; $9616 - Unknown opcode
	LSR					  ; $9617: 4A	  
	ADC $073F				; $9618: 6D 3F 07 ; Arithmetic
	.byte $1B			  ; $961B - Unknown opcode
	ORA $4A01,X			  ; $961C: 1D 01 4A
	.byte $80			  ; $961F - Unknown opcode
	.byte $0B			  ; $9620 - Unknown opcode
	.byte $47			  ; $9621 - Unknown opcode
	.byte $44			  ; $9622 - Unknown opcode
	.byte $3F			  ; $9623 - Unknown opcode
	.byte $07			  ; $9624 - Unknown opcode
	.byte $1B			  ; $9625 - Unknown opcode
	ORA $4A01,X			  ; $9626: 1D 01 4A
	STA ($0B,X)			  ; $9629: 81 0B   
	LSR					  ; $962B: 4A	  
	.byte $6F			  ; $962C - Unknown opcode
	.byte $3F			  ; $962D - Unknown opcode
	.byte $07			  ; $962E - Unknown opcode
	.byte $1B			  ; $962F - Unknown opcode
	PHP					  ; $9630: 08	  
	.byte $80			  ; $9631 - Unknown opcode
	ASL $45				  ; $9632: 06 45   
	.byte $C7			  ; $9634 - Unknown opcode
	.byte $47			  ; $9635 - Unknown opcode
	STA $0B3E,Y			  ; $9636: 99 3E 0B
	.byte $47			  ; $9639 - Unknown opcode
	TXS					  ; $963A: 9A	  
	.byte $47			  ; $963B - Unknown opcode
	.byte $9B			  ; $963C - Unknown opcode
	.byte $3F			  ; $963D - Unknown opcode
	BRK					  ; $963E: 00	  
	.byte $17			  ; $963F - Unknown opcode
	BCS $9681				; $9640: B0 3F   
	.byte $34			  ; $9642 - Unknown opcode
	.byte $80			  ; $9643 - Unknown opcode
	.byte $37			  ; $9644 - Unknown opcode
	.byte $80			  ; $9645 - Unknown opcode
	.byte $3A			  ; $9646 - Unknown opcode
	.byte $80			  ; $9647 - Unknown opcode
	AND $5880,X			  ; $9648: 3D 80 58
	.byte $80			  ; $964B - Unknown opcode
	.byte $72			  ; $964C - Unknown opcode
	.byte $80			  ; $964D - Unknown opcode
	.byte $82			  ; $964E - Unknown opcode
	.byte $80			  ; $964F - Unknown opcode
	STA $A080				; $9650: 8D 80 A0
	.byte $80			  ; $9653 - Unknown opcode
	LDX $D680,Y			  ; $9654: BE 80 D6
	.byte $80			  ; $9657 - Unknown opcode
	CPX $80				  ; $9658: E4 80   
	NOP					  ; $965A: EA	  
	.byte $80			  ; $965B - Unknown opcode
	INC $1180,X			  ; $965C: FE 80 11
	STA ($25,X)			  ; $965F: 81 25   
	STA ($2B,X)			  ; $9661: 81 2B   
	STA ($2E,X)			  ; $9663: 81 2E   
	STA ($31,X)			  ; $9665: 81 31   
	STA ($3B,X)			  ; $9667: 81 3B   
	STA ($7E,X)			  ; $9669: 81 7E   
	STA ($8D,X)			  ; $966B: 81 8D   
	STA ($A5,X)			  ; $966D: 81 A5   
	STA ($AE,X)			  ; $966F: 81 AE   
	STA ($CA,X)			  ; $9671: 81 CA   
	STA ($D0,X)			  ; $9673: 81 D0   
	STA ($D9,X)			  ; $9675: 81 D9   
	STA ($0E,X)			  ; $9677: 81 0E   
	.byte $82			  ; $9679 - Unknown opcode
	AND $4382,X			  ; $967A: 3D 82 43
	.byte $82			  ; $967D - Unknown opcode
	JMP $5682				; $967E: 4C 82 56
loc_9681:
	.byte $82			  ; $9681 - Unknown opcode
	RTS					  ; $9682: 60	  
	.byte $82			  ; $9683 - Unknown opcode
	.byte $87			  ; $9684 - Unknown opcode
	.byte $82			  ; $9685 - Unknown opcode
	STA $B782				; $9686: 8D 82 B7
	.byte $82			  ; $9689 - Unknown opcode
	CMP ($82,X)			  ; $968A: C1 82   
	.byte $CB			  ; $968C - Unknown opcode
	.byte $82			  ; $968D - Unknown opcode
	.byte $DA			  ; $968E - Unknown opcode
	.byte $82			  ; $968F - Unknown opcode
	.byte $E3			  ; $9690 - Unknown opcode
	.byte $82			  ; $9691 - Unknown opcode
	SBC ($82),Y			  ; $9692: F1 82	; Arithmetic
	.byte $02			  ; $9694 - Unknown opcode
	.byte $83			  ; $9695 - Unknown opcode
	.byte $0C			  ; $9696 - Unknown opcode
	.byte $83			  ; $9697 - Unknown opcode
	ASL $83,X				; $9698: 16 83   
	JSR $2F83				; $969A: 20 83 2F
	.byte $83			  ; $969D - Unknown opcode
	AND $3F83,Y			  ; $969E: 39 83 3F
	.byte $83			  ; $96A1 - Unknown opcode
	.byte $5A			  ; $96A2 - Unknown opcode
	.byte $83			  ; $96A3 - Unknown opcode
	ADC ($83),Y			  ; $96A4: 71 83	; Arithmetic
	.byte $7F			  ; $96A6 - Unknown opcode
	.byte $83			  ; $96A7 - Unknown opcode
	.byte $93			  ; $96A8 - Unknown opcode
	.byte $83			  ; $96A9 - Unknown opcode
	LDY $83				  ; $96AA: A4 83   
	LDX $B783				; $96AC: AE 83 B7
	.byte $83			  ; $96AF - Unknown opcode
	CPY #$83				 ; $96B0: C0 83   
	CMP $F583,Y			  ; $96B2: D9 83 F5
	.byte $83			  ; $96B5 - Unknown opcode
	INC $0783,X			  ; $96B6: FE 83 07
	STY $11				  ; $96B9: 84 11   
	STY $2C				  ; $96BB: 84 2C   
	STY $36				  ; $96BD: 84 36   
	STY $53				  ; $96BF: 84 53   
	STY $57				  ; $96C1: 84 57   
	STY $5B				  ; $96C3: 84 5B   
	STY $5F				  ; $96C5: 84 5F   
	STY $6A				  ; $96C7: 84 6A   
	STY $6D				  ; $96C9: 84 6D   
	STY $76				  ; $96CB: 84 76   
	STY $B6				  ; $96CD: 84 B6   
	STY $E8				  ; $96CF: 84 E8   
	STY ptr1_hi			  ; $96D1: 84 07   
	STA $16				  ; $96D3: 85 16   
	STA $25				  ; $96D5: 85 25   
	STA $43				  ; $96D7: 85 43   
	STA $5D				  ; $96D9: 85 5D   
	STA $66				  ; $96DB: 85 66   
	STA $95				  ; $96DD: 85 95   
	STA $DE				  ; $96DF: 85 DE   
	STA $F8				  ; $96E1: 85 F8   
	STA $0D				  ; $96E3: 85 0D   
	STX $57				  ; $96E5: 86 57   
	STX $61				  ; $96E7: 86 61   
	STX $82				  ; $96E9: 86 82   
	STX $99				  ; $96EB: 86 99   
	STX $B4				  ; $96ED: 86 B4   
	STX $BD				  ; $96EF: 86 BD   
	STX $E1				  ; $96F1: 86 E1   
	STX $F1				  ; $96F3: 86 F1   
	STX $FD				  ; $96F5: 86 FD   
	STX $2E				  ; $96F7: 86 2E   
	.byte $87			  ; $96F9 - Unknown opcode
	LSR $87				  ; $96FA: 46 87   
	.byte $4F			  ; $96FC - Unknown opcode
	.byte $87			  ; $96FD - Unknown opcode
	.byte $5F			  ; $96FE - Unknown opcode
loc_96FF:
	.byte $87			  ; $96FF - Unknown opcode
	ROR					  ; $9700: 6A	  
	.byte $87			  ; $9701 - Unknown opcode
	SEI					  ; $9702: 78	  
	.byte $87			  ; $9703 - Unknown opcode
	DEY					  ; $9704: 88	  
	.byte $87			  ; $9705 - Unknown opcode
	TYA					  ; $9706: 98	  
	.byte $87			  ; $9707 - Unknown opcode
	LDA ($87,X)			  ; $9708: A1 87   
	TAX					  ; $970A: AA	  
	.byte $87			  ; $970B - Unknown opcode
	CPY #$87				 ; $970C: C0 87   
	SBC $F987				; $970E: ED 87 F9 ; Arithmetic
	.byte $87			  ; $9711 - Unknown opcode
loc_9712:
	.byte $02			  ; $9712 - Unknown opcode
	DEY					  ; $9713: 88	  
	.byte $0B			  ; $9714 - Unknown opcode
	DEY					  ; $9715: 88	  
	ORA $88,X				; $9716: 15 88   
	.byte $22			  ; $9718 - Unknown opcode
	DEY					  ; $9719: 88	  
	.byte $5B			  ; $971A - Unknown opcode
	DEY					  ; $971B: 88	  
	JMP ($7488)			  ; $971C: 6C 88 74
	DEY					  ; $971F: 88	  
	CMP $FD88,X			  ; $9720: DD 88 FD
	DEY					  ; $9723: 88	  
	.byte $13			  ; $9724 - Unknown opcode
	.byte $89			  ; $9725 - Unknown opcode
	.byte $1C			  ; $9726 - Unknown opcode
	.byte $89			  ; $9727 - Unknown opcode
	.byte $3B			  ; $9728 - Unknown opcode
	.byte $89			  ; $9729 - Unknown opcode
	ROR					  ; $972A: 6A	  
	.byte $89			  ; $972B - Unknown opcode
	.byte $7B			  ; $972C - Unknown opcode
	.byte $89			  ; $972D - Unknown opcode
	.byte $8B			  ; $972E - Unknown opcode
	.byte $89			  ; $972F - Unknown opcode
	.byte $A3			  ; $9730 - Unknown opcode
	.byte $89			  ; $9731 - Unknown opcode
	LDA #$89				 ; $9732: A9 89   
	CPY #$89				 ; $9734: C0 89   
	INY					  ; $9736: C8	  
	.byte $89			  ; $9737 - Unknown opcode
	DEC $D189				; $9738: CE 89 D1
	.byte $89			  ; $973B - Unknown opcode
	.byte $E3			  ; $973C - Unknown opcode
	.byte $89			  ; $973D - Unknown opcode
	SED					  ; $973E: F8	  
	.byte $89			  ; $973F - Unknown opcode
	BPL $96CC				; $9740: 10 8A   
	.byte $1A			  ; $9742 - Unknown opcode
	TXA					  ; $9743: 8A	  
	.byte $3C			  ; $9744 - Unknown opcode
	TXA					  ; $9745: 8A	  
	ROR $8A				  ; $9746: 66 8A   
	BVS $96D4				; $9748: 70 8A   
	.byte $7A			  ; $974A - Unknown opcode
	TXA					  ; $974B: 8A	  
	.byte $9C			  ; $974C - Unknown opcode
	TXA					  ; $974D: 8A	  
	LDX $8A				  ; $974E: A6 8A   
	BCS $96DC				; $9750: B0 8A   
	CMP $8A				  ; $9752: C5 8A   
	CPX #$8A				 ; $9754: E0 8A   
	INX					  ; $9756: E8	  
	TXA					  ; $9757: 8A	  
	BEQ $96E4				; $9758: F0 8A   
	SBC $038A,Y			  ; $975A: F9 8A 03 ; Arithmetic
	.byte $8B			  ; $975D - Unknown opcode
	ORA $178B				; $975E: 0D 8B 17
	.byte $8B			  ; $9761 - Unknown opcode
	JSR $3D8B				; $9762: 20 8B 3D
	.byte $8B			  ; $9765 - Unknown opcode
	JMP $568B				; $9766: 4C 8B 56
	.byte $8B			  ; $9769 - Unknown opcode
	.byte $5C			  ; $976A - Unknown opcode
	.byte $8B			  ; $976B - Unknown opcode
	.byte $62			  ; $976C - Unknown opcode
	.byte $8B			  ; $976D - Unknown opcode
	ROR $8B				  ; $976E: 66 8B   
	DEY					  ; $9770: 88	  
	.byte $8B			  ; $9771 - Unknown opcode
	BCC $96FF				; $9772: 90 8B   
	TXS					  ; $9774: 9A	  
	.byte $8B			  ; $9775 - Unknown opcode
	LDY $8B				  ; $9776: A4 8B   
	.byte $C2			  ; $9778 - Unknown opcode
	.byte $8B			  ; $9779 - Unknown opcode
	.byte $CF			  ; $977A - Unknown opcode
	.byte $8B			  ; $977B - Unknown opcode
	CLD					  ; $977C: D8	  
	.byte $8B			  ; $977D - Unknown opcode
	SBC #$8B				 ; $977E: E9 8B	; Arithmetic
	.byte $F3			  ; $9780 - Unknown opcode
	.byte $8B			  ; $9781 - Unknown opcode
	ASL $8C				  ; $9782: 06 8C   
	BPL $9712				; $9784: 10 8C   
	.byte $1A			  ; $9786 - Unknown opcode
	STY $8C24				; $9787: 8C 24 8C
	ROL $408C				; $978A: 2E 8C 40
	STY $8C4A				; $978D: 8C 4A 8C
	.byte $57			  ; $9790 - Unknown opcode
	STY $8C73				; $9791: 8C 73 8C
	ADC $8A8C,X			  ; $9794: 7D 8C 8A ; Arithmetic
	STY $8CB3				; $9797: 8C B3 8C
	LDY $C88C,X			  ; $979A: BC 8C C8
	STY $8CD2				; $979D: 8C D2 8C
	INX					  ; $97A0: E8	  
	STY $8CF2				; $97A1: 8C F2 8C
loc_97A4:
	.byte $FC			  ; $97A4 - Unknown opcode
	STY $8D10				; $97A5: 8C 10 8D
	CLC					  ; $97A8: 18	  
	STA $8D26				; $97A9: 8D 26 8D
	SEC					  ; $97AC: 38	  
	STA $8D47				; $97AD: 8D 47 8D
loc_97B0:
	.byte $57			  ; $97B0 - Unknown opcode
	STA $8D6B				; $97B1: 8D 6B 8D
	.byte $7F			  ; $97B4 - Unknown opcode
	STA $8D89				; $97B5: 8D 89 8D
loc_97B8:
	TYA					  ; $97B8: 98	  
	STA $8DB4				; $97B9: 8D B4 8D
	LDA $C68D,X			  ; $97BC: BD 8D C6
	STA $8DD6				; $97BF: 8D D6 8D
	SBC #$8D				 ; $97C2: E9 8D	; Arithmetic
loc_97C4:
	.byte $EF			  ; $97C4 - Unknown opcode
	STA $8DFF				; $97C5: 8D FF 8D
	.byte $1C			  ; $97C8 - Unknown opcode
	STX $8E22				; $97C9: 8E 22 8E
	ROL					  ; $97CC: 2A	  
	STX $8E33				; $97CD: 8E 33 8E
loc_97D0:
	.byte $3C			  ; $97D0 - Unknown opcode
	STX $8E45				; $97D1: 8E 45 8E
	LSR $618E				; $97D4: 4E 8E 61
	STX $8E6A				; $97D7: 8E 6A 8E
	.byte $73			  ; $97DA - Unknown opcode
loc_97DB:
	STX $8E84				; $97DB: 8E 84 8E
	STA $AD8E				; $97DE: 8D 8E AD
	STX $8EB6				; $97E1: 8E B6 8E
	.byte $BF			  ; $97E4 - Unknown opcode
	STX $8EC8				; $97E5: 8E C8 8E
	CMP $E38E,X			  ; $97E8: DD 8E E3
loc_97EB:
	STX $8EEC				; $97EB: 8E EC 8E
	ORA $8F,X				; $97EE: 15 8F   
	JSR $338F				; $97F0: 20 8F 33
	.byte $8F			  ; $97F3 - Unknown opcode
	AND $4D8F,Y			  ; $97F4: 39 8F 4D
	.byte $8F			  ; $97F7 - Unknown opcode
	LSR $8F,X				; $97F8: 56 8F   
	ADC #$8F				 ; $97FA: 69 8F	; Arithmetic
	.byte $7C			  ; $97FC - Unknown opcode
	.byte $8F			  ; $97FD - Unknown opcode
	TXA					  ; $97FE: 8A	  
	.byte $8F			  ; $97FF - Unknown opcode
	STA $B78F,X			  ; $9800: 9D 8F B7
	.byte $8F			  ; $9803 - Unknown opcode
	.byte $C7			  ; $9804 - Unknown opcode
	.byte $8F			  ; $9805 - Unknown opcode
	DEC $8F,X				; $9806: D6 8F   
	SBC $FB8F				; $9808: ED 8F FB ; Arithmetic
	.byte $8F			  ; $980B - Unknown opcode
	ASL $1990				; $980C: 0E 90 19
loc_980F:
	BCC $9833				; $980F: 90 22   
	BCC $983D				; $9811: 90 2A   
	BCC $9848				; $9813: 90 33   
	BCC $9858				; $9815: 90 41   
	BCC $9868				; $9817: 90 4F   
	BCC $9878				; $9819: 90 5D   
	BCC $988B				; $981B: 90 6E   
	BCC $989C				; $981D: 90 7D   
	BCC $97A4				; $981F: 90 83   
	BCC $97B0				; $9821: 90 8D   
	BCC $97B8				; $9823: 90 93   
	BCC $97C4				; $9825: 90 9D   
	BCC $97D0				; $9827: 90 A7   
	BCC $97DB				; $9829: 90 B0   
	BCC $97EB				; $982B: 90 BE   
loc_982D:
	BCC $97F6				; $982D: 90 C7   
	BCC $980F				; $982F: 90 DE   
	BCC $982D				; $9831: 90 FA   
loc_9833:
	BCC $9842				; $9833: 90 0D   
	STA ($16),Y			  ; $9835: 91 16   
	STA (system_flags),Y	 ; $9837: 91 1F   
	STA ($28),Y			  ; $9839: 91 28   
	STA ($34),Y			  ; $983B: 91 34   
loc_983D:
	STA ($51),Y			  ; $983D: 91 51   
	STA (map_number),Y	   ; $983F: 91 63   
	STA ($87),Y			  ; $9841: 91 87   
	STA ($97),Y			  ; $9843: 91 97   
	STA ($A7),Y			  ; $9845: 91 A7   
	STA ($B7),Y			  ; $9847: 91 B7   
	STA ($C7),Y			  ; $9849: 91 C7   
	STA ($D5),Y			  ; $984B: 91 D5   
	STA ($E3),Y			  ; $984D: 91 E3   
	STA ($FE),Y			  ; $984F: 91 FE   
	STA (ptr1_hi),Y		  ; $9851: 91 07   
	.byte $92			  ; $9853 - Unknown opcode
	ORA $92,X				; $9854: 15 92   
	PLP					  ; $9856: 28	  
	.byte $92			  ; $9857 - Unknown opcode
loc_9858:
	AND ($92),Y			  ; $9858: 31 92   
	.byte $44			  ; $985A - Unknown opcode
	.byte $92			  ; $985B - Unknown opcode
	EOR $5692				; $985C: 4D 92 56
	.byte $92			  ; $985F - Unknown opcode
	.byte $64			  ; $9860 - Unknown opcode
	.byte $92			  ; $9861 - Unknown opcode
	.byte $72			  ; $9862 - Unknown opcode
	.byte $92			  ; $9863 - Unknown opcode
	.byte $7A			  ; $9864 - Unknown opcode
	.byte $92			  ; $9865 - Unknown opcode
	.byte $83			  ; $9866 - Unknown opcode
	.byte $92			  ; $9867 - Unknown opcode
loc_9868:
	STY $9B92				; $9868: 8C 92 9B
	.byte $92			  ; $986B - Unknown opcode
	TAX					  ; $986C: AA	  
	.byte $92			  ; $986D - Unknown opcode
	CLV					  ; $986E: B8	  
	.byte $92			  ; $986F - Unknown opcode
	DEX					  ; $9870: CA	  
	.byte $92			  ; $9871 - Unknown opcode
	.byte $D3			  ; $9872 - Unknown opcode
	.byte $92			  ; $9873 - Unknown opcode
	.byte $E2			  ; $9874 - Unknown opcode
	.byte $92			  ; $9875 - Unknown opcode
	.byte $EB			  ; $9876 - Unknown opcode
	.byte $92			  ; $9877 - Unknown opcode
loc_9878:
	.byte $F4			  ; $9878 - Unknown opcode
	.byte $92			  ; $9879 - Unknown opcode
	.byte $FA			  ; $987A - Unknown opcode
	.byte $92			  ; $987B - Unknown opcode
	ORA #$93				 ; $987C: 09 93   
	BIT $93				  ; $987E: 24 93   
	AND $93,X				; $9880: 35 93   
	LSR $93				  ; $9882: 46 93   
	ADC ($93,X)			  ; $9884: 61 93	; Arithmetic
	.byte $73			  ; $9886 - Unknown opcode
	.byte $93			  ; $9887 - Unknown opcode
	.byte $83			  ; $9888 - Unknown opcode
	.byte $93			  ; $9889 - Unknown opcode
	TXS					  ; $988A: 9A	  
loc_988B:
	.byte $93			  ; $988B - Unknown opcode
	LDY $93				  ; $988C: A4 93   
	TAX					  ; $988E: AA	  
	.byte $93			  ; $988F - Unknown opcode
	LDX $C193				; $9890: AE 93 C1
	.byte $93			  ; $9893 - Unknown opcode
	CMP $EA93,Y			  ; $9894: D9 93 EA
	.byte $93			  ; $9897 - Unknown opcode
	.byte $F4			  ; $9898 - Unknown opcode
	.byte $93			  ; $9899 - Unknown opcode
	ORA $94				  ; $989A: 05 94   
loc_989C:
	AND $4394,Y			  ; $989C: 39 94 43
	STY $4D,X				; $989F: 94 4D   
	STY $5C,X				; $98A1: 94 5C   
	STY $6B,X				; $98A3: 94 6B   
	STY $75,X				; $98A5: 94 75   
	STY $7F,X				; $98A7: 94 7F   
	STY $85,X				; $98A9: 94 85   
	STY $92,X				; $98AB: 94 92   
	STY $A6,X				; $98AD: 94 A6   
	STY $B6,X				; $98AF: 94 B6   
	STY $C3,X				; $98B1: 94 C3   
	STY $D0,X				; $98B3: 94 D0   
	STY $E0,X				; $98B5: 94 E0   
	STY $E6,X				; $98B7: 94 E6   
	STY $FA,X				; $98B9: 94 FA   
	STY tmp0,X			   ; $98BB: 94 00   
	STA ptr1_lo,X			; $98BD: 95 06   
	STA $0E,X				; $98BF: 95 0E   
	STA $1E,X				; $98C1: 95 1E   
	STA $2B,X				; $98C3: 95 2B   
	STA $41,X				; $98C5: 95 41   
	STA $4E,X				; $98C7: 95 4E   
	STA $61,X				; $98C9: 95 61   
	STA $74,X				; $98CB: 95 74   
	STA $7E,X				; $98CD: 95 7E   
	STA $88,X				; $98CF: 95 88   
	STA $92,X				; $98D1: 95 92   
	STA $9C,X				; $98D3: 95 9C   
	STA $A6,X				; $98D5: 95 A6   
	STA $B0,X				; $98D7: 95 B0   
	STA $BA,X				; $98D9: 95 BA   
	STA $C4,X				; $98DB: 95 C4   
	STA $D1,X				; $98DD: 95 D1   
	STA $DB,X				; $98DF: 95 DB   
	STA $E5,X				; $98E1: 95 E5   
	STA $EF,X				; $98E3: 95 EF   
	STA $F9,X				; $98E5: 95 F9   
	STA tmp3,X			   ; $98E7: 95 03   
	STX ptr1_hi,Y			; $98E9: 96 07   
	STX $10,Y				; $98EB: 96 10   
	STX $1A,Y				; $98ED: 96 1A   
	STX $24,Y				; $98EF: 96 24   
	STX $2E,Y				; $98F1: 96 2E   
	STX $3E,Y				; $98F3: 96 3E   
	STX $42,Y				; $98F5: 96 42   
	STX $20,Y				; $98F7: 96 20   
	AND $99				  ; $98F9: 25 99   
	LDA $E7				  ; $98FB: A5 E7   
	CMP #$01				 ; $98FD: C9 01	; Compare with 1
	BEQ $9910				; $98FF: F0 0F   
	BIT $E7				  ; $9901: 24 E7   
	BMI $990B				; $9903: 30 06   
	JSR $C8CC				; $9905: 20 CC C8 ; Call to fixed bank
	JMP $D1F3				; $9908: 4C F3 D1
loc_990B:
	BVS $9913				; $990B: 70 06   
loc_990D:
	JSR $D218				; $990D: 20 18 D2 ; Call to fixed bank
loc_9910:
	JMP $D1F3				; $9910: 4C F3 D1
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
	TYA					  ; $991B: 98	  
	PHA					  ; $991C: 48	  
	LDA tmp0				 ; $991D: A5 00   
	BRK					  ; $991F: 00	  
	.byte $04			  ; $9920 - Unknown opcode
	.byte $6F			  ; $9921 - Unknown opcode
	PLA					  ; $9922: 68	  
	TAY					  ; $9923: A8	  
	RTS					  ; $9924: 60	  
	LDX #$00				 ; $9925: A2 00   
	STX $E7				  ; $9927: 86 E7   
	STX $FD				  ; $9929: 86 FD   
	STX $FE				  ; $992B: 86 FE   
	STX $FF				  ; $992D: 86 FF   
	STY $E9				  ; $992F: 84 E9   
	STA $E8				  ; $9931: 85 E8   
	SEC					  ; $9933: 38	  
	SBC #$06				 ; $9934: E9 06	; Arithmetic
	BRK					  ; $9936: 00	  
	ORA ($CF,X)			  ; $9937: 01 CF   
	JSR $B0BB				; $9939: 20 BB B0 ; -> sub_B0BB
	JSR $9956				; $993C: 20 56 99 ; -> sub_9956
	JSR $B0E6				; $993F: 20 E6 B0 ; -> sub_B0E6
	JSR $9962				; $9942: 20 62 99 ; -> sub_9962
	LDA tmp0				 ; $9945: A5 00   
	SEC					  ; $9947: 38	  
	SBC #$61				 ; $9948: E9 61	; Arithmetic
	STA tmp0				 ; $994A: 85 00   
	LDA tmp1				 ; $994C: A5 01   
	SBC #$01				 ; $994E: E9 01	; Arithmetic
	TAX					  ; $9950: AA	  
	LDA tmp0				 ; $9951: A5 00   
	JMP $9914				; $9953: 4C 14 99

; ---- Subroutine at $9956 (Bank 21) ----
sub_9956:
	PHA					  ; $9956: 48	  
	BRK					  ; $9957: 00	  
	LSR $EF				  ; $9958: 46 EF   
	STA $F9				  ; $995A: 85 F9   
	STA $FA				  ; $995C: 85 FA   
	STA $FB				  ; $995E: 85 FB   
	PLA					  ; $9960: 68	  
	RTS					  ; $9961: 60	  

; ---- Subroutine at $9962 (Bank 21) ----
sub_9962:
	LDA tmp1				 ; $9962: A5 01   
	BNE $9972				; $9964: D0 0C   
	LDA tmp0				 ; $9966: A5 00   
	CMP #$07				 ; $9968: C9 07	; Compare with 7
	BCS $9972				; $996A: B0 06   
	JSR $9CBF				; $996C: 20 BF 9C ; -> sub_9CBF
	PLA					  ; $996F: 68	  
	PLA					  ; $9970: 68	  
	RTS					  ; $9971: 60	  
loc_9972:
	JSR $B7FB				; $9972: 20 FB B7 ; -> sub_B7FB
	LDA tmp0				 ; $9975: A5 00   
	CMP #$61				 ; $9977: C9 61	; Compare with 97
	LDA tmp1				 ; $9979: A5 01   
	SBC #$01				 ; $997B: E9 01	; Arithmetic
	BCS $9984				; $997D: B0 05   
	PLA					  ; $997F: 68	  
	PLA					  ; $9980: 68	  
	JMP $999E				; $9981: 4C 9E 99
loc_9984:
	LDA tmp0				 ; $9984: A5 00   
	CMP #$61				 ; $9986: C9 61	; Compare with 97
	LDA tmp1				 ; $9988: A5 01   
	SBC #$01				 ; $998A: E9 01	; Arithmetic
	BCC $999D				; $998C: 90 0F   
	LDA tmp0				 ; $998E: A5 00   
	CMP #$79				 ; $9990: C9 79	; Compare with 121
	LDA tmp1				 ; $9992: A5 01   
	SBC #$01				 ; $9994: E9 01	; Arithmetic
	BPL $999D				; $9996: 10 05   
	JSR $9C92				; $9998: 20 92 9C ; -> sub_9C92
	PLA					  ; $999B: 68	  
	PLA					  ; $999C: 68	  
loc_999D:
	RTS					  ; $999D: 60	  
loc_999E:
	LDA tmp0				 ; $999E: A5 00   
	SEC					  ; $99A0: 38	  
	SBC #$07				 ; $99A1: E9 07	; Arithmetic
	STA tmp0				 ; $99A3: 85 00   
	BCS $99A9				; $99A5: B0 02   
	DEC tmp1				 ; $99A7: C6 01   
loc_99A9:
	ASL tmp0				 ; $99A9: 06 00   
	ROL tmp1				 ; $99AB: 26 01   
	LDA tmp0				 ; $99AD: A5 00   
	CLC					  ; $99AF: 18	  
	ADC $98F6				; $99B0: 6D F6 98 ; Arithmetic
	STA tmp0				 ; $99B3: 85 00   
	LDA tmp1				 ; $99B5: A5 01   
	ADC $98F7				; $99B7: 6D F7 98 ; Arithmetic
	STA tmp1				 ; $99BA: 85 01   
	LDY #$01				 ; $99BC: A0 01   
	LDA (tmp0),Y			 ; $99BE: B1 00   
	STA $DB				  ; $99C0: 85 DB   
	DEY					  ; $99C2: 88	  
	LDA (tmp0),Y			 ; $99C3: B1 00   
	STA $DA				  ; $99C5: 85 DA   
	LDA #$FF				 ; $99C7: A9 FF   
	STA $DC				  ; $99C9: 85 DC   
	JMP $9BA8				; $99CB: 4C A8 9B

; ---- Subroutine at $99CE (Bank 21) ----
sub_99CE:
	LDA ($DA),Y			  ; $99CE: B1 DA   
	BMI $99D6				; $99D0: 30 04   
	LDX #$00				 ; $99D2: A2 00   
	BEQ $99D8				; $99D4: F0 02   
loc_99D6:
	LDX #$FF				 ; $99D6: A2 FF   
loc_99D8:
	STX $DC				  ; $99D8: 86 DC   
	INY					  ; $99DA: C8	  
	AND #$3F				 ; $99DB: 29 3F   
	CMP #$11				 ; $99DD: C9 11	; Compare with 17
	BNE $99E7				; $99DF: D0 06   
	JSR $9A8C				; $99E1: 20 8C 9A ; -> sub_9A8C
	JMP $9A4C				; $99E4: 4C 4C 9A
loc_99E7:
	CMP #$02				 ; $99E7: C9 02	; Compare with 2
	BNE $99F1				; $99E9: D0 06   
	JSR $9A93				; $99EB: 20 93 9A ; -> sub_9A93
	JMP $9A4C				; $99EE: 4C 4C 9A
loc_99F1:
	CMP #$1E				 ; $99F1: C9 1E	; Compare with 30
	BNE $99FB				; $99F3: D0 06   
	JSR $9AC3				; $99F5: 20 C3 9A ; -> sub_9AC3
	JMP $9A4C				; $99F8: 4C 4C 9A
loc_99FB:
	CMP #$05				 ; $99FB: C9 05	; Compare with 5
	BNE $9A05				; $99FD: D0 06   
	JSR $9AC9				; $99FF: 20 C9 9A ; -> sub_9AC9
	JMP $9A4C				; $9A02: 4C 4C 9A
loc_9A05:
	CMP #$13				 ; $9A05: C9 13	; Compare with 19
	BNE $9A0F				; $9A07: D0 06   
	JSR $9AD1				; $9A09: 20 D1 9A ; -> sub_9AD1
	JMP $9A4C				; $9A0C: 4C 4C 9A
loc_9A0F:
	CMP #$03				 ; $9A0F: C9 03	; Compare with 3
	BNE $9A19				; $9A11: D0 06   
	JSR $9AF5				; $9A13: 20 F5 9A ; -> sub_9AF5
	JMP $9A4C				; $9A16: 4C 4C 9A
loc_9A19:
	CMP #$14				 ; $9A19: C9 14	; Compare with 20
	BNE $9A23				; $9A1B: D0 06   
	JSR $9B09				; $9A1D: 20 09 9B ; -> sub_9B09
	JMP $9A4C				; $9A20: 4C 4C 9A
loc_9A23:
	CMP #$16				 ; $9A23: C9 16	; Compare with 22
	BNE $9A2D				; $9A25: D0 06   
	JSR $9B10				; $9A27: 20 10 9B ; -> sub_9B10
	JMP $9A4C				; $9A2A: 4C 4C 9A
loc_9A2D:
	CMP #$1B				 ; $9A2D: C9 1B	; Compare with 27
	BNE $9A37				; $9A2F: D0 06   
	JSR $9A96				; $9A31: 20 96 9A ; -> sub_9A96
	JMP $9A4C				; $9A34: 4C 4C 9A
loc_9A37:
	CMP #$1C				 ; $9A37: C9 1C	; Compare with 28
	BNE $9A41				; $9A39: D0 06   
	JSR $9AA3				; $9A3B: 20 A3 9A ; -> sub_9AA3
	JMP $9A4C				; $9A3E: 4C 4C 9A
loc_9A41:
	CMP #$1A				 ; $9A41: C9 1A	; Compare with 26
	BNE $9A4B				; $9A43: D0 06   
	JSR $9AB0				; $9A45: 20 B0 9A ; -> sub_9AB0
	JMP $9A4C				; $9A48: 4C 4C 9A
loc_9A4B:
	RTS					  ; $9A4B: 60	  
loc_9A4C:
	LDX $DC				  ; $9A4C: A6 DC   
	BNE $9A56				; $9A4E: D0 06   
	CMP #$00				 ; $9A50: C9 00	; Compare with 0
	BNE $9A6A				; $9A52: D0 16   
	BEQ $9A5A				; $9A54: F0 04   
loc_9A56:
	CMP #$00				 ; $9A56: C9 00	; Compare with 0
	BEQ $9A6A				; $9A58: F0 10   
loc_9A5A:
	JSR $9A7B				; $9A5A: 20 7B 9A ; -> sub_9A7B
	JSR $9BA8				; $9A5D: 20 A8 9B ; -> sub_9BA8
	LDA ($DA),Y			  ; $9A60: B1 DA   
	CMP #$0B				 ; $9A62: C9 0B	; Compare with 11
	BNE $9A7A				; $9A64: D0 14   
	INY					  ; $9A66: C8	  
	JMP $9B1D				; $9A67: 4C 1D 9B
loc_9A6A:
	JSR $9B1D				; $9A6A: 20 1D 9B ; -> sub_9B1D
	LDA ($DA),Y			  ; $9A6D: B1 DA   
	CMP #$0B				 ; $9A6F: C9 0B	; Compare with 11
	BNE $9A7A				; $9A71: D0 07   
	INY					  ; $9A73: C8	  
	JSR $9A7B				; $9A74: 20 7B 9A ; -> sub_9A7B
	JSR $9BA8				; $9A77: 20 A8 9B ; -> sub_9BA8
loc_9A7A:
	RTS					  ; $9A7A: 60	  

; ---- Subroutine at $9A7B (Bank 21) ----
sub_9A7B:
	LDA ($DA),Y			  ; $9A7B: B1 DA   
	CMP #$06				 ; $9A7D: C9 06	; Compare with 6
	BEQ $9A86				; $9A7F: F0 05   
	LDA #$00				 ; $9A81: A9 00   
	STA $DC				  ; $9A83: 85 DC   
	RTS					  ; $9A85: 60	  
loc_9A86:
	INY					  ; $9A86: C8	  
	LDA #$FF				 ; $9A87: A9 FF   
	STA $DC				  ; $9A89: 85 DC   
	RTS					  ; $9A8B: 60	  

; ---- Subroutine at $9A8C (Bank 21) ----
sub_9A8C:
	LDA ($DA),Y			  ; $9A8C: B1 DA   
	INY					  ; $9A8E: C8	  
	JSR $A769				; $9A8F: 20 69 A7 ; -> sub_A769
	RTS					  ; $9A92: 60	  

; ---- Subroutine at $9A93 (Bank 21) ----
sub_9A93:
	LDA $E9				  ; $9A93: A5 E9   
	RTS					  ; $9A95: 60	  

; ---- Subroutine at $9A96 (Bank 21) ----
sub_9A96:
	LDA ($DA),Y			  ; $9A96: B1 DA   
	INY					  ; $9A98: C8	  
	TAX					  ; $9A99: AA	  
	LDA ($DA),Y			  ; $9A9A: B1 DA   
	AND $627B,X			  ; $9A9C: 3D 7B 62
	BNE $9ABF				; $9A9F: D0 1E   
	BEQ $9ABB				; $9AA1: F0 18   

; ---- Subroutine at $9AA3 (Bank 21) ----
sub_9AA3:
	LDA ($DA),Y			  ; $9AA3: B1 DA   
	INY					  ; $9AA5: C8	  
	TAX					  ; $9AA6: AA	  
	LDA ($DA),Y			  ; $9AA7: B1 DA   
	ORA $627B,X			  ; $9AA9: 1D 7B 62
	BNE $9ABF				; $9AAC: D0 11   
	BEQ $9ABB				; $9AAE: F0 0B   

; ---- Subroutine at $9AB0 (Bank 21) ----
sub_9AB0:
	LDA ($DA),Y			  ; $9AB0: B1 DA   
	INY					  ; $9AB2: C8	  
	TAX					  ; $9AB3: AA	  
	LDA ($DA),Y			  ; $9AB4: B1 DA   
	CMP $627B,X			  ; $9AB6: DD 7B 62
	BNE $9ABF				; $9AB9: D0 04   
loc_9ABB:
	LDA #$FF				 ; $9ABB: A9 FF   
	BNE $9AC1				; $9ABD: D0 02   
loc_9ABF:
	LDA #$00				 ; $9ABF: A9 00   
loc_9AC1:
	INY					  ; $9AC1: C8	  
	RTS					  ; $9AC2: 60	  

; ---- Subroutine at $9AC3 (Bank 21) ----
sub_9AC3:
	LDX #$00				 ; $9AC3: A2 00   
	BRK					  ; $9AC5: 00	  
	AND #$73				 ; $9AC6: 29 73   
	RTS					  ; $9AC8: 60	  

; ---- Subroutine at $9AC9 (Bank 21) ----
sub_9AC9:
	LDA #$48				 ; $9AC9: A9 48   
	JSR $B7B5				; $9ACB: 20 B5 B7 ; -> sub_B7B5
	ORA #$00				 ; $9ACE: 09 00   
	RTS					  ; $9AD0: 60	  

; ---- Subroutine at $9AD1 (Bank 21) ----
sub_9AD1:
	LDA ($DA),Y			  ; $9AD1: B1 DA   
	INY					  ; $9AD3: C8	  

; ---- Subroutine at $9AD4 (Bank 21) ----
sub_9AD4:
	BRK					  ; $9AD4: 00	  
	.byte $63			  ; $9AD5 - Unknown opcode
	.byte $73			  ; $9AD6 - Unknown opcode
	BCC $9AEF				; $9AD7: 90 16   
	TAX					  ; $9AD9: AA	  
	LDA $615A				; $9ADA: AD 5A 61
	CMP #$04				 ; $9ADD: C9 04	; Compare with 4
	BCC $9AE8				; $9ADF: 90 07   
	BRK					  ; $9AE1: 00	  
	ROR					  ; $9AE2: 6A	  
	.byte $73			  ; $9AE3 - Unknown opcode
	CMP #$01				 ; $9AE4: C9 01	; Compare with 1
	BEQ $9AEF				; $9AE6: F0 07   
loc_9AE8:
	BRK					  ; $9AE8: 00	  
	.byte $42			  ; $9AE9 - Unknown opcode
	.byte $73			  ; $9AEA - Unknown opcode
	CMP #$01				 ; $9AEB: C9 01	; Compare with 1
	BEQ $9AF2				; $9AED: F0 03   
loc_9AEF:
	LDA #$01				 ; $9AEF: A9 01   
	RTS					  ; $9AF1: 60	  
loc_9AF2:
	LDA #$00				 ; $9AF2: A9 00   
	RTS					  ; $9AF4: 60	  

; ---- Subroutine at $9AF5 (Bank 21) ----
sub_9AF5:
	LDA ($DA),Y			  ; $9AF5: B1 DA   
	INY					  ; $9AF7: C8	  

; ---- Subroutine at $9AF8 (Bank 21) ----
sub_9AF8:
	BRK					  ; $9AF8: 00	  
	.byte $63			  ; $9AF9 - Unknown opcode
	.byte $63			  ; $9AFA - Unknown opcode
	RTI					  ; $9AFB: 40	  
	BCC $9AEF				; $9AFC: 90 F1   
	TAX					  ; $9AFE: AA	  
	BRK					  ; $9AFF: 00	  
	.byte $42			  ; $9B00 - Unknown opcode
	.byte $63			  ; $9B01 - Unknown opcode
	RTI					  ; $9B02: 40	  
	CMP #$01				 ; $9B03: C9 01	; Compare with 1
	BEQ $9AEF				; $9B05: F0 E8   
	BNE $9AF2				; $9B07: D0 E9   

; ---- Subroutine at $9B09 (Bank 21) ----
sub_9B09:
	JSR $9CE5				; $9B09: 20 E5 9C ; -> sub_9CE5
	BCC $9AF2				; $9B0C: 90 E4   
	BCS $9AEF				; $9B0E: B0 DF   

; ---- Subroutine at $9B10 (Bank 21) ----
sub_9B10:
	LDA ($DA),Y			  ; $9B10: B1 DA   
	INY					  ; $9B12: C8	  
	SEC					  ; $9B13: 38	  
	SBC #$01				 ; $9B14: E9 01	; Arithmetic
	CMP $615A				; $9B16: CD 5A 61
	BEQ $9AF2				; $9B19: F0 D7   
	BNE $9AEF				; $9B1B: D0 D2   

; ---- Subroutine at $9B1D (Bank 21) ----
sub_9B1D:
	LDA ($DA),Y			  ; $9B1D: B1 DA   
	CMP #$06				 ; $9B1F: C9 06	; Compare with 6
	BEQ $9B25				; $9B21: F0 02   
	BNE $9B38				; $9B23: D0 13   
loc_9B25:
	INY					  ; $9B25: C8	  
loc_9B26:
	LDA ($DA),Y			  ; $9B26: B1 DA   
	CMP #$3E				 ; $9B28: C9 3E	; Compare with 62
	BEQ $9B36				; $9B2A: F0 0A   
	CMP #$3F				 ; $9B2C: C9 3F	; Compare with 63
	BEQ $9B36				; $9B2E: F0 06   
	JSR $9B38				; $9B30: 20 38 9B ; -> sub_9B38
	JMP $9B26				; $9B33: 4C 26 9B
loc_9B36:
	INY					  ; $9B36: C8	  
	RTS					  ; $9B37: 60	  

; ---- Subroutine at $9B38 (Bank 21) ----
sub_9B38:
	LDA ($DA),Y			  ; $9B38: B1 DA   
	STA tmp0				 ; $9B3A: 85 00   
	BIT tmp0				 ; $9B3C: 24 00   
	BVS $9B74				; $9B3E: 70 34   
	CMP #$17				 ; $9B40: C9 17	; Compare with 23
	BEQ $9B73				; $9B42: F0 2F   
	CMP #$18				 ; $9B44: C9 18	; Compare with 24
	BEQ $9B73				; $9B46: F0 2B   
	CMP #$19				 ; $9B48: C9 19	; Compare with 25
	BEQ $9B73				; $9B4A: F0 27   
	CMP #$12				 ; $9B4C: C9 12	; Compare with 18
	BEQ $9B74				; $9B4E: F0 24   
	CMP #$0B				 ; $9B50: C9 0B	; Compare with 11
	BEQ $9B75				; $9B52: F0 21   
	CMP #$01				 ; $9B54: C9 01	; Compare with 1
	BEQ $9B71				; $9B56: F0 19   
	CMP #$00				 ; $9B58: C9 00	; Compare with 0
	BEQ $9B73				; $9B5A: F0 17   
	CMP #$07				 ; $9B5C: C9 07	; Compare with 7
	BNE $9B75				; $9B5E: D0 15   
	INY					  ; $9B60: C8	  
	JSR $9B77				; $9B61: 20 77 9B ; -> sub_9B77
	JSR $9B1D				; $9B64: 20 1D 9B ; -> sub_9B1D
	LDA ($DA),Y			  ; $9B67: B1 DA   
	CMP #$0B				 ; $9B69: C9 0B	; Compare with 11
	BNE $9B76				; $9B6B: D0 09   
	INY					  ; $9B6D: C8	  
	JMP $9B1D				; $9B6E: 4C 1D 9B
loc_9B71:
	INY					  ; $9B71: C8	  
	INY					  ; $9B72: C8	  
loc_9B73:
	INY					  ; $9B73: C8	  
loc_9B74:
	INY					  ; $9B74: C8	  
loc_9B75:
	INY					  ; $9B75: C8	  
loc_9B76:
	RTS					  ; $9B76: 60	  

; ---- Subroutine at $9B77 (Bank 21) ----
sub_9B77:
	LDA ($DA),Y			  ; $9B77: B1 DA   
	AND #$3F				 ; $9B79: 29 3F   
	CMP #$11				 ; $9B7B: C9 11	; Compare with 17
	BEQ $9B74				; $9B7D: F0 F5   
	CMP #$02				 ; $9B7F: C9 02	; Compare with 2
	BEQ $9B75				; $9B81: F0 F2   
	CMP #$05				 ; $9B83: C9 05	; Compare with 5
	BEQ $9B75				; $9B85: F0 EE   
	CMP #$13				 ; $9B87: C9 13	; Compare with 19
	BEQ $9B74				; $9B89: F0 E9   
	CMP #$03				 ; $9B8B: C9 03	; Compare with 3
	BEQ $9B74				; $9B8D: F0 E5   
	CMP #$14				 ; $9B8F: C9 14	; Compare with 20
	BEQ $9B75				; $9B91: F0 E2   
	CMP #$16				 ; $9B93: C9 16	; Compare with 22
	BEQ $9B74				; $9B95: F0 DD   
	CMP #$1C				 ; $9B97: C9 1C	; Compare with 28
	BEQ $9B73				; $9B99: F0 D8   
	CMP #$1B				 ; $9B9B: C9 1B	; Compare with 27
	BEQ $9B73				; $9B9D: F0 D4   
	CMP #$1A				 ; $9B9F: C9 1A	; Compare with 26
	BEQ $9B73				; $9BA1: F0 D0   
	CMP #$1E				 ; $9BA3: C9 1E	; Compare with 30
	BEQ $9B75				; $9BA5: F0 CE   
	RTS					  ; $9BA7: 60	  

; ---- Subroutine at $9BA8 (Bank 21) ----
sub_9BA8:
	LDA ($DA),Y			  ; $9BA8: B1 DA   
	INY					  ; $9BAA: C8	  
	STA tmp0				 ; $9BAB: 85 00   
	BIT tmp0				 ; $9BAD: 24 00   
	BVC $9BBD				; $9BAF: 50 0C   
	AND #$3F				 ; $9BB1: 29 3F   
	TAX					  ; $9BB3: AA	  
	LDA ($DA),Y			  ; $9BB4: B1 DA   
	INY					  ; $9BB6: C8	  
	JSR $9919				; $9BB7: 20 19 99 ; -> sub_9919
	JMP $9C2E				; $9BBA: 4C 2E 9C
loc_9BBD:
	CMP #$3F				 ; $9BBD: C9 3F	; Compare with 63
	BNE $9BC4				; $9BBF: D0 03   
	PLA					  ; $9BC1: 68	  
	PLA					  ; $9BC2: 68	  
	RTS					  ; $9BC3: 60	  
loc_9BC4:
	CMP #$07				 ; $9BC4: C9 07	; Compare with 7
	BNE $9BD4				; $9BC6: D0 0C   
	LDA $DC				  ; $9BC8: A5 DC   
	PHA					  ; $9BCA: 48	  
	JSR $99CE				; $9BCB: 20 CE 99 ; -> sub_99CE
	PLA					  ; $9BCE: 68	  
	STA $DC				  ; $9BCF: 85 DC   
	JMP $9C2E				; $9BD1: 4C 2E 9C
loc_9BD4:
	CMP #$18				 ; $9BD4: C9 18	; Compare with 24
	BNE $9BE8				; $9BD6: D0 10   
	LDA ($DA),Y			  ; $9BD8: B1 DA   
	INY					  ; $9BDA: C8	  
	TAX					  ; $9BDB: AA	  
	LDA ($DA),Y			  ; $9BDC: B1 DA   
	INY					  ; $9BDE: C8	  
	ORA $627B,X			  ; $9BDF: 1D 7B 62
	STA $627B,X			  ; $9BE2: 9D 7B 62
	JMP $9C2E				; $9BE5: 4C 2E 9C
loc_9BE8:
	CMP #$17				 ; $9BE8: C9 17	; Compare with 23
	BNE $9BFC				; $9BEA: D0 10   
	LDA ($DA),Y			  ; $9BEC: B1 DA   
	INY					  ; $9BEE: C8	  
	TAX					  ; $9BEF: AA	  
	LDA ($DA),Y			  ; $9BF0: B1 DA   
	INY					  ; $9BF2: C8	  
	AND $627B,X			  ; $9BF3: 3D 7B 62
	STA $627B,X			  ; $9BF6: 9D 7B 62
	JMP $9C2E				; $9BF9: 4C 2E 9C
loc_9BFC:
	CMP #$19				 ; $9BFC: C9 19	; Compare with 25
	BNE $9C0D				; $9BFE: D0 0D   
	LDA ($DA),Y			  ; $9C00: B1 DA   
	INY					  ; $9C02: C8	  
	TAX					  ; $9C03: AA	  
	LDA ($DA),Y			  ; $9C04: B1 DA   
	INY					  ; $9C06: C8	  
	STA $627B,X			  ; $9C07: 9D 7B 62
	JMP $9C2E				; $9C0A: 4C 2E 9C
loc_9C0D:
	CMP #$12				 ; $9C0D: C9 12	; Compare with 18
	BNE $9C17				; $9C0F: D0 06   
	JSR $9C63				; $9C11: 20 63 9C ; -> sub_9C63
	JMP $9C2E				; $9C14: 4C 2E 9C
loc_9C17:
	CMP #$00				 ; $9C17: C9 00	; Compare with 0
	BNE $9C21				; $9C19: D0 06   
	JSR $9C42				; $9C1B: 20 42 9C ; -> sub_9C42
	JMP $9C2E				; $9C1E: 4C 2E 9C
loc_9C21:
	CMP #$01				 ; $9C21: C9 01	; Compare with 1
	BNE $9C2D				; $9C23: D0 08   
	JSR $9C42				; $9C25: 20 42 9C ; -> sub_9C42
	INY					  ; $9C28: C8	  
	INY					  ; $9C29: C8	  
	JMP $9C2E				; $9C2A: 4C 2E 9C
loc_9C2D:
	RTS					  ; $9C2D: 60	  
loc_9C2E:
	LDA $DC				  ; $9C2E: A5 DC   
	BNE $9C33				; $9C30: D0 01   
	RTS					  ; $9C32: 60	  
loc_9C33:
	LDA ($DA),Y			  ; $9C33: B1 DA   
	CMP #$3E				 ; $9C35: C9 3E	; Compare with 62
	BEQ $9C40				; $9C37: F0 07   
	CMP #$3F				 ; $9C39: C9 3F	; Compare with 63
	BEQ $9C40				; $9C3B: F0 03   
	JMP $9BA8				; $9C3D: 4C A8 9B
loc_9C40:
	INY					  ; $9C40: C8	  
	RTS					  ; $9C41: 60	  

; ---- Subroutine at $9C42 (Bank 21) ----
sub_9C42:
	LDA ($DA),Y			  ; $9C42: B1 DA   
	INY					  ; $9C44: C8	  
	STA $DE				  ; $9C45: 85 DE   
	LDA ($DA),Y			  ; $9C47: B1 DA   
	STA $DF				  ; $9C49: 85 DF   
	LDA $DA				  ; $9C4B: A5 DA   
	PHA					  ; $9C4D: 48	  
	LDA $DB				  ; $9C4E: A5 DB   
	PHA					  ; $9C50: 48	  
	LDA $DC				  ; $9C51: A5 DC   
	PHA					  ; $9C53: 48	  
	TYA					  ; $9C54: 98	  
	PHA					  ; $9C55: 48	  
	JSR $9C5C				; $9C56: 20 5C 9C ; -> sub_9C5C
	JMP $9C75				; $9C59: 4C 75 9C

; ---- Subroutine at $9C5C (Bank 21) ----
sub_9C5C:
	INY					  ; $9C5C: C8	  
	JSR $B056				; $9C5D: 20 56 B0 ; -> sub_B056
	JMP ($00DE)			  ; $9C60: 6C DE 00

; ---- Subroutine at $9C63 (Bank 21) ----
sub_9C63:
	LDA $DA				  ; $9C63: A5 DA   
	PHA					  ; $9C65: 48	  
	LDA $DB				  ; $9C66: A5 DB   
	PHA					  ; $9C68: 48	  
	LDA $DC				  ; $9C69: A5 DC   
	PHA					  ; $9C6B: 48	  
	TYA					  ; $9C6C: 98	  
	PHA					  ; $9C6D: 48	  
	LDA ($DA),Y			  ; $9C6E: B1 DA   
	STA tmp0				 ; $9C70: 85 00   
	JSR $9CBF				; $9C72: 20 BF 9C ; -> sub_9CBF
loc_9C75:
	PLA					  ; $9C75: 68	  
	TAY					  ; $9C76: A8	  
	INY					  ; $9C77: C8	  
	PLA					  ; $9C78: 68	  
	STA $DC				  ; $9C79: 85 DC   
	PLA					  ; $9C7B: 68	  
	STA $DB				  ; $9C7C: 85 DB   
	PLA					  ; $9C7E: 68	  
	STA $DA				  ; $9C7F: 85 DA   
	RTS					  ; $9C81: 60	  
	LDA ($DA),Y			  ; $9C82: B1 DA   
	INY					  ; $9C84: C8	  
	CMP #$06				 ; $9C85: C9 06	; Compare with 6
	BNE $9C8D				; $9C87: D0 04   
	LDA #$01				 ; $9C89: A9 01   
	BNE $9C8F				; $9C8B: D0 02   
loc_9C8D:
	LDA #$00				 ; $9C8D: A9 00   
loc_9C8F:
	LDA $DC				  ; $9C8F: A5 DC   
	RTS					  ; $9C91: 60	  

; ---- Subroutine at $9C92 (Bank 21) ----
sub_9C92:
	LDA tmp0				 ; $9C92: A5 00   
	SEC					  ; $9C94: 38	  
	SBC #$61				 ; $9C95: E9 61	; Arithmetic
	STA $DA				  ; $9C97: 85 DA   
	LDA tmp1				 ; $9C99: A5 01   
	SBC #$01				 ; $9C9B: E9 01	; Arithmetic
	STA $DB				  ; $9C9D: 85 DB   
	TAX					  ; $9C9F: AA	  
	LDA $DA				  ; $9CA0: A5 DA   
	JSR $9914				; $9CA2: 20 14 99 ; -> sub_9914
	JSR $9AC9				; $9CA5: 20 C9 9A ; -> sub_9AC9
	BEQ $9CAE				; $9CA8: F0 04   
	LDA #$02				 ; $9CAA: A9 02   
	BNE $9CB0				; $9CAC: D0 02   
loc_9CAE:
	LDA #$01				 ; $9CAE: A9 01   
loc_9CB0:
	STA tmp0				 ; $9CB0: 85 00   
	LDA $DA				  ; $9CB2: A5 DA   
	CLC					  ; $9CB4: 18	  
	ADC tmp0				 ; $9CB5: 65 00	; Arithmetic
	LDX $DB				  ; $9CB7: A6 DB   
	BCC $9CBC				; $9CB9: 90 01   
	INX					  ; $9CBB: E8	  
loc_9CBC:
	JMP $9914				; $9CBC: 4C 14 99

; ---- Subroutine at $9CBF (Bank 21) ----
sub_9CBF:
	CMP #$04				 ; $9CBF: C9 04	; Compare with 4
	BNE $9CC6				; $9CC1: D0 03   
	JMP $BBCE				; $9CC3: 4C CE BB
loc_9CC6:
	CMP #$06				 ; $9CC6: C9 06	; Compare with 6
	BNE $9CCD				; $9CC8: D0 03   
	JMP $BF06				; $9CCA: 4C 06 BF
loc_9CCD:
	CMP #$01				 ; $9CCD: C9 01	; Compare with 1
	BNE $9CD4				; $9CCF: D0 03   
	JMP $B822				; $9CD1: 4C 22 B8
loc_9CD4:
	CMP #$03				 ; $9CD4: C9 03	; Compare with 3
	BNE $9CDB				; $9CD6: D0 03   
	JMP $B829				; $9CD8: 4C 29 B8
loc_9CDB:
	CMP #$02				 ; $9CDB: C9 02	; Compare with 2
	BNE $9CE2				; $9CDD: D0 03   
	JMP $B830				; $9CDF: 4C 30 B8
loc_9CE2:
	JMP $B528				; $9CE2: 4C 28 B5

; ---- Subroutine at $9CE5 (Bank 21) ----
sub_9CE5:
	LDA $62ED				; $9CE5: AD ED 62
	CMP #$78				 ; $9CE8: C9 78	; Compare with 120
	RTS					  ; $9CEA: 60	  
	LDA $615A				; $9CEB: AD 5A 61
	BEQ $9CF9				; $9CEE: F0 09   
	CMP #$04				 ; $9CF0: C9 04	; Compare with 4
	BEQ $9D1F				; $9CF2: F0 2B   
	CMP #$02				 ; $9CF4: C9 02	; Compare with 2
	BEQ $9D14				; $9CF6: F0 1C   
	RTS					  ; $9CF8: 60	  
loc_9CF9:
	BRK					  ; $9CF9: 00	  
	ASL pos_x_hi			 ; $9CFA: 06 EB   
	.byte $04			  ; $9CFC - Unknown opcode
	BEQ $9D13				; $9CFD: F0 14   
	LDA $6281				; $9CFF: AD 81 62
	AND #$03				 ; $9D02: 29 03   
	CLC					  ; $9D04: 18	  
	ADC #$01				 ; $9D05: 69 01	; Arithmetic
	STA tmp0				 ; $9D07: 85 00   
	LDA $6281				; $9D09: AD 81 62
	AND #$F8				 ; $9D0C: 29 F8   
	ORA tmp0				 ; $9D0E: 05 00   
	STA $6281				; $9D10: 8D 81 62
loc_9D13:
	RTS					  ; $9D13: 60	  
loc_9D14:
	BRK					  ; $9D14: 00	  
	ORA $02EB				; $9D15: 0D EB 02
	BEQ $9D1E				; $9D18: F0 04   
	BRK					  ; $9D1A: 00	  
	ORA $08CB				; $9D1B: 0D CB 08
loc_9D1E:
	RTS					  ; $9D1E: 60	  
loc_9D1F:
	BRK					  ; $9D1F: 00	  
	.byte $13			  ; $9D20 - Unknown opcode
	.byte $EB			  ; $9D21 - Unknown opcode
	JSR $04F0				; $9D22: 20 F0 04
	BRK					  ; $9D25: 00	  
	.byte $13			  ; $9D26 - Unknown opcode
	.byte $CB			  ; $9D27 - Unknown opcode
	.byte $04			  ; $9D28 - Unknown opcode
	RTS					  ; $9D29: 60	  
	LDY $45				  ; $9D2A: A4 45   
	CPY #$16				 ; $9D2C: C0 16   
	BNE $9D33				; $9D2E: D0 03   
	JMP $A66A				; $9D30: 4C 6A A6
loc_9D33:
	JMP $B829				; $9D33: 4C 29 B8
	LDX #$08				 ; $9D36: A2 08   
	LDA #$33				 ; $9D38: A9 33   
	STA $7046,X			  ; $9D3A: 9D 46 70
	RTS					  ; $9D3D: 60	  
	LDX #$00				 ; $9D3E: A2 00   
	LDA $6281				; $9D40: AD 81 62
	AND #$03				 ; $9D43: 29 03   
	BEQ $9D4F				; $9D45: F0 08   
	INX					  ; $9D47: E8	  
	CMP #$01				 ; $9D48: C9 01	; Compare with 1
	BEQ $9D4F				; $9D4A: F0 03   
	INX					  ; $9D4C: E8	  
	BNE $9D53				; $9D4D: D0 04   
loc_9D4F:
	BRK					  ; $9D4F: 00	  
	ASL $CB				  ; $9D50: 06 CB   
	.byte $04			  ; $9D52 - Unknown opcode
loc_9D53:
	TXA					  ; $9D53: 8A	  
	JMP $A66A				; $9D54: 4C 6A A6
	LDA #$00				 ; $9D57: A9 00   
	JMP $B0D7				; $9D59: 4C D7 B0
	JSR $A66A				; $9D5C: 20 6A A6 ; -> sub_A66A
	JMP $B0B6				; $9D5F: 4C B6 B0
	LDA #$01				 ; $9D62: A9 01   
	BRK					  ; $9D64: 00	  
	.byte $07			  ; $9D65 - Unknown opcode
	.byte $CF			  ; $9D66 - Unknown opcode
	RTS					  ; $9D67: 60	  
	LDA #$07				 ; $9D68: A9 07   
	JSR $9AD4				; $9D6A: 20 D4 9A ; -> sub_9AD4
	BEQ $9D76				; $9D6D: F0 07   
	LDA #$07				 ; $9D6F: A9 07   
	BRK					  ; $9D71: 00	  
	.byte $63			  ; $9D72 - Unknown opcode
	.byte $73			  ; $9D73 - Unknown opcode
	STA $F9				  ; $9D74: 85 F9   
loc_9D76:
	BRK					  ; $9D76: 00	  
	PHP					  ; $9D77: 08	  
	.byte $EB			  ; $9D78 - Unknown opcode
	.byte $04			  ; $9D79 - Unknown opcode
	BEQ $9D7F				; $9D7A: F0 03   
	JMP $A664				; $9D7C: 4C 64 A6
loc_9D7F:
	BRK					  ; $9D7F: 00	  
	LSR $603B				; $9D80: 4E 3B 60
	LDA $62AA				; $9D83: AD AA 62
	ORA #$08				 ; $9D86: 09 08   
	STA $62AA				; $9D88: 8D AA 62
	RTS					  ; $9D8B: 60	  
	JSR $9D92				; $9D8C: 20 92 9D ; -> sub_9D92
	JMP $A664				; $9D8F: 4C 64 A6

; ---- Subroutine at $9D92 (Bank 21) ----
sub_9D92:
	LDA $07C7				; $9D92: AD C7 07
	STA $70				  ; $9D95: 85 70   
	STA $FE				  ; $9D97: 85 FE   
	LDA $07C8				; $9D99: AD C8 07
	STA $71				  ; $9D9C: 85 71   
	STA $FF				  ; $9D9E: 85 FF   
	LDA $07C6				; $9DA0: AD C6 07
	STA $FD				  ; $9DA3: 85 FD   
	BRK					  ; $9DA5: 00	  
	.byte $4B			  ; $9DA6 - Unknown opcode
	.byte $73			  ; $9DA7 - Unknown opcode
	BRK					  ; $9DA8: 00	  
	ORA #$CB				 ; $9DA9: 09 CB   
	.byte $04			  ; $9DAB - Unknown opcode
	LDA #$00				 ; $9DAC: A9 00   
	STA $07C6				; $9DAE: 8D C6 07
	STA $07C7				; $9DB1: 8D C7 07
	STA $07C8				; $9DB4: 8D C8 07
	RTS					  ; $9DB7: 60	  

; ---- Subroutine at $9DB8 (Bank 21) ----
sub_9DB8:
	LDA $FD				  ; $9DB8: A5 FD   
	STA tmp0				 ; $9DBA: 85 00   
	LDA $FE				  ; $9DBC: A5 FE   
	STA tmp1				 ; $9DBE: 85 01   
	LDA $FF				  ; $9DC0: A5 FF   
	STA tmp2				 ; $9DC2: 85 02   
loc_9DC4:
	LSR tmp2				 ; $9DC4: 46 02   
	ROR tmp1				 ; $9DC6: 66 01   
	ROR tmp0				 ; $9DC8: 66 00   
	DEX					  ; $9DCA: CA	  
	BNE $9DC4				; $9DCB: D0 F7   
	LDA tmp0				 ; $9DCD: A5 00   
	ORA tmp1				 ; $9DCF: 05 01   
	ORA tmp2				 ; $9DD1: 05 02   
	BNE $9DD9				; $9DD3: D0 04   
	LDA #$01				 ; $9DD5: A9 01   
	STA tmp0				 ; $9DD7: 85 00   
loc_9DD9:
	RTS					  ; $9DD9: 60	  
	JSR $A64C				; $9DDA: 20 4C A6 ; -> sub_A64C
	JMP $9DF0				; $9DDD: 4C F0 9D
	BRK					  ; $9DE0: 00	  
	ORA #$EB				 ; $9DE1: 09 EB   
	ORA ($D0,X)			  ; $9DE3: 01 D0   
	.byte $07			  ; $9DE5 - Unknown opcode
	LDA $6285				; $9DE6: AD 85 62
	AND #$02				 ; $9DE9: 29 02   
	BNE $9E45				; $9DEB: D0 58   
	JSR $A668				; $9DED: 20 68 A6 ; -> sub_A668
loc_9DF0:
	JSR $A660				; $9DF0: 20 60 A6 ; -> sub_A660
	LDA #$80				 ; $9DF3: A9 80   
	STA $DD				  ; $9DF5: 85 DD   
	LDA #$1B				 ; $9DF7: A9 1B   
	STA $44				  ; $9DF9: 85 44   
	LDA #$05				 ; $9DFB: A9 05   
	STA $45				  ; $9DFD: 85 45   
	JSR $D210				; $9DFF: 20 10 D2 ; Call to fixed bank
	JSR $A6BC				; $9E02: 20 BC A6 ; -> sub_A6BC
	LDX #$01				 ; $9E05: A2 01   
	LDA #$1B				 ; $9E07: A9 1B   
	STA $6F66,X			  ; $9E09: 9D 66 6F
	STA $6FA6,X			  ; $9E0C: 9D A6 6F
	LDA #$04				 ; $9E0F: A9 04   
	STA $6F86,X			  ; $9E11: 9D 86 6F
	STA $6FC6,X			  ; $9E14: 9D C6 6F
	JSR $A4C9				; $9E17: 20 C9 A4 ; -> sub_A4C9
	JSR $A6A9				; $9E1A: 20 A9 A6 ; -> sub_A6A9
	JSR $A65C				; $9E1D: 20 5C A6 ; -> sub_A65C
	JSR $A658				; $9E20: 20 58 A6 ; -> sub_A658
	LDA #$74				 ; $9E23: A9 74   
	JSR $A769				; $9E25: 20 69 A7 ; -> sub_A769
	BEQ $9E36				; $9E28: F0 0C   
	LDA #$05				 ; $9E2A: A9 05   
	JSR $A774				; $9E2C: 20 74 A7 ; -> sub_A774
	BCS $9E36				; $9E2F: B0 05   
	LDA #$74				 ; $9E31: A9 74   
	JSR $B089				; $9E33: 20 89 B0 ; -> sub_B089
loc_9E36:
	BRK					  ; $9E36: 00	  
	ORA #$DB				 ; $9E37: 09 DB   
	.byte $FA			  ; $9E39 - Unknown opcode
	BRK					  ; $9E3A: 00	  
	ASL					  ; $9E3B: 0A	  
	.byte $CB			  ; $9E3C - Unknown opcode
	.byte $02			  ; $9E3D - Unknown opcode
	BRK					  ; $9E3E: 00	  
	BPL $9E1C				; $9E3F: 10 DB   
	.byte $7F			  ; $9E41 - Unknown opcode
	JMP $9E55				; $9E42: 4C 55 9E
loc_9E45:
	LDA $628B				; $9E45: AD 8B 62

; ---- Subroutine at $9E48 (Bank 21) ----
sub_9E48:
	AND #$80				 ; $9E48: 29 80   
	BEQ $9E52				; $9E4A: F0 06   
	JSR $A650				; $9E4C: 20 50 A6 ; -> sub_A650
	JMP $9E55				; $9E4F: 4C 55 9E
loc_9E52:
	JSR $A654				; $9E52: 20 54 A6 ; -> sub_A654
loc_9E55:
	RTS					  ; $9E55: 60	  
	JSR $D210				; $9E56: 20 10 D2 ; Call to fixed bank
	LDA #$00				 ; $9E59: A9 00   
	STA submap_number		; $9E5B: 85 64   
	LDA #$05				 ; $9E5D: A9 05   
	STA $44				  ; $9E5F: 85 44   
	LDA #$1C				 ; $9E61: A9 1C   
	STA $45				  ; $9E63: 85 45   
	JSR $A6BC				; $9E65: 20 BC A6 ; -> sub_A6BC
	JSR $B03F				; $9E68: 20 3F B0 ; -> sub_B03F
	LDA #$81				 ; $9E6B: A9 81   
	BRK					  ; $9E6D: 00	  
	AND ($EF),Y			  ; $9E6E: 31 EF   
	LDX #$0C				 ; $9E70: A2 0C   
	LDA $7006,X			  ; $9E72: BD 06 70
	AND #$FC				 ; $9E75: 29 FC   
	ORA #$03				 ; $9E77: 09 03   
	STA $7006,X			  ; $9E79: 9D 06 70
	JSR $A4C9				; $9E7C: 20 C9 A4 ; -> sub_A4C9
	JMP $C5BF				; $9E7F: 4C BF C5
	LDA #$74				 ; $9E82: A9 74   
	JSR $A769				; $9E84: 20 69 A7 ; -> sub_A769
	BEQ $9E98				; $9E87: F0 0F   
	LDA #$05				 ; $9E89: A9 05   
	JSR $A774				; $9E8B: 20 74 A7 ; -> sub_A774
	BCS $9E98				; $9E8E: B0 08   
	JSR $A664				; $9E90: 20 64 A6 ; -> sub_A664
	LDA #$74				 ; $9E93: A9 74   
	JSR $B089				; $9E95: 20 89 B0 ; -> sub_B089
loc_9E98:
	RTS					  ; $9E98: 60	  
	LDA $6254				; $9E99: AD 54 62
	ORA $6255				; $9E9C: 0D 55 62
	ORA $6256				; $9E9F: 0D 56 62
	BEQ $9EC8				; $9EA2: F0 24   
	LDA $6255				; $9EA4: AD 55 62
	STA $70				  ; $9EA7: 85 70   
	STA $FE				  ; $9EA9: 85 FE   
	LDA $6256				; $9EAB: AD 56 62
	STA $71				  ; $9EAE: 85 71   
	STA $FF				  ; $9EB0: 85 FF   
	LDA $6254				; $9EB2: AD 54 62
	STA $FD				  ; $9EB5: 85 FD   
	BRK					  ; $9EB7: 00	  
	.byte $4B			  ; $9EB8 - Unknown opcode
	.byte $73			  ; $9EB9 - Unknown opcode
	LDA #$00				 ; $9EBA: A9 00   
	STA $6254				; $9EBC: 8D 54 62
	STA $6255				; $9EBF: 8D 55 62
	STA $6256				; $9EC2: 8D 56 62
	BRK					  ; $9EC5: 00	  
	ADC $203B				; $9EC6: 6D 3B 20 ; Arithmetic
	TXA					  ; $9EC9: 8A	  
	.byte $B3			  ; $9ECA - Unknown opcode
	CMP #$78				 ; $9ECB: C9 78	; Compare with 120
	BCC $9ED5				; $9ECD: 90 06   
	BRK					  ; $9ECF: 00	  
	.byte $77			  ; $9ED0 - Unknown opcode
	.byte $3B			  ; $9ED1 - Unknown opcode
	JMP $9F4E				; $9ED2: 4C 4E 9F
loc_9ED5:
	BRK					  ; $9ED5: 00	  
	ROR $A93B				; $9ED6: 6E 3B A9
	ORA tmp0				 ; $9ED9: 05 00   
	.byte $63			  ; $9EDB - Unknown opcode
	.byte $73			  ; $9EDC - Unknown opcode
	STA $DA				  ; $9EDD: 85 DA   
	TAX					  ; $9EDF: AA	  
	BRK					  ; $9EE0: 00	  
	AND $C973				; $9EE1: 2D 73 C9
	BRK					  ; $9EE4: 00	  
	BNE $9EF3				; $9EE5: D0 0C   
	BRK					  ; $9EE7: 00	  
	.byte $83			  ; $9EE8 - Unknown opcode
	.byte $2B			  ; $9EE9 - Unknown opcode
	BRK					  ; $9EEA: 00	  
	.byte $34			  ; $9EEB - Unknown opcode
	.byte $3B			  ; $9EEC - Unknown opcode
	BRK					  ; $9EED: 00	  
	.byte $83			  ; $9EEE - Unknown opcode
	.byte $2B			  ; $9EEF - Unknown opcode
	JMP $9F4B				; $9EF0: 4C 4B 9F
loc_9EF3:
	LDX $DA				  ; $9EF3: A6 DA   
	LDA #$1F				 ; $9EF5: A9 1F   
	JSR $B7B5				; $9EF7: 20 B5 B7 ; -> sub_B7B5
	CMP #$FF				 ; $9EFA: C9 FF	; Compare with 255
	BEQ $9F4B				; $9EFC: F0 4D   
	STA $DB				  ; $9EFE: 85 DB   
	LDX $DA				  ; $9F00: A6 DA   
	BRK					  ; $9F02: 00	  
	BIT $2973				; $9F03: 2C 73 29
	.byte $7F			  ; $9F06 - Unknown opcode
	STA $F9				  ; $9F07: 85 F9   
	BRK					  ; $9F09: 00	  
	.byte $0F			  ; $9F0A - Unknown opcode
	.byte $0F			  ; $9F0B - Unknown opcode
	BCS $9F45				; $9F0C: B0 37   
	LDA $F9				  ; $9F0E: A5 F9   
	STA tmp0				 ; $9F10: 85 00   
	JSR $B2CF				; $9F12: 20 CF B2 ; -> sub_B2CF
	JSR $A47C				; $9F15: 20 7C A4 ; -> sub_A47C
	LDA #$60				 ; $9F18: A9 60   
	JSR $A60D				; $9F1A: 20 0D A6 ; -> sub_A60D
	BRK					  ; $9F1D: 00	  
	.byte $6F			  ; $9F1E - Unknown opcode
	.byte $3B			  ; $9F1F - Unknown opcode
	JSR $9AC9				; $9F20: 20 C9 9A ; -> sub_9AC9
	BNE $9F3F				; $9F23: D0 1A   
	LDX $DA				  ; $9F25: A6 DA   
	LDA $DB				  ; $9F27: A5 DB   
	BRK					  ; $9F29: 00	  
	BMI $9F9F				; $9F2A: 30 73   
	LDA $F9				  ; $9F2C: A5 F9   
	JSR $B3A1				; $9F2E: 20 A1 B3 ; -> sub_B3A1
	BRK					  ; $9F31: 00	  
	BVS $9F6F				; $9F32: 70 3B   
loc_9F34:
	BRK					  ; $9F34: 00	  
	ADC ($3B),Y			  ; $9F35: 71 3B	; Arithmetic
	JSR $9AC9				; $9F37: 20 C9 9A ; -> sub_9AC9
	BNE $9F4B				; $9F3A: D0 0F   
	JMP $9EC8				; $9F3C: 4C C8 9E
loc_9F3F:
	BRK					  ; $9F3F: 00	  
	.byte $72			  ; $9F40 - Unknown opcode
	.byte $3B			  ; $9F41 - Unknown opcode
	JMP $9F34				; $9F42: 4C 34 9F
loc_9F45:
	BRK					  ; $9F45: 00	  
	.byte $73			  ; $9F46 - Unknown opcode
	.byte $3B			  ; $9F47 - Unknown opcode

; ---- Subroutine at $9F48 (Bank 21) ----
sub_9F48:
	JMP $9F34				; $9F48: 4C 34 9F
loc_9F4B:
	BRK					  ; $9F4B: 00	  
	.byte $74			  ; $9F4C - Unknown opcode
	.byte $3B			  ; $9F4D - Unknown opcode
loc_9F4E:
	JSR $9AC9				; $9F4E: 20 C9 9A ; -> sub_9AC9
	CMP #$00				 ; $9F51: C9 00	; Compare with 0
	BNE $9F6B				; $9F53: D0 16   
	JSR $B38A				; $9F55: 20 8A B3 ; -> sub_B38A
	ORA #$00				 ; $9F58: 09 00   
	BEQ $9F73				; $9F5A: F0 17   
	LDA #$63				 ; $9F5C: A9 63   
	JSR $B7B5				; $9F5E: 20 B5 B7 ; -> sub_B7B5
	JSR $B38A				; $9F61: 20 8A B3 ; -> sub_B38A
	CMP #$09				 ; $9F64: C9 09	; Compare with 9
	BCC $9F6B				; $9F66: 90 03   
	JSR $C8CC				; $9F68: 20 CC C8 ; Call to fixed bank
loc_9F6B:
	BRK					  ; $9F6B: 00	  
	ADC $3B,X				; $9F6C: 75 3B	; Arithmetic
loc_9F6E:
	LDA #$00				 ; $9F6E: A9 00   
	STA $E7				  ; $9F70: 85 E7   
	RTS					  ; $9F72: 60	  
loc_9F73:
	BRK					  ; $9F73: 00	  
	ROR $3B,X				; $9F74: 76 3B   
	JMP $9F6E				; $9F76: 4C 6E 9F

; ---- Subroutine at $9F79 (Bank 21) ----
sub_9F79:
	INC $628C				; $9F79: EE 8C 62
	INC $628D				; $9F7C: EE 8D 62
	BRK					  ; $9F7F: 00	  
	JSR $BFDB				; $9F80: 20 DB BF ; -> sub_BFDB
	LDA $615A				; $9F83: AD 5A 61
	CMP #$02				 ; $9F86: C9 02	; Compare with 2
	BNE $9FD5				; $9F88: D0 4B   
	BRK					  ; $9F8A: 00	  
	ORA $DB				  ; $9F8B: 05 DB   
	.byte $CF			  ; $9F8D - Unknown opcode
	LDX #$00				 ; $9F8E: A2 00   
loc_9F90:
	LDA $61DB,X			  ; $9F90: BD DB 61
	CMP #$FF				 ; $9F93: C9 FF	; Compare with 255
	BEQ $9FD5				; $9F95: F0 3E   
	STA $DA				  ; $9F97: 85 DA   
	STX $DB				  ; $9F99: 86 DB   
	JSR $C891				; $9F9B: 20 91 C8 ; Call to fixed bank
	CMP #$C0				 ; $9F9E: C9 C0	; Compare with 192
	BCS $9FCF				; $9FA0: B0 2D   
	LDA $DA				  ; $9FA2: A5 DA   
	LDX #$FD				 ; $9FA4: A2 FD   
	BRK					  ; $9FA6: 00	  
	ORA ($0F),Y			  ; $9FA7: 11 0F   
	JSR $A5FA				; $9FA9: 20 FA A5 ; -> sub_A5FA
	LDA $6254				; $9FAC: AD 54 62
	CLC					  ; $9FAF: 18	  
	ADC $FD				  ; $9FB0: 65 FD	; Arithmetic
	STA $6254				; $9FB2: 8D 54 62
	LDA $6255				; $9FB5: AD 55 62
	ADC $FE				  ; $9FB8: 65 FE	; Arithmetic
	STA $6255				; $9FBA: 8D 55 62
	LDA $6256				; $9FBD: AD 56 62
	ADC $FF				  ; $9FC0: 65 FF	; Arithmetic
	STA $6256				; $9FC2: 8D 56 62
	LDA $DB				  ; $9FC5: A5 DB   
	JSR $B3CA				; $9FC7: 20 CA B3 ; -> sub_B3CA
	LDX $DB				  ; $9FCA: A6 DB   
	JMP $9F90				; $9FCC: 4C 90 9F
loc_9FCF:
	LDX $DB				  ; $9FCF: A6 DB   
	INX					  ; $9FD1: E8	  
	JMP $9F90				; $9FD2: 4C 90 9F
loc_9FD5:
	RTS					  ; $9FD5: 60	  
	BRK					  ; $9FD6: 00	  
	.byte $0B			  ; $9FD7 - Unknown opcode
	.byte $EB			  ; $9FD8 - Unknown opcode
	.byte $04			  ; $9FD9 - Unknown opcode
	BNE $A00D				; $9FDA: D0 31   
	LDY #$03				 ; $9FDC: A0 03   
	LDA #$90				 ; $9FDE: A9 90   
	STA $6F				  ; $9FE0: 85 6F   
	LDA #$01				 ; $9FE2: A9 01   
loc_9FE4:
	STA $70				  ; $9FE4: 85 70   
	LDA #$00				 ; $9FE6: A9 00   
	STA $71				  ; $9FE8: 85 71   
	BRK					  ; $9FEA: 00	  
	JMP $9033				; $9FEB: 4C 33 90
	.byte $22			  ; $9FEE - Unknown opcode
	LDA #$00				 ; $9FEF: A9 00   
	CPY #$03				 ; $9FF1: C0 03   
	BNE $9FFF				; $9FF3: D0 0A   
	STA $628C				; $9FF5: 8D 8C 62
	BRK					  ; $9FF8: 00	  
	.byte $13			  ; $9FF9 - Unknown opcode
	.byte $CB			  ; $9FFA - Unknown opcode
	.byte $80			  ; $9FFB - Unknown opcode
	JMP $A006				; $9FFC: 4C 06 A0
loc_9FFF:
	STA $628D				; $9FFF: 8D 8D 62
	BRK					  ; $A002: 00	  
	.byte $13			  ; $A003 - Unknown opcode
	.byte $CB			  ; $A004 - Unknown opcode
	RTI					  ; $A005: 40	  
loc_A006:
	TYA					  ; $A006: 98	  
	JSR $A66A				; $A007: 20 6A A6 ; -> sub_A66A
	JMP $A4B6				; $A00A: 4C B6 A4
loc_A00D:
	LDA #$01				 ; $A00D: A9 01   
	BNE $A013				; $A00F: D0 02   
	DEY					  ; $A011: 88	  
	TYA					  ; $A012: 98	  
loc_A013:
	JMP $A66A				; $A013: 4C 6A A6
	JSR $A664				; $A016: 20 64 A6 ; -> sub_A664
	JSR $9AC9				; $A019: 20 C9 9A ; -> sub_9AC9
	BNE $A028				; $A01C: D0 0A   
	LDY #$02				 ; $A01E: A0 02   
	LDA #$58				 ; $A020: A9 58   
	STA $6F				  ; $A022: 85 6F   
	LDA #$02				 ; $A024: A9 02   
	BNE $9FE4				; $A026: D0 BC   
loc_A028:
	JMP $A65C				; $A028: 4C 5C A6
	LDA #$88				 ; $A02B: A9 88   
	STA $70				  ; $A02D: 85 70   
	LDA #$00				 ; $A02F: A9 00   
	STA $71				  ; $A031: 85 71   
	LDA #$B8				 ; $A033: A9 B8   
	BRK					  ; $A035: 00	  
	JMP $9073				; $A036: 4C 73 90
	.byte $0F			  ; $A039 - Unknown opcode
	JSR $A668				; $A03A: 20 68 A6 ; -> sub_A668
	BRK					  ; $A03D: 00	  
	.byte $0B			  ; $A03E - Unknown opcode
	.byte $CB			  ; $A03F - Unknown opcode
	JSR $09A9				; $A040: 20 A9 09
	JSR $B0D7				; $A043: 20 D7 B0 ; -> sub_B0D7
	JMP $A04C				; $A046: 4C 4C A0
	JSR $A664				; $A049: 20 64 A6 ; -> sub_A664
loc_A04C:
	LDA #$00				 ; $A04C: A9 00   
	STA $E7				  ; $A04E: 85 E7   
	RTS					  ; $A050: 60	  
	LDA #$6D				 ; $A051: A9 6D   
	JSR $B09A				; $A053: 20 9A B0 ; -> sub_B09A
	LDA #$61				 ; $A056: A9 61   
	STA $70				  ; $A058: 85 70   
	LDA #$00				 ; $A05A: A9 00   
	STA $71				  ; $A05C: 85 71   
	LDA #$A8				 ; $A05E: A9 A8   
	BRK					  ; $A060: 00	  
	.byte $4B			  ; $A061 - Unknown opcode
	.byte $73			  ; $A062 - Unknown opcode
	BRK					  ; $A063: 00	  
	.byte $0B			  ; $A064 - Unknown opcode
	.byte $CB			  ; $A065 - Unknown opcode
	.byte $80			  ; $A066 - Unknown opcode
	RTS					  ; $A067: 60	  
	JSR $B0AE				; $A068: 20 AE B0 ; -> sub_B0AE
	JMP $A495				; $A06B: 4C 95 A4
	JSR $C891				; $A06E: 20 91 C8 ; Call to fixed bank
	STA ptr0_lo			  ; $A071: 85 04   
	LDA #$00				 ; $A073: A9 00   
	STA ptr0_hi			  ; $A075: 85 05   
	STA $FE				  ; $A077: 85 FE   
	STA $FF				  ; $A079: 85 FF   
	LDX #$04				 ; $A07B: A2 04   
	LDA #$0B				 ; $A07D: A9 0B   
	JSR $C851				; $A07F: 20 51 C8 ; Call to fixed bank
	CLC					  ; $A082: 18	  
	ADC #$02				 ; $A083: 69 02	; Arithmetic
	STA $FD				  ; $A085: 85 FD   
	LDA $FE				  ; $A087: A5 FE   
	STA $70				  ; $A089: 85 70   
	LDA $FF				  ; $A08B: A5 FF   
	STA $71				  ; $A08D: 85 71   
	LDA $FD				  ; $A08F: A5 FD   
	BRK					  ; $A091: 00	  
	.byte $4B			  ; $A092 - Unknown opcode
	.byte $73			  ; $A093 - Unknown opcode
	RTS					  ; $A094: 60	  
	LDA #$08				 ; $A095: A9 08   
	BRK					  ; $A097: 00	  
	.byte $07			  ; $A098 - Unknown opcode
	.byte $CF			  ; $A099 - Unknown opcode
	JMP $B0AE				; $A09A: 4C AE B0
	LDA #$07				 ; $A09D: A9 07   
	JMP $B0D7				; $A09F: 4C D7 B0
	JSR $A66A				; $A0A2: 20 6A A6 ; -> sub_A66A
	LDA $E0				  ; $A0A5: A5 E0   
	PHA					  ; $A0A7: 48	  
	LDA $E1				  ; $A0A8: A5 E1   
	PHA					  ; $A0AA: 48	  
	JSR $D214				; $A0AB: 20 14 D2 ; Call to fixed bank
	BRK					  ; $A0AE: 00	  
	ORA $8F				  ; $A0AF: 05 8F   
	JSR $A6C5				; $A0B1: 20 C5 A6 ; -> sub_A6C5
	JSR $A0FF				; $A0B4: 20 FF A0 ; -> sub_A0FF
	JSR $A4C9				; $A0B7: 20 C9 A4 ; -> sub_A4C9
	PLA					  ; $A0BA: 68	  
	STA $E1				  ; $A0BB: 85 E1   
	PLA					  ; $A0BD: 68	  
	STA $E0				  ; $A0BE: 85 E0   
	JSR $A668				; $A0C0: 20 68 A6 ; -> sub_A668
loc_A0C3:
	JSR $9AC9				; $A0C3: 20 C9 9A ; -> sub_9AC9
	BEQ $A0CE				; $A0C6: F0 06   
	JSR $A660				; $A0C8: 20 60 A6 ; -> sub_A660
	JMP $A0C3				; $A0CB: 4C C3 A0
loc_A0CE:
	JSR $A65C				; $A0CE: 20 5C A6 ; -> sub_A65C
	LDA $E1				  ; $A0D1: A5 E1   
	PHA					  ; $A0D3: 48	  
	LDA $E0				  ; $A0D4: A5 E0   
	PHA					  ; $A0D6: 48	  
	LDA #$2A				 ; $A0D7: A9 2A   
	BRK					  ; $A0D9: 00	  
	.byte $3A			  ; $A0DA - Unknown opcode
	.byte $EF			  ; $A0DB - Unknown opcode
	PLA					  ; $A0DC: 68	  
	STA $E0				  ; $A0DD: 85 E0   
	PLA					  ; $A0DF: 68	  
	STA $E1				  ; $A0E0: 85 E1   
	JSR $A658				; $A0E2: 20 58 A6 ; -> sub_A658
	LDX #$00				 ; $A0E5: A2 00   
	LDA #$11				 ; $A0E7: A9 11   
	STA $7046,X			  ; $A0E9: 9D 46 70
	LDX #$01				 ; $A0EC: A2 01   
	LDA #$22				 ; $A0EE: A9 22   
	STA $7046,X			  ; $A0F0: 9D 46 70
	JSR $D214				; $A0F3: 20 14 D2 ; Call to fixed bank
	JMP $B0AE				; $A0F6: 4C AE B0
	JSR $D214				; $A0F9: 20 14 D2 ; Call to fixed bank
	JSR $A6C5				; $A0FC: 20 C5 A6 ; -> sub_A6C5

; ---- Subroutine at $A0FF (Bank 21) ----
sub_A0FF:
	LDA #$82				 ; $A0FF: A9 82   
	PHA					  ; $A101: 48	  
	LDA #$01				 ; $A102: A9 01   
	STA submap_number		; $A104: 85 64   
	LDA #$04				 ; $A106: A9 04   
	STA $44				  ; $A108: 85 44   
	LDA #$0C				 ; $A10A: A9 0C   
	STA $45				  ; $A10C: 85 45   
	JSR $B03F				; $A10E: 20 3F B0 ; -> sub_B03F
	PLA					  ; $A111: 68	  
	BRK					  ; $A112: 00	  
	AND ($EF),Y			  ; $A113: 31 EF   
	JMP $C5BF				; $A115: 4C BF C5
	LDA $628F				; $A118: AD 8F 62
	AND #$0F				 ; $A11B: 29 0F   
	STA $E3				  ; $A11D: 85 E3   
	LDA $628F				; $A11F: AD 8F 62
	LSR					  ; $A122: 4A	  
	LSR					  ; $A123: 4A	  
	LSR					  ; $A124: 4A	  
	LSR					  ; $A125: 4A	  
	STA $E2				  ; $A126: 85 E2   
	LDA #$00				 ; $A128: A9 00   
	STA $FE				  ; $A12A: 85 FE   
	STA $FF				  ; $A12C: 85 FF   
	JSR $A66A				; $A12E: 20 6A A6 ; -> sub_A66A
	JSR $9AC9				; $A131: 20 C9 9A ; -> sub_9AC9
	BNE $A187				; $A134: D0 51   
	JSR $A668				; $A136: 20 68 A6 ; -> sub_A668
	BRK					  ; $A139: 00	  
	.byte $83			  ; $A13A - Unknown opcode
	.byte $2B			  ; $A13B - Unknown opcode
	LDA $E2				  ; $A13C: A5 E2   
	LDY #$28				 ; $A13E: A0 28   
	JSR $A1E7				; $A140: 20 E7 A1 ; -> sub_A1E7
	STA $E2				  ; $A143: 85 E2   
	STY $DA				  ; $A145: 84 DA   
	LDA $E3				  ; $A147: A5 E3   
	LDY #$06				 ; $A149: A0 06   
	JSR $A1E7				; $A14B: 20 E7 A1 ; -> sub_A1E7
	STA $E3				  ; $A14E: 85 E3   
	STY $DB				  ; $A150: 84 DB   
	TYA					  ; $A152: 98	  
	ORA $DA				  ; $A153: 05 DA   
	BEQ $A184				; $A155: F0 2D   
	LDA $DB				  ; $A157: A5 DB   
	BEQ $A164				; $A159: F0 09   
	JSR $A1DB				; $A15B: 20 DB A1 ; -> sub_A1DB
	JSR $A660				; $A15E: 20 60 A6 ; -> sub_A660
	BRK					  ; $A161: 00	  
	.byte $83			  ; $A162 - Unknown opcode
	.byte $2B			  ; $A163 - Unknown opcode
loc_A164:
	LDA $DA				  ; $A164: A5 DA   
	BEQ $A170				; $A166: F0 08   
	STA $FD				  ; $A168: 85 FD   
	JSR $A65C				; $A16A: 20 5C A6 ; -> sub_A65C
	BRK					  ; $A16D: 00	  
	.byte $83			  ; $A16E - Unknown opcode
	.byte $2B			  ; $A16F - Unknown opcode
loc_A170:
	JSR $A658				; $A170: 20 58 A6 ; -> sub_A658
	LDA $E2				  ; $A173: A5 E2   
	ASL					  ; $A175: 0A	  
	ASL					  ; $A176: 0A	  
	ASL					  ; $A177: 0A	  
	ASL					  ; $A178: 0A	  
	ORA $E3				  ; $A179: 05 E3   
	STA $628F				; $A17B: 8D 8F 62
	CMP #$77				 ; $A17E: C9 77	; Compare with 119
	BEQ $A1C0				; $A180: F0 3E   
	BNE $A187				; $A182: D0 03   
loc_A184:
	JSR $A654				; $A184: 20 54 A6 ; -> sub_A654
loc_A187:
	JSR $A650				; $A187: 20 50 A6 ; -> sub_A650
	LDA $628F				; $A18A: AD 8F 62
	AND #$0F				 ; $A18D: 29 0F   
	STA tmp0				 ; $A18F: 85 00   
	LDA #$07				 ; $A191: A9 07   
	SEC					  ; $A193: 38	  
	SBC tmp0				 ; $A194: E5 00	; Arithmetic
	BEQ $A1A1				; $A196: F0 09   
	JSR $A1DB				; $A198: 20 DB A1 ; -> sub_A1DB
	JSR $A660				; $A19B: 20 60 A6 ; -> sub_A660
	BRK					  ; $A19E: 00	  
	.byte $83			  ; $A19F - Unknown opcode
	.byte $2B			  ; $A1A0 - Unknown opcode
loc_A1A1:
	LDA $628F				; $A1A1: AD 8F 62
	AND #$F0				 ; $A1A4: 29 F0   
	STA tmp0				 ; $A1A6: 85 00   
	LDA #$70				 ; $A1A8: A9 70   
	SEC					  ; $A1AA: 38	  
	SBC tmp0				 ; $A1AB: E5 00	; Arithmetic
	BEQ $A1BB				; $A1AD: F0 0C   
	LSR					  ; $A1AF: 4A	  
	LSR					  ; $A1B0: 4A	  
	LSR					  ; $A1B1: 4A	  
	LSR					  ; $A1B2: 4A	  
	STA $FD				  ; $A1B3: 85 FD   
	JSR $A65C				; $A1B5: 20 5C A6 ; -> sub_A65C
	BRK					  ; $A1B8: 00	  
	.byte $83			  ; $A1B9 - Unknown opcode
	.byte $2B			  ; $A1BA - Unknown opcode
loc_A1BB:
	LDA #$07				 ; $A1BB: A9 07   
	JMP $A66A				; $A1BD: 4C 6A A6
loc_A1C0:
	LDA #$EA				 ; $A1C0: A9 EA   
	STA $70				  ; $A1C2: 85 70   
	LDA #$00				 ; $A1C4: A9 00   
	STA $71				  ; $A1C6: 85 71   
	LDA #$60				 ; $A1C8: A9 60   
	BRK					  ; $A1CA: 00	  
	.byte $4B			  ; $A1CB - Unknown opcode
	.byte $73			  ; $A1CC - Unknown opcode
	LDA #$08				 ; $A1CD: A9 08   
	JSR $A66A				; $A1CF: 20 6A A6 ; -> sub_A66A
	BRK					  ; $A1D2: 00	  
	ORA $10CB				; $A1D3: 0D CB 10
	LDA #$09				 ; $A1D6: A9 09   
	JMP $A66A				; $A1D8: 4C 6A A6

; ---- Subroutine at $A1DB (Bank 21) ----
sub_A1DB:
	CLC					  ; $A1DB: 18	  
	ADC #$01				 ; $A1DC: 69 01	; Arithmetic
	STA $0554				; $A1DE: 8D 54 05
	LDA #$40				 ; $A1E1: A9 40   
	STA $0555				; $A1E3: 8D 55 05
	RTS					  ; $A1E6: 60	  

; ---- Subroutine at $A1E7 (Bank 21) ----
sub_A1E7:
	STY tmp1				 ; $A1E7: 84 01   
	LDY #$00				 ; $A1E9: A0 00   
	STA tmp0				 ; $A1EB: 85 00   
	CMP #$07				 ; $A1ED: C9 07	; Compare with 7
	BEQ $A209				; $A1EF: F0 18   
loc_A1F1:
	LDA tmp1				 ; $A1F1: A5 01   
	BRK					  ; $A1F3: 00	  
	ROR $73				  ; $A1F4: 66 73   
	BCC $A209				; $A1F6: 90 11   
	TAX					  ; $A1F8: AA	  
	LDA $73				  ; $A1F9: A5 73   
	BRK					  ; $A1FB: 00	  
	.byte $2F			  ; $A1FC - Unknown opcode
	.byte $73			  ; $A1FD - Unknown opcode
	INY					  ; $A1FE: C8	  
	INC tmp0				 ; $A1FF: E6 00   
	LDA tmp0				 ; $A201: A5 00   
	CMP #$07				 ; $A203: C9 07	; Compare with 7
	BCS $A209				; $A205: B0 02   
	BCC $A1F1				; $A207: 90 E8   
loc_A209:
	LDA tmp0				 ; $A209: A5 00   
	RTS					  ; $A20B: 60	  
	JSR $D218				; $A20C: 20 18 D2 ; Call to fixed bank
	BRK					  ; $A20F: 00	  
	ORA $CB				  ; $A210: 05 CB   
	ORA ($A2,X)			  ; $A212: 01 A2   
	.byte $02			  ; $A214 - Unknown opcode
	LDA #$11				 ; $A215: A9 11   
	STA $7046,X			  ; $A217: 9D 46 70
	RTS					  ; $A21A: 60	  
	JSR $9A93				; $A21B: 20 93 9A ; -> sub_9A93
	BNE $A235				; $A21E: D0 15   
	BRK					  ; $A220: 00	  
	.byte $23			  ; $A221 - Unknown opcode
	.byte $3B			  ; $A222 - Unknown opcode
	JSR $9AC9				; $A223: 20 C9 9A ; -> sub_9AC9
	BEQ $A22B				; $A226: F0 03   
	JMP $A231				; $A228: 4C 31 A2

; ---- Subroutine at $A22B (Bank 21) ----
sub_A22B:
	BRK					  ; $A22B: 00	  
	BIT $3B				  ; $A22C: 24 3B   
	JMP $B830				; $A22E: 4C 30 B8
loc_A231:
	BRK					  ; $A231: 00	  
	AND $3B				  ; $A232: 25 3B   
	RTS					  ; $A234: 60	  
loc_A235:
	BRK					  ; $A235: 00	  
	ROL $3B				  ; $A236: 26 3B   
	JSR $9AC9				; $A238: 20 C9 9A ; -> sub_9AC9
	BEQ $A241				; $A23B: F0 04   
	BRK					  ; $A23D: 00	  
	PLP					  ; $A23E: 28	  
	.byte $3B			  ; $A23F - Unknown opcode
loc_A240:
	RTS					  ; $A240: 60	  
loc_A241:
	JMP $A48C				; $A241: 4C 8C A4
	BRK					  ; $A244: 00	  
	ORA $20EB				; $A245: 0D EB 20
	BNE $A240				; $A248: D0 F6   
	BEQ $A252				; $A24A: F0 06   
	JSR $B0AE				; $A24C: 20 AE B0 ; -> sub_B0AE
	JMP $A2C8				; $A24F: 4C C8 A2
loc_A252:
	JSR $A2C8				; $A252: 20 C8 A2 ; -> sub_A2C8
	JMP $990D				; $A255: 4C 0D 99

; ---- Subroutine at $A258 (Bank 21) ----
sub_A258:
	JSR $C891				; $A258: 20 91 C8 ; Call to fixed bank
	STA tmp0				 ; $A25B: 85 00   
	LDA #$00				 ; $A25D: A9 00   
	STA tmp1				 ; $A25F: 85 01   
	LDX #$00				 ; $A261: A2 00   
	LDA $07C4				; $A263: AD C4 07
	JSR $C851				; $A266: 20 51 C8 ; Call to fixed bank
	STA $DA				  ; $A269: 85 DA   
	RTS					  ; $A26B: 60	  
loc_A26C:
	LDA $DA				  ; $A26C: A5 DA   
	CMP #$03				 ; $A26E: C9 03	; Compare with 3
	BCC $A282				; $A270: 90 10   
	SEC					  ; $A272: 38	  
	SBC #$03				 ; $A273: E9 03	; Arithmetic
	TAX					  ; $A275: AA	  
loc_A276:
	LDA $62E7,X			  ; $A276: BD E7 62
	BNE $A27F				; $A279: D0 04   
	INX					  ; $A27B: E8	  
	JMP $A276				; $A27C: 4C 76 A2
loc_A27F:
	DEC $62E7,X			  ; $A27F: DE E7 62
loc_A282:
	LDA tmp0				 ; $A282: A5 00   
	CLC					  ; $A284: 18	  
	ADC $07C6				; $A285: 6D C6 07 ; Arithmetic
	STA $07C6				; $A288: 8D C6 07
	LDA tmp1				 ; $A28B: A5 01   
	ADC $07C7				; $A28D: 6D C7 07 ; Arithmetic
	STA $07C7				; $A290: 8D C7 07
	LDA tmp2				 ; $A293: A5 02   
	ADC $07C8				; $A295: 6D C8 07 ; Arithmetic
	STA $07C8				; $A298: 8D C8 07
	LDA $07C6				; $A29B: AD C6 07
	CMP #$64				 ; $A29E: C9 64	; Compare with 100
	LDA $07C7				; $A2A0: AD C7 07
	SBC #$00				 ; $A2A3: E9 00	; Arithmetic
	LDA $07C8				; $A2A5: AD C8 07
	SBC #$00				 ; $A2A8: E9 00	; Arithmetic
	BCC $A2C7				; $A2AA: 90 1B   
	BRK					  ; $A2AC: 00	  
	ORA #$CB				 ; $A2AD: 09 CB   
	.byte $04			  ; $A2AF - Unknown opcode
	LDX #$0E				 ; $A2B0: A2 0E   
	LDA #$11				 ; $A2B2: A9 11   
	STA $7046,X			  ; $A2B4: 9D 46 70
	LDX #$0F				 ; $A2B7: A2 0F   
	LDA $07C6				; $A2B9: AD C6 07
	STA $FD				  ; $A2BC: 85 FD   
	LDA #$00				 ; $A2BE: A9 00   
	STA $FE				  ; $A2C0: 85 FE   
	STA $FF				  ; $A2C2: 85 FF   
	JSR $9D92				; $A2C4: 20 92 9D ; -> sub_9D92
loc_A2C7:
	RTS					  ; $A2C7: 60	  

; ---- Subroutine at $A2C8 (Bank 21) ----
sub_A2C8:
	BRK					  ; $A2C8: 00	  
	ORA $20CB				; $A2C9: 0D CB 20
	LDA #$01				 ; $A2CC: A9 01   
	STA $07C5				; $A2CE: 8D C5 07
	BRK					  ; $A2D1: 00	  
	ORA #$CB				 ; $A2D2: 09 CB   
	ORA ($20,X)			  ; $A2D4: 01 20   
	CMP #$A4				 ; $A2D6: C9 A4	; Compare with 164
	JSR $C891				; $A2D8: 20 91 C8 ; Call to fixed bank
	CMP #$30				 ; $A2DB: C9 30	; Compare with 48
	BCS $A2E2				; $A2DD: B0 03   
	JMP $A40E				; $A2DF: 4C 0E A4
loc_A2E2:
	BRK					  ; $A2E2: 00	  
	AND #$3B				 ; $A2E3: 29 3B   
	JSR $9AC9				; $A2E5: 20 C9 9A ; -> sub_9AC9
	BEQ $A2EE				; $A2E8: F0 04   
	BRK					  ; $A2EA: 00	  
	ROL					  ; $A2EB: 2A	  
	.byte $3B			  ; $A2EC - Unknown opcode
	RTS					  ; $A2ED: 60	  
loc_A2EE:
	BRK					  ; $A2EE: 00	  
	.byte $2B			  ; $A2EF - Unknown opcode
	.byte $3B			  ; $A2F0 - Unknown opcode
	JSR $9AC9				; $A2F1: 20 C9 9A ; -> sub_9AC9
	BEQ $A2FB				; $A2F4: F0 05   
	BRK					  ; $A2F6: 00	  
	BIT $B03B				; $A2F7: 2C 3B B0
	INC $20,X				; $A2FA: F6 20   
	.byte $EF			  ; $A2FC - Unknown opcode
	LDA ($A9),Y			  ; $A2FD: B1 A9   
	RTS					  ; $A2FF: 60	  
	JSR $B7B5				; $A300: 20 B5 B7 ; -> sub_B7B5
	JSR $A258				; $A303: 20 58 A2 ; -> sub_A258
	TAX					  ; $A306: AA	  
	LDA $07BD,X			  ; $A307: BD BD 07
	STA $F9				  ; $A30A: 85 F9   
loc_A30C:
	LDA $F9				  ; $A30C: A5 F9   
	STA tmp0				 ; $A30E: 85 00   
	JSR $B2CF				; $A310: 20 CF B2 ; -> sub_B2CF
	JSR $A47C				; $A313: 20 7C A4 ; -> sub_A47C
	BRK					  ; $A316: 00	  
	AND $203B				; $A317: 2D 3B 20
	CMP #$9A				 ; $A31A: C9 9A	; Compare with 154
	BEQ $A33E				; $A31C: F0 20   
	JSR $C891				; $A31E: 20 91 C8 ; Call to fixed bank
	CMP #$40				 ; $A321: C9 40	; Compare with 64
	BCC $A361				; $A323: 90 3C   
	CMP #$80				 ; $A325: C9 80	; Compare with 128
	BCS $A32C				; $A327: B0 03   
	JMP $A394				; $A329: 4C 94 A3
loc_A32C:
	JSR $C891				; $A32C: 20 91 C8 ; Call to fixed bank
	CMP #$80				 ; $A32F: C9 80	; Compare with 128
	BCS $A336				; $A331: B0 03   
	JMP $A3C9				; $A333: 4C C9 A3
loc_A336:
	BRK					  ; $A336: 00	  
	ROL $003B				; $A337: 2E 3B 00
	.byte $83			  ; $A33A - Unknown opcode
	.byte $2B			  ; $A33B - Unknown opcode
	BCS $A30C				; $A33C: B0 CE   
loc_A33E:
	JSR $C891				; $A33E: 20 91 C8 ; Call to fixed bank
	CMP #$20				 ; $A341: C9 20	; Compare with 32
	BCS $A348				; $A343: B0 03   
	JMP $A3CD				; $A345: 4C CD A3
loc_A348:
	CMP #$40				 ; $A348: C9 40	; Compare with 64
	BCS $A34F				; $A34A: B0 03   
	JMP $A3D1				; $A34C: 4C D1 A3
loc_A34F:
	CMP #$60				 ; $A34F: C9 60	; Compare with 96
	BCS $A356				; $A351: B0 03   
	JMP $A3D5				; $A353: 4C D5 A3
loc_A356:
	BRK					  ; $A356: 00	  
	.byte $2F			  ; $A357 - Unknown opcode
	.byte $3B			  ; $A358 - Unknown opcode
	LDX #$04				 ; $A359: A2 04   
	JSR $9DB8				; $A35B: 20 B8 9D ; -> sub_9DB8
	JMP $A26C				; $A35E: 4C 6C A2
loc_A361:
	JSR $A3EC				; $A361: 20 EC A3 ; -> sub_A3EC
	LDA $DE				  ; $A364: A5 DE   
	SEC					  ; $A366: 38	  
	SBC $E1				  ; $A367: E5 E1	; Arithmetic
	STA $FD				  ; $A369: 85 FD   
	LDA $DF				  ; $A36B: A5 DF   
	SBC $E2				  ; $A36D: E5 E2	; Arithmetic
	STA $FE				  ; $A36F: 85 FE   
	LDA $E0				  ; $A371: A5 E0   
	SBC $E3				  ; $A373: E5 E3	; Arithmetic
	STA $FF				  ; $A375: 85 FF   
	BRK					  ; $A377: 00	  
	BMI $A3B5				; $A378: 30 3B   
	JSR $9AC9				; $A37A: 20 C9 9A ; -> sub_9AC9
	BNE $A38B				; $A37D: D0 0C   
	LDA #$01				 ; $A37F: A9 01   
	STA tmp0				 ; $A381: 85 00   
	LDA #$00				 ; $A383: A9 00   
	STA tmp1				 ; $A385: 85 01   
	STA tmp2				 ; $A387: 85 02   
	BEQ $A33E				; $A389: F0 B3   
loc_A38B:
	JSR $C891				; $A38B: 20 91 C8 ; Call to fixed bank
	CMP #$80				 ; $A38E: C9 80	; Compare with 128
	BCC $A3C9				; $A390: 90 37   
	BCS $A336				; $A392: B0 A2   
loc_A394:
	JSR $A3EC				; $A394: 20 EC A3 ; -> sub_A3EC
	LDA $DE				  ; $A397: A5 DE   
	CLC					  ; $A399: 18	  
	ADC $E1				  ; $A39A: 65 E1	; Arithmetic
	STA $FD				  ; $A39C: 85 FD   
	LDA $DF				  ; $A39E: A5 DF   
	ADC $E2				  ; $A3A0: 65 E2	; Arithmetic
	STA $FE				  ; $A3A2: 85 FE   
	LDA $E0				  ; $A3A4: A5 E0   
	ADC $E3				  ; $A3A6: 65 E3	; Arithmetic
	STA $FF				  ; $A3A8: 85 FF   
	BRK					  ; $A3AA: 00	  
	AND ($3B),Y			  ; $A3AB: 31 3B   
	JSR $9AC9				; $A3AD: 20 C9 9A ; -> sub_9AC9
	BEQ $A3B7				; $A3B0: F0 05   
	LDA $F9				  ; $A3B2: A5 F9   
	JMP $A32C				; $A3B4: 4C 2C A3
loc_A3B7:
	JSR $C891				; $A3B7: 20 91 C8 ; Call to fixed bank
	CMP #$40				 ; $A3BA: C9 40	; Compare with 64
	BCS $A3C9				; $A3BC: B0 0B   
	BRK					  ; $A3BE: 00	  
	.byte $32			  ; $A3BF - Unknown opcode
	.byte $3B			  ; $A3C0 - Unknown opcode
	LDX #$03				 ; $A3C1: A2 03   
	JSR $9DB8				; $A3C3: 20 B8 9D ; -> sub_9DB8
	JMP $A26C				; $A3C6: 4C 6C A2
loc_A3C9:
	BRK					  ; $A3C9: 00	  
	.byte $33			  ; $A3CA - Unknown opcode
	.byte $3B			  ; $A3CB - Unknown opcode
	RTS					  ; $A3CC: 60	  
loc_A3CD:
	BRK					  ; $A3CD: 00	  
	AND $3B,X				; $A3CE: 35 3B   
	RTS					  ; $A3D0: 60	  
loc_A3D1:
	BRK					  ; $A3D1: 00	  
	ROL $3B,X				; $A3D2: 36 3B   
	RTS					  ; $A3D4: 60	  
loc_A3D5:
	BRK					  ; $A3D5: 00	  
	.byte $37			  ; $A3D6 - Unknown opcode
	.byte $3B			  ; $A3D7 - Unknown opcode
	JSR $9AC9				; $A3D8: 20 C9 9A ; -> sub_9AC9
	BEQ $A3E1				; $A3DB: F0 04   
	BRK					  ; $A3DD: 00	  
	AND $603B,Y			  ; $A3DE: 39 3B 60
loc_A3E1:
	BRK					  ; $A3E1: 00	  
	SEC					  ; $A3E2: 38	  
	.byte $3B			  ; $A3E3 - Unknown opcode
	LDX #$04				 ; $A3E4: A2 04   
	JSR $9DB8				; $A3E6: 20 B8 9D ; -> sub_9DB8
	JMP $A26C				; $A3E9: 4C 6C A2

; ---- Subroutine at $A3EC (Bank 21) ----
sub_A3EC:
	LDA $FD				  ; $A3EC: A5 FD   
	STA tmp0				 ; $A3EE: 85 00   
	STA $DE				  ; $A3F0: 85 DE   
	LDA $FE				  ; $A3F2: A5 FE   
	STA tmp1				 ; $A3F4: 85 01   
	STA $DF				  ; $A3F6: 85 DF   
	LDA $FF				  ; $A3F8: A5 FF   
	STA tmp2				 ; $A3FA: 85 02   
	STA $E0				  ; $A3FC: 85 E0   
	JSR $B424				; $A3FE: 20 24 B4 ; -> sub_B424
	LDA tmp0				 ; $A401: A5 00   
	STA $E1				  ; $A403: 85 E1   
	LDA tmp1				 ; $A405: A5 01   
	STA $E2				  ; $A407: 85 E2   
	LDA tmp2				 ; $A409: A5 02   
	STA $E3				  ; $A40B: 85 E3   
	RTS					  ; $A40D: 60	  
loc_A40E:
	BRK					  ; $A40E: 00	  
	AND #$3B				 ; $A40F: 29 3B   
	JSR $9AC9				; $A411: 20 C9 9A ; -> sub_9AC9
	BEQ $A41A				; $A414: F0 04   
	BRK					  ; $A416: 00	  
	.byte $3B			  ; $A417 - Unknown opcode
	.byte $3B			  ; $A418 - Unknown opcode
	RTS					  ; $A419: 60	  
loc_A41A:
	BRK					  ; $A41A: 00	  
	.byte $3C			  ; $A41B - Unknown opcode
	.byte $3B			  ; $A41C - Unknown opcode
	JSR $9AC9				; $A41D: 20 C9 9A ; -> sub_9AC9
	BEQ $A426				; $A420: F0 04   
	BRK					  ; $A422: 00	  
	AND $603B,X			  ; $A423: 3D 3B 60
loc_A426:
	JSR $C891				; $A426: 20 91 C8 ; Call to fixed bank
	CMP #$08				 ; $A429: C9 08	; Compare with 8
	BCC $A441				; $A42B: 90 14   
	JSR $C891				; $A42D: 20 91 C8 ; Call to fixed bank
	STA tmp0				 ; $A430: 85 00   
	LDA #$00				 ; $A432: A9 00   
	STA tmp1				 ; $A434: 85 01   
	LDX #$00				 ; $A436: A2 00   
	LDA #$05				 ; $A438: A9 05   
	JSR $C851				; $A43A: 20 51 C8 ; Call to fixed bank
	TAX					  ; $A43D: AA	  
	JMP $A443				; $A43E: 4C 43 A4
loc_A441:
	LDX #$05				 ; $A441: A2 05   
loc_A443:
	LDA $A476,X			  ; $A443: BD 76 A4
	STX $DA				  ; $A446: 86 DA   
	STA $F9				  ; $A448: 85 F9   
	STA tmp0				 ; $A44A: 85 00   
	JSR $B35F				; $A44C: 20 5F B3 ; -> sub_B35F
	JSR $A47C				; $A44F: 20 7C A4 ; -> sub_A47C
	BRK					  ; $A452: 00	  
	ROL $203B,X			  ; $A453: 3E 3B 20
	CMP #$9A				 ; $A456: C9 9A	; Compare with 154
	BEQ $A45E				; $A458: F0 04   
	BRK					  ; $A45A: 00	  
	.byte $3F			  ; $A45B - Unknown opcode
	.byte $3B			  ; $A45C - Unknown opcode
	RTS					  ; $A45D: 60	  
loc_A45E:
	LDA $DA				  ; $A45E: A5 DA   
	CMP #$03				 ; $A460: C9 03	; Compare with 3
	BCC $A472				; $A462: 90 0E   
	SEC					  ; $A464: 38	  
	SBC #$03				 ; $A465: E9 03	; Arithmetic
	TAX					  ; $A467: AA	  
	INC $62E7,X			  ; $A468: FE E7 62
	BNE $A472				; $A46B: D0 05   
	LDA #$FF				 ; $A46D: A9 FF   
	STA $62E7,X			  ; $A46F: 9D E7 62
loc_A472:
	BRK					  ; $A472: 00	  
	RTI					  ; $A473: 40	  
	.byte $3B			  ; $A474 - Unknown opcode
	RTS					  ; $A475: 60	  
	ORA (tmp2,X)			 ; $A476: 01 02   
	ORA #$0B				 ; $A478: 09 0B   
	.byte $04			  ; $A47A - Unknown opcode
	.byte $23			  ; $A47B - Unknown opcode

; ---- Subroutine at $A47C (Bank 21) ----
sub_A47C:
	LDA tmp0				 ; $A47C: A5 00   
	STA $FD				  ; $A47E: 85 FD   
	LDA tmp1				 ; $A480: A5 01   
	STA $FE				  ; $A482: 85 FE   
	LDA tmp2				 ; $A484: A5 02   
	STA $FF				  ; $A486: 85 FF   
	RTS					  ; $A488: 60	  
	JSR $B0AE				; $A489: 20 AE B0 ; -> sub_B0AE

; ---- Subroutine at $A48C (Bank 21) ----
sub_A48C:
	JSR $A49E				; $A48C: 20 9E A4 ; -> sub_A49E
	JSR $B0AE				; $A48F: 20 AE B0 ; -> sub_B0AE
	JMP $D218				; $A492: 4C 18 D2
loc_A495:
	JSR $A49E				; $A495: 20 9E A4 ; -> sub_A49E
	JSR $B0AE				; $A498: 20 AE B0 ; -> sub_B0AE
	JMP $D210				; $A49B: 4C 10 D2

; ---- Subroutine at $A49E (Bank 21) ----
sub_A49E:
	LDX $E8				  ; $A49E: A6 E8   
	LDA #$11				 ; $A4A0: A9 11   
	STA $7040,X			  ; $A4A2: 9D 40 70
	RTS					  ; $A4A5: 60	  
	LDA #$05				 ; $A4A6: A9 05   
	BRK					  ; $A4A8: 00	  
	.byte $07			  ; $A4A9 - Unknown opcode
	.byte $CF			  ; $A4AA - Unknown opcode
	JMP $B0B2				; $A4AB: 4C B2 B0
	LDA #$04				 ; $A4AE: A9 04   
	BRK					  ; $A4B0: 00	  
	.byte $07			  ; $A4B1 - Unknown opcode
	.byte $CF			  ; $A4B2 - Unknown opcode
	JMP $B0B2				; $A4B3: 4C B2 B0
loc_A4B6:
	BRK					  ; $A4B6: 00	  
	.byte $07			  ; $A4B7 - Unknown opcode
	.byte $DF			  ; $A4B8 - Unknown opcode
	RTS					  ; $A4B9: 60	  
	JSR $A4C9				; $A4BA: 20 C9 A4 ; -> sub_A4C9
	BRK					  ; $A4BD: 00	  
	.byte $04			  ; $A4BE - Unknown opcode
	.byte $3B			  ; $A4BF - Unknown opcode
	BRK					  ; $A4C0: 00	  
	.byte $42			  ; $A4C1 - Unknown opcode
	.byte $3B			  ; $A4C2 - Unknown opcode
	JSR $C8CC				; $A4C3: 20 CC C8 ; Call to fixed bank
	JMP $D1F3				; $A4C6: 4C F3 D1

; ---- Subroutine at $A4C9 (Bank 21) ----
sub_A4C9:
	LDA tmp0				 ; $A4C9: A5 00   
	PHA					  ; $A4CB: 48	  
	LDA tmp1				 ; $A4CC: A5 01   
	PHA					  ; $A4CE: 48	  
	LDA #$43				 ; $A4CF: A9 43   
	JSR $B7B5				; $A4D1: 20 B5 B7 ; -> sub_B7B5
	BRK					  ; $A4D4: 00	  
	ORA $6F				  ; $A4D5: 05 6F   
	PLA					  ; $A4D7: 68	  
	STA tmp1				 ; $A4D8: 85 01   
	PLA					  ; $A4DA: 68	  
	STA tmp0				 ; $A4DB: 85 00   
	RTS					  ; $A4DD: 60	  
	BRK					  ; $A4DE: 00	  
	ORA $CB				  ; $A4DF: 05 CB   
	PHP					  ; $A4E1: 08	  
	BRK					  ; $A4E2: 00	  
	ASL $40CB				; $A4E3: 0E CB 40
	LDX #$01				 ; $A4E6: A2 01   
	LDA #$11				 ; $A4E8: A9 11   
	STA $7046,X			  ; $A4EA: 9D 46 70
	JMP $B0B6				; $A4ED: 4C B6 B0
	LDA #$77				 ; $A4F0: A9 77   
	JSR $B089				; $A4F2: 20 89 B0 ; -> sub_B089
	BCS $A4FD				; $A4F5: B0 06   
	JSR $A664				; $A4F7: 20 64 A6 ; -> sub_A664
	JMP $A668				; $A4FA: 4C 68 A6
loc_A4FD:
	BRK					  ; $A4FD: 00	  
	ROR					  ; $A4FE: 6A	  
	.byte $3B			  ; $A4FF - Unknown opcode
	RTS					  ; $A500: 60	  
	JSR $A664				; $A501: 20 64 A6 ; -> sub_A664
loc_A504:
	JSR $9AC9				; $A504: 20 C9 9A ; -> sub_9AC9
	BEQ $A50F				; $A507: F0 06   
	JSR $A668				; $A509: 20 68 A6 ; -> sub_A668
	JMP $A504				; $A50C: 4C 04 A5
loc_A50F:
	JSR $A660				; $A50F: 20 60 A6 ; -> sub_A660
	LDA #$56				 ; $A512: A9 56   
	JSR $B09A				; $A514: 20 9A B0 ; -> sub_B09A
	BRK					  ; $A517: 00	  
	ORA $CB				  ; $A518: 05 CB   
	.byte $04			  ; $A51A - Unknown opcode
	LDA #$06				 ; $A51B: A9 06   
	BRK					  ; $A51D: 00	  
	.byte $07			  ; $A51E - Unknown opcode
	.byte $CF			  ; $A51F - Unknown opcode
	RTS					  ; $A520: 60	  
	JSR $A664				; $A521: 20 64 A6 ; -> sub_A664
	JSR $9AC9				; $A524: 20 C9 9A ; -> sub_9AC9
	BEQ $A52C				; $A527: F0 03   
	JMP $A668				; $A529: 4C 68 A6
loc_A52C:
	LDA #$05				 ; $A52C: A9 05   
	BRK					  ; $A52E: 00	  
	.byte $63			  ; $A52F - Unknown opcode
	.byte $73			  ; $A530 - Unknown opcode
	TAX					  ; $A531: AA	  
	BRK					  ; $A532: 00	  
	AND $D053				; $A533: 2D 53 D0
	.byte $03			  ; $A536 - Unknown opcode
	JMP $A660				; $A537: 4C 60 A6
	JSR $A65C				; $A53A: 20 5C A6 ; -> sub_A65C
	LDA #$05				 ; $A53D: A9 05   
	BRK					  ; $A53F: 00	  
	.byte $63			  ; $A540 - Unknown opcode
	.byte $73			  ; $A541 - Unknown opcode
	TAX					  ; $A542: AA	  
	LDA #$1F				 ; $A543: A9 1F   
	JSR $B7B5				; $A545: 20 B5 B7 ; -> sub_B7B5
	CMP #$FF				 ; $A548: C9 FF	; Compare with 255
	BNE $A54F				; $A54A: D0 03   
	JMP $A5E1				; $A54C: 4C E1 A5
loc_A54F:
	STA $E3				  ; $A54F: 85 E3   
	LDA #$05				 ; $A551: A9 05   
	BRK					  ; $A553: 00	  
	.byte $63			  ; $A554 - Unknown opcode
	.byte $73			  ; $A555 - Unknown opcode
	TAX					  ; $A556: AA	  
	LDA $E3				  ; $A557: A5 E3   
	BRK					  ; $A559: 00	  
	BIT $8573				; $A55A: 2C 73 85
	.byte $E2			  ; $A55D - Unknown opcode
	BRK					  ; $A55E: 00	  
	.byte $0B			  ; $A55F - Unknown opcode
	.byte $0F			  ; $A560 - Unknown opcode
	CPX #$01				 ; $A561: E0 01   
	BEQ $A573				; $A563: F0 0E   
	CPX #$02				 ; $A565: E0 02   
	BEQ $A573				; $A567: F0 0A   
	CPX #$03				 ; $A569: E0 03   
	BEQ $A573				; $A56B: F0 06   
	JSR $A658				; $A56D: 20 58 A6 ; -> sub_A658
	JMP $A5CF				; $A570: 4C CF A5
loc_A573:
	LDA $E2				  ; $A573: A5 E2   
	BRK					  ; $A575: 00	  
	.byte $0F			  ; $A576 - Unknown opcode
	.byte $0F			  ; $A577 - Unknown opcode
	BCC $A582				; $A578: 90 08   
	LDA #$08				 ; $A57A: A9 08   
	JSR $A66A				; $A57C: 20 6A A6 ; -> sub_A66A
	JMP $A5CF				; $A57F: 4C CF A5
loc_A582:
	LDA $E2				  ; $A582: A5 E2   
	STA $F9				  ; $A584: 85 F9   
	STA tmp0				 ; $A586: 85 00   
	JSR $B2CF				; $A588: 20 CF B2 ; -> sub_B2CF
	JSR $A47C				; $A58B: 20 7C A4 ; -> sub_A47C
	LDA #$00				 ; $A58E: A9 00   
	STA ptr0_hi			  ; $A590: 85 05   
	JSR $C891				; $A592: 20 91 C8 ; Call to fixed bank
	CMP #$08				 ; $A595: C9 08	; Compare with 8
	BCC $A59F				; $A597: 90 06   
	JSR $A5E4				; $A599: 20 E4 A5 ; -> sub_A5E4
	JMP $A5A2				; $A59C: 4C A2 A5
loc_A59F:
	JSR $A5FA				; $A59F: 20 FA A5 ; -> sub_A5FA
loc_A5A2:
	LDA $FD				  ; $A5A2: A5 FD   
	STA $6F				  ; $A5A4: 85 6F   
	LDA $FE				  ; $A5A6: A5 FE   
	STA $70				  ; $A5A8: 85 70   
	LDA $FF				  ; $A5AA: A5 FF   
	STA $71				  ; $A5AC: 85 71   
	JSR $A654				; $A5AE: 20 54 A6 ; -> sub_A654
	JSR $9AC9				; $A5B1: 20 C9 9A ; -> sub_9AC9
	BEQ $A5BE				; $A5B4: F0 08   
	JSR $A64C				; $A5B6: 20 4C A6 ; -> sub_A64C
	BRK					  ; $A5B9: 00	  
	.byte $83			  ; $A5BA - Unknown opcode
	.byte $2B			  ; $A5BB - Unknown opcode
	BCS $A5CF				; $A5BC: B0 11   
loc_A5BE:
	JSR $A650				; $A5BE: 20 50 A6 ; -> sub_A650
	BRK					  ; $A5C1: 00	  
	.byte $4B			  ; $A5C2 - Unknown opcode
	.byte $33			  ; $A5C3 - Unknown opcode
	LDA #$05				 ; $A5C4: A9 05   
	BRK					  ; $A5C6: 00	  
	.byte $63			  ; $A5C7 - Unknown opcode
	.byte $73			  ; $A5C8 - Unknown opcode
	TAX					  ; $A5C9: AA	  
	LDA $E3				  ; $A5CA: A5 E3   
	BRK					  ; $A5CC: 00	  
	.byte $2F			  ; $A5CD - Unknown opcode
	.byte $73			  ; $A5CE - Unknown opcode
loc_A5CF:
	LDA #$09				 ; $A5CF: A9 09   
	JSR $A66A				; $A5D1: 20 6A A6 ; -> sub_A66A
	JSR $9AC9				; $A5D4: 20 C9 9A ; -> sub_9AC9
	BNE $A5DC				; $A5D7: D0 03   
	JMP $A52C				; $A5D9: 4C 2C A5
loc_A5DC:
	LDA #$0A				 ; $A5DC: A9 0A   
	JMP $A66A				; $A5DE: 4C 6A A6
loc_A5E1:
	JMP $A64C				; $A5E1: 4C 4C A6

; ---- Subroutine at $A5E4 (Bank 21) ----
sub_A5E4:
	JSR $C891				; $A5E4: 20 91 C8 ; Call to fixed bank
	STA ptr0_lo			  ; $A5E7: 85 04   
	LDX #$04				 ; $A5E9: A2 04   
	LDA #$00				 ; $A5EB: A9 00   
	STA ptr0_hi			  ; $A5ED: 85 05   
	LDA #$1B				 ; $A5EF: A9 1B   
	JSR $C827				; $A5F1: 20 27 C8 ; Call to fixed bank
	CLC					  ; $A5F4: 18	  
	ADC #$36				 ; $A5F5: 69 36	; Arithmetic
	JMP $A60D				; $A5F7: 4C 0D A6

; ---- Subroutine at $A5FA (Bank 21) ----
sub_A5FA:
	JSR $C891				; $A5FA: 20 91 C8 ; Call to fixed bank
	STA ptr0_lo			  ; $A5FD: 85 04   
	LDA #$00				 ; $A5FF: A9 00   
	STA ptr0_hi			  ; $A601: 85 05   
	LDX #$04				 ; $A603: A2 04   
	LDA #$21				 ; $A605: A9 21   
	JSR $C827				; $A607: 20 27 C8 ; Call to fixed bank
	CLC					  ; $A60A: 18	  
	ADC #$60				 ; $A60B: 69 60	; Arithmetic

; ---- Subroutine at $A60D (Bank 21) ----
sub_A60D:
	LDX #$FD				 ; $A60D: A2 FD   
	BRK					  ; $A60F: 00	  
	BPL $A651				; $A610: 10 3F   
	LDX #$06				 ; $A612: A2 06   
loc_A614:
	LSR $1A				  ; $A614: 46 1A   
	ROR $FF				  ; $A616: 66 FF   
	ROR $FE				  ; $A618: 66 FE   
	ROR $FD				  ; $A61A: 66 FD   
	DEX					  ; $A61C: CA	  
	BNE $A614				; $A61D: D0 F5   
	LDA $FF				  ; $A61F: A5 FF   
	ORA $FE				  ; $A621: 05 FE   
	ORA $FD				  ; $A623: 05 FD   
	ORA $1A				  ; $A625: 05 1A   
	BNE $A62B				; $A627: D0 02   
	INC $FD				  ; $A629: E6 FD   
loc_A62B:
	RTS					  ; $A62B: 60	  
	LDA #$00				 ; $A62C: A9 00   
	STA $71				  ; $A62E: 85 71   
	LDA #$EA				 ; $A630: A9 EA   
	STA $70				  ; $A632: 85 70   
	LDA #$60				 ; $A634: A9 60   
	BRK					  ; $A636: 00	  
	JMP $9073				; $A637: 4C 73 90
	ASL $0C00				; $A63A: 0E 00 0C
	.byte $CB			  ; $A63D - Unknown opcode
	RTI					  ; $A63E: 40	  
	BRK					  ; $A63F: 00	  
	ASL					  ; $A640: 0A	  
	.byte $CB			  ; $A641 - Unknown opcode
	BPL $A664				; $A642: 10 20   
	PLA					  ; $A644: 68	  
	LDX $4C				  ; $A645: A6 4C   
	RTS					  ; $A647: 60	  
	LDX $4C				  ; $A648: A6 4C   
	.byte $64			  ; $A64A - Unknown opcode
	LDX $A9				  ; $A64B: A6 A9   
	.byte $07			  ; $A64D - Unknown opcode
	BNE $A66A				; $A64E: D0 1A   

; ---- Subroutine at $A650 (Bank 21) ----
sub_A650:
	LDA #$06				 ; $A650: A9 06   
	BNE $A66A				; $A652: D0 16   

; ---- Subroutine at $A654 (Bank 21) ----
sub_A654:
	LDA #$05				 ; $A654: A9 05   
	BNE $A66A				; $A656: D0 12   

; ---- Subroutine at $A658 (Bank 21) ----
sub_A658:
	LDA #$04				 ; $A658: A9 04   
	BNE $A66A				; $A65A: D0 0E   

; ---- Subroutine at $A65C (Bank 21) ----
sub_A65C:
	LDA #$03				 ; $A65C: A9 03   
	BNE $A66A				; $A65E: D0 0A   

; ---- Subroutine at $A660 (Bank 21) ----
sub_A660:
	LDA #$02				 ; $A660: A9 02   
	BNE $A66A				; $A662: D0 06   

; ---- Subroutine at $A664 (Bank 21) ----
sub_A664:
	LDA #$00				 ; $A664: A9 00   
	BEQ $A66A				; $A666: F0 02   

; ---- Subroutine at $A668 (Bank 21) ----
sub_A668:
	LDA #$01				 ; $A668: A9 01   

; ---- Subroutine at $A66A (Bank 21) ----
sub_A66A:
	STA $0F				  ; $A66A: 85 0F   
	LDA $E0				  ; $A66C: A5 E0   
	CLC					  ; $A66E: 18	  
	ADC $0F				  ; $A66F: 65 0F	; Arithmetic
	LDX $E1				  ; $A671: A6 E1   
loc_A673:
	BCC $A676				; $A673: 90 01   
	INX					  ; $A675: E8	  
loc_A676:
	JMP $9919				; $A676: 4C 19 99
	LDA #$0E				 ; $A679: A9 0E   
	STA $44				  ; $A67B: 85 44   
	LDA #$05				 ; $A67D: A9 05   
	STA $45				  ; $A67F: 85 45   
	LDA #$82				 ; $A681: A9 82   
	BNE $A689				; $A683: D0 04   
	LDA $3D				  ; $A685: A5 3D   
	ORA #$80				 ; $A687: 09 80   
loc_A689:
	STA $DD				  ; $A689: 85 DD   
	JSR $D210				; $A68B: 20 10 D2 ; Call to fixed bank
	JSR $A6BC				; $A68E: 20 BC A6 ; -> sub_A6BC
	JMP $A6A9				; $A691: 4C A9 A6

; ---- Subroutine at $A694 (Bank 21) ----
sub_A694:
	LDA map_number		   ; $A694: A5 63   
	CMP #$19				 ; $A696: C9 19	; Compare with 25
	BNE $A6A3				; $A698: D0 09   
	LDA submap_number		; $A69A: A5 64   
	CMP #$01				 ; $A69C: C9 01	; Compare with 1
	BNE $A6A3				; $A69E: D0 03   
	JMP $AFF0				; $A6A0: 4C F0 AF
loc_A6A3:
	JSR $A6BC				; $A6A3: 20 BC A6 ; -> sub_A6BC
loc_A6A6:
	JSR $A6B7				; $A6A6: 20 B7 A6 ; -> sub_A6B7

; ---- Subroutine at $A6A9 (Bank 21) ----
sub_A6A9:
	LDA #$43				 ; $A6A9: A9 43   
	JSR $B7B5				; $A6AB: 20 B5 B7 ; -> sub_B7B5
	BRK					  ; $A6AE: 00	  
	ORA $6F				  ; $A6AF: 05 6F   
	JSR $B03F				; $A6B1: 20 3F B0 ; -> sub_B03F
	JMP $C5BF				; $A6B4: 4C BF C5

; ---- Subroutine at $A6B7 (Bank 21) ----
sub_A6B7:
	LDA #$07				 ; $A6B7: A9 07   
	JMP $B7B5				; $A6B9: 4C B5 B7

; ---- Subroutine at $A6BC (Bank 21) ----
sub_A6BC:
	LDA $DD				  ; $A6BC: A5 DD   
	PHA					  ; $A6BE: 48	  
	JSR $AEA6				; $A6BF: 20 A6 AE ; -> sub_AEA6
	PLA					  ; $A6C2: 68	  
	STA $DD				  ; $A6C3: 85 DD   

; ---- Subroutine at $A6C5 (Bank 21) ----
sub_A6C5:
	LDX #$00				 ; $A6C5: A2 00   
loc_A6C7:
	LDA $DA,X				; $A6C7: B5 DA   
	PHA					  ; $A6C9: 48	  
	INX					  ; $A6CA: E8	  
	CPX #$10				 ; $A6CB: E0 10   
	BCC $A6C7				; $A6CD: 90 F8   
	JSR $A732				; $A6CF: 20 32 A7 ; -> sub_A732
	JSR $A738				; $A6D2: 20 38 A7 ; -> sub_A738
	BRK					  ; $A6D5: 00	  
	.byte $0F			  ; $A6D6 - Unknown opcode
	.byte $FB			  ; $A6D7 - Unknown opcode
	LDA #$28				 ; $A6D8: A9 28   
	STA $62ED				; $A6DA: 8D ED 62
	BRK					  ; $A6DD: 00	  
	BRK					  ; $A6DE: 00	  
	.byte $E7			  ; $A6DF - Unknown opcode
	LDA $DD				  ; $A6E0: A5 DD   
	AND #$03				 ; $A6E2: 29 03   
	STA $3D				  ; $A6E4: 85 3D   
	LDA $DD				  ; $A6E6: A5 DD   
	AND #$83				 ; $A6E8: 29 83   
	BRK					  ; $A6EA: 00	  
	.byte $3C			  ; $A6EB - Unknown opcode
	.byte $EF			  ; $A6EC - Unknown opcode
	JSR $9F79				; $A6ED: 20 79 9F ; -> sub_9F79
	BRK					  ; $A6F0: 00	  
	ASL					  ; $A6F1: 0A	  
	.byte $6F			  ; $A6F2 - Unknown opcode
	JSR $A728				; $A6F3: 20 28 A7 ; -> sub_A728
	LDX #$0F				 ; $A6F6: A2 0F   
loc_A6F8:
	PLA					  ; $A6F8: 68	  
	STA $DA,X				; $A6F9: 95 DA   
	DEX					  ; $A6FB: CA	  
	BPL $A6F8				; $A6FC: 10 FA   
	RTS					  ; $A6FE: 60	  

; ---- Subroutine at $A6FF (Bank 21) ----
sub_A6FF:
	LDX #$00				 ; $A6FF: A2 00   
loc_A701:
	LDA $DA,X				; $A701: B5 DA   
	PHA					  ; $A703: 48	  
	INX					  ; $A704: E8	  
	CPX #$10				 ; $A705: E0 10   
	BCC $A701				; $A707: 90 F8   
	JSR $A732				; $A709: 20 32 A7 ; -> sub_A732
	BRK					  ; $A70C: 00	  
	.byte $0F			  ; $A70D - Unknown opcode
	.byte $FB			  ; $A70E - Unknown opcode
	JSR $AEA6				; $A70F: 20 A6 AE ; -> sub_AEA6
	LDA #$28				 ; $A712: A9 28   
	STA $62ED				; $A714: 8D ED 62
	JSR $9F79				; $A717: 20 79 9F ; -> sub_9F79
	JSR $A728				; $A71A: 20 28 A7 ; -> sub_A728
	LDX #$0F				 ; $A71D: A2 0F   
loc_A71F:
	PLA					  ; $A71F: 68	  
	STA $DA,X				; $A720: 95 DA   
	DEX					  ; $A722: CA	  
	BPL $A71F				; $A723: 10 FA   
	JMP $A6A6				; $A725: 4C A6 A6

; ---- Subroutine at $A728 (Bank 21) ----
sub_A728:
	BRK					  ; $A728: 00	  
	PLP					  ; $A729: 28	  
	.byte $0F			  ; $A72A - Unknown opcode
	LDA $0514				; $A72B: AD 14 05
	STA $05FD				; $A72E: 8D FD 05
	RTS					  ; $A731: 60	  

; ---- Subroutine at $A732 (Bank 21) ----
sub_A732:
	BRK					  ; $A732: 00	  
	.byte $04			  ; $A733 - Unknown opcode
	.byte $9F			  ; $A734 - Unknown opcode
	JMP $C5C5				; $A735: 4C C5 C5

; ---- Subroutine at $A738 (Bank 21) ----
sub_A738:
	LDA $615A				; $A738: AD 5A 61
	CMP #$04				 ; $A73B: C9 04	; Compare with 4
	BNE $A74B				; $A73D: D0 0C   
	LDA map_number		   ; $A73F: A5 63   
	CMP #$12				 ; $A741: C9 12	; Compare with 18
	BNE $A74B				; $A743: D0 06   
	LDA submap_number		; $A745: A5 64   
	CMP #$00				 ; $A747: C9 00	; Compare with 0
	BEQ $A74C				; $A749: F0 01   
loc_A74B:
	RTS					  ; $A74B: 60	  
loc_A74C:
	LDA $DD				  ; $A74C: A5 DD   
	PHA					  ; $A74E: 48	  
	LDA submap_number		; $A74F: A5 64   
	PHA					  ; $A751: 48	  
	LDA map_number		   ; $A752: A5 63   
	PHA					  ; $A754: 48	  
	LDA #$1C				 ; $A755: A9 1C   
	STA $DD				  ; $A757: 85 DD   
	BRK					  ; $A759: 00	  
	.byte $07			  ; $A75A - Unknown opcode
	.byte $CF			  ; $A75B - Unknown opcode
	PLA					  ; $A75C: 68	  
	STA map_number		   ; $A75D: 85 63   
	PLA					  ; $A75F: 68	  
	STA submap_number		; $A760: 85 64   
	BRK					  ; $A762: 00	  
	AND ($EF),Y			  ; $A763: 31 EF   
	PLA					  ; $A765: 68	  
	STA $DD				  ; $A766: 85 DD   
	RTS					  ; $A768: 60	  

; ---- Subroutine at $A769 (Bank 21) ----
sub_A769:
	BRK					  ; $A769: 00	  
	ROR $73				  ; $A76A: 66 73   
	BCC $A771				; $A76C: 90 03   
	LDA #$00				 ; $A76E: A9 00   
	RTS					  ; $A770: 60	  
loc_A771:
	LDA #$01				 ; $A771: A9 01   
	RTS					  ; $A773: 60	  

; ---- Subroutine at $A774 (Bank 21) ----
sub_A774:
	BRK					  ; $A774: 00	  
	.byte $63			  ; $A775 - Unknown opcode
	.byte $73			  ; $A776 - Unknown opcode
	TAX					  ; $A777: AA	  
	BRK					  ; $A778: 00	  
	AND $C973				; $A779: 2D 73 C9
	PHP					  ; $A77C: 08	  
	RTS					  ; $A77D: 60	  
	STA $0F				  ; $A77E: 85 0F   
	TXA					  ; $A780: 8A	  
	PHA					  ; $A781: 48	  
	BRK					  ; $A782: 00	  
	.byte $62			  ; $A783 - Unknown opcode
	.byte $33			  ; $A784 - Unknown opcode
	TAX					  ; $A785: AA	  
loc_A786:
	DEX					  ; $A786: CA	  
	BMI $A792				; $A787: 30 09   
	BRK					  ; $A789: 00	  
	.byte $2B			  ; $A78A - Unknown opcode
	.byte $73			  ; $A78B - Unknown opcode
	CMP $0F				  ; $A78C: C5 0F   
	BNE $A786				; $A78E: D0 F6   
	STX $0F				  ; $A790: 86 0F   
loc_A792:
	PLA					  ; $A792: 68	  
	TAX					  ; $A793: AA	  
	LDA $0F				  ; $A794: A5 0F   
	RTS					  ; $A796: 60	  
	BRK					  ; $A797: 00	  
	EOR $3B,X				; $A798: 55 3B   
loc_A79A:
	JSR $B046				; $A79A: 20 46 B0 ; -> sub_B046
	BRK					  ; $A79D: 00	  
	LSR $3B,X				; $A79E: 56 3B   
	JSR $A841				; $A7A0: 20 41 A8 ; -> sub_A841
	BCC $A7A8				; $A7A3: 90 03   
	JMP $A823				; $A7A5: 4C 23 A8
loc_A7A8:
	JSR $A85C				; $A7A8: 20 5C A8 ; -> sub_A85C
	STA $FD				  ; $A7AB: 85 FD   
	LDA #$00				 ; $A7AD: A9 00   
	STA $FE				  ; $A7AF: 85 FE   
	STA $FF				  ; $A7B1: 85 FF   
	BRK					  ; $A7B3: 00	  
	AND $204B				; $A7B4: 2D 4B 20
	.byte $B7			  ; $A7B7 - Unknown opcode
	LDX $A2				  ; $A7B8: A6 A2   
	SBC $62A9,X			  ; $A7BA: FD A9 62 ; Arithmetic
	JSR $B7B5				; $A7BD: 20 B5 B7 ; -> sub_B7B5
	CMP #$FF				 ; $A7C0: C9 FF	; Compare with 255
	BEQ $A835				; $A7C2: F0 71   
	LDA $FD				  ; $A7C4: A5 FD   
	ORA $FE				  ; $A7C6: 05 FE   
	ORA $FF				  ; $A7C8: 05 FF   
	BEQ $A835				; $A7CA: F0 69   
	LDA $FD				  ; $A7CC: A5 FD   
	STA $E2				  ; $A7CE: 85 E2   
	LDA $FE				  ; $A7D0: A5 FE   
	STA $E3				  ; $A7D2: 85 E3   
	LDA $FF				  ; $A7D4: A5 FF   
	STA $E4				  ; $A7D6: 85 E4   
	BRK					  ; $A7D8: 00	  
	.byte $57			  ; $A7D9 - Unknown opcode
	.byte $3B			  ; $A7DA - Unknown opcode
	LDX #$FD				 ; $A7DB: A2 FD   
	JSR $A85C				; $A7DD: 20 5C A8 ; -> sub_A85C
	BRK					  ; $A7E0: 00	  
	BPL $A822				; $A7E1: 10 3F   
	JSR $E52C				; $A7E3: 20 2C E5 ; Call to fixed bank
	BRK					  ; $A7E6: 00	  
	STA $203B				; $A7E7: 8D 3B 20
	CMP #$9A				 ; $A7EA: C9 9A	; Compare with 154
	BNE $A79A				; $A7EC: D0 AC   
	JSR $A84E				; $A7EE: 20 4E A8 ; -> sub_A84E
	BCC $A82F				; $A7F1: 90 3C   
	LDA $E2				  ; $A7F3: A5 E2   
	CLC					  ; $A7F5: 18	  
	ADC $62AD				; $A7F6: 6D AD 62 ; Arithmetic
	STA $FD				  ; $A7F9: 85 FD   
	LDA $E3				  ; $A7FB: A5 E3   
	ADC $62AE				; $A7FD: 6D AE 62 ; Arithmetic
	STA $FE				  ; $A800: 85 FE   
	LDA $E4				  ; $A802: A5 E4   
	ADC $62AF				; $A804: 6D AF 62 ; Arithmetic
	STA $FF				  ; $A807: 85 FF   
	JSR $A83A				; $A809: 20 3A A8 ; -> sub_A83A
	BCS $A828				; $A80C: B0 1A   
	BRK					  ; $A80E: 00	  
	CLI					  ; $A80F: 58	  
	.byte $3B			  ; $A810 - Unknown opcode
	LDA $FD				  ; $A811: A5 FD   
	STA $62AD				; $A813: 8D AD 62
	LDA $FE				  ; $A816: A5 FE   
	STA $62AE				; $A818: 8D AE 62
	LDA $FF				  ; $A81B: A5 FF   
	STA $62AF				; $A81D: 8D AF 62
loc_A820:
	JMP $A6B7				; $A820: 4C B7 A6
loc_A823:
	BRK					  ; $A823: 00	  
	.byte $83			  ; $A824 - Unknown opcode
	.byte $2B			  ; $A825 - Unknown opcode
	BCS $A82B				; $A826: B0 03   
loc_A828:
	BRK					  ; $A828: 00	  
	.byte $4B			  ; $A829 - Unknown opcode
	.byte $33			  ; $A82A - Unknown opcode
loc_A82B:
	BRK					  ; $A82B: 00	  
	CMP $4B,X				; $A82C: D5 4B   
	RTS					  ; $A82E: 60	  
loc_A82F:
	BRK					  ; $A82F: 00	  
	EOR $4C3B,Y			  ; $A830: 59 3B 4C
	TXS					  ; $A833: 9A	  
	.byte $A7			  ; $A834 - Unknown opcode
loc_A835:
	BRK					  ; $A835: 00	  
	.byte $5A			  ; $A836 - Unknown opcode
	.byte $3B			  ; $A837 - Unknown opcode
	BCS $A820				; $A838: B0 E6   

; ---- Subroutine at $A83A (Bank 21) ----
sub_A83A:
	LDA $FD				  ; $A83A: A5 FD   
	CMP #$40				 ; $A83C: C9 40	; Compare with 64
	JMP $A845				; $A83E: 4C 45 A8

; ---- Subroutine at $A841 (Bank 21) ----
sub_A841:
	LDA $FD				  ; $A841: A5 FD   
	CMP #$3F				 ; $A843: C9 3F	; Compare with 63
loc_A845:
	LDA $FE				  ; $A845: A5 FE   
	SBC #$42				 ; $A847: E9 42	; Arithmetic
	LDA $FF				  ; $A849: A5 FF   
	SBC #$0F				 ; $A84B: E9 0F	; Arithmetic
	RTS					  ; $A84D: 60	  

; ---- Subroutine at $A84E (Bank 21) ----
sub_A84E:
	LDA $FE				  ; $A84E: A5 FE   
	STA $70				  ; $A850: 85 70   
	LDA $FF				  ; $A852: A5 FF   
	STA $71				  ; $A854: 85 71   
	LDA $FD				  ; $A856: A5 FD   
	BRK					  ; $A858: 00	  
	JMP $6073				; $A859: 4C 73 60

; ---- Subroutine at $A85C (Bank 21) ----
sub_A85C:
	LDA $615A				; $A85C: AD 5A 61
	CMP #$01				 ; $A85F: C9 01	; Compare with 1
	BNE $A866				; $A861: D0 03   
	LDA #$0A				 ; $A863: A9 0A   
	RTS					  ; $A865: 60	  
loc_A866:
	CMP #$02				 ; $A866: C9 02	; Compare with 2
	BNE $A86D				; $A868: D0 03   
	LDA #$C8				 ; $A86A: A9 C8   
	RTS					  ; $A86C: 60	  
loc_A86D:
	LDA #$14				 ; $A86D: A9 14   
	RTS					  ; $A86F: 60	  
	BRK					  ; $A870: 00	  
	BVC $A8AE				; $A871: 50 3B   
	JSR $A960				; $A873: 20 60 A9 ; -> sub_A960
loc_A876:
	LDA #$00				 ; $A876: A9 00   
	STA $F9				  ; $A878: 85 F9   
	JSR $B046				; $A87A: 20 46 B0 ; -> sub_B046
	LDA $FD				  ; $A87D: A5 FD   
	ORA $FE				  ; $A87F: 05 FE   
	ORA $FF				  ; $A881: 05 FF   
	BNE $A889				; $A883: D0 04   
	BRK					  ; $A885: 00	  
	.byte $CF			  ; $A886 - Unknown opcode
	.byte $3B			  ; $A887 - Unknown opcode
	RTS					  ; $A888: 60	  
loc_A889:
	BRK					  ; $A889: 00	  
	EOR ($3B),Y			  ; $A88A: 51 3B   
	JSR $9AC9				; $A88C: 20 C9 9A ; -> sub_9AC9
	BNE $A89D				; $A88F: D0 0C   
	BRK					  ; $A891: 00	  
	.byte $52			  ; $A892 - Unknown opcode
	.byte $3B			  ; $A893 - Unknown opcode
	LDA #$3F				 ; $A894: A9 3F   
	JSR $B7B5				; $A896: 20 B5 B7 ; -> sub_B7B5
	CMP #$FF				 ; $A899: C9 FF	; Compare with 255
	BNE $A8A0				; $A89B: D0 03   
loc_A89D:
	JMP $A95C				; $A89D: 4C 5C A9
loc_A8A0:
	JSR $BA73				; $A8A0: 20 73 BA ; -> sub_BA73
	JSR $A47C				; $A8A3: 20 7C A4 ; -> sub_A47C
	LDA $62AD				; $A8A6: AD AD 62
	CMP $FD				  ; $A8A9: C5 FD   
	LDA $62AE				; $A8AB: AD AE 62
loc_A8AE:
	SBC $FE				  ; $A8AE: E5 FE	; Arithmetic
	LDA $62AF				; $A8B0: AD AF 62
	SBC #$00				 ; $A8B3: E9 00	; Arithmetic
	BPL $A8BD				; $A8B5: 10 06   
	BRK					  ; $A8B7: 00	  
	CMP $4C3B,X			  ; $A8B8: DD 3B 4C
	EOR $00A9,Y			  ; $A8BB: 59 A9 00
	.byte $53			  ; $A8BE - Unknown opcode
	.byte $3B			  ; $A8BF - Unknown opcode
	JSR $9AC9				; $A8C0: 20 C9 9A ; -> sub_9AC9
	BNE $A876				; $A8C3: D0 B1   
	LDA $DA				  ; $A8C5: A5 DA   
	CMP #$01				 ; $A8C7: C9 01	; Compare with 1
	BEQ $A8DC				; $A8C9: F0 11   
loc_A8CB:
	BRK					  ; $A8CB: 00	  
	.byte $77			  ; $A8CC - Unknown opcode
	.byte $2B			  ; $A8CD - Unknown opcode
	LDX $DC				  ; $A8CE: A6 DC   
	LDA #$40				 ; $A8D0: A9 40   
	JSR $B7B5				; $A8D2: 20 B5 B7 ; -> sub_B7B5
	CMP #$FF				 ; $A8D5: C9 FF	; Compare with 255
	BNE $A8DE				; $A8D7: D0 05   
	JMP $A95C				; $A8D9: 4C 5C A9
loc_A8DC:
	LDA #$00				 ; $A8DC: A9 00   
loc_A8DE:
	STA $DB				  ; $A8DE: 85 DB   
	STA $F9				  ; $A8E0: 85 F9   
	TAX					  ; $A8E2: AA	  
	BRK					  ; $A8E3: 00	  
	.byte $2B			  ; $A8E4 - Unknown opcode
	.byte $53			  ; $A8E5 - Unknown opcode
	CMP #$08				 ; $A8E6: C9 08	; Compare with 8
	BCC $A8EF				; $A8E8: 90 05   
	BRK					  ; $A8EA: 00	  
	BIT $4B				  ; $A8EB: 24 4B   
	BCS $A8F7				; $A8ED: B0 08   
loc_A8EF:
	JSR $BA55				; $A8EF: 20 55 BA ; -> sub_BA55
	BCC $A911				; $A8F2: 90 1D   
	BRK					  ; $A8F4: 00	  
	SEI					  ; $A8F5: 78	  
	.byte $2B			  ; $A8F6 - Unknown opcode
loc_A8F7:
	LDA $DA				  ; $A8F7: A5 DA   
	CMP #$01				 ; $A8F9: C9 01	; Compare with 1
	BEQ $A90C				; $A8FB: F0 0F   
	BRK					  ; $A8FD: 00	  
	.byte $7B			  ; $A8FE - Unknown opcode
	.byte $2B			  ; $A8FF - Unknown opcode
	LDA #$48				 ; $A900: A9 48   
	JSR $B7B5				; $A902: 20 B5 B7 ; -> sub_B7B5
	CMP #$00				 ; $A905: C9 00	; Compare with 0
	BEQ $A8CB				; $A907: F0 C2   
	JMP $A95C				; $A909: 4C 5C A9
loc_A90C:
	BRK					  ; $A90C: 00	  
	ADC $B02B,Y			  ; $A90D: 79 2B B0 ; Arithmetic
	.byte $4B			  ; $A910 - Unknown opcode
loc_A911:
	LDX $DB				  ; $A911: A6 DB   
	BRK					  ; $A913: 00	  
	ROR					  ; $A914: 6A	  
	.byte $53			  ; $A915 - Unknown opcode
	TAX					  ; $A916: AA	  
	BEQ $A91E				; $A917: F0 05   
	BRK					  ; $A919: 00	  
	ADC $B02B,X			  ; $A91A: 7D 2B B0 ; Arithmetic
	CLC					  ; $A91D: 18	  
loc_A91E:
	BRK					  ; $A91E: 00	  
	.byte $42			  ; $A91F - Unknown opcode
	.byte $33			  ; $A920 - Unknown opcode
	CMP #$01				 ; $A921: C9 01	; Compare with 1
	BNE $A92A				; $A923: D0 05   
	BRK					  ; $A925: 00	  
	.byte $8B			  ; $A926 - Unknown opcode
	.byte $2B			  ; $A927 - Unknown opcode
	BCS $A936				; $A928: B0 0C   
loc_A92A:
	CMP #$02				 ; $A92A: C9 02	; Compare with 2
	BNE $A933				; $A92C: D0 05   
	BRK					  ; $A92E: 00	  
	ROR $B02B,X			  ; $A92F: 7E 2B B0
	.byte $03			  ; $A932 - Unknown opcode
loc_A933:
	BRK					  ; $A933: 00	  
	.byte $7F			  ; $A934 - Unknown opcode
	.byte $2B			  ; $A935 - Unknown opcode
loc_A936:
	BRK					  ; $A936: 00	  
	.byte $83			  ; $A937 - Unknown opcode
	.byte $2B			  ; $A938 - Unknown opcode
	LDA $62AD				; $A939: AD AD 62
	SEC					  ; $A93C: 38	  
	SBC $FD				  ; $A93D: E5 FD	; Arithmetic
	STA $62AD				; $A93F: 8D AD 62
	LDA $62AE				; $A942: AD AE 62
	SBC $FE				  ; $A945: E5 FE	; Arithmetic
	STA $62AE				; $A947: 8D AE 62
	LDA $62AF				; $A94A: AD AF 62
	SBC $FF				  ; $A94D: E5 FF	; Arithmetic
	STA $62AF				; $A94F: 8D AF 62
	LDX $DB				  ; $A952: A6 DB   
	LDA $DC				  ; $A954: A5 DC   
	BRK					  ; $A956: 00	  
	ROL $4C73				; $A957: 2E 73 4C
	ROR $A8,X				; $A95A: 76 A8   
loc_A95C:
	BRK					  ; $A95C: 00	  
	.byte $54			  ; $A95D - Unknown opcode
	.byte $3B			  ; $A95E - Unknown opcode
	RTS					  ; $A95F: 60	  

; ---- Subroutine at $A960 (Bank 21) ----
sub_A960:
	LDA #$01				 ; $A960: A9 01   
	STA $07C5				; $A962: 8D C5 07
	BRK					  ; $A965: 00	  
	.byte $62			  ; $A966 - Unknown opcode
	.byte $33			  ; $A967 - Unknown opcode
	STA $DA				  ; $A968: 85 DA   
	JMP $B1EF				; $A96A: 4C EF B1

; ---- Subroutine at $A96D (Bank 21) ----
sub_A96D:
	LDX #$00				 ; $A96D: A2 00   
	STX tmp1				 ; $A96F: 86 01   
loc_A971:
	LDA #$00				 ; $A971: A9 00   
	STA tmp0				 ; $A973: 85 00   
loc_A975:
	LDA tmp0				 ; $A975: A5 00   
	BRK					  ; $A977: 00	  
	BIT $9073				; $A978: 2C 73 90
	ASL $69C9				; $A97B: 0E C9 69
	BNE $A98A				; $A97E: D0 0A   
	LDA tmp0				 ; $A980: A5 00   
	BRK					  ; $A982: 00	  
	BMI $A9F8				; $A983: 30 73   
	INC tmp1				 ; $A985: E6 01   
	JMP $A975				; $A987: 4C 75 A9
loc_A98A:
	INC tmp0				 ; $A98A: E6 00   
	LDA tmp0				 ; $A98C: A5 00   
	CMP #$08				 ; $A98E: C9 08	; Compare with 8
	BCC $A975				; $A990: 90 E3   
	INX					  ; $A992: E8	  
	CPX $DA				  ; $A993: E4 DA   
	BCC $A971				; $A995: 90 DA   
	LDA tmp1				 ; $A997: A5 01   
	RTS					  ; $A999: 60	  
	JSR $A960				; $A99A: 20 60 A9 ; -> sub_A960
	JSR $A96D				; $A99D: 20 6D A9 ; -> sub_A96D
	STA $DB				  ; $A9A0: 85 DB   
	BNE $A9AE				; $A9A2: D0 0A   
	BRK					  ; $A9A4: 00	  
	.byte $27			  ; $A9A5 - Unknown opcode
	.byte $EB			  ; $A9A6 - Unknown opcode
	.byte $FF			  ; $A9A7 - Unknown opcode
	BNE $A9AE				; $A9A8: D0 04   
	BRK					  ; $A9AA: 00	  
	.byte $B3			  ; $A9AB - Unknown opcode
	.byte $4B			  ; $A9AC - Unknown opcode
	RTS					  ; $A9AD: 60	  
loc_A9AE:
	STA $FD				  ; $A9AE: 85 FD   
	BRK					  ; $A9B0: 00	  
	LDY $4B,X				; $A9B1: B4 4B   
	LDA $DB				  ; $A9B3: A5 DB   
	BEQ $A9C3				; $A9B5: F0 0C   
	BRK					  ; $A9B7: 00	  
	LDA $4B,X				; $A9B8: B5 4B   
	CLC					  ; $A9BA: 18	  
	LDA $62A2				; $A9BB: AD A2 62
	ADC $DB				  ; $A9BE: 65 DB	; Arithmetic
	STA $62A2				; $A9C0: 8D A2 62
loc_A9C3:
	JSR $9956				; $A9C3: 20 56 99 ; -> sub_9956
	LDA $62A2				; $A9C6: AD A2 62
	STA $FD				  ; $A9C9: 85 FD   
	LDA #$00				 ; $A9CB: A9 00   
	STA $FE				  ; $A9CD: 85 FE   
	STA $FF				  ; $A9CF: 85 FF   
	BRK					  ; $A9D1: 00	  
	LDX $4B,Y				; $A9D2: B6 4B   
	JSR $9AC9				; $A9D4: 20 C9 9A ; -> sub_9AC9
	BEQ $A9DC				; $A9D7: F0 03   
	JMP $AA6A				; $A9D9: 4C 6A AA
loc_A9DC:
	BRK					  ; $A9DC: 00	  
	.byte $B7			  ; $A9DD - Unknown opcode
	.byte $4B			  ; $A9DE - Unknown opcode
	LDA #$3F				 ; $A9DF: A9 3F   
	JSR $B7B5				; $A9E1: 20 B5 B7 ; -> sub_B7B5
	CMP #$FF				 ; $A9E4: C9 FF	; Compare with 255
	BNE $A9EB				; $A9E6: D0 03   
	JMP $AA6A				; $A9E8: 4C 6A AA
loc_A9EB:
	TAX					  ; $A9EB: AA	  
	LDA $07BD,X			  ; $A9EC: BD BD 07
	STA $F9				  ; $A9EF: 85 F9   
	BRK					  ; $A9F1: 00	  
	CLV					  ; $A9F2: B8	  
	.byte $4B			  ; $A9F3 - Unknown opcode
	JSR $9AC9				; $A9F4: 20 C9 9A ; -> sub_9AC9
	TAX					  ; $A9F7: AA	  
loc_A9F8:
	BNE $A9DC				; $A9F8: D0 E2   
	LDA $F9				  ; $A9FA: A5 F9   
	STA $DC				  ; $A9FC: 85 DC   
	STA tmp0				 ; $A9FE: 85 00   
	JSR $B2CF				; $AA00: 20 CF B2 ; -> sub_B2CF
	LDA tmp0				 ; $AA03: A5 00   
	STA $DD				  ; $AA05: 85 DD   
	LDA $62A2				; $AA07: AD A2 62
	CMP $DD				  ; $AA0A: C5 DD   
	BPL $AA13				; $AA0C: 10 05   
	BRK					  ; $AA0E: 00	  
	LDA $B04B,Y			  ; $AA0F: B9 4B B0
	.byte $47			  ; $AA12 - Unknown opcode
loc_AA13:
	BRK					  ; $AA13: 00	  
	TSX					  ; $AA14: BA	  
	.byte $4B			  ; $AA15 - Unknown opcode
	LDA $DA				  ; $AA16: A5 DA   
	CMP #$01				 ; $AA18: C9 01	; Compare with 1
	BNE $AA20				; $AA1A: D0 04   
	LDA #$00				 ; $AA1C: A9 00   
	BEQ $AA2E				; $AA1E: F0 0E   
loc_AA20:
	BRK					  ; $AA20: 00	  
	.byte $BB			  ; $AA21 - Unknown opcode
	.byte $4B			  ; $AA22 - Unknown opcode
	LDX $DC				  ; $AA23: A6 DC   
	LDA #$40				 ; $AA25: A9 40   
	JSR $B7B5				; $AA27: 20 B5 B7 ; -> sub_B7B5
	CMP #$FF				 ; $AA2A: C9 FF	; Compare with 255
	BEQ $AA5A				; $AA2C: F0 2C   
loc_AA2E:
	TAX					  ; $AA2E: AA	  
	STA $DE				  ; $AA2F: 85 DE   
	BRK					  ; $AA31: 00	  
	AND $C973				; $AA32: 2D 73 C9
	PHP					  ; $AA35: 08	  
	BCS $AA47				; $AA36: B0 0F   
	BRK					  ; $AA38: 00	  
	LDY $384B,X			  ; $AA39: BC 4B 38
	LDA $62A2				; $AA3C: AD A2 62
	SBC $DD				  ; $AA3F: E5 DD	; Arithmetic
	STA $62A2				; $AA41: 8D A2 62
	JMP $AA53				; $AA44: 4C 53 AA
loc_AA47:
	STX $F9				  ; $AA47: 86 F9   
	BRK					  ; $AA49: 00	  
	LDA $204B,X			  ; $AA4A: BD 4B 20
	CMP #$9A				 ; $AA4D: C9 9A	; Compare with 154
	BEQ $AA20				; $AA4F: F0 CF   
	BNE $AA6A				; $AA51: D0 17   
loc_AA53:
	LDX $DE				  ; $AA53: A6 DE   
	LDA $DC				  ; $AA55: A5 DC   
	BRK					  ; $AA57: 00	  
	ROL $AD73				; $AA58: 2E 73 AD
	LDX #$62				 ; $AA5B: A2 62   
	BEQ $AA6A				; $AA5D: F0 0B   
	BRK					  ; $AA5F: 00	  
	LDX $204B,Y			  ; $AA60: BE 4B 20
	CMP #$9A				 ; $AA63: C9 9A	; Compare with 154
	BNE $AA6A				; $AA65: D0 03   
	JMP $A9DC				; $AA67: 4C DC A9
loc_AA6A:
	BRK					  ; $AA6A: 00	  
	.byte $BF			  ; $AA6B - Unknown opcode
	.byte $4B			  ; $AA6C - Unknown opcode
	RTS					  ; $AA6D: 60	  
	BRK					  ; $AA6E: 00	  
	BRK					  ; $AA6F: 00	  
	.byte $7F			  ; $AA70 - Unknown opcode
	JMP $B0B2				; $AA71: 4C B2 B0
	JSR $D214				; $AA74: 20 14 D2 ; Call to fixed bank
	BRK					  ; $AA77: 00	  
	ASL					  ; $AA78: 0A	  
	.byte $DF			  ; $AA79 - Unknown opcode
	JMP $B0AE				; $AA7A: 4C AE B0
	BRK					  ; $AA7D: 00	  
	.byte $14			  ; $AA7E - Unknown opcode
	.byte $8F			  ; $AA7F - Unknown opcode
	JMP $B0AE				; $AA80: 4C AE B0
	LDA #$0B				 ; $AA83: A9 0B   
	BRK					  ; $AA85: 00	  
	.byte $07			  ; $AA86 - Unknown opcode
	.byte $CF			  ; $AA87 - Unknown opcode
	RTS					  ; $AA88: 60	  
	LDA #$74				 ; $AA89: A9 74   
	BRK					  ; $AA8B: 00	  
	ROR $73				  ; $AA8C: 66 73   
	BCC $AA96				; $AA8E: 90 06   
	TAX					  ; $AA90: AA	  
	LDA $73				  ; $AA91: A5 73   
	BRK					  ; $AA93: 00	  
	.byte $2F			  ; $AA94 - Unknown opcode
	.byte $73			  ; $AA95 - Unknown opcode
loc_AA96:
	RTS					  ; $AA96: 60	  
	LDA #$05				 ; $AA97: A9 05   
	BRK					  ; $AA99: 00	  
	.byte $63			  ; $AA9A - Unknown opcode
	.byte $73			  ; $AA9B - Unknown opcode
	BCC $AAAA				; $AA9C: 90 0C   
	TAX					  ; $AA9E: AA	  
	BRK					  ; $AA9F: 00	  
	.byte $42			  ; $AAA0 - Unknown opcode
	.byte $73			  ; $AAA1 - Unknown opcode
	CMP #$01				 ; $AAA2: C9 01	; Compare with 1
	BEQ $AAAA				; $AAA4: F0 04   
	LDA #$01				 ; $AAA6: A9 01   
	BNE $AAAC				; $AAA8: D0 02   
loc_AAAA:
	LDA #$00				 ; $AAAA: A9 00   
loc_AAAC:
	JMP $A66A				; $AAAC: 4C 6A A6
	JSR $A66A				; $AAAF: 20 6A A6 ; -> sub_A66A
loc_AAB2:
	JSR $9AC9				; $AAB2: 20 C9 9A ; -> sub_9AC9
	BEQ $AABD				; $AAB5: F0 06   
	JSR $A668				; $AAB7: 20 68 A6 ; -> sub_A668
	JMP $AAB2				; $AABA: 4C B2 AA
loc_AABD:
	JSR $A660				; $AABD: 20 60 A6 ; -> sub_A660
	JMP $A65C				; $AAC0: 4C 5C A6
	LDA #$17				 ; $AAC3: A9 17   
	JMP $B0D7				; $AAC5: 4C D7 B0
	LDA #$18				 ; $AAC8: A9 18   
	BNE $AACE				; $AACA: D0 02   
	LDA #$11				 ; $AACC: A9 11   
loc_AACE:
	JMP $B0CE				; $AACE: 4C CE B0
	LDA #$13				 ; $AAD1: A9 13   
	BRK					  ; $AAD3: 00	  
	.byte $07			  ; $AAD4 - Unknown opcode
	.byte $CF			  ; $AAD5 - Unknown opcode
	JMP $B0AE				; $AAD6: 4C AE B0
	JSR $A66A				; $AAD9: 20 6A A6 ; -> sub_A66A
loc_AADC:
	JSR $9AC9				; $AADC: 20 C9 9A ; -> sub_9AC9
	BEQ $AAE7				; $AADF: F0 06   
	JSR $A668				; $AAE1: 20 68 A6 ; -> sub_A668
	JMP $AADC				; $AAE4: 4C DC AA
loc_AAE7:
	JSR $A660				; $AAE7: 20 60 A6 ; -> sub_A660
	LDA #$0D				 ; $AAEA: A9 0D   
	BRK					  ; $AAEC: 00	  
	.byte $07			  ; $AAED - Unknown opcode
	.byte $CF			  ; $AAEE - Unknown opcode
	JSR $D214				; $AAEF: 20 14 D2 ; Call to fixed bank
	JMP $B0AE				; $AAF2: 4C AE B0
	LDA #$0C				 ; $AAF5: A9 0C   
	BRK					  ; $AAF7: 00	  
	.byte $07			  ; $AAF8 - Unknown opcode
	.byte $CF			  ; $AAF9 - Unknown opcode
	RTS					  ; $AAFA: 60	  
	STA $F9				  ; $AAFB: 85 F9   
	JSR $A66A				; $AAFD: 20 6A A6 ; -> sub_A66A
	JSR $9AC9				; $AB00: 20 C9 9A ; -> sub_9AC9
	BNE $AB08				; $AB03: D0 03   
	JMP $A668				; $AB05: 4C 68 A6
loc_AB08:
	JSR $A660				; $AB08: 20 60 A6 ; -> sub_A660
	JSR $9AC9				; $AB0B: 20 C9 9A ; -> sub_9AC9
	BEQ $AB13				; $AB0E: F0 03   
	JMP $A65C				; $AB10: 4C 5C A6
loc_AB13:
	JSR $A658				; $AB13: 20 58 A6 ; -> sub_A658
	BRK					  ; $AB16: 00	  
	ADC $33				  ; $AB17: 65 33	; Arithmetic
	BCC $AB2D				; $AB19: 90 12   
	STA $F9				  ; $AB1B: 85 F9   
	TAX					  ; $AB1D: AA	  
	LDA #$6E				 ; $AB1E: A9 6E   
	BRK					  ; $AB20: 00	  
	ROL $0073				; $AB21: 2E 73 00
	ROL $CB				  ; $AB24: 26 CB   
	.byte $02			  ; $AB26 - Unknown opcode
	JSR $A654				; $AB27: 20 54 A6 ; -> sub_A654
	JMP $A650				; $AB2A: 4C 50 A6
loc_AB2D:
	JMP $A64C				; $AB2D: 4C 4C A6
	JSR $A4C9				; $AB30: 20 C9 A4 ; -> sub_A4C9
	BRK					  ; $AB33: 00	  
	CLC					  ; $AB34: 18	  
	.byte $CB			  ; $AB35 - Unknown opcode
	JSR $C700				; $AB36: 20 00 C7 ; Call to fixed bank
	.byte $3B			  ; $AB39 - Unknown opcode
loc_AB3A:
	JSR $9AC9				; $AB3A: 20 C9 9A ; -> sub_9AC9
	BEQ $AB44				; $AB3D: F0 05   
	BRK					  ; $AB3F: 00	  
	INY					  ; $AB40: C8	  
	.byte $3B			  ; $AB41 - Unknown opcode
	BCS $AB3A				; $AB42: B0 F6   
loc_AB44:
	BRK					  ; $AB44: 00	  
	CMP #$3B				 ; $AB45: C9 3B	; Compare with 59
loc_AB47:
	BRK					  ; $AB47: 00	  
	DEX					  ; $AB48: CA	  
	.byte $3B			  ; $AB49 - Unknown opcode
	JSR $9AC9				; $AB4A: 20 C9 9A ; -> sub_9AC9
	BEQ $AB47				; $AB4D: F0 F8   
	BRK					  ; $AB4F: 00	  
	.byte $6B			  ; $AB50 - Unknown opcode
	.byte $2B			  ; $AB51 - Unknown opcode
	JMP $990D				; $AB52: 4C 0D 99
	LDX #$03				 ; $AB55: A2 03   
	LDA #$11				 ; $AB57: A9 11   
	STA $7046,X			  ; $AB59: 9D 46 70
	BRK					  ; $AB5C: 00	  
	.byte $17			  ; $AB5D - Unknown opcode
	.byte $CB			  ; $AB5E - Unknown opcode
	BPL $AB0A				; $AB5F: 10 A9   
	ORA $4C,X				; $AB61: 15 4C   
	.byte $D7			  ; $AB63 - Unknown opcode
	BCS $AB0F				; $AB64: B0 A9   
	ROR $6600,X			  ; $AB66: 7E 00 66
	.byte $73			  ; $AB69 - Unknown opcode
	TAX					  ; $AB6A: AA	  
	LDA $73				  ; $AB6B: A5 73   
	STA $F9				  ; $AB6D: 85 F9   
	BRK					  ; $AB6F: 00	  
	BMI $ABE5				; $AB70: 30 73   
	LDA #$7B				 ; $AB72: A9 7B   
	BRK					  ; $AB74: 00	  
	ROL $6073				; $AB75: 2E 73 60
	JSR $A66A				; $AB78: 20 6A A6 ; -> sub_A66A
	BRK					  ; $AB7B: 00	  
	.byte $62			  ; $AB7C - Unknown opcode
	.byte $23			  ; $AB7D - Unknown opcode
	RTI					  ; $AB7E: 40	  
	CMP #$01				 ; $AB7F: C9 01	; Compare with 1
	BCC $AB86				; $AB81: 90 03   
	JSR $A668				; $AB83: 20 68 A6 ; -> sub_A668
loc_AB86:
	JMP $A660				; $AB86: 4C 60 A6
	LDA #$FF				 ; $AB89: A9 FF   
	STA $DA				  ; $AB8B: 85 DA   
	BRK					  ; $AB8D: 00	  
	ASL pos_x_hi,X		   ; $AB8E: 16 EB   
	PHP					  ; $AB90: 08	  
	BNE $AB97				; $AB91: D0 04   
	BRK					  ; $AB93: 00	  
	INC $603B				; $AB94: EE 3B 60
loc_AB97:
	LDA #$00				 ; $AB97: A9 00   
	BRK					  ; $AB99: 00	  
	.byte $63			  ; $AB9A - Unknown opcode
	.byte $73			  ; $AB9B - Unknown opcode
	STA $F9				  ; $AB9C: 85 F9   
	BRK					  ; $AB9E: 00	  
	.byte $62			  ; $AB9F - Unknown opcode
	.byte $23			  ; $ABA0 - Unknown opcode
	EOR ($C9,X)			  ; $ABA1: 41 C9   
	ORA ($D0,X)			  ; $ABA3: 01 D0   
	.byte $14			  ; $ABA5 - Unknown opcode
	LDA #$04				 ; $ABA6: A9 04   
	BRK					  ; $ABA8: 00	  
	.byte $63			  ; $ABA9 - Unknown opcode
	.byte $63			  ; $ABAA - Unknown opcode
	EOR ($90,X)			  ; $ABAB: 41 90   
	.byte $0C			  ; $ABAD - Unknown opcode
	LDA $DA				  ; $ABAE: A5 DA   
	BEQ $ABB6				; $ABB0: F0 04   
	BRK					  ; $ABB2: 00	  
	CMP $604B				; $ABB3: CD 4B 60
loc_ABB6:
	BRK					  ; $ABB6: 00	  
	.byte $5F			  ; $ABB7 - Unknown opcode
	.byte $4B			  ; $ABB8 - Unknown opcode
	RTS					  ; $ABB9: 60	  
	BRK					  ; $ABBA: 00	  
	EOR $204B,X			  ; $ABBB: 5D 4B 20
	.byte $14			  ; $ABBE - Unknown opcode
	.byte $D2			  ; $ABBF - Unknown opcode
	JSR $D1F3				; $ABC0: 20 F3 D1 ; Call to fixed bank
	LDA #$24				 ; $ABC3: A9 24   
	BRK					  ; $ABC5: 00	  
	.byte $07			  ; $ABC6 - Unknown opcode
	.byte $CF			  ; $ABC7 - Unknown opcode
	JMP $B0AE				; $ABC8: 4C AE B0
	LDX $E8				  ; $ABCB: A6 E8   
	LDA $6F60,X			  ; $ABCD: BD 60 6F
	CMP #$18				 ; $ABD0: C9 18	; Compare with 24
	BNE $ABDB				; $ABD2: D0 07   
	LDA $6F80,X			  ; $ABD4: BD 80 6F
	CMP #$0B				 ; $ABD7: C9 0B	; Compare with 11
	BEQ $ABDE				; $ABD9: F0 03   
loc_ABDB:
	JMP $A660				; $ABDB: 4C 60 A6
loc_ABDE:
	LDA #$05				 ; $ABDE: A9 05   
	JSR $9AF8				; $ABE0: 20 F8 9A ; -> sub_9AF8
	BNE $ABEB				; $ABE3: D0 06   
loc_ABE5:
	JSR $A664				; $ABE5: 20 64 A6 ; -> sub_A664
	JMP $A49E				; $ABE8: 4C 9E A4
loc_ABEB:
	JMP $A668				; $ABEB: 4C 68 A6
	LDA #$0E				 ; $ABEE: A9 0E   
	JMP $B0D7				; $ABF0: 4C D7 B0
	LDA #$0F				 ; $ABF3: A9 0F   
	JMP $B0D7				; $ABF5: 4C D7 B0
	LDA #$14				 ; $ABF8: A9 14   
	JMP $B0D7				; $ABFA: 4C D7 B0
	BRK					  ; $ABFD: 00	  
	.byte $1A			  ; $ABFE - Unknown opcode
	.byte $EB			  ; $ABFF - Unknown opcode
	.byte $04			  ; $AC00 - Unknown opcode
	BNE $AC34				; $AC01: D0 31   
	BRK					  ; $AC03: 00	  
	.byte $1A			  ; $AC04 - Unknown opcode
	.byte $EB			  ; $AC05 - Unknown opcode
	PHP					  ; $AC06: 08	  
	BNE $AC21				; $AC07: D0 18   
	JSR $A664				; $AC09: 20 64 A6 ; -> sub_A664
	LDA #$0D				 ; $AC0C: A9 0D   
	JSR $9AF8				; $AC0E: 20 F8 9A ; -> sub_9AF8
	BEQ $AC16				; $AC11: F0 03   
loc_AC13:
	JMP $A668				; $AC13: 4C 68 A6
loc_AC16:
	CPX #$00				 ; $AC16: E0 00   
	BNE $AC13				; $AC18: D0 F9   
	JSR $A660				; $AC1A: 20 60 A6 ; -> sub_A660
	BRK					  ; $AC1D: 00	  
	.byte $1A			  ; $AC1E - Unknown opcode
	.byte $CB			  ; $AC1F - Unknown opcode
	PHP					  ; $AC20: 08	  
loc_AC21:
	LDA #$4B				 ; $AC21: A9 4B   
	JSR $B089				; $AC23: 20 89 B0 ; -> sub_B089
	BCS $AC31				; $AC26: B0 09   
	BRK					  ; $AC28: 00	  
	.byte $1A			  ; $AC29 - Unknown opcode
	.byte $CB			  ; $AC2A - Unknown opcode
	.byte $04			  ; $AC2B - Unknown opcode
	STX $F9				  ; $AC2C: 86 F9   
	JMP $A65C				; $AC2E: 4C 5C A6
loc_AC31:
	JMP $A658				; $AC31: 4C 58 A6
loc_AC34:
	JMP $A654				; $AC34: 4C 54 A6
	BRK					  ; $AC37: 00	  
	.byte $62			  ; $AC38 - Unknown opcode
	.byte $23			  ; $AC39 - Unknown opcode
	RTI					  ; $AC3A: 40	  
	CMP #$02				 ; $AC3B: C9 02	; Compare with 2
	BCS $AC5A				; $AC3D: B0 1B   
	LDA #$00				 ; $AC3F: A9 00   
	BRK					  ; $AC41: 00	  
	AND #$63				 ; $AC42: 29 63   
	RTI					  ; $AC44: 40	  
	CMP #$01				 ; $AC45: C9 01	; Compare with 1
	BNE $AC4C				; $AC47: D0 03   
	JMP $A668				; $AC49: 4C 68 A6
loc_AC4C:
	JSR $A660				; $AC4C: 20 60 A6 ; -> sub_A660
	JSR $9AC9				; $AC4F: 20 C9 9A ; -> sub_9AC9
	BEQ $AC57				; $AC52: F0 03   
	JMP $A65C				; $AC54: 4C 5C A6
loc_AC57:
	JMP $A658				; $AC57: 4C 58 A6
loc_AC5A:
	JMP $A664				; $AC5A: 4C 64 A6
	LDA #$16				 ; $AC5D: A9 16   
	JMP $B0D7				; $AC5F: 4C D7 B0
	JSR $C891				; $AC62: 20 91 C8 ; Call to fixed bank
	STA $DA				  ; $AC65: 85 DA   
	LDA #$00				 ; $AC67: A9 00   
	STA $DB				  ; $AC69: 85 DB   
	LDA #$03				 ; $AC6B: A9 03   
	LDX #$DA				 ; $AC6D: A2 DA   
	JSR $C827				; $AC6F: 20 27 C8 ; Call to fixed bank
	JMP $A66A				; $AC72: 4C 6A A6
	LDA #$19				 ; $AC75: A9 19   
	JMP $B0D7				; $AC77: 4C D7 B0
	LDA #$1A				 ; $AC7A: A9 1A   
	BRK					  ; $AC7C: 00	  
	.byte $07			  ; $AC7D - Unknown opcode
	.byte $CF			  ; $AC7E - Unknown opcode
	JMP $B0AE				; $AC7F: 4C AE B0
	JSR $A48C				; $AC82: 20 8C A4 ; -> sub_A48C
	JMP $B0AE				; $AC85: 4C AE B0
	BRK					  ; $AC88: 00	  
	ORA $10EB,X			  ; $AC89: 1D EB 10
	BNE $AC91				; $AC8C: D0 03   
	JSR $A664				; $AC8E: 20 64 A6 ; -> sub_A664
loc_AC91:
	JSR $A668				; $AC91: 20 68 A6 ; -> sub_A668
	LDA #$73				 ; $AC94: A9 73   
	JSR $B089				; $AC96: 20 89 B0 ; -> sub_B089
	BCS $ACA7				; $AC99: B0 0C   
	STX $F9				  ; $AC9B: 86 F9   
	BRK					  ; $AC9D: 00	  
	ORA $20CB,X			  ; $AC9E: 1D CB 20
	JSR $A660				; $ACA1: 20 60 A6 ; -> sub_A660
	JMP $A65C				; $ACA4: 4C 5C A6
loc_ACA7:
	BRK					  ; $ACA7: 00	  
	ORA $10CB,X			  ; $ACA8: 1D CB 10
	JMP $A658				; $ACAB: 4C 58 A6
	BRK					  ; $ACAE: 00	  
	.byte $0B			  ; $ACAF - Unknown opcode
	.byte $DF			  ; $ACB0 - Unknown opcode
	BRK					  ; $ACB1: 00	  
	ASL $40EB,X			  ; $ACB2: 1E EB 40
	BNE $ACCE				; $ACB5: D0 17   
	LDA $6299				; $ACB7: AD 99 62
	AND #$3F				 ; $ACBA: 29 3F   
	CMP #$07				 ; $ACBC: C9 07	; Compare with 7
	BEQ $ACCB				; $ACBE: F0 0B   
	CMP #$02				 ; $ACC0: C9 02	; Compare with 2
	BEQ $ACCB				; $ACC2: F0 07   
	CMP #$03				 ; $ACC4: C9 03	; Compare with 3
	BEQ $ACCB				; $ACC6: F0 03   
	JMP $A664				; $ACC8: 4C 64 A6
loc_ACCB:
	JMP $A668				; $ACCB: 4C 68 A6
loc_ACCE:
	BRK					  ; $ACCE: 00	  
	CMP #$4B				 ; $ACCF: C9 4B	; Compare with 75
	RTS					  ; $ACD1: 60	  
	BRK					  ; $ACD2: 00	  
	.byte $0B			  ; $ACD3 - Unknown opcode
	.byte $DF			  ; $ACD4 - Unknown opcode
	LDY $E9				  ; $ACD5: A4 E9   
	BRK					  ; $ACD7: 00	  
	ASL $40EB,X			  ; $ACD8: 1E EB 40
	BNE $AD04				; $ACDB: D0 27   
	LDA $6299				; $ACDD: AD 99 62
	AND #$3F				 ; $ACE0: 29 3F   
	CMP #$07				 ; $ACE2: C9 07	; Compare with 7
	BEQ $ACF9				; $ACE4: F0 13   
	CMP #$02				 ; $ACE6: C9 02	; Compare with 2
	BEQ $ACF9				; $ACE8: F0 0F   
	CMP #$03				 ; $ACEA: C9 03	; Compare with 3
	BEQ $ACF9				; $ACEC: F0 0B   
	CPY #$01				 ; $ACEE: C0 01   
	BNE $ACF5				; $ACF0: D0 03   
	JMP $A664				; $ACF2: 4C 64 A6
loc_ACF5:
	LDA #$02				 ; $ACF5: A9 02   
	BNE $AD0E				; $ACF7: D0 15   
loc_ACF9:
	CPY #$01				 ; $ACF9: C0 01   
	BNE $AD00				; $ACFB: D0 03   
	JMP $A668				; $ACFD: 4C 68 A6
loc_AD00:
	LDA #$03				 ; $AD00: A9 03   
	BNE $AD0E				; $AD02: D0 0A   
loc_AD04:
	BRK					  ; $AD04: 00	  
	CMP #$4B				 ; $AD05: C9 4B	; Compare with 75
	LDY $E9				  ; $AD07: A4 E9   
	CPY #$01				 ; $AD09: C0 01   
	BNE $AD11				; $AD0B: D0 04   
	RTS					  ; $AD0D: 60	  
loc_AD0E:
	JSR $A66A				; $AD0E: 20 6A A6 ; -> sub_A66A
loc_AD11:
	LDA #$1F				 ; $AD11: A9 1F   
	BRK					  ; $AD13: 00	  
	.byte $07			  ; $AD14 - Unknown opcode
	.byte $CF			  ; $AD15 - Unknown opcode
	JMP $B0AE				; $AD16: 4C AE B0
	BRK					  ; $AD19: 00	  
	.byte $42			  ; $AD1A - Unknown opcode
	.byte $4B			  ; $AD1B - Unknown opcode
	JSR $9AC9				; $AD1C: 20 C9 9A ; -> sub_9AC9
	BNE $AD5B				; $AD1F: D0 3A   
	BRK					  ; $AD21: 00	  
	.byte $43			  ; $AD22 - Unknown opcode
	.byte $4B			  ; $AD23 - Unknown opcode
	LDX #$02				 ; $AD24: A2 02   
	LDA #$42				 ; $AD26: A9 42   
	JSR $B7B5				; $AD28: 20 B5 B7 ; -> sub_B7B5
	CMP #$FF				 ; $AD2B: C9 FF	; Compare with 255
	BEQ $AD5B				; $AD2D: F0 2C   
	STA $DA				  ; $AD2F: 85 DA   
	STA $F9				  ; $AD31: 85 F9   
	CMP #$00				 ; $AD33: C9 00	; Compare with 0
	BEQ $AD5F				; $AD35: F0 28   
	TAX					  ; $AD37: AA	  
	BRK					  ; $AD38: 00	  
	.byte $2B			  ; $AD39 - Unknown opcode
	.byte $73			  ; $AD3A - Unknown opcode
	CMP #$00				 ; $AD3B: C9 00	; Compare with 0
	BEQ $AD5F				; $AD3D: F0 20   
	CMP #$08				 ; $AD3F: C9 08	; Compare with 8
	BCS $AD5F				; $AD41: B0 1C   
	STA $F9				  ; $AD43: 85 F9   
	LDA #$1B				 ; $AD45: A9 1B   
	LDY $DA				  ; $AD47: A4 DA   
	BRK					  ; $AD49: 00	  
	.byte $07			  ; $AD4A - Unknown opcode
	.byte $CF			  ; $AD4B - Unknown opcode
	LDX #$FF				 ; $AD4C: A2 FF   
	STX $E4				  ; $AD4E: 86 E4   
	BRK					  ; $AD50: 00	  
	.byte $63			  ; $AD51 - Unknown opcode
	.byte $73			  ; $AD52 - Unknown opcode
	STA $F9				  ; $AD53: 85 F9   
	BRK					  ; $AD55: 00	  
	BIT $004B				; $AD56: 2C 4B 00
	.byte $83			  ; $AD59 - Unknown opcode
	.byte $2B			  ; $AD5A - Unknown opcode
loc_AD5B:
	BRK					  ; $AD5B: 00	  
	EOR ($4B,X)			  ; $AD5C: 41 4B   
	RTS					  ; $AD5E: 60	  
loc_AD5F:
	BRK					  ; $AD5F: 00	  
	LSR $B04B				; $AD60: 4E 4B B0
	CPY #$20				 ; $AD63: C0 20   
	CMP #$A4				 ; $AD65: C9 A4	; Compare with 164
	BRK					  ; $AD67: 00	  
	.byte $3B			  ; $AD68 - Unknown opcode
	.byte $4B			  ; $AD69 - Unknown opcode
	JSR $9AC9				; $AD6A: 20 C9 9A ; -> sub_9AC9
	BNE $AD77				; $AD6D: D0 08   
loc_AD6F:
	BRK					  ; $AD6F: 00	  
	.byte $3C			  ; $AD70 - Unknown opcode
	.byte $4B			  ; $AD71 - Unknown opcode
	JSR $9AC9				; $AD72: 20 C9 9A ; -> sub_9AC9
	BEQ $AD6F				; $AD75: F0 F8   
loc_AD77:
	BRK					  ; $AD77: 00	  
	AND $204B,X			  ; $AD78: 3D 4B 20
	CMP #$9A				 ; $AD7B: C9 9A	; Compare with 154
	BNE $AD85				; $AD7D: D0 06   
	BRK					  ; $AD7F: 00	  
	ROL $4C4B,X			  ; $AD80: 3E 4B 4C
	ORA $0099				; $AD83: 0D 99 00
	.byte $3F			  ; $AD86 - Unknown opcode
	.byte $4B			  ; $AD87 - Unknown opcode
	BCS $AD77				; $AD88: B0 ED   
	LDA #$1D				 ; $AD8A: A9 1D   
	JMP $B0D7				; $AD8C: 4C D7 B0
	LDX $E8				  ; $AD8F: A6 E8   
	LDA $6F80,X			  ; $AD91: BD 80 6F
	TAY					  ; $AD94: A8	  
	LDA $6F60,X			  ; $AD95: BD 60 6F
	CMP #$1C				 ; $AD98: C9 1C	; Compare with 28
	BNE $AD9F				; $AD9A: D0 03   
	JMP $B528				; $AD9C: 4C 28 B5
loc_AD9F:
	CMP #$1D				 ; $AD9F: C9 1D	; Compare with 29
	BNE $ADAD				; $ADA1: D0 0A   
	CPY #$12				 ; $ADA3: C0 12   
	BNE $ADAA				; $ADA5: D0 03   
	JMP $B830				; $ADA7: 4C 30 B8
loc_ADAA:
	JMP $B829				; $ADAA: 4C 29 B8
loc_ADAD:
	JMP $B822				; $ADAD: 4C 22 B8
	JSR $A664				; $ADB0: 20 64 A6 ; -> sub_A664
	JSR $9AC9				; $ADB3: 20 C9 9A ; -> sub_9AC9
	BEQ $ADBB				; $ADB6: F0 03   
	JMP $A668				; $ADB8: 4C 68 A6
loc_ADBB:
	JSR $A660				; $ADBB: 20 60 A6 ; -> sub_A660
loc_ADBE:
	JSR $9AC9				; $ADBE: 20 C9 9A ; -> sub_9AC9
	BEQ $ADC9				; $ADC1: F0 06   
	JSR $A65C				; $ADC3: 20 5C A6 ; -> sub_A65C
	JMP $ADBE				; $ADC6: 4C BE AD
loc_ADC9:
	BRK					  ; $ADC9: 00	  
	ORA ($DB),Y			  ; $ADCA: 11 DB   
	BRK					  ; $ADCC: 00	  
	BRK					  ; $ADCD: 00	  
	ORA $02CB,X			  ; $ADCE: 1D CB 02
	JMP $A658				; $ADD1: 4C 58 A6
	LDA #$1E				 ; $ADD4: A9 1E   
	BRK					  ; $ADD6: 00	  
	.byte $07			  ; $ADD7 - Unknown opcode
	.byte $CF			  ; $ADD8 - Unknown opcode
	RTS					  ; $ADD9: 60	  
	LDA #$00				 ; $ADDA: A9 00   
	BRK					  ; $ADDC: 00	  
	.byte $63			  ; $ADDD - Unknown opcode
	.byte $73			  ; $ADDE - Unknown opcode
	STA $F9				  ; $ADDF: 85 F9   
	STA $FA				  ; $ADE1: 85 FA   
	LDA #$00				 ; $ADE3: A9 00   
	BRK					  ; $ADE5: 00	  
	.byte $63			  ; $ADE6 - Unknown opcode
	.byte $63			  ; $ADE7 - Unknown opcode
	EOR ($90,X)			  ; $ADE8: 41 90   
	.byte $03			  ; $ADEA - Unknown opcode
	JMP $A668				; $ADEB: 4C 68 A6
	JMP $A664				; $ADEE: 4C 64 A6
	LDA #$22				 ; $ADF1: A9 22   
	JMP $B0CE				; $ADF3: 4C CE B0
	JSR $A66A				; $ADF6: 20 6A A6 ; -> sub_A66A
	JSR $9AC9				; $ADF9: 20 C9 9A ; -> sub_9AC9
	BEQ $AE01				; $ADFC: F0 03   
	JMP $A668				; $ADFE: 4C 68 A6
loc_AE01:
	JSR $A660				; $AE01: 20 60 A6 ; -> sub_A660
	BRK					  ; $AE04: 00	  
	.byte $62			  ; $AE05 - Unknown opcode
	.byte $23			  ; $AE06 - Unknown opcode
	RTI					  ; $AE07: 40	  
	CMP #$04				 ; $AE08: C9 04	; Compare with 4
	BCC $AE0F				; $AE0A: 90 03   
	JMP $A65C				; $AE0C: 4C 5C A6
loc_AE0F:
	JSR $A658				; $AE0F: 20 58 A6 ; -> sub_A658
	LDA #$14				 ; $AE12: A9 14   
	JSR $A769				; $AE14: 20 69 A7 ; -> sub_A769
	BEQ $AE1C				; $AE17: F0 03   
	JSR $A654				; $AE19: 20 54 A6 ; -> sub_A654
loc_AE1C:
	JSR $A650				; $AE1C: 20 50 A6 ; -> sub_A650
	BRK					  ; $AE1F: 00	  
	JSR $20CB				; $AE20: 20 CB 20
	JMP $A4B6				; $AE23: 4C B6 A4
	BRK					  ; $AE26: 00	  
	JSR $10EB				; $AE27: 20 EB 10
	BNE $AE98				; $AE2A: D0 6C   
	JSR $A66A				; $AE2C: 20 6A A6 ; -> sub_A66A
	LDA #$00				 ; $AE2F: A9 00   
	BRK					  ; $AE31: 00	  
	.byte $63			  ; $AE32 - Unknown opcode
	.byte $73			  ; $AE33 - Unknown opcode
	STA $F9				  ; $AE34: 85 F9   
	TAX					  ; $AE36: AA	  
	BRK					  ; $AE37: 00	  
	LSR $93				  ; $AE38: 46 93   
	.byte $07			  ; $AE3A - Unknown opcode
	BCS $AE61				; $AE3B: B0 24   
	LDA $E0				  ; $AE3D: A5 E0   
	PHA					  ; $AE3F: 48	  
	LDA $E1				  ; $AE40: A5 E1   
	PHA					  ; $AE42: 48	  
	BRK					  ; $AE43: 00	  
	ORA $8F				  ; $AE44: 05 8F   
	LDA $F9				  ; $AE46: A5 F9   
	BRK					  ; $AE48: 00	  
	.byte $44			  ; $AE49 - Unknown opcode
	.byte $93			  ; $AE4A - Unknown opcode
	.byte $07			  ; $AE4B - Unknown opcode
	BRK					  ; $AE4C: 00	  
	ORA $53				  ; $AE4D: 05 53   
	BRK					  ; $AE4F: 00	  
	ASL $0053				; $AE50: 0E 53 00
	.byte $3B			  ; $AE53 - Unknown opcode
	.byte $EF			  ; $AE54 - Unknown opcode
	BRK					  ; $AE55: 00	  
	.byte $27			  ; $AE56 - Unknown opcode
	.byte $0F			  ; $AE57 - Unknown opcode
	PLA					  ; $AE58: 68	  
	STA $E1				  ; $AE59: 85 E1   
	PLA					  ; $AE5B: 68	  
	STA $E0				  ; $AE5C: 85 E0   
	JSR $A668				; $AE5E: 20 68 A6 ; -> sub_A668
loc_AE61:
	JSR $A660				; $AE61: 20 60 A6 ; -> sub_A660
	LDA $F9				  ; $AE64: A5 F9   
	PHA					  ; $AE66: 48	  
	LDA $E0				  ; $AE67: A5 E0   
	PHA					  ; $AE69: 48	  
	LDA $E1				  ; $AE6A: A5 E1   
	PHA					  ; $AE6C: 48	  
	LDA #$2D				 ; $AE6D: A9 2D   
	BRK					  ; $AE6F: 00	  
	.byte $07			  ; $AE70 - Unknown opcode
	.byte $CF			  ; $AE71 - Unknown opcode
	PLA					  ; $AE72: 68	  
	STA $E1				  ; $AE73: 85 E1   
	PLA					  ; $AE75: 68	  
	STA $E0				  ; $AE76: 85 E0   
	PLA					  ; $AE78: 68	  
	STA $F9				  ; $AE79: 85 F9   
	JSR $A4C9				; $AE7B: 20 C9 A4 ; -> sub_A4C9
	LDA #$14				 ; $AE7E: A9 14   
	BRK					  ; $AE80: 00	  
	ROR $73				  ; $AE81: 66 73   
	TAX					  ; $AE83: AA	  
	LDA $73				  ; $AE84: A5 73   
	BRK					  ; $AE86: 00	  
	BMI $AEFC				; $AE87: 30 73   
	LDA #$21				 ; $AE89: A9 21   
	BRK					  ; $AE8B: 00	  
	ROL $2073				; $AE8C: 2E 73 20
	.byte $5C			  ; $AE8F - Unknown opcode
	LDX tmp0				 ; $AE90: A6 00   
	ORA $8F				  ; $AE92: 05 8F   
	BRK					  ; $AE94: 00	  
	JSR $10CB				; $AE95: 20 CB 10
loc_AE98:
	LDA #$00				 ; $AE98: A9 00   
	BRK					  ; $AE9A: 00	  
	.byte $63			  ; $AE9B - Unknown opcode
	.byte $63			  ; $AE9C - Unknown opcode
	EOR ($B0,X)			  ; $AE9D: 41 B0   
	.byte $03			  ; $AE9F - Unknown opcode
	JSR $9956				; $AEA0: 20 56 99 ; -> sub_9956
	JMP $A658				; $AEA3: 4C 58 A6

; ---- Subroutine at $AEA6 (Bank 21) ----
sub_AEA6:
	BRK					  ; $AEA6: 00	  
	.byte $62			  ; $AEA7 - Unknown opcode
	.byte $23			  ; $AEA8 - Unknown opcode
	ORA ($85,X)			  ; $AEA9: 01 85   
	CMP $00A2,X			  ; $AEAB: DD A2 00
loc_AEAE:
	BRK					  ; $AEAE: 00	  
	ORA $43				  ; $AEAF: 05 43   
	ORA (tmp0,X)			 ; $AEB1: 01 00   
	ASL $0143				; $AEB3: 0E 43 01
	INX					  ; $AEB6: E8	  
	CPX $DD				  ; $AEB7: E4 DD   
	BCC $AEAE				; $AEB9: 90 F3   
	RTS					  ; $AEBB: 60	  
	LDA #$00				 ; $AEBC: A9 00   
	BRK					  ; $AEBE: 00	  
	.byte $63			  ; $AEBF - Unknown opcode
	.byte $73			  ; $AEC0 - Unknown opcode
	STA $F9				  ; $AEC1: 85 F9   
	STA $FA				  ; $AEC3: 85 FA   
	STA $FB				  ; $AEC5: 85 FB   
loc_AEC7:
	JMP $A664				; $AEC7: 4C 64 A6
	JSR $B067				; $AECA: 20 67 B0 ; -> sub_B067
	JMP $AEC7				; $AECD: 4C C7 AE
	BRK					  ; $AED0: 00	  
	JSR $04EB				; $AED1: 20 EB 04
	BNE $AEEC				; $AED4: D0 16   
	JSR $A66A				; $AED6: 20 6A A6 ; -> sub_A66A
	BRK					  ; $AED9: 00	  
	JSR $04CB				; $AEDA: 20 CB 04
	LDA #$5B				 ; $AEDD: A9 5B   
	JSR $B089				; $AEDF: 20 89 B0 ; -> sub_B089
	BCC $AEE7				; $AEE2: 90 03   
loc_AEE4:
	JMP $A660				; $AEE4: 4C 60 A6
loc_AEE7:
	STX $F9				  ; $AEE7: 86 F9   
loc_AEE9:
	JMP $A668				; $AEE9: 4C 68 A6
loc_AEEC:
	JSR $A65C				; $AEEC: 20 5C A6 ; -> sub_A65C
	LDA #$5B				 ; $AEEF: A9 5B   
	BRK					  ; $AEF1: 00	  
	.byte $3A			  ; $AEF2 - Unknown opcode
	.byte $0F			  ; $AEF3 - Unknown opcode
	BCS $AEFD				; $AEF4: B0 07   
	LDA #$5B				 ; $AEF6: A9 5B   
	BRK					  ; $AEF8: 00	  
	.byte $47			  ; $AEF9 - Unknown opcode
	.byte $EF			  ; $AEFA - Unknown opcode
	BCC $AF00				; $AEFB: 90 03   
loc_AEFD:
	JMP $A658				; $AEFD: 4C 58 A6
loc_AF00:
	LDA #$5B				 ; $AF00: A9 5B   
	JSR $B089				; $AF02: 20 89 B0 ; -> sub_B089
	BCS $AEE4				; $AF05: B0 DD   
	STX $F9				  ; $AF07: 86 F9   
	JSR $A654				; $AF09: 20 54 A6 ; -> sub_A654
	JMP $AEE9				; $AF0C: 4C E9 AE
	BRK					  ; $AF0F: 00	  
	JSR $08EB				; $AF10: 20 EB 08
	BNE $AF20				; $AF13: D0 0B   
	JSR $A66A				; $AF15: 20 6A A6 ; -> sub_A66A
	LDA #$29				 ; $AF18: A9 29   
	BRK					  ; $AF1A: 00	  
	.byte $07			  ; $AF1B - Unknown opcode
	.byte $CF			  ; $AF1C - Unknown opcode
	JMP $B0AE				; $AF1D: 4C AE B0
loc_AF20:
	BRK					  ; $AF20: 00	  
	ADC ($4B),Y			  ; $AF21: 71 4B	; Arithmetic
	RTS					  ; $AF23: 60	  
	JSR $A66A				; $AF24: 20 6A A6 ; -> sub_A66A
	LDA $62A4				; $AF27: AD A4 62
	AND #$F0				 ; $AF2A: 29 F0   
	CMP #$F0				 ; $AF2C: C9 F0	; Compare with 240
	BEQ $AF36				; $AF2E: F0 06   
	JSR $A668				; $AF30: 20 68 A6 ; -> sub_A668
	JMP $AF39				; $AF33: 4C 39 AF
loc_AF36:
	JSR $A660				; $AF36: 20 60 A6 ; -> sub_A660
loc_AF39:
	JSR $A65C				; $AF39: 20 5C A6 ; -> sub_A65C
	LDA $E0				  ; $AF3C: A5 E0   
	PHA					  ; $AF3E: 48	  
	LDA $E1				  ; $AF3F: A5 E1   
	PHA					  ; $AF41: 48	  
	BRK					  ; $AF42: 00	  
	ORA $8F				  ; $AF43: 05 8F   
	JSR $AEA6				; $AF45: 20 A6 AE ; -> sub_AEA6
	BRK					  ; $AF48: 00	  
	.byte $3B			  ; $AF49 - Unknown opcode
	.byte $EF			  ; $AF4A - Unknown opcode
	BRK					  ; $AF4B: 00	  
	.byte $27			  ; $AF4C - Unknown opcode
	.byte $0F			  ; $AF4D - Unknown opcode
	PLA					  ; $AF4E: 68	  
	STA $E1				  ; $AF4F: 85 E1   
	PLA					  ; $AF51: 68	  
	STA $E0				  ; $AF52: 85 E0   
	JSR $A658				; $AF54: 20 58 A6 ; -> sub_A658
	JSR $9AC9				; $AF57: 20 C9 9A ; -> sub_9AC9
	BNE $AF62				; $AF5A: D0 06   
	BRK					  ; $AF5C: 00	  
	ASL $202F				; $AF5D: 0E 2F 20
	.byte $54			  ; $AF60 - Unknown opcode
	LDX $4C				  ; $AF61: A6 4C   
	BVC $AF0B				; $AF63: 50 A6   
	LDA #$25				 ; $AF65: A9 25   
	BNE $AF6B				; $AF67: D0 02   
	LDA #$26				 ; $AF69: A9 26   
loc_AF6B:
	JMP $B0D7				; $AF6B: 4C D7 B0
	LDA #$27				 ; $AF6E: A9 27   
	BNE $AF6B				; $AF70: D0 F9   
	LDX #$01				 ; $AF72: A2 01   
	LDA $6FE6,X			  ; $AF74: BD E6 6F
	STA $DB				  ; $AF77: 85 DB   
	LDA #$17				 ; $AF79: A9 17   
	STA $DA				  ; $AF7B: 85 DA   
	BRK					  ; $AF7D: 00	  
	LDY #$FB				 ; $AF7E: A0 FB   
loc_AF80:
	LDX #$00				 ; $AF80: A2 00   
	LDA $6FE6,X			  ; $AF82: BD E6 6F
	TAY					  ; $AF85: A8	  
	LDA $DB				  ; $AF86: A5 DB   
	STY $DB				  ; $AF88: 84 DB   
	STA $6FE6,X			  ; $AF8A: 9D E6 6F
	LDA $DA				  ; $AF8D: A5 DA   
	PHA					  ; $AF8F: 48	  
	LDA $DB				  ; $AF90: A5 DB   
	PHA					  ; $AF92: 48	  
	LDX #$06				 ; $AF93: A2 06   
	JSR $D7FC				; $AF95: 20 FC D7 ; Call to fixed bank
	PLA					  ; $AF98: 68	  
	STA $DB				  ; $AF99: 85 DB   
	PLA					  ; $AF9B: 68	  
	STA $DA				  ; $AF9C: 85 DA   
	JSR $FF74				; $AF9E: 20 74 FF ; Call to fixed bank
	DEC $DA				  ; $AFA1: C6 DA   
	BNE $AF80				; $AFA3: D0 DB   
	JSR $A664				; $AFA5: 20 64 A6 ; -> sub_A664
	LDA #$28				 ; $AFA8: A9 28   
	BNE $AF6B				; $AFAA: D0 BF   
	LDA #$2E				 ; $AFAC: A9 2E   
	BRK					  ; $AFAE: 00	  
	.byte $07			  ; $AFAF - Unknown opcode
	.byte $CF			  ; $AFB0 - Unknown opcode
	JMP $A495				; $AFB1: 4C 95 A4
	JSR $D214				; $AFB4: 20 14 D2 ; Call to fixed bank
	BRK					  ; $AFB7: 00	  
	ORA ($DF),Y			  ; $AFB8: 11 DF   
	JMP $B0AE				; $AFBA: 4C AE B0

; ---- Subroutine at $AFBD (Bank 21) ----
sub_AFBD:
	LDX #$01				 ; $AFBD: A2 01   
	LDA $6FE6,X			  ; $AFBF: BD E6 6F
	LDX #$00				 ; $AFC2: A2 00   
	STA $6FE6,X			  ; $AFC4: 9D E6 6F
	LDA #$44				 ; $AFC7: A9 44   
	STA $7046,X			  ; $AFC9: 9D 46 70
	LDA $3D				  ; $AFCC: A5 3D   
	EOR #$02				 ; $AFCE: 49 02   
	STA tmp0				 ; $AFD0: 85 00   
	LDA $7006,X			  ; $AFD2: BD 06 70
	AND #$FC				 ; $AFD5: 29 FC   
	ORA tmp0				 ; $AFD7: 05 00   
	STA $7006,X			  ; $AFD9: 9D 06 70
	BRK					  ; $AFDC: 00	  
	ASL $01CB				; $AFDD: 0E CB 01
	LDA $70E6,X			  ; $AFE0: BD E6 70
	ORA #$80				 ; $AFE3: 09 80   
	STA $70E6,X			  ; $AFE5: 9D E6 70
	LDX #$06				 ; $AFE8: A2 06   
	JSR $D7FC				; $AFEA: 20 FC D7 ; Call to fixed bank
	JMP $FF74				; $AFED: 4C 74 FF
loc_AFF0:
	JSR $D214				; $AFF0: 20 14 D2 ; Call to fixed bank
	LDA #$00				 ; $AFF3: A9 00   
	STA submap_number		; $AFF5: 85 64   
	JSR $A6BC				; $AFF7: 20 BC A6 ; -> sub_A6BC
	JSR $B03F				; $AFFA: 20 3F B0 ; -> sub_B03F
	LDA #$80				 ; $AFFD: A9 80   
	BRK					  ; $AFFF: 00	  
	AND ($EF),Y			  ; $B000: 31 EF   
	LDA $7000				; $B002: AD 00 70
	AND #$FC				 ; $B005: 29 FC   
	ORA #$03				 ; $B007: 09 03   
	STA $7000				; $B009: 8D 00 70
	JSR $A4C9				; $B00C: 20 C9 A4 ; -> sub_A4C9
	JMP $C5BF				; $B00F: 4C BF C5
	LDA #$31				 ; $B012: A9 31   
	JMP $B0CE				; $B014: 4C CE B0
	BRK					  ; $B017: 00	  
	.byte $62			  ; $B018 - Unknown opcode
	.byte $23			  ; $B019 - Unknown opcode
	EOR #$C9				 ; $B01A: 49 C9   
	ORA ($D0,X)			  ; $B01C: 01 D0   
	.byte $0B			  ; $B01E - Unknown opcode
	LDA #$06				 ; $B01F: A9 06   
	BRK					  ; $B021: 00	  
	.byte $63			  ; $B022 - Unknown opcode
	.byte $63			  ; $B023 - Unknown opcode
	EOR #$90				 ; $B024: 49 90   
	.byte $03			  ; $B026 - Unknown opcode
	JMP $BF06				; $B027: 4C 06 BF
	BRK					  ; $B02A: 00	  
	INY					  ; $B02B: C8	  
	.byte $4B			  ; $B02C - Unknown opcode
	JMP $BF0E				; $B02D: 4C 0E BF

; ---- Subroutine at $B030 (Bank 21) ----
sub_B030:
	BRK					  ; $B030: 00	  
	BPL $B02E				; $B031: 10 FB   
	JMP $B03F				; $B033: 4C 3F B0

; ---- Subroutine at $B036 (Bank 21) ----
sub_B036:
	BRK					  ; $B036: 00	  
	.byte $33			  ; $B037 - Unknown opcode
	.byte $FB			  ; $B038 - Unknown opcode
	JMP $B03F				; $B039: 4C 3F B0
	BRK					  ; $B03C: 00	  
	AND $00FB				; $B03D: 2D FB 00
	.byte $07			  ; $B040 - Unknown opcode
	.byte $9F			  ; $B041 - Unknown opcode
	BRK					  ; $B042: 00	  
	ORA #$9F				 ; $B043: 09 9F   
	RTS					  ; $B045: 60	  

; ---- Subroutine at $B046 (Bank 21) ----
sub_B046:
	LDA $62AD				; $B046: AD AD 62
	STA $FD				  ; $B049: 85 FD   
	LDA $62AE				; $B04B: AD AE 62
	STA $FE				  ; $B04E: 85 FE   
	LDA $62AF				; $B050: AD AF 62
	STA $FF				  ; $B053: 85 FF   
	RTS					  ; $B055: 60	  

; ---- Subroutine at $B056 (Bank 21) ----
sub_B056:
	TYA					  ; $B056: 98	  
	PHA					  ; $B057: 48	  
	LDA ($DA),Y			  ; $B058: B1 DA   
	INY					  ; $B05A: C8	  
	STA $E0				  ; $B05B: 85 E0   
	LDA ($DA),Y			  ; $B05D: B1 DA   
	INY					  ; $B05F: C8	  
	STA $E1				  ; $B060: 85 E1   
	PLA					  ; $B062: 68	  
	TAY					  ; $B063: A8	  
	LDA #$00				 ; $B064: A9 00   
	RTS					  ; $B066: 60	  

; ---- Subroutine at $B067 (Bank 21) ----
sub_B067:
	LDX #$00				 ; $B067: A2 00   
loc_B069:
	LDA $615D,X			  ; $B069: BD 5D 61
	STA $0554,X			  ; $B06C: 9D 54 05
	INX					  ; $B06F: E8	  
	CPX #$04				 ; $B070: E0 04   
	BCC $B069				; $B072: 90 F5   
	LDA #$40				 ; $B074: A9 40   
	STA $0558				; $B076: 8D 58 05
	DEX					  ; $B079: CA	  
loc_B07A:
	LDA $0554,X			  ; $B07A: BD 54 05
	BNE $B083				; $B07D: D0 04   
	DEX					  ; $B07F: CA	  
	BPL $B07A				; $B080: 10 F8   
	RTS					  ; $B082: 60	  
loc_B083:
	LDA #$40				 ; $B083: A9 40   
	STA $0555,X			  ; $B085: 9D 55 05
	RTS					  ; $B088: 60	  

; ---- Subroutine at $B089 (Bank 21) ----
sub_B089:
	STA tmp0				 ; $B089: 85 00   
	BRK					  ; $B08B: 00	  
	ADC $33				  ; $B08C: 65 33	; Arithmetic
	BCC $B098				; $B08E: 90 08   
	TAX					  ; $B090: AA	  
	LDA tmp0				 ; $B091: A5 00   
	BRK					  ; $B093: 00	  
	ROL $1873				; $B094: 2E 73 18
	RTS					  ; $B097: 60	  
loc_B098:
	SEC					  ; $B098: 38	  
	RTS					  ; $B099: 60	  

; ---- Subroutine at $B09A (Bank 21) ----
sub_B09A:
	STA $E0				  ; $B09A: 85 E0   
	TYA					  ; $B09C: 98	  
	PHA					  ; $B09D: 48	  
	LDA $E0				  ; $B09E: A5 E0   
	BRK					  ; $B0A0: 00	  
	ROR $73				  ; $B0A1: 66 73   
	BCC $B0AB				; $B0A3: 90 06   
	TAX					  ; $B0A5: AA	  
	LDA $73				  ; $B0A6: A5 73   
	BRK					  ; $B0A8: 00	  
	BMI $B11E				; $B0A9: 30 73   
loc_B0AB:
	PLA					  ; $B0AB: 68	  
	TAY					  ; $B0AC: A8	  
	RTS					  ; $B0AD: 60	  

; ---- Subroutine at $B0AE (Bank 21) ----
sub_B0AE:
	LDA #$01				 ; $B0AE: A9 01   
	BNE $B0B8				; $B0B0: D0 06   
loc_B0B2:
	LDA #$C0				 ; $B0B2: A9 C0   
	BNE $B0B8				; $B0B4: D0 02   
loc_B0B6:
	LDA #$80				 ; $B0B6: A9 80   
loc_B0B8:
	STA $E7				  ; $B0B8: 85 E7   
	RTS					  ; $B0BA: 60	  

; ---- Subroutine at $B0BB (Bank 21) ----
sub_B0BB:
	PHA					  ; $B0BB: 48	  
	BRK					  ; $B0BC: 00	  
	.byte $62			  ; $B0BD - Unknown opcode
	.byte $23			  ; $B0BE - Unknown opcode
	EOR ($C9,X)			  ; $B0BF: 41 C9   
	BRK					  ; $B0C1: 00	  
	BNE $B0CC				; $B0C2: D0 08   
	JSR $B7FB				; $B0C4: 20 FB B7 ; -> sub_B7FB
	BRK					  ; $B0C7: 00	  
	.byte $54			  ; $B0C8 - Unknown opcode
	.byte $4B			  ; $B0C9 - Unknown opcode
	PLA					  ; $B0CA: 68	  
	PLA					  ; $B0CB: 68	  
loc_B0CC:
	PLA					  ; $B0CC: 68	  
	RTS					  ; $B0CD: 60	  

; ---- Subroutine at $B0CE (Bank 21) ----
sub_B0CE:
	PHA					  ; $B0CE: 48	  
	TYA					  ; $B0CF: 98	  
	PHA					  ; $B0D0: 48	  
	JSR $D214				; $B0D1: 20 14 D2 ; Call to fixed bank
	JMP $B0DD				; $B0D4: 4C DD B0

; ---- Subroutine at $B0D7 (Bank 21) ----
sub_B0D7:
	PHA					  ; $B0D7: 48	  
	TYA					  ; $B0D8: 98	  
	PHA					  ; $B0D9: 48	  
	JSR $D218				; $B0DA: 20 18 D2 ; Call to fixed bank
loc_B0DD:
	PLA					  ; $B0DD: 68	  
	TAY					  ; $B0DE: A8	  
	PLA					  ; $B0DF: 68	  
	BRK					  ; $B0E0: 00	  
	.byte $07			  ; $B0E1 - Unknown opcode
	.byte $CF			  ; $B0E2 - Unknown opcode
	JMP $B0AE				; $B0E3: 4C AE B0

; ---- Subroutine at $B0E6 (Bank 21) ----
sub_B0E6:
	STA $DA				  ; $B0E6: 85 DA   
	LDA $65				  ; $B0E8: A5 65   
	CMP #$03				 ; $B0EA: C9 03	; Compare with 3
	BNE $B0EF				; $B0EC: D0 01   
	RTS					  ; $B0EE: 60	  
loc_B0EF:
	LDA map_number		   ; $B0EF: A5 63   
	CMP #$03				 ; $B0F1: C9 03	; Compare with 3
	BNE $B139				; $B0F3: D0 44   
	LDA $DA				  ; $B0F5: A5 DA   
	AND #$7F				 ; $B0F7: 29 7F   
	STA $DA				  ; $B0F9: 85 DA   
	CMP #$19				 ; $B0FB: C9 19	; Compare with 25
	BNE $B102				; $B0FD: D0 03   
loc_B0FF:
	JMP $B189				; $B0FF: 4C 89 B1
loc_B102:
	CMP #$05				 ; $B102: C9 05	; Compare with 5
	BEQ $B0FF				; $B104: F0 F9   
	CMP #$0C				 ; $B106: C9 0C	; Compare with 12
	BEQ $B0FF				; $B108: F0 F5   
	BRK					  ; $B10A: 00	  
	.byte $1B			  ; $B10B - Unknown opcode
	.byte $EB			  ; $B10C - Unknown opcode
	.byte $FF			  ; $B10D - Unknown opcode
	BEQ $B116				; $B10E: F0 06   
	BRK					  ; $B110: 00	  
	.byte $1C			  ; $B111 - Unknown opcode
	.byte $EB			  ; $B112 - Unknown opcode
	.byte $80			  ; $B113 - Unknown opcode
	BNE $B145				; $B114: D0 2F   
loc_B116:
	LDA $DA				  ; $B116: A5 DA   
	CMP #$08				 ; $B118: C9 08	; Compare with 8
	BEQ $B145				; $B11A: F0 29   
	LDA submap_number		; $B11C: A5 64   
loc_B11E:
	CMP #$00				 ; $B11E: C9 00	; Compare with 0
	BNE $B12B				; $B120: D0 09   
	LDA $E8				  ; $B122: A5 E8   
	CMP #$06				 ; $B124: C9 06	; Compare with 6
	BNE $B12B				; $B126: D0 03   
	JSR $AFBD				; $B128: 20 BD AF ; -> sub_AFBD
loc_B12B:
	JSR $B7FB				; $B12B: 20 FB B7 ; -> sub_B7FB
	BRK					  ; $B12E: 00	  
	.byte $1C			  ; $B12F - Unknown opcode
	.byte $87			  ; $B130 - Unknown opcode
	LDA #$20				 ; $B131: A9 20   
	JSR $B0CE				; $B133: 20 CE B0 ; -> sub_B0CE
	PLA					  ; $B136: 68	  
	PLA					  ; $B137: 68	  
	RTS					  ; $B138: 60	  
loc_B139:
	BRK					  ; $B139: 00	  
	.byte $1B			  ; $B13A - Unknown opcode
	.byte $EB			  ; $B13B - Unknown opcode
	.byte $FF			  ; $B13C - Unknown opcode
	BEQ $B146				; $B13D: F0 07   
	BRK					  ; $B13F: 00	  
	.byte $1C			  ; $B140 - Unknown opcode
	.byte $EB			  ; $B141 - Unknown opcode
	.byte $80			  ; $B142 - Unknown opcode
	BNE $B16E				; $B143: D0 29   
loc_B145:
	RTS					  ; $B145: 60	  
loc_B146:
	LDA #$08				 ; $B146: A9 08   
	BRK					  ; $B148: 00	  
	.byte $63			  ; $B149 - Unknown opcode
	.byte $73			  ; $B14A - Unknown opcode
	BCC $B152				; $B14B: 90 05   
	TAX					  ; $B14D: AA	  
	BEQ $B162				; $B14E: F0 12   
	BNE $B145				; $B150: D0 F3   
loc_B152:
	LDA map_number		   ; $B152: A5 63   
	CMP #$46				 ; $B154: C9 46	; Compare with 70
	BEQ $B145				; $B156: F0 ED   
	LDA #$0F				 ; $B158: A9 0F   
	BRK					  ; $B15A: 00	  
	.byte $63			  ; $B15B - Unknown opcode
	.byte $73			  ; $B15C - Unknown opcode
	BCC $B145				; $B15D: 90 E6   
	TAX					  ; $B15F: AA	  
	BNE $B145				; $B160: D0 E3   
loc_B162:
	BRK					  ; $B162: 00	  
	LSR $93				  ; $B163: 46 93   
	.byte $07			  ; $B165 - Unknown opcode
	BCC $B145				; $B166: 90 DD   
	LDA map_number		   ; $B168: A5 63   
	CMP #$41				 ; $B16A: C9 41	; Compare with 65
	BEQ $B145				; $B16C: F0 D7   
loc_B16E:
	JSR $B7FB				; $B16E: 20 FB B7 ; -> sub_B7FB
	LDX #$04				 ; $B171: A2 04   
	LDY #$FF				 ; $B173: A0 FF   
loc_B175:
	INY					  ; $B175: C8	  
	LDA $B1B3,Y			  ; $B176: B9 B3 B1
	CMP #$FF				 ; $B179: C9 FF	; Compare with 255
	BEQ $B145				; $B17B: F0 C8   
	CMP $DA				  ; $B17D: C5 DA   
	BNE $B175				; $B17F: D0 F4   
	PLA					  ; $B181: 68	  
	PLA					  ; $B182: 68	  
	LDA $B1D1,Y			  ; $B183: B9 D1 B1
	JMP $9919				; $B186: 4C 19 99
loc_B189:
	BRK					  ; $B189: 00	  
	.byte $1B			  ; $B18A - Unknown opcode
	.byte $EB			  ; $B18B - Unknown opcode
	.byte $FF			  ; $B18C - Unknown opcode
	BEQ $B195				; $B18D: F0 06   
	BRK					  ; $B18F: 00	  
	.byte $1C			  ; $B190 - Unknown opcode
	.byte $EB			  ; $B191 - Unknown opcode
	.byte $80			  ; $B192 - Unknown opcode
	BNE $B196				; $B193: D0 01   
loc_B195:
	RTS					  ; $B195: 60	  
loc_B196:
	JSR $B7FB				; $B196: 20 FB B7 ; -> sub_B7FB
	LDA $DA				  ; $B199: A5 DA   
	CMP #$19				 ; $B19B: C9 19	; Compare with 25
	BNE $B1A4				; $B19D: D0 05   
	BRK					  ; $B19F: 00	  
	.byte $4F			  ; $B1A0 - Unknown opcode
	.byte $4B			  ; $B1A1 - Unknown opcode
	BCS $B1B0				; $B1A2: B0 0C   
loc_B1A4:
	CMP #$05				 ; $B1A4: C9 05	; Compare with 5
	BNE $B1AD				; $B1A6: D0 05   
	BRK					  ; $B1A8: 00	  
	BVC $B1F6				; $B1A9: 50 4B   
	BCS $B1B0				; $B1AB: B0 03   
loc_B1AD:
	BRK					  ; $B1AD: 00	  
	EOR ($4B),Y			  ; $B1AE: 51 4B   
loc_B1B0:
	PLA					  ; $B1B0: 68	  
	PLA					  ; $B1B1: 68	  
	RTS					  ; $B1B2: 60	  
	BRK					  ; $B1B3: 00	  
	ORA (tmp2,X)			 ; $B1B4: 01 02   
	.byte $03			  ; $B1B6 - Unknown opcode
	.byte $04			  ; $B1B7 - Unknown opcode
	ORA $11				  ; $B1B8: 05 11   
	ASL ptr1_hi			  ; $B1BA: 06 07   
	PHP					  ; $B1BC: 08	  
	ORA #$3F				 ; $B1BD: 09 3F   
	ASL					  ; $B1BF: 0A	  
	.byte $0B			  ; $B1C0 - Unknown opcode
	.byte $0C			  ; $B1C1 - Unknown opcode
	ASL $102B				; $B1C2: 0E 2B 10
	.byte $12			  ; $B1C5 - Unknown opcode
	.byte $13			  ; $B1C6 - Unknown opcode
	ORA $16,X				; $B1C7: 15 16   
	.byte $17			  ; $B1C9 - Unknown opcode
	ORA $271A,Y			  ; $B1CA: 19 1A 27
	PLP					  ; $B1CD: 28	  
	PHA					  ; $B1CE: 48	  
	AND #$FF				 ; $B1CF: 29 FF   
	ASL					  ; $B1D1: 0A	  
	.byte $0B			  ; $B1D2 - Unknown opcode
	.byte $0C			  ; $B1D3 - Unknown opcode
	ORA $0F0E				; $B1D4: 0D 0E 0F
	.byte $0F			  ; $B1D7 - Unknown opcode
	BPL $B1EB				; $B1D8: 10 11   
	.byte $12			  ; $B1DA - Unknown opcode
	.byte $13			  ; $B1DB - Unknown opcode
	.byte $13			  ; $B1DC - Unknown opcode
	.byte $14			  ; $B1DD - Unknown opcode
	ORA $16,X				; $B1DE: 15 16   
	.byte $17			  ; $B1E0 - Unknown opcode
	.byte $17			  ; $B1E1 - Unknown opcode
	.byte $14			  ; $B1E2 - Unknown opcode
	CLC					  ; $B1E3: 18	  
	ORA $1B1A,Y			  ; $B1E4: 19 1A 1B
	.byte $1C			  ; $B1E7 - Unknown opcode
	ORA $1F1E,X			  ; $B1E8: 1D 1E 1F
loc_B1EB:
	JSR $0F20				; $B1EB: 20 20 0F
	.byte $FF			  ; $B1EE - Unknown opcode

; ---- Subroutine at $B1EF (Bank 21) ----
sub_B1EF:
	PHA					  ; $B1EF: 48	  
	TXA					  ; $B1F0: 8A	  
	PHA					  ; $B1F1: 48	  
	TYA					  ; $B1F2: 98	  
	PHA					  ; $B1F3: 48	  
	LDA $DA				  ; $B1F4: A5 DA   
loc_B1F6:
	PHA					  ; $B1F6: 48	  
	LDA $DB				  ; $B1F7: A5 DB   
	PHA					  ; $B1F9: 48	  
	LDA $07C5				; $B1FA: AD C5 07
	SEC					  ; $B1FD: 38	  
	SBC #$01				 ; $B1FE: E9 01	; Arithmetic
	ASL					  ; $B200: 0A	  
	TAY					  ; $B201: A8	  
	LDA #$2C				 ; $B202: A9 2C   
	STA $DA				  ; $B204: 85 DA   
	LDA #$80				 ; $B206: A9 80   
	STA $DB				  ; $B208: 85 DB   
	JSR $BFA4				; $B20A: 20 A4 BF ; -> sub_BFA4
	PHA					  ; $B20D: 48	  
	INY					  ; $B20E: C8	  
	JSR $BFA4				; $B20F: 20 A4 BF ; -> sub_BFA4
	STA $DB				  ; $B212: 85 DB   
	PLA					  ; $B214: 68	  
	STA $DA				  ; $B215: 85 DA   
	LDY #$00				 ; $B217: A0 00   
	JSR $B2A3				; $B219: 20 A3 B2 ; -> sub_B2A3
loc_B21C:
	JSR $BFA4				; $B21C: 20 A4 BF ; -> sub_BFA4
	BMI $B22B				; $B21F: 30 0A   
	STA $07BD,Y			  ; $B221: 99 BD 07
	INY					  ; $B224: C8	  
	CPY #$08				 ; $B225: C0 08   
	BCC $B21C				; $B227: 90 F3   
	BCS $B237				; $B229: B0 0C   
loc_B22B:
	AND #$7F				 ; $B22B: 29 7F   
	STA $07BD,Y			  ; $B22D: 99 BD 07
	INY					  ; $B230: C8	  
	JSR $B243				; $B231: 20 43 B2 ; -> sub_B243
	STY $07C4				; $B234: 8C C4 07
loc_B237:
	PLA					  ; $B237: 68	  
	STA $DB				  ; $B238: 85 DB   
	PLA					  ; $B23A: 68	  
	STA $DA				  ; $B23B: 85 DA   
	PLA					  ; $B23D: 68	  
	TAY					  ; $B23E: A8	  
	PLA					  ; $B23F: 68	  
	TAX					  ; $B240: AA	  
	PLA					  ; $B241: 68	  
	RTS					  ; $B242: 60	  

; ---- Subroutine at $B243 (Bank 21) ----
sub_B243:
	JSR $B28C				; $B243: 20 8C B2 ; -> sub_B28C
	BCC $B25C				; $B246: 90 14   
	LDX #$00				 ; $B248: A2 00   
loc_B24A:
	LDA $62E7,X			  ; $B24A: BD E7 62
	BEQ $B256				; $B24D: F0 07   
	LDA $A479,X			  ; $B24F: BD 79 A4
	STA $07BD,Y			  ; $B252: 99 BD 07
	INY					  ; $B255: C8	  
loc_B256:
	INX					  ; $B256: E8	  
	CPX #$03				 ; $B257: E0 03   
	BCC $B24A				; $B259: 90 EF   
	RTS					  ; $B25B: 60	  
loc_B25C:
	LDX submap_number		; $B25C: A6 64   
	LDA map_number		   ; $B25E: A5 63   
	CMP #$09				 ; $B260: C9 09	; Compare with 9
	BNE $B28B				; $B262: D0 27   
	CPX #$00				 ; $B264: E0 00   
	BNE $B28B				; $B266: D0 23   
	LDA $07C5				; $B268: AD C5 07
	CMP #$01				 ; $B26B: C9 01	; Compare with 1
	BNE $B28B				; $B26D: D0 1C   
	JSR $9CE5				; $B26F: 20 E5 9C ; -> sub_9CE5
	BCS $B28B				; $B272: B0 17   
	LDA #$06				 ; $B274: A9 06   
	STA $07BD				; $B276: 8D BD 07
	LDA #$23				 ; $B279: A9 23   
	STA $07BE				; $B27B: 8D BE 07
	LDA #$07				 ; $B27E: A9 07   
	STA $07BF				; $B280: 8D BF 07
	LDA #$10				 ; $B283: A9 10   
	STA $07C0				; $B285: 8D C0 07
	LDY #$04				 ; $B288: A0 04   
	RTS					  ; $B28A: 60	  
loc_B28B:
	RTS					  ; $B28B: 60	  

; ---- Subroutine at $B28C (Bank 21) ----
sub_B28C:
	LDA map_number		   ; $B28C: A5 63   
	CMP #$16				 ; $B28E: C9 16	; Compare with 22
	BNE $B2A1				; $B290: D0 0F   
	LDA submap_number		; $B292: A5 64   
	CMP #$00				 ; $B294: C9 00	; Compare with 0
	BNE $B2A1				; $B296: D0 09   
	LDA $07C5				; $B298: AD C5 07
	CMP #$01				 ; $B29B: C9 01	; Compare with 1
	BNE $B2A1				; $B29D: D0 02   
	SEC					  ; $B29F: 38	  
	RTS					  ; $B2A0: 60	  
loc_B2A1:
	CLC					  ; $B2A1: 18	  
	RTS					  ; $B2A2: 60	  

; ---- Subroutine at $B2A3 (Bank 21) ----
sub_B2A3:
	JSR $BFA4				; $B2A3: 20 A4 BF ; -> sub_BFA4
	JSR $B2C8				; $B2A6: 20 C8 B2 ; -> sub_B2C8
	CMP #$FF				 ; $B2A9: C9 FF	; Compare with 255
	BEQ $B2BB				; $B2AB: F0 0E   
	CMP map_number		   ; $B2AD: C5 63   
	BNE $B2BC				; $B2AF: D0 0B   
	JSR $BFA4				; $B2B1: 20 A4 BF ; -> sub_BFA4
	JSR $B2C8				; $B2B4: 20 C8 B2 ; -> sub_B2C8
	CMP submap_number		; $B2B7: C5 64   
	BNE $B2BC				; $B2B9: D0 01   
loc_B2BB:
	RTS					  ; $B2BB: 60	  
loc_B2BC:
	JSR $BFA4				; $B2BC: 20 A4 BF ; -> sub_BFA4
	JSR $B2C8				; $B2BF: 20 C8 B2 ; -> sub_B2C8
	ORA #$00				 ; $B2C2: 09 00   
	BMI $B2A3				; $B2C4: 30 DD   
	BPL $B2BC				; $B2C6: 10 F4   

; ---- Subroutine at $B2C8 (Bank 21) ----
sub_B2C8:
	INC $DA				  ; $B2C8: E6 DA   
	BNE $B2CE				; $B2CA: D0 02   
	INC $DB				  ; $B2CC: E6 DB   
loc_B2CE:
	RTS					  ; $B2CE: 60	  

; ---- Subroutine at $B2CF (Bank 21) ----
sub_B2CF:
	PHA					  ; $B2CF: 48	  
	TXA					  ; $B2D0: 8A	  
	PHA					  ; $B2D1: 48	  
	TYA					  ; $B2D2: 98	  
	PHA					  ; $B2D3: 48	  
	LDA map_number		   ; $B2D4: A5 63   
	CMP #$18				 ; $B2D6: C9 18	; Compare with 24
	BNE $B2F4				; $B2D8: D0 1A   
	LDA tmp0				 ; $B2DA: A5 00   
	CMP #$06				 ; $B2DC: C9 06	; Compare with 6
	BNE $B2EC				; $B2DE: D0 0C   
	LDA #$0A				 ; $B2E0: A9 0A   
loc_B2E2:
	STA tmp0				 ; $B2E2: 85 00   
	LDA #$00				 ; $B2E4: A9 00   
	STA tmp1				 ; $B2E6: 85 01   
	STA tmp2				 ; $B2E8: 85 02   
	BEQ $B347				; $B2EA: F0 5B   
loc_B2EC:
	CMP #$79				 ; $B2EC: C9 79	; Compare with 121
	BNE $B2F4				; $B2EE: D0 04   
	LDA #$02				 ; $B2F0: A9 02   
	BNE $B2E2				; $B2F2: D0 EE   
loc_B2F4:
	CMP #$22				 ; $B2F4: C9 22	; Compare with 34
	BNE $B316				; $B2F6: D0 1E   
	LDA tmp0				 ; $B2F8: A5 00   
	CMP #$17				 ; $B2FA: C9 17	; Compare with 23
	BNE $B302				; $B2FC: D0 04   
	LDA #$01				 ; $B2FE: A9 01   
	BNE $B2E2				; $B300: D0 E0   
loc_B302:
	CMP #$4E				 ; $B302: C9 4E	; Compare with 78
	BNE $B30A				; $B304: D0 04   
	LDA #$04				 ; $B306: A9 04   
	BNE $B2E2				; $B308: D0 D8   
loc_B30A:
	CMP #$1C				 ; $B30A: C9 1C	; Compare with 28
	BNE $B312				; $B30C: D0 04   
	LDA #$06				 ; $B30E: A9 06   
	BNE $B2E2				; $B310: D0 D0   
loc_B312:
	LDA #$14				 ; $B312: A9 14   
	BNE $B2E2				; $B314: D0 CC   
loc_B316:
	CMP #$04				 ; $B316: C9 04	; Compare with 4
	BNE $B340				; $B318: D0 26   
	LDA submap_number		; $B31A: A5 64   
	CMP #$01				 ; $B31C: C9 01	; Compare with 1
	BNE $B340				; $B31E: D0 20   
	LDX #$00				 ; $B320: A2 00   
loc_B322:
	LDA $B34D,X			  ; $B322: BD 4D B3
	CMP tmp0				 ; $B325: C5 00   
	BEQ $B330				; $B327: F0 07   
	INX					  ; $B329: E8	  
	INX					  ; $B32A: E8	  
	INX					  ; $B32B: E8	  
	CPX #$12				 ; $B32C: E0 12   
	BCC $B322				; $B32E: 90 F2   
loc_B330:
	LDA $B34E,X			  ; $B330: BD 4E B3
	STA tmp0				 ; $B333: 85 00   
	LDA $B34F,X			  ; $B335: BD 4F B3
	STA tmp1				 ; $B338: 85 01   
	LDA #$00				 ; $B33A: A9 00   
	STA tmp2				 ; $B33C: 85 02   
	BEQ $B347				; $B33E: F0 07   
loc_B340:
	LDA tmp0				 ; $B340: A5 00   
	LDX #$00				 ; $B342: A2 00   
	BRK					  ; $B344: 00	  
	ORA ($0F),Y			  ; $B345: 11 0F   
loc_B347:
	PLA					  ; $B347: 68	  
	TAY					  ; $B348: A8	  
	PLA					  ; $B349: 68	  
	TAX					  ; $B34A: AA	  
	PLA					  ; $B34B: 68	  
	RTS					  ; $B34C: 60	  
	.byte $5A			  ; $B34D - Unknown opcode
	ASL $5900,X			  ; $B34E: 1E 00 59
	.byte $F4			  ; $B351 - Unknown opcode
	ORA ($22,X)			  ; $B352: 01 22   
	INX					  ; $B354: E8	  
	.byte $03			  ; $B355 - Unknown opcode
	ROR $C4				  ; $B356: 66 C4   
	ORA #$50				 ; $B358: 09 50   
	LDY #$0F				 ; $B35A: A0 0F   
	EOR $50				  ; $B35C: 45 50   
	.byte $C3			  ; $B35E - Unknown opcode

; ---- Subroutine at $B35F (Bank 21) ----
sub_B35F:
	PHA					  ; $B35F: 48	  
	TXA					  ; $B360: 8A	  
	PHA					  ; $B361: 48	  
	TYA					  ; $B362: 98	  
	PHA					  ; $B363: 48	  
	LDA tmp0				 ; $B364: A5 00   
	LDX #$00				 ; $B366: A2 00   
	BRK					  ; $B368: 00	  
	ORA ($0F),Y			  ; $B369: 11 0F   
	JSR $B47C				; $B36B: 20 7C B4 ; -> sub_B47C
	PLA					  ; $B36E: 68	  
	TAY					  ; $B36F: A8	  
	PLA					  ; $B370: 68	  
	TAX					  ; $B371: AA	  
	PLA					  ; $B372: 68	  
	RTS					  ; $B373: 60	  
	LDA #$00				 ; $B374: A9 00   
	STA $625B				; $B376: 8D 5B 62
	STA $625C				; $B379: 8D 5C 62
	LDY #$7F				 ; $B37C: A0 7F   
loc_B37E:
	STA $61DB,Y			  ; $B37E: 99 DB 61
	DEY					  ; $B381: 88	  
	BNE $B37E				; $B382: D0 FA   
	LDA #$FF				 ; $B384: A9 FF   
	STA $61DB				; $B386: 8D DB 61
	RTS					  ; $B389: 60	  

; ---- Subroutine at $B38A (Bank 21) ----
sub_B38A:
	TYA					  ; $B38A: 98	  
	PHA					  ; $B38B: 48	  
	LDY #$00				 ; $B38C: A0 00   
loc_B38E:
	LDA $61DB,Y			  ; $B38E: B9 DB 61
	CMP #$FF				 ; $B391: C9 FF	; Compare with 255
	BEQ $B39A				; $B393: F0 05   
	INY					  ; $B395: C8	  
	CPY #$80				 ; $B396: C0 80   
	BCC $B38E				; $B398: 90 F4   
loc_B39A:
	STY $E7				  ; $B39A: 84 E7   
	PLA					  ; $B39C: 68	  
	TAY					  ; $B39D: A8	  
	LDA $E7				  ; $B39E: A5 E7   
	RTS					  ; $B3A0: 60	  

; ---- Subroutine at $B3A1 (Bank 21) ----
sub_B3A1:
	AND #$7F				 ; $B3A1: 29 7F   
	STA $E8				  ; $B3A3: 85 E8   
	PHA					  ; $B3A5: 48	  
	TYA					  ; $B3A6: 98	  
	PHA					  ; $B3A7: 48	  
	LDA #$80				 ; $B3A8: A9 80   
	STA $E9				  ; $B3AA: 85 E9   
	JSR $B38A				; $B3AC: 20 8A B3 ; -> sub_B38A
	CMP $E9				  ; $B3AF: C5 E9   
	BCS $B3C5				; $B3B1: B0 12   
	TAY					  ; $B3B3: A8	  
	CMP #$7F				 ; $B3B4: C9 7F	; Compare with 127
	BEQ $B3BD				; $B3B6: F0 05   
	LDA #$FF				 ; $B3B8: A9 FF   
	STA $61DC,Y			  ; $B3BA: 99 DC 61
loc_B3BD:
	LDA $E8				  ; $B3BD: A5 E8   
	STA $61DB,Y			  ; $B3BF: 99 DB 61
	CLC					  ; $B3C2: 18	  
	BCC $B3C6				; $B3C3: 90 01   
loc_B3C5:
	SEC					  ; $B3C5: 38	  
loc_B3C6:
	PLA					  ; $B3C6: 68	  
	TAY					  ; $B3C7: A8	  
	PLA					  ; $B3C8: 68	  
	RTS					  ; $B3C9: 60	  

; ---- Subroutine at $B3CA (Bank 21) ----
sub_B3CA:
	STA $E8				  ; $B3CA: 85 E8   
	TYA					  ; $B3CC: 98	  
	PHA					  ; $B3CD: 48	  
	LDY $E8				  ; $B3CE: A4 E8   
	LDA $61DB,Y			  ; $B3D0: B9 DB 61
	STA $E8				  ; $B3D3: 85 E8   
	CPY #$7F				 ; $B3D5: C0 7F   
	BEQ $B3E8				; $B3D7: F0 0F   
loc_B3D9:
	LDA $61DC,Y			  ; $B3D9: B9 DC 61
	STA $61DB,Y			  ; $B3DC: 99 DB 61
	INY					  ; $B3DF: C8	  
	CPY #$7F				 ; $B3E0: C0 7F   
	BCS $B3E8				; $B3E2: B0 04   
	CMP #$FF				 ; $B3E4: C9 FF	; Compare with 255
	BNE $B3D9				; $B3E6: D0 F1   
loc_B3E8:
	LDA #$FF				 ; $B3E8: A9 FF   
	STA $61DB,Y			  ; $B3EA: 99 DB 61
	PLA					  ; $B3ED: 68	  
	TAY					  ; $B3EE: A8	  
	LDA $E8				  ; $B3EF: A5 E8   
	RTS					  ; $B3F1: 60	  

; ---- Subroutine at $B3F2 (Bank 21) ----
sub_B3F2:
	ASL tmp0				 ; $B3F2: 06 00   
	ROL tmp1				 ; $B3F4: 26 01   
	ROL tmp2				 ; $B3F6: 26 02   
	LDA tmp0				 ; $B3F8: A5 00   
	STA tmp3				 ; $B3FA: 85 03   
	LDA tmp1				 ; $B3FC: A5 01   
	STA ptr0_lo			  ; $B3FE: 85 04   
	LDA tmp2				 ; $B400: A5 02   
	STA ptr0_hi			  ; $B402: 85 05   
	ASL tmp0				 ; $B404: 06 00   
	ROL tmp1				 ; $B406: 26 01   
	ROL tmp2				 ; $B408: 26 02   
	ASL tmp0				 ; $B40A: 06 00   
	ROL tmp1				 ; $B40C: 26 01   
	ROL tmp2				 ; $B40E: 26 02   
	LDA tmp0				 ; $B410: A5 00   
	CLC					  ; $B412: 18	  
	ADC tmp3				 ; $B413: 65 03	; Arithmetic
	STA tmp0				 ; $B415: 85 00   
	LDA tmp1				 ; $B417: A5 01   
	ADC ptr0_lo			  ; $B419: 65 04	; Arithmetic
	STA tmp1				 ; $B41B: 85 01   
	LDA tmp2				 ; $B41D: A5 02   
	ADC ptr0_hi			  ; $B41F: 65 05	; Arithmetic
	STA tmp2				 ; $B421: 85 02   
	RTS					  ; $B423: 60	  

; ---- Subroutine at $B424 (Bank 21) ----
sub_B424:
	JSR $B432				; $B424: 20 32 B4 ; -> sub_B432
	LDA tmp0				 ; $B427: A5 00   
	ORA tmp1				 ; $B429: 05 01   
	ORA tmp2				 ; $B42B: 05 02   
	BNE $B431				; $B42D: D0 02   
	INC tmp0				 ; $B42F: E6 00   
loc_B431:
	RTS					  ; $B431: 60	  

; ---- Subroutine at $B432 (Bank 21) ----
sub_B432:
	LDY #$02				 ; $B432: A0 02   
loc_B434:
	LDA tmp0,Y			   ; $B434: B9 00 00
	STA tmp3,Y			   ; $B437: 99 03 00
	DEY					  ; $B43A: 88	  
	BPL $B434				; $B43B: 10 F7   
	LDA #$00				 ; $B43D: A9 00   
	STA tmp0				 ; $B43F: 85 00   
	STA tmp1				 ; $B441: 85 01   
	STA tmp2				 ; $B443: 85 02   
	STA $E8				  ; $B445: 85 E8   
	LDA #$20				 ; $B447: A9 20   
	STA $E9				  ; $B449: 85 E9   
	LDY #$03				 ; $B44B: A0 03   
loc_B44D:
	ASL tmp3				 ; $B44D: 06 03   
	ROL ptr0_lo			  ; $B44F: 26 04   
	ROL ptr0_hi			  ; $B451: 26 05   
	DEY					  ; $B453: 88	  
	BNE $B44D				; $B454: D0 F7   
	LDY #$0E				 ; $B456: A0 0E   
loc_B458:
	LDA ptr0_hi			  ; $B458: A5 05   
	CMP #$0A				 ; $B45A: C9 0A	; Compare with 10
	BCC $B46E				; $B45C: 90 10   
	SBC #$0A				 ; $B45E: E9 0A	; Arithmetic
	STA ptr0_hi			  ; $B460: 85 05   
	LDA tmp1				 ; $B462: A5 01   
	ORA $E9				  ; $B464: 05 E9   
	STA tmp1				 ; $B466: 85 01   
	LDA tmp0				 ; $B468: A5 00   
	ORA $E8				  ; $B46A: 05 E8   
	STA tmp0				 ; $B46C: 85 00   
loc_B46E:
	LSR $E9				  ; $B46E: 46 E9   
	ROR $E8				  ; $B470: 66 E8   
	ASL tmp3				 ; $B472: 06 03   
	ROL ptr0_lo			  ; $B474: 26 04   
	ROL ptr0_hi			  ; $B476: 26 05   
	DEY					  ; $B478: 88	  
	BNE $B458				; $B479: D0 DD   
	RTS					  ; $B47B: 60	  

; ---- Subroutine at $B47C (Bank 21) ----
sub_B47C:
	LDY #$02				 ; $B47C: A0 02   
loc_B47E:
	LDA tmp0,Y			   ; $B47E: B9 00 00
	STA tmp3,Y			   ; $B481: 99 03 00
	DEY					  ; $B484: 88	  
	BPL $B47E				; $B485: 10 F7   
	LDA tmp3				 ; $B487: A5 03   
	CLC					  ; $B489: 18	  
	ADC #$03				 ; $B48A: 69 03	; Arithmetic
	STA tmp3				 ; $B48C: 85 03   
	LDA ptr0_lo			  ; $B48E: A5 04   
	ADC #$00				 ; $B490: 69 00	; Arithmetic
	STA ptr0_lo			  ; $B492: 85 04   
	LDA ptr0_hi			  ; $B494: A5 05   
	ADC #$00				 ; $B496: 69 00	; Arithmetic
	STA ptr0_hi			  ; $B498: 85 05   
	LDY #$02				 ; $B49A: A0 02   
loc_B49C:
	LSR ptr0_hi			  ; $B49C: 46 05   
	ROR ptr0_lo			  ; $B49E: 66 04   
	ROR tmp3				 ; $B4A0: 66 03   
	DEY					  ; $B4A2: 88	  
	BNE $B49C				; $B4A3: D0 F7   
	LDA tmp0				 ; $B4A5: A5 00   
	SEC					  ; $B4A7: 38	  
	SBC tmp3				 ; $B4A8: E5 03	; Arithmetic
	STA tmp0				 ; $B4AA: 85 00   
	LDA tmp1				 ; $B4AC: A5 01   
	SBC ptr0_lo			  ; $B4AE: E5 04	; Arithmetic
	STA tmp1				 ; $B4B0: 85 01   
	LDA tmp2				 ; $B4B2: A5 02   
	SBC ptr0_hi			  ; $B4B4: E5 05	; Arithmetic
	STA tmp2				 ; $B4B6: 85 02   
	RTS					  ; $B4B8: 60	  

; ---- Subroutine at $B4B9 (Bank 21) ----
sub_B4B9:
	LDA tmp0				 ; $B4B9: A5 00   
	CLC					  ; $B4BB: 18	  
	ADC $625B				; $B4BC: 6D 5B 62 ; Arithmetic
	STA $625B				; $B4BF: 8D 5B 62
	LDA tmp1				 ; $B4C2: A5 01   
	ADC $625C				; $B4C4: 6D 5C 62 ; Arithmetic
	STA $625C				; $B4C7: 8D 5C 62
	RTS					  ; $B4CA: 60	  

; ---- Subroutine at $B4CB (Bank 21) ----
sub_B4CB:
	LDA $625B				; $B4CB: AD 5B 62
	SEC					  ; $B4CE: 38	  
	SBC tmp0				 ; $B4CF: E5 00	; Arithmetic
	STA tmp3				 ; $B4D1: 85 03   
	LDA $625C				; $B4D3: AD 5C 62
	SBC tmp1				 ; $B4D6: E5 01	; Arithmetic
	BCC $B4E2				; $B4D8: 90 08   
	STA $625C				; $B4DA: 8D 5C 62
	LDA tmp3				 ; $B4DD: A5 03   
	STA $625B				; $B4DF: 8D 5B 62
loc_B4E2:
	RTS					  ; $B4E2: 60	  

; ---- Subroutine at $B4E3 (Bank 21) ----
sub_B4E3:
	LDA $625C				; $B4E3: AD 5C 62
	STA tmp1				 ; $B4E6: 85 01   
	LDA $625B				; $B4E8: AD 5B 62
	STA tmp0				 ; $B4EB: 85 00   
	RTS					  ; $B4ED: 60	  

; ---- Subroutine at $B4EE (Bank 21) ----
sub_B4EE:
	PHA					  ; $B4EE: 48	  
	TXA					  ; $B4EF: 8A	  
	PHA					  ; $B4F0: 48	  
	LDA tmp3				 ; $B4F1: A5 03   
	PHA					  ; $B4F3: 48	  
	LDA ptr0_lo			  ; $B4F4: A5 04   
	PHA					  ; $B4F6: 48	  
	LDA ptr0_hi			  ; $B4F7: A5 05   
	PHA					  ; $B4F9: 48	  
	LDA #$00				 ; $B4FA: A9 00   
	STA tmp2				 ; $B4FC: 85 02   
	LDX #$03				 ; $B4FE: A2 03   
loc_B500:
	JSR $B3F2				; $B500: 20 F2 B3 ; -> sub_B3F2
	DEX					  ; $B503: CA	  
	BNE $B500				; $B504: D0 FA   
	PLA					  ; $B506: 68	  
	STA ptr0_hi			  ; $B507: 85 05   
	PLA					  ; $B509: 68	  
	STA ptr0_lo			  ; $B50A: 85 04   
	PLA					  ; $B50C: 68	  
	STA tmp3				 ; $B50D: 85 03   
	PLA					  ; $B50F: 68	  
	TAX					  ; $B510: AA	  
	PLA					  ; $B511: 68	  
	RTS					  ; $B512: 60	  
	BRK					  ; $B513: 00	  
	.byte $22			  ; $B514 - Unknown opcode
	.byte $2F			  ; $B515 - Unknown opcode
	LDA #$43				 ; $B516: A9 43   
	JSR $B7B5				; $B518: 20 B5 B7 ; -> sub_B7B5
	BRK					  ; $B51B: 00	  
	ORA $6F				  ; $B51C: 05 6F   
	JSR $9956				; $B51E: 20 56 99 ; -> sub_9956
	BRK					  ; $B521: 00	  
	LDY $3B,X				; $B522: B4 3B   
	BRK					  ; $B524: 00	  
	CLC					  ; $B525: 18	  
	.byte $3B			  ; $B526 - Unknown opcode
	RTS					  ; $B527: 60	  
loc_B528:
	LDA #$50				 ; $B528: A9 50   
	JSR $B7B5				; $B52A: 20 B5 B7 ; -> sub_B7B5
	BRK					  ; $B52D: 00	  
	ORA $6F				  ; $B52E: 05 6F   
	BRK					  ; $B530: 00	  
	.byte $22			  ; $B531 - Unknown opcode
	.byte $2F			  ; $B532 - Unknown opcode
	LDA #$00				 ; $B533: A9 00   
	STA $F9				  ; $B535: 85 F9   
	LDA $62ED				; $B537: AD ED 62
	CMP #$78				 ; $B53A: C9 78	; Compare with 120
	BCS $B543				; $B53C: B0 05   
	BRK					  ; $B53E: 00	  
	.byte $1B			  ; $B53F - Unknown opcode
	.byte $2B			  ; $B540 - Unknown opcode
	BCS $B546				; $B541: B0 03   
loc_B543:
	BRK					  ; $B543: 00	  
	.byte $1C			  ; $B544 - Unknown opcode
	.byte $2B			  ; $B545 - Unknown opcode
loc_B546:
	BRK					  ; $B546: 00	  
	.byte $62			  ; $B547 - Unknown opcode
	.byte $33			  ; $B548 - Unknown opcode
	STA $DA				  ; $B549: 85 DA   
	LDA map_number		   ; $B54B: A5 63   
	CMP #$46				 ; $B54D: C9 46	; Compare with 70
	BEQ $B569				; $B54F: F0 18   
	CMP #$0E				 ; $B551: C9 0E	; Compare with 14
	BEQ $B569				; $B553: F0 14   
	LDA map_number		   ; $B555: A5 63   
	CMP #$04				 ; $B557: C9 04	; Compare with 4
	BNE $B561				; $B559: D0 06   
	LDA submap_number		; $B55B: A5 64   
	CMP #$0E				 ; $B55D: C9 0E	; Compare with 14
	BEQ $B569				; $B55F: F0 08   
loc_B561:
	LDA #$41				 ; $B561: A9 41   
	JSR $B7B5				; $B563: 20 B5 B7 ; -> sub_B7B5
	JMP $B575				; $B566: 4C 75 B5
loc_B569:
	LDA #$6D				 ; $B569: A9 6D   
	JSR $B7B5				; $B56B: 20 B5 B7 ; -> sub_B7B5
	CMP #$FF				 ; $B56E: C9 FF	; Compare with 255
	BEQ $B592				; $B570: F0 20   
	CLC					  ; $B572: 18	  
	ADC #$02				 ; $B573: 69 02	; Arithmetic
loc_B575:
	CMP #$00				 ; $B575: C9 00	; Compare with 0
	BNE $B57C				; $B577: D0 03   
	JMP $B6BE				; $B579: 4C BE B6
loc_B57C:
	CMP #$03				 ; $B57C: C9 03	; Compare with 3
	BEQ $B59A				; $B57E: F0 1A   
	CMP #$04				 ; $B580: C9 04	; Compare with 4
	BEQ $B5E3				; $B582: F0 5F   
	CMP #$02				 ; $B584: C9 02	; Compare with 2
	BNE $B58B				; $B586: D0 03   
	JMP $B636				; $B588: 4C 36 B6
loc_B58B:
	CMP #$01				 ; $B58B: C9 01	; Compare with 1
	BNE $B592				; $B58D: D0 03   
	JMP $B700				; $B58F: 4C 00 B7
loc_B592:
	JMP $B7B1				; $B592: 4C B1 B7
loc_B595:
	BRK					  ; $B595: 00	  
	BIT $B02B				; $B596: 2C 2B B0
	LDY $DAA5				; $B599: AC A5 DA
	CMP #$01				 ; $B59C: C9 01	; Compare with 1
	BEQ $B5B1				; $B59E: F0 11   
	BRK					  ; $B5A0: 00	  
	ORA $A22B,X			  ; $B5A1: 1D 2B A2
	BRK					  ; $B5A4: 00	  
	LDA #$42				 ; $B5A5: A9 42   
	JSR $B7B5				; $B5A7: 20 B5 B7 ; -> sub_B7B5
	CMP #$FF				 ; $B5AA: C9 FF	; Compare with 255
	BNE $B5B3				; $B5AC: D0 05   
	JMP $B595				; $B5AE: 4C 95 B5
loc_B5B1:
	LDA #$00				 ; $B5B1: A9 00   
loc_B5B3:
	TAX					  ; $B5B3: AA	  
	STA $F9				  ; $B5B4: 85 F9   
	STA $DB				  ; $B5B6: 85 DB   
	BRK					  ; $B5B8: 00	  
	LSR $93				  ; $B5B9: 46 93   
	ORA $B0				  ; $B5BB: 05 B0   
	ORA #$00				 ; $B5BD: 09 00   
	ASL $002B,X			  ; $B5BF: 1E 2B 00
	.byte $83			  ; $B5C2 - Unknown opcode
	.byte $2B			  ; $B5C3 - Unknown opcode
	JMP $B595				; $B5C4: 4C 95 B5
	LDA #$05				 ; $B5C7: A9 05   
	STA $E2				  ; $B5C9: 85 E2   
	LDA #$00				 ; $B5CB: A9 00   
	STA $E3				  ; $B5CD: 85 E3   
	STA $E4				  ; $B5CF: 85 E4   
	JSR $B766				; $B5D1: 20 66 B7 ; -> sub_B766
	BRK					  ; $B5D4: 00	  
	.byte $1F			  ; $B5D5 - Unknown opcode
	.byte $2B			  ; $B5D6 - Unknown opcode
	JSR $B7A6				; $B5D7: 20 A6 B7 ; -> sub_B7A6
	LDX $DB				  ; $B5DA: A6 DB   
	BRK					  ; $B5DC: 00	  
	EOR $93				  ; $B5DD: 45 93   
	ORA $4C				  ; $B5DF: 05 4C   
	STA $B5,X				; $B5E1: 95 B5   
loc_B5E3:
	LDA $DA				  ; $B5E3: A5 DA   
	CMP #$01				 ; $B5E5: C9 01	; Compare with 1
	BEQ $B5FA				; $B5E7: F0 11   
	BRK					  ; $B5E9: 00	  
	JSR $A22B				; $B5EA: 20 2B A2 ; -> sub_A22B
	ORA ($A9,X)			  ; $B5ED: 01 A9   
	.byte $42			  ; $B5EF - Unknown opcode
	JSR $B7B5				; $B5F0: 20 B5 B7 ; -> sub_B7B5
	CMP #$FF				 ; $B5F3: C9 FF	; Compare with 255
	BNE $B5FC				; $B5F5: D0 05   
	JMP $B595				; $B5F7: 4C 95 B5
loc_B5FA:
	LDA #$00				 ; $B5FA: A9 00   
loc_B5FC:
	TAX					  ; $B5FC: AA	  
	STA $F9				  ; $B5FD: 85 F9   
	STA $DB				  ; $B5FF: 85 DB   
	BRK					  ; $B601: 00	  
	LSR $93				  ; $B602: 46 93   
	.byte $04			  ; $B604 - Unknown opcode
	BCS $B610				; $B605: B0 09   
	BRK					  ; $B607: 00	  
	AND ($2B,X)			  ; $B608: 21 2B   
	BRK					  ; $B60A: 00	  
	.byte $83			  ; $B60B - Unknown opcode
	.byte $2B			  ; $B60C - Unknown opcode
	JMP $B595				; $B60D: 4C 95 B5
loc_B610:
	LDX $DB				  ; $B610: A6 DB   
	BRK					  ; $B612: 00	  
	.byte $0F			  ; $B613 - Unknown opcode
	.byte $53			  ; $B614 - Unknown opcode
	STA $E2				  ; $B615: 85 E2   
	LDA #$00				 ; $B617: A9 00   
	STA $E3				  ; $B619: 85 E3   
	STA $E4				  ; $B61B: 85 E4   
	LDA #$1E				 ; $B61D: A9 1E   
	LDX #$E2				 ; $B61F: A2 E2   
	JSR $C827				; $B621: 20 27 C8 ; Call to fixed bank
	JSR $B766				; $B624: 20 66 B7 ; -> sub_B766
	BRK					  ; $B627: 00	  
	.byte $22			  ; $B628 - Unknown opcode
	.byte $2B			  ; $B629 - Unknown opcode
	JSR $B7A6				; $B62A: 20 A6 B7 ; -> sub_B7A6
	LDX $DB				  ; $B62D: A6 DB   
	BRK					  ; $B62F: 00	  
	EOR $93				  ; $B630: 45 93   
	.byte $04			  ; $B632 - Unknown opcode
	JMP $B595				; $B633: 4C 95 B5
loc_B636:
	LDA $DA				  ; $B636: A5 DA   
	CMP #$01				 ; $B638: C9 01	; Compare with 1
	BEQ $B64D				; $B63A: F0 11   
	BRK					  ; $B63C: 00	  
	.byte $23			  ; $B63D - Unknown opcode
	.byte $2B			  ; $B63E - Unknown opcode
	LDX #$02				 ; $B63F: A2 02   
	LDA #$42				 ; $B641: A9 42   
	JSR $B7B5				; $B643: 20 B5 B7 ; -> sub_B7B5
	CMP #$FF				 ; $B646: C9 FF	; Compare with 255
	BNE $B64F				; $B648: D0 05   
	JMP $B595				; $B64A: 4C 95 B5
loc_B64D:
	LDA #$00				 ; $B64D: A9 00   
loc_B64F:
	TAX					  ; $B64F: AA	  
	STA $F9				  ; $B650: 85 F9   
	STA $DB				  ; $B652: 85 DB   
	BRK					  ; $B654: 00	  
	LSR $93				  ; $B655: 46 93   
	.byte $07			  ; $B657 - Unknown opcode
	BCC $B663				; $B658: 90 09   
	BRK					  ; $B65A: 00	  
	BIT $2B				  ; $B65B: 24 2B   
	BRK					  ; $B65D: 00	  
	.byte $83			  ; $B65E - Unknown opcode
	.byte $2B			  ; $B65F - Unknown opcode
	JMP $B595				; $B660: 4C 95 B5
loc_B663:
	LDX #$00				 ; $B663: A2 00   
	STX $E3				  ; $B665: 86 E3   
	STX $E4				  ; $B667: 86 E4   
	LDX $DB				  ; $B669: A6 DB   
	BRK					  ; $B66B: 00	  
	.byte $2B			  ; $B66C - Unknown opcode
	.byte $53			  ; $B66D - Unknown opcode
	CMP #$08				 ; $B66E: C9 08	; Compare with 8
	BCC $B678				; $B670: 90 06   
	LDA #$0A				 ; $B672: A9 0A   
	STA $E2				  ; $B674: 85 E2   
	BNE $B69D				; $B676: D0 25   
loc_B678:
	LDX $DB				  ; $B678: A6 DB   
	BRK					  ; $B67A: 00	  
	.byte $0F			  ; $B67B - Unknown opcode
	.byte $53			  ; $B67C - Unknown opcode
	STA $E2				  ; $B67D: 85 E2   
	LDX #$E2				 ; $B67F: A2 E2   
	JSR $C827				; $B681: 20 27 C8 ; Call to fixed bank
	LDA $E2				  ; $B684: A5 E2   
	CLC					  ; $B686: 18	  
	ADC #$0A				 ; $B687: 69 0A	; Arithmetic
	STA $E2				  ; $B689: 85 E2   
	BCC $B68F				; $B68B: 90 02   
	INC $E3				  ; $B68D: E6 E3   
loc_B68F:
	LDX #$E2				 ; $B68F: A2 E2   
	LDA #$0A				 ; $B691: A9 0A   
	JSR $C851				; $B693: 20 51 C8 ; Call to fixed bank
	LDX #$E2				 ; $B696: A2 E2   
	LDA #$0A				 ; $B698: A9 0A   
	JSR $C827				; $B69A: 20 27 C8 ; Call to fixed bank
loc_B69D:
	JSR $B766				; $B69D: 20 66 B7 ; -> sub_B766
	BRK					  ; $B6A0: 00	  
	AND $2B				  ; $B6A1: 25 2B   
	BRK					  ; $B6A3: 00	  
	ROL $2B				  ; $B6A4: 26 2B   
	JSR $B7A6				; $B6A6: 20 A6 B7 ; -> sub_B7A6
	LDX $DB				  ; $B6A9: A6 DB   
	BRK					  ; $B6AB: 00	  
	.byte $44			  ; $B6AC - Unknown opcode
	.byte $93			  ; $B6AD - Unknown opcode
	.byte $07			  ; $B6AE - Unknown opcode
	BRK					  ; $B6AF: 00	  
	ORA $53				  ; $B6B0: 05 53   
	BRK					  ; $B6B2: 00	  
	ASL $0053				; $B6B3: 0E 53 00
	.byte $3B			  ; $B6B6 - Unknown opcode
	.byte $EF			  ; $B6B7 - Unknown opcode
	BRK					  ; $B6B8: 00	  
	.byte $27			  ; $B6B9 - Unknown opcode
	.byte $0F			  ; $B6BA - Unknown opcode
	JMP $B595				; $B6BB: 4C 95 B5
loc_B6BE:
	LDA #$00				 ; $B6BE: A9 00   
	STA $DC				  ; $B6C0: 85 DC   
	BRK					  ; $B6C2: 00	  
	PLP					  ; $B6C3: 28	  
	.byte $2B			  ; $B6C4 - Unknown opcode
	LDA #$48				 ; $B6C5: A9 48   
	JSR $B7B5				; $B6C7: 20 B5 B7 ; -> sub_B7B5
	CMP #$00				 ; $B6CA: C9 00	; Compare with 0
	BEQ $B6D5				; $B6CC: F0 07   
	BRK					  ; $B6CE: 00	  
	.byte $2B			  ; $B6CF - Unknown opcode
	.byte $2B			  ; $B6D0 - Unknown opcode
	DEC $DC				  ; $B6D1: C6 DC   
	BNE $B6E1				; $B6D3: D0 0C   
loc_B6D5:
	JSR $B036				; $B6D5: 20 36 B0 ; -> sub_B036
	BRK					  ; $B6D8: 00	  
	.byte $37			  ; $B6D9 - Unknown opcode
	.byte $EF			  ; $B6DA - Unknown opcode
	BRK					  ; $B6DB: 00	  
	ASL $002F				; $B6DC: 0E 2F 00
	AND #$2B				 ; $B6DF: 29 2B   
loc_B6E1:
	LDA #$48				 ; $B6E1: A9 48   
	JSR $B7B5				; $B6E3: 20 B5 B7 ; -> sub_B7B5
	TAX					  ; $B6E6: AA	  
	BEQ $B739				; $B6E7: F0 50   
	LDA $DC				  ; $B6E9: A5 DC   
	BEQ $B73D				; $B6EB: F0 50   
	BRK					  ; $B6ED: 00	  
	AND ($4B),Y			  ; $B6EE: 31 4B   
	INC $DC				  ; $B6F0: E6 DC   
	LDA #$48				 ; $B6F2: A9 48   
	JSR $B7B5				; $B6F4: 20 B5 B7 ; -> sub_B7B5
	TAX					  ; $B6F7: AA	  
	BEQ $B73D				; $B6F8: F0 43   
	BRK					  ; $B6FA: 00	  
	.byte $33			  ; $B6FB - Unknown opcode
	.byte $4B			  ; $B6FC - Unknown opcode
	JMP $B739				; $B6FD: 4C 39 B7
loc_B700:
	BRK					  ; $B700: 00	  
	ROL					  ; $B701: 2A	  
	.byte $2B			  ; $B702 - Unknown opcode
	BRK					  ; $B703: 00	  
	.byte $62			  ; $B704 - Unknown opcode
	.byte $23			  ; $B705 - Unknown opcode
	PHP					  ; $B706: 08	  
	STA $DC				  ; $B707: 85 DC   
	LDA #$00				 ; $B709: A9 00   
	STA $DA				  ; $B70B: 85 DA   
loc_B70D:
	LDA $DA				  ; $B70D: A5 DA   
	STA $6E				  ; $B70F: 85 6E   
	LDA #$08				 ; $B711: A9 08   
	BRK					  ; $B713: 00	  
	AND $850F				; $B714: 2D 0F 85
	SBC $DAA6,Y			  ; $B717: F9 A6 DA ; Arithmetic
	BRK					  ; $B71A: 00	  
	.byte $0F			  ; $B71B - Unknown opcode
	.byte $2F			  ; $B71C - Unknown opcode
	BCS $B730				; $B71D: B0 11   
	LDA tmp0				 ; $B71F: A5 00   
	STA $FD				  ; $B721: 85 FD   
	LDA tmp1				 ; $B723: A5 01   
	STA $FE				  ; $B725: 85 FE   
	LDA tmp2				 ; $B727: A5 02   
	STA $FF				  ; $B729: 85 FF   
	BRK					  ; $B72B: 00	  
	.byte $17			  ; $B72C - Unknown opcode
	.byte $3B			  ; $B72D - Unknown opcode
	BCS $B733				; $B72E: B0 03   
loc_B730:
	BRK					  ; $B730: 00	  
	.byte $AF			  ; $B731 - Unknown opcode
	.byte $3B			  ; $B732 - Unknown opcode
loc_B733:
	INC $DA				  ; $B733: E6 DA   
	DEC $DC				  ; $B735: C6 DC   
	BNE $B70D				; $B737: D0 D4   
loc_B739:
	BRK					  ; $B739: 00	  
	CLC					  ; $B73A: 18	  
	.byte $3B			  ; $B73B - Unknown opcode
	RTS					  ; $B73C: 60	  
loc_B73D:
	BRK					  ; $B73D: 00	  
	.byte $93			  ; $B73E - Unknown opcode
	.byte $2B			  ; $B73F - Unknown opcode
	BRK					  ; $B740: 00	  
	.byte $04			  ; $B741 - Unknown opcode
	.byte $9F			  ; $B742 - Unknown opcode
	JSR $C5C5				; $B743: 20 C5 C5 ; Call to fixed bank
	JSR $C54E				; $B746: 20 4E C5 ; Call to fixed bank
	LDA #$43				 ; $B749: A9 43   
	JSR $B7B5				; $B74B: 20 B5 B7 ; -> sub_B7B5
	BRK					  ; $B74E: 00	  
	ORA $6F				  ; $B74F: 05 6F   
	JSR $E4F6				; $B751: 20 F6 E4 ; Call to fixed bank
	BRK					  ; $B754: 00	  
	ORA #$CF				 ; $B755: 09 CF   
	JSR $E501				; $B757: 20 01 E5 ; Call to fixed bank
	JSR $FF74				; $B75A: 20 74 FF ; Call to fixed bank
	JSR $C5BF				; $B75D: 20 BF C5 ; Call to fixed bank
	BRK					  ; $B760: 00	  
	STY $2B,X				; $B761: 94 2B   
	JMP $C0E9				; $B763: 4C E9 C0

; ---- Subroutine at $B766 (Bank 21) ----
sub_B766:
	LDA $E2				  ; $B766: A5 E2   
	STA $FD				  ; $B768: 85 FD   
	LDA $E3				  ; $B76A: A5 E3   
	STA $FE				  ; $B76C: 85 FE   
	LDA $E4				  ; $B76E: A5 E4   
	STA $FF				  ; $B770: 85 FF   
	BRK					  ; $B772: 00	  
	ROL $A92B				; $B773: 2E 2B A9
	.byte $07			  ; $B776 - Unknown opcode
	JSR $B7B5				; $B777: 20 B5 B7 ; -> sub_B7B5
	LDA #$48				 ; $B77A: A9 48   
	JSR $B7B5				; $B77C: 20 B5 B7 ; -> sub_B7B5
	CMP #$00				 ; $B77F: C9 00	; Compare with 0
	BEQ $B78B				; $B781: F0 08   
	BRK					  ; $B783: 00	  
	BMI $B7B1				; $B784: 30 2B   
	PLA					  ; $B786: 68	  
	PLA					  ; $B787: 68	  
	JMP $B7B4				; $B788: 4C B4 B7
loc_B78B:
	LDA $E3				  ; $B78B: A5 E3   
	STA $70				  ; $B78D: 85 70   
	LDA $E4				  ; $B78F: A5 E4   
	STA $71				  ; $B791: 85 71   
	LDA $E2				  ; $B793: A5 E2   
	BRK					  ; $B795: 00	  
	JMP $9073				; $B796: 4C 73 90
	ORA ($60,X)			  ; $B799: 01 60   
	BRK					  ; $B79B: 00	  
	.byte $2F			  ; $B79C - Unknown opcode
	.byte $2B			  ; $B79D - Unknown opcode
	BRK					  ; $B79E: 00	  
	.byte $83			  ; $B79F - Unknown opcode
	.byte $2B			  ; $B7A0 - Unknown opcode
	PLA					  ; $B7A1: 68	  
	PLA					  ; $B7A2: 68	  
	JMP $B595				; $B7A3: 4C 95 B5

; ---- Subroutine at $B7A6 (Bank 21) ----
sub_B7A6:
	BRK					  ; $B7A6: 00	  
	.byte $04			  ; $B7A7 - Unknown opcode
	.byte $9F			  ; $B7A8 - Unknown opcode
	JSR $B030				; $B7A9: 20 30 B0 ; -> sub_B030
	LDA #$07				 ; $B7AC: A9 07   
	JMP $B7B5				; $B7AE: 4C B5 B7
loc_B7B1:
	BRK					  ; $B7B1: 00	  
	AND $602B				; $B7B2: 2D 2B 60

; ---- Subroutine at $B7B5 (Bank 21) ----
sub_B7B5:
	STX $0E				  ; $B7B5: 86 0E   
	STA $0F				  ; $B7B7: 85 0F   
	TYA					  ; $B7B9: 98	  
	PHA					  ; $B7BA: 48	  
	TXA					  ; $B7BB: 8A	  
	PHA					  ; $B7BC: 48	  
	LDX #$00				 ; $B7BD: A2 00   
loc_B7BF:
	LDA $DA,X				; $B7BF: B5 DA   
	PHA					  ; $B7C1: 48	  
	INX					  ; $B7C2: E8	  
	CPX #$10				 ; $B7C3: E0 10   
	BCC $B7BF				; $B7C5: 90 F8   
	LDA submap_number		; $B7C7: A5 64   
	CMP #$FE				 ; $B7C9: C9 FE	; Compare with 254
	BNE $B7D5				; $B7CB: D0 08   
	LDA $6BDE				; $B7CD: AD DE 6B
	ORA #$80				 ; $B7D0: 09 80   
	STA $6BDE				; $B7D2: 8D DE 6B
loc_B7D5:
	LDA $0F				  ; $B7D5: A5 0F   
	LDX $0E				  ; $B7D7: A6 0E   
	BRK					  ; $B7D9: 00	  
	BRK					  ; $B7DA: 00	  
	.byte $6F			  ; $B7DB - Unknown opcode
	STA $0F				  ; $B7DC: 85 0F   
	LDA submap_number		; $B7DE: A5 64   
	CMP #$FE				 ; $B7E0: C9 FE	; Compare with 254
	BNE $B7EC				; $B7E2: D0 08   
	LDA $6BDE				; $B7E4: AD DE 6B
	AND #$7F				 ; $B7E7: 29 7F   
	STA $6BDE				; $B7E9: 8D DE 6B
loc_B7EC:
	LDX #$0F				 ; $B7EC: A2 0F   
loc_B7EE:
	PLA					  ; $B7EE: 68	  
	STA $DA,X				; $B7EF: 95 DA   
	DEX					  ; $B7F1: CA	  
	BPL $B7EE				; $B7F2: 10 FA   
	PLA					  ; $B7F4: 68	  
	TAX					  ; $B7F5: AA	  
	PLA					  ; $B7F6: 68	  
	TAY					  ; $B7F7: A8	  
	LDA $0F				  ; $B7F8: A5 0F   
	RTS					  ; $B7FA: 60	  

; ---- Subroutine at $B7FB (Bank 21) ----
sub_B7FB:
	LDA tmp0				 ; $B7FB: A5 00   
	PHA					  ; $B7FD: 48	  
	LDA tmp1				 ; $B7FE: A5 01   
	PHA					  ; $B800: 48	  
	BRK					  ; $B801: 00	  
	ORA $6F				  ; $B802: 05 6F   
	LDA #$50				 ; $B804: A9 50   
	JSR $B7B5				; $B806: 20 B5 B7 ; -> sub_B7B5
	PLA					  ; $B809: 68	  
	STA tmp1				 ; $B80A: 85 01   
	PLA					  ; $B80C: 68	  
	STA tmp0				 ; $B80D: 85 00   
	RTS					  ; $B80F: 60	  

; ---- Subroutine at $B810 (Bank 21) ----
sub_B810:
	BRK					  ; $B810: 00	  
	.byte $62			  ; $B811 - Unknown opcode
	.byte $33			  ; $B812 - Unknown opcode
	STA $DA				  ; $B813: 85 DA   
	LDA #$69				 ; $B815: A9 69   
	JSR $B7B5				; $B817: 20 B5 B7 ; -> sub_B7B5
	LDA #$3E				 ; $B81A: A9 3E   
	JMP $B7B5				; $B81C: 4C B5 B7
	JMP $B825				; $B81F: 4C 25 B8
loc_B822:
	JSR $B7FB				; $B822: 20 FB B7 ; -> sub_B7FB
loc_B825:
	LDA #$01				 ; $B825: A9 01   
	BNE $B835				; $B827: D0 0C   
loc_B829:
	JSR $B7FB				; $B829: 20 FB B7 ; -> sub_B7FB
	LDA #$03				 ; $B82C: A9 03   
	BNE $B835				; $B82E: D0 05   
loc_B830:
	JSR $B7FB				; $B830: 20 FB B7 ; -> sub_B7FB

; ---- Subroutine at $B833 (Bank 21) ----
sub_B833:
	LDA #$02				 ; $B833: A9 02   
loc_B835:
	STA $07C5				; $B835: 8D C5 07
	LDA #$00				 ; $B838: A9 00   
	JSR $BAEF				; $B83A: 20 EF BA ; -> sub_BAEF
loc_B83D:
	JSR $B810				; $B83D: 20 10 B8 ; -> sub_B810
	CMP #$00				 ; $B840: C9 00	; Compare with 0
	BEQ $B84E				; $B842: F0 0A   
	CMP #$01				 ; $B844: C9 01	; Compare with 1
	BNE $B84B				; $B846: D0 03   
	JMP $B92B				; $B848: 4C 2B B9
loc_B84B:
	JMP $BA0A				; $B84B: 4C 0A BA
loc_B84E:
	JSR $B1EF				; $B84E: 20 EF B1 ; -> sub_B1EF
	LDA #$01				 ; $B851: A9 01   
	JSR $BAEF				; $B853: 20 EF BA ; -> sub_BAEF
	LDA #$3F				 ; $B856: A9 3F   
	JSR $B7B5				; $B858: 20 B5 B7 ; -> sub_B7B5
	CMP #$FF				 ; $B85B: C9 FF	; Compare with 255
	BNE $B862				; $B85D: D0 03   
	JMP $BA02				; $B85F: 4C 02 BA
loc_B862:
	JSR $BA5D				; $B862: 20 5D BA ; -> sub_BA5D
	BCS $B86F				; $B865: B0 08   
	LDA #$02				 ; $B867: A9 02   
	JSR $BAEF				; $B869: 20 EF BA ; -> sub_BAEF
	JMP $B928				; $B86C: 4C 28 B9
loc_B86F:
	LDA #$03				 ; $B86F: A9 03   
	JSR $BAEF				; $B871: 20 EF BA ; -> sub_BAEF
	JSR $BACD				; $B874: 20 CD BA ; -> sub_BACD
	LDA $DA				  ; $B877: A5 DA   
	CMP #$01				 ; $B879: C9 01	; Compare with 1
	BEQ $B890				; $B87B: F0 13   
loc_B87D:
	LDA #$04				 ; $B87D: A9 04   
	JSR $BAEF				; $B87F: 20 EF BA ; -> sub_BAEF
	LDX $DC				  ; $B882: A6 DC   
	LDA #$40				 ; $B884: A9 40   
	JSR $B7B5				; $B886: 20 B5 B7 ; -> sub_B7B5
	CMP #$FF				 ; $B889: C9 FF	; Compare with 255
	BNE $B892				; $B88B: D0 05   
	JMP $B9F3				; $B88D: 4C F3 B9
loc_B890:
	LDA #$00				 ; $B890: A9 00   
loc_B892:
	STA $DB				  ; $B892: 85 DB   
	STA $F9				  ; $B894: 85 F9   
	TAX					  ; $B896: AA	  
	BRK					  ; $B897: 00	  
	.byte $2B			  ; $B898 - Unknown opcode
	.byte $53			  ; $B899 - Unknown opcode
	CMP #$08				 ; $B89A: C9 08	; Compare with 8
	BNE $B8A8				; $B89C: D0 0A   
	LDA #$05				 ; $B89E: A9 05   
	JSR $BAEF				; $B8A0: 20 EF BA ; -> sub_BAEF
	BRK					  ; $B8A3: 00	  
	.byte $83			  ; $B8A4 - Unknown opcode
	.byte $2B			  ; $B8A5 - Unknown opcode
	BCS $B8C0				; $B8A6: B0 18   
loc_B8A8:
	CMP #$09				 ; $B8A8: C9 09	; Compare with 9
	BCC $B8B6				; $B8AA: 90 0A   
	LDA #$06				 ; $B8AC: A9 06   
	JSR $BAEF				; $B8AE: 20 EF BA ; -> sub_BAEF
	BRK					  ; $B8B1: 00	  
	.byte $83			  ; $B8B2 - Unknown opcode
	.byte $2B			  ; $B8B3 - Unknown opcode
	BCS $B8C0				; $B8B4: B0 0A   
loc_B8B6:
	JSR $BA55				; $B8B6: 20 55 BA ; -> sub_BA55
	BCC $B8DB				; $B8B9: 90 20   
	LDA #$07				 ; $B8BB: A9 07   
	JSR $BAEF				; $B8BD: 20 EF BA ; -> sub_BAEF
loc_B8C0:
	LDA $DA				  ; $B8C0: A5 DA   
	CMP #$01				 ; $B8C2: C9 01	; Compare with 1
	BEQ $B8D3				; $B8C4: F0 0D   
loc_B8C6:
	LDA #$08				 ; $B8C6: A9 08   
	JSR $BAEF				; $B8C8: 20 EF BA ; -> sub_BAEF
	JSR $9AC9				; $B8CB: 20 C9 9A ; -> sub_9AC9
	BEQ $B87D				; $B8CE: F0 AD   
	JMP $B9F3				; $B8D0: 4C F3 B9
loc_B8D3:
	LDA #$09				 ; $B8D3: A9 09   
	JSR $BAEF				; $B8D5: 20 EF BA ; -> sub_BAEF
	JMP $B9FF				; $B8D8: 4C FF B9
loc_B8DB:
	JSR $BA3E				; $B8DB: 20 3E BA ; -> sub_BA3E
	BCS $B8F3				; $B8DE: B0 13   
	LDA #$0A				 ; $B8E0: A9 0A   
	JSR $BAEF				; $B8E2: 20 EF BA ; -> sub_BAEF
	JSR $9AC9				; $B8E5: 20 C9 9A ; -> sub_9AC9
	BEQ $B8F3				; $B8E8: F0 09   
	LDA $DA				  ; $B8EA: A5 DA   
	CMP #$01				 ; $B8EC: C9 01	; Compare with 1
	BNE $B8C6				; $B8EE: D0 D6   
	JMP $B9FF				; $B8F0: 4C FF B9
loc_B8F3:
	LDX $DB				  ; $B8F3: A6 DB   
	BRK					  ; $B8F5: 00	  
	ROR					  ; $B8F6: 6A	  
	.byte $53			  ; $B8F7 - Unknown opcode
	TAX					  ; $B8F8: AA	  
	BEQ $B903				; $B8F9: F0 08   
	LDA #$0B				 ; $B8FB: A9 0B   
	JSR $BAEF				; $B8FD: 20 EF BA ; -> sub_BAEF
	JMP $B925				; $B900: 4C 25 B9
loc_B903:
	LDX $DB				  ; $B903: A6 DB   
	BRK					  ; $B905: 00	  
	.byte $42			  ; $B906 - Unknown opcode
	.byte $53			  ; $B907 - Unknown opcode
	CMP #$01				 ; $B908: C9 01	; Compare with 1
	BNE $B914				; $B90A: D0 08   
	LDA #$0C				 ; $B90C: A9 0C   
	JSR $BAEF				; $B90E: 20 EF BA ; -> sub_BAEF
	JMP $B925				; $B911: 4C 25 B9
loc_B914:
	CMP #$02				 ; $B914: C9 02	; Compare with 2
	BNE $B920				; $B916: D0 08   
	LDA #$0D				 ; $B918: A9 0D   
	JSR $BAEF				; $B91A: 20 EF BA ; -> sub_BAEF
	JMP $B925				; $B91D: 4C 25 B9
loc_B920:
	LDA #$0E				 ; $B920: A9 0E   
	JSR $BAEF				; $B922: 20 EF BA ; -> sub_BAEF
loc_B925:
	JSR $BAA0				; $B925: 20 A0 BA ; -> sub_BAA0
loc_B928:
	JMP $B9FF				; $B928: 4C FF B9
loc_B92B:
	LDA $DA				  ; $B92B: A5 DA   
	CMP #$01				 ; $B92D: C9 01	; Compare with 1
	BEQ $B945				; $B92F: F0 14   
	LDA #$0F				 ; $B931: A9 0F   
	JSR $BAEF				; $B933: 20 EF BA ; -> sub_BAEF
	LDA #$49				 ; $B936: A9 49   
	JSR $B7B5				; $B938: 20 B5 B7 ; -> sub_B7B5
	CMP #$FF				 ; $B93B: C9 FF	; Compare with 255
	BNE $B947				; $B93D: D0 08   
	BRK					  ; $B93F: 00	  
	DEC $4B,X				; $B940: D6 4B   
	JMP $B9F3				; $B942: 4C F3 B9
loc_B945:
	LDA #$00				 ; $B945: A9 00   
loc_B947:
	STA $DB				  ; $B947: 85 DB   
	STA $F9				  ; $B949: 85 F9   
	TAX					  ; $B94B: AA	  
	BRK					  ; $B94C: 00	  
	.byte $2B			  ; $B94D - Unknown opcode
	.byte $73			  ; $B94E - Unknown opcode
	CMP #$08				 ; $B94F: C9 08	; Compare with 8
	BNE $B95E				; $B951: D0 0B   
	LDA #$10				 ; $B953: A9 10   
	JSR $BAEF				; $B955: 20 EF BA ; -> sub_BAEF
	BRK					  ; $B958: 00	  
	.byte $83			  ; $B959 - Unknown opcode
	.byte $2B			  ; $B95A - Unknown opcode
	JMP $B97B				; $B95B: 4C 7B B9
loc_B95E:
	CMP #$09				 ; $B95E: C9 09	; Compare with 9
	BCC $B96D				; $B960: 90 0B   
	BRK					  ; $B962: 00	  
	DEC $4B,X				; $B963: D6 4B   
	LDA #$11				 ; $B965: A9 11   
	JSR $BAEF				; $B967: 20 EF BA ; -> sub_BAEF
	JMP $B97B				; $B96A: 4C 7B B9
loc_B96D:
	LDX $DB				  ; $B96D: A6 DB   
	BRK					  ; $B96F: 00	  
	AND $C953				; $B970: 2D 53 C9
	BRK					  ; $B973: 00	  
	BNE $B987				; $B974: D0 11   
	LDA #$12				 ; $B976: A9 12   
	JSR $BAEF				; $B978: 20 EF BA ; -> sub_BAEF
loc_B97B:
	LDA $DA				  ; $B97B: A5 DA   
	CMP #$01				 ; $B97D: C9 01	; Compare with 1
	BNE $B984				; $B97F: D0 03   
	JMP $B9FF				; $B981: 4C FF B9
loc_B984:
	JMP $B9F0				; $B984: 4C F0 B9
loc_B987:
	BRK					  ; $B987: 00	  
	DEC $4B,X				; $B988: D6 4B   
	LDA #$13				 ; $B98A: A9 13   
	JSR $BAEF				; $B98C: 20 EF BA ; -> sub_BAEF
	JSR $BA20				; $B98F: 20 20 BA ; -> sub_BA20
	BCC $B997				; $B992: 90 03   
	JMP $B9F3				; $B994: 4C F3 B9
loc_B997:
	LDA #$14				 ; $B997: A9 14   
	JSR $BAEF				; $B999: 20 EF BA ; -> sub_BAEF
	LDA $DB				  ; $B99C: A5 DB   
	STA $F9				  ; $B99E: 85 F9   
	LDA $DC				  ; $B9A0: A5 DC   
	BRK					  ; $B9A2: 00	  
	.byte $0F			  ; $B9A3 - Unknown opcode
	.byte $0F			  ; $B9A4 - Unknown opcode
	BCC $B9AF				; $B9A5: 90 08   
	LDA #$15				 ; $B9A7: A9 15   
	JSR $BAEF				; $B9A9: 20 EF BA ; -> sub_BAEF
	JMP $B9F0				; $B9AC: 4C F0 B9
loc_B9AF:
	LDA $DC				  ; $B9AF: A5 DC   
	STA tmp0				 ; $B9B1: 85 00   
	JSR $B35F				; $B9B3: 20 5F B3 ; -> sub_B35F
	JSR $A47C				; $B9B6: 20 7C A4 ; -> sub_A47C
	LDA #$16				 ; $B9B9: A9 16   
	JSR $BAEF				; $B9BB: 20 EF BA ; -> sub_BAEF
	JSR $9AC9				; $B9BE: 20 C9 9A ; -> sub_9AC9
	BEQ $B9CB				; $B9C1: F0 08   
	LDA #$17				 ; $B9C3: A9 17   
	JSR $BAEF				; $B9C5: 20 EF BA ; -> sub_BAEF
	JMP $B9F0				; $B9C8: 4C F0 B9
loc_B9CB:
	LDA #$18				 ; $B9CB: A9 18   
	JSR $BAEF				; $B9CD: 20 EF BA ; -> sub_BAEF
	LDX $DB				  ; $B9D0: A6 DB   
	BRK					  ; $B9D2: 00	  
	ROR					  ; $B9D3: 6A	  
	.byte $53			  ; $B9D4 - Unknown opcode
	TAX					  ; $B9D5: AA	  
	BEQ $B9E0				; $B9D6: F0 08   
	BRK					  ; $B9D8: 00	  
	.byte $83			  ; $B9D9 - Unknown opcode
	.byte $2B			  ; $B9DA - Unknown opcode
	LDA #$19				 ; $B9DB: A9 19   
	JSR $BAEF				; $B9DD: 20 EF BA ; -> sub_BAEF
loc_B9E0:
	JSR $BA10				; $B9E0: 20 10 BA ; -> sub_BA10
	BCC $B9ED				; $B9E3: 90 08   
	LDA #$1A				 ; $B9E5: A9 1A   
	JSR $BAEF				; $B9E7: 20 EF BA ; -> sub_BAEF
	JMP $B9FF				; $B9EA: 4C FF B9
loc_B9ED:
	JSR $BA82				; $B9ED: 20 82 BA ; -> sub_BA82
loc_B9F0:
	JMP $B9FF				; $B9F0: 4C FF B9
loc_B9F3:
	LDA $07C5				; $B9F3: AD C5 07
	CMP #$02				 ; $B9F6: C9 02	; Compare with 2
	BNE $BA02				; $B9F8: D0 08   
	LDA #$1B				 ; $B9FA: A9 1B   
	JSR $BAEF				; $B9FC: 20 EF BA ; -> sub_BAEF
loc_B9FF:
	BRK					  ; $B9FF: 00	  
	.byte $83			  ; $BA00 - Unknown opcode
	.byte $2B			  ; $BA01 - Unknown opcode
loc_BA02:
	LDA #$1C				 ; $BA02: A9 1C   
	JSR $BAEF				; $BA04: 20 EF BA ; -> sub_BAEF
	JMP $B83D				; $BA07: 4C 3D B8
loc_BA0A:
	LDA #$1D				 ; $BA0A: A9 1D   
	JSR $BAEF				; $BA0C: 20 EF BA ; -> sub_BAEF
	RTS					  ; $BA0F: 60	  

; ---- Subroutine at $BA10 (Bank 21) ----
sub_BA10:
	LDA $DD				  ; $BA10: A5 DD   
	BPL $BA1E				; $BA12: 10 0A   
	BRK					  ; $BA14: 00	  
	.byte $0C			  ; $BA15 - Unknown opcode
	.byte $0F			  ; $BA16 - Unknown opcode
	BCC $BA1E				; $BA17: 90 05   
	JSR $BAC0				; $BA19: 20 C0 BA ; -> sub_BAC0
	SEC					  ; $BA1C: 38	  
	RTS					  ; $BA1D: 60	  
loc_BA1E:
	CLC					  ; $BA1E: 18	  
	RTS					  ; $BA1F: 60	  

; ---- Subroutine at $BA20 (Bank 21) ----
sub_BA20:
	LDX $DB				  ; $BA20: A6 DB   
	LDA #$6A				 ; $BA22: A9 6A   
	JSR $B7B5				; $BA24: 20 B5 B7 ; -> sub_B7B5
	CMP #$FF				 ; $BA27: C9 FF	; Compare with 255
	BNE $BA2D				; $BA29: D0 02   
	SEC					  ; $BA2B: 38	  
	RTS					  ; $BA2C: 60	  
loc_BA2D:
	STA $DF				  ; $BA2D: 85 DF   
	LDX $DB				  ; $BA2F: A6 DB   
	BRK					  ; $BA31: 00	  
	BIT $8573				; $BA32: 2C 73 85
	.byte $DC			  ; $BA35 - Unknown opcode
	STA $F9				  ; $BA36: 85 F9   
	LDA $73				  ; $BA38: A5 73   
	STA $DD				  ; $BA3A: 85 DD   
	CLC					  ; $BA3C: 18	  
	RTS					  ; $BA3D: 60	  

; ---- Subroutine at $BA3E (Bank 21) ----
sub_BA3E:
	LDA $DC				  ; $BA3E: A5 DC   
	BRK					  ; $BA40: 00	  
	.byte $0B			  ; $BA41 - Unknown opcode
	.byte $0F			  ; $BA42 - Unknown opcode
	CPX #$04				 ; $BA43: E0 04   
	BEQ $BA53				; $BA45: F0 0C   
	LDX $DB				  ; $BA47: A6 DB   
	BRK					  ; $BA49: 00	  
	.byte $2B			  ; $BA4A - Unknown opcode
	.byte $53			  ; $BA4B - Unknown opcode
	TAX					  ; $BA4C: AA	  
	LDA $DC				  ; $BA4D: A5 DC   
	BRK					  ; $BA4F: 00	  
	ASL					  ; $BA50: 0A	  
	.byte $0F			  ; $BA51 - Unknown opcode
	RTS					  ; $BA52: 60	  
loc_BA53:
	SEC					  ; $BA53: 38	  
	RTS					  ; $BA54: 60	  

; ---- Subroutine at $BA55 (Bank 21) ----
sub_BA55:
	LDX $DB				  ; $BA55: A6 DB   
	BRK					  ; $BA57: 00	  
	AND $C953				; $BA58: 2D 53 C9
	PHP					  ; $BA5B: 08	  
	RTS					  ; $BA5C: 60	  

; ---- Subroutine at $BA5D (Bank 21) ----
sub_BA5D:
	JSR $BA73				; $BA5D: 20 73 BA ; -> sub_BA73
	JSR $A47C				; $BA60: 20 7C A4 ; -> sub_A47C
	BRK					  ; $BA63: 00	  
	LSR					  ; $BA64: 4A	  
	.byte $33			  ; $BA65 - Unknown opcode
	LDA $72				  ; $BA66: A5 72   
	CMP $FD				  ; $BA68: C5 FD   
	LDA $73				  ; $BA6A: A5 73   
	SBC $FE				  ; $BA6C: E5 FE	; Arithmetic
	LDA $74				  ; $BA6E: A5 74   
	SBC $FF				  ; $BA70: E5 FF	; Arithmetic
	RTS					  ; $BA72: 60	  

; ---- Subroutine at $BA73 (Bank 21) ----
sub_BA73:
	STA $DF				  ; $BA73: 85 DF   
	TAX					  ; $BA75: AA	  
	LDA $07BD,X			  ; $BA76: BD BD 07
	STA $DC				  ; $BA79: 85 DC   
	STA tmp0				 ; $BA7B: 85 00   
	STA $F9				  ; $BA7D: 85 F9   
	JMP $B2CF				; $BA7F: 4C CF B2

; ---- Subroutine at $BA82 (Bank 21) ----
sub_BA82:
	LDA $DC				  ; $BA82: A5 DC   
	STA tmp0				 ; $BA84: 85 00   
	JSR $B35F				; $BA86: 20 5F B3 ; -> sub_B35F
	LDA tmp1				 ; $BA89: A5 01   
	STA $70				  ; $BA8B: 85 70   
	LDA tmp2				 ; $BA8D: A5 02   
	STA $71				  ; $BA8F: 85 71   
	LDA tmp0				 ; $BA91: A5 00   
	BRK					  ; $BA93: 00	  
	.byte $4B			  ; $BA94 - Unknown opcode
	.byte $73			  ; $BA95 - Unknown opcode
	LDX $DB				  ; $BA96: A6 DB   
	LDA $DF				  ; $BA98: A5 DF   
	BRK					  ; $BA9A: 00	  
	BMI $BB10				; $BA9B: 30 73   
	JMP $A6B7				; $BA9D: 4C B7 A6

; ---- Subroutine at $BAA0 (Bank 21) ----
sub_BAA0:
	LDA $DC				  ; $BAA0: A5 DC   
	STA tmp0				 ; $BAA2: 85 00   
	JSR $B2CF				; $BAA4: 20 CF B2 ; -> sub_B2CF
	LDA tmp1				 ; $BAA7: A5 01   
	STA $70				  ; $BAA9: 85 70   
	LDA tmp2				 ; $BAAB: A5 02   
	STA $71				  ; $BAAD: 85 71   
	LDA tmp0				 ; $BAAF: A5 00   
	BRK					  ; $BAB1: 00	  
	JMP $A673				; $BAB2: 4C 73 A6
	.byte $DB			  ; $BAB5 - Unknown opcode
	LDA $DC				  ; $BAB6: A5 DC   
	AND #$7F				 ; $BAB8: 29 7F   
	BRK					  ; $BABA: 00	  
	ROL $4C73				; $BABB: 2E 73 4C
	.byte $B7			  ; $BABE - Unknown opcode
	LDX tmp0				 ; $BABF: A6 00   
	.byte $04			  ; $BAC1 - Unknown opcode
	.byte $9F			  ; $BAC2 - Unknown opcode
	BRK					  ; $BAC3: 00	  
	.byte $12			  ; $BAC4 - Unknown opcode
	.byte $FB			  ; $BAC5 - Unknown opcode
	BRK					  ; $BAC6: 00	  
	.byte $07			  ; $BAC7 - Unknown opcode
	.byte $9F			  ; $BAC8 - Unknown opcode
	BRK					  ; $BAC9: 00	  
	ORA #$9F				 ; $BACA: 09 9F   
	RTS					  ; $BACC: 60	  

; ---- Subroutine at $BACD (Bank 21) ----
sub_BACD:
	LDA $07C5				; $BACD: AD C5 07
	CMP #$02				 ; $BAD0: C9 02	; Compare with 2
	BNE $BAEE				; $BAD2: D0 1A   
	LDA map_number		   ; $BAD4: A5 63   
	CMP #$18				 ; $BAD6: C9 18	; Compare with 24
	BNE $BAEE				; $BAD8: D0 14   
	LDA submap_number		; $BADA: A5 64   
	CMP #$00				 ; $BADC: C9 00	; Compare with 0
	BNE $BAEE				; $BADE: D0 0E   
	LDA $DC				  ; $BAE0: A5 DC   
	CMP #$53				 ; $BAE2: C9 53	; Compare with 83
	BEQ $BAEA				; $BAE4: F0 04   
	LDA #$00				 ; $BAE6: A9 00   
	BEQ $BAEC				; $BAE8: F0 02   
loc_BAEA:
	LDA #$79				 ; $BAEA: A9 79   
loc_BAEC:
	STA $DC				  ; $BAEC: 85 DC   
loc_BAEE:
	RTS					  ; $BAEE: 60	  

; ---- Subroutine at $BAEF (Bank 21) ----
sub_BAEF:
	ASL					  ; $BAEF: 0A	  
	TAY					  ; $BAF0: A8	  
	LDX $07C5				; $BAF1: AE C5 07
	CPX #$01				 ; $BAF4: E0 01   
	BNE $BB02				; $BAF6: D0 0A   
	LDA $BB1A,Y			  ; $BAF8: B9 1A BB
	TAX					  ; $BAFB: AA	  
	LDA $BB1B,Y			  ; $BAFC: B9 1B BB
	JMP $9919				; $BAFF: 4C 19 99
loc_BB02:
	CPX #$03				 ; $BB02: E0 03   
	BNE $BB10				; $BB04: D0 0A   
	LDA $BB92,Y			  ; $BB06: B9 92 BB
	TAX					  ; $BB09: AA	  
	LDA $BB93,Y			  ; $BB0A: B9 93 BB
	JMP $9919				; $BB0D: 4C 19 99
loc_BB10:
	LDA $BB56,Y			  ; $BB10: B9 56 BB
	TAX					  ; $BB13: AA	  
	LDA $BB57,Y			  ; $BB14: B9 57 BB
	JMP $9919				; $BB17: 4C 19 99
	.byte $02			  ; $BB1A - Unknown opcode
	.byte $5A			  ; $BB1B - Unknown opcode
	.byte $02			  ; $BB1C - Unknown opcode
	.byte $5B			  ; $BB1D - Unknown opcode
	.byte $02			  ; $BB1E - Unknown opcode
	.byte $5C			  ; $BB1F - Unknown opcode
	.byte $02			  ; $BB20 - Unknown opcode
	EOR $5E02,X			  ; $BB21: 5D 02 5E
	.byte $04			  ; $BB24 - Unknown opcode
	.byte $23			  ; $BB25 - Unknown opcode
	.byte $04			  ; $BB26 - Unknown opcode
	BIT tmp2				 ; $BB27: 24 02   
	.byte $5F			  ; $BB29 - Unknown opcode
	.byte $02			  ; $BB2A - Unknown opcode
	ADC (tmp2,X)			 ; $BB2B: 61 02	; Arithmetic
	RTS					  ; $BB2D: 60	  
	.byte $02			  ; $BB2E - Unknown opcode
	.byte $62			  ; $BB2F - Unknown opcode
	.byte $02			  ; $BB30 - Unknown opcode
	.byte $63			  ; $BB31 - Unknown opcode
	.byte $02			  ; $BB32 - Unknown opcode
	.byte $64			  ; $BB33 - Unknown opcode
	.byte $02			  ; $BB34 - Unknown opcode
	ADC tmp2				 ; $BB35: 65 02	; Arithmetic
	ROR tmp2				 ; $BB37: 66 02   
	.byte $67			  ; $BB39 - Unknown opcode
	.byte $04			  ; $BB3A - Unknown opcode
	AND ptr0_lo			  ; $BB3B: 25 04   
	ROL tmp2				 ; $BB3D: 26 02   
	PLA					  ; $BB3F: 68	  
	.byte $02			  ; $BB40 - Unknown opcode
	ADC #$02				 ; $BB41: 69 02	; Arithmetic
	ROR					  ; $BB43: 6A	  
	.byte $02			  ; $BB44 - Unknown opcode
	JMP ($6D02)			  ; $BB45: 6C 02 6D
	.byte $02			  ; $BB48 - Unknown opcode
	ROR $6F02				; $BB49: 6E 02 6F
	.byte $02			  ; $BB4C - Unknown opcode
	BVS $BB51				; $BB4D: 70 02   
	ADC (tmp0),Y			 ; $BB4F: 71 00	; Arithmetic
loc_BB51:
	BRK					  ; $BB51: 00	  
	.byte $02			  ; $BB52 - Unknown opcode
	.byte $8F			  ; $BB53 - Unknown opcode
	.byte $02			  ; $BB54 - Unknown opcode
	.byte $72			  ; $BB55 - Unknown opcode
	.byte $02			  ; $BB56 - Unknown opcode
	BRK					  ; $BB57: 00	  
	.byte $02			  ; $BB58 - Unknown opcode
	ORA (tmp2,X)			 ; $BB59: 01 02   
	.byte $02			  ; $BB5B - Unknown opcode
	.byte $02			  ; $BB5C - Unknown opcode
	.byte $03			  ; $BB5D - Unknown opcode
	.byte $02			  ; $BB5E - Unknown opcode
	.byte $04			  ; $BB5F - Unknown opcode
	.byte $04			  ; $BB60 - Unknown opcode
	.byte $23			  ; $BB61 - Unknown opcode
	.byte $04			  ; $BB62 - Unknown opcode
	BIT tmp2				 ; $BB63: 24 02   
	ORA tmp2				 ; $BB65: 05 02   
	.byte $07			  ; $BB67 - Unknown opcode
	.byte $02			  ; $BB68 - Unknown opcode
	ASL tmp2				 ; $BB69: 06 02   
	PHP					  ; $BB6B: 08	  
	.byte $02			  ; $BB6C - Unknown opcode
	ORA #$02				 ; $BB6D: 09 02   
	STX $0A02				; $BB6F: 8E 02 0A
	.byte $02			  ; $BB72 - Unknown opcode
	.byte $0B			  ; $BB73 - Unknown opcode
	.byte $02			  ; $BB74 - Unknown opcode
	ORA $2504				; $BB75: 0D 04 25
	.byte $04			  ; $BB78 - Unknown opcode
	ROL tmp2				 ; $BB79: 26 02   
	ASL $0F02				; $BB7B: 0E 02 0F
	.byte $02			  ; $BB7E - Unknown opcode
	BPL $BB83				; $BB7F: 10 02   
	ORA (tmp2),Y			 ; $BB81: 11 02   
loc_BB83:
	.byte $12			  ; $BB83 - Unknown opcode
	.byte $02			  ; $BB84 - Unknown opcode
	.byte $13			  ; $BB85 - Unknown opcode
	.byte $02			  ; $BB86 - Unknown opcode
	.byte $14			  ; $BB87 - Unknown opcode
	.byte $02			  ; $BB88 - Unknown opcode
	ORA tmp2,X			   ; $BB89: 15 02   
	ASL tmp2,X			   ; $BB8B: 16 02   
	CLC					  ; $BB8D: 18	  
	.byte $02			  ; $BB8E - Unknown opcode
	ORA $1A02,Y			  ; $BB8F: 19 02 1A
	.byte $02			  ; $BB92 - Unknown opcode
	.byte $73			  ; $BB93 - Unknown opcode
	.byte $02			  ; $BB94 - Unknown opcode
	.byte $74			  ; $BB95 - Unknown opcode
	.byte $02			  ; $BB96 - Unknown opcode
	ADC tmp2,X			   ; $BB97: 75 02	; Arithmetic
	ROR tmp2,X			   ; $BB99: 76 02   
	.byte $77			  ; $BB9B - Unknown opcode
	.byte $04			  ; $BB9C - Unknown opcode
	.byte $23			  ; $BB9D - Unknown opcode
	.byte $04			  ; $BB9E - Unknown opcode
	BIT tmp2				 ; $BB9F: 24 02   
	SEI					  ; $BBA1: 78	  
	.byte $02			  ; $BBA2 - Unknown opcode
	.byte $7B			  ; $BBA3 - Unknown opcode
	.byte $02			  ; $BBA4 - Unknown opcode
	ADC $7C02,Y			  ; $BBA5: 79 02 7C ; Arithmetic
	.byte $02			  ; $BBA8 - Unknown opcode
	ADC $8B02,X			  ; $BBA9: 7D 02 8B ; Arithmetic
	.byte $02			  ; $BBAC - Unknown opcode
	ROR $7F02,X			  ; $BBAD: 7E 02 7F
	.byte $02			  ; $BBB0 - Unknown opcode
	.byte $80			  ; $BBB1 - Unknown opcode
	.byte $04			  ; $BBB2 - Unknown opcode
	AND ptr0_lo			  ; $BBB3: 25 04   
	ROL tmp2				 ; $BBB5: 26 02   
	STA (tmp2,X)			 ; $BBB7: 81 02   
	.byte $82			  ; $BBB9 - Unknown opcode
	.byte $02			  ; $BBBA - Unknown opcode
	.byte $7A			  ; $BBBB - Unknown opcode
	.byte $02			  ; $BBBC - Unknown opcode
	STY tmp2				 ; $BBBD: 84 02   
	STX tmp2				 ; $BBBF: 86 02   
	.byte $87			  ; $BBC1 - Unknown opcode
	.byte $02			  ; $BBC2 - Unknown opcode
	DEY					  ; $BBC3: 88	  
	.byte $02			  ; $BBC4 - Unknown opcode
	.byte $89			  ; $BBC5 - Unknown opcode
	.byte $02			  ; $BBC6 - Unknown opcode
	TXA					  ; $BBC7: 8A	  
	BRK					  ; $BBC8: 00	  
	BRK					  ; $BBC9: 00	  
	.byte $02			  ; $BBCA - Unknown opcode
	STY $8D02				; $BBCB: 8C 02 8D
loc_BBCE:
	JSR $B7FB				; $BBCE: 20 FB B7 ; -> sub_B7FB
	BRK					  ; $BBD1: 00	  
	.byte $62			  ; $BBD2 - Unknown opcode
	.byte $33			  ; $BBD3 - Unknown opcode
	STA $DA				  ; $BBD4: 85 DA   
	BRK					  ; $BBD6: 00	  
	SEC					  ; $BBD7: 38	  
	.byte $2B			  ; $BBD8 - Unknown opcode
loc_BBD9:
	LDA #$69				 ; $BBD9: A9 69   
	JSR $B7B5				; $BBDB: 20 B5 B7 ; -> sub_B7B5
	LDA #$44				 ; $BBDE: A9 44   
	JSR $B7B5				; $BBE0: 20 B5 B7 ; -> sub_B7B5
	CMP #$00				 ; $BBE3: C9 00	; Compare with 0
	BEQ $BBF1				; $BBE5: F0 0A   
	CMP #$01				 ; $BBE7: C9 01	; Compare with 1
	BEQ $BBEE				; $BBE9: F0 03   
	JMP $BEC8				; $BBEB: 4C C8 BE
loc_BBEE:
	JMP $BD06				; $BBEE: 4C 06 BD
loc_BBF1:
	BRK					  ; $BBF1: 00	  
	AND $A92B,Y			  ; $BBF2: 39 2B A9
	EOR $20				  ; $BBF5: 45 20   
	LDA $B7,X				; $BBF7: B5 B7   
	CMP #$00				 ; $BBF9: C9 00	; Compare with 0
	BEQ $BC07				; $BBFB: F0 0A   
	CMP #$01				 ; $BBFD: C9 01	; Compare with 1
	BEQ $BC04				; $BBFF: F0 03   
	JMP $BEC2				; $BC01: 4C C2 BE
loc_BC04:
	JMP $BC7D				; $BC04: 4C 7D BC
loc_BC07:
	JSR $B4E3				; $BC07: 20 E3 B4 ; -> sub_B4E3
	LDA tmp0				 ; $BC0A: A5 00   
	CMP #$E7				 ; $BC0C: C9 E7	; Compare with 231
	LDA tmp1				 ; $BC0E: A5 01   
	SBC #$03				 ; $BC10: E9 03	; Arithmetic
	BMI $BC1A				; $BC12: 30 06   
loc_BC14:
	BRK					  ; $BC14: 00	  
	.byte $92			  ; $BC15 - Unknown opcode
	.byte $2B			  ; $BC16 - Unknown opcode
	JMP $BEBC				; $BC17: 4C BC BE
loc_BC1A:
	BRK					  ; $BC1A: 00	  
	.byte $3A			  ; $BC1B - Unknown opcode
	.byte $2B			  ; $BC1C - Unknown opcode
	LDA #$46				 ; $BC1D: A9 46   
	JSR $B7B5				; $BC1F: 20 B5 B7 ; -> sub_B7B5
	TAX					  ; $BC22: AA	  
	BEQ $BC29				; $BC23: F0 04   
	CMP #$FF				 ; $BC25: C9 FF	; Compare with 255
	BNE $BC2C				; $BC27: D0 03   
loc_BC29:
	JMP $BEB7				; $BC29: 4C B7 BE
loc_BC2C:
	STA tmp0				 ; $BC2C: 85 00   
	STA $DC				  ; $BC2E: 85 DC   
	LDA #$00				 ; $BC30: A9 00   
	STA tmp1				 ; $BC32: 85 01   
	JSR $BECC				; $BC34: 20 CC BE ; -> sub_BECC
	LDA tmp1				 ; $BC37: A5 01   
	STA $70				  ; $BC39: 85 70   
	LDA tmp2				 ; $BC3B: A5 02   
	STA $71				  ; $BC3D: 85 71   
	LDA tmp0				 ; $BC3F: A5 00   
	BRK					  ; $BC41: 00	  
	JMP $B073				; $BC42: 4C 73 B0
	ASL tmp0				 ; $BC45: 06 00   
	.byte $3B			  ; $BC47 - Unknown opcode
	.byte $2B			  ; $BC48 - Unknown opcode
	JMP $BEBF				; $BC49: 4C BF BE
	JSR $B4E3				; $BC4C: 20 E3 B4 ; -> sub_B4E3
	LDA tmp0				 ; $BC4F: A5 00   
	CLC					  ; $BC51: 18	  
	ADC $DC				  ; $BC52: 65 DC	; Arithmetic
	STA tmp2				 ; $BC54: 85 02   
	LDA tmp1				 ; $BC56: A5 01   
	ADC #$00				 ; $BC58: 69 00	; Arithmetic
	STA tmp3				 ; $BC5A: 85 03   
	LDA tmp2				 ; $BC5C: A5 02   
	CMP #$E8				 ; $BC5E: C9 E8	; Compare with 232
	LDA tmp3				 ; $BC60: A5 03   
	SBC #$03				 ; $BC62: E9 03	; Arithmetic
	BCC $BC6C				; $BC64: 90 06   
	BRK					  ; $BC66: 00	  
	.byte $4B			  ; $BC67 - Unknown opcode
	.byte $33			  ; $BC68 - Unknown opcode
	JMP $BC14				; $BC69: 4C 14 BC
loc_BC6C:
	LDA $DC				  ; $BC6C: A5 DC   
	STA tmp0				 ; $BC6E: 85 00   
	LDA #$00				 ; $BC70: A9 00   
	STA tmp1				 ; $BC72: 85 01   
	JSR $B4B9				; $BC74: 20 B9 B4 ; -> sub_B4B9
	BRK					  ; $BC77: 00	  
	.byte $3C			  ; $BC78 - Unknown opcode
	.byte $2B			  ; $BC79 - Unknown opcode
	JMP $BEBC				; $BC7A: 4C BC BE
loc_BC7D:
	JSR $B38A				; $BC7D: 20 8A B3 ; -> sub_B38A
	CMP #$80				 ; $BC80: C9 80	; Compare with 128
	BCC $BC8A				; $BC82: 90 06   
	BRK					  ; $BC84: 00	  
	BCC $BCB2				; $BC85: 90 2B   
	JMP $BEBC				; $BC87: 4C BC BE
loc_BC8A:
	LDA $DA				  ; $BC8A: A5 DA   
	CMP #$01				 ; $BC8C: C9 01	; Compare with 1
	BEQ $BC9F				; $BC8E: F0 0F   
	BRK					  ; $BC90: 00	  
	AND $A92B,X			  ; $BC91: 3D 2B A9
	EOR #$20				 ; $BC94: 49 20   
	LDA $B7,X				; $BC96: B5 B7   
	CMP #$FF				 ; $BC98: C9 FF	; Compare with 255
	BNE $BCA1				; $BC9A: D0 05   
	JMP $BEB7				; $BC9C: 4C B7 BE
loc_BC9F:
	LDA #$00				 ; $BC9F: A9 00   
loc_BCA1:
	STA $DB				  ; $BCA1: 85 DB   
	TAX					  ; $BCA3: AA	  
	STX $F9				  ; $BCA4: 86 F9   
	BRK					  ; $BCA6: 00	  
	.byte $2B			  ; $BCA7 - Unknown opcode
	.byte $53			  ; $BCA8 - Unknown opcode
	CMP #$08				 ; $BCA9: C9 08	; Compare with 8
	BCC $BCB3				; $BCAB: 90 06   
	BRK					  ; $BCAD: 00	  
	.byte $0C			  ; $BCAE - Unknown opcode
	.byte $2B			  ; $BCAF - Unknown opcode
	JMP $BEBF				; $BCB0: 4C BF BE
loc_BCB3:
	BRK					  ; $BCB3: 00	  
	AND $AA53				; $BCB4: 2D 53 AA
	BNE $BCBF				; $BCB7: D0 06   
	BRK					  ; $BCB9: 00	  
	ROL $4C2B,X			  ; $BCBA: 3E 2B 4C
	.byte $BF			  ; $BCBD - Unknown opcode
	LDX $3F00,Y			  ; $BCBE: BE 00 3F
	.byte $2B			  ; $BCC1 - Unknown opcode
	JSR $BA20				; $BCC2: 20 20 BA ; -> sub_BA20
	BCC $BCCA				; $BCC5: 90 03   
	JMP $BEB7				; $BCC7: 4C B7 BE
loc_BCCA:
	BRK					  ; $BCCA: 00	  
	RTI					  ; $BCCB: 40	  
	.byte $2B			  ; $BCCC - Unknown opcode
	JSR $9AC9				; $BCCD: 20 C9 9A ; -> sub_9AC9
	BEQ $BCD5				; $BCD0: F0 03   
	JMP $BEB7				; $BCD2: 4C B7 BE
loc_BCD5:
	JSR $BA10				; $BCD5: 20 10 BA ; -> sub_BA10
	BCC $BCDF				; $BCD8: 90 05   
	BRK					  ; $BCDA: 00	  
	EOR ($2B,X)			  ; $BCDB: 41 2B   
	BCS $BCEE				; $BCDD: B0 0F   
loc_BCDF:
	BRK					  ; $BCDF: 00	  
	.byte $42			  ; $BCE0 - Unknown opcode
	.byte $2B			  ; $BCE1 - Unknown opcode
	LDA $DC				  ; $BCE2: A5 DC   
	JSR $B3A1				; $BCE4: 20 A1 B3 ; -> sub_B3A1
	LDX $DB				  ; $BCE7: A6 DB   
	LDA $DF				  ; $BCE9: A5 DF   
	BRK					  ; $BCEB: 00	  
	BMI $BD61				; $BCEC: 30 73   
loc_BCEE:
	JSR $B38A				; $BCEE: 20 8A B3 ; -> sub_B38A
	CMP #$80				 ; $BCF1: C9 80	; Compare with 128
	BCS $BD00				; $BCF3: B0 0B   
	BRK					  ; $BCF5: 00	  
	.byte $83			  ; $BCF6 - Unknown opcode
	.byte $2B			  ; $BCF7 - Unknown opcode
	BRK					  ; $BCF8: 00	  
	.byte $43			  ; $BCF9 - Unknown opcode
	.byte $2B			  ; $BCFA - Unknown opcode
	JSR $9AC9				; $BCFB: 20 C9 9A ; -> sub_9AC9
	BEQ $BD03				; $BCFE: F0 03   
loc_BD00:
	JMP $BEC2				; $BD00: 4C C2 BE
loc_BD03:
	JMP $BC8A				; $BD03: 4C 8A BC
loc_BD06:
	BRK					  ; $BD06: 00	  
	.byte $44			  ; $BD07 - Unknown opcode
	.byte $2B			  ; $BD08 - Unknown opcode
	LDA #$45				 ; $BD09: A9 45   
	JSR $B7B5				; $BD0B: 20 B5 B7 ; -> sub_B7B5
	CMP #$00				 ; $BD0E: C9 00	; Compare with 0
	BEQ $BD1C				; $BD10: F0 0A   
	CMP #$01				 ; $BD12: C9 01	; Compare with 1
	BEQ $BD19				; $BD14: F0 03   
	JMP $BEC2				; $BD16: 4C C2 BE
loc_BD19:
	JMP $BDAA				; $BD19: 4C AA BD
loc_BD1C:
	JSR $B4E3				; $BD1C: 20 E3 B4 ; -> sub_B4E3
	LDA tmp0				 ; $BD1F: A5 00   
	ORA tmp1				 ; $BD21: 05 01   
	BNE $BD2B				; $BD23: D0 06   
	BRK					  ; $BD25: 00	  
	EOR $2B				  ; $BD26: 45 2B   
	JMP $BEBC				; $BD28: 4C BC BE
loc_BD2B:
	JSR $BECC				; $BD2B: 20 CC BE ; -> sub_BECC
	BRK					  ; $BD2E: 00	  
	LSR $2B				  ; $BD2F: 46 2B   
loc_BD31:
	LDA #$46				 ; $BD31: A9 46   
	JSR $B7B5				; $BD33: 20 B5 B7 ; -> sub_B7B5
	TAX					  ; $BD36: AA	  
	BEQ $BD3D				; $BD37: F0 04   
	CMP #$FF				 ; $BD39: C9 FF	; Compare with 255
	BNE $BD40				; $BD3B: D0 03   
loc_BD3D:
	JMP $BEB7				; $BD3D: 4C B7 BE
loc_BD40:
	STA $E2				  ; $BD40: 85 E2   
	STA tmp0				 ; $BD42: 85 00   
	LDA #$00				 ; $BD44: A9 00   
	STA tmp1				 ; $BD46: 85 01   
	JSR $BECC				; $BD48: 20 CC BE ; -> sub_BECC
	BRK					  ; $BD4B: 00	  
	STA ($2B),Y			  ; $BD4C: 91 2B   
	LDA $E2				  ; $BD4E: A5 E2   
	STA tmp0				 ; $BD50: 85 00   
	LDA #$00				 ; $BD52: A9 00   
	STA tmp1				 ; $BD54: 85 01   
	JSR $B4CB				; $BD56: 20 CB B4 ; -> sub_B4CB
	BCS $BD63				; $BD59: B0 08   
	BRK					  ; $BD5B: 00	  
	.byte $83			  ; $BD5C - Unknown opcode
	.byte $2B			  ; $BD5D - Unknown opcode
	BRK					  ; $BD5E: 00	  
	.byte $47			  ; $BD5F - Unknown opcode
	.byte $2B			  ; $BD60 - Unknown opcode
loc_BD61:
	BCS $BD31				; $BD61: B0 CE   
loc_BD63:
	LDA $E2				  ; $BD63: A5 E2   
	STA tmp0				 ; $BD65: 85 00   
	LDA #$00				 ; $BD67: A9 00   
	STA tmp1				 ; $BD69: 85 01   
	JSR $B4EE				; $BD6B: 20 EE B4 ; -> sub_B4EE
	LDA tmp1				 ; $BD6E: A5 01   
	STA $70				  ; $BD70: 85 70   
	LDA tmp2				 ; $BD72: A5 02   
	STA $71				  ; $BD74: 85 71   
	LDA tmp0				 ; $BD76: A5 00   
	BRK					  ; $BD78: 00	  
	.byte $4B			  ; $BD79 - Unknown opcode
	.byte $73			  ; $BD7A - Unknown opcode
	CMP tmp0				 ; $BD7B: C5 00   
	LDA $73				  ; $BD7D: A5 73   
	SBC tmp1				 ; $BD7F: E5 01	; Arithmetic
	LDA $74				  ; $BD81: A5 74   
	SBC tmp2				 ; $BD83: E5 02	; Arithmetic
	BCC $BD8D				; $BD85: 90 06   
	BRK					  ; $BD87: 00	  
	PHA					  ; $BD88: 48	  
	.byte $2B			  ; $BD89 - Unknown opcode
loc_BD8A:
	JMP $BEBC				; $BD8A: 4C BC BE
loc_BD8D:
	LDA $73				  ; $BD8D: A5 73   
	STA $70				  ; $BD8F: 85 70   
	LDA $74				  ; $BD91: A5 74   
	STA $71				  ; $BD93: 85 71   
	LDA $72				  ; $BD95: A5 72   
	BRK					  ; $BD97: 00	  
	JMP $A573				; $BD98: 4C 73 A5
	.byte $E2			  ; $BD9B - Unknown opcode
	STA tmp0				 ; $BD9C: 85 00   
	LDA #$00				 ; $BD9E: A9 00   
	STA tmp1				 ; $BDA0: 85 01   
	JSR $B4B9				; $BDA2: 20 B9 B4 ; -> sub_B4B9
	BRK					  ; $BDA5: 00	  
	.byte $2B			  ; $BDA6 - Unknown opcode
	.byte $4B			  ; $BDA7 - Unknown opcode
	BCS $BD8A				; $BDA8: B0 E0   
loc_BDAA:
	JSR $B38A				; $BDAA: 20 8A B3 ; -> sub_B38A
	CMP #$00				 ; $BDAD: C9 00	; Compare with 0
	BNE $BDB7				; $BDAF: D0 06   
	BRK					  ; $BDB1: 00	  
	EOR #$2B				 ; $BDB2: 49 2B   
	JMP $BEBC				; $BDB4: 4C BC BE
loc_BDB7:
	BRK					  ; $BDB7: 00	  
	LSR					  ; $BDB8: 4A	  
	.byte $2B			  ; $BDB9 - Unknown opcode
	LDA #$47				 ; $BDBA: A9 47   
	JSR $B7B5				; $BDBC: 20 B5 B7 ; -> sub_B7B5
	CMP #$FF				 ; $BDBF: C9 FF	; Compare with 255
	BNE $BDC6				; $BDC1: D0 03   
	JMP $BEB7				; $BDC3: 4C B7 BE
loc_BDC6:
	TAX					  ; $BDC6: AA	  
	STA $DD				  ; $BDC7: 85 DD   
	LDA $61DB,X			  ; $BDC9: BD DB 61
	STA $DC				  ; $BDCC: 85 DC   
	STA $F9				  ; $BDCE: 85 F9   
	BRK					  ; $BDD0: 00	  
	.byte $4B			  ; $BDD1 - Unknown opcode
	.byte $2B			  ; $BDD2 - Unknown opcode
	JSR $9AC9				; $BDD3: 20 C9 9A ; -> sub_9AC9
	BEQ $BDDB				; $BDD6: F0 03   
	JMP $BEB7				; $BDD8: 4C B7 BE
loc_BDDB:
	BRK					  ; $BDDB: 00	  
	LSR					  ; $BDDC: 4A	  
	.byte $33			  ; $BDDD - Unknown opcode
	CMP #$0A				 ; $BDDE: C9 0A	; Compare with 10
	LDA $73				  ; $BDE0: A5 73   
	SBC #$00				 ; $BDE2: E9 00	; Arithmetic
	LDA $74				  ; $BDE4: A5 74   
	SBC #$00				 ; $BDE6: E9 00	; Arithmetic
	BCS $BE0A				; $BDE8: B0 20   
	BRK					  ; $BDEA: 00	  
	JMP $202B				; $BDEB: 4C 2B 20
	.byte $E3			  ; $BDEE - Unknown opcode
	LDY $A5,X				; $BDEF: B4 A5   
	BRK					  ; $BDF1: 00	  
	ORA tmp1				 ; $BDF2: 05 01   
	BNE $BDF9				; $BDF4: D0 03   
	JMP $BEBC				; $BDF6: 4C BC BE
loc_BDF9:
	BRK					  ; $BDF9: 00	  
	.byte $83			  ; $BDFA - Unknown opcode
	.byte $2B			  ; $BDFB - Unknown opcode
	BRK					  ; $BDFC: 00	  
	EOR $202B				; $BDFD: 4D 2B 20
	CMP #$9A				 ; $BE00: C9 9A	; Compare with 154
	BEQ $BE07				; $BE02: F0 03   
	JMP $BEBC				; $BE04: 4C BC BE
loc_BE07:
	JMP $BD1C				; $BE07: 4C 1C BD
loc_BE0A:
	LDA $DA				  ; $BE0A: A5 DA   
	CMP #$01				 ; $BE0C: C9 01	; Compare with 1
	BEQ $BE21				; $BE0E: F0 11   
	BRK					  ; $BE10: 00	  
	LSR $A62B				; $BE11: 4E 2B A6
	.byte $DC			  ; $BE14 - Unknown opcode
	LDA #$40				 ; $BE15: A9 40   
	JSR $B7B5				; $BE17: 20 B5 B7 ; -> sub_B7B5
	CMP #$FF				 ; $BE1A: C9 FF	; Compare with 255
	BNE $BE23				; $BE1C: D0 05   
	JMP $BEB7				; $BE1E: 4C B7 BE
loc_BE21:
	LDA #$00				 ; $BE21: A9 00   
loc_BE23:
	STA $DB				  ; $BE23: 85 DB   
	STA $F9				  ; $BE25: 85 F9   
	TAX					  ; $BE27: AA	  
	BRK					  ; $BE28: 00	  
	.byte $2B			  ; $BE29 - Unknown opcode
	.byte $73			  ; $BE2A - Unknown opcode
	CMP #$08				 ; $BE2B: C9 08	; Compare with 8
	BCC $BE37				; $BE2D: 90 08   
	BRK					  ; $BE2F: 00	  
	BIT $4B				  ; $BE30: 24 4B   
	BRK					  ; $BE32: 00	  
	.byte $83			  ; $BE33 - Unknown opcode
	.byte $2B			  ; $BE34 - Unknown opcode
	BCS $BE4D				; $BE35: B0 16   
loc_BE37:
	BRK					  ; $BE37: 00	  
	AND $C933				; $BE38: 2D 33 C9
	PHP					  ; $BE3B: 08	  
	BCC $BE58				; $BE3C: 90 1A   
	BRK					  ; $BE3E: 00	  
	.byte $4F			  ; $BE3F - Unknown opcode
	.byte $2B			  ; $BE40 - Unknown opcode
	LDA $DA				  ; $BE41: A5 DA   
	CMP #$01				 ; $BE43: C9 01	; Compare with 1
	BNE $BE4D				; $BE45: D0 06   
	BRK					  ; $BE47: 00	  
	BVC $BE75				; $BE48: 50 2B   
	JMP $BEBC				; $BE4A: 4C BC BE
loc_BE4D:
	BRK					  ; $BE4D: 00	  
	EOR ($2B),Y			  ; $BE4E: 51 2B   
	JSR $9AC9				; $BE50: 20 C9 9A ; -> sub_9AC9
	BEQ $BE13				; $BE53: F0 BE   
	JMP $BEB7				; $BE55: 4C B7 BE
loc_BE58:
	JSR $BA3E				; $BE58: 20 3E BA ; -> sub_BA3E
	BCS $BE71				; $BE5B: B0 14   
	LDA $DB				  ; $BE5D: A5 DB   
	STA $F9				  ; $BE5F: 85 F9   
	LDA $DC				  ; $BE61: A5 DC   
	AND #$7F				 ; $BE63: 29 7F   
	STA $FA				  ; $BE65: 85 FA   
	BRK					  ; $BE67: 00	  
	.byte $52			  ; $BE68 - Unknown opcode
	.byte $2B			  ; $BE69 - Unknown opcode
	JSR $9AC9				; $BE6A: 20 C9 9A ; -> sub_9AC9
	BEQ $BE71				; $BE6D: F0 02   
	BNE $BE4D				; $BE6F: D0 DC   
loc_BE71:
	LDA $DB				  ; $BE71: A5 DB   
	BRK					  ; $BE73: 00	  
	ROR					  ; $BE74: 6A	  
loc_BE75:
	.byte $33			  ; $BE75 - Unknown opcode
	LDA #$00				 ; $BE76: A9 00   
	BEQ $BE7F				; $BE78: F0 05   
	BRK					  ; $BE7A: 00	  
	.byte $53			  ; $BE7B - Unknown opcode
	.byte $2B			  ; $BE7C - Unknown opcode
	BCS $BE9B				; $BE7D: B0 1C   
loc_BE7F:
	LDA $DB				  ; $BE7F: A5 DB   
	STA $6E				  ; $BE81: 85 6E   
	BRK					  ; $BE83: 00	  
	.byte $42			  ; $BE84 - Unknown opcode
	.byte $33			  ; $BE85 - Unknown opcode
	CMP #$01				 ; $BE86: C9 01	; Compare with 1
	BNE $BE8F				; $BE88: D0 05   
	BRK					  ; $BE8A: 00	  
	.byte $54			  ; $BE8B - Unknown opcode
	.byte $2B			  ; $BE8C - Unknown opcode
	BCS $BE9B				; $BE8D: B0 0C   
loc_BE8F:
	CMP #$02				 ; $BE8F: C9 02	; Compare with 2
	BNE $BE98				; $BE91: D0 05   
	BRK					  ; $BE93: 00	  
	EOR $2B,X				; $BE94: 55 2B   
	BCS $BE9B				; $BE96: B0 03   
loc_BE98:
	BRK					  ; $BE98: 00	  
	LSR $2B,X				; $BE99: 56 2B   
loc_BE9B:
	LDX $DB				  ; $BE9B: A6 DB   
	LDA $DC				  ; $BE9D: A5 DC   
	AND #$7F				 ; $BE9F: 29 7F   
	BRK					  ; $BEA1: 00	  
	ROL $A973				; $BEA2: 2E 73 A9
	BRK					  ; $BEA5: 00	  
	STA $70				  ; $BEA6: 85 70   
	STA $71				  ; $BEA8: 85 71   
	LDA #$0A				 ; $BEAA: A9 0A   
	BRK					  ; $BEAC: 00	  
	JMP $A573				; $BEAD: 4C 73 A5
	CMP $CA20,X			  ; $BEB0: DD 20 CA
	.byte $B3			  ; $BEB3 - Unknown opcode
	JMP $BEBC				; $BEB4: 4C BC BE
loc_BEB7:
	BRK					  ; $BEB7: 00	  
	.byte $57			  ; $BEB8 - Unknown opcode
	.byte $2B			  ; $BEB9 - Unknown opcode
	BCS $BEC2				; $BEBA: B0 06   
loc_BEBC:
	JSR $A6B7				; $BEBC: 20 B7 A6 ; -> sub_A6B7
loc_BEBF:
	BRK					  ; $BEBF: 00	  
	.byte $83			  ; $BEC0 - Unknown opcode
	.byte $2B			  ; $BEC1 - Unknown opcode
loc_BEC2:
	BRK					  ; $BEC2: 00	  
	CLI					  ; $BEC3: 58	  
	.byte $2B			  ; $BEC4 - Unknown opcode
	JMP $BBD9				; $BEC5: 4C D9 BB
loc_BEC8:
	BRK					  ; $BEC8: 00	  
	EOR $602B,Y			  ; $BEC9: 59 2B 60

; ---- Subroutine at $BECC (Bank 21) ----
sub_BECC:
	JSR $B4EE				; $BECC: 20 EE B4 ; -> sub_B4EE
	JMP $A47C				; $BECF: 4C 7C A4
	LDA $0553				; $BED2: AD 53 05
	AND #$7F				 ; $BED5: 29 7F   
	STA $0553				; $BED7: 8D 53 05
	LDA map_number		   ; $BEDA: A5 63   
	PHA					  ; $BEDC: 48	  
	LDA submap_number		; $BEDD: A5 64   
	PHA					  ; $BEDF: 48	  
	LDA #$FE				 ; $BEE0: A9 FE   
	STA submap_number		; $BEE2: 85 64   
	STA map_number		   ; $BEE4: 85 63   
	JSR $A4C9				; $BEE6: 20 C9 A4 ; -> sub_A4C9
	JSR $C891				; $BEE9: 20 91 C8 ; Call to fixed bank
	CMP #$10				 ; $BEEC: C9 10	; Compare with 16
	BCS $BEF6				; $BEEE: B0 06   
	JSR $BF0E				; $BEF0: 20 0E BF ; -> sub_BF0E
	JMP $BEF9				; $BEF3: 4C F9 BE
loc_BEF6:
	JSR $B833				; $BEF6: 20 33 B8 ; -> sub_B833
loc_BEF9:
	JSR $D218				; $BEF9: 20 18 D2 ; Call to fixed bank
	PLA					  ; $BEFC: 68	  
	STA submap_number		; $BEFD: 85 64   
	PLA					  ; $BEFF: 68	  
	STA map_number		   ; $BF00: 85 63   
	BRK					  ; $BF02: 00	  
	ORA #$9F				 ; $BF03: 09 9F   
	RTS					  ; $BF05: 60	  
loc_BF06:
	LDA #$50				 ; $BF06: A9 50   
	JSR $B7B5				; $BF08: 20 B5 B7 ; -> sub_B7B5
	BRK					  ; $BF0B: 00	  
	ORA $6F				  ; $BF0C: 05 6F   

; ---- Subroutine at $BF0E (Bank 21) ----
sub_BF0E:
	JSR $9CE5				; $BF0E: 20 E5 9C ; -> sub_9CE5
	BCS $BF18				; $BF11: B0 05   
	BRK					  ; $BF13: 00	  
	AND ($2B),Y			  ; $BF14: 31 2B   
	BCS $BF1B				; $BF16: B0 03   
loc_BF18:
	BRK					  ; $BF18: 00	  
	.byte $32			  ; $BF19 - Unknown opcode
	.byte $2B			  ; $BF1A - Unknown opcode
loc_BF1B:
	JSR $BF4F				; $BF1B: 20 4F BF ; -> sub_BF4F
	BRK					  ; $BF1E: 00	  
	.byte $33			  ; $BF1F - Unknown opcode
	.byte $2B			  ; $BF20 - Unknown opcode
	JSR $A6B7				; $BF21: 20 B7 A6 ; -> sub_A6B7
	JSR $9AC9				; $BF24: 20 C9 9A ; -> sub_9AC9
	BEQ $BF2D				; $BF27: F0 04   
	BRK					  ; $BF29: 00	  
	.byte $34			  ; $BF2A - Unknown opcode
	.byte $2B			  ; $BF2B - Unknown opcode
	RTS					  ; $BF2C: 60	  
loc_BF2D:
	JSR $A84E				; $BF2D: 20 4E A8 ; -> sub_A84E
	BCS $BF36				; $BF30: B0 04   
	BRK					  ; $BF32: 00	  
	AND $2B,X				; $BF33: 35 2B   
	RTS					  ; $BF35: 60	  
loc_BF36:
	BRK					  ; $BF36: 00	  
	ROL $2B,X				; $BF37: 36 2B   
	JSR $D210				; $BF39: 20 10 D2 ; Call to fixed bank
	LDA submap_number		; $BF3C: A5 64   
	CMP #$FE				 ; $BF3E: C9 FE	; Compare with 254
	BEQ $BF48				; $BF40: F0 06   
	JSR $A694				; $BF42: 20 94 A6 ; -> sub_A694
	JMP $BF4B				; $BF45: 4C 4B BF
loc_BF48:
	JSR $A6FF				; $BF48: 20 FF A6 ; -> sub_A6FF
loc_BF4B:
	BRK					  ; $BF4B: 00	  
	.byte $37			  ; $BF4C - Unknown opcode
	.byte $2B			  ; $BF4D - Unknown opcode
loc_BF4E:
	RTS					  ; $BF4E: 60	  

; ---- Subroutine at $BF4F (Bank 21) ----
sub_BF4F:
	LDA #$00				 ; $BF4F: A9 00   
	STA $FE				  ; $BF51: 85 FE   
	STA $FF				  ; $BF53: 85 FF   
	LDA #$18				 ; $BF55: A9 18   
	LDX #$DA				 ; $BF57: A2 DA   
	BRK					  ; $BF59: 00	  
	.byte $87			  ; $BF5A - Unknown opcode
	.byte $8F			  ; $BF5B - Unknown opcode
	LDA map_number		   ; $BF5C: A5 63   
	CMP #$FE				 ; $BF5E: C9 FE	; Compare with 254
	BEQ $BF8A				; $BF60: F0 28   
	LDY #$00				 ; $BF62: A0 00   
loc_BF64:
	JSR $BFA4				; $BF64: 20 A4 BF ; -> sub_BFA4
	CMP #$FF				 ; $BF67: C9 FF	; Compare with 255
	BEQ $BF4E				; $BF69: F0 E3   
	CMP map_number		   ; $BF6B: C5 63   
	BNE $BF9E				; $BF6D: D0 2F   
	INY					  ; $BF6F: C8	  
	JSR $BFA4				; $BF70: 20 A4 BF ; -> sub_BFA4
	CMP submap_number		; $BF73: C5 64   
	BNE $BF9F				; $BF75: D0 28   
	LDA $3D				  ; $BF77: A5 3D   
	ORA #$80				 ; $BF79: 09 80   
	STA $DD				  ; $BF7B: 85 DD   
	INY					  ; $BF7D: C8	  
	LDA map_number		   ; $BF7E: A5 63   
	CMP #$10				 ; $BF80: C9 10	; Compare with 16
	BNE $BF8E				; $BF82: D0 0A   
	LDA $45				  ; $BF84: A5 45   
	CMP #$14				 ; $BF86: C9 14	; Compare with 20
	BCS $BF8E				; $BF88: B0 04   
loc_BF8A:
	LDA #$0A				 ; $BF8A: A9 0A   
	BNE $BF93				; $BF8C: D0 05   
loc_BF8E:
	LDA ($DA),Y			  ; $BF8E: B1 DA   
	JSR $BFA4				; $BF90: 20 A4 BF ; -> sub_BFA4
loc_BF93:
	STA $FD				  ; $BF93: 85 FD   
	BRK					  ; $BF95: 00	  
	.byte $62			  ; $BF96 - Unknown opcode
	.byte $23			  ; $BF97 - Unknown opcode
	ORA ($A2,X)			  ; $BF98: 01 A2   
	SBC $274C,X			  ; $BF9A: FD 4C 27 ; Arithmetic
	INY					  ; $BF9D: C8	  
loc_BF9E:
	INY					  ; $BF9E: C8	  
loc_BF9F:
	INY					  ; $BF9F: C8	  
	INY					  ; $BFA0: C8	  
	JMP $BF64				; $BFA1: 4C 64 BF

; ---- Subroutine at $BFA4 (Bank 21) ----
sub_BFA4:
	STX $E9				  ; $BFA4: 86 E9   
	LDX #$DA				 ; $BFA6: A2 DA   
	LDA #$18				 ; $BFA8: A9 18   
	JSR $C3EA				; $BFAA: 20 EA C3 ; Call to fixed bank
	LDX $E9				  ; $BFAD: A6 E9   
	ORA #$00				 ; $BFAF: 09 00   
	RTS					  ; $BFB1: 60	  
	.byte $FF			  ; $BFB2 - Unknown opcode
	.byte $FF			  ; $BFB3 - Unknown opcode
	.byte $FF			  ; $BFB4 - Unknown opcode
	.byte $FF			  ; $BFB5 - Unknown opcode
	.byte $FF			  ; $BFB6 - Unknown opcode
	.byte $FF			  ; $BFB7 - Unknown opcode
	.byte $FF			  ; $BFB8 - Unknown opcode
	.byte $FF			  ; $BFB9 - Unknown opcode
	.byte $FF			  ; $BFBA - Unknown opcode
	.byte $FF			  ; $BFBB - Unknown opcode
	.byte $FF			  ; $BFBC - Unknown opcode
	.byte $FF			  ; $BFBD - Unknown opcode
	.byte $FF			  ; $BFBE - Unknown opcode
	.byte $FF			  ; $BFBF - Unknown opcode
	.byte $FF			  ; $BFC0 - Unknown opcode
	.byte $FF			  ; $BFC1 - Unknown opcode
	.byte $FF			  ; $BFC2 - Unknown opcode
	.byte $FF			  ; $BFC3 - Unknown opcode
	.byte $FF			  ; $BFC4 - Unknown opcode
	.byte $FF			  ; $BFC5 - Unknown opcode
	.byte $FF			  ; $BFC6 - Unknown opcode
	.byte $FF			  ; $BFC7 - Unknown opcode
	.byte $FF			  ; $BFC8 - Unknown opcode
	.byte $FF			  ; $BFC9 - Unknown opcode
	.byte $FF			  ; $BFCA - Unknown opcode
	.byte $FF			  ; $BFCB - Unknown opcode
	.byte $FF			  ; $BFCC - Unknown opcode
	.byte $FF			  ; $BFCD - Unknown opcode
	.byte $FF			  ; $BFCE - Unknown opcode
	.byte $FF			  ; $BFCF - Unknown opcode
	.byte $FF			  ; $BFD0 - Unknown opcode
	.byte $FF			  ; $BFD1 - Unknown opcode
	.byte $FF			  ; $BFD2 - Unknown opcode
	.byte $FF			  ; $BFD3 - Unknown opcode
	.byte $FF			  ; $BFD4 - Unknown opcode
	.byte $FF			  ; $BFD5 - Unknown opcode
	.byte $FF			  ; $BFD6 - Unknown opcode
	.byte $FF			  ; $BFD7 - Unknown opcode
	SEI					  ; $BFD8: 78	  
	INC $BFDF				; $BFD9: EE DF BF
	JMP $FF8E				; $BFDC: 4C 8E FF
	.byte $80			  ; $BFDF - Unknown opcode
	JSR $5244				; $BFE0: 20 44 52
	EOR ($47,X)			  ; $BFE3: 41 47   
	.byte $4F			  ; $BFE5 - Unknown opcode
	LSR $5120				; $BFE6: 4E 20 51
	EOR $45,X				; $BFE9: 55 45   
	.byte $53			  ; $BFEB - Unknown opcode
	.byte $54			  ; $BFEC - Unknown opcode
	JSR $5649				; $BFED: 20 49 56
	BRK					  ; $BFF0: 00	  
	BRK					  ; $BFF1: 00	  
	BRK					  ; $BFF2: 00	  
	BRK					  ; $BFF3: 00	  
	PHA					  ; $BFF4: 48	  
	.byte $04			  ; $BFF5 - Unknown opcode
	ORA ($0E,X)			  ; $BFF6: 01 0E   
	.byte $07			  ; $BFF8 - Unknown opcode
	.byte $9E			  ; $BFF9 - Unknown opcode
	CLD					  ; $BFFA: D8	  
	.byte $BF			  ; $BFFB - Unknown opcode
	CLD					  ; $BFFC: D8	  
	.byte $BF			  ; $BFFD - Unknown opcode
	CLD					  ; $BFFE: D8	  
	.byte $BF			  ; $BFFF - Unknown opcode