; ============================================================================
; Dragon Warrior IV - Map Definitions
; ============================================================================
; Map ID constants and definitions
; Source: GameInfo wiki documentation
; Maps stored in banks $09, $0A, $0B
; ============================================================================

; ============================================================================
; Map Banks
; ============================================================================
MAP_BANK_1		= $09		; Maps $00-$2C (and part of $2D)
MAP_BANK_2		= $0a		; Maps $2D-$44 (and part of $45)
MAP_BANK_3		= $0b		; Maps $45-$48

; ============================================================================
; Towns & Castles ($00-$1B)
; ============================================================================
MAP_KEELEON		= $00		; Keeleon (5 submaps)
MAP_SANTEEM		= $01		; Santeem Castle (3 submaps)
MAP_BURLAND		= $02		; Burland (4 submaps)
MAP_DIRE_PALACE		= $03		; Dire Palace (4 submaps)
MAP_ENDOR		= $04		; Endor (15 submaps) - Casino/Arena
MAP_BONMALMO		= $05		; Bonmalmo (2 submaps)
MAP_BRANCA		= $06		; Branca (4 submaps)
MAP_SORETTA		= $07		; Soretta (2 submaps)
MAP_GARDENBUR		= $08		; Gardenbur (5 submaps)
MAP_STANCIA		= $09		; Stancia (8 submaps)
MAP_AKTEMTO_TOWN	= $0a		; Aktemto town (1 submap)
MAP_RIVERTON		= $0b		; Riverton (2 submaps)
MAP_BAZAAR		= $0c		; Bazaar (1 submap)
MAP_MINTOS		= $0d		; Mintos (3 submaps)
MAP_TEMPE		= $0e		; Tempe (1 submap)
MAP_FRENOR		= $0f		; Frenor (2 submaps)
MAP_ANEAUX		= $10		; Aneaux (4 submaps)
MAP_HAVILLE		= $11		; Haville (6 submaps)
MAP_IZMIT		= $12		; Izmit (3 submaps)
MAP_SURENE		= $13		; Surene (5 submaps)
MAP_HOMETOWN		= $14		; Hero's Hometown (3 submaps)
MAP_MONBARABA		= $15		; Monbaraba (4 submaps)
MAP_LAKANABA		= $16		; Lakanaba (3 submaps) - Taloon's starting town
MAP_KIEVS		= $17		; Kievs (2 submaps)
MAP_FOXVILLE		= $18		; Foxville (2 submaps)
MAP_SEASIDE_VILLAGE	= $19		; Seaside Village (3 submaps)
MAP_GOTTSIDE		= $1a		; Gottside (2 submaps)
MAP_ROSAVILLE		= $1b		; Rosaville (5 submaps)

; ============================================================================
; Shrines & Special Buildings ($1C-$2C)
; ============================================================================
MAP_SECRET_ENTRANCE	= $1c		; Secret Playground Entrance (2 submaps)
MAP_HOUSE_PROPHECY	= $1d		; House of Prophecy (1 submap)
MAP_SHRINE_FRENOR_ENDOR	= $1e		; Shrine: Frenor to Endor (1 submap)
MAP_SHRINE_NW_ENDOR	= $1f		; Shrine: NW of Endor (1 submap)
MAP_WOODSMAN_SHACK	= $20		; Woodsman's Shack (1 submap)
MAP_DESERT_INN		= $21		; Desert Inn (1 submap)
MAP_MEDAL_KING		= $22		; Small Medal King Shrine (2 submaps)
MAP_SHRINE_E_MINTOS	= $23		; Shrine: E of Mintos (1 submap)
MAP_ISLAND_SHACK	= $24		; Small Island Shack N of Haville (1 submap)
MAP_ROYAL_CRYPT_ENT	= $25		; Royal Crypt Entrance (2 submaps)
MAP_LAST_REFUGE		= $26		; Last Refuge (1 submap)
MAP_BARRIER_SW		= $27		; SW Barrier Shrine - Gigademon (3 submaps)
MAP_BARRIER_SE		= $28		; SE Barrier Shrine - Anderoug (3 submaps)
MAP_BARRIER_NW		= $29		; NW Barrier Shrine - Infurnus Shadow (2 submaps)
MAP_FINAL_CAVE_ENT	= $2a		; Final Cave (Underworld Entrance) (1 submap)
MAP_TRAVEL_DOOR		= $2b		; Travel Door near Riverton (1 submap)
MAP_COLOSSUS_OUTSIDE	= $2c		; Shrine of Colossus Outside (1 submap)

