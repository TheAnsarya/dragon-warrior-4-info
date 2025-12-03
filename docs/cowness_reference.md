# Dragon Warrior IV - Cowness.net Reference Data

Data sourced from https://cowness.net/Speedrunning/DW4%20Notes/

## Hero Experience Requirements

| Level | Total EXP | EXP to Next |
|-------|-----------|-------------|
| 25 | 102,787 | - |
| 26 | 118,192 | 15,405 |
| 27 | 135,522 | 17,330 |
| 28 | 155,018 | 19,496 |
| 29 | 176,951 | 21,933 |
| 30 | 201,625 | 24,674 |
| 31 | 229,383 | 27,758 |

## Necrosaro Boss HP by Phase

| Phase | HP | Notes |
|-------|-----|-------|
| 1 | 800 |  |
| 2 | 650 |  |
| 3 | 1023 |  |
| 4 | 1023 |  |
| 5 | 700 |  |
| 6 | 800 |  |
| 7 | 700 | Regenerates 100/turn |
| 8 | 1023 |  |

## Tournament Opponents (Chapter 2)

| Name | HP | MP | Notes |
|------|-----|-----|-------|
| Hun | 70 | - | standard |
| Roric | 90 | - | standard |
| Vivian | 90 | 12 | caster |
| Sampson | 90 | - | standard |
| Linguar | 55 | - | standard |

## RNG System Addresses

### RAM Addresses

| Address | Name | Description |
|---------|------|-------------|
| $0012 | RNG_Seed_Low | RNG seed low byte - changes every frame, XORed with save checksum |
| $0013 | RNG_Seed_High | RNG seed high byte - acts like DW3's RNG |
| $0016 | RNG_Temp | RNG temporary storage - used during RNG calculation |
| $0018 | Encounter_Rate | Encounter rate of current tile |
| $050C | RNG_Counter_Compare | RNG counter comparison value |
| $050D | RNG_Counter | RNG counter - increments each time a random number is generated |

### RNG Code (Bank 31 / $1F - Fixed Bank)

| Address | Name | Description |
|---------|------|-------------|
| $C890 | rng_return | RNG RTS |
| $C891 | rng_main | Main RNG function - generates random number |
| $C8A1 | rng_inc_counter | Increment RNG counter at $050D |
| $C8A6 | rng_load_seed | Load seed from $0012 and add counter |
| $C8AD | rng_shifter | RNG bit shift subroutine |
| $C8CB | rng_shifter_end | RNG shifter end |
| $C913 | rng_related | RNG related subroutine (called from NMI) |
| $FF74 | nmi_rng_update | NMI handler - updates RNG seed $0012 |
| $FF79 | nmi_inc_seed | Increment RNG seed low byte |
| $FF82 | nmi_call_rng | Call RNG-related subroutine |

## Save File Memory Layout

| Region | Start | End | Size | Description |
|--------|-------|-----|------|-------------|
| current | $6000 | $62EE | 751 bytes | Current_Save_Data |
| file1 | $62EF | $65DE | 752 bytes | Save_File_1 |
| file2 | $65DF | $68CE | 752 bytes | Save_File_2 |
| file3 | $68CF | $6BBE | 752 bytes | Save_File_3 |

## Monster Data Byte Structure

Monster data records have at least 27 bytes. Key flag bytes:

### Byte 22

Monster special flags

**Bit Layout:**
- Bits 0-1: Metal flag (11 = Metal monster, immune to most damage)

### Byte 23

Drop rate and flags

**Bit Layout:**
- Bits 0-2: Item drop rate (000=0, 001=1/2, 010=1/4, 011=1/8, 100=1/16, 101=1/32, 110=1/256, 111=100%)
- Bits 3-7: Unknown flags

### Byte 24

Status vulnerability and behavior flags

**Bit Layout:**
- Bits 0-2: Status flags (usually 111)
- Bits 3-5: Mid bits - behavior flags
- Bits 6: Confused vulnerability (1=can be confused)
- Bits 7: Bounce/reflect magic flag

**Known Patterns:**

| Value | Meaning |
|-------|---------|
| $C7 | Bounce - reflects magic |
| $87 | Confused - can be confused |
| $47 | Paralyzed - can be paralyzed |
| $07 | Asleep - can be put to sleep (Esturk, Bomb Crag) |
| $17 | Sleepy Boys pattern (Brahmird, Big Sloth) |
| $3F | Standard enemy pattern |

## Known Monster Byte Patterns

| Monster | Byte 22 | Byte 24 | Notes |
|---------|---------|---------|-------|
| Metal Slime | $11 | $3F | Metal flag set |
| Metal Babble | $11 | $3F | Metal flag set, evasion '3' |
| King Metal | $11 | $37 | Metal flag set, different mid bits |
| Esturk | $00 | $07 | Sleepiest Boy - very vulnerable to sleep |
| Necrosaro 7 | $00 | $C7 | Has bounce/reflect |
| Mimic | $00 | $3F | Standard Mimic AI |
| Vampire Bat | $00 | $9F | Confused Boys pattern |
| Rogue Wisper | $00 | $97 | Confused Boys pattern |

## Gameplay Mechanics

- **Fairy Water Duration:** 127 steps of enemy repel
- **Necrosaro Phase 7 Regeneration:** 100 HP per turn

### Alena Level 11 Stat Ranges

- HP: 71 - 91
- ATK: 75 - 86
- DEF: 39 - 41
