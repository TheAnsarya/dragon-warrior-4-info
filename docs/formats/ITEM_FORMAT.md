# Dragon Warrior IV - Item Data Format

## Overview

Dragon Warrior IV contains approximately 127 unique items, split between equipment (0x00-0x50) and consumables (0x52-0x7E).

## Item ID Ranges

| Range | Category | Count | Description |
|-------|----------|-------|-------------|
| 0x00-0x23 | Weapons | 36 | Swords, staves, claws, etc. |
| 0x24-0x37 | Armor | 20 | Body armor |
| 0x38-0x43 | Shields | 12 | Shields |
| 0x44-0x50 | Helmets | 13 | Headgear |
| 0x51 | Separator | 1 | Blank slot |
| 0x52-0x7E | Consumables | 45 | Herbs, keys, etc. |
| 0x7F | No Item | 1 | Empty slot marker |
| 0x80+ | Equipped Flag | - | OR with item ID |

## Item Data Structure

**Estimated Entry Size:** 8 bytes

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0x00 | 1 | Type | Equipment type/category |
| 0x01 | 1 | Equip Flags | Who can equip (character bits) |
| 0x02 | 1 | Modifier | Attack or Defense bonus |
| 0x03 | 1 | Special | Special effect ID |
| 0x04 | 2 | Price | Buy price (little-endian) |
| 0x06 | 1 | Sort | Inventory sort order |
| 0x07 | 1 | Flags | Additional flags |

## Equipment Types

### Weapons (0x00-0x23)

| ID | Name | Attack | Special |
|----|------|--------|---------|
| 0x00 | Cypress Stick | +2 | - |
| 0x01 | Club | +7 | - |
| 0x02 | Copper Sword | +12 | - |
| 0x03 | Iron Claw | +18 | Alena only |
| 0x04 | Chain Sickle | +24 | - |
| 0x05 | Iron Spear | +28 | - |
| 0x06 | Broad Sword | +35 | - |
| 0x07 | Battle Axe | +40 | - |
| 0x08 | Silver Tarot Cards | +21 | Nara/Mara |
| 0x09 | Thorn Whip | +25 | - |
| 0x0A | Morning Star | +33 | - |
| 0x0B | Boomerang | +22 | Hits all |
| 0x0C | Abacus of Virtue | +35 | Taloon only |
| 0x0D | Iron Fan | +45 | Mara only |
| 0x0E | Metal Babble Sword | +40 | - |
| 0x0F | Poison Needle | +1 | Instant kill |
| 0x10 | Staff of Force | +55 | Casts spell |
| 0x11 | Staff of Thunder | +29 | Lightning |
| 0x12 | Demon Hammer | +70 | Cursed |
| 0x13 | Multi-edge Sword | +99 | Hits all |
| 0x14 | Zenithian Sword | +100 | Hero only |
| 0x15 | Dragon Killer | +90 | Dragon bonus |
| 0x16 | Stilleto Earrings | +55 | Alena only |
| 0x17 | Staff of Punishment | +35 | - |
| 0x18 | Sword of Lethargy | +60 | Sleep effect |
| 0x19 | Venomous Dagger | +24 | Poison effect |
| 0x1A | Fire Claw | +75 | Fire element |
| 0x1B | Ice Blade | +75 | Ice element |
| 0x1C | Sword of Miracles | +100 | HP drain |
| 0x1D | Staff of Antimagic | +40 | MP drain |
| 0x1E | Magma Staff | +63 | Fire cast |
| 0x1F | Sword of Decimation | +105 | Cursed |
| 0x20 | Staff of Healing | +8 | Heal cast |
| 0x21 | Zenithian Sword | +110 | Hero only |
| 0x22 | Staff of Jubilation | +18 | - |
| 0x23 | Sword of Malice | +63 | Random |

### Armor (0x24-0x37)

