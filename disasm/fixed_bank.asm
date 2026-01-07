; Dragon Warrior IV (NES) - Fixed Bank Disassembly
; ================================================
; PRG-ROM: 512KB (32 x 16KB banks)
; Fixed banks: $C000-$FFFF (last 16KB)
;
; CPU Vectors:
;   NMI:   $0502 (RAM - jumps to $C15A on init)
;   RESET: $FFD8
;   IRQ:   $C408
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
; RESET HANDLER ($FFD8)
; ============================================

RESET_entry:
$FFD8:  SEI	; Entry point from RESET vector
$FFD9:  INC  $FFDF
$FFDC:  JMP  main_init
$FFDF:  .byte $80
$FFE0:  .byte $44
$FFE1:  .byte $52
$FFE2:  EOR  ($47,X)
$FFE4:  .byte $4F
$FFE5:  LSR  $5120
$FFE8:  EOR  $45,X
$FFEA:  .byte $53
$FFEB:  .byte $54
$FFEC:  JSR  sub_5649
$FFEF:  JSR  sub_FFFF
$FFF2:  BRK  
$FFF3:  BRK  
$FFF4:  PHA  
$FFF5:  .byte $04
$FFF6:  ORA  ($0F,X)
$FFF8:  .byte $07
$FFF9:  STA  NMI_JMP,X

; ============================================
; VECTORS ($FFFA-$FFFF)
; ============================================
  .word $0502  ; NMI
  .word $FFD8  ; RESET
  .word $C408  ; IRQ

; ============================================
; MAIN INIT ($C03D)
; ============================================

main_init:
$C03D:  CLD	; Main initialization routine

loc_C03E:
$C03E:  LDA  PPUSTATUS
$C041:  BPL  loc_C03E

loc_C043:
$C043:  LDA  PPUSTATUS
$C046:  BPL  loc_C043
$C048:  NOP  
$C049:  NOP  
$C04A:  NOP  
$C04B:  NOP  
$C04C:  NOP  
$C04D:  NOP  
$C04E:  LDA  #$10
$C050:  STA  PPUCTRL
$C053:  LDA  #$00
$C055:  STA  PPUMASK
$C058:  STA  sub_FFFF
$C05B:  STA  sub_FFFF
$C05E:  STA  sub_FFFF
$C061:  STA  sub_FFFF
$C064:  STA  sub_FFFF
$C067:  LDA  #$4C  ; Set up NMI jump instruction in RAM
$C069:  STA  NMI_JMP
$C06C:  LDA  $C0D2
$C06F:  STA  NMI_target_lo
$C072:  LDA  $C0D3
$C075:  STA  NMI_target_hi
$C078:  LDX  #$FF  ; Initialize stack pointer
$C07A:  TXS  
$C07B:  LDA  #$00
$C07D:  TAX  

loc_C07E:
$C07E:  STA  $00,X  ; Clear zero page and RAM
$C080:  STA  $0300,X
$C083:  STA  $0400,X
$C086:  STA  $0505,X
$C089:  STA  $0600,X
$C08C:  STA  $0700,X
$C08F:  INX  
$C090:  BNE  loc_C07E
$C092:  LDA  #$0E
$C094:  STA  vblank_flag
$C097:  LDA  #$10
$C099:  STA  ppuctrl_shadow
$C09C:  STA  $39
$C09E:  JSR  init_subroutine
$C0A1:  LDA  PPUSTATUS
$C0A4:  LDA  #$10
$C0A6:  STA  PPUADDR
$C0A9:  LDA  #$00
$C0AB:  STA  PPUADDR
$C0AE:  LDX  #$10

loc_C0B0:
$C0B0:  STA  PPUDATA
$C0B3:  DEX  
$C0B4:  BNE  loc_C0B0
$C0B6:  LDA  #$90
$C0B8:  STA  $0505
$C0BB:  STA  PPUCTRL
$C0BE:  JSR  sub_C569
$C0C1:  JSR  clear_oam_buffer
$C0C4:  JSR  wait_vblank
$C0C7:  LDA  #$18
$C0C9:  STA  $0506
$C0CC:  STA  PPUMASK
$C0CF:  JMP  main_loop_entry
$C0D2:  .byte $5A
$C0D3:  CMP  ($AD,X)
$C0D5:  .byte $02
$C0D6:  JSR  sub_FB10

loc_C0D9:
$C0D9:  LDA  PPUSTATUS
$C0DC:  BMI  loc_C0D9

loc_C0DE:
$C0DE:  LDA  PPUSTATUS
$C0E1:  BPL  loc_C0DE

loc_C0E3:
$C0E3:  LDA  PPUSTATUS
$C0E6:  BMI  loc_C0E3
$C0E8:  RTS  
$C0E9:  LDA  #$40
$C0EB:  STA  NMI_JMP
$C0EE:  LDA  #$00
$C0F0:  STA  sub_FFFF
$C0F3:  STA  sub_FFFF
$C0F6:  STA  sub_FFFF
$C0F9:  STA  sub_FFFF
$C0FC:  LDA  #$01
$C0FE:  STA  sub_FFFF

loc_C101:
$C101:  JMP  loc_C101

init_subroutine:
$C104:  INC  $FFDF
$C107:  LDA  vblank_flag
$C10A:  JSR  mmc1_write_control
$C10D:  LDA  ppuctrl_shadow
$C110:  JSR  mmc1_write_chr1
$C113:  LDA  #$00
$C115:  JMP  mmc1_write_prg

mmc1_write_control:
$C118:  STA  vblank_flag
$C11B:  STA  $9FFF
$C11E:  LSR  A
$C11F:  STA  $9FFF
$C122:  LSR  A
$C123:  STA  $9FFF
$C126:  LSR  A
$C127:  STA  $9FFF
$C12A:  LSR  A
$C12B:  STA  $9FFF
$C12E:  RTS  

mmc1_write_chr1:
$C12F:  STA  ppuctrl_shadow
$C132:  STA  $BFFF
$C135:  LSR  A
$C136:  STA  $BFFF
$C139:  LSR  A
$C13A:  STA  $BFFF
$C13D:  LSR  A
$C13E:  STA  $BFFF
$C141:  LSR  A
$C142:  STA  $BFFF
$C145:  RTS  

mmc1_write_prg:
$C146:  STA  $DFFF
$C149:  LSR  A
$C14A:  STA  $DFFF
$C14D:  LSR  A
$C14E:  STA  $DFFF
$C151:  LSR  A
$C152:  STA  $DFFF
$C155:  LSR  A
$C156:  STA  $DFFF
$C159:  RTS  

NMI_main:
$C15A:  PHA  
$C15B:  TXA  
$C15C:  PHA  
$C15D:  TYA  
$C15E:  PHA  
$C15F:  LDA  $1F
$C161:  BMI  loc_C181
$C163:  TSX  
$C164:  LDY  $0106,X
$C167:  INY  
$C168:  BNE  loc_C181
$C16A:  LDA  $0105,X
$C16D:  CMP  #$77
$C16F:  BCC  loc_C181
$C171:  CMP  #$81
$C173:  BCS  loc_C181
$C175:  LDA  PPUSTATUS
$C178:  JSR  ppu_buffer_transfer
$C17B:  JSR  oam_dma
$C17E:  JSR  ppu_set_scroll

loc_C181:
$C181:  TSX  
$C182:  LDY  $0106,X
$C185:  INY  
$C186:  BNE  loc_C19B
$C188:  LDA  $0105,X
$C18B:  CMP  #$AB
$C18D:  BCC  loc_C19B
$C18F:  CMP  #$D6
$C191:  BCS  loc_C19B
$C193:  LDA  #$D6
$C195:  STA  $0105,X
$C198:  JSR  init_subroutine

loc_C19B:
$C19B:  LDA  $0519
$C19E:  BNE  loc_C1B0
$C1A0:  INC  $C221
$C1A3:  LDA  #$10
$C1A5:  JSR  mmc1_write_chr1
$C1A8:  LDA  #$10
$C1AA:  JSR  mmc1_write_chr1
$C1AD:  JSR  sub_C019

loc_C1B0:
$C1B0:  LDA  current_bank
$C1B3:  JSR  bank_switch
$C1B6:  NOP  
$C1B7:  NOP  
$C1B8:  NOP  
$C1B9:  NOP  
$C1BA:  NOP  
$C1BB:  NOP  
$C1BC:  NOP  
$C1BD:  TSX  
$C1BE:  LDA  $0106,X
$C1C1:  CMP  #$6C
$C1C3:  BNE  loc_C1EF
$C1C5:  LDA  $0105,X
$C1C8:  CMP  #$B9
$C1CA:  BCC  loc_C1DD
$C1CC:  CMP  #$D6
$C1CE:  BCS  loc_C1DD
$C1D0:  LDA  #$D6
$C1D2:  STA  $0105,X
$C1D5:  LDA  #$00
$C1D7:  JSR  mmc1_write_chr1
$C1DA:  JMP  loc_C1EF

loc_C1DD:
$C1DD:  CMP  #$E9
$C1DF:  BCC  loc_C1EF
$C1E1:  CMP  #$FF
$C1E3:  BCS  loc_C1EF
$C1E5:  LDA  #$FF
$C1E7:  STA  $0105,X
$C1EA:  LDA  #$10
$C1EC:  JSR  mmc1_write_chr1

loc_C1EF:
$C1EF:  INC  $050C
$C1F2:  TSX  
$C1F3:  LDA  $0105,X
$C1F6:  STA  $10
$C1F8:  LDA  $0106,X
$C1FB:  STA  $11
$C1FD:  LDY  #$00
$C1FF:  LDA  ($10),Y

