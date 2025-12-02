#!/usr/bin/env python3
"""
Text Engine Disassembler for Dragon Warrior IV

This tool disassembles and analyzes the text rendering engine to find:
1. The DTE lookup table location
2. Text pointer tables
3. Control code handlers

Strategy:
1. Find code that reads from text banks ($0C-$0E)
2. Look for comparison with $82 (DTE start) or similar branching
3. Find indexed reads using X or Y registers for table lookup
4. Trace the table address from the code

Common text engine patterns:
- LDA (ptr),Y  ; Read text byte
- CMP #$82     ; Check if DTE code
- BCS dte_handler  ; Branch if >= $82
- LDA dte_table,X  ; Look up DTE pair

The DTE table is typically:
- 110 entries (codes $82-$EF)
- 2 bytes per entry (the character pair)
- Total 220 bytes
- Contains common letter pairs like "th", "he", "in", etc.
"""

import sys
from pathlib import Path
from dataclasses import dataclass
from typing import List, Dict, Optional, Tuple

# Project paths
TOOLS_DIR = Path(__file__).parent
PROJECT_ROOT = TOOLS_DIR.parent
ROM_DIR = PROJECT_ROOT / "roms"
ASSETS_DIR = PROJECT_ROOT / "assets"
SOURCE_DIR = PROJECT_ROOT / "source_files"
ROM_PATH = ROM_DIR / "Dragon Warrior IV (1992-10)(Enix)(US).nes"

# ROM constants
HEADER_SIZE = 16
PRG_BANK_SIZE = 0x4000  # 16 KB
PRG_BANK_COUNT = 32  # 512KB / 16KB = 32 banks

# Text banks
TEXT_BANKS = [0x0c, 0x0d, 0x0e]
FIXED_BANK = 0x1f  # Last bank is usually fixed in MMC3