; ============================================================================
; Dungeons ($2D-$44)
; ============================================================================
MAP_AKTEMTO_MINE	= $2d		; Aktemto Mine (10 submaps) - Banks $09/$0A
MAP_BREAKING_WAVES	= $2e		; Shrine of Breaking Waves (2 submaps)
MAP_PADEQUIA_CAVE	= $2f		; Padequia Cave (3 submaps)
MAP_BAKORS_HIDEOUT	= $30		; Bakor's Hideout (3 submaps)
MAP_CAVE_W_KIEVS	= $31		; Cave West of Kievs (5 submaps)
MAP_CAVE_S_FRENOR	= $32		; Cave South of Frenor (2 submaps)
MAP_SECRET_PLAYGROUND	= $33		; Secret Playground Dungeon (7 submaps)
MAP_CASCADE_CAVE	= $34		; Cascade Cave (5 submaps)
MAP_FINAL_CAVE		= $35		; Final Cave (10 submaps)
MAP_CAVE_N_LAKANABA	= $36		; Cave North of Lakanaba (7 submaps)
MAP_CAVE_BETRAYAL	= $37		; Cave of Betrayal (3 submaps)
MAP_SILVER_STAT_CAVE	= $38		; Silver Statuette Cave (6 submaps)
MAP_BURLAND_IZMIT_TUN	= $39		; Burland-Izmit Tunnel (1 submap)
MAP_BRANCA_ENDOR_TUN	= $3a		; Branca-Endor Tunnel (2 submaps)
MAP_ROYAL_CRYPT_DUN	= $3b		; Royal Crypt Dungeon (3 submaps)
MAP_NECROSARO_LAIR	= $3c		; Necrosaro's Lair (1 submap)
MAP_ZENITHIAN_TOWER	= $3d		; Zenithian Tower (17 submaps)
MAP_ZENITHIA_OUTSIDE	= $3e		; Outside Zenithia (1 submap)
MAP_BIRDSONG_TOWER	= $3f		; Birdsong Tower (6 submaps)
MAP_WORLD_TREE		= $40		; World Tree (6 submaps)
MAP_LOCH_TOWER		= $41		; Loch Tower (6 submaps)
MAP_LIGHTHOUSE		= $42		; Great Lighthouse (5 submaps)
MAP_KONENBER		= $43		; Konenber (10 submaps)
MAP_BARRIER_NE		= $44		; NE Barrier Shrine - Radimvice (4 submaps)

; ============================================================================
; Final Areas ($45-$48)
; ============================================================================
MAP_NECROSARO_PALACE	= $45		; Necrosaro's Palace (8 submaps) - Banks $0A/$0B
MAP_ZENITHIAN_CASTLE	= $46		; Zenithian Castle (4 submaps)
MAP_SHRINE_HORN		= $47		; Shrine of the Horn (2 submaps)
MAP_COLOSSUS_DUNGEON	= $48		; Shrine of Colossus Dungeon (10 submaps)

; ============================================================================
; Map Count
; ============================================================================
MAP_COUNT		= $49		; Total number of maps (73)

; ============================================================================
; Submap Counts (for reference)
; ============================================================================
; These can be used for bounds checking or iteration

SUBMAP_COUNT_KEELEON		= 5
SUBMAP_COUNT_SANTEEM		= 3
SUBMAP_COUNT_BURLAND		= 4
SUBMAP_COUNT_DIRE_PALACE	= 4
SUBMAP_COUNT_ENDOR		= 15	; Largest city
SUBMAP_COUNT_BONMALMO		= 2
SUBMAP_COUNT_BRANCA		= 4
SUBMAP_COUNT_SORETTA		= 2
SUBMAP_COUNT_GARDENBUR		= 5
SUBMAP_COUNT_STANCIA		= 8
SUBMAP_COUNT_AKTEMTO_TOWN	= 1
SUBMAP_COUNT_RIVERTON		= 2
SUBMAP_COUNT_BAZAAR		= 1
SUBMAP_COUNT_MINTOS		= 3
SUBMAP_COUNT_TEMPE		= 1
SUBMAP_COUNT_FRENOR		= 2
SUBMAP_COUNT_ANEAUX		= 4
SUBMAP_COUNT_HAVILLE		= 6
SUBMAP_COUNT_IZMIT		= 3
SUBMAP_COUNT_SURENE		= 5
SUBMAP_COUNT_HOMETOWN		= 3
SUBMAP_COUNT_MONBARABA		= 4
SUBMAP_COUNT_LAKANABA		= 3
SUBMAP_COUNT_KIEVS		= 2
SUBMAP_COUNT_FOXVILLE		= 2
SUBMAP_COUNT_SEASIDE		= 3
SUBMAP_COUNT_GOTTSIDE		= 2
SUBMAP_COUNT_ROSAVILLE		= 5
SUBMAP_COUNT_ZENITHIAN_TOWER	= 17	; Tallest dungeon
SUBMAP_COUNT_FINAL_CAVE		= 10
SUBMAP_COUNT_AKTEMTO_MINE	= 10
SUBMAP_COUNT_COLOSSUS_DUN	= 10

