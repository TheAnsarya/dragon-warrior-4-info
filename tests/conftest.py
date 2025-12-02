"""
Pytest configuration and fixtures for Dragon Warrior 4 Info tests.
"""

import pytest
from pathlib import Path
import sys

# Add project root to path
PROJECT_ROOT = Path(__file__).parent.parent
sys.path.insert(0, str(PROJECT_ROOT))


@pytest.fixture
def project_root():
	"""Return the project root directory."""
	return PROJECT_ROOT


@pytest.fixture
def rom_path(project_root):
	"""Return the path to the ROM file."""
	return project_root / "roms" / "Dragon Warrior IV (1992-10)(Enix)(US).nes"


@pytest.fixture
def assets_dir(project_root):
	"""Return the assets directory."""
	return project_root / "assets"


@pytest.fixture
def source_dir(project_root):
	"""Return the source files directory."""
	return project_root / "source_files"


@pytest.fixture
def build_dir(project_root):
	"""Return the build directory."""
	return project_root / "build"


@pytest.fixture
def sample_rom_data():
	"""Return sample ROM data for testing without actual ROM."""
	# iNES header
	header = bytes([
		0x4E, 0x45, 0x53, 0x1A,  # NES\x1a magic
		0x10,  # 16 PRG banks (256KB)
		0x10,  # 16 CHR banks (128KB)
		0x42,  # Flags 6: vertical mirror, battery, mapper 4 low
		0x40,  # Flags 7: mapper 4 high
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  # Padding
	])

	# Sample PRG data (just zeros for testing)
	prg_data = bytes([0x00] * 256 * 1024)

	# Sample CHR data (just zeros for testing)
	chr_data = bytes([0x00] * 128 * 1024)

	return header + prg_data + chr_data


@pytest.fixture
def temp_output_dir(tmp_path):
	"""Create a temporary output directory for test artifacts."""
	output_dir = tmp_path / "output"
	output_dir.mkdir()
	return output_dir