# 6502 opcodes for disassembly
OPCODES = {
	# Load/Store
	0xa9: ("LDA", "imm", 2), 0xa5: ("LDA", "zp", 2), 0xb5: ("LDA", "zpx", 2),
	0xad: ("LDA", "abs", 3), 0xbd: ("LDA", "absx", 3), 0xb9: ("LDA", "absy", 3),
	0xa1: ("LDA", "indx", 2), 0xb1: ("LDA", "indy", 2),
	0xa2: ("LDX", "imm", 2), 0xa6: ("LDX", "zp", 2), 0xb6: ("LDX", "zpy", 2),
	0xae: ("LDX", "abs", 3), 0xbe: ("LDX", "absy", 3),
	0xa0: ("LDY", "imm", 2), 0xa4: ("LDY", "zp", 2), 0xb4: ("LDY", "zpx", 2),
	0xac: ("LDY", "abs", 3), 0xbc: ("LDY", "absx", 3),
	0x85: ("STA", "zp", 2), 0x95: ("STA", "zpx", 2),
	0x8d: ("STA", "abs", 3), 0x9d: ("STA", "absx", 3), 0x99: ("STA", "absy", 3),
	0x81: ("STA", "indx", 2), 0x91: ("STA", "indy", 2),
	0x86: ("STX", "zp", 2), 0x96: ("STX", "zpy", 2), 0x8e: ("STX", "abs", 3),
	0x84: ("STY", "zp", 2), 0x94: ("STY", "zpx", 2), 0x8c: ("STY", "abs", 3),
	# Transfer
	0xaa: ("TAX", "imp", 1), 0xa8: ("TAY", "imp", 1),
	0x8a: ("TXA", "imp", 1), 0x98: ("TYA", "imp", 1),
	0xba: ("TSX", "imp", 1), 0x9a: ("TXS", "imp", 1),
	# Stack
	0x48: ("PHA", "imp", 1), 0x68: ("PLA", "imp", 1),
	0x08: ("PHP", "imp", 1), 0x28: ("PLP", "imp", 1),
	# Arithmetic
	0x69: ("ADC", "imm", 2), 0x65: ("ADC", "zp", 2), 0x75: ("ADC", "zpx", 2),
	0x6d: ("ADC", "abs", 3), 0x7d: ("ADC", "absx", 3), 0x79: ("ADC", "absy", 3),
	0x61: ("ADC", "indx", 2), 0x71: ("ADC", "indy", 2),
	0xe9: ("SBC", "imm", 2), 0xe5: ("SBC", "zp", 2), 0xf5: ("SBC", "zpx", 2),
	0xed: ("SBC", "abs", 3), 0xfd: ("SBC", "absx", 3), 0xf9: ("SBC", "absy", 3),
	0xe1: ("SBC", "indx", 2), 0xf1: ("SBC", "indy", 2),
	# Compare
	0xc9: ("CMP", "imm", 2), 0xc5: ("CMP", "zp", 2), 0xd5: ("CMP", "zpx", 2),
	0xcd: ("CMP", "abs", 3), 0xdd: ("CMP", "absx", 3), 0xd9: ("CMP", "absy", 3),
	0xc1: ("CMP", "indx", 2), 0xd1: ("CMP", "indy", 2),
	0xe0: ("CPX", "imm", 2), 0xe4: ("CPX", "zp", 2), 0xec: ("CPX", "abs", 3),
	0xc0: ("CPY", "imm", 2), 0xc4: ("CPY", "zp", 2), 0xcc: ("CPY", "abs", 3),
	# Logical
	0x29: ("AND", "imm", 2), 0x25: ("AND", "zp", 2), 0x35: ("AND", "zpx", 2),
	0x2d: ("AND", "abs", 3), 0x3d: ("AND", "absx", 3), 0x39: ("AND", "absy", 3),
	0x21: ("AND", "indx", 2), 0x31: ("AND", "indy", 2),
	0x09: ("ORA", "imm", 2), 0x05: ("ORA", "zp", 2), 0x15: ("ORA", "zpx", 2),
	0x0d: ("ORA", "abs", 3), 0x1d: ("ORA", "absx", 3), 0x19: ("ORA", "absy", 3),
	0x01: ("ORA", "indx", 2), 0x11: ("ORA", "indy", 2),
	0x49: ("EOR", "imm", 2), 0x45: ("EOR", "zp", 2), 0x55: ("EOR", "zpx", 2),
	0x4d: ("EOR", "abs", 3), 0x5d: ("EOR", "absx", 3), 0x59: ("EOR", "absy", 3),
	0x41: ("EOR", "indx", 2), 0x51: ("EOR", "indy", 2),
	0x24: ("BIT", "zp", 2), 0x2c: ("BIT", "abs", 3),
	# Shift/Rotate
	0x0a: ("ASL", "acc", 1), 0x06: ("ASL", "zp", 2), 0x16: ("ASL", "zpx", 2),
	0x0e: ("ASL", "abs", 3), 0x1e: ("ASL", "absx", 3),
	0x4a: ("LSR", "acc", 1), 0x46: ("LSR", "zp", 2), 0x56: ("LSR", "zpx", 2),
	0x4e: ("LSR", "abs", 3), 0x5e: ("LSR", "absx", 3),
	0x2a: ("ROL", "acc", 1), 0x26: ("ROL", "zp", 2), 0x36: ("ROL", "zpx", 2),
	0x2e: ("ROL", "abs", 3), 0x3e: ("ROL", "absx", 3),
	0x6a: ("ROR", "acc", 1), 0x66: ("ROR", "zp", 2), 0x76: ("ROR", "zpx", 2),
	0x6e: ("ROR", "abs", 3), 0x7e: ("ROR", "absx", 3),
	# Inc/Dec
	0xe6: ("INC", "zp", 2), 0xf6: ("INC", "zpx", 2),
	0xee: ("INC", "abs", 3), 0xfe: ("INC", "absx", 3),
	0xc6: ("DEC", "zp", 2), 0xd6: ("DEC", "zpx", 2),
	0xce: ("DEC", "abs", 3), 0xde: ("DEC", "absx", 3),
	0xe8: ("INX", "imp", 1), 0xc8: ("INY", "imp", 1),
	0xca: ("DEX", "imp", 1), 0x88: ("DEY", "imp", 1),
	# Branch
	0x10: ("BPL", "rel", 2), 0x30: ("BMI", "rel", 2),
	0x50: ("BVC", "rel", 2), 0x70: ("BVS", "rel", 2),
	0x90: ("BCC", "rel", 2), 0xb0: ("BCS", "rel", 2),
	0xd0: ("BNE", "rel", 2), 0xf0: ("BEQ", "rel", 2),
	# Jump/Call
	0x4c: ("JMP", "abs", 3), 0x6c: ("JMP", "ind", 3),
	0x20: ("JSR", "abs", 3), 0x60: ("RTS", "imp", 1),
	0x00: ("BRK", "imp", 1), 0x40: ("RTI", "imp", 1),
	# Flags
	0x18: ("CLC", "imp", 1), 0x38: ("SEC", "imp", 1),
	0x58: ("CLI", "imp", 1), 0x78: ("SEI", "imp", 1),
	0xb8: ("CLV", "imp", 1),
	0xd8: ("CLD", "imp", 1), 0xf8: ("SED", "imp", 1),
	# NOP
	0xea: ("NOP", "imp", 1),
}