; ============================================
; NMI HANDLER ($C15A)
; ============================================

NMI_main:
$C15A:  PHA  
$C15B:  TXA  
$C15C:  PHA  
$C15D:  TYA  
$C15E:  PHA  
$C15F:  LDA  $1F
$C161:  BMI  loc_C181
$C163:  TSX  
$C164:  LDY  $0106,X
$C167:  INY  
$C168:  BNE  loc_C181
$C16A:  LDA  $0105,X
$C16D:  CMP  #$77
$C16F:  BCC  loc_C181
$C171:  CMP  #$81
$C173:  BCS  loc_C181
$C175:  LDA  PPUSTATUS
$C178:  JSR  ppu_buffer_transfer
$C17B:  JSR  oam_dma
$C17E:  JSR  ppu_set_scroll

loc_C181:
$C181:  TSX  
$C182:  LDY  $0106,X
$C185:  INY  
$C186:  BNE  loc_C19B
$C188:  LDA  $0105,X
$C18B:  CMP  #$AB
$C18D:  BCC  loc_C19B
$C18F:  CMP  #$D6
$C191:  BCS  loc_C19B
$C193:  LDA  #$D6
$C195:  STA  $0105,X
$C198:  JSR  init_subroutine

loc_C19B:
$C19B:  LDA  $0519
$C19E:  BNE  loc_C1B0
$C1A0:  INC  $C221
$C1A3:  LDA  #$10
$C1A5:  JSR  mmc1_write_chr1
$C1A8:  LDA  #$10
$C1AA:  JSR  mmc1_write_chr1
$C1AD:  JSR  sub_C019

loc_C1B0:
$C1B0:  LDA  current_bank
$C1B3:  JSR  bank_switch
$C1B6:  NOP  
$C1B7:  NOP  
$C1B8:  NOP  
$C1B9:  NOP  
$C1BA:  NOP  
$C1BB:  NOP  
$C1BC:  NOP  
$C1BD:  TSX  
$C1BE:  LDA  $0106,X
$C1C1:  CMP  #$6C
$C1C3:  BNE  loc_C1EF
$C1C5:  LDA  $0105,X
$C1C8:  CMP  #$B9
$C1CA:  BCC  loc_C1DD
$C1CC:  CMP  #$D6
$C1CE:  BCS  loc_C1DD
$C1D0:  LDA  #$D6
$C1D2:  STA  $0105,X
$C1D5:  LDA  #$00
$C1D7:  JSR  mmc1_write_chr1
$C1DA:  JMP  loc_C1EF

loc_C1DD:
$C1DD:  CMP  #$E9
$C1DF:  BCC  loc_C1EF
$C1E1:  CMP  #$FF
$C1E3:  BCS  loc_C1EF
$C1E5:  LDA  #$FF
$C1E7:  STA  $0105,X
$C1EA:  LDA  #$10
$C1EC:  JSR  mmc1_write_chr1

loc_C1EF:
$C1EF:  INC  $050C
$C1F2:  TSX  
$C1F3:  LDA  $0105,X
$C1F6:  STA  $10
$C1F8:  LDA  $0106,X
$C1FB:  STA  $11
$C1FD:  LDY  #$00
$C1FF:  LDA  ($10),Y
$C201:  AND  #$0F
$C203:  CMP  #$07
$C205:  BEQ  loc_C219
$C207:  CMP  #$0F
$C209:  BEQ  loc_C219
$C20B:  CMP  #$03
$C20D:  BEQ  loc_C219
$C20F:  CMP  #$0B
$C211:  BEQ  loc_C219
$C213:  PLA  
$C214:  TAY  
$C215:  PLA  
$C216:  TAX  
$C217:  PLA  
$C218:  RTI  

loc_C219:
$C219:  PLA  
$C21A:  TAY  
$C21B:  PLA  
$C21C:  TAX  
$C21D:  PLA  
$C21E:  JMP  IRQ_handler
$C221:  .byte $80

ppu_buffer_transfer:
$C222:  LDA  $1F
$C224:  AND  #$20
$C226:  BNE  loc_C23A
$C228:  LDA  $1F
$C22A:  AND  #$10
$C22C:  BEQ  loc_C231
$C22E:  JMP  loc_C297

loc_C231:
$C231:  LDA  $1F
$C233:  AND  #$04
$C235:  BEQ  loc_C276
$C237:  JMP  loc_C315

loc_C23A:
$C23A:  LDX  #$00
$C23C:  LDA  $050B
$C23F:  BEQ  loc_C276

loc_C241:
$C241:  LDY  #$01
$C243:  LDA  $0300,X
$C246:  BPL  loc_C25C
$C248:  TAY  
$C249:  LSR  A
$C24A:  LSR  A
$C24B:  LSR  A
$C24C:  LSR  A
$C24D:  AND  #$04
$C24F:  ORA  $0505
$C252:  STA  PPUCTRL
$C255:  TYA  
$C256:  INX  
$C257:  LDY  $0300,X
$C25A:  AND  #$3F

loc_C25C:
$C25C:  INX  
$C25D:  STA  PPUADDR
$C260:  LDA  $0300,X
$C263:  INX  
$C264:  STA  PPUADDR

loc_C267:
$C267:  LDA  $0300,X
$C26A:  INX  
$C26B:  STA  PPUDATA
$C26E:  DEY  
$C26F:  BNE  loc_C267
$C271:  DEC  $050B
$C274:  BNE  loc_C241

loc_C276:
$C276:  LDA  $0506
$C279:  AND  #$08
$C27B:  BEQ  loc_C296
$C27D:  LDA  #$3F
$C27F:  STA  PPUADDR
$C282:  LDA  #$00
$C284:  STA  PPUADDR
$C287:  STA  $050A
$C28A:  LDA  $05FC
$C28D:  STA  PPUDATA
$C290:  LDA  $1F
$C292:  AND  #$DF
$C294:  STA  $1F

loc_C296:
$C296:  RTS  

loc_C297:
$C297:  LDX  #$00

loc_C299:
$C299:  LDA  $0300,X
$C29C:  STA  PPUADDR
$C29F:  LDA  $0301,X
$C2A2:  STA  PPUADDR
$C2A5:  PHA  
$C2A6:  LDA  $0302,X
$C2A9:  STA  PPUDATA
$C2AC:  LDA  $0303,X
$C2AF:  STA  PPUDATA
$C2B2:  LDA  $0300,X
$C2B5:  STA  PPUADDR
$C2B8:  PLA  
$C2B9:  CLC  
$C2BA:  ADC  #$20
$C2BC:  STA  PPUADDR
$C2BF:  LDA  $0304,X
$C2C2:  STA  PPUDATA
$C2C5:  LDA  $0305,X
$C2C8:  STA  PPUDATA
$C2CB:  LDA  $0306,X
$C2CE:  STA  PPUADDR
$C2D1:  LDA  $0307,X
$C2D4:  STA  PPUADDR
$C2D7:  LDA  $0308,X
$C2DA:  STA  PPUDATA
$C2DD:  TXA  
$C2DE:  CLC  
$C2DF:  ADC  #$09
$C2E1:  TAX  
$C2E2:  DEC  $050B
$C2E5:  BNE  loc_C299
$C2E7:  JMP  loc_C276

ppu_set_scroll:
$C2EA:  LDA  $0505
$C2ED:  STA  PPUCTRL
$C2F0:  LDA  $0506
$C2F3:  STA  PPUMASK
$C2F6:  LDA  $0508
$C2F9:  STA  PPUSCROLL
$C2FC:  LDA  $0509
$C2FF:  STA  PPUSCROLL

; ============================================
; IRQ HANDLER ($C408)
; ============================================

IRQ_handler:
$C408:  SEI  
$C409:  PHP  
$C40A:  BIT  APU_STATUS
$C40D:  STA  $20
$C40F:  STX  $21
$C411:  STY  $22
$C413:  TSX  
$C414:  LDA  $0103,X
$C417:  SEC  
$C418:  SBC  #$01
$C41A:  STA  $26
$C41C:  LDA  $0104,X
$C41F:  SBC  #$00
$C421:  STA  $27
$C423:  LDY  #$01
$C425:  LDA  ($26),Y
$C427:  PHA  
$C428:  AND  #$0F
$C42A:  CMP  #$0B
$C42C:  BEQ  loc_C463
$C42E:  CMP  #$03
$C430:  BEQ  loc_C460
$C432:  PLA  
$C433:  PHA  
$C434:  AND  #$08
$C436:  CMP  #$08
$C438:  PLA  
$C439:  ROR  A
$C43A:  LSR  A
$C43B:  LSR  A
$C43C:  LSR  A
$C43D:  STA  $23
$C43F:  DEY  
$C440:  LDA  ($26),Y
$C442:  BMI  loc_C451
$C444:  STA  $24
$C446:  LDY  $22
$C448:  LDX  $21
$C44A:  PLP  
$C44B:  PLA  
$C44C:  LDA  $20
$C44E:  JMP  loc_C38B

loc_C451:
$C451:  AND  #$3F
$C453:  STA  $24
$C455:  LDY  $22
$C457:  LDX  $21
$C459:  PLP  
$C45A:  PLA  
$C45B:  LDA  $20
$C45D:  JMP  loc_C3CE

loc_C460:
$C460:  JMP  loc_C4F8

