; Dragon Warrior IV - Bank 29 Disassembly
; ROM Offset: $74010 - $7800f
; CPU Address: $8000-$bfff (when mapped)
; ======================================================================

	ASL $ed8b,X			 ; $8000: 1E 8B ED
	STA $802a			   ; $8003: 8D 2A 80
	.db $97			; $8006
	STX $9f,Y			   ; $8007: 96 9F
	TYA					 ; $8009: 98
	.db $f4			; $800a
	.db $bb			; $800b
	.db $af			; $800c
	LDA ($3e,X)			 ; $800d: A1 3E
	.db $b7			; $800f
	.db $04			; $8010
	LDA $a97b,Y			 ; $8011: B9 7B A9
	.db $5a			; $8014
	LDX #$e9				; $8015: A2 E9
	.db $b3			; $8017
	.db $52			; $8018
	.db $8f			; $8019
	STX $2a91			   ; $801a: 8E 91 2A
	.db $92			; $801d
	.db $23			; $801e
	STY $84,X			   ; $801f: 94 84
	STY $52,X			   ; $8021: 94 52
	TAX					 ; $8023: AA
	ADC ($bd),Y			 ; $8024: 71 BD
	ADC #$bd				; $8026: 69 BD
	ADC $a2bd			   ; $8028: 6D BD A2
	BRK					 ; $802b: 00
	STX $0573			   ; $802c: 8E 73 05
	LDX #$ff				; $802f: A2 FF
	LDY #$00				; $8031: A0 00
	STY tmp0				; $8033: 84 00
	LDA $8096,Y			 ; $8035: B9 96 80
	BPL $8041			   ; $8038: 10 07
	CMP #$ff				; $803a: C9 FF
	BEQ $8048			   ; $803c: F0 0A
	INX					 ; $803e: E8
	AND #$7f				; $803f: 29 7F
	CMP $28				 ; $8041: C5 28
	BEQ $8049			   ; $8043: F0 04
	INY					 ; $8045: C8
	BNE $8033			   ; $8046: D0 EB
	RTS					 ; $8048: 60
	ASL tmp0				; $8049: 06 00
	ASL tmp0				; $804b: 06 00
	ASL tmp0				; $804d: 06 00
	LDA $809e,X			 ; $804f: BD 9E 80
	STA $0573			   ; $8052: 8D 73 05
	LDA $80a2,X			 ; $8055: BD A2 80
	STA $058d			   ; $8058: 8D 8D 05
	TXA					 ; $805b: 8A
	ASL					 ; $805c: 0A
	ASL					 ; $805d: 0A
	ASL					 ; $805e: 0A
	TAX					 ; $805f: AA
	ASL					 ; $8060: 0A
	PHA					 ; $8061: 48
	LDY #$00				; $8062: A0 00
	TXA					 ; $8064: 8A
	PHA					 ; $8065: 48
	LDX tmp0				; $8066: A6 00
	LDA $80a6,X			 ; $8068: BD A6 80
	ASL					 ; $806b: 0A
	ASL					 ; $806c: 0A
	TAX					 ; $806d: AA
	LDA $7600,X			 ; $806e: BD 00 76
	STA $0574,Y			 ; $8071: 99 74 05
	PLA					 ; $8074: 68
	TAX					 ; $8075: AA
	INC tmp0				; $8076: E6 00
	INX					 ; $8078: E8
	INY					 ; $8079: C8
	CPY #$08				; $807a: C0 08
	BNE $8064			   ; $807c: D0 E6
	LDY #$00				; $807e: A0 00
	PLA					 ; $8080: 68
	TAX					 ; $8081: AA
	LDA $80de,X			 ; $8082: BD DE 80
	STA $0584,Y			 ; $8085: 99 84 05
	INX					 ; $8088: E8
	LDA $80de,X			 ; $8089: BD DE 80
	STA $057c,Y			 ; $808c: 99 7C 05
	INX					 ; $808f: E8
	INY					 ; $8090: C8
	CPY #$08				; $8091: C0 08
	BNE $8082			   ; $8093: D0 ED
	RTS					 ; $8095: 60
	LDA $8eac			   ; $8096: AD AC 8E
	STA ($06,X)			 ; $8099: 81 06
	PHP					 ; $809b: 08
	BPL $809d			   ; $809c: 10 FF
	.db $ff			; $809e
	.db $1b			; $809f
	PHP					 ; $80a0: 08
	TAX					 ; $80a1: AA
	BPL $80b4			   ; $80a2: 10 10
	BVS $80b6			   ; $80a4: 70 10
	ASL $100f			   ; $80a6: 0E 0F 10
	ORA ($12),Y			 ; $80a9: 11 12
	.db $13			; $80ab
	.db $14			; $80ac
	.db $1f			; $80ad
	BRK					 ; $80ae: 00
	BRK					 ; $80af: 00
	BRK					 ; $80b0: 00
	ORA $000e			   ; $80b1: 0D 0E 00
	ORA $001b,Y			 ; $80b4: 19 1B 00
	BRK					 ; $80b7: 00
	BRK					 ; $80b8: 00
	BRK					 ; $80b9: 00
	.db $14			; $80ba
	BRK					 ; $80bb: 00
	BRK					 ; $80bc: 00
	BRK					 ; $80bd: 00
	.db $0b			; $80be
	BRK					 ; $80bf: 00
	.db $0b			; $80c0
	BRK					 ; $80c1: 00
	.db $0b			; $80c2
	BRK					 ; $80c3: 00
	.db $0b			; $80c4
	BRK					 ; $80c5: 00
	BPL $80c8			   ; $80c6: 10 00
	BPL $80ca			   ; $80c8: 10 00
	BPL $80cc			   ; $80ca: 10 00
	BPL $80ce			   ; $80cc: 10 00
	.db $14			; $80ce
	BRK					 ; $80cf: 00
	.db $14			; $80d0
	BRK					 ; $80d1: 00
	.db $14			; $80d2
	BRK					 ; $80d3: 00
	.db $14			; $80d4
	BRK					 ; $80d5: 00
	.db $1c			; $80d6
	BRK					 ; $80d7: 00
	.db $1c			; $80d8
	BRK					 ; $80d9: 00
	.db $1c			; $80da
	BRK					 ; $80db: 00
	.db $1c			; $80dc
	BRK					 ; $80dd: 00
	ASL $9e81,X			 ; $80de: 1E 81 9E
	STA ($1e,X)			 ; $80e1: 81 1E
	.db $82			; $80e3
	.db $9e			; $80e4
	.db $82			; $80e5
	ASL $9e83,X			 ; $80e6: 1E 83 9E
	.db $83			; $80e9
	ASL $9e84,X			 ; $80ea: 1E 84 9E
	STY tmp0				; $80ed: 84 00
	BRK					 ; $80ef: 00
	BRK					 ; $80f0: 00
	BRK					 ; $80f1: 00
	BRK					 ; $80f2: 00
	BRK					 ; $80f3: 00
	ASL $9e85,X			 ; $80f4: 1E 85 9E
	STA tmp0				; $80f7: 85 00
	BRK					 ; $80f9: 00
	ASL $9e86,X			 ; $80fa: 1E 86 9E
	STX tmp0				; $80fd: 86 00
	BRK					 ; $80ff: 00
	BRK					 ; $8100: 00
	BRK					 ; $8101: 00
	BRK					 ; $8102: 00
	BRK					 ; $8103: 00
	BRK					 ; $8104: 00
	BRK					 ; $8105: 00
	ASL $0087,X			 ; $8106: 1E 87 00
	BRK					 ; $8109: 00
	BRK					 ; $810a: 00
	BRK					 ; $810b: 00
	BRK					 ; $810c: 00
	BRK					 ; $810d: 00
	ASL $0089,X			 ; $810e: 1E 89 00
	BRK					 ; $8111: 00
	.db $9e			; $8112
	.db $89			; $8113
	BRK					 ; $8114: 00
	BRK					 ; $8115: 00
	ASL $008a,X			 ; $8116: 1E 8A 00
	BRK					 ; $8119: 00
	.db $9e			; $811a
	TXA					 ; $811b: 8A
	BRK					 ; $811c: 00
	BRK					 ; $811d: 00
	DEC $fefe,X			 ; $811e: DE FE FE
	DEC $f2ee,X			 ; $8121: DE EE F2
	BCS $8116			   ; $8124: B0 F0
	CMP $f1f1,Y			 ; $8126: D9 F1 F1
	CMP ($f1,X)			 ; $8129: C1 F1
	SBC $c8b7,X			 ; $812b: FD B7 C8
	.db $7f			; $812e
	ROR $7f7b,X			 ; $812f: 7E 7B 7F
	.db $77			; $8132
	EOR $0f0f			   ; $8133: 4D 0F 0F
	.db $9f			; $8136
	STX $878b			   ; $8137: 8E 8B 87
	.db $8f			; $813a
	LDA $13ef,X			 ; $813b: BD EF 13
	SED					 ; $813e: F8
	.db $f7			; $813f
	.db $b7			; $8140
	.db $8f			; $8141
	.db $ef			; $8142
	.db $df			; $8143
	.db $80			; $8144
	.db $ff			; $8145
	.db $87			; $8146
	DEY					 ; $8147: 88
	INY					 ; $8148: C8
	BEQ $813b			   ; $8149: F0 F0
	CPX #$bf				; $814b: E0 BF
	.db $ff			; $814d
	.db $1f			; $814e
	INC $f1ed			   ; $814f: EE ED F1
	SBC $0b,X			   ; $8152: F5 0B
	.db $f3			; $8154
	.db $0f			; $8155
	SBC (ptr_lo,X)		  ; $8156: E1 10
	.db $13			; $8158
	.db $0f			; $8159
	ORA $0ff7			   ; $815a: 0D F7 0F
	.db $ff			; $815d
	DEC $fefe,X			 ; $815e: DE FE FE
	DEC $f2ee,X			 ; $8161: DE EE F2
	BCC $8116			   ; $8164: 90 B0
	CMP $f1f1,Y			 ; $8166: D9 F1 F1
	CMP ($f1,X)			 ; $8169: C1 F1
	SBC $c8f7,X			 ; $816b: FD F7 C8
	.db $7f			; $816e
	ROR $7f7b,X			 ; $816f: 7E 7B 7F
	.db $77			; $8172
	EOR $0d09			   ; $8173: 4D 09 0D
	.db $9f			; $8176
	STX $878b			   ; $8177: 8E 8B 87
	.db $8f			; $817a
	LDA $13ef,X			 ; $817b: BD EF 13
	SED					 ; $817e: F8
	.db $f7			; $817f
	.db $f7			; $8180
	.db $ef			; $8181
	.db $ef			; $8182
	BNE $8114			   ; $8183: D0 8F
	BEQ $810e			   ; $8185: F0 87
	INY					 ; $8187: C8
	INX					 ; $8188: E8
	BEQ $817b			   ; $8189: F0 F0
	.db $ef			; $818b
	BCS $818d			   ; $818c: B0 FF
	.db $1f			; $818e
	INC $f7ef			   ; $818f: EE EF F7
	SBC $fb,X			   ; $8192: F5 FB
	.db $03			; $8194
	.db $f7			; $8195
	SBC ($12,X)			 ; $8196: E1 12
	.db $17			; $8198
	.db $0f			; $8199
	ORA $ff07			   ; $819a: 0D 07 FF
	.db $f7			; $819d
	CLD					 ; $819e: D8
	.db $f7			; $819f
	.db $ef			; $81a0
	.db $c7			; $81a1
	SBC #$ee				; $81a2: E9 EE
	LDX $f0,Y			   ; $81a4: B6 F0
	.db $df			; $81a6
	SED					 ; $81a7: F8
	BEQ $8182			   ; $81a8: F0 D8
	INC $f1,X			   ; $81aa: F6 F1
	LDA $1fc7,Y			 ; $81ac: B9 C7 1F
	INC $e7f3			   ; $81af: EE F3 E7
	.db $97			; $81b2
	.db $77			; $81b3
	ADC $ff0f			   ; $81b4: 6D 0F FF
	ASL $1f0b,X			 ; $81b7: 1E 0B 1F
	.db $6f			; $81ba
	.db $8f			; $81bb
	STA $d8e3,X			 ; $81bc: 9D E3 D8
	.db $8f			; $81bf
	.db $9f			; $81c0
	BCC $81be			   ; $81c1: 90 FB
	SBC $b0,X			   ; $81c3: F5 B0
	.db $ff			; $81c5
	CPX #$f0				; $81c6: E0 F0
	CPX #$ff				; $81c8: E0 FF
	CPX #$e0				; $81ca: E0 E0
	LDX $1bff,Y			 ; $81cc: BE FF 1B
	BEQ $81ca			   ; $81cf: F0 F9
	ORA #$df				; $81d1: 09 DF
	.db $af			; $81d3
	ADC $070f,X			 ; $81d4: 7D 0F 07
	ASL $ff07			   ; $81d7: 0E 07 FF
	.db $07			; $81da
	.db $07			; $81db
	ORA $d8ff			   ; $81dc: 0D FF D8
	.db $f7			; $81df
	.db $ef			; $81e0
	.db $c7			; $81e1
	SBC #$ee				; $81e2: E9 EE
	STX $b0				 ; $81e4: 86 B0
	.db $df			; $81e6
	SED					 ; $81e7: F8
	BEQ $81c2			   ; $81e8: F0 D8
	INC $f1,X			   ; $81ea: F6 F1
	SBC #$c7				; $81ec: E9 C7
	.db $1f			; $81ee
	INC $e7f3			   ; $81ef: EE F3 E7
	.db $97			; $81f2
	.db $77			; $81f3
	ADC ($0d,X)			 ; $81f4: 61 0D
	.db $ff			; $81f6
	ASL $1f0b,X			 ; $81f7: 1E 0B 1F
	.db $6f			; $81fa
	.db $8f			; $81fb
	.db $97			; $81fc
	.db $e3			; $81fd
	TYA					 ; $81fe: 98
	.db $cf			; $81ff
	.db $ff			; $8200
	BEQ $81fe			   ; $8201: F0 FB
	SBC $be,X			   ; $8203: F5 BE
	BEQ $81e7			   ; $8205: F0 E0
	BEQ $81e9			   ; $8207: F0 E0
	.db $ff			; $8209
	CPX #$e0				; $820a: E0 E0
	BCS $820d			   ; $820c: B0 FF
	ORA $fff2,Y			 ; $820e: 19 F2 FF
	.db $0b			; $8211
	.db $df			; $8212
	.db $af			; $8213
	ORA $07ff			   ; $8214: 0D FF 07
	ASL $fb07			   ; $8217: 0E 07 FB
	.db $07			; $821a
	.db $07			; $821b
	ADC $d8ff,X			 ; $821c: 7D FF D8
	BEQ $8211			   ; $821f: F0 F0
	BNE $8203			   ; $8221: D0 E0
	CPX #$f0				; $8223: E0 F0
	BEQ $81ff			   ; $8225: F0 D8
	BEQ $821c			   ; $8227: F0 F3
	.db $dc			; $8229
	.db $e2			; $822a
	SBC $ed				 ; $822b: E5 ED
	.db $c7			; $822d
	.db $1f			; $822e
	ASL $0f0b			   ; $822f: 0E 0B 0F
	.db $07			; $8232
	ORA $0f				 ; $8233: 05 0F
	.db $0f			; $8235
	.db $1f			; $8236
	ASL $3fcb			   ; $8237: 0E CB 3F
	.db $47			; $823a
	LDA $b7				 ; $823b: A5 B7
	.db $e3			; $823d
	SED					 ; $823e: F8
	TXS					 ; $823f: 9A
	.db $9b			; $8240
	BEQ $8242			   ; $8241: F0 FF
	.db $ff			; $8243
	.db $bf			; $8244
	BEQ $81c8			   ; $8245: F0 81
	CPX $e4				 ; $8247: E4 E4
	.db $ff			; $8249
	CPX #$e0				; $824a: E0 E0
	BCS $824d			   ; $824c: B0 FF
	.db $1f			; $824e
	EOR $0fd9,Y			 ; $824f: 59 D9 0F
	.db $ff			; $8252
	SBC $f78f,X			 ; $8253: FD 8F F7
	STA ($27,X)			 ; $8256: 81 27
	.db $27			; $8258
	.db $ff			; $8259
	.db $07			; $825a
	ORA $ff				 ; $825b: 05 FF
	.db $f7			; $825d
	CLD					 ; $825e: D8
	BEQ $8251			   ; $825f: F0 F0
	BNE $81e3			   ; $8261: D0 80
	.db $80			; $8263
	BEQ $8256			   ; $8264: F0 F0
	CLD					 ; $8266: D8
	BEQ $825c			   ; $8267: F0 F3
	.db $dc			; $8269
	.db $e2			; $826a
	SBC $8d				 ; $826b: E5 8D
	.db $87			; $826d
	.db $1f			; $826e
	ASL $0f0b			   ; $826f: 0E 0B 0F
	ORA (tmp1,X)			; $8272: 01 01
	.db $0f			; $8274
	.db $0f			; $8275
	.db $1f			; $8276
	ASL $3fcb			   ; $8277: 0E CB 3F
	.db $47			; $827a
	.db $a7			; $827b
	LDA ($e1),Y			 ; $827c: B1 E1
	SED					 ; $827e: F8
	.db $fa			; $827f
	.db $fb			; $8280
	BEQ $8282			   ; $8281: F0 FF
	.db $ff			; $8283
	LDA ($ff),Y			 ; $8284: B1 FF
	STA ($c4,X)			 ; $8286: 81 C4
	.db $f4			; $8288
	.db $ff			; $8289
	CPX #$e0				; $828a: E0 E0
	.db $bf			; $828c
	.db $ff			; $828d
	.db $1f			; $828e
	.db $5f			; $828f
	.db $df			; $8290
	.db $0f			; $8291
	.db $ff			; $8292
	SBC $0fff,X			 ; $8293: FD FF 0F
	STA ($23,X)			 ; $8296: 81 23
	.db $2f			; $8298
	.db $ff			; $8299
	.db $07			; $829a
	ORA $0f				 ; $829b: 05 0F
	.db $ff			; $829d
	DEC $f8fe,X			 ; $829e: DE FE F8
	BNE $8293			   ; $82a1: D0 F0
	BEQ $8295			   ; $82a3: F0 F0
	BEQ $8280			   ; $82a5: F0 D9
	SBC ($f7),Y			 ; $82a7: F1 F7
	CLD					 ; $82a9: D8
	.db $f3			; $82aa
	SBC $ed,X			   ; $82ab: F5 ED
	.db $c7			; $82ad
	.db $7f			; $82ae
	ROR $0f1b,X			 ; $82af: 7E 1B 0F
	.db $0f			; $82b2
	ORA $0f0f			   ; $82b3: 0D 0F 0F
	.db $9f			; $82b6
	STX $1feb			   ; $82b7: 8E EB 1F
	.db $cf			; $82ba
	LDA $e3b7			   ; $82bb: AD B7 E3
	BEQ $8256			   ; $82be: F0 96
	.db $97			; $82c0
	.db $f7			; $82c1
	.db $f7			; $82c2
	SED					 ; $82c3: F8
	.db $bf			; $82c4
	BEQ $8250			   ; $82c5: F0 89
	INX					 ; $82c7: E8
	INX					 ; $82c8: E8
	INX					 ; $82c9: E8
	INX					 ; $82ca: E8
	.db $e7			; $82cb
	BCS $82cd			   ; $82cc: B0 FF
	.db $0f			; $82ce
	ADC #$e9				; $82cf: 69 E9
	.db $ef			; $82d1
	.db $1f			; $82d2
	SBC $f78f,X			 ; $82d3: FD 8F F7
	STA ($17),Y			 ; $82d6: 91 17
	.db $17			; $82d8
	.db $17			; $82d9
	.db $e7			; $82da
	ORA $ff				 ; $82db: 05 FF
	.db $f7			; $82dd
	DEC $f8fe,X			 ; $82de: DE FE F8
	BNE $8273			   ; $82e1: D0 90
	BCC $82d5			   ; $82e3: 90 F0
	BEQ $82c0			   ; $82e5: F0 D9
	SBC ($f7),Y			 ; $82e7: F1 F7
	CLD					 ; $82e9: D8
	.db $f3			; $82ea
	SBC $8d,X			   ; $82eb: F5 8D
	.db $87			; $82ed
	.db $7f			; $82ee
	ROR $0f1b,X			 ; $82ef: 7E 1B 0F
	ORA #$09				; $82f2: 09 09
	.db $0f			; $82f4
	.db $0f			; $82f5
	.db $9f			; $82f6
	STX $1feb			   ; $82f7: 8E EB 1F
	.db $cf			; $82fa
	.db $af			; $82fb
	LDA ($e1),Y			 ; $82fc: B1 E1
	BEQ $82f6			   ; $82fe: F0 F6
	.db $f7			; $8300
	.db $f7			; $8301
	SED					 ; $8302: F8
	.db $ff			; $8303
	LDA ($ff),Y			 ; $8304: B1 FF
	.db $89			; $8306
	INY					 ; $8307: C8
	INX					 ; $8308: E8
	INX					 ; $8309: E8
	.db $e7			; $830a
	CPX #$bf				; $830b: E0 BF
	.db $ff			; $830d
	.db $0f			; $830e
	.db $6f			; $830f
	.db $ef			; $8310
	.db $ef			; $8311
	.db $ef			; $8312
	ORA $0fff,X			 ; $8313: 1D FF 0F
	STA ($13),Y			 ; $8316: 91 13
	.db $17			; $8318
	.db $17			; $8319
	.db $17			; $831a
	SBC $0f				 ; $831b: E5 0F
	.db $ff			; $831d
	CLD					 ; $831e: D8
	BEQ $8301			   ; $831f: F0 E0
	INC $f0e1,X			 ; $8321: FE E1 F0
	BCS $8317			   ; $8324: B0 F1
	CLD					 ; $8326: D8
	BEQ $8309			   ; $8327: F0 E0
	CPX #$e4				; $8329: E0 E4
	.db $fa			; $832b
	.db $bb			; $832c
	INC $0e1f,X			 ; $832d: FE 1F 0E
	.db $07			; $8330
	.db $03			; $8331
	.db $c7			; $8332
	.db $3f			; $8333
	.db $0f			; $8334
	.db $1f			; $8335
	.db $1f			; $8336
	ASL $0307			   ; $8337: 0E 07 03
	.db $07			; $833a
	.db $07			; $833b
	.db $0f			; $833c
	.db $ff			; $833d
	.db $da			; $833e
	SBC $dafb,X			 ; $833f: FD FB DA
	INC $ff,X			   ; $8342: F6 FF
	.db $bf			; $8344
	BEQ $8324			   ; $8345: F0 DD
	.db $fa			; $8347
	.db $f4			; $8348
	.db $d4			; $8349
	SED					 ; $834a: F8
	BEQ $82fd			   ; $834b: F0 B0
	.db $ef			; $834d
	.db $cf			; $834e
	INC $67				 ; $834f: E6 67
	.db $23			; $8351
	.db $13			; $8352
	.db $33			; $8353
	SBC $1ffd,Y			 ; $8354: F9 FD 1F
	ASL $c70f			   ; $8357: 0E 0F C7
	.db $c7			; $835a
	.db $07			; $835b
	.db $03			; $835c
	ORA ($d8,X)			 ; $835d: 01 D8
	BEQ $8341			   ; $835f: F0 E0
	INC $f0e1,X			 ; $8361: FE E1 F0
	BCS $8356			   ; $8364: B0 F0
	CLD					 ; $8366: D8
	BEQ $8349			   ; $8367: F0 E0
	CPX #$e4				; $8369: E0 E4
	.db $fa			; $836b
	.db $bb			; $836c
	.db $ff			; $836d
	.db $1f			; $836e
	ASL $0307			   ; $836f: 0E 07 03
	.db $c7			; $8372
	.db $3f			; $8373
	.db $0f			; $8374
	.db $1f			; $8375
	.db $1f			; $8376
	ASL $0307			   ; $8377: 0E 07 03
	.db $07			; $837a
	.db $07			; $837b
	.db $0f			; $837c
	.db $ff			; $837d
	CLD					 ; $837e: D8
	.db $ff			; $837f
	.db $fb			; $8380
	CMP $fff6,Y			 ; $8381: D9 F6 FF
	.db $bf			; $8384
	.db $ff			; $8385
	.db $df			; $8386
	SED					 ; $8387: F8
	.db $f4			; $8388
	.db $d4			; $8389
	SED					 ; $838a: F8
	BEQ $833d			   ; $838b: F0 B0
	CPX #$0f				; $838d: E0 0F
	DEC $e7				 ; $838f: C6 E7
	.db $e3			; $8391
	.db $73			; $8392
	.db $f3			; $8393
	SBC $1f0d,Y			 ; $8394: F9 0D 1F
	ASL $070f			   ; $8397: 0E 0F 07
	.db $07			; $839a
	.db $07			; $839b
	.db $03			; $839c
	SBC ($d8),Y			 ; $839d: F1 D8
	.db $f7			; $839f
	.db $ef			; $83a0
	.db $e7			; $83a1
	CPX #$f0				; $83a2: E0 F0
	BMI $83d6			   ; $83a4: 30 30
	.db $df			; $83a6
	SED					 ; $83a7: F8
	BEQ $83a2			   ; $83a8: F0 F8
	.db $e7			; $83aa
	.db $fa			; $83ab
	.db $bb			; $83ac
	INC $ee1f,X			 ; $83ad: FE 1F EE
	.db $eb			; $83b0
	.db $f7			; $83b1
	.db $f7			; $83b2
	.db $77			; $83b3
	AND $0f,X			   ; $83b4: 35 0F
	.db $ff			; $83b6
	ASL $0f1b,X			 ; $83b7: 1E 1B 0F
	.db $0f			; $83ba
	.db $8f			; $83bb
	EOR $983f			   ; $83bc: 4D 3F 98
	CPY $f0fd			   ; $83bf: CC FD F0
	.db $fc			; $83c2
	INC $f0bf,X			 ; $83c3: FE BF F0
	SBC $e0f0,X			 ; $83c6: FD F0 E0
	.db $fc			; $83c9
	SBC ($e0,X)			 ; $83ca: E1 E0
	BCS $83cd			   ; $83cc: B0 FF
	.db $0f			; $83ce
	ASL $1f1f,X			 ; $83cf: 1E 1F 1F
	.db $0f			; $83d2
	.db $3f			; $83d3
	STA $87ff			   ; $83d4: 8D FF 87
	.db $42			; $83d7
	.db $43			; $83d8
	.db $47			; $83d9
	.db $8f			; $83da
	.db $0f			; $83db
	ADC $d8ff,X			 ; $83dc: 7D FF D8
	.db $f7			; $83df
	.db $ef			; $83e0
	.db $e7			; $83e1
	CPX #$f0				; $83e2: E0 F0
	BCS $83d7			   ; $83e4: B0 F1
	.db $df			; $83e6
	SED					 ; $83e7: F8
	BEQ $83e2			   ; $83e8: F0 F8
	.db $e7			; $83ea
	.db $fa			; $83eb
	.db $bb			; $83ec
	INC $ee1f,X			 ; $83ed: FE 1F EE
	.db $eb			; $83f0
	.db $f7			; $83f1
	.db $f7			; $83f2
	.db $77			; $83f3
	AND $cf,X			   ; $83f4: 35 CF
	.db $ff			; $83f6
	ASL $0f1b,X			 ; $83f7: 1E 1B 0F
	.db $0f			; $83fa
	.db $8f			; $83fb
	EOR $7a3f			   ; $83fc: 4D 3F 7A
	.db $3c			; $83ff
	.db $9c			; $8400
	CMP ($fc,X)			 ; $8401: C1 FC
	.db $fc			; $8403
	LDA ($ff),Y			 ; $8404: B1 FF
	.db $fc			; $8406
	SBC ($e0),Y			 ; $8407: F1 E0
	.db $fc			; $8409
	CPX #$f1				; $840a: E0 F1
	LDX $7fff,Y			 ; $840c: BE FF 7F
	ASL $1f0f,X			 ; $840f: 1E 0F 1F
	.db $1f			; $8412
	.db $0f			; $8413
	SBC $0f0f,X			 ; $8414: FD 0F 0F
	STX $43				 ; $8417: 86 43
	.db $43			; $8419
	.db $47			; $841a
	.db $8f			; $841b
	ORA $d8ff			   ; $841c: 0D FF D8
	BEQ $8401			   ; $841f: F0 E0
	CPX #$f0				; $8421: E0 F0
	CPX #$b0				; $8423: E0 B0
	SED					 ; $8425: F8
	CLD					 ; $8426: D8
	BEQ $8409			   ; $8427: F0 E0
	.db $e3			; $8429
	.db $fc			; $842a
	CPX #$b0				; $842b: E0 B0
	SED					 ; $842d: F8
	.db $1f			; $842e
	ASL $0b				 ; $842f: 06 0B
	.db $07			; $8431
	.db $07			; $8432
	ORA $8f0f			   ; $8433: 0D 0F 8F
	.db $1f			; $8436
	ASL $7b				 ; $8437: 06 7B
	.db $87			; $8439
	.db $27			; $843a
	EOR $7fdf,X			 ; $843b: 5D DF 7F
	.db $df			; $843e
	INC $d4fe,X			 ; $843f: FE FE D4
	BEQ $8443			   ; $8442: F0 FF
	LDA ($fe),Y			 ; $8444: B1 FE
	CLD					 ; $8446: D8
	BEQ $8439			   ; $8447: F0 F0
	.db $d3			; $8449
	.db $fb			; $844a
	BEQ $840b			   ; $844b: F0 BE
	.db $ff			; $844d
	.db $9f			; $844e
	DEC $7ffb,X			 ; $844f: DE FB 7F
	.db $0f			; $8452
	SBC $1fff,X			 ; $8453: FD FF 1F
	.db $3f			; $8456
	ASL $0f0b,X			 ; $8457: 1E 0B 0F
	.db $7f			; $845a
	ORA $ff1f			   ; $845b: 0D 1F FF
	CLD					 ; $845e: D8
	BEQ $8441			   ; $845f: F0 E0
	CPX #$f0				; $8461: E0 F0
	CPX #$b0				; $8463: E0 B0
	SED					 ; $8465: F8
	CLD					 ; $8466: D8
	BEQ $8449			   ; $8467: F0 E0
	.db $e3			; $8469
	.db $fc			; $846a
	CPX #$b0				; $846b: E0 B0
	SED					 ; $846d: F8
	.db $1f			; $846e
	ASL $0b				 ; $846f: 06 0B
	.db $07			; $8471
	.db $07			; $8472
	ORA $8f0f			   ; $8473: 0D 0F 8F
	.db $1f			; $8476
	ASL $7b				 ; $8477: 06 7B
	.db $87			; $8479
	.db $27			; $847a
	EOR $7fdf,X			 ; $847b: 5D DF 7F
	CMP $ffff,X			 ; $847e: DD FF FF
	.db $dc			; $8481
	BEQ $8483			   ; $8482: F0 FF
	.db $bf			; $8484
	BEQ $845f			   ; $8485: F0 D8
	BEQ $8479			   ; $8487: F0 F0
	BNE $848a			   ; $8489: D0 FF
	BEQ $843d			   ; $848b: F0 B0
	.db $ff			; $848d
	.db $1f			; $848e
	ASL $ff3b,X			 ; $848f: 1E 3B FF
	.db $0f			; $8492
	SBC $ff1f,X			 ; $8493: FD 1F FF
	.db $ff			; $8496
	DEC $0f0b,X			 ; $8497: DE 0B 0F
	.db $ff			; $849a
	ORA $ffff			   ; $849b: 0D FF FF
	BNE $848e			   ; $849e: D0 EE
	DEC $c0dc,X			 ; $84a0: DE DC C0
	CPY #$c0				; $84a3: C0 C0
	CPY $f1df			   ; $84a5: CC DF F1
	SBC ($e3,X)			 ; $84a8: E1 E3
	INC $c3c1,X			 ; $84aa: FE C1 C3
	CMP ($3f,X)			 ; $84ad: C1 3F
	DEC $1fdb,X			 ; $84af: DE DB 1F
	.db $1f			; $84b2
	AND $2d3f,X			 ; $84b3: 3D 3F 2D
	.db $ff			; $84b6
	ROL $df3b,X			 ; $84b7: 3E 3B DF
	.db $1f			; $84ba
	ADC $ef7f,X			 ; $84bb: 7D 7F EF
	.db $fb			; $84be
	.db $fa			; $84bf
	BEQ $84a2			   ; $84c0: F0 E0
	.db $ff			; $84c2
	.db $ff			; $84c3
	.db $a3			; $84c4
	.db $fc			; $84c5
	CPX #$e1				; $84c6: E0 E1
	SBC $c0cd			   ; $84c8: ED CD C0
	CPX #$bc				; $84cb: E0 BC
	.db $ff			; $84cd
	.db $f3			; $84ce
	DEC $ff3b			   ; $84cf: CE 3B FF
	.db $ff			; $84d2
	.db $ff			; $84d3
	SBC $7f2f,X			 ; $84d4: FD 2F 7F
	ROL $1ffb,X			 ; $84d7: 3E FB 1F
	.db $1f			; $84da
	.db $3f			; $84db
	AND $d0ef,X			 ; $84dc: 3D EF D0
	INC $dcde			   ; $84df: EE DE DC
	CPY #$c0				; $84e2: C0 C0
	CPY #$dc				; $84e4: C0 DC
	.db $df			; $84e6
	SBC ($e1),Y			 ; $84e7: F1 E1
	.db $e3			; $84e9
	INC $c3c1,X			 ; $84ea: FE C1 C3
	CMP ($3f,X)			 ; $84ed: C1 3F
	DEC $1fdb,X			 ; $84ef: DE DB 1F
	.db $1f			; $84f2
	AND $293e,X			 ; $84f3: 3D 3E 29
	.db $ff			; $84f6
	ROL $df3b,X			 ; $84f7: 3E 3B DF
	.db $1f			; $84fa
	ADC $ef7f,X			 ; $84fb: 7D 7F EF
	.db $fa			; $84fe
	SED					 ; $84ff: F8
	INX					 ; $8500: E8
	SBC ($ff),Y			 ; $8501: F1 FF
	.db $ff			; $8503
	LDX $c0e1,Y			 ; $8504: BE E1 C0
	DEC $e6				 ; $8507: C6 E6
	CPY #$c0				; $8509: C0 C0
	CPX #$a1				; $850b: E0 A1
	.db $ff			; $850d
	.db $67			; $850e
	ASL $ff7b,X			 ; $850f: 1E 7B FF
	.db $ff			; $8512
	.db $ff			; $8513
	AND $ffef,X			 ; $8514: 3D EF FF
	INC $1fbb,X			 ; $8517: FE BB 1F
	.db $1f			; $851a
	.db $3f			; $851b
	SBC $ebef,X			 ; $851c: FD EF EB
	.db $d7			; $851f
	.db $97			; $8520
	.db $7f			; $8521
	.db $bf			; $8522
	.db $af			; $8523
	.db $ef			; $8524
	.db $e7			; $8525
	INX					 ; $8526: E8
	BNE $84b9			   ; $8527: D0 90
	PLA					 ; $8529: 68
	DEY					 ; $852a: 88
	.db $80			; $852b
	CPX #$e0				; $852c: E0 E0
	.db $fb			; $852e
	SBC $fffe,X			 ; $852f: FD FE FF
	.db $ff			; $8532
	.db $ff			; $8533
	.db $ff			; $8534
	.db $ff			; $8535
	.db $0b			; $8536
	ORA $06				 ; $8537: 05 06
	ORA ptr0_lo			 ; $8539: 05 04
	.db $02			; $853b
	.db $03			; $853c
	.db $07			; $853d
	.db $cf			; $853e
	.db $a7			; $853f
	.db $27			; $8540
	.db $c7			; $8541
	.db $df			; $8542
	.db $d7			; $8543
	INX					 ; $8544: E8
	CPX $afce			   ; $8545: EC CE AF
	.db $3f			; $8548
	CLD					 ; $8549: D8
	CLD					 ; $854a: D8
	.db $d7			; $854b
	.db $eb			; $854c
	CPX $fdf9			   ; $854d: EC F9 FD
	SBC $fdfe,X			 ; $8550: FD FE FD
	.db $fb			; $8553
	.db $07			; $8554
	.db $07			; $8555
	.db $1f			; $8556
	.db $ff			; $8557
	SBC $0506,X			 ; $8558: FD 06 05
	.db $fb			; $855b
	.db $77			; $855c
	.db $77			; $855d
	.db $ef			; $855e
	.db $df			; $855f
	.db $9f			; $8560
	.db $7f			; $8561
	.db $ff			; $8562
	.db $bf			; $8563
	.db $ff			; $8564
	.db $df			; $8565
	CPX #$c0				; $8566: E0 C0
	.db $80			; $8568
	JSR $0020			   ; $8569: 20 20 00
	CPY #$c0				; $856c: C0 C0
	.db $db			; $856e
	SBC $f9e6			   ; $856f: ED E6 F9
	.db $ff			; $8572
	.db $f7			; $8573
	.db $f3			; $8574
	.db $e7			; $8575
	.db $1b			; $8576
	ORA $1106			   ; $8577: 0D 06 11
	.db $13			; $857a
	.db $03			; $857b
	.db $03			; $857c
	.db $07			; $857d
	.db $9f			; $857e
	.db $bf			; $857f
	.db $3f			; $8580
	.db $df			; $8581
	.db $df			; $8582
	.db $df			; $8583
	CPX #$e0				; $8584: E0 E0
	SED					 ; $8586: F8
	.db $ff			; $8587
	.db $3f			; $8588
	CPY #$c0				; $8589: C0 C0
	.db $df			; $858b
	INC $f7ee			   ; $858c: EE EE F7
	.db $e7			; $858f
	SBC ($e4,X)			 ; $8590: E1 E4
	SBC $17eb			   ; $8592: ED EB 17
	.db $47			; $8595
	.db $77			; $8596
	.db $f7			; $8597
	SBC $0d1c,Y			 ; $8598: F9 1C 0D
	.db $eb			; $859b
	.db $d7			; $859c
	.db $47			; $859d
	CPX $38d0			   ; $859e: EC D0 38
	LDY $d0d3,X			 ; $85a1: BC D3 D0
	INX					 ; $85a4: E8
	CPX tmp3				; $85a5: E4 03
	.db $07			; $85a7
	.db $07			; $85a8
	.db $07			; $85a9
	.db $0f			; $85aa
	.db $0f			; $85ab
	.db $07			; $85ac
	.db $07			; $85ad
	.db $cb			; $85ae
	CMP $c6				 ; $85af: C5 C6
	CMP $03f3			   ; $85b1: CD F3 03
	.db $07			; $85b4
	.db $0f			; $85b5
	BEQ $85b0			   ; $85b6: F0 F8
	SED					 ; $85b8: F8
	SED					 ; $85b9: F8
	.db $fc			; $85ba
	.db $fc			; $85bb
	SED					 ; $85bc: F8
	SED					 ; $85bd: F8
	BNE $8560			   ; $85be: D0 A0
	SEI					 ; $85c0: 78
	SEI					 ; $85c1: 78
	CLV					 ; $85c2: B8
	.db $df			; $85c3
	CPX #$e8				; $85c4: E0 E8
	.db $0c			; $85c6
	.db $1f			; $85c7
	.db $1f			; $85c8
	.db $1f			; $85c9
	.db $07			; $85ca
	.db $07			; $85cb
	.db $07			; $85cc
	BRK					 ; $85cd: 00
	.db $03			; $85ce
	ORA (tmp1,X)			; $85cf: 01 01
	ASL ptr0_hi			 ; $85d1: 06 05
	.db $fb			; $85d3
	.db $7f			; $85d4
	.db $07			; $85d5
	.db $0f			; $85d6
	.db $ff			; $85d7
	INC $f8f8,X			 ; $85d8: FE F8 F8
	SED					 ; $85db: F8
	SEI					 ; $85dc: 78
	SEI					 ; $85dd: 78
	.db $e3			; $85de
	.db $c3			; $85df
	.db $23			; $85e0
	.db $b3			; $85e1
	.db $cf			; $85e2
	CPY #$e0				; $85e3: C0 E0
	BEQ $85f6			   ; $85e5: F0 0F
	.db $1f			; $85e7
	.db $1f			; $85e8
	.db $1f			; $85e9
	.db $3f			; $85ea
	.db $3f			; $85eb
	.db $1f			; $85ec
	.db $1f			; $85ed
	.db $1b			; $85ee
	ORA $3d1e,X			 ; $85ef: 1D 1E 3D
	.db $cb			; $85f2
	.db $07			; $85f3
	.db $17			; $85f4
	.db $37			; $85f5
	CPY #$e0				; $85f6: C0 E0
	CPX #$e0				; $85f8: E0 E0
	BEQ $85ec			   ; $85fa: F0 F0
	CPX #$e0				; $85fc: E0 E0
	CPY #$80				; $85fe: C0 80
	BRK					 ; $8600: 00
	RTS					 ; $8601: 60
	LDY #$df				; $8602: A0 DF
	INC $f0e0,X			 ; $8604: FE E0 F0
	.db $ff			; $8607
	.db $7f			; $8608
	.db $1f			; $8609
	.db $1f			; $860a
	.db $1f			; $860b
	ASL $071e,X			 ; $860c: 1E 1E 07
	.db $03			; $860f
	ORA $1d1c,X			 ; $8610: 1D 1C 1D
	.db $fb			; $8613
	.db $17			; $8614
	.db $07			; $8615
	BMI $8610			   ; $8616: 30 F8
	SED					 ; $8618: F8
	SED					 ; $8619: F8
	CPX #$e0				; $861a: E0 E0
	CPX #$00				; $861c: E0 00
	CPX $38d0			   ; $861e: EC D0 38
	CLV					 ; $8621: B8
	BNE $85e4			   ; $8622: D0 C0
	CPX #$e0				; $8624: E0 E0
	.db $03			; $8626
	.db $07			; $8627
	.db $07			; $8628
	.db $07			; $8629
	.db $0f			; $862a
	.db $1f			; $862b
	.db $1f			; $862c
	.db $1f			; $862d
	.db $0b			; $862e
	ORA $06				 ; $862f: 05 06
	ORA tmp3				; $8631: 05 03
	.db $03			; $8633
	.db $03			; $8634
	.db $03			; $8635
	BEQ $8630			   ; $8636: F0 F8
	SED					 ; $8638: F8
	SED					 ; $8639: F8
	SED					 ; $863a: F8
	.db $fc			; $863b
	.db $fc			; $863c
	.db $fc			; $863d
	CPY #$a0				; $863e: C0 A0
	.db $7f			; $8640
	.db $7f			; $8641
	.db $bf			; $8642
	.db $d7			; $8643
	.db $eb			; $8644
	INX					 ; $8645: E8
	.db $1f			; $8646
	.db $0f			; $8647
	PHP					 ; $8648: 08
	CLC					 ; $8649: 18
	.db $1f			; $864a
	BRK					 ; $864b: 00
	.db $03			; $864c
	BRK					 ; $864d: 00
	.db $07			; $864e
	.db $1f			; $864f
	SBC $fbf8,X			 ; $8650: FD F8 FB
	.db $fb			; $8653
	.db $77			; $8654
	.db $77			; $8655
	INC $00e2,X			 ; $8656: FE E2 00
	BRK					 ; $8659: 00
	SED					 ; $865a: F8
	BRK					 ; $865b: 00
	BVS $86ce			   ; $865c: 70 70
	CPX #$c0				; $865e: E0 C0
	JSR $c0a0			   ; $8660: 20 A0 C0
	CPY #$c0				; $8663: C0 C0
	CPY #$0f				; $8665: C0 0F
	.db $1f			; $8667
	.db $1f			; $8668
	.db $1f			; $8669
	.db $1f			; $866a
	.db $3f			; $866b
	.db $3f			; $866c
	.db $3f			; $866d
	.db $1b			; $866e
	ORA $1d1e,X			 ; $866f: 1D 1E 1D
	.db $03			; $8672
	.db $07			; $8673
	.db $07			; $8674
	.db $07			; $8675
	CPY #$e0				; $8676: C0 E0
	CPX #$e0				; $8678: E0 E0
	BEQ $8674			   ; $867a: F0 F8
	SED					 ; $867c: F8
	SED					 ; $867d: F8
	CPX #$f8				; $867e: E0 F8
	.db $3f			; $8680
	.db $5f			; $8681
	.db $9f			; $8682
	.db $df			; $8683
	INC $7fee			   ; $8684: EE EE 7F
	.db $47			; $8687
	BRK					 ; $8688: 00
	BRK					 ; $8689: 00
	.db $1f			; $868a
	BRK					 ; $868b: 00
	ASL $070e			   ; $868c: 0E 0E 07
	.db $03			; $868f
	SBC $fbfc,X			 ; $8690: FD FC FB
	.db $eb			; $8693
	.db $d7			; $8694
	.db $37			; $8695
	SED					 ; $8696: F8
	BEQ $86a9			   ; $8697: F0 10
	CLC					 ; $8699: 18
	SED					 ; $869a: F8
	BRK					 ; $869b: 00
	CPY #$00				; $869c: C0 00
	.db $ef			; $869e
	.db $d7			; $869f
	.db $3f			; $86a0
	LDA $dfde,Y			 ; $86a1: B9 DE DF
	.db $ef			; $86a4
	SBC ($ec,X)			 ; $86a5: E1 EC
	BNE $86e1			   ; $86a7: D0 38
	CLV					 ; $86a9: B8
	BNE $867c			   ; $86aa: D0 D0
	INX					 ; $86ac: E8
	.db $e2			; $86ad
	.db $fb			; $86ae
	SBC $e6fe,X			 ; $86af: FD FE E6
	ORA $ffff,X			 ; $86b2: 1D FF FF
	.db $e7			; $86b5
	.db $0b			; $86b6
	ORA $06				 ; $86b7: 05 06
	ASL tmp1				; $86b9: 06 01
	.db $03			; $86bb
	.db $07			; $86bc
	.db $17			; $86bd
	.db $df			; $86be
	.db $bf			; $86bf
	.db $67			; $86c0
	.db $67			; $86c1
	CLV					 ; $86c2: B8
	CLD					 ; $86c3: D8
	.db $e7			; $86c4
	INX					 ; $86c5: E8
	.db $d7			; $86c6
	.db $a7			; $86c7
	.db $7f			; $86c8
	.db $7f			; $86c9
	CLV					 ; $86ca: B8
	.db $df			; $86cb
	CPX #$e8				; $86cc: E0 E8
	.db $fc			; $86ce
	INC $3efe,X			 ; $86cf: FE FE 3E
	ORA tmp3				; $86d2: 05 03
	.db $07			; $86d4
	.db $7f			; $86d5
	.db $fb			; $86d6
	SBC $3ef8,Y			 ; $86d7: F9 F8 3E
	CMP $fb				 ; $86da: C5 FB
	.db $7f			; $86dc
	.db $07			; $86dd
	.db $ef			; $86de
	.db $df			; $86df
	.db $3f			; $86e0
	.db $a7			; $86e1
	SED					 ; $86e2: F8
	.db $ff			; $86e3
	.db $ff			; $86e4
	.db $e7			; $86e5
	CPX #$c0				; $86e6: E0 C0
	JSR $c0a0			   ; $86e8: 20 A0 C0
	CPY #$e0				; $86eb: C0 E0
	INX					 ; $86ed: E8
	.db $db			; $86ee
	SBC $9dfe,X			 ; $86ef: FD FE 9D
	.db $7b			; $86f2
	.db $f7			; $86f3
	.db $f7			; $86f4
	.db $b7			; $86f5
	.db $1b			; $86f6
	ORA $1d1e,X			 ; $86f7: 1D 1E 1D
	.db $0b			; $86fa
	.db $07			; $86fb
	.db $17			; $86fc
	.db $77			; $86fd
	.db $3f			; $86fe
	.db $7f			; $86ff
	.db $7f			; $8700
	.db $7c			; $8701
	LDY #$c0				; $8702: A0 C0
	CPX #$fe				; $8704: E0 FE
	.db $df			; $8706
	.db $9f			; $8707
	.db $1f			; $8708
	.db $7c			; $8709
	.db $a3			; $870a
	.db $df			; $870b
	INC $f7e0,X			 ; $870c: FE E0 F7
	.db $fb			; $870f
	SBC $e4				 ; $8710: E5 E4
	ORA $f71b,X			 ; $8712: 1D 1B F7
	.db $07			; $8715
	.db $e7			; $8716
	.db $e3			; $8717
	SBC $1dfc,X			 ; $8718: FD FC 1D
	.db $fb			; $871b
	.db $17			; $871c
	.db $07			; $871d
	CLV					 ; $871e: B8
	ASL tmp1				; $871f: 06 01
	.db $02			; $8721
	STY $73				 ; $8722: 84 73
	CPY tmp2				; $8724: C4 02
	.db $ff			; $8726
	.db $ff			; $8727
	.db $ff			; $8728
	.db $ff			; $8729
	.db $ff			; $872a
	.db $ff			; $872b
	.db $ff			; $872c
	.db $ff			; $872d
	ORA (tmp2,X)			; $872e: 01 02
	STY $8e72			   ; $8730: 8C 72 8E
	ORA (tmp0,X)			; $8733: 01 00
	ORA ($ff,X)			 ; $8735: 01 FF
	.db $ff			; $8737
	.db $ff			; $8738
	.db $ff			; $8739
	.db $ff			; $873a
	.db $ff			; $873b
	.db $ff			; $873c
	.db $ff			; $873d
	.db $03			; $873e
	STY $78				 ; $873f: 84 78
	STY tmp3				; $8741: 84 03
	.db $07			; $8743
	.db $07			; $8744
	.db $0b			; $8745
	.db $ff			; $8746
	.db $ff			; $8747
	.db $ff			; $8748
	.db $ff			; $8749
	.db $fc			; $874a
	.db $fa			; $874b
	.db $fb			; $874c
	SBC $b3,X			   ; $874d: F5 B3
	.db $0c			; $874f
	.db $02			; $8750
	ORA (tmp1,X)			; $8751: 01 01
	INC $98				 ; $8753: E6 98
	LSR $ff				 ; $8755: 46 FF
	.db $ff			; $8757
	.db $ff			; $8758
	.db $ff			; $8759
	.db $ff			; $875a
	.db $7f			; $875b
	.db $7f			; $875c
	.db $bf			; $875d
	CLV					 ; $875e: B8
	ASL tmp1				; $875f: 06 01
	BRK					 ; $8761: 00
	.db $83			; $8762
	.db $77			; $8763
	.db $cf			; $8764
	.db $0f			; $8765
	.db $ff			; $8766
	.db $ff			; $8767
	.db $ff			; $8768
	.db $ff			; $8769
	.db $fc			; $876a
	SBC $f7f3,Y			 ; $876b: F9 F3 F7
	ORA (tmp2,X)			; $876e: 01 02
	STY $ce32			   ; $8770: 8C 32 CE
	SBC ($f0,X)			 ; $8773: E1 F0
	SBC ($ff),Y			 ; $8775: F1 FF
	.db $ff			; $8777
	.db $ff			; $8778
	.db $ff			; $8779
	.db $3f			; $877a
	.db $9f			; $877b
	.db $8f			; $877c
	.db $4f			; $877d
	.db $0f			; $877e
	.db $87			; $877f
	ADC $85				 ; $8780: 65 85
	ORA (ptr_hi,X)		  ; $8782: 01 11
	ORA tmp3				; $8784: 05 03
	SBC $f9,X			   ; $8786: F5 F9
	.db $fa			; $8788
	.db $fa			; $8789
	INC $faee,X			 ; $878a: FE EE FA
	.db $ff			; $878d
	.db $f3			; $878e
	CPX $a2				 ; $878f: E4 A2
	STA ($81,X)			 ; $8791: 81 81
	LDX $a498			   ; $8793: AE 98 A4
	.db $6f			; $8796
	.db $1f			; $8797
	.db $5f			; $8798
	.db $7f			; $8799
	.db $7f			; $879a
	.db $77			; $879b
	.db $7f			; $879c
	.db $5f			; $879d
	CLV					 ; $879e: B8
	.db $04			; $879f
	.db $03			; $87a0
	.db $07			; $87a1
	.db $8f			; $87a2
	.db $6b			; $87a3
	.db $cb			; $87a4
	ASL $ff,X			   ; $87a5: 16 FF
	.db $ff			; $87a7
	.db $fc			; $87a8
	SBC $f5f2,Y			 ; $87a9: F9 F2 F5
	.db $f7			; $87ac
	SBC $0201			   ; $87ad: ED 01 02
	JMP ($faf2)			 ; $87b0: 6C F2 FA
	SBC #$e8				; $87b3: E9 E8
	LDA $ff,X			   ; $87b5: B5 FF
	.db $ff			; $87b7
	.db $9f			; $87b8
	.db $4f			; $87b9
	.db $a7			; $87ba
	.db $57			; $87bb
	.db $77			; $87bc
	.db $5b			; $87bd
	EOR $9d,X			   ; $87be: 55 9D
	.db $3f			; $87c0
	.db $bf			; $87c1
	.db $17			; $87c2
	.db $87			; $87c3
	.db $22			; $87c4
	.db $0b			; $87c5
	.db $ab			; $87c6
	.db $eb			; $87c7
	.db $d7			; $87c8
	.db $d7			; $87c9
	NOP					 ; $87ca: EA
	.db $7a			; $87cb
	CMP $55f7,X			 ; $87cc: DD F7 55
	.db $dc			; $87cf
	INC $75fe,X			 ; $87d0: FE FE 75
	ROR $28,X			   ; $87d3: 76 28
	.db $0f			; $87d5
	NOP					 ; $87d6: EA
	.db $6b			; $87d7
	SBC $75,X			   ; $87d8: F5 75
	.db $ab			; $87da
	.db $af			; $87db
	.db $df			; $87dc
	INC $b8,X			   ; $87dd: F6 B8
	ASL tmp1				; $87df: 06 01
	.db $02			; $87e1
	STY $72				 ; $87e2: 84 72
	CPY tmp3				; $87e4: C4 03
	.db $ff			; $87e6
	.db $ff			; $87e7
	.db $ff			; $87e8
	.db $ff			; $87e9
	.db $ff			; $87ea
	.db $ff			; $87eb
	.db $ff			; $87ec
	.db $fc			; $87ed
	ORA (tmp2,X)			; $87ee: 01 02
	STY $8e72			   ; $87f0: 8C 72 8E
	ORA (tmp0,X)			; $87f3: 01 00
	CMP ($ff,X)			 ; $87f5: C1 FF
	.db $ff			; $87f7
	.db $ff			; $87f8
	.db $ff			; $87f9
	.db $ff			; $87fa
	.db $ff			; $87fb
	.db $ff			; $87fc
	.db $3f			; $87fd
	.db $07			; $87fe
	.db $8f			; $87ff
	.db $4f			; $8800
	.db $a7			; $8801
	EOR $41				 ; $8802: 45 41
	LDA ($19,X)			 ; $8804: A1 19
	.db $fb			; $8806
	.db $f7			; $8807
	.db $f3			; $8808
	CMP $beba,Y			 ; $8809: D9 BA BE
	LSR $e3e6,X			 ; $880c: 5E E6 E3
	BEQ $8805			   ; $880f: F0 F4
	.db $a3			; $8811
	LDA ($a2,X)			 ; $8812: A1 A2
	STY $5a				 ; $8814: 84 5A
	.db $9f			; $8816
	.db $cf			; $8817
	.db $8b			; $8818
	EOR $7d5f,X			 ; $8819: 5D 5F 7D
	.db $7b			; $881c
	LDA $b8				 ; $881d: A5 B8
	.db $04			; $881f
	.db $03			; $8820
	.db $07			; $8821
	.db $8f			; $8822
	.db $6b			; $8823
	.db $cb			; $8824
	ASL $ff,X			   ; $8825: 16 FF
	.db $ff			; $8827
	.db $fc			; $8828
	SBC $f5f2,Y			 ; $8829: F9 F2 F5
	.db $f7			; $882c
	SBC $0201			   ; $882d: ED 01 02
	JMP ($faf2)			 ; $8830: 6C F2 FA
	SBC #$e8				; $8833: E9 E8
	LDA $ff,X			   ; $8835: B5 FF
	.db $ff			; $8837
	.db $9f			; $8838
	.db $4f			; $8839
	.db $a7			; $883a
	.db $57			; $883b
	.db $77			; $883c
	.db $5b			; $883d
	EOR $9d,X			   ; $883e: 55 9D
	.db $3f			; $8840
	.db $bf			; $8841
	.db $17			; $8842
	.db $87			; $8843
	.db $22			; $8844
	.db $0b			; $8845
	.db $ab			; $8846
	.db $eb			; $8847
	.db $d7			; $8848
	.db $d7			; $8849
	NOP					 ; $884a: EA
	.db $7a			; $884b
	CMP $55f7,X			 ; $884c: DD F7 55
	.db $dc			; $884f
	INC $75fe,X			 ; $8850: FE FE 75
	ROR $28,X			   ; $8853: 76 28
	.db $0f			; $8855
	NOP					 ; $8856: EA
	.db $6b			; $8857
	SBC $75,X			   ; $8858: F5 75
	.db $ab			; $885a
	.db $af			; $885b
	.db $df			; $885c
	INC tmp0,X			  ; $885d: F6 00
	ASL $4b				 ; $885f: 06 4B
	.db $1f			; $8861
	ASL $bf,X			   ; $8862: 16 BF
	AND $ff1f,X			 ; $8864: 3D 1F FF
	SBC $e6b4,Y			 ; $8867: F9 B4 E6
	SBC $d353			   ; $886a: ED 53 D3
	.db $ef			; $886d
	BRK					 ; $886e: 00
	BMI $88ca			   ; $886f: 30 59
	.db $fc			; $8871
	LDY $de,X			   ; $8872: B4 DE
	INC $fffc,X			 ; $8874: FE FC FF
	.db $cf			; $8877
	LDX $b3				 ; $8878: A6 B3
	.db $db			; $887a
	SBC $e5				 ; $887b: E5 E5
	.db $fb			; $887d
	.db $3f			; $887e
	.db $bf			; $887f
	AND $1519,Y			 ; $8880: 39 19 15
	STX $5c,Y			   ; $8883: 96 5C
	.db $9b			; $8885
	CMP $d651,Y			 ; $8886: D9 51 D6
	INC $ea				 ; $8889: E6 EA
	ADC $64b7			   ; $888b: 6D B7 64
	LDX $cefe,Y			 ; $888e: BE FE CE
	CPY $b4d4			   ; $8891: CC D4 B4
	STA $cd6c,X			 ; $8894: 9D 6C CD
	CMP $b5				 ; $8897: C5 B5
	.db $b3			; $8899
	.db $ab			; $889a
	.db $5b			; $889b
	ROR $93,X			   ; $889c: 76 93
	ASL $1f1f			   ; $889e: 0E 1F 1F
	.db $3f			; $88a1
	.db $3f			; $88a2
	.db $3f			; $88a3
	.db $7f			; $88a4
	.db $7f			; $88a5
	SBC ($e6),Y			 ; $88a6: F1 E6
	.db $e2			; $88a8
	CMP $d1d3			   ; $88a9: CD D3 D1
	LDX $ae				 ; $88ac: A6 AE
	SEC					 ; $88ae: 38
	.db $7c			; $88af
	.db $fc			; $88b0
	INC $fefe,X			 ; $88b1: FE FE FE
	.db $ff			; $88b4
	.db $ff			; $88b5
	.db $c7			; $88b6
	.db $b3			; $88b7
	.db $a3			; $88b8
	EOR $c5e5,Y			 ; $88b9: 59 E5 C5
	.db $b2			; $88bc
	TSX					 ; $88bd: BA
	.db $7f			; $88be
	.db $7f			; $88bf
	.db $6f			; $88c0
	.db $7b			; $88c1
	.db $77			; $88c2
	.db $7f			; $88c3
	ROL $95af,X			 ; $88c4: 3E AF 95
	STA ($94),Y			 ; $88c7: 91 94
	LDY $a6aa			   ; $88c9: AC AA A6
	.db $c7			; $88cc
	ADC ($ff),Y			 ; $88cd: 71 FF
	.db $ff			; $88cf
	.db $fb			; $88d0
	.db $ef			; $88d1
	.db $f7			; $88d2
	.db $ff			; $88d3
	LDX $54fa,Y			 ; $88d4: BE FA 54
	CPY $94				 ; $88d7: C4 94
	TXS					 ; $88d9: 9A
	ROL					 ; $88da: 2A
	.db $3a			; $88db
	ADC ($47),Y			 ; $88dc: 71 47
	CLV					 ; $88de: B8
	ASL tmp1				; $88df: 06 01
	.db $02			; $88e1
	STY $72				 ; $88e2: 84 72
	CMP tmp3				; $88e4: C5 03
	.db $ff			; $88e6
	.db $ff			; $88e7
	.db $ff			; $88e8
	.db $ff			; $88e9
	.db $ff			; $88ea
	.db $ff			; $88eb
	INC $01fc,X			 ; $88ec: FE FC 01
	.db $02			; $88ef
	STY $8e72			   ; $88f0: 8C 72 8E
	ORA ($80,X)			 ; $88f3: 01 80
	CMP ($ff,X)			 ; $88f5: C1 FF
	.db $ff			; $88f7
	.db $ff			; $88f8
	.db $ff			; $88f9
	.db $ff			; $88fa
	.db $ff			; $88fb
	.db $7f			; $88fc
	.db $3f			; $88fd
	.db $07			; $88fe
	.db $87			; $88ff
	.db $6b			; $8900
	STA $160d			   ; $8901: 8D 0D 16
	ORA ($07,X)			 ; $8904: 01 07
	.db $fb			; $8906
	SBC $f6f5,Y			 ; $8907: F9 F5 F6
	INC $eb,X			   ; $890a: F6 EB
	INC $e3fb,X			 ; $890c: FE FB E3
	CPX $d1f2			   ; $890f: EC F2 D1
	ADC ($ae),Y			 ; $8912: 71 AE
	CLI					 ; $8914: 58
	ASL $9f,X			   ; $8915: 16 9F
	.db $5f			; $8917
	.db $4f			; $8918
	.db $af			; $8919
	.db $ef			; $891a
	.db $d7			; $891b
	.db $bf			; $891c
	.db $ef			; $891d
	AND ($0f,X)			 ; $891e: 21 0F
	.db $9f			; $8920
	AND $bd9e,X			 ; $8921: 3D 9E BD
	.db $9e			; $8924
	DEC $743e			   ; $8925: CE 3E 74
	.db $eb			; $8928
	.db $c7			; $8929
	.db $eb			; $892a
	DEC $6b				 ; $892b: C6 6B
	.db $74			; $892d
	.db $f4			; $892e
	.db $80			; $892f
	AND #$7c				; $8930: 29 7C
	INC $d6fe,X			 ; $8932: FE FE D6
	.db $2f			; $8935
	.db $3c			; $8936
	INC $83d7,X			 ; $8937: FE D7 83
	EOR $ab,X			   ; $893a: 55 AB
	ADC $f45c,X			 ; $893c: 7D 5C F4
	.db $6b			; $893f
	.db $7f			; $8940
	.db $7f			; $8941
	ROL $0194,X			 ; $8942: 3E 94 01
	.db $27			; $8945
	.db $3a			; $8946
	LDX $aad5,Y			 ; $8947: BE D5 AA
	CMP ($eb,X)			 ; $894a: C1 EB
	.db $7f			; $894c
	ROL $7973,X			 ; $894d: 3E 73 79
	LDA $bc79,X			 ; $8950: BD 79 BC
	SBC $84f0,Y			 ; $8953: F9 F0 84
	ROL $63d6			   ; $8956: 2E D6 63
	.db $d7			; $8959
	.db $e3			; $895a
	.db $d7			; $895b
	ROL $217c			   ; $895c: 2E 7C 21
	.db $0f			; $895f
	.db $9f			; $8960
	AND $bd9e,X			 ; $8961: 3D 9E BD
	.db $9e			; $8964
	DEC $743e			   ; $8965: CE 3E 74
	.db $eb			; $8968
	.db $c7			; $8969
	.db $eb			; $896a
	DEC $6b				 ; $896b: C6 6B
	.db $74			; $896d
	.db $f4			; $896e
	.db $80			; $896f
	AND #$7c				; $8970: 29 7C
	INC $d6fe,X			 ; $8972: FE FE D6
	.db $2f			; $8975
	.db $3c			; $8976
	INC $83d7,X			 ; $8977: FE D7 83
	EOR $ab,X			   ; $897a: 55 AB
	ADC $f45c,X			 ; $897c: 7D 5C F4
	.db $6b			; $897f
	.db $7f			; $8980
	.db $7f			; $8981
	ROL $0194,X			 ; $8982: 3E 94 01
	.db $27			; $8985
	.db $3a			; $8986
	LDX $aad5,Y			 ; $8987: BE D5 AA
	CMP ($eb,X)			 ; $898a: C1 EB
	.db $7f			; $898c
	ROL $7973,X			 ; $898d: 3E 73 79
	LDA $bc79,X			 ; $8990: BD 79 BC
	SBC $84f0,Y			 ; $8993: F9 F0 84
	ROL $63d6			   ; $8996: 2E D6 63
	.db $d7			; $8999
	.db $e3			; $899a
	.db $d7			; $899b
	ROL $1d7c			   ; $899c: 2E 7C 1D
	.db $73			; $899f
	.db $67			; $89a0
	.db $c7			; $89a1
	.db $eb			; $89a2
	DEC $e3				 ; $89a3: C6 E3
	.db $f4			; $89a5
	ROL $f97c,X			 ; $89a6: 3E 7C F9
	SBC $f975,Y			 ; $89a9: F9 75 F9
	.db $7c			; $89ac
	SEI					 ; $89ad: 78
	SED					 ; $89ae: F8
	INC $83d6,X			 ; $89af: FE D6 83
	ORA ($ad),Y			 ; $89b2: 11 AD
	ROR $2c5f,X			 ; $89b4: 7E 5F 2C
	INC $ffff,X			 ; $89b7: FE FF FF
	.db $ef			; $89ba
	.db $53			; $89bb
	ORA ($3c,X)			 ; $89bc: 01 3C
	.db $fa			; $89be
	ROR $88b5,X			 ; $89bf: 7E B5 88
	CMP ($6b,X)			 ; $89c2: C1 6B
	.db $7f			; $89c4
	.db $1f			; $89c5
	.db $3c			; $89c6
	.db $80			; $89c7
	DEX					 ; $89c8: CA
	.db $f7			; $89c9
	.db $ff			; $89ca
	.db $ff			; $89cb
	.db $7f			; $89cc
	.db $34			; $89cd
	.db $2f			; $89ce
	.db $c7			; $89cf
	.db $63			; $89d0
	.db $d7			; $89d1
	.db $e3			; $89d2
	INC $ce				 ; $89d3: E6 CE
	CLV					 ; $89d5: B8
	ASL $9f3e,X			 ; $89d6: 1E 3E 9F
	LDX $9f9f			   ; $89d9: AE 9F 9F
	ROL $1d7c,X			 ; $89dc: 3E 7C 1D
	.db $73			; $89df
	.db $67			; $89e0
	.db $c7			; $89e1
	.db $eb			; $89e2
	DEC $e3				 ; $89e3: C6 E3
	.db $f4			; $89e5
	ROL $f97c,X			 ; $89e6: 3E 7C F9
	SBC $f975,Y			 ; $89e9: F9 75 F9
	.db $7c			; $89ec
	SEI					 ; $89ed: 78
	SED					 ; $89ee: F8
	INC $83d6,X			 ; $89ef: FE D6 83
	ORA ($ad),Y			 ; $89f2: 11 AD
	ROR $2c5f,X			 ; $89f4: 7E 5F 2C
	INC $ffff,X			 ; $89f7: FE FF FF
	.db $ef			; $89fa
	.db $53			; $89fb
	ORA ($3c,X)			 ; $89fc: 01 3C
	.db $fa			; $89fe
	ROR $88b5,X			 ; $89ff: 7E B5 88
	CMP ($6b,X)			 ; $8a02: C1 6B
	.db $7f			; $8a04
	.db $1f			; $8a05
	.db $3c			; $8a06
	.db $80			; $8a07
	DEX					 ; $8a08: CA
	.db $f7			; $8a09
	.db $ff			; $8a0a
	.db $ff			; $8a0b
	.db $7f			; $8a0c
	.db $34			; $8a0d
	.db $2f			; $8a0e
	.db $c7			; $8a0f
	.db $63			; $8a10
	.db $d7			; $8a11
	.db $e3			; $8a12
	INC $ce				 ; $8a13: E6 CE
	CLV					 ; $8a15: B8
	ASL $9f3e,X			 ; $8a16: 1E 3E 9F
	LDX $9f9f			   ; $8a19: AE 9F 9F
	ROL $1c7c,X			 ; $8a1c: 3E 7C 1C
	.db $73			; $8a1f
	.db $6b			; $8a20
	.db $c7			; $8a21
	.db $cb			; $8a22
	.db $c7			; $8a23
	NOP					 ; $8a24: EA
	INC $2f,X			   ; $8a25: F6 2F
	.db $3c			; $8a27
	.db $fc			; $8a28
	ADC $7a75,Y			 ; $8a29: 79 75 7A
	.db $77			; $8a2c
	.db $3c			; $8a2d
	SED					 ; $8a2e: F8
	INC $83c6,X			 ; $8a2f: FE C6 83
	EOR $a9,X			   ; $8a32: 55 A9
	INC $043e,X			 ; $8a34: FE 3E 04
	.db $7c			; $8a37
	.db $ff			; $8a38
	INC $d7af,X			 ; $8a39: FE AF D7
	ADC ($59,X)			 ; $8a3c: 61 59
	.db $7c			; $8a3e
	.db $7f			; $8a3f
	STA $aa,X			   ; $8a40: 95 AA
	CMP ($63,X)			 ; $8a42: C1 63
	.db $7f			; $8a44
	.db $1f			; $8a45
	TXS					 ; $8a46: 9A
	STX $eb				 ; $8a47: 86 EB
	SBC $7f,X			   ; $8a49: F5 7F
	.db $ff			; $8a4b
	ROL $6f20,X			 ; $8a4c: 3E 20 6F
	.db $57			; $8a4f
	.db $e3			; $8a50
	.db $d3			; $8a51
	.db $e3			; $8a52
	DEC $ce,X			   ; $8a53: D6 CE
	SEC					 ; $8a55: 38
	.db $3c			; $8a56
	INC $ae5e			   ; $8a57: EE 5E AE
	.db $9e			; $8a5a
	.db $3f			; $8a5b
	.db $3c			; $8a5c
	.db $f4			; $8a5d
	.db $1c			; $8a5e
	.db $73			; $8a5f
	.db $6b			; $8a60
	.db $c7			; $8a61
	.db $cb			; $8a62
	.db $c7			; $8a63
	NOP					 ; $8a64: EA
	INC $2f,X			   ; $8a65: F6 2F
	.db $3c			; $8a67
	.db $fc			; $8a68
	ADC $7a75,Y			 ; $8a69: 79 75 7A
	.db $77			; $8a6c
	.db $3c			; $8a6d
	SED					 ; $8a6e: F8
	INC $83c6,X			 ; $8a6f: FE C6 83
	EOR $a9,X			   ; $8a72: 55 A9
	INC $043e,X			 ; $8a74: FE 3E 04
	.db $7c			; $8a77
	.db $ff			; $8a78
	INC $d7af,X			 ; $8a79: FE AF D7
	ADC ($59,X)			 ; $8a7c: 61 59
	.db $7c			; $8a7e
	.db $7f			; $8a7f
	STA $aa,X			   ; $8a80: 95 AA
	CMP ($63,X)			 ; $8a82: C1 63
	.db $7f			; $8a84
	.db $1f			; $8a85
	TXS					 ; $8a86: 9A
	STX $eb				 ; $8a87: 86 EB
	SBC $7f,X			   ; $8a89: F5 7F
	.db $ff			; $8a8b
	ROL $6f20,X			 ; $8a8c: 3E 20 6F
	.db $57			; $8a8f
	.db $e3			; $8a90
	.db $d3			; $8a91
	.db $e3			; $8a92
	DEC $ce,X			   ; $8a93: D6 CE
	SEC					 ; $8a95: 38
	.db $3c			; $8a96
	INC $ae5e			   ; $8a97: EE 5E AE
	.db $9e			; $8a9a
	.db $3f			; $8a9b
	.db $3c			; $8a9c
	.db $f4			; $8a9d
	.db $1f			; $8a9e
	.db $7a			; $8a9f
	.db $74			; $8aa0
	SBC $fbf5,Y			 ; $8aa1: F9 F5 FB
	.db $77			; $8aa4
	.db $7c			; $8aa5
	JSR $9f0f			   ; $8aa6: 20 0F 9F
	ROL $3d1e,X			 ; $8aa9: 3E 1E 3D
	.db $9c			; $8aac
	.db $8b			; $8aad
	SEC					 ; $8aae: 38
	INC $fffe,X			 ; $8aaf: FE FE FF
	.db $ab			; $8ab2
	CMP $63,X			   ; $8ab3: D5 63
	ADC $00c4,Y			 ; $8ab5: 79 C4 00
	AND #$7c				; $8ab8: 29 7C
	INC $9e7e,X			 ; $8aba: FE 7E 9E
	LDX $9e				 ; $8abd: A6 9E
	DEC $ab				 ; $8abf: C6 AB
	CMP $ff,X			   ; $8ac1: D5 FF
	.db $7f			; $8ac3
	.db $7f			; $8ac4
	.db $1c			; $8ac5
	ADC $79				 ; $8ac6: 65 79
	ROR $3e7f,X			 ; $8ac8: 7E 7F 3E
	STY tmp0,X			  ; $8acb: 94 00
	.db $23			; $8acd
	ROL $dfee,X			 ; $8ace: 3E EE DF
	.db $af			; $8ad1
	.db $9f			; $8ad2
	ROL $f85e			   ; $8ad3: 2E 5E F8
	CMP ($39),Y			 ; $8ad6: D1 39
	LDY $7c78,X			 ; $8ad8: BC 78 7C
	SBC $04f0,Y			 ; $8adb: F9 F0 04
	.db $1f			; $8ade
	.db $7a			; $8adf
	.db $74			; $8ae0
	SBC $fbf5,Y			 ; $8ae1: F9 F5 FB
	.db $77			; $8ae4
	.db $7c			; $8ae5
	JSR $9f0f			   ; $8ae6: 20 0F 9F
	ROL $3d1e,X			 ; $8ae9: 3E 1E 3D
	.db $9c			; $8aec
	.db $8b			; $8aed
	SEC					 ; $8aee: 38
	INC $fffe,X			 ; $8aef: FE FE FF
	.db $ab			; $8af2
	CMP $63,X			   ; $8af3: D5 63
	ADC $00c4,Y			 ; $8af5: 79 C4 00
	AND #$7c				; $8af8: 29 7C
	INC $9e7e,X			 ; $8afa: FE 7E 9E
	LDX $9e				 ; $8afd: A6 9E
	DEC $ab				 ; $8aff: C6 AB
	CMP $ff,X			   ; $8b01: D5 FF
	.db $7f			; $8b03
	.db $7f			; $8b04
	.db $1c			; $8b05
	ADC $79				 ; $8b06: 65 79
	ROR $3e7f,X			 ; $8b08: 7E 7F 3E
	STY tmp0,X			  ; $8b0b: 94 00
	.db $23			; $8b0d
	ROL $dfee,X			 ; $8b0e: 3E EE DF
	.db $af			; $8b11
	.db $9f			; $8b12
	ROL $f85e			   ; $8b13: 2E 5E F8
	CMP ($39),Y			 ; $8b16: D1 39
	LDY $7c78,X			 ; $8b18: BC 78 7C
	SBC $04f0,Y			 ; $8b1b: F9 F0 04
	LDA $3e				 ; $8b1e: A5 3E
	BEQ $8b29			   ; $8b20: F0 07
	LDA $058e			   ; $8b22: AD 8E 05
	CMP #$02				; $8b25: C9 02
	BCS $8b37			   ; $8b27: B0 0E
	LDA $3c				 ; $8b29: A5 3C
	AND #$0f				; $8b2b: 29 0F
	LDX #$07				; $8b2d: A2 07
	CMP $8b38,X			 ; $8b2f: DD 38 8B
	BEQ $8b40			   ; $8b32: F0 0C
	DEX					 ; $8b34: CA
	BPL $8b2f			   ; $8b35: 10 F8
	RTS					 ; $8b37: 60
	.db $0f			; $8b38
	ORA $090b			   ; $8b39: 0D 0B 09
	.db $07			; $8b3c
	ORA tmp3				; $8b3d: 05 03
	ORA ($20,X)			 ; $8b3f: 01 20
	LSR					 ; $8b41: 4A
	.db $8b			; $8b42
	JSR $8ce6			   ; $8b43: 20 E6 8C
	RTS					 ; $8b46: 60
	JMP $8d26			   ; $8b47: 4C 26 8D
	LDY $28				 ; $8b4a: A4 28
	BNE $8bcb			   ; $8b4c: D0 7D
	AND #$0f				; $8b4e: 29 0F
	CMP #$0f				; $8b50: C9 0F
	BNE $8b47			   ; $8b52: D0 F3
	LDY $050a			   ; $8b54: AC 0A 05
	LDA #$bf				; $8b57: A9 BF
	STA $0300,Y			 ; $8b59: 99 00 03
	LDA #$02				; $8b5c: A9 02
	STA $0301,Y			 ; $8b5e: 99 01 03
	LDA #$02				; $8b61: A9 02
	STA $0302,Y			 ; $8b63: 99 02 03
	LDA $05fe			   ; $8b66: AD FE 05
	STA tmp0				; $8b69: 85 00
	LDA $05ff			   ; $8b6b: AD FF 05
	STA $05fe			   ; $8b6e: 8D FE 05
	STA $0303,Y			 ; $8b71: 99 03 03
	LDA tmp0				; $8b74: A5 00
	STA $05ff			   ; $8b76: 8D FF 05
	STA $0304,Y			 ; $8b79: 99 04 03
	TYA					 ; $8b7c: 98
	CLC					 ; $8b7d: 18
	ADC #$05				; $8b7e: 69 05
	STA $050a			   ; $8b80: 8D 0A 05
	TAY					 ; $8b83: A8
	INC $050b			   ; $8b84: EE 0B 05
	LDA $65				 ; $8b87: A5 65
	CMP #$03				; $8b89: C9 03
	BNE $8bc8			   ; $8b8b: D0 3B
	LDA #$bf				; $8b8d: A9 BF
	STA $0300,Y			 ; $8b8f: 99 00 03
	LDA #$03				; $8b92: A9 03
	STA $0301,Y			 ; $8b94: 99 01 03
	LDA #$0d				; $8b97: A9 0D
	STA $0302,Y			 ; $8b99: 99 02 03
	LDA $0606			   ; $8b9c: AD 06 06
	STA tmp0				; $8b9f: 85 00
	LDA $0608			   ; $8ba1: AD 08 06
	STA $0606			   ; $8ba4: 8D 06 06
	STA $0303,Y			 ; $8ba7: 99 03 03
	LDA $0607			   ; $8baa: AD 07 06
	STA $0608			   ; $8bad: 8D 08 06
	STA $0304,Y			 ; $8bb0: 99 04 03
	LDA tmp0				; $8bb3: A5 00
	STA $0607			   ; $8bb5: 8D 07 06
	STA $0305,Y			 ; $8bb8: 99 05 03
	INC $050b			   ; $8bbb: EE 0B 05
	TYA					 ; $8bbe: 98
	CLC					 ; $8bbf: 18
	ADC #$06				; $8bc0: 69 06
	STA $050a			   ; $8bc2: 8D 0A 05
	JSR $8d2c			   ; $8bc5: 20 2C 8D
	JMP $8c4b			   ; $8bc8: 4C 4B 8C
	CPY #$18				; $8bcb: C0 18
	BEQ $8bd2			   ; $8bcd: F0 03
	JMP $8c52			   ; $8bcf: 4C 52 8C
	LDY $050a			   ; $8bd2: AC 0A 05
	TAX					 ; $8bd5: AA
	LDA #$bf				; $8bd6: A9 BF
	STA $0300,Y			 ; $8bd8: 99 00 03
	TXA					 ; $8bdb: 8A
	CMP #$0f				; $8bdc: C9 0F
	BEQ $8bf3			   ; $8bde: F0 13
	AND #$03				; $8be0: 29 03
	CMP #$03				; $8be2: C9 03
	BEQ $8be7			   ; $8be4: F0 01
	RTS					 ; $8be6: 60
	LDA #$05				; $8be7: A9 05
	STA $0301,Y			 ; $8be9: 99 01 03
	LDA #$07				; $8bec: A9 07
	STA $0302,Y			 ; $8bee: 99 02 03
	BNE $8c15			   ; $8bf1: D0 22
	LDA #$07				; $8bf3: A9 07
	STA $0301,Y			 ; $8bf5: 99 01 03
	LDA #$05				; $8bf8: A9 05
	STA $0302,Y			 ; $8bfa: 99 02 03
	LDA $0600			   ; $8bfd: AD 00 06
	STA tmp0				; $8c00: 85 00
	LDA $0601			   ; $8c02: AD 01 06
	STA $0600			   ; $8c05: 8D 00 06
	STA $0303,Y			 ; $8c08: 99 03 03
	LDA tmp0				; $8c0b: A5 00
	STA $0601			   ; $8c0d: 8D 01 06
	STA $0304,Y			 ; $8c10: 99 04 03
	INY					 ; $8c13: C8
	INY					 ; $8c14: C8
	INY					 ; $8c15: C8
	INY					 ; $8c16: C8
	INY					 ; $8c17: C8
	LDA #$11				; $8c18: A9 11
	STA $0300,Y			 ; $8c1a: 99 00 03
	LDA #$0f				; $8c1d: A9 0F
	STA $0301,Y			 ; $8c1f: 99 01 03
	LDA $0605			   ; $8c22: AD 05 06
	STA tmp0				; $8c25: 85 00
	LDA $0604			   ; $8c27: AD 04 06
	STA $0605			   ; $8c2a: 8D 05 06
	STA $0304,Y			 ; $8c2d: 99 04 03
	LDA $0603			   ; $8c30: AD 03 06
	STA $0604			   ; $8c33: 8D 04 06
	STA $0303,Y			 ; $8c36: 99 03 03
	LDA tmp0				; $8c39: A5 00
	STA $0603			   ; $8c3b: 8D 03 06
	STA $0302,Y			 ; $8c3e: 99 02 03
	TYA					 ; $8c41: 98
	CLC					 ; $8c42: 18
	ADC #$05				; $8c43: 69 05
	STA $050a			   ; $8c45: 8D 0A 05
	INC $050b			   ; $8c48: EE 0B 05
	LDA system_flags		; $8c4b: A5 1F
	ORA #$20				; $8c4d: 09 20
	STA system_flags		; $8c4f: 85 1F
	RTS					 ; $8c51: 60
	TXA					 ; $8c52: 8A
	TAY					 ; $8c53: A8
	LDA $0573			   ; $8c54: AD 73 05
	ASL					 ; $8c57: 0A
	DEX					 ; $8c58: CA
	BPL $8c57			   ; $8c59: 10 FC
	BCS $8c5e			   ; $8c5b: B0 01
	RTS					 ; $8c5d: 60
	TYA					 ; $8c5e: 98
	LDA $0584,Y			 ; $8c5f: B9 84 05
	STA tmp2				; $8c62: 85 02
	LDA $057c,Y			 ; $8c64: B9 7C 05
	STA tmp3				; $8c67: 85 03
	LDA $3c				 ; $8c69: A5 3C
	AND $058d			   ; $8c6b: 2D 8D 05
	ASL					 ; $8c6e: 0A
	ASL					 ; $8c6f: 0A
	BCC $8c74			   ; $8c70: 90 02
	INC tmp3				; $8c72: E6 03
	CLC					 ; $8c74: 18
	ADC tmp2				; $8c75: 65 02
	STA tmp2				; $8c77: 85 02
	BCC $8c7d			   ; $8c79: 90 02
	INC tmp3				; $8c7b: E6 03
	LDA #$09				; $8c7d: A9 09
	STA ptr0_lo			 ; $8c7f: 85 04
	LDA $0574,Y			 ; $8c81: B9 74 05
	STA tmp0				; $8c84: 85 00
	BEQ $8ca9			   ; $8c86: F0 21
	ASL tmp0				; $8c88: 06 00
	ROL ptr0_lo			 ; $8c8a: 26 04
	ASL tmp0				; $8c8c: 06 00
	ROL ptr0_lo			 ; $8c8e: 26 04
	ASL tmp0				; $8c90: 06 00
	ROL ptr0_lo			 ; $8c92: 26 04
	ASL tmp0				; $8c94: 06 00
	ROL ptr0_lo			 ; $8c96: 26 04
	LDY #$00				; $8c98: A0 00
	JSR $8cac			   ; $8c9a: 20 AC 8C
	JSR $8cac			   ; $8c9d: 20 AC 8C
	JSR $8cac			   ; $8ca0: 20 AC 8C
	JSR $8cac			   ; $8ca3: 20 AC 8C
	JSR $c626			   ; $8ca6: 20 26 C6
	LDA #$ff				; $8ca9: A9 FF
	RTS					 ; $8cab: 60
	LDX $050a			   ; $8cac: AE 0A 05
	LDA ptr0_lo			 ; $8caf: A5 04
	STA $0300,X			 ; $8cb1: 9D 00 03
	LDA #$10				; $8cb4: A9 10
	STA $0301,X			 ; $8cb6: 9D 01 03
	LDA tmp0				; $8cb9: A5 00
	STA $0302,X			 ; $8cbb: 9D 02 03
	LDA #$10				; $8cbe: A9 10
	STA tmp1				; $8cc0: 85 01
	LDA (tmp2),Y			; $8cc2: B1 02
	STA $0303,X			 ; $8cc4: 9D 03 03
	INX					 ; $8cc7: E8
	INY					 ; $8cc8: C8
	TYA					 ; $8cc9: 98
	DEC tmp1				; $8cca: C6 01
	BNE $8cc2			   ; $8ccc: D0 F4
	LDA $050a			   ; $8cce: AD 0A 05
	CLC					 ; $8cd1: 18
	ADC #$13				; $8cd2: 69 13
	STA $050a			   ; $8cd4: 8D 0A 05
	INC $050b			   ; $8cd7: EE 0B 05
	LDA tmp0				; $8cda: A5 00
	CLC					 ; $8cdc: 18
	ADC #$10				; $8cdd: 69 10
	STA tmp0				; $8cdf: 85 00
	BCC $8ce5			   ; $8ce1: 90 02
	INC ptr0_lo			 ; $8ce3: E6 04
	RTS					 ; $8ce5: 60
	LDA $629a			   ; $8ce6: AD 9A 62
	BPL $8d25			   ; $8ce9: 10 3A
	LDA $3c				 ; $8ceb: A5 3C
	AND #$07				; $8ced: 29 07
	CMP #$07				; $8cef: C9 07
	BNE $8d25			   ; $8cf1: D0 32
	JSR $c891			   ; $8cf3: 20 91 C8
	AND #$03				; $8cf6: 29 03
	ASL					 ; $8cf8: 0A
	TAX					 ; $8cf9: AA
	JSR $c891			   ; $8cfa: 20 91 C8
	AND #$03				; $8cfd: 29 03
	ASL					 ; $8cff: 0A
	TAY					 ; $8d00: A8
	JSR $8d06			   ; $8d01: 20 06 8D
	INX					 ; $8d04: E8
	INY					 ; $8d05: C8
	LDA $0508			   ; $8d06: AD 08 05
	CLC					 ; $8d09: 18
	ADC $8d1d,X			 ; $8d0a: 7D 1D 8D
	STA $0508			   ; $8d0d: 8D 08 05
	LDA $0509			   ; $8d10: AD 09 05
	CLC					 ; $8d13: 18
	ADC $8d1d,Y			 ; $8d14: 79 1D 8D
	STA $0509			   ; $8d17: 8D 09 05
	JMP $ff74			   ; $8d1a: 4C 74 FF
	BRK					 ; $8d1d: 00
	BRK					 ; $8d1e: 00
	ORA ($ff,X)			 ; $8d1f: 01 FF
	.db $02			; $8d21
	INC $fc04,X			 ; $8d22: FE 04 FC
	RTS					 ; $8d25: 60
	LDA $65				 ; $8d26: A5 65
	CMP #$03				; $8d28: C9 03
	BNE $8d68			   ; $8d2a: D0 3C
	LDA $3c				 ; $8d2c: A5 3C
	AND #$02				; $8d2e: 29 02
	TAX					 ; $8d30: AA
	LDA $8d69,X			 ; $8d31: BD 69 8D
	STA tmp2				; $8d34: 85 02
	LDA $8d6a,X			 ; $8d36: BD 6A 8D
	STA tmp3				; $8d39: 85 03
	LDA $7500			   ; $8d3b: AD 00 75
	STA tmp0				; $8d3e: 85 00
	LDA #$08				; $8d40: A9 08
	STA ptr0_lo			 ; $8d42: 85 04
	ASL tmp0				; $8d44: 06 00
	ROL ptr0_lo			 ; $8d46: 26 04
	ASL tmp0				; $8d48: 06 00
	ROL ptr0_lo			 ; $8d4a: 26 04
	ASL tmp0				; $8d4c: 06 00
	ROL ptr0_lo			 ; $8d4e: 26 04
	ASL tmp0				; $8d50: 06 00
	ROL ptr0_lo			 ; $8d52: 26 04
	LDY #$00				; $8d54: A0 00
	JSR $8cac			   ; $8d56: 20 AC 8C
	JSR $8cac			   ; $8d59: 20 AC 8C
	JSR $8cac			   ; $8d5c: 20 AC 8C
	JSR $8cac			   ; $8d5f: 20 AC 8C
	LDA system_flags		; $8d62: A5 1F
	ORA #$20				; $8d64: 09 20
	STA system_flags		; $8d66: 85 1F
	RTS					 ; $8d68: 60
	ADC $ad8d			   ; $8d69: 6D 8D AD
	STA $0200			   ; $8d6c: 8D 00 02
	RTI					 ; $8d6f: 40
	BRK					 ; $8d70: 00
	PHP					 ; $8d71: 08
	BRK					 ; $8d72: 00
	BRK					 ; $8d73: 00
	.db $02			; $8d74
	BRK					 ; $8d75: 00
	BRK					 ; $8d76: 00
	BRK					 ; $8d77: 00
	BRK					 ; $8d78: 00
	BRK					 ; $8d79: 00
	BRK					 ; $8d7a: 00
	BRK					 ; $8d7b: 00
	BRK					 ; $8d7c: 00
	BRK					 ; $8d7d: 00
	BIT tmp0				; $8d7e: 24 00
	BRK					 ; $8d80: 00
	RTI					 ; $8d81: 40
	.db $02			; $8d82
	BPL $8dc5			   ; $8d83: 10 40
	BRK					 ; $8d85: 00
	BRK					 ; $8d86: 00
	BRK					 ; $8d87: 00
	BRK					 ; $8d88: 00
	BRK					 ; $8d89: 00
	BRK					 ; $8d8a: 00
	BRK					 ; $8d8b: 00
	BRK					 ; $8d8c: 00
	PHP					 ; $8d8d: 08
	BPL $8d90			   ; $8d8e: 10 00
	BRK					 ; $8d90: 00
	BPL $8d93			   ; $8d91: 10 00
	.db $14			; $8d93
	BRK					 ; $8d94: 00
	BRK					 ; $8d95: 00
	BRK					 ; $8d96: 00
	BRK					 ; $8d97: 00
	BRK					 ; $8d98: 00
	BRK					 ; $8d99: 00
	BRK					 ; $8d9a: 00
	BRK					 ; $8d9b: 00
	BRK					 ; $8d9c: 00
	BRK					 ; $8d9d: 00
	JSR $8009			   ; $8d9e: 20 09 80
	BRK					 ; $8da1: 00
	RTI					 ; $8da2: 40
	.db $02			; $8da3
	BPL $8da6			   ; $8da4: 10 00
	BRK					 ; $8da6: 00
	BRK					 ; $8da7: 00
	BRK					 ; $8da8: 00
	BRK					 ; $8da9: 00
	BRK					 ; $8daa: 00
	BRK					 ; $8dab: 00
	BRK					 ; $8dac: 00
	.db $80			; $8dad
	BRK					 ; $8dae: 00
	.db $04			; $8daf
	JSR $0280			   ; $8db0: 20 80 02
	BRK					 ; $8db3: 00
	.db $04			; $8db4
	BRK					 ; $8db5: 00
	BRK					 ; $8db6: 00
	BRK					 ; $8db7: 00
	BRK					 ; $8db8: 00
	BRK					 ; $8db9: 00
	BRK					 ; $8dba: 00
	BRK					 ; $8dbb: 00
	BRK					 ; $8dbc: 00
	RTI					 ; $8dbd: 40
	BRK					 ; $8dbe: 00
	.db $02			; $8dbf
	JSR $0001			   ; $8dc0: 20 01 00
	RTI					 ; $8dc3: 40
	ORA (tmp0,X)			; $8dc4: 01 00
	BRK					 ; $8dc6: 00
	BRK					 ; $8dc7: 00
	BRK					 ; $8dc8: 00
	BRK					 ; $8dc9: 00
	BRK					 ; $8dca: 00
	BRK					 ; $8dcb: 00
	BRK					 ; $8dcc: 00
	BRK					 ; $8dcd: 00
	JSR $0004			   ; $8dce: 20 04 00
	.db $80			; $8dd1
	.db $02			; $8dd2
	BRK					 ; $8dd3: 00
	PHP					 ; $8dd4: 08
	BRK					 ; $8dd5: 00
	BRK					 ; $8dd6: 00
	BRK					 ; $8dd7: 00
	BRK					 ; $8dd8: 00
	BRK					 ; $8dd9: 00
	BRK					 ; $8dda: 00
	BRK					 ; $8ddb: 00
	BRK					 ; $8ddc: 00
	BRK					 ; $8ddd: 00
	DEY					 ; $8dde: 88
	BRK					 ; $8ddf: 00
	AND (tmp0,X)			; $8de0: 21 00
	BRK					 ; $8de2: 00
	RTI					 ; $8de3: 40
	ASL					 ; $8de4: 0A
	BRK					 ; $8de5: 00
	BRK					 ; $8de6: 00
	BRK					 ; $8de7: 00
	BRK					 ; $8de8: 00
	BRK					 ; $8de9: 00
	BRK					 ; $8dea: 00
	BRK					 ; $8deb: 00
	BRK					 ; $8dec: 00
	LDA $65				 ; $8ded: A5 65
	PHA					 ; $8def: 48
	LDA #$00				; $8df0: A9 00
	STA $65				 ; $8df2: 85 65
	JSR $c5c5			   ; $8df4: 20 C5 C5
	JSR $c54e			   ; $8df7: 20 4E C5
	JSR $8ea9			   ; $8dfa: 20 A9 8E
	JSR $8ec4			   ; $8dfd: 20 C4 8E
	JSR $c5af			   ; $8e00: 20 AF C5
	JSR $8e68			   ; $8e03: 20 68 8E
	JSR $8e91			   ; $8e06: 20 91 8E
	JSR $8ee0			   ; $8e09: 20 E0 8E
	JSR $c58f			   ; $8e0c: 20 8F C5
	JSR $c5bf			   ; $8e0f: 20 BF C5
	JSR $8e50			   ; $8e12: 20 50 8E
	JSR $c02e			   ; $8e15: 20 2E C0
	PLA					 ; $8e18: 68
	PHA					 ; $8e19: 48
	JSR $8ef9			   ; $8e1a: 20 F9 8E
	JSR $c8cc			   ; $8e1d: 20 CC C8
	JSR $c5c5			   ; $8e20: 20 C5 C5
	BRK					 ; $8e23: 00
	PHP					 ; $8e24: 08
	.db $8f			; $8e25
	JSR $c5af			   ; $8e26: 20 AF C5
	PLA					 ; $8e29: 68
	STA $65				 ; $8e2a: 85 65
	LDA $28				 ; $8e2c: A5 28
	BRK					 ; $8e2e: 00
	.db $02			; $8e2f
	.db $87			; $8e30
	LDA $41				 ; $8e31: A5 41
	BMI $8e38			   ; $8e33: 30 03
	BRK					 ; $8e35: 00
	ROL					 ; $8e36: 2A
	.db $ef			; $8e37
	LDA $0572			   ; $8e38: AD 72 05
	BRK					 ; $8e3b: 00
	ORA ($87),Y			 ; $8e3c: 11 87
	BRK					 ; $8e3e: 00
	.db $07			; $8e3f
	.db $87			; $8e40
	LDX #$00				; $8e41: A2 00
	BRK					 ; $8e43: 00
	.db $23			; $8e44
	.db $ef			; $8e45
	BRK					 ; $8e46: 00
	.db $0b			; $8e47
	.db $87			; $8e48
	BRK					 ; $8e49: 00
	.db $03			; $8e4a
	.db $ef			; $8e4b
	JSR $c5bf			   ; $8e4c: 20 BF C5
	RTS					 ; $8e4f: 60
	LDA #$00				; $8e50: A9 00
	STA $7d				 ; $8e52: 85 7D
	STA $7e				 ; $8e54: 85 7E
	STA $7f				 ; $8e56: 85 7F
	STA $82				 ; $8e58: 85 82
	STA $0302			   ; $8e5a: 8D 02 03
	LDA #$90				; $8e5d: A9 90
	STA $0300			   ; $8e5f: 8D 00 03
	LDA #$80				; $8e62: A9 80
	STA $0301			   ; $8e64: 8D 01 03
	RTS					 ; $8e67: 60
	LDA $2002			   ; $8e68: AD 02 20
	LDY #$00				; $8e6b: A0 00
	LDX #$10				; $8e6d: A2 10
	LDA $51				 ; $8e6f: A5 51
	STA $2006			   ; $8e71: 8D 06 20
	LDA $52				 ; $8e74: A5 52
	STA $2006			   ; $8e76: 8D 06 20
	STY $2007			   ; $8e79: 8C 07 20
	INY					 ; $8e7c: C8
	TYA					 ; $8e7d: 98
	AND #$0f				; $8e7e: 29 0F
	BNE $8e79			   ; $8e80: D0 F7
	LDA $52				 ; $8e82: A5 52
	CLC					 ; $8e84: 18
	ADC #$20				; $8e85: 69 20
	STA $52				 ; $8e87: 85 52
	BCC $8e8d			   ; $8e89: 90 02
	INC $51				 ; $8e8b: E6 51
	DEX					 ; $8e8d: CA
	BNE $8e6f			   ; $8e8e: D0 DF
	RTS					 ; $8e90: 60
	LDA $2002			   ; $8e91: AD 02 20
	LDY #$10				; $8e94: A0 10
	STY $2006			   ; $8e96: 8C 06 20
	LDA #$00				; $8e99: A9 00
	STA $2006			   ; $8e9b: 8D 06 20
	TAX					 ; $8e9e: AA
	STA $2007			   ; $8e9f: 8D 07 20
	DEX					 ; $8ea2: CA
	BNE $8e9f			   ; $8ea3: D0 FA
	DEY					 ; $8ea5: 88
	BNE $8e9f			   ; $8ea6: D0 F7
	RTS					 ; $8ea8: 60
	LDA #$00				; $8ea9: A9 00
	STA $0508			   ; $8eab: 8D 08 05
	STA $0509			   ; $8eae: 8D 09 05
	LDA $0505			   ; $8eb1: AD 05 05
	AND #$fe				; $8eb4: 29 FE
	STA $0505			   ; $8eb6: 8D 05 05
	LDA #$20				; $8eb9: A9 20
	STA $51				 ; $8ebb: 85 51
	LDA #$e8				; $8ebd: A9 E8
	STA $52				 ; $8ebf: 85 52
	JMP $ff74			   ; $8ec1: 4C 74 FF
	LDX #$03				; $8ec4: A2 03
	LDA $8ed8,X			 ; $8ec6: BD D8 8E
	STA $05fc,X			 ; $8ec9: 9D FC 05
	LDA $8edc,X			 ; $8ecc: BD DC 8E
	STA $0609,X			 ; $8ecf: 9D 09 06
	DEX					 ; $8ed2: CA
	BPL $8ec6			   ; $8ed3: 10 F1
	JMP $c5b9			   ; $8ed5: 4C B9 C5
	.db $12			; $8ed8
	SEC					 ; $8ed9: 38
	ROL					 ; $8eda: 2A
	BPL $8f0d			   ; $8edb: 10 30
	.db $0f			; $8edd
	.db $0f			; $8ede
	.db $0f			; $8edf
	LDA $2002			   ; $8ee0: AD 02 20
	LDA #$00				; $8ee3: A9 00
	STA $2006			   ; $8ee5: 8D 06 20
	STA $2006			   ; $8ee8: 8D 06 20
	LDX #$00				; $8eeb: A2 00
	LDA $8f32,X			 ; $8eed: BD 32 8F
	STA $2007			   ; $8ef0: 8D 07 20
	INX					 ; $8ef3: E8
	CPX #$20				; $8ef4: E0 20
	BNE $8eed			   ; $8ef6: D0 F5
	RTS					 ; $8ef8: 60
	BNE $8f15			   ; $8ef9: D0 1A
	LDA $42				 ; $8efb: A5 42
	LSR					 ; $8efd: 4A
	CLC					 ; $8efe: 18
	ADC #$40				; $8eff: 69 40
	STA $0207			   ; $8f01: 8D 07 02
	LDA $43				 ; $8f04: A5 43
	LSR					 ; $8f06: 4A
	CLC					 ; $8f07: 18
	ADC #$37				; $8f08: 69 37
	STA $0204			   ; $8f0a: 8D 04 02
	LDA #$00				; $8f0d: A9 00
	STA $0205			   ; $8f0f: 8D 05 02
	STA $0206			   ; $8f12: 8D 06 02
	LDA #$e3				; $8f15: A9 E3
	LSR					 ; $8f17: 4A
	CLC					 ; $8f18: 18
	ADC #$3e				; $8f19: 69 3E
	STA $0203			   ; $8f1b: 8D 03 02
	LDA #$8f				; $8f1e: A9 8F
	LSR					 ; $8f20: 4A
	CLC					 ; $8f21: 18
	ADC #$35				; $8f22: 69 35
	STA $0200			   ; $8f24: 8D 00 02
	LDA #$01				; $8f27: A9 01
	STA $0201			   ; $8f29: 8D 01 02
	LDA #$00				; $8f2c: A9 00
	STA $0202			   ; $8f2e: 8D 02 02
	RTS					 ; $8f31: 60
	.db $fc			; $8f32
	DEY					 ; $8f33: 88
	DEY					 ; $8f34: 88
	STY $e2				 ; $8f35: 84 E2
	STA ($0a),Y			 ; $8f37: 91 0A
	.db $04			; $8f39
	BRK					 ; $8f3a: 00
	BVS $8fad			   ; $8f3b: 70 70
	SEI					 ; $8f3d: 78
	.db $1c			; $8f3e
	ASL $0004			   ; $8f3f: 0E 04 00
	.db $c3			; $8f42
	LDA $5a				 ; $8f43: A5 5A
	BIT $24				 ; $8f45: 24 24
	.db $5a			; $8f47
	LDA $c3				 ; $8f48: A5 C3
	BRK					 ; $8f4a: 00
	.db $42			; $8f4b
	BIT $18				 ; $8f4c: 24 18
	CLC					 ; $8f4e: 18
	BIT $42				 ; $8f4f: 24 42
	BRK					 ; $8f51: 00
	JSR $8f5f			   ; $8f52: 20 5F 8F
	JSR $9073			   ; $8f55: 20 73 90
	JSR $ff74			   ; $8f58: 20 74 FF
	JSR $8f6a			   ; $8f5b: 20 6A 8F
	RTS					 ; $8f5e: 60
	JSR $902f			   ; $8f5f: 20 2F 90
	LDX #$99				; $8f62: A2 99
	LDY #$90				; $8f64: A0 90
	JSR $9062			   ; $8f66: 20 62 90
	RTS					 ; $8f69: 60
	JSR $90b2			   ; $8f6a: 20 B2 90
	JSR $908c			   ; $8f6d: 20 8C 90
	JSR $8fc3			   ; $8f70: 20 C3 8F
	JSR $8f85			   ; $8f73: 20 85 8F
	JSR $8fc2			   ; $8f76: 20 C2 8F
	JSR $8fd3			   ; $8f79: 20 D3 8F
	JSR $ff74			   ; $8f7c: 20 74 FF
	JSR $9021			   ; $8f7f: 20 21 90
	JMP $8f6a			   ; $8f82: 4C 6A 8F
	LDY #$01				; $8f85: A0 01
	LDX #$00				; $8f87: A2 00
	LDA $7f00,X			 ; $8f89: BD 00 7F
	STA $2005			   ; $8f8c: 8D 05 20
	LDA $0509			   ; $8f8f: AD 09 05
	STA $2005			   ; $8f92: 8D 05 20
	TXA					 ; $8f95: 8A
	PHA					 ; $8f96: 48
	LDX #$0c				; $8f97: A2 0C
	DEX					 ; $8f99: CA
	BNE $8f99			   ; $8f9a: D0 FD
	AND tmp0				; $8f9c: 25 00
	PLA					 ; $8f9e: 68
	TAX					 ; $8f9f: AA
	INX					 ; $8fa0: E8
	TXA					 ; $8fa1: 8A
	AND #$07				; $8fa2: 29 07
	BNE $8fa8			   ; $8fa4: D0 02
	BEQ $8fb0			   ; $8fa6: F0 08
	NOP					 ; $8fa8: EA
	NOP					 ; $8fa9: EA
	NOP					 ; $8faa: EA
	AND tmp0				; $8fab: 25 00
	JMP $8f89			   ; $8fad: 4C 89 8F
	AND tmp0				; $8fb0: 25 00
	AND tmp0				; $8fb2: 25 00
	AND tmp0				; $8fb4: 25 00
	AND tmp0				; $8fb6: 25 00
	NOP					 ; $8fb8: EA
	NOP					 ; $8fb9: EA
	CPX #$40				; $8fba: E0 40
	BNE $8f89			   ; $8fbc: D0 CB
	DEY					 ; $8fbe: 88
	BNE $8f87			   ; $8fbf: D0 C6
	RTS					 ; $8fc1: 60
	RTS					 ; $8fc2: 60
	LDY #$05				; $8fc3: A0 05
	LDX #$00				; $8fc5: A2 00
	DEX					 ; $8fc7: CA
	BNE $8fc7			   ; $8fc8: D0 FD
	DEY					 ; $8fca: 88
	BNE $8fc7			   ; $8fcb: D0 FA
	BIT $2002			   ; $8fcd: 2C 02 20
	BVC $8fcd			   ; $8fd0: 50 FB
	RTS					 ; $8fd2: 60
	LDA $53				 ; $8fd3: A5 53
	CMP #$20				; $8fd5: C9 20
	BCC $9020			   ; $8fd7: 90 47
	SBC #$20				; $8fd9: E9 20
	LSR					 ; $8fdb: 4A
	CLC					 ; $8fdc: 18
	ADC #$01				; $8fdd: 69 01
	ASL					 ; $8fdf: 0A
	ASL					 ; $8fe0: 0A
	ASL					 ; $8fe1: 0A
	ASL					 ; $8fe2: 0A
	STA $54				 ; $8fe3: 85 54
	LDX #$00				; $8fe5: A2 00
	LDA #$bf				; $8fe7: A9 BF
	STA $0300,X			 ; $8fe9: 9D 00 03
	LDA #$20				; $8fec: A9 20
	STA $0301,X			 ; $8fee: 9D 01 03
	LDA #$00				; $8ff1: A9 00
	STA $0302,X			 ; $8ff3: 9D 02 03
	LDY #$01				; $8ff6: A0 01
	TXA					 ; $8ff8: 8A
	AND #$03				; $8ff9: 29 03
	BEQ $9009			   ; $8ffb: F0 0C
	LDA $05fc,Y			 ; $8ffd: B9 FC 05
	SEC					 ; $9000: 38
	SBC $54				 ; $9001: E5 54
	CMP #$40				; $9003: C9 40
	BCC $900d			   ; $9005: 90 06
	BCS $900a			   ; $9007: B0 01
	DEY					 ; $9009: 88
	LDA $05fc			   ; $900a: AD FC 05
	STA $0303,X			 ; $900d: 9D 03 03
	INX					 ; $9010: E8
	INY					 ; $9011: C8
	CPY #$20				; $9012: C0 20
	BCC $8ff8			   ; $9014: 90 E2
	INC $050b			   ; $9016: EE 0B 05
	LDA system_flags		; $9019: A5 1F
	ORA #$20				; $901b: 09 20
	STA system_flags		; $901d: 85 1F
	RTS					 ; $901f: 60
	RTS					 ; $9020: 60
	LDA $53				 ; $9021: A5 53
	CMP #$28				; $9023: C9 28
	BCC $902e			   ; $9025: 90 07
	LDA $51				 ; $9027: A5 51
	STA $059d			   ; $9029: 8D 9D 05
	PLA					 ; $902c: 68
	PLA					 ; $902d: 68
	RTS					 ; $902e: 60
	LDX #$00				; $902f: A2 00
	LDA #$80				; $9031: A9 80
	STA $0300,X			 ; $9033: 9D 00 03
	LDA #$10				; $9036: A9 10
	STA $0301,X			 ; $9038: 9D 01 03
	LDA #$00				; $903b: A9 00
	STA $0302,X			 ; $903d: 9D 02 03
	LDA $9052,X			 ; $9040: BD 52 90
	STA $0303,X			 ; $9043: 9D 03 03
	INX					 ; $9046: E8
	CPX #$10				; $9047: E0 10
	BCC $9040			   ; $9049: 90 F5
	INC $050b			   ; $904b: EE 0B 05
	JSR $c62d			   ; $904e: 20 2D C6
	RTS					 ; $9051: 60
	.db $ff			; $9052
	.db $ff			; $9053
	BRK					 ; $9054: 00
	BRK					 ; $9055: 00
	BRK					 ; $9056: 00
	BRK					 ; $9057: 00
	BRK					 ; $9058: 00
	BRK					 ; $9059: 00
	.db $ff			; $905a
	.db $ff			; $905b
	BRK					 ; $905c: 00
	BRK					 ; $905d: 00
	BRK					 ; $905e: 00
	BRK					 ; $905f: 00
	BRK					 ; $9060: 00
	BRK					 ; $9061: 00
	STY $0200			   ; $9062: 8C 00 02
	LDA #$00				; $9065: A9 00
	STA $0201			   ; $9067: 8D 01 02
	LDA #$20				; $906a: A9 20
	STA $0202			   ; $906c: 8D 02 02
	STX $0203			   ; $906f: 8E 03 02
	RTS					 ; $9072: 60
	LDA #$00				; $9073: A9 00
	STA $51				 ; $9075: 85 51
	STA $52				 ; $9077: 85 52
	STA $53				 ; $9079: 85 53
	LDX #$3f				; $907b: A2 3F
	LDA $0508			   ; $907d: AD 08 05
	STA $7f00,X			 ; $9080: 9D 00 7F
	LDA #$00				; $9083: A9 00
	STA $7f40,X			 ; $9085: 9D 40 7F
	DEX					 ; $9088: CA
	BPL $907d			   ; $9089: 10 F2
	RTS					 ; $908b: 60
	LDX #$00				; $908c: A2 00
	LDA $7f00,X			 ; $908e: BD 00 7F
	PHA					 ; $9091: 48
	LDA $7f40,X			 ; $9092: BD 40 7F
	PHA					 ; $9095: 48
	LDA $7f01,X			 ; $9096: BD 01 7F
	STA $7f00,X			 ; $9099: 9D 00 7F
	LDA $7f41,X			 ; $909c: BD 41 7F
	STA $7f40,X			 ; $909f: 9D 40 7F
	INX					 ; $90a2: E8
	CPX #$40				; $90a3: E0 40
	BCC $9096			   ; $90a5: 90 EF
	PLA					 ; $90a7: 68
	STA $7f7f			   ; $90a8: 8D 7F 7F
	PLA					 ; $90ab: 68
	STA $7f3f			   ; $90ac: 8D 3F 7F
	DEC $51				 ; $90af: C6 51
	RTS					 ; $90b1: 60
	INC $52				 ; $90b2: E6 52
	LDA $52				 ; $90b4: A5 52
	AND #$07				; $90b6: 29 07
	BNE $90e1			   ; $90b8: D0 27
	LDA $51				 ; $90ba: A5 51
	AND #$3f				; $90bc: 29 3F
	TAY					 ; $90be: A8
	LDX #$00				; $90bf: A2 00
	LDA $7f40,Y			 ; $90c1: B9 40 7F
	CLC					 ; $90c4: 18
	ADC $90ef,X			 ; $90c5: 7D EF 90
	STA $7f40,Y			 ; $90c8: 99 40 7F
	LDA $7f00,Y			 ; $90cb: B9 00 7F
	ADC $912f,X			 ; $90ce: 7D 2F 91
	STA $7f00,Y			 ; $90d1: 99 00 7F
	INY					 ; $90d4: C8
	TYA					 ; $90d5: 98
	AND #$3f				; $90d6: 29 3F
	TAY					 ; $90d8: A8
	INX					 ; $90d9: E8
	CPX #$40				; $90da: E0 40
	BCC $90c1			   ; $90dc: 90 E3
	INC $53				 ; $90de: E6 53
	RTS					 ; $90e0: 60
	AND tmp0				; $90e1: 25 00
	NOP					 ; $90e3: EA
	NOP					 ; $90e4: EA
	LDX #$00				; $90e5: A2 00
	AND tmp0				; $90e7: 25 00
	NOP					 ; $90e9: EA
	NOP					 ; $90ea: EA
	DEX					 ; $90eb: CA
	BNE $90e7			   ; $90ec: D0 F9
	RTS					 ; $90ee: 60
	BRK					 ; $90ef: 00
	BMI $9152			   ; $90f0: 30 60
	.db $80			; $90f2
	BCS $90d5			   ; $90f3: B0 E0
	BPL $9127			   ; $90f5: 10 30
	BVC $9169			   ; $90f7: 50 70
	BCC $90ab			   ; $90f9: 90 B0
	CPY #$d0				; $90fb: C0 D0
	CPX #$e0				; $90fd: E0 E0
	BEQ $90e1			   ; $90ff: F0 E0
	CPX #$d0				; $9101: E0 D0
	CPY #$b0				; $9103: C0 B0
	BCC $9177			   ; $9105: 90 70
	BVC $9139			   ; $9107: 50 30
	BPL $90eb			   ; $9109: 10 E0
	BCS $908d			   ; $910b: B0 80
	RTS					 ; $910d: 60
	BMI $9110			   ; $910e: 30 00
	BNE $90b2			   ; $9110: D0 A0
	.db $80			; $9112
	BVC $9135			   ; $9113: 50 20
	BEQ $90e7			   ; $9115: F0 D0
	BCS $90a9			   ; $9117: B0 90
	BVS $916b			   ; $9119: 70 50
	RTI					 ; $911b: 40
	BMI $913e			   ; $911c: 30 20
	JSR $2010			   ; $911e: 20 10 20
	JSR $4030			   ; $9121: 20 30 40
	BVC $9196			   ; $9124: 50 70
	BCC $90d8			   ; $9126: 90 B0
	BNE $911a			   ; $9128: D0 F0
	JSR $8050			   ; $912a: 20 50 80
	LDY #$d0				; $912d: A0 D0
	BRK					 ; $912f: 00
	BRK					 ; $9130: 00
	BRK					 ; $9131: 00
	BRK					 ; $9132: 00
	BRK					 ; $9133: 00
	BRK					 ; $9134: 00
	ORA (tmp1,X)			; $9135: 01 01
	ORA (tmp1,X)			; $9137: 01 01
	ORA (tmp1,X)			; $9139: 01 01
	ORA (tmp1,X)			; $913b: 01 01
	ORA (tmp1,X)			; $913d: 01 01
	ORA (tmp1,X)			; $913f: 01 01
	ORA (tmp1,X)			; $9141: 01 01
	ORA (tmp1,X)			; $9143: 01 01
	ORA (tmp1,X)			; $9145: 01 01
	ORA (tmp1,X)			; $9147: 01 01
	ORA (tmp0,X)			; $9149: 01 00
	BRK					 ; $914b: 00
	BRK					 ; $914c: 00
	BRK					 ; $914d: 00
	BRK					 ; $914e: 00
	BRK					 ; $914f: 00
	.db $ff			; $9150
	.db $ff			; $9151
	.db $ff			; $9152
	.db $ff			; $9153
	.db $ff			; $9154
	INC $fefe,X			 ; $9155: FE FE FE
	INC $fefe,X			 ; $9158: FE FE FE
	INC $fefe,X			 ; $915b: FE FE FE
	INC $fefe,X			 ; $915e: FE FE FE
	INC $fefe,X			 ; $9161: FE FE FE
	INC $fefe,X			 ; $9164: FE FE FE
	INC $fefe,X			 ; $9167: FE FE FE
	.db $ff			; $916a
	.db $ff			; $916b
	.db $ff			; $916c
	.db $ff			; $916d
	.db $ff			; $916e
	.db $bf			; $916f
	CMP $cb				 ; $9170: C5 CB
	CMP ($d7),Y			 ; $9172: D1 D7
	CMP $efe6,X			 ; $9174: DD E6 EF
	SED					 ; $9177: F8
	INC $1007,X			 ; $9178: FE 07 10
	ORA $2822,Y			 ; $917b: 19 22 28
	AND ($3a),Y			 ; $917e: 31 3A
	.db $43			; $9180
	EOR #$4f				; $9181: 49 4F
	EOR $5b,X			   ; $9183: 55 5B
	ADC ($64,X)			 ; $9185: 61 64
	.db $67			; $9187
	ROR					 ; $9188: 6A
	ROR					 ; $9189: 6A
	LDY $b6b9,X			 ; $918a: BC B9 B6
	LDX $20,Y			   ; $918d: B6 20
	CPY $91				 ; $918f: C4 91
	JSR $91b9			   ; $9191: 20 B9 91
	JSR $919b			   ; $9194: 20 9B 91
	JSR $91ae			   ; $9197: 20 AE 91
	RTS					 ; $919a: 60
	LDA #$20				; $919b: A9 20
	STA tmp0				; $919d: 85 00
	LDA #$00				; $919f: A9 00
	STA tmp1				; $91a1: 85 01
	LDY #$00				; $91a3: A0 00
	JSR $91f0			   ; $91a5: 20 F0 91
	INY					 ; $91a8: C8
	CPY #$0f				; $91a9: C0 0F
	BCC $91a5			   ; $91ab: 90 F8
	RTS					 ; $91ad: 60
	LDY #$0e				; $91ae: A0 0E
	JSR $91f0			   ; $91b0: 20 F0 91
	DEY					 ; $91b3: 88
	CPY #$ff				; $91b4: C0 FF
	BNE $91b0			   ; $91b6: D0 F8
	RTS					 ; $91b8: 60
	LDY #$0e				; $91b9: A0 0E
	JSR $91d7			   ; $91bb: 20 D7 91
	DEY					 ; $91be: 88
	CPY #$ff				; $91bf: C0 FF
	BNE $91bb			   ; $91c1: D0 F8
	RTS					 ; $91c3: 60
	LDA #$24				; $91c4: A9 24
	STA tmp0				; $91c6: 85 00
	LDA #$0e				; $91c8: A9 0E
	STA tmp1				; $91ca: 85 01
	LDY #$00				; $91cc: A0 00
	JSR $91d7			   ; $91ce: 20 D7 91
	INY					 ; $91d1: C8
	CPY #$0f				; $91d2: C0 0F
	BCC $91ce			   ; $91d4: 90 F8
	RTS					 ; $91d6: 60
	LDA tmp0				; $91d7: A5 00
	STA $2006			   ; $91d9: 8D 06 20
	LDA tmp1				; $91dc: A5 01
	STA $2006			   ; $91de: 8D 06 20
	JSR $91f6			   ; $91e1: 20 F6 91
	LDA tmp1				; $91e4: A5 01
	CLC					 ; $91e6: 18
	ADC #$20				; $91e7: 69 20
	STA tmp1				; $91e9: 85 01
	BCC $91ef			   ; $91eb: 90 02
	INC tmp0				; $91ed: E6 00
	RTS					 ; $91ef: 60
	JSR $9204			   ; $91f0: 20 04 92
	JMP $91e4			   ; $91f3: 4C E4 91
	LDX $921b,Y			 ; $91f6: BE 1B 92
	BEQ $9203			   ; $91f9: F0 08
	LDA #$00				; $91fb: A9 00
	STA $2007			   ; $91fd: 8D 07 20
	DEX					 ; $9200: CA
	BNE $91fd			   ; $9201: D0 FA
	RTS					 ; $9203: 60
	LDA #$12				; $9204: A9 12
	SEC					 ; $9206: 38
	SBC $921b,Y			 ; $9207: F9 1B 92
	CLC					 ; $920a: 18
	ADC tmp1				; $920b: 65 01
	PHA					 ; $920d: 48
	LDA tmp0				; $920e: A5 00
	STA $2006			   ; $9210: 8D 06 20
	PLA					 ; $9213: 68
	STA $2006			   ; $9214: 8D 06 20
	JMP $91f6			   ; $9217: 4C F6 91
	RTS					 ; $921a: 60
	.db $12			; $921b
	.db $12			; $921c
	.db $12			; $921d
	.db $12			; $921e
	.db $0f			; $921f
	.db $0c			; $9220
	ASL					 ; $9221: 0A
	ORA #$08				; $9222: 09 08
	.db $07			; $9224
	ASL $06				 ; $9225: 06 06
	ORA ptr0_hi			 ; $9227: 05 05
	.db $04			; $9229
	JSR $93ca			   ; $922a: 20 CA 93
	JSR $c543			   ; $922d: 20 43 C5
	JSR $ff74			   ; $9230: 20 74 FF
	JSR $9240			   ; $9233: 20 40 92
	JSR $925c			   ; $9236: 20 5C 92
	JSR $924d			   ; $9239: 20 4D 92
	BRK					 ; $923c: 00
	ASL					 ; $923d: 0A
	.db $6f			; $923e
	RTS					 ; $923f: 60
	LDA $925a			   ; $9240: AD 5A 92
	STA $0503			   ; $9243: 8D 03 05
	LDA $925b			   ; $9246: AD 5B 92
	STA $0504			   ; $9249: 8D 04 05
	RTS					 ; $924c: 60
	LDA $c0d2			   ; $924d: AD D2 C0
	STA $0503			   ; $9250: 8D 03 05
	LDA $c0d3			   ; $9253: AD D3 C0
	STA $0504			   ; $9256: 8D 04 05
	RTS					 ; $9259: 60
	.db $73			; $925a
	.db $92			; $925b
	JSR $9282			   ; $925c: 20 82 92
	JSR $938d			   ; $925f: 20 8D 93
	JSR $908c			   ; $9262: 20 8C 90
	JSR $93f0			   ; $9265: 20 F0 93
	TSX					 ; $9268: BA
	STX $0f				 ; $9269: 86 0F
	LDY #$03				; $926b: A0 03
	JSR $8f87			   ; $926d: 20 87 8F
	JMP $9270			   ; $9270: 4C 70 92
	PLA					 ; $9273: 68
	PLA					 ; $9274: 68
	PLA					 ; $9275: 68
	LDX $0f				 ; $9276: A6 0F
	TXS					 ; $9278: 9A
	JSR $92b5			   ; $9279: 20 B5 92
	JSR $9021			   ; $927c: 20 21 90
	JMP $925c			   ; $927f: 4C 5C 92
	LDA $2002			   ; $9282: AD 02 20
	BMI $9282			   ; $9285: 30 FB
	LDA $2002			   ; $9287: AD 02 20
	BMI $9282			   ; $928a: 30 F6
	LDA $2002			   ; $928c: AD 02 20
	BMI $9282			   ; $928f: 30 F1
	LDA $2002			   ; $9291: AD 02 20
	BMI $9282			   ; $9294: 30 EC
	LDA $2002			   ; $9296: AD 02 20
	BMI $9282			   ; $9299: 30 E7
	LDA $2002			   ; $929b: AD 02 20
	BMI $9282			   ; $929e: 30 E2
	LDA $2002			   ; $92a0: AD 02 20
	BMI $9282			   ; $92a3: 30 DD
	LDA $2002			   ; $92a5: AD 02 20
	BMI $9282			   ; $92a8: 30 D8
	LDA $2002			   ; $92aa: AD 02 20
	BMI $9282			   ; $92ad: 30 D3
	LDA $2002			   ; $92af: AD 02 20
	BMI $9282			   ; $92b2: 30 CE
	RTS					 ; $92b4: 60
	LDA $2002			   ; $92b5: AD 02 20
	LDA #$3f				; $92b8: A9 3F
	STA $2006			   ; $92ba: 8D 06 20
	LDA #$00				; $92bd: A9 00
	STA $2006			   ; $92bf: 8D 06 20
	LDA $0300			   ; $92c2: AD 00 03
	STA $2007			   ; $92c5: 8D 07 20
	LDA $0301			   ; $92c8: AD 01 03
	STA $2007			   ; $92cb: 8D 07 20
	LDA $0302			   ; $92ce: AD 02 03
	STA $2007			   ; $92d1: 8D 07 20
	LDA $0303			   ; $92d4: AD 03 03
	STA $2007			   ; $92d7: 8D 07 20
	LDA $0304			   ; $92da: AD 04 03
	STA $2007			   ; $92dd: 8D 07 20
	LDA $0305			   ; $92e0: AD 05 03
	STA $2007			   ; $92e3: 8D 07 20
	LDA $0306			   ; $92e6: AD 06 03
	STA $2007			   ; $92e9: 8D 07 20
	LDA $0307			   ; $92ec: AD 07 03
	STA $2007			   ; $92ef: 8D 07 20
	LDA $0308			   ; $92f2: AD 08 03
	STA $2007			   ; $92f5: 8D 07 20
	LDA $0309			   ; $92f8: AD 09 03
	STA $2007			   ; $92fb: 8D 07 20
	LDA $030a			   ; $92fe: AD 0A 03
	STA $2007			   ; $9301: 8D 07 20
	LDA $030b			   ; $9304: AD 0B 03
	STA $2007			   ; $9307: 8D 07 20
	LDA $030c			   ; $930a: AD 0C 03
	STA $2007			   ; $930d: 8D 07 20
	LDA $030d			   ; $9310: AD 0D 03
	STA $2007			   ; $9313: 8D 07 20
	LDA $030e			   ; $9316: AD 0E 03
	STA $2007			   ; $9319: 8D 07 20
	LDA $030f			   ; $931c: AD 0F 03
	STA $2007			   ; $931f: 8D 07 20
	LDA $0310			   ; $9322: AD 10 03
	STA $2007			   ; $9325: 8D 07 20
	LDA $0311			   ; $9328: AD 11 03
	STA $2007			   ; $932b: 8D 07 20
	LDA $0312			   ; $932e: AD 12 03
	STA $2007			   ; $9331: 8D 07 20
	LDA $0313			   ; $9334: AD 13 03
	STA $2007			   ; $9337: 8D 07 20
	LDA $0314			   ; $933a: AD 14 03
	STA $2007			   ; $933d: 8D 07 20
	LDA $0315			   ; $9340: AD 15 03
	STA $2007			   ; $9343: 8D 07 20
	LDA $0316			   ; $9346: AD 16 03
	STA $2007			   ; $9349: 8D 07 20
	LDA $0317			   ; $934c: AD 17 03
	STA $2007			   ; $934f: 8D 07 20
	LDA $0318			   ; $9352: AD 18 03
	STA $2007			   ; $9355: 8D 07 20
	LDA $0319			   ; $9358: AD 19 03
	STA $2007			   ; $935b: 8D 07 20
	LDA $031a			   ; $935e: AD 1A 03
	STA $2007			   ; $9361: 8D 07 20
	LDA $031b			   ; $9364: AD 1B 03
	STA $2007			   ; $9367: 8D 07 20
	LDA $031c			   ; $936a: AD 1C 03
	STA $2007			   ; $936d: 8D 07 20
	LDA $031d			   ; $9370: AD 1D 03
	STA $2007			   ; $9373: 8D 07 20
	LDA $031e			   ; $9376: AD 1E 03
	STA $2007			   ; $9379: 8D 07 20
	LDA $031f			   ; $937c: AD 1F 03
	STA $2007			   ; $937f: 8D 07 20
	LDA #$80				; $9382: A9 80
	STA $2005			   ; $9384: 8D 05 20
	LDA #$00				; $9387: A9 00
	STA $2005			   ; $9389: 8D 05 20
	RTS					 ; $938c: 60
	INC $52				 ; $938d: E6 52
	LDA $52				 ; $938f: A5 52
	AND #$07				; $9391: 29 07
	BNE $93bc			   ; $9393: D0 27
	LDA $51				 ; $9395: A5 51
	AND #$3f				; $9397: 29 3F
	TAY					 ; $9399: A8
	LDX #$00				; $939a: A2 00
	LDA $7f40,Y			 ; $939c: B9 40 7F
	SEC					 ; $939f: 38
	SBC $90ef,X			 ; $93a0: FD EF 90
	STA $7f40,Y			 ; $93a3: 99 40 7F
	LDA $7f00,Y			 ; $93a6: B9 00 7F
	SBC $912f,X			 ; $93a9: FD 2F 91
	STA $7f00,Y			 ; $93ac: 99 00 7F
	INY					 ; $93af: C8
	TYA					 ; $93b0: 98
	AND #$3f				; $93b1: 29 3F
	TAY					 ; $93b3: A8
	INX					 ; $93b4: E8
	CPX #$40				; $93b5: E0 40
	BCC $939c			   ; $93b7: 90 E3
	INC $53				 ; $93b9: E6 53
	RTS					 ; $93bb: 60
	AND tmp0				; $93bc: 25 00
	NOP					 ; $93be: EA
	NOP					 ; $93bf: EA
	LDX #$00				; $93c0: A2 00
	AND tmp0				; $93c2: 25 00
	NOP					 ; $93c4: EA
	NOP					 ; $93c5: EA
	DEX					 ; $93c6: CA
	BNE $93c2			   ; $93c7: D0 F9
	RTS					 ; $93c9: 60
	LDA $059d			   ; $93ca: AD 9D 05
	STA $51				 ; $93cd: 85 51
	LDX #$00				; $93cf: A2 00
	STX $52				 ; $93d1: 86 52
	STX $53				 ; $93d3: 86 53
	LDY #$01				; $93d5: A0 01
	TXA					 ; $93d7: 8A
	AND #$03				; $93d8: 29 03
	BEQ $93e2			   ; $93da: F0 06
	LDA $05fc,Y			 ; $93dc: B9 FC 05
	JMP $93e6			   ; $93df: 4C E6 93
	DEY					 ; $93e2: 88
	LDA $05fc			   ; $93e3: AD FC 05
	STA $0300,X			 ; $93e6: 9D 00 03
	INX					 ; $93e9: E8
	INY					 ; $93ea: C8
	CPY #$20				; $93eb: C0 20
	BCC $93d7			   ; $93ed: 90 E8
	RTS					 ; $93ef: 60
	LDA $53				 ; $93f0: A5 53
	CMP #$08				; $93f2: C9 08
	BCS $9422			   ; $93f4: B0 2C
	LSR					 ; $93f6: 4A
	EOR #$03				; $93f7: 49 03
	ASL					 ; $93f9: 0A
	ASL					 ; $93fa: 0A
	ASL					 ; $93fb: 0A
	ASL					 ; $93fc: 0A
	STA $54				 ; $93fd: 85 54
	LDX #$00				; $93ff: A2 00
	LDY #$01				; $9401: A0 01
	TXA					 ; $9403: 8A
	AND #$03				; $9404: 29 03
	BEQ $9414			   ; $9406: F0 0C
	LDA $05fc,Y			 ; $9408: B9 FC 05
	SEC					 ; $940b: 38
	SBC $54				 ; $940c: E5 54
	CMP #$40				; $940e: C9 40
	BCC $9418			   ; $9410: 90 06
	BCS $9415			   ; $9412: B0 01
	DEY					 ; $9414: 88
	LDA $05fc			   ; $9415: AD FC 05
	STA $0300,X			 ; $9418: 9D 00 03
	INX					 ; $941b: E8
	INY					 ; $941c: C8
	CPY #$10				; $941d: C0 10
	BCC $9403			   ; $941f: 90 E2
	RTS					 ; $9421: 60
	RTS					 ; $9422: 60
	LDA #$00				; $9423: A9 00
	STA $059d			   ; $9425: 8D 9D 05
	JSR $9073			   ; $9428: 20 73 90
	JSR $93ca			   ; $942b: 20 CA 93
	JSR $c543			   ; $942e: 20 43 C5
	JSR $ff74			   ; $9431: 20 74 FF
	JSR $9441			   ; $9434: 20 41 94
	JSR $9450			   ; $9437: 20 50 94
	JSR $924d			   ; $943a: 20 4D 92
	BRK					 ; $943d: 00
	.db $0c			; $943e
	.db $bf			; $943f
	RTS					 ; $9440: 60
	LDA $944e			   ; $9441: AD 4E 94
	STA $0503			   ; $9444: 8D 03 05
	LDA $944f			   ; $9447: AD 4F 94
	STA $0504			   ; $944a: 8D 04 05
	RTS					 ; $944d: 60
	.db $67			; $944e
	STY $20,X			   ; $944f: 94 20
	.db $82			; $9451
	.db $92			; $9452
	JSR $90b2			   ; $9453: 20 B2 90
	JSR $908c			   ; $9456: 20 8C 90
	JSR $9476			   ; $9459: 20 76 94
	TSX					 ; $945c: BA
	STX $0f				 ; $945d: 86 0F
	LDY #$03				; $945f: A0 03
	JSR $8f87			   ; $9461: 20 87 8F
	JMP $9464			   ; $9464: 4C 64 94
	PLA					 ; $9467: 68
	PLA					 ; $9468: 68
	PLA					 ; $9469: 68
	LDX $0f				 ; $946a: A6 0F
	TXS					 ; $946c: 9A
	JSR $92b5			   ; $946d: 20 B5 92
	JSR $9021			   ; $9470: 20 21 90
	JMP $9450			   ; $9473: 4C 50 94
	LDA $53				 ; $9476: A5 53
	CMP #$20				; $9478: C9 20
	BCC $9483			   ; $947a: 90 07
	SBC #$20				; $947c: E9 20
	AND #$fe				; $947e: 29 FE
	JMP $93fa			   ; $9480: 4C FA 93
	RTS					 ; $9483: 60
	BRK					 ; $9484: 00
	ASL $cb,X			   ; $9485: 16 CB
	BPL $94a9			   ; $9487: 10 20
	ASL $96,X			   ; $9489: 16 96
	JSR $95b6			   ; $948b: 20 B6 95
	JSR $95af			   ; $948e: 20 AF 95
	JSR $95a2			   ; $9491: 20 A2 95
	JSR $9509			   ; $9494: 20 09 95
	JSR $9501			   ; $9497: 20 01 95
	JSR $94c4			   ; $949a: 20 C4 94
	JSR $94ac			   ; $949d: 20 AC 94
	LDX #$14				; $94a0: A2 14
	JSR $c90c			   ; $94a2: 20 0C C9
	LDA system_flags		; $94a5: A5 1F
	AND #$f7				; $94a7: 29 F7
	STA system_flags		; $94a9: 85 1F
	RTS					 ; $94ab: 60
	BRK					 ; $94ac: 00
	ROL $4b,X			   ; $94ad: 36 4B
	LDX #$06				; $94af: A2 06
	LDA $7000,X			 ; $94b1: BD 00 70
	AND #$fc				; $94b4: 29 FC
	ORA #$02				; $94b6: 09 02
	STA $7000,X			 ; $94b8: 9D 00 70
	JSR $d804			   ; $94bb: 20 04 D8
	BRK					 ; $94be: 00
	.db $37			; $94bf
	.db $4b			; $94c0
	JMP $d218			   ; $94c1: 4C 18 D2
	LDX #$08				; $94c4: A2 08
	LDA $7000,X			 ; $94c6: BD 00 70
	AND #$fc				; $94c9: 29 FC
	STA $7000,X			 ; $94cb: 9D 00 70
	JSR $d804			   ; $94ce: 20 04 D8
	BRK					 ; $94d1: 00
	.db $82			; $94d2
	.db $fb			; $94d3
	LDY #$0c				; $94d4: A0 0C
	TYA					 ; $94d6: 98
	PHA					 ; $94d7: 48
	LDX $7b				 ; $94d8: A6 7B
	INC $0200,X			 ; $94da: FE 00 02
	INC $0204,X			 ; $94dd: FE 04 02
	INC $0208,X			 ; $94e0: FE 08 02
	INC $020c,X			 ; $94e3: FE 0C 02
	JSR $960d			   ; $94e6: 20 0D 96
	LDX #$05				; $94e9: A2 05
	JSR $c90c			   ; $94eb: 20 0C C9
	PLA					 ; $94ee: 68
	TAY					 ; $94ef: A8
	DEY					 ; $94f0: 88
	BNE $94d6			   ; $94f1: D0 E3
	LDX #$06				; $94f3: A2 06
	LDA $7000,X			 ; $94f5: BD 00 70
	AND #$fc				; $94f8: 29 FC
	STA $7000,X			 ; $94fa: 9D 00 70
	JSR $d804			   ; $94fd: 20 04 D8
	RTS					 ; $9500: 60
	BRK					 ; $9501: 00
	.db $07			; $9502
	.db $6f			; $9503
	.db $43			; $9504
	BRK					 ; $9505: 00
	AND $4b,X			   ; $9506: 35 4B
	RTS					 ; $9508: 60
	LDY #$10				; $9509: A0 10
	LDX #$01				; $950b: A2 01
	JSR $958a			   ; $950d: 20 8A 95
	BRK					 ; $9510: 00
	.db $82			; $9511
	.db $fb			; $9512
	LDX $7b				 ; $9513: A6 7B
	LDA #$f7				; $9515: A9 F7
	STA $0200,X			 ; $9517: 9D 00 02
	STA $0204,X			 ; $951a: 9D 04 02
	STA $0208,X			 ; $951d: 9D 08 02
	STA $020c,X			 ; $9520: 9D 0C 02
	LDX #$b4				; $9523: A2 B4
	JSR $c90c			   ; $9525: 20 0C C9
	LDX #$09				; $9528: A2 09
	LDY #$08				; $952a: A0 08
	LDA $6fe0,X			 ; $952c: BD E0 6F
	STA $6fe0,Y			 ; $952f: 99 E0 6F
	LDX $7b				 ; $9532: A6 7B
	LDA #$37				; $9534: A9 37
	STA $0200,X			 ; $9536: 9D 00 02
	STA $0204,X			 ; $9539: 9D 04 02
	LDA #$3f				; $953c: A9 3F
	STA $0208,X			 ; $953e: 9D 08 02
	STA $020c,X			 ; $9541: 9D 0C 02
	LDA #$80				; $9544: A9 80
	STA $0203,X			 ; $9546: 9D 03 02
	STA $020b,X			 ; $9549: 9D 0B 02
	LDA #$88				; $954c: A9 88
	STA $0207,X			 ; $954e: 9D 07 02
	STA $020f,X			 ; $9551: 9D 0F 02
	LDX #$08				; $9554: A2 08
	LDA $7000,X			 ; $9556: BD 00 70
	AND #$fc				; $9559: 29 FC
	ORA #$02				; $955b: 09 02
	STA $7000,X			 ; $955d: 9D 00 70
	JSR $d804			   ; $9560: 20 04 D8
	BRK					 ; $9563: 00
	.db $82			; $9564
	.db $fb			; $9565
	LDY #$0c				; $9566: A0 0C
	LDX #$05				; $9568: A2 05
	JSR $958a			   ; $956a: 20 8A 95
	LDX #$08				; $956d: A2 08
	LDA $7000,X			 ; $956f: BD 00 70
	ORA #$03				; $9572: 09 03
	STA $7000,X			 ; $9574: 9D 00 70
	JSR $d804			   ; $9577: 20 04 D8
	LDX #$06				; $957a: A2 06
	LDA $7000,X			 ; $957c: BD 00 70
	AND #$fc				; $957f: 29 FC
	ORA #$01				; $9581: 09 01
	STA $7000,X			 ; $9583: 9D 00 70
	JSR $d804			   ; $9586: 20 04 D8
	RTS					 ; $9589: 60
	TYA					 ; $958a: 98
	PHA					 ; $958b: 48
	TXA					 ; $958c: 8A
	PHA					 ; $958d: 48
	JSR $95ec			   ; $958e: 20 EC 95
	JSR $960d			   ; $9591: 20 0D 96
	PLA					 ; $9594: 68
	PHA					 ; $9595: 48
	TAX					 ; $9596: AA
	JSR $c90c			   ; $9597: 20 0C C9
	PLA					 ; $959a: 68
	TAX					 ; $959b: AA
	PLA					 ; $959c: 68
	TAY					 ; $959d: A8
	DEY					 ; $959e: 88
	BNE $958a			   ; $959f: D0 E9
	RTS					 ; $95a1: 60
	LDX #$10				; $95a2: A2 10
	LDY #$08				; $95a4: A0 08
	LDA #$16				; $95a6: A9 16
	BRK					 ; $95a8: 00
	ORA #$ef				; $95a9: 09 EF
	JSR $ff74			   ; $95ab: 20 74 FF
	RTS					 ; $95ae: 60
	BRK					 ; $95af: 00
	AND #$fb				; $95b0: 29 FB
	BRK					 ; $95b2: 00
	.db $07			; $95b3
	.db $9f			; $95b4
	RTS					 ; $95b5: 60
	JSR $95c7			   ; $95b6: 20 C7 95
	JSR $95d8			   ; $95b9: 20 D8 95
	JSR $960d			   ; $95bc: 20 0D 96
	INC $51				 ; $95bf: E6 51
	JSR $ff74			   ; $95c1: 20 74 FF
	JMP $95b9			   ; $95c4: 4C B9 95
	LDA #$00				; $95c7: A9 00
	STA $51				 ; $95c9: 85 51
	LDX #$08				; $95cb: A2 08
	LDA $7000,X			 ; $95cd: BD 00 70
	AND #$3c				; $95d0: 29 3C
	JSR $c78c			   ; $95d2: 20 8C C7
	STY $7b				 ; $95d5: 84 7B
	RTS					 ; $95d7: 60
	LDA $51				 ; $95d8: A5 51
	CMP #$10				; $95da: C9 10
	BCC $95fb			   ; $95dc: 90 1D
	CMP #$40				; $95de: C9 40
	BCS $960a			   ; $95e0: B0 28
	LDX #$08				; $95e2: A2 08
	LDA $7000,X			 ; $95e4: BD 00 70
	AND #$fc				; $95e7: 29 FC
	STA $7000,X			 ; $95e9: 9D 00 70
	LDX $7b				 ; $95ec: A6 7B
	DEC $0200,X			 ; $95ee: DE 00 02
	DEC $0204,X			 ; $95f1: DE 04 02
	DEC $0208,X			 ; $95f4: DE 08 02
	DEC $020c,X			 ; $95f7: DE 0C 02
	RTS					 ; $95fa: 60
	LDX $7b				 ; $95fb: A6 7B
	INC $0203,X			 ; $95fd: FE 03 02
	INC $0207,X			 ; $9600: FE 07 02
	INC $020b,X			 ; $9603: FE 0B 02
	INC $020f,X			 ; $9606: FE 0F 02
	RTS					 ; $9609: 60
	PLA					 ; $960a: 68
	PLA					 ; $960b: 68
	RTS					 ; $960c: 60
	LDX #$08				; $960d: A2 08
	JSR $d804			   ; $960f: 20 04 D8
	JSR $cbb4			   ; $9612: 20 B4 CB
	RTS					 ; $9615: 60
	JSR $ff74			   ; $9616: 20 74 FF
	LDA #$f7				; $9619: A9 F7
	CMP $02d0			   ; $961b: CD D0 02
	BNE $962a			   ; $961e: D0 0A
	CMP $02e0			   ; $9620: CD E0 02
	BNE $962a			   ; $9623: D0 05
	CMP $02f0			   ; $9625: CD F0 02
	BEQ $9616			   ; $9628: F0 EC
	LDA system_flags		; $962a: A5 1F
	ORA #$08				; $962c: 09 08
	STA system_flags		; $962e: 85 1F
	LDX #$00				; $9630: A2 00
	LDY #$38				; $9632: A0 38
	STX $0203			   ; $9634: 8E 03 02
	STY $0200			   ; $9637: 8C 00 02
	STX $0207			   ; $963a: 8E 07 02
	STY $0204			   ; $963d: 8C 04 02
	STX $020b			   ; $9640: 8E 0B 02
	STY $0208			   ; $9643: 8C 08 02
	STX $020f			   ; $9646: 8E 0F 02
	STY $020c			   ; $9649: 8C 0C 02
	STX $0213			   ; $964c: 8E 13 02
	STY $0210			   ; $964f: 8C 10 02
	STX $0217			   ; $9652: 8E 17 02
	STY $0214			   ; $9655: 8C 14 02
	STX $021b			   ; $9658: 8E 1B 02
	STY $0218			   ; $965b: 8C 18 02
	STX $021f			   ; $965e: 8E 1F 02
	STY $021c			   ; $9661: 8C 1C 02
	LDY #$40				; $9664: A0 40
	STX $0223			   ; $9666: 8E 23 02
	STY $0220			   ; $9669: 8C 20 02
	STX $0227			   ; $966c: 8E 27 02
	STY $0224			   ; $966f: 8C 24 02
	STX $022b			   ; $9672: 8E 2B 02
	STY $0228			   ; $9675: 8C 28 02
	STX $022f			   ; $9678: 8E 2F 02
	STY $022c			   ; $967b: 8C 2C 02
	STX $0233			   ; $967e: 8E 33 02
	STY $0230			   ; $9681: 8C 30 02
	STX $0237			   ; $9684: 8E 37 02
	STY $0234			   ; $9687: 8C 34 02
	STX $023b			   ; $968a: 8E 3B 02
	STY $0238			   ; $968d: 8C 38 02
	STX $023f			   ; $9690: 8E 3F 02
	STY $023c			   ; $9693: 8C 3C 02
	RTS					 ; $9696: 60
	LDA $41				 ; $9697: A5 41
	BPL $96b4			   ; $9699: 10 19
	LDX #$00				; $969b: A2 00
	LDA $96b5,X			 ; $969d: BD B5 96
	CMP #$ff				; $96a0: C9 FF
	BEQ $96b4			   ; $96a2: F0 10
	CMP $63				 ; $96a4: C5 63
	BNE $96af			   ; $96a6: D0 07
	LDA $96b6,X			 ; $96a8: BD B6 96
	CMP $64				 ; $96ab: C5 64
	BEQ $96c4			   ; $96ad: F0 15
	INX					 ; $96af: E8
	INX					 ; $96b0: E8
	JMP $969d			   ; $96b1: 4C 9D 96
	RTS					 ; $96b4: 60
	AND $07,X			   ; $96b5: 35 07
	ORA (tmp2,X)			; $96b7: 01 02
	.db $37			; $96b9
	BRK					 ; $96ba: 00
	BRK					 ; $96bb: 00
	ORA ($36,X)			 ; $96bc: 01 36
	.db $04			; $96be
	.db $34			; $96bf
	BRK					 ; $96c0: 00
	.db $17			; $96c1
	BRK					 ; $96c2: 00
	.db $ff			; $96c3
	LDA $96d1,X			 ; $96c4: BD D1 96
	STA $49				 ; $96c7: 85 49
	LDA $96d2,X			 ; $96c9: BD D2 96
	STA $4a				 ; $96cc: 85 4A
	JMP ($0049)			 ; $96ce: 6C 49 00
	.db $df			; $96d1
	STX $ee,Y			   ; $96d2: 96 EE
	STX $fa,Y			   ; $96d4: 96 FA
	STX $13,Y			   ; $96d6: 96 13
	.db $97			; $96d8
	ROL $2497,X			 ; $96d9: 3E 97 24
	.db $97			; $96dc
	BMI $9676			   ; $96dd: 30 97
	LDA #$00				; $96df: A9 00
	STA $7684			   ; $96e1: 8D 84 76
	STA $7685			   ; $96e4: 8D 85 76
	STA $7686			   ; $96e7: 8D 86 76
	STA $7687			   ; $96ea: 8D 87 76
	RTS					 ; $96ed: 60
	BRK					 ; $96ee: 00
	.db $04			; $96ef
	.db $eb			; $96f0
	.db $02			; $96f1
	BEQ $96f9			   ; $96f2: F0 05
	LDA #$03				; $96f4: A9 03
	STA $7872			   ; $96f6: 8D 72 78
	RTS					 ; $96f9: 60
	BRK					 ; $96fa: 00
	ASL					 ; $96fb: 0A
	.db $eb			; $96fc
	.db $80			; $96fd
	BEQ $9712			   ; $96fe: F0 12
	LDX #$16				; $9700: A2 16
	STX $798c			   ; $9702: 8E 8C 79
	INX					 ; $9705: E8
	STX $798d			   ; $9706: 8E 8D 79
	LDX #$1a				; $9709: A2 1A
	STX $79ae			   ; $970b: 8E AE 79
	INX					 ; $970e: E8
	STX $79af			   ; $970f: 8E AF 79
	RTS					 ; $9712: 60
	BRK					 ; $9713: 00
	ASL $eb,X			   ; $9714: 16 EB
	.db $02			; $9716
	BEQ $9723			   ; $9717: F0 0A
	LDA $794a			   ; $9719: AD 4A 79
	AND #$1f				; $971c: 29 1F
	ORA #$20				; $971e: 09 20
	STA $7969			   ; $9720: 8D 69 79
	RTS					 ; $9723: 60
	BRK					 ; $9724: 00
	ROL $eb				 ; $9725: 26 EB
	RTI					 ; $9727: 40
	BEQ $972f			   ; $9728: F0 05
	LDA #$1a				; $972a: A9 1A
	STA $78ff			   ; $972c: 8D FF 78
	RTS					 ; $972f: 60
	LDA $62a5			   ; $9730: AD A5 62
	BPL $973d			   ; $9733: 10 08
	LDA #$05				; $9735: A9 05
	STA $788f			   ; $9737: 8D 8F 78
	STA $78ae			   ; $973a: 8D AE 78
	RTS					 ; $973d: 60
	TSX					 ; $973e: BA
	LDA $0108,X			 ; $973f: BD 08 01
	AND #$fe				; $9742: 29 FE
	STA $0108,X			 ; $9744: 9D 08 01
	JSR $97a4			   ; $9747: 20 A4 97
	JSR $9771			   ; $974a: 20 71 97
	JSR $9751			   ; $974d: 20 51 97
	RTS					 ; $9750: 60
	LDX #$19				; $9751: A2 19
	STX $7876			   ; $9753: 8E 76 78
	INX					 ; $9756: E8
	STX $7877			   ; $9757: 8E 77 78
	INX					 ; $975a: E8
	STX $788d			   ; $975b: 8E 8D 78
	INX					 ; $975e: E8
	STX $788e			   ; $975f: 8E 8E 78
	LDA #$03				; $9762: A9 03
	STA $62a3			   ; $9764: 8D A3 62
	LDA #$05				; $9767: A9 05
	STA $62a0			   ; $9769: 8D A0 62
	BRK					 ; $976c: 00
	.db $1f			; $976d
	.db $db			; $976e
	.db $bf			; $976f
	RTS					 ; $9770: 60
	LDX #$17				; $9771: A2 17
	LDA $978c,X			 ; $9773: BD 8C 97
	STA $7664,X			 ; $9776: 9D 64 76
	DEX					 ; $9779: CA
	BPL $9773			   ; $977a: 10 F7
	LDX #$05				; $977c: A2 05
	LDA #$01				; $977e: A9 01
	STA $76d9,X			 ; $9780: 9D D9 76
	LDA #$80				; $9783: A9 80
	STA $6f59,X			 ; $9785: 9D 59 6F
	DEX					 ; $9788: CA
	BPL $977e			   ; $9789: 10 F3
	RTS					 ; $978b: 60
	.db $f2			; $978c
	.db $f3			; $978d
	INC $f7,X			   ; $978e: F6 F7
	.db $f4			; $9790
	SBC $f7,X			   ; $9791: F5 F7
	SED					 ; $9793: F8
	SBC $fcfa,Y			 ; $9794: F9 FA FC
	SBC $fbfa,X			 ; $9797: FD FA FB
	INC $adff,X			 ; $979a: FE FF AD
	LDX $b0af			   ; $979d: AE AF B0
	LDA $afae			   ; $97a0: AD AE AF
	BCS $9752			   ; $97a3: B0 AD
	.db $02			; $97a5
	JSR $1fa9			   ; $97a6: 20 A9 1F
	STA $2006			   ; $97a9: 8D 06 20
	LDA #$20				; $97ac: A9 20
	STA $2006			   ; $97ae: 8D 06 20
	LDX #$00				; $97b1: A2 00
	LDA $97bf,X			 ; $97b3: BD BF 97
	STA $2007			   ; $97b6: 8D 07 20
	INX					 ; $97b9: E8
	CPX #$e0				; $97ba: E0 E0
	BCC $97b3			   ; $97bc: 90 F5
	RTS					 ; $97be: 60
	.db $ff			; $97bf
	.db $df			; $97c0
	INC $f8fc,X			 ; $97c1: FE FC F8
	SBC ($e1),Y			 ; $97c4: F1 E1
	INC $ff				 ; $97c6: E6 FF
	.db $df			; $97c8
	INC $fbfd,X			 ; $97c9: FE FD FB
	.db $f7			; $97cc
	.db $ef			; $97cd
	.db $ef			; $97ce
	BEQ $9751			   ; $97cf: F0 80
	.db $17			; $97d1
	ADC ($6b),Y			 ; $97d2: 71 6B
	.db $4b			; $97d4
	.db $67			; $97d5
	LDA ($f0),Y			 ; $97d6: B1 F0
	.db $8f			; $97d8
	.db $7f			; $97d9
	.db $ff			; $97da
	.db $ff			; $97db
	.db $ff			; $97dc
	.db $ff			; $97dd
	.db $ff			; $97de
	.db $0f			; $97df
	ORA ($b0,X)			 ; $97e0: 01 B0
	.db $7c			; $97e2
	EOR $fa32			   ; $97e3: 4D 32 FA
	STA $f10f,Y			 ; $97e6: 99 0F F1
	INC $ffff,X			 ; $97e9: FE FF FF
	.db $ff			; $97ec
	.db $ff			; $97ed
	.db $ff			; $97ee
	.db $ff			; $97ef
	SBC $3f7f,X			 ; $97f0: FD 7F 3F
	.db $1f			; $97f3
	.db $0f			; $97f4
	.db $a7			; $97f5
	ROR $ff				 ; $97f6: 66 FF
	SBC $bf7f,X			 ; $97f8: FD 7F BF
	.db $df			; $97fb
	.db $ef			; $97fc
	.db $f7			; $97fd
	INC $cc,X			   ; $97fe: F6 CC
	CMP $be97,X			 ; $9800: DD 97 BE
	TSX					 ; $9803: BA
	.db $3f			; $9804
	ROR $df7f,X			 ; $9805: 7E 7F DF
	.db $d7			; $9808
	LDA $afaf,Y			 ; $9809: B9 AF AF
	.db $67			; $980c
	EOR $bf5e,Y			 ; $980d: 59 5E BF
	.db $fc			; $9810
	ADC $bbdb,X			 ; $9811: 7D DB BB
	ROL $f9af,X			 ; $9814: 3E AF F9
	.db $ff			; $9817
	.db $df			; $9818
	.db $f3			; $9819
	.db $ff			; $981a
	.db $ff			; $981b
	.db $ef			; $981c
	.db $f3			; $981d
	.db $bf			; $981e
	.db $f3			; $981f
	.db $d3			; $9820
	SBC $f5fd,Y			 ; $9821: F9 FD F5
	.db $fc			; $9824
	LDX $fbfe,Y			 ; $9825: BE FE FB
	.db $fb			; $9828
	ADC $fd9d,X			 ; $9829: 7D 9D FD
	DEC $ce,X			   ; $982c: D6 CE
	ROR $7f7d,X			 ; $982e: 7E 7D 7F
	.db $7f			; $9831
	ADC $bfbe,X			 ; $9832: 7D BE BF
	.db $bf			; $9835
	.db $df			; $9836
	.db $2f			; $9837
	ADC $2f33			   ; $9838: 6D 33 2F
	.db $97			; $983b
	.db $82			; $983c
	.db $89			; $983d
	DEC $def3			   ; $983e: CE F3 DE
	.db $ef			; $9841
	.db $fb			; $9842
	.db $ff			; $9843
	.db $ff			; $9844
	.db $ff			; $9845
	.db $ff			; $9846
	.db $7f			; $9847
	.db $fb			; $9848
	.db $7c			; $9849
	.db $2f			; $984a
	STA $b3ec			   ; $984b: 8D EC B3
	.db $3f			; $984e
	INC $f6				 ; $984f: E6 F6
	ROR $fdfe,X			 ; $9851: 7E FE FD
	SBC $fbfd,X			 ; $9854: FD FD FB
	.db $3c			; $9857
	INC $e4d8,X			 ; $9858: FE D8 E4
	LDA $99a9,X			 ; $985b: BD A9 99
	.db $43			; $985e
	.db $df			; $985f
	.db $ef			; $9860
	.db $f7			; $9861
	.db $f7			; $9862
	SBC ($e0,X)			 ; $9863: E1 E0
	BEQ $9866			   ; $9865: F0 FF
	CMP $e1				 ; $9867: C5 E1
	BEQ $984b			   ; $9869: F0 E0
	CPY #$c0				; $986b: C0 C0
	CPY #$f0				; $986d: C0 F0
	.db $ff			; $986f
	.db $ff			; $9870
	.db $ff			; $9871
	.db $ff			; $9872
	.db $ff			; $9873
	.db $7f			; $9874
	.db $0f			; $9875
	BRK					 ; $9876: 00
	ADC $6d92			   ; $9877: 6D 92 6D
	.db $02			; $987a
	ORA (tmp0),Y			; $987b: 11 00
	BRK					 ; $987d: 00
	BRK					 ; $987e: 00
	.db $ff			; $987f
	.db $ff			; $9880
	.db $ff			; $9881
	.db $ff			; $9882
	.db $ff			; $9883
	INC $00f0,X			 ; $9884: FE F0 00
	.db $fb			; $9887
	.db $d4			; $9888
	ROL $08,X			   ; $9889: 36 08
	RTI					 ; $988b: 40
	BRK					 ; $988c: 00
	BRK					 ; $988d: 00
	BRK					 ; $988e: 00
	.db $fb			; $988f
	.db $f7			; $9890
	.db $ef			; $9891
	.db $cf			; $9892
	.db $87			; $9893
	.db $07			; $9894
	.db $0f			; $9895
	.db $ff			; $9896
	.db $63			; $9897
	.db $87			; $9898
	.db $0f			; $9899
	.db $07			; $989a
	.db $03			; $989b
	.db $03			; $989c
	.db $03			; $989d
	.db $0f			; $989e
	ASL					 ; $989f: 0A
	TAX					 ; $98a0: AA
	BCS $98b0			   ; $98a1: B0 0D
	LDA $b62a,X			 ; $98a3: BD 2A B6
	STA $4f				 ; $98a6: 85 4F
	LDA $b62b,X			 ; $98a8: BD 2B B6
	STA $50				 ; $98ab: 85 50
	JMP ($004f)			 ; $98ad: 6C 4F 00
	LDA $b72a,X			 ; $98b0: BD 2A B7
	STA $4f				 ; $98b3: 85 4F
	LDA $b72b,X			 ; $98b5: BD 2B B7
	STA $50				 ; $98b8: 85 50
	JMP ($004f)			 ; $98ba: 6C 4F 00
	STX $5d				 ; $98bd: 86 5D
	LDA $7000,X			 ; $98bf: BD 00 70
	AND #$03				; $98c2: 29 03
	ASL					 ; $98c4: 0A
	TAY					 ; $98c5: A8
	STY $5e				 ; $98c6: 84 5E
	JSR $98d2			   ; $98c8: 20 D2 98
	JSR $98db			   ; $98cb: 20 DB 98
	JSR $98e1			   ; $98ce: 20 E1 98
	RTS					 ; $98d1: 60
	JSR $98f9			   ; $98d2: 20 F9 98
	JSR $9935			   ; $98d5: 20 35 99
	JMP $98e7			   ; $98d8: 4C E7 98
	JSR $98f9			   ; $98db: 20 F9 98
	JMP $98e7			   ; $98de: 4C E7 98
	JSR $98f9			   ; $98e1: 20 F9 98
	JSR $992f			   ; $98e4: 20 2F 99
	JSR $9926			   ; $98e7: 20 26 99
	JSR $9916			   ; $98ea: 20 16 99
	BCS $98f7			   ; $98ed: B0 08
	JSR $9906			   ; $98ef: 20 06 99
	BCC $98e7			   ; $98f2: 90 F3
	PLA					 ; $98f4: 68
	PLA					 ; $98f5: 68
	RTS					 ; $98f6: 60
	CLC					 ; $98f7: 18
	RTS					 ; $98f8: 60
	LDX $5d				 ; $98f9: A6 5D
	LDA $6f60,X			 ; $98fb: BD 60 6F
	STA $5f				 ; $98fe: 85 5F
	LDA $6f80,X			 ; $9900: BD 80 6F
	STA $60				 ; $9903: 85 60
	RTS					 ; $9905: 60
	LDA $5f				 ; $9906: A5 5F
	CMP $44				 ; $9908: C5 44
	BNE $9912			   ; $990a: D0 06
	LDA $60				 ; $990c: A5 60
	CMP $45				 ; $990e: C5 45
	BEQ $9914			   ; $9910: F0 02
	CLC					 ; $9912: 18
	RTS					 ; $9913: 60
	SEC					 ; $9914: 38
	RTS					 ; $9915: 60
	LDX $5f				 ; $9916: A6 5F
	LDY $60				 ; $9918: A4 60
	JSR $d3e6			   ; $991a: 20 E6 D3
	AND #$1f				; $991d: 29 1F
	TAX					 ; $991f: AA
	LDA $6f40,X			 ; $9920: BD 40 6F
	CMP #$80				; $9923: C9 80
	RTS					 ; $9925: 60
	LDA $5e				 ; $9926: A5 5E
	CLC					 ; $9928: 18
	ADC #$10				; $9929: 69 10
	TAY					 ; $992b: A8
	JMP $9935			   ; $992c: 4C 35 99
	LDA $5e				 ; $992f: A5 5E
	CLC					 ; $9931: 18
	ADC #$08				; $9932: 69 08
	TAY					 ; $9934: A8
	LDA $5f				 ; $9935: A5 5F
	CLC					 ; $9937: 18
	ADC $9946,Y			 ; $9938: 79 46 99
	STA $5f				 ; $993b: 85 5F
	LDA $60				 ; $993d: A5 60
	CLC					 ; $993f: 18
	ADC $9947,Y			 ; $9940: 79 47 99
	STA $60				 ; $9943: 85 60
	RTS					 ; $9945: 60
	.db $ff			; $9946
	BRK					 ; $9947: 00
	BRK					 ; $9948: 00
	.db $ff			; $9949
	ORA (tmp0,X)			; $994a: 01 00
	BRK					 ; $994c: 00
	ORA (tmp1,X)			; $994d: 01 01
	BRK					 ; $994f: 00
	BRK					 ; $9950: 00
	ORA ($ff,X)			 ; $9951: 01 FF
	BRK					 ; $9953: 00
	BRK					 ; $9954: 00
	.db $ff			; $9955
	BRK					 ; $9956: 00
	.db $ff			; $9957
	ORA (tmp0,X)			; $9958: 01 00
	BRK					 ; $995a: 00
	ORA ($ff,X)			 ; $995b: 01 FF
	BRK					 ; $995d: 00
	BRK					 ; $995e: 00
	.db $07			; $995f
	.db $6f			; $9960
	.db $43			; $9961
	RTS					 ; $9962: 60
	STA $6f66,X			 ; $9963: 9D 66 6F
	STA $6f86,X			 ; $9966: 9D 86 6F
	STA $6fa6,X			 ; $9969: 9D A6 6F
	STA $6fc6,X			 ; $996c: 9D C6 6F
	RTS					 ; $996f: 60
	LDY #$00				; $9970: A0 00
	LDA $6fa0			   ; $9972: AD A0 6F
	CMP $999c,Y			 ; $9975: D9 9C 99
	BEQ $9981			   ; $9978: F0 07
	INY					 ; $997a: C8
	CPY #$03				; $997b: C0 03
	BCC $9972			   ; $997d: 90 F3
	CLC					 ; $997f: 18
	RTS					 ; $9980: 60
	LDA $6fc0			   ; $9981: AD C0 6F
	CMP $999f,Y			 ; $9984: D9 9F 99
	BNE $997a			   ; $9987: D0 F1
	LDX $51				 ; $9989: A6 51
	LDA $7080,X			 ; $998b: BD 80 70
	CLC					 ; $998e: 18
	ADC $99a2,Y			 ; $998f: 79 A2 99
	STA $7080,X			 ; $9992: 9D 80 70
	BCC $999a			   ; $9995: 90 03
	INC $7060,X			 ; $9997: FE 60 70
	SEC					 ; $999a: 38
	RTS					 ; $999b: 60
	.db $04			; $999c
	ORA ptr0_lo			 ; $999d: 05 04
	.db $02			; $999f
	.db $03			; $99a0
	.db $04			; $99a1
	BRK					 ; $99a2: 00
	.db $14			; $99a3
	ASL $a5				 ; $99a4: 06 A5
	.db $44			; $99a6
	SEC					 ; $99a7: 38
	SBC #$0c				; $99a8: E9 0C
	CMP #$03				; $99aa: C9 03
	BCS $99ca			   ; $99ac: B0 1C
	LDA $45				 ; $99ae: A5 45
	SEC					 ; $99b0: 38
	SBC #$05				; $99b1: E9 05
	CMP #$03				; $99b3: C9 03
	BCS $99ca			   ; $99b5: B0 13
	PHA					 ; $99b7: 48
	JSR $9b6b			   ; $99b8: 20 6B 9B
	PLA					 ; $99bb: 68
	BRK					 ; $99bc: 00
	ORA ($eb,X)			 ; $99bd: 01 EB
	.db $02			; $99bf
	BEQ $99c4			   ; $99c0: F0 02
	CLC					 ; $99c2: 18
	RTS					 ; $99c3: 60
	BRK					 ; $99c4: 00
	ORA ($cb,X)			 ; $99c5: 01 CB
	.db $02			; $99c7
	SEC					 ; $99c8: 38
	RTS					 ; $99c9: 60
	BRK					 ; $99ca: 00
	ORA ($db,X)			 ; $99cb: 01 DB
	SBC $6018,X			 ; $99cd: FD 18 60
	LDA $45				 ; $99d0: A5 45
	CMP #$09				; $99d2: C9 09
	BNE $99d8			   ; $99d4: D0 02
	SEC					 ; $99d6: 38
	RTS					 ; $99d7: 60
	CLC					 ; $99d8: 18
	RTS					 ; $99d9: 60
	LDA $627b			   ; $99da: AD 7B 62
	LSR					 ; $99dd: 4A
	LSR					 ; $99de: 4A
	LSR					 ; $99df: 4A
	RTS					 ; $99e0: 60
	LDA $44				 ; $99e1: A5 44
	CMP #$16				; $99e3: C9 16
	BCC $99ef			   ; $99e5: 90 08
	LDA $45				 ; $99e7: A5 45
	CMP #$12				; $99e9: C9 12
	BNE $99ef			   ; $99eb: D0 02
	SEC					 ; $99ed: 38
	RTS					 ; $99ee: 60
	CLC					 ; $99ef: 18
	RTS					 ; $99f0: 60
	LDA $64				 ; $99f1: A5 64
	CMP #$00				; $99f3: C9 00
	BNE $9a23			   ; $99f5: D0 2C
	LDX #$00				; $99f7: A2 00
	LDA #$02				; $99f9: A9 02
	PHA					 ; $99fb: 48
	LDA $3d				 ; $99fc: A5 3D
	CMP $9a55,X			 ; $99fe: DD 55 9A
	BNE $9a11			   ; $9a01: D0 0E
	LDA $44				 ; $9a03: A5 44
	CMP $9a41,X			 ; $9a05: DD 41 9A
	BNE $9a11			   ; $9a08: D0 07
	LDA $45				 ; $9a0a: A5 45
	CMP $9a4b,X			 ; $9a0c: DD 4B 9A
	BEQ $9a25			   ; $9a0f: F0 14
	INX					 ; $9a11: E8
	CPX #$06				; $9a12: E0 06
	BEQ $9a1a			   ; $9a14: F0 04
	CPX #$0a				; $9a16: E0 0A
	BCC $99fc			   ; $9a18: 90 E2
	PLA					 ; $9a1a: 68
	EOR #$ff				; $9a1b: 49 FF
	AND $627c			   ; $9a1d: 2D 7C 62
	STA $627c			   ; $9a20: 8D 7C 62
	CLC					 ; $9a23: 18
	RTS					 ; $9a24: 60
	PLA					 ; $9a25: 68
	PHA					 ; $9a26: 48
	AND $627c			   ; $9a27: 2D 7C 62
	BEQ $9a2f			   ; $9a2a: F0 03
	PLA					 ; $9a2c: 68
	CLC					 ; $9a2d: 18
	RTS					 ; $9a2e: 60
	PLA					 ; $9a2f: 68
	PHA					 ; $9a30: 48
	CMP #$40				; $9a31: C9 40
	BEQ $9a38			   ; $9a33: F0 03
	JSR $9b6b			   ; $9a35: 20 6B 9B
	PLA					 ; $9a38: 68
	ORA $627c			   ; $9a39: 0D 7C 62
	STA $627c			   ; $9a3c: 8D 7C 62
	SEC					 ; $9a3f: 38
	RTS					 ; $9a40: 60
	.db $14			; $9a41
	.db $14			; $9a42
	ASL					 ; $9a43: 0A
	.db $0b			; $9a44
	ORA $120d			   ; $9a45: 0D 0D 12
	.db $13			; $9a48
	ORA (ptr_hi),Y		  ; $9a49: 11 11
	.db $0c			; $9a4b
	ORA $1919			   ; $9a4c: 0D 19 19
	ROL $27				 ; $9a4f: 26 27
	.db $12			; $9a51
	.db $12			; $9a52
	ROL					 ; $9a53: 2A
	.db $2b			; $9a54
	.db $03			; $9a55
	.db $03			; $9a56
	.db $02			; $9a57
	.db $02			; $9a58
	ORA (tmp1,X)			; $9a59: 01 01
	BRK					 ; $9a5b: 00
	BRK					 ; $9a5c: 00
	ORA (tmp1,X)			; $9a5d: 01 01
	PHA					 ; $9a5f: 48
	LDA $44				 ; $9a60: A5 44
	CMP $9a7d,X			 ; $9a62: DD 7D 9A
	BNE $9a75			   ; $9a65: D0 0E
	LDA $45				 ; $9a67: A5 45
	CMP $9a95,X			 ; $9a69: DD 95 9A
	BNE $9a75			   ; $9a6c: D0 07
	LDA $3d				 ; $9a6e: A5 3D
	CMP $9aad,X			 ; $9a70: DD AD 9A
	BEQ $9a25			   ; $9a73: F0 B0
	INX					 ; $9a75: E8
	TXA					 ; $9a76: 8A
	AND #$07				; $9a77: 29 07
	BNE $9a60			   ; $9a79: D0 E5
	BEQ $9a1a			   ; $9a7b: F0 9D
	.db $02			; $9a7d
	.db $03			; $9a7e
	.db $0c			; $9a7f
	.db $0c			; $9a80
	BPL $9a93			   ; $9a81: 10 10
	BRK					 ; $9a83: 00
	BRK					 ; $9a84: 00
	ORA (ptr_hi),Y		  ; $9a85: 11 11
	BRK					 ; $9a87: 00
	BRK					 ; $9a88: 00
	BRK					 ; $9a89: 00
	BRK					 ; $9a8a: 00
	BRK					 ; $9a8b: 00
	BRK					 ; $9a8c: 00
	.db $14			; $9a8d
	.db $14			; $9a8e
	ORA (ptr_hi),Y		  ; $9a8f: 11 11
	.db $14			; $9a91
	.db $14			; $9a92
	.db $14			; $9a93
	.db $14			; $9a94
	ORA $1a19,Y			 ; $9a95: 19 19 1A
	.db $1b			; $9a98
	ROL $27				 ; $9a99: 26 27
	BRK					 ; $9a9b: 00
	BRK					 ; $9a9c: 00
	.db $0c			; $9a9d
	ORA $0000			   ; $9a9e: 0D 00 00
	BRK					 ; $9aa1: 00
	BRK					 ; $9aa2: 00
	BRK					 ; $9aa3: 00
	BRK					 ; $9aa4: 00
	BPL $9ab8			   ; $9aa5: 10 11
	.db $1c			; $9aa7
	ORA $1d1c,X			 ; $9aa8: 1D 1C 1D
	ROL					 ; $9aab: 2A
	.db $2b			; $9aac
	BRK					 ; $9aad: 00
	BRK					 ; $9aae: 00
	ORA (tmp1,X)			; $9aaf: 01 01
	ORA (tmp1,X)			; $9ab1: 01 01
	BRK					 ; $9ab3: 00
	BRK					 ; $9ab4: 00
	.db $03			; $9ab5
	.db $03			; $9ab6
	BRK					 ; $9ab7: 00
	BRK					 ; $9ab8: 00
	BRK					 ; $9ab9: 00
	BRK					 ; $9aba: 00
	BRK					 ; $9abb: 00
	BRK					 ; $9abc: 00
	ORA (tmp1,X)			; $9abd: 01 01
	.db $03			; $9abf
	.db $03			; $9ac0
	ORA (tmp1,X)			; $9ac1: 01 01
	ORA (tmp1,X)			; $9ac3: 01 01
	LDA $615a			   ; $9ac5: AD 5A 61
	CMP #$04				; $9ac8: C9 04
	BNE $9b2d			   ; $9aca: D0 61
	LDA $6fa0			   ; $9acc: AD A0 6F
	CMP #$13				; $9acf: C9 13
	BNE $9b2d			   ; $9ad1: D0 5A
	LDA $6fc0			   ; $9ad3: AD C0 6F
	AND #$fe				; $9ad6: 29 FE
	CMP #$04				; $9ad8: C9 04
	BNE $9b2d			   ; $9ada: D0 51
	BRK					 ; $9adc: 00
	ASL $eb,X			   ; $9add: 16 EB
	JSR $49d0			   ; $9adf: 20 D0 49
	JSR $c891			   ; $9ae2: 20 91 C8
	AND #$1f				; $9ae5: 29 1F
	BNE $9b2b			   ; $9ae7: D0 42
	JSR $b16b			   ; $9ae9: 20 6B B1
	LDA $51				 ; $9aec: A5 51
	PHA					 ; $9aee: 48
	JSR $995e			   ; $9aef: 20 5E 99
	BRK					 ; $9af2: 00
	ORA ($fb,X)			 ; $9af3: 01 FB
	BRK					 ; $9af5: 00
	.db $07			; $9af6
	.db $9f			; $9af7
	BRK					 ; $9af8: 00
	.db $04			; $9af9
	.db $fb			; $9afa
	BRK					 ; $9afb: 00
	.db $fc			; $9afc
	.db $3b			; $9afd
	BRK					 ; $9afe: 00
	SBC $203b,X			 ; $9aff: FD 3B 20
	ASL					 ; $9b02: 0A
	.db $d2			; $9b03
	BRK					 ; $9b04: 00
	ORA #$9f				; $9b05: 09 9F
	BRK					 ; $9b07: 00
	ASL $cb,X			   ; $9b08: 16 CB
	JSR $0e00			   ; $9b0a: 20 00 0E
	.db $cb			; $9b0d
	.db $80			; $9b0e
	LDA $62ad			   ; $9b0f: AD AD 62
	CLC					 ; $9b12: 18
	ADC #$d0				; $9b13: 69 D0
	STA $62ad			   ; $9b15: 8D AD 62
	LDA $62ae			   ; $9b18: AD AE 62
	ADC #$07				; $9b1b: 69 07
	STA $62ae			   ; $9b1d: 8D AE 62
	LDA $62af			   ; $9b20: AD AF 62
	ADC #$00				; $9b23: 69 00
	STA $62af			   ; $9b25: 8D AF 62
	PLA					 ; $9b28: 68
	STA $51				 ; $9b29: 85 51
	SEC					 ; $9b2b: 38
	RTS					 ; $9b2c: 60
	CLC					 ; $9b2d: 18
	RTS					 ; $9b2e: 60
	LDX #$00				; $9b2f: A2 00
	LDA #$20				; $9b31: A9 20
	JMP $9a5f			   ; $9b33: 4C 5F 9A
	LDX #$08				; $9b36: A2 08
	LDA #$40				; $9b38: A9 40
	JMP $9a5f			   ; $9b3a: 4C 5F 9A
	LDX #$06				; $9b3d: A2 06
	JMP $99f9			   ; $9b3f: 4C F9 99
	LDA $44				 ; $9b42: A5 44
	CMP #$06				; $9b44: C9 06
	BNE $9b62			   ; $9b46: D0 1A
	LDA $45				 ; $9b48: A5 45
	CMP #$06				; $9b4a: C9 06
	BNE $9b62			   ; $9b4c: D0 14
	LDA $3e				 ; $9b4e: A5 3E
	BEQ $9b59			   ; $9b50: F0 07
	LDA #$8f				; $9b52: A9 8F
	JSR $a23a			   ; $9b54: 20 3A A2
	CLC					 ; $9b57: 18
	RTS					 ; $9b58: 60
	LDA #$23				; $9b59: A9 23
	BRK					 ; $9b5b: 00
	.db $07			; $9b5c
	.db $cf			; $9b5d
	LDA #$1e				; $9b5e: A9 1E
	STA $51				 ; $9b60: 85 51
	CLC					 ; $9b62: 18
	RTS					 ; $9b63: 60
	LDX #$10				; $9b64: A2 10
	LDA #$20				; $9b66: A9 20
	JMP $9a5f			   ; $9b68: 4C 5F 9A
	LDA #$6c				; $9b6b: A9 6C
	BRK					 ; $9b6d: 00
	ROR $73				 ; $9b6e: 66 73
	BCC $9b76			   ; $9b70: 90 04
	PLA					 ; $9b72: 68
	PLA					 ; $9b73: 68
	PLA					 ; $9b74: 68
	CLC					 ; $9b75: 18
	RTS					 ; $9b76: 60
	BRK					 ; $9b77: 00
	ASL $08eb			   ; $9b78: 0E EB 08
	BEQ $9b7f			   ; $9b7b: F0 02
	SEC					 ; $9b7d: 38
	RTS					 ; $9b7e: 60
	CLC					 ; $9b7f: 18
	RTS					 ; $9b80: 60
	CLC					 ; $9b81: 18
	RTS					 ; $9b82: 60
	LDA $44				 ; $9b83: A5 44
	CMP #$1c				; $9b85: C9 1C
	BCC $9b91			   ; $9b87: 90 08
	LDA $45				 ; $9b89: A5 45
	CMP #$05				; $9b8b: C9 05
	BNE $9b91			   ; $9b8d: D0 02
	SEC					 ; $9b8f: 38
	RTS					 ; $9b90: 60
	CLC					 ; $9b91: 18
	RTS					 ; $9b92: 60
	LDA $44				 ; $9b93: A5 44
	CMP #$1c				; $9b95: C9 1C
	BCC $9ba1			   ; $9b97: 90 08
	LDA $45				 ; $9b99: A5 45
	CMP #$07				; $9b9b: C9 07
	BNE $9ba1			   ; $9b9d: D0 02
	SEC					 ; $9b9f: 38
	RTS					 ; $9ba0: 60
	CLC					 ; $9ba1: 18
	RTS					 ; $9ba2: 60
	LDY $615a			   ; $9ba3: AC 5A 61
	BRK					 ; $9ba6: 00
	PHP					 ; $9ba7: 08
	.db $eb			; $9ba8
	.db $02			; $9ba9
	BNE $9bb2			   ; $9baa: D0 06
	LDX #$00				; $9bac: A2 00
	CPY #$01				; $9bae: C0 01
	BEQ $9bb8			   ; $9bb0: F0 06
	LDX #$02				; $9bb2: A2 02
	CPY #$02				; $9bb4: C0 02
	BNE $9bc8			   ; $9bb6: D0 10
	LDA $9bca,X			 ; $9bb8: BD CA 9B
	CMP $44				 ; $9bbb: C5 44
	BNE $9bc8			   ; $9bbd: D0 09
	LDA $9bcb,X			 ; $9bbf: BD CB 9B
	CMP $45				 ; $9bc2: C5 45
	BNE $9bc8			   ; $9bc4: D0 02
	SEC					 ; $9bc6: 38
	RTS					 ; $9bc7: 60
	CLC					 ; $9bc8: 18
	RTS					 ; $9bc9: 60
	ORA $09				 ; $9bca: 05 09
	.db $04			; $9bcc
	ORA $ad				 ; $9bcd: 05 AD
	ADC $4a62,X			 ; $9bcf: 7D 62 4A
	RTS					 ; $9bd2: 60
	BRK					 ; $9bd3: 00
	.db $02			; $9bd4
	.db $eb			; $9bd5
	.db $02			; $9bd6
	BEQ $9bf5			   ; $9bd7: F0 1C
	LDX #$06				; $9bd9: A2 06
	JSR $98bd			   ; $9bdb: 20 BD 98
	LDX #$06				; $9bde: A2 06
	BCC $9be9			   ; $9be0: 90 07
	LDA #$00				; $9be2: A9 00
	STA $7040,X			 ; $9be4: 9D 40 70
	CLC					 ; $9be7: 18
	RTS					 ; $9be8: 60
	LDA $7040,X			 ; $9be9: BD 40 70
	AND #$f0				; $9bec: 29 F0
	BNE $9bf5			   ; $9bee: D0 05
	LDA #$22				; $9bf0: A9 22
	STA $7040,X			 ; $9bf2: 9D 40 70
	CLC					 ; $9bf5: 18
	RTS					 ; $9bf6: 60
	LDA $44				 ; $9bf7: A5 44
	CMP #$1f				; $9bf9: C9 1F
	BNE $9c05			   ; $9bfb: D0 08
	LDA $45				 ; $9bfd: A5 45
	CMP #$1b				; $9bff: C9 1B
	BNE $9c05			   ; $9c01: D0 02
	CLC					 ; $9c03: 18
	RTS					 ; $9c04: 60
	SEC					 ; $9c05: 38
	RTS					 ; $9c06: 60
	BRK					 ; $9c07: 00
	.db $02			; $9c08
	.db $eb			; $9c09
	PHP					 ; $9c0a: 08
	BEQ $9c24			   ; $9c0b: F0 17
	LDA $44				 ; $9c0d: A5 44
	CMP #$04				; $9c0f: C9 04
	BNE $9c19			   ; $9c11: D0 06
	LDA $45				 ; $9c13: A5 45
	CMP #$03				; $9c15: C9 03
	BEQ $9c24			   ; $9c17: F0 0B
	JSR $9c34			   ; $9c19: 20 34 9C
	BCS $9c24			   ; $9c1c: B0 06
	LDA $56				 ; $9c1e: A5 56
	BMI $9c24			   ; $9c20: 30 02
	SEC					 ; $9c22: 38
	RTS					 ; $9c23: 60
	CLC					 ; $9c24: 18
	RTS					 ; $9c25: 60
	LDA $44				 ; $9c26: A5 44
	CMP #$04				; $9c28: C9 04
	BNE $9c34			   ; $9c2a: D0 08
	LDA $45				 ; $9c2c: A5 45
	CMP #$03				; $9c2e: C9 03
	BNE $9c34			   ; $9c30: D0 02
	SEC					 ; $9c32: 38
	RTS					 ; $9c33: 60
	LDX #$01				; $9c34: A2 01
	JSR $9c40			   ; $9c36: 20 40 9C
	BCS $9c32			   ; $9c39: B0 F7
	LDX #$00				; $9c3b: A2 00
	JMP $9c40			   ; $9c3d: 4C 40 9C
	LDA $6f66,X			 ; $9c40: BD 66 6F
	CMP #$04				; $9c43: C9 04
	BNE $9c50			   ; $9c45: D0 09
	LDA $6f86,X			 ; $9c47: BD 86 6F
	CMP #$03				; $9c4a: C9 03
	BNE $9c50			   ; $9c4c: D0 02
	SEC					 ; $9c4e: 38
	RTS					 ; $9c4f: 60
	CLC					 ; $9c50: 18
	RTS					 ; $9c51: 60
	LDX $51				 ; $9c52: A6 51
	LDA $6f60,X			 ; $9c54: BD 60 6F
	SEC					 ; $9c57: 38
	SBC $6fa0			   ; $9c58: ED A0 6F
	CLC					 ; $9c5b: 18
	ADC #$01				; $9c5c: 69 01
	CMP #$03				; $9c5e: C9 03
	BCS $9c8e			   ; $9c60: B0 2C
	LDA $6f80,X			 ; $9c62: BD 80 6F
	SEC					 ; $9c65: 38
	SBC $6fc0			   ; $9c66: ED C0 6F
	CLC					 ; $9c69: 18
	ADC #$01				; $9c6a: 69 01
	CMP #$03				; $9c6c: C9 03
	BCS $9c8e			   ; $9c6e: B0 1E
	LDA #$81				; $9c70: A9 81
	STA $6f60,X			 ; $9c72: 9D 60 6F
	STA $6f80,X			 ; $9c75: 9D 80 6F
	STA $6fa0,X			 ; $9c78: 9D A0 6F
	STA $6fc0,X			 ; $9c7b: 9D C0 6F
	TXA					 ; $9c7e: 8A
	PHA					 ; $9c7f: 48
	JSR $9c93			   ; $9c80: 20 93 9C
	LDA #$06				; $9c83: A9 06
	BRK					 ; $9c85: 00
	ORA ($8f,X)			 ; $9c86: 01 8F
	BRK					 ; $9c88: 00
	ORA $ef,X			   ; $9c89: 15 EF
	PLA					 ; $9c8b: 68
	STA $51				 ; $9c8c: 85 51
	LDA $3e				 ; $9c8e: A5 3E
	CMP #$10				; $9c90: C9 10
	RTS					 ; $9c92: 60
	LDA $3e				 ; $9c93: A5 3E
	BEQ $9c92			   ; $9c95: F0 FB
	LDX #$05				; $9c97: A2 05
	LDA $7000,X			 ; $9c99: BD 00 70
	AND #$7f				; $9c9c: 29 7F
	STA $7000,X			 ; $9c9e: 9D 00 70
	LDA $6f60,X			 ; $9ca1: BD 60 6F
	STA $6fa0,X			 ; $9ca4: 9D A0 6F
	LDA $6f80,X			 ; $9ca7: BD 80 6F
	STA $6fc0,X			 ; $9caa: 9D C0 6F
	DEX					 ; $9cad: CA
	BNE $9c99			   ; $9cae: D0 E9
	LDA #$00				; $9cb0: A9 00
	STA $3e				 ; $9cb2: 85 3E
	JMP $c010			   ; $9cb4: 4C 10 C0
	LDA $44				 ; $9cb7: A5 44
	SEC					 ; $9cb9: 38
	SBC #$03				; $9cba: E9 03
	CMP #$02				; $9cbc: C9 02
	BCS $9cd7			   ; $9cbe: B0 17
	LDA $45				 ; $9cc0: A5 45
	CMP #$0e				; $9cc2: C9 0E
	BNE $9cd7			   ; $9cc4: D0 11
	BRK					 ; $9cc6: 00
	.db $02			; $9cc7
	.db $cb			; $9cc8
	JSR $1f00			   ; $9cc9: 20 00 1F
	.db $db			; $9ccc
	.db $fc			; $9ccd
	BRK					 ; $9cce: 00
	.db $1f			; $9ccf
	.db $cb			; $9cd0
	.db $02			; $9cd1
	BRK					 ; $9cd2: 00
	STA $fb,X			   ; $9cd3: 95 FB
	SEC					 ; $9cd5: 38
	RTS					 ; $9cd6: 60
	BRK					 ; $9cd7: 00
	.db $1f			; $9cd8
	.db $db			; $9cd9
	.db $7f			; $9cda
	CLC					 ; $9cdb: 18
	RTS					 ; $9cdc: 60
	LDA $629a			   ; $9cdd: AD 9A 62
	AND #$03				; $9ce0: 29 03
	BEQ $9cd7			   ; $9ce2: F0 F3
	CMP #$02				; $9ce4: C9 02
	BEQ $9cfd			   ; $9ce6: F0 15
	LDX $62a0			   ; $9ce8: AE A0 62
	JSR $9e2d			   ; $9ceb: 20 2D 9E
	BCS $9d1c			   ; $9cee: B0 2C
	INX					 ; $9cf0: E8
	JSR $9e2d			   ; $9cf1: 20 2D 9E
	BCS $9d1c			   ; $9cf4: B0 26
	BRK					 ; $9cf6: 00
	.db $1f			; $9cf7
	.db $db			; $9cf8
	.db $df			; $9cf9
	JMP $9d38			   ; $9cfa: 4C 38 9D
	LDX $62a3			   ; $9cfd: AE A3 62
	JSR $9e42			   ; $9d00: 20 42 9E
	BCS $9d0b			   ; $9d03: B0 06
	INX					 ; $9d05: E8
	JSR $9e42			   ; $9d06: 20 42 9E
	BCC $9cf6			   ; $9d09: 90 EB
	LDX $62a0			   ; $9d0b: AE A0 62
	INX					 ; $9d0e: E8
	INX					 ; $9d0f: E8
	JSR $9e2d			   ; $9d10: 20 2D 9E
	BCC $9cf6			   ; $9d13: 90 E1
	BRK					 ; $9d15: 00
	.db $1f			; $9d16
	.db $cb			; $9d17
	JSR $384c			   ; $9d18: 20 4C 38
	STA $9aad,X			 ; $9d1b: 9D AD 9A
	.db $62			; $9d1e
	AND #$03				; $9d1f: 29 03
	CMP #$01				; $9d21: C9 01
	BEQ $9d30			   ; $9d23: F0 0B
	LDX $62a3			   ; $9d25: AE A3 62
	DEX					 ; $9d28: CA
	JSR $9e42			   ; $9d29: 20 42 9E
	BCC $9cf6			   ; $9d2c: 90 C8
	BCS $9d15			   ; $9d2e: B0 E5
	LDX $62a3			   ; $9d30: AE A3 62
	INX					 ; $9d33: E8
	INX					 ; $9d34: E8
	JMP $9d29			   ; $9d35: 4C 29 9D
	BRK					 ; $9d38: 00
	.db $1f			; $9d39
	.db $eb			; $9d3a
	JSR $99d0			   ; $9d3b: 20 D0 99
	BRK					 ; $9d3e: 00
	.db $1f			; $9d3f
	.db $cb			; $9d40
	.db $80			; $9d41
	JSR $9f8f			   ; $9d42: 20 8F 9F
	JSR $9e53			   ; $9d45: 20 53 9E
	BRK					 ; $9d48: 00
	.db $1f			; $9d49
	.db $eb			; $9d4a
	RTI					 ; $9d4b: 40
	BEQ $9d6d			   ; $9d4c: F0 1F
	LDA $629a			   ; $9d4e: AD 9A 62
	AND #$03				; $9d51: 29 03
	CMP #$01				; $9d53: C9 01
	BEQ $9d61			   ; $9d55: F0 0A
	CMP #$02				; $9d57: C9 02
	BEQ $9d67			   ; $9d59: F0 0C
	DEC $62a3			   ; $9d5b: CE A3 62
	JMP $9e20			   ; $9d5e: 4C 20 9E
	INC $62a3			   ; $9d61: EE A3 62
	JMP $9e20			   ; $9d64: 4C 20 9E
	INC $62a0			   ; $9d67: EE A0 62
	JMP $9da4			   ; $9d6a: 4C A4 9D
	LDA $629a			   ; $9d6d: AD 9A 62
	AND #$03				; $9d70: 29 03
	CMP #$01				; $9d72: C9 01
	BEQ $9d8f			   ; $9d74: F0 19
	CMP #$02				; $9d76: C9 02
	BEQ $9de6			   ; $9d78: F0 6C
	LDA $62a3			   ; $9d7a: AD A3 62
	CMP #$03				; $9d7d: C9 03
	BEQ $9d84			   ; $9d7f: F0 03
	JMP $9e20			   ; $9d81: 4C 20 9E
	BRK					 ; $9d84: 00
	.db $1f			; $9d85
	.db $db			; $9d86
	.db $fc			; $9d87
	BRK					 ; $9d88: 00
	.db $1f			; $9d89
	.db $cb			; $9d8a
	.db $02			; $9d8b
	JMP $9e20			   ; $9d8c: 4C 20 9E
	LDA $62a3			   ; $9d8f: AD A3 62
	CMP #$0b				; $9d92: C9 0B
	BEQ $9d99			   ; $9d94: F0 03
	JMP $9e20			   ; $9d96: 4C 20 9E
	BRK					 ; $9d99: 00
	.db $1f			; $9d9a
	.db $db			; $9d9b
	.db $fc			; $9d9c
	BRK					 ; $9d9d: 00
	.db $1f			; $9d9e
	.db $cb			; $9d9f
	.db $02			; $9da0
	JMP $9e20			   ; $9da1: 4C 20 9E
	LDA $62a0			   ; $9da4: AD A0 62
	CMP #$13				; $9da7: C9 13
	BNE $9dc6			   ; $9da9: D0 1B
	LDA $44				 ; $9dab: A5 44
	CMP #$0b				; $9dad: C9 0B
	BCS $9dbb			   ; $9daf: B0 0A
	CMP #$05				; $9db1: C9 05
	BCC $9e20			   ; $9db3: 90 6B
	LDA $45				 ; $9db5: A5 45
	CMP #$1e				; $9db7: C9 1E
	BCS $9e20			   ; $9db9: B0 65
	BRK					 ; $9dbb: 00
	.db $1f			; $9dbc
	.db $db			; $9dbd
	.db $fc			; $9dbe
	BRK					 ; $9dbf: 00
	.db $1f			; $9dc0
	.db $cb			; $9dc1
	ORA ($4c,X)			 ; $9dc2: 01 4C
	JSR $c99e			   ; $9dc4: 20 9E C9
	ASL $56d0,X			 ; $9dc7: 1E D0 56
	LDA $62a3			   ; $9dca: AD A3 62
	CMP #$08				; $9dcd: C9 08
	BCC $9dde			   ; $9dcf: 90 0D
	LDA $44				 ; $9dd1: A5 44
	CMP #$0b				; $9dd3: C9 0B
	BCS $9d99			   ; $9dd5: B0 C2
	BRK					 ; $9dd7: 00
	.db $1f			; $9dd8
	.db $cb			; $9dd9
	.db $03			; $9dda
	JMP $9e20			   ; $9ddb: 4C 20 9E
	LDA $44				 ; $9dde: A5 44
	CMP #$05				; $9de0: C9 05
	BCC $9d99			   ; $9de2: 90 B5
	BCS $9dbb			   ; $9de4: B0 D5
	LDA $62a0			   ; $9de6: AD A0 62
	CMP #$25				; $9de9: C9 25
	BCC $9e20			   ; $9deb: 90 33
	BRK					 ; $9ded: 00
	.db $1f			; $9dee
	.db $db			; $9def
	.db $fc			; $9df0
	LDY #$03				; $9df1: A0 03
	TYA					 ; $9df3: 98
	PHA					 ; $9df4: 48
	BRK					 ; $9df5: 00
	STY $fb				 ; $9df6: 84 FB
	LDX #$04				; $9df8: A2 04
	JSR $c90c			   ; $9dfa: 20 0C C9
	PLA					 ; $9dfd: 68
	TAY					 ; $9dfe: A8
	DEY					 ; $9dff: 88
	BNE $9df3			   ; $9e00: D0 F1
	BRK					 ; $9e02: 00
	ORA $df				 ; $9e03: 05 DF
	LDY #$02				; $9e05: A0 02
	TYA					 ; $9e07: 98
	PHA					 ; $9e08: 48
	BRK					 ; $9e09: 00
	STY $fb				 ; $9e0a: 84 FB
	LDX #$04				; $9e0c: A2 04
	JSR $c90c			   ; $9e0e: 20 0C C9
	PLA					 ; $9e11: 68
	TAY					 ; $9e12: A8
	DEY					 ; $9e13: 88
	BNE $9e07			   ; $9e14: D0 F1
	LDX #$05				; $9e16: A2 05
	LDA #$00				; $9e18: A9 00
	STA $6f59,X			 ; $9e1a: 9D 59 6F
	DEX					 ; $9e1d: CA
	BPL $9e1a			   ; $9e1e: 10 FA
	LDA $629a			   ; $9e20: AD 9A 62
	EOR #$40				; $9e23: 49 40
	STA $629a			   ; $9e25: 8D 9A 62
	BRK					 ; $9e28: 00
	STA $fb,X			   ; $9e29: 95 FB
	CLC					 ; $9e2b: 18
	RTS					 ; $9e2c: 60
	LDY #$00				; $9e2d: A0 00
	LDA $7020,Y			 ; $9e2f: B9 20 70
	BMI $9e40			   ; $9e32: 30 0C
	TXA					 ; $9e34: 8A
	CMP $6f80,Y			 ; $9e35: D9 80 6F
	BEQ $9e3e			   ; $9e38: F0 04
	INY					 ; $9e3a: C8
	JMP $9e2f			   ; $9e3b: 4C 2F 9E
	SEC					 ; $9e3e: 38
	RTS					 ; $9e3f: 60
	CLC					 ; $9e40: 18
	RTS					 ; $9e41: 60
	LDY #$00				; $9e42: A0 00
	LDA $7020,Y			 ; $9e44: B9 20 70
	BMI $9e40			   ; $9e47: 30 F7
	TXA					 ; $9e49: 8A
	CMP $6f60,Y			 ; $9e4a: D9 60 6F
	BEQ $9e3e			   ; $9e4d: F0 EF
	INY					 ; $9e4f: C8
	JMP $9e44			   ; $9e50: 4C 44 9E
	LDX $62a3			   ; $9e53: AE A3 62
	LDY $62a0			   ; $9e56: AC A0 62
	LDA #$19				; $9e59: A9 19
	JSR $9f79			   ; $9e5b: 20 79 9F
	LDX $62a3			   ; $9e5e: AE A3 62
	INX					 ; $9e61: E8
	LDY $62a0			   ; $9e62: AC A0 62
	LDA #$1a				; $9e65: A9 1A
	JSR $9f79			   ; $9e67: 20 79 9F
	LDX $62a3			   ; $9e6a: AE A3 62
	LDY $62a0			   ; $9e6d: AC A0 62
	INY					 ; $9e70: C8
	LDA #$1b				; $9e71: A9 1B
	JSR $9f79			   ; $9e73: 20 79 9F
	LDX $62a3			   ; $9e76: AE A3 62
	INX					 ; $9e79: E8
	LDY $62a0			   ; $9e7a: AC A0 62
	INY					 ; $9e7d: C8
	LDA #$1c				; $9e7e: A9 1C
	JSR $9f79			   ; $9e80: 20 79 9F
	BRK					 ; $9e83: 00
	.db $1f			; $9e84
	.db $eb			; $9e85
	RTI					 ; $9e86: 40
	BEQ $9eee			   ; $9e87: F0 65
	LDA $629a			   ; $9e89: AD 9A 62
	AND #$03				; $9e8c: 29 03
	CMP #$01				; $9e8e: C9 01
	BEQ $9eb2			   ; $9e90: F0 20
	CMP #$02				; $9e92: C9 02
	BEQ $9ed0			   ; $9e94: F0 3A
	LDX $62a3			   ; $9e96: AE A3 62
	INX					 ; $9e99: E8
	LDY $62a0			   ; $9e9a: AC A0 62
	LDA #$1d				; $9e9d: A9 1D
	JSR $9f51			   ; $9e9f: 20 51 9F
	LDX $62a3			   ; $9ea2: AE A3 62
	INX					 ; $9ea5: E8
	LDY $62a0			   ; $9ea6: AC A0 62
	INY					 ; $9ea9: C8
	LDA #$1e				; $9eaa: A9 1E
	JSR $9f51			   ; $9eac: 20 51 9F
	JMP $ff74			   ; $9eaf: 4C 74 FF
	LDX $62a3			   ; $9eb2: AE A3 62
	INX					 ; $9eb5: E8
	INX					 ; $9eb6: E8
	LDY $62a0			   ; $9eb7: AC A0 62
	LDA #$1d				; $9eba: A9 1D
	JSR $9f51			   ; $9ebc: 20 51 9F
	LDX $62a3			   ; $9ebf: AE A3 62
	INX					 ; $9ec2: E8
	INX					 ; $9ec3: E8
	LDY $62a0			   ; $9ec4: AC A0 62
	INY					 ; $9ec7: C8
	LDA #$1e				; $9ec8: A9 1E
	JSR $9f51			   ; $9eca: 20 51 9F
	JMP $ff74			   ; $9ecd: 4C 74 FF
	LDX $62a3			   ; $9ed0: AE A3 62
	LDY $62a0			   ; $9ed3: AC A0 62
	INY					 ; $9ed6: C8
	INY					 ; $9ed7: C8
	LDA #$1d				; $9ed8: A9 1D
	JSR $9f51			   ; $9eda: 20 51 9F
	LDX $62a3			   ; $9edd: AE A3 62
	INX					 ; $9ee0: E8
	LDY $62a0			   ; $9ee1: AC A0 62
	INY					 ; $9ee4: C8
	INY					 ; $9ee5: C8
	LDA #$1e				; $9ee6: A9 1E
	JSR $9f51			   ; $9ee8: 20 51 9F
	JMP $ff74			   ; $9eeb: 4C 74 FF
	LDA $629a			   ; $9eee: AD 9A 62
	AND #$03				; $9ef1: 29 03
	CMP #$01				; $9ef3: C9 01
	BEQ $9f19			   ; $9ef5: F0 22
	CMP #$02				; $9ef7: C9 02
	BEQ $9f35			   ; $9ef9: F0 3A
	LDX $62a3			   ; $9efb: AE A3 62
	INX					 ; $9efe: E8
	INX					 ; $9eff: E8
	LDY $62a0			   ; $9f00: AC A0 62
	LDA #$0a				; $9f03: A9 0A
	JSR $9f51			   ; $9f05: 20 51 9F
	LDX $62a3			   ; $9f08: AE A3 62
	INX					 ; $9f0b: E8
	INX					 ; $9f0c: E8
	LDY $62a0			   ; $9f0d: AC A0 62
	INY					 ; $9f10: C8
	LDA #$0a				; $9f11: A9 0A
	JSR $9f51			   ; $9f13: 20 51 9F
	JMP $ff74			   ; $9f16: 4C 74 FF
	LDX $62a3			   ; $9f19: AE A3 62
	DEX					 ; $9f1c: CA
	LDY $62a0			   ; $9f1d: AC A0 62
	LDA #$0a				; $9f20: A9 0A
	JSR $9f51			   ; $9f22: 20 51 9F
	LDX $62a3			   ; $9f25: AE A3 62
	DEX					 ; $9f28: CA
	LDY $62a0			   ; $9f29: AC A0 62
	INY					 ; $9f2c: C8
	LDA #$0a				; $9f2d: A9 0A
	JSR $9f51			   ; $9f2f: 20 51 9F
	JMP $ff74			   ; $9f32: 4C 74 FF
	LDX $62a3			   ; $9f35: AE A3 62
	LDY $62a0			   ; $9f38: AC A0 62
	DEY					 ; $9f3b: 88
	LDA #$0a				; $9f3c: A9 0A
	JSR $9f51			   ; $9f3e: 20 51 9F
	LDX $62a3			   ; $9f41: AE A3 62
	INX					 ; $9f44: E8
	LDY $62a0			   ; $9f45: AC A0 62
	DEY					 ; $9f48: 88
	LDA #$0a				; $9f49: A9 0A
	JSR $9f51			   ; $9f4b: 20 51 9F
	JMP $ff74			   ; $9f4e: 4C 74 FF
	CPX #$02				; $9f51: E0 02
	BEQ $9f5d			   ; $9f53: F0 08
	CPX #$0d				; $9f55: E0 0D
	BEQ $9f5d			   ; $9f57: F0 04
	BRK					 ; $9f59: 00
	ORA #$ef				; $9f5a: 09 EF
	RTS					 ; $9f5c: 60
	LDX $62a3			   ; $9f5d: AE A3 62
	LDY $62a0			   ; $9f60: AC A0 62
	DEY					 ; $9f63: 88
	LDA #$0a				; $9f64: A9 0A
	BRK					 ; $9f66: 00
	ORA #$ef				; $9f67: 09 EF
	LDX $62a3			   ; $9f69: AE A3 62
	INX					 ; $9f6c: E8
	LDY $62a0			   ; $9f6d: AC A0 62
	DEY					 ; $9f70: 88
	LDA #$0a				; $9f71: A9 0A
	BRK					 ; $9f73: 00
	ORA #$ef				; $9f74: 09 EF
	JMP $ff74			   ; $9f76: 4C 74 FF
	BRK					 ; $9f79: 00
	.db $1f			; $9f7a
	.db $eb			; $9f7b
	ORA ($f0,X)			 ; $9f7c: 01 F0
	.db $d2			; $9f7e
	BRK					 ; $9f7f: 00
	.db $1f			; $9f80
	.db $eb			; $9f81
	.db $02			; $9f82
	BEQ $9f51			   ; $9f83: F0 CC
	BRK					 ; $9f85: 00
	.db $1f			; $9f86
	.db $eb			; $9f87
	RTI					 ; $9f88: 40
	BEQ $9f51			   ; $9f89: F0 C6
	DEX					 ; $9f8b: CA
	JMP $9f51			   ; $9f8c: 4C 51 9F
	LDY #$17				; $9f8f: A0 17
	LDX #$17				; $9f91: A2 17
	BRK					 ; $9f93: 00
	.db $1f			; $9f94
	.db $eb			; $9f95
	RTI					 ; $9f96: 40
	BEQ $9fa6			   ; $9f97: F0 0D
	LDX #$2f				; $9f99: A2 2F
	LDA $629a			   ; $9f9b: AD 9A 62
	AND #$03				; $9f9e: 29 03
	CMP #$02				; $9fa0: C9 02
	BEQ $9fa6			   ; $9fa2: F0 02
	LDX #$47				; $9fa4: A2 47
	LDA $9fb1,X			 ; $9fa6: BD B1 9F
	STA $7664,Y			 ; $9fa9: 99 64 76
	DEX					 ; $9fac: CA
	DEY					 ; $9fad: 88
	BPL $9fa6			   ; $9fae: 10 F6
	RTS					 ; $9fb0: 60
	.db $f2			; $9fb1
	.db $f3			; $9fb2
	INC $f7,X			   ; $9fb3: F6 F7
	.db $f4			; $9fb5
	SBC $f7,X			   ; $9fb6: F5 F7
	SED					 ; $9fb8: F8
	SBC $fcfa,Y			 ; $9fb9: F9 FA FC
	SBC $fbfa,X			 ; $9fbc: FD FA FB
	INC $adff,X			 ; $9fbf: FE FF AD
	LDX $b0af			   ; $9fc2: AE AF B0
	LDA $afae			   ; $9fc5: AD AE AF
	BCS $9f77			   ; $9fc8: B0 AD
	LDX $f3f2			   ; $9fca: AE F2 F3
	LDA $f4ae			   ; $9fcd: AD AE F4
	SBC $f6,X			   ; $9fd0: F5 F6
	.db $f7			; $9fd2
	SBC $f7fa,Y			 ; $9fd3: F9 FA F7
	SED					 ; $9fd6: F8
	.db $fa			; $9fd7
	.db $fb			; $9fd8
	.db $fc			; $9fd9
	SBC $b0af,X			 ; $9fda: FD AF B0
	INC $afff,X			 ; $9fdd: FE FF AF
	BCS $9f8f			   ; $9fe0: B0 AD
	.db $f2			; $9fe2
	.db $af			; $9fe3
	INC $f3,X			   ; $9fe4: F6 F3
	.db $f4			; $9fe6
	.db $f7			; $9fe7
	.db $f7			; $9fe8
	LDA $aff9			   ; $9fe9: AD F9 AF
	.db $fc			; $9fec
	.db $fa			; $9fed
	.db $fa			; $9fee
	SBC $f5fe,X			 ; $9fef: FD FE F5
	LDX $b0f8			   ; $9ff2: AE F8 B0
	.db $fb			; $9ff5
	LDX $b0ff			   ; $9ff6: AE FF B0
	BRK					 ; $9ff9: 00
	ASL					 ; $9ffa: 0A
	.db $eb			; $9ffb
	.db $04			; $9ffc
	BNE $a043			   ; $9ffd: D0 44
	LDA $6fc0			   ; $9fff: AD C0 6F
	CMP #$0b				; $a002: C9 0B
	BNE $a03f			   ; $a004: D0 39
	LDA $44				 ; $a006: A5 44
	SEC					 ; $a008: 38
	SBC #$06				; $a009: E9 06
	CMP #$03				; $a00b: C9 03
	BCS $a03f			   ; $a00d: B0 30
	BRK					 ; $a00f: 00
	ROL $eb				 ; $a010: 26 EB
	PHP					 ; $a012: 08
	BNE $a043			   ; $a013: D0 2E
	BRK					 ; $a015: 00
	ROL $cb				 ; $a016: 26 CB
	PHP					 ; $a018: 08
	JSR $b16b			   ; $a019: 20 6B B1
	BRK					 ; $a01c: 00
	.db $07			; $a01d
	.db $6f			; $a01e
	.db $43			; $a01f
	BRK					 ; $a020: 00
	.db $c3			; $a021
	.db $4b			; $a022
	BRK					 ; $a023: 00
	.db $07			; $a024
	.db $6f			; $a025
	PHA					 ; $a026: 48
	CMP #$01				; $a027: C9 01
	BCS $a045			   ; $a029: B0 1A
	BRK					 ; $a02b: 00
	CMP ($4b,X)			 ; $a02c: C1 4B
	JSR $d20a			   ; $a02e: 20 0A D2
	LDA #$8f				; $a031: A9 8F
	JSR $a23a			   ; $a033: 20 3A A2
	LDA #$2f				; $a036: A9 2F
	BRK					 ; $a038: 00
	.db $07			; $a039
	.db $cf			; $a03a
	LDA #$10				; $a03b: A9 10
	STA $51				 ; $a03d: 85 51
	BRK					 ; $a03f: 00
	ROL $db				 ; $a040: 26 DB
	.db $f7			; $a042
	CLC					 ; $a043: 18
	RTS					 ; $a044: 60
	JSR $d1f3			   ; $a045: 20 F3 D1
	LDA #$10				; $a048: A9 10
	STA $51				 ; $a04a: 85 51
	CLC					 ; $a04c: 18
	RTS					 ; $a04d: 60
	BRK					 ; $a04e: 00
	ASL					 ; $a04f: 0A
	.db $cb			; $a050
	.db $04			; $a051
	LDA #$30				; $a052: A9 30
	BRK					 ; $a054: 00
	.db $07			; $a055
	.db $cf			; $a056
	LDA #$06				; $a057: A9 06
	STA $51				 ; $a059: 85 51
	CLC					 ; $a05b: 18
	RTS					 ; $a05c: 60
	LDA $51				 ; $a05d: A5 51
	PHA					 ; $a05f: 48
	BRK					 ; $a060: 00
	.db $07			; $a061
	.db $6f			; $a062
	.db $43			; $a063
	BRK					 ; $a064: 00
	ROR $3b				 ; $a065: 66 3B
	LDA #$76				; $a067: A9 76
	BRK					 ; $a069: 00
	ROR $73				 ; $a06a: 66 73
	STA $f9				 ; $a06c: 85 F9
	LDA #$71				; $a06e: A9 71
	STA $fa				 ; $a070: 85 FA
	BRK					 ; $a072: 00
	LDY #$2b				; $a073: A0 2B
	BRK					 ; $a075: 00
	.db $2b			; $a076
	.db $fb			; $a077
	BRK					 ; $a078: 00
	.db $07			; $a079
	.db $9f			; $a07a
	BRK					 ; $a07b: 00
	ORA #$9f				; $a07c: 09 9F
	JSR $a7a4			   ; $a07e: 20 A4 A7
	BCC $a089			   ; $a081: 90 06
	BRK					 ; $a083: 00
	STX $4c4b			   ; $a084: 8E 4B 4C
	STY $00a0			   ; $a087: 8C A0 00
	.db $27			; $a08a
	.db $4b			; $a08b
	JSR $d214			   ; $a08c: 20 14 D2
	JSR $d1f3			   ; $a08f: 20 F3 D1
	PLA					 ; $a092: 68
	STA $51				 ; $a093: 85 51
	SEC					 ; $a095: 38
	RTS					 ; $a096: 60
	LDA #$8f				; $a097: A9 8F
	JSR $a23a			   ; $a099: 20 3A A2
	LDX #$0f				; $a09c: A2 0F
	LDY #$07				; $a09e: A0 07
	JSR $a0a5			   ; $a0a0: 20 A5 A0
	LDY #$08				; $a0a3: A0 08
	LDA $7060,X			 ; $a0a5: BD 60 70
	STA $7060,Y			 ; $a0a8: 99 60 70
	LDA $7080,X			 ; $a0ab: BD 80 70
	STA $7080,Y			 ; $a0ae: 99 80 70
	SEC					 ; $a0b1: 38
	RTS					 ; $a0b2: 60
	BRK					 ; $a0b3: 00
	.db $07			; $a0b4
	.db $6f			; $a0b5
	.db $43			; $a0b6
	BRK					 ; $a0b7: 00
	CPY $4b				 ; $a0b8: C4 4B
	JSR $d218			   ; $a0ba: 20 18 D2
	LDA #$11				; $a0bd: A9 11
	BRK					 ; $a0bf: 00
	.db $07			; $a0c0
	.db $cf			; $a0c1
	LDA #$1e				; $a0c2: A9 1E
	STA $51				 ; $a0c4: 85 51
	CLC					 ; $a0c6: 18
	RTS					 ; $a0c7: 60
	LDA #$00				; $a0c8: A9 00
	STA $54				 ; $a0ca: 85 54
	LDA $54				 ; $a0cc: A5 54
	ASL					 ; $a0ce: 0A
	TAX					 ; $a0cf: AA
	LDY $a113,X			 ; $a0d0: BC 13 A1
	LDA $a112,X			 ; $a0d3: BD 12 A1
	TAX					 ; $a0d6: AA
	LDA #$10				; $a0d7: A9 10
	BRK					 ; $a0d9: 00
	ORA #$ef				; $a0da: 09 EF
	LDX #$0a				; $a0dc: A2 0A
	JSR $c90c			   ; $a0de: 20 0C C9
	INC $54				 ; $a0e1: E6 54
	LDA $54				 ; $a0e3: A5 54
	CMP #$09				; $a0e5: C9 09
	BCC $a0cc			   ; $a0e7: 90 E3
	LDA #$80				; $a0e9: A9 80
	STA $0300			   ; $a0eb: 8D 00 03
	LDA #$40				; $a0ee: A9 40
	STA $0301			   ; $a0f0: 8D 01 03
	LDA #$00				; $a0f3: A9 00
	STA $0302			   ; $a0f5: 8D 02 03
	LDX #$3f				; $a0f8: A2 3F
	LDA $a124,X			 ; $a0fa: BD 24 A1
	STA $0303,X			 ; $a0fd: 9D 03 03
	DEX					 ; $a100: CA
	BPL $a0fa			   ; $a101: 10 F7
	INC $050b			   ; $a103: EE 0B 05
	JSR $c62d			   ; $a106: 20 2D C6
	LDX #$00				; $a109: A2 00
	LDA #$11				; $a10b: A9 11
	STA $7046,X			 ; $a10d: 9D 46 70
	SEC					 ; $a110: 38
	RTS					 ; $a111: 60
	.db $0b			; $a112
	ASL $0b0e			   ; $a113: 0E 0E 0B
	.db $0b			; $a116
	.db $0c			; $a117
	ASL $0c0d			   ; $a118: 0E 0D 0C
	ASL $0b0d			   ; $a11b: 0E 0D 0B
	.db $0b			; $a11e
	ORA $0c0e			   ; $a11f: 0D 0E 0C
	ORA $070e			   ; $a122: 0D 0E 07
	.db $0f			; $a125
	.db $1f			; $a126
	.db $9f			; $a127
	.db $5f			; $a128
	.db $7f			; $a129
	.db $3f			; $a12a
	.db $3f			; $a12b
	.db $07			; $a12c
	.db $0f			; $a12d
	.db $1f			; $a12e
	ORA $1e1c,X			 ; $a12f: 1D 1C 1E
	.db $1f			; $a132
	ROL $ecd8,X			 ; $a133: 3E D8 EC
	.db $f4			; $a136
	INC $f6,X			   ; $a137: F6 F6
	LDX $ecb6			   ; $a139: AE B6 EC
	SED					 ; $a13c: F8
	.db $9c			; $a13d
	.db $7c			; $a13e
	INC $5ebe,X			 ; $a13f: FE BE 5E
	LSR $791c			   ; $a142: 4E 1C 79
	BVS $a178			   ; $a145: 70 31
	ORA $0100			   ; $a147: 0D 00 01
	BRK					 ; $a14a: 00
	.db $07			; $a14b
	ROR $3e7f,X			 ; $a14c: 7E 7F 3E
	.db $02			; $a14f
	.db $0f			; $a150
	ASL $381f,X			 ; $a151: 1E 1F 38
	.db $80			; $a154
	CLI					 ; $a155: 58
	SEI					 ; $a156: 78
	.db $74			; $a157
	RTI					 ; $a158: 40
	.db $80			; $a159
	.db $1c			; $a15a
	LDY $a67c,X			 ; $a15b: BC 7C A6
	STX $88				 ; $a15e: 86 88
	LDX $e07e,Y			 ; $a160: BE 7E E0
	.db $7c			; $a163
	LDA $45				 ; $a164: A5 45
	CMP #$13				; $a166: C9 13
	BNE $a18a			   ; $a168: D0 20
	DEC $45				 ; $a16a: C6 45
	DEC $6f80			   ; $a16c: CE 80 6F
	LDA #$00				; $a16f: A9 00
	STA $3e				 ; $a171: 85 3E
	JSR $a179			   ; $a173: 20 79 A1
	JSR $c007			   ; $a176: 20 07 C0
	LDX #$02				; $a179: A2 02
	LDA $7001,X			 ; $a17b: BD 01 70
	EOR #$02				; $a17e: 49 02
	AND #$7f				; $a180: 29 7F
	STA $7001,X			 ; $a182: 9D 01 70
	DEX					 ; $a185: CA
	BPL $a17b			   ; $a186: 10 F3
	SEC					 ; $a188: 38
	RTS					 ; $a189: 60
	CLC					 ; $a18a: 18
	RTS					 ; $a18b: 60
	JSR $c891			   ; $a18c: 20 91 C8
	AND #$07				; $a18f: 29 07
	LDX $51				 ; $a191: A6 51
	STA $7180,X			 ; $a193: 9D 80 71
	INC $7180,X			 ; $a196: FE 80 71
	INC $7180,X			 ; $a199: FE 80 71
	LDA $7080,X			 ; $a19c: BD 80 70
	CLC					 ; $a19f: 18
	ADC #$02				; $a1a0: 69 02
	STA $70c0,X			 ; $a1a2: 9D C0 70
	LDA $7060,X			 ; $a1a5: BD 60 70
	ADC #$00				; $a1a8: 69 00
	STA $70a0,X			 ; $a1aa: 9D A0 70
	SEC					 ; $a1ad: 38
	RTS					 ; $a1ae: 60
	STA tmp0				; $a1af: 85 00
	LDA $6f66,X			 ; $a1b1: BD 66 6F
	STA $6f61,Y			 ; $a1b4: 99 61 6F
	LDA $6f86,X			 ; $a1b7: BD 86 6F
	STA $6f81,Y			 ; $a1ba: 99 81 6F
	LDA $6fa6,X			 ; $a1bd: BD A6 6F
	STA $6fa1,Y			 ; $a1c0: 99 A1 6F
	LDA $6fc6,X			 ; $a1c3: BD C6 6F
	STA $6fc1,Y			 ; $a1c6: 99 C1 6F
	LDA $6fe6,X			 ; $a1c9: BD E6 6F
	STA $6fe1,Y			 ; $a1cc: 99 E1 6F
	LDA #$00				; $a1cf: A9 00
	STA $7021,Y			 ; $a1d1: 99 21 70
	LDA #$81				; $a1d4: A9 81
	STA $6f66,X			 ; $a1d6: 9D 66 6F
	STA $6f86,X			 ; $a1d9: 9D 86 6F
	STA $6fa6,X			 ; $a1dc: 9D A6 6F
	STA $6fc6,X			 ; $a1df: 9D C6 6F
	LDA $7001,Y			 ; $a1e2: B9 01 70
	AND #$bc				; $a1e5: 29 BC
	ORA #$40				; $a1e7: 09 40
	ORA tmp0				; $a1e9: 05 00
	STA $7001,Y			 ; $a1eb: 99 01 70
	INY					 ; $a1ee: C8
	SEC					 ; $a1ef: 38
	RTS					 ; $a1f0: 60
	.db $03			; $a1f1
	.db $02			; $a1f2
	.db $03			; $a1f3
	.db $02			; $a1f4
	LDA $627e			   ; $a1f5: AD 7E 62
	ASL					 ; $a1f8: 0A
	ASL					 ; $a1f9: 0A
	ASL					 ; $a1fa: 0A
	ASL					 ; $a1fb: 0A
	RTS					 ; $a1fc: 60
	LDA $627e			   ; $a1fd: AD 7E 62
	EOR #$80				; $a200: 49 80
	ASL					 ; $a202: 0A
	RTS					 ; $a203: 60
	LDX #$02				; $a204: A2 02
	LDA $7000,X			 ; $a206: BD 00 70
	AND #$fc				; $a209: 29 FC
	STA $7000,X			 ; $a20b: 9D 00 70
	DEX					 ; $a20e: CA
	BPL $a206			   ; $a20f: 10 F5
	SEC					 ; $a211: 38
	RTS					 ; $a212: 60
	LDX #$0b				; $a213: A2 0B
	JSR $a21c			   ; $a215: 20 1C A2
	BCS $a24b			   ; $a218: B0 31
	LDX #$0a				; $a21a: A2 0A
	TXA					 ; $a21c: 8A
	PHA					 ; $a21d: 48
	JSR $98bd			   ; $a21e: 20 BD 98
	PLA					 ; $a221: 68
	TAX					 ; $a222: AA
	BCC $a24b			   ; $a223: 90 26
	LDY #$07				; $a225: A0 07
	LDA $7080,Y			 ; $a227: B9 80 70
	CLC					 ; $a22a: 18
	ADC #$01				; $a22b: 69 01
	STA $7080,X			 ; $a22d: 9D 80 70
	LDA $7060,Y			 ; $a230: B9 60 70
	ADC #$00				; $a233: 69 00
	STA $7060,X			 ; $a235: 9D 60 70
	LDA #$8f				; $a238: A9 8F
	STA $0530			   ; $a23a: 8D 30 05
	LDA #$01				; $a23d: A9 01
	STA $0531			   ; $a23f: 8D 31 05
	LDA #$00				; $a242: A9 00
	STA $0533			   ; $a244: 8D 33 05
	STA $0532			   ; $a247: 8D 32 05
	SEC					 ; $a24a: 38
	RTS					 ; $a24b: 60
	JSR $995e			   ; $a24c: 20 5E 99
	BRK					 ; $a24f: 00
	LSR					 ; $a250: 4A
	.db $3b			; $a251
	JSR $d20a			   ; $a252: 20 0A D2
	LDA #$00				; $a255: A9 00
	STA $0530			   ; $a257: 8D 30 05
	BRK					 ; $a25a: 00
	.db $82			; $a25b
	.db $fb			; $a25c
	JSR $c5c5			   ; $a25d: 20 C5 C5
	LDA #$01				; $a260: A9 01
	STA $64				 ; $a262: 85 64
	LDA #$19				; $a264: A9 19
	STA $44				 ; $a266: 85 44
	LDA #$02				; $a268: A9 02
	STA $45				 ; $a26a: 85 45
	LDA #$83				; $a26c: A9 83
	BRK					 ; $a26e: 00
	AND ($ef),Y			 ; $a26f: 31 EF
	LDA #$06				; $a271: A9 06
	STA $51				 ; $a273: 85 51
	JSR $c5bf			   ; $a275: 20 BF C5
	CLC					 ; $a278: 18
	RTS					 ; $a279: 60
	LDX #$00				; $a27a: A2 00
	LDA $6fa0			   ; $a27c: AD A0 6F
	AND #$fe				; $a27f: 29 FE
	CMP $a2ef,X			 ; $a281: DD EF A2
	BEQ $a29c			   ; $a284: F0 16
	LDA $64				 ; $a286: A5 64
	CMP #$02				; $a288: C9 02
	BEQ $a292			   ; $a28a: F0 06
	INX					 ; $a28c: E8
	INX					 ; $a28d: E8
	CPX #$04				; $a28e: E0 04
	BCC $a27c			   ; $a290: 90 EA
	BRK					 ; $a292: 00
	ASL $fbdb			   ; $a293: 0E DB FB
	LDA #$06				; $a296: A9 06
	STA $51				 ; $a298: 85 51
	CLC					 ; $a29a: 18
	RTS					 ; $a29b: 60
	LDA $6fc0			   ; $a29c: AD C0 6F
	CMP $a2f0,X			 ; $a29f: DD F0 A2
	BNE $a286			   ; $a2a2: D0 E2
	BRK					 ; $a2a4: 00
	ASL $04eb			   ; $a2a5: 0E EB 04
	BNE $a296			   ; $a2a8: D0 EC
	BRK					 ; $a2aa: 00
	ASL $04cb			   ; $a2ab: 0E CB 04
	JSR $b16b			   ; $a2ae: 20 6B B1
	JSR $995e			   ; $a2b1: 20 5E 99
	BRK					 ; $a2b4: 00
	.db $b3			; $a2b5
	.db $3b			; $a2b6
	BRK					 ; $a2b7: 00
	.db $07			; $a2b8
	.db $6f			; $a2b9
	PHA					 ; $a2ba: 48
	CMP #$01				; $a2bb: C9 01
	BCS $a2e9			   ; $a2bd: B0 2A
	BRK					 ; $a2bf: 00
	LDX $fb				 ; $a2c0: A6 FB
	LDA $6fa0			   ; $a2c2: AD A0 6F
	AND #$fe				; $a2c5: 29 FE
	TAY					 ; $a2c7: A8
	LDX #$07				; $a2c8: A2 07
	JSR $a2f3			   ; $a2ca: 20 F3 A2
	INY					 ; $a2cd: C8
	LDX #$08				; $a2ce: A2 08
	JSR $a2f3			   ; $a2d0: 20 F3 A2
	LDX #$09				; $a2d3: A2 09
	STA $7040,X			 ; $a2d5: 9D 40 70
	LDA #$00				; $a2d8: A9 00
	STA $6f58			   ; $a2da: 8D 58 6F
	STA $6f48			   ; $a2dd: 8D 48 6F
	STA $6f49			   ; $a2e0: 8D 49 6F
	STA $6f4c			   ; $a2e3: 8D 4C 6F
	STA $6f4d			   ; $a2e6: 8D 4D 6F
	JSR $d1f3			   ; $a2e9: 20 F3 D1
	JMP $a296			   ; $a2ec: 4C 96 A2
	.db $14			; $a2ef
	ASL					 ; $a2f0: 0A
	PHP					 ; $a2f1: 08
	ASL $9d98			   ; $a2f2: 0E 98 9D
	RTS					 ; $a2f5: 60
	.db $6f			; $a2f6
	STA $6fa0,X			 ; $a2f7: 9D A0 6F
	LDA $6fc0			   ; $a2fa: AD C0 6F
	SEC					 ; $a2fd: 38
	SBC #$02				; $a2fe: E9 02
	STA $6f80,X			 ; $a300: 9D 80 6F
	STA $6fc0,X			 ; $a303: 9D C0 6F
	LDA #$11				; $a306: A9 11
	STA $7040,X			 ; $a308: 9D 40 70
	RTS					 ; $a30b: 60
	LDX #$07				; $a30c: A2 07
	JSR $a313			   ; $a30e: 20 13 A3
	LDX #$08				; $a311: A2 08
	LDY $6fc0,X			 ; $a313: BC C0 6F
	LDA $6fa0,X			 ; $a316: BD A0 6F
	TAX					 ; $a319: AA
	LDA #$18				; $a31a: A9 18
	BRK					 ; $a31c: 00
	ORA #$ef				; $a31d: 09 EF
	CLC					 ; $a31f: 18
	RTS					 ; $a320: 60
	LDA #$f3				; $a321: A9 F3
	STA $55				 ; $a323: 85 55
	LDA #$02				; $a325: A9 02
	STA $57				 ; $a327: 85 57
	LDA #$04				; $a329: A9 04
	STA $56				 ; $a32b: 85 56
	LDA #$1e				; $a32d: A9 1E
	STA $58				 ; $a32f: 85 58
	BRK					 ; $a331: 00
	.db $93			; $a332
	.db $fb			; $a333
	BRK					 ; $a334: 00
	BMI $a326			   ; $a335: 30 EF
	BRK					 ; $a337: 00
	.db $2f			; $a338
	.db $ef			; $a339
	LDA #$06				; $a33a: A9 06
	STA $51				 ; $a33c: 85 51
	JSR $b16b			   ; $a33e: 20 6B B1
	CLC					 ; $a341: 18
	RTS					 ; $a342: 60
	LDX #$02				; $a343: A2 02
	LDA $7000,X			 ; $a345: BD 00 70
	ORA #$03				; $a348: 09 03
	STA $7000,X			 ; $a34a: 9D 00 70
	DEX					 ; $a34d: CA
	BPL $a345			   ; $a34e: 10 F5
	SEC					 ; $a350: 38
	RTS					 ; $a351: 60
	LDA $6fa0			   ; $a352: AD A0 6F
	AND #$fe				; $a355: 29 FE
	CMP #$0e				; $a357: C9 0E
	BNE $a365			   ; $a359: D0 0A
	LDA $6fc0			   ; $a35b: AD C0 6F
	CMP #$03				; $a35e: C9 03
	BNE $a365			   ; $a360: D0 03
	JMP $ae46			   ; $a362: 4C 46 AE
	CLC					 ; $a365: 18
	RTS					 ; $a366: 60
	LDA $44				 ; $a367: A5 44
	CMP #$0c				; $a369: C9 0C
	BNE $a38c			   ; $a36b: D0 1F
	LDA $45				 ; $a36d: A5 45
	CMP #$24				; $a36f: C9 24
	BNE $a38c			   ; $a371: D0 19
	LDA #$83				; $a373: A9 83
	STA $6f41			   ; $a375: 8D 41 6F
	STA $6f46			   ; $a378: 8D 46 6F
	STA $6f47			   ; $a37b: 8D 47 6F
	LDA #$11				; $a37e: A9 11
	LDX #$01				; $a380: A2 01
	STA $7046,X			 ; $a382: 9D 46 70
	LDX #$02				; $a385: A2 02
	STA $7046,X			 ; $a387: 9D 46 70
	SEC					 ; $a38a: 38
	RTS					 ; $a38b: 60
	CLC					 ; $a38c: 18
	RTS					 ; $a38d: 60
	LDA #$05				; $a38e: A9 05
	STA $6f47			   ; $a390: 8D 47 6F
	LDA #$ff				; $a393: A9 FF
	STA $054e			   ; $a395: 8D 4E 05
	STA $054f			   ; $a398: 8D 4F 05
	SEC					 ; $a39b: 38
	RTS					 ; $a39c: 60
	LDX $6fa0			   ; $a39d: AE A0 6F
	CPX #$02				; $a3a0: E0 02
	BNE $a3d8			   ; $a3a2: D0 34
	LDY $6fc0			   ; $a3a4: AC C0 6F
	CPY #$1a				; $a3a7: C0 1A
	BNE $a3d8			   ; $a3a9: D0 2D
	STX $44				 ; $a3ab: 86 44
	STX $6f60			   ; $a3ad: 8E 60 6F
	STY $45				 ; $a3b0: 84 45
	STY $6f80			   ; $a3b2: 8C 80 6F
	LDA $7000			   ; $a3b5: AD 00 70
	AND #$fc				; $a3b8: 29 FC
	ORA #$01				; $a3ba: 09 01
	STA $7000			   ; $a3bc: 8D 00 70
	LDX $51				 ; $a3bf: A6 51
	LDA $7000,X			 ; $a3c1: BD 00 70
	ORA #$03				; $a3c4: 09 03
	STA $7000,X			 ; $a3c6: 9D 00 70
	LDA #$00				; $a3c9: A9 00
	STA $3e				 ; $a3cb: 85 3E
	LDA $51				 ; $a3cd: A5 51
	PHA					 ; $a3cf: 48
	BRK					 ; $a3d0: 00
	ORA ($5f),Y			 ; $a3d1: 11 5F
	PLA					 ; $a3d3: 68
	STA $51				 ; $a3d4: 85 51
	SEC					 ; $a3d6: 38
	RTS					 ; $a3d7: 60
	CLC					 ; $a3d8: 18
	RTS					 ; $a3d9: 60
	BRK					 ; $a3da: 00
	ORA #$eb				; $a3db: 09 EB
	.db $04			; $a3dd
	BNE $a404			   ; $a3de: D0 24
	JSR $c891			   ; $a3e0: 20 91 C8
	AND #$07				; $a3e3: 29 07
	TAX					 ; $a3e5: AA
	LDA $a3fc,X			 ; $a3e6: BD FC A3
	LDX #$03				; $a3e9: A2 03
	BRK					 ; $a3eb: 00
	ORA $a687			   ; $a3ec: 0D 87 A6
	EOR ($bd),Y			 ; $a3ef: 51 BD
	CPX #$6f				; $a3f1: E0 6F
	AND #$f0				; $a3f3: 29 F0
	ORA #$03				; $a3f5: 09 03
	STA $6fe0,X			 ; $a3f7: 9D E0 6F
	SEC					 ; $a3fa: 38
	RTS					 ; $a3fb: 60
	ORA ($14),Y			 ; $a3fc: 11 14
	.db $17			; $a3fe
	CLC					 ; $a3ff: 18
	.db $3b			; $a400
	.db $1f			; $a401
	.db $22			; $a402
	AND ($a6,X)			 ; $a403: 21 A6
	EOR ($a9),Y			 ; $a405: 51 A9
	.db $80			; $a407
	STA $6f60,X			 ; $a408: 9D 60 6F
	STA $6fa0,X			 ; $a40b: 9D A0 6F
	STA $6f80,X			 ; $a40e: 9D 80 6F
	STA $6fc0,X			 ; $a411: 9D C0 6F
	CLC					 ; $a414: 18
	RTS					 ; $a415: 60
	JSR $c8ec			   ; $a416: 20 EC C8
	LDA $14				 ; $a419: A5 14
	AND #$f0				; $a41b: 29 F0
	BEQ $a42f			   ; $a41d: F0 10
	LDX #$00				; $a41f: A2 00
	STX $6fe0			   ; $a421: 8E E0 6F
	DEC $7000			   ; $a424: CE 00 70
	JSR $d7f1			   ; $a427: 20 F1 D7
	JSR $a42f			   ; $a42a: 20 2F A4
	SEC					 ; $a42d: 38
	RTS					 ; $a42e: 60
	LDA #$82				; $a42f: A9 82
	STA $0530			   ; $a431: 8D 30 05
	LDA #$01				; $a434: A9 01
	STA $0531			   ; $a436: 8D 31 05
	LDA #$00				; $a439: A9 00
	STA $0533			   ; $a43b: 8D 33 05
	STA $0532			   ; $a43e: 8D 32 05
	CLC					 ; $a441: 18
	RTS					 ; $a442: 60
	LDA $7021			   ; $a443: AD 21 70
	ORA #$80				; $a446: 09 80
	STA $7021			   ; $a448: 8D 21 70
	SEC					 ; $a44b: 38
	RTS					 ; $a44c: 60
	JSR $b73e			   ; $a44d: 20 3E B7
	BRK					 ; $a450: 00
	PHP					 ; $a451: 08
	.db $cb			; $a452
	JSR $00a9			   ; $a453: 20 A9 00
	STA $0530			   ; $a456: 8D 30 05
	SEC					 ; $a459: 38
	RTS					 ; $a45a: 60
	LDA $6fa0			   ; $a45b: AD A0 6F
	SEC					 ; $a45e: 38
	SBC #$10				; $a45f: E9 10
	CMP #$05				; $a461: C9 05
	BCS $a49d			   ; $a463: B0 38
	LDA $6fc0			   ; $a465: AD C0 6F
	CMP #$03				; $a468: C9 03
	BNE $a49d			   ; $a46a: D0 31
	BRK					 ; $a46c: 00
	.db $0f			; $a46d
	.db $eb			; $a46e
	ORA ($d0,X)			 ; $a46f: 01 D0
	.db $2f			; $a471
	LDA $3d				 ; $a472: A5 3D
	BNE $a49d			   ; $a474: D0 27
	BRK					 ; $a476: 00
	.db $0f			; $a477
	.db $cb			; $a478
	ORA ($20,X)			 ; $a479: 01 20
	.db $6b			; $a47b
	LDA ($a5),Y			 ; $a47c: B1 A5
	EOR ($48),Y			 ; $a47e: 51 48
	JSR $995e			   ; $a480: 20 5E 99
	BRK					 ; $a483: 00
	TXA					 ; $a484: 8A
	.db $3b			; $a485
	BRK					 ; $a486: 00
	.db $07			; $a487
	.db $6f			; $a488
	PHA					 ; $a489: 48
	TAX					 ; $a48a: AA
	PLA					 ; $a48b: 68
	STA $51				 ; $a48c: 85 51
	CPX #$01				; $a48e: E0 01
	BCS $a4a3			   ; $a490: B0 11
	LDA $51				 ; $a492: A5 51
	PHA					 ; $a494: 48
	BRK					 ; $a495: 00
	.db $02			; $a496
	.db $7f			; $a497
	PLA					 ; $a498: 68
	STA $51				 ; $a499: 85 51
	SEC					 ; $a49b: 38
	RTS					 ; $a49c: 60
	BRK					 ; $a49d: 00
	.db $0f			; $a49e
	.db $db			; $a49f
	INC $6018,X			 ; $a4a0: FE 18 60
	JSR $d1f3			   ; $a4a3: 20 F3 D1
	CLC					 ; $a4a6: 18
	RTS					 ; $a4a7: 60
	LDA $6fc0			   ; $a4a8: AD C0 6F
	CMP #$17				; $a4ab: C9 17
	BNE $a507			   ; $a4ad: D0 58
	LDA #$8f				; $a4af: A9 8F
	STA $0530			   ; $a4b1: 8D 30 05
	LDA #$01				; $a4b4: A9 01
	STA $0531			   ; $a4b6: 8D 31 05
	LDA #$00				; $a4b9: A9 00
	STA $0533			   ; $a4bb: 8D 33 05
	STA $0532			   ; $a4be: 8D 32 05
	LDY #$00				; $a4c1: A0 00
	LDA $51				 ; $a4c3: A5 51
	SEC					 ; $a4c5: 38
	SBC #$06				; $a4c6: E9 06
	TAX					 ; $a4c8: AA
	CPX #$11				; $a4c9: E0 11
	BEQ $a4ce			   ; $a4cb: F0 01
	INY					 ; $a4cd: C8
	BIT $6281			   ; $a4ce: 2C 81 62
	BVC $a4e8			   ; $a4d1: 50 15
	LDA $6fa1			   ; $a4d3: AD A1 6F
	STA $6f61			   ; $a4d6: 8D 61 6F
	LDA $6fc1			   ; $a4d9: AD C1 6F
	STA $6f81			   ; $a4dc: 8D 81 6F
	LDA $7001			   ; $a4df: AD 01 70
	AND #$7f				; $a4e2: 29 7F
	STA $7001			   ; $a4e4: 8D 01 70
	INY					 ; $a4e7: C8
	JSR $a51f			   ; $a4e8: 20 1F A5
	JSR $a509			   ; $a4eb: 20 09 A5
	LDA $51				 ; $a4ee: A5 51
	PHA					 ; $a4f0: 48
	CMP #$0f				; $a4f1: C9 0F
	BNE $a502			   ; $a4f3: D0 0D
	BRK					 ; $a4f5: 00
	.db $07			; $a4f6
	.db $6f			; $a4f7
	.db $43			; $a4f8
	BRK					 ; $a4f9: 00
	.db $72			; $a4fa
	.db $4b			; $a4fb
	JSR $d214			   ; $a4fc: 20 14 D2
	JSR $d1f3			   ; $a4ff: 20 F3 D1
	PLA					 ; $a502: 68
	STA $51				 ; $a503: 85 51
	SEC					 ; $a505: 38
	RTS					 ; $a506: 60
	CLC					 ; $a507: 18
	RTS					 ; $a508: 60
	LDA $6fa0			   ; $a509: AD A0 6F
	STA $6f60			   ; $a50c: 8D 60 6F
	STA $44				 ; $a50f: 85 44
	LDA $6fc0			   ; $a511: AD C0 6F
	STA $6f80			   ; $a514: 8D 80 6F
	STA $45				 ; $a517: 85 45
	LDA #$00				; $a519: A9 00
	STA $3e				 ; $a51b: 85 3E
	SEC					 ; $a51d: 38
	RTS					 ; $a51e: 60
	LDA $6fa1,Y			 ; $a51f: B9 A1 6F
	STA $6f66,X			 ; $a522: 9D 66 6F
	LDA $6fa1,Y			 ; $a525: B9 A1 6F
	STA $6fa6,X			 ; $a528: 9D A6 6F
	LDA $6fc1,Y			 ; $a52b: B9 C1 6F
	STA $6f86,X			 ; $a52e: 9D 86 6F
	LDA $6fc1,Y			 ; $a531: B9 C1 6F
	STA $6fc6,X			 ; $a534: 9D C6 6F
	LDA #$80				; $a537: A9 80
	STA $7021,Y			 ; $a539: 99 21 70
	INY					 ; $a53c: C8
	RTS					 ; $a53d: 60
	LDA $51				 ; $a53e: A5 51
	PHA					 ; $a540: 48
	BRK					 ; $a541: 00
	.db $12			; $a542
	.db $5f			; $a543
	PLA					 ; $a544: 68
	STA $51				 ; $a545: 85 51
	SEC					 ; $a547: 38
	RTS					 ; $a548: 60
	LDX #$07				; $a549: A2 07
	LDY #$11				; $a54b: A0 11
	LDA $6f66,Y			 ; $a54d: B9 66 6F
	STA $6f66,X			 ; $a550: 9D 66 6F
	LDA $6fa6,Y			 ; $a553: B9 A6 6F
	STA $6fa6,X			 ; $a556: 9D A6 6F
	LDA $6f86,Y			 ; $a559: B9 86 6F
	STA $6f86,X			 ; $a55c: 9D 86 6F
	LDA $6fc6,Y			 ; $a55f: B9 C6 6F
	STA $6fc6,X			 ; $a562: 9D C6 6F
	LDA #$80				; $a565: A9 80
	STA $6f66,Y			 ; $a567: 99 66 6F
	STA $6fa6,Y			 ; $a56a: 99 A6 6F
	STA $6f86,Y			 ; $a56d: 99 86 6F
	STA $6fc6,Y			 ; $a570: 99 C6 6F
	LDA #$11				; $a573: A9 11
	STA $7046,X			 ; $a575: 9D 46 70
	LDX #$10				; $a578: A2 10
	STA $7046,X			 ; $a57a: 9D 46 70
	BRK					 ; $a57d: 00
	PHP					 ; $a57e: 08
	.db $db			; $a57f
	.db $df			; $a580
	LDA #$00				; $a581: A9 00
	STA $0530			   ; $a583: 8D 30 05
	SEC					 ; $a586: 38
	RTS					 ; $a587: 60
	LDA $45				 ; $a588: A5 45
	CMP #$19				; $a58a: C9 19
	BNE $a5a5			   ; $a58c: D0 17
	LDY #$07				; $a58e: A0 07
	LDA #$11				; $a590: A9 11
	LDX $a59d,Y			 ; $a592: BE 9D A5
	STA $7046,X			 ; $a595: 9D 46 70
	DEY					 ; $a598: 88
	BPL $a592			   ; $a599: 10 F7
	SEC					 ; $a59b: 38
	RTS					 ; $a59c: 60
	.db $04			; $a59d
	ORA $06				 ; $a59e: 05 06
	.db $07			; $a5a0
	PHP					 ; $a5a1: 08
	ORA #$0a				; $a5a2: 09 0A
	.db $0b			; $a5a4
	CLC					 ; $a5a5: 18
	RTS					 ; $a5a6: 60
	LDA $51				 ; $a5a7: A5 51
	PHA					 ; $a5a9: 48
	JSR $995e			   ; $a5aa: 20 5E 99
	LDX #$03				; $a5ad: A2 03
	LDY #$44				; $a5af: A0 44
	LDA $6283			   ; $a5b1: AD 83 62
	AND #$20				; $a5b4: 29 20
	PHA					 ; $a5b6: 48
	BEQ $a5ba			   ; $a5b7: F0 01
	DEY					 ; $a5b9: 88
	TYA					 ; $a5ba: 98
	BRK					 ; $a5bb: 00
	.db $04			; $a5bc
	.db $6f			; $a5bd
	JSR $d1f3			   ; $a5be: 20 F3 D1
	PLA					 ; $a5c1: 68
	BNE $a604			   ; $a5c2: D0 40
	LDX #$00				; $a5c4: A2 00
	BRK					 ; $a5c6: 00
	ORA ($6f,X)			 ; $a5c7: 01 6F
	.db $0b			; $a5c9
	JSR $d210			   ; $a5ca: 20 10 D2
	LDY #$02				; $a5cd: A0 02
	TYA					 ; $a5cf: 98
	PHA					 ; $a5d0: 48
	LDX #$96				; $a5d1: A2 96
	TXA					 ; $a5d3: 8A
	PHA					 ; $a5d4: 48
	LDA #$00				; $a5d5: A9 00
	STA $6e				 ; $a5d7: 85 6E
	STA $70				 ; $a5d9: 85 70
	STA $71				 ; $a5db: 85 71
	LDA #$0a				; $a5dd: A9 0A
	STA $6f				 ; $a5df: 85 6F
	BRK					 ; $a5e1: 00
	.db $27			; $a5e2
	.db $33			; $a5e3
	BRK					 ; $a5e4: 00
	STA $fb				 ; $a5e5: 85 FB
	JSR $a612			   ; $a5e7: 20 12 A6
	PLA					 ; $a5ea: 68
	TAX					 ; $a5eb: AA
	DEX					 ; $a5ec: CA
	BNE $a5d3			   ; $a5ed: D0 E4
	PLA					 ; $a5ef: 68
	TAY					 ; $a5f0: A8
	DEY					 ; $a5f1: 88
	BNE $a5cf			   ; $a5f2: D0 DB
	JSR $d20a			   ; $a5f4: 20 0A D2
	BRK					 ; $a5f7: 00
	PHP					 ; $a5f8: 08
	.db $2f			; $a5f9
	JSR $d1f3			   ; $a5fa: 20 F3 D1
	BRK					 ; $a5fd: 00
	ASL					 ; $a5fe: 0A
	.db $cb			; $a5ff
	.db $04			; $a600
	JMP $a60b			   ; $a601: 4C 0B A6
	LDA #$00				; $a604: A9 00
	LDX #$01				; $a606: A2 01
	STA $7046,X			 ; $a608: 9D 46 70
	PLA					 ; $a60b: 68
	STA $51				 ; $a60c: 85 51
	SEC					 ; $a60e: 38
	RTS					 ; $a60f: 60
	CLC					 ; $a610: 18
	RTS					 ; $a611: 60
	LDA #$13				; $a612: A9 13
	STA tmp0				; $a614: 85 00
	LDA #$1a				; $a616: A9 1A
	STA tmp1				; $a618: 85 01
	JSR $c662			   ; $a61a: 20 62 C6
	LDX #$00				; $a61d: A2 00
	BRK					 ; $a61f: 00
	AND $73				 ; $a620: 25 73
	BRK					 ; $a622: 00
	.db $0c			; $a623
	.db $6f			; $a624
	LDX $050a			   ; $a625: AE 0A 05
	LDA $1c				 ; $a628: A5 1C
	ORA #$80				; $a62a: 09 80
	STA $0300,X			 ; $a62c: 9D 00 03
	LDA #$08				; $a62f: A9 08
	STA $0301,X			 ; $a631: 9D 01 03
	LDA $1d				 ; $a634: A5 1D
	STA $0302,X			 ; $a636: 9D 02 03
	LDY #$00				; $a639: A0 00
	LDA $0000,Y			 ; $a63b: B9 00 00
	STA $0303,X			 ; $a63e: 9D 03 03
	INX					 ; $a641: E8
	INY					 ; $a642: C8
	CPX #$08				; $a643: E0 08
	BCC $a63b			   ; $a645: 90 F4
	INC $050b			   ; $a647: EE 0B 05
	JMP $c62d			   ; $a64a: 4C 2D C6
	LDX #$00				; $a64d: A2 00
	BRK					 ; $a64f: 00
	.db $23			; $a650
	.db $ef			; $a651
	CMP #$3d				; $a652: C9 3D
	BNE $a66f			   ; $a654: D0 19
	LDX #$01				; $a656: A2 01
	BRK					 ; $a658: 00
	ORA $a287			   ; $a659: 0D 87 A2
	BRK					 ; $a65c: 00
	LDA #$06				; $a65d: A9 06
	BRK					 ; $a65f: 00
	ORA $a287			   ; $a660: 0D 87 A2
	ORA ($a9,X)			 ; $a663: 01 A9
	.db $ff			; $a665
	STA $70				 ; $a666: 85 70
	STA $71				 ; $a668: 85 71
	LDA #$00				; $a66a: A9 00
	BRK					 ; $a66c: 00
	LSR $3873,X			 ; $a66d: 5E 73 38
	RTS					 ; $a670: 60
	BIT $6280			   ; $a671: 2C 80 62
	BVC $a6d4			   ; $a674: 50 5E
	LDA $45				 ; $a676: A5 45
	CMP #$1c				; $a678: C9 1C
	BNE $a6d4			   ; $a67a: D0 58
	LDA $44				 ; $a67c: A5 44
	CMP #$0c				; $a67e: C9 0C
	BNE $a6d4			   ; $a680: D0 52
	LDA $0531			   ; $a682: AD 31 05
	CMP #$07				; $a685: C9 07
	BEQ $a68e			   ; $a687: F0 05
	LDA #$8f				; $a689: A9 8F
	JSR $a23a			   ; $a68b: 20 3A A2
	LDX #$02				; $a68e: A2 02
	LDA $6be9			   ; $a690: AD E9 6B
	BPL $a697			   ; $a693: 10 02
	LDX #$00				; $a695: A2 00
	LDA $7020,X			 ; $a697: BD 20 70
	BPL $a6d4			   ; $a69a: 10 38
	LDA #$11				; $a69c: A9 11
	LDX #$02				; $a69e: A2 02
	STA $7046,X			 ; $a6a0: 9D 46 70
	LDX #$03				; $a6a3: A2 03
	STA $7046,X			 ; $a6a5: 9D 46 70
	LDX #$00				; $a6a8: A2 00
	STA $7046,X			 ; $a6aa: 9D 46 70
	LDX #$04				; $a6ad: A2 04
	STA $7046,X			 ; $a6af: 9D 46 70
	LDA $70e6,X			 ; $a6b2: BD E6 70
	AND #$f8				; $a6b5: 29 F8
	STA $70e6,X			 ; $a6b7: 9D E6 70
	LDA #$00				; $a6ba: A9 00
	STA $0515			   ; $a6bc: 8D 15 05
	LDX #$00				; $a6bf: A2 00
	LDA #$53				; $a6c1: A9 53
	BRK					 ; $a6c3: 00
	ORA $a287			   ; $a6c4: 0D 87 A2
	ORA ($a9,X)			 ; $a6c7: 01 A9
	.db $53			; $a6c9
	BRK					 ; $a6ca: 00
	ORA $a287			   ; $a6cb: 0D 87 A2
	.db $02			; $a6ce
	LDA #$53				; $a6cf: A9 53
	BRK					 ; $a6d1: 00
	ORA $1887			   ; $a6d2: 0D 87 18
	RTS					 ; $a6d5: 60
	LDX $51				 ; $a6d6: A6 51
	LDA #$00				; $a6d8: A9 00
	STA $7040,X			 ; $a6da: 9D 40 70
	SEC					 ; $a6dd: 38
	RTS					 ; $a6de: 60
	LDA #$02				; $a6df: A9 02
	BRK					 ; $a6e1: 00
	.db $07			; $a6e2
	.db $cf			; $a6e3
	LDA #$1e				; $a6e4: A9 1E
	STA $51				 ; $a6e6: 85 51
	CLC					 ; $a6e8: 18
	RTS					 ; $a6e9: 60
	LDA $7000			   ; $a6ea: AD 00 70
	AND #$fc				; $a6ed: 29 FC
	ORA #$01				; $a6ef: 09 01
	STA $7000			   ; $a6f1: 8D 00 70
	LDA $51				 ; $a6f4: A5 51
	PHA					 ; $a6f6: 48
	JSR $995e			   ; $a6f7: 20 5E 99
	BRK					 ; $a6fa: 00
	.db $62			; $a6fb
	.db $3b			; $a6fc
	BRK					 ; $a6fd: 00
	.db $07			; $a6fe
	.db $6f			; $a6ff
	PHA					 ; $a700: 48
	CMP #$01				; $a701: C9 01
	BCC $a70b			   ; $a703: 90 06
	BRK					 ; $a705: 00
	.db $64			; $a706
	.db $3b			; $a707
	JMP $a6fd			   ; $a708: 4C FD A6
	BRK					 ; $a70b: 00
	.db $63			; $a70c
	.db $3b			; $a70d
	LDX #$0f				; $a70e: A2 0F
	LDA #$81				; $a710: A9 81
	JSR $9963			   ; $a712: 20 63 99
	LDX #$0e				; $a715: A2 0E
	LDA #$11				; $a717: A9 11
	STA $7046,X			 ; $a719: 9D 46 70
	JSR $d20a			   ; $a71c: 20 0A D2
	PLA					 ; $a71f: 68
	STA $51				 ; $a720: 85 51
	SEC					 ; $a722: 38
	RTS					 ; $a723: 60
	LDA #$11				; $a724: A9 11
	LDX #$12				; $a726: A2 12
	STA $7046,X			 ; $a728: 9D 46 70
	LDX #$11				; $a72b: A2 11
	STA $7046,X			 ; $a72d: 9D 46 70
	SEC					 ; $a730: 38
	RTS					 ; $a731: 60
	JSR $995e			   ; $a732: 20 5E 99
	BRK					 ; $a735: 00
	.db $67			; $a736
	.db $3b			; $a737
	JSR $d214			   ; $a738: 20 14 D2
	LDA #$76				; $a73b: A9 76
	BRK					 ; $a73d: 00
	ROR $73				 ; $a73e: 66 73
	TAX					 ; $a740: AA
	LDA $73				 ; $a741: A5 73
	BRK					 ; $a743: 00
	BMI $a7b9			   ; $a744: 30 73
	LDA #$71				; $a746: A9 71
	BRK					 ; $a748: 00
	ROL $2073			   ; $a749: 2E 73 20
	CMP $c5				 ; $a74c: C5 C5
	LDA #$00				; $a74e: A9 00
	STA $0530			   ; $a750: 8D 30 05
	LDA #$1e				; $a753: A9 1E
	STA $62ed			   ; $a755: 8D ED 62
	BRK					 ; $a758: 00
	BRK					 ; $a759: 00
	.db $cb			; $a75a
	RTI					 ; $a75b: 40
	BRK					 ; $a75c: 00
	.db $32			; $a75d
	.db $ef			; $a75e
	LDA #$1e				; $a75f: A9 1E
	STA $51				 ; $a761: 85 51
	SEC					 ; $a763: 38
	RTS					 ; $a764: 60
	BRK					 ; $a765: 00
	PHP					 ; $a766: 08
	.db $eb			; $a767
	ASL $d0				 ; $a768: 06 D0
	CLC					 ; $a76a: 18
	LDA $45				 ; $a76b: A5 45
	CMP #$0a				; $a76d: C9 0A
	BCC $a783			   ; $a76f: 90 12
	CMP #$0f				; $a771: C9 0F
	BCS $a783			   ; $a773: B0 0E
	LDY #$0a				; $a775: A0 0A
	LDA $44				 ; $a777: A5 44
	CMP #$09				; $a779: C9 09
	BEQ $a785			   ; $a77b: F0 08
	LDY #$0c				; $a77d: A0 0C
	CMP #$0d				; $a77f: C9 0D
	BEQ $a785			   ; $a781: F0 02
	CLC					 ; $a783: 18
	RTS					 ; $a784: 60
	LDX $51				 ; $a785: A6 51
	TYA					 ; $a787: 98
	STA $71a0,X			 ; $a788: 9D A0 71
	LDA $45				 ; $a78b: A5 45
	STA $71c0,X			 ; $a78d: 9D C0 71
	JSR $a7a4			   ; $a790: 20 A4 A7
	BCS $a7a2			   ; $a793: B0 0D
	LDX #$00				; $a795: A2 00
	LDA $053a,X			 ; $a797: BD 3A 05
	BEQ $a7a0			   ; $a79a: F0 04
	INX					 ; $a79c: E8
	JMP $a797			   ; $a79d: 4C 97 A7
	STX $f9				 ; $a7a0: 86 F9
	SEC					 ; $a7a2: 38
	RTS					 ; $a7a3: 60
	LDA #$07				; $a7a4: A9 07
	BRK					 ; $a7a6: 00
	.db $63			; $a7a7
	.db $73			; $a7a8
	TAX					 ; $a7a9: AA
	STX $f9				 ; $a7aa: 86 F9
	BRK					 ; $a7ac: 00
	LSR $93				 ; $a7ad: 46 93
	.db $07			; $a7af
	RTS					 ; $a7b0: 60
	LDA $44				 ; $a7b1: A5 44
	SEC					 ; $a7b3: 38
	SBC #$0d				; $a7b4: E9 0D
	CMP #$04				; $a7b6: C9 04
	BCS $a7d5			   ; $a7b8: B0 1B
	LDY #$22				; $a7ba: A0 22
	LDX $45				 ; $a7bc: A6 45
	CPX #$1a				; $a7be: E0 1A
	BEQ $a7d7			   ; $a7c0: F0 15
	BRK					 ; $a7c2: 00
	BRK					 ; $a7c3: 00
	.db $eb			; $a7c4
	.db $02			; $a7c5
	BEQ $a7d5			   ; $a7c6: F0 0D
	LDY #$68				; $a7c8: A0 68
	LDA $44				 ; $a7ca: A5 44
	CMP #$0f				; $a7cc: C9 0F
	BCC $a7d1			   ; $a7ce: 90 01
	INY					 ; $a7d0: C8
	CPX #$18				; $a7d1: E0 18
	BEQ $a7d7			   ; $a7d3: F0 02
	CLC					 ; $a7d5: 18
	RTS					 ; $a7d6: 60
	LDA #$03				; $a7d7: A9 03
	STA $0594			   ; $a7d9: 8D 94 05
	STY $0593			   ; $a7dc: 8C 93 05
	LDA #$80				; $a7df: A9 80
	STA $0527			   ; $a7e1: 8D 27 05
	BRK					 ; $a7e4: 00
	ASL $f7db			   ; $a7e5: 0E DB F7
	CPY #$22				; $a7e8: C0 22
	BEQ $a7ff			   ; $a7ea: F0 13
	BRK					 ; $a7ec: 00
	ASL $08cb			   ; $a7ed: 0E CB 08
	LDX #$00				; $a7f0: A2 00
	JSR $a7f7			   ; $a7f2: 20 F7 A7
	LDX #$01				; $a7f5: A2 01
	LDA $7006,X			 ; $a7f7: BD 06 70
	AND #$fc				; $a7fa: 29 FC
	STA $7006,X			 ; $a7fc: 9D 06 70
	SEC					 ; $a7ff: 38
	RTS					 ; $a800: 60
	BRK					 ; $a801: 00
	BRK					 ; $a802: 00
	.db $eb			; $a803
	.db $02			; $a804
	BNE $a815			   ; $a805: D0 0E
	LDX #$02				; $a807: A2 02
	LDA $6f80,X			 ; $a809: BD 80 6F
	CMP #$19				; $a80c: C9 19
	BCS $a815			   ; $a80e: B0 05
	DEX					 ; $a810: CA
	BPL $a809			   ; $a811: 10 F6
	SEC					 ; $a813: 38
	RTS					 ; $a814: 60
	CLC					 ; $a815: 18
	RTS					 ; $a816: 60
	BRK					 ; $a817: 00
	PHP					 ; $a818: 08
	.db $eb			; $a819
	.db $04			; $a81a
	BNE $a84d			   ; $a81b: D0 30
	BRK					 ; $a81d: 00
	PHP					 ; $a81e: 08
	.db $eb			; $a81f
	PHP					 ; $a820: 08
	BEQ $a84d			   ; $a821: F0 2A
	LDX #$00				; $a823: A2 00
	LDA $44				 ; $a825: A5 44
	CMP $a84f,X			 ; $a827: DD 4F A8
	BNE $a846			   ; $a82a: D0 1A
	LDA $45				 ; $a82c: A5 45
	CMP $a850,X			 ; $a82e: DD 50 A8
	BNE $a846			   ; $a831: D0 13
	LDY $51				 ; $a833: A4 51
	LDA $7000,Y			 ; $a835: B9 00 70
	AND #$fc				; $a838: 29 FC
	ORA $a851,X			 ; $a83a: 1D 51 A8
	STA $7000,Y			 ; $a83d: 99 00 70
	BRK					 ; $a840: 00
	PHP					 ; $a841: 08
	.db $cb			; $a842
	.db $04			; $a843
	SEC					 ; $a844: 38
	RTS					 ; $a845: 60
	INX					 ; $a846: E8
	INX					 ; $a847: E8
	INX					 ; $a848: E8
	CPX #$09				; $a849: E0 09
	BCC $a825			   ; $a84b: 90 D8
	CLC					 ; $a84d: 18
	RTS					 ; $a84e: 60
	.db $0b			; $a84f
	BPL $a853			   ; $a850: 10 01
	.db $0c			; $a852
	BPL $a856			   ; $a853: 10 01
	ASL					 ; $a855: 0A
	ORA (tmp2),Y			; $a856: 11 02
	BRK					 ; $a858: 00
	.db $0b			; $a859
	.db $eb			; $a85a
	.db $02			; $a85b
	BNE $a891			   ; $a85c: D0 33
	LDA $45				 ; $a85e: A5 45
	CMP #$0c				; $a860: C9 0C
	BNE $a891			   ; $a862: D0 2D
	LDA #$84				; $a864: A9 84
	JSR $a23a			   ; $a866: 20 3A A2
	LDX #$00				; $a869: A2 00
	LDY #$02				; $a86b: A0 02
	JSR $a874			   ; $a86d: 20 74 A8
	LDX #$01				; $a870: A2 01
	LDY #$03				; $a872: A0 03
	LDA $7066,Y			 ; $a874: B9 66 70
	STA $7066,X			 ; $a877: 9D 66 70
	LDA $7086,Y			 ; $a87a: B9 86 70
	STA $7086,X			 ; $a87d: 9D 86 70
	LDA $7006,X			 ; $a880: BD 06 70
	AND #$7c				; $a883: 29 7C
	ORA #$02				; $a885: 09 02
	STA $7006,X			 ; $a887: 9D 06 70
	LDA #$11				; $a88a: A9 11
	STA $7046,X			 ; $a88c: 9D 46 70
	SEC					 ; $a88f: 38
	RTS					 ; $a890: 60
	CLC					 ; $a891: 18
	RTS					 ; $a892: 60
	LDA $6fa0			   ; $a893: AD A0 6F
	CMP #$0e				; $a896: C9 0E
	BNE $a90b			   ; $a898: D0 71
	LDA $6fc0			   ; $a89a: AD C0 6F
	CMP #$0c				; $a89d: C9 0C
	BNE $a90b			   ; $a89f: D0 6A
	LDA $7000			   ; $a8a1: AD 00 70
	AND #$fc				; $a8a4: 29 FC
	ORA #$02				; $a8a6: 09 02
	STA $7000			   ; $a8a8: 8D 00 70
	BRK					 ; $a8ab: 00
	.db $0c			; $a8ac
	.db $db			; $a8ad
	SED					 ; $a8ae: F8
	LDX #$0d				; $a8af: A2 0D
	LDY #$01				; $a8b1: A0 01
	JSR $a90d			   ; $a8b3: 20 0D A9
	LDX #$0e				; $a8b6: A2 0E
	JSR $a90d			   ; $a8b8: 20 0D A9
	LDA $51				 ; $a8bb: A5 51
	PHA					 ; $a8bd: 48
	TAY					 ; $a8be: A8
	LDX $6fe0,Y			 ; $a8bf: BE E0 6F
	LDA #$3b				; $a8c2: A9 3B
	BRK					 ; $a8c4: 00
	ORA $2087			   ; $a8c5: 0D 87 20
	DEC $68a8			   ; $a8c8: CE A8 68
	STA $51				 ; $a8cb: 85 51
	RTS					 ; $a8cd: 60
	LDA $6be8			   ; $a8ce: AD E8 6B
	AND #$7f				; $a8d1: 29 7F
	CLC					 ; $a8d3: 18
	BNE $a8e0			   ; $a8d4: D0 0A
	JSR $995e			   ; $a8d6: 20 5E 99
	BRK					 ; $a8d9: 00
	ROR $203b,X			 ; $a8da: 7E 3B 20
	CLC					 ; $a8dd: 18
	.db $d2			; $a8de
	SEC					 ; $a8df: 38
	LDA $6be9			   ; $a8e0: AD E9 6B
	AND #$7f				; $a8e3: 29 7F
	BNE $a8ff			   ; $a8e5: D0 18
	BCS $a8ec			   ; $a8e7: B0 03
	JSR $995e			   ; $a8e9: 20 5E 99
	BRK					 ; $a8ec: 00
	.db $7f			; $a8ed
	.db $3b			; $a8ee
	JSR $d218			   ; $a8ef: 20 18 D2
	JSR $d1f3			   ; $a8f2: 20 F3 D1
	LDX #$00				; $a8f5: A2 00
	BRK					 ; $a8f7: 00
	.db $53			; $a8f8
	.db $73			; $a8f9
	BRK					 ; $a8fa: 00
	.db $27			; $a8fb
	.db $0f			; $a8fc
	SEC					 ; $a8fd: 38
	RTS					 ; $a8fe: 60
	BCC $a904			   ; $a8ff: 90 03
	JSR $d1f3			   ; $a901: 20 F3 D1
	LDX #$00				; $a904: A2 00
	BRK					 ; $a906: 00
	.db $53			; $a907
	.db $73			; $a908
	SEC					 ; $a909: 38
	RTS					 ; $a90a: 60
	CLC					 ; $a90b: 18
	RTS					 ; $a90c: 60
	LDA $6f60,Y			 ; $a90d: B9 60 6F
	STA $6f66,X			 ; $a910: 9D 66 6F
	LDA $6fa0,Y			 ; $a913: B9 A0 6F
	STA $6fa6,X			 ; $a916: 9D A6 6F
	LDA $6f80,Y			 ; $a919: B9 80 6F
	STA $6f86,X			 ; $a91c: 9D 86 6F
	LDA $6fc0,Y			 ; $a91f: B9 C0 6F
	STA $6fc6,X			 ; $a922: 9D C6 6F
	LDA $6fe0,Y			 ; $a925: B9 E0 6F
	STA $6fe6,X			 ; $a928: 9D E6 6F
	LDA #$81				; $a92b: A9 81
	STA $6f60,Y			 ; $a92d: 99 60 6F
	STA $6f80,Y			 ; $a930: 99 80 6F
	STA $6fa0,Y			 ; $a933: 99 A0 6F
	STA $6fc0,Y			 ; $a936: 99 C0 6F
	INY					 ; $a939: C8
	RTS					 ; $a93a: 60
	LDA $6fc0			   ; $a93b: AD C0 6F
	CMP #$0a				; $a93e: C9 0A
	BNE $a966			   ; $a940: D0 24
	LDA $51				 ; $a942: A5 51
	PHA					 ; $a944: 48
	JSR $995e			   ; $a945: 20 5E 99
	BRK					 ; $a948: 00
	.db $80			; $a949
	.db $3b			; $a94a
	JSR $d218			   ; $a94b: 20 18 D2
	JSR $d1f3			   ; $a94e: 20 F3 D1
	JSR $a97b			   ; $a951: 20 7B A9
	PLA					 ; $a954: 68
	STA $51				 ; $a955: 85 51
	TAX					 ; $a957: AA
	LDA $6fe0,X			 ; $a958: BD E0 6F
	STA $059b			   ; $a95b: 8D 9B 05
	LDA $a9bc			   ; $a95e: AD BC A9
	STA $059a			   ; $a961: 8D 9A 05
	SEC					 ; $a964: 38
	RTS					 ; $a965: 60
	CLC					 ; $a966: 18
	RTS					 ; $a967: 60
	LDA $51				 ; $a968: A5 51
	PHA					 ; $a96a: 48
	LDA #$03				; $a96b: A9 03
	BRK					 ; $a96d: 00
	.db $07			; $a96e
	.db $cf			; $a96f
	JSR $a97b			   ; $a970: 20 7B A9
	PLA					 ; $a973: 68
	STA $51				 ; $a974: 85 51
	INC $6287			   ; $a976: EE 87 62
	SEC					 ; $a979: 38
	RTS					 ; $a97a: 60
	LDA #$03				; $a97b: A9 03
	STA $058e			   ; $a97d: 8D 8E 05
	LDA #$08				; $a980: A9 08
	STA $45				 ; $a982: 85 45
	LDX #$0e				; $a984: A2 0E
	LDY #$07				; $a986: A0 07
	JSR $d3e6			   ; $a988: 20 E6 D3
	AND #$1f				; $a98b: 29 1F
	TAX					 ; $a98d: AA
	LDA $6f40,X			 ; $a98e: BD 40 6F
	AND #$7f				; $a991: 29 7F
	BRK					 ; $a993: 00
	.db $12			; $a994
	.db $87			; $a995
	BRK					 ; $a996: 00
	.db $03			; $a997
	.db $bf			; $a998
	LDA #$0a				; $a999: A9 0A
	STA $45				 ; $a99b: 85 45
	LDA #$01				; $a99d: A9 01
	STA $058e			   ; $a99f: 8D 8E 05
	RTS					 ; $a9a2: 60
	LDA $6287			   ; $a9a3: AD 87 62
	AND #$07				; $a9a6: 29 07
	TAX					 ; $a9a8: AA
	LDA $a9bc,X			 ; $a9a9: BD BC A9
	LDY $51				 ; $a9ac: A4 51
	LDX $6fe0,Y			 ; $a9ae: BE E0 6F
	STX $059b			   ; $a9b1: 8E 9B 05
	STA $059a			   ; $a9b4: 8D 9A 05
	BRK					 ; $a9b7: 00
	ORA $3887			   ; $a9b8: 0D 87 38
	RTS					 ; $a9bb: 60
	.db $3b			; $a9bc
	.db $14			; $a9bd
	.db $3a			; $a9be
	AND $a242,Y			 ; $a9bf: 39 42 A2
	ASL $a9				 ; $a9c2: 06 A9
	ORA ($9d),Y			 ; $a9c4: 11 9D
	LSR $70				 ; $a9c6: 46 70
	SEC					 ; $a9c8: 38
	RTS					 ; $a9c9: 60
	LDA #$11				; $a9ca: A9 11
	LDX #$0d				; $a9cc: A2 0D
	STA $7046,X			 ; $a9ce: 9D 46 70
	LDX #$0e				; $a9d1: A2 0E
	STA $7046,X			 ; $a9d3: 9D 46 70
	SEC					 ; $a9d6: 38
	RTS					 ; $a9d7: 60
	LDA $7000			   ; $a9d8: AD 00 70
	AND #$fc				; $a9db: 29 FC
	ORA #$02				; $a9dd: 09 02
	STA $7000			   ; $a9df: 8D 00 70
	JSR $995e			   ; $a9e2: 20 5E 99
	BRK					 ; $a9e5: 00
	STX $3b				 ; $a9e6: 86 3B
	BRK					 ; $a9e8: 00
	.db $87			; $a9e9
	.db $3b			; $a9ea
	JSR $d218			   ; $a9eb: 20 18 D2
	BRK					 ; $a9ee: 00
	.db $54			; $a9ef
	.db $33			; $a9f0
	JSR $c5c5			   ; $a9f1: 20 C5 C5
	LDA #$0b				; $a9f4: A9 0B
	STA $44				 ; $a9f6: 85 44
	STA $45				 ; $a9f8: 85 45
	LDA #$06				; $a9fa: A9 06
	STA $64				 ; $a9fc: 85 64
	BRK					 ; $a9fe: 00
	ORA #$cb				; $a9ff: 09 CB
	RTI					 ; $aa01: 40
	BRK					 ; $aa02: 00
	ORA $80cb			   ; $aa03: 0D CB 80
	LDA #$00				; $aa06: A9 00
	JSR $aa1b			   ; $aa08: 20 1B AA
	JSR $c5bf			   ; $aa0b: 20 BF C5
	BRK					 ; $aa0e: 00
	.db $07			; $aa0f
	.db $6f			; $aa10
	.db $43			; $aa11
	BRK					 ; $aa12: 00
	.db $d2			; $aa13
	.db $4b			; $aa14
	JSR $d20a			   ; $aa15: 20 0A D2
	JMP $b624			   ; $aa18: 4C 24 B6
	PHA					 ; $aa1b: 48
	LDA #$00				; $aa1c: A9 00
	STA $0530			   ; $aa1e: 8D 30 05
	PLA					 ; $aa21: 68
	BRK					 ; $aa22: 00
	AND ($ef),Y			 ; $aa23: 31 EF
	LDA #$1e				; $aa25: A9 1E
	STA $51				 ; $aa27: 85 51
	RTS					 ; $aa29: 60
	LDX #$06				; $aa2a: A2 06
	JSR $98bd			   ; $aa2c: 20 BD 98
	BCC $aa4c			   ; $aa2f: 90 1B
	LDX #$06				; $aa31: A2 06
	LDY #$07				; $aa33: A0 07
	LDA $7060,Y			 ; $aa35: B9 60 70
	STA $7060,X			 ; $aa38: 9D 60 70
	LDA $7080,Y			 ; $aa3b: B9 80 70
	STA $7080,X			 ; $aa3e: 9D 80 70
	LDA #$11				; $aa41: A9 11
	STA $7040,X			 ; $aa43: 9D 40 70
	LDA #$8f				; $aa46: A9 8F
	JSR $a23a			   ; $aa48: 20 3A A2
	SEC					 ; $aa4b: 38
	RTS					 ; $aa4c: 60
	LDA #$00				; $aa4d: A9 00
	STA $0530			   ; $aa4f: 8D 30 05
	BRK					 ; $aa52: 00
	.db $82			; $aa53
	.db $fb			; $aa54
	JSR $c5c5			   ; $aa55: 20 C5 C5
	LDA #$00				; $aa58: A9 00
	STA $64				 ; $aa5a: 85 64
	LDA #$17				; $aa5c: A9 17
	STA $44				 ; $aa5e: 85 44
	LDA #$0a				; $aa60: A9 0A
	STA $45				 ; $aa62: 85 45
	LDA #$82				; $aa64: A9 82
	BRK					 ; $aa66: 00
	AND ($ef),Y			 ; $aa67: 31 EF
	LDA #$06				; $aa69: A9 06
	STA $51				 ; $aa6b: 85 51
	JSR $c5bf			   ; $aa6d: 20 BF C5
	CLC					 ; $aa70: 18
	RTS					 ; $aa71: 60
	BIT $6284			   ; $aa72: 2C 84 62
	BVC $aa9d			   ; $aa75: 50 26
	LDA $45				 ; $aa77: A5 45
	CMP #$0a				; $aa79: C9 0A
	BNE $aa9d			   ; $aa7b: D0 20
	LDX $51				 ; $aa7d: A6 51
	STA $71c0,X			 ; $aa7f: 9D C0 71
	LDA #$11				; $aa82: A9 11
	STA $7040,X			 ; $aa84: 9D 40 70
	LDA #$8f				; $aa87: A9 8F
	JSR $a23a			   ; $aa89: 20 3A A2
	LDY $44				 ; $aa8c: A4 44
	CPY #$1e				; $aa8e: C0 1E
	BEQ $aa96			   ; $aa90: F0 04
	INY					 ; $aa92: C8
	JMP $aa97			   ; $aa93: 4C 97 AA
	DEY					 ; $aa96: 88
	TYA					 ; $aa97: 98
	STA $71a0,X			 ; $aa98: 9D A0 71
	SEC					 ; $aa9b: 38
	RTS					 ; $aa9c: 60
	CLC					 ; $aa9d: 18
	RTS					 ; $aa9e: 60
	LDA $51				 ; $aa9f: A5 51
	STA $059c			   ; $aaa1: 8D 9C 05
	PHA					 ; $aaa4: 48
	JSR $995e			   ; $aaa5: 20 5E 99
	BRK					 ; $aaa8: 00
	.db $8f			; $aaa9
	.db $3b			; $aaaa
	JSR $d218			   ; $aaab: 20 18 D2
	JSR $d1f3			   ; $aaae: 20 F3 D1
	PLA					 ; $aab1: 68
	STA $51				 ; $aab2: 85 51
	LDA #$00				; $aab4: A9 00
	STA $0530			   ; $aab6: 8D 30 05
	BRK					 ; $aab9: 00
	.db $0c			; $aaba
	.db $cb			; $aabb
	JSR $6038			   ; $aabc: 20 38 60
	LDA $6fa0			   ; $aabf: AD A0 6F
	CMP #$0e				; $aac2: C9 0E
	BNE $aaf4			   ; $aac4: D0 2E
	LDA $6fc0			   ; $aac6: AD C0 6F
	CMP #$03				; $aac9: C9 03
	BNE $aaf4			   ; $aacb: D0 27
	LDA $7000			   ; $aacd: AD 00 70
	ORA #$03				; $aad0: 09 03
	STA $7000			   ; $aad2: 8D 00 70
	LDA $51				 ; $aad5: A5 51
	PHA					 ; $aad7: 48
	TAX					 ; $aad8: AA
	LDA $7000,X			 ; $aad9: BD 00 70
	AND #$fc				; $aadc: 29 FC
	ORA #$01				; $aade: 09 01
	STA $7000,X			 ; $aae0: 9D 00 70
	JSR $995e			   ; $aae3: 20 5E 99
	BRK					 ; $aae6: 00
	.db $13			; $aae7
	.db $3b			; $aae8
	JSR $d214			   ; $aae9: 20 14 D2
	JSR $d1f3			   ; $aaec: 20 F3 D1
	PLA					 ; $aaef: 68
	STA $51				 ; $aaf0: 85 51
	SEC					 ; $aaf2: 38
	RTS					 ; $aaf3: 60
	CLC					 ; $aaf4: 18
	RTS					 ; $aaf5: 60
	LDA $7000			   ; $aaf6: AD 00 70
	AND #$fc				; $aaf9: 29 FC
	STA $7000			   ; $aafb: 8D 00 70
	LDX #$01				; $aafe: A2 01
	LDA $7006,X			 ; $ab00: BD 06 70
	AND #$fc				; $ab03: 29 FC
	STA $7006,X			 ; $ab05: 9D 06 70
	JSR $995e			   ; $ab08: 20 5E 99
	BRK					 ; $ab0b: 00
	.db $14			; $ab0c
	.db $3b			; $ab0d
	BRK					 ; $ab0e: 00
	ORA $3b,X			   ; $ab0f: 15 3B
	JSR $d218			   ; $ab11: 20 18 D2
	BRK					 ; $ab14: 00
	.db $0f			; $ab15
	.db $fb			; $ab16
	JSR $c5c5			   ; $ab17: 20 C5 C5
	LDA #$00				; $ab1a: A9 00
	STA $62ed			   ; $ab1c: 8D ED 62
	LDA #$1a				; $ab1f: A9 1A
	STA $44				 ; $ab21: 85 44
	LDA #$02				; $ab23: A9 02
	STA $45				 ; $ab25: 85 45
	LDA #$00				; $ab27: A9 00
	STA $64				 ; $ab29: 85 64
	LDA #$02				; $ab2b: A9 02
	BRK					 ; $ab2d: 00
	.db $52			; $ab2e
	.db $73			; $ab2f
	LDX #$ff				; $ab30: A2 FF
	STX $70				 ; $ab32: 86 70
	STX $71				 ; $ab34: 86 71
	INX					 ; $ab36: E8
	TXA					 ; $ab37: 8A
	INX					 ; $ab38: E8
	BRK					 ; $ab39: 00
	LSR $a273,X			 ; $ab3a: 5E 73 A2
	BRK					 ; $ab3d: 00
	LDA #$02				; $ab3e: A9 02
	BRK					 ; $ab40: 00
	ORA $a287			   ; $ab41: 0D 87 A2
	ORA ($a9,X)			 ; $ab44: 01 A9
	.db $03			; $ab46
	BRK					 ; $ab47: 00
	ORA $a287			   ; $ab48: 0D 87 A2
	.db $02			; $ab4b
	LDA #$83				; $ab4c: A9 83
	BRK					 ; $ab4e: 00
	ORA $0087			   ; $ab4f: 0D 87 00
	.db $07			; $ab52
	.db $9f			; $ab53
	LDA #$02				; $ab54: A9 02
	JSR $aa1b			   ; $ab56: 20 1B AA
	LDA #$02				; $ab59: A9 02
	STA $6fe1			   ; $ab5b: 8D E1 6F
	LDA $7001			   ; $ab5e: AD 01 70
	AND #$fc				; $ab61: 29 FC
	ORA #$01				; $ab63: 09 01
	STA $7001			   ; $ab65: 8D 01 70
	LDA $7000			   ; $ab68: AD 00 70
	AND #$fc				; $ab6b: 29 FC
	STA $7000			   ; $ab6d: 8D 00 70
	LDA #$00				; $ab70: A9 00
	STA $3d				 ; $ab72: 85 3D
	BRK					 ; $ab74: 00
	ASL					 ; $ab75: 0A
	.db $6f			; $ab76
	JSR $c5bf			   ; $ab77: 20 BF C5
	JSR $995e			   ; $ab7a: 20 5E 99
	BRK					 ; $ab7d: 00
	ASL $3b,X			   ; $ab7e: 16 3B
	LDA #$01				; $ab80: A9 01
	STA $6fe1			   ; $ab82: 8D E1 6F
	LDA $7001			   ; $ab85: AD 01 70
	AND #$fc				; $ab88: 29 FC
	ORA #$02				; $ab8a: 09 02
	STA $7001			   ; $ab8c: 8D 01 70
	JSR $d218			   ; $ab8f: 20 18 D2
	JSR $d1f3			   ; $ab92: 20 F3 D1
	JMP $b624			   ; $ab95: 4C 24 B6
	JSR $d1f3			   ; $ab98: 20 F3 D1
	LDX #$02				; $ab9b: A2 02
	LDA $6fe6,X			 ; $ab9d: BD E6 6F
	LDX #$01				; $aba0: A2 01
	STA $6fe6,X			 ; $aba2: 9D E6 6F
	LDA $7006,X			 ; $aba5: BD 06 70
	AND #$fc				; $aba8: 29 FC
	STA $7006,X			 ; $abaa: 9D 06 70
	BRK					 ; $abad: 00
	ASL					 ; $abae: 0A
	.db $6f			; $abaf
	JSR $995e			   ; $abb0: 20 5E 99
	BRK					 ; $abb3: 00
	.db $a7			; $abb4
	.db $3b			; $abb5
	JSR $d218			   ; $abb6: 20 18 D2
	BRK					 ; $abb9: 00
	.db $0f			; $abba
	.db $cb			; $abbb
	.db $04			; $abbc
	LDA #$1e				; $abbd: A9 1E
	STA $62ed			   ; $abbf: 8D ED 62
	LDA #$03				; $abc2: A9 03
	BRK					 ; $abc4: 00
	ORA ($8f,X)			 ; $abc5: 01 8F
	RTS					 ; $abc7: 60
	LDX #$06				; $abc8: A2 06
	LDA $6f62			   ; $abca: AD 62 6F
	STA $6f66,X			 ; $abcd: 9D 66 6F
	LDA $6fa2			   ; $abd0: AD A2 6F
	STA $6fa6,X			 ; $abd3: 9D A6 6F
	LDA $6f82			   ; $abd6: AD 82 6F
	STA $6f86,X			 ; $abd9: 9D 86 6F
	LDA $6fc2			   ; $abdc: AD C2 6F
	STA $6fc6,X			 ; $abdf: 9D C6 6F
	LDA $7002			   ; $abe2: AD 02 70
	AND #$fc				; $abe5: 29 FC
	STA $7006,X			 ; $abe7: 9D 06 70
	LDA #$11				; $abea: A9 11
	STA $7046,X			 ; $abec: 9D 46 70
	LDA #$80				; $abef: A9 80
	STA $6f62			   ; $abf1: 8D 62 6F
	STA $6fa2			   ; $abf4: 8D A2 6F
	STA $6f82			   ; $abf7: 8D 82 6F
	STA $6fc2			   ; $abfa: 8D C2 6F
	LDA #$00				; $abfd: A9 00
	STA $7002			   ; $abff: 8D 02 70
	LDX #$02				; $ac02: A2 02
	LDA #$ff				; $ac04: A9 FF
	BRK					 ; $ac06: 00
	EOR ($73),Y			 ; $ac07: 51 73
	SEC					 ; $ac09: 38
	RTS					 ; $ac0a: 60
	LDA $51				 ; $ac0b: A5 51
	PHA					 ; $ac0d: 48
	LDA #$03				; $ac0e: A9 03
	STA $058e			   ; $ac10: 8D 8E 05
	LDA #$00				; $ac13: A9 00
	STA $3d				 ; $ac15: 85 3D
	LDA #$0f				; $ac17: A9 0F
	STA $45				 ; $ac19: 85 45
	STA $44				 ; $ac1b: 85 44
	LDX #$0f				; $ac1d: A2 0F
	LDY #$0e				; $ac1f: A0 0E
	JSR $d3e6			   ; $ac21: 20 E6 D3
	AND #$1f				; $ac24: 29 1F
	TAX					 ; $ac26: AA
	LDA $6f40,X			 ; $ac27: BD 40 6F
	AND #$7f				; $ac2a: 29 7F
	BRK					 ; $ac2c: 00
	.db $12			; $ac2d
	.db $87			; $ac2e
	BRK					 ; $ac2f: 00
	.db $03			; $ac30
	.db $bf			; $ac31
	LDA #$0a				; $ac32: A9 0A
	STA $44				 ; $ac34: 85 44
	LDA #$13				; $ac36: A9 13
	STA $45				 ; $ac38: 85 45
	LDA #$01				; $ac3a: A9 01
	STA $3d				 ; $ac3c: 85 3D
	STA $058e			   ; $ac3e: 8D 8E 05
	LDA #$11				; $ac41: A9 11
	LDX #$05				; $ac43: A2 05
	STA $7046,X			 ; $ac45: 9D 46 70
	LDX #$03				; $ac48: A2 03
	STA $7046,X			 ; $ac4a: 9D 46 70
	LDX #$01				; $ac4d: A2 01
	STA $7046,X			 ; $ac4f: 9D 46 70
	LDX #$02				; $ac52: A2 02
	STA $7046,X			 ; $ac54: 9D 46 70
	PLA					 ; $ac57: 68
	STA $51				 ; $ac58: 85 51
	BRK					 ; $ac5a: 00
	.db $0f			; $ac5b
	.db $cb			; $ac5c
	PHP					 ; $ac5d: 08
	SEC					 ; $ac5e: 38
	RTS					 ; $ac5f: 60
	BRK					 ; $ac60: 00
	ORA $eb				 ; $ac61: 05 EB
	JSR $02f0			   ; $ac63: 20 F0 02
	SEC					 ; $ac66: 38
	RTS					 ; $ac67: 60
	CLC					 ; $ac68: 18
	RTS					 ; $ac69: 60
	LDA $615a			   ; $ac6a: AD 5A 61
	CMP #$02				; $ac6d: C9 02
	BNE $ac98			   ; $ac6f: D0 27
	LDX $51				 ; $ac71: A6 51
	LDA $6f60,X			 ; $ac73: BD 60 6F
	SEC					 ; $ac76: 38
	SBC #$0c				; $ac77: E9 0C
	CMP #$05				; $ac79: C9 05
	BCS $ac98			   ; $ac7b: B0 1B
	LDA $6f80,X			 ; $ac7d: BD 80 6F
	SEC					 ; $ac80: 38
	SBC #$04				; $ac81: E9 04
	CMP #$03				; $ac83: C9 03
	BCS $ac98			   ; $ac85: B0 11
	LDA $70e0,X			 ; $ac87: BD E0 70
	AND #$f7				; $ac8a: 29 F7
	STA $70e0,X			 ; $ac8c: 9D E0 70
	BRK					 ; $ac8f: 00
	ORA $db				 ; $ac90: 05 DB
	.db $df			; $ac92
	BRK					 ; $ac93: 00
	ORA $5f,X			   ; $ac94: 15 5F
	SEC					 ; $ac96: 38
	RTS					 ; $ac97: 60
	CLC					 ; $ac98: 18
	RTS					 ; $ac99: 60
	LDA $51				 ; $ac9a: A5 51
	PHA					 ; $ac9c: 48
	JSR $995e			   ; $ac9d: 20 5E 99
	BRK					 ; $aca0: 00
	SBC ($2b),Y			 ; $aca1: F1 2B
	BRK					 ; $aca3: 00
	.db $eb			; $aca4
	.db $2b			; $aca5
	BRK					 ; $aca6: 00
	LDA $a23b			   ; $aca7: AD 3B A2
	.db $03			; $acaa
	LDY #$00				; $acab: A0 00
	LDA $3d				 ; $acad: A5 3D
	EOR #$02				; $acaf: 49 02
	JSR $a1af			   ; $acb1: 20 AF A1
	LDX #$01				; $acb4: A2 01
	LDA #$24				; $acb6: A9 24
	BRK					 ; $acb8: 00
	ORA $a987			   ; $acb9: 0D 87 A9
	BRK					 ; $acbc: 00
	STA $0530			   ; $acbd: 8D 30 05
	JSR $d20a			   ; $acc0: 20 0A D2
	PLA					 ; $acc3: 68
	STA $51				 ; $acc4: 85 51
	SEC					 ; $acc6: 38
	RTS					 ; $acc7: 60
	BRK					 ; $acc8: 00
	.db $0b			; $acc9
	.db $eb			; $acca
	.db $04			; $accb
	BEQ $acd0			   ; $accc: F0 02
	SEC					 ; $acce: 38
	RTS					 ; $accf: 60
	CLC					 ; $acd0: 18
	RTS					 ; $acd1: 60
	LDX #$00				; $acd2: A2 00
	LDA $6f61			   ; $acd4: AD 61 6F
	STA $6f66,X			 ; $acd7: 9D 66 6F
	STA $6fa6,X			 ; $acda: 9D A6 6F
	LDA $6f81			   ; $acdd: AD 81 6F
	STA $6f86,X			 ; $ace0: 9D 86 6F
	STA $6fc6,X			 ; $ace3: 9D C6 6F
	LDA #$01				; $ace6: A9 01
	STA $6fe6,X			 ; $ace8: 9D E6 6F
	LDA #$80				; $aceb: A9 80
	STA $7021			   ; $aced: 8D 21 70
	BRK					 ; $acf0: 00
	ASL					 ; $acf1: 0A
	.db $6f			; $acf2
	SEC					 ; $acf3: 38
	RTS					 ; $acf4: 60
	BRK					 ; $acf5: 00
	ORA $eb				 ; $acf6: 05 EB
	.db $02			; $acf8
	BEQ $acfd			   ; $acf9: F0 02
	SEC					 ; $acfb: 38
	RTS					 ; $acfc: 60
	CLC					 ; $acfd: 18
	RTS					 ; $acfe: 60
	JSR $c5c5			   ; $acff: 20 C5 C5
	LDA #$8c				; $ad02: A9 8C
	STA $62ed			   ; $ad04: 8D ED 62
	LDA #$07				; $ad07: A9 07
	STA $44				 ; $ad09: 85 44
	LDA #$1a				; $ad0b: A9 1A
	STA $45				 ; $ad0d: 85 45
	LDA #$01				; $ad0f: A9 01
	BRK					 ; $ad11: 00
	AND ($ef),Y			 ; $ad12: 31 EF
	JSR $c5bf			   ; $ad14: 20 BF C5
	JMP $b624			   ; $ad17: 4C 24 B6
	LDA #$22				; $ad1a: A9 22
	LDX $3d				 ; $ad1c: A6 3D
	CPX #$02				; $ad1e: E0 02
	BEQ $ad2a			   ; $ad20: F0 08
	LDA #$82				; $ad22: A9 82
	CPX #$01				; $ad24: E0 01
	BEQ $ad2a			   ; $ad26: F0 02
	LDA #$12				; $ad28: A9 12
	STA $0554			   ; $ad2a: 8D 54 05
	LDA #$81				; $ad2d: A9 81
	STA $0555			   ; $ad2f: 8D 55 05
	LDA #$02				; $ad32: A9 02
	STA $0531			   ; $ad34: 8D 31 05
	LDA #$82				; $ad37: A9 82
	STA $0530			   ; $ad39: 8D 30 05
	LDA $ad4a			   ; $ad3c: AD 4A AD
	STA $0532			   ; $ad3f: 8D 32 05
	LDA $ad4b			   ; $ad42: AD 4B AD
	STA $0533			   ; $ad45: 8D 33 05
	SEC					 ; $ad48: 38
	RTS					 ; $ad49: 60
	.db $54			; $ad4a
	ORA $a9				 ; $ad4b: 05 A9
	ORA ($a2),Y			 ; $ad4d: 11 A2
	ORA $9d				 ; $ad4f: 05 9D
	LSR $70				 ; $ad51: 46 70
	LDX #$06				; $ad53: A2 06
	STA $7046,X			 ; $ad55: 9D 46 70
	LDX #$08				; $ad58: A2 08
	STA $7046,X			 ; $ad5a: 9D 46 70
	LDX #$07				; $ad5d: A2 07
	STA $7046,X			 ; $ad5f: 9D 46 70
	LDX #$02				; $ad62: A2 02
	STA $7046,X			 ; $ad64: 9D 46 70
	LDX #$03				; $ad67: A2 03
	STA $7046,X			 ; $ad69: 9D 46 70
	LDX #$04				; $ad6c: A2 04
	STA $7046,X			 ; $ad6e: 9D 46 70
	SEC					 ; $ad71: 38
	RTS					 ; $ad72: 60
	JSR $c543			   ; $ad73: 20 43 C5
	LDX #$0f				; $ad76: A2 0F
	LDA $ad8e,X			 ; $ad78: BD 8E AD
	STA $0200,X			 ; $ad7b: 9D 00 02
	DEX					 ; $ad7e: CA
	BPL $ad78			   ; $ad7f: 10 F7
	LDX #$78				; $ad81: A2 78
	JSR $c90c			   ; $ad83: 20 0C C9
	JSR $e501			   ; $ad86: 20 01 E5
	JSR $dff1			   ; $ad89: 20 F1 DF
	SEC					 ; $ad8c: 38
	RTS					 ; $ad8d: 60
	.db $3b			; $ad8e
	BRK					 ; $ad8f: 00
	BRK					 ; $ad90: 00
	SEI					 ; $ad91: 78
	.db $3b			; $ad92
	ORA (tmp0,X)			; $ad93: 01 00
	.db $80			; $ad95
	.db $43			; $ad96
	.db $02			; $ad97
	BRK					 ; $ad98: 00
	SEI					 ; $ad99: 78
	.db $43			; $ad9a
	.db $03			; $ad9b
	BRK					 ; $ad9c: 00
	.db $80			; $ad9d
	LDA $51				 ; $ad9e: A5 51
	PHA					 ; $ada0: 48
	LDA $6fa0			   ; $ada1: AD A0 6F
	CMP #$11				; $ada4: C9 11
	BNE $ae08			   ; $ada6: D0 60
	LDA $6fc0			   ; $ada8: AD C0 6F
	CMP #$02				; $adab: C9 02
	BNE $ae08			   ; $adad: D0 59
	BRK					 ; $adaf: 00
	BRK					 ; $adb0: 00
	.db $eb			; $adb1
	.db $80			; $adb2
	BNE $ae03			   ; $adb3: D0 4E
	JSR $b16b			   ; $adb5: 20 6B B1
	JSR $995e			   ; $adb8: 20 5E 99
	BRK					 ; $adbb: 00
	.db $b3			; $adbc
	.db $3b			; $adbd
	BRK					 ; $adbe: 00
	.db $07			; $adbf
	.db $6f			; $adc0
	PHA					 ; $adc1: 48
	CMP #$01				; $adc2: C9 01
	BCS $adfc			   ; $adc4: B0 36
	BRK					 ; $adc6: 00
	.db $23			; $adc7
	.db $fb			; $adc8
	LDA $62aa			   ; $adc9: AD AA 62
	ORA #$20				; $adcc: 09 20
	STA $62aa			   ; $adce: 8D AA 62
	JSR $d1f3			   ; $add1: 20 F3 D1
	LDA #$02				; $add4: A9 02
	STA $64				 ; $add6: 85 64
	JSR $c016			   ; $add8: 20 16 C0
	CLC					 ; $addb: 18
	JSR $c004			   ; $addc: 20 04 C0
	LDX #$aa				; $addf: A2 AA
	JSR $ae11			   ; $ade1: 20 11 AE
	DEX					 ; $ade4: CA
	BNE $ade1			   ; $ade5: D0 FA
	BRK					 ; $ade7: 00
	.db $07			; $ade8
	.db $9f			; $ade9
	BRK					 ; $adea: 00
	ASL $fb				 ; $adeb: 06 FB
	PLA					 ; $aded: 68
	TAX					 ; $adee: AA
	LDA #$80				; $adef: A9 80
	STA $6f60,X			 ; $adf1: 9D 60 6F
	STA $6f80,X			 ; $adf4: 9D 80 6F
	LDA #$1e				; $adf7: A9 1E
	STA $51				 ; $adf9: 85 51
	RTS					 ; $adfb: 60
	JSR $d1f3			   ; $adfc: 20 F3 D1
	BRK					 ; $adff: 00
	BRK					 ; $ae00: 00
	.db $cb			; $ae01
	.db $80			; $ae02
	PLA					 ; $ae03: 68
	STA $51				 ; $ae04: 85 51
	CLC					 ; $ae06: 18
	RTS					 ; $ae07: 60
	BRK					 ; $ae08: 00
	BRK					 ; $ae09: 00
	.db $db			; $ae0a
	.db $7f			; $ae0b
	PLA					 ; $ae0c: 68
	STA $51				 ; $ae0d: 85 51
	CLC					 ; $ae0f: 18
	RTS					 ; $ae10: 60
	LDA $0509			   ; $ae11: AD 09 05
	PHA					 ; $ae14: 48
	TXA					 ; $ae15: 8A
	AND #$c0				; $ae16: 29 C0
	LSR					 ; $ae18: 4A
	LSR					 ; $ae19: 4A
	LSR					 ; $ae1a: 4A
	LSR					 ; $ae1b: 4A
	LSR					 ; $ae1c: 4A
	LSR					 ; $ae1d: 4A
	CLC					 ; $ae1e: 18
	ADC #$02				; $ae1f: 69 02
	ADC $0509			   ; $ae21: 6D 09 05
	STA $0509			   ; $ae24: 8D 09 05
	JSR $ff74			   ; $ae27: 20 74 FF
	PLA					 ; $ae2a: 68
	STA $0509			   ; $ae2b: 8D 09 05
	JMP $ff74			   ; $ae2e: 4C 74 FF
	LDA #$8f				; $ae31: A9 8F
	JSR $a23a			   ; $ae33: 20 3A A2
	SEC					 ; $ae36: 38
	RTS					 ; $ae37: 60
	LDA $6fa0			   ; $ae38: AD A0 6F
	CMP #$08				; $ae3b: C9 08
	BNE $ae55			   ; $ae3d: D0 16
	LDA $6fc0			   ; $ae3f: AD C0 6F
	CMP #$03				; $ae42: C9 03
	BNE $ae55			   ; $ae44: D0 0F
	LDA #$07				; $ae46: A9 07
	BRK					 ; $ae48: 00
	.db $12			; $ae49
	.db $2f			; $ae4a
	LDY #$10				; $ae4b: A0 10
	BRK					 ; $ae4d: 00
	.db $03			; $ae4e
	.db $4f			; $ae4f
	BRK					 ; $ae50: 00
	.db $27			; $ae51
	.db $0f			; $ae52
	SEC					 ; $ae53: 38
	RTS					 ; $ae54: 60
	CLC					 ; $ae55: 18
	RTS					 ; $ae56: 60
	LDX #$00				; $ae57: A2 00
	LDA $44				 ; $ae59: A5 44
	CMP $aeb3,X			 ; $ae5b: DD B3 AE
	BNE $ae67			   ; $ae5e: D0 07
	LDA $45				 ; $ae60: A5 45
	CMP $aeb4,X			 ; $ae62: DD B4 AE
	BEQ $ae6d			   ; $ae65: F0 06
	INX					 ; $ae67: E8
	INX					 ; $ae68: E8
	CPX #$04				; $ae69: E0 04
	BCC $ae59			   ; $ae6b: 90 EC
	LDA $aeb7,X			 ; $ae6d: BD B7 AE
	STA $0563			   ; $ae70: 8D 63 05
	AND #$0f				; $ae73: 29 0F
	ORA #$80				; $ae75: 09 80
	STA $0530			   ; $ae77: 8D 30 05
	LDA $aeb8,X			 ; $ae7a: BD B8 AE
	STA $0564			   ; $ae7d: 8D 64 05
	LDA #$01				; $ae80: A9 01
	STA $0565			   ; $ae82: 8D 65 05
	LDA #$03				; $ae85: A9 03
	STA $0531			   ; $ae87: 8D 31 05
	LDA $aebd			   ; $ae8a: AD BD AE
	STA $0532			   ; $ae8d: 8D 32 05
	LDA $aebe			   ; $ae90: AD BE AE
	STA $0533			   ; $ae93: 8D 33 05
	LDA #$11				; $ae96: A9 11
	LDX #$03				; $ae98: A2 03
	STA $7046,X			 ; $ae9a: 9D 46 70
	LDX #$07				; $ae9d: A2 07
	STA $7046,X			 ; $ae9f: 9D 46 70
	LDX #$04				; $aea2: A2 04
	STA $7046,X			 ; $aea4: 9D 46 70
	LDX #$02				; $aea7: A2 02
	STA $7046,X			 ; $aea9: 9D 46 70
	LDA #$ff				; $aeac: A9 FF
	STA $6c0c			   ; $aeae: 8D 0C 6C
	SEC					 ; $aeb1: 38
	RTS					 ; $aeb2: 60
	.db $03			; $aeb3
	BPL $aebb			   ; $aeb4: 10 05
	BPL $aedb			   ; $aeb6: 10 23
	.db $83			; $aeb8
	.db $23			; $aeb9
	STA ($82,X)			 ; $aeba: 81 82
	STA ($63,X)			 ; $aebc: 81 63
	ORA $a4				 ; $aebe: 05 A4
	EOR ($b9),Y			 ; $aec0: 51 B9
	CPX #$70				; $aec2: E0 70
	ORA #$80				; $aec4: 09 80
	STA $70e0,Y			 ; $aec6: 99 E0 70
	LDX $6fe0,Y			 ; $aec9: BE E0 6F
	LDA #$1e				; $aecc: A9 1E
	BRK					 ; $aece: 00
	ORA $3887			   ; $aecf: 0D 87 38
	RTS					 ; $aed2: 60
	LDX #$02				; $aed3: A2 02
	LDA #$11				; $aed5: A9 11
	STA $7046,X			 ; $aed7: 9D 46 70
	SEC					 ; $aeda: 38
	RTS					 ; $aedb: 60
	LDX $51				 ; $aedc: A6 51
	LDA $7180,X			 ; $aede: BD 80 71
	PHA					 ; $aee1: 48
	TAX					 ; $aee2: AA
	LDA $aefd,X			 ; $aee3: BD FD AE
	BRK					 ; $aee6: 00
	.db $03			; $aee7
	.db $9f			; $aee8
	PLA					 ; $aee9: 68
	CMP #$06				; $aeea: C9 06
	BEQ $aef7			   ; $aeec: F0 09
	AND #$01				; $aeee: 29 01
	BEQ $aefc			   ; $aef0: F0 0A
	BRK					 ; $aef2: 00
	.db $02			; $aef3
	.db $4f			; $aef4
	SEC					 ; $aef5: 38
	RTS					 ; $aef6: 60
	LDY #$10				; $aef7: A0 10
	BRK					 ; $aef9: 00
	.db $03			; $aefa
	.db $4f			; $aefb
	SEC					 ; $aefc: 38
	RTS					 ; $aefd: 60
	TXA					 ; $aefe: 8A
	DEY					 ; $aeff: 88
	TXA					 ; $af00: 8A
	.db $8b			; $af01
	TXA					 ; $af02: 8A
	STX $8b8a			   ; $af03: 8E 8A 8B
	LDA $7000			   ; $af06: AD 00 70
	AND #$fc				; $af09: 29 FC
	ORA #$01				; $af0b: 09 01
	STA $7000			   ; $af0d: 8D 00 70
	LDA $51				 ; $af10: A5 51
	PHA					 ; $af12: 48
	JSR $995e			   ; $af13: 20 5E 99
	BRK					 ; $af16: 00
	SBC ($3b,X)			 ; $af17: E1 3B
	LDX #$00				; $af19: A2 00
	BRK					 ; $af1b: 00
	AND #$73				; $af1c: 29 73
	PHA					 ; $af1e: 48
	BEQ $af24			   ; $af1f: F0 03
	BRK					 ; $af21: 00
	.db $e2			; $af22
	.db $3b			; $af23
	BRK					 ; $af24: 00
	.db $e3			; $af25
	.db $3b			; $af26
	BRK					 ; $af27: 00
	CPX $3b				 ; $af28: E4 3B
	BRK					 ; $af2a: 00
	STX $a0fb			   ; $af2b: 8E FB A0
	BPL $af30			   ; $af2e: 10 00
	.db $03			; $af30
	.db $4f			; $af31
	PLA					 ; $af32: 68
	ASL					 ; $af33: 0A
	ASL					 ; $af34: 0A
	ASL					 ; $af35: 0A
	TAY					 ; $af36: A8
	PLA					 ; $af37: 68
	PHA					 ; $af38: 48
	TAX					 ; $af39: AA
	LDA $6fe0,X			 ; $af3a: BD E0 6F
	TAX					 ; $af3d: AA
	TYA					 ; $af3e: 98
	BRK					 ; $af3f: 00
	ORA $0087			   ; $af40: 0D 87 00
	ASL					 ; $af43: 0A
	.db $6f			; $af44
	BRK					 ; $af45: 00
	SBC $3b				 ; $af46: E5 3B
	JSR $d20a			   ; $af48: 20 0A D2
	PLA					 ; $af4b: 68
	STA $51				 ; $af4c: 85 51
	SEC					 ; $af4e: 38
	RTS					 ; $af4f: 60
	LDY $51				 ; $af50: A4 51
	LDX $6fe0,Y			 ; $af52: BE E0 6F
	LDA #$1e				; $af55: A9 1E
	BRK					 ; $af57: 00
	ORA $3887			   ; $af58: 0D 87 38
	RTS					 ; $af5b: 60
	BRK					 ; $af5c: 00
	.db $02			; $af5d
	.db $9f			; $af5e
	SEC					 ; $af5f: 38
	RTS					 ; $af60: 60
	LDX $3d				 ; $af61: A6 3D
	LDA $af81,X			 ; $af63: BD 81 AF
	STA $0563			   ; $af66: 8D 63 05
	LDA #$01				; $af69: A9 01
	STA $0531			   ; $af6b: 8D 31 05
	LDA #$82				; $af6e: A9 82
	STA $0530			   ; $af70: 8D 30 05
	LDA $aebd			   ; $af73: AD BD AE
	STA $0532			   ; $af76: 8D 32 05
	LDA $aebe			   ; $af79: AD BE AE
	STA $0533			   ; $af7c: 8D 33 05
	SEC					 ; $af7f: 38
	RTS					 ; $af80: 60
	.db $12			; $af81
	.db $82			; $af82
	.db $22			; $af83
	.db $42			; $af84
	LDA $44				 ; $af85: A5 44
	AND #$fe				; $af87: 29 FE
	CMP #$0e				; $af89: C9 0E
	BNE $af95			   ; $af8b: D0 08
	LDA $45				 ; $af8d: A5 45
	CMP #$15				; $af8f: C9 15
	BNE $af95			   ; $af91: D0 02
	SEC					 ; $af93: 38
	RTS					 ; $af94: 60
	CLC					 ; $af95: 18
	RTS					 ; $af96: 60
	LDA $6289			   ; $af97: AD 89 62
	BPL $afb6			   ; $af9a: 10 1A
	LDA $3e				 ; $af9c: A5 3E
	BEQ $afb2			   ; $af9e: F0 12
	JSR $b16b			   ; $afa0: 20 6B B1
	BRK					 ; $afa3: 00
	.db $07			; $afa4
	.db $6f			; $afa5
	.db $43			; $afa6
	BRK					 ; $afa7: 00
	.db $64			; $afa8
	.db $4b			; $afa9
	JSR $d218			   ; $afaa: 20 18 D2
	LDA #$25				; $afad: A9 25
	BRK					 ; $afaf: 00
	.db $07			; $afb0
	.db $cf			; $afb1
	LDA #$1e				; $afb2: A9 1E
	STA $51				 ; $afb4: 85 51
	CLC					 ; $afb6: 18
	RTS					 ; $afb7: 60
	LDA $45				 ; $afb8: A5 45
	CMP #$05				; $afba: C9 05
	BEQ $afc0			   ; $afbc: F0 02
	CLC					 ; $afbe: 18
	RTS					 ; $afbf: 60
	LDA #$8f				; $afc0: A9 8F
	JSR $a23a			   ; $afc2: 20 3A A2
	INC $0531			   ; $afc5: EE 31 05
	SEC					 ; $afc8: 38
	RTS					 ; $afc9: 60
	LDA $51				 ; $afca: A5 51
	PHA					 ; $afcc: 48
	TAX					 ; $afcd: AA
	LDA $7000,X			 ; $afce: BD 00 70
	AND #$fc				; $afd1: 29 FC
	STA $7000,X			 ; $afd3: 9D 00 70
	LDY #$03				; $afd6: A0 03
	LDA $44				 ; $afd8: A5 44
	CMP #$0f				; $afda: C9 0F
	BCC $afe0			   ; $afdc: 90 02
	LDY #$01				; $afde: A0 01
	TYA					 ; $afe0: 98
	ORA $7000,X			 ; $afe1: 1D 00 70
	STA $7000,X			 ; $afe4: 9D 00 70
	TYA					 ; $afe7: 98
	EOR #$02				; $afe8: 49 02
	ORA $7000			   ; $afea: 0D 00 70
	STA $7000			   ; $afed: 8D 00 70
	BRK					 ; $aff0: 00
	ORA #$5f				; $aff1: 09 5F
	PLA					 ; $aff3: 68
	TAX					 ; $aff4: AA
	STA $51				 ; $aff5: 85 51
	LDY #$00				; $aff7: A0 00
	LDA $44				 ; $aff9: A5 44
	CMP #$0f				; $affb: C9 0F
	BCC $b001			   ; $affd: 90 02
	LDY #$01				; $afff: A0 01
	LDA $7066,Y			 ; $b001: B9 66 70
	STA $7060,X			 ; $b004: 9D 60 70
	LDA $7086,Y			 ; $b007: B9 86 70
	STA $7080,X			 ; $b00a: 9D 80 70
	SEC					 ; $b00d: 38
	RTS					 ; $b00e: 60
	LDA $45				 ; $b00f: A5 45
	CMP #$10				; $b011: C9 10
	BNE $b03b			   ; $b013: D0 26
	LDA $44				 ; $b015: A5 44
	CMP #$0b				; $b017: C9 0B
	BCC $b03b			   ; $b019: 90 20
	CMP #$0f				; $b01b: C9 0F
	BCS $b03b			   ; $b01d: B0 1C
	LDY #$04				; $b01f: A0 04
	LDX #$06				; $b021: A2 06
	JSR $b001			   ; $b023: 20 01 B0
	LDY #$05				; $b026: A0 05
	LDX #$07				; $b028: A2 07
	JSR $b001			   ; $b02a: 20 01 B0
	LDY #$06				; $b02d: A0 06
	LDX #$08				; $b02f: A2 08
	JSR $b001			   ; $b031: 20 01 B0
	LDA #$8f				; $b034: A9 8F
	JSR $a23a			   ; $b036: 20 3A A2
	SEC					 ; $b039: 38
	RTS					 ; $b03a: 60
	CLC					 ; $b03b: 18
	RTS					 ; $b03c: 60
	JSR $995e			   ; $b03d: 20 5E 99
	BRK					 ; $b040: 00
	INX					 ; $b041: E8
	.db $3b			; $b042
	JSR $d218			   ; $b043: 20 18 D2
	LDA #$0d				; $b046: A9 0D
	BRK					 ; $b048: 00
	ORA ($8f,X)			 ; $b049: 01 8F
	BRK					 ; $b04b: 00
	.db $1f			; $b04c
	.db $ef			; $b04d
	LDA #$80				; $b04e: A9 80
	LDX #$02				; $b050: A2 02
	JSR $9963			   ; $b052: 20 63 99
	LDX #$00				; $b055: A2 00
	JSR $9963			   ; $b057: 20 63 99
	LDX #$01				; $b05a: A2 01
	JSR $9963			   ; $b05c: 20 63 99
	BRK					 ; $b05f: 00
	.db $03			; $b060
	.db $ef			; $b061
	JSR $c5bf			   ; $b062: 20 BF C5
	LDA #$1e				; $b065: A9 1E
	STA $51				 ; $b067: 85 51
	LDA #$00				; $b069: A9 00
	STA $0530			   ; $b06b: 8D 30 05
	BRK					 ; $b06e: 00
	CLC					 ; $b06f: 18
	.db $cb			; $b070
	.db $04			; $b071
	RTS					 ; $b072: 60
	LDA #$01				; $b073: A9 01
	STA $0515			   ; $b075: 8D 15 05
	JSR $c5c5			   ; $b078: 20 C5 C5
	BRK					 ; $b07b: 00
	ROL $20ef,X			 ; $b07c: 3E EF 20
	LSR $0099,X			 ; $b07f: 5E 99 00
	DEC $3b				 ; $b082: C6 3B
	JSR $d20a			   ; $b084: 20 0A D2
	LDA #$00				; $b087: A9 00
	STA $0530			   ; $b089: 8D 30 05
	JMP $b624			   ; $b08c: 4C 24 B6
	LDA $6fa0			   ; $b08f: AD A0 6F
	CMP #$1a				; $b092: C9 1A
	BNE $b0cc			   ; $b094: D0 36
	LDA $6fc0			   ; $b096: AD C0 6F
	CMP #$0f				; $b099: C9 0F
	BNE $b0cc			   ; $b09b: D0 2F
	LDA $3e				 ; $b09d: A5 3E
	BEQ $b0c5			   ; $b09f: F0 24
	LDX #$05				; $b0a1: A2 05
	LDA $7000,X			 ; $b0a3: BD 00 70
	AND #$7f				; $b0a6: 29 7F
	STA $7000,X			 ; $b0a8: 9D 00 70
	LDA $6fa0,X			 ; $b0ab: BD A0 6F
	STA $6f60,X			 ; $b0ae: 9D 60 6F
	LDA $6fc0,X			 ; $b0b1: BD C0 6F
	STA $6f80,X			 ; $b0b4: 9D 80 6F
	DEX					 ; $b0b7: CA
	BPL $b0a3			   ; $b0b8: 10 E9
	STA $45				 ; $b0ba: 85 45
	LDA $6f60			   ; $b0bc: AD 60 6F
	STA $44				 ; $b0bf: 85 44
	LDA #$00				; $b0c1: A9 00
	STA $3e				 ; $b0c3: 85 3E
	LDA #$12				; $b0c5: A9 12
	BRK					 ; $b0c7: 00
	.db $07			; $b0c8
	.db $cf			; $b0c9
	SEC					 ; $b0ca: 38
	RTS					 ; $b0cb: 60
	CLC					 ; $b0cc: 18
	RTS					 ; $b0cd: 60
	BRK					 ; $b0ce: 00
	.db $13			; $b0cf
	.db $eb			; $b0d0
	PHP					 ; $b0d1: 08
	BNE $b0f4			   ; $b0d2: D0 20
	BRK					 ; $b0d4: 00
	.db $13			; $b0d5
	.db $eb			; $b0d6
	BPL $b0c9			   ; $b0d7: 10 F0
	.db $1a			; $b0d9
	LDA $3e				 ; $b0da: A5 3E
	BEQ $b0f4			   ; $b0dc: F0 16
	BRK					 ; $b0de: 00
	.db $13			; $b0df
	.db $db			; $b0e0
	.db $ef			; $b0e1
	JSR $b16b			   ; $b0e2: 20 6B B1
	LDA $51				 ; $b0e5: A5 51
	PHA					 ; $b0e7: 48
	JSR $995e			   ; $b0e8: 20 5E 99
	BRK					 ; $b0eb: 00
	ROL $204b			   ; $b0ec: 2E 4B 20
	ASL					 ; $b0ef: 0A
	.db $d2			; $b0f0
	PLA					 ; $b0f1: 68
	STA $51				 ; $b0f2: 85 51
	CLC					 ; $b0f4: 18
	RTS					 ; $b0f5: 60
	BRK					 ; $b0f6: 00
	ASL $eb,X			   ; $b0f7: 16 EB
	PHP					 ; $b0f9: 08
	BNE $b169			   ; $b0fa: D0 6D
	LDA $6fa0			   ; $b0fc: AD A0 6F
	CMP #$12				; $b0ff: C9 12
	BNE $b169			   ; $b101: D0 66
	LDA $6fc0			   ; $b103: AD C0 6F
	CMP #$04				; $b106: C9 04
	BNE $b169			   ; $b108: D0 5F
	JSR $b16b			   ; $b10a: 20 6B B1
	LDA $51				 ; $b10d: A5 51
	PHA					 ; $b10f: 48
	TAX					 ; $b110: AA
	LDA $7000,X			 ; $b111: BD 00 70
	AND #$fc				; $b114: 29 FC
	STA $7000,X			 ; $b116: 9D 00 70
	LDX #$03				; $b119: A2 03
	LDA $7006,X			 ; $b11b: BD 06 70
	AND #$fc				; $b11e: 29 FC
	STA $7006,X			 ; $b120: 9D 06 70
	JSR $995e			   ; $b123: 20 5E 99
	BRK					 ; $b126: 00
	.db $17			; $b127
	.db $eb			; $b128
	BPL $b11b			   ; $b129: 10 F0
	BIT $6200			   ; $b12b: 2C 00 62
	.db $23			; $b12e
	RTI					 ; $b12f: 40
	CMP #$02				; $b130: C9 02
	BCS $b158			   ; $b132: B0 24
	LDX #$00				; $b134: A2 00
	BRK					 ; $b136: 00
	.db $2b			; $b137
	.db $73			; $b138
	CMP #$04				; $b139: C9 04
	BNE $b158			   ; $b13b: D0 1B
	BRK					 ; $b13d: 00
	ROR $93				 ; $b13e: 66 93
	.db $7b			; $b140
	BCS $b14c			   ; $b141: B0 09
	BRK					 ; $b143: 00
	EOR $004b,Y			 ; $b144: 59 4B 00
	.db $5a			; $b147
	.db $4b			; $b148
	JMP $b15e			   ; $b149: 4C 5E B1
	BRK					 ; $b14c: 00
	EOR $004b,Y			 ; $b14d: 59 4B 00
	.db $5b			; $b150
	.db $4b			; $b151
	BRK					 ; $b152: 00
	INC $4c3b			   ; $b153: EE 3B 4C
	LSR $00b1,X			 ; $b156: 5E B1 00
	SBC $003b			   ; $b159: ED 3B 00
	INC $683b			   ; $b15c: EE 3B 68
	PHA					 ; $b15f: 48
	TAX					 ; $b160: AA
	JSR $d20a			   ; $b161: 20 0A D2
	PLA					 ; $b164: 68
	STA $51				 ; $b165: 85 51
	SEC					 ; $b167: 38
	RTS					 ; $b168: 60
	CLC					 ; $b169: 18
	RTS					 ; $b16a: 60
	JSR $a509			   ; $b16b: 20 09 A5
	LDX #$05				; $b16e: A2 05
	LDA $7020,X			 ; $b170: BD 20 70
	BMI $b181			   ; $b173: 30 0C
	LDA $6fa0,X			 ; $b175: BD A0 6F
	STA $6f60,X			 ; $b178: 9D 60 6F
	LDA $6fc0,X			 ; $b17b: BD C0 6F
	STA $6f80,X			 ; $b17e: 9D 80 6F
	LDA $7000,X			 ; $b181: BD 00 70
	AND #$7f				; $b184: 29 7F
	STA $7000,X			 ; $b186: 9D 00 70
	DEX					 ; $b189: CA
	BPL $b170			   ; $b18a: 10 E4
	RTS					 ; $b18c: 60
	LDA $6f60			   ; $b18d: AD 60 6F
	CMP #$12				; $b190: C9 12
	BNE $b1aa			   ; $b192: D0 16
	LDA $6f80			   ; $b194: AD 80 6F
	CMP #$03				; $b197: C9 03
	BNE $b1aa			   ; $b199: D0 0F
	BRK					 ; $b19b: 00
	.db $17			; $b19c
	.db $eb			; $b19d
	.db $04			; $b19e
	BEQ $b1aa			   ; $b19f: F0 09
	LDA $3d				 ; $b1a1: A5 3D
	BNE $b1aa			   ; $b1a3: D0 05
	LDA #$8f				; $b1a5: A9 8F
	JMP $a23a			   ; $b1a7: 4C 3A A2
	CLC					 ; $b1aa: 18
	RTS					 ; $b1ab: 60
	LDA $51				 ; $b1ac: A5 51
	PHA					 ; $b1ae: 48
	LDA $7000			   ; $b1af: AD 00 70
	ORA #$01				; $b1b2: 09 01
	STA $7000			   ; $b1b4: 8D 00 70
	LDA #$01				; $b1b7: A9 01
	STA $3d				 ; $b1b9: 85 3D
	JSR $995e			   ; $b1bb: 20 5E 99
	BRK					 ; $b1be: 00
	.db $0b			; $b1bf
	.db $ef			; $b1c0
	STA $f9				 ; $b1c1: 85 F9
	BRK					 ; $b1c3: 00
	BEQ $b201			   ; $b1c4: F0 3B
	BRK					 ; $b1c6: 00
	SBC ($3b),Y			 ; $b1c7: F1 3B
	JSR $d20a			   ; $b1c9: 20 0A D2
	LDA #$00				; $b1cc: A9 00
	STA $0530			   ; $b1ce: 8D 30 05
	BRK					 ; $b1d1: 00
	ORA $20cb,Y			 ; $b1d2: 19 CB 20
	PLA					 ; $b1d5: 68
	STA $51				 ; $b1d6: 85 51
	SEC					 ; $b1d8: 38
	RTS					 ; $b1d9: 60
	LDA $45				 ; $b1da: A5 45
	AND #$fe				; $b1dc: 29 FE
	CMP #$0c				; $b1de: C9 0C
	BNE $b1ff			   ; $b1e0: D0 1D
	LDA $44				 ; $b1e2: A5 44
	CMP #$10				; $b1e4: C9 10
	BEQ $b1ec			   ; $b1e6: F0 04
	CMP #$18				; $b1e8: C9 18
	BNE $b1ff			   ; $b1ea: D0 13
	LDA #$11				; $b1ec: A9 11
	LDX #$03				; $b1ee: A2 03
	STA $7046,X			 ; $b1f0: 9D 46 70
	LDX #$02				; $b1f3: A2 02
	STA $7046,X			 ; $b1f5: 9D 46 70
	LDA #$8f				; $b1f8: A9 8F
	JSR $a23a			   ; $b1fa: 20 3A A2
	SEC					 ; $b1fd: 38
	RTS					 ; $b1fe: 60
	CLC					 ; $b1ff: 18
	RTS					 ; $b200: 60
	BRK					 ; $b201: 00
	ASL $10eb			   ; $b202: 0E EB 10
	BNE $b221			   ; $b205: D0 1A
	LDX #$00				; $b207: A2 00
	LDA $b27f,X			 ; $b209: BD 7F B2
	CMP $44				 ; $b20c: C5 44
	BNE $b217			   ; $b20e: D0 07
	LDA $b280,X			 ; $b210: BD 80 B2
	CMP $45				 ; $b213: C5 45
	BEQ $b223			   ; $b215: F0 0C
	INX					 ; $b217: E8
	INX					 ; $b218: E8
	CPX #$06				; $b219: E0 06
	BCC $b209			   ; $b21b: 90 EC
	BRK					 ; $b21d: 00
	ASL $efdb			   ; $b21e: 0E DB EF
	CLC					 ; $b221: 18
	RTS					 ; $b222: 60
	LDY $51				 ; $b223: A4 51
	LDA $7000,Y			 ; $b225: B9 00 70
	AND #$fc				; $b228: 29 FC
	STA $7000,Y			 ; $b22a: 99 00 70
	TXA					 ; $b22d: 8A
	LSR					 ; $b22e: 4A
	TAX					 ; $b22f: AA
	INX					 ; $b230: E8
	TXA					 ; $b231: 8A
	PHA					 ; $b232: 48
	ORA $7000,Y			 ; $b233: 19 00 70
	STA $7000,Y			 ; $b236: 99 00 70
	BRK					 ; $b239: 00
	ASL $10cb			   ; $b23a: 0E CB 10
	LDA #$00				; $b23d: A9 00
	BRK					 ; $b23f: 00
	.db $63			; $b240
	.db $63			; $b241
	.db $43			; $b242
	PLA					 ; $b243: 68
	LDX #$04				; $b244: A2 04
	LDY #$01				; $b246: A0 01
	BCC $b273			   ; $b248: 90 29
	TAX					 ; $b24a: AA
	LDA #$02				; $b24b: A9 02
	STA $0563			   ; $b24d: 8D 63 05
	AND #$0f				; $b250: 29 0F
	ORA #$80				; $b252: 09 80
	STA $0530			   ; $b254: 8D 30 05
	LDA $b284,X			 ; $b257: BD 84 B2
	STA $0564			   ; $b25a: 8D 64 05
	LDA #$02				; $b25d: A9 02
	STA $0531			   ; $b25f: 8D 31 05
	LDA $aebd			   ; $b262: AD BD AE
	STA $0532			   ; $b265: 8D 32 05
	LDA $aebe			   ; $b268: AD BE AE
	STA $0533			   ; $b26b: 8D 33 05
	LDX #$04				; $b26e: A2 04
	LDY #$02				; $b270: A0 02
	SEC					 ; $b272: 38
	STY $0593			   ; $b273: 8C 93 05
	STX $0594			   ; $b276: 8E 94 05
	LDA #$80				; $b279: A9 80
	STA $0527			   ; $b27b: 8D 27 05
	RTS					 ; $b27e: 60
	ORA $0c,X			   ; $b27f: 15 0C
	.db $14			; $b281
	ORA $0c13			   ; $b282: 0D 13 0C
	.db $42			; $b285
	.db $12			; $b286
	.db $82			; $b287
	LDA $44				 ; $b288: A5 44
	CMP #$05				; $b28a: C9 05
	BNE $b294			   ; $b28c: D0 06
	LDA $45				 ; $b28e: A5 45
	CMP #$05				; $b290: C9 05
	BEQ $b2a2			   ; $b292: F0 0E
	LDA $44				 ; $b294: A5 44
	CMP #$07				; $b296: C9 07
	BNE $b2a0			   ; $b298: D0 06
	LDA $45				 ; $b29a: A5 45
	CMP #$03				; $b29c: C9 03
	BEQ $b2a2			   ; $b29e: F0 02
	CLC					 ; $b2a0: 18
	RTS					 ; $b2a1: 60
	LDA $51				 ; $b2a2: A5 51
	PHA					 ; $b2a4: 48
	JSR $b16b			   ; $b2a5: 20 6B B1
	BRK					 ; $b2a8: 00
	.db $07			; $b2a9
	.db $6f			; $b2aa
	.db $43			; $b2ab
	BRK					 ; $b2ac: 00
	.db $62			; $b2ad
	.db $23			; $b2ae
	RTI					 ; $b2af: 40
	TAX					 ; $b2b0: AA
	DEX					 ; $b2b1: CA
	LDA #$37				; $b2b2: A9 37
	BRK					 ; $b2b4: 00
	AND ($73),Y			 ; $b2b5: 31 73
	BCS $b2c2			   ; $b2b7: B0 09
	DEX					 ; $b2b9: CA
	BPL $b2b2			   ; $b2ba: 10 F6
	BRK					 ; $b2bc: 00
	LDA $4c4b			   ; $b2bd: AD 4B 4C
	CMP $b2				 ; $b2c0: C5 B2
	BRK					 ; $b2c2: 00
	LDX $204b			   ; $b2c3: AE 4B 20
	ASL					 ; $b2c6: 0A
	.db $d2			; $b2c7
	PLA					 ; $b2c8: 68
	STA $51				 ; $b2c9: 85 51
	SEC					 ; $b2cb: 38
	RTS					 ; $b2cc: 60
	LDX #$00				; $b2cd: A2 00
	LDA $3d				 ; $b2cf: A5 3D
	BEQ $b2d5			   ; $b2d1: F0 02
	LDX #$03				; $b2d3: A2 03
	LDY $51				 ; $b2d5: A4 51
	LDA $b302,X			 ; $b2d7: BD 02 B3
	STA $71a0,Y			 ; $b2da: 99 A0 71
	LDA $b303,X			 ; $b2dd: BD 03 B3
	STA $71c0,Y			 ; $b2e0: 99 C0 71
	LDA $7000,Y			 ; $b2e3: B9 00 70
	AND #$fc				; $b2e6: 29 FC
	ORA $b304,X			 ; $b2e8: 1D 04 B3
	STA $7000,Y			 ; $b2eb: 99 00 70
	LDA #$80				; $b2ee: A9 80
	LDX #$0b				; $b2f0: A2 0B
	STA $6f66,X			 ; $b2f2: 9D 66 6F
	STA $6fa6,X			 ; $b2f5: 9D A6 6F
	LDX #$02				; $b2f8: A2 02
	STA $6f66,X			 ; $b2fa: 9D 66 6F
	STA $6fa6,X			 ; $b2fd: 9D A6 6F
	SEC					 ; $b300: 38
	RTS					 ; $b301: 60
	ORA ($09),Y			 ; $b302: 11 09
	ORA (ptr_lo,X)		  ; $b304: 01 10
	.db $0b			; $b306
	.db $02			; $b307
	LDA $44				 ; $b308: A5 44
	CMP #$11				; $b30a: C9 11
	BNE $b335			   ; $b30c: D0 27
	LDA $45				 ; $b30e: A5 45
	CMP #$09				; $b310: C9 09
	BEQ $b318			   ; $b312: F0 04
	CMP #$0b				; $b314: C9 0B
	BNE $b335			   ; $b316: D0 1D
	LDX #$0d				; $b318: A2 0D
	LDA #$11				; $b31a: A9 11
	STA $7046,X			 ; $b31c: 9D 46 70
	LDX #$0e				; $b31f: A2 0E
	STA $7046,X			 ; $b321: 9D 46 70
	LDA #$12				; $b324: A9 12
	STA $71a6,X			 ; $b326: 9D A6 71
	LDA $45				 ; $b329: A5 45
	STA $71c6,X			 ; $b32b: 9D C6 71
	LDA #$8f				; $b32e: A9 8F
	JSR $a23a			   ; $b330: 20 3A A2
	SEC					 ; $b333: 38
	RTS					 ; $b334: 60
	CLC					 ; $b335: 18
	RTS					 ; $b336: 60
	LDA $45				 ; $b337: A5 45
	SEC					 ; $b339: 38
	SBC #$09				; $b33a: E9 09
	TAX					 ; $b33c: AA
	LDA $b363,X			 ; $b33d: BD 63 B3
	STA $0563			   ; $b340: 8D 63 05
	AND #$0f				; $b343: 29 0F
	ORA #$80				; $b345: 09 80
	STA $0530			   ; $b347: 8D 30 05
	LDA $b364,X			 ; $b34a: BD 64 B3
	STA $0564			   ; $b34d: 8D 64 05
	LDA #$02				; $b350: A9 02
	STA $0531			   ; $b352: 8D 31 05
	LDA $aebd			   ; $b355: AD BD AE
	STA $0532			   ; $b358: 8D 32 05
	LDA $aebe			   ; $b35b: AD BE AE
	STA $0533			   ; $b35e: 8D 33 05
	SEC					 ; $b361: 38
	RTS					 ; $b362: 60
	.db $82			; $b363
	STA ($82,X)			 ; $b364: 81 82
	.db $12			; $b366
	LDA $7831			   ; $b367: AD 31 78
	CMP #$27				; $b36a: C9 27
	BNE $b375			   ; $b36c: D0 07
	LDX $51				 ; $b36e: A6 51
	LDA #$01				; $b370: A9 01
	STA $7180,X			 ; $b372: 9D 80 71
	SEC					 ; $b375: 38
	RTS					 ; $b376: 60
	LDA #$ff				; $b377: A9 FF
	STA $6c0c			   ; $b379: 8D 0C 6C
	BRK					 ; $b37c: 00
	.db $82			; $b37d
	.db $fb			; $b37e
	JSR $c5c5			   ; $b37f: 20 C5 C5
	LDA #$02				; $b382: A9 02
	STA $64				 ; $b384: 85 64
	LDA #$09				; $b386: A9 09
	STA $44				 ; $b388: 85 44
	LDA #$07				; $b38a: A9 07
	STA $45				 ; $b38c: 85 45
	LDA #$00				; $b38e: A9 00
	BRK					 ; $b390: 00
	AND ($ef),Y			 ; $b391: 31 EF
	JSR $c5bf			   ; $b393: 20 BF C5
	BRK					 ; $b396: 00
	ORA $005f,Y			 ; $b397: 19 5F 00
	.db $82			; $b39a
	.db $fb			; $b39b
	JSR $c5c5			   ; $b39c: 20 C5 C5
	BRK					 ; $b39f: 00
	.db $6f			; $b3a0
	.db $33			; $b3a1
	BRK					 ; $b3a2: 00
	LSR $33,X			   ; $b3a3: 56 33
	LDX #$01				; $b3a5: A2 01
	BRK					 ; $b3a7: 00
	.db $2b			; $b3a8
	.db $73			; $b3a9
	BEQ $b3b0			   ; $b3aa: F0 04
	CMP #$08				; $b3ac: C9 08
	BCC $b3b4			   ; $b3ae: 90 04
	INX					 ; $b3b0: E8
	JMP $b3a7			   ; $b3b1: 4C A7 B3
	ORA #$80				; $b3b4: 09 80
	STA $6299			   ; $b3b6: 8D 99 62
	BRK					 ; $b3b9: 00
	.db $42			; $b3ba
	.db $73			; $b3bb
	CMP #$01				; $b3bc: C9 01
	BNE $b3c4			   ; $b3be: D0 04
	BRK					 ; $b3c0: 00
	ASL $40cb,X			 ; $b3c1: 1E CB 40
	STX $f9				 ; $b3c4: 86 F9
	BRK					 ; $b3c6: 00
	JMP $a24b			   ; $b3c7: 4C 4B A2
	.db $03			; $b3ca
	LDA $0554,X			 ; $b3cb: BD 54 05
	STA $629c,X			 ; $b3ce: 9D 9C 62
	DEX					 ; $b3d1: CA
	BPL $b3cb			   ; $b3d2: 10 F7
	BRK					 ; $b3d4: 00
	ORA $b7				 ; $b3d5: 05 B7
	JSR $995e			   ; $b3d7: 20 5E 99
	JSR $b3e9			   ; $b3da: 20 E9 B3
	BRK					 ; $b3dd: 00
	RTI					 ; $b3de: 40
	.db $4b			; $b3df
	BRK					 ; $b3e0: 00
	EOR ($4b,X)			 ; $b3e1: 41 4B
	JSR $d20a			   ; $b3e3: 20 0A D2
	JMP $b624			   ; $b3e6: 4C 24 B6
	LDA #$40				; $b3e9: A9 40
	STA $055a			   ; $b3eb: 8D 5A 05
	LDA $62a7			   ; $b3ee: AD A7 62
	STA $0559			   ; $b3f1: 8D 59 05
	LDA $62a6			   ; $b3f4: AD A6 62
	STA $0558			   ; $b3f7: 8D 58 05
	LDX #$03				; $b3fa: A2 03
	LDA $629c,X			 ; $b3fc: BD 9C 62
	STA $0554,X			 ; $b3ff: 9D 54 05
	DEX					 ; $b402: CA
	BPL $b3fc			   ; $b403: 10 F7
	RTS					 ; $b405: 60
	LDA $6296			   ; $b406: AD 96 62
	BEQ $b42a			   ; $b409: F0 1F
	LDA $6297			   ; $b40b: AD 97 62
	BPL $b42a			   ; $b40e: 10 1A
	LDA $44				 ; $b410: A5 44
	SEC					 ; $b412: 38
	SBC #$03				; $b413: E9 03
	CMP #$09				; $b415: C9 09
	BCS $b42a			   ; $b417: B0 11
	CMP #$04				; $b419: C9 04
	BEQ $b42a			   ; $b41b: F0 0D
	AND #$01				; $b41d: 29 01
	BNE $b42a			   ; $b41f: D0 09
	LDA $45				 ; $b421: A5 45
	SEC					 ; $b423: 38
	SBC #$12				; $b424: E9 12
	CMP #$04				; $b426: C9 04
	BCC $b431			   ; $b428: 90 07
	LDX $51				 ; $b42a: A6 51
	LDA #$0f				; $b42c: A9 0F
	STA $7180,X			 ; $b42e: 9D 80 71
	SEC					 ; $b431: 38
	RTS					 ; $b432: 60
	LDA $51				 ; $b433: A5 51
	PHA					 ; $b435: 48
	JSR $995e			   ; $b436: 20 5E 99
	BRK					 ; $b439: 00
	EOR #$4b				; $b43a: 49 4B
	LDY #$10				; $b43c: A0 10
	BRK					 ; $b43e: 00
	.db $03			; $b43f
	.db $4f			; $b440
	LDA #$21				; $b441: A9 21
	BRK					 ; $b443: 00
	.db $07			; $b444
	.db $cf			; $b445
	LDA #$11				; $b446: A9 11
	LDX #$02				; $b448: A2 02
	STA $7046,X			 ; $b44a: 9D 46 70
	LDX #$03				; $b44d: A2 03
	STA $7046,X			 ; $b44f: 9D 46 70
	LDX #$04				; $b452: A2 04
	STA $7046,X			 ; $b454: 9D 46 70
	LDX #$05				; $b457: A2 05
	STA $7046,X			 ; $b459: 9D 46 70
	LDX #$06				; $b45c: A2 06
	STA $7046,X			 ; $b45e: 9D 46 70
	PLA					 ; $b461: 68
	STA $51				 ; $b462: 85 51
	TAX					 ; $b464: AA
	LDA #$80				; $b465: A9 80
	STA $6f60,X			 ; $b467: 9D 60 6F
	STA $6fa0,X			 ; $b46a: 9D A0 6F
	STA $6f80,X			 ; $b46d: 9D 80 6F
	STA $6fc0,X			 ; $b470: 9D C0 6F
	BRK					 ; $b473: 00
	.db $1a			; $b474
	.db $cb			; $b475
	ORA ($38,X)			 ; $b476: 01 38
	RTS					 ; $b478: 60
	LDA $6fa0			   ; $b479: AD A0 6F
	CMP #$06				; $b47c: C9 06
	BNE $b48a			   ; $b47e: D0 0A
	LDA $6fc0			   ; $b480: AD C0 6F
	CMP #$07				; $b483: C9 07
	BNE $b48a			   ; $b485: D0 03
	JMP $ae46			   ; $b487: 4C 46 AE
	CLC					 ; $b48a: 18
	RTS					 ; $b48b: 60
	LDA $3e				 ; $b48c: A5 3E
	BEQ $b4af			   ; $b48e: F0 1F
	JSR $b16b			   ; $b490: 20 6B B1
	LDA #$8f				; $b493: A9 8F
	JSR $a23a			   ; $b495: 20 3A A2
	INC $0531			   ; $b498: EE 31 05
	INC $0531			   ; $b49b: EE 31 05
	INC $0531			   ; $b49e: EE 31 05
	LDA #$11				; $b4a1: A9 11
	LDX #$05				; $b4a3: A2 05
	STA $7046,X			 ; $b4a5: 9D 46 70
	LDX #$06				; $b4a8: A2 06
	STA $7046,X			 ; $b4aa: 9D 46 70
	SEC					 ; $b4ad: 38
	RTS					 ; $b4ae: 60
	CLC					 ; $b4af: 18
	RTS					 ; $b4b0: 60
	LDA $3d				 ; $b4b1: A5 3D
	BNE $b4e1			   ; $b4b3: D0 2C
	LDA #$8f				; $b4b5: A9 8F
	JSR $a23a			   ; $b4b7: 20 3A A2
	LDA #$00				; $b4ba: A9 00
	BRK					 ; $b4bc: 00
	ROL $2f				 ; $b4bd: 26 2F
	BCC $b4f2			   ; $b4bf: 90 31
	LDA #$94				; $b4c1: A9 94
	JSR $b4e3			   ; $b4c3: 20 E3 B4
	BCC $b4cd			   ; $b4c6: 90 05
	LDA #$a1				; $b4c8: A9 A1
	JSR $b4e7			   ; $b4ca: 20 E7 B4
	LDA #$c4				; $b4cd: A9 C4
	JSR $b4e7			   ; $b4cf: 20 E7 B4
	LDA #$b7				; $b4d2: A9 B7
	JSR $b4e7			   ; $b4d4: 20 E7 B4
	LDA #$cb				; $b4d7: A9 CB
	JSR $b4e7			   ; $b4d9: 20 E7 B4
	LDA #$00				; $b4dc: A9 00
	STA $0530			   ; $b4de: 8D 30 05
	CLC					 ; $b4e1: 18
	RTS					 ; $b4e2: 60
	JSR $b4e7			   ; $b4e3: 20 E7 B4
	RTS					 ; $b4e6: 60
	BRK					 ; $b4e7: 00
	AND ($73),Y			 ; $b4e8: 31 73
	BCC $b4f0			   ; $b4ea: 90 04
	LDA $73				 ; $b4ec: A5 73
	BMI $b4f4			   ; $b4ee: 30 04
	PLA					 ; $b4f0: 68
	PLA					 ; $b4f1: 68
	SEC					 ; $b4f2: 38
	RTS					 ; $b4f3: 60
	CLC					 ; $b4f4: 18
	RTS					 ; $b4f5: 60
	LDX $51				 ; $b4f6: A6 51
	TXA					 ; $b4f8: 8A
	PHA					 ; $b4f9: 48
	LDA $6f60,X			 ; $b4fa: BD 60 6F
	SEC					 ; $b4fd: 38
	SBC $6fa0			   ; $b4fe: ED A0 6F
	CLC					 ; $b501: 18
	ADC #$01				; $b502: 69 01
	CMP #$03				; $b504: C9 03
	BCS $b546			   ; $b506: B0 3E
	STA $51				 ; $b508: 85 51
	LDA $6f80,X			 ; $b50a: BD 80 6F
	SEC					 ; $b50d: 38
	SBC $6fc0			   ; $b50e: ED C0 6F
	CLC					 ; $b511: 18
	ADC #$01				; $b512: 69 01
	CMP #$03				; $b514: C9 03
	BCS $b546			   ; $b516: B0 2E
	ADC $51				 ; $b518: 65 51
	AND #$01				; $b51a: 29 01
	BEQ $b546			   ; $b51c: F0 28
	PLA					 ; $b51e: 68
	JSR $b16b			   ; $b51f: 20 6B B1
	BRK					 ; $b522: 00
	.db $07			; $b523
	.db $6f			; $b524
	.db $43			; $b525
	BRK					 ; $b526: 00
	.db $cb			; $b527
	.db $4b			; $b528
	BRK					 ; $b529: 00
	.db $82			; $b52a
	.db $fb			; $b52b
	JSR $c5c5			   ; $b52c: 20 C5 C5
	LDA #$00				; $b52f: A9 00
	STA $64				 ; $b531: 85 64
	LDA #$0b				; $b533: A9 0B
	STA $44				 ; $b535: 85 44
	LDA #$15				; $b537: A9 15
	STA $45				 ; $b539: 85 45
	LDA #$81				; $b53b: A9 81
	BRK					 ; $b53d: 00
	AND ($ef),Y			 ; $b53e: 31 EF
	JSR $c5bf			   ; $b540: 20 BF C5
	JMP $b624			   ; $b543: 4C 24 B6
	PLA					 ; $b546: 68
	STA $51				 ; $b547: 85 51
	LDA $3e				 ; $b549: A5 3E
	CMP #$10				; $b54b: C9 10
	RTS					 ; $b54d: 60
	LDA $629b			   ; $b54e: AD 9B 62
	AND #$22				; $b551: 29 22
	CMP #$20				; $b553: C9 20
	BNE $b56b			   ; $b555: D0 14
	BRK					 ; $b557: 00
	.db $62			; $b558
	.db $23			; $b559
	RTI					 ; $b55a: 40
	STA tmp0				; $b55b: 85 00
	LDX #$00				; $b55d: A2 00
	BRK					 ; $b55f: 00
	.db $2b			; $b560
	.db $73			; $b561
	CMP #$0e				; $b562: C9 0E
	BEQ $b56d			   ; $b564: F0 07
	INX					 ; $b566: E8
	CPX tmp0				; $b567: E4 00
	BCC $b55f			   ; $b569: 90 F4
	CLC					 ; $b56b: 18
	RTS					 ; $b56c: 60
	LDA $51				 ; $b56d: A5 51
	PHA					 ; $b56f: 48
	TXA					 ; $b570: 8A
	PHA					 ; $b571: 48
	JSR $b16b			   ; $b572: 20 6B B1
	PLA					 ; $b575: 68
	PHA					 ; $b576: 48
	TAX					 ; $b577: AA
	LDA $6be7,X			 ; $b578: BD E7 6B
	AND #$40				; $b57b: 29 40
	BEQ $b593			   ; $b57d: F0 14
	BRK					 ; $b57f: 00
	.db $44			; $b580
	.db $93			; $b581
	.db $07			; $b582
	BRK					 ; $b583: 00
	ORA $33				 ; $b584: 05 33
	BRK					 ; $b586: 00
	.db $07			; $b587
	.db $6f			; $b588
	.db $43			; $b589
	BRK					 ; $b58a: 00
	.db $3b			; $b58b
	.db $ef			; $b58c
	BRK					 ; $b58d: 00
	.db $62			; $b58e
	.db $4b			; $b58f
	JMP $b597			   ; $b590: 4C 97 B5
	BRK					 ; $b593: 00
	.db $07			; $b594
	.db $6f			; $b595
	.db $43			; $b596
	BRK					 ; $b597: 00
	.db $63			; $b598
	.db $4b			; $b599
	JSR $d214			   ; $b59a: 20 14 D2
	PLA					 ; $b59d: 68
	TAX					 ; $b59e: AA
	LDA #$ff				; $b59f: A9 FF
	BRK					 ; $b5a1: 00
	EOR ($73),Y			 ; $b5a2: 51 73
	LDA $053a,X			 ; $b5a4: BD 3A 05
	TAX					 ; $b5a7: AA
	LDY #$02				; $b5a8: A0 02
	LDA $6f60,X			 ; $b5aa: BD 60 6F
	STA $6f66,Y			 ; $b5ad: 99 66 6F
	STA $6fa6,Y			 ; $b5b0: 99 A6 6F
	LDA $6f80,X			 ; $b5b3: BD 80 6F
	STA $6f86,Y			 ; $b5b6: 99 86 6F
	STA $6fc6,Y			 ; $b5b9: 99 C6 6F
	LDA #$80				; $b5bc: A9 80
	STA $7020,X			 ; $b5be: 9D 20 70
	BRK					 ; $b5c1: 00
	JSR $02cb			   ; $b5c2: 20 CB 02
	LDA #$85				; $b5c5: A9 85
	JSR $a23a			   ; $b5c7: 20 3A A2
	BRK					 ; $b5ca: 00
	.db $3b			; $b5cb
	.db $ef			; $b5cc
	JSR $d1f3			   ; $b5cd: 20 F3 D1
	PLA					 ; $b5d0: 68
	STA $51				 ; $b5d1: 85 51
	SEC					 ; $b5d3: 38
	RTS					 ; $b5d4: 60
	LDA $51				 ; $b5d5: A5 51
	PHA					 ; $b5d7: 48
	LDA #$2a				; $b5d8: A9 2A
	BRK					 ; $b5da: 00
	.db $07			; $b5db
	.db $cf			; $b5dc
	PLA					 ; $b5dd: 68
	STA $51				 ; $b5de: 85 51
	CLC					 ; $b5e0: 18
	RTS					 ; $b5e1: 60
	LDA $45				 ; $b5e2: A5 45
	CMP #$04				; $b5e4: C9 04
	BNE $b5f7			   ; $b5e6: D0 0F
	LDA $44				 ; $b5e8: A5 44
	AND #$fe				; $b5ea: 29 FE
	CMP #$14				; $b5ec: C9 14
	BNE $b5f7			   ; $b5ee: D0 07
	LDA #$8f				; $b5f0: A9 8F
	JSR $a23a			   ; $b5f2: 20 3A A2
	SEC					 ; $b5f5: 38
	RTS					 ; $b5f6: 60
	CLC					 ; $b5f7: 18
	RTS					 ; $b5f8: 60
	LDA $44				 ; $b5f9: A5 44
	CMP #$07				; $b5fb: C9 07
	BNE $b60c			   ; $b5fd: D0 0D
	LDA $45				 ; $b5ff: A5 45
	CMP #$07				; $b601: C9 07
	BNE $b60c			   ; $b603: D0 07
	LDA #$84				; $b605: A9 84
	JSR $a23a			   ; $b607: 20 3A A2
	SEC					 ; $b60a: 38
	RTS					 ; $b60b: 60
	CLC					 ; $b60c: 18
	RTS					 ; $b60d: 60
	LDA #$2b				; $b60e: A9 2B
	BRK					 ; $b610: 00
	.db $07			; $b611
	.db $cf			; $b612
	JMP $b624			   ; $b613: 4C 24 B6
	JSR $b95c			   ; $b616: 20 5C B9
	LDA #$06				; $b619: A9 06
	STA $51				 ; $b61b: 85 51
	CLC					 ; $b61d: 18
	RTS					 ; $b61e: 60
	JSR $fdfb			   ; $b61f: 20 FB FD
	CLC					 ; $b622: 18
	RTS					 ; $b623: 60
	LDA #$1e				; $b624: A9 1E
	STA $51				 ; $b626: 85 51
	CLC					 ; $b628: 18
	RTS					 ; $b629: 60
	BVS $b5c5			   ; $b62a: 70 99
	LDA $99				 ; $b62c: A5 99
	BNE $b5c9			   ; $b62e: D0 99
	.db $da			; $b630
	STA $99e1,Y			 ; $b631: 99 E1 99
	SBC ($99),Y			 ; $b634: F1 99
	CMP $9a				 ; $b636: C5 9A
	.db $2f			; $b638
	.db $9b			; $b639
	ROL $9b,X			   ; $b63a: 36 9B
	AND $429b,X			 ; $b63c: 3D 9B 42
	.db $9b			; $b63f
	.db $64			; $b640
	.db $9b			; $b641
	.db $77			; $b642
	.db $9b			; $b643
	STA ($9b,X)			 ; $b644: 81 9B
	.db $83			; $b646
	.db $9b			; $b647
	.db $93			; $b648
	.db $9b			; $b649
	.db $a3			; $b64a
	.db $9b			; $b64b
	DEC $d39b			   ; $b64c: CE 9B D3
	.db $9b			; $b64f
	.db $f7			; $b650
	.db $9b			; $b651
	.db $07			; $b652
	.db $9c			; $b653
	ROL $9c				 ; $b654: 26 9C
	.db $52			; $b656
	.db $9c			; $b657
	.db $b7			; $b658
	.db $9c			; $b659
	CMP $f99c,X			 ; $b65a: DD 9C F9
	.db $9f			; $b65d
	LSR $5da0			   ; $b65e: 4E A0 5D
	LDY #$97				; $b661: A0 97
	LDY #$b3				; $b663: A0 B3
	LDY #$c8				; $b665: A0 C8
	LDY #$64				; $b667: A0 64
	LDA ($8c,X)			 ; $b669: A1 8C
	LDA ($f5,X)			 ; $b66b: A1 F5
	LDA ($fd,X)			 ; $b66d: A1 FD
	LDA (ptr0_lo,X)		 ; $b66f: A1 04
	LDX #$13				; $b671: A2 13
	LDX #$4c				; $b673: A2 4C
	LDX #$7a				; $b675: A2 7A
	LDX #$0c				; $b677: A2 0C
	.db $a3			; $b679
	AND ($a3,X)			 ; $b67a: 21 A3
	.db $43			; $b67c
	.db $a3			; $b67d
	.db $52			; $b67e
	.db $a3			; $b67f
	.db $67			; $b680
	.db $a3			; $b681
	STX $9da3			   ; $b682: 8E A3 9D
	.db $a3			; $b685
	.db $da			; $b686
	.db $a3			; $b687
	ASL $a4,X			   ; $b688: 16 A4
	.db $43			; $b68a
	LDY $4d				 ; $b68b: A4 4D
	LDY $5b				 ; $b68d: A4 5B
	LDY $a8				 ; $b68f: A4 A8
	LDY $3e				 ; $b691: A4 3E
	LDA $49				 ; $b693: A5 49
	LDA $88				 ; $b695: A5 88
	LDA $a7				 ; $b697: A5 A7
	LDA $4d				 ; $b699: A5 4D
	LDX $71				 ; $b69b: A6 71
	LDX $d6				 ; $b69d: A6 D6
	LDX $df				 ; $b69f: A6 DF
	LDX $ea				 ; $b6a1: A6 EA
	LDX $24				 ; $b6a3: A6 24
	.db $a7			; $b6a5
	.db $32			; $b6a6
	.db $a7			; $b6a7
	ADC $a7				 ; $b6a8: 65 A7
	LDA ($a7),Y			 ; $b6aa: B1 A7
	ORA ($a8,X)			 ; $b6ac: 01 A8
	.db $17			; $b6ae
	TAY					 ; $b6af: A8
	CLI					 ; $b6b0: 58
	TAY					 ; $b6b1: A8
	.db $93			; $b6b2
	TAY					 ; $b6b3: A8
	.db $3b			; $b6b4
	LDA #$68				; $b6b5: A9 68
	LDA #$a3				; $b6b7: A9 A3
	LDA #$c1				; $b6b9: A9 C1
	LDA #$ca				; $b6bb: A9 CA
	LDA #$d8				; $b6bd: A9 D8
	LDA #$2a				; $b6bf: A9 2A
	TAX					 ; $b6c1: AA
	EOR $72aa			   ; $b6c2: 4D AA 72
	TAX					 ; $b6c5: AA
	.db $9f			; $b6c6
	TAX					 ; $b6c7: AA
	.db $bf			; $b6c8
	TAX					 ; $b6c9: AA
	INC $aa,X			   ; $b6ca: F6 AA
	TYA					 ; $b6cc: 98
	.db $ab			; $b6cd
	INY					 ; $b6ce: C8
	.db $ab			; $b6cf
	.db $0b			; $b6d0
	LDY $ac60			   ; $b6d1: AC 60 AC
	ROR					 ; $b6d4: 6A
	LDY $ac9a			   ; $b6d5: AC 9A AC
	INY					 ; $b6d8: C8
	LDY $acd2			   ; $b6d9: AC D2 AC
	SBC $ac,X			   ; $b6dc: F5 AC
	.db $ff			; $b6de
	LDY $ad1a			   ; $b6df: AC 1A AD
	JMP $73ad			   ; $b6e2: 4C AD 73
	LDA $ad9e			   ; $b6e5: AD 9E AD
	AND ($ae),Y			 ; $b6e8: 31 AE
	SEC					 ; $b6ea: 38
	LDX $ae57			   ; $b6eb: AE 57 AE
	.db $bf			; $b6ee
	LDX $aed3			   ; $b6ef: AE D3 AE
	.db $dc			; $b6f2
	LDX $af06			   ; $b6f3: AE 06 AF
	BVC $b6a7			   ; $b6f6: 50 AF
	.db $5c			; $b6f8
	.db $af			; $b6f9
	ADC ($af,X)			 ; $b6fa: 61 AF
	STA $af				 ; $b6fc: 85 AF
	.db $97			; $b6fe
	.db $af			; $b6ff
	CLV					 ; $b700: B8
	.db $af			; $b701
	DEX					 ; $b702: CA
	.db $af			; $b703
	.db $0f			; $b704
	BCS $b744			   ; $b705: B0 3D
	BCS $b77c			   ; $b707: B0 73
	BCS $b69a			   ; $b709: B0 8F
	BCS $b6db			   ; $b70b: B0 CE
	BCS $b705			   ; $b70d: B0 F6
	BCS $b69e			   ; $b70f: B0 8D
	LDA ($ac),Y			 ; $b711: B1 AC
	LDA ($da),Y			 ; $b713: B1 DA
	LDA (tmp1),Y			; $b715: B1 01
	.db $b2			; $b717
	DEY					 ; $b718: 88
	.db $b2			; $b719
	CMP $08b2			   ; $b71a: CD B2 08
	.db $b3			; $b71d
	.db $37			; $b71e
	.db $b3			; $b71f
	.db $67			; $b720
	.db $b3			; $b721
	.db $77			; $b722
	.db $b3			; $b723
	ASL $b4				 ; $b724: 06 B4
	.db $33			; $b726
	LDY $79,X			   ; $b727: B4 79
	LDY $8c,X			   ; $b729: B4 8C
	LDY $b1,X			   ; $b72b: B4 B1
	LDY $f6,X			   ; $b72d: B4 F6
	LDY $4e,X			   ; $b72f: B4 4E
	LDA $d5,X			   ; $b731: B5 D5
	LDA $e2,X			   ; $b733: B5 E2
	LDA $f9,X			   ; $b735: B5 F9
	LDA $0e,X			   ; $b737: B5 0E
	LDX $16,Y			   ; $b739: B6 16
	LDX system_flags,Y	  ; $b73b: B6 1F
	LDX $a0,Y			   ; $b73d: B6 A0
	BRK					 ; $b73f: 00
	LDA $b8bb,Y			 ; $b740: B9 BB B8
	CMP #$ff				; $b743: C9 FF
	BEQ $b77e			   ; $b745: F0 37
	CMP $63				 ; $b747: C5 63
	BNE $b776			   ; $b749: D0 2B
	LDA $b8be,Y			 ; $b74b: B9 BE B8
	LSR					 ; $b74e: 4A
	LSR					 ; $b74f: 4A
	LSR					 ; $b750: 4A
	LSR					 ; $b751: 4A
	CMP $615a			   ; $b752: CD 5A 61
	BNE $b776			   ; $b755: D0 1F
	CPY #$00				; $b757: C0 00
	BNE $b765			   ; $b759: D0 0A
	BIT $6281			   ; $b75b: 2C 81 62
	BVC $b76f			   ; $b75e: 50 0F
	LDY #$06				; $b760: A0 06
	JMP $b76f			   ; $b762: 4C 6F B7
	CPY #$0c				; $b765: C0 0C
	BNE $b76f			   ; $b767: D0 06
	BIT $6281			   ; $b769: 2C 81 62
	BVS $b76f			   ; $b76c: 70 01
	RTS					 ; $b76e: 60
	LDA $b8bc,Y			 ; $b76f: B9 BC B8
	CMP $64				 ; $b772: C5 64
	BEQ $b782			   ; $b774: F0 0C
	TYA					 ; $b776: 98
	CLC					 ; $b777: 18
	ADC #$06				; $b778: 69 06
	TAY					 ; $b77a: A8
	JMP $b740			   ; $b77b: 4C 40 B7
	RTS					 ; $b77e: 60
	JMP $b893			   ; $b77f: 4C 93 B8
	LDA $b8bd,Y			 ; $b782: B9 BD B8
	BMI $b77f			   ; $b785: 30 F8
	BRK					 ; $b787: 00
	.db $52			; $b788
	.db $73			; $b789
	CPY #$12				; $b78a: C0 12
	BNE $b7cd			   ; $b78c: D0 3F
	LDA $6283			   ; $b78e: AD 83 62
	AND #$20				; $b791: 29 20
	BEQ $b77f			   ; $b793: F0 EA
	LDX #$01				; $b795: A2 01
	LDA #$3d				; $b797: A9 3D
	BRK					 ; $b799: 00
	ORA $a287			   ; $b79a: 0D 87 A2
	.db $03			; $b79d
	LDA #$15				; $b79e: A9 15
	BRK					 ; $b7a0: 00
	ORA $ad87			   ; $b7a1: 0D 87 AD
	.db $23			; $b7a4
	BVS $b7d0			   ; $b7a5: 70 29
	.db $7f			; $b7a7
	STA $7023			   ; $b7a8: 8D 23 70
	LDA $6f63			   ; $b7ab: AD 63 6F
	STA $6fa3			   ; $b7ae: 8D A3 6F
	LDA $6f83			   ; $b7b1: AD 83 6F
	STA $6fc3			   ; $b7b4: 8D C3 6F
	LDX #$07				; $b7b7: A2 07
	LDA $7020,X			 ; $b7b9: BD 20 70
	ORA #$80				; $b7bc: 09 80
	STA $7020,X			 ; $b7be: 9D 20 70
	LDA #$80				; $b7c1: A9 80
	STA $6f60,X			 ; $b7c3: 9D 60 6F
	STA $6f80,X			 ; $b7c6: 9D 80 6F
	BRK					 ; $b7c9: 00
	ASL					 ; $b7ca: 0A
	.db $6f			; $b7cb
	RTS					 ; $b7cc: 60
	CPY #$24				; $b7cd: C0 24
	BNE $b7f5			   ; $b7cf: D0 24
	LDY #$19				; $b7d1: A0 19
	LDA #$06				; $b7d3: A9 06
	PHA					 ; $b7d5: 48
	TYA					 ; $b7d6: 98
	LDX #$02				; $b7d7: A2 02
	BRK					 ; $b7d9: 00
	ORA $ad87			   ; $b7da: 0D 87 AD
	.db $22			; $b7dd
	BVS $b809			   ; $b7de: 70 29
	.db $7f			; $b7e0
	STA $7022			   ; $b7e1: 8D 22 70
	LDA $6f62			   ; $b7e4: AD 62 6F
	STA $6fa2			   ; $b7e7: 8D A2 6F
	LDA $6f82			   ; $b7ea: AD 82 6F
	STA $6fc2			   ; $b7ed: 8D C2 6F
	PLA					 ; $b7f0: 68
	TAX					 ; $b7f1: AA
	JMP $b7b9			   ; $b7f2: 4C B9 B7
	CPY #$2a				; $b7f5: C0 2A
	BNE $b81b			   ; $b7f7: D0 22
	BRK					 ; $b7f9: 00
	.db $13			; $b7fa
	.db $eb			; $b7fb
	.db $80			; $b7fc
	BNE $b814			   ; $b7fd: D0 15
	BRK					 ; $b7ff: 00
	.db $0b			; $b800
	.db $eb			; $b801
	.db $04			; $b802
	BNE $b808			   ; $b803: D0 03
	JMP $b893			   ; $b805: 4C 93 B8
	LDA #$12				; $b808: A9 12
	LDX #$01				; $b80a: A2 01
	BRK					 ; $b80c: 00
	ORA $a087			   ; $b80d: 0D 87 A0
	BIT $4c				 ; $b810: 24 4C
	ASL $b8,X			   ; $b812: 16 B8
	LDY #$12				; $b814: A0 12
	LDA #$06				; $b816: A9 06
	JMP $b7d5			   ; $b818: 4C D5 B7
	CPY #$30				; $b81b: C0 30
	BNE $b82c			   ; $b81d: D0 0D
	BRK					 ; $b81f: 00
	.db $13			; $b820
	.db $eb			; $b821
	RTI					 ; $b822: 40
	BEQ $b893			   ; $b823: F0 6E
	LDY #$11				; $b825: A0 11
	LDA #$0d				; $b827: A9 0D
	JMP $b7d5			   ; $b829: 4C D5 B7
	CPY #$36				; $b82c: C0 36
	BCC $b869			   ; $b82e: 90 39
	TYA					 ; $b830: 98
	PHA					 ; $b831: 48
	BRK					 ; $b832: 00
	.db $62			; $b833
	.db $33			; $b834
	TAX					 ; $b835: AA
	DEX					 ; $b836: CA
	PLA					 ; $b837: 68
	TAY					 ; $b838: A8
	CPX #$01				; $b839: E0 01
	BEQ $b893			   ; $b83b: F0 56
	PHA					 ; $b83d: 48
	TAY					 ; $b83e: A8
	TXA					 ; $b83f: 8A
	PHA					 ; $b840: 48
	LDA $b8bf,Y			 ; $b841: B9 BF B8
	BRK					 ; $b844: 00
	ORA $6887			   ; $b845: 0D 87 68
	TAX					 ; $b848: AA
	LDA $7020,X			 ; $b849: BD 20 70
	AND #$7f				; $b84c: 29 7F
	STA $7020,X			 ; $b84e: 9D 20 70
	LDA $6f60,X			 ; $b851: BD 60 6F
	STA $6fa0,X			 ; $b854: 9D A0 6F
	LDA $6f80,X			 ; $b857: BD 80 6F
	STA $6fc0,X			 ; $b85a: 9D C0 6F
	PLA					 ; $b85d: 68
	TAY					 ; $b85e: A8
	LDA $b8c0,Y			 ; $b85f: B9 C0 B8
	CLC					 ; $b862: 18
	ADC #$06				; $b863: 69 06
	TAX					 ; $b865: AA
	JMP $b7b9			   ; $b866: 4C B9 B7
	CPY #$42				; $b869: C0 42
	BNE $b893			   ; $b86b: D0 26
	BRK					 ; $b86d: 00
	.db $62			; $b86e
	.db $23			; $b86f
	RTI					 ; $b870: 40
	PHA					 ; $b871: 48
	TAX					 ; $b872: AA
	LDY #$2f				; $b873: A0 2F
	BRK					 ; $b875: 00
	ORA $6887			   ; $b876: 0D 87 68
	TAX					 ; $b879: AA
	LDA $7020,X			 ; $b87a: BD 20 70
	AND #$7f				; $b87d: 29 7F
	STA $7020,X			 ; $b87f: 9D 20 70
	LDA $6f60,X			 ; $b882: BD 60 6F
	STA $6fa0,X			 ; $b885: 9D A0 6F
	LDA $6f80,X			 ; $b888: BD 80 6F
	STA $6fc0,X			 ; $b88b: 9D C0 6F
	LDX #$06				; $b88e: A2 06
	JMP $b7b9			   ; $b890: 4C B9 B7
	TYA					 ; $b893: 98
	PHA					 ; $b894: 48
	LDA $b8be,Y			 ; $b895: B9 BE B8
	AND #$0f				; $b898: 29 0F
	TAX					 ; $b89a: AA
	INX					 ; $b89b: E8
	LDA $b8bf,Y			 ; $b89c: B9 BF B8
	BRK					 ; $b89f: 00
	ORA $6887			   ; $b8a0: 0D 87 68
	PHA					 ; $b8a3: 48
	TAY					 ; $b8a4: A8
	LDX $b8c0,Y			 ; $b8a5: BE C0 B8
	LDA $b8be,Y			 ; $b8a8: B9 BE B8
	AND #$0f				; $b8ab: 29 0F
	TAY					 ; $b8ad: A8
	LDA $7006,X			 ; $b8ae: BD 06 70
	AND #$03				; $b8b1: 29 03
	JSR $a1af			   ; $b8b3: 20 AF A1
	PLA					 ; $b8b6: 68
	TAY					 ; $b8b7: A8
	JMP $b776			   ; $b8b8: 4C 76 B7
	EOR (ptr0_lo,X)		 ; $b8bb: 41 04
	.db $ff			; $b8bd
	BRK					 ; $b8be: 00
	ORA $08,X			   ; $b8bf: 15 08
	EOR (ptr0_lo,X)		 ; $b8c1: 41 04
	.db $ff			; $b8c3
	ORA ($15,X)			 ; $b8c4: 01 15
	ASL $41				 ; $b8c6: 06 41
	.db $04			; $b8c8
	.db $ff			; $b8c9
	.db $02			; $b8ca
	ORA $07,X			   ; $b8cb: 15 07
	.db $33			; $b8cd
	.db $04			; $b8ce
	PHP					 ; $b8cf: 08
	BRK					 ; $b8d0: 00
	AND $0201,X			 ; $b8d1: 3D 01 02
	BRK					 ; $b8d4: 00
	.db $ff			; $b8d5
	BRK					 ; $b8d6: 00
	.db $13			; $b8d7
	.db $0b			; $b8d8
	.db $02			; $b8d9
	.db $03			; $b8da
	.db $ff			; $b8db
	BRK					 ; $b8dc: 00
	.db $13			; $b8dd
	.db $02			; $b8de
	AND (tmp3),Y			; $b8df: 31 03
	ORA #$32				; $b8e1: 09 32
	ORA $0400,Y			 ; $b8e3: 19 00 04
	.db $0b			; $b8e6
	ASL					 ; $b8e7: 0A
	JSR $0012			   ; $b8e8: 20 12 00
	.db $04			; $b8eb
	BRK					 ; $b8ec: 00
	.db $0b			; $b8ed
	JSR $0711			   ; $b8ee: 20 11 07
	.db $04			; $b8f1
	BRK					 ; $b8f2: 00
	.db $02			; $b8f3
	RTI					 ; $b8f4: 40
	.db $02			; $b8f5
	ORA (ptr0_lo,X)		 ; $b8f6: 01 04
	ORA (tmp3,X)			; $b8f8: 01 03
	EOR (tmp3,X)			; $b8fa: 41 03
	BRK					 ; $b8fc: 00
	RTI					 ; $b8fd: 40
	BRK					 ; $b8fe: 00
	ASL $2f40			   ; $b8ff: 0E 40 2F
	BRK					 ; $b902: 00
	.db $ff			; $b903
	LDY #$00				; $b904: A0 00
	LDA $b952,Y			 ; $b906: B9 52 B9
	CMP #$ff				; $b909: C9 FF
	BEQ $b920			   ; $b90b: F0 13
	CMP $63				 ; $b90d: C5 63
	BNE $b918			   ; $b90f: D0 07
	LDA $b953,Y			 ; $b911: B9 53 B9
	CMP $64				 ; $b914: C5 64
	BEQ $b921			   ; $b916: F0 09
	TYA					 ; $b918: 98
	CLC					 ; $b919: 18
	ADC #$04				; $b91a: 69 04
	TAY					 ; $b91c: A8
	JMP $b906			   ; $b91d: 4C 06 B9
	RTS					 ; $b920: 60
	TYA					 ; $b921: 98
	PHA					 ; $b922: 48
	LDX $b955,Y			 ; $b923: BE 55 B9
	LDA $6fe0,X			 ; $b926: BD E0 6F
	LDX $b954,Y			 ; $b929: BE 54 B9
	STA $6fe0,X			 ; $b92c: 9D E0 6F
	LDX $b955,Y			 ; $b92f: BE 55 B9
	LDA $7000,X			 ; $b932: BD 00 70
	AND #$03				; $b935: 29 03
	PHA					 ; $b937: 48
	LDX $b954,Y			 ; $b938: BE 54 B9
	LDA $7000,X			 ; $b93b: BD 00 70
	AND #$fc				; $b93e: 29 FC
	STA $7000,X			 ; $b940: 9D 00 70
	PLA					 ; $b943: 68
	ORA $7000,X			 ; $b944: 1D 00 70
	STA $7000,X			 ; $b947: 9D 00 70
	JSR $d7f1			   ; $b94a: 20 F1 D7
	PLA					 ; $b94d: 68
	TAY					 ; $b94e: A8
	JMP $b918			   ; $b94f: 4C 18 B9
	EOR (ptr0_lo,X)		 ; $b952: 41 04
	ASL $0a				 ; $b954: 06 0A
	EOR (ptr0_lo,X)		 ; $b956: 41 04
	ORA #$0b				; $b958: 09 0B
	.db $ff			; $b95a
	RTS					 ; $b95b: 60
	BRK					 ; $b95c: 00
	ORA #$fb				; $b95d: 09 FB
	JSR $b9d5			   ; $b95f: 20 D5 B9
	LDA system_flags		; $b962: A5 1F
	ORA #$08				; $b964: 09 08
	STA system_flags		; $b966: 85 1F
	JSR $b9de			   ; $b968: 20 DE B9
	JSR $baeb			   ; $b96b: 20 EB BA
	JSR $b980			   ; $b96e: 20 80 B9
	JSR $c5c5			   ; $b971: 20 C5 C5
	LDA system_flags		; $b974: A5 1F
	AND #$f7				; $b976: 29 F7
	STA system_flags		; $b978: 85 1F
	LDA #$2c				; $b97a: A9 2C
	BRK					 ; $b97c: 00
	.db $07			; $b97d
	.db $cf			; $b97e
	RTS					 ; $b97f: 60
	LDA $3e				 ; $b980: A5 3E
	BNE $b993			   ; $b982: D0 0F
	DEC $45				 ; $b984: C6 45
	LDA #$10				; $b986: A9 10
	STA $3e				 ; $b988: 85 3E
	DEC $60				 ; $b98a: C6 60
	BNE $b993			   ; $b98c: D0 05
	LDA #$10				; $b98e: A9 10
	STA $45				 ; $b990: 85 45
	RTS					 ; $b992: 60
	LDA $3e				 ; $b993: A5 3E
	AND #$03				; $b995: 29 03
	BNE $b99b			   ; $b997: D0 02
	INC $5e				 ; $b999: E6 5E
	JSR $c001			   ; $b99b: 20 01 C0
	JSR $bb09			   ; $b99e: 20 09 BB
	JSR $bb3c			   ; $b9a1: 20 3C BB
	LDX #$01				; $b9a4: A2 01
	LDY $5e				 ; $b9a6: A4 5E
	CPY #$1e				; $b9a8: C0 1E
	BCS $b9af			   ; $b9aa: B0 03
	LDX $b9b7,Y			 ; $b9ac: BE B7 B9
	JSR $c90c			   ; $b9af: 20 0C C9
	INC $5f				 ; $b9b2: E6 5F
	JMP $b980			   ; $b9b4: 4C 80 B9
	.db $0f			; $b9b7
	ASL					 ; $b9b8: 0A
	ASL					 ; $b9b9: 0A
	ORA #$09				; $b9ba: 09 09
	PHP					 ; $b9bc: 08
	PHP					 ; $b9bd: 08
	.db $07			; $b9be
	ASL $06				 ; $b9bf: 06 06
	ORA ptr0_hi			 ; $b9c1: 05 05
	.db $04			; $b9c3
	.db $04			; $b9c4
	.db $04			; $b9c5
	.db $04			; $b9c6
	.db $03			; $b9c7
	.db $03			; $b9c8
	.db $03			; $b9c9
	.db $03			; $b9ca
	.db $02			; $b9cb
	.db $02			; $b9cc
	.db $02			; $b9cd
	.db $02			; $b9ce
	.db $02			; $b9cf
	.db $02			; $b9d0
	.db $02			; $b9d1
	.db $02			; $b9d2
	ORA (tmp1,X)			; $b9d3: 01 01
	JSR $ff74			   ; $b9d5: 20 74 FF
	LDA $0513			   ; $b9d8: AD 13 05
	BNE $b9d5			   ; $b9db: D0 F8
	RTS					 ; $b9dd: 60
	LDX #$00				; $b9de: A2 00
	LDY $050a			   ; $b9e0: AC 0A 05
	LDA #$8f				; $b9e3: A9 8F
	STA $0300,Y			 ; $b9e5: 99 00 03
	LDA #$30				; $b9e8: A9 30
	STA $0301,Y			 ; $b9ea: 99 01 03
	LDA #$d0				; $b9ed: A9 D0
	STA $0302,Y			 ; $b9ef: 99 02 03
	LDA $ba9b,X			 ; $b9f2: BD 9B BA
	STA $0303,Y			 ; $b9f5: 99 03 03
	INY					 ; $b9f8: C8
	INX					 ; $b9f9: E8
	CPX #$30				; $b9fa: E0 30
	BCC $b9f2			   ; $b9fc: 90 F4
	INC $050b			   ; $b9fe: EE 0B 05
	JSR $c62d			   ; $ba01: 20 2D C6
	LDX #$00				; $ba04: A2 00
	LDA $bacb,X			 ; $ba06: BD CB BA
	STA $02e0,X			 ; $ba09: 9D E0 02
	INX					 ; $ba0c: E8
	CPX #$20				; $ba0d: E0 20
	BCC $ba06			   ; $ba0f: 90 F5
	LDX #$14				; $ba11: A2 14
	LDY #$13				; $ba13: A0 13
	LDA #$00				; $ba15: A9 00
	BRK					 ; $ba17: 00
	ORA #$ef				; $ba18: 09 EF
	LDX #$15				; $ba1a: A2 15
	LDY #$13				; $ba1c: A0 13
	LDA #$00				; $ba1e: A9 00
	BRK					 ; $ba20: 00
	ORA #$ef				; $ba21: 09 EF
	LDX $050a			   ; $ba23: AE 0A 05
	LDA #$bf				; $ba26: A9 BF
	STA $0300,X			 ; $ba28: 9D 00 03
	LDA #$03				; $ba2b: A9 03
	STA $0301,X			 ; $ba2d: 9D 01 03
	LDA #$11				; $ba30: A9 11
	STA $0302,X			 ; $ba32: 9D 02 03
	LDA #$17				; $ba35: A9 17
	STA $0303,X			 ; $ba37: 9D 03 03
	STA $0609			   ; $ba3a: 8D 09 06
	LDA #$27				; $ba3d: A9 27
	STA $0304,X			 ; $ba3f: 9D 04 03
	STA $060a			   ; $ba42: 8D 0A 06
	LDA #$0f				; $ba45: A9 0F
	STA $0305,X			 ; $ba47: 9D 05 03
	STA $060b			   ; $ba4a: 8D 0B 06
	INC $050b			   ; $ba4d: EE 0B 05
	JSR $ff74			   ; $ba50: 20 74 FF
	LDY #$ff				; $ba53: A0 FF
	LDX #$60				; $ba55: A2 60
	JSR $ba74			   ; $ba57: 20 74 BA
	JSR $ba74			   ; $ba5a: 20 74 BA
	JSR $ba74			   ; $ba5d: 20 74 BA
	JSR $ba74			   ; $ba60: 20 74 BA
	LDA #$f7				; $ba63: A9 F7
	STA $02b8			   ; $ba65: 8D B8 02
	STA $02bc			   ; $ba68: 8D BC 02
	STA $02d8			   ; $ba6b: 8D D8 02
	STA $02dc			   ; $ba6e: 8D DC 02
	JMP $ff74			   ; $ba71: 4C 74 FF
	JSR $ba80			   ; $ba74: 20 80 BA
	JSR $ba80			   ; $ba77: 20 80 BA
	TYA					 ; $ba7a: 98
	CLC					 ; $ba7b: 18
	ADC #$08				; $ba7c: 69 08
	TAY					 ; $ba7e: A8
	RTS					 ; $ba7f: 60
	TYA					 ; $ba80: 98
	STA $0200,X			 ; $ba81: 9D 00 02
	LDA #$fd				; $ba84: A9 FD
	STA $0201,X			 ; $ba86: 9D 01 02
	LDA #$00				; $ba89: A9 00
	STA $0202,X			 ; $ba8b: 9D 02 02
	STA $0203,X			 ; $ba8e: 9D 03 02
	INX					 ; $ba91: E8
	INX					 ; $ba92: E8
	INX					 ; $ba93: E8
	INX					 ; $ba94: E8
	TXA					 ; $ba95: 8A
	AND #$0f				; $ba96: 29 0F
	BNE $ba80			   ; $ba98: D0 E6
	RTS					 ; $ba9a: 60
	BRK					 ; $ba9b: 00
	BRK					 ; $ba9c: 00
	BRK					 ; $ba9d: 00
	BRK					 ; $ba9e: 00
	BRK					 ; $ba9f: 00
	BRK					 ; $baa0: 00
	BRK					 ; $baa1: 00
	BRK					 ; $baa2: 00
	BRK					 ; $baa3: 00
	BRK					 ; $baa4: 00
	BRK					 ; $baa5: 00
	BRK					 ; $baa6: 00
	BRK					 ; $baa7: 00
	BRK					 ; $baa8: 00
	BRK					 ; $baa9: 00
	BRK					 ; $baaa: 00
	INC $ccdd			   ; $baab: EE DD CC
	INC $ddcc			   ; $baae: EE CC DD
	CPY $99dd			   ; $bab1: CC DD 99
	TAX					 ; $bab4: AA
	.db $bb			; $bab5
	STA $aabb,Y			 ; $bab6: 99 BB AA
	.db $bb			; $bab9
	TAX					 ; $baba: AA
	CMP $eeee,X			 ; $babb: DD EE EE
	.db $ff			; $babe
	.db $ff			; $babf
	.db $ff			; $bac0
	.db $ff			; $bac1
	.db $ff			; $bac2
	TAX					 ; $bac3: AA
	STA $aa99,Y			 ; $bac4: 99 99 AA
	CMP $dd88,X			 ; $bac7: DD 88 DD
	.db $ff			; $baca
	.db $9f			; $bacb
	INC $f000,X			 ; $bacc: FE 00 F0
	.db $9f			; $bacf
	INC $f800,X			 ; $bad0: FE 00 F8
	.db $a7			; $bad3
	.db $ff			; $bad4
	BRK					 ; $bad5: 00
	BEQ $ba7f			   ; $bad6: F0 A7
	.db $ff			; $bad8
	BRK					 ; $bad9: 00
	SED					 ; $bada: F8
	.db $9f			; $badb
	INC $e000,X			 ; $badc: FE 00 E0
	.db $9f			; $badf
	INC $e800,X			 ; $bae0: FE 00 E8
	.db $a7			; $bae3
	.db $ff			; $bae4
	BRK					 ; $bae5: 00
	CPX #$a7				; $bae6: E0 A7
	.db $ff			; $bae8
	BRK					 ; $bae9: 00
	INX					 ; $baea: E8
	LDA #$20				; $baeb: A9 20
	STA $0520			   ; $baed: 8D 20 05
	LDX #$50				; $baf0: A2 50
	STA $7800,X			 ; $baf2: 9D 00 78
	DEX					 ; $baf5: CA
	BNE $baf2			   ; $baf6: D0 FA
	LDA #$00				; $baf8: A9 00
	STA $3d				 ; $bafa: 85 3D
	STA $3e				 ; $bafc: 85 3E
	STA $5e				 ; $bafe: 85 5E
	LDA #$01				; $bb00: A9 01
	STA $5f				 ; $bb02: 85 5F
	LDA #$15				; $bb04: A9 15
	STA $60				 ; $bb06: 85 60
	RTS					 ; $bb08: 60
	LDX #$00				; $bb09: A2 00
	LDA $0200,X			 ; $bb0b: BD 00 02
	CLC					 ; $bb0e: 18
	ADC #$01				; $bb0f: 69 01
	CMP #$f7				; $bb11: C9 F7
	BCC $bb17			   ; $bb13: 90 02
	LDA #$f7				; $bb15: A9 F7
	STA $0200,X			 ; $bb17: 9D 00 02
	INX					 ; $bb1a: E8
	INX					 ; $bb1b: E8
	INX					 ; $bb1c: E8
	INX					 ; $bb1d: E8
	CPX #$e0				; $bb1e: E0 E0
	BCC $bb0b			   ; $bb20: 90 E9
	LDA $5f				 ; $bb22: A5 5F
	CMP #$b1				; $bb24: C9 B1
	BNE $bb3b			   ; $bb26: D0 13
	LDX #$60				; $bb28: A2 60
	LDA $0200,X			 ; $bb2a: BD 00 02
	SEC					 ; $bb2d: 38
	SBC #$30				; $bb2e: E9 30
	STA $0200,X			 ; $bb30: 9D 00 02
	INX					 ; $bb33: E8
	INX					 ; $bb34: E8
	INX					 ; $bb35: E8
	INX					 ; $bb36: E8
	CPX #$e0				; $bb37: E0 E0
	BCC $bb2a			   ; $bb39: 90 EF
	RTS					 ; $bb3b: 60
	LDA $5f				 ; $bb3c: A5 5F
	AND #$0f				; $bb3e: 29 0F
	TAX					 ; $bb40: AA
	LDY $050a			   ; $bb41: AC 0A 05
	LDA #$d0				; $bb44: A9 D0
	JSR $bb69			   ; $bb46: 20 69 BB
	LDA #$f0				; $bb49: A9 F0
	JSR $bb69			   ; $bb4b: 20 69 BB
	TXA					 ; $bb4e: 8A
	CLC					 ; $bb4f: 18
	ADC #$10				; $bb50: 69 10
	TAX					 ; $bb52: AA
	LDA #$e0				; $bb53: A9 E0
	JSR $bb69			   ; $bb55: 20 69 BB
	LDA #$00				; $bb58: A9 00
	JSR $bb69			   ; $bb5a: 20 69 BB
	LDA #$99				; $bb5d: A9 99
	STA $02f5,Y			 ; $bb5f: 99 F5 02
	LDA system_flags		; $bb62: A5 1F
	ORA #$20				; $bb64: 09 20
	STA system_flags		; $bb66: 85 1F
	RTS					 ; $bb68: 60
	STA $0302,Y			 ; $bb69: 99 02 03
	LDA #$98				; $bb6c: A9 98
	STA $0300,Y			 ; $bb6e: 99 00 03
	LDA #$08				; $bb71: A9 08
	STA $0301,Y			 ; $bb73: 99 01 03
	LDA $bbb4,X			 ; $bb76: BD B4 BB
	STA $0303,Y			 ; $bb79: 99 03 03
	LDA $bbb5,X			 ; $bb7c: BD B5 BB
	STA $0304,Y			 ; $bb7f: 99 04 03
	LDA $bbb6,X			 ; $bb82: BD B6 BB
	STA $0305,Y			 ; $bb85: 99 05 03
	LDA $bbb7,X			 ; $bb88: BD B7 BB
	STA $0306,Y			 ; $bb8b: 99 06 03
	LDA $bbb8,X			 ; $bb8e: BD B8 BB
	STA $0307,Y			 ; $bb91: 99 07 03
	LDA $bbb9,X			 ; $bb94: BD B9 BB
	STA $0308,Y			 ; $bb97: 99 08 03
	LDA $bbba,X			 ; $bb9a: BD BA BB
	STA $0309,Y			 ; $bb9d: 99 09 03
	LDA $bbbb,X			 ; $bba0: BD BB BB
	STA $030a,Y			 ; $bba3: 99 0A 03
	TXA					 ; $bba6: 8A
	CLC					 ; $bba7: 18
	ADC #$08				; $bba8: 69 08
	TAX					 ; $bbaa: AA
	TYA					 ; $bbab: 98
	CLC					 ; $bbac: 18
	ADC #$0b				; $bbad: 69 0B
	TAY					 ; $bbaf: A8
	INC $050b			   ; $bbb0: EE 0B 05
	RTS					 ; $bbb3: 60
	CLV					 ; $bbb4: B8
	ASL tmp1				; $bbb5: 06 01
	.db $02			; $bbb7
	STY $73				 ; $bbb8: 84 73
	CPY tmp2				; $bbba: C4 02
	.db $03			; $bbbc
	STY $78				 ; $bbbd: 84 78
	STY tmp3				; $bbbf: 84 03
	BRK					 ; $bbc1: 00
	BRK					 ; $bbc2: 00
	.db $03			; $bbc3
	CLV					 ; $bbc4: B8
	ASL tmp1				; $bbc5: 06 01
	.db $02			; $bbc7
	STY $73				 ; $bbc8: 84 73
	CPY tmp2				; $bbca: C4 02
	.db $03			; $bbcc
	STY $78				 ; $bbcd: 84 78
	STY tmp3				; $bbcf: 84 03
	BRK					 ; $bbd1: 00
	BRK					 ; $bbd2: 00
	.db $03			; $bbd3
	ORA (tmp2,X)			; $bbd4: 01 02
	STY $8e72			   ; $bbd6: 8C 72 8E
	ORA (tmp0,X)			; $bbd9: 01 00
	ORA ($b3,X)			 ; $bbdb: 01 B3
	.db $0c			; $bbdd
	.db $02			; $bbde
	ORA (tmp1,X)			; $bbdf: 01 01
	INC $98				 ; $bbe1: E6 98
	ASL tmp1				; $bbe3: 06 01
	.db $02			; $bbe5
	STY $8e72			   ; $bbe6: 8C 72 8E
	ORA (tmp0,X)			; $bbe9: 01 00
	ORA ($b3,X)			 ; $bbeb: 01 B3
	.db $0c			; $bbed
	.db $02			; $bbee
	ORA (tmp1,X)			; $bbef: 01 01
	INC $98				 ; $bbf1: E6 98
	ASL $20				 ; $bbf3: 06 20
	AND $20c6			   ; $bbf5: 2D C6 20
	.db $9c			; $bbf8
	LDY $1320,X			 ; $bbf9: BC 20 13
	LDY $1fa5,X			 ; $bbfc: BC A5 1F
	ORA #$40				; $bbff: 09 40
	STA system_flags		; $bc01: 85 1F
	JSR $c62d			   ; $bc03: 20 2D C6
	JSR $bc5d			   ; $bc06: 20 5D BC
	JSR $c62d			   ; $bc09: 20 2D C6
	LDA system_flags		; $bc0c: A5 1F
	AND #$bf				; $bc0e: 29 BF
	STA system_flags		; $bc10: 85 1F
	RTS					 ; $bc12: 60
	LDA #$9f				; $bc13: A9 9F
	STA $0300			   ; $bc15: 8D 00 03
	LDA #$50				; $bc18: A9 50
	STA $0301			   ; $bc1a: 8D 01 03
	LDA #$20				; $bc1d: A9 20
	STA $0302			   ; $bc1f: 8D 02 03
	LDX #$00				; $bc22: A2 00
	LDY #$00				; $bc24: A0 00
	LDA ($49),Y			 ; $bc26: B1 49
	STA $0303,X			 ; $bc28: 9D 03 03
	INX					 ; $bc2b: E8
	INY					 ; $bc2c: C8
	CPY #$50				; $bc2d: C0 50
	BCC $bc26			   ; $bc2f: 90 F5
	LDA #$9f				; $bc31: A9 9F
	STA $0303,X			 ; $bc33: 9D 03 03
	LDA #$10				; $bc36: A9 10
	STA $0304,X			 ; $bc38: 9D 04 03
	LDA #$80				; $bc3b: A9 80
	STA $0305,X			 ; $bc3d: 9D 05 03
	LDA ($49),Y			 ; $bc40: B1 49
	STA $0306,X			 ; $bc42: 9D 06 03
	INX					 ; $bc45: E8
	INY					 ; $bc46: C8
	CPY #$60				; $bc47: C0 60
	BCC $bc40			   ; $bc49: 90 F5
	INC $050b			   ; $bc4b: EE 0B 05
	INC $050b			   ; $bc4e: EE 0B 05
	LDA $49				 ; $bc51: A5 49
	CLC					 ; $bc53: 18
	ADC #$60				; $bc54: 69 60
	STA $49				 ; $bc56: 85 49
	BCC $bc5c			   ; $bc58: 90 02
	INC $4a				 ; $bc5a: E6 4A
	RTS					 ; $bc5c: 60
	LDA #$9f				; $bc5d: A9 9F
	STA $0300			   ; $bc5f: 8D 00 03
	LDA #$10				; $bc62: A9 10
	STA $0301			   ; $bc64: 8D 01 03
	LDA #$90				; $bc67: A9 90
	STA $0302			   ; $bc69: 8D 02 03
	LDX #$00				; $bc6c: A2 00
	LDY #$00				; $bc6e: A0 00
	LDA ($49),Y			 ; $bc70: B1 49
	STA $0303,X			 ; $bc72: 9D 03 03
	INX					 ; $bc75: E8
	INY					 ; $bc76: C8
	CPY #$10				; $bc77: C0 10
	BCC $bc70			   ; $bc79: 90 F5
	LDA #$9f				; $bc7b: A9 9F
	STA $0303,X			 ; $bc7d: 9D 03 03
	LDA #$50				; $bc80: A9 50
	STA $0304,X			 ; $bc82: 9D 04 03
	LDA #$b0				; $bc85: A9 B0
	STA $0305,X			 ; $bc87: 9D 05 03
	LDA ($49),Y			 ; $bc8a: B1 49
	STA $0306,X			 ; $bc8c: 9D 06 03
	INX					 ; $bc8f: E8
	INY					 ; $bc90: C8
	CPY #$60				; $bc91: C0 60
	BCC $bc8a			   ; $bc93: 90 F5
	INC $050b			   ; $bc95: EE 0B 05
	INC $050b			   ; $bc98: EE 0B 05
	RTS					 ; $bc9b: 60
	LDA $bca7			   ; $bc9c: AD A7 BC
	STA $49				 ; $bc9f: 85 49
	LDA $bca8			   ; $bca1: AD A8 BC
	STA $4a				 ; $bca4: 85 4A
	RTS					 ; $bca6: 60
	LDA #$bc				; $bca7: A9 BC
	.db $ff			; $bca9
	DEC $f8fa,X			 ; $bcaa: DE FA F8
	.db $ab			; $bcad
	.db $47			; $bcae
	.db $4f			; $bcaf
	.db $0f			; $bcb0
	.db $ff			; $bcb1
	CLD					 ; $bcb2: D8
	BEQ $bc35			   ; $bcb3: F0 80
	BRK					 ; $bcb5: 00
	BRK					 ; $bcb6: 00
	ORA (tmp2,X)			; $bcb7: 01 02
	.db $ff			; $bcb9
	LDY #$1f				; $bcba: A0 1F
	.db $ff			; $bcbc
	.db $ff			; $bcbd
	.db $ff			; $bcbe
	.db $ff			; $bcbf
	.db $ff			; $bcc0
	BRK					 ; $bcc1: 00
	BRK					 ; $bcc2: 00
	BRK					 ; $bcc3: 00
	BRK					 ; $bcc4: 00
	ORA ($0b,X)			 ; $bcc5: 01 0B
	.db $67			; $bcc7
	LDA ($ff),Y			 ; $bcc8: B1 FF
	ORA $f8				 ; $bcca: 05 F8
	.db $ff			; $bccc
	.db $ff			; $bccd
	.db $ff			; $bcce
	.db $ff			; $bccf
	.db $db			; $bcd0
	BRK					 ; $bcd1: 00
	BRK					 ; $bcd2: 00
	BRK					 ; $bcd3: 00
	BRK					 ; $bcd4: 00
	JMP $fa32			   ; $bcd5: 4C 32 FA
	LDA $7dff,X			 ; $bcd8: BD FF 7D
	.db $5f			; $bcdb
	.db $1f			; $bcdc
	CMP $e2				 ; $bcdd: C5 E2
	.db $f2			; $bcdf
	BEQ $bce1			   ; $bce0: F0 FF
	ORA $010f,X			 ; $bce2: 1D 0F 01
	BRK					 ; $bce5: 00
	BRK					 ; $bce6: 00
	.db $80			; $bce7
	RTI					 ; $bce8: 40
	.db $9f			; $bce9
	.db $5f			; $bcea
	.db $3f			; $bceb
	.db $3f			; $bcec
	.db $bf			; $bced
	.db $7f			; $bcee
	.db $7f			; $bcef
	.db $7f			; $bcf0
	.db $04			; $bcf1
	ORA tmp1				; $bcf2: 05 01
	ASL $070a			   ; $bcf4: 0E 0A 07
	CLC					 ; $bcf7: 18
	ASL $f9				 ; $bcf8: 06 F9
	.db $fa			; $bcfa
	.db $fc			; $bcfb
	.db $fc			; $bcfc
	SBC $fefe,X			 ; $bcfd: FD FE FE
	INC $c0e0,X			 ; $bd00: FE E0 C0
	BVS $bc95			   ; $bd03: 70 90
	BEQ $bcd7			   ; $bd05: F0 D0
	.db $80			; $bd07
	BVS $bd89			   ; $bd08: 70 7F
	.db $7f			; $bd0a
	.db $7f			; $bd0b
	.db $7f			; $bd0c
	.db $3f			; $bd0d
	.db $bf			; $bd0e
	.db $3f			; $bd0f
	.db $9f			; $bd10
	ORA $030d			   ; $bd11: 0D 0D 03
	ORA $0206			   ; $bd14: 0D 06 02
	ORA (tmp2,X)			; $bd17: 01 02
	INC $7efe,X			 ; $bd19: FE FE 7E
	INC $fdfc,X			 ; $bd1c: FE FC FD
	.db $fc			; $bd1f
	SBC $f020,Y			 ; $bd20: F9 20 F0
	CLD					 ; $bd23: D8
	CPX #$b0				; $bd24: E0 B0
	LDY #$90				; $bd26: A0 90
	RTI					 ; $bd28: 40
	.db $1f			; $bd29
	.db $4f			; $bd2a
	.db $87			; $bd2b
	.db $e3			; $bd2c
	BEQ $bd27			   ; $bd2d: F0 F8
	.db $ff			; $bd2f
	.db $ff			; $bd30
	BRK					 ; $bd31: 00
	BRK					 ; $bd32: 00
	BRK					 ; $bd33: 00
	.db $80			; $bd34
	CPX #$f0				; $bd35: E0 F0
	SED					 ; $bd37: F8
	.db $ff			; $bd38
	.db $ff			; $bd39
	.db $ff			; $bd3a
	.db $ff			; $bd3b
	.db $ff			; $bd3c
	.db $ff			; $bd3d
	.db $1f			; $bd3e
	BRK					 ; $bd3f: 00
	.db $ff			; $bd40
	ADC $0112			   ; $bd41: 6D 12 01
	BRK					 ; $bd44: 00
	BRK					 ; $bd45: 00
	BRK					 ; $bd46: 00
	BRK					 ; $bd47: 00
	BRK					 ; $bd48: 00
	.db $ff			; $bd49
	.db $ff			; $bd4a
	.db $ff			; $bd4b
	.db $ff			; $bd4c
	.db $ff			; $bd4d
	SED					 ; $bd4e: F8
	BRK					 ; $bd4f: 00
	.db $ff			; $bd50
	.db $fb			; $bd51
	.db $d4			; $bd52
	.db $34			; $bd53
	BRK					 ; $bd54: 00
	BRK					 ; $bd55: 00
	BRK					 ; $bd56: 00
	BRK					 ; $bd57: 00
	BRK					 ; $bd58: 00
	SED					 ; $bd59: F8
	.db $f2			; $bd5a
	SBC ($c7,X)			 ; $bd5b: E1 C7
	.db $0f			; $bd5d
	.db $1f			; $bd5e
	.db $ff			; $bd5f
	.db $ff			; $bd60
	BRK					 ; $bd61: 00
	BRK					 ; $bd62: 00
	BRK					 ; $bd63: 00
	ORA ($07,X)			 ; $bd64: 01 07
	.db $0f			; $bd66
	.db $1f			; $bd67
	.db $ff			; $bd68
	LDA #$40				; $bd69: A9 40
	BNE $bd73			   ; $bd6b: D0 06
	LDA #$80				; $bd6d: A9 80
	BNE $bd73			   ; $bd6f: D0 02
	LDA #$00				; $bd71: A9 00
	STA $1b				 ; $bd73: 85 1B
	JSR $bd87			   ; $bd75: 20 87 BD
	JSR $bdaf			   ; $bd78: 20 AF BD
	JSR $bdb8			   ; $bd7b: 20 B8 BD
	JSR $bde0			   ; $bd7e: 20 E0 BD
	JSR $bf0a			   ; $bd81: 20 0A BF
	JMP $c62d			   ; $bd84: 4C 2D C6
	LDA $04f2			   ; $bd87: AD F2 04
	PHA					 ; $bd8a: 48
	ASL					 ; $bd8b: 0A
	AND #$1e				; $bd8c: 29 1E
	STA tmp0				; $bd8e: 85 00
	PLA					 ; $bd90: 68
	LSR					 ; $bd91: 4A
	LSR					 ; $bd92: 4A
	LSR					 ; $bd93: 4A
	AND #$1e				; $bd94: 29 1E
	STA tmp1				; $bd96: 85 01
	JSR $c662			   ; $bd98: 20 62 C6
	BIT $1b				 ; $bd9b: 24 1B
	BPL $bdae			   ; $bd9d: 10 0F
	LDX #$04				; $bd9f: A2 04
	LDA $0500			   ; $bda1: AD 00 05
	LSR					 ; $bda4: 4A
	BCC $bda9			   ; $bda5: 90 02
	LDX #$08				; $bda7: A2 08
	TXA					 ; $bda9: 8A
	EOR $1c				 ; $bdaa: 45 1C
	STA $1c				 ; $bdac: 85 1C
	RTS					 ; $bdae: 60
	LDA $050b			   ; $bdaf: AD 0B 05
	BEQ $bdb7			   ; $bdb2: F0 03
	JSR $c62d			   ; $bdb4: 20 2D C6
	RTS					 ; $bdb7: 60
	LDA $1d				 ; $bdb8: A5 1D
	ORA #$e0				; $bdba: 09 E0
	EOR #$ff				; $bdbc: 49 FF
	STA tmp1				; $bdbe: 85 01
	INC tmp1				; $bdc0: E6 01
	LDA $04f3			   ; $bdc2: AD F3 04
	PHA					 ; $bdc5: 48
	LSR					 ; $bdc6: 4A
	LSR					 ; $bdc7: 4A
	LSR					 ; $bdc8: 4A
	LSR					 ; $bdc9: 4A
	AND #$0f				; $bdca: 29 0F
	STA $17				 ; $bdcc: 85 17
	PLA					 ; $bdce: 68
	ASL					 ; $bdcf: 0A
	AND #$1e				; $bdd0: 29 1E
	STA $16				 ; $bdd2: 85 16
	SEC					 ; $bdd4: 38
	SBC tmp1				; $bdd5: E5 01
	STA tmp3				; $bdd7: 85 03
	BCS $bddf			   ; $bdd9: B0 04
	LDA $16				 ; $bddb: A5 16
	STA tmp1				; $bddd: 85 01
	RTS					 ; $bddf: 60
	LDY #$00				; $bde0: A0 00
	STY ptr0_lo			 ; $bde2: 84 04
	LDX $050a			   ; $bde4: AE 0A 05
	LDA $1c				 ; $bde7: A5 1C
	STA $19				 ; $bde9: 85 19
	LDA $1d				 ; $bdeb: A5 1D
	STA $18				 ; $bded: 85 18
	JSR $be0f			   ; $bdef: 20 0F BE
	JSR $be38			   ; $bdf2: 20 38 BE
	JSR $be0f			   ; $bdf5: 20 0F BE
	JSR $be38			   ; $bdf8: 20 38 BE
	LDA $1c				 ; $bdfb: A5 1C
	PHA					 ; $bdfd: 48
	LDA $1d				 ; $bdfe: A5 1D
	PHA					 ; $be00: 48
	JSR $be8e			   ; $be01: 20 8E BE
	PLA					 ; $be04: 68
	STA $1d				 ; $be05: 85 1D
	PLA					 ; $be07: 68
	STA $1c				 ; $be08: 85 1C
	DEC $17				 ; $be0a: C6 17
	BNE $bde4			   ; $be0c: D0 D6
	RTS					 ; $be0e: 60
	LDA $1c				 ; $be0f: A5 1C
	ORA #$80				; $be11: 09 80
	STA $0300,X			 ; $be13: 9D 00 03
	INX					 ; $be16: E8
	LDA tmp1				; $be17: A5 01
	STA $0300,X			 ; $be19: 9D 00 03
	STA tmp2				; $be1c: 85 02
	INX					 ; $be1e: E8
	LDA $1d				 ; $be1f: A5 1D
	STA $0300,X			 ; $be21: 9D 00 03
	INX					 ; $be24: E8
	LDA $0480,Y			 ; $be25: B9 80 04
	STA $0300,X			 ; $be28: 9D 00 03
	INY					 ; $be2b: C8
	INX					 ; $be2c: E8
	DEC tmp2				; $be2d: C6 02
	BNE $be25			   ; $be2f: D0 F4
	INC $050b			   ; $be31: EE 0B 05
	STX $050a			   ; $be34: 8E 0A 05
	RTS					 ; $be37: 60
	LDA tmp3				; $be38: A5 03
	BEQ $be6a			   ; $be3a: F0 2E
	BMI $be6a			   ; $be3c: 30 2C
	LDA $1c				 ; $be3e: A5 1C
	EOR #$04				; $be40: 49 04
	ORA #$80				; $be42: 09 80
	STA $0300,X			 ; $be44: 9D 00 03
	INX					 ; $be47: E8
	LDA tmp3				; $be48: A5 03
	STA $0300,X			 ; $be4a: 9D 00 03
	STA tmp2				; $be4d: 85 02
	INX					 ; $be4f: E8
	LDA $1d				 ; $be50: A5 1D
	AND #$e0				; $be52: 29 E0
	STA $0300,X			 ; $be54: 9D 00 03
	INX					 ; $be57: E8
	LDA $0480,Y			 ; $be58: B9 80 04
	STA $0300,X			 ; $be5b: 9D 00 03
	INY					 ; $be5e: C8
	INX					 ; $be5f: E8
	DEC tmp2				; $be60: C6 02
	BNE $be58			   ; $be62: D0 F4
	INC $050b			   ; $be64: EE 0B 05
	STX $050a			   ; $be67: 8E 0A 05
	LDA $1d				 ; $be6a: A5 1D
	CLC					 ; $be6c: 18
	ADC #$20				; $be6d: 69 20
	STA $1d				 ; $be6f: 85 1D
	BCC $be75			   ; $be71: 90 02
	INC $1c				 ; $be73: E6 1C
	CMP #$c0				; $be75: C9 C0
	BCC $be8d			   ; $be77: 90 14
	LDA $1c				 ; $be79: A5 1C
	AND #$fb				; $be7b: 29 FB
	CMP #$23				; $be7d: C9 23
	BCC $be8d			   ; $be7f: 90 0C
	LDA $1c				 ; $be81: A5 1C
	AND #$fc				; $be83: 29 FC
	STA $1c				 ; $be85: 85 1C
	LDA $1d				 ; $be87: A5 1D
	AND #$1f				; $be89: 29 1F
	STA $1d				 ; $be8b: 85 1D
	RTS					 ; $be8d: 60
	BIT $1b				 ; $be8e: 24 1B
	BVS $bec3			   ; $be90: 70 31
	LDA $04f3			   ; $be92: AD F3 04
	AND #$0f				; $be95: 29 0F
	STA $1a				 ; $be97: 85 1A
	LDA $18				 ; $be99: A5 18
	STA $1d				 ; $be9b: 85 1D
	LDA $19				 ; $be9d: A5 19
	STA $1c				 ; $be9f: 85 1C
	LDX ptr0_lo			 ; $bea1: A6 04
	LDA $04e0,X			 ; $bea3: BD E0 04
	INC ptr0_lo			 ; $bea6: E6 04
	JSR $c6bf			   ; $bea8: 20 BF C6
	JSR $bec4			   ; $beab: 20 C4 BE
	LDA $18				 ; $beae: A5 18
	CLC					 ; $beb0: 18
	ADC #$02				; $beb1: 69 02
	STA $18				 ; $beb3: 85 18
	AND #$1f				; $beb5: 29 1F
	BNE $bebf			   ; $beb7: D0 06
	LDA $19				 ; $beb9: A5 19
	EOR #$04				; $bebb: 49 04
	STA $19				 ; $bebd: 85 19
	DEC $1a				 ; $bebf: C6 1A
	BNE $be99			   ; $bec1: D0 D6
	RTS					 ; $bec3: 60
	PHA					 ; $bec4: 48
	LDX #$00				; $bec5: A2 00
	CPX $050a			   ; $bec7: EC 0A 05
	BEQ $beed			   ; $beca: F0 21
	LDA $0300,X			 ; $becc: BD 00 03
	BMI $bee2			   ; $becf: 30 11
	CMP $0e				 ; $bed1: C5 0E
	BNE $bedc			   ; $bed3: D0 07
	LDA $0301,X			 ; $bed5: BD 01 03
	CMP $0f				 ; $bed8: C5 0F
	BEQ $bf05			   ; $beda: F0 29
	INX					 ; $bedc: E8
	INX					 ; $bedd: E8
	INX					 ; $bede: E8
	JMP $bec7			   ; $bedf: 4C C7 BE
	TXA					 ; $bee2: 8A
	CLC					 ; $bee3: 18
	ADC $0301,X			 ; $bee4: 7D 01 03
	ADC #$03				; $bee7: 69 03
	TAX					 ; $bee9: AA
	JMP $bec7			   ; $beea: 4C C7 BE
	LDA $0e				 ; $beed: A5 0E
	STA $0300,X			 ; $beef: 9D 00 03
	INX					 ; $bef2: E8
	LDA $0f				 ; $bef3: A5 0F
	STA $0300,X			 ; $bef5: 9D 00 03
	INX					 ; $bef8: E8
	PLA					 ; $bef9: 68
	STA $0300,X			 ; $befa: 9D 00 03
	INX					 ; $befd: E8
	STX $050a			   ; $befe: 8E 0A 05
	INC $050b			   ; $bf01: EE 0B 05
	RTS					 ; $bf04: 60
	PLA					 ; $bf05: 68
	STA $0302,X			 ; $bf06: 9D 02 03
	RTS					 ; $bf09: 60
	LDA #$00				; $bf0a: A9 00
	STA ptr0_hi			 ; $bf0c: 85 05
	LDX ptr0_hi			 ; $bf0e: A6 05
	CPX $050a			   ; $bf10: EC 0A 05
	BCC $bf16			   ; $bf13: 90 01
	RTS					 ; $bf15: 60
	LDA $0300,X			 ; $bf16: BD 00 03
	BPL $bf27			   ; $bf19: 10 0C
	TXA					 ; $bf1b: 8A
	CLC					 ; $bf1c: 18
	ADC $0301,X			 ; $bf1d: 7D 01 03
	ADC #$03				; $bf20: 69 03
	STA ptr0_hi			 ; $bf22: 85 05
	JMP $bf0e			   ; $bf24: 4C 0E BF
	STA $0e				 ; $bf27: 85 0E
	LDA #$01				; $bf29: A9 01
	STA ptr0_lo			 ; $bf2b: 85 04
	TXA					 ; $bf2d: 8A
	TAY					 ; $bf2e: A8
	INY					 ; $bf2f: C8
	INY					 ; $bf30: C8
	INY					 ; $bf31: C8
	LDA $0301,X			 ; $bf32: BD 01 03
	STA $0f				 ; $bf35: 85 0F
	INC $0f				 ; $bf37: E6 0F
	BNE $bf3d			   ; $bf39: D0 02
	INC $0e				 ; $bf3b: E6 0E
	LDA $0e				 ; $bf3d: A5 0E
	CMP $0300,Y			 ; $bf3f: D9 00 03
	BNE $bf55			   ; $bf42: D0 11
	LDA $0f				 ; $bf44: A5 0F
	CMP $0301,Y			 ; $bf46: D9 01 03
	BNE $bf55			   ; $bf49: D0 0A
	INY					 ; $bf4b: C8
	INY					 ; $bf4c: C8
	INY					 ; $bf4d: C8
	INC ptr0_lo			 ; $bf4e: E6 04
	CPY $050a			   ; $bf50: CC 0A 05
	BNE $bf37			   ; $bf53: D0 E2
	STY ptr0_hi			 ; $bf55: 84 05
	LDA ptr0_lo			 ; $bf57: A5 04
	CMP #$02				; $bf59: C9 02
	BCS $bf60			   ; $bf5b: B0 03
	JMP $bf0e			   ; $bf5d: 4C 0E BF
	TYA					 ; $bf60: 98
	PHA					 ; $bf61: 48
	LDA ptr0_lo			 ; $bf62: A5 04
	STA $0e				 ; $bf64: 85 0E
	SEC					 ; $bf66: 38
	SBC #$02				; $bf67: E9 02
	ASL					 ; $bf69: 0A
	CLC					 ; $bf6a: 18
	ADC #$01				; $bf6b: 69 01
	STA $0f				 ; $bf6d: 85 0F
	LDA ptr0_hi			 ; $bf6f: A5 05
	SEC					 ; $bf71: 38
	SBC $0f				 ; $bf72: E5 0F
	STA ptr0_hi			 ; $bf74: 85 05
	LDA $02ff,Y			 ; $bf76: B9 FF 02
	PHA					 ; $bf79: 48
	DEC ptr0_lo			 ; $bf7a: C6 04
	BEQ $bf84			   ; $bf7c: F0 06
	DEY					 ; $bf7e: 88
	DEY					 ; $bf7f: 88
	DEY					 ; $bf80: 88
	JMP $bf76			   ; $bf81: 4C 76 BF
	LDA $0301,X			 ; $bf84: BD 01 03
	STA $0302,X			 ; $bf87: 9D 02 03
	LDA $0e				 ; $bf8a: A5 0E
	STA $0f				 ; $bf8c: 85 0F
	STA $0301,X			 ; $bf8e: 9D 01 03
	LDA $0300,X			 ; $bf91: BD 00 03
	ORA #$80				; $bf94: 09 80
	STA $0300,X			 ; $bf96: 9D 00 03
	PLA					 ; $bf99: 68
	STA $0303,X			 ; $bf9a: 9D 03 03
	INX					 ; $bf9d: E8
	DEC $0e				 ; $bf9e: C6 0E
	BNE $bf99			   ; $bfa0: D0 F7
	PLA					 ; $bfa2: 68
	TAY					 ; $bfa3: A8
	CPY $050a			   ; $bfa4: CC 0A 05
	BEQ $bfb4			   ; $bfa7: F0 0B
	LDA $0300,Y			 ; $bfa9: B9 00 03
	STA $0303,X			 ; $bfac: 9D 03 03
	INY					 ; $bfaf: C8
	INX					 ; $bfb0: E8
	JMP $bfa4			   ; $bfb1: 4C A4 BF
	INX					 ; $bfb4: E8
	INX					 ; $bfb5: E8
	INX					 ; $bfb6: E8
	STX $050a			   ; $bfb7: 8E 0A 05
	DEC $0f				 ; $bfba: C6 0F
	LDA $050b			   ; $bfbc: AD 0B 05
	SEC					 ; $bfbf: 38
	SBC $0f				 ; $bfc0: E5 0F
	STA $050b			   ; $bfc2: 8D 0B 05
	JMP $bf0e			   ; $bfc5: 4C 0E BF
	.db $ff			; $bfc8
	.db $ff			; $bfc9
	.db $ff			; $bfca
	.db $ff			; $bfcb
	.db $ff			; $bfcc
	.db $ff			; $bfcd
	.db $ff			; $bfce
	.db $ff			; $bfcf
	.db $ff			; $bfd0
	.db $ff			; $bfd1
	.db $ff			; $bfd2
	.db $ff			; $bfd3
	.db $ff			; $bfd4
	.db $ff			; $bfd5
	.db $ff			; $bfd6
	.db $ff			; $bfd7
	SEI					 ; $bfd8: 78
	INC $bfdf			   ; $bfd9: EE DF BF
	JMP $ff8e			   ; $bfdc: 4C 8E FF
	.db $80			; $bfdf
	JSR $5244			   ; $bfe0: 20 44 52
	EOR ($47,X)			 ; $bfe3: 41 47
	.db $4f			; $bfe5
	LSR $5120			   ; $bfe6: 4E 20 51
	EOR $45,X			   ; $bfe9: 55 45
	.db $53			; $bfeb
	.db $54			; $bfec
	JSR $5649			   ; $bfed: 20 49 56
	BRK					 ; $bff0: 00
	BRK					 ; $bff1: 00
	BRK					 ; $bff2: 00
	BRK					 ; $bff3: 00
	PHA					 ; $bff4: 48
	.db $04			; $bff5
	ORA ($0e,X)			 ; $bff6: 01 0E
	.db $07			; $bff8
	.db $9e			; $bff9
	CLD					 ; $bffa: D8
	.db $bf			; $bffb
	CLD					 ; $bffc: D8
	.db $bf			; $bffd
	CLD					 ; $bffe: D8
	.db $bf			; $bfff