@dataclass
class Instruction:
	"""A disassembled instruction."""
	offset: int  # ROM file offset
	cpu_addr: int  # CPU address
	opcode: int
	mnemonic: str
	mode: str
	size: int
	operand: int = 0
	raw_bytes: bytes = b""
	comment: str = ""
	label: str = ""


def bank_to_offset(bank: int, cpu_addr: int = 0x8000) -> int:
	"""Convert PRG bank number and CPU address to ROM file offset."""
	if cpu_addr >= 0xc000:
		# High bank window - use fixed bank for now
		bank_offset = cpu_addr - 0xc000
		return HEADER_SIZE + (FIXED_BANK * PRG_BANK_SIZE) + bank_offset
	else:
		# Low bank window ($8000-$BFFF)
		bank_offset = cpu_addr - 0x8000
		return HEADER_SIZE + (bank * PRG_BANK_SIZE) + bank_offset


def offset_to_cpu(offset: int, bank: int) -> int:
	"""Convert ROM file offset to CPU address for a given bank."""
	bank_start = HEADER_SIZE + (bank * PRG_BANK_SIZE)
	return 0x8000 + (offset - bank_start)


class Disassembler:
	"""6502 disassembler with analysis."""

	def __init__(self, rom_data: bytes):
		self.rom = rom_data
		self.labels: Dict[int, str] = {}  # cpu_addr -> label
		self.comments: Dict[int, str] = {}  # cpu_addr -> comment
		self.instructions: Dict[int, Instruction] = {}  # cpu_addr -> instruction

	def read_byte(self, offset: int) -> int:
		if 0 <= offset < len(self.rom):
			return self.rom[offset]
		return 0

	def read_word(self, offset: int) -> int:
		return self.read_byte(offset) | (self.read_byte(offset + 1) << 8)

	def disassemble_instruction(self, offset: int, bank: int) -> Optional[Instruction]:
		"""Disassemble a single instruction."""
		opcode = self.read_byte(offset)

		if opcode not in OPCODES:
			return None

		mnemonic, mode, size = OPCODES[opcode]
		cpu_addr = offset_to_cpu(offset, bank)

		operand = 0
		if size == 2:
			operand = self.read_byte(offset + 1)
		elif size == 3:
			operand = self.read_word(offset + 1)

		raw_bytes = bytes(self.rom[offset:offset + size])

		return Instruction(
			offset=offset,
			cpu_addr=cpu_addr,
			opcode=opcode,
			mnemonic=mnemonic,
			mode=mode,
			size=size,
			operand=operand,
			raw_bytes=raw_bytes
		)

	def format_operand(self, instr: Instruction) -> str:
		"""Format the operand for display."""
		mode = instr.mode
		op = instr.operand

		# Check for label
		target_addr = None
		if mode == "abs" or mode == "absx" or mode == "absy":
			target_addr = op
		elif mode == "rel":
			# Relative branch - calculate target
			target_addr = instr.cpu_addr + 2 + (op if op < 128 else op - 256)

		label = self.labels.get(target_addr, "") if target_addr else ""

		if mode == "imp" or mode == "acc":
			return ""
		elif mode == "imm":
			return f"#${op:02x}"
		elif mode == "zp":
			return f"${op:02x}"
		elif mode == "zpx":
			return f"${op:02x},x"
		elif mode == "zpy":
			return f"${op:02x},y"
		elif mode == "abs":
			if label:
				return label
			return f"${op:04x}"
		elif mode == "absx":
			if label:
				return f"{label},x"
			return f"${op:04x},x"
		elif mode == "absy":
			if label:
				return f"{label},y"
			return f"${op:04x},y"
		elif mode == "ind":
			return f"(${op:04x})"
		elif mode == "indx":
			return f"(${op:02x},x)"
		elif mode == "indy":
			return f"(${op:02x}),y"
		elif mode == "rel":
			if label:
				return label
			return f"${target_addr:04x}"
		return f"${op:04x}"

	def disassemble_range(self, start_offset: int, end_offset: int, bank: int) -> List[Instruction]:
		"""Disassemble a range of bytes."""
		instructions = []
		offset = start_offset

		while offset < end_offset:
			instr = self.disassemble_instruction(offset, bank)
			if instr:
				instructions.append(instr)
				offset += instr.size
			else:
				# Unknown opcode - skip byte
				offset += 1

		return instructions

	def format_instruction(self, instr: Instruction) -> str:
		"""Format an instruction for display."""
		hex_str = " ".join(f"{b:02x}" for b in instr.raw_bytes)
		hex_str = hex_str.ljust(9)

		operand_str = self.format_operand(instr)

		if instr.mode == "acc":
			operand_str = "a"

		line = f"${instr.cpu_addr:04x}: {hex_str}  {instr.mnemonic}"
		if operand_str:
			line += f" {operand_str}"

		if instr.comment:
			line = line.ljust(40) + f"; {instr.comment}"

		return line