; ============================================================================
; Endor Submaps (detailed - largest city)
; ============================================================================
ENDOR_OUTSIDE		= $00		; Outside
ENDOR_CASINO		= $01		; Casino/Monster Arena
ENDOR_CASTLE_F1		= $02		; Castle F1
ENDOR_BOTTOMRIGHT_F1	= $03		; Bottom-right building F1
ENDOR_MIDDLERIGHT_F1	= $04		; Middle-right building F1
ENDOR_CASTLE_B1		= $05		; Castle B1
ENDOR_THRONE_ROOM	= $06		; Castle F2 (throne room)
ENDOR_ARENA		= $07		; Back Castle, Arena
ENDOR_TALOON_SHOP_F2	= $08		; Taloon's Shop F2
ENDOR_BOTTOMRIGHT_F2	= $09		; Bottom-right building F2
ENDOR_MIDDLERIGHT_F2	= $0a		; Middle-right building F2
ENDOR_INN_F2		= $0b		; Inn F2
ENDOR_CASTLE_F3		= $0c		; Castle F3 (chamber)
ENDOR_SECRET_STAIRS	= $0d		; Behind center stairs, secret door F2-F5
ENDOR_BACK_CASTLE_F2	= $0e		; Back Castle F2

; ============================================================================
; Zenithian Tower Submaps (tallest dungeon)
; ============================================================================
ZENTOWER_OUTSIDE	= $00		; Outside
ZENTOWER_F1		= $01		; Floor 1
ZENTOWER_F2_A		= $02		; Floor 2 (#3)
ZENTOWER_F2_B		= $03		; Floor 2 (#7)
ZENTOWER_F3_A		= $04		; Floor 3 (#4)
ZENTOWER_F2_C		= $05		; Floor 2 (#9)
ZENTOWER_F3_B		= $06		; Floor 3 (#12)
ZENTOWER_F3_C		= $07		; Floor 3 (#8)
; Submaps $08-$10 continue higher floors

; ============================================================================
; Final Cave Submaps
; ============================================================================
FINALCAVE_B1		= $00		; Basement 1
FINALCAVE_B2		= $01		; Basement 2
FINALCAVE_B4		= $02		; Basement 4
FINALCAVE_B3		= $03		; Basement 3
FINALCAVE_B5		= $04		; Basement 5
FINALCAVE_B8		= $05		; Basement 8
FINALCAVE_B7		= $06		; Basement 7
FINALCAVE_B6_TOP	= $07		; Basement 6 (middle and top)
FINALCAVE_B6_BOTTOM	= $08		; Basement 6 (bottom)
FINALCAVE_B9		= $09		; Basement 9

; ============================================================================
; Map Tile Format
; ============================================================================
; Each tile byte: RRRttttt
; ttttt (bits 0-4): Tile number 0-31
; RRR (bits 5-7): Roof number 0-7 (0 = no roof)

MAP_TILE_MASK		= %00011111	; Mask for tile number (bits 0-4)
MAP_ROOF_MASK		= %11100000	; Mask for roof number (bits 5-7)
MAP_ROOF_SHIFT		= 5		; Shift amount for roof bits

; Macros for tile manipulation
.macro GET_TILE_NUM
	and #MAP_TILE_MASK
.endmacro

.macro GET_ROOF_NUM
	and #MAP_ROOF_MASK
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
.endmacro

; ============================================================================
; Map RAM Addresses
; ============================================================================
MAP_NUMBER_ADDR		= $63		; Current map ID (0-72)
SUBMAP_NUMBER_ADDR	= $64		; Current submap ID
SMOOTHING_FLAGS_ADDR	= $6f20		; Wall tile smoothing (0x20 bytes)
TILE_BEHAVIORS_ADDR	= $6f40		; Tile behaviors (0x40 bytes)
TILESET_TILES_ADDR	= $7600		; Tileset numbers (0xC0 bytes)
TILESET_ATTRS_ADDR	= $76c0		; Tile attributes (0x40 bytes)
MAP_DATA_ADDR		= $7800		; Current map data buffer

; ============================================================================
; Chapter-specific starting maps
; ============================================================================
CH1_START_MAP		= MAP_BURLAND		; Chapter 1 starts in Burland
CH2_START_MAP		= MAP_SANTEEM		; Chapter 2 starts in Santeem
CH3_START_MAP		= MAP_LAKANABA		; Chapter 3 starts in Lakanaba
CH4_START_MAP		= MAP_MONBARABA		; Chapter 4 starts in Monbaraba
CH5_START_MAP		= MAP_HOMETOWN		; Chapter 5 starts in Hero's hometown

; ============================================================================
; End of maps.inc
; ============================================================================
