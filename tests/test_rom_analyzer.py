"""
Tests for ROM analyzer tool.
"""

import pytest
from pathlib import Path


class TestROMAnalyzer:
	"""Tests for the ROM analyzer module."""

	def test_import(self):
		"""Test that the module can be imported."""
		from tools.rom_analyzer import ROMAnalyzer, INESHeader
		assert ROMAnalyzer is not None
		assert INESHeader is not None

	def test_ines_header_parsing(self, sample_rom_data, tmp_path):
		"""Test parsing of iNES header."""
		from tools.rom_analyzer import ROMAnalyzer

		# Write sample ROM to temp file
		rom_path = tmp_path / "test.nes"
		rom_path.write_bytes(sample_rom_data)

		analyzer = ROMAnalyzer(rom_path)
		assert analyzer.load() == True

		header = analyzer.header
		assert header is not None
		assert header.is_valid == True
		assert header.prg_rom_size == 16  # 16 banks
		assert header.chr_rom_size == 16  # 16 banks
		assert header.mapper_number == 4  # MMC3
		assert header.has_battery == True

	def test_checksum_calculation(self, sample_rom_data, tmp_path):
		"""Test checksum calculation."""
		from tools.rom_analyzer import ROMAnalyzer

		rom_path = tmp_path / "test.nes"
		rom_path.write_bytes(sample_rom_data)

		analyzer = ROMAnalyzer(rom_path)
		analyzer.load()

		md5 = analyzer.get_checksum("md5")
		assert len(md5) == 32  # MD5 hash length

		sha1 = analyzer.get_checksum("sha1")
		assert len(sha1) == 40  # SHA1 hash length

	def test_get_vectors(self, sample_rom_data, tmp_path):
		"""Test getting interrupt vectors."""
		from tools.rom_analyzer import ROMAnalyzer

		rom_path = tmp_path / "test.nes"
		rom_path.write_bytes(sample_rom_data)

		analyzer = ROMAnalyzer(rom_path)
		analyzer.load()

		vectors = analyzer.get_vectors()
		assert "NMI" in vectors
		assert "RESET" in vectors
		assert "IRQ/BRK" in vectors

	def test_bank_extraction(self, sample_rom_data, tmp_path):
		"""Test PRG bank extraction."""
		from tools.rom_analyzer import ROMAnalyzer

		rom_path = tmp_path / "test.nes"
		rom_path.write_bytes(sample_rom_data)

		analyzer = ROMAnalyzer(rom_path)
		analyzer.load()

		bank_data = analyzer.get_prg_bank(0)
		assert len(bank_data) == 0x4000  # 16KB

		bank_data = analyzer.get_prg_bank(15)
		assert len(bank_data) == 0x4000  # 16KB

	def test_invalid_rom(self, tmp_path):
		"""Test handling of invalid ROM file."""
		from tools.rom_analyzer import ROMAnalyzer

		# Create invalid ROM
		invalid_path = tmp_path / "invalid.nes"
		invalid_path.write_bytes(b"NOT A NES ROM")

		analyzer = ROMAnalyzer(invalid_path)
		assert analyzer.load() == False

	def test_nonexistent_rom(self, tmp_path):
		"""Test handling of nonexistent ROM file."""
		from tools.rom_analyzer import ROMAnalyzer

		analyzer = ROMAnalyzer(tmp_path / "nonexistent.nes")
		assert analyzer.load() == False


class TestPatternSearch:
	"""Tests for pattern searching functionality."""

	def test_find_pattern(self, sample_rom_data, tmp_path):
		"""Test finding byte patterns in ROM."""
		from tools.rom_analyzer import ROMAnalyzer

		# Create ROM with a known pattern
		pattern = b"\xAD\x02\x20"  # LDA $2002 (PPU status read)
		modified_data = bytearray(sample_rom_data)
		modified_data[0x100:0x103] = pattern

		rom_path = tmp_path / "test.nes"
		rom_path.write_bytes(bytes(modified_data))

		analyzer = ROMAnalyzer(rom_path)
		analyzer.load()

		results = analyzer.find_pattern(pattern)
		assert 0x100 in results