def find_text_engine(rom_data: bytes) -> List[Dict]:
	"""
	Find the text engine code by looking for characteristic patterns.

	Text engine patterns to look for:
	1. CMP #$82 or CMP #$80 (check for DTE/special codes)
	2. BCS to DTE handler
	3. LDA table,X pattern (DTE lookup)
	4. Code near text banks
	"""
	dis = Disassembler(rom_data)
	findings = []

	print("Searching for text engine patterns...")
	print()

	# Search in likely banks (fixed bank and nearby)
	search_banks = [0x1f, 0x1e, 0x1d, 0x0f, 0x0e, 0x0d, 0x0c]

	for bank in search_banks:
		bank_start = HEADER_SIZE + (bank * PRG_BANK_SIZE)
		bank_end = bank_start + PRG_BANK_SIZE

		print(f"Scanning bank ${bank:02x}...")

		# Look for CMP #$82 (DTE boundary check)
		for offset in range(bank_start, bank_end - 2):
			if rom_data[offset] == 0xc9:  # CMP immediate
				cmp_val = rom_data[offset + 1]
				# Common DTE boundary values
				if cmp_val in [0x80, 0x81, 0x82, 0x83, 0x7f, 0x40, 0x3f]:
					# Check context - is this part of text handling?
					# Look at surrounding code
					context_start = max(bank_start, offset - 20)
					context_end = min(bank_end, offset + 40)

					instructions = dis.disassemble_range(context_start, context_end, bank)

					# Look for patterns suggesting text engine:
					# - LDA (zp),Y (reading text)
					# - BCS/BCC after CMP (branching on char type)
					# - JSR to subroutine (calling handlers)
					# - Table indexed reads

					has_indirect_read = False
					has_branch_after_cmp = False
					has_indexed_table = False

					for i, instr in enumerate(instructions):
						if instr.mnemonic == "LDA" and instr.mode == "indy":
							has_indirect_read = True
						if instr.mnemonic in ["BCS", "BCC", "BEQ", "BNE"]:
							if i > 0 and instructions[i-1].mnemonic == "CMP":
								has_branch_after_cmp = True
						if instr.mnemonic == "LDA" and instr.mode in ["absx", "absy"]:
							has_indexed_table = True

					# Score this location
					score = 0
					if has_indirect_read:
						score += 3
					if has_branch_after_cmp:
						score += 2
					if has_indexed_table:
						score += 5  # This is likely the DTE lookup!

					if score >= 3:
						cpu_addr = offset_to_cpu(offset, bank)
						finding = {
							"bank": bank,
							"offset": offset,
							"cpu_addr": cpu_addr,
							"cmp_value": cmp_val,
							"score": score,
							"has_indirect": has_indirect_read,
							"has_branch": has_branch_after_cmp,
							"has_indexed": has_indexed_table,
							"instructions": instructions
						}
						findings.append(finding)

	return findings


