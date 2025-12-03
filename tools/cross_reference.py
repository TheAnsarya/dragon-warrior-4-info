#!/usr/bin/env python3
"""
Cross-reference analyzer for Dragon Warrior IV disassembly.

Analyzes JSR and JMP instructions across all banks to:
1. Find which subroutines are called most frequently
2. Identify cross-bank calls (calls to fixed bank)
3. Find common patterns and shared routines
"""

import os
import re
from pathlib import Path
from collections import defaultdict

SCRIPT_DIR = Path(__file__).parent
DISASM_DIR = SCRIPT_DIR.parent / "disasm"
OUTPUT_DIR = SCRIPT_DIR.parent / "analysis"


def parse_disassembly_file(filepath):
    """Parse a disassembly file and extract JSR/JMP targets."""
    calls = []
    jumps = []
    subroutines = []
    current_addr = None
    
    with open(filepath, "r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            
            # Skip empty lines and comments
            if not line or line.startswith(";"):
                continue
            
            # Check for label (subroutine start)
            if line.endswith(":") and not line.startswith("."):
                label = line[:-1]
                if label.startswith("loc_"):
                    addr = int(label[4:], 16)
                    subroutines.append(addr)
            
            # Parse JSR and JMP instructions
            jsr_match = re.search(r'JSR \$([0-9A-Fa-f]{4})', line)
            if jsr_match:
                target = int(jsr_match.group(1), 16)
                # Extract source address from comment
                addr_match = re.search(r'; \$([0-9A-Fa-f]{4}):', line)
                if addr_match:
                    source = int(addr_match.group(1), 16)
                    calls.append((source, target))
            
            jmp_match = re.search(r'JMP \$([0-9A-Fa-f]{4})', line)
            if jmp_match:
                target = int(jmp_match.group(1), 16)
                addr_match = re.search(r'; \$([0-9A-Fa-f]{4}):', line)
                if addr_match:
                    source = int(addr_match.group(1), 16)
                    jumps.append((source, target))
    
    return {
        "calls": calls,
        "jumps": jumps,
        "subroutines": subroutines,
    }


def analyze_all_banks():
    """Analyze all bank disassemblies."""
    all_calls = defaultdict(list)  # target -> [(bank, source), ...]
    all_jumps = defaultdict(list)
    bank_stats = {}
    
    for bank_file in sorted(DISASM_DIR.glob("bank*.asm")):
        # Extract bank number - handle files like bank00.asm, bank31_fixed.asm
        stem = bank_file.stem
        if stem.startswith("bank"):
            num_part = stem[4:]
            # Extract just the numeric part
            num_str = ""
            for c in num_part:
                if c.isdigit():
                    num_str += c
                else:
                    break
            if not num_str:
                continue
            bank_num = int(num_str)
        else:
            continue
        
        print(f"Analyzing {bank_file.name}...")
        data = parse_disassembly_file(bank_file)
        
        # Store stats
        bank_stats[bank_num] = {
            "calls": len(data["calls"]),
            "jumps": len(data["jumps"]),
            "subroutines": len(data["subroutines"]),
        }
        
        # Aggregate calls
        for source, target in data["calls"]:
            all_calls[target].append((bank_num, source))
        
        for source, target in data["jumps"]:
            all_jumps[target].append((bank_num, source))
    
    return all_calls, all_jumps, bank_stats


def categorize_calls(all_calls):
    """Categorize calls by target address range."""
    fixed_bank_calls = {}  # Calls to $C000-$FFFF
    switchable_calls = {}  # Calls to $8000-$BFFF
    zp_indirect = {}       # Calls via zero page (unlikely in JSR)
    
    for target, sources in all_calls.items():
        if 0xC000 <= target <= 0xFFFF:
            fixed_bank_calls[target] = sources
        elif 0x8000 <= target <= 0xBFFF:
            switchable_calls[target] = sources
        else:
            zp_indirect[target] = sources
    
    return fixed_bank_calls, switchable_calls, zp_indirect


def generate_report(all_calls, all_jumps, bank_stats):
    """Generate analysis report."""
    OUTPUT_DIR.mkdir(exist_ok=True)
    
    fixed_calls, switchable_calls, other_calls = categorize_calls(all_calls)
    
    lines = []
    lines.append("# Dragon Warrior IV - Cross-Reference Analysis")
    lines.append("")
    lines.append("## Bank Statistics")
    lines.append("")
    lines.append("| Bank | JSR Calls | JMP Instructions | Subroutines |")
    lines.append("|------|-----------|------------------|-------------|")
    
    total_calls = 0
    total_jumps = 0
    total_subs = 0
    
    for bank in sorted(bank_stats.keys()):
        stats = bank_stats[bank]
        total_calls += stats["calls"]
        total_jumps += stats["jumps"]
        total_subs += stats["subroutines"]
        lines.append(f"| {bank:2d}   | {stats['calls']:5d}     | {stats['jumps']:5d}            | {stats['subroutines']:5d}       |")
    
    lines.append(f"| **Total** | **{total_calls}** | **{total_jumps}** | **{total_subs}** |")
    lines.append("")
    
    # Most called fixed bank subroutines
    lines.append("## Most Called Fixed Bank Subroutines ($C000-$FFFF)")
    lines.append("")
    lines.append("These are subroutines in the fixed bank that are called most frequently.")
    lines.append("")
    lines.append("| Address | Call Count | Called From Banks |")
    lines.append("|---------|------------|-------------------|")
    
    sorted_fixed = sorted(fixed_calls.items(), key=lambda x: len(x[1]), reverse=True)
    for target, sources in sorted_fixed[:50]:
        banks = sorted(set(s[0] for s in sources))
        bank_list = ", ".join(str(b) for b in banks[:10])
        if len(banks) > 10:
            bank_list += f"... (+{len(banks)-10})"
        lines.append(f"| ${target:04X}  | {len(sources):5d}      | {bank_list} |")
    
    lines.append("")
    
    # Most called switchable bank subroutines
    lines.append("## Most Called Switchable Bank Subroutines ($8000-$BFFF)")
    lines.append("")
    lines.append("These are typically within the same bank or are known entry points.")
    lines.append("")
    lines.append("| Address | Call Count | Called From Banks |")
    lines.append("|---------|------------|-------------------|")
    
    sorted_switch = sorted(switchable_calls.items(), key=lambda x: len(x[1]), reverse=True)
    for target, sources in sorted_switch[:50]:
        banks = sorted(set(s[0] for s in sources))
        bank_list = ", ".join(str(b) for b in banks[:10])
        if len(banks) > 10:
            bank_list += f"... (+{len(banks)-10})"
        lines.append(f"| ${target:04X}  | {len(sources):5d}      | {bank_list} |")
    
    lines.append("")
    
    # Write report
    report_file = OUTPUT_DIR / "cross_reference.md"
    with open(report_file, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    
    print(f"\nReport written to {report_file}")
    
    # Generate MLB labels file for most-called subroutines
    generate_labels(sorted_fixed, sorted_switch)
    
    return lines


def generate_labels(fixed_calls, switch_calls):
    """Generate MLB labels for frequently called subroutines."""
    lines = []
    lines.append("# Dragon Warrior IV - Auto-generated labels from cross-reference analysis")
    lines.append("# Format: P:ADDR:label")
    lines.append("")
    
    # Fixed bank labels (top 100)
    lines.append("# Fixed Bank ($C000-$FFFF) - Most called subroutines")
    for target, sources in fixed_calls[:100]:
        count = len(sources)
        label = f"sub_{target:04X}"
        lines.append(f"P:{target:04X}:{label}  # {count} calls")
    
    lines.append("")
    lines.append("# Switchable Bank ($8000-$BFFF) - Most called subroutines")
    for target, sources in switch_calls[:100]:
        count = len(sources)
        label = f"sub_{target:04X}"
        lines.append(f"P:{target:04X}:{label}  # {count} calls")
    
    # Write labels
    labels_file = OUTPUT_DIR / "auto_labels.txt"
    with open(labels_file, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    
    print(f"Labels written to {labels_file}")


def main():
    if not DISASM_DIR.exists():
        print(f"ERROR: Disassembly directory not found at {DISASM_DIR}")
        print("Run disassemble_all_banks.py first.")
        return
    
    print("Analyzing Dragon Warrior IV disassembly...")
    print("=" * 60)
    
    all_calls, all_jumps, bank_stats = analyze_all_banks()
    
    print("\nGenerating report...")
    generate_report(all_calls, all_jumps, bank_stats)
    
    print("\nDone!")


if __name__ == "__main__":
    main()