| ID | Name | Defense | Special |
|----|------|---------|---------|
| 0x24 | Basic Clothes | +4 | - |
| 0x25 | Wayfarer's Clothes | +8 | - |
| 0x26 | Leather Armor | +12 | - |
| 0x27 | Dancer's Costume | +15 | Mara only |
| 0x28 | Chain Mail | +20 | - |
| 0x29 | Bronze Armor | +25 | - |
| 0x2A | Iron Armor | +32 | - |
| 0x2B | Cloak of Evasion | +28 | Evade up |
| 0x2C | Sacred Robe | +38 | MP restore |
| 0x2D | Full Plate Armor | +50 | - |
| 0x2E | Magic Armor | +55 | Magic resist |
| 0x2F | Dragon Mail | +60 | Fire/Ice resist |
| 0x30 | Zenithian Armor | +75 | Hero only |
| 0x31 | Pink Leotard | +40 | Female only |
| 0x32 | Angel Leotard | +50 | Female only |
| 0x33 | Princess' Robe | +60 | Alena only |
| 0x34 | Water Flying Clothes | +45 | - |
| 0x35 | Armor of Radiance | +85 | Cursed |
| 0x36 | Metal Babble Armor | +95 | Rare |
| 0x37 | Demon Armor | +80 | Cursed |

### Shields (0x38-0x43)

| ID | Name | Defense | Special |
|----|------|---------|---------|
| 0x38 | Leather Shield | +4 | - |
| 0x39 | Scale Shield | +8 | - |
| 0x3A | Iron Shield | +16 | - |
| 0x3B | Dragon Shield | +32 | Breath resist |
| 0x3C | Shield of Strength | +40 | HP restore |
| 0x3D | Metal Babble Shield | +50 | Rare |
| 0x3E | Zenithian Shield | +55 | Hero only |
| 0x3F | Mirror Shield | +45 | Reflect |
| 0x40 | Magic Shield | +25 | MP cost reduction |
| 0x41 | Shield of Heroes | +30 | - |
| 0x42 | Silver Shield | +28 | - |
| 0x43 | Golden Shield | +35 | - |

### Helmets (0x44-0x50)

| ID | Name | Defense | Special |
|----|------|---------|---------|
| 0x44 | Leather Hat | +2 | - |
| 0x45 | Wooden Hat | +6 | - |
| 0x46 | Iron Helmet | +16 | - |
| 0x47 | Iron Mask | +25 | - |
| 0x48 | Halo Headgear | +20 | - |
| 0x49 | Golden Tiara | +30 | Female only |
| 0x4A | Dragon Helm | +40 | - |
| 0x4B | Helm of Hiding | +28 | Stealth |
| 0x4C | Metal Babble Helm | +50 | Rare |
| 0x4D | Zenithian Helm | +45 | Hero only |
| 0x4E | Hat of Happiness | +12 | EXP bonus |
| 0x4F | Great Helm | +35 | - |
| 0x50 | Bandana | +3 | - |

## Consumables (0x52-0x7E)

| ID | Name | Effect |
|----|------|--------|
| 0x52 | Herb | Restore 30 HP |
| 0x53 | Antidote | Cure poison |
| 0x54 | Wing of Wyvern | Return to town |
| 0x55 | Fairy Water | Repel monsters |
| 0x56 | World Leaf | Revive ally |
| 0x57 | World Dew | Full heal party |
| 0x58 | Strength Seed | +STR permanent |
| 0x59 | Agility Seed | +AGI permanent |
| 0x5A | Vitality Seed | +VIT permanent |
| 0x5B | Intelligence Seed | +INT permanent |
| 0x5C | Luck Seed | +LCK permanent |
| 0x5D | Acorn of Life | +HP permanent |
| 0x5E | Acorn of Magic | +MP permanent |
| ... | ... | ... |

## Equip Compatibility

### Character Flags

