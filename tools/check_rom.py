#!/usr/bin/env python3
"""Check ROM structure and interrupt vectors."""

rom_path = 'roms/Dragon Warrior IV (1992-10)(Enix)(US).nes'
with open(rom_path, 'rb') as f:
    rom = f.read()

print('ROM Size:', len(rom), 'bytes')
print()

# iNES header
print('iNES Header (first 16 bytes):')
header = rom[:16]
for i in range(0, 16, 8):
    hex_str = ' '.join(f'{b:02x}' for b in header[i:i+8])
    ascii_str = ''.join(chr(b) if 32 <= b < 127 else '.' for b in header[i:i+8])
    print(f'  {hex_str}  {ascii_str}')

prg_size = header[4] * 16384
chr_size = header[5] * 8192
print(f'\nPRG-ROM: {prg_size} bytes ({header[4]} x 16KB banks)')
print(f'CHR-ROM: {chr_size} bytes ({header[5]} x 8KB banks)')
print(f'Mapper: {(header[6] >> 4) | (header[7] & 0xF0)}')

# Actual vectors at end of PRG
# For 512KB PRG-ROM, vectors are at offset 16 + 512KB - 6
vec_offset = 16 + prg_size - 6
print(f'\nVector offset: 0x{vec_offset:05X}')

vec_nmi = rom[vec_offset] | (rom[vec_offset+1] << 8)
vec_reset = rom[vec_offset+2] | (rom[vec_offset+3] << 8)
vec_irq = rom[vec_offset+4] | (rom[vec_offset+5] << 8)

print(f'NMI:   ${vec_nmi:04X}')
print(f'RESET: ${vec_reset:04X}')
print(f'IRQ:   ${vec_irq:04X}')

# Show the last 32 bytes of PRG
print('\nLast 32 bytes of PRG-ROM:')
end_offset = 16 + prg_size
for i in range(end_offset - 32, end_offset, 16):
    hex_str = ' '.join(f'{b:02x}' for b in rom[i:i+16])
    print(f'  0x{i:05X}: {hex_str}')

# Show code at reset vector
# The reset vector points to CPU address $C000-$FFFF which maps to last PRG bank
# For MMC3, the last bank is fixed at $C000-$DFFF or $E000-$FFFF depending on config
print(f'\nReset handler should be in the fixed bank')
print(f'For CPU addr ${vec_reset:04X}:')

# In MMC3, by default, bank at $C000 is swappable and $E000 is fixed to second-to-last bank
# But in mode 1, $C000 is fixed to second-to-last bank
# The last 8KB ($E000-$FFFF) where vectors live is ALWAYS the last bank

# CPU $E000-$FFFF = ROM offset (PRG_SIZE - 8KB) to PRG_SIZE
# CPU $C000-$DFFF = depends on bank config

if vec_reset >= 0xE000:
    rom_offset = 16 + prg_size - 0x10000 + vec_reset
elif vec_reset >= 0xC000:
    rom_offset = 16 + prg_size - 0x10000 + vec_reset  # Assuming same mapping for now
elif vec_reset >= 0x8000:
    rom_offset = 16 + prg_size - 0x10000 + vec_reset
    
print(f'Likely ROM offset: 0x{rom_offset:05X}')

# Show bytes at reset handler location
print(f'\nBytes at reset handler (0x{rom_offset:05X}):')
for i in range(rom_offset, min(rom_offset + 64, len(rom)), 16):
    hex_str = ' '.join(f'{b:02x}' for b in rom[i:i+16])
    print(f'  0x{i:05X}: {hex_str}')
