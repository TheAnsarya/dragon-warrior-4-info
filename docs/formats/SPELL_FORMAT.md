# Dragon Warrior IV - Spell System Documentation

## Overview

Dragon Warrior IV features approximately 50 spells split between attack magic, healing, support, and status effects. Spells are learned by characters at specific levels, with each character having a unique spell list.

## Spell Categories

### Attack Spells

| Name | MP | Power | Target | Element | Description |
|------|-----|-------|--------|---------|-------------|
| Blaze | 2 | 10-20 | Single | Fire | Basic fire |
| Blazemore | 4 | 40-60 | Single | Fire | Medium fire |
| Blazemost | 8 | 100+ | Single | Fire | Strong fire |
| Firebane | 5 | 30-50 | Group | Fire | Group fire |
| Firevolt | 10 | 80-100 | Group | Fire | Strong group fire |
| Firebal | 3 | 20-30 | Group | Fire | Early group fire |
| Icebolt | 3 | 25-35 | Single | Ice | Ice damage |
| Snowstorm | 5 | 40-60 | Group | Ice | Group ice |
| Zap | 4 | 30-40 | Single | Lightning | Lightning |
| Lightning | 6 | 50-70 | Group | Lightning | Group lightning |
| Boom | 5 | 40-60 | Group | Explosion | Area damage |
| Bang | 3 | 20-35 | Group | Explosion | Early area |
| Infernos | 6 | 50-80 | Group | - | Non-elemental |
| Defeat | 4 | - | Single | Death | Instant kill |
| Beatdown | 7 | - | Group | Death | Group instant kill |

### Healing Spells

| Name | MP | Power | Target | Description |
|------|-----|-------|--------|-------------|
| Heal | 2 | 30-40 | Single | Basic heal |
| Healmore | 5 | 80-100 | Single | Medium heal |
| Healall | 8 | Full | Single | Full heal |
| Healus | 18 | 100+ | All | Party heal |
| Healusall | 36 | Full | All | Full party heal |
| Vivify | 10 | 50% | Single | Revive (50% success) |
| Revive | 20 | 100% | Single | Revive (always) |

### Support Spells

| Name | MP | Target | Duration | Effect |
|------|-----|--------|----------|--------|
| Upper | 3 | Single | Battle | +Defense |
| Increase | 4 | All | Battle | +Defense (party) |
| Bikill | 5 | Single | Battle | +Attack |
| Sap | 3 | Single | Battle | -Defense |
| Defense | 4 | All | Battle | -Defense (enemies) |
| SpeedUp | 3 | Single | Battle | +Agility |
| Barrier | 3 | All | Battle | Magic resist |
| Bounce | 4 | All | Battle | Reflect spells |

### Status Spells

| Name | MP | Target | Effect |
|------|-----|--------|--------|
| Sleep | 3 | Single | Sleep |
| Sleepmore | 5 | Group | Group sleep |
| StopSpell | 3 | Single | Seal magic |
| Surround | 3 | Group | Accuracy down |
| Chaos | 5 | Group | Confuse |
| Robmagic | 0 | Single | Steal MP |
| Expel | 1 | Group | Remove weak enemies |

### Travel Spells

| Name | MP | Effect |
|------|-----|--------|
| Return | 8 | Return to last town |
| Outside | 6 | Exit dungeon |
| StepGuard | 2 | Block damage floors |
| Repel | 4 | Reduce encounters |
| X-Ray | 2 | Find hidden items |
| Day-Night | 6 | Change time |
| Transform | 8 | Change appearance |

## Character Spell Lists

### Hero

| Level | Spell |
|-------|-------|
| 1 | Heal |
| 4 | Blaze |
| 7 | Return |
| 12 | Healmore |
| 16 | Blazemore |
| 20 | Vivify |
| 24 | Zap |
| 28 | Healall |
| 32 | Blazemost |
| 36 | Lightning |

### Cristo (Clift)

| Level | Spell |
|-------|-------|
| 1 | Heal |
| 3 | Upper |
| 5 | Antidote |
| 8 | Surround |
| 11 | Healmore |
| 14 | Defeat |
| 17 | Increase |
| 20 | Healall |
| 24 | Barrier |
| 28 | Revive |
| 32 | Healusall |