loc_C463:
$C463:  PLA  
$C464:  CMP  #$CB
$C466:  BCC  loc_C484
$C468:  CMP  #$FB
$C46A:  BCC  loc_C4A1
$C46C:  LDA  #$19
$C46E:  STA  $23
$C470:  LDA  #$03
$C472:  STA  $24
$C474:  DEY  
$C475:  LDA  ($26),Y
$C477:  STA  $20
$C479:  LDY  $22
$C47B:  LDX  $21
$C47D:  PLP  
$C47E:  PLA  
$C47F:  LDA  $20
$C481:  JMP  loc_C38B

loc_C484:
$C484:  PHA  
$C485:  LDA  #$16
$C487:  STA  $23
$C489:  LDA  #$04
$C48B:  STA  $24
$C48D:  DEY  
$C48E:  PLA  
$C48F:  LSR  A
$C490:  LSR  A
$C491:  LSR  A
$C492:  LSR  A
$C493:  TAX  
$C494:  LDA  ($26),Y
$C496:  STA  $20
$C498:  LDY  $22
$C49A:  PLP  
$C49B:  PLA  
$C49C:  LDA  $20
$C49E:  JMP  loc_C38B

loc_C4A1:
$C4A1:  PLP  
$C4A2:  PHA  
$C4A3:  TSX  
$C4A4:  INC  $0103,X
$C4A7:  BNE  loc_C4AC
$C4A9:  INC  $0104,X

loc_C4AC:
$C4AC:  PLA  
$C4AD:  PLP  
$C4AE:  CMP  #$CB
$C4B0:  BEQ  loc_C4CA
$C4B2:  CMP  #$DB
$C4B4:  BEQ  loc_C4E1
$C4B6:  DEY  
$C4B7:  LDA  ($26),Y
$C4B9:  TAX  
$C4BA:  INY  
$C4BB:  INY  
$C4BC:  LDA  $627B,X
$C4BF:  AND  ($26),Y
$C4C1:  PHP  
$C4C2:  LDX  $21
$C4C4:  LDY  $22
$C4C6:  LDA  $20
$C4C8:  PLP  
$C4C9:  RTS  

loc_C4CA:
$C4CA:  DEY  
$C4CB:  LDA  ($26),Y
$C4CD:  TAX  
$C4CE:  INY  
$C4CF:  INY  
$C4D0:  LDA  $627B,X
$C4D3:  ORA  ($26),Y
$C4D5:  STA  $627B,X
$C4D8:  PHP  
$C4D9:  LDX  $21
$C4DB:  LDY  $22
$C4DD:  LDA  $20
$C4DF:  PLP  
$C4E0:  RTS  

loc_C4E1:
$C4E1:  DEY  
$C4E2:  LDA  ($26),Y
$C4E4:  TAX  
$C4E5:  INY  
$C4E6:  INY  
$C4E7:  LDA  $627B,X
$C4EA:  AND  ($26),Y
$C4EC:  STA  $627B,X
$C4EF:  PHP  
$C4F0:  LDX  $21
$C4F2:  LDY  $22
$C4F4:  LDA  $20
$C4F6:  PLP  
$C4F7:  RTS  

loc_C4F8:
$C4F8:  INY  
$C4F9:  LDA  ($26),Y
$C4FB:  STA  $78
$C4FD:  DEY  
$C4FE:  DEY  
$C4FF:  LDA  ($26),Y
$C501:  STA  $76
$C503:  PLA  
$C504:  STA  $77
$C506:  AND  #$F0
$C508:  LSR  A
$C509:  LSR  A
$C50A:  LSR  A
$C50B:  LSR  A
$C50C:  CMP  #$0A
$C50E:  BCC  loc_C516
$C510:  CMP  #$0D
$C512:  BCS  loc_C527
$C514:  ADC  #$18

loc_C516:
$C516:  STA  $24
$C518:  LDA  #$10

loc_C51A:
$C51A:  STA  $23
$C51C:  LDY  $22
$C51E:  LDX  $21
$C520:  PLP  
$C521:  PLA  
$C522:  LDA  $20
$C524:  JMP  loc_C38B

loc_C527:
$C527:  SBC  #$0C
$C529:  STA  $24
$C52B:  LDA  #$12
$C52D:  BNE  loc_C51A

clear_system_state:
$C52F:  LDA  #$00
$C531:  STA  $1F
$C533:  STA  $050A
$C536:  STA  $050B
$C539:  STA  $0508
$C53C:  STA  $0509
$C53F:  STA  $0513
$C542:  RTS  

clear_oam_buffer:
$C543:  LDA  #$F7
$C545:  LDX  #$00

loc_C547:
$C547:  STA  $0200,X
$C54A:  INX  
$C54B:  BNE  loc_C547
$C54D:  RTS  
$C54E:  JSR  sub_C5AF

; ============================================
; MAIN GAME LOOP AREA ($C900-$CA00)
; ============================================
$C900:  ASL  $40,X
$C902:  LSR  A
$C903:  BCS  loc_C906
$C905:  LSR  A

loc_C906:
$C906:  ROR  $14,X
$C908:  DEY  
$C909:  BNE  loc_C8FF
$C90B:  RTS  

loc_C90C:
$C90C:  JSR  wait_vblank
$C90F:  DEX  
$C910:  BNE  loc_C90C
$C912:  RTS  

sub_C913:
$C913:  TXA  
$C914:  PHA  
$C915:  TYA  
$C916:  PHA  
$C917:  JSR  oam_shuffle
$C91A:  PLA  
$C91B:  TAY  
$C91C:  PLA  
$C91D:  TAX  
$C91E:  RTS  

oam_shuffle:
$C91F:  LDA  $1F
$C921:  AND  #$C8
$C923:  BNE  loc_C94A
$C925:  LDA  $0513
$C928:  AND  #$01
$C92A:  TAX  
$C92B:  LDA  $C94B,X
$C92E:  PHA  
$C92F:  LDA  $C94C,X
$C932:  LDX  #$40
$C934:  JSR  sub_C94E
$C937:  LDX  #$10
$C939:  PLA  
$C93A:  JSR  sub_C94E
$C93D:  LDX  $0513
$C940:  INX  
$C941:  CPX  #$0A
$C943:  BCC  loc_C947
$C945:  LDX  #$00

loc_C947:
$C947:  STX  $0513

loc_C94A:
$C94A:  RTS  
$C94B:  BNE  loc_C8ED
$C94D:  BVS  loc_C8F7
$C94F:  LDA  #$30
$C951:  STA  $10

loc_C953:
$C953:  LDA  $0200,X
$C956:  PHA  
$C957:  LDA  $0200,Y
$C95A:  STA  $0200,X
$C95D:  PLA  
$C95E:  STA  $0200,Y
$C961:  INX  
$C962:  INY  
$C963:  DEC  $10
$C965:  BNE  loc_C953
$C967:  RTS  

main_loop_entry:
$C968:  JSR  setup_bank_trampoline
$C96B:  JSR  clear_system_state
$C96E:  BRK  
$C96F:  .byte $0B
$C970:  .byte $BF
$C971:  BRK  
$C972:  ORA  $002F
$C975:  .byte $0C
$C976:  .byte $EF
$C977:  BRK  
$C978:  .byte $34
$C979:  .byte $EF
$C97A:  BRK  
$C97B:  .byte $22
$C97C:  .byte $EF

main_loop:
$C97D:  JSR  main_frame_handler
$C980:  JMP  main_loop

setup_bank_trampoline:
$C983:  LDX  #$5D

loc_C985:
$C985:  LDA  $C98F,X
$C988:  STA  $6CAD,X
$C98B:  DEX  
$C98C:  BPL  loc_C985
$C98E:  RTS  
$C98F:  PHP  
$C990:  LDA  current_bank
$C993:  STA  $07CC
$C996:  LDA  #$0F
$C998:  STA  current_bank
$C99B:  NOP  
$C99C:  NOP  
$C99D:  LDA  #$00
$C99F:  STA  ppuctrl_shadow
$C9A2:  STA  $39
$C9A4:  STA  $BFFF
$C9A7:  LSR  A
$C9A8:  STA  $BFFF
$C9AB:  LSR  A
$C9AC:  STA  $BFFF
$C9AF:  LSR  A
$C9B0:  STA  $BFFF
$C9B3:  LSR  A
$C9B4:  STA  $BFFF
$C9B7:  NOP  
$C9B8:  NOP  
$C9B9:  LDA  $07CA
$C9BC:  PLP  
$C9BD:  JSR  sub_0000
$C9C0:  PHP  
$C9C1:  STA  $07CA
$C9C4:  LDA  #$10
$C9C6:  STA  ppuctrl_shadow
$C9C9:  STA  $39
$C9CB:  NOP  
$C9CC:  NOP  
$C9CD:  STA  $BFFF
$C9D0:  LSR  A
$C9D1:  STA  $BFFF
$C9D4:  LSR  A
$C9D5:  STA  $BFFF
$C9D8:  LSR  A
$C9D9:  STA  $BFFF
$C9DC:  LSR  A
$C9DD:  STA  $BFFF
$C9E0:  NOP  
$C9E1:  NOP  
$C9E2:  LDA  $07CC
$C9E5:  JSR  bank_switch
$C9E8:  LDA  $07CA
$C9EB:  PLP  
$C9EC:  RTS  

main_frame_handler:
$C9ED:  JSR  sub_CBB4
$C9F0:  JSR  sub_CB98
$C9F3:  JSR  sub_CA21
$C9F6:  JSR  sub_D542
$C9F9:  JSR  sub_E06E
$C9FC:  BRK  
$C9FD:  BRK  
$C9FE:  .byte $DF
$C9FF:  JSR  sub_C001

