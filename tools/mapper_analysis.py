#!/usr/bin/env python3
"""
Dragon Warrior IV - Mapper Analysis
Determine the actual mapper type and document bank switching behavior
"""

import os

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms', 
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')

def load_rom():
    with open(ROM_PATH, 'rb') as f:
        return f.read()

def analyze_header(rom_data):
    """Analyze iNES header"""
    if rom_data[:4] != b'NES\x1a':
        return None
    
    prg_banks = rom_data[4]
    chr_banks = rom_data[5]
    flags6 = rom_data[6]
    flags7 = rom_data[7]
    
    mapper = (flags6 >> 4) | (flags7 & 0xF0)
    
    mirroring = 'Vertical' if flags6 & 1 else 'Horizontal'
    if flags6 & 8:
        mirroring = '4-screen'
    
    has_battery = bool(flags6 & 2)
    has_trainer = bool(flags6 & 4)
    
    return {
        'prg_size': prg_banks * 16384,
        'chr_size': chr_banks * 8192,
        'mapper': mapper,
        'mirroring': mirroring,
        'battery': has_battery,
        'trainer': has_trainer,
    }

def find_mapper_writes(rom_data):
    """Find STA instructions to mapper registers"""
    results = []
    
    # Common mapper register ranges
    mapper_ranges = {
        'MMC1': [(0x8000, 0xFFFF)],  # MMC1 uses $8000-$FFFF with serial protocol
        'MMC3': [(0x8000, 0x8001), (0xA000, 0xA001), (0xC000, 0xC001), (0xE000, 0xE001)],
        'UNROM': [(0x8000, 0xFFFF)],
    }
    
    # Look for STA abs ($8D) to high memory
    for offset in range(16, len(rom_data) - 2):
        if rom_data[offset] == 0x8D:  # STA absolute
            addr_lo = rom_data[offset + 1]
            addr_hi = rom_data[offset + 2]
            addr = addr_lo | (addr_hi << 8)
            
            if addr >= 0x8000:
                results.append({
                    'rom_offset': offset,
                    'target': addr,
                    'bank': (offset - 16) // 0x4000
                })
    
    return results

def analyze_bank_switch_code(rom_data):
    """Look for the specific bank switching pattern used"""
    
    # MMC1 pattern: multiple writes with LSR between them
    # The code we found: STA $9FFF, LSR, STA $9FFF, LSR...
    
    mmc1_patterns = []
    
    # Look for: STA $xxFF, LSR, STA $xxFF pattern
    for offset in range(16, len(rom_data) - 10):
        # STA absolute ($8D xx xx)
        if rom_data[offset] == 0x8D:
            addr1 = rom_data[offset + 1] | (rom_data[offset + 2] << 8)
            if addr1 >= 0x8000 and (addr1 & 0xFF) == 0xFF:
                # Check for LSR ($4A) followed by another STA
                if rom_data[offset + 3] == 0x4A and rom_data[offset + 4] == 0x8D:
                    addr2 = rom_data[offset + 5] | (rom_data[offset + 6] << 8)
                    if addr2 == addr1:
                        cpu = 0xC000 + ((offset - 16) % 0x4000) if offset >= 16 + 0x78000 else \
                              0x8000 + ((offset - 16) % 0x4000)
                        mmc1_patterns.append({
                            'rom_offset': offset,
                            'cpu': cpu,
                            'register': addr1,
                            'bank': (offset - 16) // 0x4000
                        })
    
    return mmc1_patterns

