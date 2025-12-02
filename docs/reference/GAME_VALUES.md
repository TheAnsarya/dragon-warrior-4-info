# Dragon Warrior IV (NES) - Game Values Reference

## Source
Extracted from GameInfo wiki documentation.

---

## Party Members

| Value | Name |
|-------|------|
| $00 | Hero |
| $01 | Cristo |
| $02 | Nara |
| $03 | Mara |
| $04 | Brey |
| $05 | Taloon |
| $06 | Ragnar |
| $07 | Alena |
| $08 | (Unused slot) |
| $09 | Extra Companion #1 |
| $0A | Extra Companion #2 |

---

## Extra Companions

| Value | Name | Chapter | Class |
|-------|------|---------|-------|
| $C5 | Healie | 1 | Kind Healer |
| $C6 | Orin | 4 | Alchemist |
| $C7 | Laurent | 3 | Troubadour |
| $C8 | Strom | 3 | Guardsman |
| $C9 | Hector | 5 | Young Man |
| $CA | Panon | 5 | Jester |
| $CB | Lucia | 5 | Zenithian |
| $CC | Doran | 5 | Baby Dragon |

---

## Battle Tactics

| Value | Name |
|-------|------|
| $00 | Normal |
| $01 | Save MP |
| $02 | Offensive |
| $03 | Defensive |
| $04 | Try Out |
| $05 | Use No MP |

---

## Chapters

| Value | Name |
|-------|------|
| $00 | Chapter 1 - Ragnar |
| $01 | Chapter 2 - Alena, Cristo, & Brey |
| $02 | Chapter 3 - Taloon |
| $03 | Chapter 4 - Mara & Nara |
| $04 | Chapter 5 - Hero |

---

## Day/Night Cycle

Staying at the Inn sets the time to `$28`.
The cycle resets after `$CB`.

| Value Range | Length | Description |
|-------------|--------|-------------|
| $00-$27 | 40 ($28) | Day |
| $28-$77 | 80 ($50) | Day - After staying at Inn |
| $78-$7B | 4 | Afternoon |
| $7C-$7F | 4 | Dusk |
| $80-$83 | 4 | Evening |
| $84-$BF | 60 ($3C) | Night |
| $C0-$C3 | 4 | Pre-dawn |
| $C4-$C7 | 4 | Dawn |
| $C8-$CB | 4 | Morning |
| $CC-$FF | 52 ($34) | (wraps to day) |

---

## Items

Item index uses bottom 7 bits (range $00-$7F).
- `$51` is blank separator between equipment and items
- `$7F` represents "no item in slot"
- High bit ($80) indicates item is equipped

### Equipment ($00-$50)

#### Weapons ($00-$23)

| Value | Name |
|-------|------|
| $00 | Cypress Stick |
| $01 | Club |
| $02 | Copper Sword |
| $03 | Iron Claw |
| $04 | Chain Sickle |
| $05 | Iron Spear |
| $06 | Broad Sword |
| $07 | Battle Axe |
| $08 | Silver Tarot Cards |
| $09 | Thorn Whip |
| $0A | Morning Star |
| $0B | Boomerang |
| $0C | Abacus of Virtue |
| $0D | Iron Fan |
| $0E | Metal Babble Sword |
| $0F | Poison Needle |
| $10 | Staff of Force |
| $11 | Staff of Thunder |
| $12 | Demon Hammer |
| $13 | Multi-edge Sword |
| $14 | Zenithian Sword (1) |
| $15 | Dragon Killer |
| $16 | Stilleto Earrings |
| $17 | Staff of Punishment |
| $18 | Sword of Lethargy |
| $19 | Venomous Dagger |
| $1A | Fire Claw |
| $1B | Ice Blade |
| $1C | Sword of Miracles |
| $1D | Staff of Antimagic |
| $1E | Magma Staff |
| $1F | Sword of Decimation |
| $20 | Staff of Healing |
| $21 | Zenithian Sword (2) |
| $22 | Staff of Jubilation |
| $23 | Sword of Malice |