; ============================================
; UTILITY ROUTINES ($FF00-$FFFF)
; ============================================
$FF00:  .byte $03
$FF01:  .byte $03
$FF02:  DEX  
$FF03:  BPL  loc_FEFF
$FF05:  LDA  #$0F
$FF07:  JSR  mmc1_write_control
$FF0A:  INC  $050B
$FF0D:  JMP  loc_C626
$FF10:  LDY  #$02
$FF12:  LDX  #$00

loc_FF14:
$FF14:  NOP  
$FF15:  DEX  
$FF16:  BNE  loc_FF14
$FF18:  DEY  
$FF19:  BNE  loc_FF14

loc_FF1B:
$FF1B:  BIT  PPUSTATUS
$FF1E:  BVC  loc_FF1B
$FF20:  LDA  $7B
$FF22:  STA  PPUSCROLL
$FF25:  LDA  #$80
$FF27:  STA  PPUSCROLL
$FF2A:  LDY  #$01
$FF2C:  LDX  #$00

loc_FF2E:
$FF2E:  NOP  
$FF2F:  DEX  
$FF30:  BNE  loc_FF2E
$FF32:  DEY  
$FF33:  BNE  loc_FF2E
$FF35:  LDA  $7C
$FF37:  STA  PPUSCROLL
$FF3A:  LDA  #$00
$FF3C:  STA  PPUSCROLL
$FF3F:  LDA  $7F
$FF41:  AND  #$03
$FF43:  BNE  loc_FF4C
$FF45:  LDA  $7B
$FF47:  CLC  
$FF48:  ADC  #$01
$FF4A:  STA  $7B

loc_FF4C:
$FF4C:  LDA  $7F
$FF4E:  AND  #$01
$FF50:  BNE  loc_FF59
$FF52:  LDA  $7C
$FF54:  CLC  
$FF55:  ADC  #$01
$FF57:  STA  $7C

loc_FF59:
$FF59:  INC  $7F
$FF5B:  JMP  wait_vblank
$FF5E:  ORA  ($02,X)
$FF60:  .byte $04
$FF61:  PHP  
$FF62:  BPL  loc_FF84
$FF64:  RTI  
$FF65:  .byte $80
$FF66:  .byte $FF
$FF67:  .byte $FF
$FF68:  .byte $FF
$FF69:  .byte $FF
$FF6A:  .byte $FF
$FF6B:  .byte $FF
$FF6C:  .byte $FF
$FF6D:  .byte $FF
$FF6E:  .byte $FF
$FF6F:  .byte $FF
$FF70:  .byte $FF
$FF71:  .byte $FF
$FF72:  .byte $FF
$FF73:  .byte $FF

wait_vblank:
$FF74:  LDA  $050C

loc_FF77:
$FF77:  NOP  
$FF78:  NOP  
$FF79:  INC  $12
$FF7B:  CMP  $050C
$FF7E:  BEQ  loc_FF77
$FF80:  NOP  
$FF81:  NOP  
$FF82:  JSR  sub_C913
$FF85:  RTS  
$FF86:  .byte $FF
$FF87:  .byte $FF
$FF88:  .byte $FF
$FF89:  .byte $FF
$FF8A:  .byte $FF
$FF8B:  .byte $FF
$FF8C:  .byte $FF
$FF8D:  .byte $FF
$FF8E:  JMP  main_init

bank_switch:
$FF91:  STA  current_bank
$FF94:  PHA  
$FF95:  LDA  ppuctrl_shadow
$FF98:  AND  #$EF
$FF9A:  STA  ppuctrl_shadow
$FF9D:  PLA  
$FF9E:  PHA  
$FF9F:  AND  #$10
$FFA1:  ORA  ppuctrl_shadow
$FFA4:  STA  ppuctrl_shadow
$FFA7:  PLA  
$FFA8:  AND  #$0F
$FFAA:  NOP  
$FFAB:  NOP  
$FFAC:  STA  sub_FFFF
$FFAF:  LSR  A
$FFB0:  STA  sub_FFFF
$FFB3:  LSR  A
$FFB4:  STA  sub_FFFF
$FFB7:  LSR  A
$FFB8:  STA  sub_FFFF
$FFBB:  LSR  A
$FFBC:  STA  sub_FFFF
$FFBF:  LDA  ppuctrl_shadow
$FFC2:  STA  $BFFF
$FFC5:  LSR  A
$FFC6:  STA  $BFFF
$FFC9:  LSR  A
$FFCA:  STA  $BFFF
$FFCD:  LSR  A
$FFCE:  STA  $BFFF
$FFD1:  LSR  A
$FFD2:  STA  $BFFF
$FFD5:  NOP  
$FFD6:  NOP  
$FFD7:  RTS  

; ============================================
; GAME LOOP SUBROUTINES ($CA00-$CC00)
; ============================================
$CA00:  ORA  ($C0,X)
$CA02:  JSR  sub_CE09
$CA05:  JSR  sub_D7D5
$CA08:  LDX  $052F
$CA0B:  JSR  loc_C90C
$CA0E:  JSR  sub_CA17
$CA11:  JSR  sub_D1E1
$CA14:  INC  $3C
$CA16:  RTS  

sub_CA17:
$CA17:  JSR  sub_D241
$CA1A:  LDA  $14
$CA1C:  AND  #$04
$CA1E:  BNE  sub_CA17
$CA20:  RTS  

sub_CA21:
$CA21:  LDX  $058E
$CA24:  LDA  loc_CA3C,X
$CA27:  AND  $3C
$CA29:  BNE  loc_CA3C
$CA2B:  LDA  #$01
$CA2D:  STA  $052F
$CA30:  JSR  sub_CA41
$CA33:  JSR  sub_CB1E
$CA36:  JSR  sub_CBF8
$CA39:  JSR  sub_CB71

loc_CA3C:
$CA3C:  RTS  
$CA3D:  .byte $0F
$CA3E:  .byte $07
$CA3F:  .byte $0F
$CA40:  .byte $03

sub_CA41:
$CA41:  LDA  $0530
$CA44:  BPL  loc_CA55
$CA46:  LDA  #$FF
$CA48:  STA  $56
$CA4A:  JSR  sub_DB18
$CA4D:  STA  $14
$CA4F:  LDA  $0530
$CA52:  BPL  loc_CA55
$CA54:  RTS  

loc_CA55:
$CA55:  LDA  $0515
$CA58:  CMP  #$02
$CA5A:  BNE  loc_CA77
$CA5C:  JSR  sub_D241
$CA5F:  LDA  $14
$CA61:  AND  #$F0
$CA63:  BNE  loc_CA71
$CA65:  LDA  $0597
$CA68:  BEQ  loc_CA76
$CA6A:  LDX  $3D
$CA6C:  LDA  $CB1A,X
$CA6F:  STA  $14

loc_CA71:
$CA71:  LDA  #$FF
$CA73:  STA  $0597

loc_CA76:
$CA76:  RTS  

loc_CA77:
$CA77:  LDA  #$00
$CA79:  STA  $56
$CA7B:  LDA  $7140
$CA7E:  AND  #$1F
$CA80:  TAX  
$CA81:  LDA  $6F40,X
$CA84:  CMP  #$10
$CA86:  BCC  loc_CAD8
$CA88:  CMP  #$14
$CA8A:  BCS  loc_CAD8
$CA8C:  AND  #$03
$CA8E:  TAX  
$CA8F:  LDA  $CB1A,X
$CA92:  STA  $14
$CA94:  LDA  #$02
$CA96:  STA  $058E
$CA99:  LDA  #$20
$CA9B:  STA  $058F
$CA9E:  LDX  #$03

loc_CAA0:
$CAA0:  LDA  $70E0,X
$CAA3:  ORA  #$40
$CAA5:  AND  #$7F
$CAA7:  STA  $70E0,X
$CAAA:  DEX  
$CAAB:  BPL  loc_CAA0
$CAAD:  BRK  
$CAAE:  LDY  $FB
$CAB0:  LDA  $3C
$CAB2:  AND  #$F0
$CAB4:  ORA  #$08
$CAB6:  STA  $3C
$CAB8:  LDX  #$00
$CABA:  JSR  sub_CABE
$CABD:  INX  

sub_CABE:
$CABE:  LDA  $7004,X
$CAC1:  AND  #$7F
$CAC3:  STA  $7004,X
$CAC6:  LDA  $6F64,X
$CAC9:  STA  $6FA4,X
$CACC:  LDA  $6F84,X
$CACF:  STA  $6FC4,X
$CAD2:  LDA  #$00
$CAD4:  STA  $052A,X
$CAD7:  RTS  

loc_CAD8:
$CAD8:  LDA  $15
$CADA:  AND  #$03
$CADC:  JMP  loc_CAEA
$CADF:  STA  $058E
$CAE2:  LDA  #$20
$CAE4:  STA  $058F
$CAE7:  JMP  sub_D241

loc_CAEA:
$CAEA:  LDA  $058E
$CAED:  CMP  #$01
$CAEF:  BEQ  loc_CB17
$CAF1:  LDA  #$01
$CAF3:  STA  $058E
$CAF6:  LDA  #$10
$CAF8:  STA  $058F
$CAFB:  LDX  #$03

loc_CAFD:
$CAFD:  LDA  $70E0,X
$CB00:  AND  #$BF
$CB02:  STA  $70E0,X
$CB05:  LDA  $6BE7,X
$CB08:  AND  #$20
$CB0A:  ASL  A
$CB0B:  ASL  A
$CB0C:  EOR  #$80
$CB0E:  ORA  $70E0,X
$CB11:  STA  $70E0,X
$CB14:  DEX  
$CB15:  BPL  loc_CAFD