def analyze_text_routine(rom_data: bytes, finding: Dict) -> Dict:
	"""Analyze a potential text routine in detail."""
	dis = Disassembler(rom_data)

	bank = finding["bank"]
	start_offset = finding["offset"] - 50
	bank_start = HEADER_SIZE + (bank * PRG_BANK_SIZE)
	bank_end = bank_start + PRG_BANK_SIZE

	start_offset = max(bank_start, start_offset)
	end_offset = min(bank_end, finding["offset"] + 100)

	instructions = dis.disassemble_range(start_offset, end_offset, bank)

	analysis = {
		"potential_dte_tables": [],
		"potential_text_pointers": [],
		"subroutine_calls": [],
		"zero_page_vars": set(),
		"annotated_code": []
	}

	# Analyze each instruction
	for i, instr in enumerate(instructions):
		annotation = ""

		# Track zero page usage
		if instr.mode in ["zp", "zpx", "zpy"] and instr.operand < 0x100:
			analysis["zero_page_vars"].add(instr.operand)

		# Look for table references
		if instr.mnemonic == "LDA" and instr.mode in ["absx", "absy"]:
			addr = instr.operand
			annotation = f"TABLE READ at ${addr:04x}"
			if 0x8000 <= addr < 0xc000:
				analysis["potential_dte_tables"].append({
					"address": addr,
					"instruction_offset": instr.offset,
					"mode": instr.mode
				})

		# Look for subroutine calls
		if instr.mnemonic == "JSR":
			analysis["subroutine_calls"].append({
				"target": instr.operand,
				"from": instr.cpu_addr
			})
			annotation = f"CALL ${instr.operand:04x}"

		# Look for CMP with DTE-like values
		if instr.mnemonic == "CMP" and instr.mode == "imm":
			val = instr.operand
			if val == 0x82:
				annotation = "CHECK DTE START ($82)"
			elif val == 0x80:
				annotation = "CHECK SPECIAL ($80)"
			elif val == 0x3f:
				annotation = "CHECK UPPERCASE END"
			elif val == 0x24:
				annotation = "CHECK LOWERCASE END (z)"

		# Look for pointer setup
		if instr.mnemonic == "STA" and instr.mode == "zp":
			if i > 0 and instructions[i-1].mnemonic == "LDA":
				annotation = f"STORE TO ZP ${instr.operand:02x}"

		line = dis.format_instruction(instr)
		if annotation:
			line = line.ljust(45) + f"; {annotation}"

		analysis["annotated_code"].append(line)

	analysis["zero_page_vars"] = sorted(analysis["zero_page_vars"])

	return analysis


