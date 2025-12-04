# Dragon Warrior IV - Bank Interconnection Analysis

## Overview

This document maps how the various PRG ROM banks connect to each other through subroutine calls. Understanding these connections is critical for:
- Tracing code execution paths
- Identifying shared utility routines
- Understanding the game's modular architecture

## Fixed Bank ($C000-$FFFF) - Bank 31

The fixed bank is always mapped and contains core system routines that all switchable banks rely on.

### Most Called Fixed Bank Subroutines

| Address | Calls | Purpose | Banks Using |
|---------|-------|---------|-------------|
| `$FF74` | 140 | NMI RNG update | 11, 15, 18, 20-24, 27-31 |
| `$C90C` | 118 | Wait for input | 11, 15, 17-18, 20, 22-24, 27-31 |
| `$C891` | 73 | RNG main | 8, 15-21, 23-24, 27-31 |
| `$C827` | 56 | Utility (high freq) | 8, 15-21, 23-24, 27-31 |
| `$C5C5` | 48 | System init | 17-18, 21, 23, 27-30 |
| `$C62D` | 43 | Utility | 8, 15, 20, 22-24, 27, 29-31 |
| `$C3EA` | 37 | PPU/video | 8, 15-16, 18, 20-22, 24, 28, 31 |
| `$C851` | 31 | Text/menu | 8, 15-21, 24 |
| `$C813` | 31 | Utility | 8, 14-19, 30-31 |
| `$DDE3` | 28 | Text output | 15, 31 |

## Bank Clusters by Function

### Battle System Cluster (Banks 16-19)

These banks form the core battle system:

```
Bank 19 (Battle Core)
    ├── $A54D (action exec) ← 38 internal calls
    ├── $89B6 (action data) ← 18 internal calls
    ├── $8D77 (char ptr setup) ← 12 internal calls
    └── Calls to Fixed Bank:
        ├── $C891 (RNG)
        ├── $C827 (utility)
        └── $C813 (utility)

Bank 17 (Battle Display)
    ├── $BF2E ← 47 internal calls
    └── Calls Bank 19 via trampoline

Bank 16 (Battle Events)
    ├── $A035 ← 162 calls (16, 28)
    ├── $8198 ← 21 calls (16, 19)
    └── $8241 ← 13 internal calls
```

### Map/World System Cluster (Banks 27-30)

```
Bank 30 (Events/Scenes)
    └── Heavy use of $C5AF, $C662

Bank 29 (Formation/Party)
    ├── $995E ← 25 internal calls
    ├── $A23A ← 17 internal calls
    └── $B16B ← 12 internal calls

Bank 28 (Tile/Map)
    ├── $994E ← 35 internal calls
    ├── $A044 ← 29 internal calls
    └── $BF46 ← 16 internal calls

Bank 27 (Map/Location)
    └── $9F51 ← 13 calls (27, 29)
```

### Level/Stats System (Bank 18)

```
Bank 18 (EXP/Level)
    ├── $B5EF ← 29 internal calls
    ├── $B571 ← 26 internal calls
    ├── $B56D ← 16 internal calls
    ├── $A93B ← 15 internal calls
    └── Calls Fixed Bank:
        ├── $C5C5 (system init)
        ├── $C5BF (utility)
        └── $C8E1 (RNG variant)
```

## Cross-Bank Call Patterns

### Banks That Share Subroutines

| Subroutine | Banks Sharing |
|------------|---------------|
| `$A035` | 16, 28 (162 calls total) |
| `$8198` | 16, 19 (21 calls) |
| `$87D7` | 16, 30 (18 calls) |
| `$899C` | 19, 20 (18 calls) |
| `$98D2` | 22, 29 (16 calls) |
| `$A668` | 16, 21 (12 calls) |
| `$AD26` | 16, 19 (12 calls) |
| `$8330` | 12, 19 (11 calls) |
| `$9C0F` | 22, 28 (13 calls) |
| `$9F51` | 27, 29 (13 calls) |

### Key Insight: Bank 16 is a Hub

Bank 16 shares subroutines with multiple banks:
- Bank 19 (battle core)
- Bank 21 (battle support)
- Bank 28 (tile/map)
- Bank 30 (events)

This suggests Bank 16 contains **shared game logic** used by both battle and overworld systems.

## Call Statistics Summary

| Bank | Total JSR | Total JMP | Unique Subs | Role |
|------|-----------|-----------|-------------|------|
| 6 | 165 | 7 | 540 | Data-heavy |
| 7 | 194 | 15 | 483 | Data processing |
| 8 | 170 | 66 | 530 | Data tables |
| 14 | 129 | 11 | 671 | High sub count |
| 15 | 555 | 221 | 564 | System init |
| **16** | **618** | **124** | **1005** | **Game logic hub** |
| **17** | **483** | **158** | **950** | **Battle display** |
| **18** | **511** | **188** | **833** | **EXP/Stats** |
| 20 | 628 | 76 | 793 | Major code bank |
| 21 | 516 | 304 | 710 | Battle support |
| **22** | **519** | **224** | **876** | **High activity** |
| 27 | 433 | 108 | 576 | Map/location |
| 28 | 564 | 107 | 501 | Tile/map |
| 29 | 402 | 94 | 575 | Formation |
| 30 | 633 | 172 | 863 | Events |

## Execution Flow Patterns

### Battle Initiation
```
1. Map System (Bank 27-30) detects encounter
2. Switch to Bank 17 for battle init
3. Bank 17 calls Bank 19 routines
4. Bank 19 processes combat logic
5. Bank 16 handles scripted events
6. Return to Map System
```

### Level Up
```
1. Battle ends → check EXP (Bank 19)
2. Switch to Bank 18 for level calculation
3. Bank 18 calculates EXP formula at $9F7C
4. Stats updated via coefficient tables
5. Return to Bank 17 for display
```

## Recommendations for Further Analysis

1. **Bank 20** (628 JSR calls) - Major code bank, needs labels
2. **Bank 22** (519 JSR, 224 JMP) - High activity, unexplored
3. **Bank 15** (555 JSR, 221 JMP) - System initialization
4. **Bank 21** (516 JSR, 304 JMP highest!) - Battle support

## Files Referenced

- `analysis/cross_reference.md` - Raw cross-reference data
- `analysis/auto_labels.txt` - Generated labels from analysis
- `debug/Dragon Warrior IV.mlb` - Mesen debug labels
