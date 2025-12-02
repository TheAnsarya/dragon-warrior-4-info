#!/usr/bin/env python3
"""
Extract complete DTE table from DW4 ROM.

DTE table is at Bank 22, CPU $B3A4 = ROM 0x5B3B4
Each entry is 2 bytes (character pair).
Codes $80-$FE map to entries 0-126 (254 bytes total).
$FF is reserved for END marker.
"""

ROM_PATH = r"c:\Users\me\source\repos\dragon-warrior-4-info\roms\Dragon Warrior IV (1992-10)(Enix)(US).nes"

# TBL mapping
TBL = {0x00: ' '}
for i in range(10):
    TBL[0x01 + i] = str(i)
for i, c in enumerate('abcdefghijklmnopqrstuvwxyz'):
    TBL[0x0B + i] = c
for i, c in enumerate('ABCDEFGHIJKLMNOPQRSTUVWXYZ'):
    TBL[0x25 + i] = c
# Punctuation (from Data Crystal)
TBL[0x65] = '—'
TBL[0x66] = '"'
TBL[0x67] = '"'
TBL[0x68] = "'"
TBL[0x69] = "'"
TBL[0x6A] = "'"
TBL[0x6B] = "'"
TBL[0x6D] = '?'
TBL[0x6E] = '!'
TBL[0x6F] = '-'
TBL[0x70] = '*'
TBL[0x71] = ':'
TBL[0x72] = '…'
TBL[0x75] = '('
TBL[0x76] = ')'
TBL[0x77] = ','
TBL[0x78] = '.'

def decode_char(b):
    return TBL.get(b, f'<{b:02X}>')

def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()

    bank22 = 0x58010

    # DTE table at $B3A4, but let's verify the actual start
    # Looking at the extracted entries, $80='64' which is speed value
    # The actual meaningful entries start at $82
    # But we should document from the table start

    # Hmm, looking more carefully at the code, the DTE table
    # might not start exactly at $B3A4. Let me search backward
    # for a better alignment.

    # Actually, looking at the output, the table is correctly aligned.
    # The "64" entry might be "speed 64" message fragment.

    dte_offset = bank22 + 0x33A4  # CPU $B3A4

    print("=" * 70)
    print("DRAGON WARRIOR IV - COMPLETE DTE TABLE")
    print("=" * 70)
    print("Location: Bank 22, CPU $B3A4, ROM 0x5B3B4")
    print()

    # Extract full table (codes $80-$FE = 127 entries = 254 bytes)
    dte_entries = {}

    for i in range(127):  # $80-$FE
        code = 0x80 + i
        b1 = rom[dte_offset + i*2]
        b2 = rom[dte_offset + i*2 + 1]

        c1 = decode_char(b1)
        c2 = decode_char(b2)

        # Check if this is a valid entry (both chars printable)
        if len(c1) == 1 and len(c2) == 1:
            dte_entries[code] = c1 + c2
        else:
            # Could be a recursive DTE code
            dte_entries[code] = f'<{b1:02X}><{b2:02X}>'

    # Print table
    print("Code  Hex    Pair   Meaning")
    print("-" * 40)

    for code in range(0x80, 0xFF):
        entry = dte_entries.get(code, "???")
        b1 = rom[dte_offset + (code-0x80)*2]
        b2 = rom[dte_offset + (code-0x80)*2 + 1]

        # Try to interpret recursive codes
        if len(entry) > 2 and '<' in entry:
            # Check if first byte is another DTE code
            if b1 >= 0x80 and b1 in dte_entries:
                entry = f"{dte_entries[b1]}+{decode_char(b2)}"

        print(f"${code:02X}   ${b1:02X}{b2:02X}  {entry:8s}")

    # Generate TBL file content
    print("\n" + "=" * 70)
    print("TBL FILE FORMAT (for ROM hacking tools)")
    print("=" * 70)

    for code in range(0x80, 0xFF):
        entry = dte_entries.get(code, "")
        if entry and len(entry) == 2 and '<' not in entry:
            print(f"{code:02X}={entry}")

    # Now let's try to decode some menu text with this DTE
    print("\n" + "=" * 70)
    print("TEST: Decoding menu text at $B3A3")
    print("=" * 70)

    # The text "5642 speed you like" starts before the DTE table
    test_start = bank22 + 0x3398  # A bit before $B3A4
    test_data = rom[test_start:test_start + 200]

    # Decode with DTE
    result = []
    i = 0
    while i < len(test_data):
        b = test_data[i]
        if b == 0xFF:
            result.append('<END>')
            i += 1
            continue
        if b >= 0x80:
            if b in dte_entries:
                result.append(dte_entries[b])
            else:
                result.append(f'<{b:02X}>')
        else:
            result.append(decode_char(b))
        i += 1

    decoded = ''.join(result)
    print(f"Raw bytes: {' '.join(f'{b:02X}' for b in test_data[:50])}")
    print(f"Decoded: {decoded[:100]}")

if __name__ == "__main__":
    main()
