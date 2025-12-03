# Dragon Warrior IV - Battle System Tables
# Extracted from Bank 19

## AI Tactics Reference
```
$615B values:
  0 = Normal (balanced)
  1 = Save MP (conservative magic)
  2 = Offensive (attack priority)
  3 = Defensive (defensive spells)
  4 = Try Out (experiment)
  5 = Use No MP (physical only)
```

## Attack Multiplier by Tactics ($BB84)
**Description:** Base attack power multiplier per AI tactic (0-6)

```
$BB84: 10 00 10 10 10 10 10
         (16, 0, 16, 16, 16, 16, 16)
```

## Stat Multiplier by Tactics ($BB8B)
**Description:** Party stat sum multiplier per AI tactic

```
$BB8B: 10 10 00 10 00 00 00
         (16, 16, 0, 16, 0, 0, 0)
```

## Hit Threshold by Tactics ($BB92)
**Description:** Hit success threshold per AI tactic

```
$BB92: 66 33 8C 01 FF 01 A0
         (102, 51, 140, 1, 255, 1, 160)
```

## Base Damage Value ($BB99)
**Description:** Base value for damage calculations (0x40 = 64)

```
$BB99: 40
         (64)
```

## Mode Damage Table 1 ($BB9A)
**Description:** Mode-specific damage values (0x80 series)

```
$BB9A: 80 80 80 80 80 80 80
         (128, 128, 128, 128, 128, 128, 128)
```

## Mode Damage Table 2 ($BBA1)
**Description:** Mode-specific values (0xC8 series = 200)

```
$BBA1: C8 C8 C8 C8 C8 C8 C8
         (200, 200, 200, 200, 200, 200, 200)
```

## Mode Damage Table 3 ($BBA8)
**Description:** Mode-specific values (0x64 series = 100)

```
$BBA8: 64 64 64 64 64 64 64
         (100, 100, 100, 100, 100, 100, 100)
```

## Mode Damage Table 4 ($BBAF)
**Description:** Mode-specific values (0x00 series)

```
$BBAF: 00 00 00 00 00 00 00
         (0, 0, 0, 0, 0, 0, 0)
```

## Mode Damage Table 5 ($BBB6)
**Description:** Mode-specific values (0xFF series)

```
$BBB6: FF FF FF FF FF FF FF
         (255, 255, 255, 255, 255, 255, 255)
```

## Special Action Codes ($91A9)
**Description:** Action codes that need special hit handling

```
$91A9: 11 17 18 1A 1B 1D 1E 20 23 40 42 53 57 58 5B 5C 5D 60
```

## Action Handler Table ($91CD)
**Description:** Jump table for special action handlers

```
$91CD: 78 91 78 91 9A 91 78 91 78 91 9A 91 78 91 76 91
$91DD: 78 91 76 91 9A 91 76 91 76 91 76 91 76 91 9A 91
$91ED: 76 91 AD D3
```

## Enemy Resistance Data ($B967)
**Description:** Enemy resistance flags and type data (index by enemy ID)

```
$B967: A2 A4 AA C4 C6 CA E5 E8 EF A2 C5 E8 CB C2 C4 C8
$B977: A4 EF AF A4 C7 E1 C3 C3 A3 C3 C4 A5 A0 22 04 A3
$B987: C4 23 64 63 06 26 02 25 12 23 25 27 72 79 62 62
$B997: 2C 34 61 08 74 68 63 62 6C 60 22 68 1F 1F 1F 1F
$B9A7: 1F 1F 1F BF BF BF BF BF BF BF BF BF 7F FF FF FF
$B9B7: FF FF FF FF FF FF FF 1F 1F 1F 1F 1F 1F 1F 1F 1F
$B9C7: 1F 1F 1F 1F 1F 1F 7F FF 1F 1F 1F 1F 1F FF BF FF
$B9D7: 3F 3F 1F BF DF BF 1F DF FF BF FF BF FF BF BF 1F
$B9E7: FF 3F BF DF DF BF BF DF DF FF DF 3F BF BF DF 1F
$B9F7: FF 1F 1F 1F 3F BF 1F 3F 3F 1F 1F 7F DF DF FF 1F
$BA07: 7F 1F 1F 1F 1F 1F BF 3F FF BF BF BF 1F 1F 1F 1F
$BA17: 1F 1F BF 1F BF BF BF 1F 1F 1F 1F BF 1F BF BF 1F
$BA27: BF 1F 1F 1F BF 1F 1F 3F BF 1F BF 1F 1F 1F 3F 1F
$BA37: 1F 1F 1F 1F BF FF 7F 1F 1F BF FF 1F 1F FF 7F BF
$BA47: BF 1F FF 1F 7F FF 7F 1F 7F 7F FF 7F FF FF 7F FF
$BA57: 7F FF 7F 7F FF FF 7F 1F 1F FF 1F 7F 3F FF 7F 1F
```

## Analysis

### Attack Multiplier Table ($BB84)
```
Tactic   | Multiplier | Effect
---------|------------|------------------
0: Normal     |  16 ($10)  | 16/16 = 1.00x base attack
1: SaveMP     |   0 ($00)  | 0/16 = 0.00x base attack
2: Offensive  |  16 ($10)  | 16/16 = 1.00x base attack
3: Defensive  |  16 ($10)  | 16/16 = 1.00x base attack
4: TryOut     |  16 ($10)  | 16/16 = 1.00x base attack
5: UseNoMP    |  16 ($10)  | 16/16 = 1.00x base attack
6: Special    |  16 ($10)  | 16/16 = 1.00x base attack
```

### Damage Formula (sub_AA67)
```
From disassembly analysis:

1. base_value = (attacker_attack_power)
2. stat_component = (actor_index * 16) + party_stat_sum
3. scaled = stat_component / some_divisor
4. mode_modified = scaled * BB8B[tactics]
5. final_component = mode_modified * 16
6. base_modified = base_value * BB84[tactics]
7. total_damage = final_component + base_modified
```

### Hit Check Thresholds ($9135)
```
Action ranges for hit check:
  $00-$12: Uses random check (compare $75EC)
  $13-$1B: Uses fixed check (#$06)
  $1C-$28: Always hits (SEC immediately)
  $29-$32: Always misses (CLC immediately)
  $33-$42: Always hits
  $43:     Uses random check
  $44+:    Always hits
```
