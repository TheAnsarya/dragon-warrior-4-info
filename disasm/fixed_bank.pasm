; Dragon Warrior IV (NES) - Fixed Bank Disassembly
; ================================================
; PRG-ROM: 512KB (32 x 16KB banks)
; Fixed banks: $c000-$ffff (last 16KB)
;
; CPU Vectors:
;   NMI:   $0502 (RAM - jumps to $c15a on init)
;   RESET: $ffd8
;   IRQ:   $c408
;

; ============================================
; Hardware Registers
; ============================================
PPUCTRL	= $2000
PPUMASK	= $2001
PPUSTATUS  = $2002
OAMADDR	= $2003
OAMDATA	= $2004
PPUSCROLL  = $2005
PPUADDR	= $2006
PPUDATA	= $2007
OAMDMA	 = $4014
APU_STATUS = $4015
JOY1	   = $4016
JOY2	   = $4017

; ============================================
; RAM Variables
; ============================================
MapNumber	 = $63
SubmapNumber  = $64
vblank_flag   = $0500
ppuctrl_shad  = $0501
NMI_JMP	   = $0502
NMI_target_lo = $0503
NMI_target_hi = $0504
current_bank  = $0507

; ============================================
; RESET HANDLER ($ffd8)
; ============================================

RESET_entry:
$ffd8:  SEI	; Entry point from RESET vector
$ffd9:  INC  $ffdf
$ffdc:  JMP  main_init
$ffdf:  .db $80
$ffe0:  .db $44
$ffe1:  .db $52
$ffe2:  EOR  ($47,X)
$ffe4:  .db $4f
$ffe5:  LSR  $5120
$ffe8:  EOR  $45,X
$ffea:  .db $53
$ffeb:  .db $54
$ffec:  JSR  sub_5649
$ffef:  JSR  sub_FFFF
$fff2:  BRK  
$fff3:  BRK  
$fff4:  PHA  
$fff5:  .db $04
$fff6:  ORA  ($0f,X)
$fff8:  .db $07
$fff9:  STA  NMI_JMP,X

; ============================================
; VECTORS ($fffa-$ffff)
; ============================================
  .dw $0502  ; NMI
  .dw $ffd8  ; RESET
  .dw $c408  ; IRQ

; ============================================
; MAIN INIT ($c03d)
; ============================================

main_init:
$c03d:  CLD	; Main initialization routine

loc_C03E:
$c03e:  LDA  PPUSTATUS
$c041:  BPL  loc_C03E

loc_C043:
$c043:  LDA  PPUSTATUS
$c046:  BPL  loc_C043
$c048:  NOP  
$c049:  NOP  
$c04a:  NOP  
$c04b:  NOP  
$c04c:  NOP  
$c04d:  NOP  
$c04e:  LDA  #$10
$c050:  STA  PPUCTRL
$c053:  LDA  #$00
$c055:  STA  PPUMASK
$c058:  STA  sub_FFFF
$c05b:  STA  sub_FFFF
$c05e:  STA  sub_FFFF
$c061:  STA  sub_FFFF
$c064:  STA  sub_FFFF
$c067:  LDA  #$4c  ; Set up NMI jump instruction in RAM
$c069:  STA  NMI_JMP
$c06c:  LDA  $c0d2
$c06f:  STA  NMI_target_lo
$c072:  LDA  $c0d3
$c075:  STA  NMI_target_hi
$c078:  LDX  #$ff  ; Initialize stack pointer
$c07a:  TXS  
$c07b:  LDA  #$00
$c07d:  TAX  

loc_C07E:
$c07e:  STA  $00,X  ; Clear zero page and RAM
$c080:  STA  $0300,X
$c083:  STA  $0400,X
$c086:  STA  $0505,X
$c089:  STA  $0600,X
$c08c:  STA  $0700,X
$c08f:  INX  
$c090:  BNE  loc_C07E
$c092:  LDA  #$0e
$c094:  STA  vblank_flag
$c097:  LDA  #$10
$c099:  STA  ppuctrl_shadow
$c09c:  STA  $39
$c09e:  JSR  init_subroutine
$c0a1:  LDA  PPUSTATUS
$c0a4:  LDA  #$10
$c0a6:  STA  PPUADDR
$c0a9:  LDA  #$00
$c0ab:  STA  PPUADDR
$c0ae:  LDX  #$10

loc_C0B0:
$c0b0:  STA  PPUDATA
$c0b3:  DEX  
$c0b4:  BNE  loc_C0B0
$c0b6:  LDA  #$90
$c0b8:  STA  $0505
$c0bb:  STA  PPUCTRL
$c0be:  JSR  sub_C569
$c0c1:  JSR  clear_oam_buffer
$c0c4:  JSR  wait_vblank
$c0c7:  LDA  #$18
$c0c9:  STA  $0506
$c0cc:  STA  PPUMASK
$c0cf:  JMP  main_loop_entry
$c0d2:  .db $5a
$c0d3:  CMP  ($ad,X)
$c0d5:  .db $02
$c0d6:  JSR  sub_FB10

loc_C0D9:
$c0d9:  LDA  PPUSTATUS
$c0dc:  BMI  loc_C0D9

loc_C0DE:
$c0de:  LDA  PPUSTATUS
$c0e1:  BPL  loc_C0DE

loc_C0E3:
$c0e3:  LDA  PPUSTATUS
$c0e6:  BMI  loc_C0E3
$c0e8:  RTS  
$c0e9:  LDA  #$40
$c0eb:  STA  NMI_JMP
$c0ee:  LDA  #$00
$c0f0:  STA  sub_FFFF
$c0f3:  STA  sub_FFFF
$c0f6:  STA  sub_FFFF
$c0f9:  STA  sub_FFFF
$c0fc:  LDA  #$01
$c0fe:  STA  sub_FFFF

loc_C101:
$c101:  JMP  loc_C101

init_subroutine:
$c104:  INC  $ffdf
$c107:  LDA  vblank_flag
$c10a:  JSR  mmc1_write_control
$c10d:  LDA  ppuctrl_shadow
$c110:  JSR  mmc1_write_chr1
$c113:  LDA  #$00
$c115:  JMP  mmc1_write_prg

mmc1_write_control:
$c118:  STA  vblank_flag
$c11b:  STA  $9fff
$c11e:  LSR  A
$c11f:  STA  $9fff
$c122:  LSR  A
$c123:  STA  $9fff
$c126:  LSR  A
$c127:  STA  $9fff
$c12a:  LSR  A
$c12b:  STA  $9fff
$c12e:  RTS  

mmc1_write_chr1:
$c12f:  STA  ppuctrl_shadow
$c132:  STA  $bfff
$c135:  LSR  A
$c136:  STA  $bfff
$c139:  LSR  A
$c13a:  STA  $bfff
$c13d:  LSR  A
$c13e:  STA  $bfff
$c141:  LSR  A
$c142:  STA  $bfff
$c145:  RTS  

mmc1_write_prg:
$c146:  STA  $dfff
$c149:  LSR  A
$c14a:  STA  $dfff
$c14d:  LSR  A
$c14e:  STA  $dfff
$c151:  LSR  A
$c152:  STA  $dfff
$c155:  LSR  A
$c156:  STA  $dfff
$c159:  RTS  

NMI_main:
$c15a:  PHA  
$c15b:  TXA  
$c15c:  PHA  
$c15d:  TYA  
$c15e:  PHA  
$c15f:  LDA  $1f
$c161:  BMI  loc_C181
$c163:  TSX  
$c164:  LDY  $0106,X
$c167:  INY  
$c168:  BNE  loc_C181
$c16a:  LDA  $0105,X
$c16d:  CMP  #$77
$c16f:  BCC  loc_C181
$c171:  CMP  #$81
$c173:  BCS  loc_C181
$c175:  LDA  PPUSTATUS
$c178:  JSR  ppu_buffer_transfer
$c17b:  JSR  oam_dma
$c17e:  JSR  ppu_set_scroll

loc_C181:
$c181:  TSX  
$c182:  LDY  $0106,X
$c185:  INY  
$c186:  BNE  loc_C19B
$c188:  LDA  $0105,X
$c18b:  CMP  #$ab
$c18d:  BCC  loc_C19B
$c18f:  CMP  #$d6
$c191:  BCS  loc_C19B
$c193:  LDA  #$d6
$c195:  STA  $0105,X
$c198:  JSR  init_subroutine

loc_C19B:
$c19b:  LDA  $0519
$c19e:  BNE  loc_C1B0
$c1a0:  INC  $c221
$c1a3:  LDA  #$10
$c1a5:  JSR  mmc1_write_chr1
$c1a8:  LDA  #$10
$c1aa:  JSR  mmc1_write_chr1
$c1ad:  JSR  sub_C019

loc_C1B0:
$c1b0:  LDA  current_bank
$c1b3:  JSR  bank_switch
$c1b6:  NOP  
$c1b7:  NOP  
$c1b8:  NOP  
$c1b9:  NOP  
$c1ba:  NOP  
$c1bb:  NOP  
$c1bc:  NOP  
$c1bd:  TSX  
$c1be:  LDA  $0106,X
$c1c1:  CMP  #$6c
$c1c3:  BNE  loc_C1EF
$c1c5:  LDA  $0105,X
$c1c8:  CMP  #$b9
$c1ca:  BCC  loc_C1DD
$c1cc:  CMP  #$d6
$c1ce:  BCS  loc_C1DD
$c1d0:  LDA  #$d6
$c1d2:  STA  $0105,X
$c1d5:  LDA  #$00
$c1d7:  JSR  mmc1_write_chr1
$c1da:  JMP  loc_C1EF

