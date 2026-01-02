#!/usr/bin/env python3
"""
Dragon Warrior IV - Event Script Extractor
===========================================

Extracts event scripts from the NES ROM and converts them to a format
compatible with DQ4r's EventScript model.

Event scripts in DW4 are distributed across multiple banks:
- Bank 4 ($10010): NPC/Event code
- Bank 17 ($5C010): Map pointer tables, NPC tables
- Banks 16-20 ($40010-$54010): Dialog text with DTE encoding

Output: JSON files suitable for DQ4r EventScript and related classes.
"""

import os
import json
import struct
from dataclasses import dataclass, asdict
from enum import IntEnum
from typing import Optional

# Paths
ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
						'Dragon Warrior IV (1992-10)(Enix)(US).nes')
OUTPUT_DIR = os.path.join(os.path.dirname(__file__), '..', 'extracted', 'events')

# Bank offsets (file offset = header + bank * 0x4000)
HEADER_SIZE = 16
BANK_SIZE = 0x4000


class TriggerType(IntEnum):
	"""Event trigger types matching DQ4r EventTriggerType."""
	STEP_ON = 0
	INTERACT = 1
	MAP_ENTER = 2
	FLAG_SET = 3
	ITEM_USE = 4
	BATTLE_WIN = 5
	CHAPTER_START = 6
	TIMER = 7
	SCRIPT_CALL = 8
	AUTO = 9


class ScriptOpcode(IntEnum):
	"""Script opcodes matching DQ4r ScriptOpcode."""
	NOP = 0x00
	END = 0x01
	SHOW_MESSAGE = 0x02
	SHOW_CHOICE = 0x03
	SET_FLAG = 0x04
	CLEAR_FLAG = 0x05
	CHECK_FLAG = 0x06
	JUMP = 0x07
	JUMP_IF_TRUE = 0x08
	JUMP_IF_FALSE = 0x09
	CALL = 0x0A
	RETURN = 0x0B
	SET_VAR = 0x0C
	GET_VAR = 0x0D
	ADD_VAR = 0x0E
	SUB_VAR = 0x0F
	COMPARE_VAR = 0x10
	GIVE_ITEM = 0x11
	TAKE_ITEM = 0x12
	CHECK_ITEM = 0x13
	GIVE_GOLD = 0x14
	TAKE_GOLD = 0x15
	CHECK_GOLD = 0x16
	HEAL_PARTY = 0x17
	WARP = 0x18
	PLAY_MUSIC = 0x19
	PLAY_SOUND = 0x1A
	FADE_OUT = 0x1B
	FADE_IN = 0x1C
	START_BATTLE = 0x1D
	START_CUTSCENE = 0x1E
	ADD_PARTY_MEMBER = 0x1F
	REMOVE_PARTY_MEMBER = 0x20
	CHECK_CHAPTER = 0x21
	CHECK_PARTY = 0x22
	OPEN_SHOP = 0x23
	OPEN_INN = 0x24
	OPEN_CHURCH = 0x25
	OPEN_BANK = 0x26
	WAIT = 0x27


@dataclass
class ScriptInstruction:
	"""Single script instruction."""
	opcode: int
	parameters: list[int]
	comment: str = ""

	def to_dict(self):
		return {
			"opcode": self.opcode,
			"opcode_name": ScriptOpcode(self.opcode).name if self.opcode < 0x28 else f"UNK_{self.opcode:02X}",
			"parameters": self.parameters,
			"comment": self.comment
		}


@dataclass
class EventScript:
	"""Extracted event script."""
	id: int
	name: str
	chapter_id: int
	trigger_type: int
	map_id: int
	trigger_x: int
	trigger_y: int
	instructions: list[ScriptInstruction]
	rom_offset: int
	raw_bytes: bytes

	def to_dict(self):
		return {
			"id": self.id,
			"name": self.name,
			"chapter_id": self.chapter_id,
			"trigger_type": self.trigger_type,
			"trigger_type_name": TriggerType(self.trigger_type).name if self.trigger_type < 10 else "UNKNOWN",
			"map_id": self.map_id,
			"trigger_x": self.trigger_x,
			"trigger_y": self.trigger_y,
			"instructions": [i.to_dict() for i in self.instructions],
			"rom_offset": f"0x{self.rom_offset:05X}",
			"raw_bytes": self.raw_bytes.hex()
		}