| Bit | Character | Notes |
|-----|-----------|-------|
| 0 | Hero | Can use most equipment |
| 1 | Ragnar | Heavy armor, swords |
| 2 | Alena | Light armor, claws |
| 3 | Cristo | Robes, staves |
| 4 | Brey | Robes, staves |
| 5 | Taloon | Medium armor, weapons |
| 6 | Nara | Robes, staves, cards |
| 7 | Mara | Dancer gear, fans |

### Equipment Compatibility Table

| Equipment Type | Hero | Ragnar | Alena | Cristo | Brey | Taloon | Nara | Mara |
|----------------|------|--------|-------|--------|------|--------|------|------|
| Swords | ✅ | ✅ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ |
| Staves | ✅ | ❌ | ❌ | ✅ | ✅ | ❌ | ✅ | ❌ |
| Claws | ❌ | ❌ | ✅ | ❌ | ❌ | ❌ | ❌ | ❌ |
| Fans | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ |
| Heavy Armor | ✅ | ✅ | ❌ | ❌ | ❌ | ✅ | ❌ | ❌ |
| Light Armor | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Robes | ❌ | ❌ | ❌ | ✅ | ✅ | ❌ | ✅ | ✅ |
| Shields | ✅ | ✅ | ❌ | ✅ | ❌ | ✅ | ❌ | ❌ |

## Special Effects

### Effect IDs

| ID | Effect | Items |
|----|--------|-------|
| 0x00 | None | Most items |
| 0x01 | HP Drain | Sword of Miracles |
| 0x02 | MP Drain | Staff of Antimagic |
| 0x03 | Sleep | Sword of Lethargy |
| 0x04 | Poison | Venomous Dagger |
| 0x05 | Instant Kill | Poison Needle |
| 0x06 | Hit All | Boomerang, Multi-edge |
| 0x07 | Cursed | Demon gear |
| 0x08 | Casts Spell | Staves |
| 0x09 | Element Fire | Fire Claw, Magma Staff |
| 0x0A | Element Ice | Ice Blade |
| 0x0B | Element Thunder | Staff of Thunder |
| 0x0C | Dragon Killer | Dragon Killer |

## Conversion Notes for DQ3r

### Format Comparison

| Field | DW4 (8 bytes) | DQ3r (12 bytes) |
|-------|---------------|-----------------|
| Type | 1 byte | 1 byte |
| Subtype | - | 1 byte |
| Equip | 1 byte | 2 bytes (class-based) |
| Modifier | 1 byte | 2 bytes |
| Special | 1 byte | 2 bytes |
| Price | 2 bytes | 2 bytes |
| Sort | 1 byte | 1 byte |
| Flags | 1 byte | 1 byte |

### Key Differences

1. **Equip Flags**
   - DW4: Character-based (8 characters)
   - DQ3r: Class-based (multiple classes)
   - Need to map characters to equivalent classes

2. **Stat Ranges**
   - DW4: 8-bit modifiers
   - DQ3r: 16-bit modifiers
   - May need scaling for balance

3. **Special Effects**
   - Different effect ID systems
   - Need mapping table

### Mapping Example

```csharp
// DW4 character flags to DQ3r class flags
DQ3rClassFlags MapEquipFlags(DW4EquipFlags dw4) {
    DQ3rClassFlags result = 0;
    
    if (dw4.HasFlag(DW4.Hero)) result |= DQ3r.Hero;
    if (dw4.HasFlag(DW4.Ragnar)) result |= DQ3r.Soldier;
    if (dw4.HasFlag(DW4.Alena)) result |= DQ3r.Fighter;
    if (dw4.HasFlag(DW4.Cristo)) result |= DQ3r.Priest;
    if (dw4.HasFlag(DW4.Brey)) result |= DQ3r.Mage;
    if (dw4.HasFlag(DW4.Taloon)) result |= DQ3r.Merchant;
    if (dw4.HasFlag(DW4.Nara)) result |= DQ3r.Priest;
    if (dw4.HasFlag(DW4.Mara)) result |= DQ3r.Mage;
    
    return result;
}
```

---

*See [items.json](../assets/json/items.json) for extracted item data.*