loc_C1DD:
$c1dd:  CMP  #$e9
$c1df:  BCC  loc_C1EF
$c1e1:  CMP  #$ff
$c1e3:  BCS  loc_C1EF
$c1e5:  LDA  #$ff
$c1e7:  STA  $0105,X
$c1ea:  LDA  #$10
$c1ec:  JSR  mmc1_write_chr1

loc_C1EF:
$c1ef:  INC  $050c
$c1f2:  TSX  
$c1f3:  LDA  $0105,X
$c1f6:  STA  $10
$c1f8:  LDA  $0106,X
$c1fb:  STA  $11
$c1fd:  LDY  #$00
$c1ff:  LDA  ($10),Y

; ============================================
; NMI HANDLER ($c15a)
; ============================================

NMI_main:
$c15a:  PHA  
$c15b:  TXA  
$c15c:  PHA  
$c15d:  TYA  
$c15e:  PHA  
$c15f:  LDA  $1f
$c161:  BMI  loc_C181
$c163:  TSX  
$c164:  LDY  $0106,X
$c167:  INY  
$c168:  BNE  loc_C181
$c16a:  LDA  $0105,X
$c16d:  CMP  #$77
$c16f:  BCC  loc_C181
$c171:  CMP  #$81
$c173:  BCS  loc_C181
$c175:  LDA  PPUSTATUS
$c178:  JSR  ppu_buffer_transfer
$c17b:  JSR  oam_dma
$c17e:  JSR  ppu_set_scroll

loc_C181:
$c181:  TSX  
$c182:  LDY  $0106,X
$c185:  INY  
$c186:  BNE  loc_C19B
$c188:  LDA  $0105,X
$c18b:  CMP  #$ab
$c18d:  BCC  loc_C19B
$c18f:  CMP  #$d6
$c191:  BCS  loc_C19B
$c193:  LDA  #$d6
$c195:  STA  $0105,X
$c198:  JSR  init_subroutine

loc_C19B:
$c19b:  LDA  $0519
$c19e:  BNE  loc_C1B0
$c1a0:  INC  $c221
$c1a3:  LDA  #$10
$c1a5:  JSR  mmc1_write_chr1
$c1a8:  LDA  #$10
$c1aa:  JSR  mmc1_write_chr1
$c1ad:  JSR  sub_C019

loc_C1B0:
$c1b0:  LDA  current_bank
$c1b3:  JSR  bank_switch
$c1b6:  NOP  
$c1b7:  NOP  
$c1b8:  NOP  
$c1b9:  NOP  
$c1ba:  NOP  
$c1bb:  NOP  
$c1bc:  NOP  
$c1bd:  TSX  
$c1be:  LDA  $0106,X
$c1c1:  CMP  #$6c
$c1c3:  BNE  loc_C1EF
$c1c5:  LDA  $0105,X
$c1c8:  CMP  #$b9
$c1ca:  BCC  loc_C1DD
$c1cc:  CMP  #$d6
$c1ce:  BCS  loc_C1DD
$c1d0:  LDA  #$d6
$c1d2:  STA  $0105,X
$c1d5:  LDA  #$00
$c1d7:  JSR  mmc1_write_chr1
$c1da:  JMP  loc_C1EF

loc_C1DD:
$c1dd:  CMP  #$e9
$c1df:  BCC  loc_C1EF
$c1e1:  CMP  #$ff
$c1e3:  BCS  loc_C1EF
$c1e5:  LDA  #$ff
$c1e7:  STA  $0105,X
$c1ea:  LDA  #$10
$c1ec:  JSR  mmc1_write_chr1

loc_C1EF:
$c1ef:  INC  $050c
$c1f2:  TSX  
$c1f3:  LDA  $0105,X
$c1f6:  STA  $10
$c1f8:  LDA  $0106,X
$c1fb:  STA  $11
$c1fd:  LDY  #$00
$c1ff:  LDA  ($10),Y
$c201:  AND  #$0f
$c203:  CMP  #$07
$c205:  BEQ  loc_C219
$c207:  CMP  #$0f
$c209:  BEQ  loc_C219
$c20b:  CMP  #$03
$c20d:  BEQ  loc_C219
$c20f:  CMP  #$0b
$c211:  BEQ  loc_C219
$c213:  PLA  
$c214:  TAY  
$c215:  PLA  
$c216:  TAX  
$c217:  PLA  
$c218:  RTI  

loc_C219:
$c219:  PLA  
$c21a:  TAY  
$c21b:  PLA  
$c21c:  TAX  
$c21d:  PLA  
$c21e:  JMP  IRQ_handler
$c221:  .db $80

ppu_buffer_transfer:
$c222:  LDA  $1f
$c224:  AND  #$20
$c226:  BNE  loc_C23A
$c228:  LDA  $1f
$c22a:  AND  #$10
$c22c:  BEQ  loc_C231
$c22e:  JMP  loc_C297

loc_C231:
$c231:  LDA  $1f
$c233:  AND  #$04
$c235:  BEQ  loc_C276
$c237:  JMP  loc_C315

loc_C23A:
$c23a:  LDX  #$00
$c23c:  LDA  $050b
$c23f:  BEQ  loc_C276

loc_C241:
$c241:  LDY  #$01
$c243:  LDA  $0300,X
$c246:  BPL  loc_C25C
$c248:  TAY  
$c249:  LSR  A
$c24a:  LSR  A
$c24b:  LSR  A
$c24c:  LSR  A
$c24d:  AND  #$04
$c24f:  ORA  $0505
$c252:  STA  PPUCTRL
$c255:  TYA  
$c256:  INX  
$c257:  LDY  $0300,X
$c25a:  AND  #$3f

loc_C25C:
$c25c:  INX  
$c25d:  STA  PPUADDR
$c260:  LDA  $0300,X
$c263:  INX  
$c264:  STA  PPUADDR

loc_C267:
$c267:  LDA  $0300,X
$c26a:  INX  
$c26b:  STA  PPUDATA
$c26e:  DEY  
$c26f:  BNE  loc_C267
$c271:  DEC  $050b
$c274:  BNE  loc_C241

loc_C276:
$c276:  LDA  $0506
$c279:  AND  #$08
$c27b:  BEQ  loc_C296
$c27d:  LDA  #$3f
$c27f:  STA  PPUADDR
$c282:  LDA  #$00
$c284:  STA  PPUADDR
$c287:  STA  $050a
$c28a:  LDA  $05fc
$c28d:  STA  PPUDATA
$c290:  LDA  $1f
$c292:  AND  #$df
$c294:  STA  $1f

loc_C296:
$c296:  RTS  

loc_C297:
$c297:  LDX  #$00

loc_C299:
$c299:  LDA  $0300,X
$c29c:  STA  PPUADDR
$c29f:  LDA  $0301,X
$c2a2:  STA  PPUADDR
$c2a5:  PHA  
$c2a6:  LDA  $0302,X
$c2a9:  STA  PPUDATA
$c2ac:  LDA  $0303,X
$c2af:  STA  PPUDATA
$c2b2:  LDA  $0300,X
$c2b5:  STA  PPUADDR
$c2b8:  PLA  
$c2b9:  CLC  
$c2ba:  ADC  #$20
$c2bc:  STA  PPUADDR
$c2bf:  LDA  $0304,X
$c2c2:  STA  PPUDATA
$c2c5:  LDA  $0305,X
$c2c8:  STA  PPUDATA
$c2cb:  LDA  $0306,X
$c2ce:  STA  PPUADDR
$c2d1:  LDA  $0307,X
$c2d4:  STA  PPUADDR
$c2d7:  LDA  $0308,X
$c2da:  STA  PPUDATA
$c2dd:  TXA  
$c2de:  CLC  
$c2df:  ADC  #$09
$c2e1:  TAX  
$c2e2:  DEC  $050b
$c2e5:  BNE  loc_C299
$c2e7:  JMP  loc_C276

ppu_set_scroll:
$c2ea:  LDA  $0505
$c2ed:  STA  PPUCTRL
$c2f0:  LDA  $0506
$c2f3:  STA  PPUMASK
$c2f6:  LDA  $0508
$c2f9:  STA  PPUSCROLL
$c2fc:  LDA  $0509
$c2ff:  STA  PPUSCROLL

; ============================================
; IRQ HANDLER ($c408)
; ============================================

IRQ_handler:
$c408:  SEI  
$c409:  PHP  
$c40a:  BIT  APU_STATUS
$c40d:  STA  $20
$c40f:  STX  $21
$c411:  STY  $22
$c413:  TSX  
$c414:  LDA  $0103,X
$c417:  SEC  
$c418:  SBC  #$01
$c41a:  STA  $26
$c41c:  LDA  $0104,X
$c41f:  SBC  #$00
$c421:  STA  $27
$c423:  LDY  #$01
$c425:  LDA  ($26),Y
$c427:  PHA  
$c428:  AND  #$0f
$c42a:  CMP  #$0b
$c42c:  BEQ  loc_C463
$c42e:  CMP  #$03
$c430:  BEQ  loc_C460
$c432:  PLA  
$c433:  PHA  
$c434:  AND  #$08
$c436:  CMP  #$08
$c438:  PLA  
$c439:  ROR  A
$c43a:  LSR  A
$c43b:  LSR  A
$c43c:  LSR  A
$c43d:  STA  $23
$c43f:  DEY  
$c440:  LDA  ($26),Y
$c442:  BMI  loc_C451
$c444:  STA  $24
$c446:  LDY  $22
$c448:  LDX  $21
$c44a:  PLP  
$c44b:  PLA  
$c44c:  LDA  $20
$c44e:  JMP  loc_C38B