loc_CB17:
$CB17:  JMP  sub_D241
$CB1A:  BPL  loc_CA9C
$CB1C:  JSR  sub_AD40
$CB1F:  ORA  $05,X
$CB21:  CMP  #$02
$CB23:  BNE  loc_CB33
$CB25:  LDA  $0597
$CB28:  BEQ  loc_CB33
$CB2A:  LDA  $14
$CB2C:  ORA  $0529
$CB2F:  LSR  A
$CB30:  BCC  loc_CB33
$CB32:  RTS  

loc_CB33:
$CB33:  LDX  $3D
$CB35:  BEQ  loc_CB4A
$CB37:  DEX  
$CB38:  BEQ  loc_CB64
$CB3A:  DEX  
$CB3B:  BEQ  loc_CB57
$CB3D:  JSR  sub_CBCA
$CB40:  JSR  sub_CBD6
$CB43:  JSR  sub_CBE4
$CB46:  JSR  sub_CBBE
$CB49:  RTS  

loc_CB4A:
$CB4A:  JSR  sub_CBD6
$CB4D:  JSR  sub_CBBE
$CB50:  JSR  sub_CBCA
$CB53:  JSR  sub_CBE4
$CB56:  RTS  

loc_CB57:
$CB57:  JSR  sub_CBE4
$CB5A:  JSR  sub_CBCA
$CB5D:  JSR  sub_CBBE
$CB60:  JSR  sub_CBD6
$CB63:  RTS  

loc_CB64:
$CB64:  JSR  sub_CBBE
$CB67:  JSR  sub_CBE4
$CB6A:  JSR  sub_CBD6
$CB6D:  JSR  sub_CBCA
$CB70:  RTS  

sub_CB71:
$CB71:  LDA  $0530
$CB74:  BMI  loc_CB97
$CB76:  LDA  $0599
$CB79:  AND  #$10
$CB7B:  BNE  loc_CB97
$CB7D:  LDA  $0539
$CB80:  BMI  loc_CB97
$CB82:  CLC  
$CB83:  ADC  #$10
$CB85:  STA  $0539
$CB88:  BPL  loc_CB97
$CB8A:  BRK  
$CB8B:  .byte $13
$CB8C:  .byte $1F
$CB8D:  BCC  loc_CB93
$CB8F:  BRK  
$CB90:  .byte $07
$CB91:  .byte $6F
$CB92:  PLP  

loc_CB93:
$CB93:  BRK  
$CB94:  .byte $07
$CB95:  .byte $6F
$CB96:  ROL  A

loc_CB97:
$CB97:  RTS  

sub_CB98:
$CB98:  LDA  $052E
$CB9B:  BEQ  loc_CBA1
$CB9D:  DEC  $052E
$CBA0:  RTS  

loc_CBA1:
$CBA1:  LDX  #$01
$CBA3:  STX  JOY1
$CBA6:  DEX  
$CBA7:  STX  JOY1
$CBAA:  LDA  JOY1
$CBAD:  ORA  $0529
$CBB0:  STA  $0529
$CBB3:  RTS  

sub_CBB4:
$CBB4:  LDA  $0526
$CBB7:  CLC  
$CBB8:  ADC  #$08
$CBBA:  STA  $0526
$CBBD:  RTS  

sub_CBBE:
$CBBE:  LDA  $14
$CBC0:  BPL  loc_CBF7
$CBC2:  JSR  sub_CD85
$CBC5:  LDA  #$01
$CBC7:  JMP  loc_CBEF

sub_CBCA:
$CBCA:  BIT  $14
$CBCC:  BVC  loc_CBF7
$CBCE:  JSR  sub_CD85
$CBD1:  LDA  #$03
$CBD3:  JMP  loc_CBEF

sub_CBD6:
$CBD6:  LDA  $14
$CBD8:  AND  #$10
$CBDA:  BEQ  loc_CBF7
$CBDC:  JSR  sub_CD85
$CBDF:  LDA  #$00
$CBE1:  JMP  loc_CBEF

sub_CBE4:
$CBE4:  LDA  $14
$CBE6:  AND  #$20
$CBE8:  BEQ  loc_CBF7
$CBEA:  JSR  sub_CD85
$CBED:  LDA  #$02

loc_CBEF:
$CBEF:  STA  $3D
$CBF1:  JSR  sub_CC88
$CBF4:  JMP  loc_D0C4

loc_CBF7:
$CBF7:  RTS  

sub_CBF8:
$CBF8:  LDA  $0530
$CBFB:  BMI  loc_CC64
$CBFD:  LDA  $14
$CBFF:  ORA  $0529

; ============================================
; INPUT/CONTROLLER ROUTINES ($C500-$C600)
; ============================================
$C500:  ROL  $85
$C502:  ROR  $68,X
$C504:  STA  $77
$C506:  AND  #$F0
$C508:  LSR  A
$C509:  LSR  A
$C50A:  LSR  A
$C50B:  LSR  A
$C50C:  CMP  #$0A
$C50E:  BCC  loc_C516
$C510:  CMP  #$0D
$C512:  BCS  loc_C527
$C514:  ADC  #$18

loc_C516:
$C516:  STA  $24
$C518:  LDA  #$10

loc_C51A:
$C51A:  STA  $23
$C51C:  LDY  $22
$C51E:  LDX  $21
$C520:  PLP  
$C521:  PLA  
$C522:  LDA  $20
$C524:  JMP  loc_C38B

loc_C527:
$C527:  SBC  #$0C
$C529:  STA  $24
$C52B:  LDA  #$12
$C52D:  BNE  loc_C51A

clear_system_state:
$C52F:  LDA  #$00
$C531:  STA  $1F
$C533:  STA  $050A
$C536:  STA  $050B
$C539:  STA  $0508
$C53C:  STA  $0509
$C53F:  STA  $0513
$C542:  RTS  

clear_oam_buffer:
$C543:  LDA  #$F7
$C545:  LDX  #$00

loc_C547:
$C547:  STA  $0200,X
$C54A:  INX  
$C54B:  BNE  loc_C547
$C54D:  RTS  
$C54E:  JSR  sub_C5AF
$C551:  JSR  sub_C569
$C554:  JSR  clear_oam_buffer
$C557:  LDA  $1F
$C559:  AND  #$7F
$C55B:  STA  $1F
$C55D:  LDA  $1F
$C55F:  AND  #$BF
$C561:  STA  $1F
$C563:  JSR  wait_vblank
$C566:  JMP  loc_C592

sub_C569:
$C569:  JSR  sub_C575
$C56C:  LDX  #$7F

loc_C56E:
$C56E:  STA  $0400,X
$C571:  DEX  
$C572:  BPL  loc_C56E
$C574:  RTS  

sub_C575:
$C575:  LDA  PPUSTATUS
$C578:  LDA  #$20
$C57A:  STA  PPUADDR
$C57D:  LDA  #$00
$C57F:  STA  PPUADDR
$C582:  LDX  #$08
$C584:  TAY  

loc_C585:
$C585:  STA  PPUDATA
$C588:  DEY  
$C589:  BNE  loc_C585
$C58B:  DEX  
$C58C:  BNE  loc_C585
$C58E:  RTS  
$C58F:  JSR  sub_C5A8

loc_C592:
$C592:  LDY  #$18
$C594:  BNE  loc_C598

sub_C596:
$C596:  LDY  #$00

loc_C598:
$C598:  LDA  PPUSTATUS

loc_C59B:
$C59B:  LDA  PPUSTATUS
$C59E:  BPL  loc_C59B
$C5A0:  TYA  
$C5A1:  STA  PPUMASK
$C5A4:  STA  $0506
$C5A7:  RTS  

sub_C5A8:
$C5A8:  LDA  $1F
$C5AA:  AND  #$7F
$C5AC:  STA  $1F
$C5AE:  RTS  

sub_C5AF:
$C5AF:  JSR  sub_C596
$C5B2:  LDA  $1F
$C5B4:  ORA  #$80
$C5B6:  STA  $1F
$C5B8:  RTS  
$C5B9:  LDA  #$00
$C5BB:  STA  $16
$C5BD:  BEQ  loc_C5DE
$C5BF:  LDA  #$40
$C5C1:  LDX  #$F0
$C5C3:  BNE  loc_C5C8
$C5C5:  LDA  #$10
$C5C7:  TAX  

loc_C5C8:
$C5C8:  STX  $17

loc_C5CA:
$C5CA:  STA  $16
$C5CC:  JSR  loc_C5DE
$C5CF:  LDX  #$03
$C5D1:  JSR  loc_C90C
$C5D4:  LDA  $16
$C5D6:  CLC  
$C5D7:  ADC  $17
$C5D9:  CMP  #$50
$C5DB:  BCC  loc_C5CA
$C5DD:  RTS  

loc_C5DE:
$C5DE:  LDY  #$00
$C5E0:  LDA  #$BF
$C5E2:  STA  $0300,Y
$C5E5:  INY  
$C5E6:  LDA  #$20
$C5E8:  STA  $0300,Y
$C5EB:  INY  
$C5EC:  LDA  #$00
$C5EE:  STA  $0300,Y
$C5F1:  INY  
$C5F2:  STY  $050A
$C5F5:  STA  $18
$C5F7:  TAX  
$C5F8:  LDA  $18
$C5FA:  LDY  $05FC
$C5FD:  AND  #$03
$C5FF:  BEQ  loc_C605

