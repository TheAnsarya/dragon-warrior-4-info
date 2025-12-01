"""
Dragon Warrior 4 Info - Tools Package

This package contains tools for:
- ROM analysis and disassembly
- Asset extraction and reinsertion
- Universal asset editor
- Build pipeline utilities
"""

__version__ = "0.1.0"
__author__ = "Dragon Warrior 4 Info Project"

from pathlib import Path

# Package constants
TOOLS_DIR = Path(__file__).parent
PROJECT_ROOT = TOOLS_DIR.parent
ROM_DIR = PROJECT_ROOT / "roms"
ASSETS_DIR = PROJECT_ROOT / "assets"
SOURCE_DIR = PROJECT_ROOT / "source_files"
BUILD_DIR = PROJECT_ROOT / "build"

# ROM constants
ROM_NAME = "Dragon Warrior IV (1992-10)(Enix)(US).nes"
ROM_PATH = ROM_DIR / ROM_NAME

# iNES header size
HEADER_SIZE = 16

# PRG ROM info (256 KB = 16 banks of 16 KB)
PRG_BANK_SIZE = 0x4000  # 16 KB
PRG_BANK_COUNT = 16
PRG_ROM_SIZE = PRG_BANK_SIZE * PRG_BANK_COUNT  # 262144 bytes

# CHR ROM info (128 KB = 16 banks of 8 KB)
CHR_BANK_SIZE = 0x2000  # 8 KB
CHR_BANK_COUNT = 16
CHR_ROM_SIZE = CHR_BANK_SIZE * CHR_BANK_COUNT  # 131072 bytes

# Mapper info
MAPPER_NUMBER = 4  # MMC3
HAS_BATTERY = True
HAS_TRAINER = False

# Expected ROM checksums
EXPECTED_MD5 = "a5a781e5ae7c75765969eba2beb4e27f"
EXPECTED_SHA1 = "e7c56a3e29bf22f7f9c04b5c22f8c0e6f5f8f3a7"