loc_C451:
$c451:  AND  #$3f
$c453:  STA  $24
$c455:  LDY  $22
$c457:  LDX  $21
$c459:  PLP  
$c45a:  PLA  
$c45b:  LDA  $20
$c45d:  JMP  loc_C3CE

loc_C460:
$c460:  JMP  loc_C4F8

loc_C463:
$c463:  PLA  
$c464:  CMP  #$cb
$c466:  BCC  loc_C484
$c468:  CMP  #$fb
$c46a:  BCC  loc_C4A1
$c46c:  LDA  #$19
$c46e:  STA  $23
$c470:  LDA  #$03
$c472:  STA  $24
$c474:  DEY  
$c475:  LDA  ($26),Y
$c477:  STA  $20
$c479:  LDY  $22
$c47b:  LDX  $21
$c47d:  PLP  
$c47e:  PLA  
$c47f:  LDA  $20
$c481:  JMP  loc_C38B

loc_C484:
$c484:  PHA  
$c485:  LDA  #$16
$c487:  STA  $23
$c489:  LDA  #$04
$c48b:  STA  $24
$c48d:  DEY  
$c48e:  PLA  
$c48f:  LSR  A
$c490:  LSR  A
$c491:  LSR  A
$c492:  LSR  A
$c493:  TAX  
$c494:  LDA  ($26),Y
$c496:  STA  $20
$c498:  LDY  $22
$c49a:  PLP  
$c49b:  PLA  
$c49c:  LDA  $20
$c49e:  JMP  loc_C38B

loc_C4A1:
$c4a1:  PLP  
$c4a2:  PHA  
$c4a3:  TSX  
$c4a4:  INC  $0103,X
$c4a7:  BNE  loc_C4AC
$c4a9:  INC  $0104,X

loc_C4AC:
$c4ac:  PLA  
$c4ad:  PLP  
$c4ae:  CMP  #$cb
$c4b0:  BEQ  loc_C4CA
$c4b2:  CMP  #$db
$c4b4:  BEQ  loc_C4E1
$c4b6:  DEY  
$c4b7:  LDA  ($26),Y
$c4b9:  TAX  
$c4ba:  INY  
$c4bb:  INY  
$c4bc:  LDA  $627b,X
$c4bf:  AND  ($26),Y
$c4c1:  PHP  
$c4c2:  LDX  $21
$c4c4:  LDY  $22
$c4c6:  LDA  $20
$c4c8:  PLP  
$c4c9:  RTS  

loc_C4CA:
$c4ca:  DEY  
$c4cb:  LDA  ($26),Y
$c4cd:  TAX  
$c4ce:  INY  
$c4cf:  INY  
$c4d0:  LDA  $627b,X
$c4d3:  ORA  ($26),Y
$c4d5:  STA  $627b,X
$c4d8:  PHP  
$c4d9:  LDX  $21
$c4db:  LDY  $22
$c4dd:  LDA  $20
$c4df:  PLP  
$c4e0:  RTS  

loc_C4E1:
$c4e1:  DEY  
$c4e2:  LDA  ($26),Y
$c4e4:  TAX  
$c4e5:  INY  
$c4e6:  INY  
$c4e7:  LDA  $627b,X
$c4ea:  AND  ($26),Y
$c4ec:  STA  $627b,X
$c4ef:  PHP  
$c4f0:  LDX  $21
$c4f2:  LDY  $22
$c4f4:  LDA  $20
$c4f6:  PLP  
$c4f7:  RTS  

loc_C4F8:
$c4f8:  INY  
$c4f9:  LDA  ($26),Y
$c4fb:  STA  $78
$c4fd:  DEY  
$c4fe:  DEY  
$c4ff:  LDA  ($26),Y
$c501:  STA  $76
$c503:  PLA  
$c504:  STA  $77
$c506:  AND  #$f0
$c508:  LSR  A
$c509:  LSR  A
$c50a:  LSR  A
$c50b:  LSR  A
$c50c:  CMP  #$0a
$c50e:  BCC  loc_C516
$c510:  CMP  #$0d
$c512:  BCS  loc_C527
$c514:  ADC  #$18

loc_C516:
$c516:  STA  $24
$c518:  LDA  #$10

loc_C51A:
$c51a:  STA  $23
$c51c:  LDY  $22
$c51e:  LDX  $21
$c520:  PLP  
$c521:  PLA  
$c522:  LDA  $20
$c524:  JMP  loc_C38B

loc_C527:
$c527:  SBC  #$0c
$c529:  STA  $24
$c52b:  LDA  #$12
$c52d:  BNE  loc_C51A

clear_system_state:
$c52f:  LDA  #$00
$c531:  STA  $1f
$c533:  STA  $050a
$c536:  STA  $050b
$c539:  STA  $0508
$c53c:  STA  $0509
$c53f:  STA  $0513
$c542:  RTS  

clear_oam_buffer:
$c543:  LDA  #$f7
$c545:  LDX  #$00

loc_C547:
$c547:  STA  $0200,X
$c54a:  INX  
$c54b:  BNE  loc_C547
$c54d:  RTS  
$c54e:  JSR  sub_C5AF

; ============================================
; MAIN GAME LOOP AREA ($c900-$ca00)
; ============================================
$c900:  ASL  $40,X
$c902:  LSR  A
$c903:  BCS  loc_C906
$c905:  LSR  A

loc_C906:
$c906:  ROR  $14,X
$c908:  DEY  
$c909:  BNE  loc_C8FF
$c90b:  RTS  

loc_C90C:
$c90c:  JSR  wait_vblank
$c90f:  DEX  
$c910:  BNE  loc_C90C
$c912:  RTS  

sub_C913:
$c913:  TXA  
$c914:  PHA  
$c915:  TYA  
$c916:  PHA  
$c917:  JSR  oam_shuffle
$c91a:  PLA  
$c91b:  TAY  
$c91c:  PLA  
$c91d:  TAX  
$c91e:  RTS  

oam_shuffle:
$c91f:  LDA  $1f
$c921:  AND  #$c8
$c923:  BNE  loc_C94A
$c925:  LDA  $0513
$c928:  AND  #$01
$c92a:  TAX  
$c92b:  LDA  $c94b,X
$c92e:  PHA  
$c92f:  LDA  $c94c,X
$c932:  LDX  #$40
$c934:  JSR  sub_C94E
$c937:  LDX  #$10
$c939:  PLA  
$c93a:  JSR  sub_C94E
$c93d:  LDX  $0513
$c940:  INX  
$c941:  CPX  #$0a
$c943:  BCC  loc_C947
$c945:  LDX  #$00

loc_C947:
$c947:  STX  $0513

loc_C94A:
$c94a:  RTS  
$c94b:  BNE  loc_C8ED
$c94d:  BVS  loc_C8F7
$c94f:  LDA  #$30
$c951:  STA  $10

loc_C953:
$c953:  LDA  $0200,X
$c956:  PHA  
$c957:  LDA  $0200,Y
$c95a:  STA  $0200,X
$c95d:  PLA  
$c95e:  STA  $0200,Y
$c961:  INX  
$c962:  INY  
$c963:  DEC  $10
$c965:  BNE  loc_C953
$c967:  RTS  

main_loop_entry:
$c968:  JSR  setup_bank_trampoline
$c96b:  JSR  clear_system_state
$c96e:  BRK  
$c96f:  .db $0b
$c970:  .db $bf
$c971:  BRK  
$c972:  ORA  $002f
$c975:  .db $0c
$c976:  .db $ef
$c977:  BRK  
$c978:  .db $34
$c979:  .db $ef
$c97a:  BRK  
$c97b:  .db $22
$c97c:  .db $ef

main_loop:
$c97d:  JSR  main_frame_handler
$c980:  JMP  main_loop

setup_bank_trampoline:
$c983:  LDX  #$5d

loc_C985:
$c985:  LDA  $c98f,X
$c988:  STA  $6cad,X
$c98b:  DEX  
$c98c:  BPL  loc_C985
$c98e:  RTS  
$c98f:  PHP  
$c990:  LDA  current_bank
$c993:  STA  $07cc
$c996:  LDA  #$0f
$c998:  STA  current_bank
$c99b:  NOP  
$c99c:  NOP  
$c99d:  LDA  #$00
$c99f:  STA  ppuctrl_shadow
$c9a2:  STA  $39
$c9a4:  STA  $bfff
$c9a7:  LSR  A
$c9a8:  STA  $bfff
$c9ab:  LSR  A
$c9ac:  STA  $bfff
$c9af:  LSR  A
$c9b0:  STA  $bfff
$c9b3:  LSR  A
$c9b4:  STA  $bfff
$c9b7:  NOP  
$c9b8:  NOP  
$c9b9:  LDA  $07ca
$c9bc:  PLP  
$c9bd:  JSR  sub_0000
$c9c0:  PHP  
$c9c1:  STA  $07ca
$c9c4:  LDA  #$10
$c9c6:  STA  ppuctrl_shadow
$c9c9:  STA  $39
$c9cb:  NOP  
$c9cc:  NOP  
$c9cd:  STA  $bfff
$c9d0:  LSR  A
$c9d1:  STA  $bfff
$c9d4:  LSR  A
$c9d5:  STA  $bfff
$c9d8:  LSR  A
$c9d9:  STA  $bfff
$c9dc:  LSR  A
$c9dd:  STA  $bfff
$c9e0:  NOP  
$c9e1:  NOP  
$c9e2:  LDA  $07cc
$c9e5:  JSR  bank_switch
$c9e8:  LDA  $07ca
$c9eb:  PLP  
$c9ec:  RTS  

