; ============================================================================
; Dragon Warrior IV (NES) - Complete Disassembly
; 🌷 Flower Toolchain - Main Assembly File
; ============================================================================
;
; This is the main entry point for assembling the Dragon Warrior IV ROM.
; Built using the 🌸 Poppy assembler from the 🌷 Flower Toolchain.
;
; Original ROM:
;   Dragon Warrior IV (1992-10)(Enix)(US).nes
;   MD5: a5a781e5ae7c75765969eba2beb4e27f
;   Size: 524,304 bytes (512KB PRG + 16 byte header)
;
; 🌷 Flower Toolchain:
;   🌺 Peony  - Disassembler (ROM → Source)
;   🌼 Pansy  - Metadata Format (Symbols, Comments)
;   🌸 Poppy  - Assembler (Source → ROM)
;
; Build Commands:
;   .\build.ps1                    ; Standard build
;   .\build.ps1 -Clean             ; Clean build
;   .\build.ps1 -Verbose           ; Verbose output
;   .\build.ps1 -ExtractAssets     ; Extract assets first
;
; ============================================================================

; ============================================================================
; Include Files
; ============================================================================

; Constants and System Definitions
.include "src/include/constants.pasm"

; RAM Memory Map
.include "src/include/ram_map.pasm"

; Assembly Macros
.include "src/include/macros.pasm"

; Hardware Register Definitions
.include "src/include/hardware.pasm"

; ============================================================================
; iNES Header (16 bytes)
; ============================================================================
; Format: NES 2.0 compatible header for emulators and flash carts
;
; Byte 0-3:   Magic number "NES" + $1a
; Byte 4:    PRG ROM size in 16KB units (16 = 256KB)
; Byte 5:    CHR ROM size in 8KB units (0 = CHR-RAM)
; Byte 6:    Flags 6 - Mapper low nibble, mirroring, battery
; Byte 7:    Flags 7 - Mapper high nibble, NES 2.0 indicator
; Byte 8-15:  Extended header / padding
; ============================================================================

.org $0000

ines_header:
	.db "NES", $1a				; [0-3] Magic number
	.db 16					; [4]   PRG ROM: 16 × 16KB = 256KB
	.db 0					; [5]   CHR ROM: 0 (uses CHR-RAM)
	.db %01000010				; [6]   Flags 6:
						;       Bit 0: Vertical mirroring
						;       Bit 1: Battery-backed PRG RAM
						;       Bit 2: No trainer
						;       Bit 3: No four-screen VRAM
						;       Bits 4-7: Mapper low nibble (4 = MMC3)
	.db %01000000				; [7]   Flags 7:
						;       Bits 0-3: VS/Playchoice (0)
						;       Bits 4-7: Mapper high nibble (4)
	.db 1					; [8]   PRG RAM: 1 × 8KB
	.db %00000000				; [9]   TV system: NTSC
	.db %00000000				; [10]  Unused
	.db $00, $00, $00, $00, $00		; [11-15] Padding

; ============================================================================
; PRG ROM Banks (512KB total = 32 × 16KB banks)
; ============================================================================
; Dragon Warrior IV uses MMC3 mapper with bank switching:
;   - Banks 00-1E: Switchable at $8000-$9FFF and $A000-$BFFF
;   - Bank 1F: Fixed at $C000-$FFFF (contains vectors)
;
; Bank Contents Overview:
;   00-07: Game engine, battle system, menus, field engine
;   08:    Monster data tables
;   09:    Item and spell data
;   0A-0B: Map data and scripts
;   0C-0E: Dialog text
;   0F:    Fixed bank (init, vectors, core routines)
;   10-1F: Additional program code and data
; ============================================================================

; -----------------------------------------------------------------------------
; Bank 00 - Main Game Engine ($8000-$BFFF when mapped)
; -----------------------------------------------------------------------------
; Contains: Main loop, state machine, core game logic
; ROM Offset: $00010-$04010
; -----------------------------------------------------------------------------
.include "src/banks/bank_00.pasm"

; -----------------------------------------------------------------------------
; Bank 01 - Battle System ($8000-$BFFF when mapped)
; -----------------------------------------------------------------------------
; Contains: Battle engine, damage calculations, AI routines
; ROM Offset: $04010-$08010
; -----------------------------------------------------------------------------
.include "src/banks/bank_01.pasm"

; -----------------------------------------------------------------------------
; Bank 02 - Menu Systems ($8000-$BFFF when mapped)
; -----------------------------------------------------------------------------
; Contains: All menu handling, inventory, status screens
; ROM Offset: $08010-$0C010
; -----------------------------------------------------------------------------
.include "src/banks/bank_02.pasm"

; -----------------------------------------------------------------------------
; Bank 03 - Field/Map Engine ($8000-$BFFF when mapped)
; -----------------------------------------------------------------------------
; Contains: Overworld/dungeon movement, tile collision, warps
; ROM Offset: $0C010-$10010
; -----------------------------------------------------------------------------
.include "src/banks/bank_03.pasm"

; -----------------------------------------------------------------------------
; Bank 04 - Chapter 1 Data (Ragnar) ($8000-$BFFF when mapped)
; -----------------------------------------------------------------------------
; Contains: Chapter 1 specific scripts, events, NPCs
; ROM Offset: $10010-$14010
; -----------------------------------------------------------------------------
.include "src/banks/bank_04.pasm"