; ============================================
; SUBROUTINES ($D500-$D600)
; ============================================
$D500:  ORA  #$68
$D502:  PHA  
$D503:  AND  #$1F
$D505:  CMP  $0520
$D508:  BEQ  loc_D515
$D50A:  PLA  
$D50B:  LDA  #$20
$D50D:  LDX  $46
$D50F:  BEQ  loc_D518
$D511:  LDA  #$21
$D513:  BNE  loc_D518

loc_D515:
$D515:  PLA  
$D516:  AND  #$1F

loc_D518:
$D518:  TAX  
$D519:  LDA  $76C0,X
$D51C:  PHA  
$D51D:  TXA  
$D51E:  ASL  A
$D51F:  ASL  A
$D520:  TAX  
$D521:  PLA  
$D522:  RTS  
$D523:  PHA  
$D524:  LDA  sub_0000
$D526:  CMP  #$C2
$D528:  BNE  loc_D539
$D52A:  LDA  $01
$D52C:  CMP  #$2E
$D52E:  BNE  loc_D539
$D530:  LDA  $62A1
$D533:  BPL  loc_D539
$D535:  PLA  
$D536:  LDA  #$02
$D538:  RTS  

loc_D539:
$D539:  PLA  
$D53A:  RTS  
$D53B:  LDA  #$FF
$D53D:  STA  $56
$D53F:  JMP  loc_D546

sub_D542:
$D542:  LDA  #$00
$D544:  STA  $56

loc_D546:
$D546:  LDA  current_bank
$D549:  STA  $58
$D54B:  LDA  #$06
$D54D:  STA  $51
$D54F:  LDA  $6F60
$D552:  SEC  
$D553:  SBC  #$08
$D555:  STA  $7C
$D557:  LDA  $6F80
$D55A:  SEC  
$D55B:  SBC  #$07
$D55D:  STA  $7B
$D55F:  LDA  $3C
$D561:  AND  #$0F
$D563:  BNE  loc_D588
$D565:  LDA  $41
$D567:  BMI  loc_D56C
$D569:  JMP  loc_C013

loc_D56C:
$D56C:  LDA  $67
$D56E:  JSR  bank_switch
$D571:  JSR  sub_D57F
$D574:  LDA  $7024
$D577:  AND  $7025
$D57A:  BMI  loc_D5AC
$D57C:  JMP  loc_C013

sub_D57F:
$D57F:  JSR  sub_D607
$D582:  JSR  sub_D5EE
$D585:  JMP  sub_D57F

loc_D588:
$D588:  PHA  
$D589:  JSR  sub_D5C0
$D58C:  PLA  
$D58D:  AND  #$07
$D58F:  BNE  loc_D5AC
$D591:  LDA  $41
$D593:  BPL  loc_D598
$D595:  JSR  sub_D5AD

loc_D598:
$D598:  LDX  #$00
$D59A:  JSR  sub_D59D

sub_D59D:
$D59D:  LDA  $052A,X
$D5A0:  AND  #$40
$D5A2:  BEQ  loc_D5AB
$D5A4:  ASL  A
$D5A5:  ORA  $7004,X
$D5A8:  STA  $7004,X

loc_D5AB:
$D5AB:  INX  

loc_D5AC:
$D5AC:  RTS  

sub_D5AD:
$D5AD:  LDA  $67
$D5AF:  JSR  bank_switch

loc_D5B2:
$D5B2:  JSR  sub_D5FE
$D5B5:  JSR  sub_D5EE
$D5B8:  JMP  loc_D5B2
$D5BB:  LDA  $58
$D5BD:  JMP  bank_switch

sub_D5C0:
$D5C0:  LDX  $51
$D5C2:  LDA  $7020,X
$D5C5:  CMP  #$FF
$D5C7:  BEQ  loc_D5E5
$D5C9:  LDA  $7160,X
$D5CC:  BEQ  loc_D5DD
$D5CE:  BMI  loc_D5DA
$D5D0:  LDA  #$09
$D5D2:  STA  $57
$D5D4:  JSR  sub_D5EA
$D5D7:  JMP  loc_D5DD

loc_D5DA:
$D5DA:  JSR  sub_D9CB

loc_D5DD:
$D5DD:  INC  $51
$D5DF:  LDA  $51
$D5E1:  CMP  #$1E
$D5E3:  BCC  sub_D5C0

loc_D5E5:
$D5E5:  LDA  #$06
$D5E7:  STA  $51
$D5E9:  RTS  

sub_D5EA:
$D5EA:  JSR  sub_D94B
$D5ED:  RTS  

sub_D5EE:
$D5EE:  INC  $51
$D5F0:  LDA  $51
$D5F2:  CMP  #$1E
$D5F4:  BCC  loc_D5FD
$D5F6:  LDA  $58
$D5F8:  JSR  bank_switch
$D5FB:  PLA  
$D5FC:  PLA  

loc_D5FD:
$D5FD:  RTS  

sub_D5FE:
$D5FE:  LDX  $51

; ============================================
; MOVEMENT ROUTINES ($E000-$E200)
; ============================================
$E000:  LDA  $41
$E002:  BPL  loc_E015
$E004:  LDA  $45
$E006:  SEC  
$E007:  SBC  #$07
$E009:  STA  $ED
$E00B:  LDA  $44
$E00D:  SEC  
$E00E:  SBC  #$08
$E010:  STA  $EC
$E012:  JMP  loc_E023

loc_E015:
$E015:  LDA  $43
$E017:  SEC  
$E018:  SBC  #$07
$E01A:  STA  $ED
$E01C:  LDA  $42
$E01E:  SEC  
$E01F:  SBC  #$08
$E021:  STA  $EC

loc_E023:
$E023:  LDA  $61
$E025:  ORA  #$01
$E027:  STA  $61
$E029:  JSR  sub_E147
$E02C:  LDA  #$00
$E02E:  STA  $16
$E030:  JSR  sub_E368
$E033:  LDX  #$01

loc_E035:
$E035:  LDA  $7020,X
$E038:  CMP  #$FF
$E03A:  BEQ  loc_E06D
$E03C:  LDA  #$00
$E03E:  STA  $7100,X
$E041:  STA  $7120,X
$E044:  LDA  $7000,X
$E047:  STA  $E4
$E049:  LDA  $7020,X
$E04C:  AND  #$90
$E04E:  BNE  loc_E060
$E050:  JSR  sub_E169
$E053:  LDA  $E4
$E055:  STA  $7000,X
$E058:  BCC  loc_E068
$E05A:  JSR  sub_E368
$E05D:  JMP  loc_E068

loc_E060:
$E060:  JSR  sub_E160
$E063:  LDA  $E4
$E065:  STA  $7000,X

loc_E068:
$E068:  INX  
$E069:  CPX  #$1E
$E06B:  BCC  loc_E035

loc_E06D:
$E06D:  RTS  

sub_E06E:
$E06E:  JSR  sub_E147
$E071:  LDA  $3E
$E073:  BEQ  loc_E0BE
$E075:  LDA  $7000
$E078:  AND  #$03
$E07A:  BNE  loc_E08C
$E07C:  LDA  $EB
$E07E:  SEC  
$E07F:  SBC  $058F
$E082:  STA  $EB
$E084:  BCS  loc_E089
$E086:  DEC  $00ED

loc_E089:
$E089:  JMP  loc_E0BE

loc_E08C:
$E08C:  CMP  #$01
$E08E:  BNE  loc_E09F
$E090:  LDA  $EA
$E092:  CLC  
$E093:  ADC  $058F
$E096:  STA  $EA
$E098:  BCC  loc_E09C
$E09A:  INC  $EC

loc_E09C:
$E09C:  JMP  loc_E0BE

loc_E09F:
$E09F:  CMP  #$02
$E0A1:  BNE  loc_E0B2
$E0A3:  LDA  $EB
$E0A5:  CLC  
$E0A6:  ADC  $058F
$E0A9:  STA  $EB
$E0AB:  BCC  loc_E0AF
$E0AD:  INC  $ED

loc_E0AF:
$E0AF:  JMP  loc_E0BE

loc_E0B2:
$E0B2:  LDA  $EA
$E0B4:  SEC  
$E0B5:  SBC  $058F
$E0B8:  STA  $EA
$E0BA:  BCS  loc_E0BE
$E0BC:  DEC  $EC

loc_E0BE:
$E0BE:  LDX  #$01

loc_E0C0:
$E0C0:  LDA  $7020,X
$E0C3:  CMP  #$FF
$E0C5:  BNE  loc_E0C8
$E0C7:  RTS  

loc_E0C8:
$E0C8:  LDA  $7000,X
$E0CB:  STA  $E4
$E0CD:  BMI  loc_E0EA
$E0CF:  LDA  $7020,X
$E0D2:  AND  #$90
$E0D4:  BEQ  loc_E0DC
$E0D6:  JSR  sub_E160
$E0D9:  JMP  loc_E0DF

loc_E0DC:
$E0DC:  JSR  sub_E169

loc_E0DF:
$E0DF:  LDA  $E4
$E0E1:  STA  $7000,X
$E0E4:  INX  
$E0E5:  CPX  #$1E
$E0E7:  BCC  loc_E0C0
$E0E9:  RTS  

loc_E0EA:
$E0EA:  LDA  #$0F
$E0EC:  STA  $E3
$E0EE:  LDY  #$10
$E0F0:  LDA  $70E0,X
$E0F3:  AND  #$40
$E0F5:  BEQ  loc_E0FB
$E0F7:  LDY  #$20
$E0F9:  LSR  $E3