main_frame_handler:
$c9ed:  JSR  sub_CBB4
$c9f0:  JSR  sub_CB98
$c9f3:  JSR  sub_CA21
$c9f6:  JSR  sub_D542
$c9f9:  JSR  sub_E06E
$c9fc:  BRK  
$c9fd:  BRK  
$c9fe:  .db $df
$c9ff:  JSR  sub_C001

; ============================================
; UTILITY ROUTINES ($ff00-$ffff)
; ============================================
$ff00:  .db $03
$ff01:  .db $03
$ff02:  DEX  
$ff03:  BPL  loc_FEFF
$ff05:  LDA  #$0f
$ff07:  JSR  mmc1_write_control
$ff0a:  INC  $050b
$ff0d:  JMP  loc_C626
$ff10:  LDY  #$02
$ff12:  LDX  #$00

loc_FF14:
$ff14:  NOP  
$ff15:  DEX  
$ff16:  BNE  loc_FF14
$ff18:  DEY  
$ff19:  BNE  loc_FF14

loc_FF1B:
$ff1b:  BIT  PPUSTATUS
$ff1e:  BVC  loc_FF1B
$ff20:  LDA  $7b
$ff22:  STA  PPUSCROLL
$ff25:  LDA  #$80
$ff27:  STA  PPUSCROLL
$ff2a:  LDY  #$01
$ff2c:  LDX  #$00

loc_FF2E:
$ff2e:  NOP  
$ff2f:  DEX  
$ff30:  BNE  loc_FF2E
$ff32:  DEY  
$ff33:  BNE  loc_FF2E
$ff35:  LDA  $7c
$ff37:  STA  PPUSCROLL
$ff3a:  LDA  #$00
$ff3c:  STA  PPUSCROLL
$ff3f:  LDA  $7f
$ff41:  AND  #$03
$ff43:  BNE  loc_FF4C
$ff45:  LDA  $7b
$ff47:  CLC  
$ff48:  ADC  #$01
$ff4a:  STA  $7b

loc_FF4C:
$ff4c:  LDA  $7f
$ff4e:  AND  #$01
$ff50:  BNE  loc_FF59
$ff52:  LDA  $7c
$ff54:  CLC  
$ff55:  ADC  #$01
$ff57:  STA  $7c

loc_FF59:
$ff59:  INC  $7f
$ff5b:  JMP  wait_vblank
$ff5e:  ORA  ($02,X)
$ff60:  .db $04
$ff61:  PHP  
$ff62:  BPL  loc_FF84
$ff64:  RTI  
$ff65:  .db $80
$ff66:  .db $ff
$ff67:  .db $ff
$ff68:  .db $ff
$ff69:  .db $ff
$ff6a:  .db $ff
$ff6b:  .db $ff
$ff6c:  .db $ff
$ff6d:  .db $ff
$ff6e:  .db $ff
$ff6f:  .db $ff
$ff70:  .db $ff
$ff71:  .db $ff
$ff72:  .db $ff
$ff73:  .db $ff

wait_vblank:
$ff74:  LDA  $050c

loc_FF77:
$ff77:  NOP  
$ff78:  NOP  
$ff79:  INC  $12
$ff7b:  CMP  $050c
$ff7e:  BEQ  loc_FF77
$ff80:  NOP  
$ff81:  NOP  
$ff82:  JSR  sub_C913
$ff85:  RTS  
$ff86:  .db $ff
$ff87:  .db $ff
$ff88:  .db $ff
$ff89:  .db $ff
$ff8a:  .db $ff
$ff8b:  .db $ff
$ff8c:  .db $ff
$ff8d:  .db $ff
$ff8e:  JMP  main_init

bank_switch:
$ff91:  STA  current_bank
$ff94:  PHA  
$ff95:  LDA  ppuctrl_shadow
$ff98:  AND  #$ef
$ff9a:  STA  ppuctrl_shadow
$ff9d:  PLA  
$ff9e:  PHA  
$ff9f:  AND  #$10
$ffa1:  ORA  ppuctrl_shadow
$ffa4:  STA  ppuctrl_shadow
$ffa7:  PLA  
$ffa8:  AND  #$0f
$ffaa:  NOP  
$ffab:  NOP  
$ffac:  STA  sub_FFFF
$ffaf:  LSR  A
$ffb0:  STA  sub_FFFF
$ffb3:  LSR  A
$ffb4:  STA  sub_FFFF
$ffb7:  LSR  A
$ffb8:  STA  sub_FFFF
$ffbb:  LSR  A
$ffbc:  STA  sub_FFFF
$ffbf:  LDA  ppuctrl_shadow
$ffc2:  STA  $bfff
$ffc5:  LSR  A
$ffc6:  STA  $bfff
$ffc9:  LSR  A
$ffca:  STA  $bfff
$ffcd:  LSR  A
$ffce:  STA  $bfff
$ffd1:  LSR  A
$ffd2:  STA  $bfff
$ffd5:  NOP  
$ffd6:  NOP  
$ffd7:  RTS  

; ============================================
; GAME LOOP SUBROUTINES ($ca00-$cc00)
; ============================================
$ca00:  ORA  ($c0,X)
$ca02:  JSR  sub_CE09
$ca05:  JSR  sub_D7D5
$ca08:  LDX  $052f
$ca0b:  JSR  loc_C90C
$ca0e:  JSR  sub_CA17
$ca11:  JSR  sub_D1E1
$ca14:  INC  $3c
$ca16:  RTS  

sub_CA17:
$ca17:  JSR  sub_D241
$ca1a:  LDA  $14
$ca1c:  AND  #$04
$ca1e:  BNE  sub_CA17
$ca20:  RTS  

sub_CA21:
$ca21:  LDX  $058e
$ca24:  LDA  loc_CA3C,X
$ca27:  AND  $3c
$ca29:  BNE  loc_CA3C
$ca2b:  LDA  #$01
$ca2d:  STA  $052f
$ca30:  JSR  sub_CA41
$ca33:  JSR  sub_CB1E
$ca36:  JSR  sub_CBF8
$ca39:  JSR  sub_CB71

loc_CA3C:
$ca3c:  RTS  
$ca3d:  .db $0f
$ca3e:  .db $07
$ca3f:  .db $0f
$ca40:  .db $03

sub_CA41:
$ca41:  LDA  $0530
$ca44:  BPL  loc_CA55
$ca46:  LDA  #$ff
$ca48:  STA  $56
$ca4a:  JSR  sub_DB18
$ca4d:  STA  $14
$ca4f:  LDA  $0530
$ca52:  BPL  loc_CA55
$ca54:  RTS  

loc_CA55:
$ca55:  LDA  $0515
$ca58:  CMP  #$02
$ca5a:  BNE  loc_CA77
$ca5c:  JSR  sub_D241
$ca5f:  LDA  $14
$ca61:  AND  #$f0
$ca63:  BNE  loc_CA71
$ca65:  LDA  $0597
$ca68:  BEQ  loc_CA76
$ca6a:  LDX  $3d
$ca6c:  LDA  $cb1a,X
$ca6f:  STA  $14

loc_CA71:
$ca71:  LDA  #$ff
$ca73:  STA  $0597

loc_CA76:
$ca76:  RTS  

loc_CA77:
$ca77:  LDA  #$00
$ca79:  STA  $56
$ca7b:  LDA  $7140
$ca7e:  AND  #$1f
$ca80:  TAX  
$ca81:  LDA  $6f40,X
$ca84:  CMP  #$10
$ca86:  BCC  loc_CAD8
$ca88:  CMP  #$14
$ca8a:  BCS  loc_CAD8
$ca8c:  AND  #$03
$ca8e:  TAX  
$ca8f:  LDA  $cb1a,X
$ca92:  STA  $14
$ca94:  LDA  #$02
$ca96:  STA  $058e
$ca99:  LDA  #$20
$ca9b:  STA  $058f
$ca9e:  LDX  #$03

loc_CAA0:
$caa0:  LDA  $70e0,X
$caa3:  ORA  #$40
$caa5:  AND  #$7f
$caa7:  STA  $70e0,X
$caaa:  DEX  
$caab:  BPL  loc_CAA0
$caad:  BRK  
$caae:  LDY  $fb
$cab0:  LDA  $3c
$cab2:  AND  #$f0
$cab4:  ORA  #$08
$cab6:  STA  $3c
$cab8:  LDX  #$00
$caba:  JSR  sub_CABE
$cabd:  INX  

sub_CABE:
$cabe:  LDA  $7004,X
$cac1:  AND  #$7f
$cac3:  STA  $7004,X
$cac6:  LDA  $6f64,X
$cac9:  STA  $6fa4,X
$cacc:  LDA  $6f84,X
$cacf:  STA  $6fc4,X
$cad2:  LDA  #$00
$cad4:  STA  $052a,X
$cad7:  RTS  

loc_CAD8:
$cad8:  LDA  $15
$cada:  AND  #$03
$cadc:  JMP  loc_CAEA
$cadf:  STA  $058e
$cae2:  LDA  #$20
$cae4:  STA  $058f
$cae7:  JMP  sub_D241

loc_CAEA:
$caea:  LDA  $058e
$caed:  CMP  #$01
$caef:  BEQ  loc_CB17
$caf1:  LDA  #$01
$caf3:  STA  $058e
$caf6:  LDA  #$10
$caf8:  STA  $058f
$cafb:  LDX  #$03

