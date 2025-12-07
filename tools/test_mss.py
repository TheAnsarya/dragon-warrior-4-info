#!/usr/bin/env python3
"""Test script to analyze Mesen2 save state format.

MSS File Format:
- Header (15 bytes minimum):
  - "MSS" (3 bytes)
  - Emulator version (4 bytes, LE)
  - Format version (4 bytes, LE)
  - Console type (4 bytes, LE)
- Video data (variable, includes preview image)
- ROM name length (4 bytes)
- ROM name (variable)
- Serializer data:
  - isCompressed flag (1 byte)
  - If compressed:
    - Original size (4 bytes, LE)
    - Compressed size (4 bytes, LE)
    - Compressed data (zlib)
  - If not compressed:
    - Raw serializer data
"""

import zlib
import struct
import sys
import os


def read_u32(data, offset):
    """Read 4-byte little-endian unsigned int."""
    return struct.unpack('<I', data[offset:offset+4])[0]


def analyze_mss(filepath):
    with open(filepath, 'rb') as f:
        data = f.read()
    
    print(f"File size: {len(data)} bytes")
    print(f"Magic: {data[:3]}")
    
    if data[:3] != b'MSS':
        print("ERROR: Not an MSS file!")
        return None
    
    # Parse header
    emu_version = read_u32(data, 3)
    format_version = read_u32(data, 7)
    console_type = read_u32(data, 11)
    
    print(f"\nHeader:")
    print(f"  Emulator version: 0x{emu_version:08X}")
    print(f"  Format version: {format_version}")
    print(f"  Console type: {console_type}")
    
    # After header, there's video data (PNG), then ROM name
    # The video data starts with width/height/frame info, then PNG data
    # For now, let's search for the compression marker
    
    # Find the serializer data section
    # Look for 0x01 (compressed) followed by two size values that make sense
    offset = 15  # After fixed header
    serializer_offset = None
    
    # Skip video data - look for reasonable structure
    # Video data: width (4), height (4), frame (8), then PNG size (4), then PNG data
    for i in range(offset, len(data) - 10):
        # Check if this looks like compressed data section
        if data[i] == 0x01:  # Compressed flag
            orig_size = read_u32(data, i + 1)
            comp_size = read_u32(data, i + 5)
            
            # Sanity check sizes
            if comp_size < len(data) - i - 9 and orig_size > comp_size and orig_size < 500000:
                # Try to decompress
                comp_data_start = i + 9
                try:
                    decompressed = zlib.decompress(data[comp_data_start:comp_data_start + comp_size])
                    if len(decompressed) == orig_size:
                        print(f"\nFound serializer at offset {i}:")
                        print(f"  Compressed: True")
                        print(f"  Original size: {orig_size}")
                        print(f"  Compressed size: {comp_size}")
                        serializer_offset = i
                        return analyze_serializer_data(decompressed)
                except:
                    pass
        elif data[i] == 0x00:  # Uncompressed flag (rare)
            # Check if following data looks like serializer format (key\0size data...)
            pass
    
    # Also try raw zlib decompression at various offsets
    print("\nSearching for zlib data...")
    for i in range(len(data) - 2):
        if data[i] == 0x78 and data[i+1] in [0x01, 0x9c, 0xda, 0x5e]:
            try:
                decompressed = zlib.decompress(data[i:])
                print(f"  Found zlib at offset {i}: decompressed {len(decompressed)} bytes")
                return analyze_serializer_data(decompressed)
            except:
                pass
    
    print("\nNo compressed data found")
    return None


def analyze_serializer_data(data):
    """Analyze the decompressed serializer data.
    
    Format: key\0size(4 bytes LE)data...
    """
    print(f"\nAnalyzing serializer data ({len(data)} bytes)...")
    
    offset = 0
    keys_found = {}
    
    while offset < len(data) - 4:
        # Find null terminator for key
        key_end = data.find(b'\x00', offset)
        if key_end < 0 or key_end == offset:
            break
        
        key = data[offset:key_end].decode('ascii', errors='replace')
        
        # Read size (4 bytes after key + null)
        size_offset = key_end + 1
        if size_offset + 4 > len(data):
            break
        
        size = read_u32(data, size_offset)
        data_offset = size_offset + 4
        
        if data_offset + size > len(data):
            # Invalid size - may have hit garbage
            break
        
        value_data = data[data_offset:data_offset + size]
        keys_found[key] = (data_offset, size, value_data)
        
        offset = data_offset + size
        
        # Show progress for large files
        if len(keys_found) % 100 == 0:
            print(f"  Parsed {len(keys_found)} keys...")
    
    print(f"\nFound {len(keys_found)} serialized values")
    
    # Look for memory arrays
    memory_keys = [k for k in keys_found if 'ram' in k.lower() or 'save' in k.lower()]
    print(f"\nMemory-related keys: {memory_keys[:20]}...")
    
    # Show large arrays (likely memory dumps)
    large_arrays = [(k, v[1]) for k, v in keys_found.items() if v[1] >= 256]
    large_arrays.sort(key=lambda x: -x[1])
    print(f"\nLargest data blocks:")
    for key, size in large_arrays[:20]:
        print(f"  {key}: {size} bytes")
    
    # Look specifically for saveRam or workRam
    for key in ['mapper._saveRam', '_saveRam', 'mapper.saveRam', 'saveRam']:
        if key in keys_found:
            offset, size, value = keys_found[key]
            print(f"\nFound {key} ({size} bytes):")
            print(f"  First 64 bytes: {value[:64].hex()}")
            return value
    
    return None


if __name__ == "__main__":
    if len(sys.argv) > 1:
        filepath = sys.argv[1]
    else:
        filepath = "saves/test_save.mss"
    
    if os.path.exists(filepath):
        analyze_mss(filepath)
    else:
        print(f"File not found: {filepath}")