@dataclass
class NpcData:
	"""NPC definition from ROM."""
	index: int
	map_id: int
	x: int
	y: int
	sprite_id: int
	movement: int
	facing: int
	dialog_id: int
	flags: int
	rom_offset: int

	def to_dict(self):
		movement_names = ["stationary", "wander_1", "wander_2", "patrol_h", "patrol_v", "follow", "custom"]
		facing_names = ["down", "up", "left", "right"]
		return {
			"index": self.index,
			"map_id": self.map_id,
			"x": self.x,
			"y": self.y,
			"sprite_id": self.sprite_id,
			"movement": movement_names[min(self.movement, 6)],
			"facing": facing_names[min(self.facing, 3)],
			"dialog_id": f"0x{self.dialog_id:04X}",
			"flags": f"0x{self.flags:02X}",
			"rom_offset": f"0x{self.rom_offset:05X}"
		}


class DW4EventExtractor:
	"""Extracts event scripts from DW4 NES ROM."""

	# DTE table at ROM offset
	DTE_TABLE_ROM = 0x5B3B4

	# Character encoding
	CHAR_TABLE = {
		0x00: ' ',
		**{0x01 + i: str(i) for i in range(10)},
		**{0x0B + i: chr(ord('a') + i) for i in range(26)},
		**{0x25 + i: chr(ord('A') + i) for i in range(26)},
		0x3F: "'", 0x65: "-", 0x66: '"', 0x67: '"',
		0x68: "'", 0x69: "'", 0x6A: "'", 0x6B: "'",
		0x6D: "?", 0x6E: "!", 0x6F: "-", 0x70: "*",
		0x71: ":", 0x72: "...", 0x75: "(", 0x76: ")",
		0x77: ",", 0x78: ".",
	}

	def __init__(self, rom_path: str):
		with open(rom_path, 'rb') as f:
			self.rom = f.read()
		self._load_dte()

	def _load_dte(self):
		"""Load DTE dictionary."""
		self.dte = {}
		for code in range(0x80, 0xF0):
			offset = self.DTE_TABLE_ROM + (code - 0x80) * 2
			if offset + 1 < len(self.rom):
				self.dte[code] = (self.rom[offset], self.rom[offset + 1])

	def bank_offset(self, bank: int, addr: int = 0x8000) -> int:
		"""Convert bank:address to ROM file offset."""
		return HEADER_SIZE + bank * BANK_SIZE + (addr - 0x8000)

	def decode_text(self, data: bytes, max_len: int = 256) -> str:
		"""Decode DTE-compressed text."""
		result = []
		pos = 0

		while pos < min(len(data), max_len):
			b = data[pos]

			if b == 0xFF:  # END
				break
			elif b == 0xF1:  # LINE
				result.append('\n')
			elif b == 0xF0:  # WAIT
				result.append('[WAIT]')
			elif b == 0xF2:  # NAME
				result.append('[NAME]')
			elif b >= 0x80 and b < 0xF0:  # DTE
				if b in self.dte:
					c1, c2 = self.dte[b]
					if c1 in self.CHAR_TABLE:
						result.append(self.CHAR_TABLE[c1])
					if c2 in self.CHAR_TABLE:
						result.append(self.CHAR_TABLE[c2])
			elif b in self.CHAR_TABLE:
				result.append(self.CHAR_TABLE[b])

			pos += 1

		return ''.join(result)

	def find_pointer_tables(self, bank: int) -> list[dict]:
		"""Find potential pointer tables in a bank."""
		offset = self.bank_offset(bank)
		data = self.rom[offset:offset + BANK_SIZE]
		tables = []

		i = 0
		while i < len(data) - 16:
			valid = 0
			pointers = []

			for j in range(16):
				if i + j * 2 + 1 >= len(data):
					break
				lo = data[i + j * 2]
				hi = data[i + j * 2 + 1]
				ptr = (hi << 8) | lo

				if 0x8000 <= ptr <= 0xBFFF:
					valid += 1
					pointers.append(ptr)
				else:
					break

			if valid >= 4:
				tables.append({
					'rom_offset': offset + i,
					'cpu_addr': 0x8000 + i,
					'count': valid,
					'pointers': pointers
				})
				i += valid * 2
			else:
				i += 1

		return tables

	def extract_npc_table(self, bank: int, start_addr: int, count: int) -> list[NpcData]:
		"""Extract NPC data from a table."""
		npcs = []
		offset = self.bank_offset(bank, start_addr)

		for i in range(count):
			npc_offset = offset + i * 8
			if npc_offset + 8 > len(self.rom):
				break

			data = self.rom[npc_offset:npc_offset + 8]
			npcs.append(NpcData(
				index=i,
				map_id=data[0],
				x=data[1],
				y=data[2],
				movement=data[3],
				facing=data[4],
				sprite_id=data[5],
				dialog_id=(data[7] << 8) | data[6],
				flags=0,
				rom_offset=npc_offset
			))

		return npcs

	def extract_dialog_pointers(self, bank: int) -> dict[int, str]:
		"""Extract dialog text from a text bank using pointer tables."""
		dialogs = {}
		offset = self.bank_offset(bank)
		data = self.rom[offset:offset + BANK_SIZE]

		# Find pointer tables first
		tables = self.find_pointer_tables(bank)

		dialog_id = 0
		for table in tables[:10]:  # Top 10 tables
			for ptr in table['pointers'][:16]:  # First 16 pointers
				text_offset = ptr - 0x8000
				if 0 <= text_offset < BANK_SIZE - 4:
					# Read until 0xFF or max length
					end = text_offset
					while end < min(text_offset + 256, BANK_SIZE) and data[end] != 0xFF:
						end += 1

					if end - text_offset >= 4:
						text = self.decode_text(data[text_offset:end])
						if len(text.strip()) >= 3:
							dialogs[dialog_id] = {
								'offset': f"0x{offset + text_offset:05X}",
								'cpu_addr': f"${ptr:04X}",
								'raw_length': end - text_offset,
								'text': text.strip()
							}
							dialog_id += 1

		return dialogs

	def analyze_bank4_events(self) -> list[dict]:
		"""Analyze Bank 4 (NPC/Event Code) for event patterns."""
		bank = 4
		offset = self.bank_offset(bank)
		data = self.rom[offset:offset + BANK_SIZE]

		events = []

		# Look for JSR patterns that might be event handlers
		jsr_targets = {}
		for i in range(len(data) - 3):
			if data[i] == 0x20:  # JSR opcode
				target = data[i + 1] | (data[i + 2] << 8)
				if 0x8000 <= target <= 0xBFFF:
					if target not in jsr_targets:
						jsr_targets[target] = []
					jsr_targets[target].append(0x8000 + i)

		# Find most-called routines (likely event handlers)
		sorted_targets = sorted(jsr_targets.items(), key=lambda x: -len(x[1]))

		for target, callers in sorted_targets[:20]:
			events.append({
				'handler_addr': f"${target:04X}",
				'call_count': len(callers),
				'callers': [f"${c:04X}" for c in callers[:5]]
			})

		return events

	def extract_all(self) -> dict:
		"""Extract all event-related data."""
		print("Extracting DW4 Event Scripts...")
		print("=" * 60)

		result = {
			'rom_info': {
				'name': 'Dragon Warrior IV (US)',
				'size': len(self.rom),
				'banks': len(self.rom) // BANK_SIZE
			},
			'pointer_tables': {},
			'dialogs': {},
			'event_handlers': [],
			'npc_data': []
		}

		# Analyze Bank 4 (Event/NPC code)
		print("Analyzing Bank 4 (NPC/Event Code)...")
		result['event_handlers'] = self.analyze_bank4_events()
		print(f"  Found {len(result['event_handlers'])} potential event handlers")

		# Find pointer tables in Bank 17 (Map pointers)
		print("Analyzing Bank 17 (Map Pointers)...")
		tables = self.find_pointer_tables(0x17)
		result['pointer_tables']['bank_17'] = [
			{'offset': f"0x{t['rom_offset']:05X}", 'count': t['count']}
			for t in tables[:10]
		]
		print(f"  Found {len(tables)} pointer tables")

		# Extract dialogs from text banks
		for bank in [0x10, 0x11, 0x12, 0x13, 0x14]:
			print(f"Extracting Bank {bank:02X} dialogs...")
			dialogs = self.extract_dialog_pointers(bank)
			result['dialogs'][f'bank_{bank:02X}'] = dialogs
			print(f"  Found {len(dialogs)} dialog strings")

		return result

	def export_for_dq4r(self) -> dict:
		"""Export in format suitable for DQ4r import."""
		raw_data = self.extract_all()

		# Convert to DQ4r EventScript format
		scripts = []
		script_id = 0

		# Create placeholder scripts from dialog data
		for bank_name, dialogs in raw_data['dialogs'].items():
			for dialog_idx, dialog_data in dialogs.items():
				if isinstance(dialog_data, dict) and 'text' in dialog_data:
					text = dialog_data['text']
					# Only include substantial dialogs
					if len(text) > 10 and not text.startswith('['):
						scripts.append({
							'id': script_id,
							'name': f"dialog_{bank_name}_{dialog_idx}",
							'chapter_id': 0xFF,  # Any chapter
							'trigger_type': TriggerType.INTERACT.value,
							'trigger_type_name': 'INTERACT',
							'map_id': 0xFFFF,
							'instructions': [
								{
									'opcode': ScriptOpcode.SHOW_MESSAGE.value,
									'opcode_name': 'SHOW_MESSAGE',
									'parameters': [script_id],
									'comment': text[:50] + ('...' if len(text) > 50 else '')
								},
								{
									'opcode': ScriptOpcode.END.value,
									'opcode_name': 'END',
									'parameters': [],
									'comment': ''
								}
							],
							'source_offset': dialog_data.get('offset', ''),
							'original_text': text
						})
						script_id += 1

		return {
			'format_version': '1.0',
			'game': 'Dragon Warrior IV (NES)',
			'target': 'DQ4r (SNES)',
			'scripts': scripts,
			'event_handlers': raw_data['event_handlers'],
			'statistics': {
				'total_scripts': len(scripts),
				'total_handlers': len(raw_data['event_handlers'])
			}
		}