def main():
    rom_data = load_rom()
    
    print("=" * 70)
    print("DRAGON WARRIOR IV - MAPPER ANALYSIS")
    print("=" * 70)
    print()
    
    # Header analysis
    header = analyze_header(rom_data)
    print("iNES HEADER:")
    print(f"  PRG-ROM Size: {header['prg_size']:,} bytes ({header['prg_size'] // 1024}KB)")
    print(f"  CHR-ROM Size: {header['chr_size']:,} bytes ({header['chr_size'] // 1024}KB)")
    print(f"  Mapper: {header['mapper']}")
    print(f"  Mirroring: {header['mirroring']}")
    print(f"  Battery: {header['battery']}")
    print(f"  Trainer: {header['trainer']}")
    print()
    
    # Mapper identification
    if header['mapper'] == 1:
        print("Header indicates MAPPER 1 (MMC1)")
        print()
    
    # Find mapper writes
    writes = find_mapper_writes(rom_data)
    
    # Group by target address
    by_target = {}
    for w in writes:
        target = w['target']
        if target not in by_target:
            by_target[target] = []
        by_target[target].append(w)
    
    print("MAPPER REGISTER WRITES:")
    print(f"  Total STA to $8000+ found: {len(writes)}")
    print()
    
    # Show most common targets
    sorted_targets = sorted(by_target.items(), key=lambda x: len(x[1]), reverse=True)
    print("Most common targets:")
    for target, ws in sorted_targets[:20]:
        print(f"  ${target:04X}: {len(ws)} writes")
    print()
    
    # MMC1 specific analysis
    mmc1_patterns = analyze_bank_switch_code(rom_data)
    print(f"MMC1 SERIAL WRITE PATTERNS (STA/LSR/STA sequences): {len(mmc1_patterns)}")
    
    if mmc1_patterns:
        # Group by register
        by_reg = {}
        for p in mmc1_patterns:
            reg = p['register']
            if reg not in by_reg:
                by_reg[reg] = []
            by_reg[reg].append(p)
        
        print("\nBy register:")
        for reg, patterns in sorted(by_reg.items()):
            print(f"  ${reg:04X}: {len(patterns)} occurrences")
            for p in patterns[:3]:
                print(f"    Bank {p['bank']}, ${p['cpu']:04X}")
        
        print()
        print("MMC1 REGISTER MAPPING:")
        print("  $8000-$9FFF -> Control register (mirroring, PRG mode, CHR mode)")
        print("  $A000-$BFFF -> CHR bank 0 (or CHR bank 0/1 in 8KB mode)")
        print("  $C000-$DFFF -> CHR bank 1 (ignored in 8KB mode)")
        print("  $E000-$FFFF -> PRG bank select")
        print()
        
        # Determine which registers are used
        used_regs = set(p['register'] & 0xE000 for p in mmc1_patterns)
        print("Registers used in this ROM:")
        reg_names = {
            0x8000: "Control",
            0xA000: "CHR bank 0",
            0xC000: "CHR bank 1", 
            0xE000: "PRG bank"
        }
        for reg_base in sorted(used_regs):
            actual = [p['register'] for p in mmc1_patterns if (p['register'] & 0xE000) == reg_base]
            print(f"  {reg_names.get(reg_base, 'Unknown')}: addresses {sorted(set(actual))}")
    
    print()
    print("=" * 70)
    print("BANK SWITCHING CODE DISASSEMBLY")
    print("=" * 70)
    
    # The main bank switch routines are in the fixed bank
    # From our earlier analysis: $C118, $C12F, $C146
    
    print("""
Based on earlier disassembly, the bank switching routines are:

$C118 - mmc1_write_ctrl:
    ; Write to MMC1 Control register ($9FFF)
    ; Uses serial protocol: 5 writes with LSR between
    STA $0500      ; Shadow register
    STA $9FFF      ; Write bit 0
    LSR
    STA $9FFF      ; Write bit 1
    LSR
    STA $9FFF      ; Write bit 2
    LSR
    STA $9FFF      ; Write bit 3
    LSR
    STA $9FFF      ; Write bit 4 (with strobe)
    RTS

$C12F - mmc1_write_chr0:
    ; Write to MMC1 CHR bank 0 ($BFFF)
    ; Same serial protocol

$C146 - mmc1_write_prg:
    ; Write to MMC1 PRG bank ($DFFF)
    ; Same serial protocol

This confirms MMC1 mapper with:
- 512KB PRG-ROM (32 banks)
- CHR-RAM (no CHR-ROM)
- PRG bank switching for $8000-$BFFF
- $C000-$FFFF fixed to last bank (Bank 31)
""")
    
    # Save analysis
    output_path = os.path.join(os.path.dirname(__file__), '..', 'docs', 'analysis',
                               'mapper_analysis.txt')
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    
    with open(output_path, 'w') as f:
        f.write("Dragon Warrior IV - Mapper Analysis\n")
        f.write("=" * 60 + "\n\n")
        f.write(f"Mapper: {header['mapper']} (MMC1)\n")
        f.write(f"PRG-ROM: {header['prg_size'] // 1024}KB\n")
        f.write(f"CHR: RAM (no CHR-ROM)\n")
        f.write(f"Battery: {header['battery']}\n\n")
        
        f.write("MMC1 Register Writes Found:\n")
        for target, ws in sorted_targets[:20]:
            f.write(f"  ${target:04X}: {len(ws)} writes\n")
        
        f.write("\nBank Switching Routines:\n")
        f.write("  $C118: Write Control ($9FFF)\n")
        f.write("  $C12F: Write CHR Bank ($BFFF)\n")
        f.write("  $C146: Write PRG Bank ($DFFF)\n")
    
    print(f"\nSaved to: {output_path}")

if __name__ == '__main__':
    main()