### Brey

| Level | Spell |
|-------|-------|
| 1 | Icebolt |
| 4 | Sap |
| 7 | SpeedUp |
| 10 | Snowstorm |
| 13 | Bounce |
| 16 | Defense |
| 19 | Blizzard |
| 22 | Bikill |
| 26 | Freezing |

### Nara

| Level | Spell |
|-------|-------|
| 1 | Heal |
| 3 | Antidote |
| 6 | Infernos |
| 9 | Healmore |
| 12 | Sleep |
| 15 | StopSpell |
| 18 | Healall |
| 22 | Vivify |
| 26 | Barrier |
| 30 | Revive |

### Mara

| Level | Spell |
|-------|-------|
| 1 | Blaze |
| 4 | Firebal |
| 7 | Bang |
| 10 | Blazemore |
| 13 | Firebane |
| 16 | Boom |
| 19 | Blazemost |
| 22 | Firevolt |
| 26 | Chance |

## Spell Data Structure

**Estimated Entry Size:** 8 bytes

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0x00 | 1 | MP Cost | Magic points required |
| 0x01 | 1 | Effect Type | Spell category |
| 0x02 | 1 | Power | Base damage/healing |
| 0x03 | 1 | Target Type | Single/Group/All |
| 0x04 | 1 | Element | Damage element |
| 0x05 | 1 | Accuracy | Hit chance modifier |
| 0x06 | 2 | Flags | Additional properties |

### Target Types

| ID | Target | Description |
|----|--------|-------------|
| 0x01 | Single Enemy | One enemy |
| 0x02 | Enemy Group | One group |
| 0x04 | All Enemies | All enemies |
| 0x10 | Single Ally | One ally |
| 0x20 | All Allies | Whole party |
| 0x40 | Self | Caster only |

### Elements

| ID | Element | Resistances |
|----|---------|-------------|
| 0x00 | None | No resistance |
| 0x01 | Fire | Fire resist |
| 0x02 | Ice | Ice resist |
| 0x04 | Lightning | Thunder resist |
| 0x08 | Explosion | Blast resist |
| 0x10 | Death | Death immune |
| 0x20 | Status | Status resist |

## Damage Formulas

### Attack Spell Damage

```
base_damage = spell.power + random(0, spell.power/4)
modified = base_damage * (1 - target.magic_defense/255)
if (target.resist(spell.element)):
    modified = modified / 2  # or 0 for immunity
final_damage = max(1, floor(modified))
```

### Healing Formula

```
base_heal = spell.power + random(0, spell.power/4)
modified = base_heal * (1 + caster.intelligence/255)
final_heal = floor(modified)
```

### Instant Death Success Rate

```
base_rate = 100 - target.level
modified = base_rate - target.resist_death * 20
success = random(0, 100) < modified
```

## ROM Locations

### Spell Data Table

**Location:** Bank 18 (estimated)  
**Offset:** $8010 (ROM offset 0x18010)  
**Entry Count:** ~50 spells

### Spell Names

**Location:** Bank 22  
**Offset:** Various (DTE compressed)

### Learning Tables

**Location:** Bank 27 (estimated)  
**Format:** Character ID, Level, Spell ID

## Conversion Notes for DQ3r

### Format Comparison

| Field | DW4 (8 bytes) | DQ3r (10 bytes) |
|-------|---------------|-----------------|
| MP Cost | 1 byte | 1 byte |
| Effect | 1 byte | 1 byte |
| Power | 1 byte | 2 bytes |
| Target | 1 byte | 1 byte |
| Element | 1 byte | 1 byte |
| Accuracy | 1 byte | - |
| Animation | - | 2 bytes |
| Flags | 2 bytes | 2 bytes |

### Key Considerations

1. **Power Scaling**
   - DW4: 8-bit power values
   - DQ3r: 16-bit power values
   - May need scaling factor

2. **Element System**
   - Different element IDs
   - Need mapping table

3. **Learning Tables**
   - DW4: Character-specific
   - DQ3r: Class-based
   - Map characters to classes

4. **Cristo's Defeat**
   - Consider AI fix as option
   - Don't cast on death-immune

---

*See [spells.json](../assets/json/spells/spells.json) for extracted spell data.*