def find_dte_table_from_code(rom_data: bytes) -> Optional[Dict]:
	"""
	Find the DTE table by analyzing the text engine code.

	The DTE table is accessed like:
		LDA dte_table_lo,X  ; Get first char of pair
		...
		LDA dte_table_hi,X  ; Get second char of pair

	Or:
		TXA
		ASL A               ; X = X * 2 (2 bytes per entry)
		TAX
		LDA dte_table,X     ; First char
		LDA dte_table+1,X   ; Second char
	"""
	dis = Disassembler(rom_data)

	print("=" * 60)
	print("Searching for DTE table references in code...")
	print("=" * 60)
	print()

	# First find text engine code
	findings = find_text_engine(rom_data)

	if not findings:
		print("No text engine patterns found!")
		return None

	# Sort by score
	findings.sort(key=lambda x: x["score"], reverse=True)

	print(f"Found {len(findings)} potential text engine locations")
	print()

	# Analyze top candidates
	best_dte_candidate = None

	for i, finding in enumerate(findings[:10]):
		print(f"\n{'='*60}")
		print(f"Candidate {i+1}: Bank ${finding['bank']:02x}, CPU ${finding['cpu_addr']:04x}")
		print(f"Score: {finding['score']}, CMP value: ${finding['cmp_value']:02x}")
		print(f"{'='*60}")

		analysis = analyze_text_routine(rom_data, finding)

		print("\nAnnotated code:")
		print("-" * 60)
		for line in analysis["annotated_code"]:
			print(line)

		if analysis["potential_dte_tables"]:
			print(f"\nPotential DTE table references:")
			for table in analysis["potential_dte_tables"]:
				print(f"  ${table['address']:04x} (via {table['mode']})")

				if not best_dte_candidate:
					best_dte_candidate = table

		if analysis["subroutine_calls"]:
			print(f"\nSubroutine calls:")
			for call in analysis["subroutine_calls"]:
				print(f"  JSR ${call['target']:04x} from ${call['from']:04x}")

		if analysis["zero_page_vars"]:
			print(f"\nZero page variables used: {', '.join(f'${v:02x}' for v in analysis['zero_page_vars'])}")

	return best_dte_candidate