; -----------------------------------------------------------------------------
; Bank 05 - Chapter 2 Data (Alena) ($8000-$BFFF when mapped)
; -----------------------------------------------------------------------------
; Contains: Chapter 2 specific scripts, events, NPCs
; ROM Offset: $14010-$18010
; -----------------------------------------------------------------------------
.include "src/banks/bank_05.pasm"

; -----------------------------------------------------------------------------
; Bank 06 - Chapter 3 Data (Taloon) ($8000-$BFFF when mapped)
; -----------------------------------------------------------------------------
; Contains: Chapter 3 specific scripts, events, shop mechanics
; ROM Offset: $18010-$1C010
; -----------------------------------------------------------------------------
.include "src/banks/bank_06.pasm"

; -----------------------------------------------------------------------------
; Bank 07 - Chapter 4 Data (Nara/Mara) ($8000-$BFFF when mapped)
; -----------------------------------------------------------------------------
; Contains: Chapter 4 specific scripts, events, NPCs
; ROM Offset: $1C010-$20010
; -----------------------------------------------------------------------------
.include "src/banks/bank_07.pasm"

; -----------------------------------------------------------------------------
; Bank 08 - Monster Data Tables ($8000-$BFFF when mapped)
; -----------------------------------------------------------------------------
; Contains: Monster stats, AI patterns, resistances
; ROM Offset: $20010-$24010
; NOTE: This bank includes GENERATED data from JSON assets!
; -----------------------------------------------------------------------------
.include "src/banks/bank_08.pasm"

; -----------------------------------------------------------------------------
; Bank 09 - Item and Spell Data ($8000-$BFFF when mapped)
; -----------------------------------------------------------------------------
; Contains: Item properties, spell effects, equipment stats
; ROM Offset: $24010-$28010
; NOTE: This bank includes GENERATED data from JSON assets!
; -----------------------------------------------------------------------------
.include "src/banks/bank_09.pasm"

; -----------------------------------------------------------------------------
; Bank 0A - Map Data Part 1 ($8000-$BFFF when mapped)
; -----------------------------------------------------------------------------
; Contains: World map data, compressed map tiles
; ROM Offset: $28010-$2C010
; -----------------------------------------------------------------------------
.include "src/banks/bank_0a.pasm"

; -----------------------------------------------------------------------------
; Bank 0B - Map Data Part 2 ($8000-$BFFF when mapped)
; -----------------------------------------------------------------------------
; Contains: Dungeon/town map data, tile properties
; ROM Offset: $2C010-$30010
; -----------------------------------------------------------------------------
.include "src/banks/bank_0b.pasm"

; -----------------------------------------------------------------------------
; Bank 0C - Dialog Text Part 1 ($8000-$BFFF when mapped)
; -----------------------------------------------------------------------------
; Contains: NPC dialog, story text (DTE compressed)
; ROM Offset: $30010-$34010
; -----------------------------------------------------------------------------
.include "src/banks/bank_0c.pasm"

; -----------------------------------------------------------------------------
; Bank 0D - Dialog Text Part 2 ($8000-$BFFF when mapped)
; -----------------------------------------------------------------------------
; Contains: Additional dialog, item/spell names
; ROM Offset: $34010-$38010
; -----------------------------------------------------------------------------
.include "src/banks/bank_0d.pasm"

; -----------------------------------------------------------------------------
; Bank 0E - Dialog Text Part 3 ($8000-$BFFF when mapped)
; -----------------------------------------------------------------------------
; Contains: More dialog, menu strings, system messages
; ROM Offset: $38010-$3C010
; -----------------------------------------------------------------------------
.include "src/banks/bank_0e.pasm"

; -----------------------------------------------------------------------------
; Bank 0F - Fixed Bank ($C000-$FFFF always mapped)
; -----------------------------------------------------------------------------
; Contains: Initialization, NMI/IRQ handlers, vectors, core routines
; ROM Offset: $3C010-$40010
; NOTE: This bank is ALWAYS present at $C000-$FFFF!
; -----------------------------------------------------------------------------
.include "src/banks/bank_0f.pasm"

; -----------------------------------------------------------------------------
; Banks 10-1F - Additional Program/Data Banks
; -----------------------------------------------------------------------------
; Extended banks for additional content
; ROM Offset: $40010-$80010
; -----------------------------------------------------------------------------
.include "src/banks/bank_10.pasm"
.include "src/banks/bank_11.pasm"
.include "src/banks/bank_12.pasm"
.include "src/banks/bank_13.pasm"
.include "src/banks/bank_14.pasm"
.include "src/banks/bank_15.pasm"
.include "src/banks/bank_16.pasm"
.include "src/banks/bank_17.pasm"
.include "src/banks/bank_18.pasm"
.include "src/banks/bank_19.pasm"
.include "src/banks/bank_1a.pasm"
.include "src/banks/bank_1b.pasm"
.include "src/banks/bank_1c.pasm"
.include "src/banks/bank_1d.pasm"
.include "src/banks/bank_1e.pasm"
.include "src/banks/bank_1f.pasm"

; ============================================================================
; End of Main Assembly File
; ============================================================================
; To modify game data:
;   1. Edit JSON files in assets/json/
;   2. Run: python tools/json_to_asm.py all
;   3. Run: .\build.ps1
;
; Generated data files in src/data/:
;   - monsters.pasm  (from assets/json/monsters/monsters.json)
;   - items.pasm     (from assets/json/items/items.json)
;   - spells.pasm    (from assets/json/spells/*.json)
;   - shops.pasm     (from assets/json/shops.json)
; ============================================================================