loc_CAFD:
$cafd:  LDA  $70e0,X
$cb00:  AND  #$bf
$cb02:  STA  $70e0,X
$cb05:  LDA  $6be7,X
$cb08:  AND  #$20
$cb0a:  ASL  A
$cb0b:  ASL  A
$cb0c:  EOR  #$80
$cb0e:  ORA  $70e0,X
$cb11:  STA  $70e0,X
$cb14:  DEX  
$cb15:  BPL  loc_CAFD

loc_CB17:
$cb17:  JMP  sub_D241
$cb1a:  BPL  loc_CA9C
$cb1c:  JSR  sub_AD40
$cb1f:  ORA  $05,X
$cb21:  CMP  #$02
$cb23:  BNE  loc_CB33
$cb25:  LDA  $0597
$cb28:  BEQ  loc_CB33
$cb2a:  LDA  $14
$cb2c:  ORA  $0529
$cb2f:  LSR  A
$cb30:  BCC  loc_CB33
$cb32:  RTS  

loc_CB33:
$cb33:  LDX  $3d
$cb35:  BEQ  loc_CB4A
$cb37:  DEX  
$cb38:  BEQ  loc_CB64
$cb3a:  DEX  
$cb3b:  BEQ  loc_CB57
$cb3d:  JSR  sub_CBCA
$cb40:  JSR  sub_CBD6
$cb43:  JSR  sub_CBE4
$cb46:  JSR  sub_CBBE
$cb49:  RTS  

loc_CB4A:
$cb4a:  JSR  sub_CBD6
$cb4d:  JSR  sub_CBBE
$cb50:  JSR  sub_CBCA
$cb53:  JSR  sub_CBE4
$cb56:  RTS  

loc_CB57:
$cb57:  JSR  sub_CBE4
$cb5a:  JSR  sub_CBCA
$cb5d:  JSR  sub_CBBE
$cb60:  JSR  sub_CBD6
$cb63:  RTS  

loc_CB64:
$cb64:  JSR  sub_CBBE
$cb67:  JSR  sub_CBE4
$cb6a:  JSR  sub_CBD6
$cb6d:  JSR  sub_CBCA
$cb70:  RTS  

sub_CB71:
$cb71:  LDA  $0530
$cb74:  BMI  loc_CB97
$cb76:  LDA  $0599
$cb79:  AND  #$10
$cb7b:  BNE  loc_CB97
$cb7d:  LDA  $0539
$cb80:  BMI  loc_CB97
$cb82:  CLC  
$cb83:  ADC  #$10
$cb85:  STA  $0539
$cb88:  BPL  loc_CB97
$cb8a:  BRK  
$cb8b:  .db $13
$cb8c:  .db $1f
$cb8d:  BCC  loc_CB93
$cb8f:  BRK  
$cb90:  .db $07
$cb91:  .db $6f
$cb92:  PLP  

loc_CB93:
$cb93:  BRK  
$cb94:  .db $07
$cb95:  .db $6f
$cb96:  ROL  A

loc_CB97:
$cb97:  RTS  

sub_CB98:
$cb98:  LDA  $052e
$cb9b:  BEQ  loc_CBA1
$cb9d:  DEC  $052e
$cba0:  RTS  

loc_CBA1:
$cba1:  LDX  #$01
$cba3:  STX  JOY1
$cba6:  DEX  
$cba7:  STX  JOY1
$cbaa:  LDA  JOY1
$cbad:  ORA  $0529
$cbb0:  STA  $0529
$cbb3:  RTS  

sub_CBB4:
$cbb4:  LDA  $0526
$cbb7:  CLC  
$cbb8:  ADC  #$08
$cbba:  STA  $0526
$cbbd:  RTS  

sub_CBBE:
$cbbe:  LDA  $14
$cbc0:  BPL  loc_CBF7
$cbc2:  JSR  sub_CD85
$cbc5:  LDA  #$01
$cbc7:  JMP  loc_CBEF

sub_CBCA:
$cbca:  BIT  $14
$cbcc:  BVC  loc_CBF7
$cbce:  JSR  sub_CD85
$cbd1:  LDA  #$03
$cbd3:  JMP  loc_CBEF

sub_CBD6:
$cbd6:  LDA  $14
$cbd8:  AND  #$10
$cbda:  BEQ  loc_CBF7
$cbdc:  JSR  sub_CD85
$cbdf:  LDA  #$00
$cbe1:  JMP  loc_CBEF

sub_CBE4:
$cbe4:  LDA  $14
$cbe6:  AND  #$20
$cbe8:  BEQ  loc_CBF7
$cbea:  JSR  sub_CD85
$cbed:  LDA  #$02

loc_CBEF:
$cbef:  STA  $3d
$cbf1:  JSR  sub_CC88
$cbf4:  JMP  loc_D0C4

loc_CBF7:
$cbf7:  RTS  

sub_CBF8:
$cbf8:  LDA  $0530
$cbfb:  BMI  loc_CC64
$cbfd:  LDA  $14
$cbff:  ORA  $0529

; ============================================
; INPUT/CONTROLLER ROUTINES ($c500-$c600)
; ============================================
$c500:  ROL  $85
$c502:  ROR  $68,X
$c504:  STA  $77
$c506:  AND  #$f0
$c508:  LSR  A
$c509:  LSR  A
$c50a:  LSR  A
$c50b:  LSR  A
$c50c:  CMP  #$0a
$c50e:  BCC  loc_C516
$c510:  CMP  #$0d
$c512:  BCS  loc_C527
$c514:  ADC  #$18

loc_C516:
$c516:  STA  $24
$c518:  LDA  #$10

loc_C51A:
$c51a:  STA  $23
$c51c:  LDY  $22
$c51e:  LDX  $21
$c520:  PLP  
$c521:  PLA  
$c522:  LDA  $20
$c524:  JMP  loc_C38B

loc_C527:
$c527:  SBC  #$0c
$c529:  STA  $24
$c52b:  LDA  #$12
$c52d:  BNE  loc_C51A

clear_system_state:
$c52f:  LDA  #$00
$c531:  STA  $1f
$c533:  STA  $050a
$c536:  STA  $050b
$c539:  STA  $0508
$c53c:  STA  $0509
$c53f:  STA  $0513
$c542:  RTS  

clear_oam_buffer:
$c543:  LDA  #$f7
$c545:  LDX  #$00

loc_C547:
$c547:  STA  $0200,X
$c54a:  INX  
$c54b:  BNE  loc_C547
$c54d:  RTS  
$c54e:  JSR  sub_C5AF
$c551:  JSR  sub_C569
$c554:  JSR  clear_oam_buffer
$c557:  LDA  $1f
$c559:  AND  #$7f
$c55b:  STA  $1f
$c55d:  LDA  $1f
$c55f:  AND  #$bf
$c561:  STA  $1f
$c563:  JSR  wait_vblank
$c566:  JMP  loc_C592

sub_C569:
$c569:  JSR  sub_C575
$c56c:  LDX  #$7f

loc_C56E:
$c56e:  STA  $0400,X
$c571:  DEX  
$c572:  BPL  loc_C56E
$c574:  RTS  

sub_C575:
$c575:  LDA  PPUSTATUS
$c578:  LDA  #$20
$c57a:  STA  PPUADDR
$c57d:  LDA  #$00
$c57f:  STA  PPUADDR
$c582:  LDX  #$08
$c584:  TAY  

loc_C585:
$c585:  STA  PPUDATA
$c588:  DEY  
$c589:  BNE  loc_C585
$c58b:  DEX  
$c58c:  BNE  loc_C585
$c58e:  RTS  
$c58f:  JSR  sub_C5A8

loc_C592:
$c592:  LDY  #$18
$c594:  BNE  loc_C598

sub_C596:
$c596:  LDY  #$00

loc_C598:
$c598:  LDA  PPUSTATUS

loc_C59B:
$c59b:  LDA  PPUSTATUS
$c59e:  BPL  loc_C59B
$c5a0:  TYA  
$c5a1:  STA  PPUMASK
$c5a4:  STA  $0506
$c5a7:  RTS  

sub_C5A8:
$c5a8:  LDA  $1f
$c5aa:  AND  #$7f
$c5ac:  STA  $1f
$c5ae:  RTS  

sub_C5AF:
$c5af:  JSR  sub_C596
$c5b2:  LDA  $1f
$c5b4:  ORA  #$80
$c5b6:  STA  $1f
$c5b8:  RTS  
$c5b9:  LDA  #$00
$c5bb:  STA  $16
$c5bd:  BEQ  loc_C5DE
$c5bf:  LDA  #$40
$c5c1:  LDX  #$f0
$c5c3:  BNE  loc_C5C8
$c5c5:  LDA  #$10
$c5c7:  TAX  

loc_C5C8:
$c5c8:  STX  $17

loc_C5CA:
$c5ca:  STA  $16
$c5cc:  JSR  loc_C5DE
$c5cf:  LDX  #$03
$c5d1:  JSR  loc_C90C
$c5d4:  LDA  $16
$c5d6:  CLC  
$c5d7:  ADC  $17
$c5d9:  CMP  #$50
$c5db:  BCC  loc_C5CA
$c5dd:  RTS  