def search_for_english_pairs(rom_data: bytes) -> List[Dict]:
	"""
	Search for the DTE table by looking for English letter pair patterns.

	Common English bigrams:
	th, he, in, er, an, re, on, at, en, nd, ti, es, or, te, of
	is, it, al, ar, st, to, nt, ng, se, ha, as, ou, io, le, ve
	"""
	# DW4 TBL encoding
	TBL = {
		" ": 0x00,
		"a": 0x0b, "b": 0x0c, "c": 0x0d, "d": 0x0e, "e": 0x0f,
		"f": 0x10, "g": 0x11, "h": 0x12, "i": 0x13, "j": 0x14,
		"k": 0x15, "l": 0x16, "m": 0x17, "n": 0x18, "o": 0x19,
		"p": 0x1a, "q": 0x1b, "r": 0x1c, "s": 0x1d, "t": 0x1e,
		"u": 0x1f, "v": 0x20, "w": 0x21, "x": 0x22, "y": 0x23,
		"z": 0x24,
	}

	REVERSE_TBL = {v: k for k, v in TBL.items()}

	# Common English bigrams
	COMMON_PAIRS = [
		"th", "he", "in", "er", "an", "re", "on", "at", "en", "nd",
		"ti", "es", "or", "te", "of", "is", "it", "al", "ar", "st",
		"to", "nt", "ng", "se", "ha", "as", "ou", "io", "le", "ve",
		"e ", " t", "s ", "d ", " a", " i", " o", "n ", "t ", " s",
		" w", "ed", "ll", "ly", "ow", "wn", "ey", "oo", "ee",
	]

	# Convert pairs to byte sequences
	pair_bytes = []
	for pair in COMMON_PAIRS:
		if pair[0] in TBL and pair[1] in TBL:
			pair_bytes.append((TBL[pair[0]], TBL[pair[1]], pair))

	print("Searching for common English pairs in ROM...")
	print(f"Looking for {len(pair_bytes)} known pairs")
	print()

	candidates = []

	# Search entire ROM for regions with many common pairs
	window_size = 220  # DTE table size (110 entries * 2 bytes)

	for offset in range(HEADER_SIZE, len(rom_data) - window_size, 2):
		# Count how many common pairs are in this window
		pair_count = 0
		found_pairs = []

		for i in range(0, window_size, 2):
			byte1 = rom_data[offset + i]
			byte2 = rom_data[offset + i + 1]

			for pb1, pb2, pair_str in pair_bytes:
				if byte1 == pb1 and byte2 == pb2:
					pair_count += 1
					found_pairs.append((i // 2, pair_str))
					break

		# If we found many common pairs, this might be the DTE table
		if pair_count >= 15:
			# Also check that most bytes are valid TBL codes
			valid_bytes = 0
			for i in range(window_size):
				b = rom_data[offset + i]
				if b in REVERSE_TBL or b == 0x00:
					valid_bytes += 1

			validity = valid_bytes / window_size

			if validity > 0.85:
				# Calculate which bank this is in
				prg_offset = offset - HEADER_SIZE
				bank = prg_offset // PRG_BANK_SIZE
				cpu_addr = 0x8000 + (prg_offset % PRG_BANK_SIZE)

				candidates.append({
					"offset": offset,
					"bank": bank,
					"cpu_addr": cpu_addr,
					"pair_count": pair_count,
					"validity": validity,
					"found_pairs": found_pairs
				})

	# Sort by pair count
	candidates.sort(key=lambda x: x["pair_count"], reverse=True)

	return candidates


def extract_dte_table(rom_data: bytes, offset: int) -> List[Dict]:
	"""Extract and decode a DTE table from the given offset."""
	TBL = {
		0x00: " ",
		0x01: "0", 0x02: "1", 0x03: "2", 0x04: "3", 0x05: "4",
		0x06: "5", 0x07: "6", 0x08: "7", 0x09: "8", 0x0a: "9",
		0x0b: "a", 0x0c: "b", 0x0d: "c", 0x0e: "d", 0x0f: "e",
		0x10: "f", 0x11: "g", 0x12: "h", 0x13: "i", 0x14: "j",
		0x15: "k", 0x16: "l", 0x17: "m", 0x18: "n", 0x19: "o",
		0x1a: "p", 0x1b: "q", 0x1c: "r", 0x1d: "s", 0x1e: "t",
		0x1f: "u", 0x20: "v", 0x21: "w", 0x22: "x", 0x23: "y",
		0x24: "z",
		0x25: "A", 0x26: "B", 0x27: "C", 0x28: "D", 0x29: "E",
		0x2a: "F", 0x2b: "G", 0x2c: "H", 0x2d: "I", 0x2e: "J",
		0x2f: "K", 0x30: "L", 0x31: "M", 0x32: "N", 0x33: "O",
		0x34: "P", 0x35: "Q", 0x36: "R", 0x37: "S", 0x38: "T",
		0x39: "U", 0x3a: "V", 0x3b: "W", 0x3c: "X", 0x3d: "Y",
		0x3e: "Z",
		0x65: "—", 0x66: ",", 0x67: ".", 0x68: "'", 0x69: "'",
		0x77: ",", 0x78: ".",
	}

	entries = []

	for i in range(110):  # 110 DTE codes ($82-$EF)
		byte1 = rom_data[offset + i * 2]
		byte2 = rom_data[offset + i * 2 + 1]

		char1 = TBL.get(byte1, f"[${byte1:02x}]")
		char2 = TBL.get(byte2, f"[${byte2:02x}]")

		entries.append({
			"code": 0x82 + i,
			"byte1": byte1,
			"byte2": byte2,
			"decoded": char1 + char2
		})

	return entries


def main():
	"""Main entry point."""
	import json

	print("=" * 60)
	print("Dragon Warrior IV - Text Engine Analyzer")
	print("=" * 60)
	print()

	# Load ROM
	if not ROM_PATH.exists():
		print(f"Error: ROM not found at {ROM_PATH}")
		return 1

	print(f"Loading ROM: {ROM_PATH}")
	with open(ROM_PATH, "rb") as f:
		rom_data = f.read()

	print(f"ROM size: {len(rom_data):,} bytes")
	print(f"PRG banks: {PRG_BANK_COUNT}")
	print()

	# Method 1: Search for English pairs
	print("=" * 60)
	print("Method 1: Search for common English letter pairs")
	print("=" * 60)

	pair_candidates = search_for_english_pairs(rom_data)

	if pair_candidates:
		print(f"\nFound {len(pair_candidates)} candidates with common English pairs:")
		for i, cand in enumerate(pair_candidates[:5]):
			print(f"\n{i+1}. Bank ${cand['bank']:02x}, Offset ${cand['offset']:05x}, CPU ${cand['cpu_addr']:04x}")
			print(f"   Common pairs found: {cand['pair_count']}")
			print(f"   Validity: {cand['validity']:.1%}")
			print(f"   Sample pairs: {', '.join(p[1] for p in cand['found_pairs'][:10])}")

		# Extract best candidate
		if pair_candidates:
			best = pair_candidates[0]
			print(f"\n{'='*60}")
			print(f"Best DTE table candidate:")
			print(f"{'='*60}")
			print(f"Bank: ${best['bank']:02x}")
			print(f"ROM Offset: ${best['offset']:05x}")
			print(f"CPU Address: ${best['cpu_addr']:04x}")
			print()

			entries = extract_dte_table(rom_data, best["offset"])

			print("DTE Table Contents:")
			print("-" * 40)

			for i, entry in enumerate(entries):
				if i % 8 == 0:
					print()
				print(f"${entry['code']:02x}=\"{entry['decoded']:3s}\"  ", end="")

			print()
			print()

			# Save results
			output_dir = ASSETS_DIR / "text"
			output_dir.mkdir(parents=True, exist_ok=True)

			dte_data = {
				"_comment": "Dragon Warrior IV DTE Table - Found via English pair analysis",
				"bank": f"${best['bank']:02x}",
				"rom_offset": f"${best['offset']:05x}",
				"cpu_address": f"${best['cpu_addr']:04x}",
				"common_pairs_found": best["pair_count"],
				"entries": entries
			}

			dte_path = output_dir / "dte_table.json"
			with open(dte_path, "w", encoding="utf-8") as f:
				json.dump(dte_data, f, indent="\t", ensure_ascii=False)

			print(f"Saved DTE table to: {dte_path}")

			# Update TBL file
			tbl_path = output_dir / "dw4.tbl"
			update_tbl_with_dte(tbl_path, entries)

	# Method 2: Analyze code (optional, for verification)
	print()
	print("=" * 60)
	print("Method 2: Analyze text engine code")
	print("=" * 60)

	find_dte_table_from_code(rom_data)

	return 0


def update_tbl_with_dte(tbl_path: Path, entries: list):
	"""Update the TBL file with DTE codes."""
	# Read existing file or start fresh
	if tbl_path.exists():
		with open(tbl_path, "r", encoding="utf-8") as f:
			content = f.read()

		# Remove old DTE section if present
		if "# DTE (Dual Tile Encoding) Pairs" in content:
			# Find and remove the DTE section
			lines = content.split("\n")
			new_lines = []
			in_dte_section = False
			for line in lines:
				if "# DTE (Dual Tile Encoding) Pairs" in line:
					in_dte_section = True
					continue
				if in_dte_section:
					if line.startswith("# =") and "DTE" not in line:
						in_dte_section = False
						new_lines.append(line)
					continue
				new_lines.append(line)
			content = "\n".join(new_lines)
	else:
		content = "# Dragon Warrior IV Text Table\n\n"

	# Build DTE section
	dte_section = "\n# ============================================\n"
	dte_section += "# DTE (Dual Tile Encoding) Pairs ($82-$EF)\n"
	dte_section += "# Each code expands to two characters\n"
	dte_section += "# ============================================\n"

	for entry in entries:
		code = entry["code"]
		decoded = entry["decoded"]
		# Only add if decoded doesn't contain unknown codes
		if "[" not in decoded:
			dte_section += f"{code:02x}={decoded}\n"
		else:
			dte_section += f"# {code:02x}={decoded}  ; contains unknown\n"

	# Append DTE section
	content = content.rstrip() + "\n" + dte_section

	with open(tbl_path, "w", encoding="utf-8") as f:
		f.write(content)

	print(f"Updated TBL file: {tbl_path}")


if __name__ == "__main__":
	sys.exit(main())
