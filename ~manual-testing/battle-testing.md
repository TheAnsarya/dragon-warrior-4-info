# Battle System Testing Guide

**Last Updated:** 2026-01-09  
**Related Issues:** #66, #67

---

## Overview

Dragon Warrior IV uses turn-based battles with:
- Action priority based on agility
- Damage formulas using attack/defense
- Status effects and elemental resistances
- AI-controlled party members (chapters 2, 4, 5)

---

## Part 1: Damage Formula Verification

### Goal
Determine exact damage calculation formula.

### Expected Formula (typical DQ)

```
Physical Damage = (Attack / 2) - (Defense / 4) ± Random
Random Range = ±10-20% typically
```

### Test Procedure

1. **Controlled Stats**
   - Use save editor to set exact Attack/Defense values
   - Example: Attack = 100, Enemy Defense = 40

2. **Multiple Samples**
   - Attack same enemy 20+ times
   - Record each damage value
   - Calculate min/max/average

3. **Vary Parameters**
   - Test different Attack values
   - Test different enemy Defense values
   - Graph results

### Recording Template

```
Attacker: [Name]
Attack Power: [value]
Target: [Enemy Name]
Defense: [value]

Trial  Damage
-----  ------
1      XX
2      XX
...
20     XX

Min: XX  Max: XX  Avg: XX.X
Calculated: (ATK/2 - DEF/4) = XX
Random Range: XX-XX (±X%)
```

### CDL Capture

1. Reset CDL before battle
2. Attack 5+ times
3. Save CDL
4. Analyze for damage calculation routine

Known locations:
- Bank 0x02, 0x03: Battle System code
- Bank 0x21: Damage formulas (suspected)

---

## Part 2: Critical Hit Testing

### Goal
Determine critical hit rate and damage multiplier.

### Expected

- Critical rate: ~1/32 to 1/64
- Critical damage: 2x normal (ignores defense?)

### Test Procedure

1. Attack 200+ times
2. Count critical hits
3. Calculate rate
4. Compare critical vs normal damage

### Recording Template

```
Attacker: [Name]
Target: [Enemy]

Total Attacks: XXX
Normal Hits: XXX
Critical Hits: XXX
Critical Rate: X.X%

Normal Damage Range: XX-XX
Critical Damage Range: XX-XX
Damage Multiplier: X.Xx
```

---

## Part 3: Status Effect Testing

### Goal
Verify status effect mechanics.

### Status Effects

| Status | Effect | Cure | Related Issue |
|--------|--------|------|---------------|
| Sleep | Skip turn | Wake on hit | #66 |
| Paralysis | Skip turn | Time/spell | #66 |
| Poison | HP loss each turn | Antidote/spell | #66 |
| Confusion | Attack random target | Time/hit | #66 |
| Surround | Miss attacks | Clear spell | #66 |
| Death | Instant KO | Revive | #66 |

### Test Procedure

1. **Sleep Duration**
   - Cast Sleep on enemy
   - Count turns until wake
   - Note if damage wakes target

2. **Poison Damage**
   - Poison character
   - Record HP loss per turn
   - Determine formula (flat vs %)

3. **Status Hit Rates**
   - Cast status spell 50+ times
   - Record successes vs failures
   - Calculate rate

### CDL Capture

Reset CDL before casting status spells to identify:
- Status effect routines
- Duration counters
- Resistance checks

---

## Part 4: Elemental Resistance Testing

### Goal
Verify elemental damage modifiers.

### Elements

| Element | Spells | Monster Resistance Byte |
|---------|--------|------------------------|
| Fire | Blaze, Firebal | Bit X of byte 0xXX |
| Ice | Icebolt, Snowstorm | Bit Y of byte 0xXX |
| Lightning | Zap, Lightning | Bit Z of byte 0xXX |
| Wind | Infernos | Bit W of byte 0xXX |

### Test Procedure

1. **Find resistant monster**
   - Use monster data to identify resistances
   - Example: Ice-resistant monster

2. **Test spell damage**
   - Cast Ice spell on resistant vs non-resistant
   - Record damage values
   - Calculate resistance modifier (0%, 50%, immune?)

3. **All elements**
   - Repeat for Fire, Lightning, Wind

### Recording Template

```
Spell: [Name]
Caster: [Name] (INT: XX)

Target: [Normal Enemy]
Damage: XX, XX, XX (avg: XX)

Target: [Resistant Enemy]
Damage: XX, XX, XX (avg: XX)

Resistance Modifier: X%
```

---

## Part 5: Spell Effect Verification

### Goal
Verify spell targeting and effects.

### Spell Categories

| Type | Examples | Target |
|------|----------|--------|
| Damage (single) | Blaze, Icebolt | One enemy |
| Damage (group) | Firebal, Snowstorm | Enemy group |
| Damage (all) | Explodet | All enemies |
| Heal (single) | Heal | One ally |
| Heal (group) | Healall | All allies |
| Buff | Upper, Bikill | Ally |
| Debuff | Sap | Enemy |

### Test Procedure

1. Cast each spell type
2. Verify correct targeting
3. Measure effect value
4. Compare to base formula

---

## Part 6: Flee Mechanics

### Goal
Determine escape success rate formula.

### Expected Factors
- Party average agility
- Enemy average agility
- Battle turn count
- Boss flag (prevent escape)

### Test Procedure

1. **High agility vs low**
   - Party AGI 50, Enemy AGI 20
   - Attempt flee 20 times
   - Record success rate

2. **Low agility vs high**
   - Party AGI 20, Enemy AGI 50
   - Attempt flee 20 times
   - Compare rate

3. **Turn progression**
   - Does flee get easier after several turns?

---

## Battle System RAM Addresses

Known addresses (from `ram_map.inc`):

```
$615A - Current battle actor
$616A - Battle action data
$618E - Battle state flags
$6195-$6196 - Battle counters
$6E80 - Battle mode/state
$72F4,X - Character state array
$75E8 - Action jump index
```

---

## Analysis Scripts

### extract_battle_tables.py

```powershell
python tools/extract_battle_tables.py "roms/Dragon Warrior IV (1992-10)(Enix)(US).nes"
```

### analyze_bank19_battle.py

```powershell
python tools/analyze_bank19_battle.py "roms/Dragon Warrior IV (1992-10)(Enix)(US).nes"
```

---

## After Testing

Update the following:

- [ ] `docs/formats/BATTLE_SYSTEM.md` - Formulas
- [ ] `docs/formats/AI_SYSTEM.md` - AI behavior
- [ ] `source_files/include/battle.inc` - Battle constants
- [ ] `data/asset-map.json` - Battle code locations
- [ ] Close GitHub Issues #66, #67