loc_C5DE:
$c5de:  LDY  #$00
$c5e0:  LDA  #$bf
$c5e2:  STA  $0300,Y
$c5e5:  INY  
$c5e6:  LDA  #$20
$c5e8:  STA  $0300,Y
$c5eb:  INY  
$c5ec:  LDA  #$00
$c5ee:  STA  $0300,Y
$c5f1:  INY  
$c5f2:  STY  $050a
$c5f5:  STA  $18
$c5f7:  TAX  
$c5f8:  LDA  $18
$c5fa:  LDY  $05fc
$c5fd:  AND  #$03
$c5ff:  BEQ  loc_C605

; ============================================
; SUBROUTINES ($d500-$d600)
; ============================================
$d500:  ORA  #$68
$d502:  PHA  
$d503:  AND  #$1f
$d505:  CMP  $0520
$d508:  BEQ  loc_D515
$d50a:  PLA  
$d50b:  LDA  #$20
$d50d:  LDX  $46
$d50f:  BEQ  loc_D518
$d511:  LDA  #$21
$d513:  BNE  loc_D518

loc_D515:
$d515:  PLA  
$d516:  AND  #$1f

loc_D518:
$d518:  TAX  
$d519:  LDA  $76c0,X
$d51c:  PHA  
$d51d:  TXA  
$d51e:  ASL  A
$d51f:  ASL  A
$d520:  TAX  
$d521:  PLA  
$d522:  RTS  
$d523:  PHA  
$d524:  LDA  sub_0000
$d526:  CMP  #$c2
$d528:  BNE  loc_D539
$d52a:  LDA  $01
$d52c:  CMP  #$2e
$d52e:  BNE  loc_D539
$d530:  LDA  $62a1
$d533:  BPL  loc_D539
$d535:  PLA  
$d536:  LDA  #$02
$d538:  RTS  

loc_D539:
$d539:  PLA  
$d53a:  RTS  
$d53b:  LDA  #$ff
$d53d:  STA  $56
$d53f:  JMP  loc_D546

sub_D542:
$d542:  LDA  #$00
$d544:  STA  $56

loc_D546:
$d546:  LDA  current_bank
$d549:  STA  $58
$d54b:  LDA  #$06
$d54d:  STA  $51
$d54f:  LDA  $6f60
$d552:  SEC  
$d553:  SBC  #$08
$d555:  STA  $7c
$d557:  LDA  $6f80
$d55a:  SEC  
$d55b:  SBC  #$07
$d55d:  STA  $7b
$d55f:  LDA  $3c
$d561:  AND  #$0f
$d563:  BNE  loc_D588
$d565:  LDA  $41
$d567:  BMI  loc_D56C
$d569:  JMP  loc_C013

loc_D56C:
$d56c:  LDA  $67
$d56e:  JSR  bank_switch
$d571:  JSR  sub_D57F
$d574:  LDA  $7024
$d577:  AND  $7025
$d57a:  BMI  loc_D5AC
$d57c:  JMP  loc_C013

sub_D57F:
$d57f:  JSR  sub_D607
$d582:  JSR  sub_D5EE
$d585:  JMP  sub_D57F

loc_D588:
$d588:  PHA  
$d589:  JSR  sub_D5C0
$d58c:  PLA  
$d58d:  AND  #$07
$d58f:  BNE  loc_D5AC
$d591:  LDA  $41
$d593:  BPL  loc_D598
$d595:  JSR  sub_D5AD

loc_D598:
$d598:  LDX  #$00
$d59a:  JSR  sub_D59D

sub_D59D:
$d59d:  LDA  $052a,X
$d5a0:  AND  #$40
$d5a2:  BEQ  loc_D5AB
$d5a4:  ASL  A
$d5a5:  ORA  $7004,X
$d5a8:  STA  $7004,X

loc_D5AB:
$d5ab:  INX  

loc_D5AC:
$d5ac:  RTS  

sub_D5AD:
$d5ad:  LDA  $67
$d5af:  JSR  bank_switch

loc_D5B2:
$d5b2:  JSR  sub_D5FE
$d5b5:  JSR  sub_D5EE
$d5b8:  JMP  loc_D5B2
$d5bb:  LDA  $58
$d5bd:  JMP  bank_switch

sub_D5C0:
$d5c0:  LDX  $51
$d5c2:  LDA  $7020,X
$d5c5:  CMP  #$ff
$d5c7:  BEQ  loc_D5E5
$d5c9:  LDA  $7160,X
$d5cc:  BEQ  loc_D5DD
$d5ce:  BMI  loc_D5DA
$d5d0:  LDA  #$09
$d5d2:  STA  $57
$d5d4:  JSR  sub_D5EA
$d5d7:  JMP  loc_D5DD

loc_D5DA:
$d5da:  JSR  sub_D9CB

loc_D5DD:
$d5dd:  INC  $51
$d5df:  LDA  $51
$d5e1:  CMP  #$1e
$d5e3:  BCC  sub_D5C0

loc_D5E5:
$d5e5:  LDA  #$06
$d5e7:  STA  $51
$d5e9:  RTS  

sub_D5EA:
$d5ea:  JSR  sub_D94B
$d5ed:  RTS  

sub_D5EE:
$d5ee:  INC  $51
$d5f0:  LDA  $51
$d5f2:  CMP  #$1e
$d5f4:  BCC  loc_D5FD
$d5f6:  LDA  $58
$d5f8:  JSR  bank_switch
$d5fb:  PLA  
$d5fc:  PLA  

loc_D5FD:
$d5fd:  RTS  

sub_D5FE:
$d5fe:  LDX  $51

; ============================================
; MOVEMENT ROUTINES ($e000-$e200)
; ============================================
$e000:  LDA  $41
$e002:  BPL  loc_E015
$e004:  LDA  $45
$e006:  SEC  
$e007:  SBC  #$07
$e009:  STA  $ed
$e00b:  LDA  $44
$e00d:  SEC  
$e00e:  SBC  #$08
$e010:  STA  $ec
$e012:  JMP  loc_E023

loc_E015:
$e015:  LDA  $43
$e017:  SEC  
$e018:  SBC  #$07
$e01a:  STA  $ed
$e01c:  LDA  $42
$e01e:  SEC  
$e01f:  SBC  #$08
$e021:  STA  $ec

loc_E023:
$e023:  LDA  $61
$e025:  ORA  #$01
$e027:  STA  $61
$e029:  JSR  sub_E147
$e02c:  LDA  #$00
$e02e:  STA  $16
$e030:  JSR  sub_E368
$e033:  LDX  #$01

loc_E035:
$e035:  LDA  $7020,X
$e038:  CMP  #$ff
$e03a:  BEQ  loc_E06D
$e03c:  LDA  #$00
$e03e:  STA  $7100,X
$e041:  STA  $7120,X
$e044:  LDA  $7000,X
$e047:  STA  $e4
$e049:  LDA  $7020,X
$e04c:  AND  #$90
$e04e:  BNE  loc_E060
$e050:  JSR  sub_E169
$e053:  LDA  $e4
$e055:  STA  $7000,X
$e058:  BCC  loc_E068
$e05a:  JSR  sub_E368
$e05d:  JMP  loc_E068

loc_E060:
$e060:  JSR  sub_E160
$e063:  LDA  $e4
$e065:  STA  $7000,X

loc_E068:
$e068:  INX  
$e069:  CPX  #$1e
$e06b:  BCC  loc_E035

loc_E06D:
$e06d:  RTS  

sub_E06E:
$e06e:  JSR  sub_E147
$e071:  LDA  $3e
$e073:  BEQ  loc_E0BE
$e075:  LDA  $7000
$e078:  AND  #$03
$e07a:  BNE  loc_E08C
$e07c:  LDA  $eb
$e07e:  SEC  
$e07f:  SBC  $058f
$e082:  STA  $eb
$e084:  BCS  loc_E089
$e086:  DEC  $00ed

loc_E089:
$e089:  JMP  loc_E0BE

loc_E08C:
$e08c:  CMP  #$01
$e08e:  BNE  loc_E09F
$e090:  LDA  $ea
$e092:  CLC  
$e093:  ADC  $058f
$e096:  STA  $ea
$e098:  BCC  loc_E09C
$e09a:  INC  $ec

loc_E09C:
$e09c:  JMP  loc_E0BE

loc_E09F:
$e09f:  CMP  #$02
$e0a1:  BNE  loc_E0B2
$e0a3:  LDA  $eb
$e0a5:  CLC  
$e0a6:  ADC  $058f
$e0a9:  STA  $eb
$e0ab:  BCC  loc_E0AF
$e0ad:  INC  $ed

loc_E0AF:
$e0af:  JMP  loc_E0BE

loc_E0B2:
$e0b2:  LDA  $ea
$e0b4:  SEC  
$e0b5:  SBC  $058f
$e0b8:  STA  $ea
$e0ba:  BCS  loc_E0BE
$e0bc:  DEC  $ec

loc_E0BE:
$e0be:  LDX  #$01

loc_E0C0:
$e0c0:  LDA  $7020,X
$e0c3:  CMP  #$ff
$e0c5:  BNE  loc_E0C8
$e0c7:  RTS  

loc_E0C8:
$e0c8:  LDA  $7000,X
$e0cb:  STA  $e4
$e0cd:  BMI  loc_E0EA
$e0cf:  LDA  $7020,X
$e0d2:  AND  #$90
$e0d4:  BEQ  loc_E0DC
$e0d6:  JSR  sub_E160
$e0d9:  JMP  loc_E0DF

loc_E0DC:
$e0dc:  JSR  sub_E169

loc_E0DF:
$e0df:  LDA  $e4
$e0e1:  STA  $7000,X
$e0e4:  INX  
$e0e5:  CPX  #$1e
$e0e7:  BCC  loc_E0C0
$e0e9:  RTS  

