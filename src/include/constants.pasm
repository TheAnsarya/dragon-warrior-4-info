; ============================================================================
; Dragon Warrior IV - Game Constants
; 🌷 Flower Toolchain
; ============================================================================
; Game-specific constants, IDs, and configuration values
; ============================================================================

; ============================================================================
; ROM Configuration
; ============================================================================

; iNES Header Configuration
MAPPER_NUMBER			= 4		; MMC3 mapper
PRG_ROM_SIZE_16K		= 16		; 16 × 16KB = 256KB PRG ROM
CHR_ROM_SIZE_8K			= 0		; 0 = CHR-RAM (no CHR ROM)
PRG_RAM_SIZE_8K			= 1		; 1 × 8KB PRG RAM
BATTERY_BACKED			= 1		; Battery-backed SRAM

; Bank counts
NUM_PRG_BANKS			= 32		; 32 × 8KB = 256KB PRG
NUM_CHR_BANKS			= 0		; Uses CHR-RAM

; ============================================================================
; Chapter System
; ============================================================================

; Chapter IDs
CHAPTER_1_RAGNAR		= 1		; Chapter 1: The Royal Soldiers
CHAPTER_2_ALENA			= 2		; Chapter 2: Princess Alena's Adventure
CHAPTER_3_TALOON		= 3		; Chapter 3: Taloon the Arms Merchant
CHAPTER_4_SISTERS		= 4		; Chapter 4: The Sisters of Monbaraba
CHAPTER_5_HERO			= 5		; Chapter 5: The Chosen Ones

NUM_CHAPTERS			= 5		; Total number of chapters

; ============================================================================
; Party System
; ============================================================================

; Character IDs (used in party data, equipment checks, etc.)
CHAR_ID_HERO			= 0		; The Hero (Solo)
CHAR_ID_RAGNAR			= 1		; Ragnar McRyan
CHAR_ID_ALENA			= 2		; Princess Alena
CHAR_ID_CRISTO			= 3		; Cristo (Kiryl)
CHAR_ID_BREY			= 4		; Brey (Borya)
CHAR_ID_TALOON			= 5		; Taloon (Torneko)
CHAR_ID_NARA			= 6		; Nara (Meena)
CHAR_ID_MARA			= 7		; Mara (Maya)

NUM_CHARACTERS			= 8		; Total playable characters

; Party configuration
MAX_PARTY_SIZE			= 4		; Max active party members
MAX_WAGON_SIZE			= 4		; Max wagon party members
MAX_TOTAL_PARTY			= 8		; Total party slots

; Character stat limits
MAX_LEVEL			= 99		; Maximum level
MAX_HP				= 999		; Maximum HP
MAX_MP				= 999		; Maximum MP
MAX_STAT			= 255		; Maximum for attack/defense/agility
MAX_EXP				= 9999999	; Maximum experience points

; ============================================================================
; Equipment Flags (who can equip)
; ============================================================================
; These flags are used in item data to indicate who can equip an item

EQUIP_HERO			= %00000001	; Bit 0: Hero
EQUIP_RAGNAR			= %00000010	; Bit 1: Ragnar
EQUIP_ALENA			= %00000100	; Bit 2: Alena
EQUIP_CRISTO			= %00001000	; Bit 3: Cristo
EQUIP_BREY			= %00010000	; Bit 4: Brey
EQUIP_TALOON			= %00100000	; Bit 5: Taloon
EQUIP_NARA			= %01000000	; Bit 6: Nara
EQUIP_MARA			= %10000000	; Bit 7: Mara

EQUIP_ALL			= %11111111	; Everyone can equip
EQUIP_MALES			= %00100011	; Hero, Ragnar, Taloon
EQUIP_FEMALES			= %11011100	; Alena, Cristo, Brey, Nara, Mara
EQUIP_WARRIORS			= %00000111	; Hero, Ragnar, Alena
EQUIP_MAGES			= %11011000	; Brey, Nara, Mara

; ============================================================================
; Item System
; ============================================================================

; Item type IDs
ITEM_TYPE_WEAPON		= 0		; Weapons
ITEM_TYPE_ARMOR			= 1		; Armor/body protection
ITEM_TYPE_SHIELD		= 2		; Shields
ITEM_TYPE_HELMET		= 3		; Helmets/headgear
ITEM_TYPE_ACCESSORY		= 4		; Accessories
ITEM_TYPE_CONSUMABLE		= 5		; Consumable items
ITEM_TYPE_KEY_ITEM		= 6		; Key/story items
ITEM_TYPE_SPECIAL		= 7		; Special items