def main():
	os.makedirs(OUTPUT_DIR, exist_ok=True)

	if not os.path.exists(ROM_PATH):
		print(f"Error: ROM not found at {ROM_PATH}")
		return

	extractor = DW4EventExtractor(ROM_PATH)

	# Extract raw data
	raw_data = extractor.extract_all()
	raw_path = os.path.join(OUTPUT_DIR, 'dw4_events_raw.json')
	with open(raw_path, 'w', encoding='utf-8') as f:
		json.dump(raw_data, f, indent='\t', ensure_ascii=False)
	print(f"\nSaved raw data: {raw_path}")

	# Export for DQ4r
	dq4r_data = extractor.export_for_dq4r()
	dq4r_path = os.path.join(OUTPUT_DIR, 'dw4_events_dq4r.json')
	with open(dq4r_path, 'w', encoding='utf-8') as f:
		json.dump(dq4r_data, f, indent='\t', ensure_ascii=False)
	print(f"Saved DQ4r format: {dq4r_path}")

	# Summary
	print()
	print("=" * 60)
	print("EXTRACTION SUMMARY")
	print("=" * 60)
	print(f"Event handlers found: {len(raw_data['event_handlers'])}")
	total_dialogs = sum(len(d) for d in raw_data['dialogs'].values())
	print(f"Dialog strings found: {total_dialogs}")
	print(f"DQ4r scripts created: {dq4r_data['statistics']['total_scripts']}")


if __name__ == "__main__":
	main()
