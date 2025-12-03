; Dragon Warrior IV - Fixed Bank (Bank 31) Disassembly
; ============================================
;
; Bank 31 is mapped at $C000-$FFFF and is always loaded.
; Contains: Init, NMI, IRQ, RNG, Bank switching, Core utilities
;
; ROM offset: $7C010 - $80010
; CPU address: $C000 - $FFFF
; Subroutines found: 192

; ============================================

  $C000:  FF        .db $FF

sub_C001:
  $C001:  4C 77 E5  JMP $E577
  $C004:  4C 4B E5  JMP $E54B

sub_C007:
  $C007:  4C 8D E5  JMP $E58D
  $C00A:  4C A3 E5  JMP $E5A3
  $C00D:  4C B9 E5  JMP $E5B9
  $C010:  4C CF E5  JMP $E5CF
  $C013:  4C E5 E5  JMP $E5E5
  $C016:  4C 61 E5  JMP $E561

sub_C019:
  $C019:  4C 87 E6  JMP $E687
  $C01C:  4C 8A F0  JMP $F08A
  $C01F:  4C 5B EF  JMP $EF5B
  $C022:  4C 57 F0  JMP $F057
  $C025:  4C 5E F0  JMP $F05E
  $C028:  4C D5 EE  JMP $EED5
  $C02B:  4C B4 F0  JMP $F0B4
  $C02E:  4C FB E5  JMP $E5FB
  $C031:  4C 17 E6  JMP $E617
  $C034:  4C 2D E6  JMP $E62D
  $C037:  4C 43 E6  JMP $E643
  $C03A:  4C 59 E6  JMP $E659

main_init:
  $C03D:  D8        CLD

vblank_wait_1:
  $C03E:  AD 02 20  LDA $2002
  $C041:  10 FB     BPL vblank_wait_1

vblank_wait_2:
  $C043:  AD 02 20  LDA $2002
  $C046:  10 FB     BPL vblank_wait_2
  $C048:  EA        NOP
  $C049:  EA        NOP
  $C04A:  EA        NOP
  $C04B:  EA        NOP
  $C04C:  EA        NOP
  $C04D:  EA        NOP
  $C04E:  A9 10     LDA #$10
  $C050:  8D 00 20  STA $2000
  $C053:  A9 00     LDA #$00
  $C055:  8D 01 20  STA $2001
  $C058:  8D FF FF  STA $FFFF
  $C05B:  8D FF FF  STA $FFFF
  $C05E:  8D FF FF  STA $FFFF
  $C061:  8D FF FF  STA $FFFF
  $C064:  8D FF FF  STA $FFFF

setup_nmi_vector:
  $C067:  A9 4C     LDA #$4C
  $C069:  8D 02 05  STA $0502
  $C06C:  AD D2 C0  LDA $C0D2
  $C06F:  8D 03 05  STA $0503
  $C072:  AD D3 C0  LDA $C0D3
  $C075:  8D 04 05  STA $0504
  $C078:  A2 FF     LDX #$FF
  $C07A:  9A        TXS
  $C07B:  A9 00     LDA #$00
  $C07D:  AA        TAX

clear_ram_loop:
  $C07E:  95 00     STA $00,X
  $C080:  9D 00 03  STA $0300,X
  $C083:  9D 00 04  STA $0400,X
  $C086:  9D 05 05  STA $0505,X
  $C089:  9D 00 06  STA $0600,X
  $C08C:  9D 00 07  STA $0700,X
  $C08F:  E8        INX
  $C090:  D0 EC     BNE clear_ram_loop
  $C092:  A9 0E     LDA #$0E
  $C094:  8D 00 05  STA $0500
  $C097:  A9 10     LDA #$10
  $C099:  8D 01 05  STA $0501
  $C09C:  85 39     STA $39
  $C09E:  20 04 C1  JSR init_subroutine
  $C0A1:  AD 02 20  LDA $2002
  $C0A4:  A9 10     LDA #$10
  $C0A6:  8D 06 20  STA $2006
  $C0A9:  A9 00     LDA #$00
  $C0AB:  8D 06 20  STA $2006
  $C0AE:  A2 10     LDX #$10
  $C0B0:  8D 07 20  STA $2007
  $C0B3:  CA        DEX
  $C0B4:  D0 FA     BNE $C0B0
  $C0B6:  A9 90     LDA #$90
  $C0B8:  8D 05 05  STA $0505
  $C0BB:  8D 00 20  STA $2000
  $C0BE:  20 69 C5  JSR $C569
  $C0C1:  20 43 C5  JSR clear_oam_buffer
  $C0C4:  20 74 FF  JSR nmi_rng_update
  $C0C7:  A9 18     LDA #$18
  $C0C9:  8D 06 05  STA $0506
  $C0CC:  8D 01 20  STA $2001
  $C0CF:  4C 68 C9  JMP main_loop_entry
  $C0D2:  5A        .db $5A
  $C0D3:  C1 AD     CMP ($AD,X)
  $C0D5:  02        .db $02
  $C0D6:  20 10 FB  JSR $FB10
  $C0D9:  AD 02 20  LDA $2002
  $C0DC:  30 FB     BMI $C0D9
  $C0DE:  AD 02 20  LDA $2002
  $C0E1:  10 FB     BPL $C0DE
  $C0E3:  AD 02 20  LDA $2002
  $C0E6:  30 FB     BMI $C0E3
  $C0E8:  60        RTS
  $C0E9:  A9 40     LDA #$40
  $C0EB:  8D 02 05  STA $0502
  $C0EE:  A9 00     LDA #$00
  $C0F0:  8D FF FF  STA $FFFF
  $C0F3:  8D FF FF  STA $FFFF
  $C0F6:  8D FF FF  STA $FFFF
  $C0F9:  8D FF FF  STA $FFFF
  $C0FC:  A9 01     LDA #$01
  $C0FE:  8D FF FF  STA $FFFF
  $C101:  4C 01 C1  JMP $C101

init_subroutine:
  $C104:  EE DF FF  INC mmc1_reset_trigger
  $C107:  AD 00 05  LDA $0500
  $C10A:  20 18 C1  JSR mmc1_write_control
  $C10D:  AD 01 05  LDA $0501
  $C110:  20 2F C1  JSR mmc1_write_chr1
  $C113:  A9 00     LDA #$00
  $C115:  4C 46 C1  JMP mmc1_write_prg

mmc1_write_control:
  $C118:  8D 00 05  STA $0500
  $C11B:  8D FF 9F  STA $9FFF
  $C11E:  4A        LSR A
  $C11F:  8D FF 9F  STA $9FFF
  $C122:  4A        LSR A
  $C123:  8D FF 9F  STA $9FFF
  $C126:  4A        LSR A
  $C127:  8D FF 9F  STA $9FFF
  $C12A:  4A        LSR A
  $C12B:  8D FF 9F  STA $9FFF
  $C12E:  60        RTS
mmc1_write_chr1:
  $C12F:  8D 01 05  STA $0501
  $C132:  8D FF BF  STA $BFFF
  $C135:  4A        LSR A
  $C136:  8D FF BF  STA $BFFF
  $C139:  4A        LSR A
  $C13A:  8D FF BF  STA $BFFF
  $C13D:  4A        LSR A
  $C13E:  8D FF BF  STA $BFFF
  $C141:  4A        LSR A
  $C142:  8D FF BF  STA $BFFF
  $C145:  60        RTS
mmc1_write_prg:
  $C146:  8D FF DF  STA $DFFF
  $C149:  4A        LSR A
  $C14A:  8D FF DF  STA $DFFF
  $C14D:  4A        LSR A
  $C14E:  8D FF DF  STA $DFFF
  $C151:  4A        LSR A
  $C152:  8D FF DF  STA $DFFF
  $C155:  4A        LSR A
  $C156:  8D FF DF  STA $DFFF
  $C159:  60        RTS
NMI_main:
  $C15A:  48        PHA
  $C15B:  8A        TXA
  $C15C:  48        PHA
  $C15D:  98        TYA
  $C15E:  48        PHA
  $C15F:  A5 1F     LDA state_flags
  $C161:  30 1E     BMI NMI_check_stack
  $C163:  BA        TSX
  $C164:  BC 06 01  LDY $0106,X
  $C167:  C8        INY
  $C168:  D0 17     BNE NMI_check_stack
  $C16A:  BD 05 01  LDA $0105,X
  $C16D:  C9 77     CMP #$77
  $C16F:  90 10     BCC NMI_check_stack
  $C171:  C9 81     CMP #$81
  $C173:  B0 0C     BCS NMI_check_stack
  $C175:  AD 02 20  LDA $2002
  $C178:  20 22 C2  JSR ppu_buffer_transfer
  $C17B:  20 03 C3  JSR oam_dma
  $C17E:  20 EA C2  JSR ppu_set_scroll

NMI_check_stack:
  $C181:  BA        TSX
  $C182:  BC 06 01  LDY $0106,X
  $C185:  C8        INY
  $C186:  D0 13     BNE $C19B
  $C188:  BD 05 01  LDA $0105,X
  $C18B:  C9 AB     CMP #$AB
  $C18D:  90 0C     BCC $C19B
  $C18F:  C9 D6     CMP #$D6
  $C191:  B0 08     BCS $C19B
  $C193:  A9 D6     LDA #$D6
  $C195:  9D 05 01  STA $0105,X
  $C198:  20 04 C1  JSR init_subroutine
  $C19B:  AD 19 05  LDA $0519
  $C19E:  D0 10     BNE $C1B0
  $C1A0:  EE 21 C2  INC $C221
  $C1A3:  A9 10     LDA #$10
  $C1A5:  20 2F C1  JSR mmc1_write_chr1
  $C1A8:  A9 10     LDA #$10
  $C1AA:  20 2F C1  JSR mmc1_write_chr1
  $C1AD:  20 19 C0  JSR $C019
  $C1B0:  AD 07 05  LDA current_bank
  $C1B3:  20 91 FF  JSR bank_switch
  $C1B6:  EA        NOP
  $C1B7:  EA        NOP
  $C1B8:  EA        NOP
  $C1B9:  EA        NOP
  $C1BA:  EA        NOP
  $C1BB:  EA        NOP
  $C1BC:  EA        NOP
  $C1BD:  BA        TSX
  $C1BE:  BD 06 01  LDA $0106,X
  $C1C1:  C9 6C     CMP #$6C
  $C1C3:  D0 2A     BNE NMI_update_frame
  $C1C5:  BD 05 01  LDA $0105,X
  $C1C8:  C9 B9     CMP #$B9
  $C1CA:  90 11     BCC $C1DD
  $C1CC:  C9 D6     CMP #$D6
  $C1CE:  B0 0D     BCS $C1DD
  $C1D0:  A9 D6     LDA #$D6
  $C1D2:  9D 05 01  STA $0105,X
  $C1D5:  A9 00     LDA #$00
  $C1D7:  20 2F C1  JSR mmc1_write_chr1
  $C1DA:  4C EF C1  JMP NMI_update_frame
  $C1DD:  C9 E9     CMP #$E9
  $C1DF:  90 0E     BCC NMI_update_frame
  $C1E1:  C9 FF     CMP #$FF
  $C1E3:  B0 0A     BCS NMI_update_frame
  $C1E5:  A9 FF     LDA #$FF
  $C1E7:  9D 05 01  STA $0105,X
  $C1EA:  A9 10     LDA #$10
  $C1EC:  20 2F C1  JSR mmc1_write_chr1

NMI_update_frame:
  $C1EF:  EE 0C 05  INC rng_counter_cmp
  $C1F2:  BA        TSX
  $C1F3:  BD 05 01  LDA $0105,X
  $C1F6:  85 10     STA $10
  $C1F8:  BD 06 01  LDA $0106,X
  $C1FB:  85 11     STA $11
  $C1FD:  A0 00     LDY #$00
  $C1FF:  B1 10     LDA ($10),Y
  $C201:  29 0F     AND #$0F
  $C203:  C9 07     CMP #$07
  $C205:  F0 12     BEQ NMI_to_irq
  $C207:  C9 0F     CMP #$0F
  $C209:  F0 0E     BEQ NMI_to_irq
  $C20B:  C9 03     CMP #$03
  $C20D:  F0 0A     BEQ NMI_to_irq
  $C20F:  C9 0B     CMP #$0B
  $C211:  F0 06     BEQ NMI_to_irq

NMI_return:
  $C213:  68        PLA
  $C214:  A8        TAY
  $C215:  68        PLA
  $C216:  AA        TAX
  $C217:  68        PLA
  $C218:  40        RTI
NMI_to_irq:
  $C219:  68        PLA
  $C21A:  A8        TAY
  $C21B:  68        PLA
  $C21C:  AA        TAX
  $C21D:  68        PLA
  $C21E:  4C 08 C4  JMP IRQ_handler
  $C221:  80        .db $80

ppu_buffer_transfer:
  $C222:  A5 1F     LDA state_flags
  $C224:  29 20     AND #$20
  $C226:  D0 12     BNE $C23A
  $C228:  A5 1F     LDA state_flags
  $C22A:  29 10     AND #$10
  $C22C:  F0 03     BEQ $C231
  $C22E:  4C 97 C2  JMP ppu_update_tiles
  $C231:  A5 1F     LDA state_flags
  $C233:  29 04     AND #$04
  $C235:  F0 3F     BEQ ppu_update_palette
  $C237:  4C 15 C3  JMP $C315
  $C23A:  A2 00     LDX #$00
  $C23C:  AD 0B 05  LDA $050B
  $C23F:  F0 35     BEQ ppu_update_palette

ppu_write_loop:
  $C241:  A0 01     LDY #$01
  $C243:  BD 00 03  LDA $0300,X
  $C246:  10 14     BPL $C25C
  $C248:  A8        TAY
  $C249:  4A        LSR A
  $C24A:  4A        LSR A
  $C24B:  4A        LSR A
  $C24C:  4A        LSR A
  $C24D:  29 04     AND #$04
  $C24F:  0D 05 05  ORA $0505
  $C252:  8D 00 20  STA $2000
  $C255:  98        TYA
  $C256:  E8        INX
  $C257:  BC 00 03  LDY $0300,X
  $C25A:  29 3F     AND #$3F
  $C25C:  E8        INX
  $C25D:  8D 06 20  STA $2006
  $C260:  BD 00 03  LDA $0300,X
  $C263:  E8        INX
  $C264:  8D 06 20  STA $2006

ppu_write_data:
  $C267:  BD 00 03  LDA $0300,X
  $C26A:  E8        INX
  $C26B:  8D 07 20  STA $2007
  $C26E:  88        DEY
  $C26F:  D0 F6     BNE ppu_write_data
  $C271:  CE 0B 05  DEC $050B
  $C274:  D0 CB     BNE ppu_write_loop

ppu_update_palette:
  $C276:  AD 06 05  LDA $0506
  $C279:  29 08     AND #$08
  $C27B:  F0 19     BEQ $C296
  $C27D:  A9 3F     LDA #$3F
  $C27F:  8D 06 20  STA $2006
  $C282:  A9 00     LDA #$00
  $C284:  8D 06 20  STA $2006
  $C287:  8D 0A 05  STA $050A
  $C28A:  AD FC 05  LDA $05FC
  $C28D:  8D 07 20  STA $2007
  $C290:  A5 1F     LDA state_flags
  $C292:  29 DF     AND #$DF
  $C294:  85 1F     STA state_flags
  $C296:  60        RTS
ppu_update_tiles:
  $C297:  A2 00     LDX #$00
  $C299:  BD 00 03  LDA $0300,X
  $C29C:  8D 06 20  STA $2006
  $C29F:  BD 01 03  LDA $0301,X
  $C2A2:  8D 06 20  STA $2006
  $C2A5:  48        PHA
  $C2A6:  BD 02 03  LDA $0302,X
  $C2A9:  8D 07 20  STA $2007
  $C2AC:  BD 03 03  LDA $0303,X
  $C2AF:  8D 07 20  STA $2007
  $C2B2:  BD 00 03  LDA $0300,X
  $C2B5:  8D 06 20  STA $2006
  $C2B8:  68        PLA
  $C2B9:  18        CLC
  $C2BA:  69 20     ADC #$20
  $C2BC:  8D 06 20  STA $2006
  $C2BF:  BD 04 03  LDA $0304,X
  $C2C2:  8D 07 20  STA $2007
  $C2C5:  BD 05 03  LDA $0305,X
  $C2C8:  8D 07 20  STA $2007
  $C2CB:  BD 06 03  LDA $0306,X
  $C2CE:  8D 06 20  STA $2006
  $C2D1:  BD 07 03  LDA $0307,X
  $C2D4:  8D 06 20  STA $2006
  $C2D7:  BD 08 03  LDA $0308,X
  $C2DA:  8D 07 20  STA $2007
  $C2DD:  8A        TXA
  $C2DE:  18        CLC
  $C2DF:  69 09     ADC #$09
  $C2E1:  AA        TAX
  $C2E2:  CE 0B 05  DEC $050B
  $C2E5:  D0 B2     BNE $C299
  $C2E7:  4C 76 C2  JMP ppu_update_palette

ppu_set_scroll:
  $C2EA:  AD 05 05  LDA $0505
  $C2ED:  8D 00 20  STA $2000
  $C2F0:  AD 06 05  LDA $0506
  $C2F3:  8D 01 20  STA $2001
  $C2F6:  AD 08 05  LDA $0508
  $C2F9:  8D 05 20  STA $2005
  $C2FC:  AD 09 05  LDA $0509
  $C2FF:  8D 05 20  STA $2005
  $C302:  60        RTS
oam_dma:
  $C303:  24 1F     BIT state_flags
  $C305:  70 0D     BVS $C314
  $C307:  AD 06 05  LDA $0506
  $C30A:  09 18     ORA #$18
  $C30C:  8D 01 20  STA $2001
  $C30F:  A9 02     LDA #$02
  $C311:  8D 14 40  STA $4014
  $C314:  60        RTS
  $C315:  AE 1A 05  LDX $051A
  $C318:  BD 7B C3  LDA $C37B,X
  $C31B:  8D 06 20  STA $2006
  $C31E:  E8        INX
  $C31F:  BD 7B C3  LDA $C37B,X
  $C322:  8D 06 20  STA $2006
  $C325:  E8        INX
  $C326:  A9 00     LDA #$00
  $C328:  8D 07 20  STA $2007
  $C32B:  8D 07 20  STA $2007
  $C32E:  8D 07 20  STA $2007
  $C331:  8D 07 20  STA $2007
  $C334:  8D 07 20  STA $2007
  $C337:  8D 07 20  STA $2007
  $C33A:  8D 07 20  STA $2007
  $C33D:  8D 07 20  STA $2007
  $C340:  8D 07 20  STA $2007
  $C343:  8D 07 20  STA $2007
  $C346:  8D 07 20  STA $2007
  $C349:  8D 07 20  STA $2007
  $C34C:  8D 07 20  STA $2007
  $C34F:  8D 07 20  STA $2007
  $C352:  8D 07 20  STA $2007
  $C355:  8D 07 20  STA $2007
  $C358:  8D 07 20  STA $2007
  $C35B:  8D 07 20  STA $2007
  $C35E:  8D 07 20  STA $2007
  $C361:  8D 07 20  STA $2007
  $C364:  8D 07 20  STA $2007
  $C367:  8D 07 20  STA $2007
  $C36A:  8D 07 20  STA $2007
  $C36D:  8D 07 20  STA $2007
  $C370:  E0 10     CPX #$10
  $C372:  90 A4     BCC $C318
  $C374:  A5 1F     LDA state_flags
  $C376:  29 FB     AND #$FB
  $C378:  85 1F     STA state_flags
  $C37A:  60        RTS
  $C37B:  22        .db $22
  $C37C:  64        .db $64
  $C37D:  22        .db $22
  $C37E:  84 22     STY $22
  $C380:  A4 22     LDY $22
  $C382:  C4 22     CPY $22
  $C384:  E4 23     CPX $23
  $C386:  04        .db $04
  $C387:  23        .db $23
  $C388:  24 23     BIT $23
  $C38A:  44        .db $44
  $C38B:  85 20     STA $20
  $C38D:  86 21     STX $21
  $C38F:  AD 07 05  LDA current_bank
  $C392:  48        PHA
  $C393:  08        PHP
  $C394:  AD 07 05  LDA current_bank
  $C397:  8D 17 05  STA $0517
  $C39A:  20 BA C3  JSR $C3BA
  $C39D:  A9 4C     LDA #$4C
  $C39F:  85 23     STA $23
  $C3A1:  A6 21     LDX $21
  $C3A3:  A5 20     LDA $20
  $C3A5:  28        PLP
  $C3A6:  20 23 00  JSR $0023
  $C3A9:  08        PHP
  $C3AA:  85 20     STA $20
  $C3AC:  68        PLA
  $C3AD:  85 23     STA $23
  $C3AF:  68        PLA
  $C3B0:  20 91 FF  JSR bank_switch
  $C3B3:  A5 23     LDA $23
  $C3B5:  48        PHA
  $C3B6:  A5 20     LDA $20
  $C3B8:  28        PLP
  $C3B9:  60        RTS
sub_C3BA:
  $C3BA:  A5 23     LDA $23
  $C3BC:  20 91 FF  JSR bank_switch
  $C3BF:  A5 24     LDA $24
  $C3C1:  0A        ASL A
  $C3C2:  AA        TAX
  $C3C3:  BD 00 80  LDA $8000,X
  $C3C6:  85 24     STA $24
  $C3C8:  BD 01 80  LDA $8001,X
  $C3CB:  85 25     STA $25
  $C3CD:  60        RTS
sub_C3CE:
  $C3CE:  85 20     STA $20
  $C3D0:  86 21     STX $21
  $C3D2:  AD 07 05  LDA current_bank
  $C3D5:  48        PHA
  $C3D6:  20 BA C3  JSR $C3BA
  $C3D9:  68        PLA
  $C3DA:  20 91 FF  JSR bank_switch
  $C3DD:  A6 21     LDX $21
  $C3DF:  A5 24     LDA $24
  $C3E1:  95 00     STA $00,X
  $C3E3:  A5 25     LDA $25
  $C3E5:  95 01     STA $01,X
  $C3E7:  A5 20     LDA $20
  $C3E9:  60        RTS
sub_C3EA:
  $C3EA:  85 20     STA $20
  $C3EC:  AD 07 05  LDA current_bank
  $C3EF:  48        PHA
  $C3F0:  A5 20     LDA $20
  $C3F2:  20 91 FF  JSR bank_switch
  $C3F5:  B5 00     LDA $00,X
  $C3F7:  85 23     STA $23
  $C3F9:  B5 01     LDA $01,X
  $C3FB:  85 24     STA $24
  $C3FD:  B1 23     LDA ($23),Y
  $C3FF:  85 20     STA $20
  $C401:  68        PLA
  $C402:  20 91 FF  JSR bank_switch
  $C405:  A5 20     LDA $20
  $C407:  60        RTS
IRQ_handler:
  $C408:  78        SEI
  $C409:  08        PHP
  $C40A:  2C 15 40  BIT $4015
  $C40D:  85 20     STA $20
  $C40F:  86 21     STX $21
  $C411:  84 22     STY $22
  $C413:  BA        TSX
  $C414:  BD 03 01  LDA $0103,X
  $C417:  38        SEC
  $C418:  E9 01     SBC #$01
  $C41A:  85 26     STA $26
  $C41C:  BD 04 01  LDA $0104,X
  $C41F:  E9 00     SBC #$00
  $C421:  85 27     STA $27

irq_read_operand:
  $C423:  A0 01     LDY #$01
  $C425:  B1 26     LDA ($26),Y
  $C427:  48        PHA
  $C428:  29 0F     AND #$0F
  $C42A:  C9 0B     CMP #$0B
  $C42C:  F0 35     BEQ irq_dispatch_0B
  $C42E:  C9 03     CMP #$03
  $C430:  F0 2E     BEQ irq_dispatch_03
  $C432:  68        PLA
  $C433:  48        PHA
  $C434:  29 08     AND #$08
  $C436:  C9 08     CMP #$08
  $C438:  68        PLA
  $C439:  6A        ROR A
  $C43A:  4A        LSR A
  $C43B:  4A        LSR A
  $C43C:  4A        LSR A
  $C43D:  85 23     STA $23
  $C43F:  88        DEY
  $C440:  B1 26     LDA ($26),Y
  $C442:  30 0D     BMI $C451
  $C444:  85 24     STA $24
  $C446:  A4 22     LDY $22
  $C448:  A6 21     LDX $21
  $C44A:  28        PLP
  $C44B:  68        PLA
  $C44C:  A5 20     LDA $20
  $C44E:  4C 8B C3  JMP $C38B
  $C451:  29 3F     AND #$3F
  $C453:  85 24     STA $24
  $C455:  A4 22     LDY $22
  $C457:  A6 21     LDX $21
  $C459:  28        PLP
  $C45A:  68        PLA
  $C45B:  A5 20     LDA $20
  $C45D:  4C CE C3  JMP $C3CE

irq_dispatch_03:
  $C460:  4C F8 C4  JMP irq_extended

irq_dispatch_0B:
  $C463:  68        PLA
  $C464:  C9 CB     CMP #$CB
  $C466:  90 1C     BCC $C484
  $C468:  C9 FB     CMP #$FB
  $C46A:  90 35     BCC $C4A1
  $C46C:  A9 19     LDA #$19
  $C46E:  85 23     STA $23
  $C470:  A9 03     LDA #$03
  $C472:  85 24     STA $24
  $C474:  88        DEY
  $C475:  B1 26     LDA ($26),Y
  $C477:  85 20     STA $20
  $C479:  A4 22     LDY $22
  $C47B:  A6 21     LDX $21
  $C47D:  28        PLP
  $C47E:  68        PLA
  $C47F:  A5 20     LDA $20
  $C481:  4C 8B C3  JMP $C38B
  $C484:  48        PHA
  $C485:  A9 16     LDA #$16
  $C487:  85 23     STA $23
  $C489:  A9 04     LDA #$04
  $C48B:  85 24     STA $24
  $C48D:  88        DEY
  $C48E:  68        PLA
  $C48F:  4A        LSR A
  $C490:  4A        LSR A
  $C491:  4A        LSR A
  $C492:  4A        LSR A
  $C493:  AA        TAX
  $C494:  B1 26     LDA ($26),Y
  $C496:  85 20     STA $20
  $C498:  A4 22     LDY $22
  $C49A:  28        PLP
  $C49B:  68        PLA
  $C49C:  A5 20     LDA $20
  $C49E:  4C 8B C3  JMP $C38B
  $C4A1:  28        PLP
  $C4A2:  48        PHA
  $C4A3:  BA        TSX
  $C4A4:  FE 03 01  INC $0103,X
  $C4A7:  D0 03     BNE $C4AC
  $C4A9:  FE 04 01  INC $0104,X
  $C4AC:  68        PLA
  $C4AD:  28        PLP
  $C4AE:  C9 CB     CMP #$CB
  $C4B0:  F0 18     BEQ irq_set_flag
  $C4B2:  C9 DB     CMP #$DB
  $C4B4:  F0 2B     BEQ irq_clear_flag
  $C4B6:  88        DEY
  $C4B7:  B1 26     LDA ($26),Y
  $C4B9:  AA        TAX
  $C4BA:  C8        INY
  $C4BB:  C8        INY
  $C4BC:  BD 7B 62  LDA $627B,X
  $C4BF:  31 26     AND ($26),Y
  $C4C1:  08        PHP
  $C4C2:  A6 21     LDX $21
  $C4C4:  A4 22     LDY $22
  $C4C6:  A5 20     LDA $20
  $C4C8:  28        PLP
  $C4C9:  60        RTS
irq_set_flag:
  $C4CA:  88        DEY
  $C4CB:  B1 26     LDA ($26),Y
  $C4CD:  AA        TAX
  $C4CE:  C8        INY
  $C4CF:  C8        INY
  $C4D0:  BD 7B 62  LDA $627B,X
  $C4D3:  11 26     ORA ($26),Y
  $C4D5:  9D 7B 62  STA $627B,X
  $C4D8:  08        PHP
  $C4D9:  A6 21     LDX $21
  $C4DB:  A4 22     LDY $22
  $C4DD:  A5 20     LDA $20
  $C4DF:  28        PLP
  $C4E0:  60        RTS
irq_clear_flag:
  $C4E1:  88        DEY
  $C4E2:  B1 26     LDA ($26),Y
  $C4E4:  AA        TAX
  $C4E5:  C8        INY
  $C4E6:  C8        INY
  $C4E7:  BD 7B 62  LDA $627B,X
  $C4EA:  31 26     AND ($26),Y
  $C4EC:  9D 7B 62  STA $627B,X
  $C4EF:  08        PHP
  $C4F0:  A6 21     LDX $21
  $C4F2:  A4 22     LDY $22
  $C4F4:  A5 20     LDA $20
  $C4F6:  28        PLP
  $C4F7:  60        RTS
irq_extended:
  $C4F8:  C8        INY
  $C4F9:  B1 26     LDA ($26),Y
  $C4FB:  85 78     STA $78
  $C4FD:  88        DEY
  $C4FE:  88        DEY
  $C4FF:  B1 26     LDA ($26),Y
  $C501:  85 76     STA $76
  $C503:  68        PLA
  $C504:  85 77     STA $77
  $C506:  29 F0     AND #$F0
  $C508:  4A        LSR A
  $C509:  4A        LSR A
  $C50A:  4A        LSR A
  $C50B:  4A        LSR A
  $C50C:  C9 0A     CMP #$0A
  $C50E:  90 06     BCC $C516
  $C510:  C9 0D     CMP #$0D
  $C512:  B0 13     BCS $C527
  $C514:  69 18     ADC #$18
  $C516:  85 24     STA $24
  $C518:  A9 10     LDA #$10
  $C51A:  85 23     STA $23
  $C51C:  A4 22     LDY $22
  $C51E:  A6 21     LDX $21
  $C520:  28        PLP
  $C521:  68        PLA
  $C522:  A5 20     LDA $20
  $C524:  4C 8B C3  JMP $C38B
  $C527:  E9 0C     SBC #$0C
  $C529:  85 24     STA $24
  $C52B:  A9 12     LDA #$12
  $C52D:  D0 EB     BNE $C51A

clear_system_state:
  $C52F:  A9 00     LDA #$00
  $C531:  85 1F     STA state_flags
  $C533:  8D 0A 05  STA $050A
  $C536:  8D 0B 05  STA $050B
  $C539:  8D 08 05  STA $0508
  $C53C:  8D 09 05  STA $0509
  $C53F:  8D 13 05  STA $0513
  $C542:  60        RTS
clear_oam_buffer:
  $C543:  A9 F7     LDA #$F7
  $C545:  A2 00     LDX #$00
  $C547:  9D 00 02  STA $0200,X
  $C54A:  E8        INX
  $C54B:  D0 FA     BNE $C547
  $C54D:  60        RTS
  $C54E:  20 AF C5  JSR $C5AF
  $C551:  20 69 C5  JSR $C569
  $C554:  20 43 C5  JSR clear_oam_buffer
  $C557:  A5 1F     LDA state_flags
  $C559:  29 7F     AND #$7F
  $C55B:  85 1F     STA state_flags
  $C55D:  A5 1F     LDA state_flags
  $C55F:  29 BF     AND #$BF
  $C561:  85 1F     STA state_flags
  $C563:  20 74 FF  JSR nmi_rng_update
  $C566:  4C 92 C5  JMP $C592

sub_C569:
  $C569:  20 75 C5  JSR $C575
  $C56C:  A2 7F     LDX #$7F
  $C56E:  9D 00 04  STA $0400,X
  $C571:  CA        DEX
  $C572:  10 FA     BPL $C56E
  $C574:  60        RTS
sub_C575:
  $C575:  AD 02 20  LDA $2002
  $C578:  A9 20     LDA #$20
  $C57A:  8D 06 20  STA $2006
  $C57D:  A9 00     LDA #$00
  $C57F:  8D 06 20  STA $2006
  $C582:  A2 08     LDX #$08
  $C584:  A8        TAY
  $C585:  8D 07 20  STA $2007
  $C588:  88        DEY
  $C589:  D0 FA     BNE $C585
  $C58B:  CA        DEX
  $C58C:  D0 F7     BNE $C585
  $C58E:  60        RTS
  $C58F:  20 A8 C5  JSR $C5A8
  $C592:  A0 18     LDY #$18
  $C594:  D0 02     BNE $C598

sub_C596:
  $C596:  A0 00     LDY #$00
  $C598:  AD 02 20  LDA $2002
  $C59B:  AD 02 20  LDA $2002
  $C59E:  10 FB     BPL $C59B
  $C5A0:  98        TYA
  $C5A1:  8D 01 20  STA $2001
  $C5A4:  8D 06 05  STA $0506
  $C5A7:  60        RTS
sub_C5A8:
  $C5A8:  A5 1F     LDA state_flags
  $C5AA:  29 7F     AND #$7F
  $C5AC:  85 1F     STA state_flags
  $C5AE:  60        RTS
sub_C5AF:
  $C5AF:  20 96 C5  JSR $C596
  $C5B2:  A5 1F     LDA state_flags
  $C5B4:  09 80     ORA #$80
  $C5B6:  85 1F     STA state_flags
  $C5B8:  60        RTS
  $C5B9:  A9 00     LDA #$00
  $C5BB:  85 16     STA rng_temp
  $C5BD:  F0 1F     BEQ $C5DE
  $C5BF:  A9 40     LDA #$40
  $C5C1:  A2 F0     LDX #$F0
  $C5C3:  D0 03     BNE $C5C8
  $C5C5:  A9 10     LDA #$10
  $C5C7:  AA        TAX
  $C5C8:  86 17     STX $17
  $C5CA:  85 16     STA rng_temp
  $C5CC:  20 DE C5  JSR $C5DE
  $C5CF:  A2 03     LDX #$03
  $C5D1:  20 0C C9  JSR $C90C
  $C5D4:  A5 16     LDA rng_temp
  $C5D6:  18        CLC
  $C5D7:  65 17     ADC $17
  $C5D9:  C9 50     CMP #$50
  $C5DB:  90 ED     BCC $C5CA
  $C5DD:  60        RTS
sub_C5DE:
  $C5DE:  A0 00     LDY #$00
  $C5E0:  A9 BF     LDA #$BF
  $C5E2:  99 00 03  STA $0300,Y
  $C5E5:  C8        INY
  $C5E6:  A9 20     LDA #$20
  $C5E8:  99 00 03  STA $0300,Y
  $C5EB:  C8        INY
  $C5EC:  A9 00     LDA #$00
  $C5EE:  99 00 03  STA $0300,Y
  $C5F1:  C8        INY
  $C5F2:  8C 0A 05  STY $050A
  $C5F5:  85 18     STA encounter_rate
  $C5F7:  AA        TAX
  $C5F8:  A5 18     LDA encounter_rate
  $C5FA:  AC FC 05  LDY $05FC
  $C5FD:  29 03     AND #$03
  $C5FF:  F0 04     BEQ $C605
  $C601:  BC FD 05  LDY $05FD,X
  $C604:  E8        INX
  $C605:  98        TYA
  $C606:  38        SEC
  $C607:  E5 16     SBC rng_temp
  $C609:  C9 40     CMP #$40
  $C60B:  90 03     BCC $C610
  $C60D:  AD FC 05  LDA $05FC
  $C610:  AC 0A 05  LDY $050A
  $C613:  99 00 03  STA $0300,Y
  $C616:  E6 18     INC encounter_rate
  $C618:  EE 0A 05  INC $050A
  $C61B:  A5 18     LDA encounter_rate
  $C61D:  C9 20     CMP #$20
  $C61F:  90 D7     BCC $C5F8
  $C621:  A9 01     LDA #$01
  $C623:  8D 0B 05  STA $050B
  $C626:  A5 1F     LDA state_flags
  $C628:  09 20     ORA #$20
  $C62A:  85 1F     STA state_flags
  $C62C:  60        RTS
sub_C62D:
  $C62D:  A5 1F     LDA state_flags
  $C62F:  09 20     ORA #$20
  $C631:  85 1F     STA state_flags
  $C633:  4C 74 FF  JMP nmi_rng_update
  $C636:  AE 0A 05  LDX $050A
  $C639:  A5 1C     LDA $1C
  $C63B:  29 3F     AND #$3F
  $C63D:  9D 00 03  STA $0300,X
  $C640:  E8        INX
  $C641:  A5 1D     LDA $1D
  $C643:  9D 00 03  STA $0300,X
  $C646:  E8        INX
  $C647:  A5 1E     LDA $1E
  $C649:  9D 00 03  STA $0300,X
  $C64C:  E8        INX
  $C64D:  8E 0A 05  STX $050A
  $C650:  EE 0B 05  INC $050B
  $C653:  E6 1D     INC $1D
  $C655:  D0 02     BNE $C659
  $C657:  E6 1C     INC $1C
  $C659:  60        RTS
sub_C65A:
  $C65A:  85 1E     STA $1E
  $C65C:  20 62 C6  JSR $C662
  $C65F:  4C 36 C6  JMP $C636

sub_C662:
  $C662:  AD 05 05  LDA $0505
  $C665:  0A        ASL A
  $C666:  0A        ASL A
  $C667:  29 04     AND #$04
  $C669:  09 20     ORA #$20
  $C66B:  85 1C     STA $1C
  $C66D:  A5 00     LDA $00
  $C66F:  29 3F     AND #$3F
  $C671:  0A        ASL A
  $C672:  0A        ASL A
  $C673:  0A        ASL A
  $C674:  90 09     BCC $C67F
  $C676:  48        PHA
  $C677:  A5 1C     LDA $1C
  $C679:  49 04     EOR #$04
  $C67B:  85 1C     STA $1C
  $C67D:  68        PLA
  $C67E:  18        CLC
  $C67F:  6D 08 05  ADC $0508
  $C682:  85 1D     STA $1D
  $C684:  90 06     BCC $C68C
  $C686:  A5 1C     LDA $1C
  $C688:  49 04     EOR #$04
  $C68A:  85 1C     STA $1C
  $C68C:  AD 09 05  LDA $0509
  $C68F:  4A        LSR A
  $C690:  4A        LSR A
  $C691:  4A        LSR A
  $C692:  18        CLC
  $C693:  65 01     ADC $01
  $C695:  C9 1E     CMP #$1E
  $C697:  90 02     BCC $C69B
  $C699:  E9 1E     SBC #$1E
  $C69B:  4A        LSR A
  $C69C:  66 1D     ROR $1D
  $C69E:  4A        LSR A
  $C69F:  66 1D     ROR $1D
  $C6A1:  4A        LSR A
  $C6A2:  66 1D     ROR $1D
  $C6A4:  05 1C     ORA $1C
  $C6A6:  85 1C     STA $1C
  $C6A8:  29 33     AND #$33
  $C6AA:  C9 23     CMP #$23
  $C6AC:  D0 10     BNE $C6BE
  $C6AE:  A5 1D     LDA $1D
  $C6B0:  C9 C0     CMP #$C0
  $C6B2:  90 0A     BCC $C6BE
  $C6B4:  E9 C0     SBC #$C0
  $C6B6:  85 1D     STA $1D
  $C6B8:  A5 1C     LDA $1C
  $C6BA:  29 3C     AND #$3C
  $C6BC:  85 1C     STA $1C
  $C6BE:  60        RTS
  $C6BF:  29 03     AND #$03
  $C6C1:  85 0D     STA $0D

sub_C6C3:
  $C6C3:  A5 1D     LDA $1D
  $C6C5:  4A        LSR A
  $C6C6:  48        PHA
  $C6C7:  29 01     AND #$01
  $C6C9:  85 0B     STA $0B
  $C6CB:  68        PLA
  $C6CC:  4A        LSR A
  $C6CD:  4A        LSR A
  $C6CE:  4A        LSR A
  $C6CF:  4A        LSR A
  $C6D0:  29 02     AND #$02
  $C6D2:  05 0B     ORA $0B
  $C6D4:  AA        TAX
  $C6D5:  E8        INX
  $C6D6:  A9 FC     LDA #$FC
  $C6D8:  CA        DEX
  $C6D9:  F0 0A     BEQ $C6E5
  $C6DB:  38        SEC
  $C6DC:  2A        ROL A
  $C6DD:  2A        ROL A
  $C6DE:  06 0D     ASL $0D
  $C6E0:  06 0D     ASL $0D
  $C6E2:  4C D8 C6  JMP $C6D8
  $C6E5:  85 0B     STA $0B
  $C6E7:  A5 1C     LDA $1C
  $C6E9:  29 04     AND #$04
  $C6EB:  85 0C     STA $0C
  $C6ED:  09 23     ORA #$23
  $C6EF:  85 0E     STA $0E
  $C6F1:  46 1C     LSR $1C
  $C6F3:  66 1D     ROR $1D
  $C6F5:  46 1C     LSR $1C
  $C6F7:  66 1D     ROR $1D
  $C6F9:  A5 1D     LDA $1D
  $C6FB:  29 07     AND #$07
  $C6FD:  85 0F     STA $0F
  $C6FF:  46 1D     LSR $1D
  $C701:  46 1D     LSR $1D
  $C703:  A5 1D     LDA $1D
  $C705:  29 38     AND #$38
  $C707:  09 C0     ORA #$C0
  $C709:  05 0F     ORA $0F
  $C70B:  85 0F     STA $0F
  $C70D:  06 0C     ASL $0C
  $C70F:  06 0C     ASL $0C
  $C711:  06 0C     ASL $0C
  $C713:  06 0C     ASL $0C
  $C715:  A5 0F     LDA $0F
  $C717:  29 3F     AND #$3F
  $C719:  05 0C     ORA $0C
  $C71B:  AA        TAX
  $C71C:  BD 00 04  LDA $0400,X
  $C71F:  25 0B     AND $0B
  $C721:  05 0D     ORA $0D
  $C723:  9D 00 04  STA $0400,X
  $C726:  60        RTS
  $C727:  29 03     AND #$03
  $C729:  85 0D     STA $0D
  $C72B:  20 62 C6  JSR $C662
  $C72E:  20 C3 C6  JSR $C6C3
  $C731:  85 1E     STA $1E
  $C733:  A5 0E     LDA $0E
  $C735:  85 1C     STA $1C
  $C737:  A5 0F     LDA $0F
  $C739:  85 1D     STA $1D
  $C73B:  4C 36 C6  JMP $C636
  $C73E:  98        TYA
  $C73F:  48        PHA
  $C740:  20 8C C7  JSR $C78C
  $C743:  B5 00     LDA $00,X
  $C745:  99 00 02  STA $0200,Y
  $C748:  B5 01     LDA $01,X
  $C74A:  99 01 02  STA $0201,Y
  $C74D:  B5 02     LDA $02,X
  $C74F:  99 02 02  STA $0202,Y
  $C752:  B5 03     LDA $03,X
  $C754:  99 03 02  STA $0203,Y
  $C757:  E8        INX
  $C758:  E8        INX
  $C759:  E8        INX
  $C75A:  E8        INX
  $C75B:  68        PLA
  $C75C:  A8        TAY
  $C75D:  60        RTS
  $C75E:  98        TYA
  $C75F:  48        PHA
  $C760:  20 8C C7  JSR $C78C
  $C763:  B5 01     LDA $01,X
  $C765:  99 01 02  STA $0201,Y
  $C768:  B5 02     LDA $02,X
  $C76A:  99 02 02  STA $0202,Y
  $C76D:  4C 57 C7  JMP $C757
  $C770:  98        TYA
  $C771:  48        PHA
  $C772:  20 8C C7  JSR $C78C
  $C775:  B9 00 02  LDA $0200,Y
  $C778:  95 00     STA $00,X
  $C77A:  B9 01 02  LDA $0201,Y
  $C77D:  95 01     STA $01,X
  $C77F:  B9 02 02  LDA $0202,Y
  $C782:  95 02     STA $02,X
  $C784:  B9 03 02  LDA $0203,Y
  $C787:  95 03     STA $03,X
  $C789:  4C 57 C7  JMP $C757

sub_C78C:
  $C78C:  A8        TAY
  $C78D:  8A        TXA
  $C78E:  48        PHA
  $C78F:  98        TYA
  $C790:  A0 00     LDY #$00
  $C792:  84 16     STY rng_temp
  $C794:  A0 05     LDY #$05
  $C796:  88        DEY
  $C797:  30 34     BMI $C7CD
  $C799:  D9 DC C7  CMP $C7DC,Y
  $C79C:  90 F8     BCC $C796
  $C79E:  48        PHA
  $C79F:  98        TYA
  $C7A0:  38        SEC
  $C7A1:  2A        ROL A
  $C7A2:  38        SEC
  $C7A3:  ED 13 05  SBC $0513
  $C7A6:  10 03     BPL $C7AB
  $C7A8:  18        CLC
  $C7A9:  69 0A     ADC #$0A
  $C7AB:  4A        LSR A
  $C7AC:  B0 05     BCS $C7B3
  $C7AE:  49 7F     EOR #$7F
  $C7B0:  18        CLC
  $C7B1:  69 85     ADC #$85
  $C7B3:  85 16     STA rng_temp
  $C7B5:  0A        ASL A
  $C7B6:  18        CLC
  $C7B7:  65 16     ADC rng_temp
  $C7B9:  0A        ASL A
  $C7BA:  0A        ASL A
  $C7BB:  0A        ASL A
  $C7BC:  0A        ASL A
  $C7BD:  18        CLC
  $C7BE:  69 10     ADC #$10
  $C7C0:  85 16     STA rng_temp
  $C7C2:  68        PLA
  $C7C3:  38        SEC
  $C7C4:  E9 04     SBC #$04
  $C7C6:  38        SEC
  $C7C7:  E9 0C     SBC #$0C
  $C7C9:  B0 FB     BCS $C7C6
  $C7CB:  69 0C     ADC #$0C
  $C7CD:  0A        ASL A
  $C7CE:  0A        ASL A
  $C7CF:  18        CLC
  $C7D0:  65 16     ADC rng_temp
  $C7D2:  90 02     BCC $C7D6
  $C7D4:  69 0F     ADC #$0F
  $C7D6:  A8        TAY
  $C7D7:  84 16     STY rng_temp
  $C7D9:  68        PLA
  $C7DA:  AA        TAX
  $C7DB:  60        RTS
  $C7DC:  04        .db $04
  $C7DD:  10 1C     BPL $C7FB
  $C7DF:  28        PLP
  $C7E0:  34        .db $34
  $C7E1:  AA        TAX
  $C7E2:  AD 07 05  LDA current_bank
  $C7E5:  48        PHA
  $C7E6:  8A        TXA
  $C7E7:  20 91 FF  JSR bank_switch
  $C7EA:  A0 00     LDY #$00
  $C7EC:  B1 00     LDA ($00),Y
  $C7EE:  99 08 01  STA $0108,Y
  $C7F1:  C8        INY
  $C7F2:  C0 11     CPY #$11
  $C7F4:  D0 F6     BNE $C7EC
  $C7F6:  68        PLA
  $C7F7:  4C 91 FF  JMP bank_switch
  $C7FA:  EA        NOP

sub_C7FB:
  $C7FB:  49 FF     EOR #$FF
  $C7FD:  38        SEC
  $C7FE:  75 00     ADC $00,X
  $C800:  95 00     STA $00,X
  $C802:  B0 02     BCS $C806
  $C804:  D6 01     DEC $01,X
  $C806:  60        RTS
  $C807:  20 FB C7  JSR $C7FB
  $C80A:  98        TYA
  $C80B:  49 FF     EOR #$FF
  $C80D:  38        SEC
  $C80E:  75 01     ADC $01,X
  $C810:  95 01     STA $01,X
  $C812:  60        RTS
sub_C813:
  $C813:  18        CLC
  $C814:  75 00     ADC $00,X
  $C816:  95 00     STA $00,X
  $C818:  90 02     BCC $C81C
  $C81A:  F6 01     INC $01,X
  $C81C:  60        RTS
sub_C81D:
  $C81D:  20 13 C8  JSR $C813
  $C820:  98        TYA
  $C821:  18        CLC
  $C822:  75 01     ADC $01,X
  $C824:  95 01     STA $01,X
  $C826:  60        RTS
sub_C827:
  $C827:  85 16     STA rng_temp
  $C829:  A9 00     LDA #$00
  $C82B:  85 17     STA $17
  $C82D:  85 18     STA encounter_rate
  $C82F:  46 16     LSR rng_temp
  $C831:  90 0D     BCC $C840
  $C833:  B5 00     LDA $00,X
  $C835:  18        CLC
  $C836:  65 17     ADC $17
  $C838:  85 17     STA $17
  $C83A:  B5 01     LDA $01,X
  $C83C:  65 18     ADC encounter_rate
  $C83E:  85 18     STA encounter_rate
  $C840:  16 00     ASL $00,X
  $C842:  36 01     ROL $01,X
  $C844:  A5 16     LDA rng_temp
  $C846:  D0 E7     BNE $C82F
  $C848:  A5 17     LDA $17
  $C84A:  95 00     STA $00,X
  $C84C:  A5 18     LDA encounter_rate
  $C84E:  95 01     STA $01,X
  $C850:  60        RTS
  $C851:  85 18     STA encounter_rate
  $C853:  98        TYA
  $C854:  48        PHA
  $C855:  A0 10     LDY #$10
  $C857:  A9 00     LDA #$00
  $C859:  85 19     STA $19
  $C85B:  85 16     STA rng_temp
  $C85D:  85 17     STA $17
  $C85F:  16 00     ASL $00,X
  $C861:  36 01     ROL $01,X
  $C863:  26 16     ROL rng_temp
  $C865:  26 17     ROL $17
  $C867:  F6 00     INC $00,X
  $C869:  A5 16     LDA rng_temp
  $C86B:  38        SEC
  $C86C:  E5 18     SBC encounter_rate
  $C86E:  48        PHA
  $C86F:  A5 17     LDA $17
  $C871:  E5 19     SBC $19
  $C873:  B0 06     BCS $C87B
  $C875:  68        PLA
  $C876:  D6 00     DEC $00,X
  $C878:  4C 80 C8  JMP $C880
  $C87B:  85 17     STA $17
  $C87D:  68        PLA
  $C87E:  85 16     STA rng_temp
  $C880:  88        DEY
  $C881:  D0 DC     BNE $C85F
  $C883:  68        PLA
  $C884:  A8        TAY
  $C885:  A5 16     LDA rng_temp
  $C887:  60        RTS
  $C888:  A1 00     LDA ($00,X)
  $C88A:  F6 00     INC $00,X
  $C88C:  D0 02     BNE rng_return
  $C88E:  F6 01     INC $01,X

rng_return:
  $C890:  60        RTS
rng_main:
  $C891:  98        TYA
  $C892:  48        PHA
  $C893:  A9 FF     LDA #$FF
  $C895:  85 16     STA rng_temp
  $C897:  20 AD C8  JSR rng_shifter
  $C89A:  A9 FF     LDA #$FF
  $C89C:  85 16     STA rng_temp
  $C89E:  20 AD C8  JSR rng_shifter

rng_inc_counter:
  $C8A1:  EE 0D 05  INC rng_counter
  $C8A4:  68        PLA
  $C8A5:  A8        TAY

rng_load_seed:
  $C8A6:  A5 12     LDA rng_seed_lo
  $C8A8:  18        CLC
  $C8A9:  6D 0D 05  ADC rng_counter
  $C8AC:  60        RTS
rng_shifter:
  $C8AD:  A0 08     LDY #$08
  $C8AF:  A5 13     LDA rng_seed_hi
  $C8B1:  45 16     EOR rng_temp
  $C8B3:  06 12     ASL rng_seed_lo
  $C8B5:  26 13     ROL rng_seed_hi
  $C8B7:  06 16     ASL rng_temp
  $C8B9:  0A        ASL A
  $C8BA:  90 0C     BCC $C8C8
  $C8BC:  A5 12     LDA rng_seed_lo
  $C8BE:  49 21     EOR #$21
  $C8C0:  85 12     STA rng_seed_lo
  $C8C2:  A5 13     LDA rng_seed_hi
  $C8C4:  49 10     EOR #$10
  $C8C6:  85 13     STA rng_seed_hi
  $C8C8:  88        DEY
  $C8C9:  D0 E4     BNE $C8AF

rng_shifter_end:
  $C8CB:  60        RTS
sub_C8CC:
  $C8CC:  A2 00     LDX #$00
  $C8CE:  8A        TXA
  $C8CF:  48        PHA
  $C8D0:  20 EC C8  JSR $C8EC
  $C8D3:  20 74 FF  JSR nmi_rng_update
  $C8D6:  68        PLA
  $C8D7:  AA        TAX
  $C8D8:  E8        INX
  $C8D9:  E0 5A     CPX #$5A
  $C8DB:  F0 0E     BEQ $C8EB
  $C8DD:  A5 14     LDA $14
  $C8DF:  D0 ED     BNE $C8CE
  $C8E1:  20 74 FF  JSR nmi_rng_update
  $C8E4:  20 EC C8  JSR $C8EC
  $C8E7:  A5 14     LDA $14
  $C8E9:  F0 F6     BEQ $C8E1
  $C8EB:  60        RTS
sub_C8EC:
  $C8EC:  A2 00     LDX #$00
  $C8EE:  20 F3 C8  JSR $C8F3
  $C8F1:  A2 01     LDX #$01

sub_C8F3:
  $C8F3:  A9 01     LDA #$01
  $C8F5:  8D 16 40  STA $4016
  $C8F8:  A9 00     LDA #$00
  $C8FA:  8D 16 40  STA $4016
  $C8FD:  A0 08     LDY #$08
  $C8FF:  BD 16 40  LDA $4016,X
  $C902:  4A        LSR A
  $C903:  B0 01     BCS $C906
  $C905:  4A        LSR A
  $C906:  76 14     ROR $14,X
  $C908:  88        DEY
  $C909:  D0 F4     BNE $C8FF
  $C90B:  60        RTS
sub_C90C:
  $C90C:  20 74 FF  JSR nmi_rng_update
  $C90F:  CA        DEX
  $C910:  D0 FA     BNE $C90C
  $C912:  60        RTS
rng_related:
  $C913:  8A        TXA
  $C914:  48        PHA
  $C915:  98        TYA
  $C916:  48        PHA
  $C917:  20 1F C9  JSR $C91F
  $C91A:  68        PLA
  $C91B:  A8        TAY
  $C91C:  68        PLA
  $C91D:  AA        TAX
  $C91E:  60        RTS
sub_C91F:
  $C91F:  A5 1F     LDA state_flags
  $C921:  29 C8     AND #$C8
  $C923:  D0 25     BNE $C94A
  $C925:  AD 13 05  LDA $0513
  $C928:  29 01     AND #$01
  $C92A:  AA        TAX
  $C92B:  BD 4B C9  LDA $C94B,X
  $C92E:  48        PHA
  $C92F:  BD 4C C9  LDA $C94C,X
  $C932:  A2 40     LDX #$40
  $C934:  20 4E C9  JSR $C94E
  $C937:  A2 10     LDX #$10
  $C939:  68        PLA
  $C93A:  20 4E C9  JSR $C94E
  $C93D:  AE 13 05  LDX $0513
  $C940:  E8        INX
  $C941:  E0 0A     CPX #$0A
  $C943:  90 02     BCC $C947
  $C945:  A2 00     LDX #$00
  $C947:  8E 13 05  STX $0513
  $C94A:  60        RTS
  $C94B:  D0 A0     BNE $C8ED
  $C94D:  70 A8     BVS $C8F7
  $C94F:  A9 30     LDA #$30
  $C951:  85 10     STA $10
  $C953:  BD 00 02  LDA $0200,X
  $C956:  48        PHA
  $C957:  B9 00 02  LDA $0200,Y
  $C95A:  9D 00 02  STA $0200,X
  $C95D:  68        PLA
  $C95E:  99 00 02  STA $0200,Y
  $C961:  E8        INX
  $C962:  C8        INY
  $C963:  C6 10     DEC $10
  $C965:  D0 EC     BNE $C953
  $C967:  60        RTS
main_loop_entry:
  $C968:  20 83 C9  JSR setup_bank_trampoline
  $C96B:  20 2F C5  JSR clear_system_state
  $C96E:  00        BRK
  $C96F:  0B        .db $0B
  $C970:  BF        .db $BF
  $C971:  00        BRK
  $C972:  0D 2F 00  ORA $002F
  $C975:  0C        .db $0C
  $C976:  EF        .db $EF
  $C977:  00        BRK
  $C978:  34        .db $34
  $C979:  EF        .db $EF
  $C97A:  00        BRK
  $C97B:  22        .db $22
  $C97C:  EF        .db $EF

main_loop:
  $C97D:  20 ED C9  JSR main_frame_handler
  $C980:  4C 7D C9  JMP main_loop

setup_bank_trampoline:
  $C983:  A2 5D     LDX #$5D
  $C985:  BD 8F C9  LDA $C98F,X
  $C988:  9D AD 6C  STA $6CAD,X
  $C98B:  CA        DEX
  $C98C:  10 F7     BPL $C985
  $C98E:  60        RTS
  $C98F:  08        PHP
  $C990:  AD 07 05  LDA current_bank
  $C993:  8D CC 07  STA $07CC
  $C996:  A9 0F     LDA #$0F
  $C998:  8D 07 05  STA current_bank
  $C99B:  EA        NOP
  $C99C:  EA        NOP
  $C99D:  A9 00     LDA #$00
  $C99F:  8D 01 05  STA $0501
  $C9A2:  85 39     STA $39
  $C9A4:  8D FF BF  STA $BFFF
  $C9A7:  4A        LSR A
  $C9A8:  8D FF BF  STA $BFFF
  $C9AB:  4A        LSR A
  $C9AC:  8D FF BF  STA $BFFF
  $C9AF:  4A        LSR A
  $C9B0:  8D FF BF  STA $BFFF
  $C9B3:  4A        LSR A
  $C9B4:  8D FF BF  STA $BFFF
  $C9B7:  EA        NOP
  $C9B8:  EA        NOP
  $C9B9:  AD CA 07  LDA $07CA
  $C9BC:  28        PLP
  $C9BD:  20 00 00  JSR $0000
  $C9C0:  08        PHP
  $C9C1:  8D CA 07  STA $07CA
  $C9C4:  A9 10     LDA #$10
  $C9C6:  8D 01 05  STA $0501
  $C9C9:  85 39     STA $39
  $C9CB:  EA        NOP
  $C9CC:  EA        NOP
  $C9CD:  8D FF BF  STA $BFFF
  $C9D0:  4A        LSR A
  $C9D1:  8D FF BF  STA $BFFF
  $C9D4:  4A        LSR A
  $C9D5:  8D FF BF  STA $BFFF
  $C9D8:  4A        LSR A
  $C9D9:  8D FF BF  STA $BFFF
  $C9DC:  4A        LSR A
  $C9DD:  8D FF BF  STA $BFFF
  $C9E0:  EA        NOP
  $C9E1:  EA        NOP
  $C9E2:  AD CC 07  LDA $07CC
  $C9E5:  20 91 FF  JSR bank_switch
  $C9E8:  AD CA 07  LDA $07CA
  $C9EB:  28        PLP
  $C9EC:  60        RTS
main_frame_handler:
  $C9ED:  20 B4 CB  JSR timer_update
  $C9F0:  20 98 CB  JSR read_controller
  $C9F3:  20 21 CA  JSR sub_CA21
  $C9F6:  20 42 D5  JSR map_handler
  $C9F9:  20 6E E0  JSR movement_update
  $C9FC:  00        BRK
  $C9FD:  00        BRK
  $C9FE:  DF        .db $DF
  $C9FF:  20 01 C0  JSR $C001
  $CA02:  20 09 CE  JSR $CE09
  $CA05:  20 D5 D7  JSR $D7D5
  $CA08:  AE 2F 05  LDX $052F
  $CA0B:  20 0C C9  JSR $C90C
  $CA0E:  20 17 CA  JSR $CA17
  $CA11:  20 E1 D1  JSR $D1E1
  $CA14:  E6 3C     INC $3C
  $CA16:  60        RTS
sub_CA17:
  $CA17:  20 41 D2  JSR $D241
  $CA1A:  A5 14     LDA $14
  $CA1C:  29 04     AND #$04
  $CA1E:  D0 F7     BNE $CA17
  $CA20:  60        RTS
sub_CA21:
  $CA21:  AE 8E 05  LDX $058E
  $CA24:  BD 3C CA  LDA $CA3C,X
  $CA27:  25 3C     AND $3C
  $CA29:  D0 11     BNE $CA3C
  $CA2B:  A9 01     LDA #$01
  $CA2D:  8D 2F 05  STA $052F
  $CA30:  20 41 CA  JSR $CA41
  $CA33:  20 1E CB  JSR $CB1E
  $CA36:  20 F8 CB  JSR $CBF8
  $CA39:  20 71 CB  JSR $CB71
  $CA3C:  60        RTS
  $CA3D:  0F        .db $0F
  $CA3E:  07        .db $07
  $CA3F:  0F        .db $0F
  $CA40:  03        .db $03

sub_CA41:
  $CA41:  AD 30 05  LDA $0530
  $CA44:  10 0F     BPL $CA55
  $CA46:  A9 FF     LDA #$FF
  $CA48:  85 56     STA $56
  $CA4A:  20 18 DB  JSR $DB18
  $CA4D:  85 14     STA $14
  $CA4F:  AD 30 05  LDA $0530
  $CA52:  10 01     BPL $CA55
  $CA54:  60        RTS
  $CA55:  AD 15 05  LDA $0515
  $CA58:  C9 02     CMP #$02
  $CA5A:  D0 1B     BNE $CA77
  $CA5C:  20 41 D2  JSR $D241
  $CA5F:  A5 14     LDA $14
  $CA61:  29 F0     AND #$F0
  $CA63:  D0 0C     BNE $CA71
  $CA65:  AD 97 05  LDA $0597
  $CA68:  F0 0C     BEQ $CA76
  $CA6A:  A6 3D     LDX $3D
  $CA6C:  BD 1A CB  LDA $CB1A,X
  $CA6F:  85 14     STA $14
  $CA71:  A9 FF     LDA #$FF
  $CA73:  8D 97 05  STA $0597
  $CA76:  60        RTS
  $CA77:  A9 00     LDA #$00
  $CA79:  85 56     STA $56
  $CA7B:  AD 40 71  LDA $7140
  $CA7E:  29 1F     AND #$1F
  $CA80:  AA        TAX
  $CA81:  BD 40 6F  LDA $6F40,X
  $CA84:  C9 10     CMP #$10
  $CA86:  90 50     BCC $CAD8
  $CA88:  C9 14     CMP #$14
  $CA8A:  B0 4C     BCS $CAD8
  $CA8C:  29 03     AND #$03
  $CA8E:  AA        TAX
  $CA8F:  BD 1A CB  LDA $CB1A,X
  $CA92:  85 14     STA $14
  $CA94:  A9 02     LDA #$02
  $CA96:  8D 8E 05  STA $058E
  $CA99:  A9 20     LDA #$20
  $CA9B:  8D 8F 05  STA $058F
  $CA9E:  A2 03     LDX #$03
  $CAA0:  BD E0 70  LDA $70E0,X
  $CAA3:  09 40     ORA #$40
  $CAA5:  29 7F     AND #$7F
  $CAA7:  9D E0 70  STA $70E0,X
  $CAAA:  CA        DEX
  $CAAB:  10 F3     BPL $CAA0
  $CAAD:  00        BRK
  $CAAE:  A4 FB     LDY $FB
  $CAB0:  A5 3C     LDA $3C
  $CAB2:  29 F0     AND #$F0
  $CAB4:  09 08     ORA #$08
  $CAB6:  85 3C     STA $3C
  $CAB8:  A2 00     LDX #$00
  $CABA:  20 BE CA  JSR $CABE
  $CABD:  E8        INX

sub_CABE:
  $CABE:  BD 04 70  LDA $7004,X
  $CAC1:  29 7F     AND #$7F
  $CAC3:  9D 04 70  STA $7004,X
  $CAC6:  BD 64 6F  LDA $6F64,X
  $CAC9:  9D A4 6F  STA $6FA4,X
  $CACC:  BD 84 6F  LDA $6F84,X
  $CACF:  9D C4 6F  STA $6FC4,X
  $CAD2:  A9 00     LDA #$00
  $CAD4:  9D 2A 05  STA $052A,X
  $CAD7:  60        RTS
  $CAD8:  A5 15     LDA $15
  $CADA:  29 03     AND #$03
  $CADC:  4C EA CA  JMP $CAEA
  $CADF:  8D 8E 05  STA $058E
  $CAE2:  A9 20     LDA #$20
  $CAE4:  8D 8F 05  STA $058F
  $CAE7:  4C 41 D2  JMP $D241
  $CAEA:  AD 8E 05  LDA $058E
  $CAED:  C9 01     CMP #$01
  $CAEF:  F0 26     BEQ $CB17
  $CAF1:  A9 01     LDA #$01
  $CAF3:  8D 8E 05  STA $058E
  $CAF6:  A9 10     LDA #$10
  $CAF8:  8D 8F 05  STA $058F
  $CAFB:  A2 03     LDX #$03
  $CAFD:  BD E0 70  LDA $70E0,X
  $CB00:  29 BF     AND #$BF
  $CB02:  9D E0 70  STA $70E0,X
  $CB05:  BD E7 6B  LDA $6BE7,X
  $CB08:  29 20     AND #$20
  $CB0A:  0A        ASL A
  $CB0B:  0A        ASL A
  $CB0C:  49 80     EOR #$80
  $CB0E:  1D E0 70  ORA $70E0,X
  $CB11:  9D E0 70  STA $70E0,X
  $CB14:  CA        DEX
  $CB15:  10 E6     BPL $CAFD
  $CB17:  4C 41 D2  JMP $D241
  $CB1A:  10 80     BPL $CA9C
  $CB1C:  20 40 AD  JSR $AD40
  $CB1F:  15 05     ORA $05,X
  $CB21:  C9 02     CMP #$02
  $CB23:  D0 0E     BNE $CB33
  $CB25:  AD 97 05  LDA $0597
  $CB28:  F0 09     BEQ $CB33
  $CB2A:  A5 14     LDA $14
  $CB2C:  0D 29 05  ORA $0529
  $CB2F:  4A        LSR A
  $CB30:  90 01     BCC $CB33
  $CB32:  60        RTS
  $CB33:  A6 3D     LDX $3D
  $CB35:  F0 13     BEQ $CB4A
  $CB37:  CA        DEX
  $CB38:  F0 2A     BEQ $CB64
  $CB3A:  CA        DEX
  $CB3B:  F0 1A     BEQ $CB57
  $CB3D:  20 CA CB  JSR $CBCA
  $CB40:  20 D6 CB  JSR $CBD6
  $CB43:  20 E4 CB  JSR $CBE4
  $CB46:  20 BE CB  JSR $CBBE
  $CB49:  60        RTS
  $CB4A:  20 D6 CB  JSR $CBD6
  $CB4D:  20 BE CB  JSR $CBBE
  $CB50:  20 CA CB  JSR $CBCA
  $CB53:  20 E4 CB  JSR $CBE4
  $CB56:  60        RTS
  $CB57:  20 E4 CB  JSR $CBE4
  $CB5A:  20 CA CB  JSR $CBCA
  $CB5D:  20 BE CB  JSR $CBBE
  $CB60:  20 D6 CB  JSR $CBD6
  $CB63:  60        RTS
  $CB64:  20 BE CB  JSR $CBBE
  $CB67:  20 E4 CB  JSR $CBE4
  $CB6A:  20 D6 CB  JSR $CBD6
  $CB6D:  20 CA CB  JSR $CBCA
  $CB70:  60        RTS
sub_CB71:
  $CB71:  AD 30 05  LDA $0530
  $CB74:  30 21     BMI $CB97
  $CB76:  AD 99 05  LDA $0599
  $CB79:  29 10     AND #$10
  $CB7B:  D0 1A     BNE $CB97
  $CB7D:  AD 39 05  LDA $0539
  $CB80:  30 15     BMI $CB97
  $CB82:  18        CLC
  $CB83:  69 10     ADC #$10
  $CB85:  8D 39 05  STA $0539
  $CB88:  10 0D     BPL $CB97
  $CB8A:  00        BRK
  $CB8B:  13        .db $13
  $CB8C:  1F        .db $1F
  $CB8D:  90 04     BCC $CB93
  $CB8F:  00        BRK
  $CB90:  07        .db $07
  $CB91:  6F        .db $6F
  $CB92:  28        PLP
  $CB93:  00        BRK
  $CB94:  07        .db $07
  $CB95:  6F        .db $6F
  $CB96:  2A        ROL A
  $CB97:  60        RTS
read_controller:
  $CB98:  AD 2E 05  LDA $052E
  $CB9B:  F0 04     BEQ $CBA1
  $CB9D:  CE 2E 05  DEC $052E
  $CBA0:  60        RTS
  $CBA1:  A2 01     LDX #$01
  $CBA3:  8E 16 40  STX $4016
  $CBA6:  CA        DEX
  $CBA7:  8E 16 40  STX $4016
  $CBAA:  AD 16 40  LDA $4016
  $CBAD:  0D 29 05  ORA $0529
  $CBB0:  8D 29 05  STA $0529
  $CBB3:  60        RTS
timer_update:
  $CBB4:  AD 26 05  LDA $0526
  $CBB7:  18        CLC
  $CBB8:  69 08     ADC #$08
  $CBBA:  8D 26 05  STA $0526
  $CBBD:  60        RTS
sub_CBBE:
  $CBBE:  A5 14     LDA $14
  $CBC0:  10 35     BPL $CBF7
  $CBC2:  20 85 CD  JSR $CD85
  $CBC5:  A9 01     LDA #$01
  $CBC7:  4C EF CB  JMP $CBEF

sub_CBCA:
  $CBCA:  24 14     BIT $14
  $CBCC:  50 29     BVC $CBF7
  $CBCE:  20 85 CD  JSR $CD85
  $CBD1:  A9 03     LDA #$03
  $CBD3:  4C EF CB  JMP $CBEF

sub_CBD6:
  $CBD6:  A5 14     LDA $14
  $CBD8:  29 10     AND #$10
  $CBDA:  F0 1B     BEQ $CBF7
  $CBDC:  20 85 CD  JSR $CD85
  $CBDF:  A9 00     LDA #$00
  $CBE1:  4C EF CB  JMP $CBEF

sub_CBE4:
  $CBE4:  A5 14     LDA $14
  $CBE6:  29 20     AND #$20
  $CBE8:  F0 0D     BEQ $CBF7
  $CBEA:  20 85 CD  JSR $CD85
  $CBED:  A9 02     LDA #$02
  $CBEF:  85 3D     STA $3D
  $CBF1:  20 88 CC  JSR $CC88
  $CBF4:  4C C4 D0  JMP $D0C4
  $CBF7:  60        RTS
sub_CBF8:
  $CBF8:  AD 30 05  LDA $0530
  $CBFB:  30 67     BMI $CC64
  $CBFD:  A5 14     LDA $14
  $CBFF:  0D 29 05  ORA $0529
  $CC02:  29 01     AND #$01
  $CC04:  F0 5D     BEQ $CC63
  $CC06:  0E 29 05  ASL $0529
  $CC09:  AD 15 05  LDA $0515
  $CC0C:  C9 02     CMP #$02
  $CC0E:  F0 23     BEQ fixed_ldx_limit_x
  $CC10:  A5 41     LDA $41
  $CC12:  30 54     BMI $CC68
  $CC14:  A5 42     LDA $42

fixed_cmp_limit_x:
  $CC16:  CD 97 61  CMP battle_limit_x
  $CC19:  D0 4D     BNE $CC68
  $CC1B:  A5 43     LDA $43

fixed_cmp_limit_y:
  $CC1D:  CD 98 61  CMP battle_limit_y
  $CC20:  D0 46     BNE $CC68
  $CC22:  00        BRK
  $CC23:  13        .db $13
  $CC24:  EB        .db $EB
  $CC25:  02        .db $02
  $CC26:  F0 40     BEQ $CC68

fixed_read_actor_1:
  $CC28:  AD 5A 61  LDA battle_actor_index
  $CC2B:  C9 04     CMP #$04
  $CC2D:  D0 39     BNE $CC68
  $CC2F:  00        BRK
  $CC30:  08        PHP
  $CC31:  EF        .db $EF
  $CC32:  60        RTS
fixed_ldx_limit_x:
  $CC33:  AE 97 61  LDX battle_limit_x

fixed_ldy_limit_y:
  $CC36:  AC 98 61  LDY battle_limit_y
  $CC39:  20 51 D2  JSR $D251
  $CC3C:  AA        TAX
  $CC3D:  BD 40 6F  LDA $6F40,X
  $CC40:  D0 3F     BNE $CC81
  $CC42:  00        BRK
  $CC43:  5B        .db $5B
  $CC44:  33        .db $33
  $CC45:  A9 00     LDA #$00
  $CC47:  8D 15 05  STA $0515
  $CC4A:  A9 10     LDA #$10
  $CC4C:  8D 2E 05  STA $052E
  $CC4F:  00        BRK
  $CC50:  18        CLC
  $CC51:  EF        .db $EF
  $CC52:  00        BRK
  $CC53:  0E EF 20  ASL $20EF
  $CC56:  F1 DF     SBC ($DF),Y
  $CC58:  00        BRK
  $CC59:  09 9F     ORA #$9F
  $CC5B:  AD 00 70  LDA $7000
  $CC5E:  09 40     ORA #$40
  $CC60:  8D 00 70  STA $7000
  $CC63:  60        RTS
  $CC64:  0E 29 05  ASL $0529
  $CC67:  60        RTS
  $CC68:  AD 99 05  LDA $0599
  $CC6B:  29 10     AND #$10
  $CC6D:  D0 0E     BNE $CC7D
  $CC6F:  AD 39 05  LDA $0539
  $CC72:  30 09     BMI $CC7D
  $CC74:  00        BRK
  $CC75:  07        .db $07
  $CC76:  6F        .db $6F
  $CC77:  2A        ROL A
  $CC78:  A9 80     LDA #$80
  $CC7A:  8D 39 05  STA $0539
  $CC7D:  00        BRK
  $CC7E:  14        .db $14
  $CC7F:  EF        .db $EF
  $CC80:  60        RTS
  $CC81:  A9 0B     LDA #$0B
  $CC83:  A2 03     LDX #$03
  $CC85:  4C ED D1  JMP $D1ED

sub_CC88:
  $CC88:  20 91 CF  JSR $CF91
  $CC8B:  20 91 CC  JSR $CC91
  $CC8E:  4C C9 CD  JMP $CDC9

sub_CC91:
  $CC91:  20 6F D1  JSR $D16F
  $CC94:  95 43     STA $43,X
  $CC96:  8D 80 6F  STA $6F80
  $CC99:  A5 52     LDA $52
  $CC9B:  95 42     STA $42,X
  $CC9D:  8D 60 6F  STA $6F60
  $CCA0:  AD 15 05  LDA $0515
  $CCA3:  F0 44     BEQ $CCE9
  $CCA5:  E0 00     CPX #$00
  $CCA7:  D0 41     BNE $CCEA
  $CCA9:  29 02     AND #$02
  $CCAB:  AA        TAX
  $CCAC:  4A        LSR A
  $CCAD:  A8        TAY
  $CCAE:  A5 42     LDA $42

fixed_set_counter_1:
  $CCB0:  9D 95 61  STA battle_counter_1,X
  $CCB3:  99 66 6F  STA $6F66,Y
  $CCB6:  A5 43     LDA $43

fixed_set_counter_2:
  $CCB8:  9D 96 61  STA battle_counter_2,X
  $CCBB:  99 86 6F  STA $6F86,Y
  $CCBE:  E0 00     CPX #$00
  $CCC0:  F0 13     BEQ $CCD5
  $CCC2:  A5 42     LDA $42
  $CCC4:  99 67 6F  STA $6F67,Y
  $CCC7:  99 68 6F  STA $6F68,Y
  $CCCA:  A5 43     LDA $43
  $CCCC:  99 88 6F  STA $6F88,Y
  $CCCF:  38        SEC
  $CCD0:  E9 01     SBC #$01
  $CCD2:  99 87 6F  STA $6F87,Y
  $CCD5:  20 78 CD  JSR $CD78
  $CCD8:  E0 00     CPX #$00
  $CCDA:  F0 5F     BEQ $CD3B
  $CCDC:  C8        INY
  $CCDD:  20 78 CD  JSR $CD78
  $CCE0:  C8        INY
  $CCE1:  20 78 CD  JSR $CD78
  $CCE4:  88        DEY
  $CCE5:  88        DEY
  $CCE6:  20 0F CD  JSR $CD0F
  $CCE9:  60        RTS
  $CCEA:  AD 34 05  LDA $0534
  $CCED:  29 1F     AND #$1F
  $CCEF:  AA        TAX
  $CCF0:  A5 44     LDA $44
  $CCF2:  8D 4E 05  STA $054E
  $CCF5:  9D 60 6F  STA $6F60,X
  $CCF8:  A5 45     LDA $45
  $CCFA:  8D 4F 05  STA $054F
  $CCFD:  9D 80 6F  STA $6F80,X
  $CD00:  BD 00 70  LDA $7000,X
  $CD03:  29 FC     AND #$FC
  $CD05:  05 3D     ORA $3D
  $CD07:  09 80     ORA #$80
  $CD09:  9D 00 70  STA $7000,X
  $CD0C:  4C FC D7  JMP $D7FC

sub_CD0F:
  $CD0F:  A5 57     LDA $57
  $CD11:  F0 28     BEQ $CD3B
  $CD13:  8A        TXA
  $CD14:  48        PHA
  $CD15:  98        TYA
  $CD16:  48        PHA
  $CD17:  A6 58     LDX $58
  $CD19:  B5 EC     LDA $EC,X
  $CD1B:  18        CLC
  $CD1C:  65 57     ADC $57
  $CD1E:  95 EC     STA $EC,X
  $CD20:  8A        TXA
  $CD21:  0A        ASL A
  $CD22:  0A        ASL A
  $CD23:  0A        ASL A
  $CD24:  0A        ASL A
  $CD25:  0A        ASL A
  $CD26:  AA        TAX
  $CD27:  A0 00     LDY #$00
  $CD29:  BD A7 6F  LDA $6FA7,X
  $CD2C:  18        CLC
  $CD2D:  65 57     ADC $57
  $CD2F:  9D A7 6F  STA $6FA7,X
  $CD32:  E8        INX
  $CD33:  C8        INY
  $CD34:  C0 03     CPY #$03
  $CD36:  90 F1     BCC $CD29
  $CD38:  68        PLA
  $CD39:  B0 03     BCS $CD3E
  $CD3B:  8A        TXA
  $CD3C:  48        PHA
  $CD3D:  98        TYA
  $CD3E:  18        CLC
  $CD3F:  69 06     ADC #$06
  $CD41:  AA        TAX
  $CD42:  20 FC D7  JSR $D7FC
  $CD45:  68        PLA
  $CD46:  AA        TAX
  $CD47:  F0 A0     BEQ $CCE9
  $CD49:  A2 08     LDX #$08
  $CD4B:  20 FC D7  JSR $D7FC
  $CD4E:  20 52 CD  JSR $CD52
  $CD51:  60        RTS
sub_CD52:
  $CD52:  A2 0B     LDX #$0B
  $CD54:  AD 40 71  LDA $7140
  $CD57:  F0 11     BEQ $CD6A
  $CD59:  A2 07     LDX #$07
  $CD5B:  DD 70 CD  CMP $CD70,X
  $CD5E:  F0 08     BEQ $CD68
  $CD60:  CA        DEX
  $CD61:  10 F8     BPL $CD5B
  $CD63:  A2 0A     LDX #$0A
  $CD65:  4C 6A CD  JMP $CD6A
  $CD68:  A2 09     LDX #$09
  $CD6A:  8E E9 6F  STX $6FE9
  $CD6D:  A2 09     LDX #$09
  $CD6F:  60        RTS
  $CD70:  01 06     ORA ($06,X)
  $CD72:  0D 0E 0F  ORA $0F0E
  $CD75:  11 12     ORA ($12),Y
  $CD77:  13        .db $13

sub_CD78:
  $CD78:  B9 06 70  LDA $7006,Y
  $CD7B:  29 FC     AND #$FC
  $CD7D:  05 3D     ORA $3D
  $CD7F:  09 80     ORA #$80
  $CD81:  99 06 70  STA $7006,Y
  $CD84:  60        RTS
sub_CD85:
  $CD85:  AD 39 05  LDA $0539
  $CD88:  10 04     BPL $CD8E
  $CD8A:  00        BRK
  $CD8B:  07        .db $07
  $CD8C:  6F        .db $6F
  $CD8D:  FF        .db $FF
  $CD8E:  A9 00     LDA #$00
  $CD90:  8D 39 05  STA $0539
  $CD93:  AD 99 05  LDA $0599
  $CD96:  29 F0     AND #$F0
  $CD98:  F0 2E     BEQ $CDC8
  $CD9A:  A0 BC     LDY #$BC
  $CD9C:  29 30     AND #$30
  $CD9E:  D0 16     BNE $CDB6
  $CDA0:  88        DEY
  $CDA1:  A2 00     LDX #$00
  $CDA3:  00        BRK
  $CDA4:  2B        .db $2B
  $CDA5:  63        .db $63
  $CDA6:  41 C9     EOR ($C9,X)
  $CDA8:  08        PHP
  $CDA9:  B0 04     BCS $CDAF
  $CDAB:  E8        INX
  $CDAC:  4C A3 CD  JMP $CDA3
  $CDAF:  86 6E     STX $6E
  $CDB1:  00        BRK
  $CDB2:  2E 0F 85  ROL $850F
  $CDB5:  F9 98 A2  SBC $A298,Y
  $CDB8:  03        .db $03
  $CDB9:  20 FD D1  JSR $D1FD
  $CDBC:  A2 03     LDX #$03
  $CDBE:  A9 BD     LDA #$BD
  $CDC0:  00        BRK
  $CDC1:  04        .db $04
  $CDC2:  6F        .db $6F
  $CDC3:  20 F0 D1  JSR $D1F0
  $CDC6:  68        PLA
  $CDC7:  68        PLA
  $CDC8:  60        RTS
  $CDC9:  AD 01 70  LDA $7001
  $CDCC:  29 03     AND #$03
  $CDCE:  8D 28 05  STA $0528
  $CDD1:  A9 10     LDA #$10
  $CDD3:  85 3E     STA $3E
  $CDD5:  20 07 C0  JSR $C007
  $CDD8:  20 DC CD  JSR $CDDC
  $CDDB:  60        RTS
sub_CDDC:
  $CDDC:  A5 41     LDA $41
  $CDDE:  30 28     BMI $CE08
  $CDE0:  AD 88 62  LDA $6288
  $CDE3:  30 23     BMI $CE08
  $CDE5:  A5 12     LDA rng_seed_lo
  $CDE7:  29 1F     AND #$1F
  $CDE9:  69 FF     ADC #$FF
  $CDEB:  8D 16 05  STA $0516
  $CDEE:  8D 16 05  STA $0516
  $CDF1:  90 15     BCC $CE08
  $CDF3:  EE ED 62  INC $62ED
  $CDF6:  AD ED 62  LDA $62ED
  $CDF9:  C9 CC     CMP #$CC
  $CDFB:  90 0B     BCC $CE08
  $CDFD:  A9 00     LDA #$00
  $CDFF:  8D ED 62  STA $62ED
  $CE02:  EE 8C 62  INC $628C
  $CE05:  EE 8D 62  INC $628D
  $CE08:  60        RTS
sub_CE09:
  $CE09:  C9 00     CMP #$00
  $CE0B:  D0 43     BNE $CE50
  $CE0D:  A5 41     LDA $41
  $CE0F:  10 6F     BPL $CE80
  $CE11:  A5 44     LDA $44
  $CE13:  8D A0 6F  STA $6FA0
  $CE16:  A5 45     LDA $45
  $CE18:  8D C0 6F  STA $6FC0
  $CE1B:  AD 27 05  LDA $0527
  $CE1E:  F0 11     BEQ $CE31
  $CE20:  30 0C     BMI $CE2E
  $CE22:  8D 15 05  STA $0515
  $CE25:  00        BRK
  $CE26:  00        BRK
  $CE27:  EF        .db $EF
  $CE28:  00        BRK
  $CE29:  04        .db $04
  $CE2A:  EF        .db $EF
  $CE2B:  4C 31 CE  JMP $CE31
  $CE2E:  20 72 CE  JSR $CE72
  $CE31:  20 56 CF  JSR $CF56
  $CE34:  00        BRK
  $CE35:  00        BRK
  $CE36:  BF        .db $BF
  $CE37:  B0 0E     BCS $CE47
  $CE39:  20 5F CF  JSR $CF5F
  $CE3C:  20 BE CE  JSR $CEBE
  $CE3F:  B0 09     BCS $CE4A
  $CE41:  20 8D CF  JSR $CF8D
  $CE44:  4C 4A CE  JMP $CE4A
  $CE47:  20 56 CF  JSR $CF56
  $CE4A:  20 A9 CE  JSR $CEA9
  $CE4D:  4C 10 C0  JMP $C010
  $CE50:  AA        TAX
  $CE51:  A5 3C     LDA $3C
  $CE53:  29 0F     AND #$0F
  $CE55:  C9 0F     CMP #$0F
  $CE57:  D0 0F     BNE $CE68
  $CE59:  24 41     BIT $41
  $CE5B:  30 0C     BMI $CE69
  $CE5D:  AD 2C 05  LDA $052C
  $CE60:  0D 2D 05  ORA $052D
  $CE63:  F0 03     BEQ $CE68
  $CE65:  00        BRK
  $CE66:  07        .db $07
  $CE67:  EF        .db $EF
  $CE68:  60        RTS
  $CE69:  E0 FF     CPX #$FF
  $CE6B:  D0 FB     BNE $CE68
  $CE6D:  AD 27 05  LDA $0527
  $CE70:  10 F6     BPL $CE68

sub_CE72:
  $CE72:  A9 00     LDA #$00
  $CE74:  8D 27 05  STA $0527
  $CE77:  AD 93 05  LDA $0593
  $CE7A:  AE 94 05  LDX $0594
  $CE7D:  4C 07 D2  JMP $D207
  $CE80:  20 56 CF  JSR $CF56
  $CE83:  AD 27 05  LDA $0527
  $CE86:  F0 12     BEQ $CE9A
  $CE88:  8D 15 05  STA $0515
  $CE8B:  00        BRK
  $CE8C:  09 FB     ORA #$FB
  $CE8E:  A9 20     LDA #$20
  $CE90:  8D 34 05  STA $0534
  $CE93:  00        BRK
  $CE94:  00        BRK
  $CE95:  EF        .db $EF
  $CE96:  00        BRK
  $CE97:  04        .db $04
  $CE98:  EF        .db $EF
  $CE99:  60        RTS
  $CE9A:  20 03 CF  JSR $CF03
  $CE9D:  20 38 CF  JSR $CF38
  $CEA0:  20 41 CF  JSR fixed_read_actor_2
  $CEA3:  20 A9 CE  JSR $CEA9
  $CEA6:  4C 10 C0  JMP $C010

sub_CEA9:
  $CEA9:  AD 00 C0  LDA $C000
  $CEAC:  29 40     AND #$40
  $CEAE:  D0 06     BNE $CEB6
  $CEB0:  A5 14     LDA $14
  $CEB2:  29 08     AND #$08
  $CEB4:  F0 07     BEQ $CEBD
  $CEB6:  BA        TSX
  $CEB7:  8E 1B 05  STX $051B
  $CEBA:  00        BRK
  $CEBB:  00        BRK
  $CEBC:  8F        .db $8F
  $CEBD:  60        RTS
sub_CEBE:
  $CEBE:  AD 9E 05  LDA $059E
  $CEC1:  A2 00     LDX #$00
  $CEC3:  29 7F     AND #$7F
  $CEC5:  DD F8 CE  CMP $CEF8,X
  $CEC8:  F0 07     BEQ $CED1
  $CECA:  E8        INX
  $CECB:  E0 0B     CPX #$0B
  $CECD:  90 F6     BCC $CEC5
  $CECF:  18        CLC
  $CED0:  60        RTS
  $CED1:  E0 06     CPX #$06
  $CED3:  F0 1E     BEQ $CEF3
  $CED5:  E0 08     CPX #$08
  $CED7:  F0 0D     BEQ $CEE6
  $CED9:  E0 09     CPX #$09
  $CEDB:  F0 09     BEQ $CEE6
  $CEDD:  E0 0A     CPX #$0A
  $CEDF:  F0 0D     BEQ $CEEE
  $CEE1:  00        BRK
  $CEE2:  0D EF 38  ORA $38EF
  $CEE5:  60        RTS
  $CEE6:  00        BRK
  $CEE7:  1B        .db $1B
  $CEE8:  EF        .db $EF
  $CEE9:  20 BE CE  JSR $CEBE
  $CEEC:  38        SEC
  $CEED:  60        RTS
  $CEEE:  00        BRK
  $CEEF:  21 EF     AND ($EF,X)
  $CEF1:  38        SEC
  $CEF2:  60        RTS
  $CEF3:  00        BRK
  $CEF4:  09 BF     ORA #$BF
  $CEF6:  38        SEC
  $CEF7:  60        RTS
  $CEF8:  06 07     ASL $07
  $CEFA:  08        PHP
  $CEFB:  09 25     ORA #$25
  $CEFD:  26 0A     ROL $0A
  $CEFF:  0C        .db $0C
  $CF00:  05 0B     ORA $0B
  $CF02:  0F        .db $0F

sub_CF03:
  $CF03:  AD 15 05  LDA $0515
  $CF06:  C9 02     CMP #$02
  $CF08:  F0 2D     BEQ $CF37
  $CF0A:  AE 40 71  LDX $7140
  $CF0D:  AC 41 71  LDY $7141
  $CF10:  BD 40 6F  LDA $6F40,X
  $CF13:  29 7F     AND #$7F
  $CF15:  C9 06     CMP #$06
  $CF17:  F0 12     BEQ $CF2B
  $CF19:  C9 07     CMP #$07
  $CF1B:  D0 1A     BNE $CF37
  $CF1D:  B9 40 6F  LDA $6F40,Y
  $CF20:  29 7F     AND #$7F
  $CF22:  C9 06     CMP #$06
  $CF24:  F0 11     BEQ $CF37
  $CF26:  C6 42     DEC $42
  $CF28:  4C 34 CF  JMP $CF34
  $CF2B:  B9 40 6F  LDA $6F40,Y
  $CF2E:  29 7F     AND #$7F
  $CF30:  C9 07     CMP #$07
  $CF32:  F0 03     BEQ $CF37
  $CF34:  00        BRK
  $CF35:  01 EF     ORA ($EF,X)
  $CF37:  60        RTS
sub_CF38:
  $CF38:  00        BRK
  $CF39:  10 87     BPL $CEC2
  $CF3B:  90 03     BCC $CF40
  $CF3D:  00        BRK
  $CF3E:  06 EF     ASL $EF
  $CF40:  60        RTS
fixed_read_actor_2:
  $CF41:  AD 5A 61  LDA battle_actor_index
  $CF44:  C9 03     CMP #$03
  $CF46:  D0 0D     BNE $CF55
  $CF48:  A5 43     LDA $43
  $CF4A:  C9 67     CMP #$67
  $CF4C:  D0 07     BNE $CF55
  $CF4E:  A2 03     LDX #$03
  $CF50:  A9 AB     LDA #$AB
  $CF52:  20 07 D2  JSR $D207
  $CF55:  60        RTS
sub_CF56:
  $CF56:  AD 15 05  LDA $0515
  $CF59:  D0 03     BNE $CF5E
  $CF5B:  00        BRK
  $CF5C:  16 EF     ASL $EF,X
  $CF5E:  60        RTS
sub_CF5F:
  $CF5F:  A5 46     LDA $46
  $CF61:  85 47     STA $47
  $CF63:  AD 40 71  LDA $7140
  $CF66:  29 E0     AND #$E0
  $CF68:  85 46     STA $46
  $CF6A:  A2 00     LDX #$00
  $CF6C:  C5 47     CMP $47
  $CF6E:  F0 0D     BEQ $CF7D
  $CF70:  00        BRK
  $CF71:  00        BRK
  $CF72:  87        .db $87
  $CF73:  90 03     BCC $CF78
  $CF75:  00        BRK
  $CF76:  1C        .db $1C
  $CF77:  EF        .db $EF
  $CF78:  00        BRK
  $CF79:  0A        ASL A
  $CF7A:  EF        .db $EF
  $CF7B:  A2 10     LDX #$10
  $CF7D:  AD 7D 62  LDA $627D
  $CF80:  29 EF     AND #$EF
  $CF82:  8D 7D 62  STA $627D
  $CF85:  8A        TXA
  $CF86:  0D 7D 62  ORA $627D
  $CF89:  8D 7D 62  STA $627D
  $CF8C:  60        RTS
sub_CF8D:
  $CF8D:  00        BRK
  $CF8E:  02        .db $02
  $CF8F:  EF        .db $EF
  $CF90:  60        RTS
sub_CF91:
  $CF91:  AD 00 70  LDA $7000
  $CF94:  29 FC     AND #$FC
  $CF96:  05 3D     ORA $3D
  $CF98:  09 40     ORA #$40
  $CF9A:  8D 00 70  STA $7000
  $CF9D:  A2 00     LDX #$00
  $CF9F:  8E 27 05  STX $0527
  $CFA2:  20 FC D7  JSR $D7FC
  $CFA5:  20 6F D1  JSR $D16F
  $CFA8:  24 41     BIT $41
  $CFAA:  10 03     BPL $CFAF
  $CFAC:  4C 50 D0  JMP $D050
  $CFAF:  A8        TAY
  $CFB0:  A5 52     LDA $52
  $CFB2:  AA        TAX
  $CFB3:  20 51 D2  JSR $D251
  $CFB6:  85 54     STA $54
  $CFB8:  AA        TAX
  $CFB9:  AD 15 05  LDA $0515
  $CFBC:  D0 58     BNE $D016
  $CFBE:  AD 00 C0  LDA $C000
  $CFC1:  30 06     BMI $CFC9
  $CFC3:  A5 14     LDA $14
  $CFC5:  29 02     AND #$02
  $CFC7:  D0 41     BNE $D00A
  $CFC9:  BD 40 6F  LDA $6F40,X
  $CFCC:  8D 9E 05  STA $059E
  $CFCF:  10 1A     BPL $CFEB
  $CFD1:  C9 83     CMP #$83
  $CFD3:  D0 3B     BNE $D010
  $CFD5:  A5 52     LDA $52

fixed_cmp_counter_1:
  $CFD7:  CD 95 61  CMP battle_counter_1
  $CFDA:  D0 37     BNE $D013
  $CFDC:  A5 53     LDA $53

fixed_cmp_counter_2:
  $CFDE:  CD 96 61  CMP battle_counter_2
  $CFE1:  D0 30     BNE $D013
  $CFE3:  A9 01     LDA #$01
  $CFE5:  8D 27 05  STA $0527
  $CFE8:  4C 0A D0  JMP $D00A
  $CFEB:  A5 65     LDA $65
  $CFED:  C9 03     CMP #$03
  $CFEF:  D0 19     BNE $D00A
  $CFF1:  A2 03     LDX #$03
  $CFF3:  BD 6A 6F  LDA $6F6A,X
  $CFF6:  C5 52     CMP $52
  $CFF8:  D0 0D     BNE $D007
  $CFFA:  BD 8A 6F  LDA $6F8A,X
  $CFFD:  C5 53     CMP $53
  $CFFF:  D0 06     BNE $D007
  $D001:  00        BRK
  $D002:  81 FB     STA ($FB,X)
  $D004:  4C 13 D0  JMP $D013
  $D007:  CA        DEX
  $D008:  10 E9     BPL $CFF3
  $D00A:  A5 54     LDA $54
  $D00C:  20 C9 D1  JSR $D1C9
  $D00F:  60        RTS
  $D010:  00        BRK
  $D011:  A2 FB     LDX #$FB
  $D013:  4C C4 D0  JMP $D0C4
  $D016:  C9 01     CMP #$01
  $D018:  D0 F0     BNE $D00A
  $D01A:  BD 40 6F  LDA $6F40,X
  $D01D:  C9 83     CMP #$83
  $D01F:  F0 E9     BEQ $D00A
  $D021:  C9 24     CMP #$24
  $D023:  F0 E5     BEQ $D00A
  $D025:  29 80     AND #$80
  $D027:  D0 EA     BNE $D013
  $D029:  8D 15 05  STA $0515
  $D02C:  00        BRK
  $D02D:  59 33 AD  EOR $AD33,Y
  $D030:  34        .db $34
  $D031:  05 29     ORA $29
  $D033:  1F        .db $1F
  $D034:  8D 34 05  STA $0534
  $D037:  AD 88 62  LDA $6288
  $D03A:  30 03     BMI $D03F
  $D03C:  00        BRK
  $D03D:  09 9F     ORA #$9F
  $D03F:  00        BRK
  $D040:  0E EF 20  ASL $20EF
  $D043:  F1 DF     SBC ($DF),Y
  $D045:  AD 00 70  LDA $7000
  $D048:  09 40     ORA #$40
  $D04A:  8D 00 70  STA $7000
  $D04D:  4C 0A D0  JMP $D00A
  $D050:  48        PHA
  $D051:  A5 52     LDA $52
  $D053:  48        PHA
  $D054:  A5 63     LDA $63
  $D056:  C9 3E     CMP #$3E
  $D058:  F0 04     BEQ $D05E
  $D05A:  A5 56     LDA $56
  $D05C:  D0 22     BNE $D080
  $D05E:  AD 15 05  LDA $0515
  $D061:  C9 01     CMP #$01
  $D063:  D0 10     BNE $D075
  $D065:  AD 34 05  LDA $0534
  $D068:  29 1F     AND #$1F
  $D06A:  AA        TAX
  $D06B:  BD 00 70  LDA $7000,X
  $D06E:  29 FC     AND #$FC
  $D070:  05 3D     ORA $3D
  $D072:  9D 00 70  STA $7000,X
  $D075:  A9 00     LDA #$00
  $D077:  85 51     STA $51
  $D079:  A2 06     LDX #$06
  $D07B:  20 24 D7  JSR $D724
  $D07E:  B0 6F     BCS $D0EF
  $D080:  68        PLA
  $D081:  AA        TAX
  $D082:  68        PLA
  $D083:  A8        TAY
  $D084:  20 E6 D3  JSR $D3E6
  $D087:  A8        TAY
  $D088:  29 1F     AND #$1F
  $D08A:  AA        TAX
  $D08B:  AD 27 05  LDA $0527
  $D08E:  D0 28     BNE $D0B8
  $D090:  AD 15 05  LDA $0515
  $D093:  D0 28     BNE $D0BD
  $D095:  BD 40 6F  LDA $6F40,X
  $D098:  8D 9E 05  STA $059E
  $D09B:  AD 00 C0  LDA $C000
  $D09E:  30 06     BMI $D0A6
  $D0A0:  A5 14     LDA $14
  $D0A2:  29 02     AND #$02
  $D0A4:  D0 12     BNE $D0B8
  $D0A6:  AD 9E 05  LDA $059E
  $D0A9:  C9 83     CMP #$83
  $D0AB:  F0 17     BEQ $D0C4
  $D0AD:  C9 B0     CMP #$B0
  $D0AF:  F0 18     BEQ $D0C9
  $D0B1:  29 80     AND #$80
  $D0B3:  F0 03     BEQ $D0B8
  $D0B5:  4C 10 D0  JMP $D010
  $D0B8:  98        TYA
  $D0B9:  20 C9 D1  JSR $D1C9
  $D0BC:  60        RTS
  $D0BD:  84 54     STY $54
  $D0BF:  4C 1A D0  JMP $D01A
  $D0C2:  68        PLA
  $D0C3:  68        PLA
  $D0C4:  68        PLA
  $D0C5:  68        PLA
  $D0C6:  68        PLA
  $D0C7:  68        PLA
  $D0C8:  60        RTS
  $D0C9:  A5 63     LDA $63
  $D0CB:  C9 37     CMP #$37
  $D0CD:  D0 E6     BNE $D0B5
  $D0CF:  AD E7 6B  LDA $6BE7
  $D0D2:  0D E8 6B  ORA $6BE8
  $D0D5:  0D E9 6B  ORA $6BE9
  $D0D8:  29 C0     AND #$C0
  $D0DA:  D0 06     BNE $D0E2
  $D0DC:  00        BRK
  $D0DD:  3F        .db $3F
  $D0DE:  EF        .db $EF
  $D0DF:  4C B8 D0  JMP $D0B8
  $D0E2:  00        BRK
  $D0E3:  07        .db $07
  $D0E4:  6F        .db $6F
  $D0E5:  43        .db $43
  $D0E6:  00        BRK
  $D0E7:  C2        .db $C2
  $D0E8:  4B        .db $4B
  $D0E9:  20 0A D2  JSR $D20A
  $D0EC:  4C 10 D0  JMP $D010
  $D0EF:  BD E0 70  LDA $70E0,X
  $D0F2:  29 08     AND #$08
  $D0F4:  F0 54     BEQ $D14A
  $D0F6:  A9 00     LDA #$00
  $D0F8:  85 7E     STA $7E
  $D0FA:  A5 3D     LDA $3D
  $D0FC:  85 7D     STA $7D
  $D0FE:  BD 00 70  LDA $7000,X
  $D101:  29 FC     AND #$FC
  $D103:  05 7D     ORA $7D
  $D105:  9D 00 70  STA $7000,X
  $D108:  BD E0 70  LDA $70E0,X
  $D10B:  09 10     ORA #$10
  $D10D:  9D E0 70  STA $70E0,X
  $D110:  8A        TXA
  $D111:  48        PHA
  $D112:  20 3B D5  JSR $D53B
  $D115:  68        PLA
  $D116:  AA        TAX
  $D117:  BD 00 70  LDA $7000,X
  $D11A:  10 0A     BPL $D126
  $D11C:  A5 7E     LDA $7E
  $D11E:  D0 03     BNE $D123
  $D120:  EE 2F 05  INC $052F
  $D123:  4C 80 D0  JMP $D080
  $D126:  E6 7E     INC $7E
  $D128:  A5 7E     LDA $7E
  $D12A:  C9 03     CMP #$03
  $D12C:  B0 94     BCS $D0C2
  $D12E:  C9 01     CMP #$01
  $D130:  F0 07     BEQ $D139
  $D132:  A5 7D     LDA $7D
  $D134:  49 02     EOR #$02
  $D136:  4C FC D0  JMP $D0FC
  $D139:  A5 12     LDA rng_seed_lo
  $D13B:  10 04     BPL $D141
  $D13D:  E6 7D     INC $7D
  $D13F:  E6 7D     INC $7D
  $D141:  C6 7D     DEC $7D
  $D143:  A5 7D     LDA $7D
  $D145:  29 03     AND #$03
  $D147:  4C FC D0  JMP $D0FC
  $D14A:  BD E0 70  LDA $70E0,X
  $D14D:  29 07     AND #$07
  $D14F:  F0 1B     BEQ $D16C
  $D151:  C9 07     CMP #$07
  $D153:  F0 17     BEQ $D16C
  $D155:  0A        ASL A
  $D156:  0A        ASL A
  $D157:  0A        ASL A
  $D158:  0A        ASL A
  $D159:  0A        ASL A
  $D15A:  8D 34 05  STA $0534
  $D15D:  8A        TXA
  $D15E:  0D 34 05  ORA $0534
  $D161:  8D 34 05  STA $0534
  $D164:  A9 01     LDA #$01
  $D166:  8D 27 05  STA $0527
  $D169:  4C 80 D0  JMP $D080
  $D16C:  4C C2 D0  JMP $D0C2

sub_D16F:
  $D16F:  A5 41     LDA $41
  $D171:  2A        ROL A
  $D172:  2A        ROL A
  $D173:  2A        ROL A
  $D174:  29 02     AND #$02
  $D176:  AA        TAX
  $D177:  48        PHA
  $D178:  A5 3D     LDA $3D
  $D17A:  0A        ASL A
  $D17B:  A8        TAY
  $D17C:  B5 42     LDA $42,X
  $D17E:  18        CLC
  $D17F:  79 39 D2  ADC $D239,Y
  $D182:  85 52     STA $52
  $D184:  B5 43     LDA $43,X
  $D186:  18        CLC
  $D187:  79 3A D2  ADC $D23A,Y
  $D18A:  85 53     STA $53
  $D18C:  E0 00     CPX #$00
  $D18E:  D0 24     BNE $D1B4
  $D190:  AD 15 05  LDA $0515
  $D193:  C9 02     CMP #$02
  $D195:  D0 1D     BNE $D1B4
  $D197:  A9 00     LDA #$00
  $D199:  85 57     STA $57
  $D19B:  BE B9 D1  LDX $D1B9,Y
  $D19E:  B5 52     LDA $52,X
  $D1A0:  D9 BA D1  CMP $D1BA,Y
  $D1A3:  D0 0F     BNE $D1B4
  $D1A5:  BE C1 D1  LDX $D1C1,Y
  $D1A8:  86 58     STX $58
  $D1AA:  B9 C2 D1  LDA $D1C2,Y
  $D1AD:  85 57     STA $57
  $D1AF:  18        CLC
  $D1B0:  75 52     ADC $52,X
  $D1B2:  95 52     STA $52,X
  $D1B4:  68        PLA
  $D1B5:  AA        TAX
  $D1B6:  A5 53     LDA $53
  $D1B8:  60        RTS
  $D1B9:  01 FF     ORA ($FF,X)
  $D1BB:  00        BRK
  $D1BC:  00        BRK
  $D1BD:  01 00     ORA ($00,X)
  $D1BF:  00        BRK
  $D1C0:  FF        .db $FF
  $D1C1:  00        BRK
  $D1C2:  08        PHP
  $D1C3:  01 F8     ORA ($F8,X)
  $D1C5:  00        BRK
  $D1C6:  F8        SED
  $D1C7:  01 08     ORA ($08,X)

sub_D1C9:
  $D1C9:  48        PHA
  $D1CA:  AD 42 71  LDA $7142
  $D1CD:  8D 43 71  STA $7143
  $D1D0:  AD 41 71  LDA $7141
  $D1D3:  8D 42 71  STA $7142
  $D1D6:  AD 40 71  LDA $7140
  $D1D9:  8D 41 71  STA $7141
  $D1DC:  68        PLA
  $D1DD:  8D 40 71  STA $7140
  $D1E0:  60        RTS
sub_D1E1:
  $D1E1:  AD BB 07  LDA $07BB
  $D1E4:  10 06     BPL $D1EC
  $D1E6:  20 E2 E3  JSR $E3E2
  $D1E9:  20 74 FF  JSR nmi_rng_update
  $D1EC:  60        RTS
  $D1ED:  20 FD D1  JSR $D1FD

sub_D1F0:
  $D1F0:  20 CC C8  JSR $C8CC
  $D1F3:  A9 00     LDA #$00
  $D1F5:  8D 39 05  STA $0539
  $D1F8:  00        BRK
  $D1F9:  07        .db $07
  $D1FA:  6F        .db $6F
  $D1FB:  FF        .db $FF
  $D1FC:  60        RTS
sub_D1FD:
  $D1FD:  48        PHA
  $D1FE:  00        BRK
  $D1FF:  07        .db $07
  $D200:  6F        .db $6F
  $D201:  43        .db $43
  $D202:  68        PLA
  $D203:  00        BRK
  $D204:  04        .db $04
  $D205:  6F        .db $6F
  $D206:  60        RTS
sub_D207:
  $D207:  20 FD D1  JSR $D1FD

sub_D20A:
  $D20A:  20 18 D2  JSR $D218
  $D20D:  4C F3 D1  JMP $D1F3
  $D210:  A9 3C     LDA #$3C
  $D212:  D0 06     BNE $D21A
  $D214:  A9 78     LDA #$78
  $D216:  D0 02     BNE $D21A

sub_D218:
  $D218:  A9 B4     LDA #$B4
  $D21A:  85 00     STA $00
  $D21C:  20 30 D2  JSR $D230
  $D21F:  F0 05     BEQ $D226
  $D221:  C6 00     DEC $00
  $D223:  D0 F7     BNE $D21C
  $D225:  60        RTS
  $D226:  20 30 D2  JSR $D230
  $D229:  D0 04     BNE $D22F
  $D22B:  C6 00     DEC $00
  $D22D:  D0 F7     BNE $D226
  $D22F:  60        RTS
sub_D230:
  $D230:  20 74 FF  JSR nmi_rng_update
  $D233:  20 EC C8  JSR $C8EC
  $D236:  A5 14     LDA $14
  $D238:  60        RTS
  $D239:  00        BRK
  $D23A:  FF        .db $FF
  $D23B:  01 00     ORA ($00,X)
  $D23D:  00        BRK
  $D23E:  01 FF     ORA ($FF,X)
  $D240:  00        BRK

sub_D241:
  $D241:  AD A5 62  LDA $62A5
  $D244:  30 03     BMI $D249
  $D246:  4C EC C8  JMP $C8EC
  $D249:  A9 00     LDA #$00
  $D24B:  85 14     STA $14
  $D24D:  8D 29 05  STA $0529
  $D250:  60        RTS
sub_D251:
  $D251:  AD 07 05  LDA current_bank
  $D254:  85 04     STA $04
  $D256:  A9 0B     LDA #$0B
  $D258:  20 91 FF  JSR bank_switch
  $D25B:  20 66 D2  JSR $D266
  $D25E:  48        PHA
  $D25F:  A5 04     LDA $04
  $D261:  20 91 FF  JSR bank_switch
  $D264:  68        PLA
  $D265:  60        RTS
sub_D266:
  $D266:  86 00     STX $00
  $D268:  84 01     STY $01
  $D26A:  20 B7 D2  JSR $D2B7
  $D26D:  20 E9 D2  JSR $D2E9
  $D270:  20 33 D3  JSR $D333
  $D273:  20 23 D5  JSR $D523
  $D276:  60        RTS
  $D277:  AD 07 05  LDA current_bank
  $D27A:  85 04     STA $04
  $D27C:  A9 0B     LDA #$0B
  $D27E:  20 91 FF  JSR bank_switch
  $D281:  20 8C D2  JSR $D28C
  $D284:  48        PHA
  $D285:  A5 04     LDA $04
  $D287:  20 91 FF  JSR bank_switch
  $D28A:  68        PLA
  $D28B:  60        RTS
sub_D28C:
  $D28C:  86 00     STX $00
  $D28E:  84 01     STY $01
  $D290:  20 B7 D2  JSR $D2B7
  $D293:  20 E9 D2  JSR $D2E9
  $D296:  20 33 D3  JSR $D333
  $D299:  20 23 D5  JSR $D523
  $D29C:  48        PHA
  $D29D:  E6 00     INC $00
  $D29F:  A5 02     LDA $02
  $D2A1:  20 5F D3  JSR $D35F
  $D2A4:  20 23 D5  JSR $D523
  $D2A7:  48        PHA
  $D2A8:  E6 00     INC $00
  $D2AA:  A5 02     LDA $02
  $D2AC:  20 5F D3  JSR $D35F
  $D2AF:  20 23 D5  JSR $D523
  $D2B2:  A8        TAY
  $D2B3:  68        PLA
  $D2B4:  AA        TAX
  $D2B5:  68        PLA
  $D2B6:  60        RTS
sub_D2B7:
  $D2B7:  8A        TXA
  $D2B8:  48        PHA
  $D2B9:  38        SEC
  $D2BA:  E9 03     SBC #$03
  $D2BC:  85 49     STA $49
  $D2BE:  98        TYA
  $D2BF:  48        PHA
  $D2C0:  38        SEC
  $D2C1:  E9 03     SBC #$03
  $D2C3:  85 4A     STA $4A
  $D2C5:  A6 65     LDX $65
  $D2C7:  A5 49     LDA $49
  $D2C9:  DD E3 D2  CMP $D2E3,X
  $D2CC:  B0 07     BCS $D2D5
  $D2CE:  A5 4A     LDA $4A
  $D2D0:  DD E6 D2  CMP $D2E6,X
  $D2D3:  90 09     BCC $D2DE
  $D2D5:  68        PLA
  $D2D6:  68        PLA
  $D2D7:  68        PLA
  $D2D8:  68        PLA
  $D2D9:  A9 00     LDA #$00
  $D2DB:  AA        TAX
  $D2DC:  A8        TAY
  $D2DD:  60        RTS
  $D2DE:  68        PLA
  $D2DF:  A8        TAY
  $D2E0:  68        PLA
  $D2E1:  AA        TAX
  $D2E2:  60        RTS
  $D2E3:  FA        .db $FA
  $D2E4:  3D 2A FA  AND $FA2A,X
  $D2E7:  3D 36 A4  AND $A436,X
  $D2EA:  01 A9     ORA ($A9,X)
  $D2EC:  00        BRK
  $D2ED:  85 02     STA $02
  $D2EF:  A5 65     LDA $65
  $D2F1:  0A        ASL A
  $D2F2:  AA        TAX
  $D2F3:  BD 00 80  LDA $8000,X
  $D2F6:  85 49     STA $49
  $D2F8:  BD 01 80  LDA $8001,X
  $D2FB:  85 4A     STA $4A
  $D2FD:  A6 00     LDX $00
  $D2FF:  98        TYA
  $D300:  0A        ASL A
  $D301:  26 02     ROL $02
  $D303:  0A        ASL A
  $D304:  26 02     ROL $02
  $D306:  18        CLC
  $D307:  65 49     ADC $49
  $D309:  85 49     STA $49
  $D30B:  A5 02     LDA $02
  $D30D:  65 4A     ADC $4A
  $D30F:  85 4A     STA $4A
  $D311:  A9 00     LDA #$00
  $D313:  A0 02     LDY #$02
  $D315:  E0 40     CPX #$40
  $D317:  90 09     BCC $D322
  $D319:  B1 49     LDA ($49),Y
  $D31B:  E0 C0     CPX #$C0
  $D31D:  90 03     BCC $D322
  $D31F:  C8        INY
  $D320:  B1 49     LDA ($49),Y
  $D322:  48        PHA
  $D323:  A0 00     LDY #$00
  $D325:  B1 49     LDA ($49),Y
  $D327:  48        PHA
  $D328:  C8        INY
  $D329:  B1 49     LDA ($49),Y
  $D32B:  85 4A     STA $4A
  $D32D:  68        PLA
  $D32E:  85 49     STA $49
  $D330:  68        PLA
  $D331:  A8        TAY
  $D332:  60        RTS
sub_D333:
  $D333:  A9 00     LDA #$00
  $D335:  24 00     BIT $00
  $D337:  70 4D     BVS $D386
  $D339:  10 02     BPL $D33D
  $D33B:  A9 80     LDA #$80
  $D33D:  85 02     STA $02
  $D33F:  C6 02     DEC $02
  $D341:  88        DEY
  $D342:  C8        INY
  $D343:  B1 49     LDA ($49),Y
  $D345:  85 03     STA $03
  $D347:  29 E0     AND #$E0
  $D349:  C9 E0     CMP #$E0
  $D34B:  D0 0B     BNE $D358
  $D34D:  A5 03     LDA $03
  $D34F:  29 1F     AND #$1F
  $D351:  C9 08     CMP #$08
  $D353:  90 18     BCC $D36D
  $D355:  4C 79 D3  JMP $D379
  $D358:  A5 03     LDA $03
  $D35A:  29 1F     AND #$1F
  $D35C:  38        SEC
  $D35D:  65 02     ADC $02

sub_D35F:
  $D35F:  85 02     STA $02
  $D361:  C5 00     CMP $00
  $D363:  90 DD     BCC $D342
  $D365:  A5 03     LDA $03
  $D367:  4A        LSR A
  $D368:  4A        LSR A
  $D369:  4A        LSR A
  $D36A:  4A        LSR A
  $D36B:  4A        LSR A
  $D36C:  60        RTS
  $D36D:  38        SEC
  $D36E:  65 02     ADC $02
  $D370:  85 02     STA $02
  $D372:  C5 00     CMP $00
  $D374:  90 CC     BCC $D342
  $D376:  A9 07     LDA #$07
  $D378:  60        RTS
  $D379:  E6 02     INC $02
  $D37B:  A5 02     LDA $02
  $D37D:  C5 00     CMP $00
  $D37F:  90 C1     BCC $D342
  $D381:  A5 03     LDA $03
  $D383:  29 1F     AND #$1F
  $D385:  60        RTS
  $D386:  20 8B D3  JSR $D38B
  $D389:  88        DEY
  $D38A:  60        RTS
sub_D38B:
  $D38B:  30 02     BMI $D38F
  $D38D:  A9 80     LDA #$80
  $D38F:  85 02     STA $02
  $D391:  C6 02     DEC $02
  $D393:  88        DEY
  $D394:  B1 49     LDA ($49),Y
  $D396:  85 03     STA $03
  $D398:  29 E0     AND #$E0
  $D39A:  C9 E0     CMP #$E0
  $D39C:  D0 0B     BNE $D3A9
  $D39E:  A5 03     LDA $03
  $D3A0:  29 1F     AND #$1F
  $D3A2:  C9 08     CMP #$08
  $D3A4:  90 21     BCC $D3C7
  $D3A6:  4C D9 D3  JMP $D3D9
  $D3A9:  A5 03     LDA $03
  $D3AB:  AA        TAX
  $D3AC:  29 1F     AND #$1F
  $D3AE:  18        CLC
  $D3AF:  69 01     ADC #$01
  $D3B1:  85 03     STA $03
  $D3B3:  A5 02     LDA $02
  $D3B5:  38        SEC
  $D3B6:  E5 03     SBC $03
  $D3B8:  85 02     STA $02
  $D3BA:  C5 00     CMP $00
  $D3BC:  B0 D5     BCS $D393
  $D3BE:  8A        TXA
  $D3BF:  85 03     STA $03
  $D3C1:  4A        LSR A
  $D3C2:  4A        LSR A
  $D3C3:  4A        LSR A
  $D3C4:  4A        LSR A
  $D3C5:  4A        LSR A
  $D3C6:  60        RTS
  $D3C7:  69 01     ADC #$01
  $D3C9:  85 03     STA $03
  $D3CB:  A5 02     LDA $02
  $D3CD:  38        SEC
  $D3CE:  E5 03     SBC $03
  $D3D0:  85 02     STA $02
  $D3D2:  C5 00     CMP $00
  $D3D4:  B0 BD     BCS $D393
  $D3D6:  A9 07     LDA #$07
  $D3D8:  60        RTS
  $D3D9:  C6 02     DEC $02
  $D3DB:  A5 02     LDA $02
  $D3DD:  C5 00     CMP $00
  $D3DF:  B0 B2     BCS $D393
  $D3E1:  A5 03     LDA $03
  $D3E3:  29 1F     AND #$1F
  $D3E5:  60        RTS
sub_D3E6:
  $D3E6:  E4 3F     CPX $3F
  $D3E8:  B0 26     BCS $D410
  $D3EA:  C4 40     CPY $40
  $D3EC:  B0 22     BCS $D410
  $D3EE:  8A        TXA
  $D3EF:  48        PHA
  $D3F0:  A5 3F     LDA $3F
  $D3F2:  85 00     STA $00
  $D3F4:  A9 00     LDA #$00
  $D3F6:  85 01     STA $01
  $D3F8:  98        TYA
  $D3F9:  A2 00     LDX #$00
  $D3FB:  20 27 C8  JSR $C827
  $D3FE:  68        PLA
  $D3FF:  A0 00     LDY #$00
  $D401:  20 1D C8  JSR $C81D
  $D404:  A0 78     LDY #$78
  $D406:  A9 00     LDA #$00
  $D408:  20 1D C8  JSR $C81D
  $D40B:  A0 00     LDY #$00
  $D40D:  B1 00     LDA ($00),Y
  $D40F:  60        RTS
  $D410:  A9 FF     LDA #$FF
  $D412:  85 00     STA $00
  $D414:  85 01     STA $01
  $D416:  20 59 D4  JSR $D459
  $D419:  60        RTS
  $D41A:  E4 3F     CPX $3F
  $D41C:  B0 F2     BCS $D410
  $D41E:  C4 40     CPY $40
  $D420:  B0 EE     BCS $D410
  $D422:  A0 00     LDY #$00
  $D424:  B1 00     LDA ($00),Y
  $D426:  48        PHA
  $D427:  A5 00     LDA $00
  $D429:  25 01     AND $01
  $D42B:  C9 FF     CMP #$FF
  $D42D:  F0 06     BEQ $D435
  $D42F:  E6 00     INC $00
  $D431:  D0 02     BNE $D435
  $D433:  E6 01     INC $01
  $D435:  68        PLA
  $D436:  60        RTS
  $D437:  E4 3F     CPX $3F
  $D439:  B0 D5     BCS $D410
  $D43B:  C4 40     CPY $40
  $D43D:  B0 D1     BCS $D410
  $D43F:  A0 00     LDY #$00
  $D441:  B1 00     LDA ($00),Y
  $D443:  48        PHA
  $D444:  A5 00     LDA $00
  $D446:  25 01     AND $01
  $D448:  C9 FF     CMP #$FF
  $D44A:  F0 0B     BEQ $D457
  $D44C:  A5 00     LDA $00
  $D44E:  18        CLC
  $D44F:  65 3F     ADC $3F
  $D451:  85 00     STA $00
  $D453:  90 02     BCC $D457
  $D455:  E6 01     INC $01
  $D457:  68        PLA
  $D458:  60        RTS
sub_D459:
  $D459:  2C 50 05  BIT $0550
  $D45C:  10 14     BPL $D472
  $D45E:  8A        TXA
  $D45F:  29 07     AND #$07
  $D461:  AA        TAX
  $D462:  98        TYA
  $D463:  29 07     AND #$07
  $D465:  A8        TAY
  $D466:  BD 76 D4  LDA $D476,X
  $D469:  39 7E D4  AND $D47E,Y
  $D46C:  D0 04     BNE $D472
  $D46E:  AD 8C 05  LDA $058C
  $D471:  60        RTS
  $D472:  AD 20 05  LDA $0520
  $D475:  60        RTS
  $D476:  01 02     ORA ($02,X)
  $D478:  04        .db $04
  $D479:  08        PHP
  $D47A:  10 20     BPL $D49C
  $D47C:  40        RTI
  $D47D:  80        .db $80
  $D47E:  44        .db $44
  $D47F:  EE EE 44  INC $44EE
  $D482:  11 BB     ORA ($BB),Y
  $D484:  BB        .db $BB
  $D485:  11 C9     ORA ($C9),Y
  $D487:  00        BRK
  $D488:  D0 06     BNE $D490
  $D48A:  20 B5 D4  JSR $D4B5
  $D48D:  4C AA D4  JMP $D4AA
  $D490:  C9 01     CMP #$01
  $D492:  D0 16     BNE $D4AA
  $D494:  A6 65     LDX $65
  $D496:  E0 03     CPX #$03
  $D498:  D0 10     BNE $D4AA
  $D49A:  20 91 C8  JSR rng_main
  $D49D:  C9 FA     CMP #$FA
  $D49F:  A9 18     LDA #$18
  $D4A1:  90 07     BCC $D4AA
  $D4A3:  A9 19     LDA #$19
  $D4A5:  4C AA D4  JMP $D4AA
  $D4A8:  A9 00     LDA #$00
  $D4AA:  AA        TAX
  $D4AB:  BD C0 76  LDA $76C0,X
  $D4AE:  48        PHA
  $D4AF:  8A        TXA
  $D4B0:  0A        ASL A
  $D4B1:  0A        ASL A
  $D4B2:  AA        TAX
  $D4B3:  68        PLA
  $D4B4:  60        RTS
sub_D4B5:
  $D4B5:  85 59     STA $59
  $D4B7:  C6 53     DEC $53
  $D4B9:  20 D9 D4  JSR $D4D9
  $D4BC:  E6 53     INC $53
  $D4BE:  E6 54     INC $54
  $D4C0:  20 D9 D4  JSR $D4D9
  $D4C3:  C6 54     DEC $54
  $D4C5:  E6 53     INC $53
  $D4C7:  20 D9 D4  JSR $D4D9
  $D4CA:  C6 53     DEC $53
  $D4CC:  C6 54     DEC $54
  $D4CE:  20 D9 D4  JSR $D4D9
  $D4D1:  E6 54     INC $54
  $D4D3:  A5 59     LDA $59
  $D4D5:  18        CLC
  $D4D6:  69 20     ADC #$20
  $D4D8:  60        RTS
sub_D4D9:
  $D4D9:  A6 53     LDX $53
  $D4DB:  A4 54     LDY $54
  $D4DD:  20 51 D2  JSR $D251
  $D4E0:  C9 00     CMP #$00
  $D4E2:  F0 0C     BEQ $D4F0
  $D4E4:  C9 16     CMP #$16
  $D4E6:  F0 08     BEQ $D4F0
  $D4E8:  C9 0A     CMP #$0A
  $D4EA:  F0 04     BEQ $D4F0
  $D4EC:  38        SEC
  $D4ED:  26 59     ROL $59
  $D4EF:  60        RTS
  $D4F0:  06 59     ASL $59
  $D4F2:  60        RTS
  $D4F3:  48        PHA
  $D4F4:  29 E0     AND #$E0
  $D4F6:  C5 46     CMP $46
  $D4F8:  F0 1B     BEQ $D515
  $D4FA:  AD BA 07  LDA $07BA
  $D4FD:  C9 04     CMP #$04
  $D4FF:  D0 09     BNE $D50A
  $D501:  68        PLA
  $D502:  48        PHA
  $D503:  29 1F     AND #$1F
  $D505:  CD 20 05  CMP $0520
  $D508:  F0 0B     BEQ $D515
  $D50A:  68        PLA
  $D50B:  A9 20     LDA #$20
  $D50D:  A6 46     LDX $46
  $D50F:  F0 07     BEQ $D518
  $D511:  A9 21     LDA #$21
  $D513:  D0 03     BNE $D518
  $D515:  68        PLA
  $D516:  29 1F     AND #$1F
  $D518:  AA        TAX
  $D519:  BD C0 76  LDA $76C0,X
  $D51C:  48        PHA
  $D51D:  8A        TXA
  $D51E:  0A        ASL A
  $D51F:  0A        ASL A
  $D520:  AA        TAX
  $D521:  68        PLA
  $D522:  60        RTS
sub_D523:
  $D523:  48        PHA
  $D524:  A5 00     LDA $00
  $D526:  C9 C2     CMP #$C2
  $D528:  D0 0F     BNE $D539
  $D52A:  A5 01     LDA $01
  $D52C:  C9 2E     CMP #$2E
  $D52E:  D0 09     BNE $D539
  $D530:  AD A1 62  LDA $62A1
  $D533:  10 04     BPL $D539
  $D535:  68        PLA
  $D536:  A9 02     LDA #$02
  $D538:  60        RTS
  $D539:  68        PLA
  $D53A:  60        RTS
sub_D53B:
  $D53B:  A9 FF     LDA #$FF
  $D53D:  85 56     STA $56
  $D53F:  4C 46 D5  JMP $D546

map_handler:
  $D542:  A9 00     LDA #$00
  $D544:  85 56     STA $56
  $D546:  AD 07 05  LDA current_bank
  $D549:  85 58     STA $58
  $D54B:  A9 06     LDA #$06
  $D54D:  85 51     STA $51
  $D54F:  AD 60 6F  LDA $6F60
  $D552:  38        SEC
  $D553:  E9 08     SBC #$08
  $D555:  85 7C     STA $7C
  $D557:  AD 80 6F  LDA $6F80
  $D55A:  38        SEC
  $D55B:  E9 07     SBC #$07
  $D55D:  85 7B     STA $7B
  $D55F:  A5 3C     LDA $3C
  $D561:  29 0F     AND #$0F
  $D563:  D0 23     BNE $D588
  $D565:  A5 41     LDA $41
  $D567:  30 03     BMI $D56C
  $D569:  4C 13 C0  JMP $C013
  $D56C:  A5 67     LDA $67
  $D56E:  20 91 FF  JSR bank_switch
  $D571:  20 7F D5  JSR $D57F
  $D574:  AD 24 70  LDA $7024
  $D577:  2D 25 70  AND $7025
  $D57A:  30 30     BMI $D5AC
  $D57C:  4C 13 C0  JMP $C013

sub_D57F:
  $D57F:  20 07 D6  JSR $D607
  $D582:  20 EE D5  JSR $D5EE
  $D585:  4C 7F D5  JMP $D57F
  $D588:  48        PHA
  $D589:  20 C0 D5  JSR $D5C0
  $D58C:  68        PLA
  $D58D:  29 07     AND #$07
  $D58F:  D0 1B     BNE $D5AC
  $D591:  A5 41     LDA $41
  $D593:  10 03     BPL $D598
  $D595:  20 AD D5  JSR $D5AD
  $D598:  A2 00     LDX #$00
  $D59A:  20 9D D5  JSR $D59D

sub_D59D:
  $D59D:  BD 2A 05  LDA $052A,X
  $D5A0:  29 40     AND #$40
  $D5A2:  F0 07     BEQ $D5AB
  $D5A4:  0A        ASL A
  $D5A5:  1D 04 70  ORA $7004,X
  $D5A8:  9D 04 70  STA $7004,X
  $D5AB:  E8        INX
  $D5AC:  60        RTS
sub_D5AD:
  $D5AD:  A5 67     LDA $67
  $D5AF:  20 91 FF  JSR bank_switch
  $D5B2:  20 FE D5  JSR $D5FE
  $D5B5:  20 EE D5  JSR $D5EE
  $D5B8:  4C B2 D5  JMP $D5B2
  $D5BB:  A5 58     LDA $58
  $D5BD:  4C 91 FF  JMP bank_switch

sub_D5C0:
  $D5C0:  A6 51     LDX $51
  $D5C2:  BD 20 70  LDA $7020,X
  $D5C5:  C9 FF     CMP #$FF
  $D5C7:  F0 1C     BEQ $D5E5
  $D5C9:  BD 60 71  LDA $7160,X
  $D5CC:  F0 0F     BEQ $D5DD
  $D5CE:  30 0A     BMI $D5DA
  $D5D0:  A9 09     LDA #$09
  $D5D2:  85 57     STA $57
  $D5D4:  20 EA D5  JSR $D5EA
  $D5D7:  4C DD D5  JMP $D5DD
  $D5DA:  20 CB D9  JSR $D9CB
  $D5DD:  E6 51     INC $51
  $D5DF:  A5 51     LDA $51
  $D5E1:  C9 1E     CMP #$1E
  $D5E3:  90 DB     BCC $D5C0
  $D5E5:  A9 06     LDA #$06
  $D5E7:  85 51     STA $51
  $D5E9:  60        RTS
sub_D5EA:
  $D5EA:  20 4B D9  JSR $D94B
  $D5ED:  60        RTS
sub_D5EE:
  $D5EE:  E6 51     INC $51
  $D5F0:  A5 51     LDA $51
  $D5F2:  C9 1E     CMP #$1E
  $D5F4:  90 07     BCC $D5FD
  $D5F6:  A5 58     LDA $58
  $D5F8:  20 91 FF  JSR bank_switch
  $D5FB:  68        PLA
  $D5FC:  68        PLA
  $D5FD:  60        RTS
sub_D5FE:
  $D5FE:  A6 51     LDX $51
  $D600:  BD E0 70  LDA $70E0,X
  $D603:  29 40     AND #$40
  $D605:  F0 F6     BEQ $D5FD

sub_D607:
  $D607:  A6 51     LDX $51
  $D609:  BD 20 70  LDA $7020,X
  $D60C:  C9 FF     CMP #$FF
  $D60E:  F0 E6     BEQ $D5F6
  $D610:  20 3B D6  JSR $D63B
  $D613:  90 06     BCC $D61B
  $D615:  20 21 D6  JSR $D621
  $D618:  20 91 D8  JSR $D891
  $D61B:  20 84 D6  JSR $D684
  $D61E:  4C 6E D7  JMP $D76E

sub_D621:
  $D621:  BD 60 6F  LDA $6F60,X
  $D624:  85 52     STA $52
  $D626:  BD 80 6F  LDA $6F80,X
  $D629:  85 53     STA $53
  $D62B:  20 F4 D6  JSR $D6F4
  $D62E:  B0 0A     BCS $D63A
  $D630:  A6 51     LDX $51
  $D632:  BD 20 70  LDA $7020,X
  $D635:  29 EF     AND #$EF
  $D637:  9D 20 70  STA $7020,X
  $D63A:  60        RTS
sub_D63B:
  $D63B:  A5 56     LDA $56
  $D63D:  F0 07     BEQ $D646
  $D63F:  BD E0 70  LDA $70E0,X
  $D642:  29 10     AND #$10
  $D644:  D0 2D     BNE $D673
  $D646:  BD 00 70  LDA $7000,X
  $D649:  30 B0     BMI $D5FB
  $D64B:  BD 40 70  LDA $7040,X
  $D64E:  F0 AB     BEQ $D5FB
  $D650:  DE 40 70  DEC $7040,X
  $D653:  BD 40 70  LDA $7040,X
  $D656:  29 0F     AND #$0F
  $D658:  D0 A1     BNE $D5FB
  $D65A:  BD 40 70  LDA $7040,X
  $D65D:  4A        LSR A
  $D65E:  4A        LSR A
  $D65F:  4A        LSR A
  $D660:  4A        LSR A
  $D661:  1D 40 70  ORA $7040,X
  $D664:  9D 40 70  STA $7040,X
  $D667:  BD 60 6F  LDA $6F60,X
  $D66A:  3D 80 6F  AND $6F80,X
  $D66D:  C9 80     CMP #$80
  $D66F:  F0 8A     BEQ $D5FB
  $D671:  38        SEC
  $D672:  60        RTS
  $D673:  BD E0 70  LDA $70E0,X
  $D676:  29 10     AND #$10
  $D678:  F0 81     BEQ $D5FB
  $D67A:  BD E0 70  LDA $70E0,X
  $D67D:  29 EF     AND #$EF
  $D67F:  9D E0 70  STA $70E0,X
  $D682:  18        CLC
  $D683:  60        RTS
sub_D684:
  $D684:  08        PHP
  $D685:  20 52 D7  JSR $D752
  $D688:  28        PLP
  $D689:  90 05     BCC $D690
  $D68B:  AD 30 05  LDA $0530
  $D68E:  30 05     BMI $D695
  $D690:  20 22 D7  JSR $D722
  $D693:  B0 43     BCS $D6D8
  $D695:  A6 52     LDX $52
  $D697:  A4 53     LDY $53
  $D699:  20 E6 D3  JSR $D3E6
  $D69C:  85 55     STA $55
  $D69E:  29 E0     AND #$E0
  $D6A0:  85 54     STA $54
  $D6A2:  20 B6 D6  JSR $D6B6
  $D6A5:  20 DB D6  JSR $D6DB
  $D6A8:  20 E8 D6  JSR $D6E8
  $D6AB:  20 F4 D6  JSR $D6F4
  $D6AE:  A6 51     LDX $51
  $D6B0:  A5 55     LDA $55
  $D6B2:  9D 40 71  STA $7140,X
  $D6B5:  60        RTS
sub_D6B6:
  $D6B6:  A5 55     LDA $55
  $D6B8:  29 1F     AND #$1F
  $D6BA:  AA        TAX
  $D6BB:  BC 40 6F  LDY $6F40,X
  $D6BE:  A6 51     LDX $51
  $D6C0:  BD E0 70  LDA $70E0,X
  $D6C3:  29 07     AND #$07
  $D6C5:  F0 05     BEQ $D6CC
  $D6C7:  C0 83     CPY #$83
  $D6C9:  D0 0B     BNE $D6D6
  $D6CB:  60        RTS
  $D6CC:  98        TYA
  $D6CD:  30 07     BMI $D6D6
  $D6CF:  29 7F     AND #$7F
  $D6D1:  C9 05     CMP #$05
  $D6D3:  F0 01     BEQ $D6D6
  $D6D5:  60        RTS
  $D6D6:  68        PLA
  $D6D7:  68        PLA
  $D6D8:  68        PLA
  $D6D9:  68        PLA
  $D6DA:  60        RTS
sub_D6DB:
  $D6DB:  A5 52     LDA $52
  $D6DD:  C5 3F     CMP $3F
  $D6DF:  B0 F5     BCS $D6D6
  $D6E1:  A5 53     LDA $53
  $D6E3:  C5 40     CMP $40
  $D6E5:  B0 EF     BCS $D6D6
  $D6E7:  60        RTS
sub_D6E8:
  $D6E8:  A6 51     LDX $51
  $D6EA:  BD 40 71  LDA $7140,X
  $D6ED:  29 E0     AND #$E0
  $D6EF:  C5 54     CMP $54
  $D6F1:  D0 E3     BNE $D6D6
  $D6F3:  60        RTS
sub_D6F4:
  $D6F4:  AD 39 05  LDA $0539
  $D6F7:  10 27     BPL $D720
  $D6F9:  A5 52     LDA $52
  $D6FB:  38        SEC
  $D6FC:  E5 7C     SBC $7C
  $D6FE:  85 5F     STA $5F
  $D700:  C9 10     CMP #$10
  $D702:  B0 1C     BCS $D720
  $D704:  A5 53     LDA $53
  $D706:  38        SEC
  $D707:  E5 7B     SBC $7B
  $D709:  85 60     STA $60
  $D70B:  C9 0F     CMP #$0F
  $D70D:  B0 11     BCS $D720
  $D70F:  00        BRK
  $D710:  0B        .db $0B
  $D711:  6F        .db $6F
  $D712:  90 0C     BCC $D720
  $D714:  A6 51     LDX $51
  $D716:  BD 20 70  LDA $7020,X
  $D719:  09 10     ORA #$10
  $D71B:  9D 20 70  STA $7020,X
  $D71E:  38        SEC
  $D71F:  60        RTS
  $D720:  18        CLC
  $D721:  60        RTS
sub_D722:
  $D722:  A2 00     LDX #$00

sub_D724:
  $D724:  BD 60 6F  LDA $6F60,X
  $D727:  C5 52     CMP $52
  $D729:  D0 07     BNE $D732
  $D72B:  BD 80 6F  LDA $6F80,X
  $D72E:  C5 53     CMP $53
  $D730:  F0 11     BEQ $D743
  $D732:  E8        INX
  $D733:  E0 1E     CPX #$1E
  $D735:  B0 0A     BCS $D741
  $D737:  BD 60 6F  LDA $6F60,X
  $D73A:  3D 80 6F  AND $6F80,X
  $D73D:  C9 FF     CMP #$FF
  $D73F:  D0 E3     BNE $D724
  $D741:  18        CLC
  $D742:  60        RTS
  $D743:  E4 51     CPX $51
  $D745:  F0 EB     BEQ $D732
  $D747:  E0 06     CPX #$06
  $D749:  B0 06     BCS $D751
  $D74B:  BD 20 70  LDA $7020,X
  $D74E:  30 E2     BMI $D732
  $D750:  38        SEC
  $D751:  60        RTS
sub_D752:
  $D752:  A6 51     LDX $51
  $D754:  BD 00 70  LDA $7000,X
  $D757:  29 03     AND #$03
  $D759:  0A        ASL A
  $D75A:  A8        TAY
  $D75B:  B9 39 D2  LDA $D239,Y
  $D75E:  18        CLC
  $D75F:  7D 60 6F  ADC $6F60,X
  $D762:  85 52     STA $52
  $D764:  B9 3A D2  LDA $D23A,Y
  $D767:  18        CLC
  $D768:  7D 80 6F  ADC $6F80,X
  $D76B:  85 53     STA $53
  $D76D:  60        RTS
  $D76E:  A6 51     LDX $51
  $D770:  BD 00 70  LDA $7000,X
  $D773:  09 80     ORA #$80
  $D775:  9D 00 70  STA $7000,X
  $D778:  29 01     AND #$01
  $D77A:  F0 18     BEQ $D794
  $D77C:  A0 10     LDY #$10
  $D77E:  BD 00 70  LDA $7000,X
  $D781:  29 03     AND #$03
  $D783:  C9 01     CMP #$01
  $D785:  F0 02     BEQ $D789
  $D787:  A0 F0     LDY #$F0
  $D789:  98        TYA
  $D78A:  18        CLC
  $D78B:  7D E0 71  ADC $71E0,X
  $D78E:  9D E0 71  STA $71E0,X
  $D791:  4C B7 D7  JMP $D7B7
  $D794:  A0 01     LDY #$01
  $D796:  BD 00 70  LDA $7000,X
  $D799:  29 03     AND #$03
  $D79B:  C9 02     CMP #$02
  $D79D:  F0 02     BEQ $D7A1
  $D79F:  A0 FF     LDY #$FF
  $D7A1:  84 54     STY $54
  $D7A3:  BD E0 71  LDA $71E0,X
  $D7A6:  18        CLC
  $D7A7:  65 54     ADC $54
  $D7A9:  29 0F     AND #$0F
  $D7AB:  85 54     STA $54
  $D7AD:  BD E0 71  LDA $71E0,X
  $D7B0:  29 F0     AND #$F0
  $D7B2:  05 54     ORA $54
  $D7B4:  9D E0 71  STA $71E0,X
  $D7B7:  A5 52     LDA $52
  $D7B9:  9D 60 6F  STA $6F60,X
  $D7BC:  A5 53     LDA $53
  $D7BE:  9D 80 6F  STA $6F80,X
  $D7C1:  BD 20 70  LDA $7020,X
  $D7C4:  29 10     AND #$10
  $D7C6:  F0 0A     BEQ $D7D2
  $D7C8:  A5 52     LDA $52
  $D7CA:  9D A0 6F  STA $6FA0,X
  $D7CD:  A5 53     LDA $53
  $D7CF:  9D C0 6F  STA $6FC0,X
  $D7D2:  4C FC D7  JMP $D7FC

sub_D7D5:
  $D7D5:  A5 3C     LDA $3C
  $D7D7:  29 0F     AND #$0F
  $D7D9:  38        SEC
  $D7DA:  E9 01     SBC #$01
  $D7DC:  C9 06     CMP #$06
  $D7DE:  B0 7C     BCS $D85C
  $D7E0:  AA        TAX
  $D7E1:  20 F1 D7  JSR $D7F1
  $D7E4:  20 F1 D7  JSR $D7F1
  $D7E7:  20 F1 D7  JSR $D7F1
  $D7EA:  20 F1 D7  JSR $D7F1
  $D7ED:  20 F1 D7  JSR $D7F1
  $D7F0:  60        RTS
sub_D7F1:
  $D7F1:  BD 20 70  LDA $7020,X
  $D7F4:  C9 FF     CMP #$FF
  $D7F6:  F0 69     BEQ $D861
  $D7F8:  E0 1E     CPX #$1E
  $D7FA:  B0 65     BCS $D861

sub_D7FC:
  $D7FC:  8A        TXA
  $D7FD:  48        PHA
  $D7FE:  BD E0 70  LDA $70E0,X
  $D801:  10 54     BPL $D857
  $D803:  68        PLA
  $D804:  8A        TXA
  $D805:  48        PHA
  $D806:  BD 00 70  LDA $7000,X
  $D809:  48        PHA
  $D80A:  29 3C     AND #$3C
  $D80C:  D0 04     BNE $D812
  $D80E:  E0 00     CPX #$00
  $D810:  D0 4B     BNE $D85D
  $D812:  20 8C C7  JSR $C78C
  $D815:  BD E0 6F  LDA $6FE0,X
  $D818:  29 0F     AND #$0F
  $D81A:  20 64 D8  JSR $D864
  $D81D:  A2 59     LDX #$59
  $D81F:  68        PLA
  $D820:  29 03     AND #$03
  $D822:  20 76 D8  JSR $D876
  $D825:  A6 16     LDX rng_temp
  $D827:  A5 59     LDA $59
  $D829:  9D 01 02  STA $0201,X
  $D82C:  A5 5A     LDA $5A
  $D82E:  09 00     ORA #$00
  $D830:  9D 02 02  STA $0202,X
  $D833:  A5 5B     LDA $5B
  $D835:  9D 05 02  STA $0205,X
  $D838:  A5 5C     LDA $5C
  $D83A:  09 00     ORA #$00
  $D83C:  9D 06 02  STA $0206,X
  $D83F:  A5 5D     LDA $5D
  $D841:  9D 09 02  STA $0209,X
  $D844:  A5 5E     LDA $5E
  $D846:  09 00     ORA #$00
  $D848:  9D 0A 02  STA $020A,X
  $D84B:  A5 5F     LDA $5F
  $D84D:  9D 0D 02  STA $020D,X
  $D850:  A5 60     LDA $60
  $D852:  09 00     ORA #$00
  $D854:  9D 0E 02  STA $020E,X
  $D857:  68        PLA
  $D858:  18        CLC
  $D859:  69 06     ADC #$06
  $D85B:  AA        TAX
  $D85C:  60        RTS
  $D85D:  68        PLA
  $D85E:  4C 57 D8  JMP $D857
  $D861:  68        PLA
  $D862:  68        PLA
  $D863:  60        RTS
sub_D864:
  $D864:  48        PHA
  $D865:  A9 00     LDA #$00
  $D867:  85 4F     STA $4F
  $D869:  68        PLA
  $D86A:  4A        LSR A
  $D86B:  66 4F     ROR $4F
  $D86D:  4A        LSR A
  $D86E:  66 4F     ROR $4F
  $D870:  18        CLC
  $D871:  69 72     ADC #$72
  $D873:  85 50     STA $50
  $D875:  60        RTS
sub_D876:
  $D876:  29 03     AND #$03
  $D878:  0A        ASL A
  $D879:  0A        ASL A
  $D87A:  0A        ASL A
  $D87B:  0A        ASL A
  $D87C:  AC 26 05  LDY $0526
  $D87F:  10 03     BPL $D884
  $D881:  18        CLC
  $D882:  69 08     ADC #$08
  $D884:  A8        TAY
  $D885:  B1 4F     LDA ($4F),Y
  $D887:  95 00     STA $00,X
  $D889:  E8        INX
  $D88A:  C8        INY
  $D88B:  98        TYA
  $D88C:  29 07     AND #$07
  $D88E:  D0 F5     BNE $D885
  $D890:  60        RTS
sub_D891:
  $D891:  A6 51     LDX $51
  $D893:  BD 80 70  LDA $7080,X
  $D896:  85 4D     STA $4D
  $D898:  BD 60 70  LDA $7060,X
  $D89B:  85 4E     STA $4E
  $D89D:  A0 00     LDY #$00
  $D89F:  B1 4D     LDA ($4D),Y
  $D8A1:  85 57     STA $57
  $D8A3:  30 15     BMI $D8BA
  $D8A5:  C9 31     CMP #$31
  $D8A7:  90 02     BCC $D8AB
  $D8A9:  A9 00     LDA #$00
  $D8AB:  0A        ASL A
  $D8AC:  A8        TAY
  $D8AD:  B9 02 DF  LDA $DF02,Y
  $D8B0:  85 52     STA $52
  $D8B2:  B9 03 DF  LDA $DF03,Y
  $D8B5:  85 53     STA $53
  $D8B7:  6C 52 00  JMP ($0052)
  $D8BA:  29 7F     AND #$7F
  $D8BC:  0A        ASL A
  $D8BD:  A8        TAY
  $D8BE:  B9 64 DF  LDA $DF64,Y
  $D8C1:  85 52     STA $52
  $D8C3:  B9 65 DF  LDA $DF65,Y
  $D8C6:  85 53     STA $53
  $D8C8:  6C 52 00  JMP ($0052)
  $D8CB:  20 E3 DD  JSR $DDE3
  $D8CE:  20 59 DA  JSR $DA59
  $D8D1:  4C F0 DD  JMP $DDF0
  $D8D4:  20 E3 DD  JSR $DDE3
  $D8D7:  20 47 DA  JSR $DA47
  $D8DA:  4C F0 DD  JMP $DDF0
  $D8DD:  20 E3 DD  JSR $DDE3
  $D8E0:  A9 03     LDA #$03
  $D8E2:  85 68     STA $68
  $D8E4:  BD 00 70  LDA $7000,X
  $D8E7:  48        PHA
  $D8E8:  29 FC     AND #$FC
  $D8EA:  9D 00 70  STA $7000,X
  $D8ED:  20 91 C8  JSR rng_main
  $D8F0:  A5 12     LDA rng_seed_lo
  $D8F2:  29 03     AND #$03
  $D8F4:  1D 00 70  ORA $7000,X
  $D8F7:  9D 00 70  STA $7000,X
  $D8FA:  68        PLA
  $D8FB:  49 02     EOR #$02
  $D8FD:  DD 00 70  CMP $7000,X
  $D900:  D0 06     BNE $D908
  $D902:  49 02     EOR #$02
  $D904:  C6 68     DEC $68
  $D906:  D0 DF     BNE $D8E7
  $D908:  18        CLC
  $D909:  60        RTS
  $D90A:  BD 00 70  LDA $7000,X
  $D90D:  18        CLC
  $D90E:  69 01     ADC #$01
  $D910:  29 03     AND #$03
  $D912:  48        PHA
  $D913:  BD 00 70  LDA $7000,X
  $D916:  29 FC     AND #$FC
  $D918:  9D 00 70  STA $7000,X
  $D91B:  68        PLA
  $D91C:  1D 00 70  ORA $7000,X
  $D91F:  9D 00 70  STA $7000,X
  $D922:  20 E3 DD  JSR $DDE3
  $D925:  4C F0 DD  JMP $DDF0
  $D928:  BD 00 70  LDA $7000,X
  $D92B:  38        SEC
  $D92C:  E9 01     SBC #$01
  $D92E:  4C 10 D9  JMP $D910
  $D931:  20 AB D9  JSR $D9AB
  $D934:  4C F0 DD  JMP $DDF0
  $D937:  20 AB D9  JSR $D9AB
  $D93A:  A9 81     LDA #$81
  $D93C:  9D 60 6F  STA $6F60,X
  $D93F:  9D 80 6F  STA $6F80,X
  $D942:  9D A0 6F  STA $6FA0,X
  $D945:  9D C0 6F  STA $6FC0,X
  $D948:  4C F0 DD  JMP $DDF0

sub_D94B:
  $D94B:  A6 51     LDX $51
  $D94D:  BD 60 71  LDA $7160,X
  $D950:  F0 49     BEQ $D99B
  $D952:  DE 60 71  DEC $7160,X
  $D955:  BD 60 71  LDA $7160,X
  $D958:  29 07     AND #$07
  $D95A:  D0 18     BNE $D974
  $D95C:  BD 60 71  LDA $7160,X
  $D95F:  38        SEC
  $D960:  E9 08     SBC #$08
  $D962:  29 38     AND #$38
  $D964:  C9 08     CMP #$08
  $D966:  F0 17     BEQ $D97F
  $D968:  9D 60 71  STA $7160,X
  $D96B:  4A        LSR A
  $D96C:  4A        LSR A
  $D96D:  4A        LSR A
  $D96E:  1D 60 71  ORA $7160,X
  $D971:  4C 9D D9  JMP $D99D
  $D974:  BD 20 70  LDA $7020,X
  $D977:  29 7F     AND #$7F
  $D979:  9D 20 70  STA $7020,X
  $D97C:  4C F0 DD  JMP $DDF0
  $D97F:  20 E3 DD  JSR $DDE3
  $D982:  A5 57     LDA $57
  $D984:  C9 09     CMP #$09
  $D986:  F0 0E     BEQ $D996
  $D988:  A9 81     LDA #$81
  $D98A:  9D 60 6F  STA $6F60,X
  $D98D:  9D 80 6F  STA $6F80,X
  $D990:  9D A0 6F  STA $6FA0,X
  $D993:  9D C0 6F  STA $6FC0,X
  $D996:  A9 00     LDA #$00
  $D998:  4C 9D D9  JMP $D99D
  $D99B:  A9 36     LDA #$36
  $D99D:  9D 60 71  STA $7160,X
  $D9A0:  BD 20 70  LDA $7020,X
  $D9A3:  09 80     ORA #$80
  $D9A5:  9D 20 70  STA $7020,X
  $D9A8:  4C F0 DD  JMP $DDF0

sub_D9AB:
  $D9AB:  A6 51     LDX $51
  $D9AD:  BD 20 70  LDA $7020,X
  $D9B0:  09 80     ORA #$80
  $D9B2:  9D 20 70  STA $7020,X
  $D9B5:  4C E3 DD  JMP $DDE3
  $D9B8:  A6 51     LDX $51
  $D9BA:  BD 20 70  LDA $7020,X
  $D9BD:  29 7F     AND #$7F
  $D9BF:  9D 20 70  STA $7020,X
  $D9C2:  20 11 DA  JSR $DA11
  $D9C5:  20 E3 DD  JSR $DDE3
  $D9C8:  4C F0 DD  JMP $DDF0

sub_D9CB:
  $D9CB:  A6 51     LDX $51
  $D9CD:  BD 60 71  LDA $7160,X
  $D9D0:  F0 34     BEQ $DA06
  $D9D2:  DE 60 71  DEC $7160,X
  $D9D5:  BD 60 71  LDA $7160,X
  $D9D8:  29 07     AND #$07
  $D9DA:  D0 98     BNE $D974
  $D9DC:  BD 60 71  LDA $7160,X
  $D9DF:  18        CLC
  $D9E0:  69 08     ADC #$08
  $D9E2:  29 38     AND #$38
  $D9E4:  C9 30     CMP #$30
  $D9E6:  B0 13     BCS $D9FB
  $D9E8:  09 80     ORA #$80
  $D9EA:  9D 60 71  STA $7160,X
  $D9ED:  29 38     AND #$38
  $D9EF:  4A        LSR A
  $D9F0:  4A        LSR A
  $D9F1:  4A        LSR A
  $D9F2:  1D 60 71  ORA $7160,X
  $D9F5:  9D 60 71  STA $7160,X
  $D9F8:  4C A0 D9  JMP $D9A0
  $D9FB:  20 E3 DD  JSR $DDE3
  $D9FE:  A9 00     LDA #$00
  $DA00:  9D 60 71  STA $7160,X
  $DA03:  4C 74 D9  JMP $D974
  $DA06:  A9 89     LDA #$89
  $DA08:  9D 60 71  STA $7160,X
  $DA0B:  20 11 DA  JSR $DA11
  $DA0E:  4C 74 D9  JMP $D974

sub_DA11:
  $DA11:  BD 60 6F  LDA $6F60,X
  $DA14:  9D A0 6F  STA $6FA0,X
  $DA17:  BD 80 6F  LDA $6F80,X
  $DA1A:  9D C0 6F  STA $6FC0,X
  $DA1D:  60        RTS
  $DA1E:  A5 3E     LDA $3E
  $DA20:  F0 09     BEQ $DA2B
  $DA22:  A6 51     LDX $51
  $DA24:  A5 3D     LDA $3D
  $DA26:  20 F3 DD  JSR $DDF3
  $DA29:  38        SEC
  $DA2A:  60        RTS
  $DA2B:  4C F0 DD  JMP $DDF0
  $DA2E:  A6 51     LDX $51
  $DA30:  BD E0 70  LDA $70E0,X
  $DA33:  09 08     ORA #$08
  $DA35:  9D E0 70  STA $70E0,X
  $DA38:  20 E3 DD  JSR $DDE3
  $DA3B:  4C F0 DD  JMP $DDF0
  $DA3E:  20 47 DA  JSR $DA47
  $DA41:  20 E3 DD  JSR $DDE3
  $DA44:  4C 91 D8  JMP $D891

sub_DA47:
  $DA47:  BD E0 70  LDA $70E0,X
  $DA4A:  09 80     ORA #$80
  $DA4C:  9D E0 70  STA $70E0,X
  $DA4F:  60        RTS
  $DA50:  20 59 DA  JSR $DA59
  $DA53:  20 E3 DD  JSR $DDE3
  $DA56:  4C 91 D8  JMP $D891

sub_DA59:
  $DA59:  BD E0 70  LDA $70E0,X
  $DA5C:  29 7F     AND #$7F
  $DA5E:  9D E0 70  STA $70E0,X
  $DA61:  60        RTS
  $DA62:  BD E0 70  LDA $70E0,X
  $DA65:  09 40     ORA #$40
  $DA67:  9D E0 70  STA $70E0,X
  $DA6A:  A9 11     LDA #$11
  $DA6C:  9D 40 70  STA $7040,X
  $DA6F:  20 E3 DD  JSR $DDE3
  $DA72:  4C 91 D8  JMP $D891
  $DA75:  98        TYA
  $DA76:  4A        LSR A
  $DA77:  38        SEC
  $DA78:  E9 11     SBC #$11
  $DA7A:  48        PHA
  $DA7B:  0A        ASL A
  $DA7C:  0A        ASL A
  $DA7D:  0A        ASL A
  $DA7E:  0A        ASL A
  $DA7F:  9D 40 70  STA $7040,X
  $DA82:  68        PLA
  $DA83:  1D 40 70  ORA $7040,X
  $DA86:  9D 40 70  STA $7040,X
  $DA89:  BD E0 70  LDA $70E0,X
  $DA8C:  29 BF     AND #$BF
  $DA8E:  9D E0 70  STA $70E0,X
  $DA91:  20 E3 DD  JSR $DDE3
  $DA94:  4C 91 D8  JMP $D891
  $DA97:  A0 01     LDY #$01
  $DA99:  B1 4D     LDA ($4D),Y
  $DA9B:  20 E0 DD  JSR $DDE0
  $DA9E:  00        BRK
  $DA9F:  01 8F     ORA ($8F,X)
  $DAA1:  4C F0 DD  JMP $DDF0
  $DAA4:  AD 07 05  LDA current_bank
  $DAA7:  48        PHA
  $DAA8:  C9 1C     CMP #$1C
  $DAAA:  18        CLC
  $DAAB:  F0 06     BEQ $DAB3
  $DAAD:  A9 1C     LDA #$1C
  $DAAF:  20 91 FF  JSR bank_switch
  $DAB2:  38        SEC
  $DAB3:  08        PHP
  $DAB4:  20 C6 DA  JSR $DAC6
  $DAB7:  A6 51     LDX $51
  $DAB9:  20 E0 DD  JSR $DDE0
  $DABC:  28        PLP
  $DABD:  68        PLA
  $DABE:  90 03     BCC $DAC3
  $DAC0:  20 91 FF  JSR bank_switch
  $DAC3:  4C F0 DD  JMP $DDF0

sub_DAC6:
  $DAC6:  AD 14 80  LDA $8014
  $DAC9:  85 55     STA $55
  $DACB:  AD 15 80  LDA $8015
  $DACE:  85 56     STA $56
  $DAD0:  AD 16 80  LDA $8016
  $DAD3:  85 00     STA $00
  $DAD5:  AD 17 80  LDA $8017
  $DAD8:  85 01     STA $01
  $DADA:  A0 01     LDY #$01
  $DADC:  A5 67     LDA $67
  $DADE:  A2 4D     LDX #$4D
  $DAE0:  20 EA C3  JSR $C3EA
  $DAE3:  AA        TAX
  $DAE4:  A0 00     LDY #$00
  $DAE6:  B1 00     LDA ($00),Y
  $DAE8:  8D 31 05  STA $0531
  $DAEB:  E0 00     CPX #$00
  $DAED:  F0 14     BEQ $DB03
  $DAEF:  B1 00     LDA ($00),Y
  $DAF1:  18        CLC
  $DAF2:  65 55     ADC $55
  $DAF4:  85 55     STA $55
  $DAF6:  90 02     BCC $DAFA
  $DAF8:  E6 56     INC $56
  $DAFA:  C8        INY
  $DAFB:  B1 00     LDA ($00),Y
  $DAFD:  8D 31 05  STA $0531
  $DB00:  CA        DEX
  $DB01:  D0 EC     BNE $DAEF
  $DB03:  A5 55     LDA $55
  $DB05:  8D 32 05  STA $0532
  $DB08:  A5 56     LDA $56
  $DB0A:  8D 33 05  STA $0533
  $DB0D:  20 6A DB  JSR $DB6A
  $DB10:  29 0F     AND #$0F
  $DB12:  09 80     ORA #$80
  $DB14:  8D 30 05  STA $0530
  $DB17:  60        RTS
sub_DB18:
  $DB18:  20 6A DB  JSR $DB6A
  $DB1B:  29 F0     AND #$F0
  $DB1D:  48        PHA
  $DB1E:  CE 30 05  DEC $0530
  $DB21:  AD 30 05  LDA $0530
  $DB24:  29 0F     AND #$0F
  $DB26:  D0 3E     BNE $DB66
  $DB28:  CE 31 05  DEC $0531
  $DB2B:  F0 34     BEQ $DB61
  $DB2D:  AD 33 05  LDA $0533
  $DB30:  0D 32 05  ORA $0532
  $DB33:  D0 05     BNE $DB3A
  $DB35:  A9 8F     LDA #$8F
  $DB37:  4C 63 DB  JMP $DB63
  $DB3A:  A5 00     LDA $00
  $DB3C:  18        CLC
  $DB3D:  69 01     ADC #$01
  $DB3F:  85 00     STA $00
  $DB41:  90 02     BCC $DB45
  $DB43:  E6 01     INC $01
  $DB45:  68        PLA
  $DB46:  A5 00     LDA $00
  $DB48:  8D 32 05  STA $0532
  $DB4B:  A5 01     LDA $01
  $DB4D:  8D 33 05  STA $0533
  $DB50:  A0 00     LDY #$00
  $DB52:  A2 00     LDX #$00
  $DB54:  A9 1C     LDA #$1C
  $DB56:  20 EA C3  JSR $C3EA
  $DB59:  48        PHA
  $DB5A:  29 0F     AND #$0F
  $DB5C:  09 80     ORA #$80
  $DB5E:  4C 63 DB  JMP $DB63
  $DB61:  A9 00     LDA #$00
  $DB63:  8D 30 05  STA $0530
  $DB66:  68        PLA
  $DB67:  29 F0     AND #$F0
  $DB69:  60        RTS
sub_DB6A:
  $DB6A:  A0 00     LDY #$00
  $DB6C:  AD 32 05  LDA $0532
  $DB6F:  85 00     STA $00
  $DB71:  0D 33 05  ORA $0533
  $DB74:  F0 0C     BEQ $DB82
  $DB76:  AD 33 05  LDA $0533
  $DB79:  85 01     STA $01
  $DB7B:  A2 00     LDX #$00
  $DB7D:  A9 1C     LDA #$1C
  $DB7F:  20 EA C3  JSR $C3EA
  $DB82:  60        RTS
  $DB83:  A6 51     LDX $51
  $DB85:  A0 01     LDY #$01
  $DB87:  B1 4D     LDA ($4D),Y
  $DB89:  48        PHA
  $DB8A:  20 F3 DD  JSR $DDF3
  $DB8D:  68        PLA
  $DB8E:  30 17     BMI $DBA7
  $DB90:  29 3C     AND #$3C
  $DB92:  4A        LSR A
  $DB93:  4A        LSR A
  $DB94:  18        CLC
  $DB95:  69 04     ADC #$04
  $DB97:  48        PHA
  $DB98:  BD E0 6F  LDA $6FE0,X
  $DB9B:  29 F0     AND #$F0
  $DB9D:  9D E0 6F  STA $6FE0,X
  $DBA0:  68        PLA
  $DBA1:  1D E0 6F  ORA $6FE0,X
  $DBA4:  9D E0 6F  STA $6FE0,X
  $DBA7:  20 E0 DD  JSR $DDE0
  $DBAA:  4C 91 D8  JMP $D891
  $DBAD:  A0 01     LDY #$01
  $DBAF:  B1 4D     LDA ($4D),Y
  $DBB1:  10 0E     BPL $DBC1
  $DBB3:  A9 FF     LDA #$FF
  $DBB5:  9D A0 71  STA $71A0,X
  $DBB8:  9D C0 71  STA $71C0,X
  $DBBB:  20 DD DD  JSR $DDDD
  $DBBE:  4C 91 D8  JMP $D891
  $DBC1:  9D A0 71  STA $71A0,X
  $DBC4:  C8        INY
  $DBC5:  B1 4D     LDA ($4D),Y
  $DBC7:  9D C0 71  STA $71C0,X
  $DBCA:  20 DD DD  JSR $DDDD
  $DBCD:  4C 91 D8  JMP $D891
  $DBD0:  A0 01     LDY #$01
  $DBD2:  B1 4D     LDA ($4D),Y
  $DBD4:  9D 60 6F  STA $6F60,X
  $DBD7:  9D A0 6F  STA $6FA0,X
  $DBDA:  48        PHA
  $DBDB:  C8        INY
  $DBDC:  B1 4D     LDA ($4D),Y
  $DBDE:  9D 80 6F  STA $6F80,X
  $DBE1:  9D C0 6F  STA $6FC0,X
  $DBE4:  A8        TAY
  $DBE5:  20 DD DD  JSR $DDDD
  $DBE8:  68        PLA
  $DBE9:  AA        TAX
  $DBEA:  20 E6 D3  JSR $D3E6
  $DBED:  A6 51     LDX $51
  $DBEF:  9D 40 71  STA $7140,X
  $DBF2:  4C 91 D8  JMP $D891
  $DBF5:  A6 51     LDX $51
  $DBF7:  EA        NOP
  $DBF8:  EA        NOP
  $DBF9:  EA        NOP
  $DBFA:  EA        NOP
  $DBFB:  8E 9C 05  STX $059C
  $DBFE:  20 DD DD  JSR $DDDD
  $DC01:  A0 02     LDY #$02
  $DC03:  B1 4D     LDA ($4D),Y
  $DC05:  8D 94 05  STA $0594
  $DC08:  88        DEY
  $DC09:  B1 4D     LDA ($4D),Y
  $DC0B:  8D 93 05  STA $0593
  $DC0E:  A9 80     LDA #$80
  $DC10:  8D 27 05  STA $0527
  $DC13:  4C F0 DD  JMP $DDF0
  $DC16:  20 3B DC  JSR $DC3B
  $DC19:  11 52     ORA ($52),Y
  $DC1B:  91 52     STA ($52),Y
  $DC1D:  20 DA DD  JSR $DDDA
  $DC20:  4C 91 D8  JMP $D891
  $DC23:  20 3B DC  JSR $DC3B
  $DC26:  31 52     AND ($52),Y
  $DC28:  91 52     STA ($52),Y
  $DC2A:  20 DA DD  JSR $DDDA
  $DC2D:  4C 91 D8  JMP $D891
  $DC30:  20 3B DC  JSR $DC3B
  $DC33:  91 52     STA ($52),Y
  $DC35:  20 DA DD  JSR $DDDA
  $DC38:  4C 91 D8  JMP $D891

sub_DC3B:
  $DC3B:  A0 03     LDY #$03
  $DC3D:  B1 4D     LDA ($4D),Y
  $DC3F:  85 53     STA $53
  $DC41:  88        DEY
  $DC42:  B1 4D     LDA ($4D),Y
  $DC44:  85 52     STA $52
  $DC46:  88        DEY
  $DC47:  B1 4D     LDA ($4D),Y
  $DC49:  88        DEY
  $DC4A:  60        RTS
  $DC4B:  A9 00     LDA #$00
  $DC4D:  85 54     STA $54
  $DC4F:  BD A0 71  LDA $71A0,X
  $DC52:  3D C0 71  AND $71C0,X
  $DC55:  C9 FF     CMP #$FF
  $DC57:  D0 46     BNE $DC9F
  $DC59:  AD 60 6F  LDA $6F60
  $DC5C:  DD 60 6F  CMP $6F60,X
  $DC5F:  26 52     ROL $52
  $DC61:  BD 80 6F  LDA $6F80,X
  $DC64:  CD 80 6F  CMP $6F80
  $DC67:  26 52     ROL $52
  $DC69:  BD 60 6F  LDA $6F60,X
  $DC6C:  CD 60 6F  CMP $6F60
  $DC6F:  26 52     ROL $52
  $DC71:  AD 80 6F  LDA $6F80
  $DC74:  DD 80 6F  CMP $6F80,X
  $DC77:  26 52     ROL $52
  $DC79:  BD 60 6F  LDA $6F60,X
  $DC7C:  38        SEC
  $DC7D:  ED 60 6F  SBC $6F60
  $DC80:  18        CLC
  $DC81:  69 01     ADC #$01
  $DC83:  C9 03     CMP #$03
  $DC85:  B0 38     BCS $DCBF
  $DC87:  85 53     STA $53
  $DC89:  BD 80 6F  LDA $6F80,X
  $DC8C:  38        SEC
  $DC8D:  ED 80 6F  SBC $6F80
  $DC90:  18        CLC
  $DC91:  69 01     ADC #$01
  $DC93:  C9 03     CMP #$03
  $DC95:  B0 28     BCS $DCBF
  $DC97:  65 53     ADC $53
  $DC99:  29 01     AND #$01
  $DC9B:  F0 22     BEQ $DCBF
  $DC9D:  D0 5A     BNE $DCF9
  $DC9F:  BD A0 71  LDA $71A0,X
  $DCA2:  DD 60 6F  CMP $6F60,X
  $DCA5:  26 52     ROL $52
  $DCA7:  BD 80 6F  LDA $6F80,X
  $DCAA:  DD C0 71  CMP $71C0,X
  $DCAD:  26 52     ROL $52
  $DCAF:  BD 60 6F  LDA $6F60,X
  $DCB2:  DD A0 71  CMP $71A0,X
  $DCB5:  26 52     ROL $52
  $DCB7:  BD C0 71  LDA $71C0,X
  $DCBA:  DD 80 6F  CMP $6F80,X
  $DCBD:  26 52     ROL $52
  $DCBF:  A5 52     LDA $52
  $DCC1:  49 0F     EOR #$0F
  $DCC3:  29 0F     AND #$0F
  $DCC5:  85 52     STA $52
  $DCC7:  F0 26     BEQ $DCEF
  $DCC9:  A0 FF     LDY #$FF
  $DCCB:  84 53     STY $53
  $DCCD:  C8        INY
  $DCCE:  4A        LSR A
  $DCCF:  90 FC     BCC $DCCD
  $DCD1:  84 53     STY $53
  $DCD3:  C8        INY
  $DCD4:  C0 04     CPY #$04
  $DCD6:  B0 0E     BCS $DCE6
  $DCD8:  4A        LSR A
  $DCD9:  90 F8     BCC $DCD3
  $DCDB:  BD 00 70  LDA $7000,X
  $DCDE:  29 03     AND #$03
  $DCE0:  85 52     STA $52
  $DCE2:  C4 52     CPY $52
  $DCE4:  F0 02     BEQ $DCE8
  $DCE6:  A5 53     LDA $53
  $DCE8:  45 54     EOR $54
  $DCEA:  20 F3 DD  JSR $DDF3
  $DCED:  38        SEC
  $DCEE:  60        RTS
  $DCEF:  A5 54     LDA $54
  $DCF1:  F0 06     BEQ $DCF9
  $DCF3:  20 91 C8  JSR rng_main
  $DCF6:  4C E8 DC  JMP $DCE8
  $DCF9:  20 E3 DD  JSR $DDE3
  $DCFC:  4C 91 D8  JMP $D891
  $DCFF:  A9 02     LDA #$02
  $DD01:  85 54     STA $54
  $DD03:  4C 9F DC  JMP $DC9F
  $DD06:  A0 01     LDY #$01
  $DD08:  B1 4D     LDA ($4D),Y
  $DD0A:  AA        TAX
  $DD0B:  C8        INY
  $DD0C:  B1 4D     LDA ($4D),Y
  $DD0E:  48        PHA
  $DD0F:  C8        INY
  $DD10:  B1 4D     LDA ($4D),Y
  $DD12:  A8        TAY
  $DD13:  68        PLA
  $DD14:  00        BRK
  $DD15:  09 EF     ORA #$EF
  $DD17:  A6 51     LDX $51
  $DD19:  20 DA DD  JSR $DDDA
  $DD1C:  4C 91 D8  JMP $D891
  $DD1F:  A0 01     LDY #$01
  $DD21:  A9 0F     LDA #$0F
  $DD23:  85 54     STA $54
  $DD25:  A6 51     LDX $51
  $DD27:  BD E0 71  LDA $71E0,X
  $DD2A:  29 F0     AND #$F0
  $DD2C:  85 53     STA $53
  $DD2E:  30 11     BMI $DD41
  $DD30:  B1 4D     LDA ($4D),Y
  $DD32:  29 F0     AND #$F0
  $DD34:  C5 53     CMP $53
  $DD36:  F0 02     BEQ $DD3A
  $DD38:  B0 1C     BCS $DD56
  $DD3A:  A9 0D     LDA #$0D
  $DD3C:  85 54     STA $54
  $DD3E:  4C 56 DD  JMP $DD56
  $DD41:  49 F0     EOR #$F0
  $DD43:  18        CLC
  $DD44:  69 10     ADC #$10
  $DD46:  85 53     STA $53
  $DD48:  B1 4D     LDA ($4D),Y
  $DD4A:  29 F0     AND #$F0
  $DD4C:  C5 53     CMP $53
  $DD4E:  F0 02     BEQ $DD52
  $DD50:  B0 04     BCS $DD56
  $DD52:  A9 07     LDA #$07
  $DD54:  85 54     STA $54
  $DD56:  A6 51     LDX $51
  $DD58:  BD E0 71  LDA $71E0,X
  $DD5B:  29 0F     AND #$0F
  $DD5D:  85 53     STA $53
  $DD5F:  C9 08     CMP #$08
  $DD61:  B0 13     BCS $DD76
  $DD63:  B1 4D     LDA ($4D),Y
  $DD65:  29 0F     AND #$0F
  $DD67:  C5 53     CMP $53
  $DD69:  F0 02     BEQ $DD6D
  $DD6B:  B0 1F     BCS $DD8C
  $DD6D:  A5 54     LDA $54
  $DD6F:  29 0B     AND #$0B
  $DD71:  85 54     STA $54
  $DD73:  4C 8C DD  JMP $DD8C
  $DD76:  49 0F     EOR #$0F
  $DD78:  85 53     STA $53
  $DD7A:  E6 53     INC $53
  $DD7C:  B1 4D     LDA ($4D),Y
  $DD7E:  29 0F     AND #$0F
  $DD80:  C5 53     CMP $53
  $DD82:  F0 02     BEQ $DD86
  $DD84:  B0 06     BCS $DD8C
  $DD86:  A5 54     LDA $54
  $DD88:  29 0E     AND #$0E
  $DD8A:  85 54     STA $54
  $DD8C:  A9 01     LDA #$01
  $DD8E:  85 53     STA $53
  $DD90:  20 91 C8  JSR rng_main
  $DD93:  29 03     AND #$03
  $DD95:  48        PHA
  $DD96:  AA        TAX
  $DD97:  CA        DEX
  $DD98:  30 05     BMI $DD9F
  $DD9A:  06 53     ASL $53
  $DD9C:  4C 97 DD  JMP $DD97
  $DD9F:  68        PLA
  $DDA0:  AA        TAX
  $DDA1:  A5 53     LDA $53
  $DDA3:  25 54     AND $54
  $DDA5:  F0 E5     BEQ $DD8C
  $DDA7:  8A        TXA
  $DDA8:  A6 51     LDX $51
  $DDAA:  20 F3 DD  JSR $DDF3
  $DDAD:  18        CLC
  $DDAE:  60        RTS
  $DDAF:  A0 01     LDY #$01
  $DDB1:  B1 4D     LDA ($4D),Y
  $DDB3:  C5 44     CMP $44
  $DDB5:  D0 0D     BNE $DDC4
  $DDB7:  C8        INY
  $DDB8:  B1 4D     LDA ($4D),Y
  $DDBA:  C5 45     CMP $45
  $DDBC:  D0 06     BNE $DDC4
  $DDBE:  20 DA DD  JSR $DDDA
  $DDC1:  4C 91 D8  JMP $D891
  $DDC4:  A0 03     LDY #$03
  $DDC6:  B1 4D     LDA ($4D),Y
  $DDC8:  4C AB D8  JMP $D8AB
  $DDCB:  A0 01     LDY #$01
  $DDCD:  B1 4D     LDA ($4D),Y
  $DDCF:  00        BRK
  $DDD0:  03        .db $03
  $DDD1:  9F        .db $9F
  $DDD2:  A6 51     LDX $51
  $DDD4:  20 E0 DD  JSR $DDE0
  $DDD7:  4C 91 D8  JMP $D891

sub_DDDA:
  $DDDA:  20 E7 DD  JSR $DDE7

sub_DDDD:
  $DDDD:  20 E7 DD  JSR $DDE7

sub_DDE0:
  $DDE0:  20 E7 DD  JSR $DDE7

sub_DDE3:
  $DDE3:  20 E7 DD  JSR $DDE7
  $DDE6:  60        RTS
sub_DDE7:
  $DDE7:  FE 80 70  INC $7080,X
  $DDEA:  D0 03     BNE $DDEF
  $DDEC:  FE 60 70  INC $7060,X
  $DDEF:  60        RTS
  $DDF0:  68        PLA
  $DDF1:  68        PLA
  $DDF2:  60        RTS
sub_DDF3:
  $DDF3:  29 03     AND #$03
  $DDF5:  48        PHA
  $DDF6:  BD 00 70  LDA $7000,X
  $DDF9:  29 FC     AND #$FC
  $DDFB:  9D 00 70  STA $7000,X
  $DDFE:  68        PLA
  $DDFF:  1D 00 70  ORA $7000,X
  $DE02:  9D 00 70  STA $7000,X
  $DE05:  60        RTS
  $DE06:  A6 51     LDX $51
  $DE08:  4C 12 DE  JMP $DE12
  $DE0B:  A6 51     LDX $51
  $DE0D:  DE 80 71  DEC $7180,X
  $DE10:  F0 0F     BEQ $DE21
  $DE12:  BD A0 70  LDA $70A0,X
  $DE15:  9D 60 70  STA $7060,X
  $DE18:  BD C0 70  LDA $70C0,X
  $DE1B:  9D 80 70  STA $7080,X
  $DE1E:  4C 91 D8  JMP $D891
  $DE21:  20 E3 DD  JSR $DDE3
  $DE24:  4C 91 D8  JMP $D891
  $DE27:  A6 51     LDX $51
  $DE29:  A0 01     LDY #$01
  $DE2B:  B1 4D     LDA ($4D),Y
  $DE2D:  9D 80 71  STA $7180,X
  $DE30:  20 E0 DD  JSR $DDE0
  $DE33:  BD 60 70  LDA $7060,X
  $DE36:  9D A0 70  STA $70A0,X
  $DE39:  BD 80 70  LDA $7080,X
  $DE3C:  9D C0 70  STA $70C0,X
  $DE3F:  4C 91 D8  JMP $D891
  $DE42:  A0 01     LDY #$01
  $DE44:  B1 4D     LDA ($4D),Y
  $DE46:  10 03     BPL $DE4B
  $DE48:  DE 60 70  DEC $7060,X
  $DE4B:  18        CLC
  $DE4C:  7D 80 70  ADC $7080,X
  $DE4F:  9D 80 70  STA $7080,X
  $DE52:  BD 60 70  LDA $7060,X
  $DE55:  69 00     ADC #$00
  $DE57:  9D 60 70  STA $7060,X
  $DE5A:  4C 91 D8  JMP $D891
  $DE5D:  A0 01     LDY #$01
  $DE5F:  B1 4D     LDA ($4D),Y
  $DE61:  9D 80 70  STA $7080,X
  $DE64:  C8        INY
  $DE65:  B1 4D     LDA ($4D),Y
  $DE67:  9D 60 70  STA $7060,X
  $DE6A:  4C 91 D8  JMP $D891
  $DE6D:  A6 51     LDX $51
  $DE6F:  A0 01     LDY #$01
  $DE71:  B1 4D     LDA ($4D),Y
  $DE73:  48        PHA
  $DE74:  C8        INY
  $DE75:  B1 4D     LDA ($4D),Y
  $DE77:  48        PHA
  $DE78:  20 DD DD  JSR $DDDD
  $DE7B:  BD 80 70  LDA $7080,X
  $DE7E:  9D C0 70  STA $70C0,X
  $DE81:  BD 60 70  LDA $7060,X
  $DE84:  9D A0 70  STA $70A0,X
  $DE87:  68        PLA
  $DE88:  9D 60 70  STA $7060,X
  $DE8B:  68        PLA
  $DE8C:  9D 80 70  STA $7080,X
  $DE8F:  4C 91 D8  JMP $D891
  $DE92:  A0 01     LDY #$01
  $DE94:  B1 4D     LDA ($4D),Y
  $DE96:  0A        ASL A
  $DE97:  A8        TAY
  $DE98:  B9 A5 DE  LDA $DEA5,Y
  $DE9B:  85 52     STA $52
  $DE9D:  B9 A6 DE  LDA $DEA6,Y
  $DEA0:  85 53     STA $53
  $DEA2:  6C 52 00  JMP ($0052)
  $DEA5:  A9 DE     LDA #$DE
  $DEA7:  CE DE A5  DEC $A5DE
  $DEAA:  44        .db $44
  $DEAB:  C9 0A     CMP #$0A
  $DEAD:  D0 1C     BNE $DECB
  $DEAF:  A5 45     LDA $45
  $DEB1:  C9 1E     CMP #$1E
  $DEB3:  D0 16     BNE $DECB
  $DEB5:  A0 02     LDY #$02
  $DEB7:  B1 4D     LDA ($4D),Y
  $DEB9:  18        CLC
  $DEBA:  7D 80 70  ADC $7080,X
  $DEBD:  9D 80 70  STA $7080,X
  $DEC0:  BD 60 70  LDA $7060,X
  $DEC3:  69 00     ADC #$00
  $DEC5:  9D 60 70  STA $7060,X
  $DEC8:  4C 91 D8  JMP $D891
  $DECB:  4C F0 DD  JMP $DDF0
  $DECE:  60        RTS
  $DECF:  20 DD DD  JSR $DDDD
  $DED2:  A5 3D     LDA $3D
  $DED4:  4A        LSR A
  $DED5:  B0 07     BCS $DEDE
  $DED7:  A5 3D     LDA $3D
  $DED9:  49 02     EOR #$02
  $DEDB:  4C E0 DE  JMP $DEE0
  $DEDE:  A5 3D     LDA $3D
  $DEE0:  20 F3 DD  JSR $DDF3
  $DEE3:  18        CLC
  $DEE4:  60        RTS
  $DEE5:  A0 01     LDY #$01
  $DEE7:  B1 4D     LDA ($4D),Y
  $DEE9:  48        PHA
  $DEEA:  00        BRK
  $DEEB:  04        .db $04
  $DEEC:  DF        .db $DF
  $DEED:  68        PLA
  $DEEE:  A6 51     LDX $51
  $DEF0:  B0 0A     BCS $DEFC
  $DEF2:  C9 16     CMP #$16
  $DEF4:  F0 03     BEQ $DEF9
  $DEF6:  4C D7 D8  JMP $D8D7
  $DEF9:  4C CE D8  JMP $D8CE
  $DEFC:  20 E0 DD  JSR $DDE0
  $DEFF:  4C 91 D8  JMP $D891
  $DF02:  CB        .db $CB
  $DF03:  D8        CLD
  $DF04:  D4        .db $D4
  $DF05:  D8        CLD
  $DF06:  DD D8 4B  CMP $4BD8,X
  $DF09:  DC        .db $DC
  $DF0A:  FF        .db $FF
  $DF0B:  DC        .db $DC
  $DF0C:  0A        ASL A
  $DF0D:  D9 28 D9  CMP $D928,Y
  $DF10:  31 D9     AND ($D9),Y
  $DF12:  37        .db $37
  $DF13:  D9 4B D9  CMP $D94B,Y
  $DF16:  4B        .db $4B
  $DF17:  D9 B8 D9  CMP $D9B8,Y
  $DF1A:  CB        .db $CB
  $DF1B:  D9 1E DA  CMP $DA1E,Y
  $DF1E:  2E DA 3E  ROL $3EDA
  $DF21:  DA        .db $DA
  $DF22:  50 DA     BVC $DEFE
  $DF24:  62        .db $62
  $DF25:  DA        .db $DA
  $DF26:  75 DA     ADC $DA,X
  $DF28:  75 DA     ADC $DA,X
  $DF2A:  75 DA     ADC $DA,X
  $DF2C:  75 DA     ADC $DA,X
  $DF2E:  75 DA     ADC $DA,X
  $DF30:  75 DA     ADC $DA,X
  $DF32:  75 DA     ADC $DA,X
  $DF34:  75 DA     ADC $DA,X
  $DF36:  75 DA     ADC $DA,X
  $DF38:  75 DA     ADC $DA,X
  $DF3A:  75 DA     ADC $DA,X
  $DF3C:  75 DA     ADC $DA,X
  $DF3E:  75 DA     ADC $DA,X
  $DF40:  75 DA     ADC $DA,X
  $DF42:  75 DA     ADC $DA,X
  $DF44:  97        .db $97
  $DF45:  DA        .db $DA
  $DF46:  A4 DA     LDY $DA
  $DF48:  83        .db $83
  $DF49:  DB        .db $DB
  $DF4A:  AD DB D0  LDA $D0DB
  $DF4D:  DB        .db $DB
  $DF4E:  F5 DB     SBC $DB,X
  $DF50:  16 DC     ASL $DC,X
  $DF52:  23        .db $23
  $DF53:  DC        .db $DC
  $DF54:  30 DC     BMI $DF32
  $DF56:  D7        .db $D7
  $DF57:  D8        CLD
  $DF58:  E0 D8     CPX #$D8
  $DF5A:  06 DD     ASL $DD
  $DF5C:  1F        .db $1F
  $DF5D:  DD AF DD  CMP $DDAF,X
  $DF60:  CE D8 CB  DEC $CBD8
  $DF63:  DD 06 DE  CMP $DE06,X
  $DF66:  0B        .db $0B
  $DF67:  DE 27 DE  DEC $DE27,X
  $DF6A:  42        .db $42
  $DF6B:  DE 5D DE  DEC $DE5D,X
  $DF6E:  6D DE 92  ADC $92DE
  $DF71:  DE CF DE  DEC $DECF,X
  $DF74:  E5 DE     SBC $DE
  $DF76:  E5 DE     SBC $DE
  $DF78:  E5 DE     SBC $DE
  $DF7A:  AD 07 05  LDA current_bank
  $DF7D:  48        PHA
  $DF7E:  A5 51     LDA $51
  $DF80:  20 91 FF  JSR bank_switch
  $DF83:  A0 00     LDY #$00
  $DF85:  B1 49     LDA ($49),Y
  $DF87:  85 98     STA $98
  $DF89:  20 9F DF  JSR $DF9F
  $DF8C:  B1 49     LDA ($49),Y
  $DF8E:  85 99     STA $99
  $DF90:  20 9F DF  JSR $DF9F
  $DF93:  B1 49     LDA ($49),Y
  $DF95:  85 9A     STA $9A
  $DF97:  20 9F DF  JSR $DF9F
  $DF9A:  68        PLA
  $DF9B:  20 91 FF  JSR bank_switch
  $DF9E:  60        RTS
sub_DF9F:
  $DF9F:  48        PHA
  $DFA0:  E6 49     INC $49
  $DFA2:  D0 02     BNE $DFA6
  $DFA4:  E6 4A     INC $4A
  $DFA6:  A5 49     LDA $49
  $DFA8:  C9 D8     CMP #$D8
  $DFAA:  D0 41     BNE $DFED
  $DFAC:  A5 4A     LDA $4A
  $DFAE:  C9 BF     CMP #$BF
  $DFB0:  D0 3B     BNE $DFED
  $DFB2:  EE 07 05  INC current_bank
  $DFB5:  E6 51     INC $51
  $DFB7:  AD 07 05  LDA current_bank
  $DFBA:  48        PHA
  $DFBB:  20 91 FF  JSR bank_switch
  $DFBE:  68        PLA
  $DFBF:  C9 05     CMP #$05
  $DFC1:  90 22     BCC $DFE5
  $DFC3:  F0 19     BEQ $DFDE
  $DFC5:  A9 1B     LDA #$1B
  $DFC7:  85 51     STA $51
  $DFC9:  20 91 FF  JSR bank_switch
  $DFCC:  AD EF DF  LDA $DFEF
  $DFCF:  0A        ASL A
  $DFD0:  AA        TAX
  $DFD1:  BD 00 80  LDA $8000,X
  $DFD4:  85 49     STA $49
  $DFD6:  BD 01 80  LDA $8001,X
  $DFD9:  85 4A     STA $4A
  $DFDB:  4C ED DF  JMP $DFED
  $DFDE:  A9 1A     LDA #$1A
  $DFE0:  85 51     STA $51
  $DFE2:  20 91 FF  JSR bank_switch
  $DFE5:  A9 80     LDA #$80
  $DFE7:  85 4A     STA $4A
  $DFE9:  A9 00     LDA #$00
  $DFEB:  85 49     STA $49
  $DFED:  68        PLA
  $DFEE:  60        RTS
  $DFEF:  0A        ASL A
  $DFF0:  BF        .db $BF
  $DFF1:  A9 00     LDA #$00
  $DFF3:  8D BB 07  STA $07BB
  $DFF6:  85 EA     STA $EA
  $DFF8:  85 EB     STA $EB
  $DFFA:  20 F6 E4  JSR $E4F6
  $DFFD:  20 02 E4  JSR $E402
  $E000:  A5 41     LDA $41
  $E002:  10 11     BPL $E015
  $E004:  A5 45     LDA $45
  $E006:  38        SEC
  $E007:  E9 07     SBC #$07
  $E009:  85 ED     STA $ED
  $E00B:  A5 44     LDA $44
  $E00D:  38        SEC
  $E00E:  E9 08     SBC #$08
  $E010:  85 EC     STA $EC
  $E012:  4C 23 E0  JMP $E023
  $E015:  A5 43     LDA $43
  $E017:  38        SEC
  $E018:  E9 07     SBC #$07
  $E01A:  85 ED     STA $ED
  $E01C:  A5 42     LDA $42
  $E01E:  38        SEC
  $E01F:  E9 08     SBC #$08
  $E021:  85 EC     STA $EC
  $E023:  A5 61     LDA $61
  $E025:  09 01     ORA #$01
  $E027:  85 61     STA $61
  $E029:  20 47 E1  JSR $E147
  $E02C:  A9 00     LDA #$00
  $E02E:  85 16     STA rng_temp
  $E030:  20 68 E3  JSR $E368
  $E033:  A2 01     LDX #$01
  $E035:  BD 20 70  LDA $7020,X
  $E038:  C9 FF     CMP #$FF
  $E03A:  F0 31     BEQ $E06D
  $E03C:  A9 00     LDA #$00
  $E03E:  9D 00 71  STA $7100,X
  $E041:  9D 20 71  STA $7120,X
  $E044:  BD 00 70  LDA $7000,X
  $E047:  85 E4     STA $E4
  $E049:  BD 20 70  LDA $7020,X
  $E04C:  29 90     AND #$90
  $E04E:  D0 10     BNE $E060
  $E050:  20 69 E1  JSR $E169
  $E053:  A5 E4     LDA $E4
  $E055:  9D 00 70  STA $7000,X
  $E058:  90 0E     BCC $E068
  $E05A:  20 68 E3  JSR $E368
  $E05D:  4C 68 E0  JMP $E068
  $E060:  20 60 E1  JSR $E160
  $E063:  A5 E4     LDA $E4
  $E065:  9D 00 70  STA $7000,X
  $E068:  E8        INX
  $E069:  E0 1E     CPX #$1E
  $E06B:  90 C8     BCC $E035
  $E06D:  60        RTS
movement_update:
  $E06E:  20 47 E1  JSR $E147
  $E071:  A5 3E     LDA $3E
  $E073:  F0 49     BEQ $E0BE
  $E075:  AD 00 70  LDA $7000
  $E078:  29 03     AND #$03
  $E07A:  D0 10     BNE $E08C
  $E07C:  A5 EB     LDA $EB
  $E07E:  38        SEC
  $E07F:  ED 8F 05  SBC $058F
  $E082:  85 EB     STA $EB
  $E084:  B0 03     BCS $E089
  $E086:  CE ED 00  DEC $00ED
  $E089:  4C BE E0  JMP $E0BE
  $E08C:  C9 01     CMP #$01
  $E08E:  D0 0F     BNE $E09F
  $E090:  A5 EA     LDA $EA
  $E092:  18        CLC
  $E093:  6D 8F 05  ADC $058F
  $E096:  85 EA     STA $EA
  $E098:  90 02     BCC $E09C
  $E09A:  E6 EC     INC $EC
  $E09C:  4C BE E0  JMP $E0BE
  $E09F:  C9 02     CMP #$02
  $E0A1:  D0 0F     BNE $E0B2
  $E0A3:  A5 EB     LDA $EB
  $E0A5:  18        CLC
  $E0A6:  6D 8F 05  ADC $058F
  $E0A9:  85 EB     STA $EB
  $E0AB:  90 02     BCC $E0AF
  $E0AD:  E6 ED     INC $ED
  $E0AF:  4C BE E0  JMP $E0BE
  $E0B2:  A5 EA     LDA $EA
  $E0B4:  38        SEC
  $E0B5:  ED 8F 05  SBC $058F
  $E0B8:  85 EA     STA $EA
  $E0BA:  B0 02     BCS $E0BE
  $E0BC:  C6 EC     DEC $EC
  $E0BE:  A2 01     LDX #$01
  $E0C0:  BD 20 70  LDA $7020,X
  $E0C3:  C9 FF     CMP #$FF
  $E0C5:  D0 01     BNE $E0C8
  $E0C7:  60        RTS
  $E0C8:  BD 00 70  LDA $7000,X
  $E0CB:  85 E4     STA $E4
  $E0CD:  30 1B     BMI $E0EA
  $E0CF:  BD 20 70  LDA $7020,X
  $E0D2:  29 90     AND #$90
  $E0D4:  F0 06     BEQ $E0DC
  $E0D6:  20 60 E1  JSR $E160
  $E0D9:  4C DF E0  JMP $E0DF
  $E0DC:  20 69 E1  JSR $E169
  $E0DF:  A5 E4     LDA $E4
  $E0E1:  9D 00 70  STA $7000,X
  $E0E4:  E8        INX
  $E0E5:  E0 1E     CPX #$1E
  $E0E7:  90 D7     BCC $E0C0
  $E0E9:  60        RTS
  $E0EA:  A9 0F     LDA #$0F
  $E0EC:  85 E3     STA $E3
  $E0EE:  A0 10     LDY #$10
  $E0F0:  BD E0 70  LDA $70E0,X
  $E0F3:  29 40     AND #$40
  $E0F5:  F0 04     BEQ $E0FB
  $E0F7:  A0 20     LDY #$20
  $E0F9:  46 E3     LSR $E3
  $E0FB:  84 E2     STY $E2
  $E0FD:  BD 20 70  LDA $7020,X
  $E100:  85 E5     STA $E5
  $E102:  29 90     AND #$90
  $E104:  F0 06     BEQ $E10C
  $E106:  20 60 E1  JSR $E160
  $E109:  4C 2B E1  JMP $E12B
  $E10C:  A5 E4     LDA $E4
  $E10E:  20 EE E2  JSR $E2EE
  $E111:  A5 E5     LDA $E5
  $E113:  29 40     AND #$40
  $E115:  F0 11     BEQ $E128
  $E117:  A9 10     LDA #$10
  $E119:  85 E2     STA $E2
  $E11B:  A5 E5     LDA $E5
  $E11D:  29 20     AND #$20
  $E11F:  F0 02     BEQ $E123
  $E121:  06 E2     ASL $E2
  $E123:  A5 E5     LDA $E5
  $E125:  20 EE E2  JSR $E2EE
  $E128:  20 69 E1  JSR $E169
  $E12B:  A5 3C     LDA $3C
  $E12D:  25 E3     AND $E3
  $E12F:  C5 E3     CMP $E3
  $E131:  D0 06     BNE $E139
  $E133:  A5 E4     LDA $E4
  $E135:  29 7F     AND #$7F
  $E137:  85 E4     STA $E4
  $E139:  A5 E4     LDA $E4
  $E13B:  9D 00 70  STA $7000,X
  $E13E:  E8        INX
  $E13F:  E0 1E     CPX #$1E
  $E141:  B0 03     BCS $E146
  $E143:  4C C0 E0  JMP $E0C0
  $E146:  60        RTS
sub_E147:
  $E147:  AD 20 70  LDA $7020
  $E14A:  29 90     AND #$90
  $E14C:  F0 04     BEQ $E152
  $E14E:  A0 00     LDY #$00
  $E150:  F0 65     BEQ $E1B7
  $E152:  A9 08     LDA #$08
  $E154:  85 00     STA $00
  $E156:  A9 07     LDA #$07
  $E158:  85 01     STA $01
  $E15A:  A9 00     LDA #$00
  $E15C:  AA        TAX
  $E15D:  4C 36 E3  JMP $E336

sub_E160:
  $E160:  A5 E4     LDA $E4
  $E162:  29 3C     AND #$3C
  $E164:  85 E2     STA $E2
  $E166:  D0 41     BNE $E1A9
  $E168:  60        RTS
sub_E169:
  $E169:  A5 E4     LDA $E4
  $E16B:  29 3C     AND #$3C
  $E16D:  85 E2     STA $E2
  $E16F:  BD 40 71  LDA $7140,X
  $E172:  29 E0     AND #$E0
  $E174:  C5 46     CMP $46
  $E176:  D0 2D     BNE $E1A5

sub_E178:
  $E178:  BD 20 71  LDA $7120,X
  $E17B:  38        SEC
  $E17C:  E5 EB     SBC $EB
  $E17E:  85 E0     STA $E0
  $E180:  BD C0 6F  LDA $6FC0,X
  $E183:  E5 ED     SBC $ED
  $E185:  85 E1     STA $E1
  $E187:  29 F0     AND #$F0
  $E189:  F0 0E     BEQ $E199
  $E18B:  A5 E1     LDA $E1
  $E18D:  C9 FF     CMP #$FF
  $E18F:  D0 14     BNE $E1A5
  $E191:  A5 E0     LDA $E0
  $E193:  C9 40     CMP #$40
  $E195:  90 0E     BCC $E1A5
  $E197:  B0 3A     BCS $E1D3
  $E199:  A5 E1     LDA $E1
  $E19B:  29 0F     AND #$0F
  $E19D:  C9 0F     CMP #$0F
  $E19F:  90 32     BCC $E1D3
  $E1A1:  A5 E0     LDA $E0
  $E1A3:  F0 2E     BEQ $E1D3
  $E1A5:  A5 E2     LDA $E2
  $E1A7:  F0 28     BEQ $E1D1
  $E1A9:  20 8C C7  JSR $C78C
  $E1AC:  A5 E2     LDA $E2
  $E1AE:  20 BB E4  JSR $E4BB
  $E1B1:  A5 E4     LDA $E4
  $E1B3:  29 C3     AND #$C3
  $E1B5:  85 E4     STA $E4
  $E1B7:  A9 F7     LDA #$F7
  $E1B9:  99 00 02  STA $0200,Y
  $E1BC:  99 04 02  STA $0204,Y
  $E1BF:  99 08 02  STA $0208,Y
  $E1C2:  99 0C 02  STA $020C,Y
  $E1C5:  99 03 02  STA $0203,Y
  $E1C8:  99 07 02  STA $0207,Y
  $E1CB:  99 0B 02  STA $020B,Y
  $E1CE:  99 0F 02  STA $020F,Y
  $E1D1:  18        CLC
  $E1D2:  60        RTS
  $E1D3:  BD 00 71  LDA $7100,X
  $E1D6:  38        SEC
  $E1D7:  E5 EA     SBC $EA
  $E1D9:  85 DE     STA $DE
  $E1DB:  BD A0 6F  LDA $6FA0,X
  $E1DE:  E5 EC     SBC $EC
  $E1E0:  85 DF     STA $DF
  $E1E2:  29 F0     AND #$F0
  $E1E4:  F0 67     BEQ $E24D
  $E1E6:  A5 DF     LDA $DF
  $E1E8:  C9 FF     CMP #$FF
  $E1EA:  D0 B9     BNE $E1A5
  $E1EC:  A5 DE     LDA $DE
  $E1EE:  10 B5     BPL $E1A5
  $E1F0:  85 E6     STA $E6
  $E1F2:  A5 E2     LDA $E2
  $E1F4:  D0 18     BNE $E20E
  $E1F6:  20 5C E4  JSR $E45C
  $E1F9:  85 E2     STA $E2
  $E1FB:  A5 E4     LDA $E4
  $E1FD:  29 C3     AND #$C3
  $E1FF:  05 E2     ORA $E2
  $E201:  85 E4     STA $E4
  $E203:  A5 E2     LDA $E2
  $E205:  20 8C C7  JSR $C78C
  $E208:  20 68 E3  JSR $E368
  $E20B:  4C 11 E2  JMP $E211
  $E20E:  20 8C C7  JSR $C78C
  $E211:  A5 E6     LDA $E6
  $E213:  4A        LSR A
  $E214:  4A        LSR A
  $E215:  4A        LSR A
  $E216:  4A        LSR A
  $E217:  09 F8     ORA #$F8
  $E219:  18        CLC
  $E21A:  69 08     ADC #$08
  $E21C:  99 07 02  STA $0207,Y
  $E21F:  99 0F 02  STA $020F,Y
  $E222:  A5 E0     LDA $E0
  $E224:  46 E1     LSR $E1
  $E226:  6A        ROR A
  $E227:  46 E1     LSR $E1
  $E229:  6A        ROR A
  $E22A:  46 E1     LSR $E1
  $E22C:  6A        ROR A
  $E22D:  46 E1     LSR $E1
  $E22F:  6A        ROR A
  $E230:  38        SEC
  $E231:  ED BC 07  SBC $07BC
  $E234:  99 04 02  STA $0204,Y
  $E237:  18        CLC
  $E238:  69 08     ADC #$08
  $E23A:  99 0C 02  STA $020C,Y
  $E23D:  A9 F7     LDA #$F7
  $E23F:  99 00 02  STA $0200,Y
  $E242:  99 08 02  STA $0208,Y
  $E245:  99 03 02  STA $0203,Y
  $E248:  99 0B 02  STA $020B,Y
  $E24B:  38        SEC
  $E24C:  60        RTS
  $E24D:  A5 E2     LDA $E2
  $E24F:  D0 18     BNE $E269
  $E251:  20 5C E4  JSR $E45C
  $E254:  85 E2     STA $E2
  $E256:  A5 E4     LDA $E4
  $E258:  29 C3     AND #$C3
  $E25A:  05 E2     ORA $E2
  $E25C:  85 E4     STA $E4
  $E25E:  A5 E2     LDA $E2
  $E260:  20 8C C7  JSR $C78C
  $E263:  20 68 E3  JSR $E368
  $E266:  4C 6C E2  JMP $E26C
  $E269:  20 8C C7  JSR $C78C
  $E26C:  A5 DF     LDA $DF
  $E26E:  C9 0F     CMP #$0F
  $E270:  D0 3C     BNE $E2AE
  $E272:  A5 DE     LDA $DE
  $E274:  10 38     BPL $E2AE
  $E276:  4A        LSR A
  $E277:  4A        LSR A
  $E278:  4A        LSR A
  $E279:  4A        LSR A
  $E27A:  18        CLC
  $E27B:  69 F0     ADC #$F0
  $E27D:  99 03 02  STA $0203,Y
  $E280:  99 0B 02  STA $020B,Y
  $E283:  A5 E0     LDA $E0
  $E285:  46 E1     LSR $E1
  $E287:  6A        ROR A
  $E288:  46 E1     LSR $E1
  $E28A:  6A        ROR A
  $E28B:  46 E1     LSR $E1
  $E28D:  6A        ROR A
  $E28E:  46 E1     LSR $E1
  $E290:  6A        ROR A
  $E291:  38        SEC
  $E292:  ED BC 07  SBC $07BC
  $E295:  99 00 02  STA $0200,Y
  $E298:  18        CLC
  $E299:  69 08     ADC #$08
  $E29B:  99 08 02  STA $0208,Y
  $E29E:  A9 F7     LDA #$F7
  $E2A0:  99 04 02  STA $0204,Y
  $E2A3:  99 0C 02  STA $020C,Y
  $E2A6:  99 07 02  STA $0207,Y
  $E2A9:  99 0F 02  STA $020F,Y
  $E2AC:  38        SEC
  $E2AD:  60        RTS
  $E2AE:  A5 DE     LDA $DE
  $E2B0:  46 DF     LSR $DF
  $E2B2:  6A        ROR A
  $E2B3:  46 DF     LSR $DF
  $E2B5:  6A        ROR A
  $E2B6:  46 DF     LSR $DF
  $E2B8:  6A        ROR A
  $E2B9:  46 DF     LSR $DF
  $E2BB:  6A        ROR A
  $E2BC:  99 03 02  STA $0203,Y
  $E2BF:  99 0B 02  STA $020B,Y
  $E2C2:  18        CLC
  $E2C3:  69 08     ADC #$08
  $E2C5:  99 07 02  STA $0207,Y
  $E2C8:  99 0F 02  STA $020F,Y
  $E2CB:  A5 E0     LDA $E0
  $E2CD:  46 E1     LSR $E1
  $E2CF:  6A        ROR A
  $E2D0:  46 E1     LSR $E1
  $E2D2:  6A        ROR A
  $E2D3:  46 E1     LSR $E1
  $E2D5:  6A        ROR A
  $E2D6:  46 E1     LSR $E1
  $E2D8:  6A        ROR A
  $E2D9:  38        SEC
  $E2DA:  ED BC 07  SBC $07BC
  $E2DD:  99 00 02  STA $0200,Y
  $E2E0:  99 04 02  STA $0204,Y
  $E2E3:  18        CLC
  $E2E4:  69 08     ADC #$08
  $E2E6:  99 08 02  STA $0208,Y
  $E2E9:  99 0C 02  STA $020C,Y
  $E2EC:  38        SEC
  $E2ED:  60        RTS
sub_E2EE:
  $E2EE:  29 03     AND #$03
  $E2F0:  D0 0F     BNE $E301
  $E2F2:  BD 20 71  LDA $7120,X
  $E2F5:  38        SEC
  $E2F6:  E5 E2     SBC $E2
  $E2F8:  9D 20 71  STA $7120,X
  $E2FB:  B0 03     BCS $E300
  $E2FD:  DE C0 6F  DEC $6FC0,X
  $E300:  60        RTS
  $E301:  C9 01     CMP #$01
  $E303:  D0 0F     BNE $E314
  $E305:  BD 00 71  LDA $7100,X
  $E308:  18        CLC
  $E309:  65 E2     ADC $E2
  $E30B:  9D 00 71  STA $7100,X
  $E30E:  90 03     BCC $E313
  $E310:  FE A0 6F  INC $6FA0,X
  $E313:  60        RTS
  $E314:  C9 02     CMP #$02
  $E316:  D0 0F     BNE $E327
  $E318:  BD 20 71  LDA $7120,X
  $E31B:  18        CLC
  $E31C:  65 E2     ADC $E2
  $E31E:  9D 20 71  STA $7120,X
  $E321:  90 03     BCC $E326
  $E323:  FE C0 6F  INC $6FC0,X
  $E326:  60        RTS
  $E327:  BD 00 71  LDA $7100,X
  $E32A:  38        SEC
  $E32B:  E5 E2     SBC $E2
  $E32D:  9D 00 71  STA $7100,X
  $E330:  B0 03     BCS $E335
  $E332:  DE A0 6F  DEC $6FA0,X
  $E335:  60        RTS
  $E336:  20 8C C7  JSR $C78C
  $E339:  A5 00     LDA $00
  $E33B:  0A        ASL A
  $E33C:  0A        ASL A
  $E33D:  0A        ASL A
  $E33E:  0A        ASL A
  $E33F:  99 03 02  STA $0203,Y
  $E342:  99 0B 02  STA $020B,Y
  $E345:  18        CLC
  $E346:  69 08     ADC #$08
  $E348:  99 07 02  STA $0207,Y
  $E34B:  99 0F 02  STA $020F,Y
  $E34E:  A5 01     LDA $01
  $E350:  0A        ASL A
  $E351:  0A        ASL A
  $E352:  0A        ASL A
  $E353:  0A        ASL A
  $E354:  38        SEC
  $E355:  ED BC 07  SBC $07BC
  $E358:  99 00 02  STA $0200,Y
  $E35B:  99 04 02  STA $0204,Y
  $E35E:  18        CLC
  $E35F:  69 08     ADC #$08
  $E361:  99 08 02  STA $0208,Y
  $E364:  99 0C 02  STA $020C,Y
  $E367:  60        RTS
sub_E368:
  $E368:  8A        TXA
  $E369:  48        PHA
  $E36A:  98        TYA
  $E36B:  48        PHA
  $E36C:  AD E0 E3  LDA $E3E0
  $E36F:  85 02     STA $02
  $E371:  AD E1 E3  LDA $E3E1
  $E374:  85 03     STA $03
  $E376:  A9 00     LDA #$00
  $E378:  85 00     STA $00
  $E37A:  BD E0 6F  LDA $6FE0,X
  $E37D:  29 0F     AND #$0F
  $E37F:  4A        LSR A
  $E380:  66 00     ROR $00
  $E382:  4A        LSR A
  $E383:  66 00     ROR $00
  $E385:  85 01     STA $01
  $E387:  BD 00 70  LDA $7000,X
  $E38A:  29 03     AND #$03
  $E38C:  0A        ASL A
  $E38D:  0A        ASL A
  $E38E:  0A        ASL A
  $E38F:  0A        ASL A
  $E390:  18        CLC
  $E391:  65 00     ADC $00
  $E393:  85 00     STA $00
  $E395:  A5 01     LDA $01
  $E397:  69 00     ADC #$00
  $E399:  85 01     STA $01
  $E39B:  18        CLC
  $E39C:  A5 00     LDA $00
  $E39E:  65 02     ADC $02
  $E3A0:  85 02     STA $02
  $E3A2:  A5 01     LDA $01
  $E3A4:  65 03     ADC $03
  $E3A6:  85 03     STA $03
  $E3A8:  A0 00     LDY #$00
  $E3AA:  A6 16     LDX rng_temp
  $E3AC:  B1 02     LDA ($02),Y
  $E3AE:  9D 01 02  STA $0201,X
  $E3B1:  C8        INY
  $E3B2:  B1 02     LDA ($02),Y
  $E3B4:  9D 02 02  STA $0202,X
  $E3B7:  C8        INY
  $E3B8:  B1 02     LDA ($02),Y
  $E3BA:  9D 05 02  STA $0205,X
  $E3BD:  C8        INY
  $E3BE:  B1 02     LDA ($02),Y
  $E3C0:  9D 06 02  STA $0206,X
  $E3C3:  C8        INY
  $E3C4:  B1 02     LDA ($02),Y
  $E3C6:  9D 09 02  STA $0209,X
  $E3C9:  C8        INY
  $E3CA:  B1 02     LDA ($02),Y
  $E3CC:  9D 0A 02  STA $020A,X
  $E3CF:  C8        INY
  $E3D0:  B1 02     LDA ($02),Y
  $E3D2:  9D 0D 02  STA $020D,X
  $E3D5:  C8        INY
  $E3D6:  B1 02     LDA ($02),Y
  $E3D8:  9D 0E 02  STA $020E,X
  $E3DB:  68        PLA
  $E3DC:  A8        TAY
  $E3DD:  68        PLA
  $E3DE:  AA        TAX
  $E3DF:  60        RTS
  $E3E0:  00        BRK
  $E3E1:  72        .db $72

sub_E3E2:
  $E3E2:  AD BB 07  LDA $07BB
  $E3E5:  29 7F     AND #$7F
  $E3E7:  8D BB 07  STA $07BB
  $E3EA:  A2 01     LDX #$01
  $E3EC:  BD 20 70  LDA $7020,X
  $E3EF:  C9 FF     CMP #$FF
  $E3F1:  F0 0F     BEQ $E402
  $E3F3:  BD E0 70  LDA $70E0,X
  $E3F6:  29 20     AND #$20
  $E3F8:  F0 03     BEQ $E3FD
  $E3FA:  20 19 E4  JSR $E419
  $E3FD:  E8        INX
  $E3FE:  E0 1E     CPX #$1E
  $E400:  90 EA     BCC $E3EC

sub_E402:
  $E402:  A2 01     LDX #$01
  $E404:  BD 20 70  LDA $7020,X
  $E407:  C9 FF     CMP #$FF
  $E409:  F0 0D     BEQ $E418
  $E40B:  BD E0 70  LDA $70E0,X
  $E40E:  29 DF     AND #$DF
  $E410:  9D E0 70  STA $70E0,X
  $E413:  E8        INX
  $E414:  E0 1E     CPX #$1E
  $E416:  90 EC     BCC $E404
  $E418:  60        RTS
sub_E419:
  $E419:  A0 01     LDY #$01
  $E41B:  B9 20 70  LDA $7020,Y
  $E41E:  C9 FF     CMP #$FF
  $E420:  F0 13     BEQ $E435
  $E422:  B9 E0 70  LDA $70E0,Y
  $E425:  29 20     AND #$20
  $E427:  D0 07     BNE $E430
  $E429:  B9 00 70  LDA $7000,Y
  $E42C:  29 3C     AND #$3C
  $E42E:  D0 0A     BNE $E43A
  $E430:  C8        INY
  $E431:  C0 1E     CPY #$1E
  $E433:  90 E6     BCC $E41B
  $E435:  68        PLA
  $E436:  68        PLA
  $E437:  4C 02 E4  JMP $E402
  $E43A:  20 BB E4  JSR $E4BB
  $E43D:  B9 00 70  LDA $7000,Y
  $E440:  29 C3     AND #$C3
  $E442:  99 00 70  STA $7000,Y
  $E445:  BD 00 70  LDA $7000,X
  $E448:  85 E4     STA $E4
  $E44A:  A9 00     LDA #$00
  $E44C:  85 E2     STA $E2
  $E44E:  20 78 E1  JSR $E178
  $E451:  90 03     BCC $E456
  $E453:  20 68 E3  JSR $E368
  $E456:  A5 E4     LDA $E4
  $E458:  9D 00 70  STA $7000,X
  $E45B:  60        RTS
sub_E45C:
  $E45C:  A5 61     LDA $61
  $E45E:  C9 FF     CMP #$FF
  $E460:  F0 1F     BEQ $E481
  $E462:  A9 02     LDA #$02
  $E464:  85 01     STA $01
  $E466:  A9 01     LDA #$01
  $E468:  85 00     STA $00
  $E46A:  A5 61     LDA $61
  $E46C:  4A        LSR A
  $E46D:  4A        LSR A
  $E46E:  90 06     BCC $E476
  $E470:  06 01     ASL $01
  $E472:  E6 00     INC $00
  $E474:  D0 F7     BNE $E46D
  $E476:  A5 61     LDA $61
  $E478:  05 01     ORA $01
  $E47A:  85 61     STA $61
  $E47C:  A5 00     LDA $00
  $E47E:  0A        ASL A
  $E47F:  0A        ASL A
  $E480:  60        RTS
  $E481:  A5 62     LDA $62
  $E483:  C9 FF     CMP #$FF
  $E485:  F0 21     BEQ $E4A8
  $E487:  A9 01     LDA #$01
  $E489:  85 01     STA $01
  $E48B:  A9 00     LDA #$00
  $E48D:  85 00     STA $00
  $E48F:  A5 62     LDA $62
  $E491:  4A        LSR A
  $E492:  90 06     BCC $E49A
  $E494:  06 01     ASL $01
  $E496:  E6 00     INC $00
  $E498:  D0 F7     BNE $E491
  $E49A:  A5 62     LDA $62
  $E49C:  05 01     ORA $01
  $E49E:  85 62     STA $62
  $E4A0:  A5 00     LDA $00
  $E4A2:  0A        ASL A
  $E4A3:  0A        ASL A
  $E4A4:  18        CLC
  $E4A5:  69 20     ADC #$20
  $E4A7:  60        RTS
  $E4A8:  AD BB 07  LDA $07BB
  $E4AB:  09 80     ORA #$80
  $E4AD:  8D BB 07  STA $07BB
  $E4B0:  BD E0 70  LDA $70E0,X
  $E4B3:  09 20     ORA #$20
  $E4B5:  9D E0 70  STA $70E0,X
  $E4B8:  68        PLA
  $E4B9:  68        PLA
  $E4BA:  60        RTS
sub_E4BB:
  $E4BB:  85 00     STA $00
  $E4BD:  C9 20     CMP #$20
  $E4BF:  B0 1B     BCS $E4DC
  $E4C1:  A9 02     LDA #$02
  $E4C3:  85 01     STA $01
  $E4C5:  A5 00     LDA $00
  $E4C7:  C9 04     CMP #$04
  $E4C9:  F0 08     BEQ $E4D3
  $E4CB:  06 01     ASL $01
  $E4CD:  38        SEC
  $E4CE:  E9 04     SBC #$04
  $E4D0:  4C C7 E4  JMP $E4C7
  $E4D3:  A5 01     LDA $01
  $E4D5:  49 FF     EOR #$FF
  $E4D7:  25 61     AND $61
  $E4D9:  85 61     STA $61
  $E4DB:  60        RTS
  $E4DC:  A9 01     LDA #$01
  $E4DE:  85 01     STA $01
  $E4E0:  A5 00     LDA $00
  $E4E2:  C9 20     CMP #$20
  $E4E4:  F0 07     BEQ $E4ED
  $E4E6:  06 01     ASL $01
  $E4E8:  38        SEC
  $E4E9:  E9 04     SBC #$04
  $E4EB:  D0 F5     BNE $E4E2
  $E4ED:  A5 01     LDA $01
  $E4EF:  49 FF     EOR #$FF
  $E4F1:  25 62     AND $62
  $E4F3:  85 62     STA $62
  $E4F5:  60        RTS
sub_E4F6:
  $E4F6:  A2 00     LDX #$00
  $E4F8:  A9 F7     LDA #$F7
  $E4FA:  9D 00 02  STA $0200,X
  $E4FD:  E8        INX
  $E4FE:  D0 FA     BNE $E4FA
  $E500:  60        RTS
  $E501:  A9 00     LDA #$00
  $E503:  85 61     STA $61
  $E505:  85 62     STA $62
  $E507:  A5 41     LDA $41
  $E509:  10 05     BPL $E510
  $E50B:  A9 05     LDA #$05
  $E50D:  4C 12 E5  JMP $E512
  $E510:  A9 01     LDA #$01
  $E512:  8D BC 07  STA $07BC
  $E515:  A2 00     LDX #$00
  $E517:  BD 20 70  LDA $7020,X
  $E51A:  C9 FF     CMP #$FF
  $E51C:  F0 0D     BEQ $E52B
  $E51E:  BD 00 70  LDA $7000,X
  $E521:  29 C3     AND #$C3
  $E523:  9D 00 70  STA $7000,X
  $E526:  E8        INX
  $E527:  E0 1E     CPX #$1E
  $E529:  90 EC     BCC $E517
  $E52B:  60        RTS
  $E52C:  A5 1A     LDA $1A
  $E52E:  D0 0E     BNE $E53E
  $E530:  A5 FD     LDA $FD
  $E532:  C9 7F     CMP #$7F
  $E534:  A5 FE     LDA $FE
  $E536:  E9 96     SBC #$96
  $E538:  A5 FF     LDA $FF
  $E53A:  E9 98     SBC #$98
  $E53C:  90 0C     BCC $E54A
  $E53E:  A9 7F     LDA #$7F
  $E540:  85 FD     STA $FD
  $E542:  A9 96     LDA #$96
  $E544:  85 FE     STA $FE
  $E546:  A9 98     LDA #$98
  $E548:  85 FF     STA $FF
  $E54A:  60        RTS
  $E54B:  08        PHP
  $E54C:  8D CA 07  STA $07CA
  $E54F:  AD 5F E5  LDA $E55F
  $E552:  8D DC 6C  STA $6CDC
  $E555:  AD 60 E5  LDA $E560
  $E558:  8D DD 6C  STA $6CDD
  $E55B:  28        PLP
  $E55C:  4C AD 6C  JMP $6CAD
  $E55F:  4B        .db $4B
  $E560:  E5 08     SBC $08
  $E562:  8D CA 07  STA $07CA
  $E565:  AD 75 E5  LDA $E575
  $E568:  8D DC 6C  STA $6CDC
  $E56B:  AD 76 E5  LDA $E576
  $E56E:  8D DD 6C  STA $6CDD
  $E571:  28        PLP
  $E572:  4C AD 6C  JMP $6CAD
  $E575:  44        .db $44
  $E576:  E9 08     SBC #$08
  $E578:  8D CA 07  STA $07CA
  $E57B:  AD 8B E5  LDA $E58B
  $E57E:  8D DC 6C  STA $6CDC
  $E581:  AD 8C E5  LDA $E58C
  $E584:  8D DD 6C  STA $6CDD
  $E587:  28        PLP
  $E588:  4C AD 6C  JMP $6CAD
  $E58B:  CE E9 08  DEC $08E9
  $E58E:  8D CA 07  STA $07CA
  $E591:  AD A1 E5  LDA $E5A1
  $E594:  8D DC 6C  STA $6CDC
  $E597:  AD A2 E5  LDA $E5A2
  $E59A:  8D DD 6C  STA $6CDD
  $E59D:  28        PLP
  $E59E:  4C AD 6C  JMP $6CAD
  $E5A1:  AB        .db $AB
  $E5A2:  F1 08     SBC ($08),Y
  $E5A4:  8D CA 07  STA $07CA
  $E5A7:  AD B7 E5  LDA $E5B7
  $E5AA:  8D DC 6C  STA $6CDC
  $E5AD:  AD B8 E5  LDA $E5B8
  $E5B0:  8D DD 6C  STA $6CDD
  $E5B3:  28        PLP
  $E5B4:  4C AD 6C  JMP $6CAD
  $E5B7:  DB        .db $DB
  $E5B8:  EF        .db $EF
  $E5B9:  08        PHP
  $E5BA:  8D CA 07  STA $07CA
  $E5BD:  AD CD E5  LDA $E5CD
  $E5C0:  8D DC 6C  STA $6CDC
  $E5C3:  AD CE E5  LDA $E5CE
  $E5C6:  8D DD 6C  STA $6CDD
  $E5C9:  28        PLP
  $E5CA:  4C AD 6C  JMP $6CAD
  $E5CD:  D7        .db $D7
  $E5CE:  EF        .db $EF
  $E5CF:  08        PHP
  $E5D0:  8D CA 07  STA $07CA
  $E5D3:  AD E3 E5  LDA $E5E3
  $E5D6:  8D DC 6C  STA $6CDC
  $E5D9:  AD E4 E5  LDA $E5E4
  $E5DC:  8D DD 6C  STA $6CDD
  $E5DF:  28        PLP
  $E5E0:  4C AD 6C  JMP $6CAD
  $E5E3:  FA        .db $FA
  $E5E4:  F1 08     SBC ($08),Y
  $E5E6:  8D CA 07  STA $07CA
  $E5E9:  AD F9 E5  LDA $E5F9
  $E5EC:  8D DC 6C  STA $6CDC
  $E5EF:  AD FA E5  LDA $E5FA
  $E5F2:  8D DD 6C  STA $6CDD
  $E5F5:  28        PLP
  $E5F6:  4C AD 6C  JMP $6CAD
  $E5F9:  23        .db $23
  $E5FA:  F2        .db $F2
  $E5FB:  08        PHP
  $E5FC:  8D CA 07  STA $07CA
  $E5FF:  AD 15 E6  LDA $E615
  $E602:  8D DC 6C  STA $6CDC
  $E605:  AD 16 E6  LDA $E616
  $E608:  8D DD 6C  STA $6CDD
  $E60B:  28        PLP
  $E60C:  20 AD 6C  JSR $6CAD
  $E60F:  A9 1D     LDA #$1D
  $E611:  20 91 FF  JSR bank_switch
  $E614:  60        RTS
  $E615:  AB        .db $AB
  $E616:  F4        .db $F4
  $E617:  08        PHP
  $E618:  8D CA 07  STA $07CA
  $E61B:  AD 2B E6  LDA $E62B
  $E61E:  8D DC 6C  STA $6CDC
  $E621:  AD 2C E6  LDA $E62C
  $E624:  8D DD 6C  STA $6CDD
  $E627:  28        PLP
  $E628:  4C AD 6C  JMP $6CAD
  $E62B:  8A        TXA
  $E62C:  F5 08     SBC $08,X
  $E62E:  8D CA 07  STA $07CA
  $E631:  AD 41 E6  LDA $E641
  $E634:  8D DC 6C  STA $6CDC
  $E637:  AD 42 E6  LDA $E642
  $E63A:  8D DD 6C  STA $6CDD
  $E63D:  28        PLP
  $E63E:  4C AD 6C  JMP $6CAD
  $E641:  8B        .db $8B
  $E642:  F5 08     SBC $08,X
  $E644:  8D CA 07  STA $07CA
  $E647:  AD 57 E6  LDA $E657
  $E64A:  8D DC 6C  STA $6CDC
  $E64D:  AD 58 E6  LDA $E658
  $E650:  8D DD 6C  STA $6CDD
  $E653:  28        PLP
  $E654:  4C AD 6C  JMP $6CAD
  $E657:  BE FA 08  LDX $08FA,Y
  $E65A:  8D CA 07  STA $07CA
  $E65D:  AD 6D E6  LDA $E66D
  $E660:  8D DC 6C  STA $6CDC
  $E663:  AD 6E E6  LDA $E66E
  $E666:  8D DD 6C  STA $6CDD
  $E669:  28        PLP
  $E66A:  4C AD 6C  JMP $6CAD
  $E66D:  BE FA A5  LDX $A5FA,Y
  $E670:  3F        .db $3F
  $E671:  18        CLC
  $E672:  65 49     ADC $49
  $E674:  85 49     STA $49
  $E676:  90 02     BCC $E67A
  $E678:  E6 4A     INC $4A
  $E67A:  60        RTS
  $E67B:  A5 49     LDA $49
  $E67D:  38        SEC
  $E67E:  E5 3F     SBC $3F
  $E680:  85 49     STA $49
  $E682:  B0 F6     BCS $E67A
  $E684:  C6 4A     DEC $4A
  $E686:  60        RTS
  $E687:  A5 BF     LDA $BF
  $E689:  29 01     AND #$01
  $E68B:  D0 01     BNE $E68E
  $E68D:  60        RTS
  $E68E:  A9 19     LDA #$19
  $E690:  8D 86 6E  STA $6E86
  $E693:  20 94 FF  JSR $FF94
  $E696:  A9 00     LDA #$00
  $E698:  85 B4     STA $B4
  $E69A:  A5 B0     LDA $B0
  $E69C:  29 DF     AND #$DF
  $E69E:  85 B0     STA $B0
  $E6A0:  AD 21 06  LDA $0621
  $E6A3:  0D 23 06  ORA $0623
  $E6A6:  0D 25 06  ORA $0625
  $E6A9:  0D 27 06  ORA $0627
  $E6AC:  D0 04     BNE $E6B2
  $E6AE:  A9 20     LDA #$20
  $E6B0:  85 B0     STA $B0
  $E6B2:  A0 04     LDY #$04
  $E6B4:  A2 08     LDX #$08
  $E6B6:  20 7C E7  JSR $E77C
  $E6B9:  A0 04     LDY #$04
  $E6BB:  A2 08     LDX #$08
  $E6BD:  20 39 E7  JSR $E739
  $E6C0:  A5 BD     LDA $BD
  $E6C2:  18        CLC
  $E6C3:  65 BC     ADC $BC
  $E6C5:  85 BD     STA $BD
  $E6C7:  90 2F     BCC $E6F8
  $E6C9:  E9 96     SBC #$96
  $E6CB:  85 BD     STA $BD
  $E6CD:  20 E3 F0  JSR $F0E3
  $E6D0:  A0 00     LDY #$00
  $E6D2:  A2 00     LDX #$00
  $E6D4:  20 7C E7  JSR $E77C
  $E6D7:  A0 01     LDY #$01
  $E6D9:  A2 02     LDX #$02
  $E6DB:  20 7C E7  JSR $E77C
  $E6DE:  A0 02     LDY #$02
  $E6E0:  A2 04     LDX #$04
  $E6E2:  20 7C E7  JSR $E77C
  $E6E5:  20 F6 F0  JSR $F0F6
  $E6E8:  A0 03     LDY #$03
  $E6EA:  A2 06     LDX #$06
  $E6EC:  20 7C E7  JSR $E77C
  $E6EF:  20 E2 EE  JSR $EEE2
  $E6F2:  A5 BD     LDA $BD
  $E6F4:  C9 6A     CMP #$6A
  $E6F6:  90 D1     BCC $E6C9
  $E6F8:  A0 00     LDY #$00
  $E6FA:  A2 00     LDX #$00
  $E6FC:  20 39 E7  JSR $E739
  $E6FF:  A0 01     LDY #$01
  $E701:  A2 02     LDX #$02
  $E703:  20 39 E7  JSR $E739
  $E706:  A0 02     LDY #$02
  $E708:  A2 04     LDX #$04
  $E70A:  20 39 E7  JSR $E739
  $E70D:  A0 03     LDY #$03
  $E70F:  A2 06     LDX #$06
  $E711:  20 39 E7  JSR $E739
  $E714:  AD 47 06  LDA $0647
  $E717:  C9 FF     CMP #$FF
  $E719:  D0 0B     BNE $E726
  $E71B:  A5 BB     LDA $BB
  $E71D:  29 20     AND #$20
  $E71F:  F0 05     BEQ $E726
  $E721:  A9 B0     LDA #$B0
  $E723:  8D 04 40  STA $4004
  $E726:  AD 49 06  LDA $0649
  $E729:  C9 FF     CMP #$FF
  $E72B:  D0 0B     BNE $E738
  $E72D:  A5 BB     LDA $BB
  $E72F:  29 20     AND #$20
  $E731:  D0 05     BNE $E738
  $E733:  A9 30     LDA #$30
  $E735:  8D 0C 40  STA $400C
  $E738:  60        RTS
sub_E739:
  $E739:  BD 20 06  LDA $0620,X
  $E73C:  F0 32     BEQ $E770
  $E73E:  C0 03     CPY #$03
  $E740:  D0 06     BNE $E748
  $E742:  A5 BB     LDA $BB
  $E744:  29 20     AND #$20
  $E746:  D0 28     BNE $E770
  $E748:  C0 01     CPY #$01
  $E74A:  D0 0B     BNE $E757
  $E74C:  A5 BB     LDA $BB
  $E74E:  29 20     AND #$20
  $E750:  D0 05     BNE $E757
  $E752:  AD 28 06  LDA $0628
  $E755:  D0 19     BNE $E770
  $E757:  20 FC EA  JSR $EAFC
  $E75A:  20 69 ED  JSR $ED69
  $E75D:  A4 A4     LDY $A4
  $E75F:  A5 B4     LDA $B4
  $E761:  39 F1 EA  AND $EAF1,Y
  $E764:  F0 0A     BEQ $E770
  $E766:  A9 0F     LDA #$0F
  $E768:  8D 15 40  STA $4015
  $E76B:  A6 A4     LDX $A4
  $E76D:  BC 7F EC  LDY $EC7F,X
  $E770:  60        RTS
sub_E771:
  $E771:  A6 A5     LDX $A5
  $E773:  A1 A6     LDA ($A6,X)
  $E775:  F6 A6     INC $A6,X
  $E777:  D0 02     BNE $E77B
  $E779:  F6 A7     INC $A7,X
  $E77B:  60        RTS
sub_E77C:
  $E77C:  84 A4     STY $A4
  $E77E:  86 A5     STX $A5
  $E780:  BD 20 06  LDA $0620,X
  $E783:  F0 F6     BEQ $E77B
  $E785:  BD 2A 06  LDA $062A,X
  $E788:  F0 31     BEQ $E7BB
  $E78A:  BD 2B 06  LDA $062B,X
  $E78D:  F0 2C     BEQ $E7BB
  $E78F:  DE 2B 06  DEC $062B,X
  $E792:  D0 27     BNE $E7BB
  $E794:  E0 04     CPX #$04
  $E796:  B0 23     BCS $E7BB
  $E798:  B9 FA 6B  LDA $6BFA,Y
  $E79B:  C9 FF     CMP #$FF
  $E79D:  D0 1C     BNE $E7BB
  $E79F:  20 F6 F0  JSR $F0F6
  $E7A2:  BC 3D 06  LDY $063D,X
  $E7A5:  B9 37 83  LDA $8337,Y
  $E7A8:  85 A0     STA $A0
  $E7AA:  B9 38 83  LDA $8338,Y
  $E7AD:  85 A1     STA $A1
  $E7AF:  A0 01     LDY #$01
  $E7B1:  B1 A0     LDA ($A0),Y
  $E7B3:  9D 3C 06  STA $063C,X
  $E7B6:  A4 A4     LDY $A4
  $E7B8:  20 E3 F0  JSR $F0E3
  $E7BB:  DE 21 06  DEC $0621,X
  $E7BE:  D0 51     BNE $E811
  $E7C0:  C0 01     CPY #$01
  $E7C2:  D0 0B     BNE $E7CF
  $E7C4:  A5 BB     LDA $BB
  $E7C6:  29 20     AND #$20
  $E7C8:  D0 05     BNE $E7CF
  $E7CA:  AD 28 06  LDA $0628
  $E7CD:  D0 0D     BNE $E7DC
  $E7CF:  B9 EF E7  LDA $E7EF,Y
  $E7D2:  30 08     BMI $E7DC
  $E7D4:  AA        TAX
  $E7D5:  A9 88     LDA #$88
  $E7D7:  9D 01 40  STA $4001,X
  $E7DA:  A6 A5     LDX $A5
  $E7DC:  20 71 E7  JSR $E771
  $E7DF:  A4 A4     LDY $A4
  $E7E1:  C9 E1     CMP #$E1
  $E7E3:  F0 07     BEQ $E7EC
  $E7E5:  C9 E8     CMP #$E8
  $E7E7:  B0 0B     BCS $E7F4
  $E7E9:  4C AA E9  JMP $E9AA
  $E7EC:  4C 9C E9  JMP $E99C
  $E7EF:  00        BRK
  $E7F0:  04        .db $04
  $E7F1:  FF        .db $FF
  $E7F2:  FF        .db $FF
  $E7F3:  FF        .db $FF
  $E7F4:  48        PHA
  $E7F5:  48        PHA
  $E7F6:  48        PHA
  $E7F7:  BA        TSX
  $E7F8:  BD 02 01  LDA $0102,X
  $E7FB:  49 FF     EOR #$FF
  $E7FD:  0A        ASL A
  $E7FE:  A8        TAY
  $E7FF:  B9 12 E8  LDA $E812,Y
  $E802:  9D 02 01  STA $0102,X
  $E805:  C8        INY
  $E806:  B9 12 E8  LDA $E812,Y
  $E809:  9D 03 01  STA $0103,X
  $E80C:  68        PLA
  $E80D:  A6 A5     LDX $A5
  $E80F:  A4 A4     LDY $A4
  $E811:  60        RTS
  $E812:  67        .db $67
  $E813:  E9 6F     SBC #$6F
  $E815:  E9 8E     SBC #$8E
  $E817:  E9 8C     SBC #$8C
  $E819:  E8        INX
  $E81A:  40        RTI
  $E81B:  E9 FF     SBC #$FF
  $E81D:  E8        INX
  $E81E:  F5 E8     SBC $E8,X
  $E820:  5D E9 53  EOR $53E9,X
  $E823:  E9 D7     SBC #$D7
  $E825:  E8        INX
  $E826:  E9 E8     SBC #$E8
  $E828:  EF        .db $EF
  $E829:  E8        INX
  $E82A:  41 E8     EOR ($E8,X)
  $E82C:  AD E8 99  LDA $99E8
  $E82F:  E8        INX
  $E830:  B9 E8 50  LDA $50E8,Y
  $E833:  F0 2C     BEQ $E861
  $E835:  E9 83     SBC #$83
  $E837:  E8        INX
  $E838:  55 E8     EOR $E8,X
  $E83A:  7D E8 59  ADC $59E8,X
  $E83D:  E8        INX
  $E83E:  68        PLA
  $E83F:  E8        INX
  $E840:  49 E9     EOR #$E9
  $E842:  20 71 E7  JSR $E771
  $E845:  9D 03 6C  STA $6C03,X
  $E848:  20 71 E7  JSR $E771
  $E84B:  9D 04 6C  STA $6C04,X
  $E84E:  A9 00     LDA #$00
  $E850:  99 09 6C  STA $6C09,Y
  $E853:  4C DC E7  JMP $E7DC
  $E856:  A9 FF     LDA #$FF
  $E858:  30 F6     BMI $E850
  $E85A:  B9 B1 00  LDA $00B1,Y
  $E85D:  18        CLC
  $E85E:  69 10     ADC #$10
  $E860:  AA        TAX
  $E861:  B0 03     BCS $E866
  $E863:  99 B1 00  STA $00B1,Y
  $E866:  4C DC E7  JMP $E7DC
  $E869:  B9 B1 00  LDA $00B1,Y
  $E86C:  AA        TAX
  $E86D:  38        SEC
  $E86E:  E9 10     SBC #$10
  $E870:  99 B1 00  STA $00B1,Y
  $E873:  29 F0     AND #$F0
  $E875:  D0 EF     BNE $E866
  $E877:  8A        TXA
  $E878:  99 B1 00  STA $00B1,Y
  $E87B:  4C DC E7  JMP $E7DC
  $E87E:  EE F9 6B  INC $6BF9
  $E881:  4C DC E7  JMP $E7DC
  $E884:  20 71 E7  JSR $E771
  $E887:  99 FA 6B  STA $6BFA,Y
  $E88A:  4C DC E7  JMP $E7DC
  $E88D:  20 93 E8  JSR $E893
  $E890:  4C DC E7  JMP $E7DC

sub_E893:
  $E893:  A9 20     LDA #$20
  $E895:  05 B0     ORA $B0
  $E897:  85 B0     STA $B0
  $E899:  60        RTS
  $E89A:  20 71 E7  JSR $E771
  $E89D:  29 0F     AND #$0F
  $E89F:  85 10     STA $10
  $E8A1:  B9 B1 00  LDA $00B1,Y
  $E8A4:  29 F0     AND #$F0
  $E8A6:  05 10     ORA $10
  $E8A8:  99 B1 00  STA $00B1,Y
  $E8AB:  4C DC E7  JMP $E7DC
  $E8AE:  20 71 E7  JSR $E771
  $E8B1:  BE 7F EC  LDX $EC7F,Y
  $E8B4:  9D 01 40  STA $4001,X
  $E8B7:  4C DC E7  JMP $E7DC
  $E8BA:  20 71 E7  JSR $E771
  $E8BD:  85 10     STA $10
  $E8BF:  29 01     AND #$01
  $E8C1:  D0 0D     BNE $E8D0
  $E8C3:  A5 10     LDA $10
  $E8C5:  99 B5 00  STA $00B5,Y
  $E8C8:  A9 00     LDA #$00
  $E8CA:  99 B8 00  STA $00B8,Y
  $E8CD:  4C DC E7  JMP $E7DC
  $E8D0:  A9 FF     LDA #$FF
  $E8D2:  99 B5 00  STA $00B5,Y
  $E8D5:  4C DC E7  JMP $E7DC
  $E8D8:  A5 B0     LDA $B0
  $E8DA:  29 F0     AND #$F0
  $E8DC:  85 10     STA $10
  $E8DE:  20 71 E7  JSR $E771
  $E8E1:  29 0F     AND #$0F
  $E8E3:  05 10     ORA $10
  $E8E5:  85 B0     STA $B0
  $E8E7:  4C DC E7  JMP $E7DC
  $E8EA:  20 B9 EE  JSR $EEB9
  $E8ED:  4C DC E7  JMP $E7DC
  $E8F0:  20 C6 EE  JSR $EEC6
  $E8F3:  4C DC E7  JMP $E7DC
  $E8F6:  B9 4B 06  LDA $064B,Y
  $E8F9:  08        PHP
  $E8FA:  A9 02     LDA #$02
  $E8FC:  28        PLP
  $E8FD:  4C 08 E9  JMP $E908
  $E900:  B9 4B 06  LDA $064B,Y
  $E903:  08        PHP
  $E904:  20 71 E7  JSR $E771
  $E907:  28        PLP
  $E908:  D0 03     BNE $E90D
  $E90A:  99 4B 06  STA $064B,Y
  $E90D:  B9 4B 06  LDA $064B,Y
  $E910:  38        SEC
  $E911:  E9 01     SBC #$01
  $E913:  99 4B 06  STA $064B,Y
  $E916:  F0 0F     BEQ $E927
  $E918:  20 71 E7  JSR $E771
  $E91B:  18        CLC
  $E91C:  75 A6     ADC $A6,X
  $E91E:  95 A6     STA $A6,X
  $E920:  B0 02     BCS $E924
  $E922:  D6 A7     DEC $A7,X
  $E924:  4C DC E7  JMP $E7DC
  $E927:  20 71 E7  JSR $E771
  $E92A:  4C DC E7  JMP $E7DC
  $E92D:  B9 B1 00  LDA $00B1,Y
  $E930:  29 0F     AND #$0F
  $E932:  85 10     STA $10
  $E934:  20 71 E7  JSR $E771
  $E937:  29 F0     AND #$F0
  $E939:  05 10     ORA $10
  $E93B:  99 B1 00  STA $00B1,Y
  $E93E:  4C DC E7  JMP $E7DC
  $E941:  20 71 E7  JSR $E771
  $E944:  9D FE 6B  STA $6BFE,X
  $E947:  4C DC E7  JMP $E7DC
  $E94A:  20 71 E7  JSR $E771
  $E94D:  18        CLC
  $E94E:  7D FE 6B  ADC $6BFE,X
  $E951:  4C 44 E9  JMP $E944
  $E954:  B9 F0 EA  LDA $EAF0,Y
  $E957:  05 B0     ORA $B0
  $E959:  85 B0     STA $B0
  $E95B:  4C DC E7  JMP $E7DC
  $E95E:  B9 F6 EA  LDA $EAF6,Y
  $E961:  25 B0     AND $B0
  $E963:  85 B0     STA $B0
  $E965:  4C DC E7  JMP $E7DC
  $E968:  20 71 E7  JSR $E771
  $E96B:  85 BC     STA $BC
  $E96D:  4C DC E7  JMP $E7DC
  $E970:  20 71 E7  JSR $E771
  $E973:  48        PHA
  $E974:  20 71 E7  JSR $E771
  $E977:  C0 04     CPY #$04
  $E979:  F0 0C     BEQ $E987
  $E97B:  48        PHA
  $E97C:  B5 A6     LDA $A6,X
  $E97E:  9D 34 06  STA $0634,X
  $E981:  B5 A7     LDA $A7,X
  $E983:  9D 35 06  STA $0635,X
  $E986:  68        PLA
  $E987:  95 A7     STA $A7,X
  $E989:  68        PLA
  $E98A:  95 A6     STA $A6,X
  $E98C:  4C DC E7  JMP $E7DC
  $E98F:  BD 34 06  LDA $0634,X
  $E992:  95 A6     STA $A6,X
  $E994:  BD 35 06  LDA $0635,X
  $E997:  95 A7     STA $A7,X
  $E999:  4C DC E7  JMP $E7DC
  $E99C:  20 71 E7  JSR $E771
  $E99F:  9D 3D 06  STA $063D,X
  $E9A2:  A9 00     LDA #$00
  $E9A4:  9D 3C 06  STA $063C,X
  $E9A7:  4C DC E7  JMP $E7DC
  $E9AA:  48        PHA
  $E9AB:  38        SEC
  $E9AC:  E9 4B     SBC #$4B
  $E9AE:  B0 FC     BCS $E9AC
  $E9B0:  69 4B     ADC #$4B
  $E9B2:  85 A2     STA $A2
  $E9B4:  C9 4A     CMP #$4A
  $E9B6:  F0 10     BEQ $E9C8
  $E9B8:  C9 49     CMP #$49
  $E9BA:  D0 07     BNE $E9C3
  $E9BC:  A9 FF     LDA #$FF
  $E9BE:  99 46 06  STA $0646,Y
  $E9C1:  D0 05     BNE $E9C8
  $E9C3:  A4 A4     LDY $A4
  $E9C5:  99 46 06  STA $0646,Y
  $E9C8:  C0 03     CPY #$03
  $E9CA:  B0 3C     BCS $EA08
  $E9CC:  B9 F0 EA  LDA $EAF0,Y
  $E9CF:  25 B0     AND $B0
  $E9D1:  F0 0C     BEQ $E9DF
  $E9D3:  BD 1E 06  LDA $061E,X
  $E9D6:  9D 20 06  STA $0620,X
  $E9D9:  BD 28 06  LDA $0628,X
  $E9DC:  9D 2A 06  STA $062A,X
  $E9DF:  B9 09 6C  LDA $6C09,Y
  $E9E2:  30 24     BMI $EA08
  $E9E4:  BD 03 6C  LDA $6C03,X
  $E9E7:  85 10     STA $10
  $E9E9:  BD 04 6C  LDA $6C04,X
  $E9EC:  85 11     STA $11
  $E9EE:  B9 09 6C  LDA $6C09,Y
  $E9F1:  A8        TAY
  $E9F2:  B1 10     LDA ($10),Y
  $E9F4:  F0 FB     BEQ $E9F1
  $E9F6:  9D 20 06  STA $0620,X
  $E9F9:  C8        INY
  $E9FA:  B1 10     LDA ($10),Y
  $E9FC:  30 03     BMI $EA01
  $E9FE:  9D 2A 06  STA $062A,X
  $EA01:  C8        INY
  $EA02:  98        TYA
  $EA03:  A4 A4     LDY $A4
  $EA05:  99 09 6C  STA $6C09,Y
  $EA08:  68        PLA
  $EA09:  C9 96     CMP #$96
  $EA0B:  90 09     BCC $EA16
  $EA0D:  20 71 E7  JSR $E771
  $EA10:  9D 2A 06  STA $062A,X
  $EA13:  4C 47 EA  JMP $EA47
  $EA16:  C9 4B     CMP #$4B
  $EA18:  90 2D     BCC $EA47
  $EA1A:  20 71 E7  JSR $E771
  $EA1D:  48        PHA
  $EA1E:  29 7F     AND #$7F
  $EA20:  9D 20 06  STA $0620,X
  $EA23:  D0 17     BNE $EA3C
  $EA25:  E0 08     CPX #$08
  $EA27:  D0 13     BNE $EA3C
  $EA29:  A2 02     LDX #$02
  $EA2B:  A0 01     LDY #$01
  $EA2D:  84 A4     STY $A4
  $EA2F:  86 A5     STX $A5
  $EA31:  20 59 EC  JSR $EC59
  $EA34:  A2 08     LDX #$08
  $EA36:  A0 04     LDY #$04
  $EA38:  84 A4     STY $A4
  $EA3A:  86 A5     STX $A5
  $EA3C:  68        PLA
  $EA3D:  29 FF     AND #$FF
  $EA3F:  10 06     BPL $EA47
  $EA41:  20 71 E7  JSR $E771
  $EA44:  9D 2A 06  STA $062A,X
  $EA47:  BD 3C 06  LDA $063C,X
  $EA4A:  C9 FF     CMP #$FF
  $EA4C:  F0 10     BEQ $EA5E
  $EA4E:  A5 A2     LDA $A2
  $EA50:  C9 4A     CMP #$4A
  $EA52:  F0 0A     BEQ $EA5E
  $EA54:  BD 2A 06  LDA $062A,X
  $EA57:  30 05     BMI $EA5E
  $EA59:  A9 00     LDA #$00
  $EA5B:  9D 3C 06  STA $063C,X
  $EA5E:  C0 03     CPY #$03
  $EA60:  B0 05     BCS $EA67
  $EA62:  A9 00     LDA #$00
  $EA64:  9D FD 6B  STA $6BFD,X
  $EA67:  BD 20 06  LDA $0620,X
  $EA6A:  9D 21 06  STA $0621,X
  $EA6D:  BD 2A 06  LDA $062A,X
  $EA70:  48        PHA
  $EA71:  AD A2 00  LDA $00A2
  $EA74:  C9 4A     CMP #$4A
  $EA76:  D0 08     BNE $EA80
  $EA78:  68        PLA
  $EA79:  BD 2B 06  LDA $062B,X
  $EA7C:  48        PHA
  $EA7D:  4C 8C EA  JMP $EA8C
  $EA80:  C0 03     CPY #$03
  $EA82:  B0 08     BCS $EA8C
  $EA84:  A9 00     LDA #$00
  $EA86:  99 B8 00  STA $00B8,Y
  $EA89:  9D FD 6B  STA $6BFD,X
  $EA8C:  68        PLA
  $EA8D:  29 7F     AND #$7F
  $EA8F:  C0 02     CPY #$02
  $EA91:  D0 27     BNE $EABA
  $EA93:  29 FF     AND #$FF
  $EA95:  D0 02     BNE $EA99
  $EA97:  A9 0F     LDA #$0F
  $EA99:  85 11     STA $11
  $EA9B:  A5 B0     LDA $B0
  $EA9D:  29 0F     AND #$0F
  $EA9F:  C9 06     CMP #$06
  $EAA1:  90 0D     BCC $EAB0
  $EAA3:  85 10     STA $10
  $EAA5:  C6 11     DEC $11
  $EAA7:  E6 10     INC $10
  $EAA9:  20 8C EE  JSR $EE8C
  $EAAC:  C9 00     CMP #$00
  $EAAE:  D0 0A     BNE $EABA
  $EAB0:  A9 FF     LDA #$FF
  $EAB2:  9D 3C 06  STA $063C,X
  $EAB5:  99 46 06  STA $0646,Y
  $EAB8:  A9 01     LDA #$01
  $EABA:  9D 2B 06  STA $062B,X
  $EABD:  BD 20 06  LDA $0620,X
  $EAC0:  D0 20     BNE $EAE2
  $EAC2:  A9 FF     LDA #$FF
  $EAC4:  99 46 06  STA $0646,Y
  $EAC7:  20 69 ED  JSR $ED69
  $EACA:  A4 A4     LDY $A4
  $EACC:  C0 04     CPY #$04
  $EACE:  D0 11     BNE $EAE1
  $EAD0:  A9 88     LDA #$88
  $EAD2:  8D 05 40  STA $4005
  $EAD5:  A5 BB     LDA $BB
  $EAD7:  29 DF     AND #$DF
  $EAD9:  85 BB     STA $BB
  $EADB:  A5 B4     LDA $B4
  $EADD:  09 40     ORA #$40
  $EADF:  85 B4     STA $B4
  $EAE1:  60        RTS
  $EAE2:  A5 A2     LDA $A2
  $EAE4:  C9 4A     CMP #$4A
  $EAE6:  F0 07     BEQ $EAEF
  $EAE8:  B9 F1 EA  LDA $EAF1,Y
  $EAEB:  05 B4     ORA $B4
  $EAED:  85 B4     STA $B4
  $EAEF:  60        RTS
  $EAF0:  00        BRK
  $EAF1:  80        .db $80
  $EAF2:  40        RTI
  $EAF3:  20 10 08  JSR $0810
  $EAF6:  FF        .db $FF
  $EAF7:  7F        .db $7F
  $EAF8:  BF        .db $BF
  $EAF9:  DF        .db $DF
  $EAFA:  EF        .db $EF
  $EAFB:  F7        .db $F7

sub_EAFC:
  $EAFC:  84 A4     STY $A4
  $EAFE:  86 A5     STX $A5
  $EB00:  A9 00     LDA #$00
  $EB02:  85 A0     STA $A0
  $EB04:  C0 03     CPY #$03
  $EB06:  90 19     BCC $EB21
  $EB08:  F0 06     BEQ $EB10
  $EB0A:  A5 BB     LDA $BB
  $EB0C:  29 20     AND #$20
  $EB0E:  F0 0E     BEQ $EB1E
  $EB10:  B9 46 06  LDA $0646,Y
  $EB13:  29 0F     AND #$0F
  $EB15:  8D 0E 40  STA $400E
  $EB18:  A9 08     LDA #$08
  $EB1A:  8D 0F 40  STA $400F
  $EB1D:  60        RTS
  $EB1E:  4C B4 EB  JMP $EBB4
  $EB21:  B9 B1 00  LDA $00B1,Y
  $EB24:  29 0F     AND #$0F
  $EB26:  0A        ASL A
  $EB27:  85 A0     STA $A0
  $EB29:  F0 07     BEQ $EB32
  $EB2B:  B9 F1 EA  LDA $EAF1,Y
  $EB2E:  05 B4     ORA $B4
  $EB30:  85 B4     STA $B4
  $EB32:  C0 04     CPY #$04
  $EB34:  B0 7E     BCS $EBB4
  $EB36:  B9 B5 00  LDA $00B5,Y
  $EB39:  C9 FF     CMP #$FF
  $EB3B:  F0 5B     BEQ $EB98
  $EB3D:  AA        TAX
  $EB3E:  BD 42 88  LDA $8842,X
  $EB41:  85 10     STA $10
  $EB43:  BD 43 88  LDA $8843,X
  $EB46:  85 11     STA $11
  $EB48:  A6 A5     LDX $A5
  $EB4A:  BD FD 6B  LDA $6BFD,X
  $EB4D:  29 0F     AND #$0F
  $EB4F:  D0 36     BNE $EB87
  $EB51:  B9 B8 00  LDA $00B8,Y
  $EB54:  A8        TAY
  $EB55:  B1 10     LDA ($10),Y
  $EB57:  08        PHP
  $EB58:  4A        LSR A
  $EB59:  B0 10     BCS $EB6B
  $EB5B:  4A        LSR A
  $EB5C:  B0 3D     BCS $EB9B
  $EB5E:  28        PLP
  $EB5F:  10 02     BPL $EB63
  $EB61:  09 C0     ORA #$C0
  $EB63:  18        CLC
  $EB64:  65 A0     ADC $A0
  $EB66:  85 A0     STA $A0
  $EB68:  C8        INY
  $EB69:  D0 3A     BNE $EBA5
  $EB6B:  28        PLP
  $EB6C:  4A        LSR A
  $EB6D:  B0 05     BCS $EB74
  $EB6F:  A8        TAY
  $EB70:  4C 55 EB  JMP $EB55
  $EB73:  60        RTS
  $EB74:  29 0F     AND #$0F
  $EB76:  48        PHA
  $EB77:  BD FD 6B  LDA $6BFD,X
  $EB7A:  29 F0     AND #$F0
  $EB7C:  9D FD 6B  STA $6BFD,X
  $EB7F:  68        PLA
  $EB80:  1D FD 6B  ORA $6BFD,X
  $EB83:  9D FD 6B  STA $6BFD,X
  $EB86:  60        RTS
  $EB87:  DE FD 6B  DEC $6BFD,X
  $EB8A:  BD FD 6B  LDA $6BFD,X
  $EB8D:  29 0F     AND #$0F
  $EB8F:  D0 04     BNE $EB95
  $EB91:  A6 A4     LDX $A4
  $EB93:  F6 B8     INC $B8,X
  $EB95:  60        RTS
  $EB96:  B0 1C     BCS $EBB4
  $EB98:  4C 50 EC  JMP $EC50
  $EB9B:  28        PLP
  $EB9C:  A4 A4     LDY $A4
  $EB9E:  A9 FF     LDA #$FF
  $EBA0:  99 B5 00  STA $00B5,Y
  $EBA3:  30 0F     BMI $EBB4
  $EBA5:  98        TYA
  $EBA6:  A4 A4     LDY $A4
  $EBA8:  99 B8 00  STA $00B8,Y
  $EBAB:  A6 A5     LDX $A5
  $EBAD:  B9 F1 EA  LDA $EAF1,Y
  $EBB0:  05 B4     ORA $B4
  $EBB2:  85 B4     STA $B4
  $EBB4:  A5 B4     LDA $B4
  $EBB6:  39 F1 EA  AND $EAF1,Y
  $EBB9:  F0 B8     BEQ $EB73
  $EBBB:  B9 46 06  LDA $0646,Y
  $EBBE:  C9 FF     CMP #$FF
  $EBC0:  F0 D3     BEQ $EB95
  $EBC2:  20 4B ED  JSR $ED4B
  $EBC5:  BD 85 EC  LDA $EC85,X
  $EBC8:  85 10     STA $10
  $EBCA:  85 A2     STA $A2
  $EBCC:  BD 86 EC  LDA $EC86,X
  $EBCF:  85 11     STA $11
  $EBD1:  85 A3     STA $A3
  $EBD3:  8A        TXA
  $EBD4:  48        PHA
  $EBD5:  A9 00     LDA #$00
  $EBD7:  85 11     STA $11
  $EBD9:  BD 9D EC  LDA $EC9D,X
  $EBDC:  85 A1     STA $A1
  $EBDE:  BD 9E EC  LDA $EC9E,X
  $EBE1:  85 10     STA $10
  $EBE3:  A2 05     LDX #$05
  $EBE5:  A5 A0     LDA $A0
  $EBE7:  29 0F     AND #$0F
  $EBE9:  48        PHA
  $EBEA:  68        PLA
  $EBEB:  6A        ROR A
  $EBEC:  48        PHA
  $EBED:  90 21     BCC $EC10
  $EBEF:  A5 A0     LDA $A0
  $EBF1:  30 10     BMI $EC03
  $EBF3:  18        CLC
  $EBF4:  A5 A2     LDA $A2
  $EBF6:  65 10     ADC $10
  $EBF8:  85 A2     STA $A2
  $EBFA:  A5 A3     LDA $A3
  $EBFC:  65 11     ADC $11
  $EBFE:  85 A3     STA $A3
  $EC00:  4C 10 EC  JMP $EC10
  $EC03:  38        SEC
  $EC04:  A5 A2     LDA $A2
  $EC06:  E5 10     SBC $10
  $EC08:  85 A2     STA $A2
  $EC0A:  A5 A3     LDA $A3
  $EC0C:  E5 11     SBC $11
  $EC0E:  85 A3     STA $A3
  $EC10:  06 A1     ASL $A1
  $EC12:  26 10     ROL $10
  $EC14:  26 11     ROL $11
  $EC16:  CA        DEX
  $EC17:  D0 D1     BNE $EBEA
  $EC19:  68        PLA
  $EC1A:  A5 A2     LDA $A2
  $EC1C:  85 10     STA $10
  $EC1E:  A5 A3     LDA $A3
  $EC20:  85 11     STA $11
  $EC22:  68        PLA
  $EC23:  AA        TAX
  $EC24:  BD 86 EC  LDA $EC86,X
  $EC27:  A6 A4     LDX $A4
  $EC29:  BC 7F EC  LDY $EC7F,X
  $EC2C:  C5 A3     CMP $A3
  $EC2E:  D0 4E     BNE $EC7E
  $EC30:  A6 A5     LDX $A5
  $EC32:  BD 20 06  LDA $0620,X
  $EC35:  DD 21 06  CMP $0621,X
  $EC38:  F0 16     BEQ $EC50
  $EC3A:  A6 A4     LDX $A4
  $EC3C:  BC 7F EC  LDY $EC7F,X
  $EC3F:  A5 10     LDA $10
  $EC41:  99 02 40  STA $4002,Y
  $EC44:  60        RTS
  $EC45:  A6 A5     LDX $A5
  $EC47:  BD 20 06  LDA $0620,X
  $EC4A:  DD 21 06  CMP $0621,X
  $EC4D:  F0 01     BEQ $EC50
  $EC4F:  60        RTS
  $EC50:  A4 A4     LDY $A4
  $EC52:  A5 B4     LDA $B4
  $EC54:  39 F1 EA  AND $EAF1,Y
  $EC57:  F0 25     BEQ $EC7E

sub_EC59:
  $EC59:  B9 46 06  LDA $0646,Y
  $EC5C:  C9 FF     CMP #$FF
  $EC5E:  F0 1E     BEQ $EC7E
  $EC60:  20 4B ED  JSR $ED4B
  $EC63:  BD 85 EC  LDA $EC85,X
  $EC66:  85 10     STA $10
  $EC68:  BD 86 EC  LDA $EC86,X
  $EC6B:  85 11     STA $11
  $EC6D:  A6 A4     LDX $A4
  $EC6F:  BC 7F EC  LDY $EC7F,X
  $EC72:  A5 10     LDA $10
  $EC74:  99 02 40  STA $4002,Y
  $EC77:  A5 11     LDA $11
  $EC79:  09 08     ORA #$08
  $EC7B:  99 03 40  STA $4003,Y
  $EC7E:  60        RTS
  $EC7F:  00        BRK
  $EC80:  04        .db $04
  $EC81:  08        PHP
  $EC82:  0C        .db $0C
  $EC83:  04        .db $04
  $EC84:  0C        .db $0C
  $EC85:  F0 07     BEQ $EC8E
  $EC87:  7E 07 12  ROR $1207,X
  $EC8A:  07        .db $07
  $EC8B:  AD 06 43  LDA $4306
  $EC8E:  06 F3     ASL $F3
  $EC90:  05 9D     ORA $9D
  $EC92:  05 4C     ORA $4C
  $EC94:  05 00     ORA $00
  $EC96:  05 B8     ORA $B8
  $EC98:  04        .db $04
  $EC99:  75 04     ADC $04,X
  $EC9B:  34        .db $34
  $EC9C:  04        .db $04
  $EC9D:  F8        SED
  $EC9E:  03        .db $03
  $EC9F:  BF        .db $BF
  $ECA0:  03        .db $03
  $ECA1:  89        .db $89
  $ECA2:  03        .db $03
  $ECA3:  56 03     LSR $03,X
  $ECA5:  26 03     ROL $03
  $ECA7:  F9 02 CE  SBC $CE02,Y
  $ECAA:  02        .db $02
  $ECAB:  A6 02     LDX $02
  $ECAD:  80        .db $80
  $ECAE:  02        .db $02
  $ECAF:  5C        .db $5C
  $ECB0:  02        .db $02
  $ECB1:  3A        .db $3A
  $ECB2:  02        .db $02
  $ECB3:  1A        .db $1A
  $ECB4:  02        .db $02
  $ECB5:  FB        .db $FB
  $ECB6:  01 DF     ORA ($DF,X)
  $ECB8:  01 C4     ORA ($C4,X)
  $ECBA:  01 AB     ORA ($AB,X)
  $ECBC:  01 93     ORA ($93,X)
  $ECBE:  01 7C     ORA ($7C,X)
  $ECC0:  01 67     ORA ($67,X)
  $ECC2:  01 52     ORA ($52,X)
  $ECC4:  01 3F     ORA ($3F,X)
  $ECC6:  01 2D     ORA ($2D,X)
  $ECC8:  01 1C     ORA ($1C,X)
  $ECCA:  01 0C     ORA ($0C,X)
  $ECCC:  01 FD     ORA ($FD,X)
  $ECCE:  00        BRK
  $ECCF:  EF        .db $EF
  $ECD0:  00        BRK
  $ECD1:  E1 00     SBC ($00,X)
  $ECD3:  D5 00     CMP $00,X
  $ECD5:  C9 00     CMP #$00
  $ECD7:  BD 00 B3  LDA $B300,X
  $ECDA:  00        BRK
  $ECDB:  A9 00     LDA #$00
  $ECDD:  9F        .db $9F
  $ECDE:  00        BRK
  $ECDF:  96 00     STX $00,Y
  $ECE1:  8E 00 86  STX $8600
  $ECE4:  00        BRK
  $ECE5:  7E 00 77  ROR $7700,X
  $ECE8:  00        BRK
  $ECE9:  70 00     BVS $ECEB
  $ECEB:  6A        ROR A
  $ECEC:  00        BRK
  $ECED:  64        .db $64
  $ECEE:  00        BRK
  $ECEF:  5E 00 59  LSR $5900,X
  $ECF2:  00        BRK
  $ECF3:  54        .db $54
  $ECF4:  00        BRK
  $ECF5:  4F        .db $4F
  $ECF6:  00        BRK
  $ECF7:  4B        .db $4B
  $ECF8:  00        BRK
  $ECF9:  46 00     LSR $00
  $ECFB:  42        .db $42
  $ECFC:  00        BRK
  $ECFD:  3F        .db $3F
  $ECFE:  00        BRK
  $ECFF:  3B        .db $3B
  $ED00:  00        BRK
  $ED01:  38        SEC
  $ED02:  00        BRK
  $ED03:  34        .db $34
  $ED04:  00        BRK
  $ED05:  31 00     AND ($00),Y
  $ED07:  2F        .db $2F
  $ED08:  00        BRK
  $ED09:  2C 00 29  BIT $2900
  $ED0C:  00        BRK
  $ED0D:  27        .db $27
  $ED0E:  00        BRK
  $ED0F:  25 00     AND $00
  $ED11:  23        .db $23
  $ED12:  00        BRK
  $ED13:  21 00     AND ($00,X)
  $ED15:  1F        .db $1F
  $ED16:  00        BRK
  $ED17:  1D 00 1B  ORA $1B00,X
  $ED1A:  00        BRK
  $ED1B:  20 00 20  JSR $2000
  $ED1E:  00        BRK
  $ED1F:  20 00 4A  JSR $4A00
  $ED22:  00        BRK
  $ED23:  46 00     LSR $00
  $ED25:  42        .db $42
  $ED26:  00        BRK
  $ED27:  3E 00 3B  ROL $3B00,X
  $ED2A:  00        BRK
  $ED2B:  37        .db $37
  $ED2C:  00        BRK
  $ED2D:  34        .db $34
  $ED2E:  00        BRK
  $ED2F:  32        .db $32
  $ED30:  00        BRK
  $ED31:  2E 00 2C  ROL $2C00
  $ED34:  00        BRK
  $ED35:  29 00     AND #$00
  $ED37:  27        .db $27
  $ED38:  00        BRK
  $ED39:  25 00     AND $00
  $ED3B:  23        .db $23
  $ED3C:  00        BRK
  $ED3D:  21 00     AND ($00,X)
  $ED3F:  20 00 20  JSR $2000
  $ED42:  00        BRK
  $ED43:  20 00 20  JSR $2000
  $ED46:  00        BRK
  $ED47:  20 00 20  JSR $2000
  $ED4A:  00        BRK

sub_ED4B:
  $ED4B:  18        CLC
  $ED4C:  69 03     ADC #$03
  $ED4E:  C0 04     CPY #$04
  $ED50:  B0 14     BCS $ED66
  $ED52:  18        CLC
  $ED53:  A6 A5     LDX $A5
  $ED55:  7D FE 6B  ADC $6BFE,X
  $ED58:  E0 04     CPX #$04
  $ED5A:  D0 0A     BNE $ED66
  $ED5C:  C9 39     CMP #$39
  $ED5E:  90 06     BCC $ED66
  $ED60:  38        SEC
  $ED61:  E9 39     SBC #$39
  $ED63:  18        CLC
  $ED64:  69 4E     ADC #$4E
  $ED66:  0A        ASL A
  $ED67:  AA        TAX
  $ED68:  60        RTS
sub_ED69:
  $ED69:  A4 A4     LDY $A4
  $ED6B:  A6 A5     LDX $A5
  $ED6D:  A9 B0     LDA #$B0
  $ED6F:  85 A2     STA $A2
  $ED71:  B9 46 06  LDA $0646,Y
  $ED74:  C9 FF     CMP #$FF
  $ED76:  F0 05     BEQ $ED7D
  $ED78:  BD 21 06  LDA $0621,X
  $ED7B:  D0 1C     BNE $ED99
  $ED7D:  C0 04     CPY #$04
  $ED7F:  D0 07     BNE $ED88
  $ED81:  A5 BB     LDA $BB
  $ED83:  29 20     AND #$20
  $ED85:  F0 01     BEQ $ED88
  $ED87:  C8        INY
  $ED88:  B9 93 ED  LDA $ED93,Y
  $ED8B:  A4 A4     LDY $A4
  $ED8D:  85 A2     STA $A2
  $ED8F:  A9 00     LDA #$00
  $ED91:  F0 45     BEQ $EDD8
  $ED93:  B0 B0     BCS $ED45
  $ED95:  80        .db $80
  $ED96:  30 B0     BMI $ED48
  $ED98:  30 BD     BMI $ED57
  $ED9A:  2A        ROL A
  $ED9B:  06 F0     ASL $F0
  $ED9D:  40        RTI
  $ED9E:  30 3E     BMI $EDDE
  $EDA0:  BD 2B 06  LDA $062B,X
  $EDA3:  D0 39     BNE $EDDE
  $EDA5:  C0 02     CPY #$02
  $EDA7:  F0 DF     BEQ $ED88
  $EDA9:  B9 87 EE  LDA $EE87,Y
  $EDAC:  85 10     STA $10
  $EDAE:  C0 02     CPY #$02
  $EDB0:  B0 29     BCS $EDDB
  $EDB2:  B9 FA 6B  LDA $6BFA,Y
  $EDB5:  C9 FF     CMP #$FF
  $EDB7:  F0 25     BEQ $EDDE
  $EDB9:  09 00     ORA #$00
  $EDBB:  D0 04     BNE $EDC1
  $EDBD:  A5 10     LDA $10
  $EDBF:  09 30     ORA #$30
  $EDC1:  48        PHA
  $EDC2:  29 F0     AND #$F0
  $EDC4:  85 A2     STA $A2
  $EDC6:  68        PLA
  $EDC7:  29 0F     AND #$0F
  $EDC9:  AA        TAX
  $EDCA:  E8        INX
  $EDCB:  86 10     STX $10
  $EDCD:  A6 A5     LDX $A5
  $EDCF:  A5 B0     LDA $B0
  $EDD1:  29 0F     AND #$0F
  $EDD3:  85 11     STA $11
  $EDD5:  20 8E EE  JSR $EE8E
  $EDD8:  4C 68 EE  JMP $EE68
  $EDDB:  4C 6C EE  JMP $EE6C
  $EDDE:  A9 0F     LDA #$0F
  $EDE0:  85 10     STA $10
  $EDE2:  A5 B0     LDA $B0
  $EDE4:  29 0F     AND #$0F
  $EDE6:  85 10     STA $10
  $EDE8:  C0 02     CPY #$02
  $EDEA:  B0 10     BCS $EDFC
  $EDEC:  B9 B1 00  LDA $00B1,Y
  $EDEF:  4A        LSR A
  $EDF0:  4A        LSR A
  $EDF1:  4A        LSR A
  $EDF2:  4A        LSR A
  $EDF3:  85 11     STA $11
  $EDF5:  F0 05     BEQ $EDFC
  $EDF7:  20 8C EE  JSR $EE8C
  $EDFA:  85 10     STA $10
  $EDFC:  BD 3C 06  LDA $063C,X
  $EDFF:  C9 FF     CMP #$FF
  $EE01:  F0 69     BEQ $EE6C
  $EE03:  E0 04     CPX #$04
  $EE05:  B0 07     BCS $EE0E
  $EE07:  BD FD 6B  LDA $6BFD,X
  $EE0A:  29 F0     AND #$F0
  $EE0C:  D0 31     BNE $EE3F
  $EE0E:  BC 3D 06  LDY $063D,X
  $EE11:  B9 37 83  LDA $8337,Y
  $EE14:  85 A0     STA $A0
  $EE16:  B9 38 83  LDA $8338,Y
  $EE19:  85 A1     STA $A1
  $EE1B:  BC 3C 06  LDY $063C,X
  $EE1E:  B1 A0     LDA ($A0),Y
  $EE20:  C9 10     CMP #$10
  $EE22:  90 06     BCC $EE2A
  $EE24:  C9 C0     CMP #$C0
  $EE26:  B0 28     BCS $EE50
  $EE28:  90 2E     BCC $EE58
  $EE2A:  0A        ASL A
  $EE2B:  0A        ASL A
  $EE2C:  0A        ASL A
  $EE2D:  0A        ASL A
  $EE2E:  48        PHA
  $EE2F:  BD FD 6B  LDA $6BFD,X
  $EE32:  29 0F     AND #$0F
  $EE34:  9D FD 6B  STA $6BFD,X
  $EE37:  68        PLA
  $EE38:  1D FD 6B  ORA $6BFD,X
  $EE3B:  9D FD 6B  STA $6BFD,X
  $EE3E:  60        RTS
  $EE3F:  BD FD 6B  LDA $6BFD,X
  $EE42:  38        SEC
  $EE43:  E9 10     SBC #$10
  $EE45:  9D FD 6B  STA $6BFD,X
  $EE48:  29 F0     AND #$F0
  $EE4A:  D0 03     BNE $EE4F
  $EE4C:  FE 3C 06  INC $063C,X
  $EE4F:  60        RTS
  $EE50:  29 3F     AND #$3F
  $EE52:  9D 3C 06  STA $063C,X
  $EE55:  A8        TAY
  $EE56:  B0 C6     BCS $EE1E
  $EE58:  FE 3C 06  INC $063C,X
  $EE5B:  85 A2     STA $A2
  $EE5D:  E0 08     CPX #$08
  $EE5F:  F0 09     BEQ $EE6A
  $EE61:  29 0F     AND #$0F
  $EE63:  85 11     STA $11
  $EE65:  20 8C EE  JSR $EE8C
  $EE68:  29 0F     AND #$0F
  $EE6A:  85 10     STA $10
  $EE6C:  A6 A4     LDX $A4
  $EE6E:  E0 04     CPX #$04
  $EE70:  D0 08     BNE $EE7A
  $EE72:  A5 BB     LDA $BB
  $EE74:  29 20     AND #$20
  $EE76:  F0 02     BEQ $EE7A
  $EE78:  A2 03     LDX #$03
  $EE7A:  BC 7F EC  LDY $EC7F,X
  $EE7D:  A5 A2     LDA $A2
  $EE7F:  29 F0     AND #$F0
  $EE81:  05 10     ORA $10
  $EE83:  99 00 40  STA $4000,Y
  $EE86:  60        RTS
  $EE87:  82        .db $82
  $EE88:  82        .db $82
  $EE89:  02        .db $02
  $EE8A:  00        BRK
  $EE8B:  02        .db $02

sub_EE8C:
  $EE8C:  E6 11     INC $11

sub_EE8E:
  $EE8E:  A5 10     LDA $10
  $EE90:  49 FF     EOR #$FF
  $EE92:  85 10     STA $10
  $EE94:  A9 00     LDA #$00
  $EE96:  46 10     LSR $10
  $EE98:  B0 02     BCS $EE9C
  $EE9A:  65 11     ADC $11
  $EE9C:  4A        LSR A
  $EE9D:  46 10     LSR $10
  $EE9F:  B0 02     BCS $EEA3
  $EEA1:  65 11     ADC $11
  $EEA3:  4A        LSR A
  $EEA4:  46 10     LSR $10
  $EEA6:  B0 02     BCS $EEAA
  $EEA8:  65 11     ADC $11
  $EEAA:  4A        LSR A
  $EEAB:  46 10     LSR $10
  $EEAD:  B0 02     BCS $EEB1
  $EEAF:  65 11     ADC $11
  $EEB1:  4A        LSR A
  $EEB2:  46 10     LSR $10
  $EEB4:  B0 02     BCS $EEB8
  $EEB6:  65 11     ADC $11
  $EEB8:  60        RTS
sub_EEB9:
  $EEB9:  A6 B0     LDX $B0
  $EEBB:  E8        INX
  $EEBC:  8A        TXA
  $EEBD:  29 0F     AND #$0F
  $EEBF:  F0 02     BEQ $EEC3
  $EEC1:  86 B0     STX $B0
  $EEC3:  A6 A5     LDX $A5
  $EEC5:  60        RTS
sub_EEC6:
  $EEC6:  A6 B0     LDX $B0
  $EEC8:  CA        DEX
  $EEC9:  8A        TXA
  $EECA:  29 0F     AND #$0F
  $EECC:  C9 0F     CMP #$0F
  $EECE:  F0 02     BEQ $EED2
  $EED0:  86 B0     STX $B0
  $EED2:  A6 A5     LDX $A5
  $EED4:  60        RTS
  $EED5:  29 0F     AND #$0F
  $EED7:  85 10     STA $10
  $EED9:  A5 B0     LDA $B0
  $EEDB:  29 F0     AND #$F0
  $EEDD:  05 10     ORA $10
  $EEDF:  85 B0     STA $B0
  $EEE1:  60        RTS
sub_EEE2:
  $EEE2:  24 BB     BIT $BB
  $EEE4:  50 25     BVC $EF0B
  $EEE6:  A6 BB     LDX $BB
  $EEE8:  CA        DEX
  $EEE9:  86 BB     STX $BB
  $EEEB:  8A        TXA
  $EEEC:  29 1F     AND #$1F
  $EEEE:  D0 1B     BNE $EF0B
  $EEF0:  8A        TXA
  $EEF1:  09 05     ORA #$05
  $EEF3:  85 BB     STA $BB
  $EEF5:  30 09     BMI $EF00
  $EEF7:  A5 B0     LDA $B0
  $EEF9:  29 0F     AND #$0F
  $EEFB:  F0 0F     BEQ $EF0C
  $EEFD:  4C C6 EE  JMP $EEC6
  $EF00:  20 B9 EE  JSR $EEB9
  $EF03:  A5 B0     LDA $B0
  $EF05:  29 0F     AND #$0F
  $EF07:  C9 0F     CMP #$0F
  $EF09:  F0 01     BEQ $EF0C
  $EF0B:  60        RTS
  $EF0C:  A9 00     LDA #$00
  $EF0E:  85 BB     STA $BB
  $EF10:  60        RTS
  $EF11:  AA        TAX
  $EF12:  A9 00     LDA #$00
  $EF14:  8D 10 40  STA $4010
  $EF17:  A9 0F     LDA #$0F
  $EF19:  8D 15 40  STA $4015
  $EF1C:  A9 88     LDA #$88
  $EF1E:  8D 05 40  STA $4005
  $EF21:  A9 CF     LDA #$CF
  $EF23:  25 BB     AND $BB
  $EF25:  85 BB     STA $BB
  $EF27:  BD 6C A1  LDA $A16C,X
  $EF2A:  30 08     BMI $EF34
  $EF2C:  48        PHA
  $EF2D:  A9 20     LDA #$20
  $EF2F:  05 BB     ORA $BB
  $EF31:  85 BB     STA $BB
  $EF33:  68        PLA
  $EF34:  09 80     ORA #$80
  $EF36:  85 AF     STA $AF
  $EF38:  BD 6B A1  LDA $A16B,X
  $EF3B:  85 AE     STA $AE
  $EF3D:  A9 01     LDA #$01
  $EF3F:  8D 29 06  STA $0629
  $EF42:  8D 28 06  STA $0628
  $EF45:  A9 00     LDA #$00
  $EF47:  8D 32 06  STA $0632
  $EF4A:  8D 33 06  STA $0633
  $EF4D:  8D 4F 06  STA $064F
  $EF50:  A9 FF     LDA #$FF
  $EF52:  8D 44 06  STA $0644
  $EF55:  8D 45 06  STA $0645
  $EF58:  4C 83 F0  JMP $F083

sub_EF5B:
  $EF5B:  20 7A F0  JSR $F07A
  $EF5E:  AA        TAX
  $EF5F:  0A        ASL A
  $EF60:  B0 AF     BCS $EF11
  $EF62:  48        PHA
  $EF63:  A9 20     LDA #$20
  $EF65:  25 BB     AND $BB
  $EF67:  85 BB     STA $BB
  $EF69:  68        PLA
  $EF6A:  C5 BF     CMP $BF
  $EF6C:  F0 EA     BEQ $EF58
  $EF6E:  85 BF     STA $BF
  $EF70:  0A        ASL A
  $EF71:  0A        ASL A
  $EF72:  A8        TAY
  $EF73:  A5 00     LDA $00
  $EF75:  48        PHA
  $EF76:  A5 01     LDA $01
  $EF78:  48        PHA
  $EF79:  AD BE EF  LDA $EFBE
  $EF7C:  85 00     STA $00
  $EF7E:  AD BF EF  LDA $EFBF
  $EF81:  85 01     STA $01
  $EF83:  BD FE 82  LDA $82FE,X
  $EF86:  8D FC 6B  STA $6BFC
  $EF89:  A2 00     LDX #$00
  $EF8B:  86 A4     STX $A4
  $EF8D:  86 A5     STX $A5
  $EF8F:  90 02     BCC $EF93
  $EF91:  E6 01     INC $01
  $EF93:  B1 00     LDA ($00),Y
  $EF95:  AD FC 6B  LDA $6BFC
  $EF98:  F0 26     BEQ $EFC0
  $EF9A:  AD FC 6B  LDA $6BFC
  $EF9D:  85 23     STA $23
  $EF9F:  A2 A6     LDX #$A6
  $EFA1:  B1 00     LDA ($00),Y
  $EFA3:  85 24     STA $24
  $EFA5:  20 CE C3  JSR $C3CE
  $EFA8:  C8        INY
  $EFA9:  C8        INY
  $EFAA:  E8        INX
  $EFAB:  E8        INX
  $EFAC:  E0 AC     CPX #$AC
  $EFAE:  D0 F1     BNE $EFA1
  $EFB0:  AD BC EF  LDA $EFBC
  $EFB3:  85 AC     STA $AC
  $EFB5:  AD BD EF  LDA $EFBD
  $EFB8:  85 AD     STA $AD
  $EFBA:  D0 14     BNE $EFD0
  $EFBC:  35 83     AND $83,X
  $EFBE:  4E 81 B1  LSR $B181
  $EFC1:  00        BRK
  $EFC2:  95 A6     STA $A6,X
  $EFC4:  C8        INY
  $EFC5:  B1 00     LDA ($00),Y
  $EFC7:  95 A7     STA $A7,X
  $EFC9:  E8        INX
  $EFCA:  E8        INX
  $EFCB:  C8        INY
  $EFCC:  E0 08     CPX #$08
  $EFCE:  D0 F0     BNE $EFC0
  $EFD0:  A9 0F     LDA #$0F
  $EFD2:  85 B0     STA $B0
  $EFD4:  AD FC 6B  LDA $6BFC
  $EFD7:  F0 14     BEQ $EFED
  $EFD9:  A2 A6     LDX #$A6
  $EFDB:  A0 00     LDY #$00
  $EFDD:  20 EA C3  JSR $C3EA
  $EFE0:  48        PHA
  $EFE1:  E6 A6     INC $A6
  $EFE3:  D0 02     BNE $EFE7
  $EFE5:  E6 A7     INC $A7
  $EFE7:  68        PLA
  $EFE8:  85 BC     STA $BC
  $EFEA:  4C F2 EF  JMP $EFF2
  $EFED:  20 71 E7  JSR $E771
  $EFF0:  85 BC     STA $BC
  $EFF2:  A9 FF     LDA #$FF
  $EFF4:  85 BD     STA $BD
  $EFF6:  A2 00     LDX #$00
  $EFF8:  A0 00     LDY #$00
  $EFFA:  A9 00     LDA #$00
  $EFFC:  99 4B 06  STA $064B,Y
  $EFFF:  9D 2A 06  STA $062A,X
  $F002:  A9 FF     LDA #$FF
  $F004:  9D 3D 06  STA $063D,X
  $F007:  9D 3C 06  STA $063C,X
  $F00A:  A9 01     LDA #$01
  $F00C:  9D 20 06  STA $0620,X
  $F00F:  9D 21 06  STA $0621,X
  $F012:  9D 2B 06  STA $062B,X
  $F015:  E8        INX
  $F016:  E8        INX
  $F017:  C8        INY
  $F018:  C0 04     CPY #$04
  $F01A:  D0 DE     BNE $EFFA
  $F01C:  A9 00     LDA #$00
  $F01E:  8D FA 6B  STA $6BFA
  $F021:  8D FB 6B  STA $6BFB
  $F024:  8D F9 6B  STA $6BF9
  $F027:  AA        TAX
  $F028:  A8        TAY
  $F029:  A9 00     LDA #$00
  $F02B:  99 B1 00  STA $00B1,Y
  $F02E:  9D FD 6B  STA $6BFD,X
  $F031:  9D FE 6B  STA $6BFE,X
  $F034:  A9 FF     LDA #$FF
  $F036:  99 B5 00  STA $00B5,Y
  $F039:  99 09 6C  STA $6C09,Y
  $F03C:  E8        INX
  $F03D:  E8        INX
  $F03E:  C8        INY
  $F03F:  C0 03     CPY #$03
  $F041:  D0 E6     BNE $F029
  $F043:  A9 80     LDA #$80
  $F045:  8D 08 40  STA $4008
  $F048:  68        PLA
  $F049:  85 01     STA $01
  $F04B:  68        PLA
  $F04C:  85 00     STA $00
  $F04E:  4C 83 F0  JMP $F083
  $F051:  20 57 F0  JSR $F057
  $F054:  4C DC E7  JMP $E7DC

sub_F057:
  $F057:  A9 45     LDA #$45
  $F059:  05 BB     ORA $BB
  $F05B:  85 BB     STA $BB
  $F05D:  60        RTS
  $F05E:  20 7A F0  JSR $F07A
  $F061:  0A        ASL A
  $F062:  C5 BF     CMP $BF
  $F064:  F0 0B     BEQ $F071
  $F066:  85 BF     STA $BF
  $F068:  A9 C5     LDA #$C5
  $F06A:  05 BB     ORA $BB
  $F06C:  85 BB     STA $BB
  $F06E:  4C 70 EF  JMP $EF70
  $F071:  A9 C5     LDA #$C5
  $F073:  05 BB     ORA $BB
  $F075:  85 BB     STA $BB
  $F077:  4C 83 F0  JMP $F083

sub_F07A:
  $F07A:  48        PHA
  $F07B:  A5 BF     LDA $BF
  $F07D:  29 FE     AND #$FE
  $F07F:  85 BF     STA $BF
  $F081:  68        PLA
  $F082:  60        RTS
  $F083:  48        PHA
  $F084:  A5 BF     LDA $BF
  $F086:  09 01     ORA #$01
  $F088:  D0 F5     BNE $F07F
  $F08A:  78        SEI
  $F08B:  A9 00     LDA #$00
  $F08D:  8D 15 40  STA $4015
  $F090:  A9 80     LDA #$80
  $F092:  8D 17 40  STA $4017
  $F095:  A9 0F     LDA #$0F
  $F097:  8D 15 40  STA $4015
  $F09A:  A9 88     LDA #$88
  $F09C:  8D 01 40  STA $4001
  $F09F:  8D 05 40  STA $4005
  $F0A2:  A9 FF     LDA #$FF
  $F0A4:  85 BD     STA $BD
  $F0A6:  A9 00     LDA #$00
  $F0A8:  85 BB     STA $BB
  $F0AA:  20 5B EF  JSR $EF5B
  $F0AD:  A9 80     LDA #$80
  $F0AF:  20 5B EF  JSR $EF5B
  $F0B2:  58        CLI
  $F0B3:  60        RTS
  $F0B4:  20 74 FF  JSR nmi_rng_update
  $F0B7:  20 74 FF  JSR nmi_rng_update
  $F0BA:  20 74 FF  JSR nmi_rng_update
  $F0BD:  20 74 FF  JSR nmi_rng_update
  $F0C0:  A5 B0     LDA $B0
  $F0C2:  29 20     AND #$20
  $F0C4:  F0 F7     BEQ $F0BD
  $F0C6:  60        RTS
  $F0C7:  20 74 FF  JSR nmi_rng_update
  $F0CA:  20 74 FF  JSR nmi_rng_update
  $F0CD:  20 74 FF  JSR nmi_rng_update
  $F0D0:  20 74 FF  JSR nmi_rng_update
  $F0D3:  20 EC C8  JSR $C8EC
  $F0D6:  A5 14     LDA $14
  $F0D8:  29 03     AND #$03
  $F0DA:  D0 06     BNE $F0E2
  $F0DC:  A5 B0     LDA $B0
  $F0DE:  29 20     AND #$20
  $F0E0:  F0 EE     BEQ $F0D0
  $F0E2:  60        RTS
sub_F0E3:
  $F0E3:  AD FC 6B  LDA $6BFC
  $F0E6:  D0 02     BNE $F0EA
  $F0E8:  A9 19     LDA #$19
  $F0EA:  CD 86 6E  CMP $6E86
  $F0ED:  F0 06     BEQ $F0F5
  $F0EF:  8D 86 6E  STA $6E86
  $F0F2:  20 94 FF  JSR $FF94
  $F0F5:  60        RTS
sub_F0F6:
  $F0F6:  A9 19     LDA #$19
  $F0F8:  CD 86 6E  CMP $6E86
  $F0FB:  F0 06     BEQ $F103
  $F0FD:  8D 86 6E  STA $6E86
  $F100:  20 94 FF  JSR $FF94
  $F103:  60        RTS
  $F104:  A9 26     LDA #$26
  $F106:  8D F3 04  STA $04F3
  $F109:  A9 55     LDA #$55
  $F10B:  8D F2 04  STA $04F2
  $F10E:  A2 2F     LDX #$2F
  $F110:  BD 9B F1  LDA $F19B,X
  $F113:  9D 80 04  STA $0480,X
  $F116:  CA        DEX
  $F117:  10 F7     BPL $F110
  $F119:  00        BRK
  $F11A:  12        .db $12
  $F11B:  DF        .db $DF
  $F11C:  20 EC C8  JSR $C8EC
  $F11F:  20 2E F1  JSR $F12E
  $F122:  20 58 F1  JSR $F158
  $F125:  20 82 F1  JSR $F182
  $F128:  20 90 F1  JSR $F190
  $F12B:  4C 1C F1  JMP $F11C

sub_F12E:
  $F12E:  A9 0B     LDA #$0B
  $F130:  85 00     STA $00
  $F132:  A9 0C     LDA #$0C
  $F134:  85 01     STA $01
  $F136:  A2 05     LDX #$05
  $F138:  8A        TXA
  $F139:  48        PHA
  $F13A:  A9 00     LDA #$00
  $F13C:  20 5A C6  JSR $C65A
  $F13F:  E6 00     INC $00
  $F141:  E6 00     INC $00
  $F143:  68        PLA
  $F144:  AA        TAX
  $F145:  CA        DEX
  $F146:  D0 F0     BNE $F138

fixed_read_actor_3:
  $F148:  AD 5A 61  LDA battle_actor_index
  $F14B:  0A        ASL A
  $F14C:  69 0B     ADC #$0B
  $F14E:  85 00     STA $00
  $F150:  A9 81     LDA #$81
  $F152:  20 5A C6  JSR $C65A
  $F155:  4C 2D C6  JMP $C62D

sub_F158:
  $F158:  A5 14     LDA $14
  $F15A:  0A        ASL A
  $F15B:  90 0E     BCC $F16B

fixed_read_actor_4:
  $F15D:  AD 5A 61  LDA battle_actor_index
  $F160:  C9 04     CMP #$04
  $F162:  F0 07     BEQ $F16B

fixed_inc_actor:
  $F164:  EE 5A 61  INC battle_actor_index
  $F167:  20 7A F1  JSR $F17A
  $F16A:  60        RTS
  $F16B:  0A        ASL A
  $F16C:  90 0B     BCC $F179
  $F16E:  AD 5A 61  LDA battle_actor_index
  $F171:  F0 06     BEQ $F179
  $F173:  CE 5A 61  DEC battle_actor_index
  $F176:  20 7A F1  JSR $F17A
  $F179:  60        RTS
sub_F17A:
  $F17A:  20 2E F1  JSR $F12E
  $F17D:  A2 0A     LDX #$0A
  $F17F:  4C 0C C9  JMP $C90C

sub_F182:
  $F182:  A5 14     LDA $14
  $F184:  4A        LSR A
  $F185:  90 08     BCC $F18F
  $F187:  68        PLA
  $F188:  68        PLA
  $F189:  00        BRK
  $F18A:  85 FB     STA $FB
  $F18C:  AD 5A 61  LDA battle_actor_index
  $F18F:  60        RTS
sub_F190:
  $F190:  A5 14     LDA $14
  $F192:  29 02     AND #$02
  $F194:  F0 04     BEQ $F19A
  $F196:  68        PLA
  $F197:  68        PLA
  $F198:  A9 06     LDA #$06
  $F19A:  60        RTS
  $F19B:  86 85     STX $85
  $F19D:  85 85     STA $85
  $F19F:  49 4F     EOR #$4F
  $F1A1:  32        .db $32
  $F1A2:  43        .db $43
  $F1A3:  85 85     STA $85
  $F1A5:  85 89     STA $89
  $F1A7:  84 00     STY $00
  $F1A9:  00        BRK
  $F1AA:  00        BRK
  $F1AB:  00        BRK
  $F1AC:  00        BRK
  $F1AD:  00        BRK
  $F1AE:  00        BRK
  $F1AF:  00        BRK
  $F1B0:  00        BRK
  $F1B1:  00        BRK
  $F1B2:  88        DEY
  $F1B3:  84 00     STY $00
  $F1B5:  02        .db $02
  $F1B6:  00        BRK
  $F1B7:  03        .db $03
  $F1B8:  00        BRK
  $F1B9:  04        .db $04
  $F1BA:  00        BRK
  $F1BB:  05 00     ORA $00
  $F1BD:  06 88     ASL $88
  $F1BF:  A2 14     LDX #$14
  $F1C1:  20 0C C9  JSR $C90C
  $F1C4:  00        BRK
  $F1C5:  9D FB 20  STA $20FB,X
  $F1C8:  71 F2     ADC ($F2),Y
  $F1CA:  20 F6 F1  JSR $F1F6
  $F1CD:  A5 1F     LDA state_flags
  $F1CF:  09 40     ORA #$40
  $F1D1:  85 1F     STA state_flags
  $F1D3:  20 2D C6  JSR $C62D
  $F1D6:  A5 1F     LDA state_flags
  $F1D8:  29 BF     AND #$BF
  $F1DA:  85 1F     STA state_flags
  $F1DC:  A2 05     LDX #$05
  $F1DE:  20 0C C9  JSR $C90C
  $F1E1:  E6 51     INC $51
  $F1E3:  A5 51     LDA $51
  $F1E5:  C9 05     CMP #$05
  $F1E7:  90 E1     BCC $F1CA
  $F1E9:  20 9E F2  JSR $F29E
  $F1EC:  20 31 F2  JSR $F231
  $F1EF:  20 B3 F2  JSR $F2B3
  $F1F2:  20 2D C6  JSR $C62D
  $F1F5:  60        RTS
sub_F1F6:
  $F1F6:  A5 51     LDA $51
  $F1F8:  D0 03     BNE $F1FD
  $F1FA:  20 31 F2  JSR $F231
  $F1FD:  AE 0A 05  LDX $050A
  $F200:  A9 9F     LDA #$9F
  $F202:  9D 00 03  STA $0300,X
  $F205:  A9 40     LDA #$40
  $F207:  9D 01 03  STA $0301,X
  $F20A:  A9 C0     LDA #$C0
  $F20C:  9D 02 03  STA $0302,X
  $F20F:  E8        INX
  $F210:  E8        INX
  $F211:  E8        INX
  $F212:  A0 00     LDY #$00
  $F214:  B1 49     LDA ($49),Y
  $F216:  9D 00 03  STA $0300,X
  $F219:  E8        INX
  $F21A:  C8        INY
  $F21B:  C0 40     CPY #$40
  $F21D:  90 F5     BCC $F214
  $F21F:  8E 0A 05  STX $050A
  $F222:  EE 0B 05  INC $050B
  $F225:  A5 49     LDA $49
  $F227:  18        CLC
  $F228:  69 40     ADC #$40
  $F22A:  85 49     STA $49
  $F22C:  90 02     BCC $F230
  $F22E:  E6 4A     INC $4A
  $F230:  60        RTS
sub_F231:
  $F231:  AE 0A 05  LDX $050A
  $F234:  A5 1C     LDA $1C
  $F236:  09 80     ORA #$80
  $F238:  9D 00 03  STA $0300,X
  $F23B:  9D 05 03  STA $0305,X
  $F23E:  A9 02     LDA #$02
  $F240:  9D 01 03  STA $0301,X
  $F243:  9D 06 03  STA $0306,X
  $F246:  A5 1D     LDA $1D
  $F248:  9D 02 03  STA $0302,X
  $F24B:  18        CLC
  $F24C:  69 20     ADC #$20
  $F24E:  9D 07 03  STA $0307,X
  $F251:  A5 52     LDA $52
  $F253:  9D 03 03  STA $0303,X
  $F256:  A5 53     LDA $53
  $F258:  9D 04 03  STA $0304,X
  $F25B:  A5 54     LDA $54
  $F25D:  9D 08 03  STA $0308,X
  $F260:  A5 55     LDA $55
  $F262:  9D 09 03  STA $0309,X
  $F265:  EE 0B 05  INC $050B
  $F268:  EE 0B 05  INC $050B
  $F26B:  A2 0A     LDX #$0A
  $F26D:  8E 0A 05  STX $050A
  $F270:  60        RTS
  $F271:  A9 00     LDA #$00
  $F273:  85 51     STA $51
  $F275:  AD 9C F2  LDA $F29C
  $F278:  85 49     STA $49
  $F27A:  AD 9D F2  LDA $F29D
  $F27D:  85 4A     STA $4A
  $F27F:  20 93 F2  JSR $F293
  $F282:  20 62 C6  JSR $C662
  $F285:  A2 FC     LDX #$FC
  $F287:  86 52     STX $52
  $F289:  E8        INX
  $F28A:  86 53     STX $53
  $F28C:  E8        INX
  $F28D:  86 54     STX $54
  $F28F:  E8        INX
  $F290:  86 55     STX $55
  $F292:  60        RTS
sub_F293:
  $F293:  A9 10     LDA #$10
  $F295:  85 00     STA $00
  $F297:  A9 0C     LDA #$0C
  $F299:  85 01     STA $01
  $F29B:  60        RTS
  $F29C:  BB        .db $BB
  $F29D:  F2        .db $F2

sub_F29E:
  $F29E:  AD 08 76  LDA $7608
  $F2A1:  85 52     STA $52
  $F2A3:  AD 09 76  LDA $7609
  $F2A6:  85 53     STA $53
  $F2A8:  AD 0A 76  LDA $760A
  $F2AB:  85 54     STA $54
  $F2AD:  AD 0B 76  LDA $760B
  $F2B0:  85 55     STA $55
  $F2B2:  60        RTS
sub_F2B3:
  $F2B3:  20 93 F2  JSR $F293
  $F2B6:  A9 02     LDA #$02
  $F2B8:  4C 27 C7  JMP $C727
  $F2BB:  FB        .db $FB
  $F2BC:  D1 F5     CMP ($F5),Y
  $F2BE:  F5 A4     SBC $A4,X
  $F2C0:  E4 E9     CPX $E9
  $F2C2:  CA        DEX
  $F2C3:  F9 D3 F2  SBC $F2D3,Y
  $F2C6:  F2        .db $F2
  $F2C7:  A2 E1     LDX #$E1
  $F2C9:  E6 C4     INC $C4
  $F2CB:  FB        .db $FB
  $F2CC:  DF        .db $DF
  $F2CD:  AF        .db $AF
  $F2CE:  AD AF 07  LDA $07AF
  $F2D1:  47        .db $47
  $F2D2:  5B        .db $5B
  $F2D3:  FB        .db $FB
  $F2D4:  CF        .db $CF
  $F2D5:  9F        .db $9F
  $F2D6:  95 97     STA $97,X
  $F2D8:  1B        .db $1B
  $F2D9:  2B        .db $2B
  $F2DA:  25 C0     AND $C0
  $F2DC:  D8        CLD
  $F2DD:  89        .db $89
  $F2DE:  B1 50     LDA ($50),Y
  $F2E0:  32        .db $32
  $F2E1:  83        .db $83
  $F2E2:  C0 C6     CPY #$C6
  $F2E4:  C2        .db $C2
  $F2E5:  84 8C     STY $8C
  $F2E7:  09 09     ORA #$09
  $F2E9:  94 C0     STY $C0,X
  $F2EB:  09 09     ORA #$09
  $F2ED:  05 65     ORA $65
  $F2EF:  82        .db $82
  $F2F0:  E3        .db $E3
  $F2F1:  53        .db $53
  $F2F2:  07        .db $07
  $F2F3:  25 92     AND $92
  $F2F5:  A2 12     LDX #$12
  $F2F7:  31 18     AND ($18),Y
  $F2F9:  87        .db $87
  $F2FA:  0F        .db $0F
  $F2FB:  FB        .db $FB
  $F2FC:  FF        .db $FF
  $F2FD:  8F        .db $8F
  $F2FE:  77        .db $77
  $F2FF:  86 78     STX $78
  $F301:  81 EA     STA ($EA,X)
  $F303:  FB        .db $FB
  $F304:  FF        .db $FF
  $F305:  8F        .db $8F
  $F306:  07        .db $07
  $F307:  76 01     ROR $01,X
  $F309:  86 E4     STX $E4
  $F30B:  FF        .db $FF
  $F30C:  E3        .db $E3
  $F30D:  DD C3 D9  CMP $D9C3,X
  $F310:  47        .db $47
  $F311:  47        .db $47
  $F312:  9B        .db $9B
  $F313:  FF        .db $FF
  $F314:  E3        .db $E3
  $F315:  C1 DD     CMP ($DD,X)
  $F317:  C1 43     CMP ($43,X)
  $F319:  4B        .db $4B
  $F31A:  A5 C8     LDA $C8
  $F31C:  D0 89     BNE $F2A7
  $F31E:  B1 50     LDA ($50),Y
  $F320:  32        .db $32
  $F321:  83        .db $83
  $F322:  C0 C4     CPY #$C4
  $F324:  C2        .db $C2
  $F325:  84 8C     STY $8C
  $F327:  09 09     ORA #$09
  $F329:  94 C0     STY $C0,X
  $F32B:  0B        .db $0B
  $F32C:  09 05     ORA #$05
  $F32E:  65 C2     ADC $C2
  $F330:  E3        .db $E3
  $F331:  53        .db $53
  $F332:  07        .db $07
  $F333:  25 96     AND $96
  $F335:  A2 92     LDX #$92
  $F337:  31 18     AND ($18),Y
  $F339:  87        .db $87
  $F33A:  0F        .db $0F
  $F33B:  FB        .db $FB
  $F33C:  DF        .db $DF
  $F33D:  FF        .db $FF
  $F33E:  FD FF AF  SBC $AFFF,X
  $F341:  D7        .db $D7
  $F342:  13        .db $13
  $F343:  FB        .db $FB
  $F344:  DF        .db $DF
  $F345:  FF        .db $FF
  $F346:  FD FF AF  SBC $AFFF,X
  $F349:  C7        .db $C7
  $F34A:  23        .db $23
  $F34B:  FB        .db $FB
  $F34C:  DF        .db $DF
  $F34D:  FF        .db $FF
  $F34E:  FD FF B3  SBC $B3FF,X
  $F351:  E5 EA     SBC $EA
  $F353:  FB        .db $FB
  $F354:  DF        .db $DF
  $F355:  FF        .db $FF
  $F356:  FD FF B3  SBC $B3FF,X
  $F359:  E9 E4     SBC #$E4
  $F35B:  50 54     BVC $F3B1
  $F35D:  A1 90     LDA ($90,X)
  $F35F:  50 32     BVC $F393
  $F361:  83        .db $83
  $F362:  C0 24     CPY #$24
  $F364:  22        .db $22
  $F365:  81 88     STA ($88,X)
  $F367:  09 09     ORA #$09
  $F369:  94 C0     STY $C0,X
  $F36B:  EA        NOP
  $F36C:  92        .db $92
  $F36D:  05 21     ORA $21
  $F36F:  42        .db $42
  $F370:  E3        .db $E3
  $F371:  53        .db $53
  $F372:  07        .db $07
  $F373:  E4 94     CPX $94
  $F375:  20 92 31  JSR $3192
  $F378:  18        CLC
  $F379:  87        .db $87
  $F37A:  0F        .db $0F
  $F37B:  FB        .db $FB
  $F37C:  DF        .db $DF
  $F37D:  FF        .db $FF
  $F37E:  FD FF BF  SBC $BFFF,X
  $F381:  F7        .db $F7
  $F382:  FF        .db $FF
  $F383:  FB        .db $FB
  $F384:  DF        .db $DF
  $F385:  FF        .db $FF
  $F386:  FD FF BF  SBC $BFFF,X
  $F389:  F7        .db $F7
  $F38A:  FF        .db $FF
  $F38B:  FB        .db $FB
  $F38C:  DF        .db $DF
  $F38D:  FF        .db $FF
  $F38E:  FD FF BF  SBC $BFFF,X
  $F391:  F7        .db $F7
  $F392:  FF        .db $FF
  $F393:  FB        .db $FB
  $F394:  DF        .db $DF
  $F395:  FF        .db $FF
  $F396:  FD FF BF  SBC $BFFF,X
  $F399:  F7        .db $F7
  $F39A:  FF        .db $FF
  $F39B:  FF        .db $FF
  $F39C:  CF        .db $CF
  $F39D:  83        .db $83
  $F39E:  81 2C     STA ($2C,X)
  $F3A0:  50 82     BVC $F324
  $F3A2:  C0 FF     CPY #$FF
  $F3A4:  CF        .db $CF
  $F3A5:  B3        .db $B3
  $F3A6:  9D 42 20  STA $2042,X
  $F3A9:  94 C0     STY $C0,X
  $F3AB:  FF        .db $FF
  $F3AC:  FA        .db $FA
  $F3AD:  C5 A0     CMP $A0
  $F3AF:  8A        TXA
  $F3B0:  62        .db $62
  $F3B1:  53        .db $53
  $F3B2:  07        .db $07
  $F3B3:  FF        .db $FF
  $F3B4:  FA        .db $FA
  $F3B5:  C0 96     CPY #$96
  $F3B7:  94 08     STY $08,X
  $F3B9:  87        .db $87
  $F3BA:  0F        .db $0F
  $F3BB:  FB        .db $FB
  $F3BC:  DF        .db $DF
  $F3BD:  FF        .db $FF
  $F3BE:  FD FF BF  SBC $BFFF,X
  $F3C1:  F7        .db $F7
  $F3C2:  FF        .db $FF
  $F3C3:  FB        .db $FB
  $F3C4:  DF        .db $DF
  $F3C5:  FF        .db $FF
  $F3C6:  FD FF BF  SBC $BFFF,X
  $F3C9:  F7        .db $F7
  $F3CA:  FF        .db $FF
  $F3CB:  FB        .db $FB
  $F3CC:  DF        .db $DF
  $F3CD:  FF        .db $FF
  $F3CE:  FD FF BF  SBC $BFFF,X
  $F3D1:  F7        .db $F7
  $F3D2:  FF        .db $FF
  $F3D3:  FB        .db $FB
  $F3D4:  DF        .db $DF
  $F3D5:  FF        .db $FF
  $F3D6:  FD FF BF  SBC $BFFF,X
  $F3D9:  F7        .db $F7
  $F3DA:  FF        .db $FF
  $F3DB:  FB        .db $FB
  $F3DC:  DF        .db $DF
  $F3DD:  FF        .db $FF
  $F3DE:  FD CF B3  SBC $B3CF,X
  $F3E1:  4B        .db $4B
  $F3E2:  03        .db $03
  $F3E3:  FB        .db $FB
  $F3E4:  DF        .db $DF
  $F3E5:  FF        .db $FF
  $F3E6:  FD CF 83  SBC $83CF,X
  $F3E9:  27        .db $27
  $F3EA:  03        .db $03
  $F3EB:  FB        .db $FB
  $F3EC:  DF        .db $DF
  $F3ED:  FF        .db $FF
  $F3EE:  FF        .db $FF
  $F3EF:  E4 D2     CPX $D2
  $F3F1:  B0 83     BCS $F376
  $F3F3:  FB        .db $FB
  $F3F4:  DF        .db $DF
  $F3F5:  FF        .db $FF
  $F3F6:  FF        .db $FF
  $F3F7:  E4 C9     CPX $C9
  $F3F9:  84 83     STY $83
  $F3FB:  86 05     STX $05
  $F3FD:  8A        TXA
  $F3FE:  F0 05     BEQ $F405
  $F400:  20 05 F4  JSR $F405
  $F403:  C6 05     DEC $05

sub_F405:
  $F405:  20 53 F4  JSR $F453
  $F408:  20 1B F4  JSR $F41B
  $F40B:  A5 00     LDA $00
  $F40D:  18        CLC
  $F40E:  69 10     ADC #$10
  $F410:  85 00     STA $00
  $F412:  90 02     BCC $F416
  $F414:  E6 01     INC $01
  $F416:  C6 02     DEC $02
  $F418:  D0 EE     BNE $F408
  $F41A:  60        RTS
sub_F41B:
  $F41B:  A6 05     LDX $05
  $F41D:  F0 02     BEQ $F421
  $F41F:  A2 03     LDX #$03
  $F421:  BD 3F F4  LDA $F43F,X
  $F424:  30 18     BMI $F43E
  $F426:  85 06     STA $06
  $F428:  E8        INX
  $F429:  BC 3F F4  LDY $F43F,X
  $F42C:  E8        INX
  $F42D:  98        TYA
  $F42E:  F0 05     BEQ $F435
  $F430:  88        DEY
  $F431:  B1 00     LDA ($00),Y
  $F433:  C8        INY
  $F434:  C8        INY
  $F435:  8D 07 20  STA $2007
  $F438:  C6 06     DEC $06
  $F43A:  10 F1     BPL $F42D
  $F43C:  30 E3     BMI $F421
  $F43E:  60        RTS
  $F43F:  0F        .db $0F
  $F440:  01 FF     ORA ($FF,X)
  $F442:  07        .db $07
  $F443:  01 00     ORA ($00,X)
  $F445:  00        BRK
  $F446:  00        BRK
  $F447:  02        .db $02
  $F448:  05 00     ORA $00
  $F44A:  07        .db $07
  $F44B:  09 00     ORA #$00
  $F44D:  09 05     ORA #$05
  $F44F:  00        BRK
  $F450:  00        BRK
  $F451:  10 FF     BPL $F452

sub_F453:
  $F453:  A6 05     LDX $05
  $F455:  BC 71 F4  LDY $F471,X
  $F458:  A2 03     LDX #$03
  $F45A:  B9 73 F4  LDA $F473,Y
  $F45D:  95 00     STA $00,X
  $F45F:  88        DEY
  $F460:  CA        DEX
  $F461:  10 F7     BPL $F45A
  $F463:  AD 02 20  LDA $2002
  $F466:  A5 03     LDA $03
  $F468:  8D 06 20  STA $2006
  $F46B:  A9 00     LDA #$00
  $F46D:  8D 06 20  STA $2006
  $F470:  60        RTS
  $F471:  03        .db $03
  $F472:  07        .db $07
  $F473:  7B        .db $7B
  $F474:  F4        .db $F4
  $F475:  70 18     BVS $F48F
  $F477:  7B        .db $7B
  $F478:  FB        .db $FB
  $F479:  28        PLP
  $F47A:  10 00     BPL $F47C
  $F47C:  FF        .db $FF
  $F47D:  E1 97     SBC ($97,X)
  $F47F:  C8        INY
  $F480:  E4 96     CPX $96
  $F482:  8F        .db $8F
  $F483:  FF        .db $FF
  $F484:  FF        .db $FF
  $F485:  FE FE BF  INC $BFFE,X
  $F488:  BF        .db $BF
  $F489:  FB        .db $FB
  $F48A:  F3        .db $F3
  $F48B:  00        BRK
  $F48C:  FF        .db $FF
  $F48D:  63        .db $63
  $F48E:  76 38     ROR $38,X
  $F490:  0F        .db $0F
  $F491:  EC FF FF  CPX $FFFF
  $F494:  FF        .db $FF
  $F495:  9F        .db $9F
  $F496:  FF        .db $FF
  $F497:  F7        .db $F7
  $F498:  FC        .db $FC
  $F499:  73        .db $73
  $F49A:  FF        .db $FF
  $F49B:  00        BRK
  $F49C:  FF        .db $FF
  $F49D:  18        CLC
  $F49E:  B4 D9     LDY $D9,X
  $F4A0:  2F        .db $2F
  $F4A1:  00        BRK
  $F4A2:  FF        .db $FF
  $F4A3:  FF        .db $FF
  $F4A4:  FF        .db $FF
  $F4A5:  E7        .db $E7
  $F4A6:  FB        .db $FB
  $F4A7:  BF        .db $BF
  $F4A8:  DF        .db $DF
  $F4A9:  FF        .db $FF
  $F4AA:  FF        .db $FF
  $F4AB:  00        BRK
  $F4AC:  FF        .db $FF
  $F4AD:  A7        .db $A7
  $F4AE:  4B        .db $4B
  $F4AF:  93        .db $93
  $F4B0:  EB        .db $EB
  $F4B1:  4B        .db $4B
  $F4B2:  8F        .db $8F
  $F4B3:  FF        .db $FF
  $F4B4:  FF        .db $FF
  $F4B5:  FF        .db $FF
  $F4B6:  FF        .db $FF
  $F4B7:  7F        .db $7F
  $F4B8:  3F        .db $3F
  $F4B9:  FF        .db $FF
  $F4BA:  F3        .db $F3
  $F4BB:  B3        .db $B3
  $F4BC:  A3        .db $A3
  $F4BD:  AB        .db $AB
  $F4BE:  B7        .db $B7
  $F4BF:  9F        .db $9F
  $F4C0:  AB        .db $AB
  $F4C1:  93        .db $93
  $F4C2:  9B        .db $9B
  $F4C3:  FE FE F6  INC $F6FE,X
  $F4C6:  FA        .db $FA
  $F4C7:  FA        .db $FA
  $F4C8:  DE EE FE  DEC $FEEE,X
  $F4CB:  A7        .db $A7
  $F4CC:  AF        .db $AF
  $F4CD:  EB        .db $EB
  $F4CE:  F3        .db $F3
  $F4CF:  9B        .db $9B
  $F4D0:  DF        .db $DF
  $F4D1:  CF        .db $CF
  $F4D2:  C3        .db $C3
  $F4D3:  DE DE BE  DEC $BEDE,X
  $F4D6:  AE FE FA  LDX $FAFE
  $F4D9:  FA        .db $FA
  $F4DA:  BE 87 E7  LDX $E787,Y
  $F4DD:  F7        .db $F7
  $F4DE:  B3        .db $B3
  $F4DF:  9F        .db $9F
  $F4E0:  AF        .db $AF
  $F4E1:  EB        .db $EB
  $F4E2:  CB        .db $CB
  $F4E3:  FB        .db $FB
  $F4E4:  BF        .db $BF
  $F4E5:  BF        .db $BF
  $F4E6:  FF        .db $FF
  $F4E7:  EB        .db $EB
  $F4E8:  FB        .db $FB
  $F4E9:  F7        .db $F7
  $F4EA:  F7        .db $F7
  $F4EB:  B3        .db $B3
  $F4EC:  93        .db $93
  $F4ED:  AB        .db $AB
  $F4EE:  F3        .db $F3
  $F4EF:  DB        .db $DB
  $F4F0:  AB        .db $AB
  $F4F1:  8B        .db $8B
  $F4F2:  9B        .db $9B
  $F4F3:  FF        .db $FF
  $F4F4:  EF        .db $EF
  $F4F5:  F7        .db $F7
  $F4F6:  BF        .db $BF
  $F4F7:  BF        .db $BF
  $F4F8:  DF        .db $DF
  $F4F9:  FF        .db $FF
  $F4FA:  FF        .db $FF
  $F4FB:  F3        .db $F3
  $F4FC:  93        .db $93
  $F4FD:  B7        .db $B7
  $F4FE:  E9 92     SBC #$92
  $F500:  A5 CD     LDA $CD
  $F502:  FF        .db $FF
  $F503:  CE FF FC  DEC $FCFF
  $F506:  DE FF FF  DEC $FFFF,X
  $F509:  F3        .db $F3
  $F50A:  FF        .db $FF
  $F50B:  FF        .db $FF
  $F50C:  FF        .db $FF
  $F50D:  18        CLC
  $F50E:  2D 9B F4  AND $F49B
  $F511:  00        BRK
  $F512:  FF        .db $FF
  $F513:  00        BRK
  $F514:  FF        .db $FF
  $F515:  E7        .db $E7
  $F516:  DF        .db $DF
  $F517:  FD FB FF  SBC $FFFB,X
  $F51A:  FF        .db $FF
  $F51B:  FF        .db $FF
  $F51C:  FF        .db $FF
  $F51D:  C6 6E     DEC $6E
  $F51F:  1C        .db $1C
  $F520:  F0 37     BEQ $F559
  $F522:  FF        .db $FF
  $F523:  00        BRK
  $F524:  FF        .db $FF
  $F525:  F9 FF EF  SBC $EFFF,Y
  $F528:  3F        .db $3F
  $F529:  CE FF 8F  DEC $8FFF
  $F52C:  CB        .db $CB
  $F52D:  EB        .db $EB
  $F52E:  93        .db $93
  $F52F:  4B        .db $4B
  $F530:  2F        .db $2F
  $F531:  57        .db $57
  $F532:  FF        .db $FF
  $F533:  F3        .db $F3
  $F534:  FF        .db $FF
  $F535:  3F        .db $3F
  $F536:  7F        .db $7F
  $F537:  FF        .db $FF
  $F538:  F7        .db $F7
  $F539:  EF        .db $EF
  $F53A:  FF        .db $FF
  $F53B:  7E 83 81  ROR $8183,X
  $F53E:  9C        .db $9C
  $F53F:  92        .db $92
  $F540:  92        .db $92
  $F541:  92        .db $92
  $F542:  92        .db $92
  $F543:  81 FC     STA ($FC,X)
  $F545:  FE EF EF  INC $EFEF,X
  $F548:  EF        .db $EF
  $F549:  EF        .db $EF
  $F54A:  EF        .db $EF
  $F54B:  07        .db $07
  $F54C:  08        PHP
  $F54D:  88        DEY
  $F54E:  C9 49     CMP #$49
  $F550:  49 49     EOR #$49
  $F552:  49 F8     EOR #$F8
  $F554:  FF        .db $FF
  $F555:  7F        .db $7F
  $F556:  3E BE BE  ROL $BEBE,X
  $F559:  BE BE F0  LDX $F0BE,Y
  $F55C:  18        CLC
  $F55D:  0C        .db $0C
  $F55E:  C4 24     CPY $24
  $F560:  24 24     BIT $24
  $F562:  24 0F     BIT $0F
  $F564:  E7        .db $E7
  $F565:  F3        .db $F3
  $F566:  FB        .db $FB
  $F567:  FB        .db $FB
  $F568:  FB        .db $FB
  $F569:  FB        .db $FB
  $F56A:  FB        .db $FB
  $F56B:  1F        .db $1F
  $F56C:  21 40     AND ($40,X)
  $F56E:  40        RTI
  $F56F:  4C 8A 92  JMP $928A
  $F572:  92        .db $92
  $F573:  E0 FE     CPX #$FE
  $F575:  FF        .db $FF
  $F576:  FF        .db $FF
  $F577:  F7        .db $F7
  $F578:  F7        .db $F7
  $F579:  EF        .db $EF
  $F57A:  EF        .db $EF
  $F57B:  01 82     ORA ($82,X)
  $F57D:  84 88     STY $88
  $F57F:  C9 49     CMP #$49
  $F581:  49 49     EOR #$49
  $F583:  FE 7F 7F  INC $7F7F,X
  $F586:  7F        .db $7F
  $F587:  3E BE BE  ROL $BEBE,X
  $F58A:  BE F0 18  LDX $18F0,Y
  $F58D:  0C        .db $0C
  $F58E:  C4 24     CPY $24
  $F590:  24 3C     BIT $3C
  $F592:  7E 0F E7  ROR $E70F,X
  $F595:  F3        .db $F3
  $F596:  FB        .db $FB
  $F597:  FB        .db $FB
  $F598:  FB        .db $FB
  $F599:  FB        .db $FB
  $F59A:  81 0F     STA ($0F,X)
  $F59C:  10 20     BPL $F5BE
  $F59E:  46 49     LSR $49
  $F5A0:  49 49     EOR #$49
  $F5A2:  49 F0     EOR #$F0
  $F5A4:  FF        .db $FF
  $F5A5:  FF        .db $FF
  $F5A6:  FF        .db $FF
  $F5A7:  F7        .db $F7
  $F5A8:  F7        .db $F7
  $F5A9:  F7        .db $F7
  $F5AA:  F7        .db $F7
  $F5AB:  87        .db $87
  $F5AC:  C4 64     CPY $64
  $F5AE:  24 24     BIT $24
  $F5B0:  24 24     BIT $24
  $F5B2:  24 78     BIT $78
  $F5B4:  3F        .db $3F
  $F5B5:  9F        .db $9F
  $F5B6:  DF        .db $DF
  $F5B7:  DF        .db $DF
  $F5B8:  DF        .db $DF
  $F5B9:  DF        .db $DF
  $F5BA:  DF        .db $DF
  $F5BB:  8F        .db $8F
  $F5BC:  89        .db $89
  $F5BD:  49 49     EOR #$49
  $F5BF:  29 29     AND #$29
  $F5C1:  19 09 70  ORA $7009,Y
  $F5C4:  7E BE BE  ROR $BEBE,X
  $F5C7:  DE DE EE  DEC $EEDE,X
  $F5CA:  FE F3 92  INC $92F3,X
  $F5CD:  92        .db $92
  $F5CE:  92        .db $92
  $F5CF:  92        .db $92
  $F5D0:  9E        .db $9E
  $F5D1:  92        .db $92
  $F5D2:  92        .db $92
  $F5D3:  0C        .db $0C
  $F5D4:  EF        .db $EF
  $F5D5:  EF        .db $EF
  $F5D6:  EF        .db $EF
  $F5D7:  EF        .db $EF
  $F5D8:  E3        .db $E3
  $F5D9:  EF        .db $EF
  $F5DA:  EF        .db $EF
  $F5DB:  C1 42     CMP ($42,X)
  $F5DD:  44        .db $44
  $F5DE:  44        .db $44
  $F5DF:  44        .db $44
  $F5E0:  48        PHA
  $F5E1:  49 49     EOR #$49
  $F5E3:  3E BF BF  ROL $BFBF,X
  $F5E6:  BF        .db $BF
  $F5E7:  BF        .db $BF
  $F5E8:  BF        .db $BF
  $F5E9:  BE BE F0  LDX $F0BE,Y
  $F5EC:  18        CLC
  $F5ED:  08        PHP
  $F5EE:  08        PHP
  $F5EF:  CC A4 24  CPY $24A4
  $F5F2:  24 0F     BIT $0F
  $F5F4:  E7        .db $E7
  $F5F5:  F7        .db $F7
  $F5F6:  F7        .db $F7
  $F5F7:  73        .db $73
  $F5F8:  7B        .db $7B
  $F5F9:  FB        .db $FB
  $F5FA:  FB        .db $FB
  $F5FB:  7F        .db $7F
  $F5FC:  81 80     STA ($80,X)
  $F5FE:  9C        .db $9C
  $F5FF:  92        .db $92
  $F600:  92        .db $92
  $F601:  92        .db $92
  $F602:  92        .db $92
  $F603:  80        .db $80
  $F604:  FE FF EF  INC $EFFF,X
  $F607:  EF        .db $EF
  $F608:  EF        .db $EF
  $F609:  EF        .db $EF
  $F60A:  EF        .db $EF
  $F60B:  07        .db $07
  $F60C:  88        DEY
  $F60D:  C8        INY
  $F60E:  49 49     EOR #$49
  $F610:  49 49     EOR #$49
  $F612:  49 F8     EOR #$F8
  $F614:  7F        .db $7F
  $F615:  3F        .db $3F
  $F616:  BE BE BE  LDX $BEBE,Y
  $F619:  BE BE F0  LDX $F0BE,Y
  $F61C:  18        CLC
  $F61D:  0C        .db $0C
  $F61E:  C4 24     CPY $24
  $F620:  24 24     BIT $24
  $F622:  24 0F     BIT $0F
  $F624:  E7        .db $E7
  $F625:  F3        .db $F3
  $F626:  FB        .db $FB
  $F627:  FB        .db $FB
  $F628:  FB        .db $FB
  $F629:  FB        .db $FB
  $F62A:  FB        .db $FB
  $F62B:  7E 42 42  ROR $4242,X
  $F62E:  24 24     BIT $24
  $F630:  24 24     BIT $24
  $F632:  24 81     BIT $81
  $F634:  FD FD FB  SBC $FBFD,X
  $F637:  FB        .db $FB
  $F638:  FB        .db $FB
  $F639:  FB        .db $FB
  $F63A:  FB        .db $FB
  $F63B:  0F        .db $0F
  $F63C:  10 20     BPL $F65E
  $F63E:  46 49     LSR $49
  $F640:  49 49     EOR #$49
  $F642:  49 F0     EOR #$F0
  $F644:  FF        .db $FF
  $F645:  FF        .db $FF
  $F646:  FF        .db $FF
  $F647:  F7        .db $F7
  $F648:  F7        .db $F7
  $F649:  F7        .db $F7
  $F64A:  F7        .db $F7
  $F64B:  83        .db $83
  $F64C:  C4 64     CPY $64
  $F64E:  24 24     BIT $24
  $F650:  24 24     BIT $24
  $F652:  24 7C     BIT $7C
  $F654:  3F        .db $3F
  $F655:  9F        .db $9F
  $F656:  DF        .db $DF
  $F657:  DF        .db $DF
  $F658:  DF        .db $DF
  $F659:  DF        .db $DF
  $F65A:  DF        .db $DF
  $F65B:  F8        SED
  $F65C:  0C        .db $0C
  $F65D:  06 E2     ASL $E2
  $F65F:  92        .db $92
  $F660:  92        .db $92
  $F661:  92        .db $92
  $F662:  92        .db $92
  $F663:  07        .db $07
  $F664:  F3        .db $F3
  $F665:  F9 7D 7D  SBC $7D7D,Y
  $F668:  7D 7D 7D  ADC $7D7D,X
  $F66B:  92        .db $92
  $F66C:  92        .db $92
  $F66D:  92        .db $92
  $F66E:  94 98     STY $98,X
  $F670:  80        .db $80
  $F671:  81 7E     STA ($7E,X)
  $F673:  EF        .db $EF
  $F674:  EF        .db $EF
  $F675:  EF        .db $EF
  $F676:  EF        .db $EF
  $F677:  E7        .db $E7
  $F678:  FF        .db $FF
  $F679:  FF        .db $FF
  $F67A:  FF        .db $FF
  $F67B:  49 48     EOR #$48
  $F67D:  48        PHA
  $F67E:  49 49     EOR #$49
  $F680:  89        .db $89
  $F681:  09 0F     ORA #$0F
  $F683:  BE BF BF  LDX $BFBF,Y
  $F686:  BE BE FE  LDX $FEBE,Y
  $F689:  FE FE C4  INC $C4FE,X
  $F68C:  08        PHP
  $F68D:  10 90     BPL $F61F
  $F68F:  48        PHA
  $F690:  24 24     BIT $24
  $F692:  3C        .db $3C
  $F693:  3F        .db $3F
  $F694:  FF        .db $FF
  $F695:  EF        .db $EF
  $F696:  EF        .db $EF
  $F697:  F7        .db $F7
  $F698:  FB        .db $FB
  $F699:  FB        .db $FB
  $F69A:  FB        .db $FB
  $F69B:  9C        .db $9C
  $F69C:  90 90     BCC $F62E
  $F69E:  9C        .db $9C
  $F69F:  92        .db $92
  $F6A0:  92        .db $92
  $F6A1:  92        .db $92
  $F6A2:  F3        .db $F3
  $F6A3:  E3        .db $E3
  $F6A4:  EF        .db $EF
  $F6A5:  EF        .db $EF
  $F6A6:  EF        .db $EF
  $F6A7:  EF        .db $EF
  $F6A8:  EF        .db $EF
  $F6A9:  EF        .db $EF
  $F6AA:  EF        .db $EF
  $F6AB:  49 49     EOR #$49
  $F6AD:  49 49     EOR #$49
  $F6AF:  48        PHA
  $F6B0:  44        .db $44
  $F6B1:  42        .db $42
  $F6B2:  C1 BE     CMP ($BE,X)
  $F6B4:  BE BE BE  LDX $BEBE,Y
  $F6B7:  BF        .db $BF
  $F6B8:  BF        .db $BF
  $F6B9:  BF        .db $BF
  $F6BA:  BF        .db $BF
  $F6BB:  42        .db $42
  $F6BC:  42        .db $42
  $F6BD:  24 24     BIT $24
  $F6BF:  E4 04     CPX $04
  $F6C1:  04        .db $04
  $F6C2:  FC        .db $FC
  $F6C3:  FD FD FB  SBC $FBFD,X
  $F6C6:  FB        .db $FB
  $F6C7:  3B        .db $3B
  $F6C8:  FB        .db $FB
  $F6C9:  FB        .db $FB
  $F6CA:  FB        .db $FB
  $F6CB:  49 49     EOR #$49
  $F6CD:  49 49     EOR #$49
  $F6CF:  46 20     LSR $20
  $F6D1:  10 0F     BPL $F6E2
  $F6D3:  F7        .db $F7
  $F6D4:  F7        .db $F7
  $F6D5:  F7        .db $F7
  $F6D6:  F7        .db $F7
  $F6D7:  F9 FF FF  SBC $FFFF,Y
  $F6DA:  FF        .db $FF
  $F6DB:  24 24     BIT $24
  $F6DD:  24 24     BIT $24
  $F6DF:  24 44     BIT $44
  $F6E1:  84 07     STY $07
  $F6E3:  DF        .db $DF
  $F6E4:  DF        .db $DF
  $F6E5:  DF        .db $DF
  $F6E6:  DF        .db $DF
  $F6E7:  DF        .db $DF
  $F6E8:  FF        .db $FF
  $F6E9:  FF        .db $FF
  $F6EA:  FF        .db $FF
  $F6EB:  81 C1     STA ($C1,X)
  $F6ED:  A1 A1     LDA ($A1,X)
  $F6EF:  91 91     STA ($91),Y
  $F6F1:  89        .db $89
  $F6F2:  8F        .db $8F
  $F6F3:  7E 7E 7E  ROR $7E7E,X
  $F6F6:  7E 7E 7E  ROR $7E7E,X
  $F6F9:  7E 7E 80  ROR $807E,X
  $F6FC:  80        .db $80
  $F6FD:  8C 8C 92  STY $928C
  $F700:  92        .db $92
  $F701:  92        .db $92
  $F702:  F3        .db $F3
  $F703:  FF        .db $FF
  $F704:  FF        .db $FF
  $F705:  F7        .db $F7
  $F706:  F7        .db $F7
  $F707:  EF        .db $EF
  $F708:  EF        .db $EF
  $F709:  EF        .db $EF
  $F70A:  EF        .db $EF
  $F70B:  49 49     EOR #$49
  $F70D:  49 49     EOR #$49
  $F70F:  49 49     EOR #$49
  $F711:  49 CF     EOR #$CF
  $F713:  BE BE BE  LDX $BEBE,Y
  $F716:  BE BE BE  LDX $BEBE,Y
  $F719:  BE BE C4  LDX $C4BE,Y
  $F71C:  04        .db $04
  $F71D:  04        .db $04
  $F71E:  C4 24     CPY $24
  $F720:  24 24     BIT $24
  $F722:  3C        .db $3C
  $F723:  3B        .db $3B
  $F724:  FB        .db $FB
  $F725:  FB        .db $FB
  $F726:  FB        .db $FB
  $F727:  FB        .db $FB
  $F728:  FB        .db $FB
  $F729:  FB        .db $FB
  $F72A:  FB        .db $FB
  $F72B:  9C        .db $9C
  $F72C:  80        .db $80
  $F72D:  81 99     STA ($99,X)
  $F72F:  94 92     STY $92,X
  $F731:  92        .db $92
  $F732:  F3        .db $F3
  $F733:  E3        .db $E3
  $F734:  FF        .db $FF
  $F735:  FE EE EF  INC $EFEE,X
  $F738:  EF        .db $EF
  $F739:  EF        .db $EF
  $F73A:  EF        .db $EF
  $F73B:  49 88     EOR #$88
  $F73D:  08        PHP
  $F73E:  09 89     ORA #$89
  $F740:  49 49     EOR #$49
  $F742:  CF        .db $CF
  $F743:  FE FF FF  INC $FFFF,X
  $F746:  FE 7E BE  INC $BE7E,X
  $F749:  BE BE C4  LDX $C4BE,Y
  $F74C:  08        PHP
  $F74D:  10 90     BPL $F6DF
  $F74F:  48        PHA
  $F750:  24 24     BIT $24
  $F752:  3C        .db $3C
  $F753:  3F        .db $3F
  $F754:  FF        .db $FF
  $F755:  EF        .db $EF
  $F756:  EF        .db $EF
  $F757:  F7        .db $F7
  $F758:  FB        .db $FB
  $F759:  FB        .db $FB
  $F75A:  FB        .db $FB
  $F75B:  24 24     BIT $24
  $F75D:  24 24     BIT $24
  $F75F:  24 22     BIT $22
  $F761:  42        .db $42
  $F762:  7E FB FB  ROR $FBFB,X
  $F765:  FB        .db $FB
  $F766:  FB        .db $FB
  $F767:  FB        .db $FB
  $F768:  FD FD FF  SBC $FFFD,X
  $F76B:  49 49     EOR #$49
  $F76D:  49 49     EOR #$49
  $F76F:  46 20     LSR $20
  $F771:  10 0F     BPL $F782
  $F773:  F7        .db $F7
  $F774:  F7        .db $F7
  $F775:  F7        .db $F7
  $F776:  F7        .db $F7
  $F777:  F9 FF FF  SBC $FFFF,Y
  $F77A:  FF        .db $FF
  $F77B:  24 24     BIT $24
  $F77D:  24 24     BIT $24
  $F77F:  24 44     BIT $44
  $F781:  84 07     STY $07
  $F783:  DF        .db $DF
  $F784:  DF        .db $DF
  $F785:  DF        .db $DF
  $F786:  DF        .db $DF
  $F787:  DF        .db $DF
  $F788:  FF        .db $FF
  $F789:  FF        .db $FF
  $F78A:  FF        .db $FF
  $F78B:  E2        .db $E2
  $F78C:  04        .db $04
  $F78D:  08        PHP
  $F78E:  C8        INY
  $F78F:  A4 92     LDY $92
  $F791:  92        .db $92
  $F792:  9E        .db $9E
  $F793:  1F        .db $1F
  $F794:  FF        .db $FF
  $F795:  F7        .db $F7
  $F796:  77        .db $77
  $F797:  7B        .db $7B
  $F798:  7D 7D 7D  ADC $7D7D,X
  $F79B:  FF        .db $FF
  $F79C:  80        .db $80
  $F79D:  80        .db $80
  $F79E:  80        .db $80
  $F79F:  80        .db $80
  $F7A0:  E1 21     SBC ($21,X)
  $F7A2:  21 00     AND ($00,X)
  $F7A4:  FF        .db $FF
  $F7A5:  FF        .db $FF
  $F7A6:  FF        .db $FF
  $F7A7:  FF        .db $FF
  $F7A8:  FF        .db $FF
  $F7A9:  FE FE FF  INC vec_IRQ,X
  $F7AC:  00        BRK
  $F7AD:  00        BRK
  $F7AE:  00        BRK
  $F7AF:  00        BRK
  $F7B0:  C3        .db $C3
  $F7B1:  42        .db $42
  $F7B2:  42        .db $42
  $F7B3:  00        BRK
  $F7B4:  FF        .db $FF
  $F7B5:  FF        .db $FF
  $F7B6:  FF        .db $FF
  $F7B7:  FF        .db $FF
  $F7B8:  FF        .db $FF
  $F7B9:  FD FD 9F  SBC $9FFD,X
  $F7BC:  90 90     BCC $F74E
  $F7BE:  90 90     BCC $F750
  $F7C0:  9C        .db $9C
  $F7C1:  04        .db $04
  $F7C2:  04        .db $04
  $F7C3:  60        RTS
  $F7C4:  7F        .db $7F
  $F7C5:  7F        .db $7F
  $F7C6:  7F        .db $7F
  $F7C7:  7F        .db $7F
  $F7C8:  7F        .db $7F
  $F7C9:  FF        .db $FF
  $F7CA:  FF        .db $FF
  $F7CB:  F8        SED
  $F7CC:  08        PHP
  $F7CD:  08        PHP
  $F7CE:  08        PHP
  $F7CF:  08        PHP
  $F7D0:  38        SEC
  $F7D1:  20 20 07  JSR $0720
  $F7D4:  F7        .db $F7
  $F7D5:  F7        .db $F7
  $F7D6:  F7        .db $F7
  $F7D7:  F7        .db $F7
  $F7D8:  F7        .db $F7
  $F7D9:  DF        .db $DF
  $F7DA:  DF        .db $DF
  $F7DB:  21 21     AND ($21,X)
  $F7DD:  21 21     AND ($21,X)
  $F7DF:  21 21     AND ($21,X)
  $F7E1:  21 21     AND ($21,X)
  $F7E3:  FE FE FE  INC $FEFE,X
  $F7E6:  FE FE FE  INC $FEFE,X
  $F7E9:  FE FE 21  INC $21FE,X
  $F7EC:  21 21     AND ($21,X)
  $F7EE:  21 10     AND ($10,X)
  $F7F0:  10 10     BPL $F802
  $F7F2:  10 FE     BPL $F7F2
  $F7F4:  FE FE FE  INC $FEFE,X
  $F7F7:  FF        .db $FF
  $F7F8:  FF        .db $FF
  $F7F9:  FF        .db $FF
  $F7FA:  FF        .db $FF
  $F7FB:  08        PHP
  $F7FC:  08        PHP
  $F7FD:  08        PHP
  $F7FE:  08        PHP
  $F7FF:  90 90     BCC $F791
  $F801:  90 90     BCC $F793
  $F803:  FF        .db $FF
  $F804:  FF        .db $FF
  $F805:  FF        .db $FF
  $F806:  FF        .db $FF
  $F807:  7F        .db $7F
  $F808:  7F        .db $7F
  $F809:  7F        .db $7F
  $F80A:  7F        .db $7F
  $F80B:  40        RTI
  $F80C:  42        .db $42
  $F80D:  40        RTI
  $F80E:  40        RTI
  $F80F:  80        .db $80
  $F810:  88        DEY
  $F811:  80        .db $80
  $F812:  80        .db $80
  $F813:  BF        .db $BF
  $F814:  BF        .db $BF
  $F815:  BF        .db $BF
  $F816:  BF        .db $BF
  $F817:  7F        .db $7F
  $F818:  77        .db $77
  $F819:  7F        .db $7F
  $F81A:  7F        .db $7F
  $F81B:  21 21     AND ($21,X)
  $F81D:  21 21     AND ($21,X)
  $F81F:  21 21     AND ($21,X)
  $F821:  21 21     AND ($21,X)
  $F823:  FE FE FE  INC $FEFE,X
  $F826:  FE FE FE  INC $FEFE,X
  $F829:  FE FE 08  INC $08FE,X
  $F82C:  08        PHP
  $F82D:  08        PHP
  $F82E:  08        PHP
  $F82F:  04        .db $04
  $F830:  44        .db $44
  $F831:  04        .db $04
  $F832:  04        .db $04
  $F833:  FF        .db $FF
  $F834:  FF        .db $FF
  $F835:  FF        .db $FF
  $F836:  FF        .db $FF
  $F837:  FF        .db $FF
  $F838:  FF        .db $FF
  $F839:  FF        .db $FF
  $F83A:  FF        .db $FF
  $F83B:  61 61     ADC ($61,X)
  $F83D:  61 61     ADC ($61,X)
  $F83F:  02        .db $02
  $F840:  02        .db $02
  $F841:  02        .db $02
  $F842:  02        .db $02
  $F843:  BE BE BE  LDX $BEBE,Y
  $F846:  BE FD FD  LDX $FDFD,Y
  $F849:  FD FD 00  SBC $00FD,X
  $F84C:  00        BRK
  $F84D:  12        .db $12
  $F84E:  00        BRK
  $F84F:  00        BRK
  $F850:  40        RTI
  $F851:  00        BRK
  $F852:  00        BRK
  $F853:  FF        .db $FF
  $F854:  FF        .db $FF
  $F855:  FD FF FF  SBC $FFFF,X
  $F858:  FF        .db $FF
  $F859:  FF        .db $FF
  $F85A:  FF        .db $FF
  $F85B:  21 21     AND ($21,X)
  $F85D:  E1 80     SBC ($80,X)
  $F85F:  80        .db $80
  $F860:  80        .db $80
  $F861:  80        .db $80
  $F862:  FF        .db $FF
  $F863:  FE FE 3E  INC $3EFE,X
  $F866:  FF        .db $FF
  $F867:  FF        .db $FF
  $F868:  FF        .db $FF
  $F869:  FF        .db $FF
  $F86A:  FF        .db $FF
  $F86B:  02        .db $02
  $F86C:  02        .db $02
  $F86D:  C2        .db $C2
  $F86E:  42        .db $42
  $F86F:  41 49     EOR ($49,X)
  $F871:  41 C1     EOR ($C1,X)
  $F873:  FF        .db $FF
  $F874:  FF        .db $FF
  $F875:  3F        .db $3F
  $F876:  BF        .db $BF
  $F877:  BF        .db $BF
  $F878:  B7        .db $B7
  $F879:  BF        .db $BF
  $F87A:  BF        .db $BF
  $F87B:  04        .db $04
  $F87C:  04        .db $04
  $F87D:  04        .db $04
  $F87E:  04        .db $04
  $F87F:  08        PHP
  $F880:  08        PHP
  $F881:  08        PHP
  $F882:  F8        SED
  $F883:  FB        .db $FB
  $F884:  FB        .db $FB
  $F885:  FB        .db $FB
  $F886:  FB        .db $FB
  $F887:  F7        .db $F7
  $F888:  F7        .db $F7
  $F889:  F7        .db $F7
  $F88A:  F7        .db $F7
  $F88B:  00        BRK
  $F88C:  02        .db $02
  $F88D:  40        RTI
  $F88E:  00        BRK
  $F88F:  00        BRK
  $F890:  08        PHP
  $F891:  00        BRK
  $F892:  00        BRK
  $F893:  FF        .db $FF
  $F894:  FF        .db $FF
  $F895:  FF        .db $FF
  $F896:  FF        .db $FF
  $F897:  FF        .db $FF
  $F898:  F7        .db $F7
  $F899:  FF        .db $FF
  $F89A:  FF        .db $FF
  $F89B:  FE 82 82  INC $8282,X
  $F89E:  EE 28 28  INC $2828
  $F8A1:  28        PLP
  $F8A2:  38        SEC
  $F8A3:  01 FD     ORA ($FD,X)
  $F8A5:  FD F1 F7  SBC $F7F1,X
  $F8A8:  F7        .db $F7
  $F8A9:  F7        .db $F7
  $F8AA:  F7        .db $F7
  $F8AB:  C3        .db $C3
  $F8AC:  A5 99     LDA $99
  $F8AE:  81 81     STA ($81,X)
  $F8B0:  BD A5 E7  LDA $E7A5,X
  $F8B3:  3C        .db $3C
  $F8B4:  DE EE FE  DEC $FEEE,X
  $F8B7:  FE D6 DE  INC $DED6,X
  $F8BA:  DE 00 00  DEC $0000,X
  $F8BD:  00        BRK
  $F8BE:  00        BRK
  $F8BF:  00        BRK
  $F8C0:  00        BRK
  $F8C1:  00        BRK
  $F8C2:  01 00     ORA ($00,X)
  $F8C4:  00        BRK
  $F8C5:  00        BRK
  $F8C6:  00        BRK
  $F8C7:  00        BRK
  $F8C8:  00        BRK
  $F8C9:  00        BRK
  $F8CA:  01 00     ORA ($00,X)
  $F8CC:  01 07     ORA ($07,X)
  $F8CE:  1F        .db $1F
  $F8CF:  3F        .db $3F
  $F8D0:  7F        .db $7F
  $F8D1:  FE FC 00  INC $00FC,X
  $F8D4:  01 07     ORA ($07,X)
  $F8D6:  1F        .db $1F
  $F8D7:  3F        .db $3F
  $F8D8:  7F        .db $7F
  $F8D9:  FE FC 7F  INC $7FFC,X
  $F8DC:  FF        .db $FF
  $F8DD:  F1 C0     SBC ($C0),Y
  $F8DF:  80        .db $80
  $F8E0:  00        BRK
  $F8E1:  00        BRK
  $F8E2:  00        BRK
  $F8E3:  7F        .db $7F
  $F8E4:  FF        .db $FF
  $F8E5:  F1 C0     SBC ($C0),Y
  $F8E7:  80        .db $80
  $F8E8:  00        BRK
  $F8E9:  00        BRK
  $F8EA:  00        BRK
  $F8EB:  80        .db $80
  $F8EC:  E0 F0     CPX #$F0
  $F8EE:  F0 78     BEQ $F968
  $F8F0:  78        SEI
  $F8F1:  78        SEI
  $F8F2:  78        SEI
  $F8F3:  80        .db $80
  $F8F4:  E0 F0     CPX #$F0
  $F8F6:  F0 78     BEQ $F970
  $F8F8:  78        SEI
  $F8F9:  78        SEI
  $F8FA:  78        SEI
  $F8FB:  01 03     ORA ($03,X)
  $F8FD:  07        .db $07
  $F8FE:  07        .db $07
  $F8FF:  0F        .db $0F
  $F900:  0F        .db $0F
  $F901:  1F        .db $1F
  $F902:  1F        .db $1F
  $F903:  01 03     ORA ($03,X)
  $F905:  07        .db $07
  $F906:  07        .db $07
  $F907:  0F        .db $0F
  $F908:  0F        .db $0F
  $F909:  1F        .db $1F
  $F90A:  1F        .db $1F
  $F90B:  FC        .db $FC
  $F90C:  F8        SED
  $F90D:  F8        SED
  $F90E:  F0 F0     BEQ $F900
  $F910:  F0 E0     BEQ $F8F2
  $F912:  E0 FC     CPX #$FC
  $F914:  F8        SED
  $F915:  F8        SED
  $F916:  F0 F0     BEQ $F908
  $F918:  F0 E0     BEQ $F8FA
  $F91A:  E0 00     CPX #$00
  $F91C:  00        BRK
  $F91D:  01 03     ORA ($03,X)
  $F91F:  07        .db $07
  $F920:  0F        .db $0F
  $F921:  3E 78 00  ROL $0078,X
  $F924:  00        BRK
  $F925:  01 03     ORA ($03,X)
  $F927:  07        .db $07
  $F928:  0F        .db $0F
  $F929:  3E 78 F8  ROL $F878,X
  $F92C:  F0 F2     BEQ $F920
  $F92E:  E2        .db $E2
  $F92F:  C6 86     DEC $86
  $F931:  0C        .db $0C
  $F932:  0C        .db $0C
  $F933:  F8        SED
  $F934:  F0 F2     BEQ $F928
  $F936:  E2        .db $E2
  $F937:  C6 86     DEC $86
  $F939:  0C        .db $0C
  $F93A:  0C        .db $0C
  $F93B:  3F        .db $3F
  $F93C:  3F        .db $3F
  $F93D:  3F        .db $3F
  $F93E:  7F        .db $7F
  $F93F:  7F        .db $7F
  $F940:  7F        .db $7F
  $F941:  7F        .db $7F
  $F942:  7F        .db $7F
  $F943:  3F        .db $3F
  $F944:  3F        .db $3F
  $F945:  3F        .db $3F
  $F946:  7F        .db $7F
  $F947:  7F        .db $7F
  $F948:  7F        .db $7F
  $F949:  7F        .db $7F
  $F94A:  7F        .db $7F
  $F94B:  E1 FF     SBC ($FF,X)
  $F94D:  F0 F0     BEQ $F93F
  $F94F:  F8        SED
  $F950:  FE FF FF  INC $FFFF,X
  $F953:  E1 FF     SBC ($FF,X)
  $F955:  F0 F0     BEQ $F947
  $F957:  F8        SED
  $F958:  FE FF FF  INC $FFFF,X
  $F95B:  E0 00     CPX #$00
  $F95D:  00        BRK
  $F95E:  00        BRK
  $F95F:  03        .db $03
  $F960:  1F        .db $1F
  $F961:  FF        .db $FF
  $F962:  FF        .db $FF
  $F963:  E0 00     CPX #$00
  $F965:  00        BRK
  $F966:  00        BRK
  $F967:  03        .db $03
  $F968:  1F        .db $1F
  $F969:  FF        .db $FF
  $F96A:  FF        .db $FF
  $F96B:  1C        .db $1C
  $F96C:  38        SEC
  $F96D:  78        SEI
  $F96E:  F0 F0     BEQ $F960
  $F970:  E0 E0     CPX #$E0
  $F972:  C0 1C     CPY #$1C
  $F974:  38        SEC
  $F975:  78        SEI
  $F976:  F0 F0     BEQ $F968
  $F978:  E0 E0     CPX #$E0
  $F97A:  C0 7F     CPY #$7F
  $F97C:  3F        .db $3F
  $F97D:  3F        .db $3F
  $F97E:  1F        .db $1F
  $F97F:  1F        .db $1F
  $F980:  0F        .db $0F
  $F981:  07        .db $07
  $F982:  01 7F     ORA ($7F,X)
  $F984:  3F        .db $3F
  $F985:  3F        .db $3F
  $F986:  1F        .db $1F
  $F987:  1F        .db $1F
  $F988:  0F        .db $0F
  $F989:  07        .db $07
  $F98A:  01 FF     ORA ($FF,X)
  $F98C:  FF        .db $FF
  $F98D:  FF        .db $FF
  $F98E:  FF        .db $FF
  $F98F:  FF        .db $FF
  $F990:  FF        .db $FF
  $F991:  FF        .db $FF
  $F992:  FC        .db $FC
  $F993:  FF        .db $FF
  $F994:  FF        .db $FF
  $F995:  FF        .db $FF
  $F996:  FF        .db $FF
  $F997:  FF        .db $FF
  $F998:  FF        .db $FF
  $F999:  FF        .db $FF
  $F99A:  FC        .db $FC
  $F99B:  FF        .db $FF
  $F99C:  FF        .db $FF
  $F99D:  FE FC F8  INC $F8FC,X
  $F9A0:  E0 80     CPX #$80
  $F9A2:  00        BRK
  $F9A3:  FF        .db $FF
  $F9A4:  FF        .db $FF
  $F9A5:  FE FC F8  INC $F8FC,X
  $F9A8:  E0 80     CPX #$80
  $F9AA:  00        BRK
  $F9AB:  80        .db $80
  $F9AC:  00        BRK
  $F9AD:  00        BRK
  $F9AE:  00        BRK
  $F9AF:  00        BRK
  $F9B0:  00        BRK
  $F9B1:  00        BRK
  $F9B2:  00        BRK
  $F9B3:  80        .db $80
  $F9B4:  00        BRK
  $F9B5:  00        BRK
  $F9B6:  00        BRK
  $F9B7:  00        BRK
  $F9B8:  00        BRK
  $F9B9:  00        BRK
  $F9BA:  00        BRK
  $F9BB:  00        BRK
  $F9BC:  00        BRK
  $F9BD:  00        BRK
  $F9BE:  3F        .db $3F
  $F9BF:  40        RTI
  $F9C0:  40        RTI
  $F9C1:  40        RTI
  $F9C2:  40        RTI
  $F9C3:  00        BRK
  $F9C4:  00        BRK
  $F9C5:  00        BRK
  $F9C6:  3F        .db $3F
  $F9C7:  40        RTI
  $F9C8:  40        RTI
  $F9C9:  40        RTI
  $F9CA:  40        RTI
  $F9CB:  00        BRK
  $F9CC:  00        BRK
  $F9CD:  00        BRK
  $F9CE:  20 70 50  JSR $5070
  $F9D1:  58        CLI
  $F9D2:  48        PHA
  $F9D3:  00        BRK
  $F9D4:  00        BRK
  $F9D5:  00        BRK
  $F9D6:  20 70 50  JSR $5070
  $F9D9:  58        CLI
  $F9DA:  48        PHA
  $F9DB:  00        BRK
  $F9DC:  00        BRK
  $F9DD:  00        BRK
  $F9DE:  49 49     EOR #$49
  $F9E0:  48        PHA
  $F9E1:  48        PHA
  $F9E2:  48        PHA
  $F9E3:  00        BRK
  $F9E4:  00        BRK
  $F9E5:  00        BRK
  $F9E6:  49 49     EOR #$49
  $F9E8:  48        PHA
  $F9E9:  48        PHA
  $F9EA:  48        PHA
  $F9EB:  00        BRK
  $F9EC:  00        BRK
  $F9ED:  00        BRK
  $F9EE:  02        .db $02
  $F9EF:  86 84     STX $84
  $F9F1:  CC 48 00  CPY $0048
  $F9F4:  00        BRK
  $F9F5:  00        BRK
  $F9F6:  02        .db $02
  $F9F7:  86 84     STX $84
  $F9F9:  CC 48 40  CPY $4048
  $F9FC:  7E 60 60  ROR $6060,X
  $F9FF:  60        RTS
  $FA00:  60        RTS
  $FA01:  60        RTS
  $FA02:  3F        .db $3F
  $FA03:  40        RTI
  $FA04:  7E 60 60  ROR $6060,X
  $FA07:  60        RTS
  $FA08:  60        RTS
  $FA09:  60        RTS
  $FA0A:  3F        .db $3F
  $FA0B:  4E 47 47  LSR $4747
  $FA0E:  43        .db $43
  $FA0F:  43        .db $43
  $FA10:  41 41     EOR ($41,X)
  $FA12:  40        RTI
  $FA13:  4E 47 47  LSR $4747
  $FA16:  43        .db $43
  $FA17:  43        .db $43
  $FA18:  41 41     EOR ($41,X)
  $FA1A:  40        RTI
  $FA1B:  48        PHA
  $FA1C:  4C 4C CC  JMP $CC4C
  $FA1F:  CC CC CD  CPY $CDCC
  $FA22:  8D 48 4C  STA $4C48
  $FA25:  4C CC CC  JMP $CCCC
  $FA28:  CC CD 8D  CPY $8DCD
  $FA2B:  78        SEI
  $FA2C:  38        SEC
  $FA2D:  7C        .db $7C
  $FA2E:  4C CE 86  JMP $86CE
  $FA31:  87        .db $87
  $FA32:  03        .db $03
  $FA33:  78        SEI
  $FA34:  38        SEC
  $FA35:  7C        .db $7C
  $FA36:  4C CE 86  JMP $86CE
  $FA39:  87        .db $87
  $FA3A:  03        .db $03
  $FA3B:  ED 80 02  SBC $0280
  $FA3E:  90 80     BCC $F9C0
  $FA40:  20 82 80  JSR $8082
  $FA43:  FF        .db $FF
  $FA44:  FF        .db $FF
  $FA45:  FF        .db $FF
  $FA46:  EF        .db $EF
  $FA47:  FF        .db $FF
  $FA48:  FF        .db $FF
  $FA49:  FF        .db $FF
  $FA4A:  FF        .db $FF
  $FA4B:  5D 00 20  EOR $2000,X
  $FA4E:  00        BRK
  $FA4F:  00        BRK
  $FA50:  08        PHP
  $FA51:  00        BRK
  $FA52:  00        BRK
  $FA53:  FF        .db $FF
  $FA54:  FF        .db $FF
  $FA55:  DF        .db $DF
  $FA56:  FF        .db $FF
  $FA57:  FF        .db $FF
  $FA58:  FF        .db $FF
  $FA59:  FF        .db $FF
  $FA5A:  FF        .db $FF
  $FA5B:  AF        .db $AF
  $FA5C:  00        BRK
  $FA5D:  08        PHP
  $FA5E:  00        BRK
  $FA5F:  80        .db $80
  $FA60:  02        .db $02
  $FA61:  00        BRK
  $FA62:  00        BRK
  $FA63:  FF        .db $FF
  $FA64:  FF        .db $FF
  $FA65:  FF        .db $FF
  $FA66:  FF        .db $FF
  $FA67:  FF        .db $FF
  $FA68:  FD FF FF  SBC $FFFF,X
  $FA6B:  7D 83 0B  ADC $0B83,X
  $FA6E:  41 03     EOR ($03,X)
  $FA70:  09 21     ORA #$21
  $FA72:  01 FF     ORA ($FF,X)
  $FA74:  FF        .db $FF
  $FA75:  FF        .db $FF
  $FA76:  FF        .db $FF
  $FA77:  FF        .db $FF
  $FA78:  FF        .db $FF
  $FA79:  DF        .db $DF
  $FA7A:  FF        .db $FF
  $FA7B:  80        .db $80
  $FA7C:  A0 84     LDY #$84
  $FA7E:  80        .db $80
  $FA7F:  80        .db $80
  $FA80:  84 40     STY $40
  $FA82:  80        .db $80
  $FA83:  FF        .db $FF
  $FA84:  FF        .db $FF
  $FA85:  FB        .db $FB
  $FA86:  FF        .db $FF
  $FA87:  FF        .db $FF
  $FA88:  FF        .db $FF
  $FA89:  FF        .db $FF
  $FA8A:  FF        .db $FF
  $FA8B:  00        BRK
  $FA8C:  02        .db $02
  $FA8D:  40        RTI
  $FA8E:  00        BRK
  $FA8F:  00        BRK
  $FA90:  08        PHP
  $FA91:  00        BRK
  $FA92:  00        BRK
  $FA93:  FF        .db $FF
  $FA94:  FF        .db $FF
  $FA95:  FF        .db $FF
  $FA96:  FF        .db $FF
  $FA97:  FF        .db $FF
  $FA98:  F7        .db $F7
  $FA99:  FF        .db $FF
  $FA9A:  FF        .db $FF
  $FA9B:  00        BRK
  $FA9C:  04        .db $04
  $FA9D:  10 00     BPL $FA9F
  $FA9F:  40        RTI
  $FAA0:  04        .db $04
  $FAA1:  00        BRK
  $FAA2:  00        BRK
  $FAA3:  FF        .db $FF
  $FAA4:  FF        .db $FF
  $FAA5:  EF        .db $EF
  $FAA6:  FF        .db $FF
  $FAA7:  FF        .db $FF
  $FAA8:  FF        .db $FF
  $FAA9:  FF        .db $FF
  $FAAA:  FF        .db $FF
  $FAAB:  01 03     ORA ($03,X)
  $FAAD:  25 01     AND $01
  $FAAF:  01 09     ORA ($09,X)
  $FAB1:  01 01     ORA ($01,X)
  $FAB3:  FF        .db $FF
  $FAB4:  FF        .db $FF
  $FAB5:  FB        .db $FB
  $FAB6:  FF        .db $FF
  $FAB7:  FF        .db $FF
  $FAB8:  FF        .db $FF
  $FAB9:  FF        .db $FF
  $FABA:  FF        .db $FF
  $FABB:  80        .db $80
  $FABC:  90 82     BCC $FA40
  $FABE:  00        BRK
  $FABF:  A0 80     LDY #$80
  $FAC1:  88        DEY
  $FAC2:  C0 FF     CPY #$FF
  $FAC4:  FF        .db $FF
  $FAC5:  FD FF DF  SBC $DFFF,X
  $FAC8:  FF        .db $FF
  $FAC9:  FF        .db $FF
  $FACA:  FF        .db $FF
  $FACB:  00        BRK
  $FACC:  00        BRK
  $FACD:  12        .db $12
  $FACE:  00        BRK
  $FACF:  00        BRK
  $FAD0:  40        RTI
  $FAD1:  00        BRK
  $FAD2:  00        BRK
  $FAD3:  FF        .db $FF
  $FAD4:  FF        .db $FF
  $FAD5:  FD FF FF  SBC $FFFF,X
  $FAD8:  FF        .db $FF
  $FAD9:  FF        .db $FF
  $FADA:  FF        .db $FF
  $FADB:  00        BRK
  $FADC:  04        .db $04
  $FADD:  00        BRK
  $FADE:  40        RTI
  $FADF:  00        BRK
  $FAE0:  00        BRK
  $FAE1:  08        PHP
  $FAE2:  00        BRK
  $FAE3:  FF        .db $FF
  $FAE4:  FB        .db $FB
  $FAE5:  FF        .db $FF
  $FAE6:  FF        .db $FF
  $FAE7:  FF        .db $FF
  $FAE8:  FF        .db $FF
  $FAE9:  FF        .db $FF
  $FAEA:  FF        .db $FF
  $FAEB:  01 21     ORA ($21,X)
  $FAED:  03        .db $03
  $FAEE:  11 01     ORA ($01),Y
  $FAF0:  41 01     EOR ($01,X)
  $FAF2:  03        .db $03
  $FAF3:  FF        .db $FF
  $FAF4:  FF        .db $FF
  $FAF5:  FF        .db $FF
  $FAF6:  EF        .db $EF
  $FAF7:  FF        .db $FF
  $FAF8:  FF        .db $FF
  $FAF9:  FF        .db $FF
  $FAFA:  FF        .db $FF
  $FAFB:  80        .db $80
  $FAFC:  82        .db $82
  $FAFD:  80        .db $80
  $FAFE:  10 84     BPL $FA84
  $FB00:  80        .db $80
  $FB01:  55 FF     EOR $FF,X
  $FB03:  FF        .db $FF
  $FB04:  FD FF EF  SBC $EFFF,X
  $FB07:  FF        .db $FF
  $FB08:  FF        .db $FF
  $FB09:  FF        .db $FF
  $FB0A:  FF        .db $FF
  $FB0B:  00        BRK
  $FB0C:  00        BRK
  $FB0D:  08        PHP
  $FB0E:  00        BRK
  $FB0F:  02        .db $02

sub_FB10:
  $FB10:  00        BRK
  $FB11:  B6 FF     LDX $FF,Y
  $FB13:  FF        .db $FF
  $FB14:  FF        .db $FF
  $FB15:  FF        .db $FF
  $FB16:  FF        .db $FF
  $FB17:  FF        .db $FF
  $FB18:  FF        .db $FF
  $FB19:  FF        .db $FF
  $FB1A:  FF        .db $FF
  $FB1B:  00        BRK
  $FB1C:  00        BRK
  $FB1D:  00        BRK
  $FB1E:  22        .db $22
  $FB1F:  00        BRK
  $FB20:  00        BRK
  $FB21:  CB        .db $CB
  $FB22:  FF        .db $FF
  $FB23:  FF        .db $FF
  $FB24:  FF        .db $FF
  $FB25:  FF        .db $FF
  $FB26:  DF        .db $DF
  $FB27:  FF        .db $FF
  $FB28:  FF        .db $FF
  $FB29:  FF        .db $FF
  $FB2A:  FF        .db $FF
  $FB2B:  21 01     AND ($01,X)
  $FB2D:  01 11     ORA ($11,X)
  $FB2F:  45 01     EOR $01
  $FB31:  97        .db $97
  $FB32:  FE DF FF  INC mmc1_reset_trigger,X
  $FB35:  FF        .db $FF
  $FB36:  EF        .db $EF
  $FB37:  FF        .db $FF
  $FB38:  FF        .db $FF
  $FB39:  FF        .db $FF
  $FB3A:  FF        .db $FF
  $FB3B:  D6 00     DEC $00,X
  $FB3D:  04        .db $04
  $FB3E:  20 00 14  JSR $1400
  $FB41:  00        BRK
  $FB42:  AB        .db $AB
  $FB43:  FF        .db $FF
  $FB44:  FF        .db $FF
  $FB45:  FF        .db $FF
  $FB46:  DF        .db $DF
  $FB47:  FF        .db $FF
  $FB48:  FB        .db $FB
  $FB49:  FF        .db $FF
  $FB4A:  FF        .db $FF
  $FB4B:  00        BRK
  $FB4C:  00        BRK
  $FB4D:  00        BRK
  $FB4E:  00        BRK
  $FB4F:  00        BRK
  $FB50:  00        BRK
  $FB51:  00        BRK
  $FB52:  00        BRK
  $FB53:  F0 F0     BEQ $FB45
  $FB55:  F0 F0     BEQ $FB47
  $FB57:  00        BRK
  $FB58:  00        BRK
  $FB59:  00        BRK
  $FB5A:  00        BRK
  $FB5B:  00        BRK
  $FB5C:  00        BRK
  $FB5D:  00        BRK
  $FB5E:  00        BRK
  $FB5F:  00        BRK
  $FB60:  00        BRK
  $FB61:  00        BRK
  $FB62:  00        BRK
  $FB63:  C0 C0     CPY #$C0
  $FB65:  00        BRK
  $FB66:  00        BRK
  $FB67:  00        BRK
  $FB68:  00        BRK
  $FB69:  00        BRK
  $FB6A:  00        BRK
  $FB6B:  00        BRK
  $FB6C:  00        BRK
  $FB6D:  00        BRK
  $FB6E:  00        BRK
  $FB6F:  00        BRK
  $FB70:  00        BRK
  $FB71:  00        BRK
  $FB72:  00        BRK
  $FB73:  80        .db $80
  $FB74:  00        BRK
  $FB75:  00        BRK
  $FB76:  00        BRK
  $FB77:  00        BRK
  $FB78:  00        BRK
  $FB79:  00        BRK
  $FB7A:  00        BRK
  $FB7B:  00        BRK
  $FB7C:  00        BRK
  $FB7D:  00        BRK
  $FB7E:  00        BRK
  $FB7F:  00        BRK
  $FB80:  00        BRK
  $FB81:  00        BRK
  $FB82:  00        BRK
  $FB83:  00        BRK
  $FB84:  00        BRK
  $FB85:  00        BRK
  $FB86:  00        BRK
  $FB87:  00        BRK
  $FB88:  00        BRK
  $FB89:  00        BRK
  $FB8A:  00        BRK
  $FB8B:  00        BRK
  $FB8C:  38        SEC
  $FB8D:  6C 6C C6  JMP ($C66C)
  $FB90:  C6 C6     DEC $C6
  $FB92:  C6 FE     DEC $FE
  $FB94:  C6 C6     DEC $C6
  $FB96:  C6 C6     DEC $C6
  $FB98:  C6 C6     DEC $C6
  $FB9A:  C6 00     DEC $00
  $FB9C:  F8        SED
  $FB9D:  CC CE C6  CPY $C6CE
  $FBA0:  C6 C6     DEC $C6
  $FBA2:  C4 F8     CPY $F8
  $FBA4:  C4 C6     CPY $C6
  $FBA6:  C6 C6     DEC $C6
  $FBA8:  CE CC F8  DEC $F8CC
  $FBAB:  00        BRK
  $FBAC:  38        SEC
  $FBAD:  6C EE C6  JMP ($C6EE)
  $FBB0:  C6 C0     DEC $C0
  $FBB2:  C0 C0     CPY #$C0
  $FBB4:  C0 C6     CPY #$C6
  $FBB6:  C6 C6     DEC $C6
  $FBB8:  EE 6C 38  INC $386C
  $FBBB:  00        BRK
  $FBBC:  F8        SED
  $FBBD:  CC C6 C6  CPY $C6C6
  $FBC0:  C6 C6     DEC $C6
  $FBC2:  C6 C6     DEC $C6
  $FBC4:  C6 C6     DEC $C6
  $FBC6:  C6 C6     DEC $C6
  $FBC8:  C6 CC     DEC $CC
  $FBCA:  F8        SED
  $FBCB:  00        BRK
  $FBCC:  FE C0 C0  INC $C0C0,X
  $FBCF:  C0 C0     CPY #$C0
  $FBD1:  C0 C4     CPY #$C4
  $FBD3:  FC        .db $FC
  $FBD4:  C4 C0     CPY $C0
  $FBD6:  C0 C0     CPY #$C0
  $FBD8:  C0 C0     CPY #$C0
  $FBDA:  FE 00 FE  INC $FE00,X
  $FBDD:  C0 C0     CPY #$C0
  $FBDF:  C0 C0     CPY #$C0
  $FBE1:  C0 C4     CPY #$C4
  $FBE3:  FC        .db $FC
  $FBE4:  C4 C0     CPY $C0
  $FBE6:  C0 C0     CPY #$C0
  $FBE8:  C0 C0     CPY #$C0
  $FBEA:  C0 00     CPY #$00
  $FBEC:  38        SEC
  $FBED:  6C EE C6  JMP ($C6EE)
  $FBF0:  C6 C0     DEC $C0
  $FBF2:  D0 DE     BNE $FBD2
  $FBF4:  D6 C6     DEC $C6,X
  $FBF6:  C6 C6     DEC $C6
  $FBF8:  EE 6E 3A  INC $3A6E
  $FBFB:  00        BRK
  $FBFC:  C6 C6     DEC $C6
  $FBFE:  C6 C6     DEC $C6
  $FC00:  C6 C6     DEC $C6
  $FC02:  C6 FE     DEC $FE
  $FC04:  C6 C6     DEC $C6
  $FC06:  C6 C6     DEC $C6
  $FC08:  C6 C6     DEC $C6
  $FC0A:  C6 00     DEC $00
  $FC0C:  3C        .db $3C
  $FC0D:  18        CLC
  $FC0E:  18        CLC
  $FC0F:  18        CLC
  $FC10:  18        CLC
  $FC11:  18        CLC
  $FC12:  18        CLC
  $FC13:  18        CLC
  $FC14:  18        CLC
  $FC15:  18        CLC
  $FC16:  18        CLC
  $FC17:  18        CLC
  $FC18:  18        CLC
  $FC19:  18        CLC
  $FC1A:  3C        .db $3C
  $FC1B:  00        BRK
  $FC1C:  7E 18 18  ROR $1818,X
  $FC1F:  18        CLC
  $FC20:  18        CLC
  $FC21:  18        CLC
  $FC22:  18        CLC
  $FC23:  18        CLC
  $FC24:  18        CLC
  $FC25:  18        CLC
  $FC26:  18        CLC
  $FC27:  18        CLC
  $FC28:  D8        CLD
  $FC29:  F8        SED
  $FC2A:  70 00     BVS $FC2C
  $FC2C:  C4 CC     CPY $CC
  $FC2E:  CC D8 D8  CPY $D8D8
  $FC31:  F0 F0     BEQ $FC23
  $FC33:  F0 F0     BEQ $FC25
  $FC35:  D8        CLD
  $FC36:  D8        CLD
  $FC37:  CC CC C6  CPY $C6CC
  $FC3A:  C6 00     DEC $00
  $FC3C:  C0 C0     CPY #$C0
  $FC3E:  C0 C0     CPY #$C0
  $FC40:  C0 C0     CPY #$C0
  $FC42:  C0 C0     CPY #$C0
  $FC44:  C0 C0     CPY #$C0
  $FC46:  C0 C0     CPY #$C0
  $FC48:  C0 C6     CPY #$C6
  $FC4A:  FE 00 C6  INC $C600,X
  $FC4D:  C6 C6     DEC $C6
  $FC4F:  EE EE FE  INC $FEEE
  $FC52:  FE D6 D6  INC $D6D6,X
  $FC55:  C6 C6     DEC $C6
  $FC57:  C6 C6     DEC $C6
  $FC59:  C6 C6     DEC $C6
  $FC5B:  00        BRK
  $FC5C:  C6 C6     DEC $C6
  $FC5E:  E6 E6     INC $E6
  $FC60:  E6 F6     INC $F6
  $FC62:  F6 F6     INC $F6,X
  $FC64:  DE DE DE  DEC $DEDE,X
  $FC67:  CE CE C6  DEC $C6CE
  $FC6A:  C6 00     DEC $00
  $FC6C:  38        SEC
  $FC6D:  6C EE C6  JMP ($C6EE)
  $FC70:  C6 C6     DEC $C6
  $FC72:  C6 C6     DEC $C6
  $FC74:  C6 C6     DEC $C6
  $FC76:  C6 C6     DEC $C6
  $FC78:  EE 6C 38  INC $386C
  $FC7B:  00        BRK
  $FC7C:  F8        SED
  $FC7D:  CC C6 C6  CPY $C6C6
  $FC80:  C6 C6     DEC $C6
  $FC82:  CC F8 C0  CPY $C0F8
  $FC85:  C0 C0     CPY #$C0
  $FC87:  C0 C0     CPY #$C0
  $FC89:  C0 C0     CPY #$C0
  $FC8B:  00        BRK
  $FC8C:  38        SEC
  $FC8D:  6C EE C6  JMP ($C6EE)
  $FC90:  C6 C6     DEC $C6
  $FC92:  C6 C6     DEC $C6
  $FC94:  C6 C6     DEC $C6
  $FC96:  DE DE EE  DEC $EEDE,X
  $FC99:  6C 3A 00  JMP ($003A)
  $FC9C:  F8        SED
  $FC9D:  CC C6 C6  CPY $C6C6
  $FCA0:  C6 C6     DEC $C6
  $FCA2:  CC F8 D8  CPY $D8F8
  $FCA5:  D8        CLD
  $FCA6:  CC CC C6  CPY $C6CC
  $FCA9:  C6 C2     DEC $C2
  $FCAB:  00        BRK
  $FCAC:  38        SEC
  $FCAD:  6C C6 C0  JMP ($C0C6)
  $FCB0:  C0 C0     CPY #$C0
  $FCB2:  60        RTS
  $FCB3:  38        SEC
  $FCB4:  0C        .db $0C
  $FCB5:  06 06     ASL $06
  $FCB7:  06 C6     ASL $C6
  $FCB9:  6C 38 00  JMP ($0038)
  $FCBC:  7E 5A 18  ROR $185A,X
  $FCBF:  18        CLC
  $FCC0:  18        CLC
  $FCC1:  18        CLC
  $FCC2:  18        CLC
  $FCC3:  18        CLC
  $FCC4:  18        CLC
  $FCC5:  18        CLC
  $FCC6:  18        CLC
  $FCC7:  18        CLC
  $FCC8:  18        CLC
  $FCC9:  18        CLC
  $FCCA:  18        CLC
  $FCCB:  00        BRK
  $FCCC:  C6 C6     DEC $C6
  $FCCE:  C6 C6     DEC $C6
  $FCD0:  C6 C6     DEC $C6
  $FCD2:  C6 C6     DEC $C6
  $FCD4:  C6 C6     DEC $C6
  $FCD6:  C6 C6     DEC $C6
  $FCD8:  EE 6C 38  INC $386C
  $FCDB:  00        BRK
  $FCDC:  C6 C6     DEC $C6
  $FCDE:  C6 C6     DEC $C6
  $FCE0:  C6 C6     DEC $C6
  $FCE2:  EE 6C 6C  INC $6C6C
  $FCE5:  6C 6C 38  JMP ($386C)
  $FCE8:  38        SEC
  $FCE9:  10 10     BPL $FCFB
  $FCEB:  00        BRK
  $FCEC:  C6 C6     DEC $C6
  $FCEE:  C6 C6     DEC $C6
  $FCF0:  C6 C6     DEC $C6
  $FCF2:  D6 D6     DEC $D6,X
  $FCF4:  FE FE EE  INC $EEFE,X
  $FCF7:  EE C6 C6  INC $C6C6
  $FCFA:  C6 00     DEC $00
  $FCFC:  C6 C6     DEC $C6
  $FCFE:  C6 6C     DEC $6C
  $FD00:  6C 7C 38  JMP ($387C)
  $FD03:  38        SEC
  $FD04:  38        SEC
  $FD05:  7C        .db $7C
  $FD06:  6C 6C C6  JMP ($C66C)
  $FD09:  C6 C6     DEC $C6
  $FD0B:  00        BRK
  $FD0C:  C6 C6     DEC $C6
  $FD0E:  C6 C6     DEC $C6
  $FD10:  C6 C6     DEC $C6
  $FD12:  6C 38 18  JMP ($1838)
  $FD15:  18        CLC
  $FD16:  18        CLC
  $FD17:  18        CLC
  $FD18:  18        CLC
  $FD19:  18        CLC
  $FD1A:  18        CLC
  $FD1B:  00        BRK
  $FD1C:  FE 86 06  INC $0686,X
  $FD1F:  0C        .db $0C
  $FD20:  0C        .db $0C
  $FD21:  18        CLC
  $FD22:  18        CLC
  $FD23:  10 30     BPL $FD55
  $FD25:  30 60     BMI $FD87
  $FD27:  60        RTS
  $FD28:  C0 C2     CPY #$C2
  $FD2A:  FE 00 07  INC $0700,X
  $FD2D:  1C        .db $1C
  $FD2E:  38        SEC
  $FD2F:  33        .db $33
  $FD30:  63        .db $63
  $FD31:  66 66     ROR $66
  $FD33:  66 66     ROR $66
  $FD35:  66 67     ROR $67
  $FD37:  33        .db $33
  $FD38:  38        SEC
  $FD39:  1C        .db $1C
  $FD3A:  07        .db $07
  $FD3B:  00        BRK
  $FD3C:  C0 70     CPY #$70
  $FD3E:  38        SEC
  $FD3F:  98        TYA
  $FD40:  CC CC 0C  CPY $0CCC
  $FD43:  0C        .db $0C
  $FD44:  0C        .db $0C
  $FD45:  CC CC 98  CPY $98CC
  $FD48:  38        SEC
  $FD49:  70 C0     BVS $FD0B
  $FD4B:  00        BRK
  $FD4C:  FF        .db $FF
  $FD4D:  77        .db $77
  $FD4E:  77        .db $77
  $FD4F:  77        .db $77
  $FD50:  77        .db $77
  $FD51:  73        .db $73
  $FD52:  73        .db $73
  $FD53:  73        .db $73
  $FD54:  73        .db $73
  $FD55:  71 71     ADC ($71),Y
  $FD57:  71 71     ADC ($71),Y
  $FD59:  70 F8     BVS $FD53
  $FD5B:  00        BRK
  $FD5C:  FE 1C 1C  INC $1C1C,X
  $FD5F:  1C        .db $1C
  $FD60:  1C        .db $1C
  $FD61:  B8        CLV
  $FD62:  B8        CLV
  $FD63:  B8        CLV
  $FD64:  B8        CLV
  $FD65:  F0 F0     BEQ $FD57
  $FD67:  F0 F0     BEQ $FD59
  $FD69:  E0 E0     CPX #$E0
  $FD6B:  00        BRK
  $FD6C:  00        BRK
  $FD6D:  00        BRK
  $FD6E:  00        BRK
  $FD6F:  00        BRK
  $FD70:  00        BRK
  $FD71:  00        BRK
  $FD72:  00        BRK
  $FD73:  00        BRK
  $FD74:  00        BRK
  $FD75:  00        BRK
  $FD76:  00        BRK
  $FD77:  30 30     BMI $FDA9
  $FD79:  10 20     BPL $FD9B
  $FD7B:  00        BRK
  $FD7C:  00        BRK
  $FD7D:  00        BRK
  $FD7E:  00        BRK
  $FD7F:  00        BRK
  $FD80:  00        BRK
  $FD81:  00        BRK
  $FD82:  00        BRK
  $FD83:  00        BRK
  $FD84:  00        BRK
  $FD85:  00        BRK
  $FD86:  00        BRK
  $FD87:  30 30     BMI $FDB9
  $FD89:  00        BRK
  $FD8A:  00        BRK
  $FD8B:  00        BRK
  $FD8C:  00        BRK
  $FD8D:  00        BRK
  $FD8E:  00        BRK
  $FD8F:  00        BRK
  $FD90:  00        BRK
  $FD91:  00        BRK
  $FD92:  00        BRK
  $FD93:  FC        .db $FC
  $FD94:  30 30     BMI $FDC6
  $FD96:  30 30     BMI $FDC8
  $FD98:  30 30     BMI $FDCA
  $FD9A:  30 00     BMI $FD9C
  $FD9C:  00        BRK
  $FD9D:  00        BRK
  $FD9E:  00        BRK
  $FD9F:  00        BRK
  $FDA0:  00        BRK
  $FDA1:  00        BRK
  $FDA2:  00        BRK
  $FDA3:  82        .db $82
  $FDA4:  C6 EE     DEC $EE
  $FDA6:  FE D6 C6  INC $C6D6,X
  $FDA9:  C6 C6     DEC $C6
  $FDAB:  00        BRK
  $FDAC:  18        CLC
  $FDAD:  18        CLC
  $FDAE:  38        SEC
  $FDAF:  38        SEC
  $FDB0:  18        CLC
  $FDB1:  18        CLC
  $FDB2:  18        CLC
  $FDB3:  18        CLC
  $FDB4:  18        CLC
  $FDB5:  18        CLC
  $FDB6:  18        CLC
  $FDB7:  18        CLC
  $FDB8:  18        CLC
  $FDB9:  18        CLC
  $FDBA:  3C        .db $3C
  $FDBB:  00        BRK
  $FDBC:  38        SEC
  $FDBD:  6C 6C 6C  JMP ($6C6C)
  $FDC0:  6C 6C 6C  JMP ($6C6C)
  $FDC3:  3C        .db $3C
  $FDC4:  0C        .db $0C
  $FDC5:  0C        .db $0C
  $FDC6:  0C        .db $0C
  $FDC7:  0C        .db $0C
  $FDC8:  0C        .db $0C
  $FDC9:  6C 38 00  JMP ($0038)
  $FDCC:  38        SEC
  $FDCD:  6C 6C 6C  JMP ($6C6C)
  $FDD0:  6C 6C 6C  JMP ($6C6C)
  $FDD3:  6C 6C 6C  JMP ($6C6C)
  $FDD6:  6C 6C 6C  JMP ($6C6C)
  $FDD9:  6C 38 00  JMP ($0038)
  $FDDC:  38        SEC
  $FDDD:  6C 6C 0C  JMP ($0C6C)
  $FDE0:  0C        .db $0C
  $FDE1:  0C        .db $0C
  $FDE2:  18        CLC
  $FDE3:  18        CLC
  $FDE4:  30 30     BMI $FE16
  $FDE6:  30 60     BMI $FE48
  $FDE8:  60        RTS
  $FDE9:  64        .db $64
  $FDEA:  7C        .db $7C
  $FDEB:  00        BRK
  $FDEC:  A0 14     LDY #$14
  $FDEE:  00        BRK
  $FDEF:  44        .db $44
  $FDF0:  00        BRK
  $FDF1:  20 00 01  JSR $0100
  $FDF4:  80        .db $80
  $FDF5:  00        BRK
  $FDF6:  00        BRK
  $FDF7:  00        BRK
  $FDF8:  00        BRK
  $FDF9:  00        BRK
  $FDFA:  00        BRK
  $FDFB:  20 6B FE  JSR $FE6B
  $FDFE:  20 52 FE  JSR $FE52
  $FE01:  20 27 FE  JSR $FE27
  $FE04:  20 52 FE  JSR $FE52
  $FE07:  20 0B FE  JSR $FE0B
  $FE0A:  60        RTS
sub_FE0B:
  $FE0B:  A2 08     LDX #$08
  $FE0D:  20 1A FE  JSR $FE1A
  $FE10:  20 1A FE  JSR $FE1A
  $FE13:  20 74 FF  JSR nmi_rng_update
  $FE16:  CA        DEX
  $FE17:  D0 F4     BNE $FE0D
  $FE19:  60        RTS
sub_FE1A:
  $FE1A:  EE 10 02  INC $0210
  $FE1D:  EE 14 02  INC $0214
  $FE20:  EE 18 02  INC $0218
  $FE23:  EE 1C 02  INC $021C
  $FE26:  60        RTS
sub_FE27:
  $FE27:  A0 10     LDY #$10
  $FE29:  A2 00     LDX #$00
  $FE2B:  C8        INY
  $FE2C:  BD 42 FE  LDA $FE42,X
  $FE2F:  99 00 02  STA $0200,Y
  $FE32:  E8        INX
  $FE33:  C8        INY
  $FE34:  BD 42 FE  LDA $FE42,X
  $FE37:  99 00 02  STA $0200,Y
  $FE3A:  E8        INX
  $FE3B:  C8        INY
  $FE3C:  C8        INY
  $FE3D:  C0 30     CPY #$30
  $FE3F:  90 EA     BCC $FE2B
  $FE41:  60        RTS
  $FE42:  00        BRK
  $FE43:  01 00     ORA ($00,X)
  $FE45:  41 01     EOR ($01,X)
  $FE47:  01 01     ORA ($01,X)
  $FE49:  41 02     EOR ($02,X)
  $FE4B:  02        .db $02
  $FE4C:  02        .db $02
  $FE4D:  42        .db $42
  $FE4E:  03        .db $03
  $FE4F:  02        .db $02
  $FE50:  03        .db $03
  $FE51:  42        .db $42

sub_FE52:
  $FE52:  A2 10     LDX #$10
  $FE54:  20 5E FE  JSR $FE5E
  $FE57:  20 74 FF  JSR nmi_rng_update
  $FE5A:  CA        DEX
  $FE5B:  D0 F7     BNE $FE54
  $FE5D:  60        RTS
sub_FE5E:
  $FE5E:  CE 10 02  DEC $0210
  $FE61:  CE 14 02  DEC $0214
  $FE64:  CE 18 02  DEC $0218
  $FE67:  CE 1C 02  DEC $021C
  $FE6A:  60        RTS
sub_FE6B:
  $FE6B:  A9 80     LDA #$80
  $FE6D:  8D 00 03  STA $0300
  $FE70:  A9 40     LDA #$40
  $FE72:  8D 01 03  STA $0301
  $FE75:  A9 00     LDA #$00
  $FE77:  8D 02 03  STA $0302
  $FE7A:  A2 00     LDX #$00
  $FE7C:  BD 8D FE  LDA $FE8D,X
  $FE7F:  9D 03 03  STA $0303,X
  $FE82:  E8        INX
  $FE83:  E0 40     CPX #$40
  $FE85:  90 F5     BCC $FE7C
  $FE87:  EE 0B 05  INC $050B
  $FE8A:  4C 26 C6  JMP $C626
  $FE8D:  00        BRK
  $FE8E:  00        BRK
  $FE8F:  00        BRK
  $FE90:  00        BRK
  $FE91:  00        BRK
  $FE92:  00        BRK
  $FE93:  00        BRK
  $FE94:  00        BRK
  $FE95:  00        BRK
  $FE96:  00        BRK
  $FE97:  00        BRK
  $FE98:  00        BRK
  $FE99:  03        .db $03
  $FE9A:  07        .db $07
  $FE9B:  0F        .db $0F
  $FE9C:  0F        .db $0F
  $FE9D:  00        BRK
  $FE9E:  00        BRK
  $FE9F:  34        .db $34
  $FEA0:  3B        .db $3B
  $FEA1:  1B        .db $1B
  $FEA2:  00        BRK
  $FEA3:  0C        .db $0C
  $FEA4:  0E 0F 0F  ASL $0F0F
  $FEA7:  03        .db $03
  $FEA8:  1F        .db $1F
  $FEA9:  1F        .db $1F
  $FEAA:  07        .db $07
  $FEAB:  03        .db $03
  $FEAC:  01 1E     ORA ($1E,X)
  $FEAE:  1B        .db $1B
  $FEAF:  1F        .db $1F
  $FEB0:  1F        .db $1F
  $FEB1:  3F        .db $3F
  $FEB2:  3F        .db $3F
  $FEB3:  3F        .db $3F
  $FEB4:  3F        .db $3F
  $FEB5:  01 07     ORA ($07,X)
  $FEB7:  02        .db $02
  $FEB8:  1A        .db $1A
  $FEB9:  31 3B     AND ($3B),Y
  $FEBB:  38        SEC
  $FEBC:  3C        .db $3C
  $FEBD:  17        .db $17
  $FEBE:  23        .db $23
  $FEBF:  03        .db $03
  $FEC0:  03        .db $03
  $FEC1:  3F        .db $3F
  $FEC2:  3F        .db $3F
  $FEC3:  3F        .db $3F
  $FEC4:  1E 1F 3D  ASL $3D1F,X
  $FEC7:  3D 3D 3D  AND $3D3D,X
  $FECA:  15 3F     ORA $3F,X
  $FECC:  00        BRK
  $FECD:  AD 08 05  LDA $0508
  $FED0:  85 7B     STA $7B
  $FED2:  85 7C     STA $7C
  $FED4:  A9 00     LDA #$00
  $FED6:  85 7F     STA $7F
  $FED8:  A9 C1     LDA #$C1
  $FEDA:  8D 00 02  STA $0200
  $FEDD:  A9 00     LDA #$00
  $FEDF:  8D 01 02  STA $0201
  $FEE2:  A9 20     LDA #$20
  $FEE4:  8D 02 02  STA $0202
  $FEE7:  A9 C0     LDA #$C0
  $FEE9:  8D 03 02  STA $0203
  $FEEC:  A9 80     LDA #$80
  $FEEE:  8D 00 03  STA $0300
  $FEF1:  A9 16     LDA #$16
  $FEF3:  8D 01 03  STA $0301
  $FEF6:  A9 00     LDA #$00
  $FEF8:  8D 02 03  STA $0302
  $FEFB:  A9 FF     LDA #$FF
  $FEFD:  A2 0F     LDX #$0F
  $FEFF:  9D 03 03  STA $0303,X
  $FF02:  CA        DEX
  $FF03:  10 FA     BPL $FEFF
  $FF05:  A9 0F     LDA #$0F
  $FF07:  20 18 C1  JSR mmc1_write_control
  $FF0A:  EE 0B 05  INC $050B
  $FF0D:  4C 26 C6  JMP $C626
  $FF10:  A0 02     LDY #$02
  $FF12:  A2 00     LDX #$00
  $FF14:  EA        NOP
  $FF15:  CA        DEX
  $FF16:  D0 FC     BNE $FF14
  $FF18:  88        DEY
  $FF19:  D0 F9     BNE $FF14
  $FF1B:  2C 02 20  BIT $2002
  $FF1E:  50 FB     BVC $FF1B
  $FF20:  A5 7B     LDA $7B
  $FF22:  8D 05 20  STA $2005
  $FF25:  A9 80     LDA #$80
  $FF27:  8D 05 20  STA $2005
  $FF2A:  A0 01     LDY #$01
  $FF2C:  A2 00     LDX #$00
  $FF2E:  EA        NOP
  $FF2F:  CA        DEX
  $FF30:  D0 FC     BNE $FF2E
  $FF32:  88        DEY
  $FF33:  D0 F9     BNE $FF2E
  $FF35:  A5 7C     LDA $7C
  $FF37:  8D 05 20  STA $2005
  $FF3A:  A9 00     LDA #$00
  $FF3C:  8D 05 20  STA $2005
  $FF3F:  A5 7F     LDA $7F
  $FF41:  29 03     AND #$03
  $FF43:  D0 07     BNE $FF4C
  $FF45:  A5 7B     LDA $7B
  $FF47:  18        CLC
  $FF48:  69 01     ADC #$01
  $FF4A:  85 7B     STA $7B
  $FF4C:  A5 7F     LDA $7F
  $FF4E:  29 01     AND #$01
  $FF50:  D0 07     BNE $FF59
  $FF52:  A5 7C     LDA $7C
  $FF54:  18        CLC
  $FF55:  69 01     ADC #$01
  $FF57:  85 7C     STA $7C
  $FF59:  E6 7F     INC $7F
  $FF5B:  4C 74 FF  JMP nmi_rng_update
  $FF5E:  01 02     ORA ($02,X)
  $FF60:  04        .db $04
  $FF61:  08        PHP
  $FF62:  10 20     BPL $FF84
  $FF64:  40        RTI
  $FF65:  80        .db $80
  $FF66:  FF        .db $FF
  $FF67:  FF        .db $FF
  $FF68:  FF        .db $FF
  $FF69:  FF        .db $FF
  $FF6A:  FF        .db $FF
  $FF6B:  FF        .db $FF
  $FF6C:  FF        .db $FF
  $FF6D:  FF        .db $FF
  $FF6E:  FF        .db $FF
  $FF6F:  FF        .db $FF
  $FF70:  FF        .db $FF
  $FF71:  FF        .db $FF
  $FF72:  FF        .db $FF
  $FF73:  FF        .db $FF

nmi_rng_update:
  $FF74:  AD 0C 05  LDA rng_counter_cmp
  $FF77:  EA        NOP
  $FF78:  EA        NOP

nmi_inc_seed:
  $FF79:  E6 12     INC rng_seed_lo
  $FF7B:  CD 0C 05  CMP rng_counter_cmp
  $FF7E:  F0 F7     BEQ $FF77
  $FF80:  EA        NOP
  $FF81:  EA        NOP

nmi_call_rng:
  $FF82:  20 13 C9  JSR rng_related
  $FF85:  60        RTS
  $FF86:  FF        .db $FF
  $FF87:  FF        .db $FF
  $FF88:  FF        .db $FF
  $FF89:  FF        .db $FF
  $FF8A:  FF        .db $FF
  $FF8B:  FF        .db $FF
  $FF8C:  FF        .db $FF
  $FF8D:  FF        .db $FF

jump_main_init:
  $FF8E:  4C 3D C0  JMP main_init

bank_switch:
  $FF91:  8D 07 05  STA current_bank

sub_FF94:
  $FF94:  48        PHA
  $FF95:  AD 01 05  LDA $0501
  $FF98:  29 EF     AND #$EF
  $FF9A:  8D 01 05  STA $0501
  $FF9D:  68        PLA
  $FF9E:  48        PHA
  $FF9F:  29 10     AND #$10
  $FFA1:  0D 01 05  ORA $0501
  $FFA4:  8D 01 05  STA $0501
  $FFA7:  68        PLA
  $FFA8:  29 0F     AND #$0F
  $FFAA:  EA        NOP
  $FFAB:  EA        NOP
  $FFAC:  8D FF FF  STA $FFFF
  $FFAF:  4A        LSR A
  $FFB0:  8D FF FF  STA $FFFF
  $FFB3:  4A        LSR A
  $FFB4:  8D FF FF  STA $FFFF
  $FFB7:  4A        LSR A
  $FFB8:  8D FF FF  STA $FFFF
  $FFBB:  4A        LSR A
  $FFBC:  8D FF FF  STA $FFFF
  $FFBF:  AD 01 05  LDA $0501
  $FFC2:  8D FF BF  STA $BFFF
  $FFC5:  4A        LSR A
  $FFC6:  8D FF BF  STA $BFFF
  $FFC9:  4A        LSR A
  $FFCA:  8D FF BF  STA $BFFF
  $FFCD:  4A        LSR A
  $FFCE:  8D FF BF  STA $BFFF
  $FFD1:  4A        LSR A
  $FFD2:  8D FF BF  STA $BFFF
  $FFD5:  EA        NOP
  $FFD6:  EA        NOP
  $FFD7:  60        RTS
RESET_entry:
  $FFD8:  78        SEI
  $FFD9:  EE DF FF  INC mmc1_reset_trigger
  $FFDC:  4C 3D C0  JMP main_init

mmc1_reset_trigger:
  $FFDF:  80        .db $80
  $FFE0:  44        .db $44
  $FFE1:  52        .db $52
  $FFE2:  41 47     EOR ($47,X)
  $FFE4:  4F        .db $4F
  $FFE5:  4E 20 51  LSR $5120
  $FFE8:  55 45     EOR $45,X
  $FFEA:  53        .db $53
  $FFEB:  54        .db $54
  $FFEC:  20 49 56  JSR $5649
  $FFEF:  20 FF FF  JSR $FFFF
  $FFF2:  00        BRK
  $FFF3:  00        BRK
  $FFF4:  48        PHA
  $FFF5:  04        .db $04
  $FFF6:  01 0F     ORA ($0F,X)
  $FFF8:  07        .db $07
  $FFF9:  9D 02 05  STA $0502,X

vec_RESET:
  $FFFC:  D8        CLD
  $FFFD:  FF        .db $FF

vec_IRQ:
  $FFFE:  08        PHP

sub_FFFF:
  $FFFF:  C4        .db $C4