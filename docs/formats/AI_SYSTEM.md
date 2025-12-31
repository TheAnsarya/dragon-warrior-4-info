# Dragon Warrior IV - AI Battle System Documentation

## Overview

Dragon Warrior IV features an AI-controlled party system for Chapters 1-4, and a configurable tactics system in Chapter 5. This document details the AI decision-making process.

## AI Architecture

### Decision Flow

```
1. Evaluate Battle State
   ├── Party HP levels
   ├── Enemy count/types
   ├── MP remaining
   └── Status effects
   
2. Determine Priority
   ├── Emergency (heal critical)
   ├── Remove status
   ├── Support (buffs)
   └── Attack
   
3. Select Action
   ├── Check available actions
   ├── Apply character personality
   └── Random factor
   
4. Select Target
   ├── Weakest enemy (attacks)
   ├── Most injured ally (heals)
   └── Special targeting rules
```

## Character AI Profiles

### Cristo (Clift)

**Role:** Healer  
**Priorities:**
1. Heal party members below 50% HP
2. Remove status effects
3. Cast Defeat on enemies (notorious bug)
4. Physical attack

**Known Issue:** Cristo will cast Defeat even on bosses immune to instant death, wasting MP. This is accurate to original game behavior.

```
if (ally.hp < ally.max_hp * 0.5):
    cast(HEAL)
elif (ally.has_status_effect):
    cast(ANTIDOTE/CLEANSE)
elif (random() < 0.3):  # 30% chance
    cast(DEFEAT)        # Even on bosses!
else:
    attack()
```

### Brey

**Role:** Mage  
**Priorities:**
1. Cast strongest damage spell if MP available
2. Cast buff spells on first turn
3. Physical attack if low MP

```
if (battle_turn == 1 and not buffed):
    cast(INCREASE/BIKILL)
elif (mp > spell_cost and enemy_count >= 2):
    cast(BOOM/BLAZE)
elif (mp > spell_cost):
    cast(strongest_single_target)
else:
    attack()
```

### Alena

**Role:** Fighter  
**Priorities:**
1. Physical attack (high critical rate)
2. Use offensive items if available

```
always:
    attack()  # Simple but effective
```

**Special:** Alena has the highest critical hit rate of any character.

### Nara

**Role:** Support Mage  
**Priorities:**
1. Heal injured party members
2. Cast Barrier/Increase for protection
3. Damage spells

```
if (any_ally.hp < 0.6 * max_hp):
    cast(HEAL)
elif (not party_buffed):
    cast(BARRIER)
elif (mp > 10):
    cast(INFERNOS)
else:
    attack()
```

### Mara

**Role:** Offensive Mage  
**Priorities:**
1. Cast strongest damage spell
2. Use Dance attack for groups
3. Physical attack

```
if (enemy_count >= 3):
    cast(BLAZEMOST) or use_dance()
elif (enemy_count >= 1):
    cast(single_target_spell)
else:
    attack()
```

### Taloon

**Role:** Merchant (Special)  
**Priorities:**
1. Physical attack
2. Random special actions (involuntary)

**Special Actions (Random Triggers):**

| Action | Chance | Effect |
|--------|--------|--------|
| Trip | ~10% | Loses turn |
| Merchant Smile | ~5% | Enemy skips turn |
| Call for Help | ~3% | Random assist |
| Lucky Find | ~2% | Gets random item |
| Whistle | ~5% | Affects enemy morale |

These actions trigger randomly and cannot be controlled.

### Ragnar

**Role:** Soldier  
**Priorities:**
1. Physical attack
2. Use healing items if critical HP

```
if (hp < 0.25 * max_hp and has_herb):
    use(HERB)
else:
    attack()
```

## Tactics System (Chapter 5)

### Normal (0x00)

Balanced AI - default behaviors above.

### Save MP (0x01)

```
- Avoid spell use unless emergency
- Prefer physical attacks
- Only heal when below 30% HP
```

### Offensive (0x02)