loc_E0EA:
$e0ea:  LDA  #$0f
$e0ec:  STA  $e3
$e0ee:  LDY  #$10
$e0f0:  LDA  $70e0,X
$e0f3:  AND  #$40
$e0f5:  BEQ  loc_E0FB
$e0f7:  LDY  #$20
$e0f9:  LSR  $e3

loc_E0FB:
$e0fb:  STY  $e2
$e0fd:  LDA  $7020,X
$e100:  STA  $e5
$e102:  AND  #$90
$e104:  BEQ  loc_E10C
$e106:  JSR  sub_E160
$e109:  JMP  loc_E12B

loc_E10C:
$e10c:  LDA  $e4
$e10e:  JSR  sub_E2EE
$e111:  LDA  $e5
$e113:  AND  #$40
$e115:  BEQ  loc_E128
$e117:  LDA  #$10
$e119:  STA  $e2
$e11b:  LDA  $e5
$e11d:  AND  #$20
$e11f:  BEQ  loc_E123
$e121:  ASL  $e2

loc_E123:
$e123:  LDA  $e5
$e125:  JSR  sub_E2EE

loc_E128:
$e128:  JSR  sub_E169

loc_E12B:
$e12b:  LDA  $3c
$e12d:  AND  $e3
$e12f:  CMP  $e3
$e131:  BNE  loc_E139
$e133:  LDA  $e4
$e135:  AND  #$7f
$e137:  STA  $e4

loc_E139:
$e139:  LDA  $e4
$e13b:  STA  $7000,X
$e13e:  INX  
$e13f:  CPX  #$1e
$e141:  BCS  loc_E146
$e143:  JMP  loc_E0C0

loc_E146:
$e146:  RTS  

sub_E147:
$e147:  LDA  $7020
$e14a:  AND  #$90
$e14c:  BEQ  loc_E152
$e14e:  LDY  #$00
$e150:  BEQ  loc_E1B7

loc_E152:
$e152:  LDA  #$08
$e154:  STA  sub_0000
$e156:  LDA  #$07
$e158:  STA  $01
$e15a:  LDA  #$00
$e15c:  TAX  
$e15d:  JMP  loc_E336

sub_E160:
$e160:  LDA  $e4
$e162:  AND  #$3c
$e164:  STA  $e2
$e166:  BNE  loc_E1A9
$e168:  RTS  

sub_E169:
$e169:  LDA  $e4
$e16b:  AND  #$3c
$e16d:  STA  $e2
$e16f:  LDA  $7140,X
$e172:  AND  #$e0
$e174:  CMP  $46
$e176:  BNE  loc_E1A5
$e178:  LDA  $7120,X
$e17b:  SEC  
$e17c:  SBC  $eb
$e17e:  STA  $e0
$e180:  LDA  $6fc0,X
$e183:  SBC  $ed
$e185:  STA  $e1
$e187:  AND  #$f0
$e189:  BEQ  loc_E199
$e18b:  LDA  $e1
$e18d:  CMP  #$ff
$e18f:  BNE  loc_E1A5
$e191:  LDA  $e0
$e193:  CMP  #$40
$e195:  BCC  loc_E1A5
$e197:  BCS  loc_E1D3

loc_E199:
$e199:  LDA  $e1
$e19b:  AND  #$0f
$e19d:  CMP  #$0f
$e19f:  BCC  loc_E1D3
$e1a1:  LDA  $e0
$e1a3:  BEQ  loc_E1D3

loc_E1A5:
$e1a5:  LDA  $e2
$e1a7:  BEQ  loc_E1D1

loc_E1A9:
$e1a9:  JSR  sub_C78C
$e1ac:  LDA  $e2
$e1ae:  JSR  sub_E4BB
$e1b1:  LDA  $e4
$e1b3:  AND  #$c3
$e1b5:  STA  $e4

loc_E1B7:
$e1b7:  LDA  #$f7
$e1b9:  STA  $0200,Y
$e1bc:  STA  $0204,Y
$e1bf:  STA  $0208,Y
$e1c2:  STA  $020c,Y
$e1c5:  STA  $0203,Y
$e1c8:  STA  $0207,Y
$e1cb:  STA  $020b,Y
$e1ce:  STA  $020f,Y

loc_E1D1:
$e1d1:  CLC  
$e1d2:  RTS  

loc_E1D3:
$e1d3:  LDA  $7100,X
$e1d6:  SEC  
$e1d7:  SBC  $ea
$e1d9:  STA  $de
$e1db:  LDA  $6fa0,X
$e1de:  SBC  $ec
$e1e0:  STA  $df
$e1e2:  AND  #$f0
$e1e4:  BEQ  loc_E24D
$e1e6:  LDA  $df
$e1e8:  CMP  #$ff
$e1ea:  BNE  loc_E1A5
$e1ec:  LDA  $de
$e1ee:  BPL  loc_E1A5
$e1f0:  STA  $e6
$e1f2:  LDA  $e2
$e1f4:  BNE  loc_E20E
$e1f6:  JSR  sub_E45C
$e1f9:  STA  $e2
$e1fb:  LDA  $e4
$e1fd:  AND  #$c3
$e1ff:  ORA  $e2

; ============================================
; BANK SWITCH AREAS ($da80-$db00)
; ============================================
$da80:  RTI  
$da81:  BVS  loc_DAEB
$da83:  ORA  $7040,X
$da86:  STA  $7040,X
$da89:  LDA  $70e0,X
$da8c:  AND  #$bf
$da8e:  STA  $70e0,X
$da91:  JSR  sub_DDE3
$da94:  JMP  loc_D891
$da97:  LDY  #$01
$da99:  LDA  ($4d),Y
$da9b:  JSR  sub_DDE0
$da9e:  BRK  
$da9f:  ORA  ($8f,X)
$daa1:  JMP  loc_DDF0
$daa4:  LDA  current_bank
$daa7:  PHA  
$daa8:  CMP  #$1c
$daaa:  CLC  
$daab:  BEQ  loc_DAB3
$daad:  LDA  #$1c
$daaf:  JSR  bank_switch
$dab2:  SEC  

loc_DAB3:
$dab3:  PHP  
$dab4:  JSR  sub_DAC6
$dab7:  LDX  $51
$dab9:  JSR  sub_DDE0
$dabc:  PLP  
$dabd:  PLA  
$dabe:  BCC  loc_DAC3
$dac0:  JSR  bank_switch

loc_DAC3:
$dac3:  JMP  loc_DDF0

sub_DAC6:
$dac6:  LDA  $8014
$dac9:  STA  $55
$dacb:  LDA  $8015
$dace:  STA  $56
$dad0:  LDA  $8016
$dad3:  STA  sub_0000
$dad5:  LDA  $8017
$dad8:  STA  $01
$dada:  LDY  #$01
$dadc:  LDA  $67
$dade:  LDX  #$4d
$dae0:  JSR  sub_C3EA
$dae3:  TAX  
$dae4:  LDY  #$00
$dae6:  LDA  (sub_0000),Y
$dae8:  STA  $0531

loc_DAEB:
$daeb:  CPX  #$00
$daed:  BEQ  loc_DB03
$daef:  LDA  (sub_0000),Y
$daf1:  CLC  
$daf2:  ADC  $55
$daf4:  STA  $55
$daf6:  BCC  loc_DAFA
$daf8:  INC  $56

loc_DAFA:
$dafa:  INY  
$dafb:  LDA  (sub_0000),Y
$dafd:  STA  $0531

; ============================================
; BANK SWITCH AREAS ($df70-$e000)
; ============================================
$df70:  .db $92
$df71:  DEC  $decf,X
$df74:  SBC  $de
$df76:  SBC  $de
$df78:  SBC  $de
$df7a:  LDA  current_bank
$df7d:  PHA  
$df7e:  LDA  $51
$df80:  JSR  bank_switch
$df83:  LDY  #$00
$df85:  LDA  ($49),Y
$df87:  STA  $98
$df89:  JSR  sub_DF9F
$df8c:  LDA  ($49),Y
$df8e:  STA  $99
$df90:  JSR  sub_DF9F
$df93:  LDA  ($49),Y
$df95:  STA  $9a
$df97:  JSR  sub_DF9F
$df9a:  PLA  
$df9b:  JSR  bank_switch
$df9e:  RTS  

sub_DF9F:
$df9f:  PHA  
$dfa0:  INC  $49
$dfa2:  BNE  loc_DFA6
$dfa4:  INC  $4a

loc_DFA6:
$dfa6:  LDA  $49
$dfa8:  CMP  #$d8
$dfaa:  BNE  loc_DFED
$dfac:  LDA  $4a
$dfae:  CMP  #$bf
$dfb0:  BNE  loc_DFED
$dfb2:  INC  current_bank
$dfb5:  INC  $51
$dfb7:  LDA  current_bank
$dfba:  PHA  
$dfbb:  JSR  bank_switch
$dfbe:  PLA  
$dfbf:  CMP  #$05
$dfc1:  BCC  loc_DFE5
$dfc3:  BEQ  loc_DFDE
$dfc5:  LDA  #$1b
$dfc7:  STA  $51
$dfc9:  JSR  bank_switch
$dfcc:  LDA  $dfef
$dfcf:  ASL  A
$dfd0:  TAX  
$dfd1:  LDA  $8000,X
$dfd4:  STA  $49
$dfd6:  LDA  $8001,X
$dfd9:  STA  $4a
$dfdb:  JMP  loc_DFED