#### Armor ($24-$3C)

| Value | Name |
|-------|------|
| $24 | Basic Clothes |
| $25 | Wayfarer's Clothes |
| $26 | Leather Armor |
| $27 | Chain Mail |
| $28 | Half Plate Armor |
| $29 | Iron Apron |
| $2A | Full Plate Armor |
| $2B | Silk Robe |
| $2C | Dancer's Costume |
| $2D | Bronze Armor |
| $2E | Metal Babble Armor |
| $2F | Fur Coat |
| $30 | Leather Dress |
| $31 | Pink Leotard |
| $32 | Dragon Mail |
| $33 | Cloak of Evasion |
| $34 | Sacred Robe |
| $35 | Water Flying Clothes |
| $36 | Mysterious Bolero |
| $37 | Zenithian Armor |
| $38 | Swordedge Armor |
| $39 | Robe of Serenity |
| $3A | Zombie Mail |
| $3B | Dress of Radiance |
| $3C | Demon Armor |

#### Shields ($3D-$45)

| Value | Name |
|-------|------|
| $3D | Leather Shield |
| $3E | Scale Shield |
| $3F | Iron Shield |
| $40 | Shield of Strength |
| $41 | Mirror Shield |
| $42 | Aeolus' Shield |
| $43 | Dragon Shield |
| $44 | Zenithian Shield |
| $45 | Metal Babble Shield |

#### Helms ($46-$4F)

| Value | Name |
|-------|------|
| $46 | Leather Hat |
| $47 | Wooden Hat |
| $48 | Iron Helmet |
| $49 | Iron Mask |
| $4A | Feather Hat |
| $4B | Zenithian Helm |
| $4C | Mask of Corruption |
| $4D | Golden Barrette |
| $4E | Hat of Happiness |
| $4F | Metal Babble Helm |

#### Accessories ($50)

| Value | Name |
|-------|------|
| $50 | Meteorite Armband |

### Separator

| Value | Name |
|-------|------|
| $51 | ??? (Blank Name) |

### Consumables & Key Items ($52-$7E)

| Value | Name |
|-------|------|
| $52 | Baron's Horn |
| $53 | Medical Herb |
| $54 | Antidote Herb |
| $55 | Fairy Water |
| $56 | Wing of Wyvern |
| $57 | Leaf of World Tree |
| $58 | Full Moon Herb |
| $59 | Wizard's Ring |
| $5A | Magic Potion |
| $5B | Dew of World Tree |
| $5C | Flute of Uncovering |
| $5D | Sphere of Silence |
| $5E | Scent Pouch |
| $5F | Sandglass of Regression |
| $60 | Sage's Stone |
| $61 | Strength Seed |
| $62 | Agility Seed |
| $63 | Luck Seed |
| $64 | Lifeforce Nuts |
| $65 | Mystic Acorns |
| $66 | Mirror of Ra |
| $67 | Lamp of Darkness |
| $68 | Staff of Transform |
| $69 | Small Medal |
| $6A | Stone of Drought |
| $6B | Iron Safe |
| $6C | Flying Shoes |
| $6D | Silver Statuette |
| $6E | Treasure Map |
| $6F | Symbol of Faith |
| $70 | Gunpowder Jar |
| $71 | Thief's Key |
| $72 | Magic Key |
| $73 | Final Key |
| $74 | Lunch |
| $75 | Birdsong Nector |
| $76 | Golden Bracelet |
| $77 | Prince's Letter |
| $78 | Royal Scroll |
| $79 | Gum Pod |
| $7A | Boarding Pass |
| $7B | Padequia Root |
| $7C | Fire of Serenity |
| $7D | Gas Canister |
| $7E | Padequia Seed |

### Special

| Value | Name |
|-------|------|
| $7F | ??? No Item |
