; ============================================================
; Dragon Warrior IV - Bank 17 Disassembly
; ROM Offset: $44010
; CPU Address: $8000-$bfff
; ============================================================
;
; Discovered Subroutines: 217
; Jump Targets: 814
;
; ============================================================

	.db $32			  ; $8000 - Unknown opcode
	.db $80			  ; $8001 - Unknown opcode
	CLD					  ; $8002: D8	  
	LDX #$04				 ; $8003: A2 04   
	.db $a3			  ; $8005 - Unknown opcode
	ROL $4aa3				; $8006: 2E A3 4A
	.db $a3			  ; $8009 - Unknown opcode
	.db $54			  ; $800a - Unknown opcode
	.db $a3			  ; $800b - Unknown opcode
	CPX $a2				  ; $800c: E4 A2   
	ORA ($a3),Y			  ; $800e: 11 A3   
	.db $6b			  ; $8010 - Unknown opcode
	.db $a3			  ; $8011 - Unknown opcode
	STY $a3,X				; $8012: 94 A3   
	AND $1aa3,Y			  ; $8014: 39 A3 1A
	.db $a3			  ; $8017 - Unknown opcode
	ROR $5ca3,X			  ; $8018: 7E A3 5C
	LDY $a3df				; $801b: AC DF A3
	LDY $a1,X				; $801e: B4 A1   
	.db $f7			  ; $8020 - Unknown opcode
	.db $a3			  ; $8021 - Unknown opcode
	JMP $c49e				; $8022: 4C 9E C4
	.db $80			  ; $8025 - Unknown opcode
	ASL					  ; $8026: 0A	  
	LDX $bf5c				; $8027: AE 5C BF
	BRK					  ; $802a: 00	  
	BRK					  ; $802b: 00	  
	ROL $80,X				; $802c: 36 80   
	ADC $3a90,Y			  ; $802e: 79 90 3A ; Arithmetic
	.db $80			  ; $8031 - Unknown opcode
loc_8032:
	LDA #$00				 ; $8032: A9 00   
	BEQ $803c				; $8034: F0 06   
	LDA #$80				 ; $8036: A9 80   
	BNE $803c				; $8038: D0 02   
	LDA #$40				 ; $803a: A9 40   
loc_803C:
	STA $72e9				; $803c: 8D E9 72
	LDA #$00				 ; $803f: A9 00   
	STA $6e81				; $8041: 8D 81 6E
	BRK					  ; $8044: 00	  
	BIT $2f				  ; $8045: 24 2F   
	BRK					  ; $8047: 00	  
	BRK					  ; $8048: 00	  
	.db $2f			  ; $8049 - Unknown opcode
	BRK					  ; $804a: 00	  
	.db $27			  ; $804b - Unknown opcode
	.db $0f			  ; $804c - Unknown opcode
	BRK					  ; $804d: 00	  
	.db $03			  ; $804e - Unknown opcode
	.db $2f			  ; $804f - Unknown opcode
	JSR $b9fb				; $8050: 20 FB B9 ; -> sub_B9FB
loc_8053:
	BRK					  ; $8053: 00	  
	.db $04			  ; $8054 - Unknown opcode
	.db $2f			  ; $8055 - Unknown opcode
	JSR $80cf				; $8056: 20 CF 80 ; -> sub_80CF
	BRK					  ; $8059: 00	  
	.db $13			  ; $805a - Unknown opcode
	.db $2f			  ; $805b - Unknown opcode
	JSR $80c4				; $805c: 20 C4 80 ; -> sub_80C4
	BCC $808b				; $805f: 90 2A   
	BRK					  ; $8061: 00	  
	.db $07			  ; $8062 - Unknown opcode
	.db $6f			  ; $8063 - Unknown opcode
	AND $8620,X			  ; $8064: 3D 20 86
	.db $bb			  ; $8067 - Unknown opcode
	JSR $b9f6				; $8068: 20 F6 B9 ; -> sub_B9F6
	JSR $9223				; $806b: 20 23 92 ; -> sub_9223
	BRK					  ; $806e: 00	  
	BMI $8080				; $806f: 30 0F   
	JSR $beb2				; $8071: 20 B2 BE ; -> sub_BEB2
	JSR $a8ec				; $8074: 20 EC A8 ; -> sub_A8EC
	JSR $885b				; $8077: 20 5B 88 ; -> sub_885B
	BRK					  ; $807a: 00	  
	.db $13			  ; $807b - Unknown opcode
	.db $2f			  ; $807c - Unknown opcode
	JSR $aa4c				; $807d: 20 4C AA ; -> sub_AA4C
loc_8080:
	BRK					  ; $8080: 00	  
	.db $0b			  ; $8081 - Unknown opcode
	.db $3f			  ; $8082 - Unknown opcode
	JSR $92cf				; $8083: 20 CF 92 ; -> sub_92CF
	JSR $80c4				; $8086: 20 C4 80 ; -> sub_80C4
	BCS $8053				; $8089: B0 C8   
loc_808B:
	BRK					  ; $808b: 00	  
	.db $13			  ; $808c - Unknown opcode
	.db $2f			  ; $808d - Unknown opcode
	JSR $ab2a				; $808e: 20 2A AB ; -> sub_AB2A
	BRK					  ; $8091: 00	  
	ORA $2f				  ; $8092: 05 2F   
	LDA $6e45				; $8094: AD 45 6E
	CMP #$bb				 ; $8097: C9 BB	; Compare with 187
	BEQ $809c				; $8099: F0 01   
loc_809B:
	RTS					  ; $809b: 60	  
loc_809C:
	LDA $615a				; $809c: AD 5A 61
	CMP #$03				 ; $809f: C9 03	; Compare with 3
	BNE $809b				; $80a1: D0 F8   
	JSR $c5c5				; $80a3: 20 C5 C5 ; Call to fixed bank
	JSR $c54e				; $80a6: 20 4E C5 ; Call to fixed bank
	LDX #$01				 ; $80a9: A2 01   
	STX $6e49				; $80ab: 8E 49 6E
	DEX					  ; $80ae: CA	  
	STX $6e4a				; $80af: 8E 4A 6E
	STX $6e4b				; $80b2: 8E 4B 6E
	STX $6e4c				; $80b5: 8E 4C 6E
	BRK					  ; $80b8: 00	  
	ORA $00fb				; $80b9: 0D FB 00
	.db $27			  ; $80bc - Unknown opcode
	.db $0f			  ; $80bd - Unknown opcode
	BRK					  ; $80be: 00	  
	ASL					  ; $80bf: 0A	  
	.db $4f			  ; $80c0 - Unknown opcode
	JMP $8032				; $80c1: 4C 32 80

; ---- Subroutine at $80c4 (Bank 17) ----
sub_80C4:
	LDA $72e7				; $80c4: AD E7 72
	AND #$60				 ; $80c7: 29 60   
	BEQ $80cd				; $80c9: F0 02   
	CLC					  ; $80cb: 18	  
	RTS					  ; $80cc: 60	  
loc_80CD:
	SEC					  ; $80cd: 38	  
	RTS					  ; $80ce: 60	  

; ---- Subroutine at $80cf (Bank 17) ----
sub_80CF:
	LDA $0553				; $80cf: AD 53 05
	AND #$7f				 ; $80d2: 29 7F   
	STA $0553				; $80d4: 8D 53 05
	LDX #$0b				 ; $80d7: A2 0B   
loc_80D9:
	LDA #$70				 ; $80d9: A9 70   
	STA $72f4,X			  ; $80db: 9D F4 72
	LDA #$00				 ; $80de: A9 00   
	STA $7300,X			  ; $80e0: 9D 00 73
	STA $730c,X			  ; $80e3: 9D 0C 73
	STA $7318,X			  ; $80e6: 9D 18 73
	LDA #$f7				 ; $80e9: A9 F7   
	STA $7324,X			  ; $80eb: 9D 24 73
	STA $7330,X			  ; $80ee: 9D 30 73
	STA $733c,X			  ; $80f1: 9D 3C 73
	DEX					  ; $80f4: CA	  
	BPL $80d9				; $80f5: 10 E2   
	JSR $87fb				; $80f7: 20 FB 87 ; -> sub_87FB
	LDA $72e9				; $80fa: AD E9 72
	BMI $8117				; $80fd: 30 18   
	LDA $6e44				; $80ff: AD 44 6E
	AND #$03				 ; $8102: 29 03   
	CMP #$01				 ; $8104: C9 01	; Compare with 1
	BEQ $8117				; $8106: F0 0F   
	LDA $72e6				; $8108: AD E6 72
	AND #$30				 ; $810b: 29 30   
	BNE $8117				; $810d: D0 08   
	JSR $ae0a				; $810f: 20 0A AE ; -> sub_AE0A
	BCS $8118				; $8112: B0 04   
	JMP $82e8				; $8114: 4C E8 82
loc_8117:
	RTS					  ; $8117: 60	  
loc_8118:
	JSR $87fb				; $8118: 20 FB 87 ; -> sub_87FB
	BRK					  ; $811b: 00	  
	.db $62			  ; $811c - Unknown opcode
	.db $23			  ; $811d - Unknown opcode
	EOR ($85,X)			  ; $811e: 41 85   
	BRK					  ; $8120: 00	  
	LDA #$10				 ; $8121: A9 10   
	JSR $880a				; $8123: 20 0A 88 ; -> sub_880A
	BCS $815f				; $8126: B0 37   
	LDA #$11				 ; $8128: A9 11   
	JSR $880a				; $812a: 20 0A 88 ; -> sub_880A
	BCS $815f				; $812d: B0 30   
	JSR $87bb				; $812f: 20 BB 87 ; -> sub_87BB
	LDA $03d4				; $8132: AD D4 03
	AND #$1f				 ; $8135: 29 1F   
	STA $03d4				; $8137: 8D D4 03
	BRK					  ; $813a: 00	  
	.db $07			  ; $813b - Unknown opcode
	.db $6f			  ; $813c - Unknown opcode
	AND $0700				; $813d: 2D 00 07
	.db $6f			  ; $8140 - Unknown opcode
	BIT $00c9				; $8141: 2C C9 00
	BEQ $815f				; $8144: F0 19   
	CMP #$03				 ; $8146: C9 03	; Compare with 3
	BEQ $815c				; $8148: F0 12   
	CMP #$01				 ; $814a: C9 01	; Compare with 1
	BEQ $8162				; $814c: F0 14   
	CMP #$02				 ; $814e: C9 02	; Compare with 2
	BEQ $8168				; $8150: F0 16   
	CMP #$fd				 ; $8152: C9 FD	; Compare with 253
	BEQ $8165				; $8154: F0 0F   
	JMP $8118				; $8156: 4C 18 81
loc_8159:
	JMP $80cf				; $8159: 4C CF 80
loc_815C:
	JMP $82d4				; $815c: 4C D4 82
loc_815F:
	JMP $81fd				; $815f: 4C FD 81
loc_8162:
	JMP $8293				; $8162: 4C 93 82
loc_8165:
	JMP $82d8				; $8165: 4C D8 82
loc_8168:
	BRK					  ; $8168: 00	  
	EOR $9033,X			  ; $8169: 5D 33 90
	.db $07			  ; $816c - Unknown opcode
	LDA $618e				; $816d: AD 8E 61
	AND #$07				 ; $8170: 29 07   
	BEQ $8183				; $8172: F0 0F   
	BRK					  ; $8174: 00	  
	.db $07			  ; $8175 - Unknown opcode
	.db $6f			  ; $8176 - Unknown opcode
	AND tmp0,X			   ; $8177: 3D 00 00
	.db $0b			  ; $817a - Unknown opcode
	LDX #$28				 ; $817b: A2 28   
	JSR $c90c				; $817d: 20 0C C9 ; Call to fixed bank
	JMP $80cf				; $8180: 4C CF 80
loc_8183:
	BRK					  ; $8183: 00	  
	.db $07			  ; $8184 - Unknown opcode
	.db $6f			  ; $8185 - Unknown opcode
	AND $fb20				; $8186: 2D 20 FB
	.db $87			  ; $8189 - Unknown opcode
	BRK					  ; $818a: 00	  
	.db $62			  ; $818b - Unknown opcode
	.db $23			  ; $818c - Unknown opcode
	RTI					  ; $818d: 40	  
	CMP #$04				 ; $818e: C9 04	; Compare with 4
	BEQ $819e				; $8190: F0 0C   
	CMP #$01				 ; $8192: C9 01	; Compare with 1
	BEQ $81a6				; $8194: F0 10   
	BRK					  ; $8196: 00	  
	.db $07			  ; $8197 - Unknown opcode
	.db $6f			  ; $8198 - Unknown opcode
	ADC $a2				  ; $8199: 65 A2	; Arithmetic
	BRK					  ; $819b: 00	  
	BEQ $81ac				; $819c: F0 0E   
loc_819E:
	BRK					  ; $819e: 00	  
	.db $07			  ; $819f - Unknown opcode
	.db $6f			  ; $81a0 - Unknown opcode
	ROR $a2				  ; $81a1: 66 A2   
	.db $03			  ; $81a3 - Unknown opcode
	BNE $81ac				; $81a4: D0 06   
loc_81A6:
	BRK					  ; $81a6: 00	  
	.db $07			  ; $81a7 - Unknown opcode
	.db $6f			  ; $81a8 - Unknown opcode
	.db $67			  ; $81a9 - Unknown opcode
	LDX #$05				 ; $81aa: A2 05   
loc_81AC:
	STX tmp0				 ; $81ac: 86 00   
	CMP #$ff				 ; $81ae: C9 FF	; Compare with 255
	BEQ $8159				; $81b0: F0 A7   
	CLC					  ; $81b2: 18	  
	ADC tmp0				 ; $81b3: 65 00	; Arithmetic
	TAX					  ; $81b5: AA	  
	LDA $884b,X			  ; $81b6: BD 4B 88
	BEQ $81d7				; $81b9: F0 1C   
	CMP #$01				 ; $81bb: C9 01	; Compare with 1
	BEQ $81cd				; $81bd: F0 0E   
	BRK					  ; $81bf: 00	  
	.db $62			  ; $81c0 - Unknown opcode
	.db $23			  ; $81c1 - Unknown opcode
	.db $80			  ; $81c2 - Unknown opcode
	BEQ $81ee				; $81c3: F0 29   
	JSR $8757				; $81c5: 20 57 87 ; -> sub_8757
	BCC $8187				; $81c8: 90 BD   
	JMP $81fd				; $81ca: 4C FD 81
loc_81CD:
	LDA #$39				 ; $81cd: A9 39   
	JSR $8778				; $81cf: 20 78 87 ; -> sub_8778
	BCC $8187				; $81d2: 90 B3   
	JMP $81fd				; $81d4: 4C FD 81
loc_81D7:
	BRK					  ; $81d7: 00	  
	.db $62			  ; $81d8 - Unknown opcode
	.db $23			  ; $81d9 - Unknown opcode
	.db $80			  ; $81da - Unknown opcode
	BEQ $81ee				; $81db: F0 11   
	LDA #$3a				 ; $81dd: A9 3A   
	JSR $8778				; $81df: 20 78 87 ; -> sub_8778
	BCC $8187				; $81e2: 90 A3   
	LDA #$3b				 ; $81e4: A9 3B   
	JSR $8757				; $81e6: 20 57 87 ; -> sub_8757
	BCC $81d7				; $81e9: 90 EC   
	JMP $81fd				; $81eb: 4C FD 81
loc_81EE:
	BRK					  ; $81ee: 00	  
	.db $07			  ; $81ef - Unknown opcode
	.db $6f			  ; $81f0 - Unknown opcode
	AND $6f00,X			  ; $81f1: 3D 00 6F
	.db $0b			  ; $81f4 - Unknown opcode
	LDX #$32				 ; $81f5: A2 32   
	JSR $c90c				; $81f7: 20 0C C9 ; Call to fixed bank
	JMP $80cf				; $81fa: 4C CF 80
loc_81FD:
	LDA $03d4				; $81fd: AD D4 03
	AND #$1f				 ; $8200: 29 1F   
	STA $03d4				; $8202: 8D D4 03
	JSR $8720				; $8205: 20 20 87 ; -> sub_8720
	LDA $7357				; $8208: AD 57 73
	CMP #$ff				 ; $820b: C9 FF	; Compare with 255
	STA $735a				; $820d: 8D 5A 73
	BNE $822f				; $8210: D0 1D   
	LDX #$00				 ; $8212: A2 00   
loc_8214:
	LDA $72f4,X			  ; $8214: BD F4 72
	AND #$70				 ; $8217: 29 70   
	CMP #$70				 ; $8219: C9 70	; Compare with 112
	BEQ $822c				; $821b: F0 0F   
	INX					  ; $821d: E8	  
	CPX #$04				 ; $821e: E0 04   
	BCC $8214				; $8220: 90 F2   
	LDA #$ff				 ; $8222: A9 FF   
	STA $7359				; $8224: 8D 59 73
	STA $7358				; $8227: 8D 58 73
	BNE $8241				; $822a: D0 15   
loc_822C:
	STX $735a				; $822c: 8E 5A 73
loc_822F:
	LDX $7358				; $822f: AE 58 73
	CPX #$ff				 ; $8232: E0 FF   
	BEQ $8241				; $8234: F0 0B   
	BRK					  ; $8236: 00	  
	PLA					  ; $8237: 68	  
	.db $53			  ; $8238 - Unknown opcode
	ORA #$10				 ; $8239: 09 10   
	LDX $735a				; $823b: AE 5A 73
	STA $72f4,X			  ; $823e: 9D F4 72
loc_8241:
	JSR $870c				; $8241: 20 0C 87 ; -> sub_870C
	BCC $824b				; $8244: 90 05   
	CPX $7357				; $8246: EC 57 73
	BNE $8260				; $8249: D0 15   
loc_824B:
	LDX $7358				; $824b: AE 58 73
	CPX #$ff				 ; $824e: E0 FF   
	BEQ $8275				; $8250: F0 23   
	BRK					  ; $8252: 00	  
	.db $2b			  ; $8253 - Unknown opcode
	.db $73			  ; $8254 - Unknown opcode
	BNE $8275				; $8255: D0 1E   
	STX $7356				; $8257: 8E 56 73
	LDX $735a				; $825a: AE 5A 73
	JMP $8263				; $825d: 4C 63 82
loc_8260:
	STX $7356				; $8260: 8E 56 73
loc_8263:
	STX $96				  ; $8263: 86 96   
	JSR $86f4				; $8265: 20 F4 86 ; -> sub_86F4
	JSR $8321				; $8268: 20 21 83 ; -> sub_8321
	BCC $8275				; $826b: 90 08   
	JSR $8371				; $826d: 20 71 83 ; -> sub_8371
	BCS $8275				; $8270: B0 03   
	JMP $80cf				; $8272: 4C CF 80
loc_8275:
	LDX $96				  ; $8275: A6 96   
	LDA $7324,X			  ; $8277: BD 24 73
	STA $75ea				; $827a: 8D EA 75
	LDA $7300,X			  ; $827d: BD 00 73
	BMI $8292				; $8280: 30 10   
	PHA					  ; $8282: 48	  
	AND #$f0				 ; $8283: 29 F0   
	STA tmp0				 ; $8285: 85 00   
	PLA					  ; $8287: 68	  
	AND #$0f				 ; $8288: 29 0F   
	BRK					  ; $828a: 00	  
	.db $67			  ; $828b - Unknown opcode
	.db $73			  ; $828c - Unknown opcode
	ORA tmp0				 ; $828d: 05 00   
	STA $75eb				; $828f: 8D EB 75
loc_8292:
	RTS					  ; $8292: 60	  
loc_8293:
	BRK					  ; $8293: 00	  
	.db $07			  ; $8294 - Unknown opcode
	.db $6f			  ; $8295 - Unknown opcode
	AND $0700				; $8296: 2D 00 07
	.db $6f			  ; $8299 - Unknown opcode
	.db $64			  ; $829a - Unknown opcode
	CMP #$00				 ; $829b: C9 00	; Compare with 0
	BEQ $82b5				; $829d: F0 16   
	CMP #$01				 ; $829f: C9 01	; Compare with 1
	BEQ $82ae				; $82a1: F0 0B   
	CMP #$02				 ; $82a3: C9 02	; Compare with 2
	BNE $82e5				; $82a5: D0 3E   
	BRK					  ; $82a7: 00	  
	.db $07			  ; $82a8 - Unknown opcode
	.db $6f			  ; $82a9 - Unknown opcode
	EOR $974c,X			  ; $82aa: 5D 4C 97
	.db $82			  ; $82ad - Unknown opcode
loc_82AE:
	BRK					  ; $82ae: 00	  
	.db $07			  ; $82af - Unknown opcode
	.db $6f			  ; $82b0 - Unknown opcode
	.db $5b			  ; $82b1 - Unknown opcode
	JMP $8297				; $82b2: 4C 97 82
loc_82B5:
	BRK					  ; $82b5: 00	  
	.db $07			  ; $82b6 - Unknown opcode
	.db $6f			  ; $82b7 - Unknown opcode
	JMP $ffc9				; $82b8: 4C C9 FF
	BEQ $82d1				; $82bb: F0 14   
	CMP #$06				 ; $82bd: C9 06	; Compare with 6
	BCS $82d1				; $82bf: B0 10   
	BRK					  ; $82c1: 00	  
	LSR $0073				; $82c2: 4E 73 00
	.db $07			  ; $82c5 - Unknown opcode
	.db $6f			  ; $82c6 - Unknown opcode
	EOR $d4ad				; $82c7: 4D AD D4
	.db $03			  ; $82ca - Unknown opcode
	SEC					  ; $82cb: 38	  
	SBC #$20				 ; $82cc: E9 20	; Arithmetic
	STA $03d4				; $82ce: 8D D4 03
loc_82D1:
	JMP $8118				; $82d1: 4C 18 81
loc_82D4:
	JSR $8403				; $82d4: 20 03 84 ; -> sub_8403
	RTS					  ; $82d7: 60	  
loc_82D8:
	LDX #$03				 ; $82d8: A2 03   
	BRK					  ; $82da: 00	  
	ORA ($6f,X)			  ; $82db: 01 6F   
	ADC ($c9,X)			  ; $82dd: 61 C9	; Arithmetic
	.db $ff			  ; $82df - Unknown opcode
	BEQ $82e5				; $82e0: F0 03   
	STA $62ee				; $82e2: 8D EE 62
loc_82E5:
	JMP $8118				; $82e5: 4C 18 81
loc_82E8:
	LDX #$00				 ; $82e8: A2 00   
	STX $96				  ; $82ea: 86 96   
	STX $7356				; $82ec: 8E 56 73
loc_82EF:
	JSR $86f4				; $82ef: 20 F4 86 ; -> sub_86F4
	JSR $8321				; $82f2: 20 21 83 ; -> sub_8321
	BCC $82ff				; $82f5: 90 08   
	JSR $8371				; $82f7: 20 71 83 ; -> sub_8371
	BCS $82ff				; $82fa: B0 03   
	JSR $830d				; $82fc: 20 0D 83 ; -> sub_830D
loc_82FF:
	INC $7356				; $82ff: EE 56 73
	INC $96				  ; $8302: E6 96   
	BRK					  ; $8304: 00	  
	.db $62			  ; $8305 - Unknown opcode
	.db $23			  ; $8306 - Unknown opcode
	RTI					  ; $8307: 40	  
	CMP $96				  ; $8308: C5 96   
	BNE $82ef				; $830a: D0 E3   
	RTS					  ; $830c: 60	  

; ---- Subroutine at $830d (Bank 17) ----
sub_830D:
	LDA $96				  ; $830d: A5 96   
	BEQ $831b				; $830f: F0 0A   
	DEC $96				  ; $8311: C6 96   
	DEC $7356				; $8313: CE 56 73
	JSR $8321				; $8316: 20 21 83 ; -> sub_8321
	BCC $830d				; $8319: 90 F2   
loc_831B:
	DEC $96				  ; $831b: C6 96   
	DEC $7356				; $831d: CE 56 73
	RTS					  ; $8320: 60	  

; ---- Subroutine at $8321 (Bank 17) ----
sub_8321:
	LDX $7356				; $8321: AE 56 73

; ---- Subroutine at $8324 (Bank 17) ----
sub_8324:
	BRK					  ; $8324: 00	  
	LSR $93				  ; $8325: 46 93   
	.db $07			  ; $8327 - Unknown opcode
	BCC $8362				; $8328: 90 38   
	BRK					  ; $832a: 00	  
	LSR $93				  ; $832b: 46 93   
	ASL $b0				  ; $832d: 06 B0   
	.db $32			  ; $832f - Unknown opcode
	BRK					  ; $8330: 00	  
	LSR $93				  ; $8331: 46 93   
	BPL $82e5				; $8333: 10 B0   
	BIT $4600				; $8335: 2C 00 46
	.db $93			  ; $8338 - Unknown opcode
	ORA ($b0),Y			  ; $8339: 11 B0   
	ROL tmp0				 ; $833b: 26 00   
	LSR $93				  ; $833d: 46 93   
	CLC					  ; $833f: 18	  
	BCS $8362				; $8340: B0 20   
	BRK					  ; $8342: 00	  
	LSR $93				  ; $8343: 46 93   
	ROL $b0				  ; $8345: 26 B0   
	.db $1a			  ; $8347 - Unknown opcode
	BRK					  ; $8348: 00	  
	.db $2b			  ; $8349 - Unknown opcode
	.db $73			  ; $834a - Unknown opcode
	CMP #$08				 ; $834b: C9 08	; Compare with 8
	BCS $8364				; $834d: B0 15   
	LDA $72e5				; $834f: AD E5 72
	BPL $8360				; $8352: 10 0C   
	BRK					  ; $8354: 00	  
	PLA					  ; $8355: 68	  
	.db $73			  ; $8356 - Unknown opcode
	LDA $72e6				; $8357: AD E6 72
	AND #$0f				 ; $835a: 29 0F   
	CMP $72				  ; $835c: C5 72   
	BNE $8362				; $835e: D0 02   
loc_8360:
	SEC					  ; $8360: 38	  
	RTS					  ; $8361: 60	  
loc_8362:
	CLC					  ; $8362: 18	  
	RTS					  ; $8363: 60	  

; ---- Subroutine at $8364 (Bank 17) ----
sub_8364:
	TYA					  ; $8364: 98	  
	PHA					  ; $8365: 48	  
	TXA					  ; $8366: 8A	  
	PHA					  ; $8367: 48	  
	BRK					  ; $8368: 00	  
	.db $32			  ; $8369 - Unknown opcode
	.db $0f			  ; $836a - Unknown opcode
	PLA					  ; $836b: 68	  
	TAX					  ; $836c: AA	  
	PLA					  ; $836d: 68	  
	TAY					  ; $836e: A8	  
	CLC					  ; $836f: 18	  
	RTS					  ; $8370: 60	  

; ---- Subroutine at $8371 (Bank 17) ----
sub_8371:
	JSR $87bb				; $8371: 20 BB 87 ; -> sub_87BB
	BRK					  ; $8374: 00	  
	.db $07			  ; $8375 - Unknown opcode
	.db $6f			  ; $8376 - Unknown opcode
	AND $00a0				; $8377: 2D A0 00
	JSR $ae0a				; $837a: 20 0A AE ; -> sub_AE0A
	BCC $8383				; $837d: 90 04   
	LDY #$02				 ; $837f: A0 02   
	BNE $8390				; $8381: D0 0D   
loc_8383:
	LDX $7356				; $8383: AE 56 73
loc_8386:
	DEX					  ; $8386: CA	  
	BMI $8390				; $8387: 30 07   
	JSR $8324				; $8389: 20 24 83 ; -> sub_8324
	BCC $8386				; $838c: 90 F8   
	LDY #$02				 ; $838e: A0 02   
loc_8390:
	JSR $86e2				; $8390: 20 E2 86 ; -> sub_86E2
	BRK					  ; $8393: 00	  
	.db $3c			  ; $8394 - Unknown opcode
	.db $93			  ; $8395 - Unknown opcode
	BRK					  ; $8396: 00	  
	STA tmp0				 ; $8397: 85 00   
	BRK					  ; $8399: 00	  
	.db $3c			  ; $839a - Unknown opcode
	.db $93			  ; $839b - Unknown opcode
	ORA (ptr0_hi,X)		  ; $839c: 01 05   
	BRK					  ; $839e: 00	  
	STA tmp0				 ; $839f: 85 00   
	BRK					  ; $83a1: 00	  
	.db $2b			  ; $83a2 - Unknown opcode
	.db $73			  ; $83a3 - Unknown opcode
	BNE $83ae				; $83a4: D0 08   
	BRK					  ; $83a6: 00	  
	.db $3c			  ; $83a7 - Unknown opcode
	.db $93			  ; $83a8 - Unknown opcode
	.db $02			  ; $83a9 - Unknown opcode
	ORA tmp0				 ; $83aa: 05 00   
	STA tmp0				 ; $83ac: 85 00   
loc_83AE:
	LDA tmp0				 ; $83ae: A5 00   
	BNE $83b3				; $83b0: D0 01   
	INY					  ; $83b2: C8	  
loc_83B3:
	TYA					  ; $83b3: 98	  
	PHA					  ; $83b4: 48	  
	LDX $7356				; $83b5: AE 56 73
	LDA $8827,Y			  ; $83b8: B9 27 88
	BRK					  ; $83bb: 00	  
	BRK					  ; $83bc: 00	  
	.db $6f			  ; $83bd - Unknown opcode
	STA tmp0				 ; $83be: 85 00   
	TAX					  ; $83c0: AA	  
	PLA					  ; $83c1: 68	  
	CPX #$ff				 ; $83c2: E0 FF   
	BEQ $83e8				; $83c4: F0 22   
	CPX #$fd				 ; $83c6: E0 FD   
	BEQ $83f3				; $83c8: F0 29   
	ASL					  ; $83ca: 0A	  
	ASL					  ; $83cb: 0A	  
	ASL					  ; $83cc: 0A	  
	ADC tmp0				 ; $83cd: 65 00	; Arithmetic
	TAX					  ; $83cf: AA	  
	LDA $882b,X			  ; $83d0: BD 2B 88
	BEQ $83f0				; $83d3: F0 1B   
	CMP #$01				 ; $83d5: C9 01	; Compare with 1
	BEQ $83ed				; $83d7: F0 14   
	CMP #$02				 ; $83d9: C9 02	; Compare with 2
	BEQ $83ea				; $83db: F0 0D   
	CMP #$03				 ; $83dd: C9 03	; Compare with 3
	BEQ $8458				; $83df: F0 77   
	CMP #$04				 ; $83e1: C9 04	; Compare with 4
	BEQ $8403				; $83e3: F0 1E   
	SEC					  ; $83e5: 38	  
	SBC #$01				 ; $83e6: E9 01	; Arithmetic
loc_83E8:
	CLC					  ; $83e8: 18	  
	RTS					  ; $83e9: 60	  
loc_83EA:
	JMP $8530				; $83ea: 4C 30 85
loc_83ED:
	JMP $8479				; $83ed: 4C 79 84
loc_83F0:
	JMP $8464				; $83f0: 4C 64 84
loc_83F3:
	LDX #$03				 ; $83f3: A2 03   
	BRK					  ; $83f5: 00	  
	ORA ($6f,X)			  ; $83f6: 01 6F   
	ADC ($c9,X)			  ; $83f8: 61 C9	; Arithmetic
	.db $ff			  ; $83fa - Unknown opcode
	BEQ $8400				; $83fb: F0 03   
	STA $62ee				; $83fd: 8D EE 62
loc_8400:
	JMP $8371				; $8400: 4C 71 83

; ---- Subroutine at $8403 (Bank 17) ----
sub_8403:
	BRK					  ; $8403: 00	  
	.db $07			  ; $8404 - Unknown opcode
	.db $6f			  ; $8405 - Unknown opcode
	AND $8300,X			  ; $8406: 3D 00 83
	.db $fb			  ; $8409 - Unknown opcode
	LDA #$00				 ; $840a: A9 00   
	STA $6e				  ; $840c: 85 6E   
	LDA #$03				 ; $840e: A9 03   
	BRK					  ; $8410: 00	  
	AND $850f				; $8411: 2D 0F 85
	SBC $6200,Y			  ; $8414: F9 00 62 ; Arithmetic
	.db $33			  ; $8417 - Unknown opcode
	LDY #$1d				 ; $8418: A0 1D   
	CMP #$01				 ; $841a: C9 01	; Compare with 1
	BEQ $8420				; $841c: F0 02   
	LDY #$1e				 ; $841e: A0 1E   
loc_8420:
	TYA					  ; $8420: 98	  
	BRK					  ; $8421: 00	  
	.db $80			  ; $8422 - Unknown opcode
	.db $e3			  ; $8423 - Unknown opcode
	JSR $8637				; $8424: 20 37 86 ; -> sub_8637
	BCS $844d				; $8427: B0 24   
	LDA $72e4				; $8429: AD E4 72
	PHA					  ; $842c: 48	  
	AND #$fc				 ; $842d: 29 FC   
	STA tmp0				 ; $842f: 85 00   
	PLA					  ; $8431: 68	  
	CLC					  ; $8432: 18	  
	ADC #$01				 ; $8433: 69 01	; Arithmetic
	AND #$03				 ; $8435: 29 03   
	ORA tmp0				 ; $8437: 05 00   
	STA $72e4				; $8439: 8D E4 72
	LDA $6e44				; $843c: AD 44 6E
	AND #$fc				 ; $843f: 29 FC   
	ORA #$01				 ; $8441: 09 01   
	STA $6e44				; $8443: 8D 44 6E
	BRK					  ; $8446: 00	  
	CPX $d3				  ; $8447: E4 D3   
	.db $04			  ; $8449 - Unknown opcode
	PLA					  ; $844a: 68	  
	PLA					  ; $844b: 68	  
	RTS					  ; $844c: 60	  
loc_844D:
	LDA $72e7				; $844d: AD E7 72
	ORA #$60				 ; $8450: 09 60   
	STA $72e7				; $8452: 8D E7 72
	PLA					  ; $8455: 68	  
	PLA					  ; $8456: 68	  
	RTS					  ; $8457: 60	  
loc_8458:
	LDA #$41				 ; $8458: A9 41   
	JSR $8706				; $845a: 20 06 87 ; -> sub_8706
	LDA #$00				 ; $845d: A9 00   
	JSR $8700				; $845f: 20 00 87 ; -> sub_8700
	SEC					  ; $8462: 38	  
	RTS					  ; $8463: 60	  
loc_8464:
	JSR $85ea				; $8464: 20 EA 85 ; -> sub_85EA
	BCC $8476				; $8467: 90 0D   
	JSR $8700				; $8469: 20 00 87 ; -> sub_8700
	JSR $86f4				; $846c: 20 F4 86 ; -> sub_86F4
	LDA #$43				 ; $846f: A9 43   
	JSR $8706				; $8471: 20 06 87 ; -> sub_8706
	SEC					  ; $8474: 38	  
	RTS					  ; $8475: 60	  
loc_8476:
	JMP $8371				; $8476: 4C 71 83
loc_8479:
	LDX $7356				; $8479: AE 56 73
	BRK					  ; $847c: 00	  
	.db $2b			  ; $847d - Unknown opcode
	.db $73			  ; $847e - Unknown opcode
	TAX					  ; $847f: AA	  
	TAY					  ; $8480: A8	  
	LDA $6bdf,X			  ; $8481: BD DF 6B
	STA tmp0				 ; $8484: 85 00   
	LDA #$00				 ; $8486: A9 00   
	STA tmp1				 ; $8488: 85 01   
	LDA #$06				 ; $848a: A9 06   
	LDX #$00				 ; $848c: A2 00   
	JSR $c851				; $848e: 20 51 C8 ; Call to fixed bank
	TYA					  ; $8491: 98	  
	LDY #$01				 ; $8492: A0 01   
	CMP #$00				 ; $8494: C9 00	; Compare with 0
	BNE $849a				; $8496: D0 02   
	LDY #$02				 ; $8498: A0 02   
loc_849A:
	LDX $7356				; $849a: AE 56 73
	CPY tmp0				 ; $849d: C4 00   
	BCC $84a8				; $849f: 90 07   
	LDA tmp0				 ; $84a1: A5 00   
	BRK					  ; $84a3: 00	  
	.db $3c			  ; $84a4 - Unknown opcode
	.db $73			  ; $84a5 - Unknown opcode
	BNE $84be				; $84a6: D0 16   
loc_84A8:
	LDY #$02				 ; $84a8: A0 02   
	BRK					  ; $84aa: 00	  
	.db $2b			  ; $84ab - Unknown opcode
	.db $53			  ; $84ac - Unknown opcode
	BEQ $84b1				; $84ad: F0 02   
	LDY #$01				 ; $84af: A0 01   
loc_84B1:
	STY $6f				  ; $84b1: 84 6F   
loc_84B3:
	BRK					  ; $84b3: 00	  
	.db $3c			  ; $84b4 - Unknown opcode
	.db $53			  ; $84b5 - Unknown opcode
	BNE $84be				; $84b6: D0 06   
	DEC $6f				  ; $84b8: C6 6F   
	BPL $84b3				; $84ba: 10 F7   
	BMI $852d				; $84bc: 30 6F   
loc_84BE:
	LDX $6f				  ; $84be: A6 6F   
	LDA $8824,X			  ; $84c0: BD 24 88
	JSR $86e2				; $84c3: 20 E2 86 ; -> sub_86E2
	BRK					  ; $84c6: 00	  
	BRK					  ; $84c7: 00	  
	.db $6f			  ; $84c8 - Unknown opcode
	CMP #$ff				 ; $84c9: C9 FF	; Compare with 255
	BEQ $852d				; $84cb: F0 60   
	PHA					  ; $84cd: 48	  
	LDX $7356				; $84ce: AE 56 73
	BRK					  ; $84d1: 00	  
	.db $2b			  ; $84d2 - Unknown opcode
	.db $73			  ; $84d3 - Unknown opcode
	TAX					  ; $84d4: AA	  
	PLA					  ; $84d5: 68	  
	STA $6bdf,X			  ; $84d6: 9D DF 6B
	JSR $86e2				; $84d9: 20 E2 86 ; -> sub_86E2
	BRK					  ; $84dc: 00	  
	.db $3f			  ; $84dd - Unknown opcode
	.db $73			  ; $84de - Unknown opcode
	BCC $852d				; $84df: 90 4C   
	PHA					  ; $84e1: 48	  
	JSR $8706				; $84e2: 20 06 87 ; -> sub_8706
	LDX $7356				; $84e5: AE 56 73
	TAY					  ; $84e8: A8	  
	BRK					  ; $84e9: 00	  
	PLA					  ; $84ea: 68	  
	.db $73			  ; $84eb - Unknown opcode
	JSR $ab49				; $84ec: 20 49 AB ; -> sub_AB49
	PLA					  ; $84ef: 68	  
	BCC $850f				; $84f0: 90 1D   
	PHA					  ; $84f2: 48	  
	BRK					  ; $84f3: 00	  
	.db $0c			  ; $84f4 - Unknown opcode
	.db $3f			  ; $84f5 - Unknown opcode
	ROR					  ; $84f6: 6A	  
	AND #$80				 ; $84f7: 29 80   
	STA $7354				; $84f9: 8D 54 73
	PLA					  ; $84fc: 68	  
	BRK					  ; $84fd: 00	  
	ORA $903f				; $84fe: 0D 3F 90
	ORA $20				  ; $8501: 05 20   
	INC $85,X				; $8503: F6 85   
	BCC $852d				; $8505: 90 26   
	LDA $7354				; $8507: AD 54 73
	JSR $8700				; $850a: 20 00 87 ; -> sub_8700
	SEC					  ; $850d: 38	  
	RTS					  ; $850e: 60	  
loc_850F:
	PHA					  ; $850f: 48	  
	BRK					  ; $8510: 00	  
	.db $07			  ; $8511 - Unknown opcode
	.db $6f			  ; $8512 - Unknown opcode
	AND $c968,X			  ; $8513: 3D 68 C9
	.db $12			  ; $8516 - Unknown opcode
	BNE $8527				; $8517: D0 0E   
	BRK					  ; $8519: 00	  
	.db $62			  ; $851a - Unknown opcode
	.db $23			  ; $851b - Unknown opcode
	.db $43			  ; $851c - Unknown opcode
	CMP #$04				 ; $851d: C9 04	; Compare with 4
	BCS $8527				; $851f: B0 06   
	BRK					  ; $8521: 00	  
	RTS					  ; $8522: 60	  
	.db $1b			  ; $8523 - Unknown opcode
	JMP $852a				; $8524: 4C 2A 85
loc_8527:
	BRK					  ; $8527: 00	  
	ORA ($0b,X)			  ; $8528: 01 0B   
loc_852A:
	JSR $8752				; $852a: 20 52 87 ; -> sub_8752
loc_852D:
	JMP $8371				; $852d: 4C 71 83
loc_8530:
	LDA #$00				 ; $8530: A9 00   
	STA $7354				; $8532: 8D 54 73
	LDX $7356				; $8535: AE 56 73
	BRK					  ; $8538: 00	  
	AND $d073				; $8539: 2D 73 D0
	.db $12			  ; $853c - Unknown opcode
	BRK					  ; $853d: 00	  
	.db $07			  ; $853e - Unknown opcode
	.db $6f			  ; $853f - Unknown opcode
	AND $56ad,X			  ; $8540: 3D AD 56
	.db $73			  ; $8543 - Unknown opcode
	STA $f9				  ; $8544: 85 F9   
	BRK					  ; $8546: 00	  
	.db $02			  ; $8547 - Unknown opcode
	.db $0b			  ; $8548 - Unknown opcode
	JSR $8752				; $8549: 20 52 87 ; -> sub_8752
	JMP $852d				; $854c: 4C 2D 85
	LDX $7356				; $854f: AE 56 73
	BRK					  ; $8552: 00	  
	ORA ($6f,X)			  ; $8553: 01 6F   
	.db $37			  ; $8555 - Unknown opcode
	CMP #$ff				 ; $8556: C9 FF	; Compare with 255
	BEQ $852d				; $8558: F0 D3   
	LDX $7356				; $855a: AE 56 73
	BRK					  ; $855d: 00	  
	BIT $8d73				; $855e: 2C 73 8D
	EOR $73,X				; $8561: 55 73   
	JSR $8706				; $8563: 20 06 87 ; -> sub_8706
	BRK					  ; $8566: 00	  
	.db $0b			  ; $8567 - Unknown opcode
	.db $0f			  ; $8568 - Unknown opcode
	CPX #$00				 ; $8569: E0 00   
	BNE $85a9				; $856b: D0 3C   
	PHA					  ; $856d: 48	  
	BRK					  ; $856e: 00	  
	.db $2b			  ; $856f - Unknown opcode
	.db $33			  ; $8570 - Unknown opcode
	TAX					  ; $8571: AA	  
	PLA					  ; $8572: 68	  
	BRK					  ; $8573: 00	  
	ASL					  ; $8574: 0A	  
	.db $0f			  ; $8575 - Unknown opcode
	BCC $85a9				; $8576: 90 31   
	BRK					  ; $8578: 00	  
	.db $07			  ; $8579 - Unknown opcode
	.db $6f			  ; $857a - Unknown opcode
	SEC					  ; $857b: 38	  
	CMP #$ff				 ; $857c: C9 FF	; Compare with 255
	BEQ $852d				; $857e: F0 AD   
	CMP #$00				 ; $8580: C9 00	; Compare with 0
	BEQ $85a9				; $8582: F0 25   
	LDX $7356				; $8584: AE 56 73
	BRK					  ; $8587: 00	  
	.db $3b			  ; $8588 - Unknown opcode
	.db $93			  ; $8589 - Unknown opcode
	BRK					  ; $858a: 00	  
	BCC $8592				; $858b: 90 05   
	BRK					  ; $858d: 00	  
	.db $0c			  ; $858e - Unknown opcode
	.db $0f			  ; $858f - Unknown opcode
	BCS $85d0				; $8590: B0 3E   
loc_8592:
	BRK					  ; $8592: 00	  
	.db $2b			  ; $8593 - Unknown opcode
	.db $53			  ; $8594 - Unknown opcode
	TAX					  ; $8595: AA	  
	LDA $7355				; $8596: AD 55 73
	BRK					  ; $8599: 00	  
	ASL					  ; $859a: 0A	  
	.db $0f			  ; $859b - Unknown opcode
	JSR $85ea				; $859c: 20 EA 85 ; -> sub_85EA
	LDA $7354				; $859f: AD 54 73
	ORA #$10				 ; $85a2: 09 10   
	JSR $8700				; $85a4: 20 00 87 ; -> sub_8700
	SEC					  ; $85a7: 38	  
	RTS					  ; $85a8: 60	  
loc_85A9:
	LDA $7355				; $85a9: AD 55 73
	BRK					  ; $85ac: 00	  
	ORA $0f,X				; $85ad: 15 0F   
	BCC $85c6				; $85af: 90 15   
	BRK					  ; $85b1: 00	  
	ASL $0f,X				; $85b2: 16 0F   
	PHA					  ; $85b4: 48	  
	ROR					  ; $85b5: 6A	  
	AND #$80				 ; $85b6: 29 80   
	STA $7354				; $85b8: 8D 54 73
	PLA					  ; $85bb: 68	  
	BRK					  ; $85bc: 00	  
	.db $14			  ; $85bd - Unknown opcode
	.db $0f			  ; $85be - Unknown opcode
	BCC $85c6				; $85bf: 90 05   
	JSR $85f6				; $85c1: 20 F6 85 ; -> sub_85F6
	BCC $85e7				; $85c4: 90 21   
loc_85C6:
	LDA $7354				; $85c6: AD 54 73
	ORA #$20				 ; $85c9: 09 20   
	JSR $8700				; $85cb: 20 00 87 ; -> sub_8700
	SEC					  ; $85ce: 38	  
	RTS					  ; $85cf: 60	  
loc_85D0:
	BRK					  ; $85d0: 00	  
	.db $07			  ; $85d1 - Unknown opcode
	.db $6f			  ; $85d2 - Unknown opcode
	AND $56ad,X			  ; $85d3: 3D AD 56
	.db $73			  ; $85d6 - Unknown opcode
	STA $f9				  ; $85d7: 85 F9   
	LDA $7355				; $85d9: AD 55 73
	STA $fa				  ; $85dc: 85 FA   
	BRK					  ; $85de: 00	  
	.db $03			  ; $85df - Unknown opcode
	.db $0b			  ; $85e0 - Unknown opcode
	JSR $8752				; $85e1: 20 52 87 ; -> sub_8752
	JMP $8530				; $85e4: 4C 30 85
loc_85E7:
	JMP $8371				; $85e7: 4C 71 83

; ---- Subroutine at $85ea (Bank 17) ----
sub_85EA:
	LDA #$80				 ; $85ea: A9 80   
	STA $7354				; $85ec: 8D 54 73
	BNE $85f6				; $85ef: D0 05   
	LDA #$00				 ; $85f1: A9 00   
	STA $7354				; $85f3: 8D 54 73

; ---- Subroutine at $85f6 (Bank 17) ----
sub_85F6:
	LDA #$33				 ; $85f6: A9 33   
	LDX $7354				; $85f8: AE 54 73
	BPL $85ff				; $85fb: 10 02   
	LDA #$2e				 ; $85fd: A9 2E   
loc_85FF:
	LDX #$ff				 ; $85ff: A2 FF   
	BRK					  ; $8601: 00	  
	BRK					  ; $8602: 00	  
	.db $6f			  ; $8603 - Unknown opcode
	CMP #$ff				 ; $8604: C9 FF	; Compare with 255
	BEQ $8635				; $8606: F0 2D   
	CMP #$fe				 ; $8608: C9 FE	; Compare with 254
	BNE $8617				; $860a: D0 0B   
	LDA $7354				; $860c: AD 54 73
	EOR #$80				 ; $860f: 49 80   
	STA $7354				; $8611: 8D 54 73
	JMP $85f6				; $8614: 4C F6 85
loc_8617:
	PHA					  ; $8617: 48	  
	LDA $7354				; $8618: AD 54 73
	BMI $8627				; $861b: 30 0A   
	PLA					  ; $861d: 68	  
	TAX					  ; $861e: AA	  
	BRK					  ; $861f: 00	  
	PLA					  ; $8620: 68	  
	.db $73			  ; $8621 - Unknown opcode
	STA $7354				; $8622: 8D 54 73
	BPL $8633				; $8625: 10 0C   
loc_8627:
	PLA					  ; $8627: 68	  
	BRK					  ; $8628: 00	  
	.db $32			  ; $8629 - Unknown opcode
	.db $b3			  ; $862a - Unknown opcode
	ORA #$80				 ; $862b: 09 80   
	CLC					  ; $862d: 18	  
	ADC #$08				 ; $862e: 69 08	; Arithmetic
	STA $7354				; $8630: 8D 54 73
loc_8633:
	SEC					  ; $8633: 38	  
	RTS					  ; $8634: 60	  
loc_8635:
	CLC					  ; $8635: 18	  
	RTS					  ; $8636: 60	  

; ---- Subroutine at $8637 (Bank 17) ----
sub_8637:
	BIT $6e44				; $8637: 2C 44 6E
	BVS $86b3				; $863a: 70 77   
	LDX #$ff				 ; $863c: A2 FF   
	BRK					  ; $863e: 00	  
	AND #$c3				 ; $863f: 29 C3   
	ASL $0085				; $8641: 0E 85 00
	BRK					  ; $8644: 00	  
	AND #$c3				 ; $8645: 29 C3   
	BRK					  ; $8647: 00	  
	STA tmp1				 ; $8648: 85 01   
	BRK					  ; $864a: 00	  
	AND #$c3				 ; $864b: 29 C3   
	ORA $0105				; $864d: 0D 05 01
	STA tmp1				 ; $8650: 85 01   
	BRK					  ; $8652: 00	  
	AND #$c3				 ; $8653: 29 C3   
	.db $02			  ; $8655 - Unknown opcode
	ORA tmp1				 ; $8656: 05 01   
	STA tmp1				 ; $8658: 85 01   
	BRK					  ; $865a: 00	  
	AND #$c3				 ; $865b: 29 C3   
	ORA (ptr0_hi),Y		  ; $865d: 11 05   
	ORA ($25,X)			  ; $865f: 01 25   
	BRK					  ; $8661: 00	  
	CMP tmp0				 ; $8662: C5 00   
	BEQ $86b1				; $8664: F0 4B   
	LDA $6e44				; $8666: AD 44 6E
	AND #$03				 ; $8669: 29 03   
	CMP #$02				 ; $866b: C9 02	; Compare with 2
	BEQ $86b1				; $866d: F0 42   
	LDA $72e4				; $866f: AD E4 72
	AND #$03				 ; $8672: 29 03   
	CMP #$03				 ; $8674: C9 03	; Compare with 3
	BEQ $86b1				; $8676: F0 39   
	TAX					  ; $8678: AA	  
	LDA $8852,X			  ; $8679: BD 52 88
	STA tmp1				 ; $867c: 85 01   
	LDA #$00				 ; $867e: A9 00   
	STA tmp0				 ; $8680: 85 00   
	LSR tmp1				 ; $8682: 46 01   
	ROR tmp0				 ; $8684: 66 00   
	LSR tmp1				 ; $8686: 46 01   
	ROR tmp0				 ; $8688: 66 00   
	LSR tmp1				 ; $868a: 46 01   
	ROR tmp0				 ; $868c: 66 00   
	JSR $86b5				; $868e: 20 B5 86 ; -> sub_86B5
	LDA $75				  ; $8691: A5 75   
	SEC					  ; $8693: 38	  
	SBC $7396				; $8694: ED 96 73 ; Arithmetic
	BCS $869d				; $8697: B0 04   
	LDA #$08				 ; $8699: A9 08   
	BNE $86a5				; $869b: D0 08   
loc_869D:
	CMP #$05				 ; $869d: C9 05	; Compare with 5
	BCS $86b1				; $869f: B0 10   
	TAX					  ; $86a1: AA	  
	LDA $8856,X			  ; $86a2: BD 56 88
loc_86A5:
	LDX #$00				 ; $86a5: A2 00   
	JSR $c827				; $86a7: 20 27 C8 ; Call to fixed bank
	BRK					  ; $86aa: 00	  
	.db $1b			  ; $86ab - Unknown opcode
	.db $0f			  ; $86ac - Unknown opcode
	CMP tmp1				 ; $86ad: C5 01   
	BCC $86b3				; $86af: 90 02   
loc_86B1:
	SEC					  ; $86b1: 38	  
	RTS					  ; $86b2: 60	  
loc_86B3:
	CLC					  ; $86b3: 18	  
	RTS					  ; $86b4: 60	  

; ---- Subroutine at $86b5 (Bank 17) ----
sub_86B5:
	BRK					  ; $86b5: 00	  
	.db $64			  ; $86b6 - Unknown opcode
	.db $63			  ; $86b7 - Unknown opcode
	ORA #$ad				 ; $86b8: 09 AD   
	.db $5a			  ; $86ba - Unknown opcode
	ADC ($c9,X)			  ; $86bb: 61 C9	; Arithmetic
	.db $04			  ; $86bd - Unknown opcode
	BCC $86e1				; $86be: 90 21   
	LDA tmp0				 ; $86c0: A5 00   
	PHA					  ; $86c2: 48	  
	LDA tmp1				 ; $86c3: A5 01   
	PHA					  ; $86c5: 48	  
	LDA #$00				 ; $86c6: A9 00   
	BRK					  ; $86c8: 00	  
	ASL					  ; $86c9: 0A	  
	.db $2f			  ; $86ca - Unknown opcode
	BCS $86d5				; $86cb: B0 08   
	BRK					  ; $86cd: 00	  
	.db $64			  ; $86ce - Unknown opcode
	.db $63			  ; $86cf - Unknown opcode
	ORA #$a6				 ; $86d0: 09 A6   
	ADC $d0,X				; $86d2: 75 D0	; Arithmetic
	.db $04			  ; $86d4 - Unknown opcode
loc_86D5:
	BRK					  ; $86d5: 00	  
	.db $0f			  ; $86d6 - Unknown opcode
	.db $53			  ; $86d7 - Unknown opcode
	TAX					  ; $86d8: AA	  
	STX $75				  ; $86d9: 86 75   
	PLA					  ; $86db: 68	  
	STA tmp1				 ; $86dc: 85 01   
	PLA					  ; $86de: 68	  
	STA tmp0				 ; $86df: 85 00   
loc_86E1:
	RTS					  ; $86e1: 60	  

; ---- Subroutine at $86e2 (Bank 17) ----
sub_86E2:
	PHA					  ; $86e2: 48	  
	LDX $7356				; $86e3: AE 56 73
	BRK					  ; $86e6: 00	  
	LSR $93				  ; $86e7: 46 93   
	.db $1c			  ; $86e9 - Unknown opcode
	BCC $86f2				; $86ea: 90 06   
	LDA $73				  ; $86ec: A5 73   
	BRK					  ; $86ee: 00	  
	.db $67			  ; $86ef - Unknown opcode
	.db $73			  ; $86f0 - Unknown opcode
	TAX					  ; $86f1: AA	  
loc_86F2:
	PLA					  ; $86f2: 68	  
	RTS					  ; $86f3: 60	  

; ---- Subroutine at $86f4 (Bank 17) ----
sub_86F4:
	LDX $7356				; $86f4: AE 56 73
	BRK					  ; $86f7: 00	  
	PLA					  ; $86f8: 68	  
	.db $73			  ; $86f9 - Unknown opcode
	LDX $96				  ; $86fa: A6 96   
	STA $72f4,X			  ; $86fc: 9D F4 72
	RTS					  ; $86ff: 60	  

; ---- Subroutine at $8700 (Bank 17) ----
sub_8700:
	LDX $96				  ; $8700: A6 96   
	STA $7300,X			  ; $8702: 9D 00 73
	RTS					  ; $8705: 60	  

; ---- Subroutine at $8706 (Bank 17) ----
sub_8706:
	LDX $96				  ; $8706: A6 96   
	STA $7324,X			  ; $8708: 9D 24 73
	RTS					  ; $870b: 60	  

; ---- Subroutine at $870c (Bank 17) ----
sub_870C:
	LDX #$00				 ; $870c: A2 00   
loc_870E:
	BRK					  ; $870e: 00	  
	.db $2b			  ; $870f - Unknown opcode
	.db $73			  ; $8710 - Unknown opcode
	BEQ $871e				; $8711: F0 0B   
	BRK					  ; $8713: 00	  
	.db $62			  ; $8714 - Unknown opcode
	.db $63			  ; $8715 - Unknown opcode
	RTI					  ; $8716: 40	  
	INX					  ; $8717: E8	  
	CPX $72				  ; $8718: E4 72   
	BNE $870e				; $871a: D0 F2   
	CLC					  ; $871c: 18	  
	RTS					  ; $871d: 60	  
loc_871E:
	SEC					  ; $871e: 38	  
	RTS					  ; $871f: 60	  

; ---- Subroutine at $8720 (Bank 17) ----
sub_8720:
	LDX #$00				 ; $8720: A2 00   
loc_8722:
	BRK					  ; $8722: 00	  
	PLA					  ; $8723: 68	  
	.db $73			  ; $8724 - Unknown opcode
	STA $72f4,X			  ; $8725: 9D F4 72
	BRK					  ; $8728: 00	  
	LSR $93				  ; $8729: 46 93   
	CLC					  ; $872b: 18	  
	BCS $8748				; $872c: B0 1A   
	BRK					  ; $872e: 00	  
	LSR $93				  ; $872f: 46 93   
	ROL $b0				  ; $8731: 26 B0   
	.db $14			  ; $8733 - Unknown opcode
	BRK					  ; $8734: 00	  
	.db $2b			  ; $8735 - Unknown opcode
	.db $53			  ; $8736 - Unknown opcode
	CMP #$08				 ; $8737: C9 08	; Compare with 8
	BCC $8740				; $8739: 90 05   
	STX $96				  ; $873b: 86 96   
	JSR $8364				; $873d: 20 64 83 ; -> sub_8364
loc_8740:
	LDA $72f4,X			  ; $8740: BD F4 72
	ORA #$10				 ; $8743: 09 10   
	STA $72f4,X			  ; $8745: 9D F4 72
loc_8748:
	INX					  ; $8748: E8	  
	BRK					  ; $8749: 00	  
	.db $62			  ; $874a - Unknown opcode
	.db $63			  ; $874b - Unknown opcode
	RTI					  ; $874c: 40	  
	CPX $72				  ; $874d: E4 72   
	BNE $8722				; $874f: D0 D1   
	RTS					  ; $8751: 60	  

; ---- Subroutine at $8752 (Bank 17) ----
sub_8752:
	LDX #$39				 ; $8752: A2 39   
	JMP $c90c				; $8754: 4C 0C C9

; ---- Subroutine at $8757 (Bank 17) ----
sub_8757:
	BRK					  ; $8757: 00	  
	.db $07			  ; $8758 - Unknown opcode
	.db $6f			  ; $8759 - Unknown opcode
	.db $3b			  ; $875a - Unknown opcode
	CMP #$ff				 ; $875b: C9 FF	; Compare with 255
	BEQ $8776				; $875d: F0 17   
	STA $7358				; $875f: 8D 58 73
	LDA $7357				; $8762: AD 57 73
	CMP #$ff				 ; $8765: C9 FF	; Compare with 255
	BNE $8771				; $8767: D0 08   
	BRK					  ; $8769: 00	  
	.db $07			  ; $876a - Unknown opcode
	.db $6f			  ; $876b - Unknown opcode
	.db $3c			  ; $876c - Unknown opcode
	CMP #$ff				 ; $876d: C9 FF	; Compare with 255
	BEQ $8776				; $876f: F0 05   
loc_8771:
	STA $7359				; $8771: 8D 59 73
	SEC					  ; $8774: 38	  
	RTS					  ; $8775: 60	  
loc_8776:
	CLC					  ; $8776: 18	  
	RTS					  ; $8777: 60	  

; ---- Subroutine at $8778 (Bank 17) ----
sub_8778:
	BRK					  ; $8778: 00	  
	BRK					  ; $8779: 00	  
	.db $6f			  ; $877a - Unknown opcode
	CMP #$ff				 ; $877b: C9 FF	; Compare with 255
	BEQ $8784				; $877d: F0 05   
	STA $7357				; $877f: 8D 57 73
	SEC					  ; $8782: 38	  
	RTS					  ; $8783: 60	  
loc_8784:
	CLC					  ; $8784: 18	  
	RTS					  ; $8785: 60	  

; ---- Subroutine at $8786 (Bank 17) ----
sub_8786:
	PHA					  ; $8786: 48	  
	TXA					  ; $8787: 8A	  
	PHA					  ; $8788: 48	  
	TYA					  ; $8789: 98	  
	PHA					  ; $878a: 48	  
	JSR $87e6				; $878b: 20 E6 87 ; -> sub_87E6
	LDX #$04				 ; $878e: A2 04   
	LDA $6e45				; $8790: AD 45 6E
	CMP #$ae				 ; $8793: C9 AE	; Compare with 174
	BEQ $879b				; $8795: F0 04   
	CMP #$bc				 ; $8797: C9 BC	; Compare with 188
	BNE $879c				; $8799: D0 01   
loc_879B:
	DEX					  ; $879b: CA	  
loc_879C:
	TXA					  ; $879c: 8A	  
	ASL					  ; $879d: 0A	  
	ASL					  ; $879e: 0A	  
	ASL					  ; $879f: 0A	  
	ASL					  ; $87a0: 0A	  
	ORA #$01				 ; $87a1: 09 01   
	STA $04f2				; $87a3: 8D F2 04
	LDA #$1e				 ; $87a6: A9 1E   
	STA $04f3				; $87a8: 8D F3 04
	TXA					  ; $87ab: 8A	  
	PHA					  ; $87ac: 48	  
	BRK					  ; $87ad: 00	  
	.db $12			  ; $87ae - Unknown opcode
	.db $df			  ; $87af - Unknown opcode
	PLA					  ; $87b0: 68	  
	TAX					  ; $87b1: AA	  
	DEX					  ; $87b2: CA	  
	BNE $879c				; $87b3: D0 E7   
	PLA					  ; $87b5: 68	  
	TAY					  ; $87b6: A8	  
	PLA					  ; $87b7: 68	  
	TAX					  ; $87b8: AA	  
	PLA					  ; $87b9: 68	  
	RTS					  ; $87ba: 60	  

; ---- Subroutine at $87bb (Bank 17) ----
sub_87BB:
	PHA					  ; $87bb: 48	  
	TXA					  ; $87bc: 8A	  
	PHA					  ; $87bd: 48	  
	TYA					  ; $87be: 98	  
	PHA					  ; $87bf: 48	  
	JSR $87e6				; $87c0: 20 E6 87 ; -> sub_87E6
	LDX #$0d				 ; $87c3: A2 0D   
loc_87C5:
	TXA					  ; $87c5: 8A	  
	ASL					  ; $87c6: 0A	  
	ASL					  ; $87c7: 0A	  
	ASL					  ; $87c8: 0A	  
	ASL					  ; $87c9: 0A	  
	ORA #$01				 ; $87ca: 09 01   
	STA $04f2				; $87cc: 8D F2 04
	LDA #$1e				 ; $87cf: A9 1E   
	STA $04f3				; $87d1: 8D F3 04
	TXA					  ; $87d4: 8A	  
	PHA					  ; $87d5: 48	  
	BRK					  ; $87d6: 00	  
	.db $13			  ; $87d7 - Unknown opcode
	.db $df			  ; $87d8 - Unknown opcode
	PLA					  ; $87d9: 68	  
	TAX					  ; $87da: AA	  
	DEX					  ; $87db: CA	  
	CPX #$08				 ; $87dc: E0 08   
	BNE $87c5				; $87de: D0 E5   
	PLA					  ; $87e0: 68	  
	TAY					  ; $87e1: A8	  
	PLA					  ; $87e2: 68	  
	TAX					  ; $87e3: AA	  
	PLA					  ; $87e4: 68	  
	RTS					  ; $87e5: 60	  

; ---- Subroutine at $87e6 (Bank 17) ----
sub_87E6:
	LDA #$00				 ; $87e6: A9 00   
	TAX					  ; $87e8: AA	  
loc_87E9:
	STA $0480,X			  ; $87e9: 9D 80 04
	INX					  ; $87ec: E8	  
	CPX #$40				 ; $87ed: E0 40   
	BNE $87e9				; $87ef: D0 F8   
	TAX					  ; $87f1: AA	  
loc_87F2:
	STA $04e0,X			  ; $87f2: 9D E0 04
	INX					  ; $87f5: E8	  
	CPX #$10				 ; $87f6: E0 10   
	BNE $87f2				; $87f8: D0 F8   
	RTS					  ; $87fa: 60	  

; ---- Subroutine at $87fb (Bank 17) ----
sub_87FB:
	LDA #$ff				 ; $87fb: A9 FF   
	STA $7357				; $87fd: 8D 57 73
	STA $7358				; $8800: 8D 58 73
	STA $7359				; $8803: 8D 59 73
	STA $735a				; $8806: 8D 5A 73
	RTS					  ; $8809: 60	  

; ---- Subroutine at $880a (Bank 17) ----
sub_880A:
	STA tmp1				 ; $880a: 85 01   
	LDX #$00				 ; $880c: A2 00   
	STX tmp2				 ; $880e: 86 02   
loc_8810:
	LDA tmp1				 ; $8810: A5 01   
	BRK					  ; $8812: 00	  
	LSR map_number		   ; $8813: 46 63   
	EOR ($90,X)			  ; $8815: 41 90   
	.db $02			  ; $8817 - Unknown opcode
	INC tmp2				 ; $8818: E6 02   
	INX					  ; $881a: E8	  
	CPX tmp0				 ; $881b: E4 00   
	BCC $8810				; $881d: 90 F1   
	LDA tmp2				 ; $881f: A5 02   
	CMP tmp0				 ; $8821: C5 00   
	RTS					  ; $8823: 60	  
	ROL $35,X				; $8824: 36 35   
	.db $34			  ; $8826 - Unknown opcode
	.db $2f			  ; $8827 - Unknown opcode
	BMI $885b				; $8828: 30 31   
	.db $32			  ; $882a - Unknown opcode
	BRK					  ; $882b: 00	  
	ORA (ptr0_lo,X)		  ; $882c: 01 04   
	.db $02			  ; $882e - Unknown opcode
	ORA ptr1_lo			  ; $882f: 05 06   
	.db $07			  ; $8831 - Unknown opcode
	PHP					  ; $8832: 08	  
	BRK					  ; $8833: 00	  
	.db $04			  ; $8834 - Unknown opcode
	.db $03			  ; $8835 - Unknown opcode
	.db $02			  ; $8836 - Unknown opcode
	ORA ptr1_lo			  ; $8837: 05 06   
	.db $07			  ; $8839 - Unknown opcode
	PHP					  ; $883a: 08	  
	BRK					  ; $883b: 00	  
	ORA (tmp3,X)			 ; $883c: 01 03   
	.db $02			  ; $883e - Unknown opcode
	ORA ptr1_lo			  ; $883f: 05 06   
	.db $07			  ; $8841 - Unknown opcode
	PHP					  ; $8842: 08	  
	BRK					  ; $8843: 00	  
	.db $03			  ; $8844 - Unknown opcode
	.db $02			  ; $8845 - Unknown opcode
	PHP					  ; $8846: 08	  
	ORA ptr1_lo			  ; $8847: 05 06   
	.db $07			  ; $8849 - Unknown opcode
	BRK					  ; $884a: 00	  
	BRK					  ; $884b: 00	  
	ORA (tmp2,X)			 ; $884c: 01 02   
	BRK					  ; $884e: 00	  
	ORA (tmp0,X)			 ; $884f: 01 00   
	.db $02			  ; $8851 - Unknown opcode
	.db $80			  ; $8852 - Unknown opcode
	.db $80			  ; $8853 - Unknown opcode
	RTI					  ; $8854: 40	  
	BRK					  ; $8855: 00	  
	PHP					  ; $8856: 08	  
	.db $07			  ; $8857 - Unknown opcode
	ASL ptr0_hi			  ; $8858: 06 05   
	.db $04			  ; $885a - Unknown opcode

; ---- Subroutine at $885b (Bank 17) ----
sub_885B:
	JSR $80c4				; $885b: 20 C4 80 ; -> sub_80C4
	BCC $887d				; $885e: 90 1D   
	BRK					  ; $8860: 00	  
	.db $07			  ; $8861 - Unknown opcode
	.db $6f			  ; $8862 - Unknown opcode
	AND $00a9,X			  ; $8863: 3D A9 00
	STA $735b				; $8866: 8D 5B 73
loc_8869:
	LDX #$00				 ; $8869: A2 00   
loc_886B:
	LDA $7348,X			  ; $886b: BD 48 73
	AND #$0f				 ; $886e: 29 0F   
	CMP $735b				; $8870: CD 5B 73
	BEQ $887e				; $8873: F0 09   
	INX					  ; $8875: E8	  
	CPX #$0c				 ; $8876: E0 0C   
	BNE $886b				; $8878: D0 F1   
	JSR $bc5a				; $887a: 20 5A BC ; -> sub_BC5A
loc_887D:
	RTS					  ; $887d: 60	  
loc_887E:
	STX $96				  ; $887e: 86 96   
	INC $735b				; $8880: EE 5B 73
	BRK					  ; $8883: 00	  
	.db $2b			  ; $8884 - Unknown opcode
	.db $2f			  ; $8885 - Unknown opcode
	JSR $80c4				; $8886: 20 C4 80 ; -> sub_80C4
	BCC $887d				; $8889: 90 F2   
	JSR $bc5a				; $888b: 20 5A BC ; -> sub_BC5A
	JSR $8894				; $888e: 20 94 88 ; -> sub_8894
	JMP $8869				; $8891: 4C 69 88

; ---- Subroutine at $8894 (Bank 17) ----
sub_8894:
	JSR $8d9d				; $8894: 20 9D 8D ; -> sub_8D9D
	BCC $88c6				; $8897: 90 2D   
	JSR $8dab				; $8899: 20 AB 8D ; -> sub_8DAB
	BCC $88c6				; $889c: 90 28   
	JSR $8dcc				; $889e: 20 CC 8D ; -> sub_8DCC
	BCC $88c6				; $88a1: 90 23   
	BRK					  ; $88a3: 00	  
	.db $04			  ; $88a4 - Unknown opcode
	.db $1f			  ; $88a5 - Unknown opcode
	CMP #$02				 ; $88a6: C9 02	; Compare with 2
	BCS $88c6				; $88a8: B0 1C   
	JSR $8ddc				; $88aa: 20 DC 8D ; -> sub_8DDC
	JSR $89f1				; $88ad: 20 F1 89 ; -> sub_89F1
	BCC $88c6				; $88b0: 90 14   
	JSR $bba1				; $88b2: 20 A1 BB ; -> sub_BBA1
	JSR $bbdf				; $88b5: 20 DF BB ; -> sub_BBDF
	BCC $88c6				; $88b8: 90 0C   
	JSR $bbed				; $88ba: 20 ED BB ; -> sub_BBED
	BCC $88c6				; $88bd: 90 07   
	JSR $88ca				; $88bf: 20 CA 88 ; -> sub_88CA
	JSR $a3f7				; $88c2: 20 F7 A3 ; -> sub_A3F7
	RTS					  ; $88c5: 60	  
loc_88C6:
	JSR $ac4d				; $88c6: 20 4D AC ; -> sub_AC4D
	RTS					  ; $88c9: 60	  

; ---- Subroutine at $88ca (Bank 17) ----
sub_88CA:
	LDA $615a				; $88ca: AD 5A 61
	CMP #$04				 ; $88cd: C9 04	; Compare with 4
	BCC $88d4				; $88cf: 90 03   
	BRK					  ; $88d1: 00	  
	BRK					  ; $88d2: 00	  
	.db $3f			  ; $88d3 - Unknown opcode
loc_88D4:
	JSR $8a3a				; $88d4: 20 3A 8A ; -> sub_8A3A
loc_88D7:
	JSR $8ddc				; $88d7: 20 DC 8D ; -> sub_8DDC
	JSR $8a55				; $88da: 20 55 8A ; -> sub_8A55
	JSR $8acf				; $88dd: 20 CF 8A ; -> sub_8ACF
	BCC $8924				; $88e0: 90 42   
	JSR $ad25				; $88e2: 20 25 AD ; -> sub_AD25
	BCC $8924				; $88e5: 90 3D   
	JSR $b286				; $88e7: 20 86 B2 ; -> sub_B286
	JSR $b52d				; $88ea: 20 2D B5 ; -> sub_B52D
	JSR $b871				; $88ed: 20 71 B8 ; -> sub_B871
	BCC $8924				; $88f0: 90 32   
	JSR $bcf1				; $88f2: 20 F1 BC ; -> sub_BCF1
	BCC $8924				; $88f5: 90 2D   
	JSR $8de5				; $88f7: 20 E5 8D ; -> sub_8DE5
	JSR $abb5				; $88fa: 20 B5 AB ; -> sub_ABB5
	BCC $8924				; $88fd: 90 25   
	JSR $afff				; $88ff: 20 FF AF ; -> sub_AFFF
	JSR $8c49				; $8902: 20 49 8C ; -> sub_8C49
	BCC $8924				; $8905: 90 1D   
	JSR $b2f5				; $8907: 20 F5 B2 ; -> sub_B2F5
	BCC $8924				; $890a: 90 18   
	JSR $893a				; $890c: 20 3A 89 ; -> sub_893A
	JSR $ac3a				; $890f: 20 3A AC ; -> sub_AC3A
	JSR $80c4				; $8912: 20 C4 80 ; -> sub_80C4
	BCC $8924				; $8915: 90 0D   
	INC $735c				; $8917: EE 5C 73
	LDA $735c				; $891a: AD 5C 73
	CMP $735d				; $891d: CD 5D 73
	BCC $88d7				; $8920: 90 B5   
	BCS $8927				; $8922: B0 03   
loc_8924:
	JSR $ac4d				; $8924: 20 4D AC ; -> sub_AC4D
loc_8927:
	BRK					  ; $8927: 00	  
	ASL system_flags		 ; $8928: 06 1F   
	BCC $8939				; $892a: 90 0D   
	BRK					  ; $892c: 00	  
	.db $23			  ; $892d - Unknown opcode
	.db $a3			  ; $892e - Unknown opcode
	CMP #$02				 ; $892f: C9 02	; Compare with 2
	BCS $8939				; $8931: B0 06   
	BRK					  ; $8933: 00	  
	ORA $000f,X			  ; $8934: 1D 0F 00
	ASL $600f,X			  ; $8937: 1E 0F 60

; ---- Subroutine at $893a (Bank 17) ----
sub_893A:
	BRK					  ; $893a: 00	  
	.db $03			  ; $893b - Unknown opcode
	.db $1f			  ; $893c - Unknown opcode
	BRK					  ; $893d: 00	  
	ASL $c93f				; $893e: 0E 3F C9
	.db $02			  ; $8941 - Unknown opcode
	BCC $89a7				; $8942: 90 63   
	CMP #$03				 ; $8944: C9 03	; Compare with 3
	BEQ $8952				; $8946: F0 0A   
	BRK					  ; $8948: 00	  
	ORA (system_flags,X)	 ; $8949: 01 1F   
	BMI $8952				; $894b: 30 05   
	BRK					  ; $894d: 00	  
	ASL $301f				; $894e: 0E 1F 30
	EOR $20,X				; $8951: 55 20   
	.db $dc			  ; $8953 - Unknown opcode
	LDY $4a90				; $8954: AC 90 4A
	LDA #$00				 ; $8957: A9 00   
	STA $735e				; $8959: 8D 5E 73
loc_895C:
	JSR $904a				; $895c: 20 4A 90 ; -> sub_904A
	JSR $9611				; $895f: 20 11 96 ; -> sub_9611
	BCC $8989				; $8962: 90 25   
	JSR $acbf				; $8964: 20 BF AC ; -> sub_ACBF
	BCC $8989				; $8967: 90 20   
	JSR $ac79				; $8969: 20 79 AC ; -> sub_AC79
	BCC $8989				; $896c: 90 1B   
	JSR $8d0d				; $896e: 20 0D 8D ; -> sub_8D0D
	BCC $8989				; $8971: 90 16   
	JSR $ad51				; $8973: 20 51 AD ; -> sub_AD51
	BCC $8989				; $8976: 90 11   
	JSR $8c88				; $8978: 20 88 8C ; -> sub_8C88
	JSR $80c4				; $897b: 20 C4 80 ; -> sub_80C4
	BCC $8986				; $897e: 90 06   
	JSR $a873				; $8980: 20 73 A8 ; -> sub_A873
	JSR $a8bc				; $8983: 20 BC A8 ; -> sub_A8BC
loc_8986:
	JSR $a3f7				; $8986: 20 F7 A3 ; -> sub_A3F7
loc_8989:
	JSR $80c4				; $8989: 20 C4 80 ; -> sub_80C4
	BCC $89a1				; $898c: 90 13   
	BRK					  ; $898e: 00	  
	.db $02			  ; $898f - Unknown opcode
	.db $1f			  ; $8990 - Unknown opcode
	BMI $8997				; $8991: 30 04   
	LDA #$04				 ; $8993: A9 04   
	BNE $8999				; $8995: D0 02   
loc_8997:
	LDA #$08				 ; $8997: A9 08   
loc_8999:
	INC $735e				; $8999: EE 5E 73
	CMP $735e				; $899c: CD 5E 73
	BNE $895c				; $899f: D0 BB   
loc_89A1:
	JSR $a3f7				; $89a1: 20 F7 A3 ; -> sub_A3F7
	JMP $8caf				; $89a4: 4C AF 8C
loc_89A7:
	JSR $904a				; $89a7: 20 4A 90 ; -> sub_904A
	JSR $9518				; $89aa: 20 18 95 ; -> sub_9518
	BCC $89eb				; $89ad: 90 3C   
	BRK					  ; $89af: 00	  
	.db $07			  ; $89b0 - Unknown opcode
	.db $1f			  ; $89b1 - Unknown opcode
	BCS $89bd				; $89b2: B0 09   
	BVS $89bd				; $89b4: 70 07   
	BRK					  ; $89b6: 00	  
	CPX $d3				  ; $89b7: E4 D3   
	ADC $eb4c				; $89b9: 6D 4C EB ; Arithmetic
	.db $89			  ; $89bc - Unknown opcode
loc_89BD:
	BRK					  ; $89bd: 00	  
	.db $03			  ; $89be - Unknown opcode
	.db $1f			  ; $89bf - Unknown opcode
	CMP #$43				 ; $89c0: C9 43	; Compare with 67
	BNE $89c9				; $89c2: D0 05   
	BRK					  ; $89c4: 00	  
	.db $07			  ; $89c5 - Unknown opcode
	.db $1f			  ; $89c6 - Unknown opcode
	BCS $89ce				; $89c7: B0 05   
loc_89C9:
	JSR $acbf				; $89c9: 20 BF AC ; -> sub_ACBF
	BCC $89eb				; $89cc: 90 1D   
loc_89CE:
	JSR $ac79				; $89ce: 20 79 AC ; -> sub_AC79
	BCC $89eb				; $89d1: 90 18   
	JSR $8d0d				; $89d3: 20 0D 8D ; -> sub_8D0D
	BCC $89eb				; $89d6: 90 13   
	JSR $ad51				; $89d8: 20 51 AD ; -> sub_AD51
	BCC $89eb				; $89db: 90 0E   
	JSR $8c88				; $89dd: 20 88 8C ; -> sub_8C88
	JSR $80c4				; $89e0: 20 C4 80 ; -> sub_80C4
	BCC $89eb				; $89e3: 90 06   
	JSR $a873				; $89e5: 20 73 A8 ; -> sub_A873
	JSR $a8bc				; $89e8: 20 BC A8 ; -> sub_A8BC
loc_89EB:
	JSR $a3f7				; $89eb: 20 F7 A3 ; -> sub_A3F7
	JMP $8caf				; $89ee: 4C AF 8C

; ---- Subroutine at $89f1 (Bank 17) ----
sub_89F1:
	LDA $72e5				; $89f1: AD E5 72
	BPL $8a1f				; $89f4: 10 29   
	LDA $72e6				; $89f6: AD E6 72
	AND #$0f				 ; $89f9: 29 0F   
	STA tmp0				 ; $89fb: 85 00   
	BRK					  ; $89fd: 00	  
	.db $67			  ; $89fe - Unknown opcode
	.db $73			  ; $89ff - Unknown opcode
	BVC $8a21				; $8a00: 50 1F   
	BRK					  ; $8a02: 00	  
	ORA (system_flags,X)	 ; $8a03: 01 1F   
	CMP tmp0				 ; $8a05: C5 00   
	BNE $8a38				; $8a07: D0 2F   
	LDA $72e6				; $8a09: AD E6 72
	AND #$c0				 ; $8a0c: 29 C0   
	BEQ $8a21				; $8a0e: F0 11   
	SEC					  ; $8a10: 38	  
	SBC #$40				 ; $8a11: E9 40	; Arithmetic
	STA tmp0				 ; $8a13: 85 00   
	LDA $72e6				; $8a15: AD E6 72
	AND #$3f				 ; $8a18: 29 3F   
	ORA tmp0				 ; $8a1a: 05 00   
	STA $72e6				; $8a1c: 8D E6 72
loc_8A1F:
	SEC					  ; $8a1f: 38	  
	RTS					  ; $8a20: 60	  
loc_8A21:
	LDA $72e5				; $8a21: AD E5 72
	AND #$7f				 ; $8a24: 29 7F   
	STA $72e5				; $8a26: 8D E5 72
	BRK					  ; $8a29: 00	  
	SBC ($d3,X)			  ; $8a2a: E1 D3	; Arithmetic
	.db $89			  ; $8a2c - Unknown opcode
	JSR $9053				; $8a2d: 20 53 90 ; -> sub_9053
	LDA $6e44				; $8a30: AD 44 6E
	ORA #$03				 ; $8a33: 09 03   
	STA $6e44				; $8a35: 8D 44 6E
loc_8A38:
	CLC					  ; $8a38: 18	  
	RTS					  ; $8a39: 60	  

; ---- Subroutine at $8a3a (Bank 17) ----
sub_8A3A:
	LDX #$00				 ; $8a3a: A2 00   
	STX $735c				; $8a3c: 8E 5C 73
	INX					  ; $8a3f: E8	  
	LDA $96				  ; $8a40: A5 96   
	CMP #$04				 ; $8a42: C9 04	; Compare with 4
	BCC $8a51				; $8a44: 90 0B   
	TAX					  ; $8a46: AA	  
	LDA $7348,X			  ; $8a47: BD 48 73
	AND #$f0				 ; $8a4a: 29 F0   
	LSR					  ; $8a4c: 4A	  
	LSR					  ; $8a4d: 4A	  
	LSR					  ; $8a4e: 4A	  
	LSR					  ; $8a4f: 4A	  
	TAX					  ; $8a50: AA	  
loc_8A51:
	STX $735d				; $8a51: 8E 5D 73
	RTS					  ; $8a54: 60	  

; ---- Subroutine at $8a55 (Bank 17) ----
sub_8A55:
	BRK					  ; $8a55: 00	  
	ASL system_flags		 ; $8a56: 06 1F   
	BCC $8a76				; $8a58: 90 1C   
	BRK					  ; $8a5a: 00	  
	AND #$c3				 ; $8a5b: 29 C3   
	.db $02			  ; $8a5d - Unknown opcode
	BCS $8a67				; $8a5e: B0 07   
	BRK					  ; $8a60: 00	  
	.db $23			  ; $8a61 - Unknown opcode
	.db $a3			  ; $8a62 - Unknown opcode
	CMP #$02				 ; $8a63: C9 02	; Compare with 2
	BCC $8aaf				; $8a65: 90 48   
loc_8A67:
	LDA $735c				; $8a67: AD 5C 73
	STA tmp1				 ; $8a6a: 85 01   
	BRK					  ; $8a6c: 00	  
	.db $33			  ; $8a6d - Unknown opcode
	.db $0f			  ; $8a6e - Unknown opcode
	BRK					  ; $8a6f: 00	  
	ORA $000f,X			  ; $8a70: 1D 0F 00
	ASL $600f,X			  ; $8a73: 1E 0F 60
loc_8A76:
	BRK					  ; $8a76: 00	  
	.db $2b			  ; $8a77 - Unknown opcode
	.db $53			  ; $8a78 - Unknown opcode
	CMP #$08				 ; $8a79: C9 08	; Compare with 8
	BCC $8ab0				; $8a7b: 90 33   
	BRK					  ; $8a7d: 00	  
	LSR $93				  ; $8a7e: 46 93   
	.db $12			  ; $8a80 - Unknown opcode
	BCS $8aa7				; $8a81: B0 24   
	BRK					  ; $8a83: 00	  
	LSR $93				  ; $8a84: 46 93   
	CLC					  ; $8a86: 18	  
	BCS $8abd				; $8a87: B0 34   
	BRK					  ; $8a89: 00	  
	LSR $93				  ; $8a8a: 46 93   
	ROL $b0				  ; $8a8c: 26 B0   
	.db $33			  ; $8a8e - Unknown opcode
	LDA #$23				 ; $8a8f: A9 23   
	STA $6e59				; $8a91: 8D 59 6E
	BRK					  ; $8a94: 00	  
	BRK					  ; $8a95: 00	  
	.db $53			  ; $8a96 - Unknown opcode
	LDY #$05				 ; $8a97: A0 05   
	LDA ($79),Y			  ; $8a99: B1 79   
	BRK					  ; $8a9b: 00	  
loc_8A9C:
	AND $0f				  ; $8a9c: 25 0F   
	AND #$c0				 ; $8a9e: 29 C0   
	ASL					  ; $8aa0: 0A	  
	ROL					  ; $8aa1: 2A	  
	ROL					  ; $8aa2: 2A	  
	CMP #$02				 ; $8aa3: C9 02	; Compare with 2
	BCC $8aaf				; $8aa5: 90 08   
loc_8AA7:
	LDA $735c				; $8aa7: AD 5C 73
	STA tmp1				 ; $8aaa: 85 01   
	BRK					  ; $8aac: 00	  
	.db $34			  ; $8aad - Unknown opcode
	.db $0f			  ; $8aae - Unknown opcode
loc_8AAF:
	RTS					  ; $8aaf: 60	  
loc_8AB0:
	BRK					  ; $8ab0: 00	  
	LSR $93				  ; $8ab1: 46 93   
	CLC					  ; $8ab3: 18	  
	BCS $8abd				; $8ab4: B0 07   
	BRK					  ; $8ab6: 00	  
	LSR $93				  ; $8ab7: 46 93   
	ROL $b0				  ; $8ab9: 26 B0   
	ASL $60				  ; $8abb: 06 60   
loc_8ABD:
	LDA #$c3				 ; $8abd: A9 C3   
	JMP $8ac4				; $8abf: 4C C4 8A
	LDA #$c4				 ; $8ac2: A9 C4   
loc_8AC4:
	PHA					  ; $8ac4: 48	  
	LDA $735c				; $8ac5: AD 5C 73
	STA tmp1				 ; $8ac8: 85 01   
	PLA					  ; $8aca: 68	  
	BRK					  ; $8acb: 00	  
	AND $600f,Y			  ; $8acc: 39 0F 60

; ---- Subroutine at $8acf (Bank 17) ----
sub_8ACF:
	BRK					  ; $8acf: 00	  
	ASL system_flags		 ; $8ad0: 06 1F   
	BCS $8b1f				; $8ad2: B0 4B   
	BRK					  ; $8ad4: 00	  
	.db $04			  ; $8ad5 - Unknown opcode
	.db $1f			  ; $8ad6 - Unknown opcode
	CMP #$02				 ; $8ad7: C9 02	; Compare with 2
	BCS $8b17				; $8ad9: B0 3C   
	BRK					  ; $8adb: 00	  
	LSR $93				  ; $8adc: 46 93   
	.db $07			  ; $8ade - Unknown opcode
	BCC $8b17				; $8adf: 90 36   
	BRK					  ; $8ae1: 00	  
	LSR $93				  ; $8ae2: 46 93   
	ASL $b0				  ; $8ae4: 06 B0   
	.db $42			  ; $8ae6 - Unknown opcode
	BRK					  ; $8ae7: 00	  
	LSR $93				  ; $8ae8: 46 93   
	BPL $8a9c				; $8aea: 10 B0   
	BIT $4500				; $8aec: 2C 00 45
	.db $93			  ; $8aef - Unknown opcode
	ORA ($b0),Y			  ; $8af0: 11 B0   
	PHA					  ; $8af2: 48	  
	BRK					  ; $8af3: 00	  
	EOR $93				  ; $8af4: 45 93   
	.db $23			  ; $8af6 - Unknown opcode
	BCS $8b6d				; $8af7: B0 74   
	BRK					  ; $8af9: 00	  
	EOR $93				  ; $8afa: 45 93   
	BIT $b0				  ; $8afc: 24 B0   
	.db $74			  ; $8afe - Unknown opcode
	BRK					  ; $8aff: 00	  
	EOR $93				  ; $8b00: 45 93   
	AND $b0				  ; $8b02: 25 B0   
	.db $74			  ; $8b04 - Unknown opcode
	BRK					  ; $8b05: 00	  
	LSR $93				  ; $8b06: 46 93   
	.db $12			  ; $8b08 - Unknown opcode
	BCS $8b59				; $8b09: B0 4E   
	BRK					  ; $8b0b: 00	  
	.db $3b			  ; $8b0c - Unknown opcode
	.db $93			  ; $8b0d - Unknown opcode
	.db $03			  ; $8b0e - Unknown opcode
	BCC $8b15				; $8b0f: 90 04   
	CMP #$cc				 ; $8b11: C9 CC	; Compare with 204
	BEQ $8b91				; $8b13: F0 7C   
loc_8B15:
	SEC					  ; $8b15: 38	  
	RTS					  ; $8b16: 60	  
loc_8B17:
	CLC					  ; $8b17: 18	  
	RTS					  ; $8b18: 60	  
	JMP $8b97				; $8b19: 4C 97 8B
loc_8B1C:
	JMP $8bbe				; $8b1c: 4C BE 8B
loc_8B1F:
	BRK					  ; $8b1f: 00	  
	AND #$c3				 ; $8b20: 29 C3   
	ASL $f290				; $8b22: 0E 90 F2
	BRK					  ; $8b25: 00	  
	AND #$c3				 ; $8b26: 29 C3   
	ORA $60b0				; $8b28: 0D B0 60
	BRK					  ; $8b2b: 00	  
	AND #$c3				 ; $8b2c: 29 C3   
	ORA ($b0),Y			  ; $8b2e: 11 B0   
	BIT $2900				; $8b30: 2C 00 29
	.db $c3			  ; $8b33 - Unknown opcode
	BRK					  ; $8b34: 00	  
	BCS $8b1c				; $8b35: B0 E5   
	BRK					  ; $8b37: 00	  
	.db $2b			  ; $8b38 - Unknown opcode
	.db $c3			  ; $8b39 - Unknown opcode
	ORA ($b0,X)			  ; $8b3a: 01 B0   
	PHA					  ; $8b3c: 48	  
	BRK					  ; $8b3d: 00	  
	.db $2b			  ; $8b3e - Unknown opcode
	.db $c3			  ; $8b3f - Unknown opcode
	.db $14			  ; $8b40 - Unknown opcode
	BCS $8b6d				; $8b41: B0 2A   
	BRK					  ; $8b43: 00	  
	.db $2b			  ; $8b44 - Unknown opcode
	.db $c3			  ; $8b45 - Unknown opcode
	ORA $b0,X				; $8b46: 15 B0   
	ROL					  ; $8b48: 2A	  
	BRK					  ; $8b49: 00	  
	.db $2b			  ; $8b4a - Unknown opcode
	.db $c3			  ; $8b4b - Unknown opcode
	ASL $b0,X				; $8b4c: 16 B0   
	ROL					  ; $8b4e: 2A	  
	BRK					  ; $8b4f: 00	  
	.db $2b			  ; $8b50 - Unknown opcode
	.db $c3			  ; $8b51 - Unknown opcode
	.db $17			  ; $8b52 - Unknown opcode
	BCS $8b7f				; $8b53: B0 2A   
	BRK					  ; $8b55: 00	  
	AND #$c3				 ; $8b56: 29 C3   
	.db $02			  ; $8b58 - Unknown opcode
loc_8B59:
	BCS $8b91				; $8b59: B0 36   
	SEC					  ; $8b5b: 38	  
	RTS					  ; $8b5c: 60	  
	BRK					  ; $8b5d: 00	  
	BIT $11c3				; $8b5e: 2C C3 11
	BRK					  ; $8b61: 00	  
	AND #$c3				 ; $8b62: 29 C3   
	ORA ($b0),Y			  ; $8b64: 11 B0   
	.db $04			  ; $8b66 - Unknown opcode
	BRK					  ; $8b67: 00	  
	SBC ($d3,X)			  ; $8b68: E1 D3	; Arithmetic
	.db $fa			  ; $8b6a - Unknown opcode
	CLC					  ; $8b6b: 18	  
	RTS					  ; $8b6c: 60	  
loc_8B6D:
	BRK					  ; $8b6d: 00	  
	SBC ($d3,X)			  ; $8b6e: E1 D3	; Arithmetic
	SBC #$18				 ; $8b70: E9 18	; Arithmetic
	RTS					  ; $8b72: 60	  
	BRK					  ; $8b73: 00	  
	CPX #$d3				 ; $8b74: E0 D3   
	BIT $18				  ; $8b76: 24 18   
	RTS					  ; $8b78: 60	  
	BRK					  ; $8b79: 00	  
	CPX #$d3				 ; $8b7a: E0 D3   
	AND $18				  ; $8b7c: 25 18   
	RTS					  ; $8b7e: 60	  
loc_8B7F:
	BRK					  ; $8b7f: 00	  
	CPX #$d3				 ; $8b80: E0 D3   
	ROL $18				  ; $8b82: 26 18   
	RTS					  ; $8b84: 60	  
	BRK					  ; $8b85: 00	  
	CPX #$d3				 ; $8b86: E0 D3   
	.db $27			  ; $8b88 - Unknown opcode
	CLC					  ; $8b89: 18	  
	RTS					  ; $8b8a: 60	  
	BRK					  ; $8b8b: 00	  
	CPX #$d3				 ; $8b8c: E0 D3   
	ORA ($18),Y			  ; $8b8e: 11 18   
	RTS					  ; $8b90: 60	  
loc_8B91:
	BRK					  ; $8b91: 00	  
	CPX #$d3				 ; $8b92: E0 D3   
	.db $14			  ; $8b94 - Unknown opcode
	SEC					  ; $8b95: 38	  
	RTS					  ; $8b96: 60	  
loc_8B97:
	LDX $73				  ; $8b97: A6 73   
	BRK					  ; $8b99: 00	  
	.db $03			  ; $8b9a - Unknown opcode
	.db $3f			  ; $8b9b - Unknown opcode
	STA tmp0				 ; $8b9c: 85 00   
	BRK					  ; $8b9e: 00	  
	.db $1b			  ; $8b9f - Unknown opcode
	.db $0f			  ; $8ba0 - Unknown opcode
	CMP tmp0				 ; $8ba1: C5 00   
	BEQ $8ba7				; $8ba3: F0 02   
	BCS $8bb1				; $8ba5: B0 0A   
loc_8BA7:
	BRK					  ; $8ba7: 00	  
	ASL system_flags		 ; $8ba8: 06 1F   
	BRK					  ; $8baa: 00	  
	EOR $93				  ; $8bab: 45 93   
	BPL $8bfb				; $8bad: 10 4C   
	CMP $8b,X				; $8baf: D5 8B   
loc_8BB1:
	BRK					  ; $8bb1: 00	  
	ASL system_flags		 ; $8bb2: 06 1F   
	BRK					  ; $8bb4: 00	  
	ADC #$93				 ; $8bb5: 69 93	; Arithmetic
	BPL $8bb9				; $8bb7: 10 00   
loc_8BB9:
	CPX #$d3				 ; $8bb9: E0 D3   
	.db $13			  ; $8bbb - Unknown opcode
	CLC					  ; $8bbc: 18	  
	RTS					  ; $8bbd: 60	  
loc_8BBE:
	LDX $7e				  ; $8bbe: A6 7E   
	BRK					  ; $8bc0: 00	  
	.db $04			  ; $8bc1 - Unknown opcode
	.db $3f			  ; $8bc2 - Unknown opcode
	STA tmp0				 ; $8bc3: 85 00   
	BRK					  ; $8bc5: 00	  
	.db $1b			  ; $8bc6 - Unknown opcode
	.db $0f			  ; $8bc7 - Unknown opcode
	CMP tmp0				 ; $8bc8: C5 00   
	BEQ $8bce				; $8bca: F0 02   
	BCS $8bdb				; $8bcc: B0 0D   
loc_8BCE:
	BRK					  ; $8bce: 00	  
	ASL system_flags		 ; $8bcf: 06 1F   
	BRK					  ; $8bd1: 00	  
	.db $2b			  ; $8bd2 - Unknown opcode
	.db $c3			  ; $8bd3 - Unknown opcode
	BRK					  ; $8bd4: 00	  
	BRK					  ; $8bd5: 00	  
	CPX #$d3				 ; $8bd6: E0 D3   
	.db $12			  ; $8bd8 - Unknown opcode
	CLC					  ; $8bd9: 18	  
	RTS					  ; $8bda: 60	  
loc_8BDB:
	BRK					  ; $8bdb: 00	  
	ASL system_flags		 ; $8bdc: 06 1F   
	BRK					  ; $8bde: 00	  
	BIT $00c3				; $8bdf: 2C C3 00
	JSR $8bb8				; $8be2: 20 B8 8B ; -> sub_8BB8
	CLC					  ; $8be5: 18	  
	LDA $72e9				; $8be6: AD E9 72
	BMI $8c20				; $8be9: 30 35   
	BRK					  ; $8beb: 00	  
	ASL system_flags		 ; $8bec: 06 1F   
	BRK					  ; $8bee: 00	  
	AND $aab3				; $8bef: 2D B3 AA
	LDA $6e45,X			  ; $8bf2: BD 45 6E
	LDX #$01				 ; $8bf5: A2 01   
loc_8BF7:
	CMP $8c47,X			  ; $8bf7: DD 47 8C
	BEQ $8c02				; $8bfa: F0 06   
	DEX					  ; $8bfc: CA	  
	BPL $8bf7				; $8bfd: 10 F8   
	CLC					  ; $8bff: 18	  
	BMI $8c20				; $8c00: 30 1E   
loc_8C02:
	TXA					  ; $8c02: 8A	  
	LSR					  ; $8c03: 4A	  
	BCC $8c21				; $8c04: 90 1B   
	LDA #$80				 ; $8c06: A9 80   
	BRK					  ; $8c08: 00	  
	ASL					  ; $8c09: 0A	  
	.db $1f			  ; $8c0a - Unknown opcode
	LDA #$00				 ; $8c0b: A9 00   
	STA tmp0				 ; $8c0d: 85 00   
loc_8C0F:
	BRK					  ; $8c0f: 00	  
	ORA (system_flags,X)	 ; $8c10: 01 1F   
	BRK					  ; $8c12: 00	  
	ORA #$1f				 ; $8c13: 09 1F   
	LDA tmp0				 ; $8c15: A5 00   
	BRK					  ; $8c17: 00	  
	.db $0b			  ; $8c18 - Unknown opcode
	.db $1f			  ; $8c19 - Unknown opcode
	LDA #$01				 ; $8c1a: A9 01   
	STA $735d				; $8c1c: 8D 5D 73
	SEC					  ; $8c1f: 38	  
loc_8C20:
	RTS					  ; $8c20: 60	  
loc_8C21:
	LDA #$81				 ; $8c21: A9 81   
	BRK					  ; $8c23: 00	  
	ASL					  ; $8c24: 0A	  
	.db $1f			  ; $8c25 - Unknown opcode
	LDA #$07				 ; $8c26: A9 07   
	BRK					  ; $8c28: 00	  
	BIT $850f				; $8c29: 2C 0F 85
	BRK					  ; $8c2c: 00	  
	BRK					  ; $8c2d: 00	  
	.db $62			  ; $8c2e - Unknown opcode
	.db $23			  ; $8c2f - Unknown opcode
	RTI					  ; $8c30: 40	  
	TAX					  ; $8c31: AA	  
	DEX					  ; $8c32: CA	  
	LDA #$00				 ; $8c33: A9 00   
loc_8C35:
	SEC					  ; $8c35: 38	  
	ROL					  ; $8c36: 2A	  
	DEX					  ; $8c37: CA	  
	BPL $8c35				; $8c38: 10 FB   
	AND tmp0				 ; $8c3a: 25 00   
	BRK					  ; $8c3c: 00	  
	ROL					  ; $8c3d: 2A	  
	.db $0f			  ; $8c3e - Unknown opcode
	BRK					  ; $8c3f: 00	  
	.db $67			  ; $8c40 - Unknown opcode
	.db $73			  ; $8c41 - Unknown opcode
	STA tmp0				 ; $8c42: 85 00   
	JMP $8c0f				; $8c44: 4C 0F 8C
	.db $1c			  ; $8c47 - Unknown opcode
	LDY $0300,X			  ; $8c48: BC 00 03
	.db $1f			  ; $8c4b - Unknown opcode
	CMP #$3c				 ; $8c4c: C9 3C	; Compare with 60
	BCS $8c68				; $8c4e: B0 18   

; ---- Subroutine at $8c50 (Bank 17) ----
sub_8C50:
	BRK					  ; $8c50: 00	  
	ASL system_flags		 ; $8c51: 06 1F   
	BCC $8c5d				; $8c53: 90 08   
	BRK					  ; $8c55: 00	  
	AND #$c3				 ; $8c56: 29 C3   
	.db $03			  ; $8c58 - Unknown opcode
	BCS $8c6a				; $8c59: B0 0F   
	BCC $8c63				; $8c5b: 90 06   
loc_8C5D:
	BRK					  ; $8c5d: 00	  
	LSR $93				  ; $8c5e: 46 93   
	.db $13			  ; $8c60 - Unknown opcode
	BCS $8c6a				; $8c61: B0 07   
loc_8C63:
	LDA $72e4				; $8c63: AD E4 72
	BMI $8c79				; $8c66: 30 11   
loc_8C68:
	SEC					  ; $8c68: 38	  
	RTS					  ; $8c69: 60	  
loc_8C6A:
	BRK					  ; $8c6a: 00	  
	ASL system_flags		 ; $8c6b: 06 1F   
	BCC $8c73				; $8c6d: 90 04   
	BRK					  ; $8c6f: 00	  
	ROL					  ; $8c70: 2A	  
	.db $c3			  ; $8c71 - Unknown opcode
	.db $13			  ; $8c72 - Unknown opcode
loc_8C73:
	BRK					  ; $8c73: 00	  
	CPX $d3				  ; $8c74: E4 D3   
	BPL $8c90				; $8c76: 10 18   
	RTS					  ; $8c78: 60	  
loc_8C79:
	BRK					  ; $8c79: 00	  
	ASL system_flags		 ; $8c7a: 06 1F   
	BCC $8c82				; $8c7c: 90 04   
	BRK					  ; $8c7e: 00	  
	ROL					  ; $8c7f: 2A	  
	.db $c3			  ; $8c80 - Unknown opcode
	.db $13			  ; $8c81 - Unknown opcode
loc_8C82:
	BRK					  ; $8c82: 00	  
	SBC $d3				  ; $8c83: E5 D3	; Arithmetic
	ADC $6018				; $8c85: 6D 18 60 ; Arithmetic

; ---- Subroutine at $8c88 (Bank 17) ----
sub_8C88:
	LDA $8cad				; $8c88: AD AD 8C
	STA tmp0				 ; $8c8b: 85 00   
	LDA $8cae				; $8c8d: AD AE 8C
loc_8C90:
	STA tmp1				 ; $8c90: 85 01   
	BRK					  ; $8c92: 00	  
	.db $03			  ; $8c93 - Unknown opcode
	.db $1f			  ; $8c94 - Unknown opcode
	LDX #$00				 ; $8c95: A2 00   
	PHA					  ; $8c97: 48	  
	JSR $c813				; $8c98: 20 13 C8 ; Call to fixed bank
	PLA					  ; $8c9b: 68	  
	JSR $c813				; $8c9c: 20 13 C8 ; Call to fixed bank
	LDY #$00				 ; $8c9f: A0 00   
	LDA (tmp0),Y			 ; $8ca1: B1 00   
	STA tmp2				 ; $8ca3: 85 02   
	INY					  ; $8ca5: C8	  
	LDA (tmp0),Y			 ; $8ca6: B1 00   
	STA tmp3				 ; $8ca8: 85 03   
	JMP (tmp2)			   ; $8caa: 6C 02 00
	ASL					  ; $8cad: 0A	  
	LDY $20				  ; $8cae: A4 20   
	CPY $80				  ; $8cb0: C4 80   
	BCC $8cfb				; $8cb2: 90 47   
	BRK					  ; $8cb4: 00	  
	.db $03			  ; $8cb5 - Unknown opcode
	.db $1f			  ; $8cb6 - Unknown opcode
	PHA					  ; $8cb7: 48	  
	AND #$07				 ; $8cb8: 29 07   
	STA tmp0				 ; $8cba: 85 00   
	PLA					  ; $8cbc: 68	  
	LSR					  ; $8cbd: 4A	  
	LSR					  ; $8cbe: 4A	  
	LSR					  ; $8cbf: 4A	  
	TAX					  ; $8cc0: AA	  
	LDA $a61e,X			  ; $8cc1: BD 1E A6
	PHA					  ; $8cc4: 48	  
	LDX tmp0				 ; $8cc5: A6 00   
	BRK					  ; $8cc7: 00	  
	AND #$0f				 ; $8cc8: 29 0F   
	STA tmp0				 ; $8cca: 85 00   
	PLA					  ; $8ccc: 68	  
	AND tmp0				 ; $8ccd: 25 00   
	BEQ $8cfb				; $8ccf: F0 2A   
	LDX #$ff				 ; $8cd1: A2 FF   
	STX tmp0				 ; $8cd3: 86 00   
	INX					  ; $8cd5: E8	  
	STX tmp2				 ; $8cd6: 86 02   
	BRK					  ; $8cd8: 00	  
	.db $03			  ; $8cd9 - Unknown opcode
	.db $1f			  ; $8cda - Unknown opcode
	STA tmp1				 ; $8cdb: 85 01   
loc_8CDD:
	LDX tmp2				 ; $8cdd: A6 02   
	LDA $a61e,X			  ; $8cdf: BD 1E A6
	STA tmp3				 ; $8ce2: 85 03   
	LDY #$07				 ; $8ce4: A0 07   
loc_8CE6:
	LSR tmp3				 ; $8ce6: 46 03   
	LDA #$00				 ; $8ce8: A9 00   
	ADC tmp0				 ; $8cea: 65 00	; Arithmetic
	STA tmp0				 ; $8cec: 85 00   
	LDA tmp1				 ; $8cee: A5 01   
	BEQ $8cfc				; $8cf0: F0 0A   
	DEC tmp1				 ; $8cf2: C6 01   
	DEY					  ; $8cf4: 88	  
	BPL $8ce6				; $8cf5: 10 EF   
	INC tmp2				 ; $8cf7: E6 02   
	BNE $8cdd				; $8cf9: D0 E2   
loc_8CFB:
	RTS					  ; $8cfb: 60	  
loc_8CFC:
	LDA tmp0				 ; $8cfc: A5 00   
	ASL					  ; $8cfe: 0A	  
	TAX					  ; $8cff: AA	  
	LDA $a60a,X			  ; $8d00: BD 0A A6
	STA tmp0				 ; $8d03: 85 00   
	LDA $a60b,X			  ; $8d05: BD 0B A6
	STA tmp1				 ; $8d08: 85 01   
	JMP (tmp0)			   ; $8d0a: 6C 00 00

; ---- Subroutine at $8d0d (Bank 17) ----
sub_8D0D:
	BRK					  ; $8d0d: 00	  
	.db $03			  ; $8d0e - Unknown opcode
	.db $1f			  ; $8d0f - Unknown opcode
	CMP #$27				 ; $8d10: C9 27	; Compare with 39
	BEQ $8d3b				; $8d12: F0 27   
	BRK					  ; $8d14: 00	  
	ORA #$3f				 ; $8d15: 09 3F   
	BCS $8d3b				; $8d17: B0 22   
	BRK					  ; $8d19: 00	  
	ORA (system_flags,X)	 ; $8d1a: 01 1F   
	CMP $7363				; $8d1c: CD 63 73
	BEQ $8d3b				; $8d1f: F0 1A   
	LDA $7363				; $8d21: AD 63 73
	BPL $8d3d				; $8d24: 10 17   
	AND #$07				 ; $8d26: 29 07   
	TAX					  ; $8d28: AA	  
	BRK					  ; $8d29: 00	  
	AND #$c3				 ; $8d2a: 29 C3   
	ASL $0c90				; $8d2c: 0E 90 0C
	BRK					  ; $8d2f: 00	  
	AND #$c3				 ; $8d30: 29 C3   
	ASL $b0				  ; $8d32: 06 B0   
	AND $2900,Y			  ; $8d34: 39 00 29
	.db $c3			  ; $8d37 - Unknown opcode
	.db $07			  ; $8d38 - Unknown opcode
	BCS $8d64				; $8d39: B0 29   
loc_8D3B:
	SEC					  ; $8d3b: 38	  
	RTS					  ; $8d3c: 60	  
loc_8D3D:
	BRK					  ; $8d3d: 00	  
	.db $67			  ; $8d3e - Unknown opcode
	.db $73			  ; $8d3f - Unknown opcode
	TAX					  ; $8d40: AA	  
	BRK					  ; $8d41: 00	  
	LSR $93				  ; $8d42: 46 93   
	.db $07			  ; $8d44 - Unknown opcode
	BCC $8d3b				; $8d45: 90 F4   
	BRK					  ; $8d47: 00	  
	LSR $93				  ; $8d48: 46 93   
	ASL $b0,X				; $8d4a: 16 B0   
	AND (tmp0,X)			 ; $8d4c: 21 00   
	.db $3b			  ; $8d4e - Unknown opcode
	.db $93			  ; $8d4f - Unknown opcode
	ORA ($90,X)			  ; $8d50: 01 90   
	.db $0b			  ; $8d52 - Unknown opcode
	CMP #$bb				 ; $8d53: C9 BB	; Compare with 187
	BNE $8d5e				; $8d55: D0 07   
	BRK					  ; $8d57: 00	  
	.db $1b			  ; $8d58 - Unknown opcode
	.db $0f			  ; $8d59 - Unknown opcode
	CMP #$55				 ; $8d5a: C9 55	; Compare with 85
	BCC $8d6e				; $8d5c: 90 10   
loc_8D5E:
	BRK					  ; $8d5e: 00	  
	LSR $93				  ; $8d5f: 46 93   
	.db $17			  ; $8d61 - Unknown opcode
	BCC $8d3b				; $8d62: 90 D7   
loc_8D64:
	JSR $bf2e				; $8d64: 20 2E BF ; -> sub_BF2E
	LDY $e800				; $8d67: AC 00 E8
	.db $d3			  ; $8d6a - Unknown opcode
	ASL $6018				; $8d6b: 0E 18 60
loc_8D6E:
	LDA $72e7				; $8d6e: AD E7 72
	ORA #$02				 ; $8d71: 09 02   
	STA $72e7				; $8d73: 8D E7 72
	BRK					  ; $8d76: 00	  
	ORA (system_flags,X)	 ; $8d77: 01 1F   
	STA $7363				; $8d79: 8D 63 73
	PHA					  ; $8d7c: 48	  
	JSR $bf2e				; $8d7d: 20 2E BF ; -> sub_BF2E
	TXS					  ; $8d80: 9A	  
	BRK					  ; $8d81: 00	  
	INX					  ; $8d82: E8	  
	.db $d3			  ; $8d83 - Unknown opcode
	.db $0f			  ; $8d84 - Unknown opcode
	PLA					  ; $8d85: 68	  
	BPL $8d92				; $8d86: 10 0A   
	AND #$07				 ; $8d88: 29 07   
	TAX					  ; $8d8a: AA	  
	BRK					  ; $8d8b: 00	  
	AND #$c3				 ; $8d8c: 29 C3   
	ASL $a4b0				; $8d8e: 0E B0 A4
	RTS					  ; $8d91: 60	  
loc_8D92:
	BRK					  ; $8d92: 00	  
	.db $67			  ; $8d93 - Unknown opcode
	.db $73			  ; $8d94 - Unknown opcode
	TAX					  ; $8d95: AA	  
	BRK					  ; $8d96: 00	  
	LSR $93				  ; $8d97: 46 93   
	.db $07			  ; $8d99 - Unknown opcode
	BCS $8d5e				; $8d9a: B0 C2   
	RTS					  ; $8d9c: 60	  

; ---- Subroutine at $8d9d (Bank 17) ----
sub_8D9D:
	LDA $72e9				; $8d9d: AD E9 72
	BPL $8da9				; $8da0: 10 07   
	BRK					  ; $8da2: 00	  
	ORA (system_flags,X)	 ; $8da3: 01 1F   
	BMI $8da9				; $8da5: 30 02   
	CLC					  ; $8da7: 18	  
	RTS					  ; $8da8: 60	  
loc_8DA9:
	SEC					  ; $8da9: 38	  
	RTS					  ; $8daa: 60	  

; ---- Subroutine at $8dab (Bank 17) ----
sub_8DAB:
	LDA $6e44				; $8dab: AD 44 6E
	AND #$03				 ; $8dae: 29 03   
	CMP #$02				 ; $8db0: C9 02	; Compare with 2
	BEQ $8dc5				; $8db2: F0 11   
	CMP #$01				 ; $8db4: C9 01	; Compare with 1
	BEQ $8dbe				; $8db6: F0 06   
	CMP #$03				 ; $8db8: C9 03	; Compare with 3
	BEQ $8dc3				; $8dba: F0 07   
loc_8DBC:
	SEC					  ; $8dbc: 38	  
	RTS					  ; $8dbd: 60	  
loc_8DBE:
	BRK					  ; $8dbe: 00	  
	ORA (system_flags,X)	 ; $8dbf: 01 1F   
	BMI $8dbc				; $8dc1: 30 F9   
loc_8DC3:
	CLC					  ; $8dc3: 18	  
	RTS					  ; $8dc4: 60	  
loc_8DC5:
	BRK					  ; $8dc5: 00	  
	ORA (system_flags,X)	 ; $8dc6: 01 1F   
	BPL $8dbc				; $8dc8: 10 F2   
	CLC					  ; $8dca: 18	  
	RTS					  ; $8dcb: 60	  

; ---- Subroutine at $8dcc (Bank 17) ----
sub_8DCC:
	LDA $72e6				; $8dcc: AD E6 72
	AND #$30				 ; $8dcf: 29 30   
	BEQ $8dda				; $8dd1: F0 07   
	BRK					  ; $8dd3: 00	  
	ORA (system_flags,X)	 ; $8dd4: 01 1F   
	BMI $8dda				; $8dd6: 30 02   
	CLC					  ; $8dd8: 18	  
	RTS					  ; $8dd9: 60	  
loc_8DDA:
	SEC					  ; $8dda: 38	  
	RTS					  ; $8ddb: 60	  

; ---- Subroutine at $8ddc (Bank 17) ----
sub_8DDC:
	BRK					  ; $8ddc: 00	  
	.db $13			  ; $8ddd - Unknown opcode
	.db $2f			  ; $8dde - Unknown opcode
	LDA #$00				 ; $8ddf: A9 00   
	BRK					  ; $8de1: 00	  
	ASL $6f				  ; $8de2: 06 6F   
	RTS					  ; $8de4: 60	  

; ---- Subroutine at $8de5 (Bank 17) ----
sub_8DE5:
	BRK					  ; $8de5: 00	  
	ASL system_flags		 ; $8de6: 06 1F   
	BCS $8df0				; $8de8: B0 06   
	JSR $8f3b				; $8dea: 20 3B 8F ; -> sub_8F3B
	JSR $8f8b				; $8ded: 20 8B 8F ; -> sub_8F8B
loc_8DF0:
	BRK					  ; $8df0: 00	  
	.db $03			  ; $8df1 - Unknown opcode
	.db $1f			  ; $8df2 - Unknown opcode
	LDX #$00				 ; $8df3: A2 00   
loc_8DF5:
	CMP $8fa5,X			  ; $8df5: DD A5 8F
	BCC $8dfe				; $8df8: 90 04   
	INX					  ; $8dfa: E8	  
	BNE $8df5				; $8dfb: D0 F8   
	RTS					  ; $8dfd: 60	  
loc_8DFE:
	TXA					  ; $8dfe: 8A	  
	ASL					  ; $8dff: 0A	  
	TAX					  ; $8e00: AA	  
	LDA $8fdc,X			  ; $8e01: BD DC 8F
	STA tmp0				 ; $8e04: 85 00   
	LDA $8fdd,X			  ; $8e06: BD DD 8F
	STA tmp1				 ; $8e09: 85 01   
	JMP (tmp0)			   ; $8e0b: 6C 00 00
	LDA $72e4				; $8e0e: AD E4 72
	BMI $8e17				; $8e11: 30 04   
	JSR $bf2e				; $8e13: 20 2E BF ; -> sub_BF2E
	STX $0300				; $8e16: 8E 00 03
	.db $1f			  ; $8e19 - Unknown opcode
	LDY #$10				 ; $8e1a: A0 10   
	CMP #$03				 ; $8e1c: C9 03	; Compare with 3
	BCC $8e3c				; $8e1e: 90 1C   
	CMP #$09				 ; $8e20: C9 09	; Compare with 9
	BCC $8e40				; $8e22: 90 1C   
	CMP #$0d				 ; $8e24: C9 0D	; Compare with 13
	BCC $8e44				; $8e26: 90 1C   
	CMP #$10				 ; $8e28: C9 10	; Compare with 16
	BCC $8e4c				; $8e2a: 90 20   
	CMP #$13				 ; $8e2c: C9 13	; Compare with 19
	BCC $8e4e				; $8e2e: 90 1E   
	CMP #$15				 ; $8e30: C9 15	; Compare with 21
	BEQ $8e48				; $8e32: F0 14   
	CMP #$16				 ; $8e34: C9 16	; Compare with 22
	BCS $8e4e				; $8e36: B0 16   
	LDY #$14				 ; $8e38: A0 14   
	BNE $8e4e				; $8e3a: D0 12   
loc_8E3C:
	LDY #$26				 ; $8e3c: A0 26   
	BNE $8e4e				; $8e3e: D0 0E   
loc_8E40:
	LDY #$28				 ; $8e40: A0 28   
	BNE $8e4e				; $8e42: D0 0A   
loc_8E44:
	LDY #$12				 ; $8e44: A0 12   
	BNE $8e4e				; $8e46: D0 06   
loc_8E48:
	LDY #$2a				 ; $8e48: A0 2A   
	BNE $8e4e				; $8e4a: D0 02   
loc_8E4C:
	LDY #$20				 ; $8e4c: A0 20   
loc_8E4E:
	BRK					  ; $8e4e: 00	  
	.db $03			  ; $8e4f - Unknown opcode
	.db $4f			  ; $8e50 - Unknown opcode
	JMP $8e96				; $8e51: 4C 96 8E
	LDY #$89				 ; $8e54: A0 89   
	BRK					  ; $8e56: 00	  
	ASL system_flags		 ; $8e57: 06 1F   
	BCC $8e70				; $8e59: 90 15   
	LDY #$8b				 ; $8e5b: A0 8B   
	LDA $72e9				; $8e5d: AD E9 72
	BPL $8e70				; $8e60: 10 0E   
	BRK					  ; $8e62: 00	  
	AND $ada3				; $8e63: 2D A3 AD
	.db $7f			  ; $8e66 - Unknown opcode
	ROR $0329				; $8e67: 6E 29 03
	CMP $7e				  ; $8e6a: C5 7E   
	BNE $8e70				; $8e6c: D0 02   
	LDY #$89				 ; $8e6e: A0 89   
loc_8E70:
	JMP $8e92				; $8e70: 4C 92 8E
	LDY #$91				 ; $8e73: A0 91   
	BNE $8e92				; $8e75: D0 1B   
	JSR $bf2e				; $8e77: 20 2E BF ; -> sub_BF2E
	BPL $8e7c				; $8e7a: 10 00   
loc_8E7C:
	.db $62			  ; $8e7c - Unknown opcode
	.db $d3			  ; $8e7d - Unknown opcode
	BRK					  ; $8e7e: 00	  
	JSR $9053				; $8e7f: 20 53 90 ; -> sub_9053
	BRK					  ; $8e82: 00	  
	ASL $2f				  ; $8e83: 06 2F   
	RTS					  ; $8e85: 60	  
	JSR $bf2e				; $8e86: 20 2E BF ; -> sub_BF2E
	.db $9c			  ; $8e89 - Unknown opcode
	LDY #$20				 ; $8e8a: A0 20   
	BRK					  ; $8e8c: 00	  
	.db $03			  ; $8e8d - Unknown opcode
	.db $4f			  ; $8e8e - Unknown opcode
	JMP $8e96				; $8e8f: 4C 96 8E
loc_8E92:
	TYA					  ; $8e92: 98	  
	JSR $bf55				; $8e93: 20 55 BF ; -> sub_BF55

; ---- Subroutine at $8e96 (Bank 17) ----
sub_8E96:
	BRK					  ; $8e96: 00	  
	.db $e2			  ; $8e97 - Unknown opcode
	.db $d3			  ; $8e98 - Unknown opcode
	BRK					  ; $8e99: 00	  
	RTS					  ; $8e9a: 60	  
loc_8E9B:
	JSR $8e96				; $8e9b: 20 96 8E ; -> sub_8E96
loc_8E9E:
	BRK					  ; $8e9e: 00	  
	.db $f2			  ; $8e9f - Unknown opcode
	.db $d3			  ; $8ea0 - Unknown opcode
	.db $04			  ; $8ea1 - Unknown opcode
	RTS					  ; $8ea2: 60	  
	LDA #$28				 ; $8ea3: A9 28   
	BNE $8eaf				; $8ea5: D0 08   
	LDA #$10				 ; $8ea7: A9 10   
	BNE $8eaf				; $8ea9: D0 04   
	LDA #$26				 ; $8eab: A9 26   
	BNE $8eaf				; $8ead: D0 00   
loc_8EAF:
	PHA					  ; $8eaf: 48	  
	JSR $8e96				; $8eb0: 20 96 8E ; -> sub_8E96
	JSR $bf2e				; $8eb3: 20 2E BF ; -> sub_BF2E
	STA $a868,X			  ; $8eb6: 9D 68 A8
loc_8EB9:
	BRK					  ; $8eb9: 00	  
	.db $03			  ; $8eba - Unknown opcode
	.db $4f			  ; $8ebb - Unknown opcode
	JMP $8e9e				; $8ebc: 4C 9E 8E
	JSR $8e96				; $8ebf: 20 96 8E ; -> sub_8E96
	JSR $bf2e				; $8ec2: 20 2E BF ; -> sub_BF2E
	STA ($a0),Y			  ; $8ec5: 91 A0   
	.db $12			  ; $8ec7 - Unknown opcode
	BNE $8eb9				; $8ec8: D0 EF   
	LDA #$88				 ; $8eca: A9 88   
	BNE $8ee6				; $8ecc: D0 18   
	JSR $bf2e				; $8ece: 20 2E BF ; -> sub_BF2E
	STX $10a0				; $8ed1: 8E A0 10
	BRK					  ; $8ed4: 00	  
	.db $03			  ; $8ed5 - Unknown opcode
	.db $4f			  ; $8ed6 - Unknown opcode
	JMP $8ee9				; $8ed7: 4C E9 8E
	JSR $bf2e				; $8eda: 20 2E BF ; -> sub_BF2E
	.db $8f			  ; $8edd - Unknown opcode
	BRK					  ; $8ede: 00	  
	.db $02			  ; $8edf - Unknown opcode
	.db $4f			  ; $8ee0 - Unknown opcode
	JMP $8ee9				; $8ee1: 4C E9 8E
	LDA #$83				 ; $8ee4: A9 83   
loc_8EE6:
	JSR $bf55				; $8ee6: 20 55 BF ; -> sub_BF55
loc_8EE9:
	BRK					  ; $8ee9: 00	  
	.db $f2			  ; $8eea - Unknown opcode
	.db $d3			  ; $8eeb - Unknown opcode
	BRK					  ; $8eec: 00	  
	RTS					  ; $8eed: 60	  
	JSR $bf2e				; $8eee: 20 2E BF ; -> sub_BF2E
	TYA					  ; $8ef1: 98	  
	BRK					  ; $8ef2: 00	  
	SBC ($d3),Y			  ; $8ef3: F1 D3	; Arithmetic
	.db $8f			  ; $8ef5 - Unknown opcode
	BRK					  ; $8ef6: 00	  
	.db $02			  ; $8ef7 - Unknown opcode
	.db $4f			  ; $8ef8 - Unknown opcode
	JSR $bf2e				; $8ef9: 20 2E BF ; -> sub_BF2E
	DEY					  ; $8efc: 88	  
	BRK					  ; $8efd: 00	  
	SBC $d3				  ; $8efe: E5 D3	; Arithmetic
	BCC $8f62				; $8f00: 90 60   
	JSR $bf2e				; $8f02: 20 2E BF ; -> sub_BF2E
	TYA					  ; $8f05: 98	  
	BRK					  ; $8f06: 00	  
	SBC $d3				  ; $8f07: E5 D3	; Arithmetic
	.db $8f			  ; $8f09 - Unknown opcode
	BRK					  ; $8f0a: 00	  
	.db $02			  ; $8f0b - Unknown opcode
loc_8F0C:
	.db $4f			  ; $8f0c - Unknown opcode
	BRK					  ; $8f0d: 00	  
	.db $03			  ; $8f0e - Unknown opcode
	.db $4f			  ; $8f0f - Unknown opcode
	BRK					  ; $8f10: 00	  
	SBC #$d3				 ; $8f11: E9 D3	; Arithmetic
	STA ($60),Y			  ; $8f13: 91 60   
	BRK					  ; $8f15: 00	  
	SBC $d3				  ; $8f16: E5 D3	; Arithmetic
	STY $60				  ; $8f18: 84 60   
	BRK					  ; $8f1a: 00	  
	SBC $d3				  ; $8f1b: E5 D3	; Arithmetic
	TYA					  ; $8f1d: 98	  
	RTS					  ; $8f1e: 60	  
	JSR $bf2e				; $8f1f: 20 2E BF ; -> sub_BF2E
	.db $9c			  ; $8f22 - Unknown opcode
	JMP $8e9b				; $8f23: 4C 9B 8E
	BRK					  ; $8f26: 00	  
	.db $f2			  ; $8f27 - Unknown opcode
	.db $d3			  ; $8f28 - Unknown opcode
	.db $04			  ; $8f29 - Unknown opcode
	JMP $bdbc				; $8f2a: 4C BC BD
	JSR $bf2e				; $8f2d: 20 2E BF ; -> sub_BF2E
	DEY					  ; $8f30: 88	  
	LDY #$20				 ; $8f31: A0 20   
	BRK					  ; $8f33: 00	  
	.db $03			  ; $8f34 - Unknown opcode
	.db $4f			  ; $8f35 - Unknown opcode
	BRK					  ; $8f36: 00	  
	BEQ $8f0c				; $8f37: F0 D3   
	ROR $60,X				; $8f39: 76 60   

; ---- Subroutine at $8f3b (Bank 17) ----
sub_8F3B:
	BRK					  ; $8f3b: 00	  
	ORA system_flags		 ; $8f3c: 05 1F   
	CMP #$01				 ; $8f3e: C9 01	; Compare with 1
	BNE $8f8a				; $8f40: D0 48   
	JSR $8f9c				; $8f42: 20 9C 8F ; -> sub_8F9C
	PHA					  ; $8f45: 48	  
	BRK					  ; $8f46: 00	  
	CPX #$d3				 ; $8f47: E0 D3   
	AND $0600				; $8f49: 2D 00 06
	.db $1f			  ; $8f4c - Unknown opcode
	TAX					  ; $8f4d: AA	  
	PLA					  ; $8f4e: 68	  
	BRK					  ; $8f4f: 00	  
	AND ($73),Y			  ; $8f50: 31 73   
	BRK					  ; $8f52: 00	  
	.db $32			  ; $8f53 - Unknown opcode
	.db $73			  ; $8f54 - Unknown opcode
	LDA #$ff				 ; $8f55: A9 FF   
	STA $70				  ; $8f57: 85 70   
	BRK					  ; $8f59: 00	  
	.db $1a			  ; $8f5a - Unknown opcode
	.db $73			  ; $8f5b - Unknown opcode
	BRK					  ; $8f5c: 00	  
	.db $17			  ; $8f5d - Unknown opcode
	.db $73			  ; $8f5e - Unknown opcode
	LDY $73				  ; $8f5f: A4 73   
	STY $70				  ; $8f61: 84 70   
	BRK					  ; $8f63: 00	  
	ORA $2073,Y			  ; $8f64: 19 73 20
	.db $9c			  ; $8f67 - Unknown opcode
	.db $8f			  ; $8f68 - Unknown opcode
	CMP #$1f				 ; $8f69: C9 1F	; Compare with 31
	BNE $8f74				; $8f6b: D0 07   
	LDA #$ff				 ; $8f6d: A9 FF   
	STA $70				  ; $8f6f: 85 70   
	BRK					  ; $8f71: 00	  
	ASL $2073,X			  ; $8f72: 1E 73 20
	.db $9c			  ; $8f75 - Unknown opcode
	.db $8f			  ; $8f76 - Unknown opcode
	BRK					  ; $8f77: 00	  
	.db $0c			  ; $8f78 - Unknown opcode
	.db $0f			  ; $8f79 - Unknown opcode
	BCC $8f85				; $8f7a: 90 09   
	BRK					  ; $8f7c: 00	  
	.db $12			  ; $8f7d - Unknown opcode
	.db $fb			  ; $8f7e - Unknown opcode
	BRK					  ; $8f7f: 00	  
	.db $07			  ; $8f80 - Unknown opcode
	.db $9f			  ; $8f81 - Unknown opcode
	JSR $9053				; $8f82: 20 53 90 ; -> sub_9053
loc_8F85:
	LDA #$43				 ; $8f85: A9 43   
	BRK					  ; $8f87: 00	  
	ASL					  ; $8f88: 0A	  
	.db $1f			  ; $8f89 - Unknown opcode
loc_8F8A:
	RTS					  ; $8f8a: 60	  

; ---- Subroutine at $8f8b (Bank 17) ----
sub_8F8B:
	BRK					  ; $8f8b: 00	  
	ORA system_flags		 ; $8f8c: 05 1F   
	CMP #$02				 ; $8f8e: C9 02	; Compare with 2
	BNE $8f9b				; $8f90: D0 09   
	JSR $8f9c				; $8f92: 20 9C 8F ; -> sub_8F9C
	JSR $9079				; $8f95: 20 79 90 ; -> sub_9079
	BRK					  ; $8f98: 00	  
	ASL					  ; $8f99: 0A	  
	.db $1f			  ; $8f9a - Unknown opcode
loc_8F9B:
	RTS					  ; $8f9b: 60	  

; ---- Subroutine at $8f9c (Bank 17) ----
sub_8F9C:
	BRK					  ; $8f9c: 00	  
	.db $03			  ; $8f9d - Unknown opcode
	.db $1f			  ; $8f9e - Unknown opcode
	AND #$7f				 ; $8f9f: 29 7F   
	STA $7355				; $8fa1: 8D 55 73
	RTS					  ; $8fa4: 60	  
	.db $3c			  ; $8fa5 - Unknown opcode
	.db $43			  ; $8fa6 - Unknown opcode
	EOR #$4c				 ; $8fa7: 49 4C   
	EOR $6753				; $8fa9: 4D 53 67
	PLA					  ; $8fac: 68	  
	.db $6f			  ; $8fad - Unknown opcode
	BVS $9023				; $8fae: 70 73   
	.db $74			  ; $8fb0 - Unknown opcode
	ADC $77,X				; $8fb1: 75 77	; Arithmetic
	SEI					  ; $8fb3: 78	  
	.db $7a			  ; $8fb4 - Unknown opcode
	.db $7b			  ; $8fb5 - Unknown opcode
	.db $83			  ; $8fb6 - Unknown opcode
	STY $85				  ; $8fb7: 84 85   
	STX $87				  ; $8fb9: 86 87   
	DEY					  ; $8fbb: 88	  
	.db $89			  ; $8fbc - Unknown opcode
	TXA					  ; $8fbd: 8A	  
	STY $8e8d				; $8fbe: 8C 8D 8E
	.db $8f			  ; $8fc1 - Unknown opcode
	TAY					  ; $8fc2: A8	  
	LDY $aead				; $8fc3: AC AD AE
	.db $af			  ; $8fc6 - Unknown opcode
	.db $bf			  ; $8fc7 - Unknown opcode
	CMP ($cb,X)			  ; $8fc8: C1 CB   
	CPY $ddd5				; $8fca: CC D5 DD
	DEC $e3e2,X			  ; $8fcd: DE E2 E3
	SBC #$ea				 ; $8fd0: E9 EA	; Arithmetic
	SBC ($f2),Y			  ; $8fd2: F1 F2	; Arithmetic
	SED					  ; $8fd4: F8	  
	SBC $fbfa,Y			  ; $8fd5: F9 FA FB ; Arithmetic
	.db $fc			  ; $8fd8 - Unknown opcode
	SBC $fffe,X			  ; $8fd9: FD FE FF ; Arithmetic
	ASL $968e				; $8fdc: 0E 8E 96
	STX $8e54				; $8fdf: 8E 54 8E
	STX $8e,Y				; $8fe2: 96 8E   
	.db $9b			  ; $8fe4 - Unknown opcode
	STX $8e73				; $8fe5: 8E 73 8E
	STX $8e,Y				; $8fe8: 96 8E   
	.db $73			  ; $8fea - Unknown opcode
	STX $8e96				; $8feb: 8E 96 8E
	STX $8e				  ; $8fee: 86 8E   
	STX $8e,Y				; $8ff0: 96 8E   
	.db $9b			  ; $8ff2 - Unknown opcode
	STX $8ea3				; $8ff3: 8E A3 8E
	STX $8e,Y				; $8ff6: 96 8E   
	.db $9b			  ; $8ff8 - Unknown opcode
	STX $8e96				; $8ff9: 8E 96 8E
	.db $77			  ; $8ffc - Unknown opcode
	STX $8e96				; $8ffd: 8E 96 8E
	.db $a3			  ; $9000 - Unknown opcode
	STX $8ea7				; $9001: 8E A7 8E
	.db $9b			  ; $9004 - Unknown opcode
	STX $8ea3				; $9005: 8E A3 8E
	.db $bf			  ; $9008 - Unknown opcode
	STX $8e9b				; $9009: 8E 9B 8E
	.db $a3			  ; $900c - Unknown opcode
	STX $8e9b				; $900d: 8E 9B 8E
	STX $8e				  ; $9010: 86 8E   
	.db $9b			  ; $9012 - Unknown opcode
	STX $8ea3				; $9013: 8E A3 8E
	.db $9b			  ; $9016 - Unknown opcode
	STX $8e96				; $9017: 8E 96 8E
	SBC #$8e				 ; $901a: E9 8E	; Arithmetic
	CPX $8e				  ; $901c: E4 8E   
	.db $da			  ; $901e - Unknown opcode
	STX $8ee9				; $901f: 8E E9 8E
	DEC $e98e				; $9022: CE 8E E9
	STX $8eca				; $9025: 8E CA 8E
	SBC #$8e				 ; $9028: E9 8E	; Arithmetic
	STX $8e,Y				; $902a: 96 8E   
	.db $02			  ; $902c - Unknown opcode
	.db $8f			  ; $902d - Unknown opcode
	STX $8e,Y				; $902e: 96 8E   
	.db $1a			  ; $9030 - Unknown opcode
	.db $8f			  ; $9031 - Unknown opcode
	STX $8e,Y				; $9032: 96 8E   
	ORA $8f,X				; $9034: 15 8F   
	STX $8e,Y				; $9036: 96 8E   
	INC $968e				; $9038: EE 8E 96
	STX $8f1f				; $903b: 8E 1F 8F
	ROL $8f				  ; $903e: 26 8F   
	.db $1f			  ; $9040 - Unknown opcode
	.db $8f			  ; $9041 - Unknown opcode
	AND $968f				; $9042: 2D 8F 96
	STX $8e9b				; $9045: 8E 9B 8E
	.db $9b			  ; $9048 - Unknown opcode
	STX $e7ad				; $9049: 8E AD E7
	.db $72			  ; $904c - Unknown opcode
	AND #$7c				 ; $904d: 29 7C   
	STA $72e7				; $904f: 8D E7 72
	RTS					  ; $9052: 60	  

; ---- Subroutine at $9053 (Bank 17) ----
sub_9053:
	BRK					  ; $9053: 00	  
loc_9054:
	.db $07			  ; $9054 - Unknown opcode
	.db $9f			  ; $9055 - Unknown opcode
	LDA $72e5				; $9056: AD E5 72
	BMI $9078				; $9059: 30 1D   

; ---- Subroutine at $905b (Bank 17) ----
sub_905B:
	LDA #$0d				 ; $905b: A9 0D   
	LDX $6e45				; $905d: AE 45 6E
	CPX #$bc				 ; $9060: E0 BC   
	BEQ $906f				; $9062: F0 0B   
	CPX #$ae				 ; $9064: E0 AE   
	BNE $9075				; $9066: D0 0D   
	LDX $7206				; $9068: AE 06 72
	CPX #$d2				 ; $906b: E0 D2   
	BEQ $9073				; $906d: F0 04   
loc_906F:
	LDA #$1e				 ; $906f: A9 1E   
	BNE $9075				; $9071: D0 02   
loc_9073:
	LDA #$35				 ; $9073: A9 35   
loc_9075:
	BRK					  ; $9075: 00	  
	.db $03			  ; $9076 - Unknown opcode
	.db $9f			  ; $9077 - Unknown opcode
loc_9078:
	RTS					  ; $9078: 60	  

; ---- Subroutine at $9079 (Bank 17) ----
sub_9079:
	LDX #$27				 ; $9079: A2 27   
loc_907B:
	CMP $908b,X			  ; $907b: DD 8B 90
	BEQ $9087				; $907e: F0 07   
	DEX					  ; $9080: CA	  
	BPL $907b				; $9081: 10 F8   
	LDA #$7f				 ; $9083: A9 7F   
	BNE $908a				; $9085: D0 03   
loc_9087:
	LDA $90b3,X			  ; $9087: BD B3 90
loc_908A:
	RTS					  ; $908a: 60	  
	.db $0b			  ; $908b - Unknown opcode
	ORA ($17),Y			  ; $908c: 11 17   
	CLC					  ; $908e: 18	  
	.db $1a			  ; $908f - Unknown opcode
	.db $1b			  ; $9090 - Unknown opcode
	ORA $1f1e,X			  ; $9091: 1D 1E 1F
	JSR $2221				; $9094: 20 21 22
	.db $23			  ; $9097 - Unknown opcode
	RTI					  ; $9098: 40	  
	.db $42			  ; $9099 - Unknown opcode
	.db $44			  ; $909a - Unknown opcode
	EOR $50				  ; $909b: 45 50   
	.db $74			  ; $909d - Unknown opcode
	.db $53			  ; $909e - Unknown opcode
	EOR $56,X				; $909f: 55 56   
	.db $57			  ; $90a1 - Unknown opcode
	CLI					  ; $90a2: 58	  
	EOR $5b5a,Y			  ; $90a3: 59 5A 5B
	.db $0c			  ; $90a6 - Unknown opcode
	EOR $5f5e,X			  ; $90a7: 5D 5E 5F
	RTS					  ; $90aa: 60	  
	ADC ($62,X)			  ; $90ab: 61 62	; Arithmetic
	.db $63			  ; $90ad - Unknown opcode
	.db $64			  ; $90ae - Unknown opcode
	ADC $54				  ; $90af: 65 54	; Arithmetic
	PHP					  ; $90b1: 08	  
	ROR $82				  ; $90b2: 66 82   
	.db $83			  ; $90b4 - Unknown opcode
	STY $85				  ; $90b5: 84 85   
	STX $87				  ; $90b7: 86 87   
	DEY					  ; $90b9: 88	  
	.db $89			  ; $90ba - Unknown opcode
	TXA					  ; $90bb: 8A	  
	.db $8b			  ; $90bc - Unknown opcode
	STY $8e8d				; $90bd: 8C 8D 8E
	.db $8f			  ; $90c0 - Unknown opcode
	BCC $9054				; $90c1: 90 91   
	.db $92			  ; $90c3 - Unknown opcode
	.db $93			  ; $90c4 - Unknown opcode
	STY $94,X				; $90c5: 94 94   
	STA $96,X				; $90c7: 95 96   
	.db $97			  ; $90c9 - Unknown opcode
	TYA					  ; $90ca: 98	  
	STA $9b9a,Y			  ; $90cb: 99 9A 9B
	.db $9c			  ; $90ce - Unknown opcode
	STA $9f9e,X			  ; $90cf: 9D 9E 9F
	LDY #$a1				 ; $90d2: A0 A1   
	LDX #$a3				 ; $90d4: A2 A3   
	LDY $a5				  ; $90d6: A4 A5   
	.db $a7			  ; $90d8 - Unknown opcode
	SED					  ; $90d9: F8	  
	LDX $20				  ; $90da: A6 20   
	.db $93			  ; $90dc - Unknown opcode
	.db $93			  ; $90dd - Unknown opcode
	JSR $ac5c				; $90de: 20 5C AC ; -> sub_AC5C
	BCC $90e9				; $90e1: 90 06   
	ASL $7361				; $90e3: 0E 61 73
	ROL $7362				; $90e6: 2E 62 73
loc_90E9:
	LDA $7363				; $90e9: AD 63 73
	BMI $914b				; $90ec: 30 5D   
	JSR $a8d5				; $90ee: 20 D5 A8 ; -> sub_A8D5
	BRK					  ; $90f1: 00	  
	.db $07			  ; $90f2 - Unknown opcode
	.db $1f			  ; $90f3 - Unknown opcode
	BRK					  ; $90f4: 00	  
	LSR $93				  ; $90f5: 46 93   
	ORA $0c90,Y			  ; $90f7: 19 90 0C
	LDX #$80				 ; $90fa: A2 80   
	LDA $73				  ; $90fc: A5 73   
	BEQ $9102				; $90fe: F0 02   
	LDX #$33				 ; $9100: A2 33   
loc_9102:
	TXA					  ; $9102: 8A	  
	BRK					  ; $9103: 00	  
	PHP					  ; $9104: 08	  
	.db $3f			  ; $9105 - Unknown opcode
	JSR $9383				; $9106: 20 83 93 ; -> sub_9383
	BEQ $913f				; $9109: F0 34   
	LDX $6e				  ; $910b: A6 6E   
	LDA $7362				; $910d: AD 62 73
	STA $70				  ; $9110: 85 70   
	LDA $7361				; $9112: AD 61 73
	BRK					  ; $9115: 00	  
	.db $04			  ; $9116 - Unknown opcode
	.db $73			  ; $9117 - Unknown opcode
	TXA					  ; $9118: 8A	  
	PHA					  ; $9119: 48	  
	JSR $bf2e				; $911a: 20 2E BF ; -> sub_BF2E
	TXA					  ; $911d: 8A	  
	BRK					  ; $911e: 00	  
	.db $64			  ; $911f - Unknown opcode
	.db $d3			  ; $9120 - Unknown opcode
	.db $17			  ; $9121 - Unknown opcode
	BRK					  ; $9122: 00	  
	.db $02			  ; $9123 - Unknown opcode
	.db $4f			  ; $9124 - Unknown opcode
	BRK					  ; $9125: 00	  
	.db $07			  ; $9126 - Unknown opcode
	.db $2f			  ; $9127 - Unknown opcode
	BRK					  ; $9128: 00	  
	.db $27			  ; $9129 - Unknown opcode
	.db $0f			  ; $912a - Unknown opcode
	PLA					  ; $912b: 68	  
	TAX					  ; $912c: AA	  
	BRK					  ; $912d: 00	  
	BRK					  ; $912e: 00	  
	.db $73			  ; $912f - Unknown opcode
	ORA $73				  ; $9130: 05 73   
	BNE $913e				; $9132: D0 0A   
	JSR $9272				; $9134: 20 72 92 ; -> sub_9272
	BRK					  ; $9137: 00	  
	INX					  ; $9138: E8	  
	.db $d3			  ; $9139 - Unknown opcode
	.db $1b			  ; $913a - Unknown opcode
	JSR $938a				; $913b: 20 8A 93 ; -> sub_938A
loc_913E:
	RTS					  ; $913e: 60	  
loc_913F:
	JSR $bf2e				; $913f: 20 2E BF ; -> sub_BF2E
	STA $e400				; $9142: 8D 00 E4
	.db $d3			  ; $9145 - Unknown opcode
	ASL $20				  ; $9146: 06 20   
	TXA					  ; $9148: 8A	  
	.db $93			  ; $9149 - Unknown opcode
	RTS					  ; $914a: 60	  
loc_914B:
	BRK					  ; $914b: 00	  
	.db $07			  ; $914c - Unknown opcode
	.db $1f			  ; $914d - Unknown opcode
	BRK					  ; $914e: 00	  
	AND #$c3				 ; $914f: 29 C3   
	ASL $7590				; $9151: 0E 90 75
	BRK					  ; $9154: 00	  
	AND #$c3				 ; $9155: 29 C3   
	ORA #$90				 ; $9157: 09 90   
	.db $0c			  ; $9159 - Unknown opcode
	LDX #$80				 ; $915a: A2 80   
	LDA $7e				  ; $915c: A5 7E   
	BEQ $9162				; $915e: F0 02   
	LDX #$33				 ; $9160: A2 33   
loc_9162:
	TXA					  ; $9162: 8A	  
	BRK					  ; $9163: 00	  
	PHP					  ; $9164: 08	  
	.db $3f			  ; $9165 - Unknown opcode
	JSR $9383				; $9166: 20 83 93 ; -> sub_9383
	BEQ $91cd				; $9169: F0 62   
	LDX $7b				  ; $916b: A6 7B   
	LDA $7362				; $916d: AD 62 73
	STA $7d				  ; $9170: 85 7D   
	LDA $7361				; $9172: AD 61 73
	BRK					  ; $9175: 00	  
	.db $03			  ; $9176 - Unknown opcode
	.db $b3			  ; $9177 - Unknown opcode
	TXA					  ; $9178: 8A	  
	PHA					  ; $9179: 48	  
	LDA $72e9				; $917a: AD E9 72
	BPL $9192				; $917d: 10 13   
	BRK					  ; $917f: 00	  
	AND $ada3				; $9180: 2D A3 AD
	.db $7f			  ; $9183 - Unknown opcode
	ROR $0329				; $9184: 6E 29 03
	CMP $7e				  ; $9187: C5 7E   
	BNE $9192				; $9189: D0 07   
	JSR $bf2e				; $918b: 20 2E BF ; -> sub_BF2E
	TXA					  ; $918e: 8A	  
	JMP $91a4				; $918f: 4C A4 91
loc_9192:
	LDA $7206				; $9192: AD 06 72
	CMP #$d2				 ; $9195: C9 D2	; Compare with 210
	BNE $91a0				; $9197: D0 07   
	JSR $bf2e				; $9199: 20 2E BF ; -> sub_BF2E
	STA ($4c,X)			  ; $919c: 81 4C   
	LDY $91				  ; $919e: A4 91   
loc_91A0:
	JSR $bf2e				; $91a0: 20 2E BF ; -> sub_BF2E
	.db $87			  ; $91a3 - Unknown opcode
loc_91A4:
	BRK					  ; $91a4: 00	  
	.db $64			  ; $91a5 - Unknown opcode
	.db $d3			  ; $91a6 - Unknown opcode
	ASL $68,X				; $91a7: 16 68   
	TAX					  ; $91a9: AA	  
	PHA					  ; $91aa: 48	  
	JSR $9286				; $91ab: 20 86 92 ; -> sub_9286
	BRK					  ; $91ae: 00	  
	.db $07			  ; $91af - Unknown opcode
	.db $2f			  ; $91b0 - Unknown opcode
	PLA					  ; $91b1: 68	  
	TAX					  ; $91b2: AA	  
	BRK					  ; $91b3: 00	  
	BRK					  ; $91b4: 00	  
	.db $b3			  ; $91b5 - Unknown opcode
	ORA $7f				  ; $91b6: 05 7F   
	BNE $91cc				; $91b8: D0 12   
	BRK					  ; $91ba: 00	  
	.db $13			  ; $91bb - Unknown opcode
	.db $2f			  ; $91bc - Unknown opcode
	JSR $91f3				; $91bd: 20 F3 91 ; -> sub_91F3
	BRK					  ; $91c0: 00	  
	.db $1a			  ; $91c1 - Unknown opcode
	.db $2f			  ; $91c2 - Unknown opcode
	BCS $91cc				; $91c3: B0 07   
	BRK					  ; $91c5: 00	  
	INX					  ; $91c6: E8	  
	.db $d3			  ; $91c7 - Unknown opcode
	PHP					  ; $91c8: 08	  
	JSR $938a				; $91c9: 20 8A 93 ; -> sub_938A
loc_91CC:
	RTS					  ; $91cc: 60	  
loc_91CD:
	BRK					  ; $91cd: 00	  
	.db $07			  ; $91ce - Unknown opcode
	.db $1f			  ; $91cf - Unknown opcode
	LDA $72e9				; $91d0: AD E9 72
	BPL $91e8				; $91d3: 10 13   
	BRK					  ; $91d5: 00	  
	AND $ada3				; $91d6: 2D A3 AD
	.db $7f			  ; $91d9 - Unknown opcode
	ROR $0329				; $91da: 6E 29 03
	CMP $7e				  ; $91dd: C5 7E   
	BNE $91e8				; $91df: D0 07   
	JSR $bf2e				; $91e1: 20 2E BF ; -> sub_BF2E
	STA $ec4c				; $91e4: 8D 4C EC
	STA ($20),Y			  ; $91e7: 91 20   
	ROL $8cbf				; $91e9: 2E BF 8C
	BRK					  ; $91ec: 00	  
	CPX $d3				  ; $91ed: E4 D3   
	.db $07			  ; $91ef - Unknown opcode
	JMP $938a				; $91f0: 4C 8A 93

; ---- Subroutine at $91f3 (Bank 17) ----
sub_91F3:
	JSR $9290				; $91f3: 20 90 92 ; -> sub_9290
	LDA $72e4				; $91f6: AD E4 72
	ORA #$10				 ; $91f9: 09 10   
	STA $72e4				; $91fb: 8D E4 72

; ---- Subroutine at $91fe (Bank 17) ----
sub_91FE:
	JSR $92ae				; $91fe: 20 AE 92 ; -> sub_92AE
	STX $7200				; $9201: 8E 00 72

; ---- Subroutine at $9204 (Bank 17) ----
sub_9204:
	LDA $6e45				; $9204: AD 45 6E
	CMP #$ae				 ; $9207: C9 AE	; Compare with 174
	BNE $9215				; $9209: D0 0A   
	LDA $7206				; $920b: AD 06 72
	CMP #$d2				 ; $920e: C9 D2	; Compare with 210
	BNE $9235				; $9210: D0 23   
	INC $6e7e				; $9212: EE 7E 6E
loc_9215:
	JSR $927c				; $9215: 20 7C 92 ; -> sub_927C
	JSR $92c7				; $9218: 20 C7 92 ; -> sub_92C7
	BRK					  ; $921b: 00	  
	.db $2b			  ; $921c - Unknown opcode
	.db $c3			  ; $921d - Unknown opcode
	ASL $cf20				; $921e: 0E 20 CF
	.db $92			  ; $9221 - Unknown opcode
	RTS					  ; $9222: 60	  

; ---- Subroutine at $9223 (Bank 17) ----
sub_9223:
	LDA $6e45				; $9223: AD 45 6E
	CMP #$ae				 ; $9226: C9 AE	; Compare with 174
	BNE $926a				; $9228: D0 40   
	LDA $6e7e				; $922a: AD 7E 6E
	CMP #$03				 ; $922d: C9 03	; Compare with 3
	BNE $926a				; $922f: D0 39   
	BRK					  ; $9231: 00	  
	CPX #$d3				 ; $9232: E0 D3   
	DEY					  ; $9234: 88	  
loc_9235:
	BRK					  ; $9235: 00	  
	ASL $4f,X				; $9236: 16 4F   
	INC $6e7e				; $9238: EE 7E 6E
	LDX $6e7e				; $923b: AE 7E 6E
	LDA $926a,X			  ; $923e: BD 6A 92
	STA $7206				; $9241: 8D 06 72
	LDX #$00				 ; $9244: A2 00   
	STX $720a				; $9246: 8E 0A 72
	TXA					  ; $9249: 8A	  
	BRK					  ; $924a: 00	  
	AND ($b3),Y			  ; $924b: 31 B3   
	BRK					  ; $924d: 00	  
	ORA $ad2f,Y			  ; $924e: 19 2F AD
	ROR $c96e,X			  ; $9251: 7E 6E C9
	.db $04			  ; $9254 - Unknown opcode
	BEQ $9260				; $9255: F0 09   
	LDA $6e44				; $9257: AD 44 6E
	ORA #$03				 ; $925a: 09 03   
	STA $6e44				; $925c: 8D 44 6E
	RTS					  ; $925f: 60	  
loc_9260:
	LDA $6e44				; $9260: AD 44 6E
	AND #$fc				 ; $9263: 29 FC   
	ORA #$02				 ; $9265: 09 02   
	STA $6e44				; $9267: 8D 44 6E
loc_926A:
	RTS					  ; $926a: 60	  
	CMP $cece				; $926b: CD CE CE
	.db $cf			  ; $926e - Unknown opcode
	BNE $9242				; $926f: D0 D1   
	.db $d2			  ; $9271 - Unknown opcode

; ---- Subroutine at $9272 (Bank 17) ----
sub_9272:
	BRK					  ; $9272: 00	  
	EOR $93				  ; $9273: 45 93   
	.db $07			  ; $9275 - Unknown opcode
	BRK					  ; $9276: 00	  
	.db $27			  ; $9277 - Unknown opcode
	.db $0f			  ; $9278 - Unknown opcode
	JMP $92cf				; $9279: 4C CF 92

; ---- Subroutine at $927c (Bank 17) ----
sub_927C:
	TXA					  ; $927c: 8A	  
	PHA					  ; $927d: 48	  
	STA $c7				  ; $927e: 85 C7   
	BRK					  ; $9280: 00	  
	BRK					  ; $9281: 00	  
	.db $4f			  ; $9282 - Unknown opcode
	PLA					  ; $9283: 68	  
	TAX					  ; $9284: AA	  
	RTS					  ; $9285: 60	  

; ---- Subroutine at $9286 (Bank 17) ----
sub_9286:
	TXA					  ; $9286: 8A	  
	PHA					  ; $9287: 48	  
	STA $c7				  ; $9288: 85 C7   
	BRK					  ; $928a: 00	  
	ORA ($4f,X)			  ; $928b: 01 4F   
	PLA					  ; $928d: 68	  
	TAX					  ; $928e: AA	  
	RTS					  ; $928f: 60	  

; ---- Subroutine at $9290 (Bank 17) ----
sub_9290:
	BRK					  ; $9290: 00	  
	AND #$c3				 ; $9291: 29 C3   
	PHP					  ; $9293: 08	  
	BCS $92c6				; $9294: B0 30   
	BRK					  ; $9296: 00	  
	.db $1a			  ; $9297 - Unknown opcode
	.db $b3			  ; $9298 - Unknown opcode
	CLC					  ; $9299: 18	  
	ADC $7203				; $929a: 6D 03 72 ; Arithmetic
	STA $7203				; $929d: 8D 03 72
	LDA $7f				  ; $92a0: A5 7F   
	ADC $7204				; $92a2: 6D 04 72 ; Arithmetic
	STA $7204				; $92a5: 8D 04 72
	BCC $92c6				; $92a8: 90 1C   
	INC $7205				; $92aa: EE 05 72
	RTS					  ; $92ad: 60	  

; ---- Subroutine at $92ae (Bank 17) ----
sub_92AE:
	BRK					  ; $92ae: 00	  
	AND #$c3				 ; $92af: 29 C3   
	PHP					  ; $92b1: 08	  
	BCS $92c6				; $92b2: B0 12   
	BRK					  ; $92b4: 00	  
	.db $1b			  ; $92b5 - Unknown opcode
	.db $b3			  ; $92b6 - Unknown opcode
	CLC					  ; $92b7: 18	  
	ADC $7201				; $92b8: 6D 01 72 ; Arithmetic
	STA $7201				; $92bb: 8D 01 72
	LDA $7f				  ; $92be: A5 7F   
	ADC $7202				; $92c0: 6D 02 72 ; Arithmetic
	STA $7202				; $92c3: 8D 02 72
loc_92C6:
	RTS					  ; $92c6: 60	  

; ---- Subroutine at $92c7 (Bank 17) ----
sub_92C7:
	LDA #$ff				 ; $92c7: A9 FF   
	STA $7d				  ; $92c9: 85 7D   
	BRK					  ; $92cb: 00	  
	.db $03			  ; $92cc - Unknown opcode
	.db $b3			  ; $92cd - Unknown opcode
	RTS					  ; $92ce: 60	  

; ---- Subroutine at $92cf (Bank 17) ----
sub_92CF:
	LDA $72e9				; $92cf: AD E9 72
	BMI $9334				; $92d2: 30 60   
	LDA $72e7				; $92d4: AD E7 72
	AND #$60				 ; $92d7: 29 60   
	BNE $9333				; $92d9: D0 58   
	LDX #$ff				 ; $92db: A2 FF   
	BRK					  ; $92dd: 00	  
	AND #$c3				 ; $92de: 29 C3   
	ASL $33f0				; $92e0: 0E F0 33
	PHA					  ; $92e3: 48	  
	BRK					  ; $92e4: 00	  
	AND #$c3				 ; $92e5: 29 C3   
	ASL					  ; $92e7: 0A	  
	EOR #$ff				 ; $92e8: 49 FF   
	STA $7e				  ; $92ea: 85 7E   
	PLA					  ; $92ec: 68	  
	AND $7e				  ; $92ed: 25 7E   
	BEQ $9316				; $92ef: F0 25   
	BRK					  ; $92f1: 00	  
	EOR $9033,X			  ; $92f2: 5D 33 90
	.db $07			  ; $92f5 - Unknown opcode
	LDA $618e				; $92f6: AD 8E 61
	AND #$07				 ; $92f9: 29 07   
	BEQ $9305				; $92fb: F0 08   
	BRK					  ; $92fd: 00	  
	.db $62			  ; $92fe - Unknown opcode
	.db $23			  ; $92ff - Unknown opcode
	.db $4b			  ; $9300 - Unknown opcode
	BEQ $930b				; $9301: F0 08   
	BNE $9321				; $9303: D0 1C   
loc_9305:
	BRK					  ; $9305: 00	  
	.db $62			  ; $9306 - Unknown opcode
	.db $23			  ; $9307 - Unknown opcode
	.db $0b			  ; $9308 - Unknown opcode
	BNE $9321				; $9309: D0 16   
loc_930B:
	LDA $72e7				; $930b: AD E7 72
	AND #$9f				 ; $930e: 29 9F   
	ORA #$40				 ; $9310: 09 40   
	STA $72e7				; $9312: 8D E7 72
	RTS					  ; $9315: 60	  

; ---- Subroutine at $9316 (Bank 17) ----
sub_9316:
	LDA $72e7				; $9316: AD E7 72
	AND #$9f				 ; $9319: 29 9F   
	ORA #$20				 ; $931b: 09 20   
	STA $72e7				; $931d: 8D E7 72
	RTS					  ; $9320: 60	  
loc_9321:
	BRK					  ; $9321: 00	  
	EOR $9033,X			  ; $9322: 5D 33 90
	ORA $8ead				; $9325: 0D AD 8E
	ADC ($29,X)			  ; $9328: 61 29	; Arithmetic
	.db $07			  ; $932a - Unknown opcode
	BEQ $9333				; $932b: F0 06   
	BRK					  ; $932d: 00	  
	.db $62			  ; $932e - Unknown opcode
	.db $23			  ; $932f - Unknown opcode
	.db $4b			  ; $9330 - Unknown opcode
	BEQ $930b				; $9331: F0 D8   
loc_9333:
	RTS					  ; $9333: 60	  
loc_9334:
	LDX #$80				 ; $9334: A2 80   
	BRK					  ; $9336: 00	  
	AND #$c3				 ; $9337: 29 C3   
	ASL $0048				; $9339: 0E 48 00
	AND #$c3				 ; $933c: 29 C3   
	ORA $c568				; $933e: 0D 68 C5
	ROR $14f0,X			  ; $9341: 7E F0 14
	CMP #$01				 ; $9344: C9 01	; Compare with 1
	BNE $9382				; $9346: D0 3A   
	LDX #$ff				 ; $9348: A2 FF   
	BRK					  ; $934a: 00	  
	AND #$c3				 ; $934b: 29 C3   
	ASL $00a2				; $934d: 0E A2 00
loc_9350:
	LSR					  ; $9350: 4A	  
	BCS $9363				; $9351: B0 10   
	INX					  ; $9353: E8	  
	CPX #$04				 ; $9354: E0 04   
	BCC $9350				; $9356: 90 F8   
	JSR $9316				; $9358: 20 16 93 ; -> sub_9316
	LDA $6e7f				; $935b: AD 7F 6E
	AND #$03				 ; $935e: 29 03   
	JMP $937f				; $9360: 4C 7F 93
loc_9363:
	JSR $9316				; $9363: 20 16 93 ; -> sub_9316
	LDA $6e7f				; $9366: AD 7F 6E
	AND #$03				 ; $9369: 29 03   
	STA $6e7f				; $936b: 8D 7F 6E
	CPX $6e7f				; $936e: EC 7F 6E
	BNE $937a				; $9371: D0 07   
	LDA $6e7f				; $9373: AD 7F 6E
	ORA #$40				 ; $9376: 09 40   
	BNE $937f				; $9378: D0 05   
loc_937A:
	LDA $6e7f				; $937a: AD 7F 6E
	ORA #$80				 ; $937d: 09 80   
loc_937F:
	STA $6e7f				; $937f: 8D 7F 6E
loc_9382:
	RTS					  ; $9382: 60	  

; ---- Subroutine at $9383 (Bank 17) ----
sub_9383:
	LDA $7361				; $9383: AD 61 73
	ORA $7362				; $9386: 0D 62 73
	RTS					  ; $9389: 60	  

; ---- Subroutine at $938a (Bank 17) ----
sub_938A:
	LDA $72e7				; $938a: AD E7 72
	ORA #$01				 ; $938d: 09 01   
	STA $72e7				; $938f: 8D E7 72
	RTS					  ; $9392: 60	  
	LDA $72e7				; $9393: AD E7 72
	AND #$fe				 ; $9396: 29 FE   
	STA $72e7				; $9398: 8D E7 72
	RTS					  ; $939b: 60	  

; ---- Subroutine at $939c (Bank 17) ----
sub_939C:
	LDX #$0f				 ; $939c: A2 0F   
	LDA #$00				 ; $939e: A9 00   
loc_93A0:
	STA $7374,X			  ; $93a0: 9D 74 73
	DEX					  ; $93a3: CA	  
	BPL $93a0				; $93a4: 10 FA   
	BRK					  ; $93a6: 00	  
	.db $02			  ; $93a7 - Unknown opcode
	.db $1f			  ; $93a8 - Unknown opcode
	BMI $93ae				; $93a9: 30 03   
	JMP $946d				; $93ab: 4C 6D 94
loc_93AE:
	AND #$7f				 ; $93ae: 29 7F   
	CMP #$08				 ; $93b0: C9 08	; Compare with 8
	BCS $93c9				; $93b2: B0 15   
	PHA					  ; $93b4: 48	  
	TAX					  ; $93b5: AA	  
	BRK					  ; $93b6: 00	  
	AND #$c3				 ; $93b7: 29 C3   
	ASL $0b90				; $93b9: 0E 90 0B
	JSR $99c0				; $93bc: 20 C0 99 ; -> sub_99C0
	PLA					  ; $93bf: 68	  
	ORA #$80				 ; $93c0: 09 80   
	STA $7363				; $93c2: 8D 63 73
	SEC					  ; $93c5: 38	  
	RTS					  ; $93c6: 60	  
	PLA					  ; $93c7: 68	  
	RTS					  ; $93c8: 60	  
loc_93C9:
	SBC #$08				 ; $93c9: E9 08	; Arithmetic
	AND #$03				 ; $93cb: 29 03   
	LDX #$ff				 ; $93cd: A2 FF   
	BRK					  ; $93cf: 00	  
	AND $f0b3				; $93d0: 2D B3 F0
	.db $42			  ; $93d3 - Unknown opcode
	STA tmp0				 ; $93d4: 85 00   
	BRK					  ; $93d6: 00	  
	AND #$c3				 ; $93d7: 29 C3   
	ASL $0025				; $93d9: 0E 25 00
	BEQ $9416				; $93dc: F0 38   
	STA tmp0				 ; $93de: 85 00   
	BRK					  ; $93e0: 00	  
	AND #$c3				 ; $93e1: 29 C3   
	.db $02			  ; $93e3 - Unknown opcode
	EOR #$ff				 ; $93e4: 49 FF   
	AND tmp0				 ; $93e6: 25 00   
	BEQ $93f8				; $93e8: F0 0E   
	STA tmp0				 ; $93ea: 85 00   
	BRK					  ; $93ec: 00	  
	AND #$c3				 ; $93ed: 29 C3   
	ORA $ff49				; $93ef: 0D 49 FF
	AND tmp0				 ; $93f2: 25 00   
	BEQ $93f8				; $93f4: F0 02   
	STA tmp0				 ; $93f6: 85 00   
loc_93F8:
	BRK					  ; $93f8: 00	  
	AND #$c3				 ; $93f9: 29 C3   
	BRK					  ; $93fb: 00	  
	EOR #$ff				 ; $93fc: 49 FF   
	AND tmp0				 ; $93fe: 25 00   
	BEQ $9404				; $9400: F0 02   
	STA tmp0				 ; $9402: 85 00   
loc_9404:
	JSR $94b2				; $9404: 20 B2 94 ; -> sub_94B2
	LDX #$00				 ; $9407: A2 00   
loc_9409:
	LDA $737c,X			  ; $9409: BD 7C 73
	ORA $7374,X			  ; $940c: 1D 74 73
	BNE $9418				; $940f: D0 07   
	INX					  ; $9411: E8	  
	CPX #$08				 ; $9412: E0 08   
	BNE $9409				; $9414: D0 F3   
loc_9416:
	CLC					  ; $9416: 18	  
	RTS					  ; $9417: 60	  
loc_9418:
	LDX #$ff				 ; $9418: A2 FF   
	STX tmp1				 ; $941a: 86 01   
loc_941C:
	INX					  ; $941c: E8	  
	STX tmp2				 ; $941d: 86 02   
	STX tmp3				 ; $941f: 86 03   
loc_9421:
	LDA $737c,X			  ; $9421: BD 7C 73
	BPL $9452				; $9424: 10 2C   
	AND #$7f				 ; $9426: 29 7F   
	BEQ $9439				; $9428: F0 0F   
	LDY tmp3				 ; $942a: A4 03   
	BEQ $9444				; $942c: F0 16   
	CMP tmp3				 ; $942e: C5 03   
	BCC $9439				; $9430: 90 07   
	LDA $7374,X			  ; $9432: BD 74 73
	CMP tmp2				 ; $9435: C5 02   
	BCS $9452				; $9437: B0 19   
loc_9439:
	LDA tmp3				 ; $9439: A5 03   
	BNE $9452				; $943b: D0 15   
	LDA $7374,X			  ; $943d: BD 74 73
	CMP tmp2				 ; $9440: C5 02   
	BCC $9452				; $9442: 90 0E   
loc_9444:
	LDA $737c,X			  ; $9444: BD 7C 73
	AND #$7f				 ; $9447: 29 7F   
	STA tmp3				 ; $9449: 85 03   
	LDA $7374,X			  ; $944b: BD 74 73
	STA tmp2				 ; $944e: 85 02   
	STX tmp1				 ; $9450: 86 01   
loc_9452:
	INX					  ; $9452: E8	  
	CPX #$08				 ; $9453: E0 08   
	BNE $9421				; $9455: D0 CA   
	LDX tmp1				 ; $9457: A6 01   
	LDA $7364,X			  ; $9459: BD 64 73
	STA $7361				; $945c: 8D 61 73
	LDA $736c,X			  ; $945f: BD 6C 73
	STA $7362				; $9462: 8D 62 73
	TXA					  ; $9465: 8A	  
	ORA #$80				 ; $9466: 09 80   
	STA $7363				; $9468: 8D 63 73
	SEC					  ; $946b: 38	  
	RTS					  ; $946c: 60	  
loc_946D:
	STA $7363				; $946d: 8D 63 73
	BRK					  ; $9470: 00	  
	.db $67			  ; $9471 - Unknown opcode
	.db $73			  ; $9472 - Unknown opcode
	TAX					  ; $9473: AA	  
	BRK					  ; $9474: 00	  
	LSR $93				  ; $9475: 46 93   
	.db $07			  ; $9477 - Unknown opcode
	BCC $94b1				; $9478: 90 37   
	BRK					  ; $947a: 00	  
	.db $02			  ; $947b - Unknown opcode
	.db $1f			  ; $947c - Unknown opcode
	TAX					  ; $947d: AA	  
	JSR $9980				; $947e: 20 80 99 ; -> sub_9980
	BRK					  ; $9481: 00	  
	LSR $93				  ; $9482: 46 93   
	.db $12			  ; $9484 - Unknown opcode
	BCS $94b1				; $9485: B0 2A   
	BRK					  ; $9487: 00	  
	LSR $93				  ; $9488: 46 93   
	BPL $941c				; $948a: 10 90   
	.db $23			  ; $948c - Unknown opcode
	BRK					  ; $948d: 00	  
	ORA (system_flags,X)	 ; $948e: 01 1F   
	BMI $94b0				; $9490: 30 1E   
	LSR $0f				  ; $9492: 46 0F   
	ROR $0e				  ; $9494: 66 0E   
	LSR $0f				  ; $9496: 46 0F   
	ROR $0e				  ; $9498: 66 0E   
	LSR $0f				  ; $949a: 46 0F   
	ROR $0e				  ; $949c: 66 0E   
	BRK					  ; $949e: 00	  
	.db $1b			  ; $949f - Unknown opcode
	.db $0f			  ; $94a0 - Unknown opcode
	AND #$03				 ; $94a1: 29 03   
	CLC					  ; $94a3: 18	  
	ADC $0e				  ; $94a4: 65 0E	; Arithmetic
	STA $7361				; $94a6: 8D 61 73
	LDA $0f				  ; $94a9: A5 0F   
	ADC #$00				 ; $94ab: 69 00	; Arithmetic
	STA $7362				; $94ad: 8D 62 73
loc_94B0:
	SEC					  ; $94b0: 38	  
loc_94B1:
	RTS					  ; $94b1: 60	  

; ---- Subroutine at $94b2 (Bank 17) ----
sub_94B2:
	LDX #$00				 ; $94b2: A2 00   
loc_94B4:
	STX $97				  ; $94b4: 86 97   
	LSR tmp0				 ; $94b6: 46 00   
	BCC $950f				; $94b8: 90 55   
	JSR $99c0				; $94ba: 20 C0 99 ; -> sub_99C0
	LDX $97				  ; $94bd: A6 97   
	LDA $7361				; $94bf: AD 61 73
	STA tmp2				 ; $94c2: 85 02   
	STA $7364,X			  ; $94c4: 9D 64 73
	LDA $7362				; $94c7: AD 62 73
	STA tmp3				 ; $94ca: 85 03   
	STA $736c,X			  ; $94cc: 9D 6C 73
	BRK					  ; $94cf: 00	  
	ORA (system_flags,X)	 ; $94d0: 01 1F   
	BRK					  ; $94d2: 00	  
	.db $67			  ; $94d3 - Unknown opcode
	.db $73			  ; $94d4 - Unknown opcode
	TAX					  ; $94d5: AA	  
	LDA #$00				 ; $94d6: A9 00   
	BRK					  ; $94d8: 00	  
	.db $17			  ; $94d9 - Unknown opcode
	.db $0f			  ; $94da - Unknown opcode
	LSR					  ; $94db: 4A	  
	LSR					  ; $94dc: 4A	  
	LDX #$02				 ; $94dd: A2 02   
	JSR $c827				; $94df: 20 27 C8 ; Call to fixed bank
	LDX $97				  ; $94e2: A6 97   
	CLC					  ; $94e4: 18	  
	LDA tmp3				 ; $94e5: A5 03   
	ADC $7364,X			  ; $94e7: 7D 64 73 ; Arithmetic
	STA tmp2				 ; $94ea: 85 02   
	LDA #$00				 ; $94ec: A9 00   
	STA tmp1				 ; $94ee: 85 01   
	ADC $736c,X			  ; $94f0: 7D 6C 73 ; Arithmetic
	STA tmp3				 ; $94f3: 85 03   
	LDX $97				  ; $94f5: A6 97   
	BRK					  ; $94f7: 00	  
	BRK					  ; $94f8: 00	  
	.db $b3			  ; $94f9 - Unknown opcode
	LDX #$01				 ; $94fa: A2 01   
	LDY #$7e				 ; $94fc: A0 7E   
	JSR $9a84				; $94fe: 20 84 9A ; -> sub_9A84
	LDX $97				  ; $9501: A6 97   
	LDA tmp1				 ; $9503: A5 01   
	STA $7374,X			  ; $9505: 9D 74 73
	LDA tmp2				 ; $9508: A5 02   
	ORA #$80				 ; $950a: 09 80   
	STA $737c,X			  ; $950c: 9D 7C 73
loc_950F:
	INX					  ; $950f: E8	  
	CPX #$08				 ; $9510: E0 08   
	BNE $94b4				; $9512: D0 A0   
	RTS					  ; $9514: 60	  
loc_9515:
	JMP $95dd				; $9515: 4C DD 95

; ---- Subroutine at $9518 (Bank 17) ----
sub_9518:
	BRK					  ; $9518: 00	  
	.db $03			  ; $9519 - Unknown opcode
	.db $1f			  ; $951a - Unknown opcode
	CMP #$30				 ; $951b: C9 30	; Compare with 48
	BEQ $9515				; $951d: F0 F6   
	CMP #$31				 ; $951f: C9 31	; Compare with 49
	BEQ $9515				; $9521: F0 F2   
	CMP #$71				 ; $9523: C9 71	; Compare with 113
	BEQ $9515				; $9525: F0 EE   
	CMP #$97				 ; $9527: C9 97	; Compare with 151
	BEQ $9515				; $9529: F0 EA   
	BRK					  ; $952b: 00	  
	ASL $c93f				; $952c: 0E 3F C9
	BRK					  ; $952f: 00	  
	BNE $9535				; $9530: D0 03   
	JMP $95b7				; $9532: 4C B7 95
loc_9535:
	BRK					  ; $9535: 00	  
	.db $02			  ; $9536 - Unknown opcode
	.db $1f			  ; $9537 - Unknown opcode
	BMI $9548				; $9538: 30 0E   
	STA $7363				; $953a: 8D 63 73
	BRK					  ; $953d: 00	  
	.db $67			  ; $953e - Unknown opcode
	.db $73			  ; $953f - Unknown opcode
	TAX					  ; $9540: AA	  
	BRK					  ; $9541: 00	  
	LSR $93				  ; $9542: 46 93   
	.db $07			  ; $9544 - Unknown opcode
	BCC $95c2				; $9545: 90 7B   
	RTS					  ; $9547: 60	  
loc_9548:
	AND #$7f				 ; $9548: 29 7F   
	CMP #$08				 ; $954a: C9 08	; Compare with 8
	BCS $9561				; $954c: B0 13   
	TAX					  ; $954e: AA	  
	ORA #$80				 ; $954f: 09 80   
	STA $7363				; $9551: 8D 63 73
	BRK					  ; $9554: 00	  
	AND #$c3				 ; $9555: 29 C3   
	.db $0f			  ; $9557 - Unknown opcode
	BCC $9560				; $9558: 90 06   
	BRK					  ; $955a: 00	  
	AND #$c3				 ; $955b: 29 C3   
	ASL $6290				; $955d: 0E 90 62
loc_9560:
	RTS					  ; $9560: 60	  
loc_9561:
	SBC #$08				 ; $9561: E9 08	; Arithmetic
	AND #$03				 ; $9563: 29 03   
	LDX #$ff				 ; $9565: A2 FF   
	BRK					  ; $9567: 00	  
	AND $85b3				; $9568: 2D B3 85
	BRK					  ; $956b: 00	  
	BEQ $95d0				; $956c: F0 62   
	BRK					  ; $956e: 00	  
	AND #$c3				 ; $956f: 29 C3   
	ASL $0025				; $9571: 0E 25 00
	BEQ $95bf				; $9574: F0 49   
	STA tmp0				 ; $9576: 85 00   
	BRK					  ; $9578: 00	  
	AND #$c3				 ; $9579: 29 C3   
	ORA $ff49				; $957b: 0D 49 FF
	AND tmp0				 ; $957e: 25 00   
	BEQ $9584				; $9580: F0 02   
	STA tmp0				 ; $9582: 85 00   
loc_9584:
	BRK					  ; $9584: 00	  
	.db $03			  ; $9585 - Unknown opcode
	.db $1f			  ; $9586 - Unknown opcode
	CMP #$3c				 ; $9587: C9 3C	; Compare with 60
	BCS $95a5				; $9589: B0 1A   
	LDX #$ff				 ; $958b: A2 FF   
	BRK					  ; $958d: 00	  
	AND #$c3				 ; $958e: 29 C3   
	ASL $49				  ; $9590: 06 49   
	.db $ff			  ; $9592 - Unknown opcode
	AND tmp0				 ; $9593: 25 00   
	BEQ $9599				; $9595: F0 02   
	STA tmp0				 ; $9597: 85 00   
loc_9599:
	BRK					  ; $9599: 00	  
	AND #$c3				 ; $959a: 29 C3   
	.db $07			  ; $959c - Unknown opcode
	EOR #$ff				 ; $959d: 49 FF   
	AND tmp0				 ; $959f: 25 00   
	BEQ $95a5				; $95a1: F0 02   
	STA tmp0				 ; $95a3: 85 00   
loc_95A5:
	BRK					  ; $95a5: 00	  
	AND #$c3				 ; $95a6: 29 C3   
	.db $02			  ; $95a8 - Unknown opcode
	EOR #$ff				 ; $95a9: 49 FF   
	AND tmp0				 ; $95ab: 25 00   
	BEQ $95b1				; $95ad: F0 02   
	STA tmp0				 ; $95af: 85 00   
loc_95B1:
	JSR $95d2				; $95b1: 20 D2 95 ; -> sub_95D2
	BCC $95c2				; $95b4: 90 0C   
	RTS					  ; $95b6: 60	  
loc_95B7:
	BRK					  ; $95b7: 00	  
	ORA (system_flags,X)	 ; $95b8: 01 1F   
	STA $7363				; $95ba: 8D 63 73
	SEC					  ; $95bd: 38	  
	RTS					  ; $95be: 60	  
loc_95BF:
	JSR $95d2				; $95bf: 20 D2 95 ; -> sub_95D2
loc_95C2:
	BRK					  ; $95c2: 00	  
	.db $07			  ; $95c3 - Unknown opcode
	.db $1f			  ; $95c4 - Unknown opcode
	BCC $95cc				; $95c5: 90 05   
	BRK					  ; $95c7: 00	  
	ASL system_flags		 ; $95c8: 06 1F   
	BCC $95d0				; $95ca: 90 04   
loc_95CC:
	BRK					  ; $95cc: 00	  
	CPX $d3				  ; $95cd: E4 D3   
	ROR $6018				; $95cf: 6E 18 60

; ---- Subroutine at $95d2 (Bank 17) ----
sub_95D2:
	LDA tmp0				 ; $95d2: A5 00   
	BRK					  ; $95d4: 00	  
	.db $2b			  ; $95d5 - Unknown opcode
	.db $0f			  ; $95d6 - Unknown opcode
	ORA #$80				 ; $95d7: 09 80   
	STA $7363				; $95d9: 8D 63 73
	RTS					  ; $95dc: 60	  
loc_95DD:
	BRK					  ; $95dd: 00	  
	.db $02			  ; $95de - Unknown opcode
	.db $1f			  ; $95df - Unknown opcode
	BMI $95e7				; $95e0: 30 05   
	STA $7363				; $95e2: 8D 63 73
	SEC					  ; $95e5: 38	  
	RTS					  ; $95e6: 60	  
loc_95E7:
	AND #$7f				 ; $95e7: 29 7F   
	CMP #$08				 ; $95e9: C9 08	; Compare with 8
	BCS $95f5				; $95eb: B0 08   
	TAX					  ; $95ed: AA	  
	ORA #$80				 ; $95ee: 09 80   
	STA $7363				; $95f0: 8D 63 73
	SEC					  ; $95f3: 38	  
	RTS					  ; $95f4: 60	  
loc_95F5:
	SBC #$08				 ; $95f5: E9 08	; Arithmetic
	AND #$03				 ; $95f7: 29 03   
	LDX #$ff				 ; $95f9: A2 FF   
	BRK					  ; $95fb: 00	  
	AND $85b3				; $95fc: 2D B3 85
	BRK					  ; $95ff: 00	  
	BRK					  ; $9600: 00	  
	AND #$c3				 ; $9601: 29 C3   
	ASL $ff49				; $9603: 0E 49 FF
	AND tmp0				 ; $9606: 25 00   
	BRK					  ; $9608: 00	  
	.db $2b			  ; $9609 - Unknown opcode
	.db $0f			  ; $960a - Unknown opcode
	ORA #$80				 ; $960b: 09 80   
	STA $7363				; $960d: 8D 63 73
	RTS					  ; $9610: 60	  

; ---- Subroutine at $9611 (Bank 17) ----
sub_9611:
	BRK					  ; $9611: 00	  
	.db $02			  ; $9612 - Unknown opcode
	.db $1f			  ; $9613 - Unknown opcode
	BPL $9689				; $9614: 10 73   
	LDX #$ff				 ; $9616: A2 FF   
	BRK					  ; $9618: 00	  
	AND #$c3				 ; $9619: 29 C3   
	ASL $0300				; $961b: 0E 00 03
	.db $1f			  ; $961e - Unknown opcode
	CMP #$30				 ; $961f: C9 30	; Compare with 48
	BEQ $9632				; $9621: F0 0F   
	CMP #$31				 ; $9623: C9 31	; Compare with 49
	BEQ $9632				; $9625: F0 0B   
	CMP #$32				 ; $9627: C9 32	; Compare with 50
	BNE $9638				; $9629: D0 0D   
	BRK					  ; $962b: 00	  
	AND #$c3				 ; $962c: 29 C3   
	.db $0f			  ; $962e - Unknown opcode
	JMP $9638				; $962f: 4C 38 96
loc_9632:
	LDA $7e				  ; $9632: A5 7E   
	EOR #$ff				 ; $9634: 49 FF   
	STA $7e				  ; $9636: 85 7E   
loc_9638:
	LDA $7e				  ; $9638: A5 7E   
	STA tmp0				 ; $963a: 85 00   
	BRK					  ; $963c: 00	  
	.db $03			  ; $963d - Unknown opcode
	.db $1f			  ; $963e - Unknown opcode
	BRK					  ; $963f: 00	  
	ASL $c93f				; $9640: 0E 3F C9
	.db $03			  ; $9643 - Unknown opcode
	BEQ $9657				; $9644: F0 11   
	BRK					  ; $9646: 00	  
	.db $02			  ; $9647 - Unknown opcode
	.db $1f			  ; $9648 - Unknown opcode
	AND #$7f				 ; $9649: 29 7F   
	SEC					  ; $964b: 38	  
	SBC #$08				 ; $964c: E9 08	; Arithmetic
	LDX #$ff				 ; $964e: A2 FF   
	BRK					  ; $9650: 00	  
	AND $25b3				; $9651: 2D B3 25
	BRK					  ; $9654: 00	  
	STA tmp0				 ; $9655: 85 00   
loc_9657:
	JSR $96d1				; $9657: 20 D1 96 ; -> sub_96D1
	LDA $735e				; $965a: AD 5E 73
	ORA #$80				 ; $965d: 09 80   
	STA $7363				; $965f: 8D 63 73
	PHP					  ; $9662: 08	  
	LDA $72e9				; $9663: AD E9 72
	BMI $966a				; $9666: 30 02   
	PLP					  ; $9668: 28	  
	RTS					  ; $9669: 60	  
loc_966A:
	BRK					  ; $966a: 00	  
	.db $03			  ; $966b - Unknown opcode
	.db $1f			  ; $966c - Unknown opcode
	BRK					  ; $966d: 00	  
	.db $0c			  ; $966e - Unknown opcode
	.db $3f			  ; $966f - Unknown opcode
	BCC $967c				; $9670: 90 0A   
	BRK					  ; $9672: 00	  
	ORA (system_flags,X)	 ; $9673: 01 1F   
	CMP $7363				; $9675: CD 63 73
	BEQ $9686				; $9678: F0 0C   
	PLP					  ; $967a: 28	  
	RTS					  ; $967b: 60	  
loc_967C:
	BRK					  ; $967c: 00	  
	ORA (system_flags,X)	 ; $967d: 01 1F   
	CMP $7363				; $967f: CD 63 73
	BNE $9686				; $9682: D0 02   
	PLP					  ; $9684: 28	  
	RTS					  ; $9685: 60	  
loc_9686:
	PLP					  ; $9686: 28	  
	CLC					  ; $9687: 18	  
	RTS					  ; $9688: 60	  
loc_9689:
	LDA #$07				 ; $9689: A9 07   
	BRK					  ; $968b: 00	  
	BIT $850f				; $968c: 2C 0F 85
	BRK					  ; $968f: 00	  
	BRK					  ; $9690: 00	  
	.db $03			  ; $9691 - Unknown opcode
	.db $1f			  ; $9692 - Unknown opcode
	CMP #$e8				 ; $9693: C9 E8	; Compare with 232
	BEQ $969f				; $9695: F0 08   
	CMP #$30				 ; $9697: C9 30	; Compare with 48
	BCC $96b1				; $9699: 90 16   
	CMP #$33				 ; $969b: C9 33	; Compare with 51
	BCS $96b1				; $969d: B0 12   
loc_969F:
	JSR $96d1				; $969f: 20 D1 96 ; -> sub_96D1
	BCS $96b6				; $96a2: B0 12   
	BRK					  ; $96a4: 00	  
	.db $62			  ; $96a5 - Unknown opcode
	.db $23			  ; $96a6 - Unknown opcode
	RTI					  ; $96a7: 40	  
	LDA $735e				; $96a8: AD 5E 73
	CMP $72				  ; $96ab: C5 72   
	BCS $96c1				; $96ad: B0 12   
	BCC $96b6				; $96af: 90 05   
loc_96B1:
	JSR $96d1				; $96b1: 20 D1 96 ; -> sub_96D1
	BCC $96c1				; $96b4: 90 0B   
loc_96B6:
	LDX $735e				; $96b6: AE 5E 73
	BRK					  ; $96b9: 00	  
	PLA					  ; $96ba: 68	  
	.db $73			  ; $96bb - Unknown opcode
	STA $7363				; $96bc: 8D 63 73
	SEC					  ; $96bf: 38	  
	RTS					  ; $96c0: 60	  
loc_96C1:
	CLC					  ; $96c1: 18	  
	RTS					  ; $96c2: 60	  

; ---- Subroutine at $96c3 (Bank 17) ----
sub_96C3:
	BRK					  ; $96c3: 00	  
	.db $02			  ; $96c4 - Unknown opcode
	.db $1f			  ; $96c5 - Unknown opcode
	BPL $9689				; $96c6: 10 C1   
	LDX #$ff				 ; $96c8: A2 FF   
	BRK					  ; $96ca: 00	  
	AND #$c3				 ; $96cb: 29 C3   
	ASL $554c				; $96cd: 0E 4C 55
	STX $ae,Y				; $96d0: 96 AE   
	LSR $4673,X			  ; $96d2: 5E 73 46
	BRK					  ; $96d5: 00	  
	DEX					  ; $96d6: CA	  
	BPL $96d4				; $96d7: 10 FB   
	RTS					  ; $96d9: 60	  
loc_96DA:
	RTS					  ; $96da: 60	  

; ---- Subroutine at $96db (Bank 17) ----
sub_96DB:
	LSR $72e7				; $96db: 4E E7 72
	ASL $72e7				; $96de: 0E E7 72
	BRK					  ; $96e1: 00	  
	ASL system_flags		 ; $96e2: 06 1F   
	BCS $970c				; $96e4: B0 26   
	BRK					  ; $96e6: 00	  
	.db $3b			  ; $96e7 - Unknown opcode
	.db $93			  ; $96e8 - Unknown opcode
	BRK					  ; $96e9: 00	  
	CMP #$96				 ; $96ea: C9 96	; Compare with 150
	BNE $970c				; $96ec: D0 1E   
	JSR $970c				; $96ee: 20 0C 97 ; -> sub_970C
	LDA $72e7				; $96f1: AD E7 72
	AND #$60				 ; $96f4: 29 60   
	BNE $9772				; $96f6: D0 7A   
	LDA $6e44				; $96f8: AD 44 6E
	LSR					  ; $96fb: 4A	  
	BCS $9772				; $96fc: B0 74   
	BRK					  ; $96fe: 00	  
	.db $13			  ; $96ff - Unknown opcode
	.db $2f			  ; $9700 - Unknown opcode
	LDA #$01				 ; $9701: A9 01   
	STA $735f				; $9703: 8D 5F 73
	STA $7360				; $9706: 8D 60 73
	BRK					  ; $9709: 00	  
	ASL $6f				  ; $970a: 06 6F   

; ---- Subroutine at $970c (Bank 17) ----
sub_970C:
	JSR $939c				; $970c: 20 9C 93 ; -> sub_939C
	BCC $9772				; $970f: 90 61   
	BRK					  ; $9711: 00	  
	.db $07			  ; $9712 - Unknown opcode
	.db $1f			  ; $9713 - Unknown opcode
	BCC $971b				; $9714: 90 05   
	JSR $acbf				; $9716: 20 BF AC ; -> sub_ACBF
	BCC $96da				; $9719: 90 BF   
loc_971B:
	BRK					  ; $971b: 00	  
	ASL system_flags		 ; $971c: 06 1F   
	BCC $9775				; $971e: 90 55   
	BRK					  ; $9720: 00	  
	AND #$c3				 ; $9721: 29 C3   
	.db $04			  ; $9723 - Unknown opcode
	BCC $972b				; $9724: 90 05   
	JSR $97e6				; $9726: 20 E6 97 ; -> sub_97E6
	BCC $9789				; $9729: 90 5E   
loc_972B:
	JSR $a63e				; $972b: 20 3E A6 ; -> sub_A63E
	BCC $96da				; $972e: 90 AA   
	BRK					  ; $9730: 00	  
	AND #$c3				 ; $9731: 29 C3   
	ORA $90				  ; $9733: 05 90   
	.db $03			  ; $9735 - Unknown opcode
	JSR $9817				; $9736: 20 17 98 ; -> sub_9817
	BRK					  ; $9739: 00	  
	.db $07			  ; $973a - Unknown opcode
	.db $1f			  ; $973b - Unknown opcode
	BCS $976f				; $973c: B0 31   
	STA tmp1				 ; $973e: 85 01   
	BRK					  ; $9740: 00	  
	BRK					  ; $9741: 00	  
	.db $53			  ; $9742 - Unknown opcode
	SEC					  ; $9743: 38	  
	SBC $7361				; $9744: ED 61 73 ; Arithmetic
	LDA $73				  ; $9747: A5 73   
	SBC $7362				; $9749: ED 62 73 ; Arithmetic
	BCS $976f				; $974c: B0 21   
	JSR $b31f				; $974e: 20 1F B3 ; -> sub_B31F
	BCC $976f				; $9751: 90 1C   
	CMP tmp1				 ; $9753: C5 01   
	BEQ $976f				; $9755: F0 18   
	BRK					  ; $9757: 00	  
	.db $1b			  ; $9758 - Unknown opcode
	.db $0f			  ; $9759 - Unknown opcode
	CMP #$40				 ; $975a: C9 40	; Compare with 64
	BCS $976f				; $975c: B0 11   
	LDA tmp0				 ; $975e: A5 00   
	STA $fa				  ; $9760: 85 FA   
	PHA					  ; $9762: 48	  
	BRK					  ; $9763: 00	  
	CPX $d3				  ; $9764: E4 D3   
	EOR #$68				 ; $9766: 49 68   
	TAX					  ; $9768: AA	  
	BRK					  ; $9769: 00	  
	PLA					  ; $976a: 68	  
	.db $73			  ; $976b - Unknown opcode
	STA $7363				; $976c: 8D 63 73
loc_976F:
	JMP $97da				; $976f: 4C DA 97
loc_9772:
	JMP $97e5				; $9772: 4C E5 97
loc_9775:
	JSR $9851				; $9775: 20 51 98 ; -> sub_9851
	JSR $a69f				; $9778: 20 9F A6 ; -> sub_A69F
	BCS $97e5				; $977b: B0 68   
	BRK					  ; $977d: 00	  
	ASL system_flags		 ; $977e: 06 1F   
	BRK					  ; $9780: 00	  
	LSR $93				  ; $9781: 46 93   
	.db $14			  ; $9783 - Unknown opcode
	BCC $978b				; $9784: 90 05   
	JSR $97e6				; $9786: 20 E6 97 ; -> sub_97E6
loc_9789:
	BCC $97ec				; $9789: 90 61   
loc_978B:
	JSR $a63e				; $978b: 20 3E A6 ; -> sub_A63E
	BCC $97e5				; $978e: 90 55   
	JSR $a6e3				; $9790: 20 E3 A6 ; -> sub_A6E3
	BCS $97cc				; $9793: B0 37   
	BRK					  ; $9795: 00	  
	ASL system_flags		 ; $9796: 06 1F   
	BRK					  ; $9798: 00	  
	LSR $93				  ; $9799: 46 93   
	ORA $90,X				; $979b: 15 90   
	ASL $20				  ; $979d: 06 20   
	.db $17			  ; $979f - Unknown opcode
	TYA					  ; $97a0: 98	  
	JMP $97d7				; $97a1: 4C D7 97
	LDA $72e7				; $97a4: AD E7 72
	AND #$08				 ; $97a7: 29 08   
	BEQ $97d7				; $97a9: F0 2C   
	LDA $72e4				; $97ab: AD E4 72
	AND #$08				 ; $97ae: 29 08   
	BNE $97cc				; $97b0: D0 1A   
	LDA #$04				 ; $97b2: A9 04   
	STA tmp0				 ; $97b4: 85 00   
	BRK					  ; $97b6: 00	  
	ASL system_flags		 ; $97b7: 06 1F   
	BRK					  ; $97b9: 00	  
	.db $2b			  ; $97ba - Unknown opcode
	.db $53			  ; $97bb - Unknown opcode
	CMP #$07				 ; $97bc: C9 07	; Compare with 7
	BNE $97c5				; $97be: D0 05   
	BRK					  ; $97c0: 00	  
	.db $0f			  ; $97c1 - Unknown opcode
	.db $53			  ; $97c2 - Unknown opcode
	STA tmp0				 ; $97c3: 85 00   
loc_97C5:
	BRK					  ; $97c5: 00	  
	.db $1b			  ; $97c6 - Unknown opcode
	.db $0f			  ; $97c7 - Unknown opcode
	CMP tmp0				 ; $97c8: C5 00   
	BCS $97d7				; $97ca: B0 0B   
loc_97CC:
	JSR $9916				; $97cc: 20 16 99 ; -> sub_9916
	JSR $bf2e				; $97cf: 20 2E BF ; -> sub_BF2E
	DEY					  ; $97d2: 88	  
	BRK					  ; $97d3: 00	  
	.db $f2			  ; $97d4 - Unknown opcode
	.db $d3			  ; $97d5 - Unknown opcode
	.db $04			  ; $97d6 - Unknown opcode
loc_97D7:
	JSR $a78b				; $97d7: 20 8B A7 ; -> sub_A78B
loc_97DA:
	JSR $9878				; $97da: 20 78 98 ; -> sub_9878
	BCC $97e5				; $97dd: 90 06   
	JSR $90db				; $97df: 20 DB 90 ; -> sub_90DB
	JSR $a7c4				; $97e2: 20 C4 A7 ; -> sub_A7C4
loc_97E5:
	RTS					  ; $97e5: 60	  

; ---- Subroutine at $97e6 (Bank 17) ----
sub_97E6:
	BRK					  ; $97e6: 00	  
	.db $1b			  ; $97e7 - Unknown opcode
	.db $0f			  ; $97e8 - Unknown opcode
	CMP #$c0				 ; $97e9: C9 C0	; Compare with 192
	RTS					  ; $97eb: 60	  
loc_97EC:
	JSR $938a				; $97ec: 20 8A 93 ; -> sub_938A
	BRK					  ; $97ef: 00	  
	ASL system_flags		 ; $97f0: 06 1F   
	BCC $980e				; $97f2: 90 1A   
	LDA $72e9				; $97f4: AD E9 72
	BPL $9805				; $97f7: 10 0C   
	BRK					  ; $97f9: 00	  
	AND $ada3				; $97fa: 2D A3 AD
	.db $7f			  ; $97fd - Unknown opcode
	ROR $0329				; $97fe: 6E 29 03
	CMP $7e				  ; $9801: C5 7E   
	BEQ $980e				; $9803: F0 09   
loc_9805:
	JSR $bf2e				; $9805: 20 2E BF ; -> sub_BF2E
	STA $e400				; $9808: 8D 00 E4
	.db $d3			  ; $980b - Unknown opcode
	ASL $60				  ; $980c: 06 60   
loc_980E:
	JSR $bf2e				; $980e: 20 2E BF ; -> sub_BF2E
	STY $e400				; $9811: 8C 00 E4
	.db $d3			  ; $9814 - Unknown opcode
	.db $07			  ; $9815 - Unknown opcode
	RTS					  ; $9816: 60	  

; ---- Subroutine at $9817 (Bank 17) ----
sub_9817:
	ASL $7361				; $9817: 0E 61 73
	ROL $7362				; $981a: 2E 62 73
	RTS					  ; $981d: 60	  

; ---- Subroutine at $981e (Bank 17) ----
sub_981E:
	LSR $7362				; $981e: 4E 62 73
	ROR $7361				; $9821: 6E 61 73
	JSR $9832				; $9824: 20 32 98 ; -> sub_9832
	LDX #$00				 ; $9827: A2 00   
	LDA #$03				 ; $9829: A9 03   
	JSR $c827				; $982b: 20 27 C8 ; Call to fixed bank
	JSR $983d				; $982e: 20 3D 98 ; -> sub_983D
	RTS					  ; $9831: 60	  

; ---- Subroutine at $9832 (Bank 17) ----
sub_9832:
	LDA $7361				; $9832: AD 61 73
	STA tmp0				 ; $9835: 85 00   
	LDA $7362				; $9837: AD 62 73
	STA tmp1				 ; $983a: 85 01   
	RTS					  ; $983c: 60	  

; ---- Subroutine at $983d (Bank 17) ----
sub_983D:
	LDA tmp0				 ; $983d: A5 00   
	STA $7361				; $983f: 8D 61 73
	LDA tmp1				 ; $9842: A5 01   
	STA $7362				; $9844: 8D 62 73
	RTS					  ; $9847: 60	  

; ---- Subroutine at $9848 (Bank 17) ----
sub_9848:
	BRK					  ; $9848: 00	  
	ASL system_flags		 ; $9849: 06 1F   
	LDA #$00				 ; $984b: A9 00   
	BRK					  ; $984d: 00	  
	.db $3b			  ; $984e - Unknown opcode
	.db $73			  ; $984f - Unknown opcode
	RTS					  ; $9850: 60	  

; ---- Subroutine at $9851 (Bank 17) ----
sub_9851:
	LDA $72e7				; $9851: AD E7 72
	ORA #$08				 ; $9854: 09 08   
	STA $72e7				; $9856: 8D E7 72
	RTS					  ; $9859: 60	  

; ---- Subroutine at $985a (Bank 17) ----
sub_985A:
	LDA $72e7				; $985a: AD E7 72
	AND #$f7				 ; $985d: 29 F7   
	STA $72e7				; $985f: 8D E7 72
	RTS					  ; $9862: 60	  

; ---- Subroutine at $9863 (Bank 17) ----
sub_9863:
	LSR $7362				; $9863: 4E 62 73
	ROR $7361				; $9866: 6E 61 73
	LSR $7362				; $9869: 4E 62 73
	ROR $7361				; $986c: 6E 61 73
	INC $7361				; $986f: EE 61 73
	BNE $9877				; $9872: D0 03   
	INC $7362				; $9874: EE 62 73
loc_9877:
	RTS					  ; $9877: 60	  

; ---- Subroutine at $9878 (Bank 17) ----
sub_9878:
	LDA $72e9				; $9878: AD E9 72
	BMI $98ab				; $987b: 30 2E   
	JSR $c891				; $987d: 20 91 C8 ; Call to fixed bank
	CMP #$6e				 ; $9880: C9 6E	; Compare with 110
	BCS $98ab				; $9882: B0 27   
	LDA $7363				; $9884: AD 63 73
	BPL $98ab				; $9887: 10 22   
	AND #$7f				 ; $9889: 29 7F   
	TAX					  ; $988b: AA	  
	BRK					  ; $988c: 00	  
	AND $aaa3				; $988d: 2D A3 AA
	LDA $6e45,X			  ; $9890: BD 45 6E
	CMP #$0d				 ; $9893: C9 0D	; Compare with 13
	BEQ $989b				; $9895: F0 04   
	CMP #$9f				 ; $9897: C9 9F	; Compare with 159
	BNE $98ab				; $9899: D0 10   
loc_989B:
	TXA					  ; $989b: 8A	  
	PHA					  ; $989c: 48	  
	LDA $7363				; $989d: AD 63 73
	AND #$7f				 ; $98a0: 29 7F   
	STA $c7				  ; $98a2: 85 C7   
	BRK					  ; $98a4: 00	  
	CLC					  ; $98a5: 18	  
	.db $4f			  ; $98a6 - Unknown opcode
	BCS $98ad				; $98a7: B0 04   
	PLA					  ; $98a9: 68	  
	TAX					  ; $98aa: AA	  
loc_98AB:
	SEC					  ; $98ab: 38	  
	RTS					  ; $98ac: 60	  
loc_98AD:
	JSR $a1b4				; $98ad: 20 B4 A1 ; -> sub_A1B4
	STX $7b				  ; $98b0: 86 7B   
	TXA					  ; $98b2: 8A	  
	PHA					  ; $98b3: 48	  
	JSR $bf2e				; $98b4: 20 2E BF ; -> sub_BF2E
	.db $87			  ; $98b7 - Unknown opcode
	BRK					  ; $98b8: 00	  
	ORA ($4f,X)			  ; $98b9: 01 4F   
	BRK					  ; $98bb: 00	  
	.db $97			  ; $98bc - Unknown opcode
	.db $fb			  ; $98bd - Unknown opcode
	PLA					  ; $98be: 68	  
	STA $7b				  ; $98bf: 85 7B   
	BRK					  ; $98c1: 00	  
	.db $12			  ; $98c2 - Unknown opcode
	.db $4f			  ; $98c3 - Unknown opcode
	BCS $98ce				; $98c4: B0 08   
	BRK					  ; $98c6: 00	  
	SBC $d3				  ; $98c7: E5 D3	; Arithmetic
	BNE $9933				; $98c9: D0 68   
	TAX					  ; $98cb: AA	  
	CLC					  ; $98cc: 18	  
	RTS					  ; $98cd: 60	  
loc_98CE:
	LDA $7b				  ; $98ce: A5 7B   
	PHA					  ; $98d0: 48	  
	BRK					  ; $98d1: 00	  
	SBC $d3				  ; $98d2: E5 D3	; Arithmetic
	CMP ($68),Y			  ; $98d4: D1 68   
	STA $7b				  ; $98d6: 85 7B   
	PLA					  ; $98d8: 68	  
	STA $7c				  ; $98d9: 85 7C   
	LDX $7b				  ; $98db: A6 7B   
	BRK					  ; $98dd: 00	  
	AND ($a3),Y			  ; $98de: 31 A3   
	CLC					  ; $98e0: 18	  
	RTS					  ; $98e1: 60	  
	JSR $9916				; $98e2: 20 16 99 ; -> sub_9916
	BRK					  ; $98e5: 00	  
	.db $1b			  ; $98e6 - Unknown opcode
	.db $0f			  ; $98e7 - Unknown opcode
	AND #$03				 ; $98e8: 29 03   
	BEQ $98ef				; $98ea: F0 03   
	JMP $96db				; $98ec: 4C DB 96
loc_98EF:
	JSR $bf2e				; $98ef: 20 2E BF ; -> sub_BF2E
	DEY					  ; $98f2: 88	  
	BRK					  ; $98f3: 00	  
	.db $f2			  ; $98f4 - Unknown opcode
	.db $d3			  ; $98f5 - Unknown opcode
	.db $04			  ; $98f6 - Unknown opcode
	JMP $90db				; $98f7: 4C DB 90
	BRK					  ; $98fa: 00	  
	ASL system_flags		 ; $98fb: 06 1F   
	BCC $9906				; $98fd: 90 07   
	BRK					  ; $98ff: 00	  
	.db $12			  ; $9900 - Unknown opcode
	.db $a3			  ; $9901 - Unknown opcode
	LDX #$7e				 ; $9902: A2 7E   
	BNE $990b				; $9904: D0 05   
loc_9906:
	BRK					  ; $9906: 00	  
	CLC					  ; $9907: 18	  
	.db $53			  ; $9908 - Unknown opcode
	LDX #$72				 ; $9909: A2 72   
loc_990B:
	LDA #$05				 ; $990b: A9 05   
	JSR $c827				; $990d: 20 27 C8 ; Call to fixed bank
	JSR $993a				; $9910: 20 3A 99 ; -> sub_993A
	JMP $98ef				; $9913: 4C EF 98

; ---- Subroutine at $9916 (Bank 17) ----
sub_9916:
	LDA #$0b				 ; $9916: A9 0B   
	BRK					  ; $9918: 00	  
	.db $17			  ; $9919 - Unknown opcode
	.db $0f			  ; $991a - Unknown opcode
	CLC					  ; $991b: 18	  
	ADC #$40				 ; $991c: 69 40	; Arithmetic
	TAY					  ; $991e: A8	  
	BRK					  ; $991f: 00	  
	ASL system_flags		 ; $9920: 06 1F   
	BCC $992c				; $9922: 90 08   
	BRK					  ; $9924: 00	  
	.db $12			  ; $9925 - Unknown opcode
	.db $a3			  ; $9926 - Unknown opcode
	TYA					  ; $9927: 98	  
	LDX #$7e				 ; $9928: A2 7E   
	BNE $9932				; $992a: D0 06   
loc_992C:
	BRK					  ; $992c: 00	  
	CLC					  ; $992d: 18	  
	.db $53			  ; $992e - Unknown opcode
	TYA					  ; $992f: 98	  
	LDX #$72				 ; $9930: A2 72   
loc_9932:
	JSR $c827				; $9932: 20 27 C8 ; Call to fixed bank
	LDA #$40				 ; $9935: A9 40   
	JSR $c851				; $9937: 20 51 C8 ; Call to fixed bank

; ---- Subroutine at $993a (Bank 17) ----
sub_993A:
	LDA tmp0,X			   ; $993a: B5 00   
	LDY tmp1,X			   ; $993c: B4 01   
	STA $7361				; $993e: 8D 61 73
	STY $7362				; $9941: 8C 62 73
	RTS					  ; $9944: 60	  
	JSR $96db				; $9945: 20 DB 96 ; -> sub_96DB
	LDA #$60				 ; $9948: A9 60   
	JSR $996d				; $994a: 20 6D 99 ; -> sub_996D
	BCC $996c				; $994d: 90 1D   
	JMP $9cc3				; $994f: 4C C3 9C
	JSR $96db				; $9952: 20 DB 96 ; -> sub_96DB
	LDA #$60				 ; $9955: A9 60   
	JSR $996d				; $9957: 20 6D 99 ; -> sub_996D
	BCC $996c				; $995a: 90 10   
	JMP $afea				; $995c: 4C EA AF
	JSR $96db				; $995f: 20 DB 96 ; -> sub_96DB
	LDA #$20				 ; $9962: A9 20   
	JSR $996d				; $9964: 20 6D 99 ; -> sub_996D
	BCC $996c				; $9967: 90 03   
	JMP $aff4				; $9969: 4C F4 AF
loc_996C:
	RTS					  ; $996c: 60	  

; ---- Subroutine at $996d (Bank 17) ----
sub_996D:
	STA tmp0				 ; $996d: 85 00   
	LDA $72e7				; $996f: AD E7 72
	LSR					  ; $9972: 4A	  
	BCS $997e				; $9973: B0 09   
	BRK					  ; $9975: 00	  
	.db $1b			  ; $9976 - Unknown opcode
	.db $0f			  ; $9977 - Unknown opcode
	CMP tmp0				 ; $9978: C5 00   
	BCS $997e				; $997a: B0 02   
	SEC					  ; $997c: 38	  
	RTS					  ; $997d: 60	  
loc_997E:
	CLC					  ; $997e: 18	  
	RTS					  ; $997f: 60	  

; ---- Subroutine at $9980 (Bank 17) ----
sub_9980:
	TXA					  ; $9980: 8A	  
	PHA					  ; $9981: 48	  
	BRK					  ; $9982: 00	  
	.db $67			  ; $9983 - Unknown opcode
	.db $73			  ; $9984 - Unknown opcode
	TAX					  ; $9985: AA	  
	BRK					  ; $9986: 00	  
	.db $1c			  ; $9987 - Unknown opcode
	.db $73			  ; $9988 - Unknown opcode
	STA $0e				  ; $9989: 85 0E   
	LDA $73				  ; $998b: A5 73   
	STA $0f				  ; $998d: 85 0F   
	JSR $9a33				; $998f: 20 33 9A ; -> sub_9A33
	LDX #$0c				 ; $9992: A2 0C   
	LDA #$0c				 ; $9994: A9 0C   
	JSR $c851				; $9996: 20 51 C8 ; Call to fixed bank
	SEC					  ; $9999: 38	  
	LDA $0e				  ; $999a: A5 0E   
	SBC $0c				  ; $999c: E5 0C	; Arithmetic
	LDA $0f				  ; $999e: A5 0F   
	SBC $0d				  ; $99a0: E5 0D	; Arithmetic
	BCC $99b0				; $99a2: 90 0C   
	LDA $0f				  ; $99a4: A5 0F   
	BNE $99d8				; $99a6: D0 30   
	LDA $0e				  ; $99a8: A5 0E   
	CMP #$08				 ; $99aa: C9 08	; Compare with 8
	BCS $99d8				; $99ac: B0 2A   
	BCC $9a16				; $99ae: 90 66   
loc_99B0:
	LDA $0c				  ; $99b0: A5 0C   
	BRK					  ; $99b2: 00	  
	.db $17			  ; $99b3 - Unknown opcode
	.db $0f			  ; $99b4 - Unknown opcode
	STA $7361				; $99b5: 8D 61 73
	LDA #$00				 ; $99b8: A9 00   
	STA $7362				; $99ba: 8D 62 73
	PLA					  ; $99bd: 68	  
	TAX					  ; $99be: AA	  
	RTS					  ; $99bf: 60	  

; ---- Subroutine at $99c0 (Bank 17) ----
sub_99C0:
	TXA					  ; $99c0: 8A	  
	PHA					  ; $99c1: 48	  
	BRK					  ; $99c2: 00	  
	ASL $b3,X				; $99c3: 16 B3   
	STA $0e				  ; $99c5: 85 0E   
	LDA $7f				  ; $99c7: A5 7F   
	STA $0f				  ; $99c9: 85 0F   
	JSR $9a33				; $99cb: 20 33 9A ; -> sub_9A33
	LDA $0f				  ; $99ce: A5 0F   
	BNE $99d8				; $99d0: D0 06   
	LDA $0e				  ; $99d2: A5 0E   
	CMP #$08				 ; $99d4: C9 08	; Compare with 8
	BCC $9a16				; $99d6: 90 3E   
loc_99D8:
	LDA $0f				  ; $99d8: A5 0F   
	STA $0b				  ; $99da: 85 0B   
	LSR					  ; $99dc: 4A	  
	STA $0d				  ; $99dd: 85 0D   
	LDA $0e				  ; $99df: A5 0E   
	STA $0a				  ; $99e1: 85 0A   
	ROR					  ; $99e3: 6A	  
	STA $0c				  ; $99e4: 85 0C   
	LSR $0d				  ; $99e6: 46 0D   
	ROR $0c				  ; $99e8: 66 0C   
	INC $0c				  ; $99ea: E6 0C   
	BNE $99f0				; $99ec: D0 02   
	INC $0d				  ; $99ee: E6 0D   
loc_99F0:
	BRK					  ; $99f0: 00	  
	.db $1b			  ; $99f1 - Unknown opcode
	.db $0f			  ; $99f2 - Unknown opcode
	LDX #$0c				 ; $99f3: A2 0C   
	JSR $c827				; $99f5: 20 27 C8 ; Call to fixed bank
	LDA #$07				 ; $99f8: A9 07   
	LDX #$0a				 ; $99fa: A2 0A   
	JSR $c827				; $99fc: 20 27 C8 ; Call to fixed bank
	LDA #$08				 ; $99ff: A9 08   
	JSR $c851				; $9a01: 20 51 C8 ; Call to fixed bank
	CLC					  ; $9a04: 18	  
	LDA $0d				  ; $9a05: A5 0D   
	ADC $0a				  ; $9a07: 65 0A	; Arithmetic
	STA $7361				; $9a09: 8D 61 73
	LDA #$00				 ; $9a0c: A9 00   
	ADC $0b				  ; $9a0e: 65 0B	; Arithmetic
	STA $7362				; $9a10: 8D 62 73
	PLA					  ; $9a13: 68	  
	TAX					  ; $9a14: AA	  
	RTS					  ; $9a15: 60	  
loc_9A16:
	LDA #$03				 ; $9a16: A9 03   
	BRK					  ; $9a18: 00	  
	.db $17			  ; $9a19 - Unknown opcode
	.db $0f			  ; $9a1a - Unknown opcode
	CLC					  ; $9a1b: 18	  
	ADC $0e				  ; $9a1c: 65 0E	; Arithmetic
	STA $7361				; $9a1e: 8D 61 73
	DEC $7361				; $9a21: CE 61 73
	BPL $9a2b				; $9a24: 10 05   
	LDA #$00				 ; $9a26: A9 00   
	STA $7361				; $9a28: 8D 61 73
loc_9A2B:
	LDA $0f				  ; $9a2b: A5 0F   
	STA $7362				; $9a2d: 8D 62 73
	PLA					  ; $9a30: 68	  
	TAX					  ; $9a31: AA	  
	RTS					  ; $9a32: 60	  

; ---- Subroutine at $9a33 (Bank 17) ----
sub_9A33:
	LSR $0f				  ; $9a33: 46 0F   
	ROR $0e				  ; $9a35: 66 0E   
	BRK					  ; $9a37: 00	  
	ASL system_flags		 ; $9a38: 06 1F   
	BCS $9a61				; $9a3a: B0 25   
	BRK					  ; $9a3c: 00	  
	.db $03			  ; $9a3d - Unknown opcode
	.db $1f			  ; $9a3e - Unknown opcode
	CMP #$82				 ; $9a3f: C9 82	; Compare with 130
	BNE $9a59				; $9a41: D0 16   
	BRK					  ; $9a43: 00	  
	BPL $9ab9				; $9a44: 10 73   
	LDA #$0b				 ; $9a46: A9 0B   
	BRK					  ; $9a48: 00	  
	.db $13			  ; $9a49 - Unknown opcode
	.db $0f			  ; $9a4a - Unknown opcode
	CLC					  ; $9a4b: 18	  
	ADC $72				  ; $9a4c: 65 72	; Arithmetic
	STA $72				  ; $9a4e: 85 72   
	BCC $9a54				; $9a50: 90 02   
	INC $73				  ; $9a52: E6 73   
loc_9A54:
	LDX $73				  ; $9a54: A6 73   
	JMP $9a66				; $9a56: 4C 66 9A
loc_9A59:
	BRK					  ; $9a59: 00	  
	CLC					  ; $9a5a: 18	  
	.db $73			  ; $9a5b - Unknown opcode
	LDX $73				  ; $9a5c: A6 73   
	JMP $9a66				; $9a5e: 4C 66 9A
loc_9A61:
	BRK					  ; $9a61: 00	  
	.db $12			  ; $9a62 - Unknown opcode
	.db $b3			  ; $9a63 - Unknown opcode
	LDX $7f				  ; $9a64: A6 7F   
loc_9A66:
	STA $0c				  ; $9a66: 85 0C   
	STX $0d				  ; $9a68: 86 0D   
	SEC					  ; $9a6a: 38	  
	LDA $0c				  ; $9a6b: A5 0C   
	SBC $0e				  ; $9a6d: E5 0E	; Arithmetic
	STA $0e				  ; $9a6f: 85 0E   
	LDA $0d				  ; $9a71: A5 0D   
	SBC $0f				  ; $9a73: E5 0F	; Arithmetic
	STA $0f				  ; $9a75: 85 0F   
	BCS $9a7f				; $9a77: B0 06   
	LDA #$00				 ; $9a79: A9 00   
	STA $0e				  ; $9a7b: 85 0E   
	STA $0f				  ; $9a7d: 85 0F   
loc_9A7F:
	LSR $0f				  ; $9a7f: 46 0F   
	ROR $0e				  ; $9a81: 66 0E   
	RTS					  ; $9a83: 60	  

; ---- Subroutine at $9a84 (Bank 17) ----
sub_9A84:
	LDA tmp0,Y			   ; $9a84: B9 00 00
	STA $6e14				; $9a87: 8D 14 6E
	LDA tmp1,Y			   ; $9a8a: B9 01 00
	STA $6e15				; $9a8d: 8D 15 6E
	TYA					  ; $9a90: 98	  
	PHA					  ; $9a91: 48	  
	LDY #$18				 ; $9a92: A0 18   
	LDA #$00				 ; $9a94: A9 00   
	STA $6e16				; $9a96: 8D 16 6E
	STA $6e11				; $9a99: 8D 11 6E
	STA $6e12				; $9a9c: 8D 12 6E
	STA $6e13				; $9a9f: 8D 13 6E
loc_9AA2:
	ASL tmp0,X			   ; $9aa2: 16 00   
	ROL tmp1,X			   ; $9aa4: 36 01   
	ROL tmp2,X			   ; $9aa6: 36 02   
	ROL $6e11				; $9aa8: 2E 11 6E
	ROL $6e12				; $9aab: 2E 12 6E
	ROL $6e13				; $9aae: 2E 13 6E
	INC tmp0,X			   ; $9ab1: F6 00   
	LDA $6e11				; $9ab3: AD 11 6E
	SEC					  ; $9ab6: 38	  
	SBC $6e14				; $9ab7: ED 14 6E ; Arithmetic
	PHA					  ; $9aba: 48	  
	LDA $6e12				; $9abb: AD 12 6E
	SBC $6e15				; $9abe: ED 15 6E ; Arithmetic
	PHA					  ; $9ac1: 48	  
	LDA $6e13				; $9ac2: AD 13 6E
	SBC $6e16				; $9ac5: ED 16 6E ; Arithmetic
loc_9AC8:
	BCS $9ad1				; $9ac8: B0 07   
	PLA					  ; $9aca: 68	  
	PLA					  ; $9acb: 68	  
	DEC tmp0,X			   ; $9acc: D6 00   
	JMP $9adc				; $9ace: 4C DC 9A
loc_9AD1:
	STA $6e13				; $9ad1: 8D 13 6E
	PLA					  ; $9ad4: 68	  
	STA $6e12				; $9ad5: 8D 12 6E
	PLA					  ; $9ad8: 68	  
	STA $6e11				; $9ad9: 8D 11 6E
loc_9ADC:
	DEY					  ; $9adc: 88	  
	BNE $9aa2				; $9add: D0 C3   
	PLA					  ; $9adf: 68	  
	TAY					  ; $9ae0: A8	  
	RTS					  ; $9ae1: 60	  
	BRK					  ; $9ae2: 00	  
	ORA (system_flags,X)	 ; $9ae3: 01 1F   
	BRK					  ; $9ae5: 00	  
	.db $07			  ; $9ae6 - Unknown opcode
	.db $3f			  ; $9ae7 - Unknown opcode
	JMP $90db				; $9ae8: 4C DB 90
	BRK					  ; $9aeb: 00	  
	.db $1b			  ; $9aec - Unknown opcode
	.db $0f			  ; $9aed - Unknown opcode
	CMP #$80				 ; $9aee: C9 80	; Compare with 128
	BCC $9b0b				; $9af0: 90 19   
	BRK					  ; $9af2: 00	  
	BEQ $9ac8				; $9af3: F0 D3   
	.db $23			  ; $9af5 - Unknown opcode
	LDA $7363				; $9af6: AD 63 73
	BMI $9b02				; $9af9: 30 07   
	TAX					  ; $9afb: AA	  
	JSR $9980				; $9afc: 20 80 99 ; -> sub_9980
	JMP $9b08				; $9aff: 4C 08 9B
loc_9B02:
	AND #$07				 ; $9b02: 29 07   
	TAX					  ; $9b04: AA	  
	JSR $99c0				; $9b05: 20 C0 99 ; -> sub_99C0
loc_9B08:
	JMP $90db				; $9b08: 4C DB 90
loc_9B0B:
	RTS					  ; $9b0b: 60	  
	BRK					  ; $9b0c: 00	  
	.db $07			  ; $9b0d - Unknown opcode
	.db $1f			  ; $9b0e - Unknown opcode
	BCC $9b29				; $9b0f: 90 18   
	TXA					  ; $9b11: 8A	  
	PHA					  ; $9b12: 48	  
	JSR $bf2e				; $9b13: 20 2E BF ; -> sub_BF2E
	.db $9e			  ; $9b16 - Unknown opcode
	PLA					  ; $9b17: 68	  
	TAX					  ; $9b18: AA	  
	JSR $91f3				; $9b19: 20 F3 91 ; -> sub_91F3
	BRK					  ; $9b1c: 00	  
	.db $1a			  ; $9b1d - Unknown opcode
	.db $2f			  ; $9b1e - Unknown opcode
	BCS $9b28				; $9b1f: B0 07   
	BRK					  ; $9b21: 00	  
	INC $d3				  ; $9b22: E6 D3   
	ORA (tmp0,X)			 ; $9b24: 01 00   
	.db $23			  ; $9b26 - Unknown opcode
	.db $2f			  ; $9b27 - Unknown opcode
loc_9B28:
	RTS					  ; $9b28: 60	  
loc_9B29:
	BVC $9b7e				; $9b29: 50 53   
	BRK					  ; $9b2b: 00	  
	.db $3b			  ; $9b2c - Unknown opcode
	.db $93			  ; $9b2d - Unknown opcode
	ORA ($90,X)			  ; $9b2e: 01 90   
	.db $0b			  ; $9b30 - Unknown opcode
	CMP #$b7				 ; $9b31: C9 B7	; Compare with 183
	BNE $9b3c				; $9b33: D0 07   
	BRK					  ; $9b35: 00	  
	.db $1b			  ; $9b36 - Unknown opcode
	.db $0f			  ; $9b37 - Unknown opcode
	CMP #$80				 ; $9b38: C9 80	; Compare with 128
	BCC $9b4b				; $9b3a: 90 0F   
loc_9B3C:
	JSR $9272				; $9b3c: 20 72 92 ; -> sub_9272
	JSR $bf2e				; $9b3f: 20 2E BF ; -> sub_BF2E
	.db $9e			  ; $9b42 - Unknown opcode
	BRK					  ; $9b43: 00	  
	INC $d3				  ; $9b44: E6 D3   
	.db $02			  ; $9b46 - Unknown opcode
	BRK					  ; $9b47: 00	  
	.db $23			  ; $9b48 - Unknown opcode
	.db $2f			  ; $9b49 - Unknown opcode
	RTS					  ; $9b4a: 60	  
loc_9B4B:
	BRK					  ; $9b4b: 00	  
	INC $d3				  ; $9b4c: E6 D3   
	.db $03			  ; $9b4e - Unknown opcode
	BRK					  ; $9b4f: 00	  
	.db $23			  ; $9b50 - Unknown opcode
	.db $2f			  ; $9b51 - Unknown opcode
	RTS					  ; $9b52: 60	  
	BRK					  ; $9b53: 00	  
	.db $07			  ; $9b54 - Unknown opcode
	.db $1f			  ; $9b55 - Unknown opcode
	BCC $9b6e				; $9b56: 90 16   
	TXA					  ; $9b58: 8A	  
	PHA					  ; $9b59: 48	  
	JSR $b91c				; $9b5a: 20 1C B9 ; -> sub_B91C
	JSR $9204				; $9b5d: 20 04 92 ; -> sub_9204
	BRK					  ; $9b60: 00	  
	INC $d3				  ; $9b61: E6 D3   
	ORA (tmp0,X)			 ; $9b63: 01 00   
	.db $23			  ; $9b65 - Unknown opcode
	.db $2f			  ; $9b66 - Unknown opcode
	PLA					  ; $9b67: 68	  
	TAX					  ; $9b68: AA	  
	BRK					  ; $9b69: 00	  
	.db $2b			  ; $9b6a - Unknown opcode
	.db $c3			  ; $9b6b - Unknown opcode
	.db $0f			  ; $9b6c - Unknown opcode
	RTS					  ; $9b6d: 60	  
loc_9B6E:
	BVC $9b7e				; $9b6e: 50 0E   
	BRK					  ; $9b70: 00	  
	.db $2b			  ; $9b71 - Unknown opcode
	.db $73			  ; $9b72 - Unknown opcode
	CMP #$08				 ; $9b73: C9 08	; Compare with 8
	BCS $9b7f				; $9b75: B0 08   
	BRK					  ; $9b77: 00	  
	INC $d3				  ; $9b78: E6 D3   
	.db $03			  ; $9b7a - Unknown opcode
	BRK					  ; $9b7b: 00	  
	.db $23			  ; $9b7c - Unknown opcode
	.db $2f			  ; $9b7d - Unknown opcode
loc_9B7E:
	RTS					  ; $9b7e: 60	  
loc_9B7F:
	LDA #$80				 ; $9b7f: A9 80   
	BRK					  ; $9b81: 00	  
	INC $d3				  ; $9b82: E6 D3   
	.db $03			  ; $9b84 - Unknown opcode
	RTS					  ; $9b85: 60	  
	BRK					  ; $9b86: 00	  
	.db $07			  ; $9b87 - Unknown opcode
	.db $1f			  ; $9b88 - Unknown opcode
	BCC $9bd9				; $9b89: 90 4E   
	BRK					  ; $9b8b: 00	  
	.db $1b			  ; $9b8c - Unknown opcode
	.db $0f			  ; $9b8d - Unknown opcode
	CMP #$80				 ; $9b8e: C9 80	; Compare with 128
	BCC $9bca				; $9b90: 90 38   
loc_9B92:
	BRK					  ; $9b92: 00	  
	BRK					  ; $9b93: 00	  
	.db $a3			  ; $9b94 - Unknown opcode
	LDX $7f				  ; $9b95: A6 7F   
	JSR $9c2b				; $9b97: 20 2B 9C ; -> sub_9C2B
	STA $7c				  ; $9b9a: 85 7C   
	STX $7d				  ; $9b9c: 86 7D   
	LDX $7b				  ; $9b9e: A6 7B   
	BRK					  ; $9ba0: 00	  
	.db $03			  ; $9ba1 - Unknown opcode
	.db $a3			  ; $9ba2 - Unknown opcode
	LDA $7e				  ; $9ba3: A5 7E   
	STA $7361				; $9ba5: 8D 61 73
	LDA $7f				  ; $9ba8: A5 7F   
	STA $7362				; $9baa: 8D 62 73
	BRK					  ; $9bad: 00	  
	BRK					  ; $9bae: 00	  
	.db $a3			  ; $9baf - Unknown opcode
	LDX $7b				  ; $9bb0: A6 7B   
	ORA $7f				  ; $9bb2: 05 7F   
	BEQ $9bca				; $9bb4: F0 14   
	LDA $7b				  ; $9bb6: A5 7B   
	PHA					  ; $9bb8: 48	  
	JSR $bf2e				; $9bb9: 20 2E BF ; -> sub_BF2E
	.db $87			  ; $9bbc - Unknown opcode
	BRK					  ; $9bbd: 00	  
	ROR $d3				  ; $9bbe: 66 D3   
	ORA ($68,X)			  ; $9bc0: 01 68   
	TAX					  ; $9bc2: AA	  
	JSR $9286				; $9bc3: 20 86 92 ; -> sub_9286
	BRK					  ; $9bc6: 00	  
	.db $07			  ; $9bc7 - Unknown opcode
	.db $2f			  ; $9bc8 - Unknown opcode
	RTS					  ; $9bc9: 60	  
loc_9BCA:
	JSR $b91c				; $9bca: 20 1C B9 ; -> sub_B91C
	JSR $9204				; $9bcd: 20 04 92 ; -> sub_9204
	JSR $bf2e				; $9bd0: 20 2E BF ; -> sub_BF2E
	.db $9f			  ; $9bd3 - Unknown opcode
	BRK					  ; $9bd4: 00	  
	INC $d3				  ; $9bd5: E6 D3   
	.db $04			  ; $9bd7 - Unknown opcode
	RTS					  ; $9bd8: 60	  
loc_9BD9:
	BVC $9c1f				; $9bd9: 50 44   
	BRK					  ; $9bdb: 00	  
	.db $1b			  ; $9bdc - Unknown opcode
	.db $0f			  ; $9bdd - Unknown opcode
	CMP #$80				 ; $9bde: C9 80	; Compare with 128
	BCC $9c14				; $9be0: 90 32   
loc_9BE2:
	BRK					  ; $9be2: 00	  
	BRK					  ; $9be3: 00	  
	.db $53			  ; $9be4 - Unknown opcode
	LDX $73				  ; $9be5: A6 73   
	JSR $9c2b				; $9be7: 20 2B 9C ; -> sub_9C2B
	STA $6f				  ; $9bea: 85 6F   
	STX $70				  ; $9bec: 86 70   
	BRK					  ; $9bee: 00	  
	.db $04			  ; $9bef - Unknown opcode
	.db $33			  ; $9bf0 - Unknown opcode
	STA $7361				; $9bf1: 8D 61 73
	LDA $73				  ; $9bf4: A5 73   
	STA $7362				; $9bf6: 8D 62 73
	BRK					  ; $9bf9: 00	  
	BRK					  ; $9bfa: 00	  
	.db $33			  ; $9bfb - Unknown opcode
	LDX $6e				  ; $9bfc: A6 6E   
	ORA $73				  ; $9bfe: 05 73   
	BEQ $9c14				; $9c00: F0 12   
	JSR $bf2e				; $9c02: 20 2E BF ; -> sub_BF2E
	TXA					  ; $9c05: 8A	  
	BRK					  ; $9c06: 00	  
	ROR $d3				  ; $9c07: 66 D3   
	.db $02			  ; $9c09 - Unknown opcode
	BRK					  ; $9c0a: 00	  
	.db $02			  ; $9c0b - Unknown opcode
	.db $4f			  ; $9c0c - Unknown opcode
	BRK					  ; $9c0d: 00	  
	.db $27			  ; $9c0e - Unknown opcode
	.db $0f			  ; $9c0f - Unknown opcode
	BRK					  ; $9c10: 00	  
	.db $07			  ; $9c11 - Unknown opcode
	.db $2f			  ; $9c12 - Unknown opcode
	RTS					  ; $9c13: 60	  
loc_9C14:
	JSR $9272				; $9c14: 20 72 92 ; -> sub_9272
	JSR $bf2e				; $9c17: 20 2E BF ; -> sub_BF2E
	.db $9f			  ; $9c1a - Unknown opcode
	BRK					  ; $9c1b: 00	  
	INC $d3				  ; $9c1c: E6 D3   
	.db $04			  ; $9c1e - Unknown opcode
loc_9C1F:
	RTS					  ; $9c1f: 60	  
	BRK					  ; $9c20: 00	  
	TXA					  ; $9c21: 8A	  
	.db $fb			  ; $9c22 - Unknown opcode
	BRK					  ; $9c23: 00	  
	.db $07			  ; $9c24 - Unknown opcode
	.db $1f			  ; $9c25 - Unknown opcode
	BCC $9be2				; $9c26: 90 BA   
	JMP $9b92				; $9c28: 4C 92 9B

; ---- Subroutine at $9c2b (Bank 17) ----
sub_9C2B:
	STA $72				  ; $9c2b: 85 72   
	STA $7e				  ; $9c2d: 85 7E   
	STX $73				  ; $9c2f: 86 73   
	STX $7f				  ; $9c31: 86 7F   
	LDA #$0d				 ; $9c33: A9 0D   
	LDX #$7e				 ; $9c35: A2 7E   
	JSR $c827				; $9c37: 20 27 C8 ; Call to fixed bank
	LDA $7f				  ; $9c3a: A5 7F   
	STA $7e				  ; $9c3c: 85 7E   
	LDA $72				  ; $9c3e: A5 72   
	SEC					  ; $9c40: 38	  
	SBC $7e				  ; $9c41: E5 7E	; Arithmetic
	STA $7e				  ; $9c43: 85 7E   
	LDA $73				  ; $9c45: A5 73   
	SBC #$00				 ; $9c47: E9 00	; Arithmetic
	STA $7f				  ; $9c49: 85 7F   
	LDA $7e				  ; $9c4b: A5 7E   
	LDX $7f				  ; $9c4d: A6 7F   
	RTS					  ; $9c4f: 60	  
	BRK					  ; $9c50: 00	  
	ASL system_flags		 ; $9c51: 06 1F   
	BCC $9c69				; $9c53: 90 14   
	JSR $b91c				; $9c55: 20 1C B9 ; -> sub_B91C
	BRK					  ; $9c58: 00	  
	ASL system_flags		 ; $9c59: 06 1F   
	BRK					  ; $9c5b: 00	  
	AND #$c3				 ; $9c5c: 29 C3   
	ASL $0790				; $9c5e: 0E 90 07
	JSR $9204				; $9c61: 20 04 92 ; -> sub_9204
	BRK					  ; $9c64: 00	  
	INX					  ; $9c65: E8	  
	.db $d3			  ; $9c66 - Unknown opcode
	ORA $60,X				; $9c67: 15 60   
loc_9C69:
	JSR $9272				; $9c69: 20 72 92 ; -> sub_9272
	BRK					  ; $9c6c: 00	  
	INX					  ; $9c6d: E8	  
	.db $d3			  ; $9c6e - Unknown opcode
	ORA $20,X				; $9c6f: 15 20   
	.db $f7			  ; $9c71 - Unknown opcode
	.db $a3			  ; $9c72 - Unknown opcode
	RTS					  ; $9c73: 60	  
loc_9C74:
	STA $8e				  ; $9c74: 85 8E   
	BRK					  ; $9c76: 00	  
	.db $07			  ; $9c77 - Unknown opcode
	.db $1f			  ; $9c78 - Unknown opcode
	BCC $9c90				; $9c79: 90 15   
	JSR $9c9b				; $9c7b: 20 9B 9C ; -> sub_9C9B
	LDA $8e				  ; $9c7e: A5 8E   
	BPL $9c88				; $9c80: 10 06   
	JSR $91f3				; $9c82: 20 F3 91 ; -> sub_91F3
	JMP $9c8b				; $9c85: 4C 8B 9C
loc_9C88:
	JSR $9204				; $9c88: 20 04 92 ; -> sub_9204
loc_9C8B:
	BRK					  ; $9c8b: 00	  
	INC $d3				  ; $9c8c: E6 D3   
	ORA ($60,X)			  ; $9c8e: 01 60   
loc_9C90:
	JSR $9c9b				; $9c90: 20 9B 9C ; -> sub_9C9B
	JSR $9272				; $9c93: 20 72 92 ; -> sub_9272
	BRK					  ; $9c96: 00	  
	INC $d3				  ; $9c97: E6 D3   
	.db $02			  ; $9c99 - Unknown opcode
	RTS					  ; $9c9a: 60	  

; ---- Subroutine at $9c9b (Bank 17) ----
sub_9C9B:
	LDA $8e				  ; $9c9b: A5 8E   
	AND #$7f				 ; $9c9d: 29 7F   
	BEQ $9cac				; $9c9f: F0 0B   
	ORA #$80				 ; $9ca1: 09 80   
	TAY					  ; $9ca3: A8	  
	TXA					  ; $9ca4: 8A	  
	PHA					  ; $9ca5: 48	  
	TYA					  ; $9ca6: 98	  
	JSR $bf55				; $9ca7: 20 55 BF ; -> sub_BF55
	PLA					  ; $9caa: 68	  
	TAX					  ; $9cab: AA	  
loc_9CAC:
	RTS					  ; $9cac: 60	  
	BRK					  ; $9cad: 00	  
	.db $07			  ; $9cae - Unknown opcode
	.db $1f			  ; $9caf - Unknown opcode
	BCC $9cbc				; $9cb0: 90 0A   
	LDA $6e45				; $9cb2: AD 45 6E
	CMP #$b4				 ; $9cb5: C9 B4	; Compare with 180
	BNE $9cbc				; $9cb7: D0 03   
	BRK					  ; $9cb9: 00	  
	ORA $a94f,Y			  ; $9cba: 19 4F A9
	.db $13			  ; $9cbd - Unknown opcode
	LDX #$03				 ; $9cbe: A2 03   
	JMP $9d4f				; $9cc0: 4C 4F 9D

; ---- Subroutine at $9cc3 (Bank 17) ----
sub_9CC3:
	LDA #$10				 ; $9cc3: A9 10   
	LDX #$00				 ; $9cc5: A2 00   
	JMP $9d4f				; $9cc7: 4C 4F 9D
	LDA #$14				 ; $9cca: A9 14   
	LDX #$04				 ; $9ccc: A2 04   
	JMP $9d4f				; $9cce: 4C 4F 9D
	BRK					  ; $9cd1: 00	  
	.db $07			  ; $9cd2 - Unknown opcode
	.db $1f			  ; $9cd3 - Unknown opcode
	BCS $9cf7				; $9cd4: B0 21   
	LDY #$80				 ; $9cd6: A0 80   
	BRK					  ; $9cd8: 00	  
	.db $3b			  ; $9cd9 - Unknown opcode
	.db $93			  ; $9cda - Unknown opcode
	ORA ($90,X)			  ; $9cdb: 01 90   
	.db $04			  ; $9cdd - Unknown opcode
	CMP #$b7				 ; $9cde: C9 B7	; Compare with 183
	BEQ $9cee				; $9ce0: F0 0C   
	BRK					  ; $9ce2: 00	  
	.db $3b			  ; $9ce3 - Unknown opcode
	.db $93			  ; $9ce4 - Unknown opcode
	.db $03			  ; $9ce5 - Unknown opcode
	BCC $9cf7				; $9ce6: 90 0F   
	CMP #$cd				 ; $9ce8: C9 CD	; Compare with 205
	BNE $9cf7				; $9cea: D0 0B   
	LDY #$55				 ; $9cec: A0 55   
loc_9CEE:
	STY tmp0				 ; $9cee: 84 00   
	BRK					  ; $9cf0: 00	  
	.db $1b			  ; $9cf1 - Unknown opcode
	.db $0f			  ; $9cf2 - Unknown opcode
	CMP tmp0				 ; $9cf3: C5 00   
	BCC $9cfe				; $9cf5: 90 07   
loc_9CF7:
	LDA #$12				 ; $9cf7: A9 12   
	LDX #$02				 ; $9cf9: A2 02   
	JMP $9d4f				; $9cfb: 4C 4F 9D
loc_9CFE:
	BRK					  ; $9cfe: 00	  
	INC $d3				  ; $9cff: E6 D3   
	.db $03			  ; $9d01 - Unknown opcode
	RTS					  ; $9d02: 60	  
	LDA #$16				 ; $9d03: A9 16   
	LDX #$06				 ; $9d05: A2 06   
	JMP $9d4f				; $9d07: 4C 4F 9D
	LDA #$17				 ; $9d0a: A9 17   
	LDX #$07				 ; $9d0c: A2 07   
	JMP $9d4f				; $9d0e: 4C 4F 9D
	BRK					  ; $9d11: 00	  
	.db $f2			  ; $9d12 - Unknown opcode
	.db $d3			  ; $9d13 - Unknown opcode
	.db $04			  ; $9d14 - Unknown opcode
	LDA #$15				 ; $9d15: A9 15   
	LDX #$05				 ; $9d17: A2 05   
	JMP $9d4f				; $9d19: 4C 4F 9D
	BRK					  ; $9d1c: 00	  
	.db $07			  ; $9d1d - Unknown opcode
	.db $1f			  ; $9d1e - Unknown opcode
	BCS $9d23				; $9d1f: B0 02   
	BVC $9d2a				; $9d21: 50 07   
loc_9D23:
	LDA #$06				 ; $9d23: A9 06   
	LDX #$0d				 ; $9d25: A2 0D   
	JMP $9d6e				; $9d27: 4C 6E 9D
loc_9D2A:
	RTS					  ; $9d2a: 60	  
	LDA #$10				 ; $9d2b: A9 10   
	LDX #$00				 ; $9d2d: A2 00   
	JMP $9d6e				; $9d2f: 4C 6E 9D
	BRK					  ; $9d32: 00	  
	.db $07			  ; $9d33 - Unknown opcode
	.db $1f			  ; $9d34 - Unknown opcode
	BCS $9d2a				; $9d35: B0 F3   
	LDA #$18				 ; $9d37: A9 18   
	JSR $9d4f				; $9d39: 20 4F 9D ; -> sub_9D4F
	LDA #$4f				 ; $9d3c: A9 4F   
	JSR $b808				; $9d3e: 20 08 B8 ; -> sub_B808
	RTS					  ; $9d41: 60	  
	LDA $72e7				; $9d42: AD E7 72
	ORA #$10				 ; $9d45: 09 10   
	STA $72e7				; $9d47: 8D E7 72
	BRK					  ; $9d4a: 00	  
	INC $d3				  ; $9d4b: E6 D3   
	ORA ($60,X)			  ; $9d4d: 01 60   

; ---- Subroutine at $9d4f (Bank 17) ----
sub_9D4F:
	STA $6f				  ; $9d4f: 85 6F   
	STX $7c				  ; $9d51: 86 7C   
	BRK					  ; $9d53: 00	  
	.db $07			  ; $9d54 - Unknown opcode
	.db $1f			  ; $9d55 - Unknown opcode
	BCC $9d62				; $9d56: 90 0A   
	BRK					  ; $9d58: 00	  
	ROL					  ; $9d59: 2A	  
	.db $a3			  ; $9d5a - Unknown opcode
	BCC $9d6d				; $9d5b: 90 10   
	BRK					  ; $9d5d: 00	  
	INC $d3				  ; $9d5e: E6 D3   
	ORA ($60,X)			  ; $9d60: 01 60   
loc_9D62:
	BVC $9d6d				; $9d62: 50 09   
	BRK					  ; $9d64: 00	  
	.db $44			  ; $9d65 - Unknown opcode
	.db $53			  ; $9d66 - Unknown opcode
	BCC $9d6d				; $9d67: 90 04   
	BRK					  ; $9d69: 00	  
	INC $d3				  ; $9d6a: E6 D3   
	.db $02			  ; $9d6c - Unknown opcode
loc_9D6D:
	RTS					  ; $9d6d: 60	  
loc_9D6E:
	STA $6f				  ; $9d6e: 85 6F   
	STX $7c				  ; $9d70: 86 7C   
	BRK					  ; $9d72: 00	  
	.db $07			  ; $9d73 - Unknown opcode
	.db $1f			  ; $9d74 - Unknown opcode
	BCC $9d81				; $9d75: 90 0A   
	BRK					  ; $9d77: 00	  
	.db $2b			  ; $9d78 - Unknown opcode
	.db $a3			  ; $9d79 - Unknown opcode
	BCC $9d8b				; $9d7a: 90 0F   
	BRK					  ; $9d7c: 00	  
	INC $d3				  ; $9d7d: E6 D3   
	ORA ($60,X)			  ; $9d7f: 01 60   
loc_9D81:
	BRK					  ; $9d81: 00	  
	EOR $53				  ; $9d82: 45 53   
	BCC $9d8b				; $9d84: 90 05   
	BRK					  ; $9d86: 00	  
	INC $d3				  ; $9d87: E6 D3   
	.db $02			  ; $9d89 - Unknown opcode
	RTS					  ; $9d8a: 60	  
loc_9D8B:
	BRK					  ; $9d8b: 00	  
	CPX $d3				  ; $9d8c: E4 D3   
	.db $1a			  ; $9d8e - Unknown opcode
	RTS					  ; $9d8f: 60	  
	BRK					  ; $9d90: 00	  
	.db $07			  ; $9d91 - Unknown opcode
	.db $1f			  ; $9d92 - Unknown opcode
	BCC $9d9e				; $9d93: 90 09   
	BRK					  ; $9d95: 00	  
	ROL					  ; $9d96: 2A	  
	.db $c3			  ; $9d97 - Unknown opcode
	ORA (tmp0),Y			 ; $9d98: 11 00   
	INC $d3				  ; $9d9a: E6 D3   
	ORA ($60,X)			  ; $9d9c: 01 60   
loc_9D9E:
	BRK					  ; $9d9e: 00	  
	.db $44			  ; $9d9f - Unknown opcode
	.db $93			  ; $9da0 - Unknown opcode
	.db $80			  ; $9da1 - Unknown opcode
	BRK					  ; $9da2: 00	  
	.db $62			  ; $9da3 - Unknown opcode
	.db $23			  ; $9da4 - Unknown opcode
	EOR ($c9,X)			  ; $9da5: 41 C9   
	ORA ($d0,X)			  ; $9da7: 01 D0   
	ORA tmp0				 ; $9da9: 05 00   
	INC $d3				  ; $9dab: E6 D3   
	ORA ($60,X)			  ; $9dad: 01 60   
	BRK					  ; $9daf: 00	  
	INC $d3				  ; $9db0: E6 D3   
	.db $02			  ; $9db2 - Unknown opcode
	RTS					  ; $9db3: 60	  
	BRK					  ; $9db4: 00	  
	ASL system_flags		 ; $9db5: 06 1F   
	STA $c7				  ; $9db7: 85 C7   
	BCC $9df6				; $9db9: 90 3B   
	LDA $7363				; $9dbb: AD 63 73
	BMI $9de6				; $9dbe: 30 26   
	STA $7d				  ; $9dc0: 85 7D   
	BRK					  ; $9dc2: 00	  
	.db $07			  ; $9dc3 - Unknown opcode
	.db $1f			  ; $9dc4 - Unknown opcode
	BVC $9de6				; $9dc5: 50 1F   
	BRK					  ; $9dc7: 00	  
	ASL system_flags		 ; $9dc8: 06 1F   
	BRK					  ; $9dca: 00	  
	AND #$c3				 ; $9dcb: 29 C3   
	.db $0c			  ; $9dcd - Unknown opcode
	BCC $9dd6				; $9dce: 90 06   
	LDA $7f				  ; $9dd0: A5 7F   
	CMP $7d				  ; $9dd2: C5 7D   
	BEQ $9e47				; $9dd4: F0 71   
loc_9DD6:
	LDA $7d				  ; $9dd6: A5 7D   
	JSR $9e4c				; $9dd8: 20 4C 9E ; -> sub_9E4C
	STA $c4				  ; $9ddb: 85 C4   
	BRK					  ; $9ddd: 00	  
	.db $0f			  ; $9dde - Unknown opcode
	.db $4f			  ; $9ddf - Unknown opcode
	BCS $9de7				; $9de0: B0 05   
loc_9DE2:
	BRK					  ; $9de2: 00	  
	CPX $d3				  ; $9de3: E4 D3   
	.db $1a			  ; $9de5 - Unknown opcode
loc_9DE6:
	RTS					  ; $9de6: 60	  
loc_9DE7:
	BRK					  ; $9de7: 00	  
	INC $d3				  ; $9de8: E6 D3   
	ORA (tmp0,X)			 ; $9dea: 01 00   
	ASL system_flags		 ; $9dec: 06 1F   
	BRK					  ; $9dee: 00	  
	ROL					  ; $9def: 2A	  
	.db $c3			  ; $9df0 - Unknown opcode
	.db $0c			  ; $9df1 - Unknown opcode
	JSR $9e5c				; $9df2: 20 5C 9E ; -> sub_9E5C
	RTS					  ; $9df5: 60	  
loc_9DF6:
	LDA $7363				; $9df6: AD 63 73
	BMI $9de2				; $9df9: 30 E7   
	STA $70				  ; $9dfb: 85 70   
	BRK					  ; $9dfd: 00	  
	.db $07			  ; $9dfe - Unknown opcode
	.db $1f			  ; $9dff - Unknown opcode
	BVC $9de2				; $9e00: 50 E0   
	BRK					  ; $9e02: 00	  
	.db $2b			  ; $9e03 - Unknown opcode
	.db $53			  ; $9e04 - Unknown opcode
	CMP #$08				 ; $9e05: C9 08	; Compare with 8
	BCS $9de2				; $9e07: B0 D9   
	BRK					  ; $9e09: 00	  
	ASL system_flags		 ; $9e0a: 06 1F   
	BRK					  ; $9e0c: 00	  
	LSR $93				  ; $9e0d: 46 93   
	.db $1c			  ; $9e0f - Unknown opcode
	BCS $9e1f				; $9e10: B0 0D   
	BRK					  ; $9e12: 00	  
	ORA (system_flags,X)	 ; $9e13: 01 1F   
	CMP $70				  ; $9e15: C5 70   
	BEQ $9e47				; $9e17: F0 2E   
	BRK					  ; $9e19: 00	  
	ASL system_flags		 ; $9e1a: 06 1F   
	JMP $9e3b				; $9e1c: 4C 3B 9E
loc_9E1F:
	BRK					  ; $9e1f: 00	  
	ORA (system_flags,X)	 ; $9e20: 01 1F   
	CMP $70				  ; $9e22: C5 70   
	BNE $9e32				; $9e24: D0 0C   
	BRK					  ; $9e26: 00	  
	ASL system_flags		 ; $9e27: 06 1F   
	BRK					  ; $9e29: 00	  
	.db $44			  ; $9e2a - Unknown opcode
	.db $93			  ; $9e2b - Unknown opcode
	.db $1c			  ; $9e2c - Unknown opcode
	BRK					  ; $9e2d: 00	  
	INC $d3				  ; $9e2e: E6 D3   
	.db $02			  ; $9e30 - Unknown opcode
	RTS					  ; $9e31: 60	  
loc_9E32:
	BRK					  ; $9e32: 00	  
	ASL system_flags		 ; $9e33: 06 1F   
	LDA $73				  ; $9e35: A5 73   
	CMP $70				  ; $9e37: C5 70   
	BEQ $9e47				; $9e39: F0 0C   
loc_9E3B:
	BRK					  ; $9e3b: 00	  
	.db $44			  ; $9e3c - Unknown opcode
	.db $93			  ; $9e3d - Unknown opcode
	.db $1c			  ; $9e3e - Unknown opcode
	JSR $9e91				; $9e3f: 20 91 9E ; -> sub_9E91
	BRK					  ; $9e42: 00	  
loc_9E43:
	INC $d3				  ; $9e43: E6 D3   
	ORA ($60,X)			  ; $9e45: 01 60   
loc_9E47:
	BRK					  ; $9e47: 00	  
	INC $d3				  ; $9e48: E6 D3   
	.db $03			  ; $9e4a - Unknown opcode
	RTS					  ; $9e4b: 60	  

; ---- Subroutine at $9e4c (Bank 17) ----
sub_9E4C:
	BRK					  ; $9e4c: 00	  
	.db $67			  ; $9e4d - Unknown opcode
	.db $73			  ; $9e4e - Unknown opcode
	TAX					  ; $9e4f: AA	  
	BRK					  ; $9e50: 00	  
	.db $2b			  ; $9e51 - Unknown opcode
	.db $53			  ; $9e52 - Unknown opcode
	BNE $9e5b				; $9e53: D0 06   
	BRK					  ; $9e55: 00	  
	AND #$53				 ; $9e56: 29 53   
	ASL					  ; $9e58: 0A	  
	ASL					  ; $9e59: 0A	  
	ASL					  ; $9e5a: 0A	  
loc_9E5B:
	RTS					  ; $9e5b: 60	  

; ---- Subroutine at $9e5c (Bank 17) ----
sub_9E5C:
	LDA $7d				  ; $9e5c: A5 7D   
	PHA					  ; $9e5e: 48	  
	LDA #$ff				 ; $9e5f: A9 FF   
	STA $7d				  ; $9e61: 85 7D   
	LDX $7b				  ; $9e63: A6 7B   
	BRK					  ; $9e65: 00	  
	ORA $b3,X				; $9e66: 15 B3   
	BRK					  ; $9e68: 00	  
	ORA ($a3),Y			  ; $9e69: 11 A3   
	BRK					  ; $9e6b: 00	  
	ORA $68a3,Y			  ; $9e6c: 19 A3 68
	STA $7d				  ; $9e6f: 85 7D   
	BRK					  ; $9e71: 00	  
	.db $67			  ; $9e72 - Unknown opcode
	.db $73			  ; $9e73 - Unknown opcode
	TAX					  ; $9e74: AA	  
	BRK					  ; $9e75: 00	  
	CLC					  ; $9e76: 18	  
	.db $73			  ; $9e77 - Unknown opcode
	JSR $9ed6				; $9e78: 20 D6 9E ; -> sub_9ED6
	BRK					  ; $9e7b: 00	  
	.db $14			  ; $9e7c - Unknown opcode
	.db $b3			  ; $9e7d - Unknown opcode
	BRK					  ; $9e7e: 00	  
	.db $1c			  ; $9e7f - Unknown opcode
	.db $33			  ; $9e80 - Unknown opcode
	JSR $9ed6				; $9e81: 20 D6 9E ; -> sub_9ED6
	BRK					  ; $9e84: 00	  
	CLC					  ; $9e85: 18	  
	.db $b3			  ; $9e86 - Unknown opcode
	BRK					  ; $9e87: 00	  
	.db $14			  ; $9e88 - Unknown opcode
	.db $33			  ; $9e89 - Unknown opcode
	JSR $9ed6				; $9e8a: 20 D6 9E ; -> sub_9ED6
	BRK					  ; $9e8d: 00	  
	BPL $9e43				; $9e8e: 10 B3   
	RTS					  ; $9e90: 60	  

; ---- Subroutine at $9e91 (Bank 17) ----
sub_9E91:
	LDA $70				  ; $9e91: A5 70   
	PHA					  ; $9e93: 48	  
	LDA #$ff				 ; $9e94: A9 FF   
	STA $70				  ; $9e96: 85 70   
	LDX $6e				  ; $9e98: A6 6E   
	BRK					  ; $9e9a: 00	  
	.db $1a			  ; $9e9b - Unknown opcode
	.db $73			  ; $9e9c - Unknown opcode
	BRK					  ; $9e9d: 00	  
	ASL $53,X				; $9e9e: 16 53   
	BRK					  ; $9ea0: 00	  
	ASL $8653,X			  ; $9ea1: 1E 53 86
	BRK					  ; $9ea4: 00	  
	PLA					  ; $9ea5: 68	  
	STA $70				  ; $9ea6: 85 70   
	BRK					  ; $9ea8: 00	  
	.db $67			  ; $9ea9 - Unknown opcode
	.db $73			  ; $9eaa - Unknown opcode
	TAX					  ; $9eab: AA	  
	STA tmp1				 ; $9eac: 85 01   
	TAX					  ; $9eae: AA	  
	BRK					  ; $9eaf: 00	  
	CLC					  ; $9eb0: 18	  
	.db $53			  ; $9eb1 - Unknown opcode
	JSR $9ecf				; $9eb2: 20 CF 9E ; -> sub_9ECF
	BRK					  ; $9eb5: 00	  
	ORA $a673,Y			  ; $9eb6: 19 73 A6
	ORA (tmp0,X)			 ; $9eb9: 01 00   
	.db $1c			  ; $9ebb - Unknown opcode
	.db $53			  ; $9ebc - Unknown opcode
	JSR $9ecf				; $9ebd: 20 CF 9E ; -> sub_9ECF
	BRK					  ; $9ec0: 00	  
	ORA $a673,X			  ; $9ec1: 1D 73 A6
	ORA (tmp0,X)			 ; $9ec4: 01 00   
	.db $14			  ; $9ec6 - Unknown opcode
	.db $53			  ; $9ec7 - Unknown opcode
	JSR $9ecf				; $9ec8: 20 CF 9E ; -> sub_9ECF
	BRK					  ; $9ecb: 00	  
	ORA $73,X				; $9ecc: 15 73   
	RTS					  ; $9ece: 60	  

; ---- Subroutine at $9ecf (Bank 17) ----
sub_9ECF:
	LDX $73				  ; $9ecf: A6 73   
	STX $70				  ; $9ed1: 86 70   
	LDX tmp0				 ; $9ed3: A6 00   
	RTS					  ; $9ed5: 60	  

; ---- Subroutine at $9ed6 (Bank 17) ----
sub_9ED6:
	LDX $73				  ; $9ed6: A6 73   
	STX $7d				  ; $9ed8: 86 7D   
	LDX $7b				  ; $9eda: A6 7B   
	RTS					  ; $9edc: 60	  

; ---- Subroutine at $9edd (Bank 17) ----
sub_9EDD:
	BRK					  ; $9edd: 00	  
	.db $07			  ; $9ede - Unknown opcode
	.db $1f			  ; $9edf - Unknown opcode
	BCC $9ef3				; $9ee0: 90 11   
	BRK					  ; $9ee2: 00	  
	ORA $3f				  ; $9ee3: 05 3F   
	STA $7c				  ; $9ee5: 85 7C   
	BRK					  ; $9ee7: 00	  
	ASL					  ; $9ee8: 0A	  
	.db $a3			  ; $9ee9 - Unknown opcode
	PHA					  ; $9eea: 48	  
	BRK					  ; $9eeb: 00	  
	INC $d3				  ; $9eec: E6 D3   
	ORA ($68,X)			  ; $9eee: 01 68   
	JMP $9f03				; $9ef0: 4C 03 9F
loc_9EF3:
	BVC $9f13				; $9ef3: 50 1E   
	BRK					  ; $9ef5: 00	  
	ORA $3f				  ; $9ef6: 05 3F   
	STA $6f				  ; $9ef8: 85 6F   
	BRK					  ; $9efa: 00	  
	.db $0b			  ; $9efb - Unknown opcode
	.db $53			  ; $9efc - Unknown opcode
	PHA					  ; $9efd: 48	  
	BRK					  ; $9efe: 00	  
	INC $d3				  ; $9eff: E6 D3   
	.db $02			  ; $9f01 - Unknown opcode
	PLA					  ; $9f02: 68	  
loc_9F03:
	STA tmp0				 ; $9f03: 85 00   
	BRK					  ; $9f05: 00	  
	ASL system_flags		 ; $9f06: 06 1F   
	LDA tmp0				 ; $9f08: A5 00   
	BCC $9f10				; $9f0a: 90 04   
	BRK					  ; $9f0c: 00	  
	ORA #$b3				 ; $9f0d: 09 B3   
	RTS					  ; $9f0f: 60	  
loc_9F10:
	BRK					  ; $9f10: 00	  
	ORA #$73				 ; $9f11: 09 73   
loc_9F13:
	RTS					  ; $9f13: 60	  
	BRK					  ; $9f14: 00	  
	.db $07			  ; $9f15 - Unknown opcode
	.db $1f			  ; $9f16 - Unknown opcode
	BCC $9f1f				; $9f17: 90 06   
	BRK					  ; $9f19: 00	  
	.db $17			  ; $9f1a - Unknown opcode
	.db $b3			  ; $9f1b - Unknown opcode
	JMP $9f36				; $9f1c: 4C 36 9F
loc_9F1F:
	BVC $9f63				; $9f1f: 50 42   
	BRK					  ; $9f21: 00	  
	.db $1b			  ; $9f22 - Unknown opcode
	.db $73			  ; $9f23 - Unknown opcode
	JMP $9f53				; $9f24: 4C 53 9F
	BRK					  ; $9f27: 00	  
	.db $07			  ; $9f28 - Unknown opcode
	.db $1f			  ; $9f29 - Unknown opcode
	BCC $9f47				; $9f2a: 90 1B   
	BRK					  ; $9f2c: 00	  
	ASL $a3,X				; $9f2d: 16 A3   
	LSR $7f				  ; $9f2f: 46 7F   
	LDA $7e				  ; $9f31: A5 7E   
	ROR					  ; $9f33: 6A	  
	ORA #$01				 ; $9f34: 09 01   
loc_9F36:
	STA $7c				  ; $9f36: 85 7C   
	LDA $7f				  ; $9f38: A5 7F   
	STA $7d				  ; $9f3a: 85 7D   
	JSR $a01f				; $9f3c: 20 1F A0 ; -> sub_A01F
	BRK					  ; $9f3f: 00	  
	ORA $00a3,Y			  ; $9f40: 19 A3 00
	INC $d3				  ; $9f43: E6 D3   
	ORA ($60,X)			  ; $9f45: 01 60   
loc_9F47:
	BVC $9f63				; $9f47: 50 1A   
	BRK					  ; $9f49: 00	  
	.db $1c			  ; $9f4a - Unknown opcode
	.db $53			  ; $9f4b - Unknown opcode
	LSR $73				  ; $9f4c: 46 73   
	LDA $72				  ; $9f4e: A5 72   
	ROR					  ; $9f50: 6A	  
	ORA #$01				 ; $9f51: 09 01   
loc_9F53:
	STA $6f				  ; $9f53: 85 6F   
	LDA $73				  ; $9f55: A5 73   
	STA $70				  ; $9f57: 85 70   
	JSR $a011				; $9f59: 20 11 A0 ; -> sub_A011
	BRK					  ; $9f5c: 00	  
	ASL $0053,X			  ; $9f5d: 1E 53 00
	INC $d3				  ; $9f60: E6 D3   
	.db $02			  ; $9f62 - Unknown opcode
loc_9F63:
	RTS					  ; $9f63: 60	  
	BRK					  ; $9f64: 00	  
	.db $07			  ; $9f65 - Unknown opcode
	.db $1f			  ; $9f66 - Unknown opcode
	BCC $9f78				; $9f67: 90 0F   
	BRK					  ; $9f69: 00	  
	.db $17			  ; $9f6a - Unknown opcode
	.db $b3			  ; $9f6b - Unknown opcode
	TXA					  ; $9f6c: 8A	  
	PHA					  ; $9f6d: 48	  
	LDX #$7e				 ; $9f6e: A2 7E   
	JSR $9f89				; $9f70: 20 89 9F ; -> sub_9F89
	PLA					  ; $9f73: 68	  
	TAX					  ; $9f74: AA	  
	JMP $9f9b				; $9f75: 4C 9B 9F
loc_9F78:
	BVC $9f63				; $9f78: 50 E9   
	BRK					  ; $9f7a: 00	  
	.db $1b			  ; $9f7b - Unknown opcode
	.db $73			  ; $9f7c - Unknown opcode
	TXA					  ; $9f7d: 8A	  
	PHA					  ; $9f7e: 48	  
	LDX #$72				 ; $9f7f: A2 72   
	JSR $9f89				; $9f81: 20 89 9F ; -> sub_9F89
	PLA					  ; $9f84: 68	  
	TAX					  ; $9f85: AA	  
	JMP $9fb3				; $9f86: 4C B3 9F

; ---- Subroutine at $9f89 (Bank 17) ----
sub_9F89:
	LDA #$03				 ; $9f89: A9 03   
	JSR $c827				; $9f8b: 20 27 C8 ; Call to fixed bank
	LDA #$02				 ; $9f8e: A9 02   
	JMP $c851				; $9f90: 4C 51 C8
	BRK					  ; $9f93: 00	  
	.db $07			  ; $9f94 - Unknown opcode
	.db $1f			  ; $9f95 - Unknown opcode
	BCC $9fae				; $9f96: 90 16   
	BRK					  ; $9f98: 00	  
	.db $17			  ; $9f99 - Unknown opcode
	.db $a3			  ; $9f9a - Unknown opcode
loc_9F9B:
	LDA $7e				  ; $9f9b: A5 7E   
	STA $7c				  ; $9f9d: 85 7C   
	LDA $7f				  ; $9f9f: A5 7F   
	STA $7d				  ; $9fa1: 85 7D   
	JSR $a01f				; $9fa3: 20 1F A0 ; -> sub_A01F
	BRK					  ; $9fa6: 00	  
	CLC					  ; $9fa7: 18	  
	.db $a3			  ; $9fa8 - Unknown opcode
	BRK					  ; $9fa9: 00	  
	INC $d3				  ; $9faa: E6 D3   
	ORA ($60,X)			  ; $9fac: 01 60   
loc_9FAE:
	BVC $9f63				; $9fae: 50 B3   
	BRK					  ; $9fb0: 00	  
	.db $1b			  ; $9fb1 - Unknown opcode
	.db $53			  ; $9fb2 - Unknown opcode
loc_9FB3:
	LDA $72				  ; $9fb3: A5 72   
	STA $6f				  ; $9fb5: 85 6F   
	LDA $73				  ; $9fb7: A5 73   
	STA $70				  ; $9fb9: 85 70   
	JSR $a011				; $9fbb: 20 11 A0 ; -> sub_A011
	BRK					  ; $9fbe: 00	  
	ORA $0053,X			  ; $9fbf: 1D 53 00
	INC $d3				  ; $9fc2: E6 D3   
	ORA ($60,X)			  ; $9fc4: 01 60   
	BRK					  ; $9fc6: 00	  
	.db $07			  ; $9fc7 - Unknown opcode
	.db $1f			  ; $9fc8 - Unknown opcode
	BCC $9fdb				; $9fc9: 90 10   
	BRK					  ; $9fcb: 00	  
	.db $0f			  ; $9fcc - Unknown opcode
	.db $b3			  ; $9fcd - Unknown opcode
	STA $7c				  ; $9fce: 85 7C   
	JSR $a01f				; $9fd0: 20 1F A0 ; -> sub_A01F
	BRK					  ; $9fd3: 00	  
	BPL $9f79				; $9fd4: 10 A3   
	BRK					  ; $9fd6: 00	  
	INC $d3				  ; $9fd7: E6 D3   
	ORA ($60,X)			  ; $9fd9: 01 60   
loc_9FDB:
	BVC $9fec				; $9fdb: 50 0F   
	BRK					  ; $9fdd: 00	  
	.db $12			  ; $9fde - Unknown opcode
	.db $73			  ; $9fdf - Unknown opcode
	STA $6f				  ; $9fe0: 85 6F   
	JSR $a011				; $9fe2: 20 11 A0 ; -> sub_A011
	BRK					  ; $9fe5: 00	  
	ORA $53,X				; $9fe6: 15 53   
	BRK					  ; $9fe8: 00	  
	INC $d3				  ; $9fe9: E6 D3   
	ORA ($60,X)			  ; $9feb: 01 60   
	BRK					  ; $9fed: 00	  
	.db $07			  ; $9fee - Unknown opcode
	.db $1f			  ; $9fef - Unknown opcode
	BCC $9fff				; $9ff0: 90 0D   
	BRK					  ; $9ff2: 00	  
	ORA $3f				  ; $9ff3: 05 3F   
	STA $7c				  ; $9ff5: 85 7C   
	BRK					  ; $9ff7: 00	  
	.db $02			  ; $9ff8 - Unknown opcode
	.db $a3			  ; $9ff9 - Unknown opcode
	BRK					  ; $9ffa: 00	  
	INC $d3				  ; $9ffb: E6 D3   
	ORA ($60,X)			  ; $9ffd: 01 60   
loc_9FFF:
	BVC $a010				; $9fff: 50 0F   
	BRK					  ; $a001: 00	  
	ORA $3f				  ; $a002: 05 3F   
	STA $6f				  ; $a004: 85 6F   
	BRK					  ; $a006: 00	  
	.db $02			  ; $a007 - Unknown opcode
	.db $53			  ; $a008 - Unknown opcode
	BRK					  ; $a009: 00	  
	INC $d3				  ; $a00a: E6 D3   
	ORA (tmp0,X)			 ; $a00c: 01 00   
	.db $27			  ; $a00e - Unknown opcode
	.db $0f			  ; $a00f - Unknown opcode
loc_A010:
	RTS					  ; $a010: 60	  

; ---- Subroutine at $a011 (Bank 17) ----
sub_A011:
	TXA					  ; $a011: 8A	  
	PHA					  ; $a012: 48	  
	JSR $ac5c				; $a013: 20 5C AC ; -> sub_AC5C
	BCC $a01c				; $a016: 90 04   
	ASL $6f				  ; $a018: 06 6F   
	ROL $70				  ; $a01a: 26 70   
loc_A01C:
	PLA					  ; $a01c: 68	  
	TAX					  ; $a01d: AA	  
	RTS					  ; $a01e: 60	  

; ---- Subroutine at $a01f (Bank 17) ----
sub_A01F:
	TXA					  ; $a01f: 8A	  
	PHA					  ; $a020: 48	  
	JSR $ac5c				; $a021: 20 5C AC ; -> sub_AC5C
	BCC $a01c				; $a024: 90 F6   
	ASL $7c				  ; $a026: 06 7C   
	ROL $7d				  ; $a028: 26 7D   
	PLA					  ; $a02a: 68	  
	TAX					  ; $a02b: AA	  
	RTS					  ; $a02c: 60	  
	LDA #$06				 ; $a02d: A9 06   
	STA $71				  ; $a02f: 85 71   
	JSR $a0b7				; $a031: 20 B7 A0 ; -> sub_A0B7
	BCC $a03b				; $a034: 90 05   
loc_A036:
	BRK					  ; $a036: 00	  
	CPX $d3				  ; $a037: E4 D3   
	.db $1a			  ; $a039 - Unknown opcode
	RTS					  ; $a03a: 60	  
loc_A03B:
	BRK					  ; $a03b: 00	  
	.db $1b			  ; $a03c - Unknown opcode
	.db $0f			  ; $a03d - Unknown opcode
	CMP #$80				 ; $a03e: C9 80	; Compare with 128
	BCC $a050				; $a040: 90 0E   
	BRK					  ; $a042: 00	  
	INC $d3				  ; $a043: E6 D3   
	.db $03			  ; $a045 - Unknown opcode
	RTS					  ; $a046: 60	  
loc_A047:
	LDA #$05				 ; $a047: A9 05   
	STA $71				  ; $a049: 85 71   
	JSR $a0b7				; $a04b: 20 B7 A0 ; -> sub_A0B7
	BCS $a036				; $a04e: B0 E6   
loc_A050:
	BRK					  ; $a050: 00	  
	.db $07			  ; $a051 - Unknown opcode
	.db $1f			  ; $a052 - Unknown opcode
	BCC $a078				; $a053: 90 23   
	JSR $a0c6				; $a055: 20 C6 A0 ; -> sub_A0C6
	BCC $a036				; $a058: 90 DC   
	BRK					  ; $a05a: 00	  
	ROL					  ; $a05b: 2A	  
	.db $c3			  ; $a05c - Unknown opcode
	ASL $71a5				; $a05d: 0E A5 71
	CMP #$05				 ; $a060: C9 05	; Compare with 5
	BNE $a06a				; $a062: D0 06   
	BRK					  ; $a064: 00	  
	ORA $b3				  ; $a065: 05 B3   
	JMP $a06d				; $a067: 4C 6D A0
loc_A06A:
	BRK					  ; $a06a: 00	  
	ASL $b3				  ; $a06b: 06 B3   
loc_A06D:
	JSR $a0dc				; $a06d: 20 DC A0 ; -> sub_A0DC
	JSR $a0ef				; $a070: 20 EF A0 ; -> sub_A0EF
	BRK					  ; $a073: 00	  
	INC $d3				  ; $a074: E6 D3   
	ORA ($60,X)			  ; $a076: 01 60   
loc_A078:
	BVC $a08d				; $a078: 50 13   
	BRK					  ; $a07a: 00	  
	.db $44			  ; $a07b - Unknown opcode
	.db $93			  ; $a07c - Unknown opcode
	.db $07			  ; $a07d - Unknown opcode
	LDA $71				  ; $a07e: A5 71   
	BRK					  ; $a080: 00	  
	BRK					  ; $a081: 00	  
	.db $13			  ; $a082 - Unknown opcode
	JSR $a0ef				; $a083: 20 EF A0 ; -> sub_A0EF
	BRK					  ; $a086: 00	  
	.db $27			  ; $a087 - Unknown opcode
	.db $0f			  ; $a088 - Unknown opcode
	BRK					  ; $a089: 00	  
	INC $d3				  ; $a08a: E6 D3   
	ORA ($60,X)			  ; $a08c: 01 60   
	BRK					  ; $a08e: 00	  
	ORA (system_flags,X)	 ; $a08f: 01 1F   
	CMP $7363				; $a091: CD 63 73
	BEQ $a0a8				; $a094: F0 12   
	BRK					  ; $a096: 00	  
	.db $07			  ; $a097 - Unknown opcode
	.db $1f			  ; $a098 - Unknown opcode
	BCS $a0a9				; $a099: B0 0E   
	BRK					  ; $a09b: 00	  
	LSR $93				  ; $a09c: 46 93   
	.db $07			  ; $a09e - Unknown opcode
	BCC $a047				; $a09f: 90 A6   
	BRK					  ; $a0a1: 00	  
	ORA $73				  ; $a0a2: 05 73   
	BRK					  ; $a0a4: 00	  
	INC $d3				  ; $a0a5: E6 D3   
	.db $02			  ; $a0a7 - Unknown opcode
loc_A0A8:
	RTS					  ; $a0a8: 60	  
loc_A0A9:
	BRK					  ; $a0a9: 00	  
	AND #$c3				 ; $a0aa: 29 C3   
	ASL $9890				; $a0ac: 0E 90 98
	BRK					  ; $a0af: 00	  
	ORA $a3				  ; $a0b0: 05 A3   
	BRK					  ; $a0b2: 00	  
	INC $d3				  ; $a0b3: E6 D3   
	.db $02			  ; $a0b5 - Unknown opcode
	RTS					  ; $a0b6: 60	  

; ---- Subroutine at $a0b7 (Bank 17) ----
sub_A0B7:
	BRK					  ; $a0b7: 00	  
	.db $07			  ; $a0b8 - Unknown opcode
	.db $1f			  ; $a0b9 - Unknown opcode
	BCC $a0c1				; $a0ba: 90 05   
	BRK					  ; $a0bc: 00	  
	AND #$c3				 ; $a0bd: 29 C3   
	ASL $0060				; $a0bf: 0E 60 00
	LSR $93				  ; $a0c2: 46 93   
	.db $07			  ; $a0c4 - Unknown opcode
	RTS					  ; $a0c5: 60	  

; ---- Subroutine at $a0c6 (Bank 17) ----
sub_A0C6:
	BRK					  ; $a0c6: 00	  
	.db $07			  ; $a0c7 - Unknown opcode
	.db $1f			  ; $a0c8 - Unknown opcode
	TXA					  ; $a0c9: 8A	  
	PHA					  ; $a0ca: 48	  
	STA $c7				  ; $a0cb: 85 C7   
	BRK					  ; $a0cd: 00	  
	AND $aab3				; $a0ce: 2D B3 AA
	LDA $6e45,X			  ; $a0d1: BD 45 6E
	STA $c4				  ; $a0d4: 85 C4   
	BRK					  ; $a0d6: 00	  
	ORA $4f				  ; $a0d7: 05 4F   
	PLA					  ; $a0d9: 68	  
	TAX					  ; $a0da: AA	  
	RTS					  ; $a0db: 60	  

; ---- Subroutine at $a0dc (Bank 17) ----
sub_A0DC:
	TXA					  ; $a0dc: 8A	  
	PHA					  ; $a0dd: 48	  
	STA $c7				  ; $a0de: 85 C7   
	BRK					  ; $a0e0: 00	  
	AND $aab3				; $a0e1: 2D B3 AA
	LDA $6e45,X			  ; $a0e4: BD 45 6E
	STA $c4				  ; $a0e7: 85 C4   
	BRK					  ; $a0e9: 00	  
	ASL $4f				  ; $a0ea: 06 4F   
	PLA					  ; $a0ec: 68	  
	TAX					  ; $a0ed: AA	  
	RTS					  ; $a0ee: 60	  

; ---- Subroutine at $a0ef (Bank 17) ----
sub_A0EF:
	LDA $7363				; $a0ef: AD 63 73
	BRK					  ; $a0f2: 00	  
	ORA #$1f				 ; $a0f3: 09 1F   
	BCC $a0fc				; $a0f5: 90 05   
	LDA #$02				 ; $a0f7: A9 02   
	BRK					  ; $a0f9: 00	  
	PHP					  ; $a0fa: 08	  
	.db $1f			  ; $a0fb - Unknown opcode
loc_A0FC:
	RTS					  ; $a0fc: 60	  
	JSR $a108				; $a0fd: 20 08 A1 ; -> sub_A108
	BCC $a107				; $a100: 90 05   
loc_A102:
	JSR $a10e				; $a102: 20 0E A1 ; -> sub_A10E
	BCS $a102				; $a105: B0 FB   
loc_A107:
	RTS					  ; $a107: 60	  

; ---- Subroutine at $a108 (Bank 17) ----
sub_A108:
	JSR $a10e				; $a108: 20 0E A1 ; -> sub_A10E
	BCC $a141				; $a10b: 90 34   
	RTS					  ; $a10d: 60	  

; ---- Subroutine at $a10e (Bank 17) ----
sub_A10E:
	JSR $a11a				; $a10e: 20 1A A1 ; -> sub_A11A
	BCS $a14c				; $a111: B0 39   
	RTS					  ; $a113: 60	  
	JSR $a11a				; $a114: 20 1A A1 ; -> sub_A11A
	BCS $a15a				; $a117: B0 41   
	RTS					  ; $a119: 60	  

; ---- Subroutine at $a11a (Bank 17) ----
sub_A11A:
	JSR $a1b4				; $a11a: 20 B4 A1 ; -> sub_A1B4
	BCC $a107				; $a11d: 90 E8   
	STX $c7				  ; $a11f: 86 C7   
	TXA					  ; $a121: 8A	  
	BRK					  ; $a122: 00	  
	ASL system_flags		 ; $a123: 06 1F   
	BRK					  ; $a125: 00	  
	AND $85b3				; $a126: 2D B3 85
	.db $7c			  ; $a129 - Unknown opcode
	TAX					  ; $a12a: AA	  
	LDA $6e45,X			  ; $a12b: BD 45 6E
	JMP $a175				; $a12e: 4C 75 A1
	JSR $a13c				; $a131: 20 3C A1 ; -> sub_A13C
	BCC $a13b				; $a134: 90 05   
loc_A136:
	JSR $a147				; $a136: 20 47 A1 ; -> sub_A147
	BCS $a136				; $a139: B0 FB   
loc_A13B:
	RTS					  ; $a13b: 60	  

; ---- Subroutine at $a13c (Bank 17) ----
sub_A13C:
	JSR $a161				; $a13c: 20 61 A1 ; -> sub_A161
	BCS $a14c				; $a13f: B0 0B   
loc_A141:
	BRK					  ; $a141: 00	  
	INX					  ; $a142: E8	  
	.db $d3			  ; $a143 - Unknown opcode
	.db $1a			  ; $a144 - Unknown opcode
	CLC					  ; $a145: 18	  
	RTS					  ; $a146: 60	  

; ---- Subroutine at $a147 (Bank 17) ----
sub_A147:
	JSR $a161				; $a147: 20 61 A1 ; -> sub_A161
	BCC $a154				; $a14a: 90 08   
loc_A14C:
	JSR $a0ef				; $a14c: 20 EF A0 ; -> sub_A0EF
	BRK					  ; $a14f: 00	  
	INC $d3				  ; $a150: E6 D3   
	ORA ($38,X)			  ; $a152: 01 38   
loc_A154:
	RTS					  ; $a154: 60	  
	JSR $a161				; $a155: 20 61 A1 ; -> sub_A161
	BCC $a154				; $a158: 90 FA   
loc_A15A:
	BRK					  ; $a15a: 00	  
	INC $d3				  ; $a15b: E6 D3   
	ORA ($4c,X)			  ; $a15d: 01 4C   
	BNE $a102				; $a15f: D0 A1   

; ---- Subroutine at $a161 (Bank 17) ----
sub_A161:
	BRK					  ; $a161: 00	  
	.db $03			  ; $a162 - Unknown opcode
	.db $1f			  ; $a163 - Unknown opcode
	SEC					  ; $a164: 38	  
	SBC #$5c				 ; $a165: E9 5C	; Arithmetic
	TAY					  ; $a167: A8	  
	JSR $a1b4				; $a168: 20 B4 A1 ; -> sub_A1B4
	BCC $a199				; $a16b: 90 2C   
	STX $c7				  ; $a16d: 86 C7   
	BRK					  ; $a16f: 00	  
	ORA #$4f				 ; $a170: 09 4F   
	BRK					  ; $a172: 00	  
	ORA ($4f),Y			  ; $a173: 11 4F   
loc_A175:
	STA $c4				  ; $a175: 85 C4   
	BRK					  ; $a177: 00	  
	ORA $4f				  ; $a178: 05 4F   
	BCC $a199				; $a17a: 90 1D   

; ---- Subroutine at $a17c (Bank 17) ----
sub_A17C:
	LDA $c4				  ; $a17c: A5 C4   
	LDX $c6				  ; $a17e: A6 C6   
	STA $6e45,X			  ; $a180: 9D 45 6E
	STA $7206,X			  ; $a183: 9D 06 72
	LDA $c7				  ; $a186: A5 C7   
	TAX					  ; $a188: AA	  
	ORA #$80				 ; $a189: 09 80   
	STA $7363				; $a18b: 8D 63 73
	LDA $c6				  ; $a18e: A5 C6   
	STA $7c				  ; $a190: 85 7C   
	BRK					  ; $a192: 00	  
	AND ($a3),Y			  ; $a193: 31 A3   
	BRK					  ; $a195: 00	  
	ASL $4f				  ; $a196: 06 4F   
loc_A198:
	SEC					  ; $a198: 38	  
loc_A199:
	RTS					  ; $a199: 60	  

; ---- Subroutine at $a19a (Bank 17) ----
sub_A19A:
	JSR $a1b4				; $a19a: 20 B4 A1 ; -> sub_A1B4
	BCC $a1a8				; $a19d: 90 09   
	STX $c7				  ; $a19f: 86 C7   
	LDA #$84				 ; $a1a1: A9 84   
	STA $c4				  ; $a1a3: 85 C4   
	BRK					  ; $a1a5: 00	  
	ORA $4f				  ; $a1a6: 05 4F   
loc_A1A8:
	RTS					  ; $a1a8: 60	  

; ---- Subroutine at $a1a9 (Bank 17) ----
sub_A1A9:
	JSR $a19a				; $a1a9: 20 9A A1 ; -> sub_A19A
	BCC $a141				; $a1ac: 90 93   
	JSR $a17c				; $a1ae: 20 7C A1 ; -> sub_A17C
	JMP $a14c				; $a1b1: 4C 4C A1

; ---- Subroutine at $a1b4 (Bank 17) ----
sub_A1B4:
	LDX #$00				 ; $a1b4: A2 00   
loc_A1B6:
	BRK					  ; $a1b6: 00	  
	AND #$c3				 ; $a1b7: 29 C3   
	.db $0f			  ; $a1b9 - Unknown opcode
	BCC $a198				; $a1ba: 90 DC   
	INX					  ; $a1bc: E8	  
	CPX #$08				 ; $a1bd: E0 08   
	BNE $a1b6				; $a1bf: D0 F5   
	LDX #$00				 ; $a1c1: A2 00   
loc_A1C3:
	BRK					  ; $a1c3: 00	  
	AND #$c3				 ; $a1c4: 29 C3   
	ASL $cf90				; $a1c6: 0E 90 CF
	INX					  ; $a1c9: E8	  
	CPX #$08				 ; $a1ca: E0 08   
	BNE $a1c3				; $a1cc: D0 F5   
	CLC					  ; $a1ce: 18	  
	RTS					  ; $a1cf: 60	  

; ---- Subroutine at $a1d0 (Bank 17) ----
sub_A1D0:
	LDA $96				  ; $a1d0: A5 96   
	PHA					  ; $a1d2: 48	  
	BRK					  ; $a1d3: 00	  
	.db $03			  ; $a1d4 - Unknown opcode
	.db $1f			  ; $a1d5 - Unknown opcode
	PHA					  ; $a1d6: 48	  
	BRK					  ; $a1d7: 00	  
	.db $02			  ; $a1d8 - Unknown opcode
	.db $1f			  ; $a1d9 - Unknown opcode
	PHA					  ; $a1da: 48	  
	LDA $735d				; $a1db: AD 5D 73
	PHA					  ; $a1de: 48	  
	LDA $735c				; $a1df: AD 5C 73
	PHA					  ; $a1e2: 48	  
	LDA $735e				; $a1e3: AD 5E 73
	PHA					  ; $a1e6: 48	  
	LDA $7363				; $a1e7: AD 63 73
	BRK					  ; $a1ea: 00	  
	ORA #$1f				 ; $a1eb: 09 1F   
	BCC $a20a				; $a1ed: 90 1B   
	STX $96				  ; $a1ef: 86 96   
	LDA #$00				 ; $a1f1: A9 00   
	BRK					  ; $a1f3: 00	  
	.db $0c			  ; $a1f4 - Unknown opcode
	.db $1f			  ; $a1f5 - Unknown opcode
	LDX $96				  ; $a1f6: A6 96   
	LDA #$00				 ; $a1f8: A9 00   
	BRK					  ; $a1fa: 00	  
	PHP					  ; $a1fb: 08	  
	.db $1f			  ; $a1fc - Unknown opcode
	BRK					  ; $a1fd: 00	  
	AND ($0f),Y			  ; $a1fe: 31 0F   
	JSR $88ca				; $a200: 20 CA 88 ; -> sub_88CA
	LDX $96				  ; $a203: A6 96   
	LDA #$02				 ; $a205: A9 02   
	BRK					  ; $a207: 00	  
	PHP					  ; $a208: 08	  
	.db $1f			  ; $a209 - Unknown opcode
loc_A20A:
	PLA					  ; $a20a: 68	  
	STA $735e				; $a20b: 8D 5E 73
	PLA					  ; $a20e: 68	  
	STA $735c				; $a20f: 8D 5C 73
	PLA					  ; $a212: 68	  
	STA $735d				; $a213: 8D 5D 73
	BRK					  ; $a216: 00	  
	ORA (system_flags,X)	 ; $a217: 01 1F   
	BRK					  ; $a219: 00	  
	ORA #$1f				 ; $a21a: 09 1F   
	PLA					  ; $a21c: 68	  
	BRK					  ; $a21d: 00	  
	.db $0b			  ; $a21e - Unknown opcode
	.db $1f			  ; $a21f - Unknown opcode
	PLA					  ; $a220: 68	  
	BRK					  ; $a221: 00	  
	ASL					  ; $a222: 0A	  
	.db $1f			  ; $a223 - Unknown opcode
loc_A224:
	PLA					  ; $a224: 68	  
	STA $96				  ; $a225: 85 96   
	RTS					  ; $a227: 60	  
	BRK					  ; $a228: 00	  
	.db $03			  ; $a229 - Unknown opcode
	.db $1f			  ; $a22a - Unknown opcode
	SEC					  ; $a22b: 38	  
	SBC #$69				 ; $a22c: E9 69	; Arithmetic
	STA $c4				  ; $a22e: 85 C4   
	PHA					  ; $a230: 48	  
	STA $7d				  ; $a231: 85 7D   
	BRK					  ; $a233: 00	  
	ASL system_flags		 ; $a234: 06 1F   
	TXA					  ; $a236: 8A	  
	PHA					  ; $a237: 48	  
	STX $c7				  ; $a238: 86 C7   
	BRK					  ; $a23a: 00	  
	.db $0c			  ; $a23b - Unknown opcode
	.db $4f			  ; $a23c - Unknown opcode
	PLA					  ; $a23d: 68	  
	TAX					  ; $a23e: AA	  
	PLA					  ; $a23f: 68	  
	STA $c4				  ; $a240: 85 C4   
	BCC $a29c				; $a242: 90 58   
	BRK					  ; $a244: 00	  
	ROL					  ; $a245: 2A	  
	.db $c3			  ; $a246 - Unknown opcode
	BPL $a249				; $a247: 10 00   
loc_A249:
	AND $a8b3				; $a249: 2D B3 A8
	LDA $7206,Y			  ; $a24c: B9 06 72
	PHA					  ; $a24f: 48	  
	LDA $c4				  ; $a250: A5 C4   
	CLC					  ; $a252: 18	  
	ADC #$d3				 ; $a253: 69 D3	; Arithmetic
	STA $7206,Y			  ; $a255: 99 06 72
	BRK					  ; $a258: 00	  
	ORA $b3				  ; $a259: 05 B3   
	BRK					  ; $a25b: 00	  
	ORA $a9b3				; $a25c: 0D B3 A9
	.db $ff			  ; $a25f - Unknown opcode
	STA $7d				  ; $a260: 85 7D   
	BRK					  ; $a262: 00	  
	ORA ($b3),Y			  ; $a263: 11 B3   
	BRK					  ; $a265: 00	  
	ORA $a3,X				; $a266: 15 A3   
	BRK					  ; $a268: 00	  
	ORA $00a3,Y			  ; $a269: 19 A3 00
	.db $0f			  ; $a26c - Unknown opcode
	.db $b3			  ; $a26d - Unknown opcode
	BRK					  ; $a26e: 00	  
	BPL $a224				; $a26f: 10 B3   
	BRK					  ; $a271: 00	  
	.db $13			  ; $a272 - Unknown opcode
	.db $b3			  ; $a273 - Unknown opcode
	STA $7c				  ; $a274: 85 7C   
	LDA $7f				  ; $a276: A5 7F   
	STA $7d				  ; $a278: 85 7D   
	BRK					  ; $a27a: 00	  
	.db $14			  ; $a27b - Unknown opcode
	.db $a3			  ; $a27c - Unknown opcode
	BRK					  ; $a27d: 00	  
	.db $17			  ; $a27e - Unknown opcode
	.db $b3			  ; $a27f - Unknown opcode
	STA $7c				  ; $a280: 85 7C   
	LDA $7f				  ; $a282: A5 7F   
	STA $7d				  ; $a284: 85 7D   
	BRK					  ; $a286: 00	  
	CLC					  ; $a287: 18	  
	.db $a3			  ; $a288 - Unknown opcode
	PLA					  ; $a289: 68	  
	STA $7206,Y			  ; $a28a: 99 06 72
	JSR $a293				; $a28d: 20 93 A2 ; -> sub_A293
	JSR $a1d0				; $a290: 20 D0 A1 ; -> sub_A1D0

; ---- Subroutine at $a293 (Bank 17) ----
sub_A293:
	LDA #$00				 ; $a293: A9 00   
	STA ptr1_lo			  ; $a295: 85 06   
	BRK					  ; $a297: 00	  
	.db $1f			  ; $a298 - Unknown opcode
	.db $0f			  ; $a299 - Unknown opcode
	SEC					  ; $a29a: 38	  
	RTS					  ; $a29b: 60	  
loc_A29C:
	BRK					  ; $a29c: 00	  
	CPX $d3				  ; $a29d: E4 D3   
	.db $1a			  ; $a29f - Unknown opcode
	CLC					  ; $a2a0: 18	  
	RTS					  ; $a2a1: 60	  
	BRK					  ; $a2a2: 00	  
	ORA $a24f				; $a2a3: 0D 4F A2
	.db $07			  ; $a2a6 - Unknown opcode
loc_A2A7:
	BRK					  ; $a2a7: 00	  
	.db $2b			  ; $a2a8 - Unknown opcode
	.db $c3			  ; $a2a9 - Unknown opcode
	.db $0f			  ; $a2aa - Unknown opcode
	DEX					  ; $a2ab: CA	  
	BPL $a2a7				; $a2ac: 10 F9   
	LDA #$30				 ; $a2ae: A9 30   
	STA $6e45				; $a2b0: 8D 45 6E
	STA $6e46				; $a2b3: 8D 46 6E
	STA $7207				; $a2b6: 8D 07 72
	LDA #$00				 ; $a2b9: A9 00   
	TAX					  ; $a2bb: AA	  
	ORA #$80				 ; $a2bc: 09 80   
	STA $7363				; $a2be: 8D 63 73
	LDA #$01				 ; $a2c1: A9 01   
	STA $7c				  ; $a2c3: 85 7C   
	BRK					  ; $a2c5: 00	  
	AND ($a3),Y			  ; $a2c6: 31 A3   
	JSR $a0ef				; $a2c8: 20 EF A0 ; -> sub_A0EF
	BRK					  ; $a2cb: 00	  
	CPX $d3				  ; $a2cc: E4 D3   
	EOR ($ad,X)			  ; $a2ce: 41 AD   
	.db $44			  ; $a2d0 - Unknown opcode
	ROR $0309				; $a2d1: 6E 09 03
	STA $6e44				; $a2d4: 8D 44 6E
	RTS					  ; $a2d7: 60	  

; ---- Subroutine at $a2d8 (Bank 17) ----
sub_A2D8:
	TXA					  ; $a2d8: 8A	  
	PHA					  ; $a2d9: 48	  
	LDX $96				  ; $a2da: A6 96   
	LDA $72f4,X			  ; $a2dc: BD F4 72
	AND #$8f				 ; $a2df: 29 8F   
	JMP $a362				; $a2e1: 4C 62 A3
	JSR $a2d8				; $a2e4: 20 D8 A2 ; -> sub_A2D8
	BMI $a2ff				; $a2e7: 30 16   
loc_A2E9:
	TAX					  ; $a2e9: AA	  
	LDA $6e				  ; $a2ea: A5 6E   
	PHA					  ; $a2ec: 48	  
	LDA $6f				  ; $a2ed: A5 6F   
	PHA					  ; $a2ef: 48	  
	TXA					  ; $a2f0: 8A	  
	BRK					  ; $a2f1: 00	  
	.db $67			  ; $a2f2 - Unknown opcode
	.db $73			  ; $a2f3 - Unknown opcode
	PLA					  ; $a2f4: 68	  
	STA $6f				  ; $a2f5: 85 6F   
	PLA					  ; $a2f7: 68	  
	STA $6e				  ; $a2f8: 85 6E   
	LDX $72				  ; $a2fa: A6 72   
	TXA					  ; $a2fc: 8A	  
	CLC					  ; $a2fd: 18	  
	RTS					  ; $a2fe: 60	  
loc_A2FF:
	AND #$07				 ; $a2ff: 29 07   
	TAX					  ; $a301: AA	  
	SEC					  ; $a302: 38	  
	RTS					  ; $a303: 60	  

; ---- Subroutine at $a304 (Bank 17) ----
sub_A304:
	TXA					  ; $a304: 8A	  
	PHA					  ; $a305: 48	  
	JSR $a3b5				; $a306: 20 B5 A3 ; -> sub_A3B5
	LDA $7300,X			  ; $a309: BD 00 73
	AND #$8f				 ; $a30c: 29 8F   
	JMP $a362				; $a30e: 4C 62 A3
	LDA $7363				; $a311: AD 63 73
	AND #$8f				 ; $a314: 29 8F   
	BPL $a2e9				; $a316: 10 D1   
	BMI $a2ff				; $a318: 30 E5   
	JSR $a3c2				; $a31a: 20 C2 A3 ; -> sub_A3C2
	AND #$8f				 ; $a31d: 29 8F   
	STA $6e0f				; $a31f: 8D 0F 6E
	LDA $7300,X			  ; $a322: BD 00 73
	AND #$70				 ; $a325: 29 70   
	ORA $6e0f				; $a327: 0D 0F 6E
	STA $7300,X			  ; $a32a: 9D 00 73
	RTS					  ; $a32d: 60	  

; ---- Subroutine at $a32e (Bank 17) ----
sub_A32E:
	TXA					  ; $a32e: 8A	  
	PHA					  ; $a32f: 48	  
	JSR $a3b5				; $a330: 20 B5 A3 ; -> sub_A3B5
	LDA $7324,X			  ; $a333: BD 24 73
	JMP $a362				; $a336: 4C 62 A3
	STA $6e0f				; $a339: 8D 0F 6E
	TXA					  ; $a33c: 8A	  
	PHA					  ; $a33d: 48	  
	JSR $a3b5				; $a33e: 20 B5 A3 ; -> sub_A3B5
	LDA $6e0f				; $a341: AD 0F 6E
	STA $7324,X			  ; $a344: 9D 24 73
	JMP $a362				; $a347: 4C 62 A3
	TXA					  ; $a34a: 8A	  
	PHA					  ; $a34b: 48	  
	LDX $96				  ; $a34c: A6 96   
	LDA $72f4,X			  ; $a34e: BD F4 72
	JMP $a35c				; $a351: 4C 5C A3
	TXA					  ; $a354: 8A	  
	PHA					  ; $a355: 48	  
	JSR $a3b5				; $a356: 20 B5 A3 ; -> sub_A3B5
	LDA $7300,X			  ; $a359: BD 00 73
loc_A35C:
	LSR					  ; $a35c: 4A	  
	LSR					  ; $a35d: 4A	  
	LSR					  ; $a35e: 4A	  
	LSR					  ; $a35f: 4A	  
	AND #$07				 ; $a360: 29 07   
loc_A362:
	STA $6e0f				; $a362: 8D 0F 6E
	PLA					  ; $a365: 68	  
	TAX					  ; $a366: AA	  
	LDA $6e0f				; $a367: AD 0F 6E
	RTS					  ; $a36a: 60	  
	ASL					  ; $a36b: 0A	  
	ASL					  ; $a36c: 0A	  
	ASL					  ; $a36d: 0A	  
	ASL					  ; $a36e: 0A	  
	STA $6e0f				; $a36f: 8D 0F 6E
	LDA $72f4,X			  ; $a372: BD F4 72
	AND #$8f				 ; $a375: 29 8F   
	ORA $6e0f				; $a377: 0D 0F 6E
	STA $72f4,X			  ; $a37a: 9D F4 72
	RTS					  ; $a37d: 60	  
	JSR $a3c2				; $a37e: 20 C2 A3 ; -> sub_A3C2
	ASL					  ; $a381: 0A	  
	ASL					  ; $a382: 0A	  
	ASL					  ; $a383: 0A	  
	ASL					  ; $a384: 0A	  
	STA $6e0f				; $a385: 8D 0F 6E
	LDA $7300,X			  ; $a388: BD 00 73
	AND #$8f				 ; $a38b: 29 8F   
	ORA $6e0f				; $a38d: 0D 0F 6E
	STA $7300,X			  ; $a390: 9D 00 73
	RTS					  ; $a393: 60	  
	STA $6e0f				; $a394: 8D 0F 6E
	LDX #$00				 ; $a397: A2 00   
loc_A399:
	LDA $72f4,X			  ; $a399: BD F4 72
	AND #$70				 ; $a39c: 29 70   
	CMP #$70				 ; $a39e: C9 70	; Compare with 112
	BEQ $a3ac				; $a3a0: F0 0A   
	LDA $72f4,X			  ; $a3a2: BD F4 72
	AND #$8f				 ; $a3a5: 29 8F   
	CMP $6e0f				; $a3a7: CD 0F 6E
	BEQ $a3b3				; $a3aa: F0 07   
loc_A3AC:
	INX					  ; $a3ac: E8	  
	CPX #$0c				 ; $a3ad: E0 0C   
	BNE $a399				; $a3af: D0 E8   
	CLC					  ; $a3b1: 18	  
	RTS					  ; $a3b2: 60	  
loc_A3B3:
	SEC					  ; $a3b3: 38	  
	RTS					  ; $a3b4: 60	  

; ---- Subroutine at $a3b5 (Bank 17) ----
sub_A3B5:
	LDA tmp0				 ; $a3b5: A5 00   
	PHA					  ; $a3b7: 48	  
	JSR $a3d4				; $a3b8: 20 D4 A3 ; -> sub_A3D4
	ADC $96				  ; $a3bb: 65 96	; Arithmetic
	TAX					  ; $a3bd: AA	  
	PLA					  ; $a3be: 68	  
	STA tmp0				 ; $a3bf: 85 00   
	RTS					  ; $a3c1: 60	  

; ---- Subroutine at $a3c2 (Bank 17) ----
sub_A3C2:
	PHA					  ; $a3c2: 48	  
	LDA tmp0				 ; $a3c3: A5 00   
	PHA					  ; $a3c5: 48	  
	JSR $a3d4				; $a3c6: 20 D4 A3 ; -> sub_A3D4
	STA tmp0				 ; $a3c9: 85 00   
	TXA					  ; $a3cb: 8A	  
	ADC tmp0				 ; $a3cc: 65 00	; Arithmetic
	TAX					  ; $a3ce: AA	  
	PLA					  ; $a3cf: 68	  
	STA tmp0				 ; $a3d0: 85 00   
	PLA					  ; $a3d2: 68	  
	RTS					  ; $a3d3: 60	  

; ---- Subroutine at $a3d4 (Bank 17) ----
sub_A3D4:
	LDA $735c				; $a3d4: AD 5C 73
	ASL					  ; $a3d7: 0A	  
	ASL					  ; $a3d8: 0A	  
	STA tmp0				 ; $a3d9: 85 00   
	ASL					  ; $a3db: 0A	  
	ADC tmp0				 ; $a3dc: 65 00	; Arithmetic
	RTS					  ; $a3de: 60	  
	JSR $a2d8				; $a3df: 20 D8 A2 ; -> sub_A2D8
	STA tmp0				 ; $a3e2: 85 00   
	JSR $a304				; $a3e4: 20 04 A3 ; -> sub_A304
	EOR tmp0				 ; $a3e7: 45 00   
	STA tmp0				 ; $a3e9: 85 00   
	JSR $a32e				; $a3eb: 20 2E A3 ; -> sub_A32E
	BRK					  ; $a3ee: 00	  
	.db $0c			  ; $a3ef - Unknown opcode
	.db $3f			  ; $a3f0 - Unknown opcode
	ROR					  ; $a3f1: 6A	  
	EOR tmp0				 ; $a3f2: 45 00   
	STA tmp0				 ; $a3f4: 85 00   
	RTS					  ; $a3f6: 60	  

; ---- Subroutine at $a3f7 (Bank 17) ----
sub_A3F7:
	LDA $72e9				; $a3f7: AD E9 72
	BMI $a409				; $a3fa: 30 0D   
	BRK					  ; $a3fc: 00	  
	.db $07			  ; $a3fd - Unknown opcode
	.db $6f			  ; $a3fe - Unknown opcode
	.db $2b			  ; $a3ff - Unknown opcode
	JSR $ae0a				; $a400: 20 0A AE ; -> sub_AE0A
	BCC $a409				; $a403: 90 04   
	BRK					  ; $a405: 00	  
	.db $07			  ; $a406 - Unknown opcode
	.db $6f			  ; $a407 - Unknown opcode
	EOR $e260				; $a408: 4D 60 E2
	TXS					  ; $a40b: 9A	  
	.db $e2			  ; $a40c - Unknown opcode
	TXS					  ; $a40d: 9A	  
	.db $e2			  ; $a40e - Unknown opcode
	TXS					  ; $a40f: 9A	  
	.db $e2			  ; $a410 - Unknown opcode
	TXS					  ; $a411: 9A	  
	.db $e2			  ; $a412 - Unknown opcode
	TXS					  ; $a413: 9A	  
	.db $e2			  ; $a414 - Unknown opcode
	TXS					  ; $a415: 9A	  
	.db $e2			  ; $a416 - Unknown opcode
	TXS					  ; $a417: 9A	  
	.db $e2			  ; $a418 - Unknown opcode
	TXS					  ; $a419: 9A	  
	.db $e2			  ; $a41a - Unknown opcode
	TXS					  ; $a41b: 9A	  
	.db $e2			  ; $a41c - Unknown opcode
	TXS					  ; $a41d: 9A	  
	.db $e2			  ; $a41e - Unknown opcode
	TXS					  ; $a41f: 9A	  
	.db $e2			  ; $a420 - Unknown opcode
	TXS					  ; $a421: 9A	  
	.db $e2			  ; $a422 - Unknown opcode
	TXS					  ; $a423: 9A	  
	.db $e2			  ; $a424 - Unknown opcode
	TXS					  ; $a425: 9A	  
	.db $e2			  ; $a426 - Unknown opcode
	TXS					  ; $a427: 9A	  
	.db $e2			  ; $a428 - Unknown opcode
	TXS					  ; $a429: 9A	  
	.db $e2			  ; $a42a - Unknown opcode
	TXS					  ; $a42b: 9A	  
	.db $e2			  ; $a42c - Unknown opcode
	TXS					  ; $a42d: 9A	  
	.db $e2			  ; $a42e - Unknown opcode
	TXS					  ; $a42f: 9A	  
	.db $0c			  ; $a430 - Unknown opcode
	.db $9b			  ; $a431 - Unknown opcode
	.db $0c			  ; $a432 - Unknown opcode
	.db $9b			  ; $a433 - Unknown opcode
	STX $9b				  ; $a434: 86 9B   
	.db $53			  ; $a436 - Unknown opcode
	.db $9b			  ; $a437 - Unknown opcode
	.db $c3			  ; $a438 - Unknown opcode
	.db $9c			  ; $a439 - Unknown opcode
	.db $c3			  ; $a43a - Unknown opcode
	.db $9c			  ; $a43b - Unknown opcode
	LDY $ca9c,X			  ; $a43c: BC 9C CA
	.db $9c			  ; $a43f - Unknown opcode
	CMP ($9c),Y			  ; $a440: D1 9C   
	CMP $0a9e,X			  ; $a442: DD 9E 0A
	STA $9d03,X			  ; $a445: 9D 03 9D
	.db $14			  ; $a448 - Unknown opcode
	.db $9f			  ; $a449 - Unknown opcode
	.db $27			  ; $a44a - Unknown opcode
	.db $9f			  ; $a44b - Unknown opcode
	.db $64			  ; $a44c - Unknown opcode
	.db $9f			  ; $a44d - Unknown opcode
	.db $93			  ; $a44e - Unknown opcode
	.db $9f			  ; $a44f - Unknown opcode
	DEC $9f				  ; $a450: C6 9F   
	.db $42			  ; $a452 - Unknown opcode
	STA $9d15,X			  ; $a453: 9D 15 9D
	BCC $a3f5				; $a456: 90 9D   
	LDY $9d,X				; $a458: B4 9D   
	.db $32			  ; $a45a - Unknown opcode
	STA $9fed,X			  ; $a45b: 9D ED 9F
	SBC $ed9f				; $a45e: ED 9F ED ; Arithmetic
	.db $9f			  ; $a461 - Unknown opcode
	SBC $ed9f				; $a462: ED 9F ED ; Arithmetic
	.db $9f			  ; $a465 - Unknown opcode
	.db $1c			  ; $a466 - Unknown opcode
	STA $9d2b,X			  ; $a467: 9D 2B 9D
	AND $47a0				; $a46a: 2D A0 47
	LDY #$8e				 ; $a46d: A0 8E   
	LDY #$ad				 ; $a46f: A0 AD   
	.db $af			  ; $a471 - Unknown opcode
	.db $23			  ; $a472 - Unknown opcode
	LDX $ae23				; $a473: AE 23 AE
	.db $23			  ; $a476 - Unknown opcode
	LDX $ae23				; $a477: AE 23 AE
	.db $23			  ; $a47a - Unknown opcode
	LDX $ae23				; $a47b: AE 23 AE
	.db $23			  ; $a47e - Unknown opcode
	LDX $ae23				; $a47f: AE 23 AE
	.db $23			  ; $a482 - Unknown opcode
	LDX $ae23				; $a483: AE 23 AE
	LSR $5eae,X			  ; $a486: 5E AE 5E
	LDX $ae9d				; $a489: AE 9D AE
	BIT $ae				  ; $a48c: 24 AE   
	PLP					  ; $a48e: 28	  
	LDX $96db				; $a48f: AE DB 96
	.db $e2			  ; $a492 - Unknown opcode
	TYA					  ; $a493: 98	  
	.db $fa			  ; $a494 - Unknown opcode
	TYA					  ; $a495: 98	  
	EOR $99				  ; $a496: 45 99   
	.db $52			  ; $a498 - Unknown opcode
	STA $995f,Y			  ; $a499: 99 5F 99
	AND $ae,X				; $a49c: 35 AE   
	AND $ae,X				; $a49e: 35 AE   
	AND $ae,X				; $a4a0: 35 AE   
	.db $0c			  ; $a4a2 - Unknown opcode
	.db $9b			  ; $a4a3 - Unknown opcode
	.db $e2			  ; $a4a4 - Unknown opcode
	TXS					  ; $a4a5: 9A	  
	.db $e2			  ; $a4a6 - Unknown opcode
	TXS					  ; $a4a7: 9A	  
	.db $e2			  ; $a4a8 - Unknown opcode
	TXS					  ; $a4a9: 9A	  
	.db $e2			  ; $a4aa - Unknown opcode
	TXS					  ; $a4ab: 9A	  
	.db $e2			  ; $a4ac - Unknown opcode
	TXS					  ; $a4ad: 9A	  
	.db $e2			  ; $a4ae - Unknown opcode
	TXS					  ; $a4af: 9A	  
	.db $c3			  ; $a4b0 - Unknown opcode
	.db $9c			  ; $a4b1 - Unknown opcode
	NOP					  ; $a4b2: EA	  
	.db $af			  ; $a4b3 - Unknown opcode
	.db $f4			  ; $a4b4 - Unknown opcode
	.db $af			  ; $a4b5 - Unknown opcode
	LSR $55ae				; $a4b6: 4E AE 55
	LDX $ae65				; $a4b9: AE 65 AE
	PHP					  ; $a4bc: 08	  
	LDA ($14,X)			  ; $a4bd: A1 14   
	LDA ($fd,X)			  ; $a4bf: A1 FD   
	LDY #$3c				 ; $a4c1: A0 3C   
	LDA ($3c,X)			  ; $a4c3: A1 3C   
	LDA ($3c,X)			  ; $a4c5: A1 3C   
	LDA ($3c,X)			  ; $a4c7: A1 3C   
	LDA ($55,X)			  ; $a4c9: A1 55   
	LDA ($3c,X)			  ; $a4cb: A1 3C   
	LDA ($55,X)			  ; $a4cd: A1 55   
	LDA ($3c,X)			  ; $a4cf: A1 3C   
	LDA ($55,X)			  ; $a4d1: A1 55   
	LDA ($31,X)			  ; $a4d3: A1 31   
	LDA ($a2,X)			  ; $a4d5: A1 A2   
	LDX #$e2				 ; $a4d7: A2 E2   
	TXS					  ; $a4d9: 9A	  
	EOR $ae,X				; $a4da: 55 AE   
	PLP					  ; $a4dc: 28	  
	LDX #$28				 ; $a4dd: A2 28   
	LDX #$28				 ; $a4df: A2 28   
	LDX #$28				 ; $a4e1: A2 28   
	LDX #$e2				 ; $a4e3: A2 E2   
	TXS					  ; $a4e5: 9A	  
	JSR $bf9c				; $a4e6: 20 9C BF ; -> sub_BF9C
	LDX $9fed				; $a4e9: AE ED 9F
	CPX $b0				  ; $a4ec: E4 B0   
	STY $ae				  ; $a4ee: 84 AE   
	.db $c3			  ; $a4f0 - Unknown opcode
	.db $9c			  ; $a4f1 - Unknown opcode
	.db $e2			  ; $a4f2 - Unknown opcode
	TXS					  ; $a4f3: 9A	  
	.db $7c			  ; $a4f4 - Unknown opcode
	LDA (pos_y_hi),Y		 ; $a4f5: B1 ED   
	.db $9f			  ; $a4f7 - Unknown opcode
	LDY $4e9c,X			  ; $a4f8: BC 9C 4E
	LDX $ae35				; $a4fb: AE 35 AE
	.db $c3			  ; $a4fe - Unknown opcode
	.db $9c			  ; $a4ff - Unknown opcode
	.db $80			  ; $a500 - Unknown opcode
	LDA ($d0),Y			  ; $a501: B1 D0   
	LDA ($de),Y			  ; $a503: B1 DE   
	LDA (system_flags),Y	 ; $a505: B1 1F   
	.db $b2			  ; $a507 - Unknown opcode
	.db $34			  ; $a508 - Unknown opcode
	BCS $a4ed				; $a509: B0 E2   
	TXS					  ; $a50b: 9A	  
	.db $eb			  ; $a50c - Unknown opcode
	TXS					  ; $a50d: 9A	  
loc_A50E:
	.db $7c			  ; $a50e - Unknown opcode
	LDA ($e2),Y			  ; $a50f: B1 E2   
	TXS					  ; $a511: 9A	  
	.db $e2			  ; $a512 - Unknown opcode
	TXS					  ; $a513: 9A	  
	.db $c3			  ; $a514 - Unknown opcode
loc_A515:
	.db $9c			  ; $a515 - Unknown opcode
	.db $e2			  ; $a516 - Unknown opcode
	TXS					  ; $a517: 9A	  
	.db $e2			  ; $a518 - Unknown opcode
	TXS					  ; $a519: 9A	  
	LDY $e29c,X			  ; $a51a: BC 9C E2
	TXS					  ; $a51d: 9A	  
	.db $27			  ; $a51e - Unknown opcode
	.db $9f			  ; $a51f - Unknown opcode
	SBC $bf9f				; $a520: ED 9F BF ; Arithmetic
loc_A523:
	LDX $b0b3				; $a523: AE B3 B0
	.db $e2			  ; $a526 - Unknown opcode
	TXS					  ; $a527: 9A	  
	SBC $399f				; $a528: ED 9F 39 ; Arithmetic
	BCS $a530				; $a52b: B0 03   
	STA $9d0a,X			  ; $a52d: 9D 0A 9D
loc_A530:
	AND $b0				  ; $a530: 25 B0   
	SBC $e29f				; $a532: ED 9F E2 ; Arithmetic
	TXS					  ; $a535: 9A	  
	LDA $e4af				; $a536: AD AF E4
	BCS $a557				; $a539: B0 1C   
	STA $b055,X			  ; $a53b: 9D 55 B0
	.db $77			  ; $a53e - Unknown opcode
	BCS $a52e				; $a53f: B0 ED   
	.db $9f			  ; $a541 - Unknown opcode
loc_A542:
	.db $53			  ; $a542 - Unknown opcode
	.db $9b			  ; $a543 - Unknown opcode
	LDA $349c				; $a544: AD 9C 34
	BCS $a5a9				; $a547: B0 60   
	LDA $9fed,Y			  ; $a549: B9 ED 9F
	TSX					  ; $a54c: BA	  
	BCS $a50e				; $a54d: B0 BF   
	BCS $a515				; $a54f: B0 C4   
	BCS $a51c				; $a551: B0 C9   
	BCS $a523				; $a553: B0 CE   
	BCS $a542				; $a555: B0 EB   
loc_A557:
	BCS $a4fd				; $a557: B0 A4   
	BCS $a525				; $a559: B0 CA   
	.db $9c			  ; $a55b - Unknown opcode
	SBC $b1,X				; $a55c: F5 B1	; Arithmetic
	CMP ($9c),Y			  ; $a55e: D1 9C   
	.db $d7			  ; $a560 - Unknown opcode
	LDA ($23),Y			  ; $a561: B1 23   
	LDX $b034				; $a563: AE 34 B0
	.db $34			  ; $a566 - Unknown opcode
	BCS $a5a0				; $a567: B0 37   
	LDY $b6,X				; $a569: B4 B6   
	.db $b3			  ; $a56b - Unknown opcode
	.db $80			  ; $a56c - Unknown opcode
	.db $b3			  ; $a56d - Unknown opcode
	.db $92			  ; $a56e - Unknown opcode
	.db $b3			  ; $a56f - Unknown opcode
	.db $34			  ; $a570 - Unknown opcode
	BCS $a5f2				; $a571: B0 7F   
	LDY $34,X				; $a573: B4 34   
	BCS $a5ca				; $a575: B0 53   
	LDY $34,X				; $a577: B4 34   
	BCS $a59e				; $a579: B0 23   
	LDX $ae23				; $a57b: AE 23 AE
	.db $23			  ; $a57e - Unknown opcode
	LDX $b372				; $a57f: AE 72 B3
	CPX $b4				  ; $a582: E4 B4   
	.db $72			  ; $a584 - Unknown opcode
	.db $b3			  ; $a585 - Unknown opcode
	.db $9c			  ; $a586 - Unknown opcode
	.db $b3			  ; $a587 - Unknown opcode
	.db $72			  ; $a588 - Unknown opcode
	.db $b3			  ; $a589 - Unknown opcode
	.db $64			  ; $a58a - Unknown opcode
	.db $9f			  ; $a58b - Unknown opcode
	.db $23			  ; $a58c - Unknown opcode
	LDX $b4c6				; $a58d: AE C6 B4
	ADC $b3				  ; $a590: 65 B3	; Arithmetic
	.db $92			  ; $a592 - Unknown opcode
	.db $b3			  ; $a593 - Unknown opcode
	LDY $b3				  ; $a594: A4 B3   
	.db $d4			  ; $a596 - Unknown opcode
	.db $b3			  ; $a597 - Unknown opcode
	.db $72			  ; $a598 - Unknown opcode
	.db $b3			  ; $a599 - Unknown opcode
	.db $02			  ; $a59a - Unknown opcode
	LDY $72,X				; $a59b: B4 72   
	.db $b3			  ; $a59d - Unknown opcode
loc_A59E:
	.db $1c			  ; $a59e - Unknown opcode
	LDY $34,X				; $a59f: B4 34   
loc_A5A1:
	BCS $a5c6				; $a5a1: B0 23   
	LDX $ae23				; $a5a3: AE 23 AE
	DEC $34b3,X			  ; $a5a6: DE B3 34
loc_A5A9:
	BCS $a5df				; $a5a9: B0 34   
	BCS $a5a1				; $a5ab: B0 F4   
	.db $af			  ; $a5ad - Unknown opcode
	.db $34			  ; $a5ae - Unknown opcode
	BCS $a53c				; $a5af: B0 8B   
	LDX $9c20				; $a5b1: AE 20 9C
	EOR ($b6),Y			  ; $a5b4: 51 B6   
	SBC $599f				; $a5b6: ED 9F 59 ; Arithmetic
	LDX $66,Y				; $a5b9: B6 66   
	LDX $93,Y				; $a5bb: B6 93   
	LDX $db,Y				; $a5bd: B6 DB   
	LDX $72,Y				; $a5bf: B6 72   
	.db $b3			  ; $a5c1 - Unknown opcode
	LDA $00af				; $a5c2: AD AF 00
	.db $b7			  ; $a5c5 - Unknown opcode
loc_A5C6:
	.db $32			  ; $a5c6 - Unknown opcode
	STA $b705,X			  ; $a5c7: 9D 05 B7
loc_A5CA:
	AND $60b7,X			  ; $a5ca: 3D B7 60
	LDA $b79d,Y			  ; $a5cd: B9 9D B7
	LDX #$b7				 ; $a5d0: A2 B7   
	.db $64			  ; $a5d2 - Unknown opcode
	.db $9f			  ; $a5d3 - Unknown opcode
	DEX					  ; $a5d4: CA	  
	.db $9c			  ; $a5d5 - Unknown opcode
	DEC $9f				  ; $a5d6: C6 9F   
	.db $af			  ; $a5d8 - Unknown opcode
	.db $b7			  ; $a5d9 - Unknown opcode
	STX $a0,Y				; $a5da: 96 A0   
	.db $34			  ; $a5dc - Unknown opcode
	BCS $a644				; $a5dd: B0 65   
loc_A5DF:
	LDX $9fed				; $a5df: AE ED 9F
	SBC $d19f				; $a5e2: ED 9F D1 ; Arithmetic
	.db $9c			  ; $a5e5 - Unknown opcode
	CMP ($9c),Y			  ; $a5e6: D1 9C   
	.db $c3			  ; $a5e8 - Unknown opcode
	.db $9c			  ; $a5e9 - Unknown opcode
	.db $c3			  ; $a5ea - Unknown opcode
	.db $9c			  ; $a5eb - Unknown opcode
	.db $f2			  ; $a5ec - Unknown opcode
	LDX $f2,Y				; $a5ed: B6 F2   
	LDX $5e,Y				; $a5ef: B6 5E   
	LDX $ae5e				; $a5f1: AE 5E AE
	.db $db			  ; $a5f4 - Unknown opcode
	LDX $db,Y				; $a5f5: B6 DB   
	LDX $23,Y				; $a5f7: B6 23   
	LDX $9cbc				; $a5f9: AE BC 9C
	.db $53			  ; $a5fc - Unknown opcode
	.db $9b			  ; $a5fd - Unknown opcode
	.db $fc			  ; $a5fe - Unknown opcode
	LDA $be00,X			  ; $a5ff: BD 00 BE
	ORA ($9d),Y			  ; $a602: 11 9D   
	DEX					  ; $a604: CA	  
	.db $9c			  ; $a605 - Unknown opcode
	SBC $239f				; $a606: ED 9F 23 ; Arithmetic
	LDX $9c50				; $a609: AE 50 9C
	BVC $a5aa				; $a60c: 50 9C   
	BVC $a5ac				; $a60e: 50 9C   
	SED					  ; $a610: F8	  
	.db $b7			  ; $a611 - Unknown opcode
	SED					  ; $a612: F8	  
loc_A613:
	.db $b7			  ; $a613 - Unknown opcode
	SED					  ; $a614: F8	  
	.db $b7			  ; $a615 - Unknown opcode
	SED					  ; $a616: F8	  
	.db $b7			  ; $a617 - Unknown opcode
	SED					  ; $a618: F8	  
	.db $b7			  ; $a619 - Unknown opcode
	SED					  ; $a61a: F8	  
	.db $b7			  ; $a61b - Unknown opcode
	SED					  ; $a61c: F8	  
	.db $b7			  ; $a61d - Unknown opcode
	BRK					  ; $a61e: 00	  
	BRK					  ; $a61f: 00	  
	JSR tmp0				 ; $a620: 20 00 00
	BRK					  ; $a623: 00	  
	.db $04			  ; $a624 - Unknown opcode
	BRK					  ; $a625: 00	  
	BRK					  ; $a626: 00	  
	BRK					  ; $a627: 00	  
	BRK					  ; $a628: 00	  
	BRK					  ; $a629: 00	  
	BRK					  ; $a62a: 00	  
	JSR tmp0				 ; $a62b: 20 00 00
	BRK					  ; $a62e: 00	  
	BRK					  ; $a62f: 00	  
	BRK					  ; $a630: 00	  
	BRK					  ; $a631: 00	  
	BRK					  ; $a632: 00	  
	BRK					  ; $a633: 00	  
	BRK					  ; $a634: 00	  
	BRK					  ; $a635: 00	  
	BRK					  ; $a636: 00	  
	BRK					  ; $a637: 00	  
	BRK					  ; $a638: 00	  
	BRK					  ; $a639: 00	  
	BRK					  ; $a63a: 00	  
	TAX					  ; $a63b: AA	  
	ROL					  ; $a63c: 2A	  
	BRK					  ; $a63d: 00	  

; ---- Subroutine at $a63e (Bank 17) ----
sub_A63E:
	BRK					  ; $a63e: 00	  
	.db $07			  ; $a63f - Unknown opcode
	.db $1f			  ; $a640 - Unknown opcode
	BCC $a65e				; $a641: 90 1B   
	BRK					  ; $a643: 00	  
loc_A644:
	AND #$c3				 ; $a644: 29 C3   
	BRK					  ; $a646: 00	  
	BCS $a687				; $a647: B0 3E   
	BRK					  ; $a649: 00	  
	AND #$c3				 ; $a64a: 29 C3   
	ORA $38b0				; $a64c: 0D B0 38
	BRK					  ; $a64f: 00	  
	AND #$c3				 ; $a650: 29 C3   
	ORA ($b0,X)			  ; $a652: 01 B0   
	.db $32			  ; $a654 - Unknown opcode
	BRK					  ; $a655: 00	  
	BIT $a3				  ; $a656: 24 A3   
	ASL					  ; $a658: 0A	  
	ASL					  ; $a659: 0A	  
	TAY					  ; $a65a: A8	  
	JMP $a67e				; $a65b: 4C 7E A6
loc_A65E:
	BRK					  ; $a65e: 00	  
	LSR $93				  ; $a65f: 46 93   
	BPL $a613				; $a661: 10 B0   
	.db $23			  ; $a663 - Unknown opcode
	BRK					  ; $a664: 00	  
	LSR $93				  ; $a665: 46 93   
	ASL $b0				  ; $a667: 06 B0   
	ORA $4600,X			  ; $a669: 1D 00 46
	.db $93			  ; $a66c - Unknown opcode
	ORA ($b0),Y			  ; $a66d: 11 B0   
	.db $17			  ; $a66f - Unknown opcode
	BRK					  ; $a670: 00	  
	.db $3b			  ; $a671 - Unknown opcode
	.db $93			  ; $a672 - Unknown opcode
	ORA ($a0,X)			  ; $a673: 01 A0   
	.db $04			  ; $a675 - Unknown opcode
	BCC $a67e				; $a676: 90 06   
	CMP #$b3				 ; $a678: C9 B3	; Compare with 179
	BNE $a67e				; $a67a: D0 02   
	LDY #$2b				 ; $a67c: A0 2B   
loc_A67E:
	STY tmp0				 ; $a67e: 84 00   
	BRK					  ; $a680: 00	  
	.db $1b			  ; $a681 - Unknown opcode
	.db $0f			  ; $a682 - Unknown opcode
	CMP tmp0				 ; $a683: C5 00   
	BCC $a689				; $a685: 90 02   
loc_A687:
	SEC					  ; $a687: 38	  
	RTS					  ; $a688: 60	  
loc_A689:
	LDY #$8c				 ; $a689: A0 8C   
	BRK					  ; $a68b: 00	  
	ORA (system_flags,X)	 ; $a68c: 01 1F   
	BPL $a692				; $a68e: 10 02   
	LDY #$8d				 ; $a690: A0 8D   
loc_A692:
	TYA					  ; $a692: 98	  
	JSR $bf55				; $a693: 20 55 BF ; -> sub_BF55
	BRK					  ; $a696: 00	  
	CPX $d3				  ; $a697: E4 D3   
	.db $62			  ; $a699 - Unknown opcode
	JSR $938a				; $a69a: 20 8A 93 ; -> sub_938A
	CLC					  ; $a69d: 18	  
	RTS					  ; $a69e: 60	  

; ---- Subroutine at $a69f (Bank 17) ----
sub_A69F:
	JSR $a86d				; $a69f: 20 6D A8 ; -> sub_A86D
	BEQ $a6e1				; $a6a2: F0 3D   
	JSR $9848				; $a6a4: 20 48 98 ; -> sub_9848
	BCC $a6e1				; $a6a7: 90 38   
	CMP #$8f				 ; $a6a9: C9 8F	; Compare with 143
	BNE $a6e1				; $a6ab: D0 34   
	BRK					  ; $a6ad: 00	  
	.db $07			  ; $a6ae - Unknown opcode
	.db $1f			  ; $a6af - Unknown opcode
	BCC $a6d8				; $a6b0: 90 26   
	JSR $985a				; $a6b2: 20 5A 98 ; -> sub_985A
	BRK					  ; $a6b5: 00	  
	.db $1b			  ; $a6b6 - Unknown opcode
	.db $0f			  ; $a6b7 - Unknown opcode
	AND #$07				 ; $a6b8: 29 07   
	BNE $a6d8				; $a6ba: D0 1C   
	LDA $6e44				; $a6bc: AD 44 6E
	BMI $a6d8				; $a6bf: 30 17   
	JSR $bf2e				; $a6c1: 20 2E BF ; -> sub_BF2E
	STA $7000,Y			  ; $a6c4: 99 00 70
	.db $d3			  ; $a6c7 - Unknown opcode
	.db $4f			  ; $a6c8 - Unknown opcode
	BRK					  ; $a6c9: 00	  
	.db $07			  ; $a6ca - Unknown opcode
	.db $1f			  ; $a6cb - Unknown opcode
	JSR $91f3				; $a6cc: 20 F3 91 ; -> sub_91F3
	BRK					  ; $a6cf: 00	  
	.db $07			  ; $a6d0 - Unknown opcode
	.db $2f			  ; $a6d1 - Unknown opcode
	BRK					  ; $a6d2: 00	  
	ADC $67d3				; $a6d3: 6D D3 67 ; Arithmetic
	SEC					  ; $a6d6: 38	  
	RTS					  ; $a6d7: 60	  
loc_A6D8:
	LDX #$01				 ; $a6d8: A2 01   
	STX $7361				; $a6da: 8E 61 73
	DEX					  ; $a6dd: CA	  
	STX $7362				; $a6de: 8E 62 73
loc_A6E1:
	CLC					  ; $a6e1: 18	  
	RTS					  ; $a6e2: 60	  

; ---- Subroutine at $a6e3 (Bank 17) ----
sub_A6E3:
	JSR $a86d				; $a6e3: 20 6D A8 ; -> sub_A86D
	BEQ $a700				; $a6e6: F0 18   
	JSR $9848				; $a6e8: 20 48 98 ; -> sub_9848
	BCC $a700				; $a6eb: 90 13   
	CMP #$92				 ; $a6ed: C9 92	; Compare with 146
	BEQ $a702				; $a6ef: F0 11   
	CMP #$95				 ; $a6f1: C9 95	; Compare with 149
	BEQ $a727				; $a6f3: F0 32   
	CMP #$90				 ; $a6f5: C9 90	; Compare with 144
	BEQ $a74b				; $a6f7: F0 52   
	CMP #$8e				 ; $a6f9: C9 8E	; Compare with 142
	BNE $a700				; $a6fb: D0 03   
	JMP $a767				; $a6fd: 4C 67 A7
loc_A700:
	CLC					  ; $a700: 18	  
	RTS					  ; $a701: 60	  
loc_A702:
	BRK					  ; $a702: 00	  
	.db $1b			  ; $a703 - Unknown opcode
	.db $0f			  ; $a704 - Unknown opcode
	CMP #$aa				 ; $a705: C9 AA	; Compare with 170
	BCS $a714				; $a707: B0 0B   
	LDA #$00				 ; $a709: A9 00   
	STA $7361				; $a70b: 8D 61 73
	STA $7362				; $a70e: 8D 62 73
	JSR $985a				; $a711: 20 5A 98 ; -> sub_985A
loc_A714:
	RTS					  ; $a714: 60	  
	BRK					  ; $a715: 00	  
	.db $07			  ; $a716 - Unknown opcode
	.db $1f			  ; $a717 - Unknown opcode
	BCC $a725				; $a718: 90 0B   
	BRK					  ; $a71a: 00	  
	.db $22			  ; $a71b - Unknown opcode
	.db $c3			  ; $a71c - Unknown opcode
	.db $0f			  ; $a71d - Unknown opcode
	CMP #$03				 ; $a71e: C9 03	; Compare with 3
	BEQ $a725				; $a720: F0 03   
loc_A722:
	JSR $981e				; $a722: 20 1E 98 ; -> sub_981E
loc_A725:
	CLC					  ; $a725: 18	  
	RTS					  ; $a726: 60	  
loc_A727:
	BRK					  ; $a727: 00	  
	.db $07			  ; $a728 - Unknown opcode
	.db $1f			  ; $a729 - Unknown opcode
	BCC $a73d				; $a72a: 90 11   
	BRK					  ; $a72c: 00	  
	AND $aaa3				; $a72d: 2D A3 AA
	LDA $6e45,X			  ; $a730: BD 45 6E
	LDX #$07				 ; $a733: A2 07   
loc_A735:
	CMP $a73f,X			  ; $a735: DD 3F A7
	BEQ $a722				; $a738: F0 E8   
	DEX					  ; $a73a: CA	  
	BPL $a735				; $a73b: 10 F8   
loc_A73D:
	CLC					  ; $a73d: 18	  
	RTS					  ; $a73e: 60	  
	RTI					  ; $a73f: 40	  
	.db $6f			  ; $a740 - Unknown opcode
	STY $9e93				; $a741: 8C 93 9E
	.db $a3			  ; $a744 - Unknown opcode
	LDA ($b8,X)			  ; $a745: A1 B8   
	JSR $141d				; $a747: 20 1D 14
	BPL $a74c				; $a74a: 10 00   
loc_A74C:
	ASL system_flags		 ; $a74c: 06 1F   
	BCS $a75d				; $a74e: B0 0D   
	LDA #$03				 ; $a750: A9 03   
	BRK					  ; $a752: 00	  
	.db $0c			  ; $a753 - Unknown opcode
	.db $73			  ; $a754 - Unknown opcode
	BCS $a75f				; $a755: B0 08   
	LSR $7362				; $a757: 4E 62 73
	ROR $7361				; $a75a: 6E 61 73
loc_A75D:
	CLC					  ; $a75d: 18	  
	RTS					  ; $a75e: 60	  
loc_A75F:
	BRK					  ; $a75f: 00	  
	.db $0b			  ; $a760 - Unknown opcode
	.db $33			  ; $a761 - Unknown opcode
	JSR $a3f7				; $a762: 20 F7 A3 ; -> sub_A3F7
	CLC					  ; $a765: 18	  
	RTS					  ; $a766: 60	  
loc_A767:
	BRK					  ; $a767: 00	  
	.db $07			  ; $a768 - Unknown opcode
	.db $1f			  ; $a769 - Unknown opcode
	BCC $a789				; $a76a: 90 1D   
	BRK					  ; $a76c: 00	  
	AND $aaa3				; $a76d: 2D A3 AA
	LDA $6e45,X			  ; $a770: BD 45 6E
	CMP #$75				 ; $a773: C9 75	; Compare with 117
	BEQ $a77f				; $a775: F0 08   
	CMP #$5c				 ; $a777: C9 5C	; Compare with 92
	BEQ $a77f				; $a779: F0 04   
	CMP #$a8				 ; $a77b: C9 A8	; Compare with 168
	BNE $a789				; $a77d: D0 0A   
loc_A77F:
	LDA #$02				 ; $a77f: A9 02   
	STA $7361				; $a781: 8D 61 73
	LDA #$00				 ; $a784: A9 00   
	STA $7362				; $a786: 8D 62 73
loc_A789:
	CLC					  ; $a789: 18	  
	RTS					  ; $a78a: 60	  

; ---- Subroutine at $a78b (Bank 17) ----
sub_A78B:
	BRK					  ; $a78b: 00	  
	ASL system_flags		 ; $a78c: 06 1F   
	BCS $a7aa				; $a78e: B0 1A   
	JSR $a86d				; $a790: 20 6D A8 ; -> sub_A86D
	BEQ $a7aa				; $a793: F0 15   
	JSR $9848				; $a795: 20 48 98 ; -> sub_9848
	BCC $a7aa				; $a798: 90 10   
	CMP #$a0				 ; $a79a: C9 A0	; Compare with 160
	BNE $a7aa				; $a79c: D0 0C   
	BRK					  ; $a79e: 00	  
	.db $07			  ; $a79f - Unknown opcode
	.db $1f			  ; $a7a0 - Unknown opcode
	JSR $a7ab				; $a7a1: 20 AB A7 ; -> sub_A7AB
	BRK					  ; $a7a4: 00	  
	SBC $d3				  ; $a7a5: E5 D3	; Arithmetic
	.db $6b			  ; $a7a7 - Unknown opcode
	PLA					  ; $a7a8: 68	  
	PLA					  ; $a7a9: 68	  
loc_A7AA:
	RTS					  ; $a7aa: 60	  

; ---- Subroutine at $a7ab (Bank 17) ----
sub_A7AB:
	LDA $7362				; $a7ab: AD 62 73
	BCC $a7bb				; $a7ae: 90 0B   
	STA $7d				  ; $a7b0: 85 7D   
	LDA $7361				; $a7b2: AD 61 73
	BRK					  ; $a7b5: 00	  
	.db $02			  ; $a7b6 - Unknown opcode
	.db $b3			  ; $a7b7 - Unknown opcode
	JMP $a7c3				; $a7b8: 4C C3 A7
loc_A7BB:
	STA $70				  ; $a7bb: 85 70   
	LDA $7361				; $a7bd: AD 61 73
	BRK					  ; $a7c0: 00	  
	.db $02			  ; $a7c1 - Unknown opcode
	.db $73			  ; $a7c2 - Unknown opcode
loc_A7C3:
	RTS					  ; $a7c3: 60	  

; ---- Subroutine at $a7c4 (Bank 17) ----
sub_A7C4:
	LDA $72e7				; $a7c4: AD E7 72
	LSR					  ; $a7c7: 4A	  
	BCS $a7ef				; $a7c8: B0 25   
	BRK					  ; $a7ca: 00	  
	ASL system_flags		 ; $a7cb: 06 1F   
	BCS $a7ef				; $a7cd: B0 20   
	JSR $a86d				; $a7cf: 20 6D A8 ; -> sub_A86D
	JSR $9848				; $a7d2: 20 48 98 ; -> sub_9848
	BCC $a7ef				; $a7d5: 90 18   
	CMP #$93				 ; $a7d7: C9 93	; Compare with 147
	BEQ $a7f0				; $a7d9: F0 15   
	CMP #$9d				 ; $a7db: C9 9D	; Compare with 157
	BEQ $a829				; $a7dd: F0 4A   
	CMP #$98				 ; $a7df: C9 98	; Compare with 152
	BEQ $a817				; $a7e1: F0 34   
	CMP #$99				 ; $a7e3: C9 99	; Compare with 153
	BEQ $a83b				; $a7e5: F0 54   
	CMP #$9c				 ; $a7e7: C9 9C	; Compare with 156
	BEQ $a855				; $a7e9: F0 6A   
	CMP #$a2				 ; $a7eb: C9 A2	; Compare with 162
	BEQ $a868				; $a7ed: F0 79   
loc_A7EF:
	RTS					  ; $a7ef: 60	  
loc_A7F0:
	JSR $9863				; $a7f0: 20 63 98 ; -> sub_9863
	LDA $7363				; $a7f3: AD 63 73
	PHA					  ; $a7f6: 48	  
	BRK					  ; $a7f7: 00	  
	ASL system_flags		 ; $a7f8: 06 1F   
	BCC $a803				; $a7fa: 90 07   
	BRK					  ; $a7fc: 00	  
	AND #$c3				 ; $a7fd: 29 C3   
	ASL $074c				; $a7ff: 0E 4C 07
	TAY					  ; $a802: A8	  
loc_A803:
	BRK					  ; $a803: 00	  
	LSR $93				  ; $a804: 46 93   
	.db $07			  ; $a806 - Unknown opcode
	BCC $a812				; $a807: 90 09   
	BRK					  ; $a809: 00	  
	ORA (system_flags,X)	 ; $a80a: 01 1F   
	STA $7363				; $a80c: 8D 63 73
	JSR $90db				; $a80f: 20 DB 90 ; -> sub_90DB
loc_A812:
	PLA					  ; $a812: 68	  
	STA $7363				; $a813: 8D 63 73
	RTS					  ; $a816: 60	  
loc_A817:
	LDA #$60				 ; $a817: A9 60   
	JSR $996d				; $a819: 20 6D 99 ; -> sub_996D
	BCC $a7ef				; $a81c: 90 D1   
	LDA #$53				 ; $a81e: A9 53   
	BRK					  ; $a820: 00	  
	ASL					  ; $a821: 0A	  
	.db $1f			  ; $a822 - Unknown opcode
	JSR $9cc3				; $a823: 20 C3 9C ; -> sub_9CC3
	JMP $a84f				; $a826: 4C 4F A8
loc_A829:
	LDA #$20				 ; $a829: A9 20   
	JSR $996d				; $a82b: 20 6D 99 ; -> sub_996D
	BCC $a7ef				; $a82e: 90 BF   
	LDA #$1c				 ; $a830: A9 1C   
	BRK					  ; $a832: 00	  
	ASL					  ; $a833: 0A	  
	.db $1f			  ; $a834 - Unknown opcode
	JSR $9edd				; $a835: 20 DD 9E ; -> sub_9EDD
	JMP $a84f				; $a838: 4C 4F A8
loc_A83B:
	LDA #$20				 ; $a83b: A9 20   
	JSR $996d				; $a83d: 20 6D 99 ; -> sub_996D
	BCC $a7ef				; $a840: 90 AD   
	LDA $6e44				; $a842: AD 44 6E
	BMI $a7ef				; $a845: 30 A8   
	LDA #$55				 ; $a847: A9 55   
	BRK					  ; $a849: 00	  
	ASL					  ; $a84a: 0A	  
	.db $1f			  ; $a84b - Unknown opcode
	JSR $aff4				; $a84c: 20 F4 AF ; -> sub_AFF4
loc_A84F:
	LDA #$43				 ; $a84f: A9 43   
	BRK					  ; $a851: 00	  
	ASL					  ; $a852: 0A	  
	.db $1f			  ; $a853 - Unknown opcode
	RTS					  ; $a854: 60	  
loc_A855:
	JSR $9863				; $a855: 20 63 98 ; -> sub_9863
	BRK					  ; $a858: 00	  
	ASL system_flags		 ; $a859: 06 1F   
	JSR $a7ab				; $a85b: 20 AB A7 ; -> sub_A7AB
	BRK					  ; $a85e: 00	  
	ASL system_flags		 ; $a85f: 06 1F   
	STA $f9				  ; $a861: 85 F9   
	BRK					  ; $a863: 00	  
	CMP $d3				  ; $a864: C5 D3   
	.db $6b			  ; $a866 - Unknown opcode
	RTS					  ; $a867: 60	  
loc_A868:
	BRK					  ; $a868: 00	  
	SBC #$d3				 ; $a869: E9 D3	; Arithmetic
	.db $e7			  ; $a86b - Unknown opcode
	RTS					  ; $a86c: 60	  

; ---- Subroutine at $a86d (Bank 17) ----
sub_A86D:
	BRK					  ; $a86d: 00	  
	.db $03			  ; $a86e - Unknown opcode
	.db $1f			  ; $a86f - Unknown opcode
	CMP #$82				 ; $a870: C9 82	; Compare with 130
	RTS					  ; $a872: 60	  

; ---- Subroutine at $a873 (Bank 17) ----
sub_A873:
	BRK					  ; $a873: 00	  
	.db $07			  ; $a874 - Unknown opcode
	.db $1f			  ; $a875 - Unknown opcode
	BCS $a886				; $a876: B0 0E   
	BRK					  ; $a878: 00	  
	.db $3b			  ; $a879 - Unknown opcode
	.db $93			  ; $a87a - Unknown opcode
	ORA ($90,X)			  ; $a87b: 01 90   
	PHP					  ; $a87d: 08	  
	CMP #$b6				 ; $a87e: C9 B6	; Compare with 182
	BEQ $a887				; $a880: F0 05   
	CMP #$b8				 ; $a882: C9 B8	; Compare with 184
	BEQ $a8a7				; $a884: F0 21   
loc_A886:
	RTS					  ; $a886: 60	  
loc_A887:
	BRK					  ; $a887: 00	  
	.db $03			  ; $a888 - Unknown opcode
	.db $1f			  ; $a889 - Unknown opcode
	BRK					  ; $a88a: 00	  
	ASL					  ; $a88b: 0A	  
	.db $3f			  ; $a88c - Unknown opcode
	BCC $a8a6				; $a88d: 90 17   
loc_A88F:
	STA $6f				  ; $a88f: 85 6F   
	BRK					  ; $a891: 00	  
	.db $1b			  ; $a892 - Unknown opcode
	.db $0f			  ; $a893 - Unknown opcode
	CMP #$20				 ; $a894: C9 20	; Compare with 32
	BCS $a8a6				; $a896: B0 0E   
	BRK					  ; $a898: 00	  
	.db $07			  ; $a899 - Unknown opcode
	.db $1f			  ; $a89a - Unknown opcode
	BRK					  ; $a89b: 00	  
	ORA #$53				 ; $a89c: 09 53   
	ORA $73				  ; $a89e: 05 73   
	BEQ $a8a6				; $a8a0: F0 04   
	BRK					  ; $a8a2: 00	  
	SBC #$d3				 ; $a8a3: E9 D3	; Arithmetic
	.db $83			  ; $a8a5 - Unknown opcode
loc_A8A6:
	RTS					  ; $a8a6: 60	  
loc_A8A7:
	BRK					  ; $a8a7: 00	  
	.db $03			  ; $a8a8 - Unknown opcode
	.db $1f			  ; $a8a9 - Unknown opcode
	CMP #$43				 ; $a8aa: C9 43	; Compare with 67
	BCC $a8a6				; $a8ac: 90 F8   
	CMP #$49				 ; $a8ae: C9 49	; Compare with 73
	BCS $a8a6				; $a8b0: B0 F4   
	BRK					  ; $a8b2: 00	  
	.db $1b			  ; $a8b3 - Unknown opcode
	.db $0f			  ; $a8b4 - Unknown opcode
	CMP #$80				 ; $a8b5: C9 80	; Compare with 128
	BCS $a8a6				; $a8b7: B0 ED   
	JMP $a7f0				; $a8b9: 4C F0 A7

; ---- Subroutine at $a8bc (Bank 17) ----
sub_A8BC:
	BRK					  ; $a8bc: 00	  
	.db $07			  ; $a8bd - Unknown opcode
	.db $1f			  ; $a8be - Unknown opcode
	BCS $a8a6				; $a8bf: B0 E5   
	BRK					  ; $a8c1: 00	  
	.db $3b			  ; $a8c2 - Unknown opcode
	.db $93			  ; $a8c3 - Unknown opcode
	.db $02			  ; $a8c4 - Unknown opcode
	BCC $a8a6				; $a8c5: 90 DF   
	CMP #$c1				 ; $a8c7: C9 C1	; Compare with 193
	BNE $a8a6				; $a8c9: D0 DB   
	BRK					  ; $a8cb: 00	  
	.db $03			  ; $a8cc - Unknown opcode
	.db $1f			  ; $a8cd - Unknown opcode
	CMP #$13				 ; $a8ce: C9 13	; Compare with 19
	BCS $a8a6				; $a8d0: B0 D4   
	JMP $a7f0				; $a8d2: 4C F0 A7

; ---- Subroutine at $a8d5 (Bank 17) ----
sub_A8D5:
	BRK					  ; $a8d5: 00	  
	.db $07			  ; $a8d6 - Unknown opcode
	.db $1f			  ; $a8d7 - Unknown opcode
	BCS $a8eb				; $a8d8: B0 11   
	BRK					  ; $a8da: 00	  
	LSR $93				  ; $a8db: 46 93   
	BPL $a88f				; $a8dd: 10 B0   
	ASL tmp0				 ; $a8df: 06 00   
	LSR $93				  ; $a8e1: 46 93   
	ASL $90				  ; $a8e3: 06 90   
	ORA $a9				  ; $a8e5: 05 A9   
	.db $80			  ; $a8e7 - Unknown opcode
	BRK					  ; $a8e8: 00	  
	PHP					  ; $a8e9: 08	  
	.db $3f			  ; $a8ea - Unknown opcode
loc_A8EB:
	RTS					  ; $a8eb: 60	  

; ---- Subroutine at $a8ec (Bank 17) ----
sub_A8EC:
	LDX #$0b				 ; $a8ec: A2 0B   
loc_A8EE:
	LDA $72f4,X			  ; $a8ee: BD F4 72
	AND #$70				 ; $a8f1: 29 70   
	BNE $a8fd				; $a8f3: D0 08   
	LDA $72f4,X			  ; $a8f5: BD F4 72
	BPL $a904				; $a8f8: 10 0A   
	JSR $a97a				; $a8fa: 20 7A A9 ; -> sub_A97A
loc_A8FD:
	JSR $a9f0				; $a8fd: 20 F0 A9 ; -> sub_A9F0
	DEX					  ; $a900: CA	  
	BPL $a8ee				; $a901: 10 EB   
	RTS					  ; $a903: 60	  
loc_A904:
	LDA $7300,X			  ; $a904: BD 00 73
	AND #$70				 ; $a907: 29 70   
	BNE $a911				; $a909: D0 06   
	JSR $a914				; $a90b: 20 14 A9 ; -> sub_A914
	JSR $a950				; $a90e: 20 50 A9 ; -> sub_A950
loc_A911:
	JMP $a8fd				; $a911: 4C FD A8

; ---- Subroutine at $a914 (Bank 17) ----
sub_A914:
	LDA $7324,X			  ; $a914: BD 24 73
	CMP #$26				 ; $a917: C9 26	; Compare with 38
	BNE $a94f				; $a919: D0 34   
	STX tmp2				 ; $a91b: 86 02   
	LDX #$0b				 ; $a91d: A2 0B   
loc_A91F:
	LDA $7348,X			  ; $a91f: BD 48 73
	AND #$0f				 ; $a922: 29 0F   
	BEQ $a929				; $a924: F0 03   
	DEX					  ; $a926: CA	  
	BPL $a91f				; $a927: 10 F6   
loc_A929:
	LDY tmp2				 ; $a929: A4 02   
	LDA $7348,Y			  ; $a92b: B9 48 73
	AND #$0f				 ; $a92e: 29 0F   
	STA tmp1				 ; $a930: 85 01   
	LDA $7348,Y			  ; $a932: B9 48 73
	AND #$f0				 ; $a935: 29 F0   
	STA tmp0				 ; $a937: 85 00   
	LDA $7348,X			  ; $a939: BD 48 73
	AND #$0f				 ; $a93c: 29 0F   
	ORA tmp0				 ; $a93e: 05 00   
	STA $7348,Y			  ; $a940: 99 48 73
	LDA $7348,X			  ; $a943: BD 48 73
	AND #$f0				 ; $a946: 29 F0   
	ORA tmp1				 ; $a948: 05 01   
	STA $7348,X			  ; $a94a: 9D 48 73
	LDX tmp2				 ; $a94d: A6 02   
loc_A94F:
	RTS					  ; $a94f: 60	  

; ---- Subroutine at $a950 (Bank 17) ----
sub_A950:
	LDA $7324,X			  ; $a950: BD 24 73
	CMP #$12				 ; $a953: C9 12	; Compare with 18
	BNE $a979				; $a955: D0 22   
	STX tmp0				 ; $a957: 86 00   
	LDX #$0b				 ; $a959: A2 0B   
loc_A95B:
	LDA $72f4,X			  ; $a95b: BD F4 72
	BMI $a974				; $a95e: 30 14   
	AND #$70				 ; $a960: 29 70   
	CMP #$70				 ; $a962: C9 70	; Compare with 112
	BEQ $a974				; $a964: F0 0E   
	CPX tmp0				 ; $a966: E4 00   
	BEQ $a974				; $a968: F0 0A   
	LDA $72f4,X			  ; $a96a: BD F4 72
	AND #$8f				 ; $a96d: 29 8F   
	ORA #$20				 ; $a96f: 09 20   
	STA $72f4,X			  ; $a971: 9D F4 72
loc_A974:
	DEX					  ; $a974: CA	  
	BPL $a95b				; $a975: 10 E4   
	LDX tmp0				 ; $a977: A6 00   
loc_A979:
	RTS					  ; $a979: 60	  

; ---- Subroutine at $a97a (Bank 17) ----
sub_A97A:
	LDA $7324,X			  ; $a97a: BD 24 73
	CMP #$66				 ; $a97d: C9 66	; Compare with 102
	BCC $a9e7				; $a97f: 90 66   
	CMP #$69				 ; $a981: C9 69	; Compare with 105
	BCS $a9e7				; $a983: B0 62   
	TXA					  ; $a985: 8A	  
	PHA					  ; $a986: 48	  
	LDA $72f4,X			  ; $a987: BD F4 72
	AND #$07				 ; $a98a: 29 07   
	STA tmp0				 ; $a98c: 85 00   
	TAX					  ; $a98e: AA	  
	BRK					  ; $a98f: 00	  
	AND $a2b3				; $a990: 2D B3 A2
	.db $ff			  ; $a993 - Unknown opcode
	BRK					  ; $a994: 00	  
	AND $a6b3				; $a995: 2D B3 A6
	BRK					  ; $a998: 00	  
	BRK					  ; $a999: 00	  
	AND #$0f				 ; $a99a: 29 0F   
	EOR #$ff				 ; $a99c: 49 FF   
	AND $7e				  ; $a99e: 25 7E   
	BEQ $a9e8				; $a9a0: F0 46   
	STA tmp0				 ; $a9a2: 85 00   
	BRK					  ; $a9a4: 00	  
	AND #$c3				 ; $a9a5: 29 C3   
	ASL $0025				; $a9a7: 0E 25 00
	BEQ $a9e8				; $a9aa: F0 3C   
	STA tmp0				 ; $a9ac: 85 00   
	BRK					  ; $a9ae: 00	  
	AND #$c3				 ; $a9af: 29 C3   
	ORA $0025				; $a9b1: 0D 25 00
	BEQ $a9e8				; $a9b4: F0 32   
	STA tmp0				 ; $a9b6: 85 00   
	BRK					  ; $a9b8: 00	  
	AND #$c3				 ; $a9b9: 29 C3   
	BRK					  ; $a9bb: 00	  
	AND tmp0				 ; $a9bc: 25 00   
	BEQ $a9e8				; $a9be: F0 28   
	STA tmp0				 ; $a9c0: 85 00   
	BRK					  ; $a9c2: 00	  
	AND #$c3				 ; $a9c3: 29 C3   
	ORA ($25),Y			  ; $a9c5: 11 25   
	BRK					  ; $a9c7: 00	  
	BEQ $a9e8				; $a9c8: F0 1E   
	STA tmp0				 ; $a9ca: 85 00   
	LDX #$07				 ; $a9cc: A2 07   
loc_A9CE:
	TXA					  ; $a9ce: 8A	  
	PHA					  ; $a9cf: 48	  
	ASL tmp0				 ; $a9d0: 06 00   
	BCC $a9e0				; $a9d2: 90 0C   
	ORA #$80				 ; $a9d4: 09 80   
	BRK					  ; $a9d6: 00	  
	ORA #$1f				 ; $a9d7: 09 1F   
	BCC $a9e0				; $a9d9: 90 05   
	LDA #$02				 ; $a9db: A9 02   
	BRK					  ; $a9dd: 00	  
	PHP					  ; $a9de: 08	  
	.db $1f			  ; $a9df - Unknown opcode
loc_A9E0:
	PLA					  ; $a9e0: 68	  
	TAX					  ; $a9e1: AA	  
	DEX					  ; $a9e2: CA	  
	BPL $a9ce				; $a9e3: 10 E9   
	PLA					  ; $a9e5: 68	  
	TAX					  ; $a9e6: AA	  
loc_A9E7:
	RTS					  ; $a9e7: 60	  
loc_A9E8:
	PLA					  ; $a9e8: 68	  
	TAX					  ; $a9e9: AA	  
	LDA #$f7				 ; $a9ea: A9 F7   
	STA $7324,X			  ; $a9ec: 9D 24 73
	RTS					  ; $a9ef: 60	  

; ---- Subroutine at $a9f0 (Bank 17) ----
sub_A9F0:
	TXA					  ; $a9f0: 8A	  
	PHA					  ; $a9f1: 48	  
	LDA $7300,X			  ; $a9f2: BD 00 73
	AND #$70				 ; $a9f5: 29 70   
	BNE $aa04				; $a9f7: D0 0B   
	LDA $7324,X			  ; $a9f9: BD 24 73
	CMP #$41				 ; $a9fc: C9 41	; Compare with 65
	BEQ $aa07				; $a9fe: F0 07   
	CMP #$42				 ; $aa00: C9 42	; Compare with 66
	BEQ $aa0b				; $aa02: F0 07   
loc_AA04:
	PLA					  ; $aa04: 68	  
	TAX					  ; $aa05: AA	  
	RTS					  ; $aa06: 60	  
loc_AA07:
	LDA #$00				 ; $aa07: A9 00   
	BEQ $aa0d				; $aa09: F0 02   
loc_AA0B:
	LDA #$01				 ; $aa0b: A9 01   
loc_AA0D:
	STA $70				  ; $aa0d: 85 70   
	STA $7d				  ; $aa0f: 85 7D   
	LDA #$19				 ; $aa11: A9 19   
	LDX #$09				 ; $aa13: A2 09   
	STA $6f				  ; $aa15: 85 6F   
	STX $7c				  ; $aa17: 86 7C   
	PLA					  ; $aa19: 68	  
	TAX					  ; $aa1a: AA	  
	PHA					  ; $aa1b: 48	  
	LDA $72f4,X			  ; $aa1c: BD F4 72
	BPL $aa31				; $aa1f: 10 10   
	AND #$07				 ; $aa21: 29 07   
	TAX					  ; $aa23: AA	  
	LDA $6e44				; $aa24: AD 44 6E
	AND #$02				 ; $aa27: 29 02   
	BNE $aa2e				; $aa29: D0 03   
	BRK					  ; $aa2b: 00	  
	ROL					  ; $aa2c: 2A	  
	.db $a3			  ; $aa2d - Unknown opcode
loc_AA2E:
	PLA					  ; $aa2e: 68	  
	TAX					  ; $aa2f: AA	  
	RTS					  ; $aa30: 60	  
loc_AA31:
	STA tmp0				 ; $aa31: 85 00   
	LDA $6f				  ; $aa33: A5 6F   
	PHA					  ; $aa35: 48	  
	LDA tmp0				 ; $aa36: A5 00   
	BRK					  ; $aa38: 00	  
	.db $67			  ; $aa39 - Unknown opcode
	.db $73			  ; $aa3a - Unknown opcode
	TAX					  ; $aa3b: AA	  
	PLA					  ; $aa3c: 68	  
	STA $6f				  ; $aa3d: 85 6F   
	LDA $6e44				; $aa3f: AD 44 6E
	AND #$01				 ; $aa42: 29 01   
	BNE $aa49				; $aa44: D0 03   
	BRK					  ; $aa46: 00	  
	.db $44			  ; $aa47 - Unknown opcode
	.db $53			  ; $aa48 - Unknown opcode
loc_AA49:
	PLA					  ; $aa49: 68	  
	TAX					  ; $aa4a: AA	  
	RTS					  ; $aa4b: 60	  

; ---- Subroutine at $aa4c (Bank 17) ----
sub_AA4C:
	INC $6e81				; $aa4c: EE 81 6E
	JSR $aa62				; $aa4f: 20 62 AA ; -> sub_AA62
	JSR $aa8c				; $aa52: 20 8C AA ; -> sub_AA8C
	JSR $aa95				; $aa55: 20 95 AA ; -> sub_AA95
	JSR $aab1				; $aa58: 20 B1 AA ; -> sub_AAB1
	JSR $aaee				; $aa5b: 20 EE AA ; -> sub_AAEE
	JSR $aae0				; $aa5e: 20 E0 AA ; -> sub_AAE0
	RTS					  ; $aa61: 60	  

; ---- Subroutine at $aa62 (Bank 17) ----
sub_AA62:
	LDY #$00				 ; $aa62: A0 00   
loc_AA64:
	LDA $72f4,Y			  ; $aa64: B9 F4 72
	AND #$70				 ; $aa67: 29 70   
	CMP #$70				 ; $aa69: C9 70	; Compare with 112
	BEQ $aa86				; $aa6b: F0 19   
	LDA $72f4,Y			  ; $aa6d: B9 F4 72
	BPL $aa7c				; $aa70: 10 0A   
	AND #$07				 ; $aa72: 29 07   
	TAX					  ; $aa74: AA	  
	BRK					  ; $aa75: 00	  
	.db $2b			  ; $aa76 - Unknown opcode
	.db $c3			  ; $aa77 - Unknown opcode
	ORA #$4c				 ; $aa78: 09 4C   
	STX $aa				  ; $aa7a: 86 AA   
loc_AA7C:
	AND #$0f				 ; $aa7c: 29 0F   
	BRK					  ; $aa7e: 00	  
	.db $67			  ; $aa7f - Unknown opcode
	.db $73			  ; $aa80 - Unknown opcode
	TAX					  ; $aa81: AA	  
	BRK					  ; $aa82: 00	  
	EOR $93				  ; $aa83: 45 93   
	ORA $c0c8,Y			  ; $aa85: 19 C8 C0
	.db $0c			  ; $aa88 - Unknown opcode
	BNE $aa64				; $aa89: D0 D9   
	RTS					  ; $aa8b: 60	  

; ---- Subroutine at $aa8c (Bank 17) ----
sub_AA8C:
	LDA $6e44				; $aa8c: AD 44 6E
	AND #$fc				 ; $aa8f: 29 FC   
	STA $6e44				; $aa91: 8D 44 6E
	RTS					  ; $aa94: 60	  

; ---- Subroutine at $aa95 (Bank 17) ----
sub_AA95:
	LDA $72e5				; $aa95: AD E5 72
	BPL $aab0				; $aa98: 10 16   
	LDA $72e6				; $aa9a: AD E6 72
	AND #$c0				 ; $aa9d: 29 C0   
	BNE $aab0				; $aa9f: D0 0F   
	LDA $72e5				; $aaa1: AD E5 72
	AND #$7f				 ; $aaa4: 29 7F   
	STA $72e5				; $aaa6: 8D E5 72
	BRK					  ; $aaa9: 00	  
	SBC ($d3,X)			  ; $aaaa: E1 D3	; Arithmetic
	.db $89			  ; $aaac - Unknown opcode
	BRK					  ; $aaad: 00	  
	ORA $60fb				; $aaae: 0D FB 60

; ---- Subroutine at $aab1 (Bank 17) ----
sub_AAB1:
	LDA $72e6				; $aab1: AD E6 72
	AND #$30				 ; $aab4: 29 30   
	BEQ $aadf				; $aab6: F0 27   
	LDA $72e6				; $aab8: AD E6 72
	SEC					  ; $aabb: 38	  
	SBC #$10				 ; $aabc: E9 10	; Arithmetic
	STA $72e6				; $aabe: 8D E6 72
	AND #$30				 ; $aac1: 29 30   
	BNE $aadf				; $aac3: D0 1A   
	LDY #$f9				 ; $aac5: A0 F9   
	BRK					  ; $aac7: 00	  
	.db $62			  ; $aac8 - Unknown opcode
	.db $43			  ; $aac9 - Unknown opcode
	EOR ($c9,X)			  ; $aaca: 41 C9   
	.db $02			  ; $aacc - Unknown opcode
	BCS $aad0				; $aacd: B0 01   
	INY					  ; $aacf: C8	  
loc_AAD0:
	LDA #$00				 ; $aad0: A9 00   
	STA $6e				  ; $aad2: 85 6E   
	LDA #$41				 ; $aad4: A9 41   
	BRK					  ; $aad6: 00	  
	AND $850f				; $aad7: 2D 0F 85
	SBC $0098,Y			  ; $aada: F9 98 00 ; Arithmetic
	CMP ($e3,X)			  ; $aadd: C1 E3   
loc_AADF:
	RTS					  ; $aadf: 60	  

; ---- Subroutine at $aae0 (Bank 17) ----
sub_AAE0:
	LDA $6e45				; $aae0: AD 45 6E
	CMP #$ba				 ; $aae3: C9 BA	; Compare with 186
	BNE $aaed				; $aae5: D0 06   
	BRK					  ; $aae7: 00	  
	ASL $2f,X				; $aae8: 16 2F   
	BRK					  ; $aaea: 00	  
	ORA $2f,X				; $aaeb: 15 2F   
loc_AAED:
	RTS					  ; $aaed: 60	  

; ---- Subroutine at $aaee (Bank 17) ----
sub_AAEE:
	LDA $6e45				; $aaee: AD 45 6E
	CMP #$bb				 ; $aaf1: C9 BB	; Compare with 187
	BNE $ab06				; $aaf3: D0 11   
	LDA $615a				; $aaf5: AD 5A 61
	CMP #$03				 ; $aaf8: C9 03	; Compare with 3
	BNE $ab06				; $aafa: D0 0A   
	LDX #$ff				 ; $aafc: A2 FF   
	STA $7d				  ; $aafe: 85 7D   
	TXA					  ; $ab00: 8A	  
	INX					  ; $ab01: E8	  
	BRK					  ; $ab02: 00	  
	.db $02			  ; $ab03 - Unknown opcode
	.db $b3			  ; $ab04 - Unknown opcode
	RTS					  ; $ab05: 60	  
loc_AB06:
	LDX #$07				 ; $ab06: A2 07   
loc_AB08:
	BRK					  ; $ab08: 00	  
	AND #$c3				 ; $ab09: 29 C3   
	ASL $1890				; $ab0b: 0E 90 18
	BRK					  ; $ab0e: 00	  
	AND ($b3,X)			  ; $ab0f: 21 B3   
	ASL					  ; $ab11: 0A	  
	TAY					  ; $ab12: A8	  
	LDA $ab41,Y			  ; $ab13: B9 41 AB
	BRK					  ; $ab16: 00	  
	.db $17			  ; $ab17 - Unknown opcode
	.db $0f			  ; $ab18 - Unknown opcode
	CLC					  ; $ab19: 18	  
	ADC $ab42,Y			  ; $ab1a: 79 42 AB ; Arithmetic
	STA $7c				  ; $ab1d: 85 7C   
	LDA #$00				 ; $ab1f: A9 00   
	STA $7d				  ; $ab21: 85 7D   
	BRK					  ; $ab23: 00	  
	.db $02			  ; $ab24 - Unknown opcode
	.db $a3			  ; $ab25 - Unknown opcode
	DEX					  ; $ab26: CA	  
	BPL $ab08				; $ab27: 10 DF   
	RTS					  ; $ab29: 60	  

; ---- Subroutine at $ab2a (Bank 17) ----
sub_AB2A:
	LDX #$00				 ; $ab2a: A2 00   
	LDY #$09				 ; $ab2c: A0 09   
loc_AB2E:
	LDA #$00				 ; $ab2e: A9 00   
	STA $7215,X			  ; $ab30: 9D 15 72
	STA $7216,X			  ; $ab33: 9D 16 72
	TXA					  ; $ab36: 8A	  
	CLC					  ; $ab37: 18	  
	ADC #$0a				 ; $ab38: 69 0A	; Arithmetic
	TAX					  ; $ab3a: AA	  
	DEY					  ; $ab3b: 88	  
	BPL $ab2e				; $ab3c: 10 F0   
	JMP $a3f7				; $ab3e: 4C F7 A3
	BRK					  ; $ab41: 00	  
	BRK					  ; $ab42: 00	  
	PHP					  ; $ab43: 08	  
	BPL $ab52				; $ab44: 10 0C   
	BIT $5a14				; $ab46: 2C 14 5A

; ---- Subroutine at $ab49 (Bank 17) ----
sub_AB49:
	STA tmp0				 ; $ab49: 85 00   
	STY tmp1				 ; $ab4b: 84 01   
	TYA					  ; $ab4d: 98	  
	BRK					  ; $ab4e: 00	  
	ASL					  ; $ab4f: 0A	  
	.db $3f			  ; $ab50 - Unknown opcode
	BCC $ab69				; $ab51: 90 16   
	STA tmp2				 ; $ab53: 85 02   
	LDA tmp0				 ; $ab55: A5 00   
	BPL $ab76				; $ab57: 10 1D   
	AND #$07				 ; $ab59: 29 07   
	TAX					  ; $ab5b: AA	  
	LDA tmp1				 ; $ab5c: A5 01   
	CMP #$32				 ; $ab5e: C9 32	; Compare with 50
	BEQ $ab6b				; $ab60: F0 09   
	LDA tmp2				 ; $ab62: A5 02   
	BRK					  ; $ab64: 00	  
	.db $0b			  ; $ab65 - Unknown opcode
	.db $b3			  ; $ab66 - Unknown opcode
	BCC $ab74				; $ab67: 90 0B   
loc_AB69:
	SEC					  ; $ab69: 38	  
	RTS					  ; $ab6a: 60	  
loc_AB6B:
	LDA #$ff				 ; $ab6b: A9 FF   
	STA tmp2				 ; $ab6d: 85 02   
	BRK					  ; $ab6f: 00	  
	.db $07			  ; $ab70 - Unknown opcode
	.db $a3			  ; $ab71 - Unknown opcode
	BNE $ab69				; $ab72: D0 F5   
loc_AB74:
	CLC					  ; $ab74: 18	  
	RTS					  ; $ab75: 60	  
loc_AB76:
	BRK					  ; $ab76: 00	  
	.db $67			  ; $ab77 - Unknown opcode
	.db $73			  ; $ab78 - Unknown opcode
	TAX					  ; $ab79: AA	  
	LDA tmp1				 ; $ab7a: A5 01   
	CMP #$32				 ; $ab7c: C9 32	; Compare with 50
	BEQ $ab8a				; $ab7e: F0 0A   
	CMP #$12				 ; $ab80: C9 12	; Compare with 18
	BEQ $ab97				; $ab82: F0 13   
	LDA tmp2				 ; $ab84: A5 02   
	BRK					  ; $ab86: 00	  
	.db $0c			  ; $ab87 - Unknown opcode
	.db $73			  ; $ab88 - Unknown opcode
	RTS					  ; $ab89: 60	  
loc_AB8A:
	LDA #$ff				 ; $ab8a: A9 FF   
	STA tmp2				 ; $ab8c: 85 02   
	BRK					  ; $ab8e: 00	  
	.db $07			  ; $ab8f - Unknown opcode
	.db $53			  ; $ab90 - Unknown opcode
	ORA $73				  ; $ab91: 05 73   
	BNE $ab69				; $ab93: D0 D4   
	BEQ $ab74				; $ab95: F0 DD   
loc_AB97:
	BRK					  ; $ab97: 00	  
	.db $62			  ; $ab98 - Unknown opcode
	.db $23			  ; $ab99 - Unknown opcode
	.db $43			  ; $ab9a - Unknown opcode
	CMP #$04				 ; $ab9b: C9 04	; Compare with 4
	BCC $ab74				; $ab9d: 90 D5   
	LDX #$03				 ; $ab9f: A2 03   
loc_ABA1:
	LDA tmp2				 ; $aba1: A5 02   
	BRK					  ; $aba3: 00	  
	.db $0c			  ; $aba4 - Unknown opcode
	.db $73			  ; $aba5 - Unknown opcode
	ROL tmp3				 ; $aba6: 26 03   
	DEX					  ; $aba8: CA	  
	BPL $aba1				; $aba9: 10 F6   
	LDA tmp3				 ; $abab: A5 03   
	AND #$0f				 ; $abad: 29 0F   
	CMP #$0f				 ; $abaf: C9 0F	; Compare with 15
	BNE $ab74				; $abb1: D0 C1   
	BEQ $ab69				; $abb3: F0 B4   

; ---- Subroutine at $abb5 (Bank 17) ----
sub_ABB5:
	BRK					  ; $abb5: 00	  
	.db $03			  ; $abb6 - Unknown opcode
	.db $1f			  ; $abb7 - Unknown opcode
	TAY					  ; $abb8: A8	  
	BRK					  ; $abb9: 00	  
	ORA (system_flags,X)	 ; $abba: 01 1F   
	JSR $ab49				; $abbc: 20 49 AB ; -> sub_AB49
	BCC $ac00				; $abbf: 90 3F   
	LDA tmp1				 ; $abc1: A5 01   
	BRK					  ; $abc3: 00	  
	ASL					  ; $abc4: 0A	  
	.db $3f			  ; $abc5 - Unknown opcode
	BCC $abfe				; $abc6: 90 36   
	BRK					  ; $abc8: 00	  
	ASL system_flags		 ; $abc9: 06 1F   
	BCC $abd8				; $abcb: 90 0B   
	LDA tmp2				 ; $abcd: A5 02   
	BRK					  ; $abcf: 00	  
	ASL					  ; $abd0: 0A	  
	.db $b3			  ; $abd1 - Unknown opcode
	BRK					  ; $abd2: 00	  
	.db $2b			  ; $abd3 - Unknown opcode
	.db $c3			  ; $abd4 - Unknown opcode
	.db $13			  ; $abd5 - Unknown opcode
	SEC					  ; $abd6: 38	  
	RTS					  ; $abd7: 60	  
loc_ABD8:
	LDA tmp1				 ; $abd8: A5 01   
	CMP #$12				 ; $abda: C9 12	; Compare with 18
	BEQ $abf0				; $abdc: F0 12   
	LDA tmp2				 ; $abde: A5 02   
	CMP #$ff				 ; $abe0: C9 FF	; Compare with 255
	BEQ $abea				; $abe2: F0 06   
	BRK					  ; $abe4: 00	  
	.db $0b			  ; $abe5 - Unknown opcode
	.db $73			  ; $abe6 - Unknown opcode
	JMP $abfa				; $abe7: 4C FA AB
loc_ABEA:
	BRK					  ; $abea: 00	  
	ORA $4c73				; $abeb: 0D 73 4C
	.db $fa			  ; $abee - Unknown opcode
	.db $ab			  ; $abef - Unknown opcode
loc_ABF0:
	LDX #$03				 ; $abf0: A2 03   
loc_ABF2:
	LDA tmp2				 ; $abf2: A5 02   
	BRK					  ; $abf4: 00	  
	.db $0b			  ; $abf5 - Unknown opcode
	.db $73			  ; $abf6 - Unknown opcode
	DEX					  ; $abf7: CA	  
	BPL $abf2				; $abf8: 10 F8   
loc_ABFA:
	BRK					  ; $abfa: 00	  
	.db $07			  ; $abfb - Unknown opcode
	.db $6f			  ; $abfc - Unknown opcode
	.db $2b			  ; $abfd - Unknown opcode
loc_ABFE:
	SEC					  ; $abfe: 38	  
	RTS					  ; $abff: 60	  
loc_AC00:
	LDA tmp1				 ; $ac00: A5 01   
	CMP #$12				 ; $ac02: C9 12	; Compare with 18
	BEQ $ac15				; $ac04: F0 0F   
	BRK					  ; $ac06: 00	  
	CPX $d3				  ; $ac07: E4 D3   
	ORA (tmp0,X)			 ; $ac09: 01 00   
	ASL system_flags		 ; $ac0b: 06 1F   
	BCC $ac13				; $ac0d: 90 04   
	BRK					  ; $ac0f: 00	  
	ROL					  ; $ac10: 2A	  
	.db $c3			  ; $ac11 - Unknown opcode
	.db $13			  ; $ac12 - Unknown opcode
loc_AC13:
	CLC					  ; $ac13: 18	  
	RTS					  ; $ac14: 60	  
loc_AC15:
	BRK					  ; $ac15: 00	  
	.db $62			  ; $ac16 - Unknown opcode
	.db $23			  ; $ac17 - Unknown opcode
	.db $43			  ; $ac18 - Unknown opcode
	CMP #$04				 ; $ac19: C9 04	; Compare with 4
	BCC $ac34				; $ac1b: 90 17   
	LDX #$00				 ; $ac1d: A2 00   
loc_AC1F:
	LSR tmp3				 ; $ac1f: 46 03   
	BCS $ac29				; $ac21: B0 06   
	STX $f9				  ; $ac23: 86 F9   
	BRK					  ; $ac25: 00	  
	CMP $d3				  ; $ac26: C5 D3   
	ADC ($e8,X)			  ; $ac28: 61 E8	; Arithmetic
	CPX #$04				 ; $ac2a: E0 04   
	BCC $ac1f				; $ac2c: 90 F1   
	BRK					  ; $ac2e: 00	  
	SBC #$d3				 ; $ac2f: E9 D3	; Arithmetic
	.db $62			  ; $ac31 - Unknown opcode
	CLC					  ; $ac32: 18	  
	RTS					  ; $ac33: 60	  
loc_AC34:
	BRK					  ; $ac34: 00	  
	SBC $d3				  ; $ac35: E5 D3	; Arithmetic
	RTS					  ; $ac37: 60	  
	CLC					  ; $ac38: 18	  
	RTS					  ; $ac39: 60	  

; ---- Subroutine at $ac3a (Bank 17) ----
sub_AC3A:
	BRK					  ; $ac3a: 00	  
	.db $03			  ; $ac3b - Unknown opcode
	.db $1f			  ; $ac3c - Unknown opcode
	CMP #$3e				 ; $ac3d: C9 3E	; Compare with 62
	BEQ $ac5b				; $ac3f: F0 1A   
	CMP #$3f				 ; $ac41: C9 3F	; Compare with 63
	BEQ $ac5b				; $ac43: F0 16   
	CMP #$f3				 ; $ac45: C9 F3	; Compare with 243
	BEQ $ac5b				; $ac47: F0 12   
	CMP #$f4				 ; $ac49: C9 F4	; Compare with 244
	BEQ $ac5b				; $ac4b: F0 0E   

; ---- Subroutine at $ac4d (Bank 17) ----
sub_AC4D:
	BRK					  ; $ac4d: 00	  
	ASL system_flags		 ; $ac4e: 06 1F   
	BCC $ac57				; $ac50: 90 05   
	BRK					  ; $ac52: 00	  
	.db $2b			  ; $ac53 - Unknown opcode
	.db $c3			  ; $ac54 - Unknown opcode
	.db $0b			  ; $ac55 - Unknown opcode
	RTS					  ; $ac56: 60	  
loc_AC57:
	BRK					  ; $ac57: 00	  
	EOR $93				  ; $ac58: 45 93   
	.db $1b			  ; $ac5a - Unknown opcode
loc_AC5B:
	RTS					  ; $ac5b: 60	  

; ---- Subroutine at $ac5c (Bank 17) ----
sub_AC5C:
	LDA $6f				  ; $ac5c: A5 6F   
	PHA					  ; $ac5e: 48	  
	LDA $7c				  ; $ac5f: A5 7C   
	PHA					  ; $ac61: 48	  
	BRK					  ; $ac62: 00	  
	ASL system_flags		 ; $ac63: 06 1F   
	BCC $ac6e				; $ac65: 90 07   
	BRK					  ; $ac67: 00	  
	AND #$c3				 ; $ac68: 29 C3   
	.db $0b			  ; $ac6a - Unknown opcode
	JMP $ac72				; $ac6b: 4C 72 AC
loc_AC6E:
	BRK					  ; $ac6e: 00	  
	LSR $93				  ; $ac6f: 46 93   
	.db $1b			  ; $ac71 - Unknown opcode
loc_AC72:
	PLA					  ; $ac72: 68	  
	STA $7c				  ; $ac73: 85 7C   
	PLA					  ; $ac75: 68	  
	STA $6f				  ; $ac76: 85 6F   
	RTS					  ; $ac78: 60	  

; ---- Subroutine at $ac79 (Bank 17) ----
sub_AC79:
	BRK					  ; $ac79: 00	  
	.db $07			  ; $ac7a - Unknown opcode
	.db $1f			  ; $ac7b - Unknown opcode
	BCC $acae				; $ac7c: 90 30   
	TXA					  ; $ac7e: 8A	  
	PHA					  ; $ac7f: 48	  
	BRK					  ; $ac80: 00	  
	ASL system_flags		 ; $ac81: 06 1F   
	PLA					  ; $ac83: 68	  
	BCC $ac8c				; $ac84: 90 06   
	STA tmp0				 ; $ac86: 85 00   
	CPX tmp0				 ; $ac88: E4 00   
	BEQ $acae				; $ac8a: F0 22   
loc_AC8C:
	BRK					  ; $ac8c: 00	  
	.db $07			  ; $ac8d - Unknown opcode
	.db $1f			  ; $ac8e - Unknown opcode
	BRK					  ; $ac8f: 00	  
	AND #$c3				 ; $ac90: 29 C3   
	ASL					  ; $ac92: 0A	  
	BCC $acae				; $ac93: 90 19   
	STX $c7				  ; $ac95: 86 C7   
	JSR $bf2e				; $ac97: 20 2E BF ; -> sub_BF2E
	.db $a7			  ; $ac9a - Unknown opcode
	BRK					  ; $ac9b: 00	  
	CPX $d3				  ; $ac9c: E4 D3   
	.db $83			  ; $ac9e - Unknown opcode
	BRK					  ; $ac9f: 00	  
	.db $14			  ; $aca0 - Unknown opcode
	.db $4f			  ; $aca1 - Unknown opcode
	JSR $acb0				; $aca2: 20 B0 AC ; -> sub_ACB0
	BCC $acae				; $aca5: 90 07   
	STX $c7				  ; $aca7: 86 C7   
	BRK					  ; $aca9: 00	  
	ORA $4f,X				; $acaa: 15 4F   
	CLC					  ; $acac: 18	  
	RTS					  ; $acad: 60	  
loc_ACAE:
	SEC					  ; $acae: 38	  
	RTS					  ; $acaf: 60	  

; ---- Subroutine at $acb0 (Bank 17) ----
sub_ACB0:
	LDX #$03				 ; $acb0: A2 03   
loc_ACB2:
	BRK					  ; $acb2: 00	  
	AND #$c3				 ; $acb3: 29 C3   
	ASL					  ; $acb5: 0A	  
	BCC $acbd				; $acb6: 90 05   
	DEX					  ; $acb8: CA	  
	BPL $acb2				; $acb9: 10 F7   
	CLC					  ; $acbb: 18	  
	RTS					  ; $acbc: 60	  
loc_ACBD:
	SEC					  ; $acbd: 38	  
	RTS					  ; $acbe: 60	  

; ---- Subroutine at $acbf (Bank 17) ----
sub_ACBF:
	JSR $ad06				; $acbf: 20 06 AD ; -> sub_AD06
	BCC $ace6				; $acc2: 90 22   

; ---- Subroutine at $acc4 (Bank 17) ----
sub_ACC4:
	BRK					  ; $acc4: 00	  
	.db $07			  ; $acc5 - Unknown opcode
	.db $1f			  ; $acc6 - Unknown opcode
	BCC $acd5				; $acc7: 90 0C   
	BRK					  ; $acc9: 00	  
	AND #$c3				 ; $acca: 29 C3   
	ORA ($90),Y			  ; $accc: 11 90   
	.db $17			  ; $acce - Unknown opcode
loc_ACCF:
	BRK					  ; $accf: 00	  
	SBC $d3				  ; $acd0: E5 D3	; Arithmetic
	INC $18				  ; $acd2: E6 18   
	RTS					  ; $acd4: 60	  
loc_ACD5:
	JSR $ad00				; $acd5: 20 00 AD ; -> sub_AD00
	BEQ $ace6				; $acd8: F0 0C   
	BNE $accf				; $acda: D0 F3   
	JSR $ad06				; $acdc: 20 06 AD ; -> sub_AD06
	BCC $ace6				; $acdf: 90 05   
	BRK					  ; $ace1: 00	  
	.db $02			  ; $ace2 - Unknown opcode
	.db $1f			  ; $ace3 - Unknown opcode
	BPL $ace8				; $ace4: 10 02   
loc_ACE6:
	SEC					  ; $ace6: 38	  
	RTS					  ; $ace7: 60	  
loc_ACE8:
	JSR $ad00				; $ace8: 20 00 AD ; -> sub_AD00
	BEQ $ace6				; $aceb: F0 F9   
	LDA #$00				 ; $aced: A9 00   
	STA $6e				  ; $acef: 85 6E   
	LDA #$43				 ; $acf1: A9 43   
	BRK					  ; $acf3: 00	  
	AND $a50f				; $acf4: 2D 0F A5
	.db $72			  ; $acf7 - Unknown opcode
	STA $f9				  ; $acf8: 85 F9   
	BRK					  ; $acfa: 00	  
	CMP $d3				  ; $acfb: C5 D3   
	SBC $18				  ; $acfd: E5 18	; Arithmetic
	RTS					  ; $acff: 60	  

; ---- Subroutine at $ad00 (Bank 17) ----
sub_AD00:
	LDA $72e6				; $ad00: AD E6 72
	AND #$30				 ; $ad03: 29 30   
	RTS					  ; $ad05: 60	  

; ---- Subroutine at $ad06 (Bank 17) ----
sub_AD06:
	BRK					  ; $ad06: 00	  
	.db $03			  ; $ad07 - Unknown opcode
	.db $1f			  ; $ad08 - Unknown opcode
	LDX #$0f				 ; $ad09: A2 0F   
loc_AD0B:
	CMP $ad15,X			  ; $ad0b: DD 15 AD
	BEQ $acfe				; $ad0e: F0 EE   
	DEX					  ; $ad10: CA	  
	BPL $ad0b				; $ad11: 10 F8   
	SEC					  ; $ad13: 38	  
	RTS					  ; $ad14: 60	  
	.db $27			  ; $ad15 - Unknown opcode
	LDX $a9				  ; $ad16: A6 A9   
	.db $7b			  ; $ad18 - Unknown opcode
	ADC $b67e,X			  ; $ad19: 7D 7E B6 ; Arithmetic
	TSX					  ; $ad1c: BA	  
	.db $bb			  ; $ad1d - Unknown opcode
	LDA $cac8,X			  ; $ad1e: BD C8 CA
	CMP $e0df,Y			  ; $ad21: D9 DF E0
	.db $e2			  ; $ad24 - Unknown opcode

; ---- Subroutine at $ad25 (Bank 17) ----
sub_AD25:
	LDA $615a				; $ad25: AD 5A 61
	CMP #$04				 ; $ad28: C9 04	; Compare with 4
	BCS $ad49				; $ad2a: B0 1D   
	BRK					  ; $ad2c: 00	  
	ASL system_flags		 ; $ad2d: 06 1F   
	BCC $ad49				; $ad2f: 90 18   
	LDA $6e44				; $ad31: AD 44 6E
	AND #$03				 ; $ad34: 29 03   
	CMP #$01				 ; $ad36: C9 01	; Compare with 1
	BNE $ad49				; $ad38: D0 0F   
	LDA $72e7				; $ad3a: AD E7 72
	AND #$04				 ; $ad3d: 29 04   
	BNE $ad4b				; $ad3f: D0 0A   
	LDA $72e7				; $ad41: AD E7 72
	ORA #$04				 ; $ad44: 09 04   
	STA $72e7				; $ad46: 8D E7 72
loc_AD49:
	SEC					  ; $ad49: 38	  
	RTS					  ; $ad4a: 60	  
loc_AD4B:
	JSR $c891				; $ad4b: 20 91 C8 ; Call to fixed bank
	CMP #$55				 ; $ad4e: C9 55	; Compare with 85
	RTS					  ; $ad50: 60	  

; ---- Subroutine at $ad51 (Bank 17) ----
sub_AD51:
	JSR $ad89				; $ad51: 20 89 AD ; -> sub_AD89
	BCS $ad85				; $ad54: B0 2F   
	BRK					  ; $ad56: 00	  
	.db $03			  ; $ad57 - Unknown opcode
	.db $1f			  ; $ad58 - Unknown opcode
	CMP #$9d				 ; $ad59: C9 9D	; Compare with 157
	BEQ $ad65				; $ad5b: F0 08   
	CMP #$77				 ; $ad5d: C9 77	; Compare with 119
	BEQ $ad65				; $ad5f: F0 04   
	CMP #$19				 ; $ad61: C9 19	; Compare with 25
	BNE $ad71				; $ad63: D0 0C   
loc_AD65:
	BRK					  ; $ad65: 00	  
	.db $07			  ; $ad66 - Unknown opcode
	.db $1f			  ; $ad67 - Unknown opcode
	BCS $ad71				; $ad68: B0 07   
	BRK					  ; $ad6a: 00	  
	.db $07			  ; $ad6b - Unknown opcode
	.db $53			  ; $ad6c - Unknown opcode
	ORA $73				  ; $ad6d: 05 73   
	BEQ $ad81				; $ad6f: F0 10   
loc_AD71:
	BRK					  ; $ad71: 00	  
	.db $03			  ; $ad72 - Unknown opcode
	.db $1f			  ; $ad73 - Unknown opcode
	CMP #$4d				 ; $ad74: C9 4D	; Compare with 77
	BCC $ad7c				; $ad76: 90 04   
	CMP #$53				 ; $ad78: C9 53	; Compare with 83
	BCC $ad87				; $ad7a: 90 0B   
loc_AD7C:
	BRK					  ; $ad7c: 00	  
	ASL $3f				  ; $ad7d: 06 3F   
	BCS $ad87				; $ad7f: B0 06   
loc_AD81:
	BRK					  ; $ad81: 00	  
	INC $d3				  ; $ad82: E6 D3   
	.db $03			  ; $ad84 - Unknown opcode
loc_AD85:
	CLC					  ; $ad85: 18	  
	RTS					  ; $ad86: 60	  
loc_AD87:
	SEC					  ; $ad87: 38	  
	RTS					  ; $ad88: 60	  

; ---- Subroutine at $ad89 (Bank 17) ----
sub_AD89:
	BRK					  ; $ad89: 00	  
	.db $03			  ; $ad8a - Unknown opcode
	.db $1f			  ; $ad8b - Unknown opcode
	CMP #$2e				 ; $ad8c: C9 2E	; Compare with 46
	BNE $ada4				; $ad8e: D0 14   
	BRK					  ; $ad90: 00	  
	.db $07			  ; $ad91 - Unknown opcode
	.db $1f			  ; $ad92 - Unknown opcode
	BCS $ad9c				; $ad93: B0 07   
	BRK					  ; $ad95: 00	  
	LSR $93				  ; $ad96: 46 93   
	ASL $4c				  ; $ad98: 06 4C   
	LDY #$ad				 ; $ad9a: A0 AD   
loc_AD9C:
	BRK					  ; $ad9c: 00	  
	AND #$c3				 ; $ad9d: 29 C3   
	ORA $e590				; $ad9f: 0D 90 E5
	BCS $ad85				; $ada2: B0 E1   
loc_ADA4:
	LDX #$15				 ; $ada4: A2 15   
loc_ADA6:
	CMP $adc8,X			  ; $ada6: DD C8 AD
	BEQ $adb0				; $ada9: F0 05   
	DEX					  ; $adab: CA	  
	BPL $ada6				; $adac: 10 F8   
	CLC					  ; $adae: 18	  
	RTS					  ; $adaf: 60	  
loc_ADB0:
	TXA					  ; $adb0: 8A	  
	ASL					  ; $adb1: 0A	  
	PHA					  ; $adb2: 48	  
	BRK					  ; $adb3: 00	  
	.db $07			  ; $adb4 - Unknown opcode
	.db $1f			  ; $adb5 - Unknown opcode
	PLA					  ; $adb6: 68	  
	TAY					  ; $adb7: A8	  
	BCC $adc1				; $adb8: 90 07   
	LDA $addf,Y			  ; $adba: B9 DF AD
	BRK					  ; $adbd: 00	  
	AND #$b3				 ; $adbe: 29 B3   
	RTS					  ; $adc0: 60	  
loc_ADC1:
	LDA $adde,Y			  ; $adc1: B9 DE AD
	BRK					  ; $adc4: 00	  
	LSR $73				  ; $adc5: 46 73   
	RTS					  ; $adc7: 60	  
	.db $17			  ; $adc8 - Unknown opcode
	CLC					  ; $adc9: 18	  
	ORA $1b1a,Y			  ; $adca: 19 1A 1B
	.db $53			  ; $adcd - Unknown opcode
	.db $54			  ; $adce - Unknown opcode
	EOR $56,X				; $adcf: 55 56   
	.db $73			  ; $add1 - Unknown opcode
	.db $77			  ; $add2 - Unknown opcode
	SEI					  ; $add3: 78	  
	.db $7a			  ; $add4 - Unknown opcode
	.db $7c			  ; $add5 - Unknown opcode
	STA $88				  ; $add6: 85 88   
	STA $9d9c				; $add8: 8D 9C 9D
	TAY					  ; $addb: A8	  
	TAX					  ; $addc: AA	  
	.db $ab			  ; $addd - Unknown opcode
	BPL $ade0				; $adde: 10 00   
loc_ADE0:
	BPL $ade2				; $ade0: 10 00   
loc_ADE2:
	.db $13			  ; $ade2 - Unknown opcode
	.db $03			  ; $ade3 - Unknown opcode
	.db $14			  ; $ade4 - Unknown opcode
	.db $04			  ; $ade5 - Unknown opcode
	.db $12			  ; $ade6 - Unknown opcode
	.db $02			  ; $ade7 - Unknown opcode
	BPL $adea				; $ade8: 10 00   
loc_ADEA:
	ORA $0e				  ; $adea: 05 0E   
	ASL $0d				  ; $adec: 06 0D   
	ORA (tmp1),Y			 ; $adee: 11 01   
	BPL $adf2				; $adf0: 10 00   
loc_ADF2:
	.db $13			  ; $adf2 - Unknown opcode
	.db $03			  ; $adf3 - Unknown opcode
	ORA (tmp1),Y			 ; $adf4: 11 01   
	BPL $adf8				; $adf6: 10 00   
loc_ADF8:
	BIT $15				  ; $adf8: 24 15   
	BPL $adfc				; $adfa: 10 00   
loc_ADFC:
	.db $13			  ; $adfc - Unknown opcode
	.db $03			  ; $adfd - Unknown opcode
	.db $23			  ; $adfe - Unknown opcode
	.db $14			  ; $adff - Unknown opcode
	.db $12			  ; $ae00 - Unknown opcode
	.db $02			  ; $ae01 - Unknown opcode
	.db $13			  ; $ae02 - Unknown opcode
	.db $03			  ; $ae03 - Unknown opcode
	.db $14			  ; $ae04 - Unknown opcode
	.db $04			  ; $ae05 - Unknown opcode
	.db $12			  ; $ae06 - Unknown opcode
	.db $02			  ; $ae07 - Unknown opcode
	AND $16				  ; $ae08: 25 16   

; ---- Subroutine at $ae0a (Bank 17) ----
sub_AE0A:
	LDA $615a				; $ae0a: AD 5A 61
	CMP #$04				 ; $ae0d: C9 04	; Compare with 4
	BNE $ae1f				; $ae0f: D0 0E   
	BRK					  ; $ae11: 00	  
	.db $62			  ; $ae12 - Unknown opcode
	.db $33			  ; $ae13 - Unknown opcode
	TAX					  ; $ae14: AA	  
	CPX #$01				 ; $ae15: E0 01   
	BNE $ae21				; $ae17: D0 08   
	DEX					  ; $ae19: CA	  
	BRK					  ; $ae1a: 00	  
	.db $2b			  ; $ae1b - Unknown opcode
	.db $53			  ; $ae1c - Unknown opcode
	BNE $ae21				; $ae1d: D0 02   
loc_AE1F:
	CLC					  ; $ae1f: 18	  
	RTS					  ; $ae20: 60	  
loc_AE21:
	SEC					  ; $ae21: 38	  
	RTS					  ; $ae22: 60	  
	RTS					  ; $ae23: 60	  
	LDA #$00				 ; $ae24: A9 00   
	BEQ $ae2a				; $ae26: F0 02   
	LDA #$01				 ; $ae28: A9 01   
loc_AE2A:
	STA $70				  ; $ae2a: 85 70   
	STA $7d				  ; $ae2c: 85 7D   
	LDA #$19				 ; $ae2e: A9 19   
	LDX #$09				 ; $ae30: A2 09   
	JMP $9d4f				; $ae32: 4C 4F 9D
	BRK					  ; $ae35: 00	  
	.db $07			  ; $ae36 - Unknown opcode
	.db $1f			  ; $ae37 - Unknown opcode
	BCC $ae43				; $ae38: 90 09   
	BRK					  ; $ae3a: 00	  
	ORA $3f				  ; $ae3b: 05 3F   
	BRK					  ; $ae3d: 00	  
	ASL					  ; $ae3e: 0A	  
	.db $b3			  ; $ae3f - Unknown opcode
	JMP $ae49				; $ae40: 4C 49 AE
loc_AE43:
	BRK					  ; $ae43: 00	  
	ORA $3f				  ; $ae44: 05 3F   
	BRK					  ; $ae46: 00	  
	.db $0b			  ; $ae47 - Unknown opcode
	.db $73			  ; $ae48 - Unknown opcode
loc_AE49:
	BRK					  ; $ae49: 00	  
	INC $d3				  ; $ae4a: E6 D3   
	ORA ($60,X)			  ; $ae4c: 01 60   
	LDA #$11				 ; $ae4e: A9 11   
	LDX #$01				 ; $ae50: A2 01   
	JMP $9d4f				; $ae52: 4C 4F 9D
	LDA $72e4				; $ae55: AD E4 72
	ORA #$80				 ; $ae58: 09 80   
	STA $72e4				; $ae5a: 8D E4 72
	RTS					  ; $ae5d: 60	  
	LDA #$1b				 ; $ae5e: A9 1B   
	LDX #$0b				 ; $ae60: A2 0B   
	JMP $9d4f				; $ae62: 4C 4F 9D
	JSR $bf2e				; $ae65: 20 2E BF ; -> sub_BF2E
	.db $83			  ; $ae68 - Unknown opcode
loc_AE69:
	BRK					  ; $ae69: 00	  
	.db $07			  ; $ae6a - Unknown opcode
	.db $1f			  ; $ae6b - Unknown opcode
	BCC $ae83				; $ae6c: 90 15   
	TXA					  ; $ae6e: 8A	  
	PHA					  ; $ae6f: 48	  
	BRK					  ; $ae70: 00	  
	.db $22			  ; $ae71 - Unknown opcode
	.db $d3			  ; $ae72 - Unknown opcode
	ORA ($68,X)			  ; $ae73: 01 68   
	PHA					  ; $ae75: 48	  
	TAX					  ; $ae76: AA	  
	JSR $9204				; $ae77: 20 04 92 ; -> sub_9204
	BRK					  ; $ae7a: 00	  
	.db $07			  ; $ae7b - Unknown opcode
	.db $2f			  ; $ae7c - Unknown opcode
	PLA					  ; $ae7d: 68	  
	TAX					  ; $ae7e: AA	  
	BRK					  ; $ae7f: 00	  
	.db $2b			  ; $ae80 - Unknown opcode
	.db $c3			  ; $ae81 - Unknown opcode
	.db $0f			  ; $ae82 - Unknown opcode
loc_AE83:
	RTS					  ; $ae83: 60	  
	JSR $bf2e				; $ae84: 20 2E BF ; -> sub_BF2E
	.db $92			  ; $ae87 - Unknown opcode
	JMP $ae69				; $ae88: 4C 69 AE
	JSR $bf2e				; $ae8b: 20 2E BF ; -> sub_BF2E
	.db $83			  ; $ae8e - Unknown opcode
	BRK					  ; $ae8f: 00	  
	.db $07			  ; $ae90 - Unknown opcode
	.db $1f			  ; $ae91 - Unknown opcode
	BCC $ae83				; $ae92: 90 EF   
	TXA					  ; $ae94: 8A	  
	PHA					  ; $ae95: 48	  
	BRK					  ; $ae96: 00	  
	.db $b2			  ; $ae97 - Unknown opcode
	.db $d3			  ; $ae98 - Unknown opcode
	ORA ($4c,X)			  ; $ae99: 01 4C   
	.db $74			  ; $ae9b - Unknown opcode
	LDX $f4a9				; $ae9c: AE A9 F4
	STA $7c				  ; $ae9f: 85 7C   
	LDA #$01				 ; $aea1: A9 01   
	STA $7d				  ; $aea3: 85 7D   
	LDA #$65				 ; $aea5: A9 65   
	BRK					  ; $aea7: 00	  
	.db $17			  ; $aea8 - Unknown opcode
	.db $0f			  ; $aea9 - Unknown opcode
	LDX #$7c				 ; $aeaa: A2 7C   
	JSR $c813				; $aeac: 20 13 C8 ; Call to fixed bank
	JSR $a01f				; $aeaf: 20 1F A0 ; -> sub_A01F
	BRK					  ; $aeb2: 00	  
	.db $07			  ; $aeb3 - Unknown opcode
	.db $1f			  ; $aeb4 - Unknown opcode
	BCC $aebe				; $aeb5: 90 07   
	BRK					  ; $aeb7: 00	  
	.db $02			  ; $aeb8 - Unknown opcode
	.db $a3			  ; $aeb9 - Unknown opcode
	BRK					  ; $aeba: 00	  
	INC $d3				  ; $aebb: E6 D3   
	ORA ($60,X)			  ; $aebd: 01 60   
	BRK					  ; $aebf: 00	  
	CPX $d3				  ; $aec0: E4 D3   
	LSR tmp0,X			   ; $aec2: 56 00   
	.db $07			  ; $aec4 - Unknown opcode
	.db $1f			  ; $aec5 - Unknown opcode
	BCC $af2a				; $aec6: 90 62   
	BRK					  ; $aec8: 00	  
	AND #$c3				 ; $aec9: 29 C3   
	.db $0c			  ; $aecb - Unknown opcode
	BCC $aee0				; $aecc: 90 12   
	TXA					  ; $aece: 8A	  
	PHA					  ; $aecf: 48	  
	JSR $b11f				; $aed0: 20 1F B1 ; -> sub_B11F
	BRK					  ; $aed3: 00	  
	SBC $d3				  ; $aed4: E5 D3	; Arithmetic
	.db $a3			  ; $aed6 - Unknown opcode
	PLA					  ; $aed7: 68	  
	STA $c7				  ; $aed8: 85 C7   
	BRK					  ; $aeda: 00	  
	.db $13			  ; $aedb - Unknown opcode
	.db $4f			  ; $aedc - Unknown opcode
	BRK					  ; $aedd: 00	  
	.db $07			  ; $aede - Unknown opcode
	.db $1f			  ; $aedf - Unknown opcode
loc_AEE0:
	LDA #$ff				 ; $aee0: A9 FF   
	STA $7d				  ; $aee2: 85 7D   
	BRK					  ; $aee4: 00	  
	ORA ($b3),Y			  ; $aee5: 11 B3   
	BRK					  ; $aee7: 00	  
	ORA $00a3,Y			  ; $aee8: 19 A3 00
	ORA $a3,X				; $aeeb: 15 A3   
	BRK					  ; $aeed: 00	  
	.db $0f			  ; $aeee - Unknown opcode
	.db $a3			  ; $aeef - Unknown opcode
	BRK					  ; $aef0: 00	  
	BPL $aea6				; $aef1: 10 B3   
	BRK					  ; $aef3: 00	  
	.db $17			  ; $aef4 - Unknown opcode
	.db $a3			  ; $aef5 - Unknown opcode
	JSR $af9f				; $aef6: 20 9F AF ; -> sub_AF9F
	BRK					  ; $aef9: 00	  
	CLC					  ; $aefa: 18	  
	.db $b3			  ; $aefb - Unknown opcode
	BRK					  ; $aefc: 00	  
	.db $13			  ; $aefd - Unknown opcode
	.db $a3			  ; $aefe - Unknown opcode
	JSR $af9f				; $aeff: 20 9F AF ; -> sub_AF9F
	BRK					  ; $af02: 00	  
	.db $14			  ; $af03 - Unknown opcode
	.db $b3			  ; $af04 - Unknown opcode
	BRK					  ; $af05: 00	  
	.db $0f			  ; $af06 - Unknown opcode
	.db $a3			  ; $af07 - Unknown opcode
	BRK					  ; $af08: 00	  
	.db $2b			  ; $af09 - Unknown opcode
	.db $c3			  ; $af0a - Unknown opcode
	.db $03			  ; $af0b - Unknown opcode
	BRK					  ; $af0c: 00	  
	.db $2b			  ; $af0d - Unknown opcode
	.db $c3			  ; $af0e - Unknown opcode
	.db $04			  ; $af0f - Unknown opcode
	BRK					  ; $af10: 00	  
	.db $2b			  ; $af11 - Unknown opcode
	.db $c3			  ; $af12 - Unknown opcode
	ORA tmp0				 ; $af13: 05 00   
	.db $2b			  ; $af15 - Unknown opcode
	.db $c3			  ; $af16 - Unknown opcode
	ASL tmp0				 ; $af17: 06 00   
	.db $2b			  ; $af19 - Unknown opcode
	.db $c3			  ; $af1a - Unknown opcode
	.db $07			  ; $af1b - Unknown opcode
	BRK					  ; $af1c: 00	  
	.db $2b			  ; $af1d - Unknown opcode
	.db $c3			  ; $af1e - Unknown opcode
	ORA ($90),Y			  ; $af1f: 11 90   
	.db $03			  ; $af21 - Unknown opcode
	JSR $a0ef				; $af22: 20 EF A0 ; -> sub_A0EF
	BRK					  ; $af25: 00	  
	SBC $d3				  ; $af26: E5 D3	; Arithmetic
	LDX #$60				 ; $af28: A2 60   
loc_AF2A:
	BRK					  ; $af2a: 00	  
	LSR $93				  ; $af2b: 46 93   
	.db $1c			  ; $af2d - Unknown opcode
	BCC $af37				; $af2e: 90 07   
	JSR $b11f				; $af30: 20 1F B1 ; -> sub_B11F
	BRK					  ; $af33: 00	  
	SBC $d3				  ; $af34: E5 D3	; Arithmetic
	.db $a3			  ; $af36 - Unknown opcode
loc_AF37:
	LDA $72e7				; $af37: AD E7 72
	AND #$ef				 ; $af3a: 29 EF   
	STA $72e7				; $af3c: 8D E7 72
	LDA #$ff				 ; $af3f: A9 FF   
	STA $70				  ; $af41: 85 70   
	BRK					  ; $af43: 00	  
	ASL $73,X				; $af44: 16 73   
	BRK					  ; $af46: 00	  
	.db $1a			  ; $af47 - Unknown opcode
	.db $53			  ; $af48 - Unknown opcode
	BRK					  ; $af49: 00	  
	ASL $0053,X			  ; $af4a: 1E 53 00
	.db $12			  ; $af4d - Unknown opcode
	.db $53			  ; $af4e - Unknown opcode
	BRK					  ; $af4f: 00	  
	ORA $73,X				; $af50: 15 73   
	BRK					  ; $af52: 00	  
	.db $17			  ; $af53 - Unknown opcode
	.db $53			  ; $af54 - Unknown opcode
	JSR $afa6				; $af55: 20 A6 AF ; -> sub_AFA6
	BRK					  ; $af58: 00	  
	ORA $0073,Y			  ; $af59: 19 73 00
	.db $1b			  ; $af5c - Unknown opcode
	.db $53			  ; $af5d - Unknown opcode
	JSR $afa6				; $af5e: 20 A6 AF ; -> sub_AFA6
	BRK					  ; $af61: 00	  
	ORA $0073,X			  ; $af62: 1D 73 00
	EOR $93				  ; $af65: 45 93   
	.db $13			  ; $af67 - Unknown opcode
	BRK					  ; $af68: 00	  
	EOR $93				  ; $af69: 45 93   
	.db $14			  ; $af6b - Unknown opcode
	BRK					  ; $af6c: 00	  
	EOR $93				  ; $af6d: 45 93   
	ORA tmp0,X			   ; $af6f: 15 00   
	EOR $93				  ; $af71: 45 93   
	ASL tmp0,X			   ; $af73: 16 00   
	EOR $93				  ; $af75: 45 93   
	.db $17			  ; $af77 - Unknown opcode
	BRK					  ; $af78: 00	  
	EOR $93				  ; $af79: 45 93   
	CLC					  ; $af7b: 18	  
	BCC $af81				; $af7c: 90 03   
	JSR $a0ef				; $af7e: 20 EF A0 ; -> sub_A0EF
loc_AF81:
	LDA $72e6				; $af81: AD E6 72
	AND #$30				 ; $af84: 29 30   
	BEQ $af9a				; $af86: F0 12   
	LDA $72e6				; $af88: AD E6 72
	AND #$cf				 ; $af8b: 29 CF   
	STA $72e6				; $af8d: 8D E6 72
	LDA $6e44				; $af90: AD 44 6E
	AND #$fc				 ; $af93: 29 FC   
	ORA #$01				 ; $af95: 09 01   
	STA $6e44				; $af97: 8D 44 6E
loc_AF9A:
	BRK					  ; $af9a: 00	  
	SBC $d3				  ; $af9b: E5 D3	; Arithmetic
	LDX #$60				 ; $af9d: A2 60   

; ---- Subroutine at $af9f (Bank 17) ----
sub_AF9F:
	LDA $7f				  ; $af9f: A5 7F   
	STA $7d				  ; $afa1: 85 7D   
	LDA $7e				  ; $afa3: A5 7E   
	RTS					  ; $afa5: 60	  

; ---- Subroutine at $afa6 (Bank 17) ----
sub_AFA6:
	LDA $73				  ; $afa6: A5 73   
	STA $70				  ; $afa8: 85 70   
	LDA $72				  ; $afaa: A5 72   
	RTS					  ; $afac: 60	  
	BRK					  ; $afad: 00	  
	ASL system_flags		 ; $afae: 06 1F   
	BCS $afd5				; $afb0: B0 23   
	BRK					  ; $afb2: 00	  
	ROL $2c2f				; $afb3: 2E 2F 2C
	.db $44			  ; $afb6 - Unknown opcode
	ROR $1730				; $afb7: 6E 30 17
	BRK					  ; $afba: 00	  
	.db $2b			  ; $afbb - Unknown opcode
	.db $ef			  ; $afbc - Unknown opcode
	BCS $afd6				; $afbd: B0 17   
	BRK					  ; $afbf: 00	  
	.db $62			  ; $afc0 - Unknown opcode
	.db $23			  ; $afc1 - Unknown opcode
	RTI					  ; $afc2: 40	  
	DEC $72				  ; $afc3: C6 72   
	BEQ $afcc				; $afc5: F0 05   
	BRK					  ; $afc7: 00	  
	CPX $d3				  ; $afc8: E4 D3   
	ADC #$60				 ; $afca: 69 60	; Arithmetic
loc_AFCC:
	BRK					  ; $afcc: 00	  
	CPX $d3				  ; $afcd: E4 D3   
	PLA					  ; $afcf: 68	  
	RTS					  ; $afd0: 60	  
	BRK					  ; $afd1: 00	  
	CPX $d3				  ; $afd2: E4 D3   
	.db $5b			  ; $afd4 - Unknown opcode
loc_AFD5:
	RTS					  ; $afd5: 60	  
loc_AFD6:
	LDA #$00				 ; $afd6: A9 00   
	BRK					  ; $afd8: 00	  
	.db $47			  ; $afd9 - Unknown opcode
	.db $73			  ; $afda - Unknown opcode
	LDA $75				  ; $afdb: A5 75   
	BRK					  ; $afdd: 00	  
	.db $17			  ; $afde - Unknown opcode
	.db $0f			  ; $afdf - Unknown opcode
	BRK					  ; $afe0: 00	  
	BIT $aeef				; $afe1: 2C EF AE
	.db $1b			  ; $afe4 - Unknown opcode
	ORA $9a				  ; $afe5: 05 9A   
	JMP $cebd				; $afe7: 4C BD CE
loc_AFEA:
	BRK					  ; $afea: 00	  
	.db $07			  ; $afeb - Unknown opcode
	.db $1f			  ; $afec - Unknown opcode
	BCS $affe				; $afed: B0 0F   
	LDA #$05				 ; $afef: A9 05   
	JMP $9d4f				; $aff1: 4C 4F 9D

; ---- Subroutine at $aff4 (Bank 17) ----
sub_AFF4:
	LDA #$06				 ; $aff4: A9 06   
	LDX #$0d				 ; $aff6: A2 0D   
	JSR $9d4f				; $aff8: 20 4F 9D ; -> sub_9D4F
	JMP $92cf				; $affb: 4C CF 92
loc_AFFE:
	RTS					  ; $affe: 60	  

; ---- Subroutine at $afff (Bank 17) ----
sub_AFFF:
	BRK					  ; $afff: 00	  
	ASL system_flags		 ; $b000: 06 1F   
	BCS $b024				; $b002: B0 20   
	STX tmp0				 ; $b004: 86 00   
	BRK					  ; $b006: 00	  
	ORA system_flags		 ; $b007: 05 1F   
	CMP #$02				 ; $b009: C9 02	; Compare with 2
	BNE $b024				; $b00b: D0 17   
	LDA $7355				; $b00d: AD 55 73
	BRK					  ; $b010: 00	  
	ASL $b00f				; $b011: 0E 0F B0
	.db $0f			  ; $b014 - Unknown opcode
	BRK					  ; $b015: 00	  
	ORA $900f				; $b016: 0D 0F 90
	ASL					  ; $b019: 0A	  
	LDX tmp0				 ; $b01a: A6 00   
	BRK					  ; $b01c: 00	  
	AND ($73),Y			  ; $b01d: 31 73   
	BCC $b024				; $b01f: 90 03   
	BRK					  ; $b021: 00	  
	BMI $b097				; $b022: 30 73   
loc_B024:
	RTS					  ; $b024: 60	  
	BRK					  ; $b025: 00	  
	ASL system_flags		 ; $b026: 06 1F   
	BCS $b033				; $b028: B0 09   
	LDA $7355				; $b02a: AD 55 73
	BRK					  ; $b02d: 00	  
	AND ($73),Y			  ; $b02e: 31 73   
	BRK					  ; $b030: 00	  
	.db $32			  ; $b031 - Unknown opcode
	.db $73			  ; $b032 - Unknown opcode
loc_B033:
	RTS					  ; $b033: 60	  
	BRK					  ; $b034: 00	  
	INC $d3				  ; $b035: E6 D3   
	ORA ($60,X)			  ; $b037: 01 60   
	BRK					  ; $b039: 00	  
	.db $07			  ; $b03a - Unknown opcode
	.db $1f			  ; $b03b - Unknown opcode
	BCC $b054				; $b03c: 90 16   
	TXA					  ; $b03e: 8A	  
	PHA					  ; $b03f: 48	  
	JSR $bf2e				; $b040: 20 2E BF ; -> sub_BF2E
	.db $93			  ; $b043 - Unknown opcode
	PLA					  ; $b044: 68	  
	TAX					  ; $b045: AA	  
	JSR $b91c				; $b046: 20 1C B9 ; -> sub_B91C
	JSR $9204				; $b049: 20 04 92 ; -> sub_9204
	BRK					  ; $b04c: 00	  
	INC $d3				  ; $b04d: E6 D3   
	ORA (tmp0,X)			 ; $b04f: 01 00   
	.db $23			  ; $b051 - Unknown opcode
	.db $2f			  ; $b052 - Unknown opcode
	RTS					  ; $b053: 60	  
loc_B054:
	RTS					  ; $b054: 60	  
	JSR $b07e				; $b055: 20 7E B0 ; -> sub_B07E
	BRK					  ; $b058: 00	  
	.db $1b			  ; $b059 - Unknown opcode
	.db $0f			  ; $b05a - Unknown opcode
	CMP #$f4				 ; $b05b: C9 F4	; Compare with 244
	BCS $b07a				; $b05d: B0 1B   
	BRK					  ; $b05f: 00	  
	ASL $2f				  ; $b060: 06 2F   
	BRK					  ; $b062: 00	  
	BIT $60d3				; $b063: 2C D3 60
	BRK					  ; $b066: 00	  
	SBC $d3				  ; $b067: E5 D3	; Arithmetic
	LDA $0600				; $b069: AD 00 06
	.db $1f			  ; $b06c - Unknown opcode
	LDA $7355				; $b06d: AD 55 73
	BRK					  ; $b070: 00	  
	AND ($73),Y			  ; $b071: 31 73   
	BRK					  ; $b073: 00	  
	BMI $b0e9				; $b074: 30 73   
	RTS					  ; $b076: 60	  
	JSR $b07e				; $b077: 20 7E B0 ; -> sub_B07E
loc_B07A:
	BRK					  ; $b07a: 00	  
	ASL $2f				  ; $b07b: 06 2F   
	RTS					  ; $b07d: 60	  

; ---- Subroutine at $b07e (Bank 17) ----
sub_B07E:
	BRK					  ; $b07e: 00	  
	.db $07			  ; $b07f - Unknown opcode
	.db $1f			  ; $b080 - Unknown opcode
	BCC $b08e				; $b081: 90 0B   
	BRK					  ; $b083: 00	  
	ORA $3f				  ; $b084: 05 3F   
	BRK					  ; $b086: 00	  
	ORA #$b3				 ; $b087: 09 B3   
	BRK					  ; $b089: 00	  
	ROR $d3				  ; $b08a: 66 D3   
	ORA ($60,X)			  ; $b08c: 01 60   
loc_B08E:
	BVC $b09c				; $b08e: 50 0C   
	BRK					  ; $b090: 00	  
	ORA $3f				  ; $b091: 05 3F   
	BRK					  ; $b093: 00	  
	ORA #$73				 ; $b094: 09 73   
	BEQ $b09d				; $b096: F0 05   
	BRK					  ; $b098: 00	  
	ROR $d3				  ; $b099: 66 D3   
	ORA ($60,X)			  ; $b09b: 01 60   
loc_B09D:
	BRK					  ; $b09d: 00	  
	CPX $d3				  ; $b09e: E4 D3   
	.db $1a			  ; $b0a0 - Unknown opcode
	PLA					  ; $b0a1: 68	  
	PLA					  ; $b0a2: 68	  
	RTS					  ; $b0a3: 60	  
	LDA $7363				; $b0a4: AD 63 73
	BMI $b0ae				; $b0a7: 30 05   
	LDA #$05				 ; $b0a9: A9 05   
	JMP $9d6e				; $b0ab: 4C 6E 9D
loc_B0AE:
	BRK					  ; $b0ae: 00	  
	CPX $d3				  ; $b0af: E4 D3   
	.db $1a			  ; $b0b1 - Unknown opcode
	RTS					  ; $b0b2: 60	  
	LDA #$23				 ; $b0b3: A9 23   
	LDX #$14				 ; $b0b5: A2 14   
	JMP $9d4f				; $b0b7: 4C 4F 9D
	LDA #$11				 ; $b0ba: A9 11   
	JMP $b0d0				; $b0bc: 4C D0 B0
	LDA #$13				 ; $b0bf: A9 13   
	JMP $b0d0				; $b0c1: 4C D0 B0
	LDA #$24				 ; $b0c4: A9 24   
	JMP $b0d0				; $b0c6: 4C D0 B0
	LDA #$03				 ; $b0c9: A9 03   
	JMP $b0d0				; $b0cb: 4C D0 B0
	LDA #$0a				 ; $b0ce: A9 0A   
loc_B0D0:
	PHA					  ; $b0d0: 48	  
	BRK					  ; $b0d1: 00	  
	.db $07			  ; $b0d2 - Unknown opcode
	.db $1f			  ; $b0d3 - Unknown opcode
	STA $6e				  ; $b0d4: 85 6E   
	BRK					  ; $b0d6: 00	  
	ORA $3f				  ; $b0d7: 05 3F   
	STA $6f				  ; $b0d9: 85 6F   
	PLA					  ; $b0db: 68	  
	BRK					  ; $b0dc: 00	  
	BRK					  ; $b0dd: 00	  
	.db $03			  ; $b0de - Unknown opcode
	BRK					  ; $b0df: 00	  
	INC $d3				  ; $b0e0: E6 D3   
	ORA ($60,X)			  ; $b0e2: 01 60   
	BRK					  ; $b0e4: 00	  
	.db $e2			  ; $b0e5 - Unknown opcode
	.db $d3			  ; $b0e6 - Unknown opcode
	.db $02			  ; $b0e7 - Unknown opcode
	JMP $a047				; $b0e8: 4C 47 A0
	BRK					  ; $b0eb: 00	  
	.db $07			  ; $b0ec - Unknown opcode
	.db $1f			  ; $b0ed - Unknown opcode
	BCC $b115				; $b0ee: 90 25   
	BRK					  ; $b0f0: 00	  
	AND #$c3				 ; $b0f1: 29 C3   
	ORA ($b0),Y			  ; $b0f3: 11 B0   
	BIT tmp0				 ; $b0f5: 24 00   
	AND #$c3				 ; $b0f7: 29 C3   
	.db $0c			  ; $b0f9 - Unknown opcode
	BCC $b115				; $b0fa: 90 19   
	BRK					  ; $b0fc: 00	  
	.db $67			  ; $b0fd - Unknown opcode
	.db $73			  ; $b0fe - Unknown opcode
	STA $f9				  ; $b0ff: 85 F9   
	BRK					  ; $b101: 00	  
loc_B102:
	SBC $d3				  ; $b102: E5 D3	; Arithmetic
	TSX					  ; $b104: BA	  
	JSR $b11f				; $b105: 20 1F B1 ; -> sub_B11F
	BRK					  ; $b108: 00	  
	.db $07			  ; $b109 - Unknown opcode
	.db $1f			  ; $b10a - Unknown opcode
	STX $c7				  ; $b10b: 86 C7   
	BRK					  ; $b10d: 00	  
	.db $13			  ; $b10e - Unknown opcode
	.db $4f			  ; $b10f - Unknown opcode
	BRK					  ; $b110: 00	  
	SBC #$d3				 ; $b111: E9 D3	; Arithmetic
	.db $a3			  ; $b113 - Unknown opcode
	RTS					  ; $b114: 60	  
loc_B115:
	BRK					  ; $b115: 00	  
	SBC $d3				  ; $b116: E5 D3	; Arithmetic
	LDA $0060,Y			  ; $b118: B9 60 00
	CPX $d3				  ; $b11b: E4 D3   
	.db $7b			  ; $b11d - Unknown opcode
	RTS					  ; $b11e: 60	  

; ---- Subroutine at $b11f (Bank 17) ----
sub_B11F:
	BRK					  ; $b11f: 00	  
	.db $07			  ; $b120 - Unknown opcode
	.db $1f			  ; $b121 - Unknown opcode
	BCC $b150				; $b122: 90 2C   
	BRK					  ; $b124: 00	  
	.db $2b			  ; $b125 - Unknown opcode
	.db $c3			  ; $b126 - Unknown opcode
	.db $0c			  ; $b127 - Unknown opcode
	LDA #$ff				 ; $b128: A9 FF   
	STA $7d				  ; $b12a: 85 7D   
	BRK					  ; $b12c: 00	  
	ORA $b3,X				; $b12d: 15 B3   
	BRK					  ; $b12f: 00	  
	ORA $00a3,Y			  ; $b130: 19 A3 00
	ORA ($a3),Y			  ; $b133: 11 A3   
	BRK					  ; $b135: 00	  
	.db $13			  ; $b136 - Unknown opcode
	.db $a3			  ; $b137 - Unknown opcode
	LDY $7f				  ; $b138: A4 7F   
	STY $7d				  ; $b13a: 84 7D   
	BRK					  ; $b13c: 00	  
	.db $14			  ; $b13d - Unknown opcode
	.db $b3			  ; $b13e - Unknown opcode
	BRK					  ; $b13f: 00	  
	.db $17			  ; $b140 - Unknown opcode
	.db $a3			  ; $b141 - Unknown opcode
	LDY $7f				  ; $b142: A4 7F   
	STY $7d				  ; $b144: 84 7D   
	BRK					  ; $b146: 00	  
	CLC					  ; $b147: 18	  
	.db $b3			  ; $b148 - Unknown opcode
	BRK					  ; $b149: 00	  
	.db $0f			  ; $b14a - Unknown opcode
	.db $a3			  ; $b14b - Unknown opcode
	BRK					  ; $b14c: 00	  
	BPL $b102				; $b14d: 10 B3   
	RTS					  ; $b14f: 60	  
loc_B150:
	BRK					  ; $b150: 00	  
	EOR $93				  ; $b151: 45 93   
	.db $1c			  ; $b153 - Unknown opcode
	LDA #$ff				 ; $b154: A9 FF   
	STA $70				  ; $b156: 85 70   
	BRK					  ; $b158: 00	  
	.db $1a			  ; $b159 - Unknown opcode
	.db $73			  ; $b15a - Unknown opcode
	BRK					  ; $b15b: 00	  
	ASL $0073,X			  ; $b15c: 1E 73 00
	ASL $73,X				; $b15f: 16 73   
	BRK					  ; $b161: 00	  
	.db $17			  ; $b162 - Unknown opcode
	.db $53			  ; $b163 - Unknown opcode
	LDY $73				  ; $b164: A4 73   
	STY $70				  ; $b166: 84 70   
	BRK					  ; $b168: 00	  
	ORA $0073,Y			  ; $b169: 19 73 00
	.db $1b			  ; $b16c - Unknown opcode
	.db $53			  ; $b16d - Unknown opcode
	LDY $73				  ; $b16e: A4 73   
	STY $70				  ; $b170: 84 70   
	BRK					  ; $b172: 00	  
	ORA $0073,X			  ; $b173: 1D 73 00
	.db $12			  ; $b176 - Unknown opcode
	.db $53			  ; $b177 - Unknown opcode
	BRK					  ; $b178: 00	  
	ORA $73,X				; $b179: 15 73   
	RTS					  ; $b17b: 60	  
	JSR $96db				; $b17c: 20 DB 96 ; -> sub_96DB
	RTS					  ; $b17f: 60	  
loc_B180:
	BIT $6e44				; $b180: 2C 44 6E
	BMI $b1c1				; $b183: 30 3C   
	BVS $b1c1				; $b185: 70 3A   
	BRK					  ; $b187: 00	  
	.db $1b			  ; $b188 - Unknown opcode
	.db $0f			  ; $b189 - Unknown opcode
	CMP #$80				 ; $b18a: C9 80	; Compare with 128
	BCC $b1c1				; $b18c: 90 33   
	BIT $72e4				; $b18e: 2C E4 72
	BVS $b19a				; $b191: 70 07   
	BRK					  ; $b193: 00	  
	AND $d3				  ; $b194: 25 D3   
	LSR					  ; $b196: 4A	  
	JMP $b19e				; $b197: 4C 9E B1
loc_B19A:
	BRK					  ; $b19a: 00	  
	AND $d3				  ; $b19b: 25 D3   
	EOR #$a9				 ; $b19d: 49 A9   
	BRK					  ; $b19f: 00	  
	STA $735e				; $b1a0: 8D 5E 73
loc_B1A3:
	JSR $96c3				; $b1a3: 20 C3 96 ; -> sub_96C3
	BCC $b1b6				; $b1a6: 90 0E   
	BRK					  ; $b1a8: 00	  
	.db $07			  ; $b1a9 - Unknown opcode
	.db $1f			  ; $b1aa - Unknown opcode
	TXA					  ; $b1ab: 8A	  
	PHA					  ; $b1ac: 48	  
	JSR $91fe				; $b1ad: 20 FE 91 ; -> sub_91FE
	PLA					  ; $b1b0: 68	  
	TAX					  ; $b1b1: AA	  
	BRK					  ; $b1b2: 00	  
	.db $2b			  ; $b1b3 - Unknown opcode
	.db $c3			  ; $b1b4 - Unknown opcode
	.db $0f			  ; $b1b5 - Unknown opcode
loc_B1B6:
	INC $735e				; $b1b6: EE 5E 73
	LDA $735e				; $b1b9: AD 5E 73
	CMP #$08				 ; $b1bc: C9 08	; Compare with 8
	BCC $b1a3				; $b1be: 90 E3   
	RTS					  ; $b1c0: 60	  
loc_B1C1:
	BIT $72e4				; $b1c1: 2C E4 72
	BVS $b1cb				; $b1c4: 70 05   
	BRK					  ; $b1c6: 00	  
	SBC $d3				  ; $b1c7: E5 D3	; Arithmetic
	JMP $0060				; $b1c9: 4C 60 00
	SBC $d3				  ; $b1cc: E5 D3	; Arithmetic
	.db $4b			  ; $b1ce - Unknown opcode
	RTS					  ; $b1cf: 60	  
	LDA #$24				 ; $b1d0: A9 24   
	LDX #$15				 ; $b1d2: A2 15   
	JMP $9d4f				; $b1d4: 4C 4F 9D
	LDA #$25				 ; $b1d7: A9 25   
	LDX #$16				 ; $b1d9: A2 16   
	JMP $9d4f				; $b1db: 4C 4F 9D
	BRK					  ; $b1de: 00	  
	SBC $d3				  ; $b1df: E5 D3	; Arithmetic
	EOR ($20),Y			  ; $b1e1: 51 20   
	CPY $ac				  ; $b1e3: C4 AC   
	BCC $b21e				; $b1e5: 90 37   
	JSR $bf2e				; $b1e7: 20 2E BF ; -> sub_BF2E
	DEY					  ; $b1ea: 88	  
	BRK					  ; $b1eb: 00	  
	BEQ $b1c1				; $b1ec: F0 D3   
	EOR $1620				; $b1ee: 4D 20 16
	STA $db4c,Y			  ; $b1f1: 99 4C DB
	BCC $b1f6				; $b1f4: 90 00   
loc_B1F6:
	SBC $d3				  ; $b1f6: E5 D3	; Arithmetic
	EOR $a9,X				; $b1f8: 55 A9   
	.db $03			  ; $b1fa - Unknown opcode
	STA $735e				; $b1fb: 8D 5E 73
loc_B1FE:
	JSR $bf2e				; $b1fe: 20 2E BF ; -> sub_BF2E
	.db $89			  ; $b201 - Unknown opcode
	BRK					  ; $b202: 00	  
	SBC ($d3,X)			  ; $b203: E1 D3	; Arithmetic
	LSR $20,X				; $b205: 56 20   
	CPY $ac				  ; $b207: C4 AC   
	BCC $b20e				; $b209: 90 03   
	JSR $96db				; $b20b: 20 DB 96 ; -> sub_96DB
loc_B20E:
	LDA $72e7				; $b20e: AD E7 72
	AND #$60				 ; $b211: 29 60   
	BNE $b21a				; $b213: D0 05   
	DEC $735e				; $b215: CE 5E 73
	BNE $b1fe				; $b218: D0 E4   
loc_B21A:
	BRK					  ; $b21a: 00	  
	SBC ($d3,X)			  ; $b21b: E1 D3	; Arithmetic
	.db $57			  ; $b21d - Unknown opcode
loc_B21E:
	RTS					  ; $b21e: 60	  
	BRK					  ; $b21f: 00	  
	.db $1b			  ; $b220 - Unknown opcode
	.db $0f			  ; $b221 - Unknown opcode
	CMP #$80				 ; $b222: C9 80	; Compare with 128
	BCS $b275				; $b224: B0 4F   
	BRK					  ; $b226: 00	  
	ASL system_flags		 ; $b227: 06 1F   
	BRK					  ; $b229: 00	  
	AND $c953				; $b22a: 2D 53 C9
	PHP					  ; $b22d: 08	  
	BCS $b275				; $b22e: B0 45   
	LDX #$ff				 ; $b230: A2 FF   
	BRK					  ; $b232: 00	  
	AND #$c3				 ; $b233: 29 C3   
	ASL $00a2				; $b235: 0E A2 00
loc_B238:
	LSR					  ; $b238: 4A	  
	BCS $b241				; $b239: B0 06   
	INX					  ; $b23b: E8	  
	BNE $b238				; $b23c: D0 FA   
	JMP $b275				; $b23e: 4C 75 B2
loc_B241:
	TXA					  ; $b241: 8A	  
	ORA #$80				 ; $b242: 09 80   
	STA $7363				; $b244: 8D 63 73
	BRK					  ; $b247: 00	  
	.db $1c			  ; $b248 - Unknown opcode
	.db $b3			  ; $b249 - Unknown opcode
	STA $7355				; $b24a: 8D 55 73
	AND #$7f				 ; $b24d: 29 7F   
	CMP #$7f				 ; $b24f: C9 7F	; Compare with 127
	BEQ $b275				; $b251: F0 22   
	BRK					  ; $b253: 00	  
	BPL $b265				; $b254: 10 0F   
	BCC $b25f				; $b256: 90 07   
	AND #$7f				 ; $b258: 29 7F   
	BRK					  ; $b25a: 00	  
	ROR $73				  ; $b25b: 66 73   
	BCS $b275				; $b25d: B0 16   
loc_B25F:
	BRK					  ; $b25f: 00	  
	SBC ($d3,X)			  ; $b260: E1 D3	; Arithmetic
	.db $47			  ; $b262 - Unknown opcode
	BRK					  ; $b263: 00	  
	ASL system_flags		 ; $b264: 06 1F   
	LDA $7355				; $b266: AD 55 73
	BRK					  ; $b269: 00	  
	ROL $ad73				; $b26a: 2E 73 AD
	SBC $72				  ; $b26d: E5 72	; Arithmetic
	ORA #$02				 ; $b26f: 09 02   
	STA $72e5				; $b271: 8D E5 72
	RTS					  ; $b274: 60	  
loc_B275:
	LDA #$7b				 ; $b275: A9 7B   
	BRK					  ; $b277: 00	  
	ASL					  ; $b278: 0A	  
	.db $1f			  ; $b279 - Unknown opcode
	LDA #$80				 ; $b27a: A9 80   
	STA $7363				; $b27c: 8D 63 73
	BRK					  ; $b27f: 00	  
	.db $e2			  ; $b280 - Unknown opcode
	.db $d3			  ; $b281 - Unknown opcode
	BRK					  ; $b282: 00	  
	JMP $b180				; $b283: 4C 80 B1

; ---- Subroutine at $b286 (Bank 17) ----
sub_B286:
	BRK					  ; $b286: 00	  
	ASL system_flags		 ; $b287: 06 1F   
	BCS $b2f4				; $b289: B0 69   
	BRK					  ; $b28b: 00	  
	.db $2b			  ; $b28c - Unknown opcode
	.db $53			  ; $b28d - Unknown opcode
	CMP #$05				 ; $b28e: C9 05	; Compare with 5
	BNE $b2f4				; $b290: D0 62   
	LDA $615a				; $b292: AD 5A 61
	CMP #$02				 ; $b295: C9 02	; Compare with 2
	BEQ $b2f4				; $b297: F0 5B   
	BRK					  ; $b299: 00	  
	.db $1b			  ; $b29a - Unknown opcode
	.db $0f			  ; $b29b - Unknown opcode
	AND #$03				 ; $b29c: 29 03   
	BNE $b2f4				; $b29e: D0 54   
	BRK					  ; $b2a0: 00	  
	ORA system_flags		 ; $b2a1: 05 1F   
	CMP #$00				 ; $b2a3: C9 00	; Compare with 0
	BNE $b2f4				; $b2a5: D0 4D   
	LDA #$0d				 ; $b2a7: A9 0D   
	BRK					  ; $b2a9: 00	  
	.db $17			  ; $b2aa - Unknown opcode
	.db $0f			  ; $b2ab - Unknown opcode
	TAX					  ; $b2ac: AA	  
	LDA $b358,X			  ; $b2ad: BD 58 B3
	PHA					  ; $b2b0: 48	  
	BRK					  ; $b2b1: 00	  
	ASL					  ; $b2b2: 0A	  
	.db $1f			  ; $b2b3 - Unknown opcode
	PLA					  ; $b2b4: 68	  
	BRK					  ; $b2b5: 00	  
	ASL $c93f				; $b2b6: 0E 3F C9
	.db $03			  ; $b2b9 - Unknown opcode
	BNE $b2ca				; $b2ba: D0 0E   
	BRK					  ; $b2bc: 00	  
	ORA (system_flags,X)	 ; $b2bd: 01 1F   
	BRK					  ; $b2bf: 00	  
	ORA #$1f				 ; $b2c0: 09 1F   
	LDA #$80				 ; $b2c2: A9 80   
	BRK					  ; $b2c4: 00	  
	.db $0b			  ; $b2c5 - Unknown opcode
	.db $1f			  ; $b2c6 - Unknown opcode
	JMP $b34c				; $b2c7: 4C 4C B3
loc_B2CA:
	LDY #$00				 ; $b2ca: A0 00   
loc_B2CC:
	LDX #$ff				 ; $b2cc: A2 FF   
	TYA					  ; $b2ce: 98	  
	BRK					  ; $b2cf: 00	  
	AND $48b3				; $b2d0: 2D B3 48
	BRK					  ; $b2d3: 00	  
	AND #$c3				 ; $b2d4: 29 C3   
	ASL $2568				; $b2d6: 0E 68 25
	ROR $03d0,X			  ; $b2d9: 7E D0 03
	INY					  ; $b2dc: C8	  
	BNE $b2cc				; $b2dd: D0 ED   
	STY $7c				  ; $b2df: 84 7C   
	BRK					  ; $b2e1: 00	  
	ORA (system_flags,X)	 ; $b2e2: 01 1F   
	BRK					  ; $b2e4: 00	  
	ORA #$1f				 ; $b2e5: 09 1F   
	BCC $b2f4				; $b2e7: 90 0B   
	LDA $7c				  ; $b2e9: A5 7C   
	CLC					  ; $b2eb: 18	  
	ADC #$88				 ; $b2ec: 69 88	; Arithmetic
	BRK					  ; $b2ee: 00	  
	.db $0b			  ; $b2ef - Unknown opcode
	.db $1f			  ; $b2f0 - Unknown opcode
	JSR $b34c				; $b2f1: 20 4C B3 ; -> sub_B34C
loc_B2F4:
	RTS					  ; $b2f4: 60	  

; ---- Subroutine at $b2f5 (Bank 17) ----
sub_B2F5:
	LDA $615a				; $b2f5: AD 5A 61
	CMP #$02				 ; $b2f8: C9 02	; Compare with 2
	BEQ $b31d				; $b2fa: F0 21   
	BRK					  ; $b2fc: 00	  
	.db $03			  ; $b2fd - Unknown opcode
	.db $1f			  ; $b2fe - Unknown opcode
	BRK					  ; $b2ff: 00	  
	ORA #$3f				 ; $b300: 09 3F   
	BCS $b31d				; $b302: B0 19   
	BRK					  ; $b304: 00	  
	ASL system_flags		 ; $b305: 06 1F   
	BCC $b31d				; $b307: 90 14   
	JSR $b31f				; $b309: 20 1F B3 ; -> sub_B31F
	BCC $b31d				; $b30c: 90 0F   
	STA $f9				  ; $b30e: 85 F9   
	JSR $c891				; $b310: 20 91 C8 ; Call to fixed bank
	CMP #$10				 ; $b313: C9 10	; Compare with 16
	BCS $b31d				; $b315: B0 06   
	BRK					  ; $b317: 00	  
	CMP $d3				  ; $b318: C5 D3   
	.db $63			  ; $b31a - Unknown opcode
	CLC					  ; $b31b: 18	  
	RTS					  ; $b31c: 60	  
loc_B31D:
	SEC					  ; $b31d: 38	  
	RTS					  ; $b31e: 60	  

; ---- Subroutine at $b31f (Bank 17) ----
sub_B31F:
	BRK					  ; $b31f: 00	  
	.db $62			  ; $b320 - Unknown opcode
	.db $23			  ; $b321 - Unknown opcode
	.db $43			  ; $b322 - Unknown opcode
	BEQ $b336				; $b323: F0 11   
	STA tmp0				 ; $b325: 85 00   
	LDX #$00				 ; $b327: A2 00   
loc_B329:
	BRK					  ; $b329: 00	  
	.db $2b			  ; $b32a - Unknown opcode
	.db $43			  ; $b32b - Unknown opcode
	.db $43			  ; $b32c - Unknown opcode
	CMP #$05				 ; $b32d: C9 05	; Compare with 5
	BEQ $b338				; $b32f: F0 07   
	INX					  ; $b331: E8	  
	CPX tmp0				 ; $b332: E4 00   
	BCC $b329				; $b334: 90 F3   
loc_B336:
	CLC					  ; $b336: 18	  
	RTS					  ; $b337: 60	  
loc_B338:
	STX $6e				  ; $b338: 86 6E   
	BRK					  ; $b33a: 00	  
	ROL $a50f				; $b33b: 2E 0F A5
	.db $72			  ; $b33e - Unknown opcode
	STA tmp0				 ; $b33f: 85 00   
	TAX					  ; $b341: AA	  
	BRK					  ; $b342: 00	  
	LSR $43				  ; $b343: 46 43   
	BPL $b2f7				; $b345: 10 B0   
	INC $00a5				; $b347: EE A5 00
	SEC					  ; $b34a: 38	  
	RTS					  ; $b34b: 60	  

; ---- Subroutine at $b34c (Bank 17) ----
sub_B34C:
	BRK					  ; $b34c: 00	  
	ORA (system_flags,X)	 ; $b34d: 01 1F   
	BRK					  ; $b34f: 00	  
	ORA #$1f				 ; $b350: 09 1F   
	LDA #$00				 ; $b352: A9 00   
	BRK					  ; $b354: 00	  
	.db $0c			  ; $b355 - Unknown opcode
	.db $1f			  ; $b356 - Unknown opcode
	RTS					  ; $b357: 60	  
	SEI					  ; $b358: 78	  
	ADC $7b7a,Y			  ; $b359: 79 7A 7B ; Arithmetic
	.db $7c			  ; $b35c - Unknown opcode
	ADC $a87e,X			  ; $b35d: 7D 7E A8 ; Arithmetic
	LDA #$aa				 ; $b360: A9 AA   
	.db $ab			  ; $b362 - Unknown opcode
	ROL $a93d,X			  ; $b363: 3E 3D A9
	.db $7f			  ; $b366 - Unknown opcode
	BRK					  ; $b367: 00	  
	.db $17			  ; $b368 - Unknown opcode
	.db $0f			  ; $b369 - Unknown opcode
	STA $7355				; $b36a: 8D 55 73
	BRK					  ; $b36d: 00	  
	INC $d3				  ; $b36e: E6 D3   
	ORA ($60,X)			  ; $b370: 01 60   
	BRK					  ; $b372: 00	  
	.db $f2			  ; $b373 - Unknown opcode
	.db $d3			  ; $b374 - Unknown opcode
	ORA ($20,X)			  ; $b375: 01 20   
	CPY $ac				  ; $b377: C4 AC   
	BCC $b37f				; $b379: 90 04   
	BRK					  ; $b37b: 00	  
	INC $d3				  ; $b37c: E6 D3   
	.db $02			  ; $b37e - Unknown opcode
loc_B37F:
	RTS					  ; $b37f: 60	  
	BRK					  ; $b380: 00	  
	ASL system_flags		 ; $b381: 06 1F   
	BRK					  ; $b383: 00	  
	AND #$53				 ; $b384: 29 53   
	BNE $b38d				; $b386: D0 05   
	BRK					  ; $b388: 00	  
	SBC ($d3),Y			  ; $b389: F1 D3	; Arithmetic
	.db $12			  ; $b38b - Unknown opcode
	RTS					  ; $b38c: 60	  
loc_B38D:
	BRK					  ; $b38d: 00	  
	SBC ($d3),Y			  ; $b38e: F1 D3	; Arithmetic
	.db $13			  ; $b390 - Unknown opcode
	RTS					  ; $b391: 60	  
	JSR $b51d				; $b392: 20 1D B5 ; -> sub_B51D
	BRK					  ; $b395: 00	  
	INC $d3				  ; $b396: E6 D3   
	ORA ($4c,X)			  ; $b398: 01 4C   
	.db $db			  ; $b39a - Unknown opcode
	BCC $b346				; $b39b: 90 A9   
	BIT $a2				  ; $b39d: 24 A2   
	.db $17			  ; $b39f - Unknown opcode
	JSR $9d4f				; $b3a0: 20 4F 9D ; -> sub_9D4F
	RTS					  ; $b3a3: 60	  
	BRK					  ; $b3a4: 00	  
	LSR					  ; $b3a5: 4A	  
	.db $33			  ; $b3a6 - Unknown opcode
	STA $fd				  ; $b3a7: 85 FD   
	LDA $73				  ; $b3a9: A5 73   
	STA $fe				  ; $b3ab: 85 FE   
	LDA $74				  ; $b3ad: A5 74   
	STA $ff				  ; $b3af: 85 FF   
	BRK					  ; $b3b1: 00	  
	INC $d3				  ; $b3b2: E6 D3   
	ORA ($60,X)			  ; $b3b4: 01 60   
	BRK					  ; $b3b6: 00	  
	ASL system_flags		 ; $b3b7: 06 1F   
	BRK					  ; $b3b9: 00	  
	.db $3b			  ; $b3ba - Unknown opcode
	.db $93			  ; $b3bb - Unknown opcode
	BRK					  ; $b3bc: 00	  
	BCC $b3cb				; $b3bd: 90 0C   
	AND #$7f				 ; $b3bf: 29 7F   
	STA $7355				; $b3c1: 8D 55 73
	BRK					  ; $b3c4: 00	  
	SBC ($d3),Y			  ; $b3c5: F1 D3	; Arithmetic
	BPL $b415				; $b3c7: 10 4C   
	.db $cf			  ; $b3c9 - Unknown opcode
	.db $b3			  ; $b3ca - Unknown opcode
loc_B3CB:
	BRK					  ; $b3cb: 00	  
	SBC ($d3),Y			  ; $b3cc: F1 D3	; Arithmetic
	ORA (tmp0),Y			 ; $b3ce: 11 00   
	CPX $d3				  ; $b3d0: E4 D3   
	.db $1a			  ; $b3d2 - Unknown opcode
	RTS					  ; $b3d3: 60	  
	BRK					  ; $b3d4: 00	  
	INC $d3				  ; $b3d5: E6 D3   
	ORA ($20,X)			  ; $b3d7: 01 20   
	ORA $4cb5,X			  ; $b3d9: 1D B5 4C
	.db $db			  ; $b3dc - Unknown opcode
	BCC $b3df				; $b3dd: 90 00   
loc_B3DF:
	SBC $d3				  ; $b3df: E5 D3	; Arithmetic
	ORA $2e20				; $b3e1: 0D 20 2E
	.db $bf			  ; $b3e4 - Unknown opcode
	STY $e400				; $b3e5: 8C 00 E4
	.db $d3			  ; $b3e8 - Unknown opcode
	.db $62			  ; $b3e9 - Unknown opcode
	BRK					  ; $b3ea: 00	  
	ADC #$d3				 ; $b3eb: 69 D3	; Arithmetic
	EOR (tmp0,X)			 ; $b3ed: 41 00   
	ASL system_flags		 ; $b3ef: 06 1F   
	BCC $b401				; $b3f1: 90 0E   
	TXA					  ; $b3f3: 8A	  
	PHA					  ; $b3f4: 48	  
	JSR $9204				; $b3f5: 20 04 92 ; -> sub_9204
	BRK					  ; $b3f8: 00	  
	.db $07			  ; $b3f9 - Unknown opcode
	.db $2f			  ; $b3fa - Unknown opcode
	PLA					  ; $b3fb: 68	  
	TAX					  ; $b3fc: AA	  
	BRK					  ; $b3fd: 00	  
	.db $2b			  ; $b3fe - Unknown opcode
	.db $c3			  ; $b3ff - Unknown opcode
	.db $0f			  ; $b400 - Unknown opcode
loc_B401:
	RTS					  ; $b401: 60	  
	LDX #$02				 ; $b402: A2 02   
loc_B404:
	TXA					  ; $b404: 8A	  
	PHA					  ; $b405: 48	  
	JSR $bf2e				; $b406: 20 2E BF ; -> sub_BF2E
	.db $89			  ; $b409 - Unknown opcode
	BRK					  ; $b40a: 00	  
	CPX $d3				  ; $b40b: E4 D3   
	JMP $2e20				; $b40d: 4C 20 2E
	.db $bf			  ; $b410 - Unknown opcode
	STY $e800				; $b411: 8C 00 E8
	.db $d3			  ; $b414 - Unknown opcode
loc_B415:
	.db $07			  ; $b415 - Unknown opcode
	PLA					  ; $b416: 68	  
	TAX					  ; $b417: AA	  
	DEX					  ; $b418: CA	  
	BPL $b404				; $b419: 10 E9   
loc_B41B:
	RTS					  ; $b41b: 60	  
	JSR $bf2e				; $b41c: 20 2E BF ; -> sub_BF2E
	.db $93			  ; $b41f - Unknown opcode
	BRK					  ; $b420: 00	  
	SBC ($d3),Y			  ; $b421: F1 D3	; Arithmetic
	.db $1c			  ; $b423 - Unknown opcode
	JSR $acc4				; $b424: 20 C4 AC ; -> sub_ACC4
	BCC $b41b				; $b427: 90 F2   
	JSR $b51d				; $b429: 20 1D B5 ; -> sub_B51D
	LDA $7361				; $b42c: AD 61 73
	ADC #$0a				 ; $b42f: 69 0A	; Arithmetic
	STA $7361				; $b431: 8D 61 73
	JMP $90db				; $b434: 4C DB 90
	BRK					  ; $b437: 00	  
	ASL system_flags		 ; $b438: 06 1F   
	LDA #$00				 ; $b43a: A9 00   
	STA $70				  ; $b43c: 85 70   
	BRK					  ; $b43e: 00	  
	.db $3b			  ; $b43f - Unknown opcode
	.db $73			  ; $b440 - Unknown opcode
	BCC $b452				; $b441: 90 0F   
	AND #$7f				 ; $b443: 29 7F   
	STA $7355				; $b445: 8D 55 73
	BRK					  ; $b448: 00	  
	.db $13			  ; $b449 - Unknown opcode
	.db $0f			  ; $b44a - Unknown opcode
	BRK					  ; $b44b: 00	  
	.db $1a			  ; $b44c - Unknown opcode
	.db $73			  ; $b44d - Unknown opcode
	BRK					  ; $b44e: 00	  
	SBC ($d3),Y			  ; $b44f: F1 D3	; Arithmetic
	.db $14			  ; $b451 - Unknown opcode
loc_B452:
	RTS					  ; $b452: 60	  
	BRK					  ; $b453: 00	  
	ASL system_flags		 ; $b454: 06 1F   
	LDA #$00				 ; $b456: A9 00   
	STA $70				  ; $b458: 85 70   
	BRK					  ; $b45a: 00	  
	.db $3b			  ; $b45b - Unknown opcode
	.db $93			  ; $b45c - Unknown opcode
	ORA ($90,X)			  ; $b45d: 01 90   
	ASL $7f29,X			  ; $b45f: 1E 29 7F
	STA $7355				; $b462: 8D 55 73
	BRK					  ; $b465: 00	  
	.db $13			  ; $b466 - Unknown opcode
	.db $0f			  ; $b467 - Unknown opcode
	BRK					  ; $b468: 00	  
	ASL $0073,X			  ; $b469: 1E 73 00
	SBC ($d3),Y			  ; $b46c: F1 D3	; Arithmetic
	.db $27			  ; $b46e - Unknown opcode
	BRK					  ; $b46f: 00	  
	.db $07			  ; $b470 - Unknown opcode
	.db $1f			  ; $b471 - Unknown opcode
	BCC $b47e				; $b472: 90 0A   
	BRK					  ; $b474: 00	  
	AND #$c3				 ; $b475: 29 C3   
	ORA ($b0),Y			  ; $b477: 11 B0   
	.db $04			  ; $b479 - Unknown opcode
	BRK					  ; $b47a: 00	  
	SBC $d3				  ; $b47b: E5 D3	; Arithmetic
	PLP					  ; $b47d: 28	  
loc_B47E:
	RTS					  ; $b47e: 60	  
	LDA #$2b				 ; $b47f: A9 2B   
	JSR $b4a8				; $b481: 20 A8 B4 ; -> sub_B4A8
	BCS $b494				; $b484: B0 0E   
	LDA #$2a				 ; $b486: A9 2A   
	JSR $b4a8				; $b488: 20 A8 B4 ; -> sub_B4A8
	BCS $b494				; $b48b: B0 07   
	LDA #$29				 ; $b48d: A9 29   
	JSR $b4a8				; $b48f: 20 A8 B4 ; -> sub_B4A8
	BCC $b4a7				; $b492: 90 13   
loc_B494:
	BRK					  ; $b494: 00	  
	ASL					  ; $b495: 0A	  
	.db $1f			  ; $b496 - Unknown opcode
	JSR $bf2e				; $b497: 20 2E BF ; -> sub_BF2E
	STX $10a0				; $b49a: 8E A0 10
	BRK					  ; $b49d: 00	  
	.db $03			  ; $b49e - Unknown opcode
	.db $4f			  ; $b49f - Unknown opcode
	BRK					  ; $b4a0: 00	  
	SBC ($d3),Y			  ; $b4a1: F1 D3	; Arithmetic
	LSR $3a20,X			  ; $b4a3: 5E 20 3A
	.db $89			  ; $b4a6 - Unknown opcode
loc_B4A7:
	RTS					  ; $b4a7: 60	  

; ---- Subroutine at $b4a8 (Bank 17) ----
sub_B4A8:
	STA tmp0				 ; $b4a8: 85 00   
	BRK					  ; $b4aa: 00	  
	ASL system_flags		 ; $b4ab: 06 1F   
	STX $6e				  ; $b4ad: 86 6E   
	LDA #$00				 ; $b4af: A9 00   
	STA $6f				  ; $b4b1: 85 6F   
loc_B4B3:
	BRK					  ; $b4b3: 00	  
	.db $3f			  ; $b4b4 - Unknown opcode
	.db $33			  ; $b4b5 - Unknown opcode
	CMP tmp0				 ; $b4b6: C5 00   
	BEQ $b4c4				; $b4b8: F0 0A   
	INC $6f				  ; $b4ba: E6 6F   
	LDA $6f				  ; $b4bc: A5 6F   
	CMP #$0c				 ; $b4be: C9 0C	; Compare with 12
	BCC $b4b3				; $b4c0: 90 F1   
	CLC					  ; $b4c2: 18	  
	RTS					  ; $b4c3: 60	  
loc_B4C4:
	SEC					  ; $b4c4: 38	  
	RTS					  ; $b4c5: 60	  
	BRK					  ; $b4c6: 00	  
	EOR $9033,X			  ; $b4c7: 5D 33 90
	CLC					  ; $b4ca: 18	  
	BRK					  ; $b4cb: 00	  
	.db $62			  ; $b4cc - Unknown opcode
	.db $23			  ; $b4cd - Unknown opcode
	.db $43			  ; $b4ce - Unknown opcode
	CMP #$01				 ; $b4cf: C9 01	; Compare with 1
	BEQ $b4e3				; $b4d1: F0 10   
	BRK					  ; $b4d3: 00	  
	.db $f2			  ; $b4d4 - Unknown opcode
	.db $d3			  ; $b4d5 - Unknown opcode
	ORA (tmp0,X)			 ; $b4d6: 01 00   
	ASL system_flags		 ; $b4d8: 06 1F   
	BRK					  ; $b4da: 00	  
	.db $5f			  ; $b4db - Unknown opcode
	.db $53			  ; $b4dc - Unknown opcode
	JSR $8786				; $b4dd: 20 86 87 ; -> sub_8786
	JSR $a3f7				; $b4e0: 20 F7 A3 ; -> sub_A3F7
loc_B4E3:
	RTS					  ; $b4e3: 60	  
	BRK					  ; $b4e4: 00	  
	.db $62			  ; $b4e5 - Unknown opcode
	.db $23			  ; $b4e6 - Unknown opcode
	.db $43			  ; $b4e7 - Unknown opcode
	CMP #$01				 ; $b4e8: C9 01	; Compare with 1
	BEQ $b518				; $b4ea: F0 2C   
	LDX #$03				 ; $b4ec: A2 03   
loc_B4EE:
	LDA #$ff				 ; $b4ee: A9 FF   
	STA $6e,X				; $b4f0: 95 6E   
	DEX					  ; $b4f2: CA	  
	BPL $b4ee				; $b4f3: 10 F9   
	BRK					  ; $b4f5: 00	  
	ASL system_flags		 ; $b4f6: 06 1F   
	CPX #$00				 ; $b4f8: E0 00   
	BEQ $b518				; $b4fa: F0 1C   
	STX $6e				  ; $b4fc: 86 6E   
	BRK					  ; $b4fe: 00	  
	.db $62			  ; $b4ff - Unknown opcode
	.db $23			  ; $b500 - Unknown opcode
	RTI					  ; $b501: 40	  
	LDY #$00				 ; $b502: A0 00   
	LDX #$01				 ; $b504: A2 01   
loc_B506:
	CPY $6e				  ; $b506: C4 6E   
	BEQ $b50d				; $b508: F0 03   
	STY $6e,X				; $b50a: 94 6E   
	INX					  ; $b50c: E8	  
loc_B50D:
	INY					  ; $b50d: C8	  
	CPX $72				  ; $b50e: E4 72   
	BCC $b506				; $b510: 90 F4   
	BRK					  ; $b512: 00	  
	LSR $4c33,X			  ; $b513: 5E 33 4C
	.db $f7			  ; $b516 - Unknown opcode
	.db $a3			  ; $b517 - Unknown opcode
loc_B518:
	BRK					  ; $b518: 00	  
	CPX $d3				  ; $b519: E4 D3   
	.db $1a			  ; $b51b - Unknown opcode
	RTS					  ; $b51c: 60	  

; ---- Subroutine at $b51d (Bank 17) ----
sub_B51D:
	LDA #$04				 ; $b51d: A9 04   
	BRK					  ; $b51f: 00	  
	.db $17			  ; $b520 - Unknown opcode
	.db $0f			  ; $b521 - Unknown opcode
	ADC #$01				 ; $b522: 69 01	; Arithmetic
	STA $7361				; $b524: 8D 61 73
	LDA #$00				 ; $b527: A9 00   
	STA $7362				; $b529: 8D 62 73
loc_B52C:
	RTS					  ; $b52c: 60	  

; ---- Subroutine at $b52d (Bank 17) ----
sub_B52D:
	BRK					  ; $b52d: 00	  
	ASL system_flags		 ; $b52e: 06 1F   
	BCS $b52c				; $b530: B0 FA   
	BRK					  ; $b532: 00	  
	.db $3b			  ; $b533 - Unknown opcode
	.db $93			  ; $b534 - Unknown opcode
	.db $03			  ; $b535 - Unknown opcode
	CMP #$cc				 ; $b536: C9 CC	; Compare with 204
	BNE $b53e				; $b538: D0 04   
	BRK					  ; $b53a: 00	  
	.db $44			  ; $b53b - Unknown opcode
	.db $93			  ; $b53c - Unknown opcode
	.db $12			  ; $b53d - Unknown opcode
loc_B53E:
	BRK					  ; $b53e: 00	  
	LSR $93				  ; $b53f: 46 93   
	.db $12			  ; $b541 - Unknown opcode
	BCC $b52c				; $b542: 90 E8   
	BRK					  ; $b544: 00	  
	.db $1b			  ; $b545 - Unknown opcode
	.db $0f			  ; $b546 - Unknown opcode
	CMP #$80				 ; $b547: C9 80	; Compare with 128
	BCC $b553				; $b549: 90 08   
	CMP #$c0				 ; $b54b: C9 C0	; Compare with 192
	BCS $b564				; $b54d: B0 15   
	LDX #$43				 ; $b54f: A2 43   
	BNE $b555				; $b551: D0 02   
loc_B553:
	LDX #$29				 ; $b553: A2 29   
loc_B555:
	LDY #$80				 ; $b555: A0 80   
	BRK					  ; $b557: 00	  
	.db $13			  ; $b558 - Unknown opcode
	.db $3f			  ; $b559 - Unknown opcode
	PHA					  ; $b55a: 48	  
	LDA #$43				 ; $b55b: A9 43   
	BRK					  ; $b55d: 00	  
	ASL					  ; $b55e: 0A	  
	.db $1f			  ; $b55f - Unknown opcode
	PLA					  ; $b560: 68	  
	JMP $b615				; $b561: 4C 15 B6
loc_B564:
	BRK					  ; $b564: 00	  
	.db $1b			  ; $b565 - Unknown opcode
	.db $0f			  ; $b566 - Unknown opcode
	AND #$07				 ; $b567: 29 07   
	LDA #$04				 ; $b569: A9 04   
	CMP #$04				 ; $b56b: C9 04	; Compare with 4
	BCS $b579				; $b56d: B0 0A   
	TAX					  ; $b56f: AA	  
	LDA $b625,X			  ; $b570: BD 25 B6
	BRK					  ; $b573: 00	  
	ASL					  ; $b574: 0A	  
	.db $1f			  ; $b575 - Unknown opcode
	JMP $b60c				; $b576: 4C 0C B6
loc_B579:
	SBC #$04				 ; $b579: E9 04	; Arithmetic
	STA tmp0				 ; $b57b: 85 00   
	BRK					  ; $b57d: 00	  
	ASL system_flags		 ; $b57e: 06 1F   
	BRK					  ; $b580: 00	  
	.db $2b			  ; $b581 - Unknown opcode
	.db $53			  ; $b582 - Unknown opcode
	CMP #$08				 ; $b583: C9 08	; Compare with 8
	BCC $b589				; $b585: 90 02   
	LDA #$08				 ; $b587: A9 08   
loc_B589:
	TAY					  ; $b589: A8	  
	ASL					  ; $b58a: 0A	  
	ASL					  ; $b58b: 0A	  
	ADC tmp0				 ; $b58c: 65 00	; Arithmetic
	STA tmp0				 ; $b58e: 85 00   
	BRK					  ; $b590: 00	  
	.db $1b			  ; $b591 - Unknown opcode
	.db $0f			  ; $b592 - Unknown opcode
	AND #$03				 ; $b593: 29 03   
	CPY #$08				 ; $b595: C0 08   
	BNE $b59e				; $b597: D0 05   
	LDA #$06				 ; $b599: A9 06   
	BRK					  ; $b59b: 00	  
	.db $17			  ; $b59c - Unknown opcode
	.db $0f			  ; $b59d - Unknown opcode
loc_B59E:
	CLC					  ; $b59e: 18	  
	ADC tmp0				 ; $b59f: 65 00	; Arithmetic
	TAX					  ; $b5a1: AA	  
	LDA $b629,X			  ; $b5a2: BD 29 B6
	PHA					  ; $b5a5: 48	  
	BRK					  ; $b5a6: 00	  
	ASL					  ; $b5a7: 0A	  
	.db $1f			  ; $b5a8 - Unknown opcode
	PLA					  ; $b5a9: 68	  
	CMP #$c6				 ; $b5aa: C9 C6	; Compare with 198
	BEQ $b5ce				; $b5ac: F0 20   
	CMP #$af				 ; $b5ae: C9 AF	; Compare with 175
	BEQ $b5ce				; $b5b0: F0 1C   
	CMP #$b6				 ; $b5b2: C9 B6	; Compare with 182
	BEQ $b5da				; $b5b4: F0 24   
	CMP #$bc				 ; $b5b6: C9 BC	; Compare with 188
	BEQ $b5e6				; $b5b8: F0 2C   
	CMP #$c2				 ; $b5ba: C9 C2	; Compare with 194
	BEQ $b5ed				; $b5bc: F0 2F   
	CMP #$c4				 ; $b5be: C9 C4	; Compare with 196
	BEQ $b5f8				; $b5c0: F0 36   
	CMP #$c5				 ; $b5c2: C9 C5	; Compare with 197
	BEQ $b5f8				; $b5c4: F0 32   
	CMP #$c7				 ; $b5c6: C9 C7	; Compare with 199
	BEQ $b5ed				; $b5c8: F0 23   
	JSR $b60c				; $b5ca: 20 0C B6 ; -> sub_B60C
	RTS					  ; $b5cd: 60	  
loc_B5CE:
	BRK					  ; $b5ce: 00	  
	ASL system_flags		 ; $b5cf: 06 1F   
	BRK					  ; $b5d1: 00	  
	.db $3b			  ; $b5d2 - Unknown opcode
	.db $93			  ; $b5d3 - Unknown opcode
	BRK					  ; $b5d4: 00	  
	BCC $b604				; $b5d5: 90 2D   
	JMP $b60c				; $b5d7: 4C 0C B6
loc_B5DA:
	BRK					  ; $b5da: 00	  
	ASL system_flags		 ; $b5db: 06 1F   
	BRK					  ; $b5dd: 00	  
loc_B5DE:
	.db $3b			  ; $b5de - Unknown opcode
	.db $93			  ; $b5df - Unknown opcode
	ORA ($90,X)			  ; $b5e0: 01 90   
	AND ($4c,X)			  ; $b5e2: 21 4C   
	.db $0c			  ; $b5e4 - Unknown opcode
	LDX tmp0,Y			   ; $b5e5: B6 00   
	ASL system_flags		 ; $b5e7: 06 1F   
	CPX #$00				 ; $b5e9: E0 00   
	BEQ $b604				; $b5eb: F0 17   
loc_B5ED:
	BRK					  ; $b5ed: 00	  
	.db $62			  ; $b5ee - Unknown opcode
	.db $23			  ; $b5ef - Unknown opcode
	.db $43			  ; $b5f0 - Unknown opcode
	CMP #$01				 ; $b5f1: C9 01	; Compare with 1
	BEQ $b604				; $b5f3: F0 0F   
	JMP $b60c				; $b5f5: 4C 0C B6
loc_B5F8:
	BRK					  ; $b5f8: 00	  
	LSR					  ; $b5f9: 4A	  
	.db $33			  ; $b5fa - Unknown opcode
	ORA $73				  ; $b5fb: 05 73   
	ORA $74				  ; $b5fd: 05 74   
	BEQ $b604				; $b5ff: F0 03   
	JMP $b60c				; $b601: 4C 0C B6
loc_B604:
	LDA #$ac				 ; $b604: A9 AC   
	BRK					  ; $b606: 00	  
	ASL					  ; $b607: 0A	  
	.db $1f			  ; $b608 - Unknown opcode
	JMP $b60c				; $b609: 4C 0C B6

; ---- Subroutine at $b60c (Bank 17) ----
sub_B60C:
	BRK					  ; $b60c: 00	  
	.db $03			  ; $b60d - Unknown opcode
	.db $1f			  ; $b60e - Unknown opcode
	TAX					  ; $b60f: AA	  
	LDY #$80				 ; $b610: A0 80   
	BRK					  ; $b612: 00	  
	.db $13			  ; $b613 - Unknown opcode
	.db $3f			  ; $b614 - Unknown opcode
loc_B615:
	STA tmp0				 ; $b615: 85 00   
	BRK					  ; $b617: 00	  
	ORA (system_flags,X)	 ; $b618: 01 1F   
	BRK					  ; $b61a: 00	  
	ORA #$1f				 ; $b61b: 09 1F   
	LDA tmp0				 ; $b61d: A5 00   
loc_B61F:
	BRK					  ; $b61f: 00	  
	.db $0b			  ; $b620 - Unknown opcode
	.db $1f			  ; $b621 - Unknown opcode
	JMP $b34c				; $b622: 4C 4C B3
	LDY $d4ad				; $b625: AC AD D4
	BNE $b5d8				; $b628: D0 AE   
	.db $af			  ; $b62a - Unknown opcode
	BCS $b5de				; $b62b: B0 B1   
	.db $b2			  ; $b62d - Unknown opcode
	.db $b3			  ; $b62e - Unknown opcode
	LDY $b5,X				; $b62f: B4 B5   
	LDX $b7,Y				; $b631: B6 B7   
	CLV					  ; $b633: B8	  
	LDA $bbba,Y			  ; $b634: B9 BA BB
	LDY $bebd,X			  ; $b637: BC BD BE
	.db $bf			  ; $b63a - Unknown opcode
	CPY #$c1				 ; $b63b: C0 C1   
	.db $c2			  ; $b63d - Unknown opcode
	.db $c3			  ; $b63e - Unknown opcode
	CPY $c5				  ; $b63f: C4 C5   
	DEC $af				  ; $b641: C6 AF   
	.db $c7			  ; $b643 - Unknown opcode
	.db $d2			  ; $b644 - Unknown opcode
	INY					  ; $b645: C8	  
	CMP #$ca				 ; $b646: C9 CA	; Compare with 202
	.db $cb			  ; $b648 - Unknown opcode
	CPY $cfcd				; $b649: CC CD CF
	BNE $b61f				; $b64c: D0 D1   
	.db $d2			  ; $b64e - Unknown opcode
	DEC $2058				; $b64f: CE 58 20
	.db $1c			  ; $b652 - Unknown opcode
	LDA $1ea9,Y			  ; $b653: B9 A9 1E
	JMP $9c74				; $b656: 4C 74 9C
	LDA $72e4				; $b659: AD E4 72
	ORA #$08				 ; $b65c: 09 08   
	STA $72e4				; $b65e: 8D E4 72
	BRK					  ; $b661: 00	  
	INC $d3				  ; $b662: E6 D3   
	ORA ($60,X)			  ; $b664: 01 60   
	BRK					  ; $b666: 00	  
	ORA (system_flags,X)	 ; $b667: 01 1F   
	BMI $b692				; $b669: 30 27   
	STA tmp0				 ; $b66b: 85 00   
	LDA $72e6				; $b66d: AD E6 72
	AND #$30				 ; $b670: 29 30   
	ORA tmp0				 ; $b672: 05 00   
	ORA #$c0				 ; $b674: 09 C0   
	STA $72e6				; $b676: 8D E6 72
	LDA $72e5				; $b679: AD E5 72
	ORA #$80				 ; $b67c: 09 80   
	STA $72e5				; $b67e: 8D E5 72
	BRK					  ; $b681: 00	  
	BRK					  ; $b682: 00	  
	.db $fb			  ; $b683 - Unknown opcode
	LDX #$5a				 ; $b684: A2 5A   
	JSR $c90c				; $b686: 20 0C C9 ; Call to fixed bank
	BRK					  ; $b689: 00	  
	INC $d3				  ; $b68a: E6 D3   
	ORA ($a2,X)			  ; $b68c: 01 A2   
	PLP					  ; $b68e: 28	  
	JSR $c90c				; $b68f: 20 0C C9 ; Call to fixed bank
loc_B692:
	RTS					  ; $b692: 60	  
	BRK					  ; $b693: 00	  
	INC $d3				  ; $b694: E6 D3   
	ORA (tmp0,X)			 ; $b696: 01 00   
	.db $1b			  ; $b698 - Unknown opcode
	.db $0f			  ; $b699 - Unknown opcode
	AND #$01				 ; $b69a: 29 01   
	TAX					  ; $b69c: AA	  
	INX					  ; $b69d: E8	  
	STX tmp0				 ; $b69e: 86 00   
	LDA $6e44				; $b6a0: AD 44 6E
	AND #$fc				 ; $b6a3: 29 FC   
	ORA tmp0				 ; $b6a5: 05 00   
	STA $6e44				; $b6a7: 8D 44 6E
	AND #$03				 ; $b6aa: 29 03   
	CMP #$01				 ; $b6ac: C9 01	; Compare with 1
	BEQ $b6bf				; $b6ae: F0 0F   
	LDY #$eb				 ; $b6b0: A0 EB   
	BIT $72e4				; $b6b2: 2C E4 72
	BVS $b6b8				; $b6b5: 70 01   
	INY					  ; $b6b7: C8	  
loc_B6B8:
	TYA					  ; $b6b8: 98	  
	BRK					  ; $b6b9: 00	  
	SBC $e3				  ; $b6ba: E5 E3	; Arithmetic
	JMP $b6ce				; $b6bc: 4C CE B6
loc_B6BF:
	LDY #$ed				 ; $b6bf: A0 ED   
	BRK					  ; $b6c1: 00	  
	.db $62			  ; $b6c2 - Unknown opcode
	.db $23			  ; $b6c3 - Unknown opcode
	ORA ($c9,X)			  ; $b6c4: 01 C9   
	ORA ($d0,X)			  ; $b6c6: 01 D0   
	ORA ($c8,X)			  ; $b6c8: 01 C8   
	TYA					  ; $b6ca: 98	  
	BRK					  ; $b6cb: 00	  
	SBC $e3				  ; $b6cc: E5 E3	; Arithmetic
loc_B6CE:
	PLA					  ; $b6ce: 68	  
	PLA					  ; $b6cf: 68	  
	PLA					  ; $b6d0: 68	  
	PLA					  ; $b6d1: 68	  
	PLA					  ; $b6d2: 68	  
	PLA					  ; $b6d3: 68	  
	PLA					  ; $b6d4: 68	  
	PLA					  ; $b6d5: 68	  
	PLA					  ; $b6d6: 68	  
	PLA					  ; $b6d7: 68	  
	JMP $8053				; $b6d8: 4C 53 80
	BRK					  ; $b6db: 00	  
	.db $07			  ; $b6dc - Unknown opcode
	.db $1f			  ; $b6dd - Unknown opcode
	BCC $b6e8				; $b6de: 90 08   
	BRK					  ; $b6e0: 00	  
	.db $0c			  ; $b6e1 - Unknown opcode
	.db $b3			  ; $b6e2 - Unknown opcode
	BRK					  ; $b6e3: 00	  
	INC $d3				  ; $b6e4: E6 D3   
	ORA ($60,X)			  ; $b6e6: 01 60   
loc_B6E8:
	BVC $b6f1				; $b6e8: 50 07   
	BRK					  ; $b6ea: 00	  
	ORA $0073				; $b6eb: 0D 73 00
	INC $d3				  ; $b6ee: E6 D3   
	ORA ($60,X)			  ; $b6f0: 01 60   
	BRK					  ; $b6f2: 00	  
	ORA $3f				  ; $b6f3: 05 3F   
	STA $7361				; $b6f5: 8D 61 73
	LDA $70				  ; $b6f8: A5 70   
	STA $7362				; $b6fa: 8D 62 73
	JMP $90db				; $b6fd: 4C DB 90
	LDA #$93				 ; $b700: A9 93   
	JMP $9c74				; $b702: 4C 74 9C
	BRK					  ; $b705: 00	  
	INC $d3				  ; $b706: E6 D3   
	ORA ($a9,X)			  ; $b708: 01 A9   
	BRK					  ; $b70a: 00	  
	STA $735e				; $b70b: 8D 5E 73
loc_B70E:
	JSR $96c3				; $b70e: 20 C3 96 ; -> sub_96C3
	BCC $b72e				; $b711: 90 1B   
	JSR $bf2e				; $b713: 20 2E BF ; -> sub_BF2E
	.db $89			  ; $b716 - Unknown opcode
	BRK					  ; $b717: 00	  
	SBC ($d3,X)			  ; $b718: E1 D3	; Arithmetic
	STY $20,X				; $b71a: 94 20   
	CPY $ac				  ; $b71c: C4 AC   
	BCC $b72e				; $b71e: 90 0E   
	BRK					  ; $b720: 00	  
	ORA $3f				  ; $b721: 05 3F   
	STA $7361				; $b723: 8D 61 73
	LDA $70				  ; $b726: A5 70   
	STA $7362				; $b728: 8D 62 73
	JSR $90db				; $b72b: 20 DB 90 ; -> sub_90DB
loc_B72E:
	INC $735e				; $b72e: EE 5E 73
	LDA $735e				; $b731: AD 5E 73
	CMP #$08				 ; $b734: C9 08	; Compare with 8
	BCC $b70e				; $b736: 90 D6   
	BRK					  ; $b738: 00	  
	SBC ($d3,X)			  ; $b739: E1 D3	; Arithmetic
	STA $60,X				; $b73b: 95 60   
	BRK					  ; $b73d: 00	  
	PHP					  ; $b73e: 08	  
	.db $4f			  ; $b73f - Unknown opcode
	BIT $72e4				; $b740: 2C E4 72
	BVS $b753				; $b743: 70 0E   
	LDA $6e45				; $b745: AD 45 6E
	CMP #$99				 ; $b748: C9 99	; Compare with 153
	BEQ $b753				; $b74a: F0 07   
	BRK					  ; $b74c: 00	  
	SBC $d3				  ; $b74d: E5 D3	; Arithmetic
	STX $4c,Y				; $b74f: 96 4C   
	.db $57			  ; $b751 - Unknown opcode
	.db $b7			  ; $b752 - Unknown opcode
loc_B753:
	BRK					  ; $b753: 00	  
	SBC $d3				  ; $b754: E5 D3	; Arithmetic
	EOR $03a2,X			  ; $b756: 5D A2 03
	LDA #$ff				 ; $b759: A9 FF   
loc_B75B:
	STA $6e45,X			  ; $b75b: 9D 45 6E
	DEX					  ; $b75e: CA	  
	BPL $b75b				; $b75f: 10 FA   
	LDA #$5c				 ; $b761: A9 5C   
	STA $6e45				; $b763: 8D 45 6E
	STA $7206				; $b766: 8D 06 72
	LDX #$80				 ; $b769: A2 80   
	BRK					  ; $b76b: 00	  
	AND #$c3				 ; $b76c: 29 C3   
	ASL $498d				; $b76e: 0E 8D 49
	ROR $ffa2				; $b771: 6E A2 FF
	BRK					  ; $b774: 00	  
	AND #$c3				 ; $b775: 29 C3   
	ASL $00a2				; $b777: 0E A2 00
loc_B77A:
	LSR					  ; $b77a: 4A	  
	PHA					  ; $b77b: 48	  
	BCS $b785				; $b77c: B0 07   
	BRK					  ; $b77e: 00	  
	.db $2b			  ; $b77f - Unknown opcode
	.db $c3			  ; $b780 - Unknown opcode
	.db $0f			  ; $b781 - Unknown opcode
	JMP $b78c				; $b782: 4C 8C B7
loc_B785:
	LDA #$00				 ; $b785: A9 00   
	STA $7c				  ; $b787: 85 7C   
	BRK					  ; $b789: 00	  
	AND ($b3),Y			  ; $b78a: 31 B3   
loc_B78C:
	PLA					  ; $b78c: 68	  
	INX					  ; $b78d: E8	  
	CPX #$08				 ; $b78e: E0 08   
	BCC $b77a				; $b790: 90 E8   
	LDA $6e44				; $b792: AD 44 6E
	AND #$fc				 ; $b795: 29 FC   
	ORA #$02				 ; $b797: 09 02   
	STA $6e44				; $b799: 8D 44 6E
	RTS					  ; $b79c: 60	  
	LDA #$00				 ; $b79d: A9 00   
	JMP $9c74				; $b79f: 4C 74 9C
	BRK					  ; $b7a2: 00	  
	INC $d3				  ; $b7a3: E6 D3   
	ORA ($ad,X)			  ; $b7a5: 01 AD   
	SBC $72				  ; $b7a7: E5 72	; Arithmetic
	ORA #$01				 ; $b7a9: 09 01   
	STA $72e5				; $b7ab: 8D E5 72
	RTS					  ; $b7ae: 60	  
	BRK					  ; $b7af: 00	  
	INC $d3				  ; $b7b0: E6 D3   
	ORA (tmp0,X)			 ; $b7b2: 01 00   
	ASL system_flags		 ; $b7b4: 06 1F   
	BRK					  ; $b7b6: 00	  
	BRK					  ; $b7b7: 00	  
	.db $53			  ; $b7b8 - Unknown opcode
	LDA #$28				 ; $b7b9: A9 28   
	BRK					  ; $b7bb: 00	  
	.db $17			  ; $b7bc - Unknown opcode
	.db $0f			  ; $b7bd - Unknown opcode
	CLC					  ; $b7be: 18	  
	ADC #$19				 ; $b7bf: 69 19	; Arithmetic
	LDX #$72				 ; $b7c1: A2 72   
	JSR $c827				; $b7c3: 20 27 C8 ; Call to fixed bank
	LDA #$20				 ; $b7c6: A9 20   
	JSR $c851				; $b7c8: 20 51 C8 ; Call to fixed bank
	LDA #$01				 ; $b7cb: A9 01   
	JSR $c813				; $b7cd: 20 13 C8 ; Call to fixed bank
	LDA $72				  ; $b7d0: A5 72   
	STA $7361				; $b7d2: 8D 61 73
	LDA $73				  ; $b7d5: A5 73   
	STA $7362				; $b7d7: 8D 62 73
	JSR $90db				; $b7da: 20 DB 90 ; -> sub_90DB
	JSR $a3f7				; $b7dd: 20 F7 A3 ; -> sub_A3F7
	LDA $72e7				; $b7e0: AD E7 72
	AND #$01				 ; $b7e3: 29 01   
	BNE $b7f7				; $b7e5: D0 10   
	BRK					  ; $b7e7: 00	  
	SBC #$d3				 ; $b7e8: E9 D3	; Arithmetic
	STA $0600,X			  ; $b7ea: 9D 00 06
	.db $1f			  ; $b7ed - Unknown opcode
	BRK					  ; $b7ee: 00	  
	.db $44			  ; $b7ef - Unknown opcode
	.db $93			  ; $b7f0 - Unknown opcode
	ROL $a9				  ; $b7f1: 26 A9   
	.db $52			  ; $b7f3 - Unknown opcode
	JSR $b808				; $b7f4: 20 08 B8 ; -> sub_B808
loc_B7F7:
	RTS					  ; $b7f7: 60	  
	BRK					  ; $b7f8: 00	  
	.db $03			  ; $b7f9 - Unknown opcode
	.db $1f			  ; $b7fa - Unknown opcode
	CLC					  ; $b7fb: 18	  
	ADC #$01				 ; $b7fc: 69 01	; Arithmetic
	BRK					  ; $b7fe: 00	  
	ASL					  ; $b7ff: 0A	  
	.db $1f			  ; $b800 - Unknown opcode
	JSR $b8d4				; $b801: 20 D4 B8 ; -> sub_B8D4
	JSR $893a				; $b804: 20 3A 89 ; -> sub_893A
	RTS					  ; $b807: 60	  

; ---- Subroutine at $b808 (Bank 17) ----
sub_B808:
	STA tmp0				 ; $b808: 85 00   
	LDA $96				  ; $b80a: A5 96   
	PHA					  ; $b80c: 48	  
	BRK					  ; $b80d: 00	  
	.db $03			  ; $b80e - Unknown opcode
	.db $1f			  ; $b80f - Unknown opcode
	PHA					  ; $b810: 48	  
	BRK					  ; $b811: 00	  
	.db $02			  ; $b812 - Unknown opcode
	.db $1f			  ; $b813 - Unknown opcode
	PHA					  ; $b814: 48	  
	LDA $735d				; $b815: AD 5D 73
	PHA					  ; $b818: 48	  
	LDA $735c				; $b819: AD 5C 73
	PHA					  ; $b81c: 48	  
	LDA $735e				; $b81d: AD 5E 73
	PHA					  ; $b820: 48	  
	LDA $7363				; $b821: AD 63 73
	BRK					  ; $b824: 00	  
	ORA #$1f				 ; $b825: 09 1F   
	BCC $b850				; $b827: 90 27   
	STX $96				  ; $b829: 86 96   
	LDA #$00				 ; $b82b: A9 00   
	BRK					  ; $b82d: 00	  
	.db $0c			  ; $b82e - Unknown opcode
	.db $1f			  ; $b82f - Unknown opcode
	BRK					  ; $b830: 00	  
	.db $04			  ; $b831 - Unknown opcode
	.db $1f			  ; $b832 - Unknown opcode
	CMP #$02				 ; $b833: C9 02	; Compare with 2
	BCS $b849				; $b835: B0 12   
	LDX $96				  ; $b837: A6 96   
	LDA #$00				 ; $b839: A9 00   
	BRK					  ; $b83b: 00	  
	PHP					  ; $b83c: 08	  
	.db $1f			  ; $b83d - Unknown opcode
	LDA tmp0				 ; $b83e: A5 00   
	BRK					  ; $b840: 00	  
	ASL					  ; $b841: 0A	  
	.db $1f			  ; $b842 - Unknown opcode
	JSR $b8d4				; $b843: 20 D4 B8 ; -> sub_B8D4
	JSR $88ca				; $b846: 20 CA 88 ; -> sub_88CA
loc_B849:
	LDX $96				  ; $b849: A6 96   
	LDA #$02				 ; $b84b: A9 02   
	BRK					  ; $b84d: 00	  
	PHP					  ; $b84e: 08	  
	.db $1f			  ; $b84f - Unknown opcode
loc_B850:
	PLA					  ; $b850: 68	  
	STA $735e				; $b851: 8D 5E 73
	PLA					  ; $b854: 68	  
	STA $735c				; $b855: 8D 5C 73
	PLA					  ; $b858: 68	  
	STA $735d				; $b859: 8D 5D 73
	BRK					  ; $b85c: 00	  
	ORA (system_flags,X)	 ; $b85d: 01 1F   
	BRK					  ; $b85f: 00	  
	ORA #$1f				 ; $b860: 09 1F   
	PLA					  ; $b862: 68	  
	BRK					  ; $b863: 00	  
	.db $0b			  ; $b864 - Unknown opcode
	.db $1f			  ; $b865 - Unknown opcode
	PLA					  ; $b866: 68	  
	BRK					  ; $b867: 00	  
	ASL					  ; $b868: 0A	  
	.db $1f			  ; $b869 - Unknown opcode
	PLA					  ; $b86a: 68	  
	STA $96				  ; $b86b: 85 96   
	RTS					  ; $b86d: 60	  
loc_B86E:
	JMP $b8f8				; $b86e: 4C F8 B8

; ---- Subroutine at $b871 (Bank 17) ----
sub_B871:
	BRK					  ; $b871: 00	  
	ORA system_flags		 ; $b872: 05 1F   
	CMP #$00				 ; $b874: C9 00	; Compare with 0
	BNE $b86e				; $b876: D0 F6   
	BRK					  ; $b878: 00	  
	.db $03			  ; $b879 - Unknown opcode
	.db $1f			  ; $b87a - Unknown opcode
	CMP #$34				 ; $b87b: C9 34	; Compare with 52
	BNE $b86e				; $b87d: D0 EF   
	LDA $72e4				; $b87f: AD E4 72
	BMI $b888				; $b882: 30 04   
	JSR $bf2e				; $b884: 20 2E BF ; -> sub_BF2E
	STX $10a0				; $b887: 8E A0 10
	BRK					  ; $b88a: 00	  
	.db $03			  ; $b88b - Unknown opcode
	.db $4f			  ; $b88c - Unknown opcode
	BRK					  ; $b88d: 00	  
	.db $e2			  ; $b88e - Unknown opcode
	.db $d3			  ; $b88f - Unknown opcode
	BRK					  ; $b890: 00	  
	JSR $abb5				; $b891: 20 B5 AB ; -> sub_ABB5
	BCC $b8fa				; $b894: 90 64   
	JSR $8c50				; $b896: 20 50 8C ; -> sub_8C50
	BCC $b8fa				; $b899: 90 5F   
	LDA $72e5				; $b89b: AD E5 72
	AND #$08				 ; $b89e: 29 08   
	BEQ $b8ae				; $b8a0: F0 0C   
	LDA $72e5				; $b8a2: AD E5 72
	AND #$f7				 ; $b8a5: 29 F7   
	STA $72e5				; $b8a7: 8D E5 72
	LDA #$e1				 ; $b8aa: A9 E1   
	BNE $b8c9				; $b8ac: D0 1B   
loc_B8AE:
	LDA #$1b				 ; $b8ae: A9 1B   
	LDX $6e44				; $b8b0: AE 44 6E
	BPL $b8b7				; $b8b3: 10 02   
	LDA #$0f				 ; $b8b5: A9 0F   
loc_B8B7:
	BRK					  ; $b8b7: 00	  
	.db $17			  ; $b8b8 - Unknown opcode
	.db $0f			  ; $b8b9 - Unknown opcode
	TAX					  ; $b8ba: AA	  
	LDA $6e44				; $b8bb: AD 44 6E
	BPL $b8c6				; $b8be: 10 06   
	LDA $b951,X			  ; $b8c0: BD 51 B9
	JMP $b8c9				; $b8c3: 4C C9 B8
loc_B8C6:
	LDA $b936,X			  ; $b8c6: BD 36 B9
loc_B8C9:
	NOP					  ; $b8c9: EA	  
	PHA					  ; $b8ca: 48	  
	JSR $b8fc				; $b8cb: 20 FC B8 ; -> sub_B8FC
	PLA					  ; $b8ce: 68	  
	BCC $b8ae				; $b8cf: 90 DD   
	BRK					  ; $b8d1: 00	  
	ASL					  ; $b8d2: 0A	  
	.db $1f			  ; $b8d3 - Unknown opcode

; ---- Subroutine at $b8d4 (Bank 17) ----
sub_B8D4:
	BRK					  ; $b8d4: 00	  
	.db $03			  ; $b8d5 - Unknown opcode
	.db $1f			  ; $b8d6 - Unknown opcode
	BRK					  ; $b8d7: 00	  
	.db $0c			  ; $b8d8 - Unknown opcode
	.db $3f			  ; $b8d9 - Unknown opcode
	BCS $b8e0				; $b8da: B0 04   
	LDA #$00				 ; $b8dc: A9 00   
	BEQ $b8eb				; $b8de: F0 0B   
loc_B8E0:
	LDX #$ff				 ; $b8e0: A2 FF   
	BRK					  ; $b8e2: 00	  
	AND #$c3				 ; $b8e3: 29 C3   
	ASL $2b00				; $b8e5: 0E 00 2B
	.db $0f			  ; $b8e8 - Unknown opcode
	ORA #$80				 ; $b8e9: 09 80   
loc_B8EB:
	STA tmp0				 ; $b8eb: 85 00   
	BRK					  ; $b8ed: 00	  
	ORA (system_flags,X)	 ; $b8ee: 01 1F   
	BRK					  ; $b8f0: 00	  
	ORA #$1f				 ; $b8f1: 09 1F   
	LDA tmp0				 ; $b8f3: A5 00   
	BRK					  ; $b8f5: 00	  
	.db $0b			  ; $b8f6 - Unknown opcode
	.db $1f			  ; $b8f7 - Unknown opcode
loc_B8F8:
	SEC					  ; $b8f8: 38	  
	RTS					  ; $b8f9: 60	  
loc_B8FA:
	CLC					  ; $b8fa: 18	  
	RTS					  ; $b8fb: 60	  

; ---- Subroutine at $b8fc (Bank 17) ----
sub_B8FC:
	CMP #$e0				 ; $b8fc: C9 E0	; Compare with 224
	BEQ $b902				; $b8fe: F0 02   
	SEC					  ; $b900: 38	  
	RTS					  ; $b901: 60	  
loc_B902:
	LDX #$03				 ; $b902: A2 03   
loc_B904:
	LDA $6e45,X			  ; $b904: BD 45 6E
	CMP #$5c				 ; $b907: C9 5C	; Compare with 92
	BEQ $b91a				; $b909: F0 0F   
	DEX					  ; $b90b: CA	  
	BPL $b904				; $b90c: 10 F6   
	LDX #$ff				 ; $b90e: A2 FF   
	BRK					  ; $b910: 00	  
	AND #$c3				 ; $b911: 29 C3   
	ORA ($d0),Y			  ; $b913: 11 D0   
	.db $04			  ; $b915 - Unknown opcode
	BRK					  ; $b916: 00	  
	.db $07			  ; $b917 - Unknown opcode
	.db $4f			  ; $b918 - Unknown opcode
	RTS					  ; $b919: 60	  
loc_B91A:
	CLC					  ; $b91a: 18	  
	RTS					  ; $b91b: 60	  

; ---- Subroutine at $b91c (Bank 17) ----
sub_B91C:
	PHA					  ; $b91c: 48	  
	LDA $72e4				; $b91d: AD E4 72
	AND #$cf				 ; $b920: 29 CF   
	ORA #$10				 ; $b922: 09 10   
	STA $72e4				; $b924: 8D E4 72
	PLA					  ; $b927: 68	  
	RTS					  ; $b928: 60	  
	PHA					  ; $b929: 48	  
	LDA $72e4				; $b92a: AD E4 72
	AND #$cf				 ; $b92d: 29 CF   
	ORA #$20				 ; $b92f: 09 20   
	STA $72e4				; $b931: 8D E4 72
	PLA					  ; $b934: 68	  
	RTS					  ; $b935: 60	  
	CMP $d6,X				; $b936: D5 D6   
	.db $d7			  ; $b938 - Unknown opcode
	CLD					  ; $b939: D8	  
	CMP $dbda,Y			  ; $b93a: D9 DA DB
	.db $dc			  ; $b93d - Unknown opcode
	CMP $dfde,X			  ; $b93e: DD DE DF
	CPX #$e2				 ; $b941: E0 E2   
	.db $e3			  ; $b943 - Unknown opcode
	CPX $e5				  ; $b944: E4 E5   
	INC $e7				  ; $b946: E6 E7   
	INX					  ; $b948: E8	  
	SBC #$eb				 ; $b949: E9 EB	; Arithmetic
	SBC $f1ef				; $b94b: ED EF F1 ; Arithmetic
	.db $f3			  ; $b94e - Unknown opcode
	SBC $57,X				; $b94f: F5 57	; Arithmetic
	DEC $d8,X				; $b951: D6 D8   
	.db $db			  ; $b953 - Unknown opcode
	DEC $e3df,X			  ; $b954: DE DF E3
	CPX $e5				  ; $b957: E4 E5   
	INC $e7				  ; $b959: E6 E7   
	INX					  ; $b95b: E8	  
	.db $eb			  ; $b95c - Unknown opcode
	.db $ef			  ; $b95d - Unknown opcode
	SBC ($f3),Y			  ; $b95e: F1 F3	; Arithmetic
	LDA $6e45				; $b960: AD 45 6E
	CMP #$ae				 ; $b963: C9 AE	; Compare with 174
	BEQ $b9c1				; $b965: F0 5A   
	BIT $629b				; $b967: 2C 9B 62
	BVS $b9c1				; $b96a: 70 55   
	LDA $629b				; $b96c: AD 9B 62
	ORA #$40				 ; $b96f: 09 40   
	STA $629b				; $b971: 8D 9B 62
	JSR $bf2e				; $b974: 20 2E BF ; -> sub_BF2E
	LDX $6500				; $b977: AE 00 65
	.db $d3			  ; $b97a - Unknown opcode
	.db $97			  ; $b97b - Unknown opcode
	BRK					  ; $b97c: 00	  
	.db $1b			  ; $b97d - Unknown opcode
	.db $2f			  ; $b97e - Unknown opcode
	LDA $7600				; $b97f: AD 00 76
	PHA					  ; $b982: 48	  
	JSR $b9c6				; $b983: 20 C6 B9 ; -> sub_B9C6
	BRK					  ; $b986: 00	  
	PLP					  ; $b987: 28	  
	.db $0f			  ; $b988 - Unknown opcode
	JSR $8786				; $b989: 20 86 87 ; -> sub_8786
	JSR $a3f7				; $b98c: 20 F7 A3 ; -> sub_A3F7
	BRK					  ; $b98f: 00	  
	BPL $b9e1				; $b990: 10 4F   
	PLA					  ; $b992: 68	  
	BRK					  ; $b993: 00	  
	.db $1c			  ; $b994 - Unknown opcode
	.db $2f			  ; $b995 - Unknown opcode
	BRK					  ; $b996: 00	  
	.db $80			  ; $b997 - Unknown opcode
	.db $fb			  ; $b998 - Unknown opcode
	LDA $72e4				; $b999: AD E4 72
	ORA #$04				 ; $b99c: 09 04   
	STA $72e4				; $b99e: 8D E4 72
	LDA $72e5				; $b9a1: AD E5 72
	BPL $b9ac				; $b9a4: 10 06   
	BRK					  ; $b9a6: 00	  
	BRK					  ; $b9a7: 00	  
	.db $fb			  ; $b9a8 - Unknown opcode
	JMP $b9b4				; $b9a9: 4C B4 B9
loc_B9AC:
	LDA $bf				  ; $b9ac: A5 BF   
	LSR					  ; $b9ae: 4A	  
	BNE $b9b4				; $b9af: D0 03   
	JSR $905b				; $b9b1: 20 5B 90 ; -> sub_905B
loc_B9B4:
	PLA					  ; $b9b4: 68	  
	PLA					  ; $b9b5: 68	  
	PLA					  ; $b9b6: 68	  
	PLA					  ; $b9b7: 68	  
	PLA					  ; $b9b8: 68	  
	PLA					  ; $b9b9: 68	  
	PLA					  ; $b9ba: 68	  
	PLA					  ; $b9bb: 68	  
	PLA					  ; $b9bc: 68	  
	PLA					  ; $b9bd: 68	  
	JMP $8053				; $b9be: 4C 53 80
loc_B9C1:
	BRK					  ; $b9c1: 00	  
	CPX $d3				  ; $b9c2: E4 D3   
	.db $1a			  ; $b9c4 - Unknown opcode
	RTS					  ; $b9c5: 60	  

; ---- Subroutine at $b9c6 (Bank 17) ----
sub_B9C6:
	LDA #$ff				 ; $b9c6: A9 FF   
	STA $0f				  ; $b9c8: 85 0F   
	JSR $b9ff				; $b9ca: 20 FF B9 ; -> sub_B9FF
	RTS					  ; $b9cd: 60	  
	LDX #$03				 ; $b9ce: A2 03   
	STX tmp0				 ; $b9d0: 86 00   
loc_B9D2:
	LDX #$ff				 ; $b9d2: A2 FF   
	BRK					  ; $b9d4: 00	  
	AND #$c3				 ; $b9d5: 29 C3   
	ASL $a548				; $b9d7: 0E 48 A5
	BRK					  ; $b9da: 00	  
	BRK					  ; $b9db: 00	  
	AND $68b3				; $b9dc: 2D B3 68
	AND $7e				  ; $b9df: 25 7E   
loc_B9E1:
	LDX #$00				 ; $b9e1: A2 00   
loc_B9E3:
	LSR					  ; $b9e3: 4A	  
	BCC $b9e7				; $b9e4: 90 01   
	INX					  ; $b9e6: E8	  
loc_B9E7:
	CMP #$00				 ; $b9e7: C9 00	; Compare with 0
	BNE $b9e3				; $b9e9: D0 F8   
	TXA					  ; $b9eb: 8A	  
	LDX tmp0				 ; $b9ec: A6 00   
	STA $6e49,X			  ; $b9ee: 9D 49 6E
	DEC tmp0				 ; $b9f1: C6 00   
	BPL $b9d2				; $b9f3: 10 DD   
	RTS					  ; $b9f5: 60	  

; ---- Subroutine at $b9f6 (Bank 17) ----
sub_B9F6:
	JSR $bafa				; $b9f6: 20 FA BA ; -> sub_BAFA
	BCC $ba08				; $b9f9: 90 0D   

; ---- Subroutine at $b9fb (Bank 17) ----
sub_B9FB:
	LDA #$00				 ; $b9fb: A9 00   
	STA $0f				  ; $b9fd: 85 0F   

; ---- Subroutine at $b9ff (Bank 17) ----
sub_B9FF:
	JSR $ba09				; $b9ff: 20 09 BA ; -> sub_BA09
	JSR $ba14				; $ba02: 20 14 BA ; -> sub_BA14
	JSR $baa1				; $ba05: 20 A1 BA ; -> sub_BAA1
loc_BA08:
	RTS					  ; $ba08: 60	  

; ---- Subroutine at $ba09 (Bank 17) ----
sub_BA09:
	LDA $bb84				; $ba09: AD 84 BB
	STA $88				  ; $ba0c: 85 88   
	LDA $bb85				; $ba0e: AD 85 BB
	STA $89				  ; $ba11: 85 89   
	RTS					  ; $ba13: 60	  

; ---- Subroutine at $ba14 (Bank 17) ----
sub_BA14:
	JSR $ba1b				; $ba14: 20 1B BA ; -> sub_BA1B
	JSR $ba31				; $ba17: 20 31 BA ; -> sub_BA31
	RTS					  ; $ba1a: 60	  

; ---- Subroutine at $ba1b (Bank 17) ----
sub_BA1B:
	LDY #$00				 ; $ba1b: A0 00   
	BIT $618e				; $ba1d: 2C 8E 61
	BVC $ba24				; $ba20: 50 02   
	LDY #$03				 ; $ba22: A0 03   
loc_BA24:
	JSR $baab				; $ba24: 20 AB BA ; -> sub_BAAB
	BIT $618e				; $ba27: 2C 8E 61
	BPL $ba2d				; $ba2a: 10 01   
	INY					  ; $ba2c: C8	  
loc_BA2D:
	JSR $baab				; $ba2d: 20 AB BA ; -> sub_BAAB
	RTS					  ; $ba30: 60	  

; ---- Subroutine at $ba31 (Bank 17) ----
sub_BA31:
	LDX #$00				 ; $ba31: A2 00   
loc_BA33:
	LDA $7397,X			  ; $ba33: BD 97 73
	BPL $ba41				; $ba36: 10 09   
	AND #$7f				 ; $ba38: 29 7F   
	STA tmp1				 ; $ba3a: 85 01   
	STA $86				  ; $ba3c: 85 86   
	JSR $ba47				; $ba3e: 20 47 BA ; -> sub_BA47
loc_BA41:
	INX					  ; $ba41: E8	  
	CPX #$0e				 ; $ba42: E0 0E   
	BNE $ba33				; $ba44: D0 ED   
	RTS					  ; $ba46: 60	  

; ---- Subroutine at $ba47 (Bank 17) ----
sub_BA47:
	TXA					  ; $ba47: 8A	  
	PHA					  ; $ba48: 48	  
	LDA #$00				 ; $ba49: A9 00   
	STA $87				  ; $ba4b: 85 87   
	LDX #$86				 ; $ba4d: A2 86   
	LDY #$06				 ; $ba4f: A0 06   
	LDA $bb82				; $ba51: AD 82 BB
	STA $0d				  ; $ba54: 85 0D   
	LDA $bb83				; $ba56: AD 83 BB
	STA $0e				  ; $ba59: 85 0E   
	SEC					  ; $ba5b: 38	  
	LDA $86				  ; $ba5c: A5 86   
	SBC #$09				 ; $ba5e: E9 09	; Arithmetic
	BCS $ba70				; $ba60: B0 0E   
	LDY #$1e				 ; $ba62: A0 1E   
	LDA $bb80				; $ba64: AD 80 BB
	STA $0d				  ; $ba67: 85 0D   
	LDA $bb81				; $ba69: AD 81 BB
	STA $0e				  ; $ba6c: 85 0E   
	LDA $86				  ; $ba6e: A5 86   
loc_BA70:
	STA $86				  ; $ba70: 85 86   
	TYA					  ; $ba72: 98	  
	JSR $c827				; $ba73: 20 27 C8 ; Call to fixed bank
	LDA $0d				  ; $ba76: A5 0D   
	LDY $0e				  ; $ba78: A4 0E   
	JSR $c81d				; $ba7a: 20 1D C8 ; Call to fixed bank
	LDY #$00				 ; $ba7d: A0 00   
	LDA tmp1				 ; $ba7f: A5 01   
	CMP #$09				 ; $ba81: C9 09	; Compare with 9
	BCC $ba87				; $ba83: 90 02   
	LDY #$04				 ; $ba85: A0 04   
loc_BA87:
	STY tmp0				 ; $ba87: 84 00   
loc_BA89:
	LDY tmp0				 ; $ba89: A4 00   
	LDA $bb76,Y			  ; $ba8b: B9 76 BB
	STA tmp2				 ; $ba8e: 85 02   
	LDA $bb7b,Y			  ; $ba90: B9 7B BB
	JSR $bab7				; $ba93: 20 B7 BA ; -> sub_BAB7
	INC tmp0				 ; $ba96: E6 00   
	LDA tmp0				 ; $ba98: A5 00   
	CMP #$05				 ; $ba9a: C9 05	; Compare with 5
	BCC $ba89				; $ba9c: 90 EB   
	PLA					  ; $ba9e: 68	  
	TAX					  ; $ba9f: AA	  
	RTS					  ; $baa0: 60	  

; ---- Subroutine at $baa1 (Bank 17) ----
sub_BAA1:
	LDY #$06				 ; $baa1: A0 06   
loc_BAA3:
	JSR $baab				; $baa3: 20 AB BA ; -> sub_BAAB
	CPY #$0b				 ; $baa6: C0 0B   
	BCC $baa3				; $baa8: 90 F9   
	RTS					  ; $baaa: 60	  

; ---- Subroutine at $baab (Bank 17) ----
sub_BAAB:
	TYA					  ; $baab: 98	  
	PHA					  ; $baac: 48	  
	JSR $bae5				; $baad: 20 E5 BA ; -> sub_BAE5
	JSR $bab7				; $bab0: 20 B7 BA ; -> sub_BAB7
	PLA					  ; $bab3: 68	  
	TAY					  ; $bab4: A8	  
	INY					  ; $bab5: C8	  
	RTS					  ; $bab6: 60	  

; ---- Subroutine at $bab7 (Bank 17) ----
sub_BAB7:
	STA tmp3				 ; $bab7: 85 03   
loc_BAB9:
	LDA $0f				  ; $bab9: A5 0F   
	BNE $bac3				; $babb: D0 06   
	JSR $bad3				; $babd: 20 D3 BA ; -> sub_BAD3
	JMP $bac6				; $bac0: 4C C6 BA
loc_BAC3:
	JSR $badc				; $bac3: 20 DC BA ; -> sub_BADC
loc_BAC6:
	INC tmp2				 ; $bac6: E6 02   
	INC $88				  ; $bac8: E6 88   
	BNE $bace				; $baca: D0 02   
	INC $89				  ; $bacc: E6 89   
loc_BACE:
	DEC tmp3				 ; $bace: C6 03   
	BNE $bab9				; $bad0: D0 E7   
	RTS					  ; $bad2: 60	  

; ---- Subroutine at $bad3 (Bank 17) ----
sub_BAD3:
	LDY tmp2				 ; $bad3: A4 02   
	LDA ($86),Y			  ; $bad5: B1 86   
	LDY #$00				 ; $bad7: A0 00   
	STA ($88),Y			  ; $bad9: 91 88   
	RTS					  ; $badb: 60	  

; ---- Subroutine at $badc (Bank 17) ----
sub_BADC:
	LDY #$00				 ; $badc: A0 00   
	LDA ($88),Y			  ; $bade: B1 88   
	LDY tmp2				 ; $bae0: A4 02   
	STA ($86),Y			  ; $bae2: 91 86   
	RTS					  ; $bae4: 60	  

; ---- Subroutine at $bae5 (Bank 17) ----
sub_BAE5:
	TYA					  ; $bae5: 98	  
	ASL					  ; $bae6: 0A	  
	TAX					  ; $bae7: AA	  
	LDA $bb55,X			  ; $bae8: BD 55 BB
	STA $86				  ; $baeb: 85 86   
	LDA $bb56,X			  ; $baed: BD 56 BB
	STA $87				  ; $baf0: 85 87   
	LDA #$00				 ; $baf2: A9 00   
	STA tmp2				 ; $baf4: 85 02   
	LDA $bb6b,Y			  ; $baf6: B9 6B BB
	RTS					  ; $baf9: 60	  

; ---- Subroutine at $bafa (Bank 17) ----
sub_BAFA:
	LDA $72e4				; $bafa: AD E4 72
	AND #$04				 ; $bafd: 29 04   
	BNE $bb53				; $baff: D0 52   
	LDX #$03				 ; $bb01: A2 03   
loc_BB03:
	LDA $72f4,X			  ; $bb03: BD F4 72
	AND #$70				 ; $bb06: 29 70   
	BNE $bb1c				; $bb08: D0 12   
	LDA $7300,X			  ; $bb0a: BD 00 73
	AND #$70				 ; $bb0d: 29 70   
	BEQ $bb28				; $bb0f: F0 17   
	CMP #$20				 ; $bb11: C9 20	; Compare with 32
	BNE $bb1c				; $bb13: D0 07   
	LDA $7324,X			  ; $bb15: BD 24 73
	CMP #$5f				 ; $bb18: C9 5F	; Compare with 95
	BEQ $bb4b				; $bb1a: F0 2F   
loc_BB1C:
	DEX					  ; $bb1c: CA	  
	BPL $bb03				; $bb1d: 10 E4   
	LDA $72e5				; $bb1f: AD E5 72
	AND #$0c				 ; $bb22: 29 0C   
	BNE $bb53				; $bb24: D0 2D   
	SEC					  ; $bb26: 38	  
	RTS					  ; $bb27: 60	  
loc_BB28:
	LDA $7324,X			  ; $bb28: BD 24 73
	CMP #$34				 ; $bb2b: C9 34	; Compare with 52
	BNE $bb1c				; $bb2d: D0 ED   
	LDA #$1c				 ; $bb2f: A9 1C   
	BRK					  ; $bb31: 00	  
	.db $17			  ; $bb32 - Unknown opcode
	.db $0f			  ; $bb33 - Unknown opcode
	CMP #$00				 ; $bb34: C9 00	; Compare with 0
	BNE $bb1c				; $bb36: D0 E4   
	LDA #$5f				 ; $bb38: A9 5F   
	STA $6f				  ; $bb3a: 85 6F   
	BRK					  ; $bb3c: 00	  
	ROR $33				  ; $bb3d: 66 33   
	BCS $bb1c				; $bb3f: B0 DB   
	LDA $72e5				; $bb41: AD E5 72
	EOR #$08				 ; $bb44: 49 08   
	STA $72e5				; $bb46: 8D E5 72
	BNE $bb1c				; $bb49: D0 D1   
loc_BB4B:
	LDA $72e5				; $bb4b: AD E5 72
	ORA #$04				 ; $bb4e: 09 04   
	STA $72e5				; $bb50: 8D E5 72
loc_BB53:
	CLC					  ; $bb53: 18	  
	RTS					  ; $bb54: 60	  
	.db $72			  ; $bb55 - Unknown opcode
	ADC ($6a,X)			  ; $bb56: 61 6A	; Arithmetic
	ADC ($6e,X)			  ; $bb58: 61 6E	; Arithmetic
	ADC ($7c,X)			  ; $bb5a: 61 7C	; Arithmetic
	ADC ($86,X)			  ; $bb5c: 61 86	; Arithmetic
	ADC ($8a,X)			  ; $bb5e: 61 8A	; Arithmetic
	ADC ($5b,X)			  ; $bb60: 61 5B	; Arithmetic
	ADC ($ee,X)			  ; $bb62: 61 EE	; Arithmetic
	.db $62			  ; $bb64 - Unknown opcode
	.db $df			  ; $bb65 - Unknown opcode
	.db $6b			  ; $bb66 - Unknown opcode
	EOR $6e				  ; $bb67: 45 6E   
	BRK					  ; $bb69: 00	  
	.db $72			  ; $bb6a - Unknown opcode
	ASL					  ; $bb6b: 0A	  
	.db $04			  ; $bb6c - Unknown opcode
	.db $04			  ; $bb6d - Unknown opcode
	ASL					  ; $bb6e: 0A	  
	.db $04			  ; $bb6f - Unknown opcode
	.db $04			  ; $bb70 - Unknown opcode
	ORA (tmp1,X)			 ; $bb71: 01 01   
	.db $0c			  ; $bb73 - Unknown opcode
	.db $04			  ; $bb74 - Unknown opcode
	SBC #$06				 ; $bb75: E9 06	; Arithmetic
	ASL					  ; $bb77: 0A	  
	.db $0c			  ; $bb78 - Unknown opcode
	.db $13			  ; $bb79 - Unknown opcode
	BRK					  ; $bb7a: 00	  
	.db $02			  ; $bb7b - Unknown opcode
	ORA (ptr0_lo,X)		  ; $bb7c: 01 04   
	PHP					  ; $bb7e: 08	  
	ORA tmp1				 ; $bb7f: 05 01   
	RTS					  ; $bb81: 60	  
	.db $0f			  ; $bb82 - Unknown opcode
	ADC ($97,X)			  ; $bb83: 61 97	; Arithmetic
	.db $73			  ; $bb85 - Unknown opcode
	LDX $7357				; $bb86: AE 57 73
	CPX #$ff				 ; $bb89: E0 FF   
	BEQ $bb93				; $bb8b: F0 06   
	BRK					  ; $bb8d: 00	  
	PLA					  ; $bb8e: 68	  
	.db $53			  ; $bb8f - Unknown opcode
	STA $7357				; $bb90: 8D 57 73
loc_BB93:
	LDX $7358				; $bb93: AE 58 73
	CPX #$ff				 ; $bb96: E0 FF   
	BEQ $bba0				; $bb98: F0 06   
	BRK					  ; $bb9a: 00	  
	PLA					  ; $bb9b: 68	  
	.db $53			  ; $bb9c - Unknown opcode
	STA $7358				; $bb9d: 8D 58 73
loc_BBA0:
	RTS					  ; $bba0: 60	  

; ---- Subroutine at $bba1 (Bank 17) ----
sub_BBA1:
	BRK					  ; $bba1: 00	  
	ORA (system_flags,X)	 ; $bba2: 01 1F   
	BMI $bbdb				; $bba4: 30 35   
	CMP $7357				; $bba6: CD 57 73
	BEQ $bbb0				; $bba9: F0 05   
	CMP $7358				; $bbab: CD 58 73
	BNE $bbdb				; $bbae: D0 2B   
loc_BBB0:
	LDA $7357				; $bbb0: AD 57 73
	CMP #$ff				 ; $bbb3: C9 FF	; Compare with 255
	BEQ $bbc1				; $bbb5: F0 0A   
	JSR $bbfa				; $bbb7: 20 FA BB ; -> sub_BBFA
	BRK					  ; $bbba: 00	  
	.db $67			  ; $bbbb - Unknown opcode
	.db $73			  ; $bbbc - Unknown opcode
	TAX					  ; $bbbd: AA	  
	BRK					  ; $bbbe: 00	  
	.db $5f			  ; $bbbf - Unknown opcode
	.db $53			  ; $bbc0 - Unknown opcode
loc_BBC1:
	LDA $7358				; $bbc1: AD 58 73
	CMP #$ff				 ; $bbc4: C9 FF	; Compare with 255
	BEQ $bbd5				; $bbc6: F0 0D   
	JSR $bc06				; $bbc8: 20 06 BC ; -> sub_BC06
	BRK					  ; $bbcb: 00	  
	.db $67			  ; $bbcc - Unknown opcode
	.db $73			  ; $bbcd - Unknown opcode
	TAX					  ; $bbce: AA	  
	LDA $7359				; $bbcf: AD 59 73
	BRK					  ; $bbd2: 00	  
	RTS					  ; $bbd3: 60	  
	.db $73			  ; $bbd4 - Unknown opcode
loc_BBD5:
	JSR $8786				; $bbd5: 20 86 87 ; -> sub_8786
	JSR $a3f7				; $bbd8: 20 F7 A3 ; -> sub_A3F7
loc_BBDB:
	BRK					  ; $bbdb: 00	  
	.db $27			  ; $bbdc - Unknown opcode
	.db $0f			  ; $bbdd - Unknown opcode
	RTS					  ; $bbde: 60	  

; ---- Subroutine at $bbdf (Bank 17) ----
sub_BBDF:
	BRK					  ; $bbdf: 00	  
	ASL system_flags		 ; $bbe0: 06 1F   
	BCS $bbeb				; $bbe2: B0 07   
	BRK					  ; $bbe4: 00	  
	ROR					  ; $bbe5: 6A	  
	.db $53			  ; $bbe6 - Unknown opcode
	BEQ $bbeb				; $bbe7: F0 02   
	CLC					  ; $bbe9: 18	  
	RTS					  ; $bbea: 60	  
loc_BBEB:
	SEC					  ; $bbeb: 38	  
	RTS					  ; $bbec: 60	  

; ---- Subroutine at $bbed (Bank 17) ----
sub_BBED:
	BRK					  ; $bbed: 00	  
	ASL system_flags		 ; $bbee: 06 1F   
	BCC $bbeb				; $bbf0: 90 F9   
	BRK					  ; $bbf2: 00	  
	AND #$c3				 ; $bbf3: 29 C3   
	ASL					  ; $bbf5: 0A	  
	BCC $bbeb				; $bbf6: 90 F3   
	CLC					  ; $bbf8: 18	  
	RTS					  ; $bbf9: 60	  

; ---- Subroutine at $bbfa (Bank 17) ----
sub_BBFA:
	PHA					  ; $bbfa: 48	  
	JSR $bc12				; $bbfb: 20 12 BC ; -> sub_BC12
	LDA $bc53,Y			  ; $bbfe: B9 53 BC
	BRK					  ; $bc01: 00	  
	CPY $68e3				; $bc02: CC E3 68
	RTS					  ; $bc05: 60	  

; ---- Subroutine at $bc06 (Bank 17) ----
sub_BC06:
	PHA					  ; $bc06: 48	  
	JSR $bc12				; $bc07: 20 12 BC ; -> sub_BC12
	LDA $bc56,Y			  ; $bc0a: B9 56 BC
	BRK					  ; $bc0d: 00	  
	CPY $68e3				; $bc0e: CC E3 68
	RTS					  ; $bc11: 60	  

; ---- Subroutine at $bc12 (Bank 17) ----
sub_BC12:
	BRK					  ; $bc12: 00	  
	.db $67			  ; $bc13 - Unknown opcode
	.db $73			  ; $bc14 - Unknown opcode
	TAX					  ; $bc15: AA	  
	LDY #$01				 ; $bc16: A0 01   
	BRK					  ; $bc18: 00	  
	LSR $93				  ; $bc19: 46 93   
	.db $07			  ; $bc1b - Unknown opcode
	BCC $bc31				; $bc1c: 90 13   
	LDY #$02				 ; $bc1e: A0 02   
	BRK					  ; $bc20: 00	  
	LSR $93				  ; $bc21: 46 93   
	ASL $b0				  ; $bc23: 06 B0   
	.db $0b			  ; $bc25 - Unknown opcode
	BRK					  ; $bc26: 00	  
	LSR $93				  ; $bc27: 46 93   
	BPL $bbdb				; $bc29: 10 B0   
	ORA $86				  ; $bc2b: 05 86   
	SBC $00a0,Y			  ; $bc2d: F9 A0 00 ; Arithmetic
	RTS					  ; $bc30: 60	  
loc_BC31:
	STX $fa				  ; $bc31: 86 FA   
	BRK					  ; $bc33: 00	  
	.db $62			  ; $bc34 - Unknown opcode
	.db $23			  ; $bc35 - Unknown opcode
	.db $03			  ; $bc36 - Unknown opcode
	STA tmp0				 ; $bc37: 85 00   
	LDX #$00				 ; $bc39: A2 00   
loc_BC3B:
	BRK					  ; $bc3b: 00	  
	LSR $83				  ; $bc3c: 46 83   
	BPL $bc43				; $bc3e: 10 03   
	BCC $bc4b				; $bc40: 90 09   
	INX					  ; $bc42: E8	  
loc_BC43:
	CPX tmp0				 ; $bc43: E4 00   
	BCC $bc3b				; $bc45: 90 F4   
	LDA #$00				 ; $bc47: A9 00   
	BEQ $bc50				; $bc49: F0 05   
loc_BC4B:
	STX $6e				  ; $bc4b: 86 6E   
	BRK					  ; $bc4d: 00	  
	ROL $850f				; $bc4e: 2E 0F 85
	SBC $2960,Y			  ; $bc51: F9 60 29 ; Arithmetic
	ROL					  ; $bc54: 2A	  
	ROR $2b				  ; $bc55: 66 2B   
	BIT $6067				; $bc57: 2C 67 60

; ---- Subroutine at $bc5a (Bank 17) ----
sub_BC5A:
	JSR $80c4				; $bc5a: 20 C4 80 ; -> sub_80C4
	BCC $bc59				; $bc5d: 90 FA   
	BRK					  ; $bc5f: 00	  
	.db $4f			  ; $bc60 - Unknown opcode
	.db $33			  ; $bc61 - Unknown opcode
	CMP #$04				 ; $bc62: C9 04	; Compare with 4
	BCC $bc59				; $bc64: 90 F3   
	BRK					  ; $bc66: 00	  
	EOR $9033,X			  ; $bc67: 5D 33 90
	INC $8ead				; $bc6a: EE AD 8E
	ADC ($29,X)			  ; $bc6d: 61 29	; Arithmetic
	.db $07			  ; $bc6f - Unknown opcode
	BNE $bc59				; $bc70: D0 E7   
	BRK					  ; $bc72: 00	  
	.db $62			  ; $bc73 - Unknown opcode
	.db $23			  ; $bc74 - Unknown opcode
	.db $43			  ; $bc75 - Unknown opcode
	BNE $bc59				; $bc76: D0 E1   
	BRK					  ; $bc78: 00	  
	.db $62			  ; $bc79 - Unknown opcode
	.db $23			  ; $bc7a - Unknown opcode
	.db $83			  ; $bc7b - Unknown opcode
	BEQ $bc59				; $bc7c: F0 DB   
	CMP #$04				 ; $bc7e: C9 04	; Compare with 4
	BCC $bc84				; $bc80: 90 02   
	LDA #$04				 ; $bc82: A9 04   
loc_BC84:
	STA tmp0				 ; $bc84: 85 00   
	LDX #$03				 ; $bc86: A2 03   
	LDA #$ff				 ; $bc88: A9 FF   
loc_BC8A:
	STA tmp1,X			   ; $bc8a: 95 01   
	DEX					  ; $bc8c: CA	  
	BPL $bc8a				; $bc8d: 10 FB   
	LDX #$00				 ; $bc8f: A2 00   
loc_BC91:
	STX $6e				  ; $bc91: 86 6E   
	LDA #$83				 ; $bc93: A9 83   
	BRK					  ; $bc95: 00	  
	AND $950f				; $bc96: 2D 0F 95
	ORA ($e8,X)			  ; $bc99: 01 E8   
	CPX tmp0				 ; $bc9b: E4 00   
	BCC $bc91				; $bc9d: 90 F2   
	LDX #$03				 ; $bc9f: A2 03   
loc_BCA1:
	LDA tmp1,X			   ; $bca1: B5 01   
	STA $6e,X				; $bca3: 95 6E   
	DEX					  ; $bca5: CA	  
	BPL $bca1				; $bca6: 10 F9   
	BRK					  ; $bca8: 00	  
	LSR $a933,X			  ; $bca9: 5E 33 A9
	BRK					  ; $bcac: 00	  
	BRK					  ; $bcad: 00	  
	ASL $6f				  ; $bcae: 06 6F   
	BRK					  ; $bcb0: 00	  
	.db $62			  ; $bcb1 - Unknown opcode
	.db $23			  ; $bcb2 - Unknown opcode
	RTI					  ; $bcb3: 40	  
	STA $8e				  ; $bcb4: 85 8E   
	LDX #$00				 ; $bcb6: A2 00   
loc_BCB8:
	TXA					  ; $bcb8: 8A	  
	PHA					  ; $bcb9: 48	  
	STX $f9				  ; $bcba: 86 F9   
	BRK					  ; $bcbc: 00	  
	EOR $93				  ; $bcbd: 45 93   
	BPL $bcc1				; $bcbf: 10 00   
loc_BCC1:
	EOR $93				  ; $bcc1: 45 93   
	ORA (tmp0),Y			 ; $bcc3: 11 00   
	EOR $93				  ; $bcc5: 45 93   
	.db $1b			  ; $bcc7 - Unknown opcode
	BRK					  ; $bcc8: 00	  
	EOR $93				  ; $bcc9: 45 93   
	.db $23			  ; $bccb - Unknown opcode
	BRK					  ; $bccc: 00	  
	EOR $93				  ; $bccd: 45 93   
	BIT tmp0				 ; $bccf: 24 00   
	EOR $93				  ; $bcd1: 45 93   
	AND tmp0				 ; $bcd3: 25 00   
	CPY $2bd3				; $bcd5: CC D3 2B
	PLA					  ; $bcd8: 68	  
	TAX					  ; $bcd9: AA	  
	INX					  ; $bcda: E8	  
	CPX $8e				  ; $bcdb: E4 8E   
	BCC $bcb8				; $bcdd: 90 D9   
	JSR $8786				; $bcdf: 20 86 87 ; -> sub_8786
	JSR $a3f7				; $bce2: 20 F7 A3 ; -> sub_A3F7
	BRK					  ; $bce5: 00	  
	.db $27			  ; $bce6 - Unknown opcode
	.db $0f			  ; $bce7 - Unknown opcode
	LDA $6e44				; $bce8: AD 44 6E
	ORA #$03				 ; $bceb: 09 03   
	STA $6e44				; $bced: 8D 44 6E
	RTS					  ; $bcf0: 60	  

; ---- Subroutine at $bcf1 (Bank 17) ----
sub_BCF1:
	BRK					  ; $bcf1: 00	  
	ORA system_flags		 ; $bcf2: 05 1F   
	CMP #$02				 ; $bcf4: C9 02	; Compare with 2
	BNE $bd4a				; $bcf6: D0 52   
	BRK					  ; $bcf8: 00	  
	.db $03			  ; $bcf9 - Unknown opcode
	.db $1f			  ; $bcfa - Unknown opcode
	AND #$7f				 ; $bcfb: 29 7F   
	CMP #$08				 ; $bcfd: C9 08	; Compare with 8
	BNE $bd4a				; $bcff: D0 49   
	BRK					  ; $bd01: 00	  
	CPX #$d3				 ; $bd02: E0 D3   
	BVS $bd06				; $bd04: 70 00   
loc_BD06:
	ASL system_flags		 ; $bd06: 06 1F   
	BCS $bd4c				; $bd08: B0 42   
	BRK					  ; $bd0a: 00	  
	.db $2b			  ; $bd0b - Unknown opcode
	.db $53			  ; $bd0c - Unknown opcode
	CMP #$02				 ; $bd0d: C9 02	; Compare with 2
	BNE $bd4c				; $bd0f: D0 3B   
	JSR $bd52				; $bd11: 20 52 BD ; -> sub_BD52
	JSR $bd83				; $bd14: 20 83 BD ; -> sub_BD83
	JSR $bf2e				; $bd17: 20 2E BF ; -> sub_BF2E
	.db $b3			  ; $bd1a - Unknown opcode
	LDA $8e				  ; $bd1b: A5 8E   
	CMP #$07				 ; $bd1d: C9 07	; Compare with 7
	BNE $bd28				; $bd1f: D0 07   
	BRK					  ; $bd21: 00	  
	CPX $d3				  ; $bd22: E4 D3   
	.db $77			  ; $bd24 - Unknown opcode
	JMP $bd2c				; $bd25: 4C 2C BD
loc_BD28:
	BRK					  ; $bd28: 00	  
	CPX $d3				  ; $bd29: E4 D3   
	.db $72			  ; $bd2b - Unknown opcode
loc_BD2C:
	LDX $8e				  ; $bd2c: A6 8E   
	LDA $bea9,X			  ; $bd2e: BD A9 BE
	BRK					  ; $bd31: 00	  
	ASL					  ; $bd32: 0A	  
	.db $1f			  ; $bd33 - Unknown opcode
	LDY #$40				 ; $bd34: A0 40   
	TAX					  ; $bd36: AA	  
	BRK					  ; $bd37: 00	  
	.db $13			  ; $bd38 - Unknown opcode
	.db $3f			  ; $bd39 - Unknown opcode
	PHA					  ; $bd3a: 48	  
	BRK					  ; $bd3b: 00	  
	ORA (system_flags,X)	 ; $bd3c: 01 1F   
	BRK					  ; $bd3e: 00	  
	ORA #$1f				 ; $bd3f: 09 1F   
	LDA #$00				 ; $bd41: A9 00   
	BRK					  ; $bd43: 00	  
	.db $0c			  ; $bd44 - Unknown opcode
	.db $1f			  ; $bd45 - Unknown opcode
	PLA					  ; $bd46: 68	  
	BRK					  ; $bd47: 00	  
	.db $0b			  ; $bd48 - Unknown opcode
	.db $1f			  ; $bd49 - Unknown opcode
loc_BD4A:
	SEC					  ; $bd4a: 38	  
	RTS					  ; $bd4b: 60	  
loc_BD4C:
	BRK					  ; $bd4c: 00	  
	CPX $d3				  ; $bd4d: E4 D3   
	ADC ($18),Y			  ; $bd4f: 71 18	; Arithmetic
	RTS					  ; $bd51: 60	  

; ---- Subroutine at $bd52 (Bank 17) ----
sub_BD52:
	LDA $72e8				; $bd52: AD E8 72
	BRK					  ; $bd55: 00	  
	.db $2b			  ; $bd56 - Unknown opcode
	.db $0f			  ; $bd57 - Unknown opcode
	BCS $bd5c				; $bd58: B0 02   
	LDA #$08				 ; $bd5a: A9 08   
loc_BD5C:
	PHA					  ; $bd5c: 48	  
	TAX					  ; $bd5d: AA	  
	BRK					  ; $bd5e: 00	  
	AND #$0f				 ; $bd5f: 29 0F   
	EOR #$ff				 ; $bd61: 49 FF   
	AND $72e8				; $bd63: 2D E8 72
	STA $72e8				; $bd66: 8D E8 72
	PLA					  ; $bd69: 68	  
	STA $8e				  ; $bd6a: 85 8E   
	ASL					  ; $bd6c: 0A	  
	ASL					  ; $bd6d: 0A	  
	ASL					  ; $bd6e: 0A	  
	ASL					  ; $bd6f: 0A	  
	SEC					  ; $bd70: 38	  
	SBC $8e				  ; $bd71: E5 8E	; Arithmetic
	TAX					  ; $bd73: AA	  
	LDY #$00				 ; $bd74: A0 00   
loc_BD76:
	LDA $be22,X			  ; $bd76: BD 22 BE
	STA $0554,Y			  ; $bd79: 99 54 05
	INX					  ; $bd7c: E8	  
	INY					  ; $bd7d: C8	  
	CPY #$0f				 ; $bd7e: C0 0F   
	BCC $bd76				; $bd80: 90 F4   
	RTS					  ; $bd82: 60	  

; ---- Subroutine at $bd83 (Bank 17) ----
sub_BD83:
	BRK					  ; $bd83: 00	  
	.db $9f			  ; $bd84 - Unknown opcode
	.db $fb			  ; $bd85 - Unknown opcode
	LDA $05fc				; $bd86: AD FC 05
	STA $8a				  ; $bd89: 85 8A   
	LDA $05fd				; $bd8b: AD FD 05
	STA $8b				  ; $bd8e: 85 8B   
	LDX #$0c				 ; $bd90: A2 0C   
loc_BD92:
	TXA					  ; $bd92: 8A	  
	PHA					  ; $bd93: 48	  
	STA $05fc				; $bd94: 8D FC 05
	CLC					  ; $bd97: 18	  
	ADC #$20				 ; $bd98: 69 20	; Arithmetic
	STA $05fd				; $bd9a: 8D FD 05
	JSR $c5b9				; $bd9d: 20 B9 C5 ; Call to fixed bank
	LDX #$04				 ; $bda0: A2 04   
	JSR $c90c				; $bda2: 20 0C C9 ; Call to fixed bank
	PLA					  ; $bda5: 68	  
	TAX					  ; $bda6: AA	  
	DEX					  ; $bda7: CA	  
	BPL $bd92				; $bda8: 10 E8   
	LDA $8b				  ; $bdaa: A5 8B   
	STA $05fd				; $bdac: 8D FD 05
	LDA $8a				  ; $bdaf: A5 8A   
	STA $05fc				; $bdb1: 8D FC 05
	JSR $c5b9				; $bdb4: 20 B9 C5 ; Call to fixed bank
	LDX #$0f				 ; $bdb7: A2 0F   
	JMP $c90c				; $bdb9: 4C 0C C9
loc_BDBC:
	JSR $bf2e				; $bdbc: 20 2E BF ; -> sub_BF2E
	STA ($a2,X)			  ; $bdbf: 81 A2   
	CLC					  ; $bdc1: 18	  
loc_BDC2:
	LDA $05fc,X			  ; $bdc2: BD FC 05
	STA $0364,X			  ; $bdc5: 9D 64 03
	DEX					  ; $bdc8: CA	  
	BPL $bdc2				; $bdc9: 10 F7   
	LDX #$0b				 ; $bdcb: A2 0B   
loc_BDCD:
	TXA					  ; $bdcd: 8A	  
	PHA					  ; $bdce: 48	  
	LDA #$30				 ; $bdcf: A9 30   
	LDY #$18				 ; $bdd1: A0 18   
loc_BDD3:
	STA $05fc,Y			  ; $bdd3: 99 FC 05
	DEY					  ; $bdd6: 88	  
	BNE $bdd3				; $bdd7: D0 FA   
	JSR $c5b9				; $bdd9: 20 B9 C5 ; Call to fixed bank
	LDX #$01				 ; $bddc: A2 01   
	JSR $c90c				; $bdde: 20 0C C9 ; Call to fixed bank
	JSR $bdee				; $bde1: 20 EE BD ; -> sub_BDEE
	LDX #$01				 ; $bde4: A2 01   
	JSR $c90c				; $bde6: 20 0C C9 ; Call to fixed bank
	PLA					  ; $bde9: 68	  
	TAX					  ; $bdea: AA	  
	DEX					  ; $bdeb: CA	  
	BPL $bdcd				; $bdec: 10 DF   

; ---- Subroutine at $bdee (Bank 17) ----
sub_BDEE:
	LDX #$18				 ; $bdee: A2 18   
loc_BDF0:
	LDA $0364,X			  ; $bdf0: BD 64 03
	STA $05fc,X			  ; $bdf3: 9D FC 05
	DEX					  ; $bdf6: CA	  
	BPL $bdf0				; $bdf7: 10 F7   
	JMP $c5b9				; $bdf9: 4C B9 C5
	JSR $a1a9				; $bdfc: 20 A9 A1 ; -> sub_A1A9
	RTS					  ; $bdff: 60	  
	BRK					  ; $be00: 00	  
	.db $07			  ; $be01 - Unknown opcode
	.db $1f			  ; $be02 - Unknown opcode
	BCS $be21				; $be03: B0 1C   
	BRK					  ; $be05: 00	  
	ORA ($53,X)			  ; $be06: 01 53   
	JSR $c891				; $be08: 20 91 C8 ; Call to fixed bank
	AND #$3f				 ; $be0b: 29 3F   
	ADC #$40				 ; $be0d: 69 40	; Arithmetic
	LDX #$72				 ; $be0f: A2 72   
	BRK					  ; $be11: 00	  
	BPL $be53				; $be12: 10 3F   
	LDA $73				  ; $be14: A5 73   
	STA $7361				; $be16: 8D 61 73
	LDA $74				  ; $be19: A5 74   
	STA $7362				; $be1b: 8D 62 73
	JSR $90db				; $be1e: 20 DB 90 ; -> sub_90DB
loc_BE21:
	RTS					  ; $be21: 60	  
	ROL $1d1f				; $be22: 2E 1F 1D
	ASL $0d13,X			  ; $be25: 1E 13 0D
	.db $0f			  ; $be28 - Unknown opcode
	RTI					  ; $be29: 40	  
	BRK					  ; $be2a: 00	  
	BRK					  ; $be2b: 00	  
	BRK					  ; $be2c: 00	  
	BRK					  ; $be2d: 00	  
	BRK					  ; $be2e: 00	  
	BRK					  ; $be2f: 00	  
	BRK					  ; $be30: 00	  
	.db $37			  ; $be31 - Unknown opcode
	ASL $0f1c,X			  ; $be32: 1E 1C 0F
	CLC					  ; $be35: 18	  
	ORA ($1e),Y			  ; $be36: 11 1E   
	.db $12			  ; $be38 - Unknown opcode
	RTI					  ; $be39: 40	  
	BRK					  ; $be3a: 00	  
	BRK					  ; $be3b: 00	  
	BRK					  ; $be3c: 00	  
	BRK					  ; $be3d: 00	  
	BRK					  ; $be3e: 00	  
	BRK					  ; $be3f: 00	  
	AND #$20				 ; $be40: 29 20   
	.db $13			  ; $be42 - Unknown opcode
	ASL $40,X				; $be43: 16 40   
	BRK					  ; $be45: 00	  
	BRK					  ; $be46: 00	  
	BRK					  ; $be47: 00	  
	BRK					  ; $be48: 00	  
	BRK					  ; $be49: 00	  
	BRK					  ; $be4a: 00	  
	BRK					  ; $be4b: 00	  
	BRK					  ; $be4c: 00	  
	BRK					  ; $be4d: 00	  
	BRK					  ; $be4e: 00	  
	ASL $0f12,X			  ; $be4f: 1E 12 0F
	BRK					  ; $be52: 00	  
loc_BE53:
	SEC					  ; $be53: 38	  
	ORA $0f21,Y			  ; $be54: 19 21 0F
	.db $1c			  ; $be57 - Unknown opcode
	RTI					  ; $be58: 40	  
	BRK					  ; $be59: 00	  
	BRK					  ; $be5a: 00	  
	BRK					  ; $be5b: 00	  
	BRK					  ; $be5c: 00	  
	BRK					  ; $be5d: 00	  
	ASL $0f12,X			  ; $be5e: 1E 12 0F
	BRK					  ; $be61: 00	  
	.db $37			  ; $be62 - Unknown opcode
	ASL $1c0b,X			  ; $be63: 1E 0B 1C
	ORA $0040,X			  ; $be66: 1D 40 00
	BRK					  ; $be69: 00	  
	BRK					  ; $be6a: 00	  
	BRK					  ; $be6b: 00	  
	BRK					  ; $be6c: 00	  
	ASL $0f12,X			  ; $be6d: 1E 12 0F
	BRK					  ; $be70: 00	  
	AND ($19),Y			  ; $be71: 31 19   
	ORA $4018,Y			  ; $be73: 19 18 40
	BRK					  ; $be76: 00	  
	BRK					  ; $be77: 00	  
	BRK					  ; $be78: 00	  
	BRK					  ; $be79: 00	  
	BRK					  ; $be7a: 00	  
	BRK					  ; $be7b: 00	  
	ASL $0f12,X			  ; $be7c: 1E 12 0F
	BRK					  ; $be7f: 00	  
	.db $37			  ; $be80 - Unknown opcode
	.db $1f			  ; $be81 - Unknown opcode
	CLC					  ; $be82: 18	  
	RTI					  ; $be83: 40	  
	BRK					  ; $be84: 00	  
	BRK					  ; $be85: 00	  
	BRK					  ; $be86: 00	  
	BRK					  ; $be87: 00	  
	BRK					  ; $be88: 00	  
	BRK					  ; $be89: 00	  
	BRK					  ; $be8a: 00	  
	BRK					  ; $be8b: 00	  
	BRK					  ; $be8c: 00	  
	BRK					  ; $be8d: 00	  
	BRK					  ; $be8e: 00	  
	BRK					  ; $be8f: 00	  
	BRK					  ; $be90: 00	  
	BRK					  ; $be91: 00	  
	BRK					  ; $be92: 00	  
	BRK					  ; $be93: 00	  
	BRK					  ; $be94: 00	  
	BRK					  ; $be95: 00	  
	BRK					  ; $be96: 00	  
	BRK					  ; $be97: 00	  
	BRK					  ; $be98: 00	  
	BRK					  ; $be99: 00	  
	ASL $0f12,X			  ; $be9a: 1E 12 0F
	BRK					  ; $be9d: 00	  
	SEC					  ; $be9e: 38	  
	.db $0f			  ; $be9f - Unknown opcode
	.db $1c			  ; $bea0 - Unknown opcode
	.db $17			  ; $bea1 - Unknown opcode
	.db $13			  ; $bea2 - Unknown opcode
	CLC					  ; $bea3: 18	  
	.db $0b			  ; $bea4 - Unknown opcode
	ASL $1c19,X			  ; $bea5: 1E 19 1C
	RTI					  ; $bea8: 40	  
	SBC $f8fc,Y			  ; $bea9: F9 FC F8 ; Arithmetic
	.db $fb			  ; $beac - Unknown opcode
	.db $e3			  ; $bead - Unknown opcode
	SBC $4cfe,X			  ; $beae: FD FE 4C ; Arithmetic
	.db $fa			  ; $beb1 - Unknown opcode

; ---- Subroutine at $beb2 (Bank 17) ----
sub_BEB2:
	LDX #$00				 ; $beb2: A2 00   
	STX $0f				  ; $beb4: 86 0F   
loc_BEB6:
	LDA $72f4,X			  ; $beb6: BD F4 72
	AND #$70				 ; $beb9: 29 70   
	CMP #$70				 ; $bebb: C9 70	; Compare with 112
	BEQ $beeb				; $bebd: F0 2C   
	LDA $72f4,X			  ; $bebf: BD F4 72
	BMI $bed0				; $bec2: 30 0C   
	AND #$0f				 ; $bec4: 29 0F   
	BRK					  ; $bec6: 00	  
	.db $67			  ; $bec7 - Unknown opcode
	.db $73			  ; $bec8 - Unknown opcode
	TAX					  ; $bec9: AA	  
	BRK					  ; $beca: 00	  
	.db $14			  ; $becb - Unknown opcode
	.db $53			  ; $becc - Unknown opcode
	JMP $bed6				; $becd: 4C D6 BE
loc_BED0:
	AND #$0f				 ; $bed0: 29 0F   
	TAX					  ; $bed2: AA	  
	BRK					  ; $bed3: 00	  
	ASL $85b3				; $bed4: 0E B3 85
	BRK					  ; $bed7: 00	  
	LSR					  ; $bed8: 4A	  
	LSR					  ; $bed9: 4A	  
	STA tmp1				 ; $beda: 85 01   
	LDA tmp0				 ; $bedc: A5 00   
	SEC					  ; $bede: 38	  
	SBC tmp1				 ; $bedf: E5 01	; Arithmetic
	BRK					  ; $bee1: 00	  
	.db $17			  ; $bee2 - Unknown opcode
	.db $0f			  ; $bee3 - Unknown opcode
	CLC					  ; $bee4: 18	  
	ADC tmp1				 ; $bee5: 65 01	; Arithmetic
	LDX $0f				  ; $bee7: A6 0F   
	STA tmp2,X			   ; $bee9: 95 02   
loc_BEEB:
	LDA $7348,X			  ; $beeb: BD 48 73
	ORA #$0f				 ; $beee: 09 0F   
	STA $7348,X			  ; $bef0: 9D 48 73
	INX					  ; $bef3: E8	  
	STX $0f				  ; $bef4: 86 0F   
	CPX #$0c				 ; $bef6: E0 0C   
	BNE $beb6				; $bef8: D0 BC   
	LDY #$00				 ; $befa: A0 00   
loc_BEFC:
	LDA #$00				 ; $befc: A9 00   
	STA $0e				  ; $befe: 85 0E   
	LDX #$0b				 ; $bf00: A2 0B   
loc_BF02:
	LDA $7348,X			  ; $bf02: BD 48 73
	AND #$0f				 ; $bf05: 29 0F   
	CMP #$0f				 ; $bf07: C9 0F	; Compare with 15
	BNE $bf17				; $bf09: D0 0C   
	LDA tmp2,X			   ; $bf0b: B5 02   
	CMP $0e				  ; $bf0d: C5 0E   
	BEQ $bf13				; $bf0f: F0 02   
	BCC $bf17				; $bf11: 90 04   
loc_BF13:
	STA $0e				  ; $bf13: 85 0E   
	STX $0f				  ; $bf15: 86 0F   
loc_BF17:
	DEX					  ; $bf17: CA	  
	BPL $bf02				; $bf18: 10 E8   
	LDX $0f				  ; $bf1a: A6 0F   
	STY tmp0				 ; $bf1c: 84 00   
	LDA $7348,X			  ; $bf1e: BD 48 73
	AND #$f0				 ; $bf21: 29 F0   
	ORA tmp0				 ; $bf23: 05 00   
	STA $7348,X			  ; $bf25: 9D 48 73
	INY					  ; $bf28: C8	  
	CPY #$0c				 ; $bf29: C0 0C   
	BNE $befc				; $bf2b: D0 CF   
	RTS					  ; $bf2d: 60	  

; ---- Subroutine at $bf2e (Bank 17) ----
sub_BF2E:
	TSX					  ; $bf2e: BA	  
	CLC					  ; $bf2f: 18	  
	LDA $0101,X			  ; $bf30: BD 01 01
	ADC #$01				 ; $bf33: 69 01	; Arithmetic
	STA tmp0				 ; $bf35: 85 00   
	LDA $0102,X			  ; $bf37: BD 02 01
	ADC #$00				 ; $bf3a: 69 00	; Arithmetic
	STA tmp1				 ; $bf3c: 85 01   
	LDY #$00				 ; $bf3e: A0 00   
	LDA (tmp0),Y			 ; $bf40: B1 00   
	PHA					  ; $bf42: 48	  
	LDA tmp0				 ; $bf43: A5 00   
	STA $0101,X			  ; $bf45: 9D 01 01
	LDA tmp1				 ; $bf48: A5 01   
	STA $0102,X			  ; $bf4a: 9D 02 01
	BRK					  ; $bf4d: 00	  
	.db $13			  ; $bf4e - Unknown opcode
	.db $2f			  ; $bf4f - Unknown opcode
loc_BF50:
	PLA					  ; $bf50: 68	  
	BRK					  ; $bf51: 00	  
	.db $03			  ; $bf52 - Unknown opcode
	.db $9f			  ; $bf53 - Unknown opcode
	RTS					  ; $bf54: 60	  

; ---- Subroutine at $bf55 (Bank 17) ----
sub_BF55:
	PHA					  ; $bf55: 48	  
	BRK					  ; $bf56: 00	  
	.db $13			  ; $bf57 - Unknown opcode
	.db $2f			  ; $bf58 - Unknown opcode
	JMP $bf50				; $bf59: 4C 50 BF
	LDA $6bde				; $bf5c: AD DE 6B
	ORA #$80				 ; $bf5f: 09 80   
	STA $6bde				; $bf61: 8D DE 6B
	BIT $c000				; $bf64: 2C 00 C0
	BVS $bfae				; $bf67: 70 45   
loc_BF69:
	BRK					  ; $bf69: 00	  
	.db $07			  ; $bf6a - Unknown opcode
	.db $6f			  ; $bf6b - Unknown opcode
	BRK					  ; $bf6c: 00	  
	CMP #$ff				 ; $bf6d: C9 FF	; Compare with 255
	BEQ $bf69				; $bf6f: F0 F8   
	BNE $bf77				; $bf71: D0 04   
loc_BF73:
	BRK					  ; $bf73: 00	  
	.db $07			  ; $bf74 - Unknown opcode
	.db $6f			  ; $bf75 - Unknown opcode
	BRK					  ; $bf76: 00	  
loc_BF77:
	CMP #$ff				 ; $bf77: C9 FF	; Compare with 255
	BEQ $bf73				; $bf79: F0 F8   
	CMP #$f0				 ; $bf7b: C9 F0	; Compare with 240
	BEQ $bfae				; $bf7d: F0 2F   
	STA $8a				  ; $bf7f: 85 8A   
loc_BF81:
	BRK					  ; $bf81: 00	  
	.db $07			  ; $bf82 - Unknown opcode
	.db $6f			  ; $bf83 - Unknown opcode
	BRK					  ; $bf84: 00	  
	CMP #$ff				 ; $bf85: C9 FF	; Compare with 255
	BEQ $bfa2				; $bf87: F0 19   
	LDX $8a				  ; $bf89: A6 8A   
	STA $6e45,X			  ; $bf8b: 9D 45 6E
loc_BF8E:
	BRK					  ; $bf8e: 00	  
	.db $07			  ; $bf8f - Unknown opcode
	.db $6f			  ; $bf90 - Unknown opcode
	BRK					  ; $bf91: 00	  
	CMP #$00				 ; $bf92: C9 00	; Compare with 0
	BEQ $bf8e				; $bf94: F0 F8   
	CMP #$ff				 ; $bf96: C9 FF	; Compare with 255
	BEQ $bf81				; $bf98: F0 E7   
	LDX $8a				  ; $bf9a: A6 8A   

; ---- Subroutine at $bf9c (Bank 17) ----
sub_BF9C:
	STA $6e49,X			  ; $bf9c: 9D 49 6E
	JMP $bf73				; $bf9f: 4C 73 BF
loc_BFA2:
	LDX $8a				  ; $bfa2: A6 8A   
	STA $6e45,X			  ; $bfa4: 9D 45 6E
	LDA #$00				 ; $bfa7: A9 00   
	STA $6e49,X			  ; $bfa9: 9D 49 6E
	BEQ $bf73				; $bfac: F0 C5   
loc_BFAE:
	JMP $c54e				; $bfae: 4C 4E C5
	.db $ff			  ; $bfb1 - Unknown opcode
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
