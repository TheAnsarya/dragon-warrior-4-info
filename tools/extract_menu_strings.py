#!/usr/bin/env python3
"""
Dragon Warrior IV - Menu Text Extractor

Extract and document all menu text strings from Bank 22.
"""

import os

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')


def decode_char(b):
    """Decode a single character using DW4 text encoding."""
    if b == 0x00:
        return ' '
    elif 0x01 <= b <= 0x0A:
        return str(b - 1)
    elif 0x0B <= b <= 0x24:
        return chr(ord('a') + b - 0x0B)
    elif 0x25 <= b <= 0x3E:
        return chr(ord('A') + b - 0x25)
    elif b == 0xFF:
        return None  # END marker
    elif b == 0xFD:
        return '\n'  # LINE
    elif b == 0xFE:
        return ''  # CTRL
    elif b == 0x65:
        return '!'
    elif b == 0x66:
        return '?'
    elif b == 0x67:
        return '.'
    elif b == 0x68:
        return ','
    elif b == 0x69:
        return '-'
    elif b == 0x6A:
        return "'"
    elif b == 0x6B:
        return '"'
    elif b == 0x6C:
        return ':'
    elif b == 0x6D:
        return '/'  # Or newline marker
    elif b == 0x78:
        return '~'  # Approximate
    elif b == 0x89:
        return '>'  # Menu cursor
    elif b == 0x8B:
        return '|'  # Separator
    elif b == 0xA0 or b == 0xA1:
        return '@'  # Special marker
    else:
        return f'[{b:02X}]'


def decode_string(data, max_len=100):
    """Decode a byte sequence to a string."""
    result = []
    for i, b in enumerate(data[:max_len]):
        if b == 0xFF:
            break
        c = decode_char(b)
        if c is not None:
            result.append(c)
    return ''.join(result)


def find_strings_in_region(rom, bank_start, cpu_start, cpu_end):
    """Find all strings in a ROM region."""
    strings = []
    offset = cpu_start - 0x8000

    i = offset
    end_offset = cpu_end - 0x8000

    while i < end_offset:
        # Look for string start (after $FF or at beginning)
        start = i

        # Scan for printable characters
        j = i
        printable_count = 0
        while j < end_offset:
            b = rom[bank_start + j]
            if b == 0xFF:
                # Found end
                if j > i and printable_count >= 2:
                    text = decode_string(rom[bank_start + i:bank_start + j + 1])
                    if len(text.strip()) >= 2:
                        cpu_addr = 0x8000 + i
                        strings.append((cpu_addr, text.strip()))
                i = j + 1
                break
            elif b <= 0x40 or 0x60 <= b <= 0x90:
                # Could be text
                if b <= 0x3E:
                    printable_count += 1
                j += 1
            else:
                # Non-text byte, move on
                i = j + 1
                break
        else:
            break

    return strings


def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()

    bank22_start = 22 * 0x4000 + 0x10

    print("=" * 70)
    print(" DRAGON WARRIOR IV - MENU TEXT EXTRACTION")
    print(" Bank 22")
    print("=" * 70)

    # Menu text uses $8B as separator, not $FF as terminator
    # Extract from $B3B3 onwards

    print("\n--- Main Menu/System Text ($B3B3+) ---\n")

    offset = 0x33B3  # $B3B3 - $8000
    strings_found = []
    current_string = []
    string_start = 0xB3B3

    # Read until we hit code (look for common 6502 patterns)
    while offset < 0x3600:
        b = rom[bank22_start + offset]

        # $8B is the separator between menu items
        if b == 0x8B:
            if current_string:
                text = decode_string(bytes(current_string))
                if text.strip():
                    strings_found.append((string_start, text.strip(), 'menu'))
                current_string = []
            string_start = 0x8000 + offset + 1
        # $6D appears to be another separator/newline
        elif b == 0x6D:
            if current_string:
                text = decode_string(bytes(current_string))
                if text.strip():
                    strings_found.append((string_start, text.strip(), 'dialog'))
                current_string = []
            string_start = 0x8000 + offset + 1
        # Stop at obvious code (many JSR/JMP patterns)
        elif b in (0x20, 0x4C, 0x60) and offset > 0x3400:
            # Could be code, check pattern
            if b == 0x60 or (b == 0x20 and rom[bank22_start + offset + 1] > 0x80):
                break
            current_string.append(b)
        else:
            if not current_string:
                string_start = 0x8000 + offset
            current_string.append(b)

        offset += 1

    # Handle last string
    if current_string:
        text = decode_string(bytes(current_string))
        if text.strip():
            strings_found.append((string_start, text.strip(), 'end'))

    print(f"Found {len(strings_found)} menu strings:\n")

    for addr, text, stype in strings_found:
        # Clean up for display
        display = text.replace('\n', ' / ')
        if len(display) > 55:
            display = display[:52] + "..."
        print(f"  ${addr:04X}: {display}")

    # Write output file
    output_path = os.path.join(os.path.dirname(__file__), '..', 'docs', 'analysis', 'menu_text_bank22.md')
    os.makedirs(os.path.dirname(output_path), exist_ok=True)

    with open(output_path, 'w') as f:
        f.write("# Dragon Warrior IV - Menu Text (Bank 22)\n\n")
        f.write("## Overview\n\n")
        f.write("Menu and system text strings extracted from Bank 22 ($B3B3+).\n\n")
        f.write("Text uses $8B as separator between menu items.\n\n")
        f.write("## Text Strings\n\n")
        f.write("| Address | Text |\n")
        f.write("|---------|------|\n")

        for addr, text, stype in strings_found:
            text_escaped = text.replace('|', '\\|').replace('\n', ' / ')
            f.write(f"| ${addr:04X} | {text_escaped} |\n")

        f.write("\n## Categories\n\n")
        f.write("### Main Menu\n")
        f.write("- QUEST (New/Continue)\n")
        f.write("- COPY, ERASE, NAME\n")
        f.write("- MESSAGE SPEED (Fast/Slow)\n\n")

        f.write("### Battle Commands\n")
        f.write("- FIGHT, TACTICS, MEMBER, RUN\n")
        f.write("- SPELL, ITEM, ATTACK, PARRY\n")
        f.write("- SEE, SWITCH, REMOVE, ADD\n\n")

        f.write("### System\n")
        f.write("- ADVENTURE LOG\n")
        f.write("- Chapter, LEVEL\n")
        f.write("- Message selection (1-8)\n")

    print(f"\nOutput written to: {output_path}")


if __name__ == '__main__':
    main()