```
- Use strongest attacks available
- No regard for MP conservation
- Target priority: highest threat enemy
```

### Defensive (0x03)

```
- Prioritize healing and buffs
- Cast defensive spells first
- Attack only when party is healthy
```

### Try Out (0x04)

```
- Experimental/random behavior
- May use unusual strategies
- Testing ground for AI variations
```

### Use No MP (0x05)

```
- Physical attacks only
- Use items for healing
- Never cast spells
```

## Battle State Evaluation

### HP Thresholds

| Threshold | Label | AI Response |
|-----------|-------|-------------|
| < 25% | Critical | Emergency heal |
| < 50% | Injured | Standard heal |
| < 75% | Hurt | Low priority heal |
| > 75% | Healthy | No heal needed |

### Enemy Threat Assessment

```
threat = (enemy.attack * enemy.hp) / enemy.defense

if (threat > party_avg_hp):
    priority = HIGH
elif (threat > party_avg_hp * 0.5):
    priority = MEDIUM
else:
    priority = LOW
```

### MP Conservation Logic

```
conserve_threshold = max_mp * 0.3

if (current_mp < conserve_threshold):
    prefer_physical = true
elif (current_mp < conserve_threshold * 2):
    use_weak_spells = true
else:
    use_any_spell = true
```

## RAM Locations

### AI State Variables

| Address | Size | Purpose |
|---------|------|---------|
| $72F4 | 8 | Character action states |
| $75DC | 1 | AI decision flags |
| $75E8 | 1 | Current battle phase |
| $6E80 | 16 | Battle calculation workspace |

### Tactics Setting

| Address | Size | Purpose |
|---------|------|---------|
| $6200 | 1 | Current tactics ID (0-5) |
| $6201 | 8 | Per-character override? |

## Code Locations

### AI Decision Engine

**Bank 19 ($4C010):**
- Main battle logic
- 266 subroutines identified
- Division routines for damage calc

**Key Routines:**

| Address | Name | Purpose |
|---------|------|---------|
| $805B | jump_table_dispatch | Action selection |
| $80A1 | check_conditions | State evaluation |
| $8330 | stat_scaling | Damage calculation |
| $845A | battle_calc | Core battle math |
| $9212 | ai_action_select | AI decision point |

## Implementation for DQ3r Port

### Required Components

1. **AI Decision Engine**
   ```csharp
   class AIEngine {
       AIProfile[] profiles;
       TacticsMode currentTactics;
       
       Action DecideAction(Character actor, BattleState state);
       Target SelectTarget(Action action, BattleState state);
   }
   ```

2. **Character Profiles**
   ```csharp
   class AIProfile {
       float healingPriority;    // 0-1
       float magicPreference;    // 0-1
       float aggression;         // 0-1
       float mpConservation;     // 0-1
       SpecialBehavior[] special; // Character-specific
   }
   ```

3. **Battle State Tracking**
   ```csharp
   class BattleState {
       PartyMember[] party;
       Enemy[] enemies;
       int turnNumber;
       bool[] buffsActive;
       // ... etc
   }
   ```

### Cristo Fix Option

For the port, consider adding an option to "fix" Cristo's AI:

```csharp
if (settings.FixCristoAI) {
    // Don't cast Defeat on bosses
    if (target.IsBoss && action == Spell.Defeat) {
        return SelectAlternativeAction();
    }
}
```

### Taloon Special Actions

```csharp
class TaloonAI : AIProfile {
    override Action DecideAction(...) {
        float roll = Random.Range(0, 1);
        
        if (roll < 0.10) return TaloonAction.Trip;
        if (roll < 0.15) return TaloonAction.MerchantSmile;
        if (roll < 0.18) return TaloonAction.CallHelp;
        if (roll < 0.20) return TaloonAction.LuckyFind;
        if (roll < 0.25) return TaloonAction.Whistle;
        
        return base.DecideAction(...);
    }
}
```

---

*This document details the AI system for porting to DQ3r. See [battle_system_analysis.md](../battle_system_analysis.md) for technical details.*