loc_E0FB:
$E0FB:  STY  $E2
$E0FD:  LDA  $7020,X
$E100:  STA  $E5
$E102:  AND  #$90
$E104:  BEQ  loc_E10C
$E106:  JSR  sub_E160
$E109:  JMP  loc_E12B

loc_E10C:
$E10C:  LDA  $E4
$E10E:  JSR  sub_E2EE
$E111:  LDA  $E5
$E113:  AND  #$40
$E115:  BEQ  loc_E128
$E117:  LDA  #$10
$E119:  STA  $E2
$E11B:  LDA  $E5
$E11D:  AND  #$20
$E11F:  BEQ  loc_E123
$E121:  ASL  $E2

loc_E123:
$E123:  LDA  $E5
$E125:  JSR  sub_E2EE

loc_E128:
$E128:  JSR  sub_E169

loc_E12B:
$E12B:  LDA  $3C
$E12D:  AND  $E3
$E12F:  CMP  $E3
$E131:  BNE  loc_E139
$E133:  LDA  $E4
$E135:  AND  #$7F
$E137:  STA  $E4

loc_E139:
$E139:  LDA  $E4
$E13B:  STA  $7000,X
$E13E:  INX  
$E13F:  CPX  #$1E
$E141:  BCS  loc_E146
$E143:  JMP  loc_E0C0

loc_E146:
$E146:  RTS  

sub_E147:
$E147:  LDA  $7020
$E14A:  AND  #$90
$E14C:  BEQ  loc_E152
$E14E:  LDY  #$00
$E150:  BEQ  loc_E1B7

loc_E152:
$E152:  LDA  #$08
$E154:  STA  sub_0000
$E156:  LDA  #$07
$E158:  STA  $01
$E15A:  LDA  #$00
$E15C:  TAX  
$E15D:  JMP  loc_E336

sub_E160:
$E160:  LDA  $E4
$E162:  AND  #$3C
$E164:  STA  $E2
$E166:  BNE  loc_E1A9
$E168:  RTS  

sub_E169:
$E169:  LDA  $E4
$E16B:  AND  #$3C
$E16D:  STA  $E2
$E16F:  LDA  $7140,X
$E172:  AND  #$E0
$E174:  CMP  $46
$E176:  BNE  loc_E1A5
$E178:  LDA  $7120,X
$E17B:  SEC  
$E17C:  SBC  $EB
$E17E:  STA  $E0
$E180:  LDA  $6FC0,X
$E183:  SBC  $ED
$E185:  STA  $E1
$E187:  AND  #$F0
$E189:  BEQ  loc_E199
$E18B:  LDA  $E1
$E18D:  CMP  #$FF
$E18F:  BNE  loc_E1A5
$E191:  LDA  $E0
$E193:  CMP  #$40
$E195:  BCC  loc_E1A5
$E197:  BCS  loc_E1D3

loc_E199:
$E199:  LDA  $E1
$E19B:  AND  #$0F
$E19D:  CMP  #$0F
$E19F:  BCC  loc_E1D3
$E1A1:  LDA  $E0
$E1A3:  BEQ  loc_E1D3

loc_E1A5:
$E1A5:  LDA  $E2
$E1A7:  BEQ  loc_E1D1

loc_E1A9:
$E1A9:  JSR  sub_C78C
$E1AC:  LDA  $E2
$E1AE:  JSR  sub_E4BB
$E1B1:  LDA  $E4
$E1B3:  AND  #$C3
$E1B5:  STA  $E4

loc_E1B7:
$E1B7:  LDA  #$F7
$E1B9:  STA  $0200,Y
$E1BC:  STA  $0204,Y
$E1BF:  STA  $0208,Y
$E1C2:  STA  $020C,Y
$E1C5:  STA  $0203,Y
$E1C8:  STA  $0207,Y
$E1CB:  STA  $020B,Y
$E1CE:  STA  $020F,Y

loc_E1D1:
$E1D1:  CLC  
$E1D2:  RTS  

loc_E1D3:
$E1D3:  LDA  $7100,X
$E1D6:  SEC  
$E1D7:  SBC  $EA
$E1D9:  STA  $DE
$E1DB:  LDA  $6FA0,X
$E1DE:  SBC  $EC
$E1E0:  STA  $DF
$E1E2:  AND  #$F0
$E1E4:  BEQ  loc_E24D
$E1E6:  LDA  $DF
$E1E8:  CMP  #$FF
$E1EA:  BNE  loc_E1A5
$E1EC:  LDA  $DE
$E1EE:  BPL  loc_E1A5
$E1F0:  STA  $E6
$E1F2:  LDA  $E2
$E1F4:  BNE  loc_E20E
$E1F6:  JSR  sub_E45C
$E1F9:  STA  $E2
$E1FB:  LDA  $E4
$E1FD:  AND  #$C3
$E1FF:  ORA  $E2

; ============================================
; BANK SWITCH AREAS ($DA80-$DB00)
; ============================================
$DA80:  RTI  
$DA81:  BVS  loc_DAEB
$DA83:  ORA  $7040,X
$DA86:  STA  $7040,X
$DA89:  LDA  $70E0,X
$DA8C:  AND  #$BF
$DA8E:  STA  $70E0,X
$DA91:  JSR  sub_DDE3
$DA94:  JMP  loc_D891
$DA97:  LDY  #$01
$DA99:  LDA  ($4D),Y
$DA9B:  JSR  sub_DDE0
$DA9E:  BRK  
$DA9F:  ORA  ($8F,X)
$DAA1:  JMP  loc_DDF0
$DAA4:  LDA  current_bank
$DAA7:  PHA  
$DAA8:  CMP  #$1C
$DAAA:  CLC  
$DAAB:  BEQ  loc_DAB3
$DAAD:  LDA  #$1C
$DAAF:  JSR  bank_switch
$DAB2:  SEC  

loc_DAB3:
$DAB3:  PHP  
$DAB4:  JSR  sub_DAC6
$DAB7:  LDX  $51
$DAB9:  JSR  sub_DDE0
$DABC:  PLP  
$DABD:  PLA  
$DABE:  BCC  loc_DAC3
$DAC0:  JSR  bank_switch

loc_DAC3:
$DAC3:  JMP  loc_DDF0

sub_DAC6:
$DAC6:  LDA  $8014
$DAC9:  STA  $55
$DACB:  LDA  $8015
$DACE:  STA  $56
$DAD0:  LDA  $8016
$DAD3:  STA  sub_0000
$DAD5:  LDA  $8017
$DAD8:  STA  $01
$DADA:  LDY  #$01
$DADC:  LDA  $67
$DADE:  LDX  #$4D
$DAE0:  JSR  sub_C3EA
$DAE3:  TAX  
$DAE4:  LDY  #$00
$DAE6:  LDA  (sub_0000),Y
$DAE8:  STA  $0531

loc_DAEB:
$DAEB:  CPX  #$00
$DAED:  BEQ  loc_DB03
$DAEF:  LDA  (sub_0000),Y
$DAF1:  CLC  
$DAF2:  ADC  $55
$DAF4:  STA  $55
$DAF6:  BCC  loc_DAFA
$DAF8:  INC  $56

loc_DAFA:
$DAFA:  INY  
$DAFB:  LDA  (sub_0000),Y
$DAFD:  STA  $0531

; ============================================
; BANK SWITCH AREAS ($DF70-$E000)
; ============================================
$DF70:  .byte $92
$DF71:  DEC  $DECF,X
$DF74:  SBC  $DE
$DF76:  SBC  $DE
$DF78:  SBC  $DE
$DF7A:  LDA  current_bank
$DF7D:  PHA  
$DF7E:  LDA  $51
$DF80:  JSR  bank_switch
$DF83:  LDY  #$00
$DF85:  LDA  ($49),Y
$DF87:  STA  $98
$DF89:  JSR  sub_DF9F
$DF8C:  LDA  ($49),Y
$DF8E:  STA  $99
$DF90:  JSR  sub_DF9F
$DF93:  LDA  ($49),Y
$DF95:  STA  $9A
$DF97:  JSR  sub_DF9F
$DF9A:  PLA  
$DF9B:  JSR  bank_switch
$DF9E:  RTS  

sub_DF9F:
$DF9F:  PHA  
$DFA0:  INC  $49
$DFA2:  BNE  loc_DFA6
$DFA4:  INC  $4A

loc_DFA6:
$DFA6:  LDA  $49
$DFA8:  CMP  #$D8
$DFAA:  BNE  loc_DFED
$DFAC:  LDA  $4A
$DFAE:  CMP  #$BF
$DFB0:  BNE  loc_DFED
$DFB2:  INC  current_bank
$DFB5:  INC  $51
$DFB7:  LDA  current_bank
$DFBA:  PHA  
$DFBB:  JSR  bank_switch
$DFBE:  PLA  
$DFBF:  CMP  #$05
$DFC1:  BCC  loc_DFE5
$DFC3:  BEQ  loc_DFDE
$DFC5:  LDA  #$1B
$DFC7:  STA  $51
$DFC9:  JSR  bank_switch
$DFCC:  LDA  $DFEF
$DFCF:  ASL  A
$DFD0:  TAX  
$DFD1:  LDA  $8000,X
$DFD4:  STA  $49
$DFD6:  LDA  $8001,X
$DFD9:  STA  $4A
$DFDB:  JMP  loc_DFED

