; Dragon Warrior 4 (NES) - Bank 19 Complete Disassembly
; Battle System Code

; Bank loaded at $8000-$bfff
; ROM offset: $4c000 - $4ffff

; Auto-generated with labels and comments

; ======================================================================
; DISASSEMBLY
; ======================================================================

$8000:  38			SEC				 
							  ; Data region
		.db $80, $73
$8003:  B5 6B		 LDA $6b,X		   
$8005:  B6 2E		 LDX $2e,Y		   
							  ; Data region
		.db $b7, $32, $b7
$800a:  E4 B5		 CPX $b5			 
$800c:  18			CLC				 
							  ; Data region
		.db $b7, $89
$800f:  B4 53		 LDY $53,X		   
$8011:  B5 0B		 LDA $0b,X		   
$8013:  B9 15 B9	  LDA spell_p1_tbl,Y  ; Spell param 1 table
$8016:  66 B0		 ROR $b0			 
$8018:  30 B9		 BMI $7fd3		   
							  ; Data region
		.db $37
$801b:  B9 49 B9	  LDA spell_p2_tbl,Y  ; Spell param 2 table
							  ; Data region
		.db $e3, $b7, $66, $83, $b6, $89, $f4, $83, $97, $a7, $62
$8029:  B4 CB		 LDY $cb,X		   
							  ; Data region
		.db $bb
$802c:  EA			NOP				 
$802d:  BC E3 BD	  LDY $bde3,X		 
$8030:  81 BE		 STA ($be,X)		 
$8032:  A8			TAY				 
$8033:  BE 21 BF	  LDX $bf21,Y		 
$8036:  65 BF		 ADC $bf			 
btl_entry:					 ; $8038
$8038:  20 88 80	  JSR rd_tactics	  ; Read tactics
$803b:  20 A1 80	  JSR chk_char		; Check character state
$803e:  90 09		 BCC $8049		   
$8040:  20 4A 80	  JSR btl_setup	   ; Battle setup
$8043:  20 12 92	  JSR sum_stats	   ; Sum party stats
$8046:  20 5B 80	  JSR dispatch		; Dispatch action
$8049:  60			RTS				 

; --------------------------------------------------
; Battle setup
; --------------------------------------------------
btl_setup:					 ; $804a
$804a:  20 51 80	  JSR init_vars	   ; Initialize battle vars
$804d:  20 5A 84	  JSR btl_calc		; Battle calculation
$8050:  60			RTS				 

; --------------------------------------------------
; Initialize battle vars
; --------------------------------------------------
init_vars:					 ; $8051
$8051:  A2 FF		 LDX #$ff			
$8053:  00			BRK				 
$8054:  29 C3		 AND #$c3			
$8056:  0E 8D 77	  ASL $778d		   
$8059:  75 60		 ADC $60,X		   
dispatch:					 ; $805b
$805b:  AD 80 6E	  LDA action_type	 ; Current action type
$805e:  C9 04		 CMP #$04			
$8060:  F0 13		 BEQ mode4_jmp	   ; -> Mode 4 jump
$8062:  AD E8 75	  LDA spell_idx	   ; Spell index
$8065:  0A			ASL				 
$8066:  AA			TAX				 
$8067:  BD 78 80	  LDA act_table,X	 ; Action jump table
$806a:  85 00		 STA tmp0			; Temporary 0
$806c:  BD 79 80	  LDA $8079,X		 
$806f:  85 01		 STA tmp1			; Temporary 1
$8071:  6C 00 00	  JMP (tmp0)		  ; Temporary 0

; --------------------------------------------------
; Action 0 - NOP
; --------------------------------------------------
act_nop:					 ; $8074
$8074:  60			RTS				 

; --------------------------------------------------
; Mode 4 jump
; --------------------------------------------------
mode4_jmp:					 ; $8075
$8075:  4C C6 A8	  JMP $a8c6		   

; --------------------------------------------------
; Action jump table
; --------------------------------------------------
act_table:					 ; $8078
							  ; Data region
		.db $74, $80, $f0, $af, $97, $af
$807e:  10 AF		 BPL $802f		   
$8080:  48			PHA				 
							  ; Data region
		.db $af
$8082:  49 B0		 EOR #$b0			
$8084:  49 B0		 EOR #$b0			
$8086:  49 B0		 EOR #$b0			
rd_tactics:					 ; $8088
$8088:  AD 5B 61	  LDA tactics		 ; Battle tactics setting
$808b:  8D 80 6E	  STA action_type	 ; Current action type
$808e:  F0 04		 BEQ $8094		   
$8090:  C9 02		 CMP #$02			
$8092:  D0 0A		 BNE $809e		   
$8094:  AD 44 6E	  LDA btl_mode		; Battle mode flag
$8097:  10 05		 BPL $809e		   
$8099:  A9 06		 LDA #$06			
$809b:  8D 80 6E	  STA action_type	 ; Current action type
$809e:  60			RTS				 
$809f:  18			CLC				 
$80a0:  60			RTS				 

; --------------------------------------------------
; Check character state
; --------------------------------------------------
chk_char:					 ; $80a1
$80a1:  A6 96		 LDX active_char	 ; Active character index
$80a3:  BD F4 72	  LDA char_state,X	; Character state array
$80a6:  29 70		 AND #$70			
$80a8:  C9 10		 CMP #$10			
$80aa:  D0 F3		 BNE $809f		   
$80ac:  00			BRK				 
$80ad:  06 1F		 ASL $1f			 
$80af:  B0 EE		 BCS $809f		   
$80b1:  00			BRK				 
$80b2:  46 93		 LSR btl_flags	   ; Battle calculation flags
							  ; Data region
		.db $07
$80b5:  90 E8		 BCC $809f		   
$80b7:  00			BRK				 
$80b8:  46 93		 LSR btl_flags	   ; Battle calculation flags
$80ba:  06 B0		 ASL $b0			 
							  ; Data region
		.db $e2
$80bd:  00			BRK				 
$80be:  46 93		 LSR btl_flags	   ; Battle calculation flags
$80c0:  10 B0		 BPL $8072		   
							  ; Data region
		.db $dc
$80c3:  00			BRK				 
$80c4:  46 93		 LSR btl_flags	   ; Battle calculation flags
$80c6:  11 B0		 ORA ($b0),Y		 
$80c8:  D6 00		 DEC $00,X		   
$80ca:  46 93		 LSR btl_flags	   ; Battle calculation flags
							  ; Data region
		.db $23
$80cd:  B0 D0		 BCS $809f		   
$80cf:  00			BRK				 
$80d0:  46 93		 LSR btl_flags	   ; Battle calculation flags
$80d2:  24 B0		 BIT $b0			 
$80d4:  CA			DEX				 
$80d5:  00			BRK				 
$80d6:  46 93		 LSR btl_flags	   ; Battle calculation flags
$80d8:  25 B0		 AND $b0			 
$80da:  C4 00		 CPY tmp0			; Temporary 0
$80dc:  46 93		 LSR btl_flags	   ; Battle calculation flags
							  ; Data region
		.db $12
$80df:  B0 BE		 BCS $809f		   
$80e1:  00			BRK				 
							  ; Data region
		.db $2b, $53
$80e4:  C9 08		 CMP #$08			
$80e6:  B0 B7		 BCS $809f		   
$80e8:  8D E8 75	  STA spell_idx	   ; Spell index
$80eb:  00			BRK				 
							  ; Data region
		.db $07, $73
$80ee:  8D DC 75	  STA $75dc		   
$80f1:  A5 73		 LDA $73			 
$80f3:  F0 05		 BEQ clr_btl		 ; -> Clear battle vars
$80f5:  A9 FF		 LDA #$ff			
$80f7:  8D DC 75	  STA $75dc		   
clr_btl:					 ; $80fa
$80fa:  A2 00		 LDX #$00			
$80fc:  8E D4 75	  STX damage_lo	   ; Damage output low
$80ff:  8E D5 75	  STX damage_hi	   ; Damage output high
$8102:  8E D7 75	  STX $75d7		   
$8105:  8E D8 75	  STX $75d8		   
$8108:  8E D9 75	  STX actor		   ; Acting character
$810b:  8E DA 75	  STX act_cat		 ; Action category
$810e:  8E E6 75	  STX $75e6		   
$8111:  8E E7 75	  STX $75e7		   
$8114:  CA			DEX				 
$8115:  8E DB 75	  STX act_id		  ; Action ID
$8118:  00			BRK				 
$8119:  06 1F		 ASL $1f			 
$811b:  B0 82		 BCS $809f		   
$811d:  20 11 AE	  JSR $ae11		   
$8120:  00			BRK				 
							  ; Data region
		.db $62, $23
$8123:  41 85		 EOR ($85,X)		 
							  ; Data region
		.db $92
$8126:  A2 80		 LDX #$80			
$8128:  00			BRK				 
$8129:  29 C3		 AND #$c3			
$812b:  0E 8D E9	  ASL $e98d		   
$812e:  75 A9		 ADC $a9,X		   
$8130:  00			BRK				 
$8131:  A2 03		 LDX #$03			
$8133:  9D 91 75	  STA $7591,X		 
$8136:  9D 95 75	  STA $7595,X		 
$8139:  CA			DEX				 
$813a:  10 F7		 BPL $8133		   
$813c:  00			BRK				 
							  ; Data region
		.db $62, $23
$813f:  40			RTI				 
$8140:  85 8A		 STA char_count	  ; Character count
$8142:  A2 00		 LDX #$00			
$8144:  00			BRK				 
$8145:  46 93		 LSR btl_flags	   ; Battle calculation flags
							  ; Data region
		.db $07
$8148:  90 25		 BCC $816f		   
$814a:  A9 10		 LDA #$10			
$814c:  9D 91 75	  STA $7591,X		 
$814f:  9D 95 75	  STA $7595,X		 
$8152:  00			BRK				 
$8153:  46 93		 LSR btl_flags	   ; Battle calculation flags
$8155:  16 B0		 ASL $b0,X		   
$8157:  06 00		 ASL tmp0			; Temporary 0
$8159:  46 93		 LSR btl_flags	   ; Battle calculation flags
							  ; Data region
		.db $17
$815c:  90 05		 BCC $8163		   
$815e:  A9 00		 LDA #$00			
$8160:  9D 95 75	  STA $7595,X		 
$8163:  00			BRK				 
$8164:  46 93		 LSR btl_flags	   ; Battle calculation flags
$8166:  19 90 06	  ORA $0690,Y		 
$8169:  5E 91 75	  LSR $7591,X		 
$816c:  5E 95 75	  LSR $7595,X		 
$816f:  E8			INX				 
$8170:  E4 8A		 CPX char_count	  ; Character count
$8172:  90 D0		 BCC $8144		   
$8174:  38			SEC				 
$8175:  60			RTS				 

; --------------------------------------------------
; Multiply by 16
; --------------------------------------------------
mul16:					 ; $8176
$8176:  16 00		 ASL $00,X		   
$8178:  36 01		 ROL $01,X		   
$817a:  16 00		 ASL $00,X		   
$817c:  36 01		 ROL $01,X		   
$817e:  16 00		 ASL $00,X		   
$8180:  36 01		 ROL $01,X		   
$8182:  16 00		 ASL $00,X		   
$8184:  36 01		 ROL $01,X		   
$8186:  60			RTS				 

; --------------------------------------------------
; Divide by 16
; --------------------------------------------------
div16:					 ; $8187
$8187:  56 01		 LSR $01,X		   
$8189:  76 00		 ROR $00,X		   
$818b:  56 01		 LSR $01,X		   
$818d:  76 00		 ROR $00,X		   
$818f:  56 01		 LSR $01,X		   
$8191:  76 00		 ROR $00,X		   
$8193:  56 01		 LSR $01,X		   
$8195:  76 00		 ROR $00,X		   
$8197:  60			RTS				 

; --------------------------------------------------
; Scale stat value
; --------------------------------------------------
scale_stat:					 ; $8198
$8198:  A2 94		 LDX #$94			
sub_819A:
$819a:  C9 00		 CMP #$00			
$819c:  F0 20		 BEQ $81be		   
$819e:  C9 10		 CMP #$10			
$81a0:  F0 1B		 BEQ $81bd		   
$81a2:  20 30 83	  JSR mult_a		  ; Multiply by A
shift_ext:					 ; $81a5
$81a5:  46 19		 LSR mult_hi		 ; Product high
$81a7:  76 01		 ROR $01,X		   
$81a9:  76 00		 ROR $00,X		   
$81ab:  46 19		 LSR mult_hi		 ; Product high
$81ad:  76 01		 ROR $01,X		   
$81af:  76 00		 ROR $00,X		   
$81b1:  46 19		 LSR mult_hi		 ; Product high
$81b3:  76 01		 ROR $01,X		   
$81b5:  76 00		 ROR $00,X		   
$81b7:  46 19		 LSR mult_hi		 ; Product high
$81b9:  76 01		 ROR $01,X		   
$81bb:  76 00		 ROR $00,X		   
$81bd:  60			RTS				 
$81be:  A9 00		 LDA #$00			
$81c0:  95 00		 STA $00,X		   
$81c2:  95 01		 STA $01,X		   
$81c4:  60			RTS				 

; ------------------------------
sub_81C5:
$81c5:  20 31 82	  JSR $8231		   
$81c8:  C9 01		 CMP #$01			
$81ca:  F0 13		 BEQ $81df		   
$81cc:  C9 02		 CMP #$02			
$81ce:  F0 0B		 BEQ $81db		   
$81d0:  C9 04		 CMP #$04			
$81d2:  F0 03		 BEQ $81d7		   
$81d4:  4C 27 C8	  JMP $c827		   
$81d7:  06 94		 ASL $94			 
$81d9:  26 95		 ROL $95			 
$81db:  06 94		 ASL $94			 
$81dd:  26 95		 ROL $95			 
$81df:  60			RTS				 

; ------------------------------
sub_81E0:
$81e0:  20 31 82	  JSR $8231		   
$81e3:  C9 01		 CMP #$01			
$81e5:  F0 13		 BEQ $81fa		   
$81e7:  C9 02		 CMP #$02			
$81e9:  F0 0B		 BEQ $81f6		   
$81eb:  C9 04		 CMP #$04			
$81ed:  F0 03		 BEQ $81f2		   
$81ef:  4C 51 C8	  JMP $c851		   
$81f2:  46 95		 LSR $95			 
$81f4:  66 94		 ROR $94			 
$81f6:  46 95		 LSR $95			 
$81f8:  66 94		 ROR $94			 
$81fa:  60			RTS				 
$81fb:  20 33 82	  JSR $8233		   
$81fe:  C9 01		 CMP #$01			
$8200:  F0 13		 BEQ $8215		   
$8202:  C9 02		 CMP #$02			
$8204:  F0 0B		 BEQ $8211		   
$8206:  C9 04		 CMP #$04			
$8208:  F0 03		 BEQ $820d		   
$820a:  4C 27 C8	  JMP $c827		   
$820d:  16 00		 ASL $00,X		   
$820f:  36 01		 ROL $01,X		   
$8211:  16 00		 ASL $00,X		   
$8213:  36 01		 ROL $01,X		   
$8215:  60			RTS				 

; ------------------------------
sub_8216:
$8216:  20 33 82	  JSR $8233		   
$8219:  C9 01		 CMP #$01			
$821b:  F0 13		 BEQ $8230		   
$821d:  C9 02		 CMP #$02			
$821f:  F0 0B		 BEQ $822c		   
$8221:  C9 04		 CMP #$04			
$8223:  F0 03		 BEQ $8228		   
$8225:  4C 51 C8	  JMP $c851		   
$8228:  56 01		 LSR $01,X		   
$822a:  76 00		 ROR $00,X		   
$822c:  56 01		 LSR $01,X		   
$822e:  76 00		 ROR $00,X		   
$8230:  60			RTS				 

; ------------------------------
sub_8231:
$8231:  A2 94		 LDX #$94			
sub_8233:
$8233:  A5 92		 LDA $92			 
$8235:  60			RTS				 

; ------------------------------
sub_8236:
$8236:  AD 9A 75	  LDA $759a		   
$8239:  A2 94		 LDX #$94			
$823b:  C9 FF		 CMP #$ff			
$823d:  F0 0B		 BEQ $824a		   
$823f:  20 30 83	  JSR mult_a		  ; Multiply by A
$8242:  A5 95		 LDA $95			 
$8244:  85 94		 STA $94			 
$8246:  A5 19		 LDA mult_hi		 ; Product high
$8248:  85 95		 STA $95			 
$824a:  60			RTS				 
$824b:  20 36 82	  JSR $8236		   
$824e:  A5 94		 LDA $94			 
$8250:  18			CLC				 
$8251:  6D AD 75	  ADC btl_ad		  ; Battle stat AD
$8254:  8D AD 75	  STA btl_ad		  ; Battle stat AD
$8257:  A5 95		 LDA $95			 
$8259:  6D AE 75	  ADC $75ae		   
$825c:  8D AE 75	  STA $75ae		   
$825f:  60			RTS				 
$8260:  20 36 82	  JSR $8236		   
$8263:  A5 94		 LDA $94			 
$8265:  18			CLC				 
$8266:  6D AF 75	  ADC $75af		   
$8269:  8D AF 75	  STA $75af		   
$826c:  A5 95		 LDA $95			 
$826e:  6D B0 75	  ADC $75b0		   
$8271:  8D B0 75	  STA $75b0		   
$8274:  60			RTS				 

; ------------------------------
sub_8275:
$8275:  20 36 82	  JSR $8236		   
$8278:  A5 94		 LDA $94			 
$827a:  18			CLC				 
$827b:  6D B5 75	  ADC $75b5		   
$827e:  8D B5 75	  STA $75b5		   
$8281:  A5 95		 LDA $95			 
$8283:  6D B6 75	  ADC $75b6		   
$8286:  8D B6 75	  STA $75b6		   
$8289:  60			RTS				 

; ------------------------------
sub_828A:
$828a:  20 36 82	  JSR $8236		   
$828d:  A5 94		 LDA $94			 
$828f:  18			CLC				 
$8290:  6D B7 75	  ADC $75b7		   
$8293:  8D B7 75	  STA $75b7		   
$8296:  A5 95		 LDA $95			 
$8298:  6D B8 75	  ADC $75b8		   
$829b:  8D B8 75	  STA $75b8		   
$829e:  60			RTS				 
$829f:  20 36 82	  JSR $8236		   
$82a2:  A5 94		 LDA $94			 
$82a4:  18			CLC				 
$82a5:  6D B9 75	  ADC $75b9		   
$82a8:  8D B9 75	  STA $75b9		   
$82ab:  A5 95		 LDA $95			 
$82ad:  6D BA 75	  ADC $75ba		   
$82b0:  8D BA 75	  STA $75ba		   
$82b3:  60			RTS				 
$82b4:  20 36 82	  JSR $8236		   
$82b7:  A5 94		 LDA $94			 
$82b9:  18			CLC				 
$82ba:  6D BB 75	  ADC $75bb		   
$82bd:  8D BB 75	  STA $75bb		   
$82c0:  A5 95		 LDA $95			 
$82c2:  6D BC 75	  ADC $75bc		   
$82c5:  8D BC 75	  STA $75bc		   
$82c8:  60			RTS				 

; ------------------------------
sub_82C9:
$82c9:  20 36 82	  JSR $8236		   
$82cc:  A5 94		 LDA $94			 
$82ce:  18			CLC				 
$82cf:  6D B1 75	  ADC $75b1		   
$82d2:  8D B1 75	  STA $75b1		   
$82d5:  A5 95		 LDA $95			 
$82d7:  6D B2 75	  ADC $75b2		   
$82da:  8D B2 75	  STA $75b2		   
$82dd:  60			RTS				 

; ------------------------------
sub_82DE:
$82de:  20 36 82	  JSR $8236		   
$82e1:  A5 94		 LDA $94			 
$82e3:  18			CLC				 
$82e4:  6D B3 75	  ADC $75b3		   
$82e7:  8D B3 75	  STA $75b3		   
$82ea:  A5 95		 LDA $95			 
$82ec:  6D B4 75	  ADC $75b4		   
$82ef:  8D B4 75	  STA $75b4		   
$82f2:  60			RTS				 
$82f3:  20 36 82	  JSR $8236		   
$82f6:  A5 94		 LDA $94			 
$82f8:  18			CLC				 
$82f9:  6D BD 75	  ADC $75bd		   
$82fc:  8D BD 75	  STA $75bd		   
$82ff:  A5 95		 LDA $95			 
$8301:  6D BE 75	  ADC $75be		   
$8304:  8D BE 75	  STA $75be		   
$8307:  60			RTS				 
$8308:  20 36 82	  JSR $8236		   
$830b:  A5 94		 LDA $94			 
$830d:  18			CLC				 
$830e:  6D BF 75	  ADC $75bf		   
$8311:  8D BF 75	  STA $75bf		   
$8314:  A5 95		 LDA $95			 
$8316:  6D C0 75	  ADC $75c0		   
$8319:  8D C0 75	  STA $75c0		   
$831c:  60			RTS				 

; ------------------------------
sub_831D:
$831d:  A5 82		 LDA inner_loop	  ; Inner loop counter
$831f:  0A			ASL				 
$8320:  85 0A		 STA $0a			 
$8322:  98			TYA				 
$8323:  65 0A		 ADC $0a			 
$8325:  A8			TAY				 
$8326:  A5 94		 LDA $94			 
$8328:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$832a:  C8			INY				 
$832b:  A5 95		 LDA $95			 
$832d:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$832f:  60			RTS				 

; --------------------------------------------------
; Multiply by A
; --------------------------------------------------
mult_a:					 ; $8330
$8330:  85 16		 STA mult_a		  ; Multiplier A
$8332:  A9 00		 LDA #$00			
$8334:  85 17		 STA mult_lo		 ; Product low
$8336:  85 18		 STA mult_mid		; Product mid
$8338:  85 19		 STA mult_hi		 ; Product high
$833a:  85 1A		 STA mult_ext		; Product extended
$833c:  46 16		 LSR mult_a		  ; Multiplier A
$833e:  90 13		 BCC $8353		   
$8340:  B5 00		 LDA $00,X		   
$8342:  18			CLC				 
$8343:  65 17		 ADC mult_lo		 ; Product low
$8345:  85 17		 STA mult_lo		 ; Product low
$8347:  B5 01		 LDA $01,X		   
$8349:  65 18		 ADC mult_mid		; Product mid
$834b:  85 18		 STA mult_mid		; Product mid
$834d:  A5 19		 LDA mult_hi		 ; Product high
$834f:  65 1A		 ADC mult_ext		; Product extended
$8351:  85 19		 STA mult_hi		 ; Product high
$8353:  16 00		 ASL $00,X		   
$8355:  36 01		 ROL $01,X		   
$8357:  26 1A		 ROL mult_ext		; Product extended
$8359:  A5 16		 LDA mult_a		  ; Multiplier A
$835b:  D0 DF		 BNE $833c		   
$835d:  A5 17		 LDA mult_lo		 ; Product low
$835f:  95 00		 STA $00,X		   
$8361:  A5 18		 LDA mult_mid		; Product mid
$8363:  95 01		 STA $01,X		   
$8365:  60			RTS				 

; --------------------------------------------------
; Multiply pair
; --------------------------------------------------
mult_pair:					 ; $8366
$8366:  85 16		 STA mult_a		  ; Multiplier A
$8368:  A9 00		 LDA #$00			
$836a:  85 17		 STA mult_lo		 ; Product low
$836c:  85 18		 STA mult_mid		; Product mid
$836e:  85 19		 STA mult_hi		 ; Product high
$8370:  85 1A		 STA mult_ext		; Product extended
$8372:  85 1B		 STA $1b			 
$8374:  46 16		 LSR mult_a		  ; Multiplier A
$8376:  90 19		 BCC $8391		   
$8378:  B5 00		 LDA $00,X		   
$837a:  18			CLC				 
$837b:  65 17		 ADC mult_lo		 ; Product low
$837d:  85 17		 STA mult_lo		 ; Product low
$837f:  B5 01		 LDA $01,X		   
$8381:  65 18		 ADC mult_mid		; Product mid
$8383:  85 18		 STA mult_mid		; Product mid
$8385:  B5 02		 LDA $02,X		   
$8387:  65 19		 ADC mult_hi		 ; Product high
$8389:  85 19		 STA mult_hi		 ; Product high
$838b:  A5 1A		 LDA mult_ext		; Product extended
$838d:  65 1B		 ADC $1b			 
$838f:  85 1A		 STA mult_ext		; Product extended
$8391:  16 00		 ASL $00,X		   
$8393:  36 01		 ROL $01,X		   
$8395:  36 02		 ROL $02,X		   
$8397:  26 1B		 ROL $1b			 
$8399:  A5 16		 LDA mult_a		  ; Multiplier A
$839b:  D0 D7		 BNE $8374		   
$839d:  A5 17		 LDA mult_lo		 ; Product low
$839f:  95 00		 STA $00,X		   
$83a1:  A5 18		 LDA mult_mid		; Product mid
$83a3:  95 01		 STA $01,X		   
$83a5:  A5 19		 LDA mult_hi		 ; Product high
$83a7:  95 02		 STA $02,X		   
$83a9:  60			RTS				 

; --------------------------------------------------
; Add 16-bit pairs
; --------------------------------------------------
add_pairs:					 ; $83aa
$83aa:  B9 00 00	  LDA tmp0,Y		  ; Temporary 0
$83ad:  8D 14 6E	  STA div_div_lo	  ; Division divisor low
$83b0:  B9 01 00	  LDA tmp1,Y		  ; Temporary 1
$83b3:  8D 15 6E	  STA div_div_mid	 ; Division divisor mid
$83b6:  98			TYA				 
$83b7:  48			PHA				 
$83b8:  A0 10		 LDY #$10			
$83ba:  A9 00		 LDA #$00			
$83bc:  8D 16 6E	  STA div_div_hi	  ; Division divisor high
$83bf:  8D 11 6E	  STA div_rem_lo	  ; Division remainder low
$83c2:  8D 12 6E	  STA div_rem_mid	 ; Division remainder mid
div16_lp:					 ; $83c5
$83c5:  16 00		 ASL $00,X		   
$83c7:  36 01		 ROL $01,X		   
$83c9:  2E 11 6E	  ROL div_rem_lo	  ; Division remainder low
$83cc:  2E 12 6E	  ROL div_rem_mid	 ; Division remainder mid
$83cf:  F6 00		 INC $00,X		   
$83d1:  AD 11 6E	  LDA div_rem_lo	  ; Division remainder low
$83d4:  38			SEC				 
$83d5:  ED 14 6E	  SBC div_div_lo	  ; Division divisor low
$83d8:  48			PHA				 
$83d9:  AD 12 6E	  LDA div_rem_mid	 ; Division remainder mid
$83dc:  ED 15 6E	  SBC div_div_mid	 ; Division divisor mid
$83df:  B0 06		 BCS $83e7		   
$83e1:  68			PLA				 
$83e2:  D6 00		 DEC $00,X		   
$83e4:  4C EE 83	  JMP $83ee		   
$83e7:  8D 12 6E	  STA div_rem_mid	 ; Division remainder mid
$83ea:  68			PLA				 
$83eb:  8D 11 6E	  STA div_rem_lo	  ; Division remainder low
$83ee:  88			DEY				 
$83ef:  D0 D4		 BNE div16_lp		; -> Division loop 16-bit
$83f1:  68			PLA				 
$83f2:  A8			TAY				 
$83f3:  60			RTS				 

; --------------------------------------------------
; 24-bit div setup
; --------------------------------------------------
div24_set:					 ; $83f4
$83f4:  A9 00		 LDA #$00			
$83f6:  8D 16 6E	  STA div_div_hi	  ; Division divisor high
$83f9:  B9 00 00	  LDA tmp0,Y		  ; Temporary 0
$83fc:  8D 14 6E	  STA div_div_lo	  ; Division divisor low
$83ff:  B9 01 00	  LDA tmp1,Y		  ; Temporary 1
$8402:  8D 15 6E	  STA div_div_mid	 ; Division divisor mid
$8405:  98			TYA				 
$8406:  48			PHA				 
$8407:  A0 18		 LDY #$18			
$8409:  A9 00		 LDA #$00			
$840b:  8D 11 6E	  STA div_rem_lo	  ; Division remainder low
$840e:  8D 12 6E	  STA div_rem_mid	 ; Division remainder mid
$8411:  8D 13 6E	  STA div_rem_hi	  ; Division remainder high
div24_lp:					 ; $8414
$8414:  16 00		 ASL $00,X		   
$8416:  36 01		 ROL $01,X		   
$8418:  36 02		 ROL $02,X		   
$841a:  2E 11 6E	  ROL div_rem_lo	  ; Division remainder low
$841d:  2E 12 6E	  ROL div_rem_mid	 ; Division remainder mid
$8420:  2E 13 6E	  ROL div_rem_hi	  ; Division remainder high
$8423:  F6 00		 INC $00,X		   
$8425:  AD 11 6E	  LDA div_rem_lo	  ; Division remainder low
$8428:  38			SEC				 
$8429:  ED 14 6E	  SBC div_div_lo	  ; Division divisor low
$842c:  48			PHA				 
$842d:  AD 12 6E	  LDA div_rem_mid	 ; Division remainder mid
$8430:  ED 15 6E	  SBC div_div_mid	 ; Division divisor mid
$8433:  48			PHA				 
$8434:  AD 13 6E	  LDA div_rem_hi	  ; Division remainder high
$8437:  ED 16 6E	  SBC div_div_hi	  ; Division divisor high
$843a:  B0 07		 BCS $8443		   
$843c:  68			PLA				 
$843d:  68			PLA				 
$843e:  D6 00		 DEC $00,X		   
$8440:  4C 4E 84	  JMP $844e		   
$8443:  8D 13 6E	  STA div_rem_hi	  ; Division remainder high
$8446:  68			PLA				 
$8447:  8D 12 6E	  STA div_rem_mid	 ; Division remainder mid
$844a:  68			PLA				 
$844b:  8D 11 6E	  STA div_rem_lo	  ; Division remainder low
$844e:  88			DEY				 
$844f:  D0 C3		 BNE div24_lp		; -> 24-bit division loop
$8451:  68			PLA				 
$8452:  A8			TAY				 
$8453:  60			RTS				 

; --------------------------------------------------
; 3-byte division
; --------------------------------------------------
div_3byte:					 ; $8454
$8454:  B9 02 00	  LDA tmp2,Y		  ; Temporary 2
$8457:  4C F6 83	  JMP $83f6		   

; --------------------------------------------------
; Battle calculation
; --------------------------------------------------
btl_calc:					 ; $845a
$845a:  00			BRK				 
							  ; Data region
		.db $12, $8f
$845d:  20 88 84	  JSR helper_8488	 ; Unknown helper
$8460:  A2 FF		 LDX #$ff			
$8462:  00			BRK				 
$8463:  29 C3		 AND #$c3			
$8465:  0E 8D 78	  ASL $788d		   
$8468:  75 00		 ADC $00,X		   
$846a:  29 C3		 AND #$c3			
							  ; Data region
		.db $0f
$846d:  2D 78 75	  AND $7578		   
$8470:  8D 78 75	  STA $7578		   
$8473:  20 17 85	  JSR $8517		   
$8476:  A9 00		 LDA #$00			
$8478:  85 93		 STA btl_flags	   ; Battle calculation flags
$847a:  20 A8 84	  JSR $84a8		   
$847d:  E6 93		 INC btl_flags	   ; Battle calculation flags
$847f:  A5 93		 LDA btl_flags	   ; Battle calculation flags
$8481:  C9 08		 CMP #$08			
$8483:  90 F5		 BCC $847a		   
$8485:  4C 26 8F	  JMP $8f26		   

; --------------------------------------------------
; Unknown helper
; --------------------------------------------------
helper_8488:					 ; $8488
$8488:  A2 39		 LDX #$39			
$848a:  A9 00		 LDA #$00			
$848c:  9D 00 76	  STA $7600,X		 
$848f:  9D 3A 76	  STA $763a,X		 
$8492:  9D 74 76	  STA $7674,X		 
$8495:  9D AE 76	  STA $76ae,X		 
$8498:  9D E8 76	  STA $76e8,X		 
$849b:  9D 22 77	  STA $7722,X		 
$849e:  9D 5C 77	  STA $775c,X		 
$84a1:  9D 96 77	  STA $7796,X		 
$84a4:  CA			DEX				 
$84a5:  10 E5		 BPL $848c		   
$84a7:  60			RTS				 

; ------------------------------
sub_84A8:
$84a8:  20 0C 85	  JSR $850c		   
$84ab:  A6 93		 LDX btl_flags	   ; Battle calculation flags
$84ad:  00			BRK				 
$84ae:  29 C3		 AND #$c3			
							  ; Data region
		.db $0c
$84b1:  B0 30		 BCS $84e3		   
$84b3:  A2 05		 LDX #$05			
$84b5:  A5 93		 LDA btl_flags	   ; Battle calculation flags
$84b7:  0A			ASL				 
$84b8:  85 00		 STA tmp0			; Temporary 0
$84ba:  0A			ASL				 
$84bb:  65 00		 ADC tmp0			; Temporary 0
$84bd:  85 00		 STA tmp0			; Temporary 0
$84bf:  8A			TXA				 
$84c0:  65 00		 ADC tmp0			; Temporary 0
$84c2:  A8			TAY				 
$84c3:  B9 C2 6D	  LDA $6dc2,Y		 
$84c6:  F0 15		 BEQ $84dd		   
$84c8:  8D 9A 75	  STA $759a		   
$84cb:  B9 8C 6D	  LDA $6d8c,Y		 
$84ce:  C9 FF		 CMP #$ff			
$84d0:  F0 0B		 BEQ $84dd		   
$84d2:  8D 99 75	  STA $7599		   
$84d5:  A8			TAY				 
$84d6:  8A			TXA				 
$84d7:  48			PHA				 
$84d8:  20 E9 84	  JSR $84e9		   
$84db:  68			PLA				 
$84dc:  AA			TAX				 
$84dd:  CA			DEX				 
$84de:  10 D5		 BPL $84b5		   
$84e0:  4C 3C 8D	  JMP $8d3c		   
$84e3:  20 9B 85	  JSR $859b		   
$84e6:  4C 3C 8D	  JMP $8d3c		   

; ------------------------------
sub_84E9:
$84e9:  AD 99 85	  LDA $8599		   
$84ec:  85 00		 STA tmp0			; Temporary 0
$84ee:  AD 9A 85	  LDA $859a		   
$84f1:  85 01		 STA tmp1			; Temporary 1
$84f3:  A2 00		 LDX #$00			
$84f5:  98			TYA				 
$84f6:  48			PHA				 
$84f7:  20 13 C8	  JSR $c813		   
$84fa:  68			PLA				 
$84fb:  20 13 C8	  JSR $c813		   
$84fe:  A0 00		 LDY #$00			
$8500:  B1 00		 LDA (tmp0),Y		; Temporary 0
$8502:  85 02		 STA tmp2			; Temporary 2
$8504:  C8			INY				 
$8505:  B1 00		 LDA (tmp0),Y		; Temporary 0
$8507:  85 03		 STA tmp3			; Temporary 3
$8509:  6C 02 00	  JMP (tmp2)		  ; Temporary 2

; ------------------------------
sub_850C:
$850c:  A9 00		 LDA #$00			
$850e:  A2 2D		 LDX #$2d			
$8510:  9D A3 75	  STA $75a3,X		 
$8513:  CA			DEX				 
$8514:  10 FA		 BPL $8510		   
$8516:  60			RTS				 

; ------------------------------
sub_8517:
$8517:  A2 07		 LDX #$07			
$8519:  A9 10		 LDA #$10			
$851b:  9D 79 75	  STA $7579,X		 
$851e:  9D 81 75	  STA $7581,X		 
$8521:  9D 89 75	  STA $7589,X		 
$8524:  CA			DEX				 
$8525:  10 F4		 BPL $851b		   
$8527:  AD 78 75	  LDA $7578		   
$852a:  85 00		 STA tmp0			; Temporary 0
$852c:  A2 00		 LDX #$00			
$852e:  46 00		 LSR tmp0			; Temporary 0
$8530:  90 54		 BCC $8586		   
$8532:  A9 20		 LDA #$20			
$8534:  20 F2 85	  JSR $85f2		   
$8537:  D0 46		 BNE $857f		   
$8539:  A9 04		 LDA #$04			
$853b:  20 EE 85	  JSR $85ee		   
$853e:  D0 3F		 BNE $857f		   
$8540:  A9 02		 LDA #$02			
$8542:  20 F6 85	  JSR $85f6		   
$8545:  D0 38		 BNE $857f		   
$8547:  A9 01		 LDA #$01			
$8549:  20 EE 85	  JSR $85ee		   
$854c:  20 8D 85	  JSR $858d		   
$854f:  A9 08		 LDA #$08			
$8551:  20 F2 85	  JSR $85f2		   
$8554:  20 93 85	  JSR $8593		   
$8557:  A9 08		 LDA #$08			
$8559:  20 EE 85	  JSR $85ee		   
$855c:  F0 05		 BEQ $8563		   
$855e:  A9 00		 LDA #$00			
$8560:  9D 81 75	  STA $7581,X		 
$8563:  A9 10		 LDA #$10			
$8565:  20 EE 85	  JSR $85ee		   
$8568:  F0 05		 BEQ $856f		   
$856a:  A9 06		 LDA #$06			
$856c:  9D 89 75	  STA $7589,X		 
$856f:  A9 20		 LDA #$20			
$8571:  20 EE 85	  JSR $85ee		   
$8574:  F0 03		 BEQ $8579		   
$8576:  1E 89 75	  ASL $7589,X		 
$8579:  E8			INX				 
$857a:  E0 08		 CPX #$08			
$857c:  90 B0		 BCC $852e		   
$857e:  60			RTS				 
$857f:  A9 01		 LDA #$01			
$8581:  9D 79 75	  STA $7579,X		 
$8584:  D0 F3		 BNE $8579		   
$8586:  A9 00		 LDA #$00			
$8588:  9D 79 75	  STA $7579,X		 
$858b:  F0 EC		 BEQ $8579		   
sub_858D:
$858d:  F0 03		 BEQ $8592		   
$858f:  5E 79 75	  LSR $7579,X		 
$8592:  60			RTS				 

; ------------------------------
sub_8593:
$8593:  F0 FD		 BEQ $8592		   
$8595:  1E 79 75	  ASL $7579,X		 
$8598:  60			RTS				 
							  ; Data region
		.db $8b, $8b

; ------------------------------
sub_859B:
$859b:  A9 FF		 LDA #$ff			
$859d:  8D 9A 75	  STA $759a		   
$85a0:  A6 93		 LDX btl_flags	   ; Battle calculation flags
$85a2:  20 9C 89	  JSR $899c		   
$85a5:  A0 05		 LDY #$05			
$85a7:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$85a9:  29 08		 AND #$08			
$85ab:  D0 38		 BNE $85e5		   
$85ad:  A0 09		 LDY #$09			
$85af:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$85b1:  29 0F		 AND #$0f			
$85b3:  20 AB 8A	  JSR $8aab		   
$85b6:  C9 09		 CMP #$09			
$85b8:  B0 2E		 BCS $85e8		   
$85ba:  48			PHA				 
$85bb:  29 07		 AND #$07			
$85bd:  C9 05		 CMP #$05			
$85bf:  68			PLA				 
$85c0:  B0 23		 BCS $85e5		   
$85c2:  48			PHA				 
$85c3:  20 B6 89	  JSR get_act		 ; Get action data
$85c6:  A0 05		 LDY #$05			
$85c8:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$85ca:  C9 32		 CMP #$32			
$85cc:  90 02		 BCC $85d0		   
$85ce:  A9 32		 LDA #$32			
$85d0:  85 94		 STA $94			 
$85d2:  A9 00		 LDA #$00			
$85d4:  85 95		 STA $95			 
$85d6:  68			PLA				 
$85d7:  29 07		 AND #$07			
$85d9:  AA			TAX				 
$85da:  BD E9 85	  LDA $85e9,X		 
$85dd:  A2 94		 LDX #$94			
$85df:  20 27 C8	  JSR $c827		   
$85e2:  20 76 8C	  JSR $8c76		   
$85e5:  4C 92 B3	  JMP $b392		   
$85e8:  60			RTS				 
$85e9:  05 03		 ORA tmp3			; Temporary 3
							  ; Data region
		.db $03, $04, $04
sub_85EE:
$85ee:  A0 05		 LDY #$05			
$85f0:  D0 06		 BNE $85f8		   
sub_85F2:
$85f2:  A0 06		 LDY #$06			
$85f4:  D0 02		 BNE $85f8		   
sub_85F6:
$85f6:  A0 07		 LDY #$07			
$85f8:  85 76		 STA $76			 
$85fa:  20 9C 89	  JSR $899c		   
$85fd:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$85ff:  25 76		 AND $76			 
$8601:  60			RTS				 

; ------------------------------
sub_8602:
$8602:  A0 0D		 LDY #$0d			
$8604:  A6 81		 LDX party_loop	  ; Party loop counter
$8606:  20 9C 89	  JSR $899c		   
$8609:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$860b:  29 03		 AND #$03			
$860d:  C5 8D		 CMP $8d			 
$860f:  60			RTS				 

; ------------------------------
sub_8610:
$8610:  20 6B 8A	  JSR $8a6b		   
$8613:  90 36		 BCC $864b		   
$8615:  A0 01		 LDY #$01			
$8617:  A2 00		 LDX #$00			
$8619:  4C 41 86	  JMP $8641		   

; ------------------------------
sub_861C:
$861c:  20 6B 8A	  JSR $8a6b		   
$861f:  90 2A		 BCC $864b		   
$8621:  C9 09		 CMP #$09			
$8623:  90 18		 BCC $863d		   
$8625:  A5 79		 LDA action_ptr_lo   ; Action data pointer low
$8627:  48			PHA				 
$8628:  A5 7A		 LDA action_ptr_hi   ; Action data pointer high
$862a:  48			PHA				 
$862b:  20 BB 86	  JSR $86bb		   
$862e:  85 02		 STA tmp2			; Temporary 2
$8630:  AD 64 73	  LDA $7364		   
$8633:  85 03		 STA tmp3			; Temporary 3
$8635:  68			PLA				 
$8636:  85 7A		 STA action_ptr_hi   ; Action data pointer high
$8638:  68			PLA				 
$8639:  85 79		 STA action_ptr_lo   ; Action data pointer low
$863b:  38			SEC				 
$863c:  60			RTS				 
$863d:  A0 0C		 LDY #$0c			
$863f:  A2 02		 LDX #$02			
sub_8641:
$8641:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8643:  95 00		 STA $00,X		   
$8645:  C8			INY				 
$8646:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8648:  95 01		 STA $01,X		   
$864a:  38			SEC				 
$864b:  60			RTS				 

; ------------------------------
sub_864C:
$864c:  A9 00		 LDA #$00			
$864e:  85 00		 STA tmp0			; Temporary 0
$8650:  85 01		 STA tmp1			; Temporary 1
$8652:  20 32 8A	  JSR $8a32		   
$8655:  A0 03		 LDY #$03			
$8657:  98			TYA				 
$8658:  48			PHA				 
$8659:  BD 6A 61	  LDA btl_action,X	; Battle action data
$865c:  10 15		 BPL $8673		   
$865e:  29 0F		 AND #$0f			
$8660:  20 B6 89	  JSR get_act		 ; Get action data
$8663:  A0 01		 LDY #$01			
$8665:  18			CLC				 
$8666:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8668:  65 00		 ADC tmp0			; Temporary 0
$866a:  85 00		 STA tmp0			; Temporary 0
$866c:  C8			INY				 
$866d:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$866f:  65 01		 ADC tmp1			; Temporary 1
$8671:  85 01		 STA tmp1			; Temporary 1
$8673:  68			PLA				 
$8674:  A8			TAY				 
$8675:  E8			INX				 
$8676:  88			DEY				 
$8677:  10 DE		 BPL $8657		   
$8679:  60			RTS				 

; ------------------------------
sub_867A:
$867a:  A9 00		 LDA #$00			
$867c:  85 02		 STA tmp2			; Temporary 2
$867e:  85 03		 STA tmp3			; Temporary 3
$8680:  20 32 8A	  JSR $8a32		   
$8683:  A0 03		 LDY #$03			
$8685:  98			TYA				 
$8686:  48			PHA				 
$8687:  BD 6A 61	  LDA btl_action,X	; Battle action data
$868a:  10 28		 BPL $86b4		   
$868c:  29 0F		 AND #$0f			
$868e:  48			PHA				 
$868f:  20 B6 89	  JSR get_act		 ; Get action data
$8692:  68			PLA				 
$8693:  C9 09		 CMP #$09			
$8695:  90 06		 BCC $869d		   
$8697:  20 BB 86	  JSR $86bb		   
$869a:  4C A8 86	  JMP $86a8		   
$869d:  A0 0D		 LDY #$0d			
$869f:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$86a1:  29 03		 AND #$03			
$86a3:  8D 64 73	  STA $7364		   
$86a6:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$86a8:  18			CLC				 
$86a9:  65 02		 ADC tmp2			; Temporary 2
$86ab:  85 02		 STA tmp2			; Temporary 2
$86ad:  AD 64 73	  LDA $7364		   
$86b0:  65 03		 ADC tmp3			; Temporary 3
$86b2:  85 03		 STA tmp3			; Temporary 3
$86b4:  68			PLA				 
$86b5:  A8			TAY				 
$86b6:  E8			INX				 
$86b7:  88			DEY				 
$86b8:  10 CB		 BPL $8685		   
$86ba:  60			RTS				 

; ------------------------------
sub_86BB:
$86bb:  A0 05		 LDY #$05			
$86bd:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$86bf:  A0 0F		 LDY #$0f			
$86c1:  A2 04		 LDX #$04			
$86c3:  00			BRK				 
							  ; Data region
		.db $13, $8f
$86c6:  60			RTS				 

; ------------------------------
sub_86C7:
$86c7:  20 9C 89	  JSR $899c		   
$86ca:  A0 0A		 LDY #$0a			
$86cc:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$86ce:  85 00		 STA tmp0			; Temporary 0
$86d0:  C8			INY				 
$86d1:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$86d3:  85 01		 STA tmp1			; Temporary 1
$86d5:  60			RTS				 

; ------------------------------
sub_86D6:
$86d6:  A5 82		 LDA inner_loop	  ; Inner loop counter
$86d8:  20 6B 8A	  JSR $8a6b		   
$86db:  90 07		 BCC $86e4		   
$86dd:  A2 00		 LDX #$00			
$86df:  A0 03		 LDY #$03			
$86e1:  4C 41 86	  JMP $8641		   
$86e4:  60			RTS				 

; ------------------------------
sub_86E5:
$86e5:  A9 00		 LDA #$00			
$86e7:  85 00		 STA tmp0			; Temporary 0
$86e9:  85 01		 STA tmp1			; Temporary 1
$86eb:  20 32 8A	  JSR $8a32		   
$86ee:  A0 03		 LDY #$03			
$86f0:  98			TYA				 
$86f1:  48			PHA				 
$86f2:  BD 6A 61	  LDA btl_action,X	; Battle action data
$86f5:  10 1B		 BPL $8712		   
$86f7:  29 0F		 AND #$0f			
$86f9:  20 B6 89	  JSR get_act		 ; Get action data
$86fc:  A0 00		 LDY #$00			
$86fe:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8700:  10 10		 BPL $8712		   
$8702:  A0 03		 LDY #$03			
$8704:  18			CLC				 
$8705:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8707:  65 00		 ADC tmp0			; Temporary 0
$8709:  85 00		 STA tmp0			; Temporary 0
$870b:  C8			INY				 
$870c:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$870e:  65 01		 ADC tmp1			; Temporary 1
$8710:  85 01		 STA tmp1			; Temporary 1
$8712:  68			PLA				 
$8713:  A8			TAY				 
$8714:  E8			INX				 
$8715:  88			DEY				 
$8716:  10 D8		 BPL $86f0		   
$8718:  60			RTS				 

; ------------------------------
sub_8719:
$8719:  A5 82		 LDA inner_loop	  ; Inner loop counter
$871b:  20 6B 8A	  JSR $8a6b		   
$871e:  90 16		 BCC $8736		   
sub_8720:
$8720:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$8723:  A2 0C		 LDX #$0c			
$8725:  A0 01		 LDY #$01			
$8727:  20 41 86	  JSR $8641		   
$872a:  A0 05		 LDY #$05			
$872c:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$872e:  29 20		 AND #$20			
$8730:  F0 04		 BEQ $8736		   
$8732:  06 0C		 ASL $0c			 
$8734:  26 0D		 ROL $0d			 
$8736:  60			RTS				 

; ------------------------------
sub_8737:
$8737:  A9 D4		 LDA #$d4			
$8739:  D0 02		 BNE $873d		   
sub_873B:
$873b:  A9 14		 LDA #$14			
$873d:  85 0B		 STA $0b			 
$873f:  A9 00		 LDA #$00			
$8741:  85 0C		 STA $0c			 
$8743:  85 0D		 STA $0d			 
$8745:  20 32 8A	  JSR $8a32		   
$8748:  A0 03		 LDY #$03			
$874a:  98			TYA				 
$874b:  48			PHA				 
$874c:  8A			TXA				 
$874d:  48			PHA				 
$874e:  BD 6A 61	  LDA btl_action,X	; Battle action data
$8751:  10 29		 BPL $877c		   
$8753:  29 0F		 AND #$0f			
$8755:  20 48 8A	  JSR $8a48		   
$8758:  D0 22		 BNE $877c		   
$875a:  A5 00		 LDA tmp0			; Temporary 0
$875c:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$875f:  A0 05		 LDY #$05			
$8761:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8763:  25 0B		 AND $0b			 
$8765:  D0 15		 BNE $877c		   
$8767:  20 5D 8A	  JSR $8a5d		   
$876a:  D0 10		 BNE $877c		   
$876c:  A0 01		 LDY #$01			
$876e:  18			CLC				 
$876f:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8771:  65 0C		 ADC $0c			 
$8773:  85 0C		 STA $0c			 
$8775:  C8			INY				 
$8776:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8778:  65 0D		 ADC $0d			 
$877a:  85 0D		 STA $0d			 
$877c:  68			PLA				 
$877d:  AA			TAX				 
$877e:  68			PLA				 
$877f:  A8			TAY				 
$8780:  88			DEY				 
$8781:  10 C7		 BPL $874a		   
$8783:  60			RTS				 

; ------------------------------
sub_8784:
$8784:  A9 00		 LDA #$00			
$8786:  F0 02		 BEQ $878a		   
sub_8788:
$8788:  A9 C0		 LDA #$c0			
$878a:  85 01		 STA tmp1			; Temporary 1
$878c:  8A			TXA				 
$878d:  20 6B 8A	  JSR $8a6b		   
$8790:  90 26		 BCC $87b8		   
$8792:  85 00		 STA tmp0			; Temporary 0
$8794:  A9 00		 LDA #$00			
$8796:  85 0E		 STA $0e			 
$8798:  85 0F		 STA $0f			 
$879a:  A0 00		 LDY #$00			
$879c:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$879e:  10 18		 BPL $87b8		   
$87a0:  A5 00		 LDA tmp0			; Temporary 0
$87a2:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$87a5:  A0 05		 LDY #$05			
$87a7:  A5 01		 LDA tmp1			; Temporary 1
$87a9:  31 79		 AND (action_ptr_lo),Y; Action data pointer low
$87ab:  D0 0B		 BNE $87b8		   
$87ad:  A0 03		 LDY #$03			
$87af:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$87b1:  85 0E		 STA $0e			 
$87b3:  C8			INY				 
$87b4:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$87b6:  85 0F		 STA $0f			 
$87b8:  60			RTS				 

; ------------------------------
sub_87B9:
$87b9:  A2 00		 LDX #$00			
$87bb:  86 94		 STX $94			 
$87bd:  86 95		 STX $95			 
$87bf:  8A			TXA				 
$87c0:  48			PHA				 
$87c1:  20 88 87	  JSR $8788		   
$87c4:  18			CLC				 
$87c5:  A5 0E		 LDA $0e			 
$87c7:  65 94		 ADC $94			 
$87c9:  85 94		 STA $94			 
$87cb:  A5 0F		 LDA $0f			 
$87cd:  65 95		 ADC $95			 
$87cf:  85 95		 STA $95			 
$87d1:  68			PLA				 
$87d2:  AA			TAX				 
$87d3:  E8			INX				 
$87d4:  E0 04		 CPX #$04			
$87d6:  90 E7		 BCC $87bf		   
$87d8:  60			RTS				 

; ------------------------------
sub_87D9:
$87d9:  A9 00		 LDA #$00			
$87db:  85 0E		 STA $0e			 
$87dd:  85 0F		 STA $0f			 
$87df:  A2 07		 LDX #$07			
$87e1:  8A			TXA				 
$87e2:  48			PHA				 
$87e3:  20 9C 89	  JSR $899c		   
$87e6:  A0 06		 LDY #$06			
$87e8:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$87ea:  29 C0		 AND #$c0			
$87ec:  C9 C0		 CMP #$c0			
$87ee:  D0 10		 BNE $8800		   
$87f0:  18			CLC				 
$87f1:  A0 03		 LDY #$03			
$87f3:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$87f5:  65 0E		 ADC $0e			 
$87f7:  85 0E		 STA $0e			 
$87f9:  C8			INY				 
$87fa:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$87fc:  65 0F		 ADC $0f			 
$87fe:  85 0F		 STA $0f			 
$8800:  68			PLA				 
$8801:  AA			TAX				 
$8802:  CA			DEX				 
$8803:  10 DC		 BPL $87e1		   
$8805:  60			RTS				 
$8806:  8A			TXA				 
$8807:  20 9C 89	  JSR $899c		   
$880a:  A0 03		 LDY #$03			
$880c:  A2 0C		 LDX #$0c			
$880e:  4C 19 88	  JMP $8819		   

; ------------------------------
sub_8811:
$8811:  8A			TXA				 
$8812:  20 9C 89	  JSR $899c		   
$8815:  A0 03		 LDY #$03			
$8817:  A2 0E		 LDX #$0e			
sub_8819:
$8819:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$881b:  95 00		 STA $00,X		   
$881d:  C8			INY				 
$881e:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
sub_8820:
$8820:  95 01		 STA $01,X		   
$8822:  60			RTS				 

; ------------------------------
sub_8823:
$8823:  46 0F		 LSR $0f			 
$8825:  66 0E		 ROR $0e			 
$8827:  38			SEC				 
$8828:  A5 0C		 LDA $0c			 
$882a:  E5 0E		 SBC $0e			 
$882c:  85 94		 STA $94			 
$882e:  A5 0D		 LDA $0d			 
$8830:  E5 0F		 SBC $0f			 
$8832:  85 95		 STA $95			 
$8834:  B0 07		 BCS $883d		   
$8836:  A9 00		 LDA #$00			
$8838:  85 94		 STA $94			 
$883a:  85 95		 STA $95			 
$883c:  60			RTS				 
$883d:  46 95		 LSR $95			 
$883f:  66 94		 ROR $94			 
$8841:  60			RTS				 

; ------------------------------
sub_8842:
$8842:  20 66 88	  JSR $8866		   
$8845:  90 0E		 BCC $8855		   
$8847:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$884a:  A2 0C		 LDX #$0c			
$884c:  A0 00		 LDY #$00			
$884e:  20 41 86	  JSR $8641		   
$8851:  A9 00		 LDA #$00			
$8853:  85 0D		 STA $0d			 
$8855:  60			RTS				 

; ------------------------------
sub_8856:
$8856:  8A			TXA				 
$8857:  20 9C 89	  JSR $899c		   
$885a:  A0 00		 LDY #$00			
$885c:  A2 0E		 LDX #$0e			
$885e:  20 19 88	  JSR $8819		   
$8861:  A9 00		 LDA #$00			
$8863:  85 0F		 STA $0f			 
$8865:  60			RTS				 

; ------------------------------
sub_8866:
$8866:  A5 82		 LDA inner_loop	  ; Inner loop counter
$8868:  4C 76 8A	  JMP $8a76		   

; ------------------------------
sub_886B:
$886b:  A9 0C		 LDA #$0c			
$886d:  85 07		 STA $07			 
$886f:  A9 80		 LDA #$80			
$8871:  85 08		 STA $08			 
$8873:  D0 0C		 BNE $8881		   
sub_8875:
$8875:  A9 CC		 LDA #$cc			
$8877:  D0 02		 BNE $887b		   
sub_8879:
$8879:  A9 0C		 LDA #$0c			
$887b:  85 07		 STA $07			 
$887d:  A9 00		 LDA #$00			
$887f:  85 08		 STA $08			 
$8881:  0A			ASL				 
$8882:  85 94		 STA $94			 
$8884:  85 95		 STA $95			 
$8886:  AD E4 72	  LDA $72e4		   
$8889:  30 34		 BMI $88bf		   
$888b:  20 32 8A	  JSR $8a32		   
$888e:  A0 03		 LDY #$03			
$8890:  98			TYA				 
$8891:  48			PHA				 
$8892:  BD 6A 61	  LDA btl_action,X	; Battle action data
$8895:  10 22		 BPL $88b9		   
$8897:  29 0F		 AND #$0f			
$8899:  C9 05		 CMP #$05			
$889b:  B0 1C		 BCS $88b9		   
$889d:  85 00		 STA tmp0			; Temporary 0
$889f:  20 48 8A	  JSR $8a48		   
$88a2:  D0 15		 BNE $88b9		   
$88a4:  A5 00		 LDA tmp0			; Temporary 0
$88a6:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$88a9:  A0 05		 LDY #$05			
$88ab:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$88ad:  25 07		 AND $07			 
$88af:  D0 08		 BNE $88b9		   
$88b1:  20 5D 8A	  JSR $8a5d		   
$88b4:  D0 03		 BNE $88b9		   
$88b6:  20 C0 88	  JSR $88c0		   
$88b9:  68			PLA				 
$88ba:  A8			TAY				 
$88bb:  E8			INX				 
$88bc:  88			DEY				 
$88bd:  10 D1		 BPL $8890		   
$88bf:  60			RTS				 

; ------------------------------
sub_88C0:
$88c0:  8A			TXA				 
$88c1:  48			PHA				 
$88c2:  A5 00		 LDA tmp0			; Temporary 0
$88c4:  20 B6 89	  JSR get_act		 ; Get action data
$88c7:  A0 03		 LDY #$03			
$88c9:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$88cb:  85 02		 STA tmp2			; Temporary 2
$88cd:  C8			INY				 
$88ce:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$88d0:  F0 04		 BEQ $88d6		   
$88d2:  A9 FF		 LDA #$ff			
$88d4:  85 02		 STA tmp2			; Temporary 2
$88d6:  A0 1B		 LDY #$1b			
$88d8:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$88da:  85 04		 STA $04			 
$88dc:  C8			INY				 
$88dd:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$88df:  85 05		 STA $05			 
$88e1:  C8			INY				 
$88e2:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$88e4:  85 06		 STA $06			 
$88e6:  A0 12		 LDY #$12			
$88e8:  A5 00		 LDA tmp0			; Temporary 0
$88ea:  F0 02		 BEQ $88ee		   
$88ec:  A0 0C		 LDY #$0c			
$88ee:  84 01		 STY tmp1			; Temporary 1
$88f0:  A6 00		 LDX tmp0			; Temporary 0
$88f2:  BD 2B 89	  LDA $892b,X		 
$88f5:  AA			TAX				 
$88f6:  46 06		 LSR $06			 
$88f8:  66 05		 ROR $05			 
$88fa:  66 04		 ROR $04			 
$88fc:  90 25		 BCC $8923		   
$88fe:  BD 28 B3	  LDA $b328,X		 
$8901:  A8			TAY				 
$8902:  B9 67 B9	  LDA enemy_res_tbl,Y ; Enemy resistance table
$8905:  29 1F		 AND #$1f			
$8907:  C5 02		 CMP tmp2			; Temporary 2
$8909:  F0 02		 BEQ $890d		   
$890b:  B0 16		 BCS $8923		   
$890d:  A5 08		 LDA $08			 
$890f:  10 06		 BPL $8917		   
$8911:  98			TYA				 
$8912:  20 30 B9	  JSR $b930		   
$8915:  90 0C		 BCC $8923		   
$8917:  B9 EF 8A	  LDA $8aef,Y		 
$891a:  18			CLC				 
$891b:  65 94		 ADC $94			 
$891d:  85 94		 STA $94			 
$891f:  90 02		 BCC $8923		   
$8921:  E6 95		 INC $95			 
$8923:  E8			INX				 
$8924:  C6 01		 DEC tmp1			; Temporary 1
$8926:  D0 CE		 BNE $88f6		   
$8928:  68			PLA				 
$8929:  AA			TAX				 
$892a:  60			RTS				 
$892b:  00			BRK				 
							  ; Data region
		.db $12
$892d:  1E 2A 36	  ASL $362a,X		 
sub_8930:
$8930:  A9 C4		 LDA #$c4			
$8932:  D0 02		 BNE $8936		   
sub_8934:
$8934:  A9 04		 LDA #$04			
$8936:  85 01		 STA tmp1			; Temporary 1
$8938:  A9 00		 LDA #$00			
$893a:  85 94		 STA $94			 
$893c:  85 95		 STA $95			 
$893e:  20 32 8A	  JSR $8a32		   
$8941:  A0 03		 LDY #$03			
$8943:  98			TYA				 
$8944:  48			PHA				 
$8945:  BD 6A 61	  LDA btl_action,X	; Battle action data
$8948:  10 27		 BPL $8971		   
$894a:  29 0F		 AND #$0f			
$894c:  C9 08		 CMP #$08			
$894e:  B0 21		 BCS $8971		   
$8950:  20 48 8A	  JSR $8a48		   
$8953:  D0 1C		 BNE $8971		   
$8955:  A5 00		 LDA tmp0			; Temporary 0
$8957:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$895a:  A0 05		 LDY #$05			
$895c:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$895e:  25 01		 AND tmp1			; Temporary 1
$8960:  D0 0F		 BNE $8971		   
$8962:  C8			INY				 
$8963:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8965:  29 20		 AND #$20			
$8967:  D0 08		 BNE $8971		   
$8969:  20 5D 8A	  JSR $8a5d		   
$896c:  D0 03		 BNE $8971		   
$896e:  20 77 89	  JSR $8977		   
$8971:  68			PLA				 
$8972:  A8			TAY				 
$8973:  88			DEY				 
$8974:  10 CD		 BPL $8943		   
$8976:  60			RTS				 

; ------------------------------
sub_8977:
$8977:  8A			TXA				 
$8978:  48			PHA				 
$8979:  A5 00		 LDA tmp0			; Temporary 0
$897b:  20 B6 89	  JSR get_act		 ; Get action data
$897e:  A0 13		 LDY #$13			
$8980:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8982:  29 7F		 AND #$7f			
$8984:  C9 67		 CMP #$67			
$8986:  B0 0C		 BCS $8994		   
$8988:  AA			TAX				 
$8989:  BD 24 8B	  LDA $8b24,X		 
$898c:  65 94		 ADC $94			 
$898e:  85 94		 STA $94			 
$8990:  90 02		 BCC $8994		   
$8992:  E6 95		 INC $95			 
$8994:  C8			INY				 
$8995:  C0 1B		 CPY #$1b			
$8997:  90 E7		 BCC $8980		   
$8999:  68			PLA				 
$899a:  AA			TAX				 
$899b:  60			RTS				 

; ------------------------------
sub_899C:
$899c:  8A			TXA				 
$899d:  0A			ASL				 
$899e:  85 86		 STA stat_ptr_lo	 ; Stat table pointer low
$89a0:  0A			ASL				 
$89a1:  0A			ASL				 
$89a2:  0A			ASL				 
$89a3:  38			SEC				 
$89a4:  E5 86		 SBC stat_ptr_lo	 ; Stat table pointer low
$89a6:  18			CLC				 
$89a7:  6D B4 89	  ADC $89b4		   
$89aa:  85 86		 STA stat_ptr_lo	 ; Stat table pointer low
$89ac:  AD B5 89	  LDA $89b5		   
$89af:  69 00		 ADC #$00			
$89b1:  85 87		 STA stat_ptr_hi	 ; Stat table pointer high
$89b3:  60			RTS				 
							  ; Data region
		.db $74, $72

; --------------------------------------------------
; Get action data
; --------------------------------------------------
get_act:					 ; $89b6
$89b6:  85 79		 STA action_ptr_lo   ; Action data pointer low
$89b8:  8A			TXA				 
$89b9:  48			PHA				 
$89ba:  A5 79		 LDA action_ptr_lo   ; Action data pointer low
$89bc:  0A			ASL				 
$89bd:  AA			TAX				 
$89be:  BD CB 89	  LDA $89cb,X		 
$89c1:  85 79		 STA action_ptr_lo   ; Action data pointer low
$89c3:  BD CC 89	  LDA $89cc,X		 
$89c6:  85 7A		 STA action_ptr_hi   ; Action data pointer high
$89c8:  68			PLA				 
$89c9:  AA			TAX				 
$89ca:  60			RTS				 
$89cb:  01 60		 ORA ($60,X)		 
							  ; Data region
		.db $1f
$89ce:  60			RTS				 
$89cf:  3D 60 5B	  AND $5b60,X		 
$89d2:  60			RTS				 
$89d3:  79 60 97	  ADC $9760,Y		 
$89d6:  60			RTS				 
$89d7:  B5 60		 LDA $60,X		   
							  ; Data region
		.db $d3
$89da:  60			RTS				 
$89db:  F1 60		 SBC ($60),Y		 
							  ; Data region
		.db $0f
$89de:  61 15		 ADC ($15,X)		 
$89e0:  61 1B		 ADC ($1b,X)		 
$89e2:  61 21		 ADC ($21,X)		 
$89e4:  61 27		 ADC ($27,X)		 
$89e6:  61 2D		 ADC ($2d,X)		 
$89e8:  61 33		 ADC ($33,X)		 
$89ea:  61 39		 ADC ($39,X)		 
$89ec:  61 3F		 ADC ($3f,X)		 
$89ee:  61 45		 ADC ($45,X)		 
$89f0:  61 4B		 ADC ($4b,X)		 
$89f2:  61 51		 ADC ($51,X)		 
$89f4:  61 85		 ADC ($85,X)		 
							  ; Data region
		.db $7a
$89f7:  8A			TXA				 
$89f8:  48			PHA				 
$89f9:  A2 09		 LDX #$09			
$89fb:  BD EA 72	  LDA $72ea,X		 
$89fe:  10 06		 BPL $8a06		   
$8a00:  29 1F		 AND #$1f			
$8a02:  C5 7A		 CMP action_ptr_hi   ; Action data pointer high
$8a04:  F0 07		 BEQ $8a0d		   
$8a06:  CA			DEX				 
$8a07:  10 F2		 BPL $89fb		   
$8a09:  18			CLC				 
$8a0a:  68			PLA				 
$8a0b:  AA			TAX				 
$8a0c:  60			RTS				 
$8a0d:  8A			TXA				 
$8a0e:  0A			ASL				 
$8a0f:  AA			TAX				 
$8a10:  BD 1E 8A	  LDA $8a1e,X		 
$8a13:  85 79		 STA action_ptr_lo   ; Action data pointer low
$8a15:  BD 1F 8A	  LDA $8a1f,X		 
$8a18:  85 7A		 STA action_ptr_hi   ; Action data pointer high
$8a1a:  68			PLA				 
$8a1b:  AA			TAX				 
$8a1c:  38			SEC				 
$8a1d:  60			RTS				 
$8a1e:  10 72		 BPL $8a92		   
							  ; Data region
		.db $1a, $72, $24, $72, $2e, $72, $38, $72, $42, $72
$8a2a:  4C 72 56	  JMP $5672		   
							  ; Data region
		.db $72
$8a2e:  60			RTS				 
							  ; Data region
		.db $72
$8a30:  6A			ROR				 
							  ; Data region
		.db $72
sub_8A32:
$8a32:  A0 00		 LDY #$00			
$8a34:  AD 8E 61	  LDA btl_state	   ; Battle state flags
$8a37:  10 02		 BPL $8a3b		   
$8a39:  A0 04		 LDY #$04			
$8a3b:  2C 8E 61	  BIT btl_state	   ; Battle state flags
$8a3e:  50 05		 BVC $8a45		   
$8a40:  98			TYA				 
$8a41:  18			CLC				 
$8a42:  69 1C		 ADC #$1c			
$8a44:  A8			TAY				 
$8a45:  98			TYA				 
$8a46:  AA			TAX				 
$8a47:  60			RTS				 

; ------------------------------
sub_8A48:
$8a48:  85 00		 STA tmp0			; Temporary 0
$8a4a:  20 B6 89	  JSR get_act		 ; Get action data
$8a4d:  A0 00		 LDY #$00			
$8a4f:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8a51:  29 C0		 AND #$c0			
$8a53:  C9 80		 CMP #$80			
$8a55:  60			RTS				 
$8a56:  A0 05		 LDY #$05			
$8a58:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8a5a:  29 C4		 AND #$c4			
$8a5c:  60			RTS				 

; ------------------------------
sub_8A5D:
$8a5d:  A0 06		 LDY #$06			
$8a5f:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8a61:  29 01		 AND #$01			
$8a63:  D0 05		 BNE $8a6a		   
$8a65:  C8			INY				 
$8a66:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8a68:  29 40		 AND #$40			
$8a6a:  60			RTS				 

; ------------------------------
sub_8A6B:
$8a6b:  20 76 8A	  JSR $8a76		   
$8a6e:  08			PHP				 
$8a6f:  48			PHA				 
$8a70:  20 B6 89	  JSR get_act		 ; Get action data
$8a73:  68			PLA				 
$8a74:  28			PLP				 
$8a75:  60			RTS				 

; ------------------------------
sub_8A76:
$8a76:  8D 64 73	  STA $7364		   
$8a79:  20 32 8A	  JSR $8a32		   
$8a7c:  A0 00		 LDY #$00			
$8a7e:  BD 6A 61	  LDA btl_action,X	; Battle action data
$8a81:  10 05		 BPL $8a88		   
$8a83:  CE 64 73	  DEC $7364		   
$8a86:  30 08		 BMI $8a90		   
$8a88:  E8			INX				 
$8a89:  C8			INY				 
$8a8a:  C0 04		 CPY #$04			
$8a8c:  90 F0		 BCC $8a7e		   
$8a8e:  18			CLC				 
$8a8f:  60			RTS				 
$8a90:  29 1F		 AND #$1f			
$8a92:  38			SEC				 
$8a93:  60			RTS				 
$8a94:  20 AB 8A	  JSR $8aab		   
$8a97:  90 10		 BCC $8aa9		   
$8a99:  8D 65 73	  STA $7365		   
$8a9c:  20 32 8A	  JSR $8a32		   
$8a9f:  A0 00		 LDY #$00			
$8aa1:  20 D3 8A	  JSR $8ad3		   
$8aa4:  90 03		 BCC $8aa9		   
$8aa6:  98			TYA				 
$8aa7:  38			SEC				 
$8aa8:  60			RTS				 
$8aa9:  18			CLC				 
$8aaa:  60			RTS				 

; ------------------------------
sub_8AAB:
$8aab:  AA			TAX				 
$8aac:  BD EA 72	  LDA $72ea,X		 
$8aaf:  10 F8		 BPL $8aa9		   
$8ab1:  29 1F		 AND #$1f			
$8ab3:  38			SEC				 
$8ab4:  60			RTS				 

; ------------------------------
sub_8AB5:
$8ab5:  20 66 88	  JSR $8866		   
$8ab8:  90 14		 BCC $8ace		   
sub_8ABA:
$8aba:  8D 64 73	  STA $7364		   
$8abd:  A2 09		 LDX #$09			
$8abf:  BD EA 72	  LDA $72ea,X		 
$8ac2:  10 07		 BPL $8acb		   
$8ac4:  29 7F		 AND #$7f			
$8ac6:  CD 64 73	  CMP $7364		   
$8ac9:  F0 05		 BEQ $8ad0		   
$8acb:  CA			DEX				 
$8acc:  10 F1		 BPL $8abf		   
$8ace:  18			CLC				 
$8acf:  60			RTS				 
$8ad0:  38			SEC				 
$8ad1:  8A			TXA				 
$8ad2:  60			RTS				 

; ------------------------------
sub_8AD3:
$8ad3:  A9 03		 LDA #$03			
$8ad5:  8D 64 73	  STA $7364		   
$8ad8:  BD 6A 61	  LDA btl_action,X	; Battle action data
$8adb:  10 08		 BPL $8ae5		   
$8add:  29 1F		 AND #$1f			
$8adf:  CD 65 73	  CMP $7365		   
$8ae2:  F0 09		 BEQ $8aed		   
$8ae4:  C8			INY				 
$8ae5:  E8			INX				 
$8ae6:  CE 64 73	  DEC $7364		   
$8ae9:  10 ED		 BPL $8ad8		   
$8aeb:  18			CLC				 
$8aec:  60			RTS				 
$8aed:  38			SEC				 
$8aee:  60			RTS				 
$8aef:  01 01		 ORA ($01,X)		 
$8af1:  01 01		 ORA ($01,X)		 
$8af3:  01 01		 ORA ($01,X)		 
$8af5:  01 01		 ORA ($01,X)		 
$8af7:  01 01		 ORA ($01,X)		 
$8af9:  01 01		 ORA ($01,X)		 
$8afb:  01 01		 ORA ($01,X)		 
$8afd:  01 01		 ORA ($01,X)		 
$8aff:  01 01		 ORA ($01,X)		 
$8b01:  01 01		 ORA ($01,X)		 
$8b03:  01 01		 ORA ($01,X)		 
$8b05:  01 01		 ORA ($01,X)		 
$8b07:  01 01		 ORA ($01,X)		 
$8b09:  01 01		 ORA ($01,X)		 
$8b0b:  01 01		 ORA ($01,X)		 
$8b0d:  01 01		 ORA ($01,X)		 
$8b0f:  01 01		 ORA ($01,X)		 
$8b11:  01 01		 ORA ($01,X)		 
$8b13:  01 01		 ORA ($01,X)		 
$8b15:  01 01		 ORA ($01,X)		 
$8b17:  01 01		 ORA ($01,X)		 
$8b19:  01 01		 ORA ($01,X)		 
$8b1b:  01 01		 ORA ($01,X)		 
$8b1d:  01 01		 ORA ($01,X)		 
$8b1f:  01 01		 ORA ($01,X)		 
$8b21:  01 01		 ORA ($01,X)		 
$8b23:  01 00		 ORA ($00,X)		 
$8b25:  00			BRK				 
$8b26:  00			BRK				 
$8b27:  00			BRK				 
$8b28:  00			BRK				 
$8b29:  00			BRK				 
$8b2a:  00			BRK				 
$8b2b:  00			BRK				 
$8b2c:  00			BRK				 
$8b2d:  00			BRK				 
$8b2e:  00			BRK				 
$8b2f:  01 00		 ORA ($00,X)		 
$8b31:  00			BRK				 
$8b32:  00			BRK				 
$8b33:  00			BRK				 
$8b34:  00			BRK				 
							  ; Data region
		.db $02
$8b36:  00			BRK				 
$8b37:  00			BRK				 
$8b38:  00			BRK				 
$8b39:  00			BRK				 
$8b3a:  00			BRK				 
							  ; Data region
		.db $03, $04
$8b3d:  00			BRK				 
$8b3e:  05 06		 ORA $06			 
$8b40:  00			BRK				 
							  ; Data region
		.db $07
$8b42:  08			PHP				 
$8b43:  09 0A		 ORA #$0a			
							  ; Data region
		.db $0b, $0c
$8b47:  0D 00 00	  ORA tmp0			; Temporary 0
$8b4a:  00			BRK				 
$8b4b:  00			BRK				 
$8b4c:  00			BRK				 
$8b4d:  00			BRK				 
$8b4e:  00			BRK				 
$8b4f:  00			BRK				 
$8b50:  00			BRK				 
$8b51:  00			BRK				 
$8b52:  00			BRK				 
$8b53:  00			BRK				 
$8b54:  00			BRK				 
$8b55:  00			BRK				 
$8b56:  00			BRK				 
$8b57:  00			BRK				 
$8b58:  00			BRK				 
$8b59:  00			BRK				 
$8b5a:  00			BRK				 
$8b5b:  00			BRK				 
$8b5c:  00			BRK				 
$8b5d:  00			BRK				 
$8b5e:  00			BRK				 
$8b5f:  00			BRK				 
$8b60:  00			BRK				 
$8b61:  00			BRK				 
$8b62:  00			BRK				 
$8b63:  00			BRK				 
$8b64:  0E 00 0F	  ASL $0f00		   
$8b67:  00			BRK				 
$8b68:  10 11		 BPL $8b7b		   
$8b6a:  00			BRK				 
$8b6b:  00			BRK				 
$8b6c:  00			BRK				 
$8b6d:  00			BRK				 
$8b6e:  00			BRK				 
$8b6f:  00			BRK				 
$8b70:  00			BRK				 
$8b71:  00			BRK				 
$8b72:  00			BRK				 
$8b73:  00			BRK				 
							  ; Data region
		.db $12, $13
$8b76:  00			BRK				 
							  ; Data region
		.db $14
$8b78:  15 16		 ORA $16,X		   
							  ; Data region
		.db $17
$8b7b:  18			CLC				 
$8b7c:  19 1A 1B	  ORA $1b1a,Y		 
							  ; Data region
		.db $1c
$8b80:  1D 1E 1F	  ORA $1f1e,X		 
$8b83:  20 21 22	  JSR $2221		   
							  ; Data region
		.db $23
$8b87:  24 25		 BIT $25			 
$8b89:  26 27		 ROL $27			 
							  ; Data region
		.db $5a
$8b8c:  8C 5A 8C	  STY $8c5a		   
							  ; Data region
		.db $5a
$8b90:  8C 60 8C	  STY $8c60		   
$8b93:  60			RTS				 
$8b94:  8C 60 8C	  STY $8c60		   
$8b97:  60			RTS				 
$8b98:  8C 5A 8C	  STY $8c5a		   
$8b9b:  60			RTS				 
$8b9c:  8C 60 8C	  STY $8c60		   
$8b9f:  60			RTS				 
$8ba0:  8C 60 8C	  STY $8c60		   
$8ba3:  60			RTS				 
$8ba4:  8C 80 8C	  STY $8c80		   
$8ba7:  8E 8C 59	  STX $598c		   
$8baa:  8C 75 B1	  STY $b175		   
$8bad:  95 B1		 STA $b1,X		   
							  ; Data region
		.db $5f
$8bb0:  B1 6A		 LDA ($6a),Y		 
$8bb2:  B1 B8		 LDA ($b8),Y		 
$8bb4:  B1 61		 LDA ($61),Y		 
$8bb6:  B4 42		 LDY $42,X		   
$8bb8:  B4 4B		 LDY $4b,X		   
$8bba:  B4 A3		 LDY $a3,X		   
							  ; Data region
		.db $b2
$8bbd:  59 8C 4C	  EOR $4c8c,Y		 
							  ; Data region
		.db $b2, $57, $b2
$8bc3:  59 8C 59	  EOR $598c,Y		 
$8bc6:  8C 59 8C	  STY $8c59		   
$8bc9:  D8			CLD				 
$8bca:  8C D8 8C	  STY $8cd8		   
$8bcd:  D8			CLD				 
$8bce:  8C D8 8C	  STY $8cd8		   
$8bd1:  D8			CLD				 
$8bd2:  8C D8 8C	  STY $8cd8		   
$8bd5:  D8			CLD				 
$8bd6:  8C D8 8C	  STY $8cd8		   
$8bd9:  D8			CLD				 
$8bda:  8C D8 8C	  STY $8cd8		   
$8bdd:  D8			CLD				 
$8bde:  8C 59 8C	  STY $8c59		   
$8be1:  59 8C 59	  EOR $598c,Y		 
$8be4:  8C 59 8C	  STY $8c59		   
$8be7:  59 8C 59	  EOR $598c,Y		 
$8bea:  8C 59 8C	  STY $8c59		   
$8bed:  59 8C 92	  EOR $928c,Y		 
							  ; Data region
		.db $b3, $b2, $b3
$8bf3:  CA			DEX				 
							  ; Data region
		.db $b3, $fb, $b3
$8bf7:  21 B4		 AND ($b4,X)		 
$8bf9:  24 B4		 BIT $b4			 
							  ; Data region
		.db $ab, $b2, $ab, $b2, $ab, $b2, $62, $b2
$8c03:  69 8C		 ADC #$8c			
$8c05:  69 8C		 ADC #$8c			
$8c07:  69 8C		 ADC #$8c			
$8c09:  69 8C		 ADC #$8c			
$8c0b:  69 8C		 ADC #$8c			
$8c0d:  69 8C		 ADC #$8c			
$8c0f:  EE B1 61	  INC btl_turn		; Battle turn counter
$8c12:  B4 29		 LDY $29,X		   
							  ; Data region
		.db $b2
$8c15:  09 B2		 ORA #$b2			
							  ; Data region
		.db $3b, $b2
$8c19:  59 8C 61	  EOR $618c,Y		 
$8c1c:  B4 61		 LDY $61,X		   
$8c1e:  B4 61		 LDY $61,X		   
$8c20:  B4 61		 LDY $61,X		   
$8c22:  B4 61		 LDY $61,X		   
$8c24:  B4 61		 LDY $61,X		   
$8c26:  B4 61		 LDY $61,X		   
$8c28:  B4 61		 LDY $61,X		   
$8c2a:  B4 61		 LDY $61,X		   
$8c2c:  B4 61		 LDY $61,X		   
$8c2e:  B4 61		 LDY $61,X		   
$8c30:  B4 61		 LDY $61,X		   
$8c32:  B4 61		 LDY $61,X		   
$8c34:  B4 61		 LDY $61,X		   
$8c36:  B4 61		 LDY $61,X		   
$8c38:  B4 61		 LDY $61,X		   
$8c3a:  B4 61		 LDY $61,X		   
$8c3c:  B4 61		 LDY $61,X		   
$8c3e:  B4 61		 LDY $61,X		   
$8c40:  B4 61		 LDY $61,X		   
$8c42:  B4 72		 LDY $72,X		   
$8c44:  8C 94 8C	  STY $8c94		   
$8c47:  61 B4		 ADC ($b4,X)		 
$8c49:  01 8D		 ORA ($8d,X)		 
$8c4b:  01 8D		 ORA ($8d,X)		 
$8c4d:  59 8C 7D	  EOR $7d8c,Y		 
							  ; Data region
		.db $b2, $7c
$8c52:  8C 92 B3	  STY $b392		   
$8c55:  01 8D		 ORA ($8d,X)		 
$8c57:  98			TYA				 
							  ; Data region
		.db $b2
$8c59:  60			RTS				 
$8c5a:  20 BC 8C	  JSR $8cbc		   
$8c5d:  4C 4B 82	  JMP $824b		   
$8c60:  20 BC 8C	  JSR $8cbc		   
$8c63:  20 C5 81	  JSR $81c5		   
$8c66:  4C 4B 82	  JMP $824b		   
$8c69:  20 BC 8C	  JSR $8cbc		   
$8c6c:  20 C5 81	  JSR $81c5		   
$8c6f:  4C 60 82	  JMP $8260		   
$8c72:  A9 14		 LDA #$14			
$8c74:  85 94		 STA $94			 
sub_8C76:
$8c76:  A9 00		 LDA #$00			
$8c78:  85 95		 STA $95			 
$8c7a:  F0 F0		 BEQ $8c6c		   
$8c7c:  A9 1C		 LDA #$1c			
$8c7e:  D0 F6		 BNE $8c76		   
$8c80:  20 A5 8C	  JSR $8ca5		   
$8c83:  20 E0 81	  JSR $81e0		   
$8c86:  A9 06		 LDA #$06			
$8c88:  20 98 81	  JSR scale_stat	  ; Scale stat value
$8c8b:  4C 4B 82	  JMP $824b		   
$8c8e:  20 A5 8C	  JSR $8ca5		   
$8c91:  4C 86 8C	  JMP $8c86		   
$8c94:  20 4C 86	  JSR $864c		   
$8c97:  A5 00		 LDA tmp0			; Temporary 0
$8c99:  85 94		 STA $94			 
$8c9b:  A5 01		 LDA tmp1			; Temporary 1
$8c9d:  85 95		 STA $95			 
$8c9f:  20 E0 81	  JSR $81e0		   
$8ca2:  4C 60 82	  JMP $8260		   

; ------------------------------
sub_8CA5:
$8ca5:  20 4C 86	  JSR $864c		   
$8ca8:  20 7A 86	  JSR $867a		   
$8cab:  18			CLC				 
$8cac:  A5 00		 LDA tmp0			; Temporary 0
$8cae:  65 02		 ADC tmp2			; Temporary 2
$8cb0:  85 94		 STA $94			 
$8cb2:  A5 01		 LDA tmp1			; Temporary 1
$8cb4:  65 03		 ADC tmp3			; Temporary 3
$8cb6:  4A			LSR				 
$8cb7:  85 95		 STA $95			 
$8cb9:  66 94		 ROR $94			 
$8cbb:  60			RTS				 

; ------------------------------
sub_8CBC:
$8cbc:  A9 00		 LDA #$00			
$8cbe:  85 95		 STA $95			 
$8cc0:  AD 99 75	  LDA $7599		   
$8cc3:  0A			ASL				 
$8cc4:  AA			TAX				 
$8cc5:  E0 78		 CPX #$78			
$8cc7:  B0 06		 BCS $8ccf		   
$8cc9:  BD BD B7	  LDA $b7bd,X		 
$8ccc:  85 94		 STA $94			 
$8cce:  60			RTS				 
$8ccf:  E9 78		 SBC #$78			
$8cd1:  AA			TAX				 
$8cd2:  BD D7 B7	  LDA $b7d7,X		 
$8cd5:  85 94		 STA $94			 
$8cd7:  60			RTS				 
$8cd8:  AE 99 75	  LDX $7599		   
$8cdb:  BD 0B 8D	  LDA $8d0b,X		 
$8cde:  F0 20		 BEQ $8d00		   
$8ce0:  85 00		 STA tmp0			; Temporary 0
$8ce2:  AD AB 75	  LDA $75ab		   
$8ce5:  05 00		 ORA tmp0			; Temporary 0
$8ce7:  8D AB 75	  STA $75ab		   
$8cea:  A5 00		 LDA tmp0			; Temporary 0
$8cec:  A0 FF		 LDY #$ff			
$8cee:  C8			INY				 
$8cef:  4A			LSR				 
$8cf0:  90 FC		 BCC $8cee		   
$8cf2:  18			CLC				 
$8cf3:  AD 9A 75	  LDA $759a		   
$8cf6:  79 C1 75	  ADC $75c1,Y		 
$8cf9:  90 02		 BCC $8cfd		   
$8cfb:  A9 FF		 LDA #$ff			
$8cfd:  99 C1 75	  STA $75c1,Y		 
$8d00:  60			RTS				 
$8d01:  AE 99 75	  LDX $7599		   
$8d04:  BD D6 8C	  LDA $8cd6,X		 
$8d07:  F0 20		 BEQ $8d29		   
$8d09:  85 00		 STA tmp0			; Temporary 0
$8d0b:  AD AC 75	  LDA $75ac		   
$8d0e:  05 00		 ORA tmp0			; Temporary 0
$8d10:  8D AC 75	  STA $75ac		   
$8d13:  A5 00		 LDA tmp0			; Temporary 0
$8d15:  A0 FF		 LDY #$ff			
$8d17:  C8			INY				 
$8d18:  4A			LSR				 
$8d19:  90 FC		 BCC $8d17		   
$8d1b:  18			CLC				 
$8d1c:  AD 9A 75	  LDA $759a		   
$8d1f:  79 C9 75	  ADC $75c9,Y		 
$8d22:  90 02		 BCC $8d26		   
$8d24:  A9 FF		 LDA #$ff			
$8d26:  99 C9 75	  STA $75c9,Y		 
$8d29:  60			RTS				 
$8d2a:  08			PHP				 
$8d2b:  10 80		 BPL $8cad		   
$8d2d:  01 01		 ORA ($01,X)		 
$8d2f:  01 02		 ORA ($02,X)		 
							  ; Data region
		.db $02, $02
$8d33:  20 40 02	  JSR $0240		   
$8d36:  10 00		 BPL $8d38		   
$8d38:  00			BRK				 
$8d39:  00			BRK				 
$8d3a:  00			BRK				 
$8d3b:  01 20		 ORA ($20,X)		 
$8d3d:  91 8D		 STA ($8d),Y		 
$8d3f:  A9 00		 LDA #$00			
$8d41:  8D D0 77	  STA $77d0		   
$8d44:  8D D1 77	  STA $77d1		   
$8d47:  A5 93		 LDA btl_flags	   ; Battle calculation flags
$8d49:  85 81		 STA party_loop	  ; Party loop counter
$8d4b:  20 69 8D	  JSR $8d69		   
$8d4e:  F0 18		 BEQ $8d68		   
$8d50:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$8d53:  20 E7 8D	  JSR $8de7		   
$8d56:  20 0B 8E	  JSR $8e0b		   
$8d59:  20 42 8E	  JSR $8e42		   
$8d5c:  20 5F 8E	  JSR $8e5f		   
$8d5f:  20 9E 8E	  JSR $8e9e		   
$8d62:  20 CE 8E	  JSR $8ece		   
$8d65:  20 16 8F	  JSR $8f16		   
$8d68:  60			RTS				 

; ------------------------------
sub_8D69:
$8d69:  A6 81		 LDX party_loop	  ; Party loop counter
$8d6b:  BD 5E FF	  LDA $ff5e,X		 
$8d6e:  2D 78 75	  AND $7578		   
$8d71:  F0 03		 BEQ $8d76		   
$8d73:  BD 79 75	  LDA $7579,X		 
$8d76:  60			RTS				 

; --------------------------------------------------
; Setup char pointer
; --------------------------------------------------
setup_ptr:					 ; $8d77
$8d77:  A9 3A		 LDA #$3a			
$8d79:  85 88		 STA char_ptr_lo	 ; Character data pointer low
$8d7b:  A9 00		 LDA #$00			
$8d7d:  85 89		 STA char_ptr_hi	 ; Character data pointer high
$8d7f:  A5 81		 LDA party_loop	  ; Party loop counter
$8d81:  A2 88		 LDX #$88			
$8d83:  20 27 C8	  JSR $c827		   
$8d86:  AD 8F 8D	  LDA $8d8f		   
$8d89:  AC 90 8D	  LDY $8d90		   
$8d8c:  4C 1D C8	  JMP $c81d		   
$8d8f:  00			BRK				 
$8d90:  76 A9		 ROR $a9,X		   
$8d92:  00			BRK				 
$8d93:  8D D0 77	  STA $77d0		   
$8d96:  A0 00		 LDY #$00			
$8d98:  B9 91 75	  LDA $7591,Y		 
$8d9b:  48			PHA				 
$8d9c:  98			TYA				 
$8d9d:  0A			ASL				 
$8d9e:  AA			TAX				 
$8d9f:  BD A3 75	  LDA $75a3,X		 
$8da2:  85 94		 STA $94			 
$8da4:  BD A4 75	  LDA $75a4,X		 
$8da7:  85 95		 STA $95			 
$8da9:  68			PLA				 
$8daa:  20 98 81	  JSR scale_stat	  ; Scale stat value
$8dad:  A5 94		 LDA $94			 
$8daf:  05 95		 ORA $95			 
$8db1:  F0 11		 BEQ $8dc4		   
$8db3:  A5 92		 LDA $92			 
$8db5:  0A			ASL				 
$8db6:  0A			ASL				 
$8db7:  6D D0 77	  ADC $77d0		   
$8dba:  AA			TAX				 
$8dbb:  BD D3 8D	  LDA $8dd3,X		 
$8dbe:  20 98 81	  JSR scale_stat	  ; Scale stat value
$8dc1:  EE D0 77	  INC $77d0		   
$8dc4:  98			TYA				 
$8dc5:  0A			ASL				 
$8dc6:  AA			TAX				 
$8dc7:  A5 94		 LDA $94			 
$8dc9:  9D A3 75	  STA $75a3,X		 
$8dcc:  A5 95		 LDA $95			 
$8dce:  9D A4 75	  STA $75a4,X		 
$8dd1:  C8			INY				 
$8dd2:  C0 04		 CPY #$04			
$8dd4:  90 C2		 BCC $8d98		   
$8dd6:  60			RTS				 
$8dd7:  10 00		 BPL $8dd9		   
$8dd9:  00			BRK				 
$8dda:  00			BRK				 
$8ddb:  09 07		 ORA #$07			
$8ddd:  00			BRK				 
$8dde:  00			BRK				 
							  ; Data region
		.db $07
$8de0:  05 04		 ORA $04			 
$8de2:  00			BRK				 
							  ; Data region
		.db $07
$8de4:  05 03		 ORA tmp3			; Temporary 3
$8de6:  01 A9		 ORA ($a9,X)		 
							  ; Data region
		.db $03
$8de9:  85 82		 STA inner_loop	  ; Inner loop counter
$8deb:  A5 82		 LDA inner_loop	  ; Inner loop counter
$8ded:  0A			ASL				 
$8dee:  A8			TAY				 
$8def:  B9 A3 75	  LDA $75a3,Y		 
$8df2:  85 94		 STA $94			 
$8df4:  B9 A4 75	  LDA $75a4,Y		 
$8df7:  85 95		 STA $95			 
$8df9:  A6 81		 LDX party_loop	  ; Party loop counter
$8dfb:  BD 89 75	  LDA $7589,X		 
$8dfe:  20 98 81	  JSR scale_stat	  ; Scale stat value
$8e01:  A0 00		 LDY #$00			
$8e03:  20 1D 83	  JSR $831d		   
$8e06:  C6 82		 DEC inner_loop	  ; Inner loop counter
$8e08:  10 E1		 BPL $8deb		   
$8e0a:  60			RTS				 

; ------------------------------
sub_8E0B:
$8e0b:  AD AD 75	  LDA btl_ad		  ; Battle stat AD
$8e0e:  85 00		 STA tmp0			; Temporary 0
$8e10:  AD AE 75	  LDA $75ae		   
$8e13:  85 01		 STA tmp1			; Temporary 1
$8e15:  A6 81		 LDX party_loop	  ; Party loop counter
$8e17:  BD 81 75	  LDA $7581,X		 
$8e1a:  F0 25		 BEQ $8e41		   
$8e1c:  A2 00		 LDX #$00			
$8e1e:  20 9A 81	  JSR $819a		   
$8e21:  20 16 82	  JSR $8216		   
$8e24:  A9 03		 LDA #$03			
$8e26:  85 82		 STA inner_loop	  ; Inner loop counter
$8e28:  A5 00		 LDA tmp0			; Temporary 0
$8e2a:  85 94		 STA $94			 
$8e2c:  A5 01		 LDA tmp1			; Temporary 1
$8e2e:  85 95		 STA $95			 
$8e30:  A6 82		 LDX inner_loop	  ; Inner loop counter
$8e32:  BD 95 75	  LDA $7595,X		 
$8e35:  20 98 81	  JSR scale_stat	  ; Scale stat value
$8e38:  A0 08		 LDY #$08			
$8e3a:  20 1D 83	  JSR $831d		   
$8e3d:  C6 82		 DEC inner_loop	  ; Inner loop counter
$8e3f:  10 E7		 BPL $8e28		   
$8e41:  60			RTS				 

; ------------------------------
sub_8E42:
$8e42:  AD AF 75	  LDA $75af		   
$8e45:  85 94		 STA $94			 
$8e47:  AD B0 75	  LDA $75b0		   
$8e4a:  85 95		 STA $95			 
$8e4c:  A6 81		 LDX party_loop	  ; Party loop counter
$8e4e:  20 E0 81	  JSR $81e0		   
$8e51:  A9 03		 LDA #$03			
$8e53:  85 82		 STA inner_loop	  ; Inner loop counter
$8e55:  A0 10		 LDY #$10			
$8e57:  20 1D 83	  JSR $831d		   
$8e5a:  C6 82		 DEC inner_loop	  ; Inner loop counter
$8e5c:  10 F7		 BPL $8e55		   
$8e5e:  60			RTS				 

; ------------------------------
sub_8E5F:
$8e5f:  AD B1 75	  LDA $75b1		   
$8e62:  AE B2 75	  LDX $75b2		   
$8e65:  A0 18		 LDY #$18			
$8e67:  20 88 8E	  JSR $8e88		   
$8e6a:  AD B5 75	  LDA $75b5		   
$8e6d:  AE B6 75	  LDX $75b6		   
$8e70:  A0 1C		 LDY #$1c			
$8e72:  20 88 8E	  JSR $8e88		   
$8e75:  AD B9 75	  LDA $75b9		   
$8e78:  AE BA 75	  LDX $75ba		   
$8e7b:  A0 20		 LDY #$20			
$8e7d:  20 88 8E	  JSR $8e88		   
$8e80:  AD BD 75	  LDA $75bd		   
$8e83:  AE BE 75	  LDX $75be		   
$8e86:  A0 36		 LDY #$36			
sub_8E88:
$8e88:  85 94		 STA $94			 
$8e8a:  86 95		 STX $95			 
$8e8c:  A6 81		 LDX party_loop	  ; Party loop counter
$8e8e:  BD 81 75	  LDA $7581,X		 
$8e91:  20 98 81	  JSR scale_stat	  ; Scale stat value
$8e94:  A5 94		 LDA $94			 
$8e96:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8e98:  C8			INY				 
$8e99:  A5 95		 LDA $95			 
$8e9b:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8e9d:  60			RTS				 

; ------------------------------
sub_8E9E:
$8e9e:  AD B3 75	  LDA $75b3		   
$8ea1:  AE B4 75	  LDX $75b4		   
$8ea4:  A0 1A		 LDY #$1a			
$8ea6:  20 C7 8E	  JSR $8ec7		   
$8ea9:  AD B7 75	  LDA $75b7		   
$8eac:  AE B8 75	  LDX $75b8		   
$8eaf:  A0 1E		 LDY #$1e			
$8eb1:  20 C7 8E	  JSR $8ec7		   
$8eb4:  AD BB 75	  LDA $75bb		   
$8eb7:  AE BC 75	  LDX $75bc		   
$8eba:  A0 22		 LDY #$22			
$8ebc:  20 C7 8E	  JSR $8ec7		   
$8ebf:  AD BF 75	  LDA $75bf		   
$8ec2:  AE C0 75	  LDX $75c0		   
$8ec5:  A0 38		 LDY #$38			
sub_8EC7:
$8ec7:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8ec9:  C8			INY				 
$8eca:  8A			TXA				 
$8ecb:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8ecd:  60			RTS				 

; ------------------------------
sub_8ECE:
$8ece:  A2 07		 LDX #$07			
$8ed0:  A0 2C		 LDY #$2c			
$8ed2:  BD C1 75	  LDA $75c1,X		 
$8ed5:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8ed7:  88			DEY				 
$8ed8:  CA			DEX				 
$8ed9:  10 F7		 BPL $8ed2		   
$8edb:  A2 07		 LDX #$07			
$8edd:  A0 35		 LDY #$35			
$8edf:  BD C9 75	  LDA $75c9,X		 
$8ee2:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8ee4:  88			DEY				 
$8ee5:  CA			DEX				 
$8ee6:  10 F7		 BPL $8edf		   
$8ee8:  A0 24		 LDY #$24			
$8eea:  AD AB 75	  LDA $75ab		   
$8eed:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8eef:  A0 2D		 LDY #$2d			
$8ef1:  AD AC 75	  LDA $75ac		   
$8ef4:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8ef6:  A6 81		 LDX party_loop	  ; Party loop counter
$8ef8:  BD 81 75	  LDA $7581,X		 
$8efb:  85 00		 STA tmp0			; Temporary 0
$8efd:  A0 25		 LDY #$25			
$8eff:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$8f01:  85 94		 STA $94			 
$8f03:  A9 00		 LDA #$00			
$8f05:  85 95		 STA $95			 
$8f07:  A5 00		 LDA tmp0			; Temporary 0
$8f09:  20 98 81	  JSR scale_stat	  ; Scale stat value
$8f0c:  A5 94		 LDA $94			 
$8f0e:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8f10:  C8			INY				 
$8f11:  C0 2D		 CPY #$2d			
$8f13:  90 EA		 BCC $8eff		   
$8f15:  60			RTS				 

; ------------------------------
sub_8F16:
$8f16:  A0 38		 LDY #$38			
$8f18:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$8f1a:  69 10		 ADC #$10			
$8f1c:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8f1e:  C8			INY				 
$8f1f:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$8f21:  69 00		 ADC #$00			
$8f23:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8f25:  60			RTS				 
$8f26:  A9 07		 LDA #$07			
$8f28:  85 81		 STA party_loop	  ; Party loop counter
$8f2a:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$8f2d:  A2 06		 LDX #$06			
$8f2f:  BD EC 90	  LDA $90ec,X		 
$8f32:  20 D0 90	  JSR $90d0		   
$8f35:  CA			DEX				 
$8f36:  10 F7		 BPL $8f2f		   
$8f38:  A2 0A		 LDX #$0a			
$8f3a:  BD F4 90	  LDA $90f4,X		 
$8f3d:  20 D4 90	  JSR $90d4		   
$8f40:  CA			DEX				 
$8f41:  10 F7		 BPL $8f3a		   
$8f43:  20 B6 90	  JSR $90b6		   
$8f46:  C6 81		 DEC party_loop	  ; Party loop counter
$8f48:  10 E0		 BPL $8f2a		   
$8f4a:  20 E8 A4	  JSR $a4e8		   
$8f4d:  20 21 90	  JSR $9021		   
$8f50:  A9 07		 LDA #$07			
$8f52:  85 81		 STA party_loop	  ; Party loop counter
$8f54:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$8f57:  20 67 90	  JSR $9067		   
$8f5a:  A0 24		 LDY #$24			
$8f5c:  20 73 8F	  JSR $8f73		   
$8f5f:  A0 36		 LDY #$36			
$8f61:  20 12 90	  JSR $9012		   
$8f64:  A0 2D		 LDY #$2d			
$8f66:  20 73 8F	  JSR $8f73		   
$8f69:  A0 38		 LDY #$38			
$8f6b:  20 12 90	  JSR $9012		   
$8f6e:  C6 81		 DEC party_loop	  ; Party loop counter
$8f70:  10 E2		 BPL $8f54		   
$8f72:  60			RTS				 

; ------------------------------
sub_8F73:
$8f73:  A9 00		 LDA #$00			
$8f75:  85 94		 STA $94			 
$8f77:  85 95		 STA $95			 
$8f79:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$8f7b:  85 0F		 STA $0f			 
$8f7d:  A2 00		 LDX #$00			
$8f7f:  8A			TXA				 
$8f80:  48			PHA				 
$8f81:  8D 9A 75	  STA $759a		   
$8f84:  46 0F		 LSR $0f			 
$8f86:  90 03		 BCC $8f8b		   
$8f88:  20 93 8F	  JSR $8f93		   
$8f8b:  68			PLA				 
$8f8c:  AA			TAX				 
$8f8d:  E8			INX				 
$8f8e:  E0 08		 CPX #$08			
$8f90:  90 ED		 BCC $8f7f		   
$8f92:  60			RTS				 

; ------------------------------
sub_8F93:
$8f93:  0A			ASL				 
$8f94:  AA			TAX				 
$8f95:  BD 00 91	  LDA $9100,X		 
$8f98:  85 00		 STA tmp0			; Temporary 0
$8f9a:  BD 01 91	  LDA $9101,X		 
$8f9d:  85 01		 STA tmp1			; Temporary 1
$8f9f:  6C 00 00	  JMP (tmp0)		  ; Temporary 0
$8fa2:  AD 9F 75	  LDA $759f		   
$8fa5:  AE A0 75	  LDX $75a0		   
$8fa8:  20 EF 8F	  JSR $8fef		   
$8fab:  46 01		 LSR tmp1			; Temporary 1
$8fad:  66 00		 ROR tmp0			; Temporary 0
$8faf:  4C F4 8F	  JMP $8ff4		   
$8fb2:  AD A1 75	  LDA $75a1		   
$8fb5:  AE A2 75	  LDX $75a2		   
$8fb8:  4C A8 8F	  JMP $8fa8		   
$8fbb:  AD A1 75	  LDA $75a1		   
$8fbe:  AE A2 75	  LDX $75a2		   
$8fc1:  20 EF 8F	  JSR $8fef		   
$8fc4:  4C F4 8F	  JMP $8ff4		   
$8fc7:  AD 9B 75	  LDA $759b		   
$8fca:  AE 9C 75	  LDX $759c		   
$8fcd:  20 EF 8F	  JSR $8fef		   
$8fd0:  4C A8 8F	  JMP $8fa8		   
$8fd3:  AD 9B 75	  LDA $759b		   
$8fd6:  AE 9C 75	  LDX $759c		   
$8fd9:  4C C1 8F	  JMP $8fc1		   
$8fdc:  AD 9D 75	  LDA $759d		   
$8fdf:  AE 9E 75	  LDX $759e		   
$8fe2:  20 EF 8F	  JSR $8fef		   
$8fe5:  A9 0C		 LDA #$0c			
$8fe7:  A2 00		 LDX #$00			
$8fe9:  20 9A 81	  JSR $819a		   
$8fec:  4C F4 8F	  JMP $8ff4		   

; ------------------------------
sub_8FEF:
$8fef:  85 00		 STA tmp0			; Temporary 0
$8ff1:  86 01		 STX tmp1			; Temporary 1
$8ff3:  60			RTS				 
$8ff4:  98			TYA				 
$8ff5:  48			PHA				 
$8ff6:  38			SEC				 
$8ff7:  6D 9A 75	  ADC $759a		   
$8ffa:  A8			TAY				 
$8ffb:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$8ffd:  A2 00		 LDX #$00			
$8fff:  20 30 83	  JSR mult_a		  ; Multiply by A
$9002:  18			CLC				 
$9003:  A5 01		 LDA tmp1			; Temporary 1
$9005:  65 94		 ADC $94			 
$9007:  85 94		 STA $94			 
$9009:  A5 19		 LDA mult_hi		 ; Product high
$900b:  65 95		 ADC $95			 
$900d:  85 95		 STA $95			 
$900f:  68			PLA				 
$9010:  A8			TAY				 
$9011:  60			RTS				 

; ------------------------------
sub_9012:
$9012:  18			CLC				 
$9013:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$9015:  65 94		 ADC $94			 
$9017:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$9019:  C8			INY				 
$901a:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$901c:  65 95		 ADC $95			 
$901e:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$9020:  60			RTS				 

; ------------------------------
sub_9021:
$9021:  A9 00		 LDA #$00			
$9023:  85 00		 STA tmp0			; Temporary 0
$9025:  85 01		 STA tmp1			; Temporary 1
$9027:  85 02		 STA tmp2			; Temporary 2
$9029:  A9 07		 LDA #$07			
$902b:  85 81		 STA party_loop	  ; Party loop counter
$902d:  AD 77 75	  LDA $7577		   
$9030:  85 03		 STA tmp3			; Temporary 3
$9032:  46 03		 LSR tmp3			; Temporary 3
$9034:  90 02		 BCC $9038		   
$9036:  E6 00		 INC tmp0			; Temporary 0
$9038:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$903b:  A0 36		 LDY #$36			
$903d:  20 A7 90	  JSR $90a7		   
$9040:  A0 38		 LDY #$38			
$9042:  20 A7 90	  JSR $90a7		   
$9045:  C6 81		 DEC party_loop	  ; Party loop counter
$9047:  10 E9		 BPL $9032		   
$9049:  A5 01		 LDA tmp1			; Temporary 1
$904b:  8D 9B 75	  STA $759b		   
$904e:  A5 02		 LDA tmp2			; Temporary 2
$9050:  8D 9C 75	  STA $759c		   
$9053:  A2 01		 LDX #$01			
$9055:  A5 00		 LDA tmp0			; Temporary 0
$9057:  85 82		 STA inner_loop	  ; Inner loop counter
$9059:  20 51 C8	  JSR $c851		   
$905c:  A5 01		 LDA tmp1			; Temporary 1
$905e:  8D 9F 75	  STA $759f		   
$9061:  A5 02		 LDA tmp2			; Temporary 2
$9063:  8D A0 75	  STA $75a0		   
$9066:  60			RTS				 

; ------------------------------
sub_9067:
$9067:  AD 9B 75	  LDA $759b		   
$906a:  AE 9C 75	  LDX $759c		   
$906d:  20 EF 8F	  JSR $8fef		   
$9070:  A0 37		 LDY #$37			
$9072:  20 9A 90	  JSR $909a		   
$9075:  A0 39		 LDY #$39			
$9077:  20 9A 90	  JSR $909a		   
$907a:  A5 00		 LDA tmp0			; Temporary 0
$907c:  8D 9D 75	  STA $759d		   
$907f:  A5 01		 LDA tmp1			; Temporary 1
$9081:  8D 9E 75	  STA $759e		   
$9084:  A6 82		 LDX inner_loop	  ; Inner loop counter
$9086:  CA			DEX				 
$9087:  8A			TXA				 
$9088:  F0 05		 BEQ $908f		   
$908a:  A2 00		 LDX #$00			
$908c:  20 51 C8	  JSR $c851		   
$908f:  A5 00		 LDA tmp0			; Temporary 0
$9091:  8D A1 75	  STA $75a1		   
$9094:  A5 01		 LDA tmp1			; Temporary 1
$9096:  8D A2 75	  STA $75a2		   
$9099:  60			RTS				 

; ------------------------------
sub_909A:
$909a:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$909c:  48			PHA				 
$909d:  88			DEY				 
$909e:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$90a0:  A8			TAY				 
$90a1:  68			PLA				 
$90a2:  A2 00		 LDX #$00			
$90a4:  4C 07 C8	  JMP $c807		   

; ------------------------------
sub_90A7:
$90a7:  18			CLC				 
$90a8:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$90aa:  65 01		 ADC tmp1			; Temporary 1
$90ac:  85 01		 STA tmp1			; Temporary 1
$90ae:  C8			INY				 
$90af:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$90b1:  65 02		 ADC tmp2			; Temporary 2
$90b3:  85 02		 STA tmp2			; Temporary 2
$90b5:  60			RTS				 

; ------------------------------
sub_90B6:
$90b6:  A0 36		 LDY #$36			
$90b8:  20 BD 90	  JSR $90bd		   
$90bb:  A0 38		 LDY #$38			
sub_90BD:
$90bd:  18			CLC				 
$90be:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$90c0:  6D D0 77	  ADC $77d0		   
$90c3:  8D D0 77	  STA $77d0		   
$90c6:  C8			INY				 
$90c7:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$90c9:  6D D1 77	  ADC $77d1		   
$90cc:  8D D1 77	  STA $77d1		   
$90cf:  60			RTS				 

; ------------------------------
sub_90D0:
$90d0:  A0 36		 LDY #$36			
$90d2:  D0 02		 BNE $90d6		   
sub_90D4:
$90d4:  A0 38		 LDY #$38			
$90d6:  84 00		 STY tmp0			; Temporary 0
$90d8:  A8			TAY				 
$90d9:  48			PHA				 
$90da:  18			CLC				 
$90db:  20 E3 90	  JSR $90e3		   
$90de:  68			PLA				 
$90df:  A8			TAY				 
$90e0:  C8			INY				 
$90e1:  E6 00		 INC tmp0			; Temporary 0
sub_90E3:
$90e3:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$90e5:  A4 00		 LDY tmp0			; Temporary 0
$90e7:  71 88		 ADC (char_ptr_lo),Y ; Character data pointer low
$90e9:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$90eb:  60			RTS				 
$90ec:  08			PHP				 
$90ed:  0A			ASL				 
							  ; Data region
		.db $0c
$90ef:  0E 18 1C	  ASL $1c18		   
$90f2:  20 36 00	  JSR $0036		   
							  ; Data region
		.db $02, $04
$90f7:  06 10		 ASL ptr_lo		  ; General pointer low
							  ; Data region
		.db $12, $14
$90fb:  16 1A		 ASL $1a,X		   
$90fd:  1E 22 38	  ASL $3822,X		 
$9100:  A2 8F		 LDX #$8f			
$9102:  A2 8F		 LDX #$8f			
$9104:  A2 8F		 LDX #$8f			
							  ; Data region
		.db $b2, $8f, $bb, $8f, $c7, $8f, $d3, $8f, $dc, $8f
finalize:					 ; $9110
$9110:  A6 96		 LDX active_char	 ; Active character index
$9112:  AD DB 75	  LDA act_id		  ; Action ID
$9115:  C9 FF		 CMP #$ff			
$9117:  F0 16		 BEQ $912f		   
$9119:  9D 24 73	  STA $7324,X		 
$911c:  AD DA 75	  LDA act_cat		 ; Action category
$911f:  9D 00 73	  STA $7300,X		 
$9122:  29 70		 AND #$70			
$9124:  C9 20		 CMP #$20			
$9126:  D0 06		 BNE $912e		   
$9128:  AD F2 75	  LDA $75f2		   
$912b:  9D 24 73	  STA $7324,X		 
$912e:  60			RTS				 
$912f:  A9 3C		 LDA #$3c			
$9131:  9D 24 73	  STA $7324,X		 
$9134:  60			RTS				 

; --------------------------------------------------
; Check hit/miss
; --------------------------------------------------
chk_hit:					 ; $9135
$9135:  AD DA 75	  LDA act_cat		 ; Action category
$9138:  29 70		 AND #$70			
$913a:  D0 19		 BNE $9155		   
$913c:  AD DB 75	  LDA act_id		  ; Action ID
$913f:  C9 13		 CMP #$13			
$9141:  90 35		 BCC $9178		   
$9143:  C9 1C		 CMP #$1c			
$9145:  90 53		 BCC hit_6		   ; -> Hit check type 6
$9147:  C9 29		 CMP #$29			
$9149:  90 29		 BCC $9174		   
$914b:  C9 33		 CMP #$33			
$914d:  90 27		 BCC $9176		   
$914f:  C9 43		 CMP #$43			
$9151:  F0 25		 BEQ $9178		   
$9153:  D0 1F		 BNE $9174		   
$9155:  A2 11		 LDX #$11			
$9157:  BD A9 91	  LDA act_codes,X	 ; Action code table
$915a:  CD DB 75	  CMP act_id		  ; Action ID
$915d:  F0 05		 BEQ $9164		   
$915f:  CA			DEX				 
$9160:  10 F5		 BPL $9157		   
$9162:  38			SEC				 
$9163:  60			RTS				 
$9164:  8A			TXA				 
$9165:  0A			ASL				 
$9166:  AA			TAX				 
$9167:  BD CD 91	  LDA act_jmptbl,X	; Action handlers table
$916a:  85 00		 STA tmp0			; Temporary 0
$916c:  BD CE 91	  LDA $91ce,X		 
$916f:  85 01		 STA tmp1			; Temporary 1
$9171:  6C 00 00	  JMP (tmp0)		  ; Temporary 0
$9174:  38			SEC				 
$9175:  60			RTS				 
$9176:  18			CLC				 
$9177:  60			RTS				 
$9178:  AD 99 BB	  LDA base_dmg		; Base damage value
$917b:  85 00		 STA tmp0			; Temporary 0
$917d:  A9 00		 LDA #$00			
$917f:  85 01		 STA tmp1			; Temporary 1
$9181:  AD D9 75	  LDA actor		   ; Acting character
$9184:  A2 00		 LDX #$00			
$9186:  20 27 C8	  JSR $c827		   
$9189:  20 87 81	  JSR div16		   ; Divide by 16
$918c:  A5 01		 LDA tmp1			; Temporary 1
$918e:  F0 04		 BEQ $9194		   
$9190:  A9 FF		 LDA #$ff			
$9192:  85 00		 STA tmp0			; Temporary 0
$9194:  AD EC 75	  LDA rng_val		 ; RNG value
$9197:  C5 00		 CMP tmp0			; Temporary 0
$9199:  60			RTS				 

; --------------------------------------------------
; Hit check type 6
; --------------------------------------------------
hit_6:					 ; $919a
$919a:  A9 06		 LDA #$06			
$919c:  CD EC 75	  CMP rng_val		 ; RNG value
$919f:  60			RTS				 

; --------------------------------------------------
; Clear damage vars
; --------------------------------------------------
clr_dmg:					 ; $91a0
$91a0:  A9 00		 LDA #$00			
$91a2:  8D D4 75	  STA damage_lo	   ; Damage output low
$91a5:  8D D5 75	  STA damage_hi	   ; Damage output high
$91a8:  60			RTS				 

; --------------------------------------------------
; Action code table
; --------------------------------------------------
act_codes:					 ; $91a9
$91a9:  11 17		 ORA (mult_lo),Y	 ; Product low
$91ab:  18			CLC				 
							  ; Data region
		.db $1a, $1b
$91ae:  1D 1E 20	  ORA $201e,X		 
							  ; Data region
		.db $23, $40, $42, $53, $57
$91b6:  58			CLI				 
							  ; Data region
		.db $5b, $5c, $5d, $60, $80, $80, $84, $80, $80, $83, $80
$91c2:  81 80		 STA ($80,X)		 
$91c4:  81 80		 STA ($80,X)		 
$91c6:  81 82		 STA ($82,X)		 
							  ; Data region
		.db $82
$91c9:  81 83		 STA ($83,X)		 
							  ; Data region
		.db $83
$91cc:  81 78		 STA ($78,X)		 
$91ce:  91 78		 STA ($78),Y		 
$91d0:  91 9A		 STA ($9a),Y		 
$91d2:  91 78		 STA ($78),Y		 
$91d4:  91 78		 STA ($78),Y		 
$91d6:  91 9A		 STA ($9a),Y		 
$91d8:  91 78		 STA ($78),Y		 
$91da:  91 76		 STA ($76),Y		 
$91dc:  91 78		 STA ($78),Y		 
$91de:  91 76		 STA ($76),Y		 
$91e0:  91 9A		 STA ($9a),Y		 
$91e2:  91 76		 STA ($76),Y		 
$91e4:  91 76		 STA ($76),Y		 
$91e6:  91 76		 STA ($76),Y		 
$91e8:  91 76		 STA ($76),Y		 
$91ea:  91 9A		 STA ($9a),Y		 
$91ec:  91 76		 STA ($76),Y		 
$91ee:  91 AD		 STA ($ad),Y		 
							  ; Data region
		.db $d3
$91f1:  75 C9		 ADC $c9,X		   
$91f3:  10 90		 BPL $9185		   
							  ; Data region
		.db $03
$91f6:  20 BC B5	  JSR $b5bc		   
$91f9:  0A			ASL				 
$91fa:  AA			TAX				 
$91fb:  BD 4D B7	  LDA stat_tbl_1,X	; Stat modifier table 1
$91fe:  85 8A		 STA char_count	  ; Character count
$9200:  60			RTS				 

; --------------------------------------------------
; Get enemy index
; --------------------------------------------------
get_ene_idx:					 ; $9201
$9201:  AE D3 75	  LDX target		  ; Target index
$9204:  BD 67 B9	  LDA enemy_res_tbl,X ; Enemy resistance table
$9207:  29 1F		 AND #$1f			
$9209:  C9 1F		 CMP #$1f			
$920b:  D0 02		 BNE $920f		   
$920d:  A9 00		 LDA #$00			
$920f:  85 8B		 STA actor_idx	   ; Current actor index
$9211:  60			RTS				 

; --------------------------------------------------
; Sum party stats
; --------------------------------------------------
sum_stats:					 ; $9212
$9212:  A9 00		 LDA #$00			
$9214:  85 01		 STA tmp1			; Temporary 1
$9216:  85 02		 STA tmp2			; Temporary 2
$9218:  A9 07		 LDA #$07			
$921a:  85 81		 STA party_loop	  ; Party loop counter
party_lp:					 ; $921c
$921c:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$921f:  A0 00		 LDY #$00			
$9221:  20 5F 92	  JSR add_stat		; Add stat pair
$9224:  A0 08		 LDY #$08			
$9226:  20 5F 92	  JSR add_stat		; Add stat pair
$9229:  A0 10		 LDY #$10			
$922b:  20 5F 92	  JSR add_stat		; Add stat pair
$922e:  C6 81		 DEC party_loop	  ; Party loop counter
$9230:  10 EA		 BPL party_lp		; -> Party stat loop
$9232:  A9 00		 LDA #$00			
$9234:  85 00		 STA tmp0			; Temporary 0
$9236:  85 04		 STA $04			 
$9238:  A9 B7		 LDA #$b7			
$923a:  85 03		 STA tmp3			; Temporary 3
$923c:  A2 00		 LDX #$00			
$923e:  A0 03		 LDY #$03			
$9240:  20 F4 83	  JSR div24_set	   ; 24-bit div setup
$9243:  A5 02		 LDA tmp2			; Temporary 2
$9245:  F0 06		 BEQ $924d		   
$9247:  A9 FF		 LDA #$ff			
$9249:  85 00		 STA tmp0			; Temporary 0
$924b:  85 01		 STA tmp1			; Temporary 1
$924d:  A5 00		 LDA tmp0			; Temporary 0
$924f:  8D ED 75	  STA stat_sum_lo	 ; Party stat sum low
$9252:  A5 01		 LDA tmp1			; Temporary 1
$9254:  8D EE 75	  STA stat_sum_hi	 ; Party stat sum high
$9257:  05 00		 ORA tmp0			; Temporary 0
$9259:  D0 03		 BNE $925e		   
$925b:  EE ED 75	  INC stat_sum_lo	 ; Party stat sum low
$925e:  60			RTS				 

; --------------------------------------------------
; Add stat pair
; --------------------------------------------------
add_stat:					 ; $925f
$925f:  A9 03		 LDA #$03			
$9261:  85 82		 STA inner_loop	  ; Inner loop counter
$9263:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$9265:  65 01		 ADC tmp1			; Temporary 1
$9267:  85 01		 STA tmp1			; Temporary 1
$9269:  C8			INY				 
$926a:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$926c:  65 02		 ADC tmp2			; Temporary 2
$926e:  85 02		 STA tmp2			; Temporary 2
$9270:  C8			INY				 
$9271:  C6 82		 DEC inner_loop	  ; Inner loop counter
$9273:  10 EE		 BPL $9263		   
$9275:  60			RTS				 

; --------------------------------------------------
; Stat table lookup
; --------------------------------------------------
stat_lookup:					 ; $9276
$9276:  AE D3 75	  LDX target		  ; Target index
$9279:  BD 0B B8	  LDA spell_eff_tbl,X ; Spell effect type table
$927c:  29 1F		 AND #$1f			
$927e:  AA			TAX				 
$927f:  BD CC 94	  LDA $94cc,X		 
$9282:  20 E2 92	  JSR $92e2		   
$9285:  85 00		 STA tmp0			; Temporary 0
$9287:  A9 00		 LDA #$00			
$9289:  AE D3 75	  LDX target		  ; Target index
$928c:  E0 18		 CPX #$18			
$928e:  D0 04		 BNE $9294		   
$9290:  A9 04		 LDA #$04			
$9292:  D0 06		 BNE $929a		   
$9294:  E0 1F		 CPX #$1f			
$9296:  D0 02		 BNE $929a		   
$9298:  A9 04		 LDA #$04			
$929a:  18			CLC				 
$929b:  65 00		 ADC tmp0			; Temporary 0
$929d:  85 00		 STA tmp0			; Temporary 0
$929f:  A6 81		 LDX party_loop	  ; Party loop counter
$92a1:  20 9C 89	  JSR $899c		   
$92a4:  A0 0D		 LDY #$0d			
$92a6:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$92a8:  29 03		 AND #$03			
$92aa:  AA			TAX				 
$92ab:  A5 00		 LDA tmp0			; Temporary 0
$92ad:  48			PHA				 
$92ae:  BD 06 72	  LDA $7206,X		 
$92b1:  20 B4 B0	  JSR bit_rot		 ; Bit rotation
$92b4:  A8			TAY				 
$92b5:  68			PLA				 
$92b6:  0A			ASL				 
$92b7:  85 00		 STA tmp0			; Temporary 0
$92b9:  98			TYA				 
$92ba:  0A			ASL				 
$92bb:  0A			ASL				 
$92bc:  0A			ASL				 
$92bd:  0A			ASL				 
$92be:  65 00		 ADC tmp0			; Temporary 0
$92c0:  A8			TAY				 
$92c1:  B9 DC 94	  LDA $94dc,Y		 
$92c4:  85 00		 STA tmp0			; Temporary 0
$92c6:  A9 00		 LDA #$00			
$92c8:  85 01		 STA tmp1			; Temporary 1
$92ca:  20 91 C8	  JSR $c891		   
$92cd:  A2 00		 LDX #$00			
$92cf:  20 27 C8	  JSR $c827		   
$92d2:  B9 DB 94	  LDA $94db,Y		 
$92d5:  18			CLC				 
$92d6:  65 01		 ADC tmp1			; Temporary 1
$92d8:  4A			LSR				 
$92d9:  C9 10		 CMP #$10			
$92db:  90 02		 BCC $92df		   
$92dd:  A9 10		 LDA #$10			
$92df:  85 8C		 STA action_param	; Action parameter
$92e1:  60			RTS				 

; ------------------------------
sub_92E2:
$92e2:  48			PHA				 
$92e3:  29 03		 AND #$03			
$92e5:  85 00		 STA tmp0			; Temporary 0
$92e7:  68			PLA				 
$92e8:  29 FC		 AND #$fc			
$92ea:  4A			LSR				 
$92eb:  4A			LSR				 
$92ec:  85 01		 STA tmp1			; Temporary 1
$92ee:  A5 81		 LDA party_loop	  ; Party loop counter
$92f0:  0A			ASL				 
$92f1:  0A			ASL				 
$92f2:  65 01		 ADC tmp1			; Temporary 1
$92f4:  A8			TAY				 
$92f5:  B9 4B 75	  LDA $754b,Y		 
$92f8:  A6 00		 LDX tmp0			; Temporary 0
$92fa:  F0 05		 BEQ $9301		   
$92fc:  4A			LSR				 
$92fd:  4A			LSR				 
$92fe:  CA			DEX				 
$92ff:  D0 FB		 BNE $92fc		   
$9301:  29 03		 AND #$03			
$9303:  60			RTS				 

; ------------------------------
sub_9304:
$9304:  85 02		 STA tmp2			; Temporary 2
$9306:  A9 00		 LDA #$00			
$9308:  85 03		 STA tmp3			; Temporary 3
$930a:  A9 07		 LDA #$07			
$930c:  20 14 93	  JSR $9314		   
$930f:  C6 81		 DEC party_loop	  ; Party loop counter
$9311:  10 F9		 BPL $930c		   
$9313:  60			RTS				 

; ------------------------------
sub_9314:
$9314:  A6 02		 LDX tmp2			; Temporary 2
$9316:  BD 0B B8	  LDA spell_eff_tbl,X ; Spell effect type table
$9319:  29 1F		 AND #$1f			
$931b:  AA			TAX				 
$931c:  BD CC 94	  LDA $94cc,X		 
$931f:  48			PHA				 
$9320:  29 03		 AND #$03			
$9322:  85 00		 STA tmp0			; Temporary 0
$9324:  68			PLA				 
$9325:  29 FC		 AND #$fc			
$9327:  4A			LSR				 
$9328:  4A			LSR				 
$9329:  85 01		 STA tmp1			; Temporary 1
$932b:  A5 81		 LDA party_loop	  ; Party loop counter
$932d:  0A			ASL				 
$932e:  0A			ASL				 
$932f:  65 01		 ADC tmp1			; Temporary 1
$9331:  A8			TAY				 
$9332:  B9 4B 75	  LDA $754b,Y		 
$9335:  A6 00		 LDX tmp0			; Temporary 0
$9337:  F0 05		 BEQ $933e		   
$9339:  4A			LSR				 
$933a:  4A			LSR				 
$933b:  CA			DEX				 
$933c:  D0 FB		 BNE $9339		   
$933e:  29 03		 AND #$03			
$9340:  AA			TAX				 
$9341:  BD DB 94	  LDA $94db,X		 
$9344:  18			CLC				 
$9345:  65 03		 ADC tmp3			; Temporary 3
$9347:  85 03		 STA tmp3			; Temporary 3
$9349:  60			RTS				 

; ------------------------------
sub_934A:
$934a:  AD D3 75	  LDA target		  ; Target index
$934d:  20 20 B6	  JSR $b620		   
$9350:  0A			ASL				 
$9351:  AA			TAX				 
$9352:  BD E3 B7	  LDA $b7e3,X		 
$9355:  85 8A		 STA char_count	  ; Character count
$9357:  BD E4 B7	  LDA $b7e4,X		 
$935a:  4A			LSR				 
$935b:  18			CLC				 
$935c:  65 8A		 ADC char_count	  ; Character count
$935e:  90 02		 BCC $9362		   
$9360:  A9 FF		 LDA #$ff			
$9362:  85 8A		 STA char_count	  ; Character count
$9364:  60			RTS				 

; --------------------------------------------------
; Get tactics spell 1
; --------------------------------------------------
get_tact_1:					 ; $9365
$9365:  8A			TXA				 
$9366:  48			PHA				 
$9367:  20 8B 93	  JSR calc_tact	   ; Calc tactics index
$936a:  BD A5 BA	  LDA tact_sp_2,X	 ; Tactics spell data 2
$936d:  8D 11 6E	  STA div_rem_lo	  ; Division remainder low
$9370:  68			PLA				 
$9371:  AA			TAX				 
$9372:  AD 11 6E	  LDA div_rem_lo	  ; Division remainder low
$9375:  60			RTS				 
$9376:  AD 68 73	  LDA $7368		   
$9379:  60			RTS				 

; --------------------------------------------------
; Get tactics spell 2
; --------------------------------------------------
get_tact_2:					 ; $937a
$937a:  8A			TXA				 
$937b:  48			PHA				 
$937c:  20 8B 93	  JSR calc_tact	   ; Calc tactics index
$937f:  BD D5 BA	  LDA tact_sp_3,X	 ; Tactics spell data 3
$9382:  8D 11 6E	  STA div_rem_lo	  ; Division remainder low
$9385:  68			PLA				 
$9386:  AA			TAX				 
$9387:  AD 11 6E	  LDA div_rem_lo	  ; Division remainder low
$938a:  60			RTS				 

; --------------------------------------------------
; Calc tactics index
; --------------------------------------------------
calc_tact:					 ; $938b
$938b:  AD 80 6E	  LDA action_type	 ; Current action type
$938e:  0A			ASL				 
$938f:  0A			ASL				 
$9390:  0A			ASL				 
$9391:  38			SEC				 
$9392:  ED 80 6E	  SBC action_type	 ; Current action type
$9395:  6D E8 75	  ADC spell_idx	   ; Spell index
$9398:  AA			TAX				 
$9399:  60			RTS				 

; --------------------------------------------------
; Get tactics spell 3
; --------------------------------------------------
get_tact_3:					 ; $939a
$939a:  8A			TXA				 
$939b:  48			PHA				 
$939c:  20 8B 93	  JSR calc_tact	   ; Calc tactics index
$939f:  BD 74 BA	  LDA tact_sp_1,X	 ; Tactics spell data 1
$93a2:  8D 11 6E	  STA div_rem_lo	  ; Division remainder low
$93a5:  68			PLA				 
$93a6:  AA			TAX				 
$93a7:  AD 11 6E	  LDA div_rem_lo	  ; Division remainder low
$93aa:  60			RTS				 

; ------------------------------
sub_93AB:
$93ab:  A5 81		 LDA party_loop	  ; Party loop counter
$93ad:  09 80		 ORA #$80			
$93af:  8D D2 75	  STA act_type		; Action type
$93b2:  D0 0E		 BNE $93c2		   
sub_93B4:
$93b4:  A5 8D		 LDA $8d			 
$93b6:  09 88		 ORA #$88			
$93b8:  8D D2 75	  STA act_type		; Action type
$93bb:  D0 05		 BNE $93c2		   
sub_93BD:
$93bd:  A9 80		 LDA #$80			
$93bf:  8D D2 75	  STA act_type		; Action type
sub_93C2:
$93c2:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$93c5:  10 08		 BPL $93cf		   
$93c7:  AD D2 75	  LDA act_type		; Action type
$93ca:  09 20		 ORA #$20			
$93cc:  8D D2 75	  STA act_type		; Action type
$93cf:  60			RTS				 

; ------------------------------
sub_93D0:
$93d0:  20 E1 93	  JSR $93e1		   
$93d3:  90 0A		 BCC $93df		   
$93d5:  AD 5B 73	  LDA $735b		   
$93d8:  DD 48 73	  CMP $7348,X		 
$93db:  90 02		 BCC $93df		   
$93dd:  18			CLC				 
$93de:  60			RTS				 
$93df:  38			SEC				 
$93e0:  60			RTS				 

; ------------------------------
sub_93E1:
$93e1:  A2 03		 LDX #$03			
$93e3:  BD F4 72	  LDA char_state,X	; Character state array
$93e6:  30 17		 BMI $93ff		   
$93e8:  29 70		 AND #$70			
$93ea:  C9 02		 CMP #$02			
$93ec:  B0 11		 BCS $93ff		   
$93ee:  BD F4 72	  LDA char_state,X	; Character state array
$93f1:  29 0F		 AND #$0f			
$93f3:  A8			TAY				 
$93f4:  B9 EA 72	  LDA $72ea,Y		 
$93f7:  29 7F		 AND #$7f			
$93f9:  F0 09		 BEQ $9404		   
$93fb:  C9 08		 CMP #$08			
$93fd:  F0 05		 BEQ $9404		   
$93ff:  CA			DEX				 
$9400:  10 E1		 BPL $93e3		   
$9402:  18			CLC				 
$9403:  60			RTS				 
$9404:  38			SEC				 
$9405:  60			RTS				 

; ------------------------------
sub_9406:
$9406:  A0 00		 LDY #$00			
$9408:  AD DB 75	  LDA act_id		  ; Action ID
$940b:  C9 FF		 CMP #$ff			
$940d:  F0 3E		 BEQ $944d		   
$940f:  C9 15		 CMP #$15			
$9411:  90 42		 BCC $9455		   
$9413:  C9 17		 CMP #$17			
$9415:  90 36		 BCC $944d		   
$9417:  C9 1C		 CMP #$1c			
$9419:  90 44		 BCC $945f		   
$941b:  C9 1E		 CMP #$1e			
$941d:  F0 40		 BEQ $945f		   
$941f:  C9 29		 CMP #$29			
$9421:  90 40		 BCC $9463		   
$9423:  C9 2E		 CMP #$2e			
$9425:  90 30		 BCC $9457		   
$9427:  C9 33		 CMP #$33			
$9429:  90 30		 BCC $945b		   
$942b:  C9 3C		 CMP #$3c			
$942d:  90 1E		 BCC $944d		   
$942f:  A0 80		 LDY #$80			
$9431:  C9 43		 CMP #$43			
$9433:  F0 20		 BEQ $9455		   
$9435:  C9 41		 CMP #$41			
$9437:  F0 14		 BEQ $944d		   
$9439:  AD DA 75	  LDA act_cat		 ; Action category
$943c:  29 70		 AND #$70			
$943e:  F0 0D		 BEQ $944d		   
$9440:  A2 11		 LDX #$11			
$9442:  BD A9 91	  LDA act_codes,X	 ; Action code table
$9445:  CD F2 75	  CMP $75f2		   
$9448:  F0 07		 BEQ $9451		   
$944a:  CA			DEX				 
$944b:  10 F5		 BPL $9442		   
$944d:  98			TYA				 
$944e:  09 05		 ORA #$05			
$9450:  60			RTS				 
$9451:  BD BB 91	  LDA $91bb,X		 
$9454:  60			RTS				 
$9455:  98			TYA				 
$9456:  60			RTS				 
$9457:  98			TYA				 
$9458:  09 01		 ORA #$01			
$945a:  60			RTS				 
$945b:  98			TYA				 
$945c:  09 02		 ORA #$02			
$945e:  60			RTS				 
$945f:  98			TYA				 
$9460:  09 03		 ORA #$03			
$9462:  60			RTS				 
$9463:  98			TYA				 
$9464:  09 04		 ORA #$04			
$9466:  60			RTS				 

; ------------------------------
sub_9467:
$9467:  18			CLC				 
$9468:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$946a:  75 00		 ADC $00,X		   
$946c:  95 00		 STA $00,X		   
$946e:  C8			INY				 
$946f:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$9471:  75 01		 ADC $01,X		   
$9473:  95 01		 STA $01,X		   
$9475:  C8			INY				 
$9476:  60			RTS				 

; ------------------------------
sub_9477:
$9477:  8A			TXA				 
$9478:  48			PHA				 
$9479:  A2 00		 LDX #$00			
$947b:  20 67 94	  JSR $9467		   
$947e:  68			PLA				 
$947f:  AA			TAX				 
$9480:  60			RTS				 
$9481:  B9 00 00	  LDA tmp0,Y		  ; Temporary 0
$9484:  85 19		 STA mult_hi		 ; Product high
$9486:  B9 01 00	  LDA tmp1,Y		  ; Temporary 1
$9489:  85 1A		 STA mult_ext		; Product extended
$948b:  98			TYA				 
$948c:  48			PHA				 
$948d:  A0 18		 LDY #$18			
$948f:  A9 00		 LDA #$00			
$9491:  85 1B		 STA $1b			 
$9493:  85 16		 STA mult_a		  ; Multiplier A
$9495:  85 17		 STA mult_lo		 ; Product low
$9497:  85 18		 STA mult_mid		; Product mid
$9499:  16 00		 ASL $00,X		   
$949b:  36 01		 ROL $01,X		   
$949d:  36 02		 ROL $02,X		   
$949f:  26 16		 ROL mult_a		  ; Multiplier A
$94a1:  26 17		 ROL mult_lo		 ; Product low
$94a3:  26 18		 ROL mult_mid		; Product mid
$94a5:  F6 00		 INC $00,X		   
$94a7:  A5 16		 LDA mult_a		  ; Multiplier A
$94a9:  38			SEC				 
$94aa:  E5 19		 SBC mult_hi		 ; Product high
$94ac:  48			PHA				 
$94ad:  A5 17		 LDA mult_lo		 ; Product low
$94af:  E5 1A		 SBC mult_ext		; Product extended
$94b1:  48			PHA				 
$94b2:  A5 18		 LDA mult_mid		; Product mid
$94b4:  E5 1B		 SBC $1b			 
$94b6:  B0 06		 BCS $94be		   
$94b8:  D6 00		 DEC $00,X		   
$94ba:  68			PLA				 
$94bb:  68			PLA				 
$94bc:  90 08		 BCC $94c6		   
$94be:  85 18		 STA mult_mid		; Product mid
$94c0:  68			PLA				 
$94c1:  85 17		 STA mult_lo		 ; Product low
$94c3:  68			PLA				 
$94c4:  85 16		 STA mult_a		  ; Multiplier A
$94c6:  88			DEY				 
$94c7:  D0 D0		 BNE $9499		   
$94c9:  68			PLA				 
$94ca:  A8			TAY				 
$94cb:  60			RTS				 
							  ; Data region
		.db $02
$94cd:  01 00		 ORA ($00,X)		 
$94cf:  05 04		 ORA $04			 
							  ; Data region
		.db $03
$94d2:  08			PHP				 
							  ; Data region
		.db $07
$94d4:  06 0B		 ASL $0b			 
$94d6:  0A			ASL				 
$94d7:  09 0E		 ORA #$0e			
$94d9:  0D 0C 4C	  ORA $4c0c		   
$94dc:  35 33		 AND $33,X		   
$94de:  4C 19 4D	  JMP $4d19		   
$94e1:  00			BRK				 
$94e2:  66 4C		 ROR $4c			 
$94e4:  35 4C		 AND $4c,X		   
$94e6:  35 26		 AND $26,X		   
$94e8:  4D 00 66	  EOR $6600		   
							  ; Data region
		.db $5a, $33, $40, $33, $26, $33, $00, $33, $5a, $33, $5a, $33, $33, $33
$94f9:  00			BRK				 
							  ; Data region
		.db $33, $5a
$94fc:  28			PLP				 
$94fd:  4D 26 26	  EOR $2626		   
$9500:  26 00		 ROL tmp0			; Temporary 0
$9502:  26 5A		 ROL $5a			 
$9504:  28			PLP				 
							  ; Data region
		.db $5a
$9506:  28			PLP				 
$9507:  39 26 00	  AND $0026,Y		 
$950a:  26 80		 ROL $80			 
$950c:  00			BRK				 
$950d:  6D 00 33	  ADC $3300		   
$9510:  00			BRK				 
$9511:  00			BRK				 
$9512:  00			BRK				 
							  ; Data region
		.db $80
$9514:  00			BRK				 
							  ; Data region
		.db $80
$9516:  00			BRK				 
							  ; Data region
		.db $5a
$9518:  00			BRK				 
$9519:  00			BRK				 
$951a:  00			BRK				 
$951b:  20 EF 91	  JSR $91ef		   
$951e:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$9521:  A9 07		 LDA #$07			
$9523:  85 81		 STA party_loop	  ; Party loop counter
$9525:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$9528:  20 AB 93	  JSR $93ab		   
$952b:  20 B8 95	  JSR $95b8		   
$952e:  C6 81		 DEC party_loop	  ; Party loop counter
$9530:  10 F3		 BPL $9525		   
$9532:  60			RTS				 
$9533:  20 EF 91	  JSR $91ef		   
$9536:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$9539:  A9 03		 LDA #$03			
$953b:  85 8D		 STA $8d			 
$953d:  20 B4 93	  JSR $93b4		   
$9540:  20 11 96	  JSR $9611		   
$9543:  C6 8D		 DEC $8d			 
$9545:  10 F6		 BPL $953d		   
$9547:  60			RTS				 
$9548:  20 EF 91	  JSR $91ef		   
$954b:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$954e:  20 BD 93	  JSR $93bd		   
$9551:  4C 37 96	  JMP $9637		   
$9554:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$9557:  A9 07		 LDA #$07			
$9559:  85 81		 STA party_loop	  ; Party loop counter
$955b:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$955e:  20 AB 93	  JSR $93ab		   
$9561:  20 A0 96	  JSR $96a0		   
$9564:  C6 81		 DEC party_loop	  ; Party loop counter
$9566:  10 F3		 BPL $955b		   
$9568:  60			RTS				 
$9569:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$956c:  A9 03		 LDA #$03			
$956e:  85 8D		 STA $8d			 
$9570:  20 B4 93	  JSR $93b4		   
$9573:  20 F3 96	  JSR $96f3		   
$9576:  C6 8D		 DEC $8d			 
$9578:  10 F6		 BPL $9570		   
$957a:  60			RTS				 
$957b:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$957e:  20 BD 93	  JSR $93bd		   
$9581:  4C 1C 97	  JMP $971c		   

; --------------------------------------------------
; Setup action
; --------------------------------------------------
setup_act:					 ; $9584
$9584:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$9587:  29 7F		 AND #$7f			
$9589:  8D F0 75	  STA btl_f0		  ; Battle flag F0
$958c:  A9 43		 LDA #$43			
$958e:  8D D3 75	  STA target		  ; Target index
$9591:  A9 00		 LDA #$00			
$9593:  85 8B		 STA actor_idx	   ; Current actor index
$9595:  A9 10		 LDA #$10			
$9597:  85 8C		 STA action_param	; Action parameter
$9599:  A9 07		 LDA #$07			
$959b:  85 81		 STA party_loop	  ; Party loop counter
$959d:  20 AB 93	  JSR $93ab		   
$95a0:  A6 81		 LDX party_loop	  ; Party loop counter
$95a2:  A9 40		 LDA #$40			
$95a4:  20 F2 85	  JSR $85f2		   
$95a7:  F0 0A		 BEQ $95b3		   
$95a9:  C8			INY				 
$95aa:  A9 02		 LDA #$02			
$95ac:  31 86		 AND (stat_ptr_lo),Y ; Stat table pointer low
$95ae:  D0 03		 BNE $95b3		   
$95b0:  20 36 97	  JSR $9736		   
$95b3:  C6 81		 DEC party_loop	  ; Party loop counter
$95b5:  10 E6		 BPL $959d		   
$95b7:  60			RTS				 

; ------------------------------
sub_95B8:
$95b8:  20 58 96	  JSR $9658		   
$95bb:  20 C5 95	  JSR $95c5		   
$95be:  A5 0F		 LDA $0f			 
$95c0:  10 3A		 BPL $95fc		   
$95c2:  4C C2 A9	  JMP $a9c2		   

; ------------------------------
sub_95C5:
$95c5:  A9 00		 LDA #$00			
$95c7:  85 00		 STA tmp0			; Temporary 0
$95c9:  85 01		 STA tmp1			; Temporary 1
$95cb:  85 0F		 STA $0f			 
$95cd:  A6 81		 LDX party_loop	  ; Party loop counter
$95cf:  A9 40		 LDA #$40			
$95d1:  20 F2 85	  JSR $85f2		   
$95d4:  F0 26		 BEQ $95fc		   
$95d6:  88			DEY				 
$95d7:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$95da:  30 06		 BMI $95e2		   
$95dc:  A9 C0		 LDA #$c0			
$95de:  31 86		 AND (stat_ptr_lo),Y ; Stat table pointer low
$95e0:  D0 1B		 BNE $95fd		   
$95e2:  C8			INY				 
$95e3:  C8			INY				 
$95e4:  A9 02		 LDA #$02			
$95e6:  31 86		 AND (stat_ptr_lo),Y ; Stat table pointer low
$95e8:  D0 12		 BNE $95fc		   
$95ea:  A5 8C		 LDA action_param	; Action parameter
$95ec:  F0 0E		 BEQ $95fc		   
$95ee:  C6 0F		 DEC $0f			 
$95f0:  20 66 97	  JSR $9766		   
$95f3:  20 A3 97	  JSR $97a3		   
$95f6:  20 C0 97	  JSR $97c0		   
$95f9:  20 00 98	  JSR $9800		   
$95fc:  60			RTS				 
$95fd:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$95ff:  0A			ASL				 
$9600:  10 FA		 BPL $95fc		   
$9602:  A5 8A		 LDA char_count	  ; Character count
$9604:  18			CLC				 
$9605:  6D E1 75	  ADC power_lo		; Action power low
$9608:  8D E1 75	  STA power_lo		; Action power low
$960b:  90 03		 BCC $9610		   
$960d:  EE E2 75	  INC power_hi		; Action power high
$9610:  60			RTS				 

; ------------------------------
sub_9611:
$9611:  20 58 96	  JSR $9658		   
$9614:  A9 07		 LDA #$07			
$9616:  85 81		 STA party_loop	  ; Party loop counter
$9618:  20 02 86	  JSR $8602		   
$961b:  D0 10		 BNE $962d		   
$961d:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$9620:  20 C5 95	  JSR $95c5		   
$9623:  A5 0F		 LDA $0f			 
$9625:  F0 06		 BEQ $962d		   
$9627:  20 6B 96	  JSR $966b		   
$962a:  20 7D 96	  JSR $967d		   
$962d:  C6 81		 DEC party_loop	  ; Party loop counter
$962f:  10 E7		 BPL $9618		   
$9631:  20 95 96	  JSR $9695		   
$9634:  4C C2 A9	  JMP $a9c2		   
$9637:  20 58 96	  JSR $9658		   
$963a:  A9 07		 LDA #$07			
$963c:  85 81		 STA party_loop	  ; Party loop counter
$963e:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$9641:  20 C5 95	  JSR $95c5		   
$9644:  A5 0F		 LDA $0f			 
$9646:  F0 06		 BEQ $964e		   
$9648:  20 6B 96	  JSR $966b		   
$964b:  20 7D 96	  JSR $967d		   
$964e:  C6 81		 DEC party_loop	  ; Party loop counter
$9650:  10 EC		 BPL $963e		   
$9652:  20 95 96	  JSR $9695		   
$9655:  4C C2 A9	  JMP $a9c2		   

; ------------------------------
sub_9658:
$9658:  A9 00		 LDA #$00			
$965a:  8D DF 75	  STA $75df		   
$965d:  8D E0 75	  STA $75e0		   
$9660:  8D E1 75	  STA power_lo		; Action power low
$9663:  8D E2 75	  STA power_hi		; Action power high
$9666:  85 02		 STA tmp2			; Temporary 2
$9668:  85 03		 STA tmp3			; Temporary 3
$966a:  60			RTS				 

; ------------------------------
sub_966B:
$966b:  18			CLC				 
$966c:  A5 00		 LDA tmp0			; Temporary 0
$966e:  6D DF 75	  ADC $75df		   
$9671:  8D DF 75	  STA $75df		   
$9674:  A5 01		 LDA tmp1			; Temporary 1
$9676:  6D E0 75	  ADC $75e0		   
$9679:  8D E0 75	  STA $75e0		   
$967c:  60			RTS				 

; ------------------------------
sub_967D:
$967d:  AD D1 75	  LDA act_ptr		 ; Action pointer
$9680:  65 02		 ADC tmp2			; Temporary 2
$9682:  85 02		 STA tmp2			; Temporary 2
$9684:  90 02		 BCC $9688		   
$9686:  E6 03		 INC tmp3			; Temporary 3
$9688:  AD DF 75	  LDA $75df		   
$968b:  0D E0 75	  ORA $75e0		   
$968e:  F0 04		 BEQ $9694		   
$9690:  46 03		 LSR tmp3			; Temporary 3
$9692:  66 02		 ROR tmp2			; Temporary 2
$9694:  60			RTS				 

; ------------------------------
sub_9695:
$9695:  AD DF 75	  LDA $75df		   
$9698:  85 00		 STA tmp0			; Temporary 0
$969a:  AD E0 75	  LDA $75e0		   
$969d:  85 01		 STA tmp1			; Temporary 1
$969f:  60			RTS				 

; ------------------------------
sub_96A0:
$96a0:  20 58 96	  JSR $9658		   
$96a3:  20 AD 96	  JSR $96ad		   
$96a6:  A5 0F		 LDA $0f			 
$96a8:  10 1B		 BPL $96c5		   
$96aa:  4C C2 A9	  JMP $a9c2		   

; ------------------------------
sub_96AD:
$96ad:  20 C6 96	  JSR $96c6		   
$96b0:  90 13		 BCC $96c5		   
$96b2:  C6 0F		 DEC $0f			 
$96b4:  A9 10		 LDA #$10			
$96b6:  8D D1 75	  STA act_ptr		 ; Action pointer
$96b9:  20 A3 97	  JSR $97a3		   
$96bc:  20 C0 97	  JSR $97c0		   
$96bf:  20 00 98	  JSR $9800		   
$96c2:  20 D7 97	  JSR $97d7		   
$96c5:  60			RTS				 

; ------------------------------
sub_96C6:
$96c6:  A9 00		 LDA #$00			
$96c8:  85 00		 STA tmp0			; Temporary 0
$96ca:  85 01		 STA tmp1			; Temporary 1
$96cc:  85 0F		 STA $0f			 
$96ce:  A6 81		 LDX party_loop	  ; Party loop counter
$96d0:  A9 40		 LDA #$40			
$96d2:  20 F2 85	  JSR $85f2		   
$96d5:  F0 1A		 BEQ $96f1		   
$96d7:  88			DEY				 
$96d8:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$96db:  30 06		 BMI $96e3		   
$96dd:  A9 C0		 LDA #$c0			
$96df:  31 86		 AND (stat_ptr_lo),Y ; Stat table pointer low
$96e1:  D0 0E		 BNE $96f1		   
$96e3:  C8			INY				 
$96e4:  C8			INY				 
$96e5:  A9 02		 LDA #$02			
$96e7:  31 86		 AND (stat_ptr_lo),Y ; Stat table pointer low
$96e9:  D0 06		 BNE $96f1		   
$96eb:  A5 8C		 LDA action_param	; Action parameter
$96ed:  F0 02		 BEQ $96f1		   
$96ef:  38			SEC				 
$96f0:  60			RTS				 
$96f1:  18			CLC				 
$96f2:  60			RTS				 

; ------------------------------
sub_96F3:
$96f3:  20 58 96	  JSR $9658		   
$96f6:  A9 07		 LDA #$07			
$96f8:  85 81		 STA party_loop	  ; Party loop counter
$96fa:  20 02 86	  JSR $8602		   
$96fd:  D0 12		 BNE $9711		   
$96ff:  A6 81		 LDX party_loop	  ; Party loop counter
$9701:  A9 40		 LDA #$40			
$9703:  20 EE 85	  JSR $85ee		   
$9706:  D0 13		 BNE $971b		   
$9708:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$970b:  20 AD 96	  JSR $96ad		   
$970e:  20 6B 96	  JSR $966b		   
$9711:  C6 81		 DEC party_loop	  ; Party loop counter
$9713:  10 E5		 BPL $96fa		   
$9715:  20 95 96	  JSR $9695		   
$9718:  4C C2 A9	  JMP $a9c2		   
$971b:  60			RTS				 
$971c:  20 58 96	  JSR $9658		   
$971f:  A9 07		 LDA #$07			
$9721:  85 81		 STA party_loop	  ; Party loop counter
$9723:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$9726:  20 AD 96	  JSR $96ad		   
$9729:  20 6B 96	  JSR $966b		   
$972c:  C6 81		 DEC party_loop	  ; Party loop counter
$972e:  10 F3		 BPL $9723		   
$9730:  20 95 96	  JSR $9695		   
$9733:  4C C2 A9	  JMP $a9c2		   

; ------------------------------
sub_9736:
$9736:  20 58 96	  JSR $9658		   
$9739:  AD E8 75	  LDA spell_idx	   ; Spell index
$973c:  20 20 87	  JSR $8720		   
$973f:  A6 81		 LDX party_loop	  ; Party loop counter
$9741:  20 11 88	  JSR $8811		   
$9744:  20 23 88	  JSR $8823		   
$9747:  A5 94		 LDA $94			 
$9749:  05 95		 ORA $95			 
$974b:  D0 02		 BNE $974f		   
$974d:  E6 94		 INC $94			 
$974f:  A5 94		 LDA $94			 
$9751:  85 02		 STA tmp2			; Temporary 2
$9753:  A5 95		 LDA $95			 
$9755:  85 03		 STA tmp3			; Temporary 3
$9757:  20 7C 97	  JSR $977c		   
$975a:  20 A3 97	  JSR $97a3		   
$975d:  20 C0 97	  JSR $97c0		   
$9760:  20 00 98	  JSR $9800		   
$9763:  4C C2 A9	  JMP $a9c2		   

; ------------------------------
sub_9766:
$9766:  20 87 97	  JSR $9787		   
$9769:  A5 8A		 LDA char_count	  ; Character count
$976b:  20 51 C8	  JSR $c851		   
$976e:  A5 01		 LDA tmp1			; Temporary 1
$9770:  F0 04		 BEQ $9776		   
$9772:  A9 FF		 LDA #$ff			
$9774:  85 00		 STA tmp0			; Temporary 0
$9776:  A5 00		 LDA tmp0			; Temporary 0
$9778:  8D D1 75	  STA act_ptr		 ; Action pointer
$977b:  60			RTS				 

; ------------------------------
sub_977C:
$977c:  20 87 97	  JSR $9787		   
$977f:  A0 02		 LDY #$02			
$9781:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$9784:  4C 6E 97	  JMP $976e		   

; ------------------------------
sub_9787:
$9787:  A6 81		 LDX party_loop	  ; Party loop counter
$9789:  20 C7 86	  JSR $86c7		   
$978c:  AD 80 6E	  LDA action_type	 ; Current action type
$978f:  C9 06		 CMP #$06			
$9791:  D0 0B		 BNE $979e		   
$9793:  18			CLC				 
$9794:  A5 00		 LDA tmp0			; Temporary 0
$9796:  69 64		 ADC #$64			
$9798:  85 00		 STA tmp0			; Temporary 0
$979a:  90 02		 BCC $979e		   
$979c:  E6 01		 INC tmp1			; Temporary 1
$979e:  A2 00		 LDX #$00			
$97a0:  4C 76 81	  JMP mul16		   ; Multiply by 16

; ------------------------------
sub_97A3:
$97a3:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$97a6:  A0 36		 LDY #$36			
$97a8:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$97aa:  85 00		 STA tmp0			; Temporary 0
$97ac:  C8			INY				 
$97ad:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$97af:  85 01		 STA tmp1			; Temporary 1
$97b1:  A0 38		 LDY #$38			
$97b3:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$97b5:  48			PHA				 
$97b6:  C8			INY				 
$97b7:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$97b9:  A8			TAY				 
$97ba:  68			PLA				 
$97bb:  A2 00		 LDX #$00			
$97bd:  4C 1D C8	  JMP $c81d		   

; ------------------------------
sub_97C0:
$97c0:  A2 00		 LDX #$00			
$97c2:  20 76 81	  JSR mul16		   ; Multiply by 16
$97c5:  AD D1 75	  LDA act_ptr		 ; Action pointer
$97c8:  29 F0		 AND #$f0			
$97ca:  D0 04		 BNE $97d0		   
$97cc:  A9 10		 LDA #$10			
$97ce:  D0 03		 BNE $97d3		   
$97d0:  AD D1 75	  LDA act_ptr		 ; Action pointer
$97d3:  4C 51 C8	  JMP $c851		   
$97d6:  60			RTS				 

; ------------------------------
sub_97D7:
$97d7:  A5 00		 LDA tmp0			; Temporary 0
$97d9:  48			PHA				 
$97da:  A5 01		 LDA tmp1			; Temporary 1
$97dc:  48			PHA				 
$97dd:  00			BRK				 
							  ; Data region
		.db $0f, $8f
$97e0:  A6 81		 LDX party_loop	  ; Party loop counter
$97e2:  20 C7 86	  JSR $86c7		   
$97e5:  A2 00		 LDX #$00			
$97e7:  A0 02		 LDY #$02			
$97e9:  20 76 81	  JSR mul16		   ; Multiply by 16
$97ec:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$97ef:  A5 00		 LDA tmp0			; Temporary 0
$97f1:  29 1F		 AND #$1f			
$97f3:  85 02		 STA tmp2			; Temporary 2
$97f5:  68			PLA				 
$97f6:  85 01		 STA tmp1			; Temporary 1
$97f8:  68			PLA				 
$97f9:  85 00		 STA tmp0			; Temporary 0
$97fb:  A5 02		 LDA tmp2			; Temporary 2
$97fd:  4C 9A 81	  JMP $819a		   

; ------------------------------
sub_9800:
$9800:  A5 8C		 LDA action_param	; Action parameter
$9802:  C9 10		 CMP #$10			
$9804:  B0 D0		 BCS $97d6		   
$9806:  A2 00		 LDX #$00			
$9808:  4C 9A 81	  JMP $819a		   
$980b:  A9 00		 LDA #$00			
$980d:  8D D2 75	  STA act_type		; Action type
$9810:  20 C5 99	  JSR $99c5		   
$9813:  A9 00		 LDA #$00			
$9815:  85 82		 STA inner_loop	  ; Inner loop counter
$9817:  A5 7B		 LDA calc_hit		; Calculated hit value
$9819:  29 03		 AND #$03			
$981b:  F0 03		 BEQ $9820		   
$981d:  20 26 AD	  JSR $ad26		   
$9820:  20 4A 93	  JSR $934a		   
$9823:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$9826:  20 B5 8A	  JSR $8ab5		   
$9829:  8D D2 75	  STA act_type		; Action type
$982c:  20 C2 93	  JSR $93c2		   
$982f:  A5 7B		 LDA calc_hit		; Calculated hit value
$9831:  46 7B		 LSR calc_hit		; Calculated hit value
$9833:  46 7B		 LSR calc_hit		; Calculated hit value
$9835:  29 03		 AND #$03			
$9837:  F0 0B		 BEQ $9844		   
$9839:  0A			ASL				 
$983a:  0A			ASL				 
$983b:  0A			ASL				 
$983c:  0A			ASL				 
$983d:  05 8D		 ORA $8d			 
$983f:  85 8D		 STA $8d			 
$9841:  20 48 99	  JSR $9948		   
$9844:  E6 82		 INC inner_loop	  ; Inner loop counter
$9846:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9848:  C9 04		 CMP #$04			
$984a:  90 CB		 BCC $9817		   
$984c:  60			RTS				 
$984d:  A9 00		 LDA #$00			
$984f:  8D D2 75	  STA act_type		; Action type
$9852:  20 C2 93	  JSR $93c2		   
$9855:  20 C5 99	  JSR $99c5		   
$9858:  AD 80 6E	  LDA action_type	 ; Current action type
$985b:  C9 01		 CMP #$01			
$985d:  F0 4C		 BEQ $98ab		   
$985f:  A5 7C		 LDA $7c			 
$9861:  C9 03		 CMP #$03			
$9863:  90 46		 BCC $98ab		   
$9865:  A9 00		 LDA #$00			
$9867:  85 82		 STA inner_loop	  ; Inner loop counter
$9869:  85 8A		 STA char_count	  ; Character count
$986b:  A5 7B		 LDA calc_hit		; Calculated hit value
$986d:  29 03		 AND #$03			
$986f:  F0 25		 BEQ $9896		   
$9871:  20 10 86	  JSR $8610		   
$9874:  90 20		 BCC $9896		   
$9876:  20 1C 86	  JSR $861c		   
$9879:  38			SEC				 
$987a:  A5 02		 LDA tmp2			; Temporary 2
$987c:  E5 00		 SBC tmp0			; Temporary 0
$987e:  85 02		 STA tmp2			; Temporary 2
$9880:  A5 03		 LDA tmp3			; Temporary 3
$9882:  E5 01		 SBC tmp1			; Temporary 1
$9884:  85 03		 STA tmp3			; Temporary 3
$9886:  A5 03		 LDA tmp3			; Temporary 3
$9888:  D0 0A		 BNE $9894		   
$988a:  A5 02		 LDA tmp2			; Temporary 2
$988c:  C9 46		 CMP #$46			
$988e:  90 06		 BCC $9896		   
$9890:  C9 6E		 CMP #$6e			
$9892:  B0 02		 BCS $9896		   
$9894:  E6 8A		 INC char_count	  ; Character count
$9896:  46 7B		 LSR calc_hit		; Calculated hit value
$9898:  46 7B		 LSR calc_hit		; Calculated hit value
$989a:  E6 82		 INC inner_loop	  ; Inner loop counter
$989c:  A5 82		 LDA inner_loop	  ; Inner loop counter
$989e:  C9 04		 CMP #$04			
$98a0:  90 C9		 BCC $986b		   
$98a2:  A9 FF		 LDA #$ff			
$98a4:  85 8C		 STA action_param	; Action parameter
$98a6:  85 8D		 STA $8d			 
$98a8:  4C CA AB	  JMP $abca		   
$98ab:  60			RTS				 
$98ac:  20 33 99	  JSR $9933		   
$98af:  D0 07		 BNE $98b8		   
$98b1:  AD DB 75	  LDA act_id		  ; Action ID
$98b4:  C9 29		 CMP #$29			
$98b6:  D0 03		 BNE $98bb		   
$98b8:  4C 0B 98	  JMP $980b		   
$98bb:  60			RTS				 
$98bc:  20 33 99	  JSR $9933		   
$98bf:  D0 25		 BNE $98e6		   
$98c1:  AD DB 75	  LDA act_id		  ; Action ID
$98c4:  C9 29		 CMP #$29			
$98c6:  F0 13		 BEQ $98db		   
$98c8:  C9 2A		 CMP #$2a			
$98ca:  F0 0F		 BEQ $98db		   
$98cc:  C9 2B		 CMP #$2b			
$98ce:  F0 05		 BEQ $98d5		   
$98d0:  C9 94		 CMP #$94			
$98d2:  D0 07		 BNE $98db		   
$98d4:  60			RTS				 
$98d5:  AE 80 6E	  LDX action_type	 ; Current action type
$98d8:  CA			DEX				 
$98d9:  D0 F9		 BNE $98d4		   
$98db:  AD DA 75	  LDA act_cat		 ; Action category
$98de:  29 0F		 AND #$0f			
$98e0:  20 AB 8A	  JSR $8aab		   
$98e3:  CD E8 75	  CMP spell_idx	   ; Spell index
$98e6:  4C 0B 98	  JMP $980b		   
$98e9:  20 33 99	  JSR $9933		   
$98ec:  D0 0B		 BNE $98f9		   
$98ee:  A5 00		 LDA tmp0			; Temporary 0
$98f0:  10 0A		 BPL $98fc		   
$98f2:  AD F2 75	  LDA $75f2		   
$98f5:  C9 60		 CMP #$60			
$98f7:  F0 14		 BEQ $990d		   
$98f9:  4C 0B 98	  JMP $980b		   
$98fc:  AE 80 6E	  LDX action_type	 ; Current action type
$98ff:  CA			DEX				 
$9900:  F0 F7		 BEQ $98f9		   
$9902:  AD DB 75	  LDA act_id		  ; Action ID
$9905:  C9 2B		 CMP #$2b			
$9907:  F0 04		 BEQ $990d		   
$9909:  C9 2C		 CMP #$2c			
$990b:  D0 EC		 BNE $98f9		   
$990d:  60			RTS				 
$990e:  20 33 99	  JSR $9933		   
$9911:  D0 13		 BNE $9926		   
$9913:  A5 00		 LDA tmp0			; Temporary 0
$9915:  30 14		 BMI $992b		   
$9917:  AD DB 75	  LDA act_id		  ; Action ID
$991a:  C9 2B		 CMP #$2b			
$991c:  D0 0D		 BNE $992b		   
$991e:  20 3D 99	  JSR $993d		   
$9921:  C9 02		 CMP #$02			
$9923:  B0 06		 BCS $992b		   
$9925:  60			RTS				 
$9926:  20 3D 99	  JSR $993d		   
$9929:  F0 FA		 BEQ $9925		   
$992b:  A9 20		 LDA #$20			
$992d:  8D D2 75	  STA act_type		; Action type
$9930:  4C CA AB	  JMP $abca		   

; ------------------------------
sub_9933:
$9933:  20 06 94	  JSR $9406		   
$9936:  85 00		 STA tmp0			; Temporary 0
$9938:  29 7F		 AND #$7f			
$993a:  C9 01		 CMP #$01			
$993c:  60			RTS				 

; ------------------------------
sub_993D:
$993d:  A9 20		 LDA #$20			
$993f:  8D D2 75	  STA act_type		; Action type
$9942:  20 C5 99	  JSR $99c5		   
$9945:  A5 7C		 LDA $7c			 
$9947:  60			RTS				 

; ------------------------------
sub_9948:
$9948:  A9 00		 LDA #$00			
$994a:  85 00		 STA tmp0			; Temporary 0
$994c:  85 01		 STA tmp1			; Temporary 1
$994e:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9950:  20 10 86	  JSR $8610		   
$9953:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9955:  20 1C 86	  JSR $861c		   
$9958:  20 9F 99	  JSR $999f		   
$995b:  A5 8A		 LDA char_count	  ; Character count
$995d:  C9 FF		 CMP #$ff			
$995f:  F0 33		 BEQ $9994		   
$9961:  A2 00		 LDX #$00			
$9963:  20 13 C8	  JSR $c813		   
$9966:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9968:  20 1C 86	  JSR $861c		   
$996b:  A2 00		 LDX #$00			
$996d:  20 76 81	  JSR mul16		   ; Multiply by 16
$9970:  A0 02		 LDY #$02			
$9972:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$9975:  A5 00		 LDA tmp0			; Temporary 0
$9977:  29 F0		 AND #$f0			
$9979:  05 01		 ORA tmp1			; Temporary 1
$997b:  D0 17		 BNE $9994		   
$997d:  A5 00		 LDA tmp0			; Temporary 0
$997f:  85 01		 STA tmp1			; Temporary 1
$9981:  A9 00		 LDA #$00			
$9983:  85 00		 STA tmp0			; Temporary 0
$9985:  20 65 93	  JSR get_tact_1	  ; Get tactics spell 1
$9988:  C5 01		 CMP tmp1			; Temporary 1
$998a:  90 08		 BCC $9994		   
$998c:  F0 06		 BEQ $9994		   
$998e:  20 51 C8	  JSR $c851		   
$9991:  4C 98 99	  JMP $9998		   
$9994:  A9 FF		 LDA #$ff			
$9996:  85 00		 STA tmp0			; Temporary 0
$9998:  A9 00		 LDA #$00			
$999a:  85 01		 STA tmp1			; Temporary 1
$999c:  4C 92 AB	  JMP $ab92		   

; ------------------------------
sub_999F:
$999f:  38			SEC				 
$99a0:  A5 02		 LDA tmp2			; Temporary 2
$99a2:  E5 00		 SBC tmp0			; Temporary 0
$99a4:  85 04		 STA $04			 
$99a6:  A5 03		 LDA tmp3			; Temporary 3
$99a8:  E5 01		 SBC tmp1			; Temporary 1
$99aa:  85 05		 STA $05			 
$99ac:  A5 8A		 LDA char_count	  ; Character count
$99ae:  C9 FF		 CMP #$ff			
$99b0:  F0 12		 BEQ $99c4		   
$99b2:  A5 05		 LDA $05			 
$99b4:  D0 06		 BNE $99bc		   
$99b6:  A5 04		 LDA $04			 
$99b8:  C5 8A		 CMP char_count	  ; Character count
$99ba:  90 08		 BCC $99c4		   
$99bc:  A5 8A		 LDA char_count	  ; Character count
$99be:  85 04		 STA $04			 
$99c0:  A9 00		 LDA #$00			
$99c2:  85 05		 STA $05			 
$99c4:  60			RTS				 

; ------------------------------
sub_99C5:
$99c5:  20 0B 9A	  JSR $9a0b		   
$99c8:  A9 00		 LDA #$00			
$99ca:  85 7C		 STA $7c			 
$99cc:  85 7B		 STA calc_hit		; Calculated hit value
$99ce:  85 82		 STA inner_loop	  ; Inner loop counter
$99d0:  A5 82		 LDA inner_loop	  ; Inner loop counter
$99d2:  20 0D 9B	  JSR $9b0d		   
$99d5:  90 23		 BCC $99fa		   
$99d7:  AD D3 75	  LDA target		  ; Target index
$99da:  C9 8F		 CMP #$8f			
$99dc:  D0 08		 BNE $99e6		   
$99de:  20 66 88	  JSR $8866		   
$99e1:  CD E8 75	  CMP spell_idx	   ; Spell index
$99e4:  D0 14		 BNE $99fa		   
$99e6:  20 03 9A	  JSR $9a03		   
$99e9:  05 7B		 ORA calc_hit		; Calculated hit value
$99eb:  85 7B		 STA calc_hit		; Calculated hit value
$99ed:  88			DEY				 
$99ee:  30 08		 BMI $99f8		   
$99f0:  20 03 9A	  JSR $9a03		   
$99f3:  18			CLC				 
$99f4:  65 7B		 ADC calc_hit		; Calculated hit value
$99f6:  85 7B		 STA calc_hit		; Calculated hit value
$99f8:  E6 7C		 INC $7c			 
$99fa:  E6 82		 INC inner_loop	  ; Inner loop counter
$99fc:  A5 82		 LDA inner_loop	  ; Inner loop counter
$99fe:  C9 04		 CMP #$04			
$9a00:  90 CE		 BCC $99d0		   
$9a02:  60			RTS				 

; ------------------------------
sub_9A03:
$9a03:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9a05:  0A			ASL				 
$9a06:  AA			TAX				 
$9a07:  BD 5E FF	  LDA $ff5e,X		 
$9a0a:  60			RTS				 

; ------------------------------
sub_9A0B:
$9a0b:  A9 00		 LDA #$00			
$9a0d:  85 8A		 STA char_count	  ; Character count
$9a0f:  85 8B		 STA actor_idx	   ; Current actor index
$9a11:  85 8C		 STA action_param	; Action parameter
$9a13:  85 8D		 STA $8d			 
$9a15:  85 8E		 STA $8e			 
$9a17:  85 8F		 STA $8f			 
$9a19:  85 90		 STA $90			 
$9a1b:  85 91		 STA $91			 
$9a1d:  8D C1 75	  STA $75c1		   
$9a20:  8D C2 75	  STA $75c2		   
$9a23:  8D C3 75	  STA $75c3		   
$9a26:  8D C4 75	  STA $75c4		   
$9a29:  8D C5 75	  STA $75c5		   
$9a2c:  8D C6 75	  STA $75c6		   
$9a2f:  8D C7 75	  STA $75c7		   
$9a32:  8D C8 75	  STA $75c8		   
$9a35:  A9 07		 LDA #$07			
$9a37:  85 81		 STA party_loop	  ; Party loop counter
$9a39:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$9a3c:  A0 00		 LDY #$00			
$9a3e:  20 50 9A	  JSR $9a50		   
$9a41:  A0 08		 LDY #$08			
$9a43:  20 50 9A	  JSR $9a50		   
$9a46:  A0 10		 LDY #$10			
$9a48:  20 50 9A	  JSR $9a50		   
$9a4b:  C6 81		 DEC party_loop	  ; Party loop counter
$9a4d:  10 EA		 BPL $9a39		   
$9a4f:  60			RTS				 

; ------------------------------
sub_9A50:
$9a50:  A9 00		 LDA #$00			
$9a52:  85 82		 STA inner_loop	  ; Inner loop counter
$9a54:  20 AA 9A	  JSR $9aaa		   
$9a57:  C8			INY				 
$9a58:  A6 81		 LDX party_loop	  ; Party loop counter
$9a5a:  BD 5E FF	  LDA $ff5e,X		 
$9a5d:  25 7B		 AND calc_hit		; Calculated hit value
$9a5f:  F0 3F		 BEQ $9aa0		   
$9a61:  88			DEY				 
$9a62:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$9a64:  85 01		 STA tmp1			; Temporary 1
$9a66:  85 03		 STA tmp3			; Temporary 3
$9a68:  C8			INY				 
$9a69:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$9a6b:  85 02		 STA tmp2			; Temporary 2
$9a6d:  85 04		 STA $04			 
$9a6f:  20 9A 93	  JSR get_tact_3	  ; Get tactics spell 3
$9a72:  A2 01		 LDX #$01			
$9a74:  20 9A 81	  JSR $819a		   
$9a77:  20 7A 93	  JSR get_tact_2	  ; Get tactics spell 2
$9a7a:  A2 03		 LDX #$03			
$9a7c:  20 30 83	  JSR mult_a		  ; Multiply by A
$9a7f:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9a81:  0A			ASL				 
$9a82:  AA			TAX				 
$9a83:  A5 01		 LDA tmp1			; Temporary 1
$9a85:  75 8A		 ADC $8a,X		   
$9a87:  95 8A		 STA $8a,X		   
$9a89:  A5 02		 LDA tmp2			; Temporary 2
$9a8b:  75 8B		 ADC $8b,X		   
$9a8d:  95 8B		 STA $8b,X		   
$9a8f:  18			CLC				 
$9a90:  BD C1 75	  LDA $75c1,X		 
$9a93:  65 04		 ADC $04			 
$9a95:  9D C1 75	  STA $75c1,X		 
$9a98:  BD C2 75	  LDA $75c2,X		 
$9a9b:  65 19		 ADC mult_hi		 ; Product high
$9a9d:  9D C2 75	  STA $75c2,X		 
$9aa0:  C8			INY				 
$9aa1:  E6 82		 INC inner_loop	  ; Inner loop counter
$9aa3:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9aa5:  C9 04		 CMP #$04			
$9aa7:  90 AB		 BCC $9a54		   
$9aa9:  60			RTS				 

; ------------------------------
sub_9AAA:
$9aaa:  98			TYA				 
$9aab:  48			PHA				 
$9aac:  20 B2 9A	  JSR $9ab2		   
$9aaf:  68			PLA				 
$9ab0:  A8			TAY				 
$9ab1:  60			RTS				 

; ------------------------------
sub_9AB2:
$9ab2:  20 D0 93	  JSR $93d0		   
$9ab5:  90 1F		 BCC $9ad6		   
$9ab7:  BD 48 73	  LDA $7348,X		 
$9aba:  85 00		 STA tmp0			; Temporary 0
$9abc:  AE EA 75	  LDX $75ea		   
$9abf:  AD EB 75	  LDA $75eb		   
$9ac2:  30 12		 BMI $9ad6		   
$9ac4:  29 70		 AND #$70			
$9ac6:  C9 20		 CMP #$20			
$9ac8:  F0 12		 BEQ $9adc		   
$9aca:  C9 10		 CMP #$10			
$9acc:  F0 08		 BEQ $9ad6		   
$9ace:  E0 29		 CPX #$29			
$9ad0:  90 04		 BCC $9ad6		   
$9ad2:  E0 2C		 CPX #$2c			
$9ad4:  90 0E		 BCC $9ae4		   
$9ad6:  A9 FF		 LDA #$ff			
$9ad8:  85 7B		 STA calc_hit		; Calculated hit value
$9ada:  D0 2D		 BNE $9b09		   
$9adc:  E0 53		 CPX #$53			
$9ade:  F0 04		 BEQ $9ae4		   
$9ae0:  E0 40		 CPX #$40			
$9ae2:  D0 F2		 BNE $9ad6		   
$9ae4:  AD EB 75	  LDA $75eb		   
$9ae7:  29 0F		 AND #$0f			
$9ae9:  C5 82		 CMP inner_loop	  ; Inner loop counter
$9aeb:  D0 E9		 BNE $9ad6		   
$9aed:  A9 00		 LDA #$00			
$9aef:  85 7B		 STA calc_hit		; Calculated hit value
$9af1:  A2 07		 LDX #$07			
$9af3:  BD 4C 73	  LDA $734c,X		 
$9af6:  CD 5B 73	  CMP $735b		   
$9af9:  90 0B		 BCC $9b06		   
$9afb:  C5 00		 CMP tmp0			; Temporary 0
$9afd:  B0 07		 BCS $9b06		   
$9aff:  BD 5E FF	  LDA $ff5e,X		 
$9b02:  05 7B		 ORA calc_hit		; Calculated hit value
$9b04:  85 7B		 STA calc_hit		; Calculated hit value
$9b06:  CA			DEX				 
$9b07:  10 EA		 BPL $9af3		   
$9b09:  A5 7B		 LDA calc_hit		; Calculated hit value
$9b0b:  60			RTS				 
$9b0c:  60			RTS				 

; ------------------------------
sub_9B0D:
$9b0d:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9b0f:  20 1C 86	  JSR $861c		   
$9b12:  90 F8		 BCC $9b0c		   
$9b14:  A0 00		 LDY #$00			
$9b16:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$9b18:  10 7B		 BPL $9b95		   
$9b1a:  AD D2 75	  LDA act_type		; Action type
$9b1d:  29 70		 AND #$70			
$9b1f:  F0 18		 BEQ $9b39		   
$9b21:  20 66 88	  JSR $8866		   
$9b24:  CD E8 75	  CMP spell_idx	   ; Spell index
$9b27:  F0 10		 BEQ $9b39		   
$9b29:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$9b2c:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$9b2f:  30 08		 BMI $9b39		   
$9b31:  A0 05		 LDY #$05			
$9b33:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$9b35:  29 C0		 AND #$c0			
$9b37:  D0 5C		 BNE $9b95		   
$9b39:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9b3b:  20 66 88	  JSR $8866		   
$9b3e:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$9b41:  A0 05		 LDY #$05			
$9b43:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$9b45:  29 04		 AND #$04			
$9b47:  D0 4C		 BNE $9b95		   
$9b49:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9b4b:  20 10 86	  JSR $8610		   
$9b4e:  20 97 9B	  JSR $9b97		   
$9b51:  90 42		 BCC $9b95		   
$9b53:  A9 03		 LDA #$03			
$9b55:  AE 80 6E	  LDX action_type	 ; Current action type
$9b58:  E0 03		 CPX #$03			
$9b5a:  F0 02		 BEQ $9b5e		   
$9b5c:  A9 04		 LDA #$04			
$9b5e:  A2 02		 LDX #$02			
$9b60:  20 51 C8	  JSR $c851		   
$9b63:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9b65:  20 10 86	  JSR $8610		   
$9b68:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9b6a:  0A			ASL				 
$9b6b:  AA			TAX				 
$9b6c:  38			SEC				 
$9b6d:  A5 00		 LDA tmp0			; Temporary 0
$9b6f:  F5 8A		 SBC $8a,X		   
$9b71:  85 04		 STA $04			 
$9b73:  A5 01		 LDA tmp1			; Temporary 1
$9b75:  F5 8B		 SBC $8b,X		   
$9b77:  85 05		 STA $05			 
$9b79:  A0 01		 LDY #$01			
$9b7b:  90 16		 BCC $9b93		   
$9b7d:  A5 04		 LDA $04			 
$9b7f:  E5 02		 SBC tmp2			; Temporary 2
$9b81:  A5 05		 LDA $05			 
$9b83:  E5 03		 SBC tmp3			; Temporary 3
$9b85:  B0 0E		 BCS $9b95		   
$9b87:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9b89:  20 1C 86	  JSR $861c		   
$9b8c:  20 97 9B	  JSR $9b97		   
$9b8f:  90 04		 BCC $9b95		   
$9b91:  A0 00		 LDY #$00			
$9b93:  38			SEC				 
$9b94:  60			RTS				 
$9b95:  18			CLC				 
$9b96:  60			RTS				 

; ------------------------------
sub_9B97:
$9b97:  A2 00		 LDX #$00			
$9b99:  A0 02		 LDY #$02			
$9b9b:  20 76 81	  JSR mul16		   ; Multiply by 16
$9b9e:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$9ba1:  A9 0D		 LDA #$0d			
$9ba3:  C5 00		 CMP tmp0			; Temporary 0
$9ba5:  60			RTS				 
$9ba6:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$9ba9:  A9 07		 LDA #$07			
$9bab:  85 81		 STA party_loop	  ; Party loop counter
$9bad:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$9bb0:  20 AB 93	  JSR $93ab		   
$9bb3:  20 A8 9C	  JSR $9ca8		   
$9bb6:  C6 81		 DEC party_loop	  ; Party loop counter
$9bb8:  10 F3		 BPL $9bad		   
$9bba:  60			RTS				 
$9bbb:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$9bbe:  A9 03		 LDA #$03			
$9bc0:  85 8D		 STA $8d			 
$9bc2:  20 B4 93	  JSR $93b4		   
$9bc5:  20 3A 9C	  JSR $9c3a		   
$9bc8:  C6 8D		 DEC $8d			 
$9bca:  10 F6		 BPL $9bc2		   
$9bcc:  60			RTS				 
$9bcd:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$9bd0:  A9 07		 LDA #$07			
$9bd2:  85 81		 STA party_loop	  ; Party loop counter
$9bd4:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$9bd7:  20 AB 93	  JSR $93ab		   
$9bda:  20 4B 9D	  JSR $9d4b		   
$9bdd:  C6 81		 DEC party_loop	  ; Party loop counter
$9bdf:  10 F3		 BPL $9bd4		   
$9be1:  60			RTS				 
$9be2:  AD E8 75	  LDA spell_idx	   ; Spell index
$9be5:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$9be8:  A0 05		 LDY #$05			
$9bea:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$9bec:  29 C0		 AND #$c0			
$9bee:  D0 49		 BNE $9c39		   
$9bf0:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$9bf3:  A9 07		 LDA #$07			
$9bf5:  85 81		 STA party_loop	  ; Party loop counter
$9bf7:  A9 00		 LDA #$00			
$9bf9:  85 00		 STA tmp0			; Temporary 0
$9bfb:  85 01		 STA tmp1			; Temporary 1
$9bfd:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$9c00:  A0 08		 LDY #$08			
$9c02:  20 77 94	  JSR $9477		   
$9c05:  A0 18		 LDY #$18			
$9c07:  20 77 94	  JSR $9477		   
$9c0a:  A0 1C		 LDY #$1c			
$9c0c:  20 77 94	  JSR $9477		   
$9c0f:  A0 20		 LDY #$20			
$9c11:  20 77 94	  JSR $9477		   
$9c14:  C6 81		 DEC party_loop	  ; Party loop counter
$9c16:  10 E5		 BPL $9bfd		   
$9c18:  A2 00		 LDX #$00			
$9c1a:  20 16 82	  JSR $8216		   
$9c1d:  A9 10		 LDA #$10			
$9c1f:  85 8C		 STA action_param	; Action parameter
$9c21:  8D D1 75	  STA act_ptr		 ; Action pointer
$9c24:  A9 00		 LDA #$00			
$9c26:  8D D2 75	  STA act_type		; Action type
$9c29:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$9c2c:  10 08		 BPL $9c36		   
$9c2e:  AD D2 75	  LDA act_type		; Action type
$9c31:  09 20		 ORA #$20			
$9c33:  8D D2 75	  STA act_type		; Action type
$9c36:  4C A3 AC	  JMP $aca3		   
$9c39:  60			RTS				 

; ------------------------------
sub_9C3A:
$9c3a:  A9 00		 LDA #$00			
$9c3c:  8D DF 75	  STA $75df		   
$9c3f:  8D E0 75	  STA $75e0		   
$9c42:  A9 07		 LDA #$07			
$9c44:  85 81		 STA party_loop	  ; Party loop counter
$9c46:  20 02 86	  JSR $8602		   
$9c49:  D0 2C		 BNE $9c77		   
$9c4b:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$9c4e:  30 10		 BMI $9c60		   
$9c50:  AD D3 75	  LDA target		  ; Target index
$9c53:  C9 19		 CMP #$19			
$9c55:  D0 09		 BNE $9c60		   
$9c57:  A6 81		 LDX party_loop	  ; Party loop counter
$9c59:  A9 40		 LDA #$40			
$9c5b:  20 EE 85	  JSR $85ee		   
$9c5e:  D0 28		 BNE $9c88		   
$9c60:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$9c63:  20 89 9C	  JSR $9c89		   
$9c66:  18			CLC				 
$9c67:  A5 00		 LDA tmp0			; Temporary 0
$9c69:  6D DF 75	  ADC $75df		   
$9c6c:  8D DF 75	  STA $75df		   
$9c6f:  A5 01		 LDA tmp1			; Temporary 1
$9c71:  6D E0 75	  ADC $75e0		   
$9c74:  8D E0 75	  STA $75e0		   
$9c77:  C6 81		 DEC party_loop	  ; Party loop counter
$9c79:  10 CB		 BPL $9c46		   
$9c7b:  AD DF 75	  LDA $75df		   
$9c7e:  85 00		 STA tmp0			; Temporary 0
$9c80:  AD E0 75	  LDA $75e0		   
$9c83:  85 01		 STA tmp1			; Temporary 1
$9c85:  4C A3 AC	  JMP $aca3		   
$9c88:  60			RTS				 

; ------------------------------
sub_9C89:
$9c89:  AD D3 75	  LDA target		  ; Target index
$9c8c:  C9 17		 CMP #$17			
$9c8e:  F0 22		 BEQ $9cb2		   
$9c90:  C9 19		 CMP #$19			
$9c92:  F0 70		 BEQ $9d04		   
$9c94:  C9 88		 CMP #$88			
$9c96:  F0 6C		 BEQ $9d04		   
$9c98:  C9 9D		 CMP #$9d			
$9c9a:  F0 68		 BEQ $9d04		   
$9c9c:  C9 8D		 CMP #$8d			
$9c9e:  F0 3C		 BEQ $9cdc		   
$9ca0:  C9 1A		 CMP #$1a			
$9ca2:  F0 01		 BEQ $9ca5		   
$9ca4:  60			RTS				 
$9ca5:  4C 2D 9D	  JMP $9d2d		   

; ------------------------------
sub_9CA8:
$9ca8:  20 B2 9C	  JSR $9cb2		   
$9cab:  A5 0F		 LDA $0f			 
$9cad:  10 22		 BPL $9cd1		   
$9caf:  4C A3 AC	  JMP $aca3		   

; ------------------------------
sub_9CB2:
$9cb2:  20 C6 96	  JSR $96c6		   
$9cb5:  90 1A		 BCC $9cd1		   
$9cb7:  A0 05		 LDY #$05			
$9cb9:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$9cbb:  4A			LSR				 
$9cbc:  B0 13		 BCS $9cd1		   
$9cbe:  C6 0F		 DEC $0f			 
$9cc0:  A9 20		 LDA #$20			
$9cc2:  8D D1 75	  STA act_ptr		 ; Action pointer
$9cc5:  20 A3 97	  JSR $97a3		   
$9cc8:  20 C0 97	  JSR $97c0		   
$9ccb:  20 D7 97	  JSR $97d7		   
$9cce:  20 00 98	  JSR $9800		   
$9cd1:  60			RTS				 
$9cd2:  20 DC 9C	  JSR $9cdc		   
$9cd5:  A5 0F		 LDA $0f			 
$9cd7:  10 2A		 BPL $9d03		   
$9cd9:  4C A3 AC	  JMP $aca3		   

; ------------------------------
sub_9CDC:
$9cdc:  20 C6 96	  JSR $96c6		   
$9cdf:  90 22		 BCC $9d03		   
$9ce1:  A0 05		 LDY #$05			
$9ce3:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$9ce5:  4A			LSR				 
$9ce6:  B0 1B		 BCS $9d03		   
$9ce8:  C8			INY				 
$9ce9:  C8			INY				 
$9cea:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$9cec:  29 F0		 AND #$f0			
$9cee:  D0 13		 BNE $9d03		   
$9cf0:  C6 0F		 DEC $0f			 
$9cf2:  A9 60		 LDA #$60			
$9cf4:  8D D1 75	  STA act_ptr		 ; Action pointer
$9cf7:  20 A3 97	  JSR $97a3		   
$9cfa:  20 C0 97	  JSR $97c0		   
$9cfd:  20 D7 97	  JSR $97d7		   
$9d00:  20 00 98	  JSR $9800		   
$9d03:  60			RTS				 
$9d04:  20 C6 96	  JSR $96c6		   
$9d07:  90 23		 BCC $9d2c		   
$9d09:  A0 05		 LDY #$05			
$9d0b:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$9d0d:  29 08		 AND #$08			
$9d0f:  D0 1B		 BNE $9d2c		   
$9d11:  C6 0F		 DEC $0f			 
$9d13:  A9 10		 LDA #$10			
$9d15:  8D D1 75	  STA act_ptr		 ; Action pointer
$9d18:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$9d1b:  A0 36		 LDY #$36			
$9d1d:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$9d1f:  85 00		 STA tmp0			; Temporary 0
$9d21:  C8			INY				 
$9d22:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$9d24:  85 01		 STA tmp1			; Temporary 1
$9d26:  20 D7 97	  JSR $97d7		   
$9d29:  20 00 98	  JSR $9800		   
$9d2c:  60			RTS				 
$9d2d:  20 C6 96	  JSR $96c6		   
$9d30:  90 18		 BCC $9d4a		   
$9d32:  A0 05		 LDY #$05			
$9d34:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$9d36:  29 10		 AND #$10			
$9d38:  D0 10		 BNE $9d4a		   
$9d3a:  C6 0F		 DEC $0f			 
$9d3c:  A9 10		 LDA #$10			
$9d3e:  8D D1 75	  STA act_ptr		 ; Action pointer
$9d41:  20 76 9D	  JSR $9d76		   
$9d44:  20 D7 97	  JSR $97d7		   
$9d47:  20 00 98	  JSR $9800		   
$9d4a:  60			RTS				 

; ------------------------------
sub_9D4B:
$9d4b:  20 55 9D	  JSR $9d55		   
$9d4e:  A5 0F		 LDA $0f			 
$9d50:  10 23		 BPL $9d75		   
$9d52:  4C A3 AC	  JMP $aca3		   

; ------------------------------
sub_9D55:
$9d55:  20 C6 96	  JSR $96c6		   
$9d58:  90 1B		 BCC $9d75		   
$9d5a:  A0 05		 LDY #$05			
$9d5c:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$9d5e:  29 04		 AND #$04			
$9d60:  D0 13		 BNE $9d75		   
$9d62:  C6 0F		 DEC $0f			 
$9d64:  A9 10		 LDA #$10			
$9d66:  8D D1 75	  STA act_ptr		 ; Action pointer
$9d69:  20 A3 97	  JSR $97a3		   
$9d6c:  20 C0 97	  JSR $97c0		   
$9d6f:  20 D7 97	  JSR $97d7		   
$9d72:  20 00 98	  JSR $9800		   
$9d75:  60			RTS				 

; ------------------------------
sub_9D76:
$9d76:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$9d79:  A9 00		 LDA #$00			
$9d7b:  85 00		 STA tmp0			; Temporary 0
$9d7d:  85 01		 STA tmp1			; Temporary 1
$9d7f:  A2 03		 LDX #$03			
$9d81:  A0 00		 LDY #$00			
$9d83:  18			CLC				 
$9d84:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$9d86:  65 00		 ADC tmp0			; Temporary 0
$9d88:  85 00		 STA tmp0			; Temporary 0
$9d8a:  C8			INY				 
$9d8b:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$9d8d:  65 01		 ADC tmp1			; Temporary 1
$9d8f:  85 01		 STA tmp1			; Temporary 1
$9d91:  C8			INY				 
$9d92:  CA			DEX				 
$9d93:  10 EE		 BPL $9d83		   
$9d95:  A9 0A		 LDA #$0a			
$9d97:  A2 00		 LDX #$00			
$9d99:  4C 9A 81	  JMP $819a		   
$9d9c:  A9 00		 LDA #$00			
$9d9e:  8D D2 75	  STA act_type		; Action type
$9da1:  20 B0 9D	  JSR $9db0		   
$9da4:  A5 8A		 LDA char_count	  ; Character count
$9da6:  F0 07		 BEQ $9daf		   
$9da8:  A9 02		 LDA #$02			
$9daa:  85 8C		 STA action_param	; Action parameter
$9dac:  20 63 AC	  JSR $ac63		   
$9daf:  60			RTS				 

; ------------------------------
sub_9DB0:
$9db0:  A9 00		 LDA #$00			
$9db2:  85 82		 STA inner_loop	  ; Inner loop counter
$9db4:  85 8A		 STA char_count	  ; Character count
$9db6:  20 6B 8A	  JSR $8a6b		   
$9db9:  90 28		 BCC $9de3		   
$9dbb:  48			PHA				 
$9dbc:  A0 00		 LDY #$00			
$9dbe:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$9dc0:  10 20		 BPL $9de2		   
$9dc2:  0A			ASL				 
$9dc3:  10 1D		 BPL $9de2		   
$9dc5:  68			PLA				 
$9dc6:  AD D2 75	  LDA act_type		; Action type
$9dc9:  29 70		 AND #$70			
$9dcb:  C9 20		 CMP #$20			
$9dcd:  F0 0B		 BEQ $9dda		   
$9dcf:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$9dd2:  A0 05		 LDY #$05			
$9dd4:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$9dd6:  29 C0		 AND #$c0			
$9dd8:  D0 09		 BNE $9de3		   
$9dda:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9ddc:  85 7B		 STA calc_hit		; Calculated hit value
$9dde:  E6 8A		 INC char_count	  ; Character count
$9de0:  10 01		 BPL $9de3		   
$9de2:  68			PLA				 
$9de3:  E6 82		 INC inner_loop	  ; Inner loop counter
$9de5:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9de7:  C9 04		 CMP #$04			
$9de9:  90 CB		 BCC $9db6		   
$9deb:  60			RTS				 
$9dec:  AD DB 75	  LDA act_id		  ; Action ID
$9def:  C9 98		 CMP #$98			
$9df1:  F0 3D		 BEQ $9e30		   
$9df3:  20 06 94	  JSR $9406		   
$9df6:  29 7F		 AND #$7f			
$9df8:  C9 01		 CMP #$01			
$9dfa:  F0 34		 BEQ $9e30		   
$9dfc:  48			PHA				 
$9dfd:  A9 20		 LDA #$20			
$9dff:  8D D2 75	  STA act_type		; Action type
$9e02:  20 B0 9D	  JSR $9db0		   
$9e05:  68			PLA				 
$9e06:  C9 02		 CMP #$02			
$9e08:  D0 08		 BNE $9e12		   
$9e0a:  A5 8A		 LDA char_count	  ; Character count
$9e0c:  F0 22		 BEQ $9e30		   
$9e0e:  C9 02		 CMP #$02			
$9e10:  B0 17		 BCS $9e29		   
$9e12:  A5 8A		 LDA char_count	  ; Character count
$9e14:  F0 1A		 BEQ $9e30		   
$9e16:  A5 7B		 LDA calc_hit		; Calculated hit value
$9e18:  85 82		 STA inner_loop	  ; Inner loop counter
$9e1a:  20 B5 8A	  JSR $8ab5		   
$9e1d:  09 20		 ORA #$20			
$9e1f:  8D D2 75	  STA act_type		; Action type
$9e22:  A9 02		 LDA #$02			
$9e24:  85 8C		 STA action_param	; Action parameter
$9e26:  4C 63 AC	  JMP $ac63		   
$9e29:  AD DB 75	  LDA act_id		  ; Action ID
$9e2c:  C9 2E		 CMP #$2e			
$9e2e:  D0 E2		 BNE $9e12		   
$9e30:  60			RTS				 
$9e31:  A9 00		 LDA #$00			
$9e33:  D0 02		 BNE $9e37		   
$9e35:  A9 01		 LDA #$01			
$9e37:  85 8C		 STA action_param	; Action parameter
$9e39:  A9 00		 LDA #$00			
$9e3b:  85 82		 STA inner_loop	  ; Inner loop counter
$9e3d:  85 8A		 STA char_count	  ; Character count
$9e3f:  8D D2 75	  STA act_type		; Action type
$9e42:  85 00		 STA tmp0			; Temporary 0
$9e44:  85 01		 STA tmp1			; Temporary 1
$9e46:  20 6B 8A	  JSR $8a6b		   
$9e49:  90 30		 BCC $9e7b		   
$9e4b:  A0 00		 LDY #$00			
$9e4d:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$9e4f:  30 2A		 BMI $9e7b		   
$9e51:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9e53:  20 1C 86	  JSR $861c		   
$9e56:  38			SEC				 
$9e57:  A5 00		 LDA tmp0			; Temporary 0
$9e59:  E5 02		 SBC tmp2			; Temporary 2
$9e5b:  A5 01		 LDA tmp1			; Temporary 1
$9e5d:  E5 03		 SBC tmp3			; Temporary 3
$9e5f:  B0 18		 BCS $9e79		   
$9e61:  A5 02		 LDA tmp2			; Temporary 2
$9e63:  85 00		 STA tmp0			; Temporary 0
$9e65:  A5 03		 LDA tmp3			; Temporary 3
$9e67:  85 01		 STA tmp1			; Temporary 1
$9e69:  20 B5 8A	  JSR $8ab5		   
$9e6c:  8D D2 75	  STA act_type		; Action type
$9e6f:  AE F0 75	  LDX btl_f0		  ; Battle flag F0
$9e72:  10 05		 BPL $9e79		   
$9e74:  09 20		 ORA #$20			
$9e76:  8D D2 75	  STA act_type		; Action type
$9e79:  E6 8A		 INC char_count	  ; Character count
$9e7b:  E6 82		 INC inner_loop	  ; Inner loop counter
$9e7d:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9e7f:  C9 04		 CMP #$04			
$9e81:  90 C3		 BCC $9e46		   
$9e83:  A5 8A		 LDA char_count	  ; Character count
$9e85:  F0 03		 BEQ $9e8a		   
$9e87:  20 63 AC	  JSR $ac63		   
$9e8a:  60			RTS				 
$9e8b:  AD 80 6E	  LDA action_type	 ; Current action type
$9e8e:  C9 03		 CMP #$03			
$9e90:  D0 30		 BNE $9ec2		   
$9e92:  AD DC 75	  LDA $75dc		   
$9e95:  C9 0C		 CMP #$0c			
$9e97:  B0 29		 BCS $9ec2		   
$9e99:  A9 00		 LDA #$00			
$9e9b:  8D D2 75	  STA act_type		; Action type
$9e9e:  85 82		 STA inner_loop	  ; Inner loop counter
$9ea0:  85 8A		 STA char_count	  ; Character count
$9ea2:  20 6B 8A	  JSR $8a6b		   
$9ea5:  90 08		 BCC $9eaf		   
$9ea7:  A0 00		 LDY #$00			
$9ea9:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$9eab:  30 02		 BMI $9eaf		   
$9ead:  E6 8A		 INC char_count	  ; Character count
$9eaf:  E6 82		 INC inner_loop	  ; Inner loop counter
$9eb1:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9eb3:  C9 04		 CMP #$04			
$9eb5:  90 EB		 BCC $9ea2		   
$9eb7:  A5 8A		 LDA char_count	  ; Character count
$9eb9:  C9 03		 CMP #$03			
$9ebb:  D0 05		 BNE $9ec2		   
$9ebd:  85 8C		 STA action_param	; Action parameter
$9ebf:  20 63 AC	  JSR $ac63		   
$9ec2:  60			RTS				 
$9ec3:  AD DC 75	  LDA $75dc		   
$9ec6:  C9 14		 CMP #$14			
$9ec8:  B0 59		 BCS $9f23		   
$9eca:  85 00		 STA tmp0			; Temporary 0
$9ecc:  A9 14		 LDA #$14			
$9ece:  20 4E 9F	  JSR $9f4e		   
$9ed1:  A9 0C		 LDA #$0c			
$9ed3:  20 27 C8	  JSR $c827		   
$9ed6:  A5 00		 LDA tmp0			; Temporary 0
$9ed8:  20 91 C8	  JSR $c891		   
$9edb:  C5 00		 CMP tmp0			; Temporary 0
$9edd:  B0 44		 BCS $9f23		   
$9edf:  A2 FF		 LDX #$ff			
$9ee1:  8E D2 75	  STX act_type		; Action type
$9ee4:  E8			INX				 
$9ee5:  86 94		 STX $94			 
$9ee7:  86 95		 STX $95			 
$9ee9:  A9 07		 LDA #$07			
$9eeb:  85 81		 STA party_loop	  ; Party loop counter
$9eed:  20 24 9F	  JSR $9f24		   
$9ef0:  A5 00		 LDA tmp0			; Temporary 0
$9ef2:  05 01		 ORA tmp1			; Temporary 1
$9ef4:  F0 17		 BEQ $9f0d		   
$9ef6:  A5 00		 LDA tmp0			; Temporary 0
$9ef8:  E5 94		 SBC $94			 
$9efa:  A5 01		 LDA tmp1			; Temporary 1
$9efc:  E5 95		 SBC $95			 
$9efe:  90 0D		 BCC $9f0d		   
$9f00:  A5 00		 LDA tmp0			; Temporary 0
$9f02:  85 94		 STA $94			 
$9f04:  A5 01		 LDA tmp1			; Temporary 1
$9f06:  85 94		 STA $94			 
$9f08:  A5 81		 LDA party_loop	  ; Party loop counter
$9f0a:  8D D2 75	  STA act_type		; Action type
$9f0d:  C6 81		 DEC party_loop	  ; Party loop counter
$9f0f:  10 DC		 BPL $9eed		   
$9f11:  AD D2 75	  LDA act_type		; Action type
$9f14:  C9 FF		 CMP #$ff			
$9f16:  F0 0B		 BEQ $9f23		   
$9f18:  09 80		 ORA #$80			
$9f1a:  8D DA 75	  STA act_cat		 ; Action category
$9f1d:  AD D3 75	  LDA target		  ; Target index
$9f20:  8D DB 75	  STA act_id		  ; Action ID
$9f23:  60			RTS				 

; ------------------------------
sub_9F24:
$9f24:  20 C6 96	  JSR $96c6		   
$9f27:  90 24		 BCC $9f4d		   
$9f29:  A0 0C		 LDY #$0c			
$9f2b:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$9f2d:  F0 1E		 BEQ $9f4d		   
$9f2f:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$9f31:  85 00		 STA tmp0			; Temporary 0
$9f33:  C9 FF		 CMP #$ff			
$9f35:  D0 04		 BNE $9f3b		   
$9f37:  A9 F0		 LDA #$f0			
$9f39:  85 00		 STA tmp0			; Temporary 0
$9f3b:  38			SEC				 
$9f3c:  A9 FF		 LDA #$ff			
$9f3e:  E5 00		 SBC tmp0			; Temporary 0
$9f40:  48			PHA				 
$9f41:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$9f44:  20 4E 9F	  JSR $9f4e		   
$9f47:  68			PLA				 
$9f48:  A2 00		 LDX #$00			
$9f4a:  20 27 C8	  JSR $c827		   
$9f4d:  60			RTS				 

; ------------------------------
sub_9F4E:
$9f4e:  38			SEC				 
$9f4f:  E5 00		 SBC tmp0			; Temporary 0
$9f51:  85 00		 STA tmp0			; Temporary 0
$9f53:  A9 00		 LDA #$00			
$9f55:  85 01		 STA tmp1			; Temporary 1
$9f57:  A2 00		 LDX #$00			
$9f59:  60			RTS				 
$9f5a:  20 D9 A3	  JSR $a3d9		   
$9f5d:  90 16		 BCC $9f75		   
$9f5f:  20 F1 A3	  JSR $a3f1		   
$9f62:  A9 07		 LDA #$07			
$9f64:  85 81		 STA party_loop	  ; Party loop counter
$9f66:  20 B2 A3	  JSR $a3b2		   
$9f69:  90 06		 BCC $9f71		   
$9f6b:  20 AB 93	  JSR $93ab		   
$9f6e:  20 B1 AC	  JSR $acb1		   
$9f71:  C6 81		 DEC party_loop	  ; Party loop counter
$9f73:  10 F1		 BPL $9f66		   
$9f75:  60			RTS				 
$9f76:  20 D9 A3	  JSR $a3d9		   
$9f79:  90 11		 BCC $9f8c		   
$9f7b:  20 F1 A3	  JSR $a3f1		   
$9f7e:  A9 03		 LDA #$03			
$9f80:  85 8D		 STA $8d			 
$9f82:  20 B4 93	  JSR $93b4		   
$9f85:  20 66 A3	  JSR $a366		   
$9f88:  C6 8D		 DEC $8d			 
$9f8a:  10 F6		 BPL $9f82		   
$9f8c:  60			RTS				 
$9f8d:  20 06 94	  JSR $9406		   
$9f90:  29 7F		 AND #$7f			
$9f92:  C9 04		 CMP #$04			
$9f94:  F0 08		 BEQ $9f9e		   
$9f96:  20 E7 A2	  JSR $a2e7		   
$9f99:  90 03		 BCC $9f9e		   
$9f9b:  20 DC A4	  JSR $a4dc		   
$9f9e:  60			RTS				 
$9f9f:  20 06 94	  JSR $9406		   
$9fa2:  29 7F		 AND #$7f			
$9fa4:  AE 80 6E	  LDX action_type	 ; Current action type
$9fa7:  E0 03		 CPX #$03			
$9fa9:  F0 04		 BEQ $9faf		   
$9fab:  C9 04		 CMP #$04			
$9fad:  F0 08		 BEQ $9fb7		   
$9faf:  20 76 A2	  JSR $a276		   
$9fb2:  90 03		 BCC $9fb7		   
$9fb4:  20 DC A4	  JSR $a4dc		   
$9fb7:  60			RTS				 
$9fb8:  AE 80 6E	  LDX action_type	 ; Current action type
$9fbb:  CA			DEX				 
$9fbc:  F0 08		 BEQ $9fc6		   
$9fbe:  20 F2 A1	  JSR $a1f2		   
$9fc1:  90 03		 BCC $9fc6		   
$9fc3:  20 DC A4	  JSR $a4dc		   
$9fc6:  60			RTS				 
$9fc7:  20 E5 A0	  JSR $a0e5		   
$9fca:  90 15		 BCC $9fe1		   
$9fcc:  20 13 A1	  JSR $a113		   
$9fcf:  A5 7D		 LDA $7d			 
$9fd1:  30 0E		 BMI $9fe1		   
$9fd3:  85 82		 STA inner_loop	  ; Inner loop counter
$9fd5:  20 B5 8A	  JSR $8ab5		   
$9fd8:  8D DA 75	  STA act_cat		 ; Action category
$9fdb:  AD D3 75	  LDA target		  ; Target index
$9fde:  8D DB 75	  STA act_id		  ; Action ID
$9fe1:  60			RTS				 
$9fe2:  20 06 94	  JSR $9406		   
$9fe5:  29 7F		 AND #$7f			
$9fe7:  C9 04		 CMP #$04			
$9fe9:  F0 21		 BEQ $a00c		   
$9feb:  20 85 A0	  JSR $a085		   
$9fee:  90 1C		 BCC $a00c		   
$9ff0:  A9 00		 LDA #$00			
$9ff2:  85 82		 STA inner_loop	  ; Inner loop counter
$9ff4:  20 43 A0	  JSR $a043		   
$9ff7:  90 0B		 BCC $a004		   
$9ff9:  20 B5 8A	  JSR $8ab5		   
$9ffc:  8D D2 75	  STA act_type		; Action type
$9fff:  90 03		 BCC $a004		   
$a001:  20 0E AD	  JSR $ad0e		   
$a004:  E6 82		 INC inner_loop	  ; Inner loop counter
$a006:  A5 82		 LDA inner_loop	  ; Inner loop counter
$a008:  C9 04		 CMP #$04			
$a00a:  90 E8		 BCC $9ff4		   
$a00c:  60			RTS				 
$a00d:  AD DB 75	  LDA act_id		  ; Action ID
$a010:  C9 21		 CMP #$21			
$a012:  D0 2E		 BNE $a042		   
$a014:  A9 00		 LDA #$00			
$a016:  85 7B		 STA calc_hit		; Calculated hit value
$a018:  85 82		 STA inner_loop	  ; Inner loop counter
$a01a:  20 43 A0	  JSR $a043		   
$a01d:  90 0A		 BCC $a029		   
$a01f:  20 B5 8A	  JSR $8ab5		   
$a022:  8D D2 75	  STA act_type		; Action type
$a025:  90 02		 BCC $a029		   
$a027:  E6 7B		 INC calc_hit		; Calculated hit value
$a029:  E6 82		 INC inner_loop	  ; Inner loop counter
$a02b:  A5 82		 LDA inner_loop	  ; Inner loop counter
$a02d:  C9 04		 CMP #$04			
$a02f:  90 E9		 BCC $a01a		   
$a031:  A5 7B		 LDA calc_hit		; Calculated hit value
$a033:  C9 02		 CMP #$02			
$a035:  90 0B		 BCC $a042		   
$a037:  AD D3 75	  LDA target		  ; Target index
$a03a:  8D DB 75	  STA act_id		  ; Action ID
$a03d:  A9 00		 LDA #$00			
$a03f:  8D DA 75	  STA act_cat		 ; Action category
$a042:  60			RTS				 

; ------------------------------
sub_A043:
$a043:  20 66 88	  JSR $8866		   
$a046:  90 3B		 BCC $a083		   
$a048:  85 00		 STA tmp0			; Temporary 0
$a04a:  20 B6 89	  JSR get_act		 ; Get action data
$a04d:  A0 00		 LDY #$00			
$a04f:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a051:  10 30		 BPL $a083		   
$a053:  A5 00		 LDA tmp0			; Temporary 0
$a055:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$a058:  A0 05		 LDY #$05			
$a05a:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a05c:  29 C4		 AND #$c4			
$a05e:  D0 23		 BNE $a083		   
$a060:  20 C0 A0	  JSR $a0c0		   
$a063:  A5 82		 LDA inner_loop	  ; Inner loop counter
$a065:  20 1C 86	  JSR $861c		   
$a068:  A2 00		 LDX #$00			
$a06a:  A0 02		 LDY #$02			
$a06c:  20 76 81	  JSR mul16		   ; Multiply by 16
$a06f:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$a072:  A5 01		 LDA tmp1			; Temporary 1
$a074:  F0 04		 BEQ $a07a		   
$a076:  A9 FF		 LDA #$ff			
$a078:  85 00		 STA tmp0			; Temporary 0
$a07a:  A5 00		 LDA tmp0			; Temporary 0
$a07c:  AE 80 6E	  LDX action_type	 ; Current action type
$a07f:  DD 76 BB	  CMP $bb76,X		 
$a082:  60			RTS				 
$a083:  18			CLC				 
$a084:  60			RTS				 

; ------------------------------
sub_A085:
$a085:  20 A5 A0	  JSR $a0a5		   
$a088:  AD D0 77	  LDA $77d0		   
$a08b:  85 00		 STA tmp0			; Temporary 0
$a08d:  AD D1 77	  LDA $77d1		   
$a090:  85 01		 STA tmp1			; Temporary 1
$a092:  A0 00		 LDY #$00			
$a094:  A2 94		 LDX #$94			
$a096:  20 76 81	  JSR mul16		   ; Multiply by 16
$a099:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$a09c:  A5 00		 LDA tmp0			; Temporary 0
$a09e:  AE 80 6E	  LDX action_type	 ; Current action type
$a0a1:  DD 6F BB	  CMP $bb6f,X		 
$a0a4:  60			RTS				 

; ------------------------------
sub_A0A5:
$a0a5:  A9 00		 LDA #$00			
$a0a7:  85 94		 STA $94			 
$a0a9:  85 95		 STA $95			 
$a0ab:  A9 07		 LDA #$07			
$a0ad:  85 81		 STA party_loop	  ; Party loop counter
$a0af:  20 76 9D	  JSR $9d76		   
$a0b2:  A5 00		 LDA tmp0			; Temporary 0
$a0b4:  A4 01		 LDY tmp1			; Temporary 1
$a0b6:  A2 94		 LDX #$94			
$a0b8:  20 1D C8	  JSR $c81d		   
$a0bb:  C6 81		 DEC party_loop	  ; Party loop counter
$a0bd:  10 F0		 BPL $a0af		   
$a0bf:  60			RTS				 

; ------------------------------
sub_A0C0:
$a0c0:  A9 00		 LDA #$00			
$a0c2:  85 00		 STA tmp0			; Temporary 0
$a0c4:  85 01		 STA tmp1			; Temporary 1
$a0c6:  A9 07		 LDA #$07			
$a0c8:  85 81		 STA party_loop	  ; Party loop counter
$a0ca:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$a0cd:  A5 82		 LDA inner_loop	  ; Inner loop counter
$a0cf:  0A			ASL				 
$a0d0:  69 00		 ADC #$00			
$a0d2:  A8			TAY				 
$a0d3:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$a0d5:  65 00		 ADC tmp0			; Temporary 0
$a0d7:  85 00		 STA tmp0			; Temporary 0
$a0d9:  C8			INY				 
$a0da:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$a0dc:  65 01		 ADC tmp1			; Temporary 1
$a0de:  85 01		 STA tmp1			; Temporary 1
$a0e0:  C6 81		 DEC party_loop	  ; Party loop counter
$a0e2:  10 E6		 BPL $a0ca		   
$a0e4:  60			RTS				 

; ------------------------------
sub_A0E5:
$a0e5:  A9 00		 LDA #$00			
$a0e7:  85 7C		 STA $7c			 
$a0e9:  A9 07		 LDA #$07			
$a0eb:  85 81		 STA party_loop	  ; Party loop counter
$a0ed:  20 C6 96	  JSR $96c6		   
$a0f0:  90 09		 BCC $a0fb		   
$a0f2:  A6 81		 LDX party_loop	  ; Party loop counter
$a0f4:  BD 5E FF	  LDA $ff5e,X		 
$a0f7:  05 7C		 ORA $7c			 
$a0f9:  85 7C		 STA $7c			 
$a0fb:  C6 81		 DEC party_loop	  ; Party loop counter
$a0fd:  10 EE		 BPL $a0ed		   
$a0ff:  A9 30		 LDA #$30			
$a101:  85 94		 STA $94			 
$a103:  A5 7C		 LDA $7c			 
$a105:  F0 03		 BEQ $a10a		   
$a107:  20 2F A4	  JSR $a42f		   
$a10a:  A5 94		 LDA $94			 
$a10c:  AE 80 6E	  LDX action_type	 ; Current action type
$a10f:  DD 68 BB	  CMP $bb68,X		 
$a112:  60			RTS				 

; ------------------------------
sub_A113:
$a113:  20 B8 A1	  JSR $a1b8		   
$a116:  A2 FF		 LDX #$ff			
$a118:  86 7D		 STX $7d			 
$a11a:  E8			INX				 
$a11b:  86 82		 STX inner_loop	  ; Inner loop counter
$a11d:  86 7B		 STX calc_hit		; Calculated hit value
$a11f:  86 7C		 STX $7c			 
$a121:  20 66 88	  JSR $8866		   
$a124:  85 8A		 STA char_count	  ; Character count
$a126:  90 68		 BCC $a190		   
$a128:  20 B6 89	  JSR get_act		 ; Get action data
$a12b:  A0 00		 LDY #$00			
$a12d:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a12f:  10 5F		 BPL $a190		   
$a131:  0A			ASL				 
$a132:  30 5C		 BMI $a190		   
$a134:  A5 8A		 LDA char_count	  ; Character count
$a136:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$a139:  A0 05		 LDY #$05			
$a13b:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a13d:  29 34		 AND #$34			
$a13f:  D0 4F		 BNE $a190		   
$a141:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a143:  29 C0		 AND #$c0			
$a145:  F0 07		 BEQ $a14e		   
$a147:  A5 8A		 LDA char_count	  ; Character count
$a149:  CD E8 75	  CMP spell_idx	   ; Spell index
$a14c:  D0 42		 BNE $a190		   
$a14e:  20 99 A1	  JSR $a199		   
$a151:  05 02		 ORA tmp2			; Temporary 2
$a153:  F0 3B		 BEQ $a190		   
$a155:  A2 02		 LDX #$02			
$a157:  A0 94		 LDY #$94			
$a159:  20 76 81	  JSR mul16		   ; Multiply by 16
$a15c:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$a15f:  A5 03		 LDA tmp3			; Temporary 3
$a161:  D0 2D		 BNE $a190		   
$a163:  AD 99 BB	  LDA base_dmg		; Base damage value
$a166:  0A			ASL				 
$a167:  C5 02		 CMP tmp2			; Temporary 2
$a169:  90 25		 BCC $a190		   
$a16b:  A5 02		 LDA tmp2			; Temporary 2
$a16d:  AE 80 6E	  LDX action_type	 ; Current action type
$a170:  DD 7D BB	  CMP $bb7d,X		 
$a173:  90 1B		 BCC $a190		   
$a175:  A0 01		 LDY #$01			
$a177:  38			SEC				 
$a178:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a17a:  E5 7B		 SBC calc_hit		; Calculated hit value
$a17c:  C8			INY				 
$a17d:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a17f:  E5 7C		 SBC $7c			 
$a181:  90 0D		 BCC $a190		   
$a183:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a185:  85 7C		 STA $7c			 
$a187:  88			DEY				 
$a188:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a18a:  85 7B		 STA calc_hit		; Calculated hit value
$a18c:  A5 82		 LDA inner_loop	  ; Inner loop counter
$a18e:  85 7D		 STA $7d			 
$a190:  E6 82		 INC inner_loop	  ; Inner loop counter
$a192:  A5 82		 LDA inner_loop	  ; Inner loop counter
$a194:  C9 04		 CMP #$04			
$a196:  90 89		 BCC $a121		   
$a198:  60			RTS				 

; ------------------------------
sub_A199:
$a199:  A0 01		 LDY #$01			
$a19b:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a19d:  85 0C		 STA $0c			 
$a19f:  C8			INY				 
$a1a0:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a1a2:  85 0D		 STA $0d			 
$a1a4:  A5 8B		 LDA actor_idx	   ; Current actor index
$a1a6:  85 0E		 STA $0e			 
$a1a8:  A5 8C		 LDA action_param	; Action parameter
$a1aa:  85 0F		 STA $0f			 
$a1ac:  20 23 88	  JSR $8823		   
$a1af:  A5 8D		 LDA $8d			 
$a1b1:  85 02		 STA tmp2			; Temporary 2
$a1b3:  A5 8E		 LDA $8e			 
$a1b5:  85 03		 STA tmp3			; Temporary 3
$a1b7:  60			RTS				 

; ------------------------------
sub_A1B8:
$a1b8:  A2 00		 LDX #$00			
$a1ba:  86 8D		 STX $8d			 
$a1bc:  86 8E		 STX $8e			 
$a1be:  8A			TXA				 
$a1bf:  48			PHA				 
$a1c0:  20 C7 86	  JSR $86c7		   
$a1c3:  A0 06		 LDY #$06			
$a1c5:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$a1c7:  10 21		 BPL $a1ea		   
$a1c9:  0A			ASL				 
$a1ca:  10 1E		 BPL $a1ea		   
$a1cc:  38			SEC				 
$a1cd:  A5 8D		 LDA $8d			 
$a1cf:  E5 00		 SBC tmp0			; Temporary 0
$a1d1:  A5 8E		 LDA $8e			 
$a1d3:  E5 01		 SBC tmp1			; Temporary 1
$a1d5:  B0 13		 BCS $a1ea		   
$a1d7:  A5 00		 LDA tmp0			; Temporary 0
$a1d9:  85 8D		 STA $8d			 
$a1db:  A5 01		 LDA tmp1			; Temporary 1
$a1dd:  85 8E		 STA $8e			 
$a1df:  A0 03		 LDY #$03			
$a1e1:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$a1e3:  85 8B		 STA actor_idx	   ; Current actor index
$a1e5:  C8			INY				 
$a1e6:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$a1e8:  85 8C		 STA action_param	; Action parameter
$a1ea:  68			PLA				 
$a1eb:  AA			TAX				 
$a1ec:  E8			INX				 
$a1ed:  E0 08		 CPX #$08			
$a1ef:  90 CD		 BCC $a1be		   
$a1f1:  60			RTS				 

; ------------------------------
sub_A1F2:
$a1f2:  AD 06 72	  LDA $7206		   
$a1f5:  C9 D2		 CMP #$d2			
$a1f7:  D0 0F		 BNE $a208		   
$a1f9:  A2 00		 LDX #$00			
$a1fb:  86 81		 STX party_loop	  ; Party loop counter
$a1fd:  20 9C 89	  JSR $899c		   
$a200:  A0 05		 LDY #$05			
$a202:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$a204:  29 C0		 AND #$c0			
$a206:  D0 33		 BNE $a23b		   
$a208:  A9 00		 LDA #$00			
$a20a:  85 7B		 STA calc_hit		; Calculated hit value
$a20c:  85 7C		 STA $7c			 
$a20e:  85 7D		 STA $7d			 
$a210:  A2 03		 LDX #$03			
$a212:  BD 45 6E	  LDA $6e45,X		 
$a215:  C9 5C		 CMP #$5c			
$a217:  F0 24		 BEQ $a23d		   
$a219:  C9 75		 CMP #$75			
$a21b:  F0 24		 BEQ $a241		   
$a21d:  C9 A8		 CMP #$a8			
$a21f:  F0 24		 BEQ $a245		   
$a221:  CA			DEX				 
$a222:  10 EE		 BPL $a212		   
$a224:  A5 7D		 LDA $7d			 
$a226:  D0 13		 BNE $a23b		   
$a228:  AE 80 6E	  LDX action_type	 ; Current action type
$a22b:  A5 7B		 LDA calc_hit		; Calculated hit value
$a22d:  DD 5A BB	  CMP $bb5a,X		 
$a230:  B0 09		 BCS $a23b		   
$a232:  A5 7C		 LDA $7c			 
$a234:  DD 61 BB	  CMP $bb61,X		 
$a237:  B0 02		 BCS $a23b		   
$a239:  18			CLC				 
$a23a:  60			RTS				 
$a23b:  38			SEC				 
$a23c:  60			RTS				 
$a23d:  A0 7B		 LDY #$7b			
$a23f:  D0 06		 BNE $a247		   
$a241:  A0 7C		 LDY #$7c			
$a243:  D0 02		 BNE $a247		   
$a245:  A0 7D		 LDY #$7d			
$a247:  8A			TXA				 
$a248:  48			PHA				 
$a249:  84 01		 STY tmp1			; Temporary 1
$a24b:  85 00		 STA tmp0			; Temporary 0
$a24d:  A2 07		 LDX #$07			
$a24f:  86 81		 STX party_loop	  ; Party loop counter
$a251:  A6 81		 LDX party_loop	  ; Party loop counter
$a253:  20 9C 89	  JSR $899c		   
$a256:  A0 06		 LDY #$06			
$a258:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$a25a:  10 11		 BPL $a26d		   
$a25c:  0A			ASL				 
$a25d:  10 0E		 BPL $a26d		   
$a25f:  A0 0D		 LDY #$0d			
$a261:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$a263:  29 03		 AND #$03			
$a265:  C5 00		 CMP tmp0			; Temporary 0
$a267:  D0 04		 BNE $a26d		   
$a269:  A6 01		 LDX tmp1			; Temporary 1
$a26b:  F6 00		 INC $00,X		   
$a26d:  C6 81		 DEC party_loop	  ; Party loop counter
$a26f:  10 E0		 BPL $a251		   
$a271:  68			PLA				 
$a272:  AA			TAX				 
$a273:  4C 21 A2	  JMP $a221		   

; ------------------------------
sub_A276:
$a276:  AD E7 72	  LDA $72e7		   
$a279:  29 10		 AND #$10			
$a27b:  D0 68		 BNE $a2e5		   
$a27d:  A9 00		 LDA #$00			
$a27f:  85 00		 STA tmp0			; Temporary 0
$a281:  85 01		 STA tmp1			; Temporary 1
$a283:  85 02		 STA tmp2			; Temporary 2
$a285:  85 03		 STA tmp3			; Temporary 3
$a287:  A9 07		 LDA #$07			
$a289:  85 81		 STA party_loop	  ; Party loop counter
$a28b:  A6 81		 LDX party_loop	  ; Party loop counter
$a28d:  20 9C 89	  JSR $899c		   
$a290:  A0 06		 LDY #$06			
$a292:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$a294:  10 32		 BPL $a2c8		   
$a296:  0A			ASL				 
$a297:  10 2F		 BPL $a2c8		   
$a299:  0A			ASL				 
$a29a:  30 2C		 BMI $a2c8		   
$a29c:  E6 03		 INC tmp3			; Temporary 3
$a29e:  A5 81		 LDA party_loop	  ; Party loop counter
$a2a0:  0A			ASL				 
$a2a1:  85 04		 STA $04			 
$a2a3:  0A			ASL				 
$a2a4:  65 04		 ADC $04			 
$a2a6:  A8			TAY				 
$a2a7:  A2 05		 LDX #$05			
$a2a9:  B9 8C 6D	  LDA $6d8c,Y		 
$a2ac:  C9 3C		 CMP #$3c			
$a2ae:  90 14		 BCC $a2c4		   
$a2b0:  C9 42		 CMP #$42			
$a2b2:  B0 10		 BCS $a2c4		   
$a2b4:  B9 C2 6D	  LDA $6dc2,Y		 
$a2b7:  F0 0B		 BEQ $a2c4		   
$a2b9:  18			CLC				 
$a2ba:  65 00		 ADC tmp0			; Temporary 0
$a2bc:  85 00		 STA tmp0			; Temporary 0
$a2be:  A5 01		 LDA tmp1			; Temporary 1
$a2c0:  69 00		 ADC #$00			
$a2c2:  85 01		 STA tmp1			; Temporary 1
$a2c4:  C8			INY				 
$a2c5:  CA			DEX				 
$a2c6:  10 E1		 BPL $a2a9		   
$a2c8:  C6 81		 DEC party_loop	  ; Party loop counter
$a2ca:  10 BF		 BPL $a28b		   
$a2cc:  A2 00		 LDX #$00			
$a2ce:  A0 02		 LDY #$02			
$a2d0:  20 76 81	  JSR mul16		   ; Multiply by 16
$a2d3:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$a2d6:  A5 01		 LDA tmp1			; Temporary 1
$a2d8:  D0 09		 BNE $a2e3		   
$a2da:  A5 00		 LDA tmp0			; Temporary 0
$a2dc:  AE 80 6E	  LDX action_type	 ; Current action type
$a2df:  DD 53 BB	  CMP $bb53,X		 
$a2e2:  60			RTS				 
$a2e3:  38			SEC				 
$a2e4:  60			RTS				 
$a2e5:  18			CLC				 
$a2e6:  60			RTS				 

; ------------------------------
sub_A2E7:
$a2e7:  A9 00		 LDA #$00			
$a2e9:  85 82		 STA inner_loop	  ; Inner loop counter
$a2eb:  85 7B		 STA calc_hit		; Calculated hit value
$a2ed:  85 7C		 STA $7c			 
$a2ef:  85 7D		 STA $7d			 
$a2f1:  85 7E		 STA $7e			 
$a2f3:  20 42 88	  JSR $8842		   
$a2f6:  90 21		 BCC $a319		   
$a2f8:  A5 82		 LDA inner_loop	  ; Inner loop counter
$a2fa:  20 6B 8A	  JSR $8a6b		   
$a2fd:  A0 00		 LDY #$00			
$a2ff:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a301:  10 16		 BPL $a319		   
$a303:  0A			ASL				 
$a304:  30 13		 BMI $a319		   
$a306:  38			SEC				 
$a307:  A5 7B		 LDA calc_hit		; Calculated hit value
$a309:  E5 0C		 SBC $0c			 
$a30b:  A5 7C		 LDA $7c			 
$a30d:  E5 0D		 SBC $0d			 
$a30f:  B0 08		 BCS $a319		   
$a311:  A5 0C		 LDA $0c			 
$a313:  85 7B		 STA calc_hit		; Calculated hit value
$a315:  A5 0D		 LDA $0d			 
$a317:  85 7C		 STA $7c			 
$a319:  E6 82		 INC inner_loop	  ; Inner loop counter
$a31b:  A5 82		 LDA inner_loop	  ; Inner loop counter
$a31d:  C9 04		 CMP #$04			
$a31f:  90 D2		 BCC $a2f3		   
$a321:  A9 07		 LDA #$07			
$a323:  85 81		 STA party_loop	  ; Party loop counter
$a325:  A6 81		 LDX party_loop	  ; Party loop counter
$a327:  20 56 88	  JSR $8856		   
$a32a:  A0 06		 LDY #$06			
$a32c:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$a32e:  10 19		 BPL $a349		   
$a330:  0A			ASL				 
$a331:  10 16		 BPL $a349		   
$a333:  0A			ASL				 
$a334:  30 13		 BMI $a349		   
$a336:  38			SEC				 
$a337:  A5 7D		 LDA $7d			 
$a339:  E5 0E		 SBC $0e			 
$a33b:  A5 7E		 LDA $7e			 
$a33d:  E5 0F		 SBC $0f			 
$a33f:  B0 08		 BCS $a349		   
$a341:  A5 0E		 LDA $0e			 
$a343:  85 7D		 STA $7d			 
$a345:  A5 0F		 LDA $0f			 
$a347:  85 7E		 STA $7e			 
$a349:  C6 81		 DEC party_loop	  ; Party loop counter
$a34b:  10 D8		 BPL $a325		   
$a34d:  A2 7D		 LDX #$7d			
$a34f:  A0 7B		 LDY #$7b			
$a351:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$a354:  A5 7E		 LDA $7e			 
$a356:  D0 0C		 BNE $a364		   
$a358:  A5 7D		 LDA $7d			 
$a35a:  C9 04		 CMP #$04			
$a35c:  90 06		 BCC $a364		   
$a35e:  C9 08		 CMP #$08			
$a360:  B0 02		 BCS $a364		   
$a362:  38			SEC				 
$a363:  60			RTS				 
$a364:  18			CLC				 
$a365:  60			RTS				 

; ------------------------------
sub_A366:
$a366:  A9 00		 LDA #$00			
$a368:  8D E1 75	  STA power_lo		; Action power low
$a36b:  8D E2 75	  STA power_hi		; Action power high
$a36e:  8D E3 75	  STA $75e3		   
$a371:  A9 07		 LDA #$07			
$a373:  85 81		 STA party_loop	  ; Party loop counter
$a375:  20 02 86	  JSR $8602		   
$a378:  D0 19		 BNE $a393		   
$a37a:  20 B2 A3	  JSR $a3b2		   
$a37d:  90 14		 BCC $a393		   
$a37f:  18			CLC				 
$a380:  A5 0E		 LDA $0e			 
$a382:  6D E1 75	  ADC power_lo		; Action power low
$a385:  8D E1 75	  STA power_lo		; Action power low
$a388:  A5 0F		 LDA $0f			 
$a38a:  6D E2 75	  ADC power_hi		; Action power high
$a38d:  8D E2 75	  STA power_hi		; Action power high
$a390:  20 C8 A4	  JSR $a4c8		   
$a393:  C6 81		 DEC party_loop	  ; Party loop counter
$a395:  10 DE		 BPL $a375		   
$a397:  AD E2 75	  LDA power_hi		; Action power high
$a39a:  4A			LSR				 
$a39b:  85 0F		 STA $0f			 
$a39d:  AD E1 75	  LDA power_lo		; Action power low
$a3a0:  6A			ROR				 
$a3a1:  85 0E		 STA $0e			 
$a3a3:  05 0F		 ORA $0f			 
$a3a5:  F0 0A		 BEQ $a3b1		   
$a3a7:  AD E3 75	  LDA $75e3		   
$a3aa:  F0 05		 BEQ $a3b1		   
$a3ac:  85 8C		 STA action_param	; Action parameter
$a3ae:  20 B1 AC	  JSR $acb1		   
$a3b1:  60			RTS				 

; ------------------------------
sub_A3B2:
$a3b2:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$a3b5:  20 C6 96	  JSR $96c6		   
$a3b8:  90 1D		 BCC $a3d7		   
$a3ba:  A6 81		 LDX party_loop	  ; Party loop counter
$a3bc:  BD 5E FF	  LDA $ff5e,X		 
$a3bf:  85 7C		 STA $7c			 
$a3c1:  20 2F A4	  JSR $a42f		   
$a3c4:  A5 94		 LDA $94			 
$a3c6:  C9 18		 CMP #$18			
$a3c8:  90 0D		 BCC $a3d7		   
$a3ca:  A6 81		 LDX party_loop	  ; Party loop counter
$a3cc:  20 11 88	  JSR $8811		   
$a3cf:  A5 0E		 LDA $0e			 
$a3d1:  05 0F		 ORA $0f			 
$a3d3:  F0 02		 BEQ $a3d7		   
$a3d5:  38			SEC				 
$a3d6:  60			RTS				 
$a3d7:  18			CLC				 
$a3d8:  60			RTS				 

; ------------------------------
sub_A3D9:
$a3d9:  20 06 94	  JSR $9406		   
$a3dc:  29 7F		 AND #$7f			
$a3de:  C9 04		 CMP #$04			
$a3e0:  D0 0B		 BNE $a3ed		   
$a3e2:  AD D3 75	  LDA target		  ; Target index
$a3e5:  C9 1F		 CMP #$1f			
$a3e7:  F0 04		 BEQ $a3ed		   
$a3e9:  C9 20		 CMP #$20			
$a3eb:  D0 02		 BNE $a3ef		   
$a3ed:  38			SEC				 
$a3ee:  60			RTS				 
$a3ef:  18			CLC				 
$a3f0:  60			RTS				 

; ------------------------------
sub_A3F1:
$a3f1:  A2 00		 LDX #$00			
$a3f3:  86 82		 STX inner_loop	  ; Inner loop counter
$a3f5:  8E DF 75	  STX $75df		   
$a3f8:  8E E0 75	  STX $75e0		   
$a3fb:  20 66 88	  JSR $8866		   
$a3fe:  90 26		 BCC $a426		   
$a400:  20 B6 89	  JSR get_act		 ; Get action data
$a403:  A0 00		 LDY #$00			
$a405:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a407:  10 1D		 BPL $a426		   
$a409:  0A			ASL				 
$a40a:  30 1A		 BMI $a426		   
$a40c:  20 19 87	  JSR $8719		   
$a40f:  38			SEC				 
$a410:  AD DF 75	  LDA $75df		   
$a413:  E5 0C		 SBC $0c			 
$a415:  AD E0 75	  LDA $75e0		   
$a418:  E5 0D		 SBC $0d			 
$a41a:  B0 0A		 BCS $a426		   
$a41c:  A5 0C		 LDA $0c			 
$a41e:  8D DF 75	  STA $75df		   
$a421:  A5 0D		 LDA $0d			 
$a423:  8D E0 75	  STA $75e0		   
$a426:  E6 82		 INC inner_loop	  ; Inner loop counter
$a428:  A5 82		 LDA inner_loop	  ; Inner loop counter
$a42a:  C9 04		 CMP #$04			
$a42c:  90 CD		 BCC $a3fb		   
$a42e:  60			RTS				 

; ------------------------------
sub_A42F:
$a42f:  A5 81		 LDA party_loop	  ; Party loop counter
$a431:  48			PHA				 
$a432:  20 44 A4	  JSR $a444		   
$a435:  A9 30		 LDA #$30			
$a437:  85 94		 STA $94			 
$a439:  A5 7B		 LDA calc_hit		; Calculated hit value
$a43b:  F0 03		 BEQ $a440		   
$a43d:  20 88 A4	  JSR $a488		   
$a440:  68			PLA				 
$a441:  85 81		 STA party_loop	  ; Party loop counter
$a443:  60			RTS				 

; ------------------------------
sub_A444:
$a444:  A9 00		 LDA #$00			
$a446:  85 7B		 STA calc_hit		; Calculated hit value
$a448:  85 82		 STA inner_loop	  ; Inner loop counter
$a44a:  20 66 88	  JSR $8866		   
$a44d:  90 30		 BCC $a47f		   
$a44f:  85 0C		 STA $0c			 
$a451:  20 B6 89	  JSR get_act		 ; Get action data
$a454:  A0 00		 LDY #$00			
$a456:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a458:  10 25		 BPL $a47f		   
$a45a:  0A			ASL				 
$a45b:  30 22		 BMI $a47f		   
$a45d:  A9 0B		 LDA #$0b			
$a45f:  85 0D		 STA $0d			 
$a461:  20 AA A5	  JSR find_tgt		; Find valid target
$a464:  90 15		 BCC $a47b		   
$a466:  C0 15		 CPY #$15			
$a468:  B0 11		 BCS $a47b		   
$a46a:  B9 0B B8	  LDA spell_eff_tbl,Y ; Spell effect type table
$a46d:  29 1F		 AND #$1f			
$a46f:  AA			TAX				 
$a470:  BD CC 94	  LDA $94cc,X		 
$a473:  AA			TAX				 
$a474:  BD 5E FF	  LDA $ff5e,X		 
$a477:  05 7B		 ORA calc_hit		; Calculated hit value
$a479:  85 7B		 STA calc_hit		; Calculated hit value
$a47b:  C6 0D		 DEC $0d			 
$a47d:  10 E2		 BPL $a461		   
$a47f:  E6 82		 INC inner_loop	  ; Inner loop counter
$a481:  A5 82		 LDA inner_loop	  ; Inner loop counter
$a483:  C9 04		 CMP #$04			
$a485:  90 C3		 BCC $a44a		   
$a487:  60			RTS				 

; ------------------------------
sub_A488:
$a488:  A9 00		 LDA #$00			
$a48a:  85 94		 STA $94			 
$a48c:  A9 07		 LDA #$07			
$a48e:  85 81		 STA party_loop	  ; Party loop counter
$a490:  06 7C		 ASL $7c			 
$a492:  90 2F		 BCC $a4c3		   
$a494:  A5 7B		 LDA calc_hit		; Calculated hit value
$a496:  85 02		 STA tmp2			; Temporary 2
$a498:  A9 00		 LDA #$00			
$a49a:  85 95		 STA $95			 
$a49c:  46 02		 LSR tmp2			; Temporary 2
$a49e:  90 1B		 BCC $a4bb		   
$a4a0:  A5 95		 LDA $95			 
$a4a2:  20 E2 92	  JSR $92e2		   
$a4a5:  0A			ASL				 
$a4a6:  0A			ASL				 
$a4a7:  0A			ASL				 
$a4a8:  0A			ASL				 
$a4a9:  85 03		 STA tmp3			; Temporary 3
$a4ab:  A5 94		 LDA $94			 
$a4ad:  48			PHA				 
$a4ae:  18			CLC				 
$a4af:  65 03		 ADC tmp3			; Temporary 3
$a4b1:  85 94		 STA $94			 
$a4b3:  AA			TAX				 
$a4b4:  68			PLA				 
$a4b5:  F0 04		 BEQ $a4bb		   
$a4b7:  8A			TXA				 
$a4b8:  4A			LSR				 
$a4b9:  85 94		 STA $94			 
$a4bb:  E6 95		 INC $95			 
$a4bd:  A5 95		 LDA $95			 
$a4bf:  C9 07		 CMP #$07			
$a4c1:  90 D9		 BCC $a49c		   
$a4c3:  C6 81		 DEC party_loop	  ; Party loop counter
$a4c5:  10 C9		 BPL $a490		   
$a4c7:  60			RTS				 

; ------------------------------
sub_A4C8:
$a4c8:  AD E3 75	  LDA $75e3		   
$a4cb:  48			PHA				 
$a4cc:  18			CLC				 
$a4cd:  A5 8C		 LDA action_param	; Action parameter
$a4cf:  6D E3 75	  ADC $75e3		   
$a4d2:  8D E3 75	  STA $75e3		   
$a4d5:  68			PLA				 
$a4d6:  F0 03		 BEQ $a4db		   
$a4d8:  4E E3 75	  LSR $75e3		   
$a4db:  60			RTS				 

; ------------------------------
sub_A4DC:
$a4dc:  A9 00		 LDA #$00			
$a4de:  8D DA 75	  STA act_cat		 ; Action category
$a4e1:  AD D3 75	  LDA target		  ; Target index
$a4e4:  8D DB 75	  STA act_id		  ; Action ID
$a4e7:  60			RTS				 

; ------------------------------
sub_A4E8:
$a4e8:  A2 07		 LDX #$07			
$a4ea:  86 81		 STX party_loop	  ; Party loop counter
$a4ec:  A6 81		 LDX party_loop	  ; Party loop counter
$a4ee:  BD 79 75	  LDA $7579,X		 
$a4f1:  C9 10		 CMP #$10			
$a4f3:  F0 0F		 BEQ $a504		   
$a4f5:  85 00		 STA tmp0			; Temporary 0
$a4f7:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$a4fa:  20 09 A5	  JSR $a509		   
$a4fd:  A5 00		 LDA tmp0			; Temporary 0
$a4ff:  F0 03		 BEQ $a504		   
$a501:  20 16 8F	  JSR $8f16		   
$a504:  C6 81		 DEC party_loop	  ; Party loop counter
$a506:  10 E4		 BPL $a4ec		   
$a508:  60			RTS				 

; ------------------------------
sub_A509:
$a509:  A2 13		 LDX #$13			
$a50b:  BC EC 90	  LDY $90ec,X		 
$a50e:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$a510:  85 94		 STA $94			 
$a512:  C8			INY				 
$a513:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$a515:  85 95		 STA $95			 
$a517:  8A			TXA				 
$a518:  48			PHA				 
$a519:  A2 94		 LDX #$94			
$a51b:  A5 00		 LDA tmp0			; Temporary 0
$a51d:  20 30 83	  JSR mult_a		  ; Multiply by A
$a520:  A5 94		 LDA $94			 
$a522:  29 0F		 AND #$0f			
$a524:  08			PHP				 
$a525:  20 A5 81	  JSR shift_ext	   ; Extended shift
$a528:  28			PLP				 
$a529:  F0 05		 BEQ $a530		   
$a52b:  A9 01		 LDA #$01			
$a52d:  20 13 C8	  JSR $c813		   
$a530:  A5 19		 LDA mult_hi		 ; Product high
$a532:  F0 06		 BEQ $a53a		   
$a534:  A9 FF		 LDA #$ff			
$a536:  85 94		 STA $94			 
$a538:  85 95		 STA $95			 
$a53a:  68			PLA				 
$a53b:  AA			TAX				 
$a53c:  BC EC 90	  LDY $90ec,X		 
$a53f:  A5 94		 LDA $94			 
$a541:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$a543:  C8			INY				 
$a544:  A5 95		 LDA $95			 
$a546:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$a548:  CA			DEX				 
$a549:  10 C0		 BPL $a50b		   
$a54b:  60			RTS				 
$a54c:  60			RTS				 

; --------------------------------------------------
; Execute action step
; --------------------------------------------------
exec_step:					 ; $a54d
$a54d:  48			PHA				 
$a54e:  20 FC A5	  JSR chk_exec		; Check if can execute
$a551:  68			PLA				 
$a552:  90 F8		 BCC $a54c		   
$a554:  20 8D A5	  JSR valid_act	   ; Validate action
$a557:  90 F3		 BCC $a54c		   
$a559:  AD E8 75	  LDA spell_idx	   ; Spell index
$a55c:  0A			ASL				 
$a55d:  AA			TAX				 
$a55e:  BD 26 A6	  LDA $a626,X		 
$a561:  85 86		 STA stat_ptr_lo	 ; Stat table pointer low
$a563:  BD 27 A6	  LDA $a627,X		 
$a566:  85 87		 STA stat_ptr_hi	 ; Stat table pointer high
$a568:  A5 0D		 LDA $0d			 
$a56a:  0A			ASL				 
$a56b:  A8			TAY				 
$a56c:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$a56e:  85 88		 STA char_ptr_lo	 ; Character data pointer low
$a570:  C8			INY				 
$a571:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$a573:  85 89		 STA char_ptr_hi	 ; Character data pointer high
$a575:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$a578:  29 7F		 AND #$7f			
$a57a:  8D F0 75	  STA btl_f0		  ; Battle flag F0
$a57d:  A5 0F		 LDA $0f			 
$a57f:  8D D3 75	  STA target		  ; Target index
$a582:  AC 80 6E	  LDY action_type	 ; Current action type
$a585:  C0 04		 CPY #$04			
$a587:  F0 03		 BEQ $a58c		   
$a589:  6C 88 00	  JMP (char_ptr_lo)   ; Character data pointer low
$a58c:  60			RTS				 

; --------------------------------------------------
; Validate action
; --------------------------------------------------
valid_act:					 ; $a58d
$a58d:  85 0D		 STA $0d			 
$a58f:  AD E8 75	  LDA spell_idx	   ; Spell index
$a592:  85 0C		 STA $0c			 
$a594:  20 AA A5	  JSR find_tgt		; Find valid target
$a597:  90 0F		 BCC $a5a8		   
$a599:  B9 67 B9	  LDA enemy_res_tbl,Y ; Enemy resistance table
$a59c:  29 1F		 AND #$1f			
$a59e:  38			SEC				 
$a59f:  ED DC 75	  SBC $75dc		   
$a5a2:  F0 02		 BEQ $a5a6		   
$a5a4:  B0 02		 BCS $a5a8		   
$a5a6:  38			SEC				 
$a5a7:  60			RTS				 
$a5a8:  18			CLC				 
$a5a9:  60			RTS				 

; --------------------------------------------------
; Find valid target
; --------------------------------------------------
find_tgt:					 ; $a5aa
$a5aa:  20 1A A6	  JSR calc_off		; Calculate offset
$a5ad:  18			CLC				 
$a5ae:  65 0D		 ADC $0d			 
$a5b0:  AA			TAX				 
$a5b1:  BD 8A A6	  LDA $a68a,X		 
$a5b4:  85 0F		 STA $0f			 
$a5b6:  A5 0C		 LDA $0c			 
$a5b8:  20 B6 89	  JSR get_act		 ; Get action data
$a5bb:  AD 24 A6	  LDA act_ptr_tbl	 ; Action pointer table
$a5be:  85 86		 STA stat_ptr_lo	 ; Stat table pointer low
$a5c0:  AD 25 A6	  LDA $a625		   
$a5c3:  85 87		 STA stat_ptr_hi	 ; Stat table pointer high
$a5c5:  A2 86		 LDX #$86			
$a5c7:  20 1A A6	  JSR calc_off		; Calculate offset
$a5ca:  20 13 C8	  JSR $c813		   
$a5cd:  A0 1B		 LDY #$1b			
$a5cf:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a5d1:  85 00		 STA tmp0			; Temporary 0
$a5d3:  C8			INY				 
$a5d4:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a5d6:  85 01		 STA tmp1			; Temporary 1
$a5d8:  A0 00		 LDY #$00			
$a5da:  46 01		 LSR tmp1			; Temporary 1
$a5dc:  66 00		 ROR tmp0			; Temporary 0
$a5de:  90 06		 BCC $a5e6		   
$a5e0:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$a5e2:  C5 0F		 CMP $0f			 
$a5e4:  F0 07		 BEQ $a5ed		   
$a5e6:  C8			INY				 
$a5e7:  C0 0C		 CPY #$0c			
$a5e9:  90 EF		 BCC $a5da		   
$a5eb:  18			CLC				 
$a5ec:  60			RTS				 
$a5ed:  A4 0F		 LDY $0f			 
$a5ef:  C0 32		 CPY #$32			
$a5f1:  D0 07		 BNE $a5fa		   
$a5f3:  AD DC 75	  LDA $75dc		   
$a5f6:  D0 02		 BNE $a5fa		   
$a5f8:  18			CLC				 
$a5f9:  60			RTS				 
$a5fa:  38			SEC				 
$a5fb:  60			RTS				 

; --------------------------------------------------
; Check if can execute
; --------------------------------------------------
chk_exec:					 ; $a5fc
$a5fc:  AD 80 6E	  LDA action_type	 ; Current action type
$a5ff:  C9 05		 CMP #$05			
$a601:  F0 15		 BEQ $a618		   
$a603:  AD E4 72	  LDA $72e4		   
$a606:  30 10		 BMI $a618		   
$a608:  AD E8 75	  LDA spell_idx	   ; Spell index
$a60b:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$a60e:  A0 05		 LDY #$05			
$a610:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a612:  29 08		 AND #$08			
$a614:  D0 02		 BNE $a618		   
$a616:  38			SEC				 
$a617:  60			RTS				 
$a618:  18			CLC				 
$a619:  60			RTS				 

; --------------------------------------------------
; Calculate offset
; --------------------------------------------------
calc_off:					 ; $a61a
$a61a:  A5 0C		 LDA $0c			 
$a61c:  0A			ASL				 
$a61d:  0A			ASL				 
$a61e:  85 00		 STA tmp0			; Temporary 0
$a620:  0A			ASL				 
$a621:  65 00		 ADC tmp0			; Temporary 0
$a623:  60			RTS				 

; --------------------------------------------------
; Action pointer table
; --------------------------------------------------
act_ptr_tbl:					 ; $a624
$a624:  2E B3 4E	  ROL $4eb3		   
$a627:  A6 4E		 LDX $4e			 
$a629:  A6 36		 LDX $36			 
$a62b:  A6 66		 LDX $66			 
$a62d:  A6 7E		 LDX $7e			 
$a62f:  A6 4E		 LDX $4e			 
$a631:  A6 4E		 LDX $4e			 
$a633:  A6 4E		 LDX $4e			 
$a635:  A6 33		 LDX $33			 
$a637:  95 33		 STA $33,X		   
$a639:  95 33		 STA $33,X		   
$a63b:  95 BB		 STA $bb,X		   
							  ; Data region
		.db $9b, $a6, $9b, $9f, $9f, $0b
$a643:  98			TYA				 
							  ; Data region
		.db $0b
$a645:  98			TYA				 
							  ; Data region
		.db $0b, $98, $9c
$a649:  9D 31 9E	  STA $9e31,X		 
							  ; Data region
		.db $8b, $9e, $54, $95, $69, $95, $bb, $9b, $bb, $9b, $e2, $9f
$a658:  0D A0 0B	  ORA $0ba0		   
$a65b:  98			TYA				 
							  ; Data region
		.db $0b
$a65d:  98			TYA				 
							  ; Data region
		.db $0b
$a65f:  98			TYA				 
$a660:  4D 98 31	  EOR $3198		   
							  ; Data region
		.db $9e
$a664:  35 9E		 AND $9e,X		   
							  ; Data region
		.db $1b
$a667:  95 1B		 STA $1b,X		   
$a669:  95 1B		 STA $1b,X		   
$a66b:  95 33		 STA $33,X		   
$a66d:  95 33		 STA $33,X		   
$a66f:  95 33		 STA $33,X		   
$a671:  95 48		 STA $48,X		   
$a673:  95 48		 STA $48,X		   
$a675:  95 48		 STA $48,X		   
$a677:  95 C3		 STA $c3,X		   
							  ; Data region
		.db $9e, $5a, $9f
$a67c:  B8			CLV				 
							  ; Data region
		.db $9f, $1b
$a67f:  95 33		 STA $33,X		   
$a681:  95 48		 STA $48,X		   
$a683:  95 33		 STA $33,X		   
$a685:  95 CD		 STA $cd,X		   
sub_A687:
							  ; Data region
		.db $9b, $c3, $9e, $e2, $9b, $5a, $9f
$a68e:  76 9F		 ROR $9f,X		   
$a690:  8D 9F C7	  STA $c79f		   
							  ; Data region
		.db $9f
$a694:  4C A5 13	  JMP $13a5		   
							  ; Data region
		.db $14
$a698:  19 1A 21	  ORA $211a,Y		 
							  ; Data region
		.db $22
$a69c:  29 2A		 AND #$2a			
							  ; Data region
		.db $2b
$a69f:  2C 30 31	  BIT $3130		   
$a6a2:  0D 0E 0F	  ORA $0f0e		   
							  ; Data region
		.db $17
$a6a6:  18			CLC				 
$a6a7:  24 29		 BIT $29			 
$a6a9:  2A			ROL				 
							  ; Data region
		.db $2b
$a6ab:  2E 30 32	  ROL $3230		   
$a6ae:  00			BRK				 
$a6af:  01 02		 ORA ($02,X)		 
							  ; Data region
		.db $03, $04
$a6b3:  05 06		 ORA $06			 
							  ; Data region
		.db $07
$a6b6:  08			PHP				 
							  ; Data region
		.db $1c, $1f
$a6b9:  28			PLP				 
$a6ba:  09 0A		 ORA #$0a			
							  ; Data region
		.db $0b, $0c, $1b, $1c
$a6c0:  1E 1F 20	  ASL $201f,X		 
							  ; Data region
		.db $23
$a6c4:  25 33		 AND $33			 
st_setup1:					 ; $a6c6
$a6c6:  A2 00		 LDX #$00			
$a6c8:  F0 0A		 BEQ $a6d4		   
st_setup2:					 ; $a6ca
$a6ca:  A2 02		 LDX #$02			
$a6cc:  D0 06		 BNE $a6d4		   
st_setup3:					 ; $a6ce
$a6ce:  A2 04		 LDX #$04			
$a6d0:  D0 02		 BNE $a6d4		   
st_clean:					 ; $a6d2
$a6d2:  A2 06		 LDX #$06			
$a6d4:  8E F1 75	  STX $75f1		   
$a6d7:  AD E8 75	  LDA spell_idx	   ; Spell index
$a6da:  C9 08		 CMP #$08			
$a6dc:  B0 24		 BCS $a702		   
$a6de:  20 B6 89	  JSR get_act		 ; Get action data
$a6e1:  A0 13		 LDY #$13			
$a6e3:  98			TYA				 
$a6e4:  48			PHA				 
$a6e5:  A5 79		 LDA action_ptr_lo   ; Action data pointer low
$a6e7:  48			PHA				 
$a6e8:  A5 7A		 LDA action_ptr_hi   ; Action data pointer high
$a6ea:  48			PHA				 
$a6eb:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a6ed:  20 03 A7	  JSR $a703		   
$a6f0:  90 03		 BCC $a6f5		   
$a6f2:  20 3C A7	  JSR $a73c		   
$a6f5:  68			PLA				 
$a6f6:  85 7A		 STA action_ptr_hi   ; Action data pointer high
$a6f8:  68			PLA				 
$a6f9:  85 79		 STA action_ptr_lo   ; Action data pointer low
$a6fb:  68			PLA				 
$a6fc:  A8			TAY				 
$a6fd:  C8			INY				 
$a6fe:  C0 1B		 CPY #$1b			
$a700:  90 E1		 BCC $a6e3		   
$a702:  60			RTS				 

; ------------------------------
sub_A703:
$a703:  29 7F		 AND #$7f			
$a705:  8D 55 73	  STA $7355		   
$a708:  AE F1 75	  LDX $75f1		   
$a70b:  BD 47 A7	  LDA $a747,X		 
$a70e:  85 00		 STA tmp0			; Temporary 0
$a710:  BD 48 A7	  LDA $a748,X		 
$a713:  85 01		 STA tmp1			; Temporary 1
$a715:  A0 00		 LDY #$00			
$a717:  B1 00		 LDA (tmp0),Y		; Temporary 0
$a719:  C9 FF		 CMP #$ff			
$a71b:  F0 0B		 BEQ $a728		   
$a71d:  CD 55 73	  CMP $7355		   
$a720:  F0 08		 BEQ $a72a		   
$a722:  C8			INY				 
$a723:  C8			INY				 
$a724:  C8			INY				 
$a725:  C8			INY				 
$a726:  D0 EF		 BNE $a717		   
$a728:  18			CLC				 
$a729:  60			RTS				 
$a72a:  C8			INY				 
$a72b:  B1 00		 LDA (tmp0),Y		; Temporary 0
$a72d:  8D D3 75	  STA target		  ; Target index
$a730:  C8			INY				 
$a731:  B1 00		 LDA (tmp0),Y		; Temporary 0
$a733:  85 86		 STA stat_ptr_lo	 ; Stat table pointer low
$a735:  C8			INY				 
$a736:  B1 00		 LDA (tmp0),Y		; Temporary 0
$a738:  85 87		 STA stat_ptr_hi	 ; Stat table pointer high
$a73a:  38			SEC				 
$a73b:  60			RTS				 

; ------------------------------
sub_A73C:
$a73c:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$a73f:  09 80		 ORA #$80			
$a741:  8D F0 75	  STA btl_f0		  ; Battle flag F0
$a744:  6C 86 00	  JMP (stat_ptr_lo)   ; Stat table pointer low
							  ; Data region
		.db $4f, $a7, $7c, $a7, $8d, $a7, $92, $a7
$a74f:  11 83		 ORA ($83),Y		 
							  ; Data region
		.db $33
$a752:  95 17		 STA $17,X		   
$a754:  84 33		 STY $33			 
$a756:  95 18		 STA $18,X		   
$a758:  85 A6		 STA $a6			 
							  ; Data region
		.db $9b, $1a
$a75c:  86 1B		 STX $1b			 
$a75e:  95 1B		 STA $1b,X		   
							  ; Data region
		.db $87, $33
$a762:  95 1D		 STA $1d,X		   
$a764:  88			DEY				 
							  ; Data region
		.db $bb, $9b
$a767:  1E 89 48	  ASL $4889,X		 
$a76a:  95 22		 STA $22,X		   
$a76c:  8D BB 9B	  STA $9bbb		   
							  ; Data region
		.db $23
$a770:  8E 33 95	  STX $9533		   
$a773:  45 92		 EOR $92			 
							  ; Data region
		.db $e2, $9b
$a777:  5D 9D BB	  EOR $bb9d,X		 
							  ; Data region
		.db $9b, $ff
$a77c:  20 8B E9	  JSR $e98b		   
$a77f:  98			TYA				 
$a780:  40			RTI				 
							  ; Data region
		.db $8f
$a782:  BC 98 53	  LDY $5398,X		 
$a785:  94 AC		 STY $ac,X		   
$a787:  98			TYA				 
$a788:  60			RTS				 
$a789:  A0 0E		 LDY #$0e			
$a78b:  99 FF 58	  STA $58ff,Y		 
$a78e:  98			TYA				 
$a78f:  EC 9D FF	  CPX $ff9d		   
							  ; Data region
		.db $1f
$a793:  8A			TXA				 
$a794:  76 9F		 ROR $9f,X		   
							  ; Data region
		.db $ff
sub_A797:
$a797:  48			PHA				 
$a798:  8A			TXA				 
$a799:  48			PHA				 
$a79a:  98			TYA				 
$a79b:  48			PHA				 
$a79c:  84 01		 STY tmp1			; Temporary 1
$a79e:  BD 67 B9	  LDA enemy_res_tbl,X ; Enemy resistance table
$a7a1:  48			PHA				 
$a7a2:  29 80		 AND #$80			
$a7a4:  85 00		 STA tmp0			; Temporary 0
$a7a6:  68			PLA				 
$a7a7:  29 60		 AND #$60			
$a7a9:  F0 0C		 BEQ $a7b7		   
$a7ab:  C9 60		 CMP #$60			
$a7ad:  F0 08		 BEQ $a7b7		   
$a7af:  C9 20		 CMP #$20			
$a7b1:  F0 0C		 BEQ $a7bf		   
$a7b3:  C9 40		 CMP #$40			
$a7b5:  F0 71		 BEQ $a828		   
$a7b7:  68			PLA				 
$a7b8:  A8			TAY				 
$a7b9:  68			PLA				 
$a7ba:  AA			TAX				 
$a7bb:  68			PLA				 
$a7bc:  A5 00		 LDA tmp0			; Temporary 0
$a7be:  60			RTS				 
$a7bf:  A5 00		 LDA tmp0			; Temporary 0
$a7c1:  10 14		 BPL $a7d7		   
$a7c3:  A9 00		 LDA #$00			
$a7c5:  85 02		 STA tmp2			; Temporary 2
$a7c7:  A2 07		 LDX #$07			
$a7c9:  8A			TXA				 
$a7ca:  48			PHA				 
$a7cb:  20 AA A8	  JSR $a8aa		   
$a7ce:  26 02		 ROL tmp2			; Temporary 2
$a7d0:  68			PLA				 
$a7d1:  AA			TAX				 
$a7d2:  CA			DEX				 
$a7d3:  10 F4		 BPL $a7c9		   
$a7d5:  30 39		 BMI $a810		   
$a7d7:  A9 00		 LDA #$00			
$a7d9:  85 02		 STA tmp2			; Temporary 2
$a7db:  A2 03		 LDX #$03			
$a7dd:  8A			TXA				 
$a7de:  48			PHA				 
$a7df:  20 6B 8A	  JSR $8a6b		   
$a7e2:  90 25		 BCC $a809		   
$a7e4:  48			PHA				 
$a7e5:  A0 00		 LDY #$00			
$a7e7:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a7e9:  6A			ROR				 
$a7ea:  29 E0		 AND #$e0			
$a7ec:  85 04		 STA $04			 
$a7ee:  68			PLA				 
$a7ef:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$a7f2:  A0 05		 LDY #$05			
$a7f4:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a7f6:  85 03		 STA tmp3			; Temporary 3
$a7f8:  C8			INY				 
$a7f9:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a7fb:  29 1F		 AND #$1f			
$a7fd:  05 04		 ORA $04			 
$a7ff:  85 04		 STA $04			 
$a801:  C8			INY				 
$a802:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a804:  85 05		 STA $05			 
$a806:  20 5B A8	  JSR $a85b		   
$a809:  26 02		 ROL tmp2			; Temporary 2
$a80b:  68			PLA				 
$a80c:  AA			TAX				 
$a80d:  CA			DEX				 
$a80e:  10 CD		 BPL $a7dd		   
$a810:  A5 02		 LDA tmp2			; Temporary 2
$a812:  00			BRK				 
							  ; Data region
		.db $2b, $0f
$a815:  05 00		 ORA tmp0			; Temporary 0
$a817:  85 00		 STA tmp0			; Temporary 0
$a819:  30 0A		 BMI $a825		   
$a81b:  20 76 8A	  JSR $8a76		   
$a81e:  90 05		 BCC $a825		   
$a820:  20 BA 8A	  JSR $8aba		   
$a823:  85 00		 STA tmp0			; Temporary 0
$a825:  4C B7 A7	  JMP $a7b7		   
$a828:  A5 00		 LDA tmp0			; Temporary 0
$a82a:  10 F9		 BPL $a825		   
$a82c:  A9 00		 LDA #$00			
$a82e:  85 02		 STA tmp2			; Temporary 2
$a830:  A2 07		 LDX #$07			
$a832:  8A			TXA				 
$a833:  48			PHA				 
$a834:  20 AA A8	  JSR $a8aa		   
$a837:  90 0E		 BCC $a847		   
$a839:  A0 0D		 LDY #$0d			
$a83b:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$a83d:  29 03		 AND #$03			
$a83f:  AA			TAX				 
$a840:  BD 5E FF	  LDA $ff5e,X		 
$a843:  05 02		 ORA tmp2			; Temporary 2
$a845:  85 02		 STA tmp2			; Temporary 2
$a847:  68			PLA				 
$a848:  AA			TAX				 
$a849:  CA			DEX				 
$a84a:  10 E6		 BPL $a832		   
$a84c:  A5 02		 LDA tmp2			; Temporary 2
$a84e:  00			BRK				 
$a84f:  2A			ROL				 
							  ; Data region
		.db $0f
$a851:  18			CLC				 
$a852:  69 08		 ADC #$08			
$a854:  05 00		 ORA tmp0			; Temporary 0
$a856:  85 00		 STA tmp0			; Temporary 0
$a858:  4C B7 A7	  JMP $a7b7		   

; ------------------------------
sub_A85B:
$a85b:  A5 04		 LDA $04			 
$a85d:  10 39		 BPL $a898		   
$a85f:  A5 01		 LDA tmp1			; Temporary 1
$a861:  85 06		 STA $06			 
$a863:  A5 00		 LDA tmp0			; Temporary 0
$a865:  4A			LSR				 
$a866:  4A			LSR				 
$a867:  4A			LSR				 
$a868:  4A			LSR				 
$a869:  29 08		 AND #$08			
$a86b:  AA			TAX				 
$a86c:  BD 9A A8	  LDA $a89a,X		 
$a86f:  48			PHA				 
$a870:  29 07		 AND #$07			
$a872:  A8			TAY				 
$a873:  B9 5E FF	  LDA $ff5e,Y		 
$a876:  85 07		 STA $07			 
$a878:  85 08		 STA $08			 
$a87a:  06 06		 ASL $06			 
$a87c:  B0 04		 BCS $a882		   
$a87e:  A9 00		 LDA #$00			
$a880:  85 07		 STA $07			 
$a882:  68			PLA				 
$a883:  4A			LSR				 
$a884:  4A			LSR				 
$a885:  4A			LSR				 
$a886:  A8			TAY				 
$a887:  B9 03 00	  LDA tmp3,Y		  ; Temporary 3
$a88a:  45 08		 EOR $08			 
$a88c:  25 07		 AND $07			 
$a88e:  D0 08		 BNE $a898		   
$a890:  E8			INX				 
$a891:  8A			TXA				 
$a892:  29 07		 AND #$07			
$a894:  D0 D6		 BNE $a86c		   
$a896:  38			SEC				 
$a897:  60			RTS				 
$a898:  18			CLC				 
$a899:  60			RTS				 
$a89a:  0E 0E 02	  ASL $020e		   
							  ; Data region
		.db $07
$a89e:  06 0D		 ASL $0d			 
							  ; Data region
		.db $0f, $0f
$a8a2:  0E 11 02	  ASL $0211		   
							  ; Data region
		.db $07
$a8a6:  06 0D		 ASL $0d			 
							  ; Data region
		.db $0f, $0f
sub_A8AA:
$a8aa:  20 9C 89	  JSR $899c		   
$a8ad:  A0 05		 LDY #$05			
$a8af:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$a8b1:  85 03		 STA tmp3			; Temporary 3
$a8b3:  C8			INY				 
$a8b4:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$a8b6:  85 04		 STA $04			 
$a8b8:  C8			INY				 
$a8b9:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$a8bb:  85 05		 STA $05			 
$a8bd:  4C 5B A8	  JMP $a85b		   
$a8c0:  AD 80 6E	  LDA action_type	 ; Current action type
$a8c3:  C9 04		 CMP #$04			
$a8c5:  60			RTS				 
$a8c6:  20 D5 A8	  JSR $a8d5		   
$a8c9:  20 E1 A8	  JSR $a8e1		   
$a8cc:  20 06 A9	  JSR $a906		   
$a8cf:  20 2E A9	  JSR $a92e		   
$a8d2:  4C 10 91	  JMP finalize		; Finalize action

; ------------------------------
sub_A8D5:
$a8d5:  A9 00		 LDA #$00			
$a8d7:  8D F3 75	  STA $75f3		   
$a8da:  8D F5 75	  STA $75f5		   
$a8dd:  8D F4 75	  STA $75f4		   
$a8e0:  60			RTS				 

; ------------------------------
sub_A8E1:
$a8e1:  A2 0B		 LDX #$0b			
$a8e3:  8A			TXA				 
$a8e4:  48			PHA				 
$a8e5:  20 8D A5	  JSR valid_act	   ; Validate action
$a8e8:  90 06		 BCC $a8f0		   
$a8ea:  C0 32		 CPY #$32			
$a8ec:  18			CLC				 
$a8ed:  F0 01		 BEQ $a8f0		   
$a8ef:  38			SEC				 
$a8f0:  2E F3 75	  ROL $75f3		   
$a8f3:  2E F4 75	  ROL $75f4		   
$a8f6:  68			PLA				 
$a8f7:  AA			TAX				 
$a8f8:  CA			DEX				 
$a8f9:  10 E8		 BPL $a8e3		   
$a8fb:  A9 30		 LDA #$30			
$a8fd:  0D F4 75	  ORA $75f4		   
$a900:  29 3F		 AND #$3f			
$a902:  8D F4 75	  STA $75f4		   
$a905:  60			RTS				 

; ------------------------------
sub_A906:
$a906:  AD E8 75	  LDA spell_idx	   ; Spell index
$a909:  20 B6 89	  JSR get_act		 ; Get action data
$a90c:  A0 13		 LDY #$13			
$a90e:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a910:  29 7F		 AND #$7f			
$a912:  00			BRK				 
$a913:  15 0F		 ORA $0f,X		   
$a915:  90 05		 BCC $a91c		   
$a917:  C9 7F		 CMP #$7f			
$a919:  4C 1D A9	  JMP $a91d		   
$a91c:  38			SEC				 
$a91d:  6E F5 75	  ROR $75f5		   
$a920:  C8			INY				 
$a921:  C0 1B		 CPY #$1b			
$a923:  90 E9		 BCC $a90e		   
$a925:  AD F5 75	  LDA $75f5		   
$a928:  49 FF		 EOR #$ff			
$a92a:  8D F5 75	  STA $75f5		   
$a92d:  60			RTS				 

; ------------------------------
sub_A92E:
$a92e:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$a931:  29 7F		 AND #$7f			
$a933:  8D F0 75	  STA btl_f0		  ; Battle flag F0
$a936:  A2 02		 LDX #$02			
$a938:  BD F3 75	  LDA $75f3,X		 
$a93b:  00			BRK				 
							  ; Data region
		.db $2b, $0f
$a93e:  2E DA 75	  ROL act_cat		 ; Action category
$a941:  9D F3 75	  STA $75f3,X		 
$a944:  CA			DEX				 
$a945:  10 F1		 BPL $a938		   
$a947:  AD DA 75	  LDA act_cat		 ; Action category
$a94a:  29 07		 AND #$07			
$a94c:  00			BRK				 
$a94d:  2A			ROL				 
							  ; Data region
		.db $0f
$a94f:  AA			TAX				 
$a950:  BD F3 75	  LDA $75f3,X		 
$a953:  E0 02		 CPX #$02			
$a955:  B0 22		 BCS $a979		   
$a957:  E0 01		 CPX #$01			
$a959:  D0 07		 BNE $a962		   
$a95b:  18			CLC				 
$a95c:  69 08		 ADC #$08			
$a95e:  C9 0C		 CMP #$0c			
$a960:  B0 38		 BCS $a99a		   
$a962:  85 00		 STA tmp0			; Temporary 0
$a964:  AE E8 75	  LDX spell_idx	   ; Spell index
$a967:  CA			DEX				 
$a968:  8A			TXA				 
$a969:  0A			ASL				 
$a96a:  0A			ASL				 
$a96b:  85 01		 STA tmp1			; Temporary 1
$a96d:  0A			ASL				 
$a96e:  65 01		 ADC tmp1			; Temporary 1
$a970:  65 00		 ADC tmp0			; Temporary 0
$a972:  AA			TAX				 
$a973:  BD 96 A6	  LDA $a696,X		 
$a976:  4C 9E A9	  JMP $a99e		   
$a979:  48			PHA				 
$a97a:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$a97d:  09 80		 ORA #$80			
$a97f:  8D F0 75	  STA btl_f0		  ; Battle flag F0
$a982:  AD E8 75	  LDA spell_idx	   ; Spell index
$a985:  20 B6 89	  JSR get_act		 ; Get action data
$a988:  68			PLA				 
$a989:  18			CLC				 
$a98a:  69 13		 ADC #$13			
$a98c:  A8			TAY				 
$a98d:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$a98f:  29 7F		 AND #$7f			
$a991:  8D F2 75	  STA $75f2		   
$a994:  00			BRK				 
							  ; Data region
		.db $17, $1f
$a997:  4C 9E A9	  JMP $a99e		   
$a99a:  AA			TAX				 
$a99b:  BD B4 A9	  LDA $a9b4,X		 
$a99e:  8D DB 75	  STA act_id		  ; Action ID
$a9a1:  AA			TAX				 
$a9a2:  A0 00		 LDY #$00			
$a9a4:  E0 30		 CPX #$30			
$a9a6:  F0 0A		 BEQ $a9b2		   
$a9a8:  E0 31		 CPX #$31			
$a9aa:  F0 06		 BEQ $a9b2		   
$a9ac:  E0 97		 CPX #$97			
$a9ae:  F0 02		 BEQ $a9b2		   
$a9b0:  A0 80		 LDY #$80			
$a9b2:  20 97 A7	  JSR $a797		   
$a9b5:  AE F0 75	  LDX btl_f0		  ; Battle flag F0
$a9b8:  10 02		 BPL $a9bc		   
$a9ba:  09 20		 ORA #$20			
$a9bc:  8D DA 75	  STA act_cat		 ; Action category
$a9bf:  60			RTS				 
							  ; Data region
		.db $43
$a9c1:  41 A5		 EOR ($a5,X)		 
$a9c3:  00			BRK				 
$a9c4:  05 01		 ORA tmp1			; Temporary 1
$a9c6:  F0 31		 BEQ $a9f9		   
$a9c8:  20 67 AA	  JSR dmg_calc		; Damage calculation
$a9cb:  AD DB 75	  LDA act_id		  ; Action ID
$a9ce:  C9 FF		 CMP #$ff			
$a9d0:  F0 40		 BEQ $aa12		   
$a9d2:  38			SEC				 
$a9d3:  AD D4 75	  LDA damage_lo	   ; Damage output low
$a9d6:  E5 0A		 SBC $0a			 
$a9d8:  85 0F		 STA $0f			 
$a9da:  AD D5 75	  LDA damage_hi	   ; Damage output high
$a9dd:  E5 0B		 SBC $0b			 
$a9df:  05 0F		 ORA $0f			 
$a9e1:  85 0F		 STA $0f			 
$a9e3:  AD D6 75	  LDA $75d6		   
$a9e6:  E5 0C		 SBC $0c			 
$a9e8:  05 0F		 ORA $0f			 
$a9ea:  F0 04		 BEQ $a9f0		   
$a9ec:  B0 64		 BCS $aa52		   
$a9ee:  90 22		 BCC $aa12		   
$a9f0:  A5 8B		 LDA actor_idx	   ; Current actor index
$a9f2:  D0 07		 BNE $a9fb		   
$a9f4:  AD DB 75	  LDA act_id		  ; Action ID
$a9f7:  C9 43		 CMP #$43			
$a9f9:  F0 57		 BEQ $aa52		   
$a9fb:  AD 80 6E	  LDA action_type	 ; Current action type
$a9fe:  C9 06		 CMP #$06			
$aa00:  D0 09		 BNE $aa0b		   
$aa02:  A5 8B		 LDA actor_idx	   ; Current actor index
$aa04:  CD E5 75	  CMP temp_e5		 ; Temp E5
$aa07:  90 49		 BCC $aa52		   
$aa09:  B0 07		 BCS $aa12		   
$aa0b:  AD E5 75	  LDA temp_e5		 ; Temp E5
$aa0e:  C5 8B		 CMP actor_idx	   ; Current actor index
$aa10:  90 40		 BCC $aa52		   
$aa12:  AD 80 6E	  LDA action_type	 ; Current action type
$aa15:  C9 02		 CMP #$02			
$aa17:  B0 0A		 BCS $aa23		   
$aa19:  A5 8B		 LDA actor_idx	   ; Current actor index
$aa1b:  F0 06		 BEQ $aa23		   
$aa1d:  A5 8C		 LDA action_param	; Action parameter
$aa1f:  C9 07		 CMP #$07			
$aa21:  90 2F		 BCC $aa52		   
$aa23:  20 59 AB	  JSR chk_resist	  ; Check resistance
$aa26:  90 2A		 BCC $aa52		   
$aa28:  A5 0A		 LDA $0a			 
$aa2a:  8D D4 75	  STA damage_lo	   ; Damage output low
$aa2d:  A5 0B		 LDA $0b			 
$aa2f:  8D D5 75	  STA damage_hi	   ; Damage output high
$aa32:  A5 0C		 LDA $0c			 
$aa34:  8D D6 75	  STA $75d6		   
$aa37:  A5 8B		 LDA actor_idx	   ; Current actor index
$aa39:  8D E5 75	  STA temp_e5		 ; Temp E5
$aa3c:  A5 8C		 LDA action_param	; Action parameter
$aa3e:  8D D9 75	  STA actor		   ; Acting character
$aa41:  AD D1 75	  LDA act_ptr		 ; Action pointer
$aa44:  8D EC 75	  STA rng_val		 ; RNG value
$aa47:  AD D3 75	  LDA target		  ; Target index
$aa4a:  8D DB 75	  STA act_id		  ; Action ID
$aa4d:  20 54 AA	  JSR store_act	   ; Store action type
$aa50:  38			SEC				 
$aa51:  60			RTS				 
$aa52:  18			CLC				 
$aa53:  60			RTS				 

; --------------------------------------------------
; Store action type
; --------------------------------------------------
store_act:					 ; $aa54
$aa54:  AD D2 75	  LDA act_type		; Action type
$aa57:  8D DA 75	  STA act_cat		 ; Action category
$aa5a:  29 70		 AND #$70			
$aa5c:  C9 20		 CMP #$20			
$aa5e:  D0 06		 BNE $aa66		   
$aa60:  AD 55 73	  LDA $7355		   
$aa63:  8D F2 75	  STA $75f2		   
$aa66:  60			RTS				 

; --------------------------------------------------
; Damage calculation
; --------------------------------------------------
dmg_calc:					 ; $aa67
$aa67:  A9 00		 LDA #$00			
$aa69:  85 0A		 STA $0a			 
$aa6b:  85 0E		 STA $0e			 
$aa6d:  85 0F		 STA $0f			 
$aa6f:  A5 00		 LDA tmp0			; Temporary 0
$aa71:  85 0B		 STA $0b			 
$aa73:  A5 01		 LDA tmp1			; Temporary 1
$aa75:  85 0C		 STA $0c			 
$aa77:  A5 8B		 LDA actor_idx	   ; Current actor index
$aa79:  85 0D		 STA $0d			 
$aa7b:  A2 0D		 LDX #$0d			
$aa7d:  20 76 81	  JSR mul16		   ; Multiply by 16
$aa80:  18			CLC				 
$aa81:  AD ED 75	  LDA stat_sum_lo	 ; Party stat sum low
$aa84:  65 0D		 ADC $0d			 
$aa86:  85 0D		 STA $0d			 
$aa88:  AD EE 75	  LDA stat_sum_hi	 ; Party stat sum high
$aa8b:  65 0E		 ADC $0e			 
$aa8d:  85 0E		 STA $0e			 
$aa8f:  A5 0F		 LDA $0f			 
$aa91:  69 00		 ADC #$00			
$aa93:  85 0F		 STA $0f			 
$aa95:  90 08		 BCC apply_def	   ; -> Apply defense
$aa97:  A9 FF		 LDA #$ff			
$aa99:  85 0D		 STA $0d			 
$aa9b:  85 0E		 STA $0e			 
$aa9d:  85 0F		 STA $0f			 
apply_def:					 ; $aa9f
$aa9f:  A2 0A		 LDX #$0a			
$aaa1:  A0 0D		 LDY #$0d			
$aaa3:  20 54 84	  JSR div_3byte	   ; 3-byte division
$aaa6:  AC 80 6E	  LDY action_type	 ; Current action type
$aaa9:  B9 8B BB	  LDA stat_mult,Y	 ; Stat multiplier table
$aaac:  20 66 83	  JSR mult_pair	   ; Multiply pair
$aaaf:  06 0A		 ASL $0a			 
$aab1:  26 0B		 ROL $0b			 
$aab3:  26 0C		 ROL $0c			 
$aab5:  26 1A		 ROL mult_ext		; Product extended
$aab7:  06 0A		 ASL $0a			 
$aab9:  26 0B		 ROL $0b			 
$aabb:  26 0C		 ROL $0c			 
$aabd:  26 1A		 ROL mult_ext		; Product extended
$aabf:  06 0A		 ASL $0a			 
$aac1:  26 0B		 ROL $0b			 
$aac3:  26 0C		 ROL $0c			 
$aac5:  26 1A		 ROL mult_ext		; Product extended
$aac7:  06 0A		 ASL $0a			 
$aac9:  26 0B		 ROL $0b			 
$aacb:  26 0C		 ROL $0c			 
$aacd:  26 1A		 ROL mult_ext		; Product extended
$aacf:  A5 00		 LDA tmp0			; Temporary 0
$aad1:  85 0D		 STA $0d			 
$aad3:  A5 01		 LDA tmp1			; Temporary 1
$aad5:  85 0E		 STA $0e			 
$aad7:  AC 80 6E	  LDY action_type	 ; Current action type
$aada:  B9 84 BB	  LDA atk_mult,Y	  ; Attack multiplier table
$aadd:  A2 0D		 LDX #$0d			
$aadf:  20 30 83	  JSR mult_a		  ; Multiply by A
$aae2:  18			CLC				 
$aae3:  A5 0A		 LDA $0a			 
$aae5:  65 0D		 ADC $0d			 
$aae7:  85 0D		 STA $0d			 
$aae9:  A5 0B		 LDA $0b			 
$aaeb:  65 0E		 ADC $0e			 
$aaed:  85 0E		 STA $0e			 
$aaef:  A5 0C		 LDA $0c			 
$aaf1:  65 19		 ADC mult_hi		 ; Product high
$aaf3:  85 0F		 STA $0f			 
$aaf5:  A9 00		 LDA #$00			
$aaf7:  85 08		 STA $08			 
$aaf9:  85 0B		 STA $0b			 
$aafb:  A5 8B		 LDA actor_idx	   ; Current actor index
$aafd:  0A			ASL				 
$aafe:  26 0B		 ROL $0b			 
$ab00:  0A			ASL				 
$ab01:  26 0B		 ROL $0b			 
$ab03:  0A			ASL				 
$ab04:  26 0B		 ROL $0b			 
$ab06:  85 0A		 STA $0a			 
$ab08:  38			SEC				 
$ab09:  ED EF 75	  SBC def_mod		 ; Defense modifier
$ab0c:  85 0A		 STA $0a			 
$ab0e:  A5 0B		 LDA $0b			 
$ab10:  E9 00		 SBC #$00			
$ab12:  85 0B		 STA $0b			 
$ab14:  05 0A		 ORA $0a			 
$ab16:  F0 34		 BEQ $ab4c		   
$ab18:  90 32		 BCC $ab4c		   
$ab1a:  A9 08		 LDA #$08			
$ab1c:  A2 0A		 LDX #$0a			
$ab1e:  20 13 C8	  JSR $c813		   
$ab21:  A9 08		 LDA #$08			
$ab23:  85 09		 STA $09			 
$ab25:  A2 08		 LDX #$08			
$ab27:  A0 0A		 LDY #$0a			
$ab29:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$ab2c:  A5 09		 LDA $09			 
$ab2e:  F0 08		 BEQ $ab38		   
$ab30:  A9 00		 LDA #$00			
$ab32:  85 09		 STA $09			 
$ab34:  A9 FF		 LDA #$ff			
$ab36:  85 08		 STA $08			 
$ab38:  A5 08		 LDA $08			 
$ab3a:  A2 0D		 LDX #$0d			
$ab3c:  20 66 83	  JSR mult_pair	   ; Multiply pair
$ab3f:  A5 0E		 LDA $0e			 
$ab41:  85 0A		 STA $0a			 
$ab43:  A5 0F		 LDA $0f			 
$ab45:  85 0B		 STA $0b			 
$ab47:  A5 1A		 LDA mult_ext		; Product extended
$ab49:  85 0C		 STA $0c			 
$ab4b:  60			RTS				 
$ab4c:  A5 0D		 LDA $0d			 
$ab4e:  85 0A		 STA $0a			 
$ab50:  A5 0E		 LDA $0e			 
$ab52:  85 0B		 STA $0b			 
$ab54:  A5 0F		 LDA $0f			 
$ab56:  85 0C		 STA $0c			 
$ab58:  60			RTS				 

; --------------------------------------------------
; Check resistance
; --------------------------------------------------
chk_resist:					 ; $ab59
$ab59:  AD E8 75	  LDA spell_idx	   ; Spell index
$ab5c:  20 B6 89	  JSR get_act		 ; Get action data
$ab5f:  A0 01		 LDY #$01			
$ab61:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$ab63:  85 08		 STA $08			 
$ab65:  C8			INY				 
$ab66:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$ab68:  85 09		 STA $09			 
$ab6a:  AD E1 75	  LDA power_lo		; Action power low
$ab6d:  85 0E		 STA $0e			 
$ab6f:  AD E2 75	  LDA power_hi		; Action power high
$ab72:  85 0F		 STA $0f			 
$ab74:  A9 00		 LDA #$00			
$ab76:  85 0D		 STA $0d			 
$ab78:  A2 0D		 LDX #$0d			
$ab7a:  A0 08		 LDY #$08			
$ab7c:  20 F4 83	  JSR div24_set	   ; 24-bit div setup
$ab7f:  A5 0E		 LDA $0e			 
$ab81:  05 0F		 ORA $0f			 
$ab83:  F0 04		 BEQ $ab89		   
$ab85:  A9 FF		 LDA #$ff			
$ab87:  85 0D		 STA $0d			 
$ab89:  AE 80 6E	  LDX action_type	 ; Current action type
$ab8c:  BD 92 BB	  LDA hit_thresh,X	; Hit threshold table
$ab8f:  C5 0D		 CMP $0d			 
$ab91:  60			RTS				 
$ab92:  A5 00		 LDA tmp0			; Temporary 0
$ab94:  05 01		 ORA tmp1			; Temporary 1
$ab96:  F0 5E		 BEQ $abf6		   
$ab98:  AD DB 75	  LDA act_id		  ; Action ID
$ab9b:  C9 FF		 CMP #$ff			
$ab9d:  F0 2B		 BEQ $abca		   
$ab9f:  20 09 AC	  JSR $ac09		   
$aba2:  90 52		 BCC $abf6		   
$aba4:  20 F7 AB	  JSR $abf7		   
$aba7:  90 4D		 BCC $abf6		   
$aba9:  20 19 AC	  JSR $ac19		   
$abac:  20 3C AC	  JSR $ac3c		   
$abaf:  38			SEC				 
$abb0:  A5 0C		 LDA $0c			 
$abb2:  E5 0A		 SBC $0a			 
$abb4:  85 0E		 STA $0e			 
$abb6:  A5 0D		 LDA $0d			 
$abb8:  E5 0B		 SBC $0b			 
$abba:  90 0E		 BCC $abca		   
$abbc:  05 0E		 ORA $0e			 
$abbe:  F0 02		 BEQ $abc2		   
$abc0:  B0 34		 BCS $abf6		   
$abc2:  AD E5 75	  LDA temp_e5		 ; Temp E5
$abc5:  38			SEC				 
$abc6:  E5 8B		 SBC actor_idx	   ; Current actor index
$abc8:  90 2C		 BCC $abf6		   
$abca:  A5 00		 LDA tmp0			; Temporary 0
$abcc:  8D D4 75	  STA damage_lo	   ; Damage output low
$abcf:  A5 01		 LDA tmp1			; Temporary 1
$abd1:  8D D5 75	  STA damage_hi	   ; Damage output high
$abd4:  A5 02		 LDA tmp2			; Temporary 2
$abd6:  8D D7 75	  STA $75d7		   
$abd9:  A5 03		 LDA tmp3			; Temporary 3
$abdb:  8D D8 75	  STA $75d8		   
$abde:  A5 8B		 LDA actor_idx	   ; Current actor index
$abe0:  8D E5 75	  STA temp_e5		 ; Temp E5
$abe3:  A5 8C		 LDA action_param	; Action parameter
$abe5:  8D E6 75	  STA $75e6		   
$abe8:  A5 8D		 LDA $8d			 
$abea:  8D E7 75	  STA $75e7		   
$abed:  AD D3 75	  LDA target		  ; Target index
$abf0:  8D DB 75	  STA act_id		  ; Action ID
$abf3:  20 54 AA	  JSR store_act	   ; Store action type
$abf6:  60			RTS				 

; ------------------------------
sub_ABF7:
$abf7:  A5 7C		 LDA $7c			 
$abf9:  C9 01		 CMP #$01			
$abfb:  F0 0B		 BEQ $ac08		   
$abfd:  38			SEC				 
$abfe:  A5 8C		 LDA action_param	; Action parameter
$ac00:  ED E6 75	  SBC $75e6		   
$ac03:  A5 8D		 LDA $8d			 
$ac05:  ED E7 75	  SBC $75e7		   
$ac08:  60			RTS				 

; ------------------------------
sub_AC09:
$ac09:  A5 82		 LDA inner_loop	  ; Inner loop counter
$ac0b:  0A			ASL				 
$ac0c:  AA			TAX				 
$ac0d:  38			SEC				 
$ac0e:  A5 04		 LDA $04			 
$ac10:  FD C1 75	  SBC $75c1,X		 
$ac13:  A5 05		 LDA $05			 
$ac15:  FD C2 75	  SBC $75c2,X		 
$ac18:  60			RTS				 

; ------------------------------
sub_AC19:
$ac19:  A5 00		 LDA tmp0			; Temporary 0
$ac1b:  85 0A		 STA $0a			 
$ac1d:  A9 00		 LDA #$00			
$ac1f:  85 0B		 STA $0b			 
$ac21:  60			RTS				 
$ac22:  A5 02		 LDA tmp2			; Temporary 2
$ac24:  85 0A		 STA $0a			 
$ac26:  A5 03		 LDA tmp3			; Temporary 3
$ac28:  85 0B		 STA $0b			 
$ac2a:  A5 00		 LDA tmp0			; Temporary 0
$ac2c:  A2 0A		 LDX #$0a			
$ac2e:  20 30 83	  JSR mult_a		  ; Multiply by A
$ac31:  A5 0B		 LDA $0b			 
$ac33:  85 0A		 STA $0a			 
$ac35:  A5 19		 LDA mult_hi		 ; Product high
$ac37:  85 0B		 STA $0b			 
$ac39:  4C 87 81	  JMP div16		   ; Divide by 16

; ------------------------------
sub_AC3C:
$ac3c:  AD D4 75	  LDA damage_lo	   ; Damage output low
$ac3f:  85 0C		 STA $0c			 
$ac41:  A9 00		 LDA #$00			
$ac43:  85 0D		 STA $0d			 
$ac45:  60			RTS				 
$ac46:  AD D7 75	  LDA $75d7		   
$ac49:  85 0C		 STA $0c			 
$ac4b:  AD D8 75	  LDA $75d8		   
$ac4e:  85 0D		 STA $0d			 
$ac50:  AD D4 75	  LDA damage_lo	   ; Damage output low
$ac53:  A2 0C		 LDX #$0c			
$ac55:  20 30 83	  JSR mult_a		  ; Multiply by A
$ac58:  A5 0D		 LDA $0d			 
$ac5a:  85 0C		 STA $0c			 
$ac5c:  A5 19		 LDA mult_hi		 ; Product high
$ac5e:  85 0D		 STA $0d			 
$ac60:  4C 87 81	  JMP div16		   ; Divide by 16

; ------------------------------
sub_AC63:
$ac63:  AD DB 75	  LDA act_id		  ; Action ID
$ac66:  C9 29		 CMP #$29			
$ac68:  90 04		 BCC $ac6e		   
$ac6a:  C9 2D		 CMP #$2d			
$ac6c:  90 34		 BCC $aca2		   
$ac6e:  AD DB 75	  LDA act_id		  ; Action ID
$ac71:  C9 2E		 CMP #$2e			
$ac73:  90 04		 BCC $ac79		   
$ac75:  C9 33		 CMP #$33			
$ac77:  90 05		 BCC $ac7e		   
$ac79:  A9 00		 LDA #$00			
$ac7b:  8D E6 75	  STA $75e6		   
$ac7e:  A5 8C		 LDA action_param	; Action parameter
$ac80:  CD E6 75	  CMP $75e6		   
$ac83:  90 1D		 BCC $aca2		   
$ac85:  A5 00		 LDA tmp0			; Temporary 0
$ac87:  8D D4 75	  STA damage_lo	   ; Damage output low
$ac8a:  A5 01		 LDA tmp1			; Temporary 1
$ac8c:  8D D5 75	  STA damage_hi	   ; Damage output high
$ac8f:  A5 8B		 LDA actor_idx	   ; Current actor index
$ac91:  8D E5 75	  STA temp_e5		 ; Temp E5
$ac94:  A5 8C		 LDA action_param	; Action parameter
$ac96:  8D E6 75	  STA $75e6		   
$ac99:  AD D3 75	  LDA target		  ; Target index
$ac9c:  8D DB 75	  STA act_id		  ; Action ID
$ac9f:  20 54 AA	  JSR store_act	   ; Store action type
$aca2:  60			RTS				 
$aca3:  A9 00		 LDA #$00			
$aca5:  8D E1 75	  STA power_lo		; Action power low
$aca8:  8D E2 75	  STA power_hi		; Action power high
$acab:  20 C2 A9	  JSR $a9c2		   
$acae:  B0 00		 BCS $acb0		   
$acb0:  60			RTS				 

; ------------------------------
sub_ACB1:
$acb1:  A5 0E		 LDA $0e			 
$acb3:  85 0A		 STA $0a			 
$acb5:  A5 0F		 LDA $0f			 
$acb7:  85 0B		 STA $0b			 
$acb9:  AD DF 75	  LDA $75df		   
$acbc:  85 0C		 STA $0c			 
$acbe:  AD E0 75	  LDA $75e0		   
$acc1:  85 0D		 STA $0d			 
$acc3:  A2 0A		 LDX #$0a			
$acc5:  A0 0C		 LDY #$0c			
$acc7:  20 76 81	  JSR mul16		   ; Multiply by 16
$acca:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$accd:  A5 0A		 LDA $0a			 
$accf:  A4 0B		 LDY $0b			 
$acd1:  F0 02		 BEQ $acd5		   
$acd3:  A9 1F		 LDA #$1f			
$acd5:  85 0A		 STA $0a			 
$acd7:  A9 00		 LDA #$00			
$acd9:  85 0B		 STA $0b			 
$acdb:  A5 8C		 LDA action_param	; Action parameter
$acdd:  20 9A 81	  JSR $819a		   
$ace0:  A5 0A		 LDA $0a			 
$ace2:  C9 18		 CMP #$18			
$ace4:  90 27		 BCC $ad0d		   
$ace6:  A2 0E		 LDX #$0e			
$ace8:  A5 8C		 LDA action_param	; Action parameter
$acea:  20 9A 81	  JSR $819a		   
$aced:  38			SEC				 
$acee:  A5 0E		 LDA $0e			 
$acf0:  ED D4 75	  SBC damage_lo	   ; Damage output low
$acf3:  A5 0F		 LDA $0f			 
$acf5:  ED D5 75	  SBC damage_hi	   ; Damage output high
$acf8:  90 13		 BCC $ad0d		   
$acfa:  A5 0E		 LDA $0e			 
$acfc:  8D D4 75	  STA damage_lo	   ; Damage output low
$acff:  A5 0F		 LDA $0f			 
$ad01:  8D D5 75	  STA damage_hi	   ; Damage output high
$ad04:  AD D3 75	  LDA target		  ; Target index
$ad07:  8D DB 75	  STA act_id		  ; Action ID
$ad0a:  20 54 AA	  JSR store_act	   ; Store action type
$ad0d:  60			RTS				 

; ------------------------------
sub_AD0E:
$ad0e:  A5 00		 LDA tmp0			; Temporary 0
$ad10:  CD D4 75	  CMP damage_lo	   ; Damage output low
$ad13:  90 0F		 BCC $ad24		   
$ad15:  8D D4 75	  STA damage_lo	   ; Damage output low
$ad18:  AD D2 75	  LDA act_type		; Action type
$ad1b:  8D DA 75	  STA act_cat		 ; Action category
$ad1e:  AD D3 75	  LDA target		  ; Target index
$ad21:  8D DB 75	  STA act_id		  ; Action ID
$ad24:  60			RTS				 
$ad25:  60			RTS				 

; ------------------------------
sub_AD26:
$ad26:  20 19 87	  JSR $8719		   
$ad29:  90 FA		 BCC $ad25		   
$ad2b:  20 D9 87	  JSR $87d9		   
$ad2e:  AD E9 75	  LDA $75e9		   
$ad31:  A2 0E		 LDX #$0e			
$ad33:  20 51 C8	  JSR $c851		   
$ad36:  20 23 88	  JSR $8823		   
$ad39:  A0 05		 LDY #$05			
$ad3b:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$ad3d:  29 10		 AND #$10			
$ad3f:  F0 05		 BEQ $ad46		   
$ad41:  A9 06		 LDA #$06			
$ad43:  20 98 81	  JSR scale_stat	  ; Scale stat value
$ad46:  AD E4 72	  LDA $72e4		   
$ad49:  30 40		 BMI $ad8b		   
$ad4b:  A0 05		 LDY #$05			
$ad4d:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$ad4f:  29 08		 AND #$08			
$ad51:  D0 38		 BNE $ad8b		   
$ad53:  20 66 88	  JSR $8866		   
$ad56:  C9 05		 CMP #$05			
$ad58:  B0 31		 BCS $ad8b		   
$ad5a:  85 0C		 STA $0c			 
$ad5c:  A2 0B		 LDX #$0b			
$ad5e:  8A			TXA				 
$ad5f:  48			PHA				 
$ad60:  85 0D		 STA $0d			 
$ad62:  20 AA A5	  JSR find_tgt		; Find valid target
$ad65:  90 1F		 BCC $ad86		   
$ad67:  C0 12		 CPY #$12			
$ad69:  B0 1B		 BCS $ad86		   
$ad6b:  B9 67 B9	  LDA enemy_res_tbl,Y ; Enemy resistance table
$ad6e:  29 1F		 AND #$1f			
$ad70:  48			PHA				 
$ad71:  20 D6 86	  JSR $86d6		   
$ad74:  A5 01		 LDA tmp1			; Temporary 1
$ad76:  F0 04		 BEQ $ad7c		   
$ad78:  A9 FF		 LDA #$ff			
$ad7a:  85 00		 STA tmp0			; Temporary 0
$ad7c:  68			PLA				 
$ad7d:  C5 00		 CMP tmp0			; Temporary 0
$ad7f:  F0 02		 BEQ $ad83		   
$ad81:  B0 03		 BCS $ad86		   
$ad83:  20 C0 AD	  JSR $adc0		   
$ad86:  68			PLA				 
$ad87:  AA			TAX				 
$ad88:  CA			DEX				 
$ad89:  10 D3		 BPL $ad5e		   
$ad8b:  A5 95		 LDA $95			 
$ad8d:  29 0F		 AND #$0f			
$ad8f:  F0 04		 BEQ $ad95		   
$ad91:  A9 FF		 LDA #$ff			
$ad93:  85 95		 STA $95			 
$ad95:  A5 94		 LDA $94			 
$ad97:  85 8C		 STA action_param	; Action parameter
$ad99:  A5 95		 LDA $95			 
$ad9b:  29 0F		 AND #$0f			
$ad9d:  85 8D		 STA $8d			 
$ad9f:  60			RTS				 
$ada0:  A5 82		 LDA inner_loop	  ; Inner loop counter
$ada2:  20 6B 8A	  JSR $8a6b		   
$ada5:  A0 13		 LDY #$13			
$ada7:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$ada9:  29 7F		 AND #$7f			
$adab:  C9 7F		 CMP #$7f			
$adad:  F0 0F		 BEQ $adbe		   
$adaf:  A2 09		 LDX #$09			
$adb1:  DD BF AD	  CMP $adbf,X		 
$adb4:  F0 05		 BEQ $adbb		   
$adb6:  CA			DEX				 
$adb7:  10 F8		 BPL $adb1		   
$adb9:  30 03		 BMI $adbe		   
$adbb:  20 C0 AD	  JSR $adc0		   
$adbe:  60			RTS				 
$adbf:  00			BRK				 
sub_ADC0:
$adc0:  A5 0D		 LDA $0d			 
$adc2:  C9 12		 CMP #$12			
$adc4:  B0 0C		 BCS $add2		   
$adc6:  0A			ASL				 
$adc7:  BD 4D B7	  LDA stat_tbl_1,X	; Stat modifier table 1
$adca:  85 8A		 STA char_count	  ; Character count
$adcc:  A9 00		 LDA #$00			
$adce:  85 8B		 STA actor_idx	   ; Current actor index
$add0:  F0 08		 BEQ $adda		   
$add2:  A9 F4		 LDA #$f4			
$add4:  85 8A		 STA char_count	  ; Character count
$add6:  A9 01		 LDA #$01			
$add8:  85 8B		 STA actor_idx	   ; Current actor index
$adda:  A5 0D		 LDA $0d			 
$addc:  20 04 93	  JSR $9304		   
$addf:  A6 0D		 LDX $0d			 
$ade1:  BD 67 B9	  LDA enemy_res_tbl,X ; Enemy resistance table
$ade4:  29 60		 AND #$60			
$ade6:  C9 40		 CMP #$40			
$ade8:  B0 0C		 BCS $adf6		   
$adea:  A9 00		 LDA #$00			
$adec:  85 04		 STA $04			 
$adee:  A2 03		 LDX #$03			
$adf0:  AD E9 75	  LDA $75e9		   
$adf3:  20 51 C8	  JSR $c851		   
$adf6:  A2 8A		 LDX #$8a			
$adf8:  A5 03		 LDA tmp3			; Temporary 3
$adfa:  20 9A 81	  JSR $819a		   
$adfd:  38			SEC				 
$adfe:  A5 94		 LDA $94			 
$ae00:  E5 8A		 SBC char_count	  ; Character count
$ae02:  A5 95		 LDA $95			 
$ae04:  E5 8B		 SBC actor_idx	   ; Current actor index
$ae06:  B0 08		 BCS $ae10		   
$ae08:  A5 8A		 LDA char_count	  ; Character count
$ae0a:  85 94		 STA $94			 
$ae0c:  A5 8B		 LDA actor_idx	   ; Current actor index
$ae0e:  85 95		 STA $95			 
$ae10:  60			RTS				 

; ------------------------------
sub_AE11:
$ae11:  A9 00		 LDA #$00			
$ae13:  85 82		 STA inner_loop	  ; Inner loop counter
$ae15:  85 94		 STA $94			 
$ae17:  85 95		 STA $95			 
$ae19:  A9 00		 LDA #$00			
$ae1b:  85 8B		 STA actor_idx	   ; Current actor index
$ae1d:  85 8C		 STA action_param	; Action parameter
$ae1f:  A5 82		 LDA inner_loop	  ; Inner loop counter
$ae21:  20 6B 8A	  JSR $8a6b		   
$ae24:  90 34		 BCC $ae5a		   
$ae26:  85 8A		 STA char_count	  ; Character count
$ae28:  A0 00		 LDY #$00			
$ae2a:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$ae2c:  0A			ASL				 
$ae2d:  90 2B		 BCC $ae5a		   
$ae2f:  30 29		 BMI $ae5a		   
$ae31:  A5 8A		 LDA char_count	  ; Character count
$ae33:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$ae36:  A0 05		 LDY #$05			
$ae38:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$ae3a:  29 04		 AND #$04			
$ae3c:  D0 1C		 BNE $ae5a		   
$ae3e:  E6 8C		 INC action_param	; Action parameter
$ae40:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$ae42:  29 08		 AND #$08			
$ae44:  F0 03		 BEQ $ae49		   
$ae46:  20 A6 AE	  JSR get_sp_pwr	  ; Get spell power
$ae49:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$ae4b:  29 10		 AND #$10			
$ae4d:  F0 03		 BEQ $ae52		   
$ae4f:  20 B4 AE	  JSR get_sp_atr	  ; Get spell attribute
$ae52:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$ae54:  4A			LSR				 
$ae55:  90 03		 BCC $ae5a		   
$ae57:  20 AF AE	  JSR shift_8c		; Shift $8c:$8b
$ae5a:  A5 8B		 LDA actor_idx	   ; Current actor index
$ae5c:  A4 8C		 LDY action_param	; Action parameter
$ae5e:  A2 94		 LDX #$94			
$ae60:  20 1D C8	  JSR $c81d		   
$ae63:  E6 82		 INC inner_loop	  ; Inner loop counter
$ae65:  A5 82		 LDA inner_loop	  ; Inner loop counter
$ae67:  C9 04		 CMP #$04			
$ae69:  90 AE		 BCC $ae19		   
$ae6b:  38			SEC				 
$ae6c:  A9 00		 LDA #$00			
$ae6e:  E5 94		 SBC $94			 
$ae70:  85 8B		 STA actor_idx	   ; Current actor index
$ae72:  A9 04		 LDA #$04			
$ae74:  E5 95		 SBC $95			 
$ae76:  85 8C		 STA action_param	; Action parameter
$ae78:  AD E8 75	  LDA spell_idx	   ; Spell index
$ae7b:  F0 21		 BEQ $ae9e		   
$ae7d:  C9 05		 CMP #$05			
$ae7f:  B0 1D		 BCS $ae9e		   
$ae81:  AD 80 6E	  LDA action_type	 ; Current action type
$ae84:  0A			ASL				 
$ae85:  0A			ASL				 
$ae86:  6D E8 75	  ADC spell_idx	   ; Spell index
$ae89:  A8			TAY				 
$ae8a:  B9 06 BB	  LDA tact_mod,Y	  ; Tactics modifier table
$ae8d:  A2 8B		 LDX #$8b			
$ae8f:  20 30 83	  JSR mult_a		  ; Multiply by A
$ae92:  A5 19		 LDA mult_hi		 ; Product high
$ae94:  D0 08		 BNE $ae9e		   
$ae96:  A5 8C		 LDA action_param	; Action parameter
$ae98:  18			CLC				 
$ae99:  79 22 BB	  ADC sp_bonus,Y	  ; Spell bonus table
$ae9c:  90 02		 BCC $aea0		   
$ae9e:  A9 FF		 LDA #$ff			
$aea0:  8D 68 73	  STA $7368		   
$aea3:  4C CA AE	  JMP $aeca		   

; --------------------------------------------------
; Get spell power
; --------------------------------------------------
get_sp_pwr:					 ; $aea6
$aea6:  20 C0 AE	  JSR cap_sp_idx	  ; Cap spell index
$aea9:  BD 3F BB	  LDA sp_power,X	  ; Spell power table
$aeac:  4C BA AE	  JMP $aeba		   

; --------------------------------------------------
; Shift $8c:$8b
; --------------------------------------------------
shift_8c:					 ; $aeaf
$aeaf:  46 8C		 LSR action_param	; Action parameter
$aeb1:  66 8B		 ROR actor_idx	   ; Current actor index
$aeb3:  60			RTS				 

; --------------------------------------------------
; Get spell attribute
; --------------------------------------------------
get_sp_atr:					 ; $aeb4
$aeb4:  20 C0 AE	  JSR cap_sp_idx	  ; Cap spell index
$aeb7:  BD 49 BB	  LDA sp_attr,X	   ; Spell attribute table
$aeba:  A2 8B		 LDX #$8b			
$aebc:  20 FB C7	  JSR $c7fb		   
$aebf:  60			RTS				 

; --------------------------------------------------
; Cap spell index
; --------------------------------------------------
cap_sp_idx:					 ; $aec0
$aec0:  AE E8 75	  LDX spell_idx	   ; Spell index
$aec3:  E0 08		 CPX #$08			
$aec5:  90 02		 BCC $aec9		   
$aec7:  A2 08		 LDX #$08			
$aec9:  60			RTS				 
$aeca:  A9 00		 LDA #$00			
$aecc:  85 7B		 STA calc_hit		; Calculated hit value
$aece:  A9 0B		 LDA #$0b			
$aed0:  85 0D		 STA $0d			 
$aed2:  AD E8 75	  LDA spell_idx	   ; Spell index
$aed5:  85 0C		 STA $0c			 
$aed7:  20 AA A5	  JSR find_tgt		; Find valid target
$aeda:  90 0B		 BCC $aee7		   
$aedc:  B9 67 B9	  LDA enemy_res_tbl,Y ; Enemy resistance table
$aedf:  29 1F		 AND #$1f			
$aee1:  C5 7B		 CMP calc_hit		; Calculated hit value
$aee3:  90 02		 BCC $aee7		   
$aee5:  85 7B		 STA calc_hit		; Calculated hit value
$aee7:  C6 0D		 DEC $0d			 
$aee9:  10 EC		 BPL $aed7		   
$aeeb:  AD 68 73	  LDA $7368		   
$aeee:  85 00		 STA tmp0			; Temporary 0
$aef0:  A9 00		 LDA #$00			
$aef2:  85 01		 STA tmp1			; Temporary 1
$aef4:  A5 7B		 LDA calc_hit		; Calculated hit value
$aef6:  A2 00		 LDX #$00			
$aef8:  20 30 83	  JSR mult_a		  ; Multiply by A
$aefb:  20 87 81	  JSR div16		   ; Divide by 16
$aefe:  46 01		 LSR tmp1			; Temporary 1
$af00:  66 00		 ROR tmp0			; Temporary 0
$af02:  A5 01		 LDA tmp1			; Temporary 1
$af04:  F0 04		 BEQ $af0a		   
$af06:  A9 FF		 LDA #$ff			
$af08:  85 00		 STA tmp0			; Temporary 0
$af0a:  A5 00		 LDA tmp0			; Temporary 0
$af0c:  8D EF 75	  STA def_mod		 ; Defense modifier
$af0f:  60			RTS				 

; --------------------------------------------------
; Attack handler
; --------------------------------------------------
atk_handler:					 ; $af10
$af10:  20 84 95	  JSR setup_act	   ; Setup action
$af13:  20 C6 A6	  JSR st_setup1	   ; State setup 1
$af16:  A2 08		 LDX #$08			
$af18:  8A			TXA				 
$af19:  48			PHA				 
$af1a:  20 4D A5	  JSR exec_step	   ; Execute action step
$af1d:  68			PLA				 
$af1e:  AA			TAX				 
$af1f:  CA			DEX				 
$af20:  10 F6		 BPL $af18		   
$af22:  20 CA A6	  JSR st_setup2	   ; State setup 2
$af25:  20 CE A6	  JSR st_setup3	   ; State setup 3
$af28:  20 35 91	  JSR chk_hit		 ; Check hit/miss
$af2b:  90 10		 BCC $af3d		   
$af2d:  20 A0 91	  JSR clr_dmg		 ; Clear damage vars
$af30:  A9 09		 LDA #$09			
$af32:  20 4D A5	  JSR exec_step	   ; Execute action step
$af35:  A9 0A		 LDA #$0a			
$af37:  20 4D A5	  JSR exec_step	   ; Execute action step
$af3a:  20 D2 A6	  JSR st_clean		; State cleanup
$af3d:  A9 0B		 LDA #$0b			
$af3f:  20 4D A5	  JSR exec_step	   ; Execute action step
$af42:  20 E0 B0	  JSR spec_enemy	  ; Special enemy check
$af45:  4C 10 91	  JMP finalize		; Finalize action

; --------------------------------------------------
; Spell handler
; --------------------------------------------------
spell_hand:					 ; $af48
$af48:  20 84 95	  JSR setup_act	   ; Setup action
$af4b:  20 C6 A6	  JSR st_setup1	   ; State setup 1
$af4e:  A9 00		 LDA #$00			
$af50:  20 4D A5	  JSR exec_step	   ; Execute action step
$af53:  A9 01		 LDA #$01			
$af55:  20 4D A5	  JSR exec_step	   ; Execute action step
$af58:  A9 02		 LDA #$02			
$af5a:  20 4D A5	  JSR exec_step	   ; Execute action step
$af5d:  A9 03		 LDA #$03			
$af5f:  20 4D A5	  JSR exec_step	   ; Execute action step
$af62:  A9 04		 LDA #$04			
$af64:  20 4D A5	  JSR exec_step	   ; Execute action step
$af67:  A9 06		 LDA #$06			
$af69:  20 4D A5	  JSR exec_step	   ; Execute action step
$af6c:  20 CA A6	  JSR st_setup2	   ; State setup 2
$af6f:  20 CE A6	  JSR st_setup3	   ; State setup 3
$af72:  20 35 91	  JSR chk_hit		 ; Check hit/miss
$af75:  90 1A		 BCC $af91		   
$af77:  20 A0 91	  JSR clr_dmg		 ; Clear damage vars
$af7a:  A9 07		 LDA #$07			
$af7c:  20 4D A5	  JSR exec_step	   ; Execute action step
$af7f:  A9 08		 LDA #$08			
$af81:  20 4D A5	  JSR exec_step	   ; Execute action step
$af84:  A9 09		 LDA #$09			
$af86:  20 4D A5	  JSR exec_step	   ; Execute action step
$af89:  A9 0A		 LDA #$0a			
$af8b:  20 4D A5	  JSR exec_step	   ; Execute action step
$af8e:  20 D2 A6	  JSR st_clean		; State cleanup
$af91:  20 E0 B0	  JSR spec_enemy	  ; Special enemy check
$af94:  4C 10 91	  JMP finalize		; Finalize action

; --------------------------------------------------
; Item handler
; --------------------------------------------------
item_hand:					 ; $af97
$af97:  20 84 95	  JSR setup_act	   ; Setup action
$af9a:  20 C6 A6	  JSR st_setup1	   ; State setup 1
$af9d:  A9 00		 LDA #$00			
$af9f:  20 4D A5	  JSR exec_step	   ; Execute action step
$afa2:  A9 01		 LDA #$01			
$afa4:  20 4D A5	  JSR exec_step	   ; Execute action step
$afa7:  A9 02		 LDA #$02			
$afa9:  20 4D A5	  JSR exec_step	   ; Execute action step
$afac:  A9 03		 LDA #$03			
$afae:  20 4D A5	  JSR exec_step	   ; Execute action step
$afb1:  A9 04		 LDA #$04			
$afb3:  20 4D A5	  JSR exec_step	   ; Execute action step
$afb6:  A9 06		 LDA #$06			
$afb8:  20 4D A5	  JSR exec_step	   ; Execute action step
$afbb:  A9 07		 LDA #$07			
$afbd:  20 4D A5	  JSR exec_step	   ; Execute action step
$afc0:  A9 08		 LDA #$08			
$afc2:  20 4D A5	  JSR exec_step	   ; Execute action step
$afc5:  20 CA A6	  JSR st_setup2	   ; State setup 2
$afc8:  A9 09		 LDA #$09			
$afca:  20 4D A5	  JSR exec_step	   ; Execute action step
$afcd:  A9 0A		 LDA #$0a			
$afcf:  20 4D A5	  JSR exec_step	   ; Execute action step
$afd2:  A9 0B		 LDA #$0b			
$afd4:  20 4D A5	  JSR exec_step	   ; Execute action step
$afd7:  20 CE A6	  JSR st_setup3	   ; State setup 3
$afda:  20 35 91	  JSR chk_hit		 ; Check hit/miss
$afdd:  90 0B		 BCC $afea		   
$afdf:  20 A0 91	  JSR clr_dmg		 ; Clear damage vars
$afe2:  A9 05		 LDA #$05			
$afe4:  20 4D A5	  JSR exec_step	   ; Execute action step
$afe7:  20 D2 A6	  JSR st_clean		; State cleanup
$afea:  20 E0 B0	  JSR spec_enemy	  ; Special enemy check
$afed:  4C 10 91	  JMP finalize		; Finalize action

; --------------------------------------------------
; Handler at AFF0
; --------------------------------------------------
act_ff0:					 ; $aff0
$aff0:  20 84 95	  JSR setup_act	   ; Setup action
$aff3:  20 C6 A6	  JSR st_setup1	   ; State setup 1
$aff6:  A9 00		 LDA #$00			
$aff8:  20 4D A5	  JSR exec_step	   ; Execute action step
$affb:  A9 01		 LDA #$01			
$affd:  20 4D A5	  JSR exec_step	   ; Execute action step
$b000:  A9 02		 LDA #$02			
$b002:  20 4D A5	  JSR exec_step	   ; Execute action step
$b005:  A9 03		 LDA #$03			
$b007:  20 4D A5	  JSR exec_step	   ; Execute action step
$b00a:  A9 06		 LDA #$06			
$b00c:  20 4D A5	  JSR exec_step	   ; Execute action step
$b00f:  A9 07		 LDA #$07			
$b011:  20 4D A5	  JSR exec_step	   ; Execute action step
$b014:  A9 08		 LDA #$08			
$b016:  20 4D A5	  JSR exec_step	   ; Execute action step
$b019:  A9 09		 LDA #$09			
$b01b:  20 4D A5	  JSR exec_step	   ; Execute action step
$b01e:  20 CA A6	  JSR st_setup2	   ; State setup 2
$b021:  A9 0A		 LDA #$0a			
$b023:  20 4D A5	  JSR exec_step	   ; Execute action step
$b026:  A9 0B		 LDA #$0b			
$b028:  20 4D A5	  JSR exec_step	   ; Execute action step
$b02b:  20 CE A6	  JSR st_setup3	   ; State setup 3
$b02e:  20 35 91	  JSR chk_hit		 ; Check hit/miss
$b031:  90 10		 BCC $b043		   
$b033:  20 A0 91	  JSR clr_dmg		 ; Clear damage vars
$b036:  A9 04		 LDA #$04			
$b038:  20 4D A5	  JSR exec_step	   ; Execute action step
$b03b:  A9 05		 LDA #$05			
$b03d:  20 4D A5	  JSR exec_step	   ; Execute action step
$b040:  20 D2 A6	  JSR st_clean		; State cleanup
$b043:  20 E0 B0	  JSR spec_enemy	  ; Special enemy check
$b046:  4C 10 91	  JMP finalize		; Finalize action

; --------------------------------------------------
; Defense handler
; --------------------------------------------------
def_hand:					 ; $b049
$b049:  20 84 95	  JSR setup_act	   ; Setup action
$b04c:  20 C6 A6	  JSR st_setup1	   ; State setup 1
$b04f:  20 CA A6	  JSR st_setup2	   ; State setup 2
$b052:  20 CE A6	  JSR st_setup3	   ; State setup 3
$b055:  20 35 91	  JSR chk_hit		 ; Check hit/miss
$b058:  90 06		 BCC $b060		   
$b05a:  20 A0 91	  JSR clr_dmg		 ; Clear damage vars
$b05d:  20 D2 A6	  JSR st_clean		; State cleanup
$b060:  20 E0 B0	  JSR spec_enemy	  ; Special enemy check
$b063:  4C 10 91	  JMP finalize		; Finalize action

; --------------------------------------------------
; Check chapter 4
; --------------------------------------------------
chk_ch4:					 ; $b066
$b066:  AD 5A 61	  LDA chapter		 ; Current chapter/battle actor
$b069:  C9 04		 CMP #$04			
$b06b:  D0 46		 BNE $b0b3		   
$b06d:  AD 44 6E	  LDA btl_mode		; Battle mode flag
$b070:  4A			LSR				 
$b071:  B0 40		 BCS $b0b3		   
$b073:  A2 03		 LDX #$03			
$b075:  8A			TXA				 
$b076:  48			PHA				 
$b077:  BD 49 6E	  LDA $6e49,X		 
$b07a:  F0 0A		 BEQ $b086		   
$b07c:  BD 06 72	  LDA $7206,X		 
$b07f:  C9 FF		 CMP #$ff			
$b081:  F0 03		 BEQ $b086		   
$b083:  20 8C B0	  JSR chk_party	   ; Check party status
$b086:  68			PLA				 
$b087:  AA			TAX				 
$b088:  CA			DEX				 
$b089:  10 EA		 BPL $b075		   
$b08b:  60			RTS				 

; --------------------------------------------------
; Check party status
; --------------------------------------------------
chk_party:					 ; $b08c
$b08c:  48			PHA				 
$b08d:  20 B4 B0	  JSR bit_rot		 ; Bit rotation
$b090:  AA			TAX				 
$b091:  20 91 C8	  JSR $c891		   
$b094:  DD DC B0	  CMP $b0dc,X		 
$b097:  68			PLA				 
$b098:  B0 19		 BCS $b0b3		   
$b09a:  20 BD B0	  JSR $b0bd		   
$b09d:  C5 00		 CMP tmp0			; Temporary 0
$b09f:  F0 12		 BEQ $b0b3		   
$b0a1:  18			CLC				 
$b0a2:  79 5E FF	  ADC $ff5e,Y		 
$b0a5:  85 01		 STA tmp1			; Temporary 1
$b0a7:  A5 00		 LDA tmp0			; Temporary 0
$b0a9:  49 FF		 EOR #$ff			
$b0ab:  3D 9B 61	  AND btl_flags,X	 ; Battle flags
$b0ae:  05 01		 ORA tmp1			; Temporary 1
$b0b0:  9D 9B 61	  STA btl_flags,X	 ; Battle flags
$b0b3:  60			RTS				 

; --------------------------------------------------
; Bit rotation
; --------------------------------------------------
bit_rot:					 ; $b0b4
$b0b4:  20 BD B0	  JSR $b0bd		   
$b0b7:  0A			ASL				 
$b0b8:  6A			ROR				 
$b0b9:  88			DEY				 
$b0ba:  10 FC		 BPL $b0b8		   
$b0bc:  60			RTS				 

; ------------------------------
sub_B0BD:
$b0bd:  20 C3 B0	  JSR $b0c3		   
$b0c0:  25 00		 AND tmp0			; Temporary 0
$b0c2:  60			RTS				 

; ------------------------------
sub_B0C3:
$b0c3:  48			PHA				 
$b0c4:  4A			LSR				 
$b0c5:  4A			LSR				 
$b0c6:  AA			TAX				 
$b0c7:  68			PLA				 
$b0c8:  29 03		 AND #$03			
$b0ca:  0A			ASL				 
$b0cb:  A8			TAY				 
$b0cc:  B9 5E FF	  LDA $ff5e,Y		 
$b0cf:  85 00		 STA tmp0			; Temporary 0
$b0d1:  B9 5F FF	  LDA $ff5f,Y		 
$b0d4:  05 00		 ORA tmp0			; Temporary 0
$b0d6:  85 00		 STA tmp0			; Temporary 0
$b0d8:  BD 9B 61	  LDA btl_flags,X	 ; Battle flags
$b0db:  60			RTS				 
							  ; Data region
		.db $ff, $80
$b0de:  40			RTI				 
$b0df:  00			BRK				 
spec_enemy:					 ; $b0e0
$b0e0:  AD DB 75	  LDA act_id		  ; Action ID
$b0e3:  C9 43		 CMP #$43			
$b0e5:  D0 4A		 BNE $b131		   
$b0e7:  AD EC 75	  LDA rng_val		 ; RNG value
$b0ea:  CD 99 BB	  CMP base_dmg		; Base damage value
$b0ed:  90 42		 BCC $b131		   
$b0ef:  20 32 B1	  JSR find_char	   ; Find valid character
$b0f2:  90 3D		 BCC $b131		   
$b0f4:  AD E8 75	  LDA spell_idx	   ; Spell index
$b0f7:  20 B6 89	  JSR get_act		 ; Get action data
$b0fa:  A0 01		 LDY #$01			
$b0fc:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$b0fe:  85 01		 STA tmp1			; Temporary 1
$b100:  C8			INY				 
$b101:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$b103:  85 02		 STA tmp2			; Temporary 2
$b105:  A9 00		 LDA #$00			
$b107:  85 00		 STA tmp0			; Temporary 0
$b109:  A0 0C		 LDY #$0c			
$b10b:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$b10d:  85 03		 STA tmp3			; Temporary 3
$b10f:  C8			INY				 
$b110:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$b112:  85 04		 STA $04			 
$b114:  A2 00		 LDX #$00			
$b116:  A0 03		 LDY #$03			
$b118:  20 F4 83	  JSR div24_set	   ; 24-bit div setup
$b11b:  A5 01		 LDA tmp1			; Temporary 1
$b11d:  05 02		 ORA tmp2			; Temporary 2
$b11f:  D0 10		 BNE $b131		   
$b121:  A5 00		 LDA tmp0			; Temporary 0
$b123:  C9 55		 CMP #$55			
$b125:  B0 0A		 BCS $b131		   
$b127:  A9 41		 LDA #$41			
$b129:  8D DB 75	  STA act_id		  ; Action ID
$b12c:  A9 00		 LDA #$00			
$b12e:  8D DA 75	  STA act_cat		 ; Action category
$b131:  60			RTS				 

; --------------------------------------------------
; Find valid character
; --------------------------------------------------
find_char:					 ; $b132
$b132:  AC 5B 73	  LDY $735b		   
$b135:  88			DEY				 
$b136:  20 4B B1	  JSR $b14b		   
$b139:  BD F4 72	  LDA char_state,X	; Character state array
$b13c:  10 04		 BPL $b142		   
$b13e:  29 70		 AND #$70			
$b140:  F0 07		 BEQ $b149		   
$b142:  C8			INY				 
$b143:  C0 0C		 CPY #$0c			
$b145:  90 EF		 BCC $b136		   
$b147:  18			CLC				 
$b148:  60			RTS				 
$b149:  38			SEC				 
$b14a:  60			RTS				 

; ------------------------------
sub_B14B:
$b14b:  84 00		 STY tmp0			; Temporary 0
$b14d:  A2 00		 LDX #$00			
$b14f:  BD 48 73	  LDA $7348,X		 
$b152:  29 0F		 AND #$0f			
$b154:  C5 00		 CMP tmp0			; Temporary 0
$b156:  F0 06		 BEQ $b15e		   
$b158:  E8			INX				 
$b159:  E0 0C		 CPX #$0c			
$b15b:  D0 F2		 BNE $b14f		   
$b15d:  18			CLC				 
$b15e:  60			RTS				 
$b15f:  20 75 88	  JSR $8875		   
$b162:  A9 12		 LDA #$12			
$b164:  20 98 81	  JSR scale_stat	  ; Scale stat value
$b167:  4C C9 82	  JMP $82c9		   
$b16a:  20 E5 B1	  JSR $b1e5		   
$b16d:  A9 12		 LDA #$12			
$b16f:  20 98 81	  JSR scale_stat	  ; Scale stat value
$b172:  4C 75 82	  JMP $8275		   
$b175:  20 E5 B1	  JSR $b1e5		   
$b178:  20 90 B1	  JSR $b190		   
$b17b:  20 75 82	  JSR $8275		   
$b17e:  20 75 88	  JSR $8875		   
$b181:  20 90 B1	  JSR $b190		   
$b184:  20 C9 82	  JSR $82c9		   
$b187:  20 30 89	  JSR $8930		   
$b18a:  20 90 B1	  JSR $b190		   
$b18d:  4C 9F 82	  JMP $829f		   

; ------------------------------
sub_B190:
$b190:  A9 0C		 LDA #$0c			
$b192:  4C 98 81	  JMP scale_stat	  ; Scale stat value
$b195:  20 E5 B1	  JSR $b1e5		   
$b198:  20 B0 B1	  JSR $b1b0		   
$b19b:  20 75 82	  JSR $8275		   
$b19e:  20 75 88	  JSR $8875		   
$b1a1:  20 B0 B1	  JSR $b1b0		   
$b1a4:  20 C9 82	  JSR $82c9		   
$b1a7:  20 30 89	  JSR $8930		   
$b1aa:  20 B0 B1	  JSR $b1b0		   
$b1ad:  4C 9F 82	  JMP $829f		   

; ------------------------------
sub_B1B0:
$b1b0:  A9 18		 LDA #$18			
$b1b2:  20 98 81	  JSR scale_stat	  ; Scale stat value
$b1b5:  4C E0 81	  JMP $81e0		   
$b1b8:  20 E5 B1	  JSR $b1e5		   
$b1bb:  06 94		 ASL $94			 
$b1bd:  26 95		 ROL $95			 
$b1bf:  20 E0 81	  JSR $81e0		   
$b1c2:  20 75 82	  JSR $8275		   
$b1c5:  20 75 88	  JSR $8875		   
$b1c8:  06 94		 ASL $94			 
$b1ca:  26 95		 ROL $95			 
$b1cc:  20 E0 81	  JSR $81e0		   
$b1cf:  20 C9 82	  JSR $82c9		   
$b1d2:  20 30 89	  JSR $8930		   
$b1d5:  06 94		 ASL $94			 
$b1d7:  26 95		 ROL $95			 
$b1d9:  20 E0 81	  JSR $81e0		   
$b1dc:  4C 9F 82	  JMP $829f		   

; ------------------------------
sub_B1DF:
$b1df:  20 3B 87	  JSR $873b		   
$b1e2:  4C E8 B1	  JMP $b1e8		   

; ------------------------------
sub_B1E5:
$b1e5:  20 37 87	  JSR $8737		   
$b1e8:  20 D9 87	  JSR $87d9		   
$b1eb:  4C 23 88	  JMP $8823		   
$b1ee:  20 DF B1	  JSR $b1df		   
$b1f1:  20 90 B1	  JSR $b190		   
$b1f4:  20 8A 82	  JSR $828a		   
$b1f7:  20 79 88	  JSR $8879		   
$b1fa:  20 90 B1	  JSR $b190		   
$b1fd:  20 DE 82	  JSR $82de		   
$b200:  20 34 89	  JSR $8934		   
$b203:  20 90 B1	  JSR $b190		   
$b206:  4C B4 82	  JMP $82b4		   
$b209:  20 DF B1	  JSR $b1df		   
$b20c:  20 24 B2	  JSR $b224		   
$b20f:  20 8A 82	  JSR $828a		   
$b212:  20 79 88	  JSR $8879		   
$b215:  20 24 B2	  JSR $b224		   
$b218:  20 DE 82	  JSR $82de		   
$b21b:  20 34 89	  JSR $8934		   
$b21e:  20 24 B2	  JSR $b224		   
$b221:  4C B4 82	  JMP $82b4		   

; ------------------------------
sub_B224:
$b224:  A9 06		 LDA #$06			
$b226:  4C 98 81	  JMP scale_stat	  ; Scale stat value
$b229:  20 DF B1	  JSR $b1df		   
$b22c:  20 8A 82	  JSR $828a		   
$b22f:  20 79 88	  JSR $8879		   
$b232:  20 DE 82	  JSR $82de		   
$b235:  20 34 89	  JSR $8934		   
$b238:  4C B4 82	  JMP $82b4		   
$b23b:  AD E4 72	  LDA $72e4		   
$b23e:  30 0B		 BMI $b24b		   
$b240:  20 79 88	  JSR $8879		   
$b243:  A9 30		 LDA #$30			
$b245:  20 98 81	  JSR scale_stat	  ; Scale stat value
$b248:  4C DE 82	  JMP $82de		   
$b24b:  60			RTS				 
$b24c:  20 6B 88	  JSR $886b		   
$b24f:  A9 28		 LDA #$28			
$b251:  20 98 81	  JSR scale_stat	  ; Scale stat value
$b254:  4C C9 82	  JMP $82c9		   
$b257:  20 6B 88	  JSR $886b		   
$b25a:  A9 18		 LDA #$18			
$b25c:  20 98 81	  JSR scale_stat	  ; Scale stat value
$b25f:  4C C9 82	  JMP $82c9		   
$b262:  20 DF B1	  JSR $b1df		   
$b265:  20 E0 81	  JSR $81e0		   
$b268:  A9 0C		 LDA #$0c			
$b26a:  20 98 81	  JSR scale_stat	  ; Scale stat value
$b26d:  20 8A 82	  JSR $828a		   
$b270:  20 34 89	  JSR $8934		   
$b273:  20 E0 81	  JSR $81e0		   
$b276:  06 94		 ASL $94			 
$b278:  26 95		 ROL $95			 
$b27a:  4C B4 82	  JMP $82b4		   
$b27d:  20 DF B1	  JSR $b1df		   
$b280:  20 B0 B1	  JSR $b1b0		   
$b283:  20 8A 82	  JSR $828a		   
$b286:  20 79 88	  JSR $8879		   
$b289:  20 B0 B1	  JSR $b1b0		   
$b28c:  20 DE 82	  JSR $82de		   
$b28f:  20 34 89	  JSR $8934		   
$b292:  20 B0 B1	  JSR $b1b0		   
$b295:  4C B4 82	  JMP $82b4		   
$b298:  20 79 88	  JSR $8879		   
$b29b:  A9 12		 LDA #$12			
$b29d:  20 98 81	  JSR scale_stat	  ; Scale stat value
$b2a0:  4C DE 82	  JMP $82de		   
$b2a3:  A9 07		 LDA #$07			
$b2a5:  20 BA B2	  JSR $b2ba		   
$b2a8:  4C C9 82	  JMP $82c9		   
$b2ab:  AE 99 75	  LDX $7599		   
$b2ae:  BD 7F B2	  LDA $b27f,X		 
$b2b1:  20 BA B2	  JSR $b2ba		   
$b2b4:  4C DE 82	  JMP $82de		   
							  ; Data region
		.db $02
$b2b8:  05 07		 ORA $07			 
sub_B2BA:
$b2ba:  85 0F		 STA $0f			 
$b2bc:  20 E5 86	  JSR $86e5		   
$b2bf:  A5 00		 LDA tmp0			; Temporary 0
$b2c1:  05 01		 ORA tmp1			; Temporary 1
$b2c3:  F0 5C		 BEQ $b321		   
$b2c5:  A2 00		 LDX #$00			
$b2c7:  A5 92		 LDA $92			 
$b2c9:  20 51 C8	  JSR $c851		   
$b2cc:  A9 01		 LDA #$01			
$b2ce:  20 13 C8	  JSR $c813		   
$b2d1:  A6 00		 LDX tmp0			; Temporary 0
$b2d3:  A5 01		 LDA tmp1			; Temporary 1
$b2d5:  F0 02		 BEQ $b2d9		   
$b2d7:  A2 FF		 LDX #$ff			
$b2d9:  86 00		 STX tmp0			; Temporary 0
$b2db:  A5 0F		 LDA $0f			 
$b2dd:  0A			ASL				 
$b2de:  0A			ASL				 
$b2df:  0A			ASL				 
$b2e0:  C5 00		 CMP tmp0			; Temporary 0
$b2e2:  B0 15		 BCS $b2f9		   
$b2e4:  85 0F		 STA $0f			 
$b2e6:  A9 00		 LDA #$00			
$b2e8:  85 0E		 STA $0e			 
$b2ea:  A2 0E		 LDX #$0e			
$b2ec:  A5 00		 LDA tmp0			; Temporary 0
$b2ee:  20 51 C8	  JSR $c851		   
$b2f1:  A5 0E		 LDA $0e			 
$b2f3:  4A			LSR				 
$b2f4:  4A			LSR				 
$b2f5:  4A			LSR				 
$b2f6:  4A			LSR				 
$b2f7:  10 00		 BPL $b2f9		   
$b2f9:  A9 10		 LDA #$10			
$b2fb:  48			PHA				 
$b2fc:  A2 00		 LDX #$00			
$b2fe:  86 94		 STX $94			 
$b300:  86 95		 STX $95			 
$b302:  BD 67 B9	  LDA enemy_res_tbl,X ; Enemy resistance table
$b305:  29 1F		 AND #$1f			
$b307:  C5 00		 CMP tmp0			; Temporary 0
$b309:  F0 02		 BEQ $b30d		   
$b30b:  B0 0B		 BCS $b318		   
$b30d:  BD EF 8A	  LDA $8aef,X		 
$b310:  65 94		 ADC $94			 
$b312:  85 94		 STA $94			 
$b314:  90 02		 BCC $b318		   
$b316:  E6 95		 INC $95			 
$b318:  E8			INX				 
$b319:  E0 35		 CPX #$35			
$b31b:  90 E5		 BCC $b302		   
$b31d:  68			PLA				 
$b31e:  4C 98 81	  JMP scale_stat	  ; Scale stat value
$b321:  A9 00		 LDA #$00			
$b323:  85 94		 STA $94			 
$b325:  85 95		 STA $95			 
$b327:  60			RTS				 
$b328:  16 2A		 ASL $2a,X		   
$b32a:  00			BRK				 
							  ; Data region
		.db $33
$b32c:  18			CLC				 
							  ; Data region
		.db $2f, $03, $2b
$b330:  26 1D		 ROL $1d			 
$b332:  10 27		 BPL $b35b		   
							  ; Data region
		.db $07
$b335:  2D 11 30	  AND $3011		   
							  ; Data region
		.db $12, $34
$b33a:  21 29		 AND ($29,X)		 
							  ; Data region
		.db $1a
$b33d:  2A			ROL				 
$b33e:  19 2B 22	  ORA $222b,Y		 
$b341:  2C 13 30	  BIT $3013		   
							  ; Data region
		.db $14
$b345:  31 0D		 AND ($0d),Y		 
$b347:  29 17		 AND #$17			
$b349:  2A			ROL				 
$b34a:  2E 2B 0E	  ROL $0e2b		   
$b34d:  24 18		 BIT mult_mid		; Product mid
$b34f:  30 0F		 BMI $b360		   
							  ; Data region
		.db $32
$b352:  00			BRK				 
							  ; Data region
		.db $1f, $03, $1c
$b356:  06 28		 ASL $28			 
$b358:  01 02		 ORA ($02,X)		 
							  ; Data region
		.db $04
$b35b:  05 07		 ORA $07			 
$b35d:  08			PHP				 
$b35e:  09 1F		 ORA #$1f			
$b360:  0A			ASL				 
$b361:  1E 0B 33	  ASL $330b,X		 
							  ; Data region
		.db $1c, $20, $1b, $23, $0c, $25, $ff, $ff, $33
$b36d:  2A			ROL				 
							  ; Data region
		.db $3b
$b36f:  35 2B		 AND $2b,X		   
$b371:  30 29		 BMI $b39c		   
							  ; Data region
		.db $3a
$b374:  2A			ROL				 
$b375:  30 2B		 BMI $b3a2		   
$b377:  2C 31 FF	  BIT $ff31		   
$b37a:  29 2E		 AND #$2e			
$b37c:  2A			ROL				 
$b37d:  30 2B		 BMI $b3aa		   
							  ; Data region
		.db $ff, $ff, $ff, $33, $35, $37, $ff, $ff, $ff, $ff, $ff, $33
$b38b:  35 38		 AND $38,X		   
$b38d:  36 FF		 ROL $ff,X		   
							  ; Data region
		.db $ff, $ff, $ff
sub_B392:
$b392:  20 EB B3	  JSR $b3eb		   
$b395:  A2 00		 LDX #$00			
$b397:  8A			TXA				 
$b398:  48			PHA				 
$b399:  20 84 87	  JSR $8784		   
$b39c:  20 23 88	  JSR $8823		   
$b39f:  20 36 82	  JSR $8236		   
$b3a2:  A9 04		 LDA #$04			
$b3a4:  20 13 C8	  JSR $c813		   
$b3a7:  68			PLA				 
$b3a8:  AA			TAX				 
$b3a9:  20 D7 B3	  JSR $b3d7		   
$b3ac:  E8			INX				 
$b3ad:  E0 04		 CPX #$04			
$b3af:  90 E6		 BCC $b397		   
$b3b1:  60			RTS				 
$b3b2:  20 EB B3	  JSR $b3eb		   
$b3b5:  A5 0C		 LDA $0c			 
$b3b7:  85 94		 STA $94			 
$b3b9:  A5 0D		 LDA $0d			 
$b3bb:  85 95		 STA $95			 
$b3bd:  20 36 82	  JSR $8236		   
$b3c0:  A2 03		 LDX #$03			
$b3c2:  8A			TXA				 
$b3c3:  20 D7 B3	  JSR $b3d7		   
$b3c6:  CA			DEX				 
$b3c7:  10 F9		 BPL $b3c2		   
$b3c9:  60			RTS				 
$b3ca:  20 EB B3	  JSR $b3eb		   
$b3cd:  A2 0C		 LDX #$0c			
$b3cf:  A9 05		 LDA #$05			
$b3d1:  20 27 C8	  JSR $c827		   
$b3d4:  4C B5 B3	  JMP $b3b5		   

; ------------------------------
sub_B3D7:
$b3d7:  0A			ASL				 
$b3d8:  A8			TAY				 
$b3d9:  18			CLC				 
$b3da:  B9 A3 75	  LDA $75a3,Y		 
$b3dd:  65 94		 ADC $94			 
$b3df:  99 A3 75	  STA $75a3,Y		 
$b3e2:  B9 A4 75	  LDA $75a4,Y		 
$b3e5:  65 95		 ADC $95			 
$b3e7:  99 A4 75	  STA $75a4,Y		 
$b3ea:  60			RTS				 

; ------------------------------
sub_B3EB:
$b3eb:  A6 93		 LDX btl_flags	   ; Battle calculation flags
$b3ed:  20 9C 89	  JSR $899c		   
$b3f0:  A0 0D		 LDY #$0d			
$b3f2:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$b3f4:  29 03		 AND #$03			
$b3f6:  AA			TAX				 
$b3f7:  00			BRK				 
$b3f8:  10 8F		 BPL $b389		   
$b3fa:  60			RTS				 
$b3fb:  20 92 B3	  JSR $b392		   
$b3fe:  20 DF B1	  JSR $b1df		   
$b401:  20 19 B4	  JSR $b419		   
$b404:  20 8A 82	  JSR $828a		   
$b407:  20 79 88	  JSR $8879		   
$b40a:  20 19 B4	  JSR $b419		   
$b40d:  20 DE 82	  JSR $82de		   
$b410:  20 34 89	  JSR $8934		   
$b413:  20 19 B4	  JSR $b419		   
$b416:  4C B4 82	  JMP $82b4		   

; ------------------------------
sub_B419:
$b419:  A9 0C		 LDA #$0c			
$b41b:  20 98 81	  JSR scale_stat	  ; Scale stat value
$b41e:  4C E0 81	  JMP $81e0		   
$b421:  4C 92 B3	  JMP $b392		   
$b424:  20 92 B3	  JSR $b392		   
$b427:  20 DF B1	  JSR $b1df		   
$b42a:  20 E0 81	  JSR $81e0		   
$b42d:  20 8A 82	  JSR $828a		   
$b430:  20 79 88	  JSR $8879		   
$b433:  20 E0 81	  JSR $81e0		   
$b436:  20 DE 82	  JSR $82de		   
$b439:  20 34 89	  JSR $8934		   
$b43c:  20 E0 81	  JSR $81e0		   
$b43f:  4C B4 82	  JMP $82b4		   
$b442:  20 B9 87	  JSR $87b9		   
$b445:  20 E0 81	  JSR $81e0		   
$b448:  4C F3 82	  JMP $82f3		   
$b44b:  20 B9 87	  JSR $87b9		   
$b44e:  46 94		 LSR $94			 
$b450:  66 95		 ROR $95			 
$b452:  A9 01		 LDA #$01			
$b454:  A2 94		 LDX #$94			
$b456:  20 13 C8	  JSR $c813		   
$b459:  A9 06		 LDA #$06			
$b45b:  20 98 81	  JSR scale_stat	  ; Scale stat value
$b45e:  4C F3 82	  JMP $82f3		   
$b461:  60			RTS				 
$b462:  98			TYA				 
$b463:  48			PHA				 
$b464:  A5 82		 LDA inner_loop	  ; Inner loop counter
$b466:  48			PHA				 
$b467:  A9 00		 LDA #$00			
$b469:  85 6E		 STA $6e			 
$b46b:  A9 03		 LDA #$03			
$b46d:  85 82		 STA inner_loop	  ; Inner loop counter
$b46f:  A5 82		 LDA inner_loop	  ; Inner loop counter
$b471:  20 6B 8A	  JSR $8a6b		   
$b474:  90 05		 BCC $b47b		   
$b476:  A0 00		 LDY #$00			
$b478:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$b47a:  0A			ASL				 
$b47b:  26 6E		 ROL $6e			 
$b47d:  C6 82		 DEC inner_loop	  ; Inner loop counter
$b47f:  10 EE		 BPL $b46f		   
$b481:  68			PLA				 
$b482:  85 82		 STA inner_loop	  ; Inner loop counter
$b484:  68			PLA				 
$b485:  A8			TAY				 
$b486:  A5 6E		 LDA $6e			 
$b488:  60			RTS				 
$b489:  20 73 B5	  JSR $b573		   
$b48c:  20 96 B4	  JSR $b496		   
$b48f:  20 BA B4	  JSR $b4ba		   
$b492:  20 E8 B4	  JSR $b4e8		   
$b495:  60			RTS				 

; ------------------------------
sub_B496:
$b496:  48			PHA				 
$b497:  A9 00		 LDA #$00			
$b499:  85 04		 STA $04			 
$b49b:  68			PLA				 
$b49c:  48			PHA				 
$b49d:  C9 13		 CMP #$13			
$b49f:  90 17		 BCC $b4b8		   
$b4a1:  C9 19		 CMP #$19			
$b4a3:  B0 13		 BCS $b4b8		   
$b4a5:  AD 63 73	  LDA $7363		   
$b4a8:  30 0E		 BMI $b4b8		   
$b4aa:  AD E7 72	  LDA $72e7		   
$b4ad:  29 10		 AND #$10			
$b4af:  F0 07		 BEQ $b4b8		   
$b4b1:  A9 80		 LDA #$80			
$b4b3:  85 04		 STA $04			 
$b4b5:  20 53 B5	  JSR $b553		   
$b4b8:  68			PLA				 
$b4b9:  60			RTS				 

; ------------------------------
sub_B4BA:
$b4ba:  48			PHA				 
$b4bb:  A2 02		 LDX #$02			
$b4bd:  C9 13		 CMP #$13			
$b4bf:  90 25		 BCC $b4e6		   
$b4c1:  C9 16		 CMP #$16			
$b4c3:  90 06		 BCC $b4cb		   
$b4c5:  C9 19		 CMP #$19			
$b4c7:  B0 1D		 BCS $b4e6		   
$b4c9:  A2 05		 LDX #$05			
$b4cb:  86 00		 STX tmp0			; Temporary 0
$b4cd:  00			BRK				 
							  ; Data region
		.db $07, $1f
$b4d0:  90 14		 BCC $b4e6		   
$b4d2:  A5 00		 LDA tmp0			; Temporary 0
$b4d4:  00			BRK				 
							  ; Data region
		.db $22, $b3
$b4d7:  AA			TAX				 
$b4d8:  BD 49 B7	  LDA $b749,X		 
$b4db:  20 53 B5	  JSR $b553		   
$b4de:  EE 61 73	  INC $7361		   
$b4e1:  D0 03		 BNE $b4e6		   
$b4e3:  EE 62 73	  INC $7362		   
$b4e6:  68			PLA				 
$b4e7:  60			RTS				 

; ------------------------------
sub_B4E8:
$b4e8:  85 03		 STA tmp3			; Temporary 3
$b4ea:  00			BRK				 
							  ; Data region
		.db $07, $1f
$b4ed:  B0 50		 BCS $b53f		   
$b4ef:  A9 01		 LDA #$01			
$b4f1:  00			BRK				 
							  ; Data region
		.db $3b, $73
$b4f4:  B0 0E		 BCS $b504		   
$b4f6:  A9 02		 LDA #$02			
$b4f8:  00			BRK				 
							  ; Data region
		.db $3b, $73
$b4fb:  B0 07		 BCS $b504		   
$b4fd:  A9 03		 LDA #$03			
$b4ff:  00			BRK				 
							  ; Data region
		.db $3b, $73
$b502:  90 3B		 BCC $b53f		   
$b504:  29 7F		 AND #$7f			
$b506:  A2 06		 LDX #$06			
$b508:  DD 40 B5	  CMP $b540,X		 
$b50b:  F0 04		 BEQ $b511		   
$b50d:  CA			DEX				 
$b50e:  10 F8		 BPL $b508		   
$b510:  60			RTS				 
$b511:  8A			TXA				 
$b512:  4A			LSR				 
$b513:  AA			TAX				 
$b514:  BD 47 B5	  LDA $b547,X		 
$b517:  90 04		 BCC $b51d		   
$b519:  4A			LSR				 
$b51a:  4A			LSR				 
$b51b:  4A			LSR				 
$b51c:  4A			LSR				 
$b51d:  29 0F		 AND #$0f			
$b51f:  85 04		 STA $04			 
$b521:  A2 00		 LDX #$00			
$b523:  46 04		 LSR $04			 
$b525:  90 0C		 BCC $b533		   
$b527:  A5 03		 LDA tmp3			; Temporary 3
$b529:  DD 4B B5	  CMP $b54b,X		 
$b52c:  90 05		 BCC $b533		   
$b52e:  DD 4C B5	  CMP $b54c,X		 
$b531:  90 07		 BCC $b53a		   
$b533:  E8			INX				 
$b534:  E8			INX				 
$b535:  E0 08		 CPX #$08			
$b537:  D0 EA		 BNE $b523		   
$b539:  60			RTS				 
$b53a:  A9 AA		 LDA #$aa			
$b53c:  20 53 B5	  JSR $b553		   
$b53f:  60			RTS				 
							  ; Data region
		.db $32, $34
$b542:  35 37		 AND $37,X		   
							  ; Data region
		.db $3c
$b545:  41 43		 EOR ($43,X)		 
$b547:  78			SEI				 
$b548:  F9 79 08	  SBC $0879,Y		 
$b54b:  00			BRK				 
$b54c:  09 09		 ORA #$09			
$b54e:  0D 0D 10	  ORA $100d		   
							  ; Data region
		.db $13
$b552:  19 48 AD	  ORA $ad48,Y		 
$b555:  61 73		 ADC ($73,X)		 
$b557:  85 00		 STA tmp0			; Temporary 0
$b559:  AD 62 73	  LDA $7362		   
$b55c:  85 01		 STA tmp1			; Temporary 1
$b55e:  68			PLA				 
$b55f:  A2 00		 LDX #$00			
$b561:  00			BRK				 
$b562:  36 0F		 ROL $0f,X		   
$b564:  A5 01		 LDA tmp1			; Temporary 1
$b566:  85 00		 STA tmp0			; Temporary 0
$b568:  8D 61 73	  STA $7361		   
$b56b:  A5 02		 LDA tmp2			; Temporary 2
$b56d:  85 01		 STA tmp1			; Temporary 1
$b56f:  8D 62 73	  STA $7362		   
$b572:  60			RTS				 

; ------------------------------
sub_B573:
$b573:  85 00		 STA tmp0			; Temporary 0
$b575:  20 AD B5	  JSR $b5ad		   
$b578:  48			PHA				 
$b579:  0A			ASL				 
$b57a:  06 00		 ASL tmp0			; Temporary 0
$b57c:  90 02		 BCC $b580		   
$b57e:  69 37		 ADC #$37			
$b580:  AA			TAX				 
$b581:  A9 00		 LDA #$00			
$b583:  85 01		 STA tmp1			; Temporary 1
$b585:  E0 24		 CPX #$24			
$b587:  D0 08		 BNE $b591		   
$b589:  A9 4A		 LDA #$4a			
$b58b:  85 00		 STA tmp0			; Temporary 0
$b58d:  E6 01		 INC tmp1			; Temporary 1
$b58f:  D0 05		 BNE $b596		   
$b591:  BD 4D B7	  LDA stat_tbl_1,X	; Stat modifier table 1
$b594:  85 00		 STA tmp0			; Temporary 0
$b596:  BD 4E B7	  LDA $b74e,X		 
$b599:  00			BRK				 
							  ; Data region
		.db $17, $0f
$b59c:  A2 00		 LDX #$00			
$b59e:  20 13 C8	  JSR $c813		   
$b5a1:  A5 00		 LDA tmp0			; Temporary 0
$b5a3:  8D 61 73	  STA $7361		   
$b5a6:  A5 01		 LDA tmp1			; Temporary 1
$b5a8:  8D 62 73	  STA $7362		   
$b5ab:  68			PLA				 
$b5ac:  60			RTS				 

; ------------------------------
sub_B5AD:
$b5ad:  00			BRK				 
							  ; Data region
		.db $03, $1f
$b5b0:  C9 4D		 CMP #$4d			
$b5b2:  90 19		 BCC $b5cd		   
$b5b4:  C9 67		 CMP #$67			
$b5b6:  F0 04		 BEQ $b5bc		   
$b5b8:  C9 6D		 CMP #$6d			
$b5ba:  90 0F		 BCC $b5cb		   
sub_B5BC:
$b5bc:  A2 0A		 LDX #$0a			
$b5be:  DD CE B5	  CMP $b5ce,X		 
$b5c1:  F0 04		 BEQ $b5c7		   
$b5c3:  CA			DEX				 
$b5c4:  10 F8		 BPL $b5be		   
$b5c6:  60			RTS				 
$b5c7:  BD D9 B5	  LDA $b5d9,X		 
$b5ca:  60			RTS				 
$b5cb:  E9 39		 SBC #$39			
$b5cd:  60			RTS				 
$b5ce:  6D 80 83	  ADC $8380		   
$b5d1:  84 86		 STY stat_ptr_lo	 ; Stat table pointer low
							  ; Data region
		.db $87, $89
$b5d5:  8E 95 74	  STX $7495		   
							  ; Data region
		.db $67
$b5d9:  19 1A 04	  ORA $041a,Y		 
$b5dc:  0E 04 0A	  ASL $0a04		   
$b5df:  06 03		 ASL tmp3			; Temporary 3
							  ; Data region
		.db $1b, $04, $14
$b5e4:  8A			TXA				 
$b5e5:  48			PHA				 
$b5e6:  A9 00		 LDA #$00			
$b5e8:  85 70		 STA $70			 
$b5ea:  85 7D		 STA $7d			 
$b5ec:  20 1D B6	  JSR $b61d		   
$b5ef:  0A			ASL				 
$b5f0:  AA			TAX				 
$b5f1:  BD E3 B7	  LDA $b7e3,X		 
$b5f4:  85 00		 STA tmp0			; Temporary 0
$b5f6:  BD E4 B7	  LDA $b7e4,X		 
$b5f9:  C9 FF		 CMP #$ff			
$b5fb:  F0 0A		 BEQ $b607		   
$b5fd:  00			BRK				 
							  ; Data region
		.db $17, $0f
$b600:  18			CLC				 
$b601:  65 00		 ADC tmp0			; Temporary 0
$b603:  85 00		 STA tmp0			; Temporary 0
$b605:  90 04		 BCC $b60b		   
$b607:  C6 70		 DEC $70			 
$b609:  C6 7D		 DEC $7d			 
$b60b:  00			BRK				 
$b60c:  0D 1F 90	  ORA $901f		   
$b60f:  08			PHP				 
$b610:  06 00		 ASL tmp0			; Temporary 0
$b612:  08			PHP				 
$b613:  26 70		 ROL $70			 
$b615:  28			PLP				 
$b616:  26 7D		 ROL $7d			 
$b618:  68			PLA				 
$b619:  AA			TAX				 
$b61a:  A5 00		 LDA tmp0			; Temporary 0
$b61c:  60			RTS				 

; ------------------------------
sub_B61D:
$b61d:  00			BRK				 
							  ; Data region
		.db $03, $1f
sub_B620:
$b620:  A2 1D		 LDX #$1d			
$b622:  DD 2F B6	  CMP $b62f,X		 
$b625:  F0 04		 BEQ $b62b		   
$b627:  CA			DEX				 
$b628:  10 F8		 BPL $b622		   
$b62a:  60			RTS				 
$b62b:  BD 4D B6	  LDA $b64d,X		 
$b62e:  60			RTS				 
$b62f:  29 2A		 AND #$2a			
							  ; Data region
		.db $2b
$b632:  2C 2D 8B	  BIT $8b2d		   
							  ; Data region
		.db $8f
$b636:  94 9B		 STY $9b,X		   
$b638:  A0 99		 LDY #$99			
$b63a:  9A			TXS				 
$b63b:  A1 A2		 LDA ($a2,X)		 
							  ; Data region
		.db $a3
$b63e:  A4 A5		 LDY $a5			 
$b640:  49 4A		 EOR #$4a			
							  ; Data region
		.db $4b, $79, $df
$b645:  F1 F2		 SBC ($f2),Y		 
							  ; Data region
		.db $77
$b648:  70 1C		 BVS $b666		   
							  ; Data region
		.db $eb
$b64b:  EC FE 00	  CPX $00fe		   
$b64e:  01 02		 ORA ($02,X)		 
$b650:  01 02		 ORA ($02,X)		 
$b652:  01 01		 ORA ($01,X)		 
							  ; Data region
		.db $03, $02, $04
$b657:  05 06		 ORA $06			 
							  ; Data region
		.db $07, $07, $07
$b65c:  08			PHP				 
$b65d:  09 0A		 ORA #$0a			
							  ; Data region
		.db $0b, $0c, $0d, $0e, $0f, $0f, $01, $03, $0c, $02, $02, $02
sub_B66B:
$b66b:  AD E7 72	  LDA $72e7		   
$b66e:  29 02		 AND #$02			
$b670:  AD E9 72	  LDA $72e9		   
$b673:  30 05		 BMI $b67a		   
$b675:  00			BRK				 
$b676:  0E 1F 30	  ASL $301f		   
							  ; Data region
		.db $4f
$b67a:  00			BRK				 
							  ; Data region
		.db $03, $1f
$b67d:  AA			TAX				 
$b67e:  AD 63 73	  LDA $7363		   
$b681:  30 10		 BMI $b693		   
$b683:  BD 0B B8	  LDA spell_eff_tbl,X ; Spell effect type table
$b686:  29 E0		 AND #$e0			
$b688:  C9 E0		 CMP #$e0			
$b68a:  F0 3D		 BEQ $b6c9		   
$b68c:  20 CB B6	  JSR $b6cb		   
$b68f:  20 DD B6	  JSR $b6dd		   
$b692:  60			RTS				 
$b693:  BD 0B B8	  LDA spell_eff_tbl,X ; Spell effect type table
$b696:  29 1F		 AND #$1f			
$b698:  AA			TAX				 
$b699:  BD 36 B7	  LDA $b736,X		 
$b69c:  E0 10		 CPX #$10			
$b69e:  B0 2B		 BCS $b6cb		   
$b6a0:  48			PHA				 
$b6a1:  AD 63 73	  LDA $7363		   
$b6a4:  29 07		 AND #$07			
$b6a6:  AA			TAX				 
$b6a7:  68			PLA				 
$b6a8:  00			BRK				 
							  ; Data region
		.db $22, $b3
$b6ab:  48			PHA				 
$b6ac:  00			BRK				 
							  ; Data region
		.db $03, $1f
$b6af:  A2 00		 LDX #$00			
$b6b1:  C9 18		 CMP #$18			
$b6b3:  F0 04		 BEQ $b6b9		   
$b6b5:  C9 1F		 CMP #$1f			
$b6b7:  D0 02		 BNE $b6bb		   
$b6b9:  A2 04		 LDX #$04			
$b6bb:  86 00		 STX tmp0			; Temporary 0
$b6bd:  68			PLA				 
$b6be:  18			CLC				 
$b6bf:  65 00		 ADC tmp0			; Temporary 0
$b6c1:  AA			TAX				 
$b6c2:  BD 03 B8	  LDA unk_tbl_b803,X  ; Unknown table
$b6c5:  20 CB B6	  JSR $b6cb		   
$b6c8:  60			RTS				 
$b6c9:  A9 FF		 LDA #$ff			
sub_B6CB:
$b6cb:  85 00		 STA tmp0			; Temporary 0
$b6cd:  00			BRK				 
$b6ce:  0D 1F 90	  ORA $901f		   
$b6d1:  08			PHP				 
$b6d2:  06 00		 ASL tmp0			; Temporary 0
$b6d4:  90 04		 BCC $b6da		   
$b6d6:  A9 FF		 LDA #$ff			
$b6d8:  85 00		 STA tmp0			; Temporary 0
$b6da:  A5 00		 LDA tmp0			; Temporary 0
$b6dc:  60			RTS				 

; ------------------------------
sub_B6DD:
$b6dd:  85 00		 STA tmp0			; Temporary 0
$b6df:  60			RTS				 
$b6e0:  AD 63 73	  LDA $7363		   
$b6e3:  30 30		 BMI $b715		   
$b6e5:  00			BRK				 
							  ; Data region
		.db $67, $73
$b6e8:  AA			TAX				 
$b6e9:  00			BRK				 
							  ; Data region
		.db $23, $53
$b6ec:  38			SEC				 
$b6ed:  A9 80		 LDA #$80			
$b6ef:  E5 72		 SBC $72			 
$b6f1:  85 01		 STA tmp1			; Temporary 1
$b6f3:  A9 01		 LDA #$01			
$b6f5:  E9 00		 SBC #$00			
$b6f7:  85 02		 STA tmp2			; Temporary 2
$b6f9:  46 02		 LSR tmp2			; Temporary 2
$b6fb:  66 01		 ROR tmp1			; Temporary 1
$b6fd:  A2 01		 LDX #$01			
$b6ff:  A5 00		 LDA tmp0			; Temporary 0
$b701:  20 27 C8	  JSR $c827		   
$b704:  A9 80		 LDA #$80			
$b706:  20 51 C8	  JSR $c851		   
$b709:  06 01		 ASL tmp1			; Temporary 1
$b70b:  26 02		 ROL tmp2			; Temporary 2
$b70d:  B0 03		 BCS $b712		   
$b70f:  A5 02		 LDA tmp2			; Temporary 2
$b711:  60			RTS				 
$b712:  A9 FF		 LDA #$ff			
$b714:  60			RTS				 
$b715:  A5 00		 LDA tmp0			; Temporary 0
$b717:  60			RTS				 
$b718:  20 6B B6	  JSR $b66b		   
$b71b:  85 00		 STA tmp0			; Temporary 0
$b71d:  A5 00		 LDA tmp0			; Temporary 0
$b71f:  F0 09		 BEQ $b72a		   
$b721:  00			BRK				 
							  ; Data region
		.db $1b, $0f
$b724:  C5 00		 CMP tmp0			; Temporary 0
$b726:  F0 04		 BEQ $b72c		   
$b728:  90 02		 BCC $b72c		   
$b72a:  18			CLC				 
$b72b:  60			RTS				 
$b72c:  38			SEC				 
$b72d:  60			RTS				 
$b72e:  BD 6C BA	  LDA ai_tbl_2,X	  ; AI table 2
$b731:  60			RTS				 
$b732:  BD 70 BA	  LDA ai_tbl_3,X	  ; AI table 3
$b735:  60			RTS				 
							  ; Data region
		.db $03, $02
$b738:  01 07		 ORA ($07,X)		 
$b73a:  06 05		 ASL $05			 
							  ; Data region
		.db $0b
$b73d:  0A			ASL				 
$b73e:  09 0F		 ORA #$0f			
$b740:  0E 0D 13	  ASL $130d		   
							  ; Data region
		.db $12
$b744:  11 00		 ORA (tmp0),Y		; Temporary 0
$b746:  00			BRK				 
$b747:  20 FF FF	  JSR $ffff		   
$b74a:  C0 80		 CPY #$80			
$b74c:  00			BRK				 
stat_tbl_1:					 ; $b74d
$b74d:  08			PHP				 
							  ; Data region
		.db $07
$b74f:  46 15		 LSR $15			 
$b751:  A0 29		 LDY #$29			
$b753:  10 09		 BPL $b75e		   
$b755:  1E 0D 58	  ASL $580d,X		 
$b758:  19 10 09	  ORA $0910,Y		 
							  ; Data region
		.db $34
$b75c:  11 78		 ORA ($78),Y		 
$b75e:  29 0A		 AND #$0a			
							  ; Data region
		.db $07, $23, $0b, $3c
$b764:  15 58		 ORA $58,X		   
$b766:  19 08 11	  ORA $1108,Y		 
$b769:  19 1F 3C	  ORA $3c1f,Y		 
$b76c:  3D 46 15	  AND $1546,X		 
							  ; Data region
		.db $af, $33, $ff
$b772:  29 06		 AND #$06			
$b774:  05 1E		 ORA $1e			 
							  ; Data region
		.db $0b
$b777:  50 15		 BVC $b78e		   
$b779:  09 04		 ORA #$04			
$b77b:  28			PLP				 
$b77c:  15 64		 ORA $64,X		   
$b77e:  29 12		 AND #$12			
$b780:  05 2D		 ORA $2d			 
							  ; Data region
		.db $0b
$b783:  0A			ASL				 
$b784:  06 07		 ASL $07			 
$b786:  06 34		 ASL $34			 
							  ; Data region
		.db $0b, $5c
$b78a:  25 0A		 AND $0a			 
$b78c:  09 16		 ORA #$16			
$b78e:  0D 2D 0B	  ORA $0b2d		   
$b791:  10 09		 BPL $b79c		   
							  ; Data region
		.db $34
$b794:  11 48		 ORA ($48),Y		 
$b796:  11 0A		 ORA ($0a),Y		 
							  ; Data region
		.db $07
$b799:  1E 0B 3C	  ASL $3c0b,X		 
$b79c:  15 37		 ORA $37,X		   
$b79e:  0D 06 0D	  ORA $0d06		   
$b7a1:  0E 15 1E	  ASL $1e15		   
$b7a4:  21 46		 AND ($46,X)		 
$b7a6:  15 AF		 ORA $af,X		   
							  ; Data region
		.db $33, $ff, $33
$b7ab:  06 05		 ASL $05			 
$b7ad:  1E 0B 50	  ASL $500b,X		 
$b7b0:  15 09		 ORA $09,X		   
$b7b2:  05 28		 ORA $28			 
$b7b4:  15 64		 ORA $64,X		   
$b7b6:  29 12		 AND #$12			
$b7b8:  05 2D		 ORA $2d			 
							  ; Data region
		.db $0b
$b7bb:  0A			ASL				 
$b7bc:  06 09		 ASL $09			 
							  ; Data region
		.db $03
$b7bf:  39 05 6E	  AND $6e05,Y		 
							  ; Data region
		.db $12
$b7c3:  0E 04 1C	  ASL $1c04		   
$b7c6:  06 32		 ASL $32			 
$b7c8:  05 50		 ORA $50			 
$b7ca:  08			PHP				 
$b7cb:  0D 03 23	  ORA $2303		   
$b7ce:  05 3D		 ORA $3d			 
$b7d0:  06 0C		 ASL $0c			 
$b7d2:  06 18		 ASL mult_mid		; Product mid
$b7d4:  0A			ASL				 
$b7d5:  2E 10 08	  ROL $0810		   
							  ; Data region
		.db $02, $23
$b7da:  05 5A		 ORA $5a			 
$b7dc:  0A			ASL				 
							  ; Data region
		.db $0b, $02, $32
$b7e0:  0A			ASL				 
$b7e1:  78			SEI				 
							  ; Data region
		.db $14, $1e, $0b, $4b, $15, $ff, $ff, $1e, $0b, $32, $0b, $14, $0b, $0a, $06, $01
		.db $03, $04, $03, $03, $03
$b7f7:  01 02		 ORA ($02,X)		 
							  ; Data region
		.db $03
$b7fa:  05 05		 ORA $05			 
$b7fc:  06 0F		 ASL $0f			 
$b7fe:  06 64		 ASL $64			 
$b800:  15 32		 ORA $32,X		   
							  ; Data region
		.db $0b, $ff
$b804:  D8			CLD				 
$b805:  66 00		 ROR tmp0			; Temporary 0
							  ; Data region
		.db $ff, $ff, $b2
$b80a:  00			BRK				 
spell_eff_tbl:					 ; $b80b
							  ; Data region
		.db $e2, $e2, $e2
$b80e:  E1 E1		 SBC ($e1,X)		 
$b810:  E1 E0		 SBC ($e0,X)		 
$b812:  E0 E0		 CPX #$e0			
$b814:  E5 E5		 SBC $e5			 
$b816:  E5 E5		 SBC $e5			 
$b818:  E4 E4		 CPX $e4			 
$b81a:  E4 E3		 CPX $e3			 
							  ; Data region
		.db $e3, $e3
$b81e:  68			PLA				 
$b81f:  68			PLA				 
$b820:  EE E9 67	  INC $67e9		   
							  ; Data region
		.db $c7, $6b
$b825:  A6 4C		 LDX $4c			 
$b827:  EA			NOP				 
							  ; Data region
		.db $f2, $f2, $cd, $cd, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2
		.db $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2
		.db $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $72
$b858:  E1 E1		 SBC ($e1,X)		 
$b85a:  E1 E5		 SBC ($e5,X)		 
$b85c:  E5 E5		 SBC $e5			 
							  ; Data region
		.db $67, $72, $31, $67, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2
		.db $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2
		.db $67, $e1, $f2, $f2, $eb, $67, $f2, $67, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2
$b88e:  E1 E4		 SBC ($e4,X)		 
							  ; Data region
		.db $67
$b891:  E1 E5		 SBC ($e5,X)		 
							  ; Data region
		.db $6b
$b894:  E0 ED		 CPX #$ed			
							  ; Data region
		.db $f2, $f2, $67, $e1, $f2, $28, $f2, $f2, $f2, $f2, $e9, $f2, $f2, $f2, $f2, $f2
		.db $f2, $e9, $eb, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $66, $f2, $ec
		.db $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2
		.db $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2
		.db $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2
		.db $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2
		.db $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $92, $09, $f2
		.db $f2, $f2
$b908:  E6 F2		 INC $f2			 
							  ; Data region
		.db $f2
sub_B90B:
$b90b:  48			PHA				 
$b90c:  20 53 B9	  JSR $b953		   
$b90f:  29 1F		 AND #$1f			
$b911:  C9 1E		 CMP #$1e			
$b913:  68			PLA				 
$b914:  60			RTS				 

; --------------------------------------------------
; Spell param 1 table
; --------------------------------------------------
spell_p1_tbl:					 ; $b915
$b915:  20 0B B9	  JSR $b90b		   
$b918:  B0 12		 BCS $b92c		   
$b91a:  8D 10 6E	  STA $6e10		   
$b91d:  20 53 B9	  JSR $b953		   
$b920:  29 1F		 AND #$1f			
$b922:  C9 19		 CMP #$19			
$b924:  90 04		 BCC $b92a		   
$b926:  AA			TAX				 
$b927:  BD 4E BA	  LDA ai_tbl_1,X	  ; AI decision table 1
$b92a:  38			SEC				 
$b92b:  60			RTS				 
$b92c:  A9 00		 LDA #$00			
$b92e:  18			CLC				 
$b92f:  60			RTS				 

; ------------------------------
sub_B930:
$b930:  48			PHA				 
$b931:  20 53 B9	  JSR $b953		   
$b934:  2A			ROL				 
$b935:  68			PLA				 
$b936:  60			RTS				 
$b937:  48			PHA				 
$b938:  20 53 B9	  JSR $b953		   
$b93b:  29 60		 AND #$60			
$b93d:  F0 07		 BEQ $b946		   
$b93f:  C9 60		 CMP #$60			
$b941:  F0 03		 BEQ $b946		   
$b943:  68			PLA				 
$b944:  38			SEC				 
$b945:  60			RTS				 
$b946:  68			PLA				 
$b947:  18			CLC				 
$b948:  60			RTS				 

; --------------------------------------------------
; Spell param 2 table
; --------------------------------------------------
spell_p2_tbl:					 ; $b949
$b949:  20 53 B9	  JSR $b953		   
$b94c:  29 60		 AND #$60			
$b94e:  0A			ASL				 
$b94f:  2A			ROL				 
$b950:  2A			ROL				 
$b951:  2A			ROL				 
$b952:  60			RTS				 

; ------------------------------
sub_B953:
$b953:  8D 10 6E	  STA $6e10		   
$b956:  8A			TXA				 
$b957:  48			PHA				 
$b958:  AE 10 6E	  LDX $6e10		   
$b95b:  BD 67 B9	  LDA enemy_res_tbl,X ; Enemy resistance table
$b95e:  8D 10 6E	  STA $6e10		   
$b961:  68			PLA				 
$b962:  AA			TAX				 
$b963:  AD 10 6E	  LDA $6e10		   
$b966:  60			RTS				 

; --------------------------------------------------
; Enemy resistance table
; --------------------------------------------------
enemy_res_tbl:					 ; $b967
$b967:  A2 A4		 LDX #$a4			
$b969:  AA			TAX				 
$b96a:  C4 C6		 CPY $c6			 
$b96c:  CA			DEX				 
$b96d:  E5 E8		 SBC $e8			 
							  ; Data region
		.db $ef
$b970:  A2 C5		 LDX #$c5			
$b972:  E8			INX				 
							  ; Data region
		.db $cb, $c2
$b975:  C4 C8		 CPY $c8			 
$b977:  A4 EF		 LDY $ef			 
							  ; Data region
		.db $af, $a4, $c7
$b97c:  E1 C3		 SBC ($c3,X)		 
							  ; Data region
		.db $c3, $a3, $c3
$b981:  C4 A5		 CPY $a5			 
$b983:  A0 22		 LDY #$22			
							  ; Data region
		.db $04, $a3
$b987:  C4 23		 CPY $23			 
							  ; Data region
		.db $64, $63
$b98b:  06 26		 ASL $26			 
							  ; Data region
		.db $02, $25, $12, $23, $25, $27, $72
$b994:  79 62 62	  ADC $6262,Y		 
$b997:  2C 34 61	  BIT $6134		   
$b99a:  08			PHP				 
							  ; Data region
		.db $74
$b99c:  68			PLA				 
							  ; Data region
		.db $63, $62, $6c, $60, $22, $68, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $bf, $bf, $bf
		.db $bf, $bf, $bf, $bf, $bf, $bf, $7f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
		.db $ff, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f
		.db $7f, $ff, $1f, $1f, $1f, $1f, $1f, $ff, $bf, $ff, $3f, $3f, $1f, $bf, $df, $bf
		.db $1f, $df, $ff, $bf, $ff, $bf, $ff, $bf, $bf, $1f, $ff, $3f, $bf, $df, $df, $bf
		.db $bf, $df, $df, $ff, $df, $3f, $bf, $bf, $df, $1f, $ff, $1f, $1f, $1f, $3f, $bf
		.db $1f, $3f, $3f, $1f, $1f, $7f, $df, $df, $ff, $1f, $7f, $1f, $1f, $1f, $1f, $1f
		.db $bf, $3f, $ff, $bf, $bf, $bf, $1f, $1f, $1f, $1f, $1f, $1f, $bf, $1f, $bf, $bf
		.db $bf, $1f, $1f, $1f, $1f, $bf, $1f, $bf, $bf, $1f, $bf, $1f, $1f, $1f, $bf, $1f
		.db $1f, $3f, $bf, $1f, $bf, $1f, $1f, $1f, $3f, $1f, $1f, $1f, $1f, $1f, $bf, $ff
		.db $7f, $1f, $1f, $bf, $ff, $1f, $1f, $ff, $7f, $bf, $bf, $1f, $ff, $1f, $7f, $ff
		.db $7f, $1f, $7f, $7f, $ff, $7f, $ff, $ff, $7f, $ff, $7f, $ff, $7f, $7f, $ff, $ff
		.db $7f, $1f, $1f, $ff, $1f, $7f, $3f, $ff, $7f, $1f
$ba67:  24 00		 BIT tmp0			; Temporary 0
$ba69:  00			BRK				 
$ba6a:  00			BRK				 
$ba6b:  00			BRK				 
ai_tbl_2:					 ; $ba6c
							  ; Data region
		.db $ff
$ba6d:  C0 80		 CPY #$80			
$ba6f:  40			RTI				 

; --------------------------------------------------
; AI table 3
; --------------------------------------------------
ai_tbl_3:					 ; $ba70
							  ; Data region
		.db $ff
$ba71:  C0 80		 CPY #$80			
$ba73:  40			RTI				 

; --------------------------------------------------
; Tactics spell data 1
; --------------------------------------------------
tact_sp_1:					 ; $ba74
$ba74:  10 10		 BPL $ba86		   
$ba76:  08			PHP				 
$ba77:  08			PHP				 
$ba78:  08			PHP				 
$ba79:  08			PHP				 
$ba7a:  08			PHP				 
$ba7b:  0E 0E 10	  ASL $100e		   
$ba7e:  10 10		 BPL $ba90		   
$ba80:  10 10		 BPL $ba92		   
$ba82:  10 10		 BPL $ba94		   
$ba84:  00			BRK				 
$ba85:  00			BRK				 
$ba86:  00			BRK				 
$ba87:  00			BRK				 
$ba88:  00			BRK				 
$ba89:  18			CLC				 
$ba8a:  18			CLC				 
$ba8b:  10 10		 BPL $ba9d		   
$ba8d:  10 10		 BPL $ba9f		   
$ba8f:  10 08		 BPL $ba99		   
$ba91:  08			PHP				 
$ba92:  08			PHP				 
$ba93:  08			PHP				 
$ba94:  08			PHP				 
$ba95:  08			PHP				 
$ba96:  08			PHP				 
$ba97:  10 10		 BPL $baa9		   
$ba99:  10 10		 BPL $baab		   
$ba9b:  08			PHP				 
$ba9c:  08			PHP				 
$ba9d:  08			PHP				 
							  ; Data region
		.db $0f
$ba9f:  0D 00 00	  ORA tmp0			; Temporary 0
$baa2:  10 00		 BPL $baa4		   
$baa4:  00			BRK				 
tact_sp_2:					 ; $baa5
$baa5:  0E 0E 0E	  ASL $0e0e		   
$baa8:  0E 0E 0E	  ASL $0e0e		   
$baab:  0E 08 08	  ASL $0808		   
$baae:  0E 0E 0E	  ASL $0e0e		   
$bab1:  0E 0E 10	  ASL $100e		   
$bab4:  10 10		 BPL $bac6		   
$bab6:  10 10		 BPL $bac8		   
$bab8:  10 10		 BPL $baca		   
$baba:  10 10		 BPL $bacc		   
$babc:  10 10		 BPL $bace		   
$babe:  10 10		 BPL $bad0		   
$bac0:  10 05		 BPL $bac7		   
$bac2:  05 10		 ORA ptr_lo		  ; General pointer low
$bac4:  10 10		 BPL $bad6		   
$bac6:  10 10		 BPL $bad8		   
$bac8:  10 10		 BPL $bada		   
$baca:  08			PHP				 
$bacb:  08			PHP				 
$bacc:  10 08		 BPL $bad6		   
$bace:  08			PHP				 
$bacf:  10 10		 BPL $bae1		   
$bad1:  10 10		 BPL $bae3		   
$bad3:  10 10		 BPL $bae5		   
tact_sp_3:					 ; $bad5
$bad5:  10 80		 BPL $ba57		   
							  ; Data region
		.db $64, $ff, $ff, $ff, $ff, $ff, $c8, $c8, $80, $80, $80, $80, $80, $c8, $b4, $ff
		.db $ff, $ff, $ff, $ff
$baeb:  00			BRK				 
$baec:  00			BRK				 
$baed:  00			BRK				 
$baee:  00			BRK				 
$baef:  00			BRK				 
$baf0:  00			BRK				 
$baf1:  00			BRK				 
							  ; Data region
		.db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
$bafb:  50 50		 BVC $bb4d		   
$bafd:  0A			ASL				 
							  ; Data region
		.db $64, $64, $c8, $c8, $ff, $ff, $ff, $ff, $ff
$bb07:  1E 1A 26	  ASL $261a,X		 
$bb0a:  26 0C		 ROL $0c			 
$bb0c:  0A			ASL				 
							  ; Data region
		.db $12
$bb0e:  0A			ASL				 
$bb0f:  00			BRK				 
$bb10:  00			BRK				 
$bb11:  00			BRK				 
$bb12:  00			BRK				 
$bb13:  1E 1A 26	  ASL $261a,X		 
$bb16:  26 0F		 ROL $0f			 
							  ; Data region
		.db $0f, $0f, $0f
$bb1b:  00			BRK				 
$bb1c:  00			BRK				 
$bb1d:  00			BRK				 
$bb1e:  00			BRK				 
$bb1f:  00			BRK				 
$bb20:  00			BRK				 
$bb21:  00			BRK				 
sp_bonus:					 ; $bb22
$bb22:  00			BRK				 
$bb23:  40			RTI				 
							  ; Data region
		.db $32
$bb25:  46 3C		 LSR $3c			 
$bb27:  16 16		 ASL $16,X		   
$bb29:  20 20 FF	  JSR $ff20		   
							  ; Data region
		.db $ff, $ff, $ff
$bb2f:  16 16		 ASL $16,X		   
$bb31:  4D 4D 4D	  EOR $4d4d		   
$bb34:  4D 4D 4D	  EOR $4d4d		   
$bb37:  00			BRK				 
$bb38:  00			BRK				 
$bb39:  00			BRK				 
$bb3a:  00			BRK				 
							  ; Data region
		.db $ff, $ff, $ff, $ff
sp_power:					 ; $bb3f
$bb3f:  55 64		 EOR $64,X		   
							  ; Data region
		.db $64
$bb42:  C0 C0		 CPY #$c0			
$bb44:  00			BRK				 
$bb45:  00			BRK				 
$bb46:  00			BRK				 
$bb47:  55 70		 EOR $70,X		   
sp_attr:					 ; $bb49
$bb49:  55 64		 EOR $64,X		   
							  ; Data region
		.db $64
$bb4c:  20 20 A0	  JSR $a020		   
$bb4f:  A0 A0		 LDY #$a0			
$bb51:  55 70		 EOR $70,X		   
							  ; Data region
		.db $04
$bb54:  0A			ASL				 
$bb55:  0A			ASL				 
$bb56:  01 08		 ORA ($08,X)		 
$bb58:  10 02		 BPL $bb5c		   
							  ; Data region
		.db $04
$bb5b:  08			PHP				 
$bb5c:  01 04		 ORA ($04,X)		 
$bb5e:  01 08		 ORA ($08,X)		 
$bb60:  01 02		 ORA ($02,X)		 
							  ; Data region
		.db $04
$bb63:  01 02		 ORA ($02,X)		 
$bb65:  01 08		 ORA ($08,X)		 
$bb67:  01 18		 ORA ($18,X)		 
$bb69:  20 20 18	  JSR $1820		   
$bb6c:  10 40		 BPL $bbae		   
$bb6e:  18			CLC				 
							  ; Data region
		.db $04, $08, $0c, $02, $03
$bb74:  10 03		 BPL $bb79		   
							  ; Data region
		.db $03
$bb77:  05 05		 ORA $05			 
$bb79:  01 02		 ORA ($02,X)		 
$bb7b:  10 02		 BPL $bb7f		   
$bb7d:  18			CLC				 
$bb7e:  28			PLP				 
$bb7f:  10 18		 BPL base_dmg		; -> Base damage value
$bb81:  20 FF 10	  JSR $10ff		   
atk_mult:					 ; $bb84
$bb84:  10 00		 BPL $bb86		   
$bb86:  10 10		 BPL $bb98		   
$bb88:  10 10		 BPL $bb9a		   
$bb8a:  10 10		 BPL $bb9c		   
$bb8c:  10 00		 BPL $bb8e		   
$bb8e:  10 00		 BPL $bb90		   
$bb90:  00			BRK				 
$bb91:  00			BRK				 
hit_thresh:					 ; $bb92
$bb92:  66 33		 ROR $33			 
$bb94:  8C 01 FF	  STY $ff01		   
$bb97:  01 A0		 ORA ($a0,X)		 
base_dmg:					 ; $bb99
$bb99:  40			RTI				 
							  ; Data region
		.db $80, $80, $80, $80, $80, $80, $80
$bba1:  C8			INY				 
$bba2:  C8			INY				 
$bba3:  C8			INY				 
$bba4:  C8			INY				 
$bba5:  C8			INY				 
$bba6:  C8			INY				 
$bba7:  C8			INY				 
							  ; Data region
		.db $64, $64, $64, $64, $64, $64, $64
$bbaf:  00			BRK				 
$bbb0:  00			BRK				 
$bbb1:  00			BRK				 
$bbb2:  00			BRK				 
$bbb3:  00			BRK				 
$bbb4:  00			BRK				 
$bbb5:  00			BRK				 
							  ; Data region
		.db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $80, $80, $80, $80, $80, $80, $80
$bbc4:  C8			INY				 
$bbc5:  C8			INY				 
$bbc6:  C8			INY				 
$bbc7:  C8			INY				 
$bbc8:  C8			INY				 
$bbc9:  C8			INY				 
$bbca:  C8			INY				 
$bbcb:  6C E1 44	  JMP ($44e1)		 
$bbce:  EE F0 FB	  INC $fbf0		   
$bbd1:  00			BRK				 
$bbd2:  FE D4 BC	  INC $bcd4,X		 
$bbd5:  FE 87 BC	  INC $bc87,X		 
$bbd8:  ED B3 EE	  SBC $eeb3		   
$bbdb:  F0 75		 BEQ $bc52		   
$bbdd:  8C 0B C0	  STY $c00b		   
$bbe0:  06 EE		 ASL $ee			 
$bbe2:  D0 2A		 BNE $bc0e		   
$bbe4:  E9 2A		 SBC #$2a			
$bbe6:  EE A0 2A	  INC $2aa0		   
$bbe9:  E9 2A		 SBC #$2a			
$bbeb:  EE 70 2A	  INC $2a70		   
$bbee:  E9 2A		 SBC #$2a			
$bbf0:  E8			INX				 
							  ; Data region
		.db $ff
$bbf2:  F9 E4 FB	  SBC $fbe4,Y		 
$bbf5:  00			BRK				 
$bbf6:  ED 00 FE	  SBC $fe00		   
							  ; Data region
		.db $87
$bbfa:  BC 77 98	  LDY $9877,X		 
$bbfd:  15 21		 ORA $21,X		   
$bbff:  25 77		 AND $77			 
$bc01:  A4 21		 LDY $21			 
$bc03:  6C 8C 0B	  JMP ($0b8c)		 
$bc06:  25 2C		 AND $2c			 
$bc08:  6C 06 25	  JMP ($2506)		 
							  ; Data region
		.db $77
$bc0c:  8C 04 B7	  STY $b704		   
							  ; Data region
		.db $0b
$bc10:  2C FB FE	  BIT $fefb		   
$bc13:  F9 E6 FB	  SBC $fbe6,Y		 
$bc16:  00			BRK				 
$bc17:  EE D0 65	  INC $65d0		   
$bc1a:  98			TYA				 
							  ; Data region
		.db $12, $fa
$bc1d:  08			PHP				 
							  ; Data region
		.db $fa
$bc1f:  E1 1A		 SBC ($1a,X)		 
$bc21:  ED FF EE	  SBC $eeff		   
$bc24:  D0 7C		 BNE $bca2		   
$bc26:  98			TYA				 
							  ; Data region
		.db $0c
$bc28:  26 2A		 ROL $2a			 
$bc2a:  6A			ROR				 
$bc2b:  A4 12		 LDY $12			 
							  ; Data region
		.db $7c
$bc2e:  8C 08 26	  STY $2608		   
$bc31:  2A			ROL				 
$bc32:  6A			ROR				 
$bc33:  98			TYA				 
							  ; Data region
		.db $0c, $7c
$bc36:  8C 08 26	  STY $2608		   
$bc39:  75 B0		 ADC $b0,X		   
$bc3b:  18			CLC				 
							  ; Data region
		.db $1f, $2f
$bc3e:  24 68		 BIT $68			 
$bc40:  98			TYA				 
							  ; Data region
		.db $0c
$bc42:  28			PLP				 
$bc43:  24 7A		 BIT action_ptr_hi   ; Action data pointer high
$bc45:  A4 12		 LDY $12			 
$bc47:  68			PLA				 
$bc48:  8C 08 28	  STY $2808		   
$bc4b:  24 7A		 BIT action_ptr_hi   ; Action data pointer high
$bc4d:  98			TYA				 
							  ; Data region
		.db $0c, $73
$bc50:  8C 08 1D	  STY $1d08		   
							  ; Data region
		.db $6f
$bc54:  B0 18		 BCS $bc6e		   
							  ; Data region
		.db $7a
$bc57:  C8			INY				 
$bc58:  24 76		 BIT $76			 
$bc5a:  98			TYA				 
							  ; Data region
		.db $0c
$bc5c:  70 B0		 BVS $bc0e		   
$bc5e:  18			CLC				 
$bc5f:  EE D0 ED	  INC $edd0		   
$bc62:  00			BRK				 
$bc63:  E1 44		 SBC ($44,X)		 
							  ; Data region
		.db $fb
$bc66:  00			BRK				 
$bc67:  FE 74 BC	  INC $bc74,X		 
							  ; Data region
		.db $fb
$bc6b:  01 FE		 ORA ($fe,X)		 
							  ; Data region
		.db $74
$bc6e:  BC F9 F4	  LDY $f4f9,X		 
$bc71:  FE CE BB	  INC $bbce,X		 
$bc74:  70 86		 BVS $bbfc		   
							  ; Data region
		.db $04
$bc77:  25 25		 AND $25			 
$bc79:  25 49		 AND $49			 
$bc7b:  25 49		 AND $49			 
$bc7d:  49 25		 EOR #$25			
$bc7f:  49 49		 EOR #$49			
$bc81:  25 94		 AND $94			 
$bc83:  8C 0C 25	  STY $250c		   
$bc86:  FD EE D0	  SBC $d0ee,X		 
$bc89:  65 98		 ADC $98			 
							  ; Data region
		.db $0c, $fa
$bc8d:  08			PHP				 
							  ; Data region
		.db $fa
$bc8f:  EE F0 7C	  INC $7cf0		   
$bc92:  98			TYA				 
$bc93:  15 26		 ORA $26,X		   
$bc95:  2A			ROL				 
$bc96:  6A			ROR				 
$bc97:  A4 21		 LDY $21			 
$bc99:  EE D0 7C	  INC $7cd0		   
$bc9c:  8C 0B 26	  STY $260b		   
$bc9f:  2A			ROL				 
$bca0:  EE F0 6A	  INC $6af0		   
$bca3:  98			TYA				 
$bca4:  15 7C		 ORA $7c,X		   
$bca6:  8C 0B 26	  STY $260b		   
$bca9:  F9 E4 75	  SBC $75e4,Y		 
$bcac:  98			TYA				 
$bcad:  15 1F		 ORA $1f,X		   
							  ; Data region
		.db $23, $63
$bcb1:  A4 21		 LDY $21			 
$bcb3:  75 8C		 ADC $8c,X		   
							  ; Data region
		.db $0b, $1f, $23, $63
$bcb9:  98			TYA				 
$bcba:  15 6E		 ORA $6e,X		   
$bcbc:  8C 0B 2A	  STY $2a0b		   
							  ; Data region
		.db $7c
$bcc0:  98			TYA				 
$bcc1:  15 26		 ORA $26,X		   
$bcc3:  2A			ROL				 
$bcc4:  6A			ROR				 
$bcc5:  A4 21		 LDY $21			 
							  ; Data region
		.db $7c
$bcc8:  8C 0B 26	  STY $260b		   
$bccb:  2A			ROL				 
$bccc:  6A			ROR				 
$bccd:  98			TYA				 
$bcce:  15 7C		 ORA $7c,X		   
$bcd0:  8C 0B 26	  STY $260b		   
$bcd3:  FD 7F 86	  SBC $867f,X		 
							  ; Data region
		.db $04
$bcd7:  30 49		 BMI $bd22		   
$bcd9:  2C 28 49	  BIT $4928		   
$bcdc:  24 20		 BIT $20			 
$bcde:  49 1C		 EOR #$1c			
$bce0:  18			CLC				 
$bce1:  49 14		 EOR #$14			
$bce3:  49 66		 EOR #$66			
$bce5:  8C 0C FB	  STY $fb0c		   
$bce8:  00			BRK				 
$bce9:  FD E1 3E	  SBC $3ee1,X		 
$bcec:  EE F0 F7	  INC $f7f0		   
							  ; Data region
		.db $fb
$bcf0:  F8			SED				 
$bcf1:  FE D4 BC	  INC $bcd4,X		 
$bcf4:  F8			SED				 
							  ; Data region
		.db $52
$bcf6:  86 03		 STX tmp3			; Temporary 3
$bcf8:  FE CF BD	  INC $bdcf,X		 
$bcfb:  FE CC BD	  INC $bdcc,X		 
							  ; Data region
		.db $fa
$bcff:  05 FA		 ORA $fa			 
							  ; Data region
		.db $57
$bd02:  86 03		 STX tmp3			; Temporary 3
							  ; Data region
		.db $fb
$bd05:  05 FE		 ORA $fe			 
							  ; Data region
		.db $cf
$bd08:  BD FE CC	  LDA $ccfe,X		 
$bd0b:  BD FB 00	  LDA $00fb,X		 
							  ; Data region
		.db $52
$bd0f:  86 03		 STX tmp3			; Temporary 3
$bd11:  FE CF BD	  INC $bdcf,X		 
$bd14:  FE CC BD	  INC $bdcc,X		 
$bd17:  ED B3 F7	  SBC $f7b3		   
$bd1a:  EE F0 15	  INC $15f0		   
$bd1d:  EE D0 1F	  INC $1fd0		   
$bd20:  E9 15		 SBC #$15			
$bd22:  EE 90 1F	  INC $1f90		   
$bd25:  EE 70 15	  INC $1570		   
$bd28:  EE 50 1F	  INC $1f50		   
$bd2b:  E9 15		 SBC #$15			
$bd2d:  E9 1F		 SBC #$1f			
$bd2f:  E8			INX				 
							  ; Data region
		.db $ff
$bd31:  F9 E4 FB	  SBC $fbe4,Y		 
$bd34:  00			BRK				 
$bd35:  ED 00 F8	  SBC $f800		   
$bd38:  EE F0 52	  INC $52f0		   
$bd3b:  86 03		 STX tmp3			; Temporary 3
$bd3d:  FE CF BD	  INC $bdcf,X		 
$bd40:  FE CC BD	  INC $bdcc,X		 
							  ; Data region
		.db $fa
$bd44:  05 FA		 ORA $fa			 
							  ; Data region
		.db $57
$bd47:  86 03		 STX tmp3			; Temporary 3
							  ; Data region
		.db $fb
$bd4a:  05 FE		 ORA $fe			 
							  ; Data region
		.db $cf
$bd4d:  BD FE CC	  LDA $ccfe,X		 
$bd50:  BD FB 00	  LDA $00fb,X		 
							  ; Data region
		.db $52
$bd54:  86 03		 STX tmp3			; Temporary 3
$bd56:  FE CF BD	  INC $bdcf,X		 
$bd59:  FE CC BD	  INC $bdcc,X		 
$bd5c:  59 86 03	  EOR $0386,Y		 
							  ; Data region
		.db $fb, $07
$bd61:  FE CF BD	  INC $bdcf,X		 
$bd64:  FE CC BD	  INC $bdcc,X		 
							  ; Data region
		.db $fb
$bd68:  05 52		 ORA $52			 
$bd6a:  86 03		 STX tmp3			; Temporary 3
$bd6c:  FE CF BD	  INC $bdcf,X		 
$bd6f:  FE CC BD	  INC $bdcc,X		 
							  ; Data region
		.db $fb
$bd73:  00			BRK				 
							  ; Data region
		.db $52
$bd75:  86 03		 STX tmp3			; Temporary 3
$bd77:  FE CF BD	  INC $bdcf,X		 
$bd7a:  FE CC BD	  INC $bdcc,X		 
$bd7d:  95 0C		 STA $0c,X		   
$bd7f:  94 54		 STY $54,X		   
$bd81:  94 60		 STY $60,X		   
							  ; Data region
		.db $53
$bd84:  98			TYA				 
$bd85:  15 13		 ORA $13,X		   
							  ; Data region
		.db $0f
$bd88:  65 A4		 ADC $a4			 
$bd8a:  21 53		 AND ($53,X)		 
$bd8c:  8C 0B 13	  STY $130b		   
							  ; Data region
		.db $0f
$bd90:  65 98		 ADC $98			 
$bd92:  15 5E		 ORA $5e,X		   
$bd94:  8C 0B 08	  STY $080b		   
							  ; Data region
		.db $64
$bd98:  B0 2D		 BCS $bdc7		   
$bd9a:  0E 12 52	  ASL $5212		   
$bd9d:  C8			INY				 
$bd9e:  45 58		 EOR $58			 
$bda0:  98			TYA				 
$bda1:  15 1A		 ORA $1a,X		   
							  ; Data region
		.db $57
$bda4:  B0 2D		 BCS $bdd3		   
							  ; Data region
		.db $12
$bda7:  5E 98 15	  LSR $1598,X		 
							  ; Data region
		.db $f7
$bdab:  EE D0 FB	  INC $fbd0		   
$bdae:  00			BRK				 
$bdaf:  FE BD BD	  INC $bdbd,X		 
							  ; Data region
		.db $fb
$bdb3:  01 FE		 ORA ($fe,X)		 
$bdb5:  BD BD F9	  LDA $f9bd,X		 
							  ; Data region
		.db $f4
$bdb9:  F8			SED				 
$bdba:  FE EA BC	  INC $bcea,X		 
							  ; Data region
		.db $13, $17, $13, $17
$bdc1:  49 13		 EOR #$13			
$bdc3:  49 49		 EOR #$49			
							  ; Data region
		.db $17
$bdc6:  49 49		 EOR #$49			
							  ; Data region
		.db $13
$bdc9:  49 17		 EOR #$17			
$bdcb:  FD 95 86	  SBC $8695,X		 
							  ; Data region
		.db $03, $54
$bdd0:  86 03		 STX tmp3			; Temporary 3
$bdd2:  09 07		 ORA #$07			
$bdd4:  09 49		 ORA #$49			
							  ; Data region
		.db $07
$bdd7:  09 49		 ORA #$49			
							  ; Data region
		.db $07
$bdda:  09 49		 ORA #$49			
							  ; Data region
		.db $07, $54
$bdde:  8C 0A 52	  STY $520a		   
$bde1:  06 FD		 ASL $fd			 
							  ; Data region
		.db $f7, $fb, $07
$bde6:  FE D4 BC	  INC $bcd4,X		 
$bde9:  F8			SED				 
$bdea:  FE 69 BE	  INC $be69,X		 
							  ; Data region
		.db $73
$bdee:  8C 0C C6	  STY $c60c		   
$bdf1:  09 BE		 ORA #$be			
							  ; Data region
		.db $07
$bdf4:  C6 05		 DEC $05			 
$bdf6:  BE 03 C6	  LDX $c603,Y		 
							  ; Data region
		.db $03
$bdfa:  BE 02 C6	  LDX $c602,Y		 
							  ; Data region
		.db $02
$bdfe:  BC 0C C6	  LDY $c60c,X		 
$be01:  09 BC		 ORA #$bc			
							  ; Data region
		.db $07
$be04:  C6 05		 DEC $05			 
$be06:  BC 03 C6	  LDY $c603,X		 
							  ; Data region
		.db $03
$be0a:  BC 02 C6	  LDY $c602,X		 
							  ; Data region
		.db $02
$be0e:  FE 69 BE	  INC $be69,X		 
$be11:  6C 86 03	  JMP ($0386)		 
$be14:  2A			ROL				 
							  ; Data region
		.db $fa
$be16:  10 F9		 BPL $be11		   
							  ; Data region
		.db $1f
$be19:  28			PLP				 
							  ; Data region
		.db $fa
$be1b:  10 FB		 BPL $be18		   
$be1d:  6E 98 15	  ROR $1598		   
							  ; Data region
		.db $fa
$be21:  08			PHP				 
							  ; Data region
		.db $fa
$be23:  6E 0C 94	  ROR $940c		   
							  ; Data region
		.db $54
$be27:  94 60		 STY $60,X		   
$be29:  49 49		 EOR #$49			
$be2b:  49 94		 EOR #$94			
$be2d:  30 7C		 BMI $beab		   
$be2f:  98			TYA				 
$be30:  15 26		 ORA $26,X		   
$be32:  2A			ROL				 
$be33:  6A			ROR				 
$be34:  A4 21		 LDY $21			 
							  ; Data region
		.db $7c
$be37:  8C 09 26	  STY $2609		   
$be3a:  2A			ROL				 
$be3b:  6A			ROR				 
$be3c:  98			TYA				 
$be3d:  15 7C		 ORA $7c,X		   
$be3f:  8C 09 71	  STY $7109		   
$be42:  98			TYA				 
$be43:  15 6A		 ORA $6a,X		   
$be45:  8C 09 26	  STY $2609		   
$be48:  31 F7		 AND ($f7),Y		 
							  ; Data region
		.db $fb
$be4b:  00			BRK				 
$be4c:  FE 5A BE	  INC $be5a,X		 
							  ; Data region
		.db $fb
$be50:  01 FE		 ORA ($fe,X)		 
							  ; Data region
		.db $5a
$be53:  BE F9 F4	  LDX $f4f9,Y		 
$be56:  F8			SED				 
$be57:  FE E3 BD	  INC $bde3,X		 
$be5a:  28			PLP				 
$be5b:  2D 28 2D	  AND $2d28		   
$be5e:  49 28		 EOR #$28			
$be60:  49 49		 EOR #$49			
$be62:  2D 49 49	  AND $4949		   
$be65:  28			PLP				 
$be66:  49 2D		 EOR #$2d			
$be68:  FD 6E 98	  SBC $986e,X		 
							  ; Data region
		.db $0c, $fa
$be6d:  08			PHP				 
							  ; Data region
		.db $fa
$be6f:  6E 86 03	  ROR $0386		   
$be72:  26 FA		 ROL $fa			 
$be74:  20 F9 1F	  JSR $1ff9		   
$be77:  28			PLP				 
							  ; Data region
		.db $fa
$be79:  10 FB		 BPL $be76		   
							  ; Data region
		.db $23
$be7c:  26 FA		 ROL $fa			 
$be7e:  10 FB		 BPL $be7b		   
$be80:  FD E1 1C	  SBC $1ce1,X		 
$be83:  EE F0 4D	  INC $4df0		   
$be86:  98			TYA				 
$be87:  60			RTS				 
							  ; Data region
		.db $02, $02, $02
$be8b:  4D 98 60	  EOR $6098		   
							  ; Data region
		.db $fa
$be8f:  28			PLP				 
							  ; Data region
		.db $fa
$be91:  94 60		 STY $60,X		   
$be93:  49 4D		 EOR #$4d			
$be95:  18			CLC				 
							  ; Data region
		.db $fa
$be97:  41 FB		 EOR ($fb,X)		 
$be99:  94 48		 STY $48,X		   
$be9b:  94 60		 STY $60,X		   
							  ; Data region
		.db $fa, $07, $fb
$bea0:  4D 18 FA	  EOR $fa18		   
$bea3:  10 FB		 BPL $bea0		   
$bea5:  FE 8B BE	  INC $be8b,X		 
$bea8:  96 E1		 STX $e1,Y		   
$beaa:  3E 73 06	  ROL $0673,X		 
$bead:  4A			LSR				 
$beae:  4A			LSR				 
$beaf:  29 28		 AND #$28			
$beb1:  4A			LSR				 
$beb2:  4A			LSR				 
$beb3:  29 26		 AND #$26			
$beb5:  49 49		 EOR #$49			
$beb7:  49 76		 EOR #$76			
$beb9:  2A			ROL				 
$beba:  78			SEI				 
$bebb:  06 76		 ASL $76			 
$bebd:  18			CLC				 
$bebe:  95 12		 STA $12,X		   
$bec0:  78			SEI				 
$bec1:  06 76		 ASL $76			 
$bec3:  18			CLC				 
$bec4:  95 08		 STA $08,X		   
$bec6:  4A			LSR				 
$bec7:  2D 2B 4A	  AND $4a2b		   
$beca:  2D 2E 30	  AND $302e		   
$becd:  2E 2D 2B	  ROL $2b2d		   
$bed0:  29 28		 AND #$28			
$bed2:  26 24		 ROL $24			 
							  ; Data region
		.db $22
$bed5:  21 1F		 AND ($1f,X)		 
$bed7:  1D 1C 1A	  ORA $1a1c,X		 
$beda:  18			CLC				 
$bedb:  16 15		 ASL $15,X		   
$bedd:  F9 CC 5E	  SBC $5ecc,Y		 
$bee0:  98			TYA				 
$bee1:  08			PHP				 
$bee2:  94 48		 STY $48,X		   
$bee4:  94 60		 STY $60,X		   
$bee6:  78			SEI				 
$bee7:  B0 00		 BCS $bee9		   
							  ; Data region
		.db $2b
$beea:  78			SEI				 
$beeb:  06 4A		 ASL $4a			 
$beed:  4A			LSR				 
							  ; Data region
		.db $2b, $7b
$bef0:  18			CLC				 
$bef1:  2D 73 06	  AND $0673		   
$bef4:  4A			LSR				 
$bef5:  4A			LSR				 
$bef6:  29 76		 AND #$76			
$bef8:  30 26		 BMI $bf20		   
							  ; Data region
		.db $73
$befb:  06 4A		 ASL $4a			 
$befd:  4A			LSR				 
$befe:  26 76		 ROL $76			 
$bf00:  18			CLC				 
$bf01:  28			PLP				 
							  ; Data region
		.db $6f
$bf03:  06 4A		 ASL $4a			 
$bf05:  4A			LSR				 
$bf06:  28			PLP				 
$bf07:  71 30		 ADC ($30),Y		 
$bf09:  21 71		 AND ($71,X)		 
$bf0b:  06 4A		 ASL $4a			 
$bf0d:  4A			LSR				 
$bf0e:  24 78		 BIT $78			 
$bf10:  18			CLC				 
$bf11:  24 73		 BIT $73			 
$bf13:  06 4A		 ASL $4a			 
$bf15:  4A			LSR				 
$bf16:  24 6C		 BIT $6c			 
$bf18:  30 28		 BMI $bf42		   
$bf1a:  78			SEI				 
$bf1b:  60			RTS				 
$bf1c:  F9 C8 FE	  SBC $fec8,Y		 
$bf1f:  A9 BE		 LDA #$be			
$bf21:  E1 3E		 SBC ($3e,X)		 
$bf23:  EE E0 94	  INC $94e0		   
$bf26:  98			TYA				 
$bf27:  00			BRK				 
							  ; Data region
		.db $1a
$bf29:  49 1B		 EOR #$1b			
$bf2b:  49 1C		 EOR #$1c			
$bf2d:  49 1D		 EOR #$1d			
$bf2f:  49 1C		 EOR #$1c			
$bf31:  B1 06		 LDA ($06),Y		 
$bf33:  49 18		 EOR #$18			
							  ; Data region
		.db $13
$bf36:  15 10		 ORA $10,X		   
$bf38:  F9 EB 94	  SBC $94eb,Y		 
$bf3b:  18			CLC				 
$bf3c:  26 FA		 ROL $fa			 
							  ; Data region
		.db $07, $fc
$bf40:  26 26		 ROL $26			 
$bf42:  26 26		 ROL $26			 
$bf44:  25 25		 AND $25			 
$bf46:  25 25		 AND $25			 
$bf48:  24 24		 BIT $24			 
							  ; Data region
		.db $23, $23, $22, $22
$bf4e:  21 21		 AND ($21,X)		 
$bf50:  20 20 1F	  JSR $1f20		   
							  ; Data region
		.db $1f
$bf54:  1E 1E 1D	  ASL $1d1e,X		 
$bf57:  1D 1C 1C	  ORA $1c1c,X		 
							  ; Data region
		.db $1c, $1c, $1c, $1c, $1c, $1c
$bf60:  F9 DE FE	  SBC $fede,Y		 
$bf63:  21 BF		 AND ($bf,X)		 
$bf65:  FE 96 BF	  INC $bf96,X		 
$bf68:  FE 96 BF	  INC $bf96,X		 
							  ; Data region
		.db $df
$bf6c:  05 2E		 ORA $2e			 
							  ; Data region
		.db $fa, $07, $fc
$bf71:  2E 2E 2E	  ROL $2e2e		   
$bf74:  2E 2E 2E	  ROL $2e2e		   
$bf77:  2E 2E 2D	  ROL $2d2e		   
$bf7a:  2D 2C 2C	  AND $2c2c		   
							  ; Data region
		.db $2b, $2b
$bf7f:  2A			ROL				 
$bf80:  2A			ROL				 
$bf81:  29 29		 AND #$29			
$bf83:  28			PLP				 
$bf84:  28			PLP				 
							  ; Data region
		.db $27, $27
$bf87:  26 26		 ROL $26			 
$bf89:  26 26		 ROL $26			 
$bf8b:  25 25		 AND $25			 
							  ; Data region
		.db $23, $23
$bf8f:  25 25		 AND $25			 
$bf91:  F9 DE FE	  SBC $fede,Y		 
$bf94:  65 BF		 ADC $bf			 
$bf96:  6A			ROR				 
$bf97:  98			TYA				 
$bf98:  08			PHP				 
$bf99:  B8			CLV				 
$bf9a:  0E FA 05	  ASL $05fa		   
$bf9d:  F8			SED				 
$bf9e:  B5 08		 LDA $08,X		   
$bfa0:  49 B7		 EOR #$b7			
$bfa2:  06 1B		 ASL $1b			 
							  ; Data region
		.db $1a, $15, $fd, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
		.db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
		.db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
		.db $ff, $ff, $ff, $ff
$bfd8:  78			SEI				 
$bfd9:  EE DF BF	  INC $bfdf		   
$bfdc:  4C 8E FF	  JMP $ff8e		   
							  ; Data region
		.db $80
$bfe0:  20 44 52	  JSR $5244		   
$bfe3:  41 47		 EOR ($47,X)		 
							  ; Data region
		.db $4f
$bfe6:  4E 20 51	  LSR $5120		   
$bfe9:  55 45		 EOR $45,X		   
							  ; Data region
		.db $53, $54
$bfed:  20 49 56	  JSR $5649		   
$bff0:  00			BRK				 
$bff1:  00			BRK				 
$bff2:  00			BRK				 
$bff3:  00			BRK				 
$bff4:  48			PHA				 
							  ; Data region
		.db $04
$bff6:  01 0E		 ORA ($0e,X)		 
							  ; Data region
		.db $07, $9e
$bffa:  D8			CLD				 
							  ; Data region
		.db $bf
$bffc:  D8			CLD				 
							  ; Data region
		.db $bf, $d8, $bf