; Item flags
ITEM_FLAG_CURSED		= %10000000	; Cursed item
ITEM_FLAG_BATTLE_USE		= %01000000	; Can use in battle
ITEM_FLAG_FIELD_USE		= %00100000	; Can use in field
ITEM_FLAG_INFINITE		= %00010000	; Infinite uses
ITEM_FLAG_STACKABLE		= %00001000	; Can stack
ITEM_FLAG_SELLABLE		= %00000100	; Can sell
ITEM_FLAG_DROPPABLE		= %00000010	; Can drop/discard
ITEM_FLAG_IMPORTANT		= %00000001	; Important (can't discard)

; Inventory limits
MAX_INVENTORY_SIZE		= 64		; Max items in inventory
MAX_ITEM_STACK			= 99		; Max stack size
ITEM_ID_NONE			= $ff		; No item / empty slot

; ============================================================================
; Spell System
; ============================================================================

; Spell target types
TARGET_SELF			= 0		; Self only
TARGET_ONE_ALLY			= 1		; One ally
TARGET_ALL_ALLIES		= 2		; All allies
TARGET_ONE_ENEMY		= 3		; One enemy
TARGET_GROUP_ENEMY		= 4		; Enemy group
TARGET_ALL_ENEMIES		= 5		; All enemies

; Spell element types
ELEMENT_NONE			= 0		; Non-elemental
ELEMENT_FIRE			= 1		; Fire (Blazemore, etc.)
ELEMENT_ICE			= 2		; Ice (Snowstorm, etc.)
ELEMENT_ELECTRIC		= 3		; Electric (Zap, etc.)
ELEMENT_WIND			= 4		; Wind (Infernos, etc.)
ELEMENT_HOLY			= 5		; Holy (Chance, etc.)
ELEMENT_DARK			= 6		; Dark/curse

; Spell effect types
EFFECT_DAMAGE			= 0		; Direct damage
EFFECT_HEAL			= 1		; Healing
EFFECT_BUFF			= 2		; Stat increase
EFFECT_DEBUFF			= 3		; Stat decrease
EFFECT_STATUS			= 4		; Status effect
EFFECT_CURE			= 5		; Cure status
EFFECT_REVIVE			= 6		; Revive dead
EFFECT_WARP			= 7		; Teleport/warp
EFFECT_UTILITY			= 8		; Utility (light, etc.)

; Maximum spell counts
MAX_HERO_SPELLS			= 25		; Hero's spell slots
MAX_SPELLS_TOTAL		= 64		; Total unique spells

; ============================================================================
; Battle System
; ============================================================================

; Battle modes
BATTLE_MODE_NORMAL		= 0		; Normal battle
BATTLE_MODE_BOSS		= 1		; Boss battle
BATTLE_MODE_AMBUSH		= 2		; Enemy ambush
BATTLE_MODE_PREEMPTIVE		= 3		; Player preemptive strike

; AI Tactics (for party members in wagon or AI-controlled)
TACTIC_FOLLOW_ORDERS		= 0		; Manual control
TACTIC_SHOW_NO_MERCY		= 1		; All-out attack
TACTIC_USE_NO_MP		= 2		; Physical only
TACTIC_SAVE_MP			= 3		; Conservative magic
TACTIC_TRY_OUT			= 4		; Experimental
TACTIC_OFFENSIVE		= 5		; Balanced attack
TACTIC_DEFENSIVE		= 6		; Focus on healing

; Status effect flags
STATUS_POISON			= %00000001	; Poisoned
STATUS_SLEEP			= %00000010	; Asleep
STATUS_CONFUSION		= %00000100	; Confused
STATUS_PARALYSIS		= %00001000	; Paralyzed
STATUS_SILENCED			= %00010000	; Can't cast spells
STATUS_BLINDED			= %00100000	; Accuracy reduced
STATUS_CURSED			= %01000000	; Cursed
STATUS_DEAD			= %10000000	; KO'd

; Monster group sizes
MAX_MONSTER_GROUPS		= 4		; Max enemy groups
MAX_MONSTERS_PER_GROUP		= 8		; Max monsters per group
MAX_TOTAL_MONSTERS		= 8		; Max total monsters in battle

; ============================================================================
; Map System
; ============================================================================

; Map type IDs
MAP_TYPE_OVERWORLD		= 0		; World map
MAP_TYPE_TOWN			= 1		; Town/city
MAP_TYPE_DUNGEON		= 2		; Dungeon/cave
MAP_TYPE_CASTLE			= 3		; Castle
MAP_TYPE_TOWER			= 4		; Tower
MAP_TYPE_SHIP			= 5		; Ship
MAP_TYPE_SPECIAL		= 6		; Special location

; Tile properties
TILE_WALKABLE			= %00000001	; Can walk on
TILE_WARP			= %00000010	; Triggers warp
TILE_DAMAGE			= %00000100	; Causes damage (swamp, lava)
TILE_ENCOUNTER			= %00001000	; Can trigger battles
TILE_INTERACTION		= %00010000	; Can interact (NPC, sign)
TILE_HIDDEN			= %00100000	; Hidden passage
TILE_STAIRS_UP			= %01000000	; Stairs going up
TILE_STAIRS_DOWN		= %10000000	; Stairs going down

; Map dimensions
MAP_WIDTH_OVERWORLD		= 256		; World map width
MAP_HEIGHT_OVERWORLD		= 256		; World map height
MAX_MAP_ID			= 72		; Maximum map ID

; ============================================================================
; Shop System
; ============================================================================

; Shop types
SHOP_TYPE_WEAPON		= 0		; Weapon shop
SHOP_TYPE_ARMOR			= 1		; Armor shop
SHOP_TYPE_ITEM			= 2		; Item shop
SHOP_TYPE_INN			= 3		; Inn
SHOP_TYPE_CHURCH		= 4		; Church/save point
SHOP_TYPE_BANK			= 5		; Vault/bank
SHOP_TYPE_CASINO		= 6		; Casino

; Shop limits
MAX_SHOP_ITEMS			= 8		; Max items per shop
SHOP_ITEM_END			= $ff		; End of shop item list

; ============================================================================
; Game State Flags
; ============================================================================

; Game mode flags
MODE_TITLE			= 0		; Title screen
MODE_LOAD			= 1		; Load game menu
MODE_CHAPTER_SELECT		= 2		; Chapter selection
MODE_FIELD			= 3		; Field/exploration
MODE_BATTLE			= 4		; Battle
MODE_MENU			= 5		; Menu/inventory
MODE_SHOP			= 6		; Shop interface
MODE_DIALOG			= 7		; Dialog/cutscene
MODE_ENDING			= 8		; Ending sequence

; Story progress flags (examples)
FLAG_CHAPTER_1_COMPLETE		= 0
FLAG_CHAPTER_2_COMPLETE		= 1
FLAG_CHAPTER_3_COMPLETE		= 2
FLAG_CHAPTER_4_COMPLETE		= 3
FLAG_HAS_BOAT			= 10
FLAG_HAS_BALLOON		= 11
FLAG_ZENITHIAN_SWORD		= 20
FLAG_ZENITHIAN_ARMOR		= 21
FLAG_ZENITHIAN_HELM		= 22
FLAG_ZENITHIAN_SHIELD		= 23

; ============================================================================
; Audio System
; ============================================================================

; Music track IDs (approximate - needs verification from disassembly)
MUSIC_TITLE			= $00		; Title screen
MUSIC_OVERWORLD			= $01		; World map
MUSIC_TOWN			= $02		; Town theme
MUSIC_DUNGEON			= $03		; Dungeon theme
MUSIC_CASTLE			= $04		; Castle theme
MUSIC_BATTLE			= $05		; Battle theme
MUSIC_BOSS			= $06		; Boss battle
MUSIC_VICTORY			= $07		; Battle victory
MUSIC_INN			= $08		; Inn/rest
MUSIC_CHAPTER_1			= $10		; Chapter 1 theme
MUSIC_CHAPTER_2			= $11		; Chapter 2 theme
MUSIC_CHAPTER_3			= $12		; Chapter 3 theme
MUSIC_CHAPTER_4			= $13		; Chapter 4 theme
MUSIC_ENDING			= $20		; Ending theme

; Sound effect IDs
SFX_CURSOR			= $00		; Menu cursor move
SFX_CONFIRM			= $01		; Confirm selection
SFX_CANCEL			= $02		; Cancel
SFX_HIT				= $03		; Attack hit
SFX_MISS			= $04		; Attack miss
SFX_CRITICAL			= $05		; Critical hit
SFX_SPELL			= $06		; Spell cast
SFX_HEAL			= $07		; Healing
SFX_LEVEL_UP			= $08		; Level up
SFX_ITEM_GET			= $09		; Get item
SFX_DOOR			= $0a		; Open door
SFX_STAIRS			= $0b		; Use stairs

; ============================================================================
; Timing Constants
; ============================================================================

; Frame timing (NTSC = 60fps)
FRAMES_PER_SECOND		= 60
FRAMES_PER_MINUTE		= 3600

; Game timing
POISON_DAMAGE_INTERVAL		= 4		; Steps between poison damage
ENCOUNTER_CHECK_INTERVAL	= 1		; Steps between encounter checks

; ============================================================================
; End of Game Constants
; ============================================================================