loc_DFDE:
$DFDE:  LDA  #$1A
$DFE0:  STA  $51
$DFE2:  JSR  bank_switch

loc_DFE5:
$DFE5:  LDA  #$80
$DFE7:  STA  $4A
$DFE9:  LDA  #$00
$DFEB:  STA  $49

loc_DFED:
$DFED:  PLA  
$DFEE:  RTS  
$DFEF:  ASL  A
$DFF0:  .byte $BF
$DFF1:  LDA  #$00
$DFF3:  STA  $07BB
$DFF6:  STA  $EA
$DFF8:  STA  $EB
$DFFA:  JSR  sub_E4F6
$DFFD:  JSR  sub_E402

; ============================================
; BANK 29 CALL AREA ($E600-$E700)
; ============================================
$E600:  ORA  $E6,X
$E602:  STA  $6CDC
$E605:  LDA  $E616
$E608:  STA  $6CDD
$E60B:  PLP  
$E60C:  JSR  sub_6CAD
$E60F:  LDA  #$1D
$E611:  JSR  bank_switch
$E614:  RTS  
$E615:  .byte $AB
$E616:  .byte $F4
$E617:  PHP  
$E618:  STA  $07CA
$E61B:  LDA  $E62B
$E61E:  STA  $6CDC
$E621:  LDA  $E62C
$E624:  STA  $6CDD
$E627:  PLP  
$E628:  JMP  sub_6CAD
$E62B:  TXA  
$E62C:  SBC  $08,X
$E62E:  STA  $07CA
$E631:  LDA  $E641
$E634:  STA  $6CDC
$E637:  LDA  $E642
$E63A:  STA  $6CDD
$E63D:  PLP  
$E63E:  JMP  sub_6CAD
$E641:  .byte $8B
$E642:  SBC  $08,X
$E644:  STA  $07CA
$E647:  LDA  $E657
$E64A:  STA  $6CDC
$E64D:  LDA  $E658
$E650:  STA  $6CDD
$E653:  PLP  
$E654:  JMP  sub_6CAD
$E657:  LDX  $08FA,Y
$E65A:  STA  $07CA
$E65D:  LDA  $E66D
$E660:  STA  $6CDC
$E663:  LDA  $E66E
$E666:  STA  $6CDD
$E669:  PLP  
$E66A:  JMP  sub_6CAD
$E66D:  LDX  $A5FA,Y
$E670:  .byte $3F
$E671:  CLC  
$E672:  ADC  $49
$E674:  STA  $49
$E676:  BCC  loc_E67A
$E678:  INC  $4A

loc_E67A:
$E67A:  RTS  
$E67B:  LDA  $49
$E67D:  SEC  
$E67E:  SBC  $3F
$E680:  STA  $49
$E682:  BCS  loc_E67A
$E684:  DEC  $4A
$E686:  RTS  
$E687:  LDA  $BF
$E689:  AND  #$01
$E68B:  BNE  loc_E68E
$E68D:  RTS  

loc_E68E:
$E68E:  LDA  #$19
$E690:  STA  $6E86
$E693:  JSR  sub_FF94
$E696:  LDA  #$00
$E698:  STA  $B4
$E69A:  LDA  $B0
$E69C:  AND  #$DF
$E69E:  STA  $B0
$E6A0:  LDA  $0621
$E6A3:  ORA  $0623
$E6A6:  ORA  $0625
$E6A9:  ORA  $0627
$E6AC:  BNE  loc_E6B2
$E6AE:  LDA  #$20
$E6B0:  STA  $B0

loc_E6B2:
$E6B2:  LDY  #$04
$E6B4:  LDX  #$08
$E6B6:  JSR  sub_E77C
$E6B9:  LDY  #$04
$E6BB:  LDX  #$08
$E6BD:  JSR  sub_E739
$E6C0:  LDA  $BD
$E6C2:  CLC  
$E6C3:  ADC  $BC
$E6C5:  STA  $BD
$E6C7:  BCC  loc_E6F8

loc_E6C9:
$E6C9:  SBC  #$96
$E6CB:  STA  $BD
$E6CD:  JSR  sub_F0E3
$E6D0:  LDY  #$00
$E6D2:  LDX  #$00
$E6D4:  JSR  sub_E77C
$E6D7:  LDY  #$01
$E6D9:  LDX  #$02
$E6DB:  JSR  sub_E77C
$E6DE:  LDY  #$02
$E6E0:  LDX  #$04
$E6E2:  JSR  sub_E77C
$E6E5:  JSR  sub_F0F6
$E6E8:  LDY  #$03
$E6EA:  LDX  #$06
$E6EC:  JSR  sub_E77C
$E6EF:  JSR  sub_EEE2
$E6F2:  LDA  $BD
$E6F4:  CMP  #$6A
$E6F6:  BCC  loc_E6C9

loc_E6F8:
$E6F8:  LDY  #$00
$E6FA:  LDX  #$00
$E6FC:  JSR  sub_E739
$E6FF:  LDY  #$01
$E000:  LDA  $41
$E002:  BPL  loc_E015
$E004:  LDA  $45
$E006:  SEC  
$E007:  SBC  #$07
$E009:  STA  $ED
$E00B:  LDA  $44
$E00D:  SEC  
$E00E:  SBC  #$08
$E010:  STA  $EC
$E012:  JMP  loc_E023

loc_E015:
$E015:  LDA  $43
$E017:  SEC  
$E018:  SBC  #$07
$E01A:  STA  $ED
$E01C:  LDA  $42
$E01E:  SEC  
$E01F:  SBC  #$08
$E021:  STA  $EC

loc_E023:
$E023:  LDA  $61
$E025:  ORA  #$01
$E027:  STA  $61
$E029:  JSR  sub_E147
$E02C:  LDA  #$00
$E02E:  STA  $16
$E030:  JSR  sub_E368
$E033:  LDX  #$01

loc_E035:
$E035:  LDA  $7020,X
$E038:  CMP  #$FF
$E03A:  BEQ  loc_E06D
$E03C:  LDA  #$00
$E03E:  STA  $7100,X
$E041:  STA  $7120,X
$E044:  LDA  $7000,X
$E047:  STA  $E4
$E049:  LDA  $7020,X
$E04C:  AND  #$90
$E04E:  BNE  loc_E060
$E050:  JSR  sub_E169
$E053:  LDA  $E4
$E055:  STA  $7000,X
$E058:  BCC  loc_E068
$E05A:  JSR  sub_E368
$E05D:  JMP  loc_E068

loc_E060:
$E060:  JSR  sub_E160
$E063:  LDA  $E4
$E065:  STA  $7000,X

loc_E068:
$E068:  INX  
$E069:  CPX  #$1E
$E06B:  BCC  loc_E035

loc_E06D:
$E06D:  RTS  

sub_E06E:
$E06E:  JSR  sub_E147
$E071:  LDA  $3E
$E073:  BEQ  loc_E0BE
$E075:  LDA  $7000
$E078:  AND  #$03
$E07A:  BNE  loc_E08C
$E07C:  LDA  $EB
$E07E:  SEC  
$E07F:  SBC  $058F
$E082:  STA  $EB
$E084:  BCS  loc_E089
$E086:  DEC  $00ED

loc_E089:
$E089:  JMP  loc_E0BE

loc_E08C:
$E08C:  CMP  #$01
$E08E:  BNE  loc_E09F
$E090:  LDA  $EA
$E092:  CLC  
$E093:  ADC  $058F
$E096:  STA  $EA
$E098:  BCC  loc_E09C
$E09A:  INC  $EC

loc_E09C:
$E09C:  JMP  loc_E0BE

loc_E09F:
$E09F:  CMP  #$02
$E0A1:  BNE  loc_E0B2
$E0A3:  LDA  $EB
$E0A5:  CLC  
$E0A6:  ADC  $058F
$E0A9:  STA  $EB
$E0AB:  BCC  loc_E0AF
$E0AD:  INC  $ED

loc_E0AF:
$E0AF:  JMP  loc_E0BE

loc_E0B2:
$E0B2:  LDA  $EA
$E0B4:  SEC  
$E0B5:  SBC  $058F
$E0B8:  STA  $EA
$E0BA:  BCS  loc_E0BE
$E0BC:  DEC  $EC

loc_E0BE:
$E0BE:  LDX  #$01

loc_E0C0:
$E0C0:  LDA  $7020,X
$E0C3:  CMP  #$FF
$E0C5:  BNE  loc_E0C8
$E0C7:  RTS  

loc_E0C8:
$E0C8:  LDA  $7000,X
$E0CB:  STA  $E4
$E0CD:  BMI  loc_E0EA
$E0CF:  LDA  $7020,X
$E0D2:  AND  #$90
$E0D4:  BEQ  loc_E0DC
$E0D6:  JSR  sub_E160
$E0D9:  JMP  loc_E0DF

loc_E0DC:
$E0DC:  JSR  sub_E169

loc_E0DF:
$E0DF:  LDA  $E4
$E0E1:  STA  $7000,X
$E0E4:  INX  
$E0E5:  CPX  #$1E
$E0E7:  BCC  loc_E0C0
$E0E9:  RTS  

loc_E0EA:
$E0EA:  LDA  #$0F
$E0EC:  STA  $E3
$E0EE:  LDY  #$10
$E0F0:  LDA  $70E0,X
$E0F3:  AND  #$40
$E0F5:  BEQ  loc_E0FB
$E0F7:  LDY  #$20
$E0F9:  LSR  $E3

loc_E0FB:
$E0FB:  STY  $E2
$E0FD:  LDA  $7020,X