loc_DFDE:
$dfde:  LDA  #$1a
$dfe0:  STA  $51
$dfe2:  JSR  bank_switch

loc_DFE5:
$dfe5:  LDA  #$80
$dfe7:  STA  $4a
$dfe9:  LDA  #$00
$dfeb:  STA  $49

loc_DFED:
$dfed:  PLA  
$dfee:  RTS  
$dfef:  ASL  A
$dff0:  .db $bf
$dff1:  LDA  #$00
$dff3:  STA  $07bb
$dff6:  STA  $ea
$dff8:  STA  $eb
$dffa:  JSR  sub_E4F6
$dffd:  JSR  sub_E402

; ============================================
; BANK 29 CALL AREA ($e600-$e700)
; ============================================
$e600:  ORA  $e6,X
$e602:  STA  $6cdc
$e605:  LDA  $e616
$e608:  STA  $6cdd
$e60b:  PLP  
$e60c:  JSR  sub_6CAD
$e60f:  LDA  #$1d
$e611:  JSR  bank_switch
$e614:  RTS  
$e615:  .db $ab
$e616:  .db $f4
$e617:  PHP  
$e618:  STA  $07ca
$e61b:  LDA  $e62b
$e61e:  STA  $6cdc
$e621:  LDA  $e62c
$e624:  STA  $6cdd
$e627:  PLP  
$e628:  JMP  sub_6CAD
$e62b:  TXA  
$e62c:  SBC  $08,X
$e62e:  STA  $07ca
$e631:  LDA  $e641
$e634:  STA  $6cdc
$e637:  LDA  $e642
$e63a:  STA  $6cdd
$e63d:  PLP  
$e63e:  JMP  sub_6CAD
$e641:  .db $8b
$e642:  SBC  $08,X
$e644:  STA  $07ca
$e647:  LDA  $e657
$e64a:  STA  $6cdc
$e64d:  LDA  $e658
$e650:  STA  $6cdd
$e653:  PLP  
$e654:  JMP  sub_6CAD
$e657:  LDX  $08fa,Y
$e65a:  STA  $07ca
$e65d:  LDA  $e66d
$e660:  STA  $6cdc
$e663:  LDA  $e66e
$e666:  STA  $6cdd
$e669:  PLP  
$e66a:  JMP  sub_6CAD
$e66d:  LDX  $a5fa,Y
$e670:  .db $3f
$e671:  CLC  
$e672:  ADC  $49
$e674:  STA  $49
$e676:  BCC  loc_E67A
$e678:  INC  $4a

loc_E67A:
$e67a:  RTS  
$e67b:  LDA  $49
$e67d:  SEC  
$e67e:  SBC  $3f
$e680:  STA  $49
$e682:  BCS  loc_E67A
$e684:  DEC  $4a
$e686:  RTS  
$e687:  LDA  $bf
$e689:  AND  #$01
$e68b:  BNE  loc_E68E
$e68d:  RTS  

loc_E68E:
$e68e:  LDA  #$19
$e690:  STA  $6e86
$e693:  JSR  sub_FF94
$e696:  LDA  #$00
$e698:  STA  $b4
$e69a:  LDA  $b0
$e69c:  AND  #$df
$e69e:  STA  $b0
$e6a0:  LDA  $0621
$e6a3:  ORA  $0623
$e6a6:  ORA  $0625
$e6a9:  ORA  $0627
$e6ac:  BNE  loc_E6B2
$e6ae:  LDA  #$20
$e6b0:  STA  $b0

loc_E6B2:
$e6b2:  LDY  #$04
$e6b4:  LDX  #$08
$e6b6:  JSR  sub_E77C
$e6b9:  LDY  #$04
$e6bb:  LDX  #$08
$e6bd:  JSR  sub_E739
$e6c0:  LDA  $bd
$e6c2:  CLC  
$e6c3:  ADC  $bc
$e6c5:  STA  $bd
$e6c7:  BCC  loc_E6F8

loc_E6C9:
$e6c9:  SBC  #$96
$e6cb:  STA  $bd
$e6cd:  JSR  sub_F0E3
$e6d0:  LDY  #$00
$e6d2:  LDX  #$00
$e6d4:  JSR  sub_E77C
$e6d7:  LDY  #$01
$e6d9:  LDX  #$02
$e6db:  JSR  sub_E77C
$e6de:  LDY  #$02
$e6e0:  LDX  #$04
$e6e2:  JSR  sub_E77C
$e6e5:  JSR  sub_F0F6
$e6e8:  LDY  #$03
$e6ea:  LDX  #$06
$e6ec:  JSR  sub_E77C
$e6ef:  JSR  sub_EEE2
$e6f2:  LDA  $bd
$e6f4:  CMP  #$6a
$e6f6:  BCC  loc_E6C9

loc_E6F8:
$e6f8:  LDY  #$00
$e6fa:  LDX  #$00
$e6fc:  JSR  sub_E739
$e6ff:  LDY  #$01
$e000:  LDA  $41
$e002:  BPL  loc_E015
$e004:  LDA  $45
$e006:  SEC  
$e007:  SBC  #$07
$e009:  STA  $ed
$e00b:  LDA  $44
$e00d:  SEC  
$e00e:  SBC  #$08
$e010:  STA  $ec
$e012:  JMP  loc_E023

loc_E015:
$e015:  LDA  $43
$e017:  SEC  
$e018:  SBC  #$07
$e01a:  STA  $ed
$e01c:  LDA  $42
$e01e:  SEC  
$e01f:  SBC  #$08
$e021:  STA  $ec

loc_E023:
$e023:  LDA  $61
$e025:  ORA  #$01
$e027:  STA  $61
$e029:  JSR  sub_E147
$e02c:  LDA  #$00
$e02e:  STA  $16
$e030:  JSR  sub_E368
$e033:  LDX  #$01

loc_E035:
$e035:  LDA  $7020,X
$e038:  CMP  #$ff
$e03a:  BEQ  loc_E06D
$e03c:  LDA  #$00
$e03e:  STA  $7100,X
$e041:  STA  $7120,X
$e044:  LDA  $7000,X
$e047:  STA  $e4
$e049:  LDA  $7020,X
$e04c:  AND  #$90
$e04e:  BNE  loc_E060
$e050:  JSR  sub_E169
$e053:  LDA  $e4
$e055:  STA  $7000,X
$e058:  BCC  loc_E068
$e05a:  JSR  sub_E368
$e05d:  JMP  loc_E068

loc_E060:
$e060:  JSR  sub_E160
$e063:  LDA  $e4
$e065:  STA  $7000,X

loc_E068:
$e068:  INX  
$e069:  CPX  #$1e
$e06b:  BCC  loc_E035

loc_E06D:
$e06d:  RTS  

sub_E06E:
$e06e:  JSR  sub_E147
$e071:  LDA  $3e
$e073:  BEQ  loc_E0BE
$e075:  LDA  $7000
$e078:  AND  #$03
$e07a:  BNE  loc_E08C
$e07c:  LDA  $eb
$e07e:  SEC  
$e07f:  SBC  $058f
$e082:  STA  $eb
$e084:  BCS  loc_E089
$e086:  DEC  $00ed

loc_E089:
$e089:  JMP  loc_E0BE

loc_E08C:
$e08c:  CMP  #$01
$e08e:  BNE  loc_E09F
$e090:  LDA  $ea
$e092:  CLC  
$e093:  ADC  $058f
$e096:  STA  $ea
$e098:  BCC  loc_E09C
$e09a:  INC  $ec

loc_E09C:
$e09c:  JMP  loc_E0BE

loc_E09F:
$e09f:  CMP  #$02
$e0a1:  BNE  loc_E0B2
$e0a3:  LDA  $eb
$e0a5:  CLC  
$e0a6:  ADC  $058f
$e0a9:  STA  $eb
$e0ab:  BCC  loc_E0AF
$e0ad:  INC  $ed

loc_E0AF:
$e0af:  JMP  loc_E0BE

loc_E0B2:
$e0b2:  LDA  $ea
$e0b4:  SEC  
$e0b5:  SBC  $058f
$e0b8:  STA  $ea
$e0ba:  BCS  loc_E0BE
$e0bc:  DEC  $ec

loc_E0BE:
$e0be:  LDX  #$01

loc_E0C0:
$e0c0:  LDA  $7020,X
$e0c3:  CMP  #$ff
$e0c5:  BNE  loc_E0C8
$e0c7:  RTS  

loc_E0C8:
$e0c8:  LDA  $7000,X
$e0cb:  STA  $e4
$e0cd:  BMI  loc_E0EA
$e0cf:  LDA  $7020,X
$e0d2:  AND  #$90
$e0d4:  BEQ  loc_E0DC
$e0d6:  JSR  sub_E160
$e0d9:  JMP  loc_E0DF

loc_E0DC:
$e0dc:  JSR  sub_E169

loc_E0DF:
$e0df:  LDA  $e4
$e0e1:  STA  $7000,X
$e0e4:  INX  
$e0e5:  CPX  #$1e
$e0e7:  BCC  loc_E0C0
$e0e9:  RTS  

loc_E0EA:
$e0ea:  LDA  #$0f
$e0ec:  STA  $e3
$e0ee:  LDY  #$10
$e0f0:  LDA  $70e0,X
$e0f3:  AND  #$40
$e0f5:  BEQ  loc_E0FB
$e0f7:  LDY  #$20
$e0f9:  LSR  $e3

loc_E0FB:
$e0fb:  STY  $e2
$e0fd:  LDA  $7020,X

