#!/usr/bin/env python3
"""
Reverse-engineer Dragon Warrior IV Experience Formula
Attempts multiple formula types to find the best fit.
"""

import math
from typing import List, Tuple, Callable, Dict

# Known EXP values from game guides/wikitext
# Format: level -> total EXP needed to reach that level

HERO_EXP = {
	1: 0, 2: 16, 3: 42, 4: 80, 5: 135, 6: 215, 7: 330, 8: 495, 9: 725, 10: 1040,
	11: 1460, 12: 2010, 13: 2720, 14: 3620, 15: 4750, 16: 6150, 17: 7870, 18: 9970,
	19: 12520, 20: 15600, 21: 19300, 22: 23720, 23: 28980, 24: 35200, 25: 42520,
	26: 51100, 27: 61100, 28: 72700, 29: 86100, 30: 101500
}

ALENA_EXP = {
	1: 0, 2: 8, 3: 21, 4: 40, 5: 68, 6: 108, 7: 165, 8: 248, 9: 363, 10: 520,
	11: 730, 12: 1005, 13: 1360, 14: 1810, 15: 2375, 16: 3075, 17: 3935, 18: 4985,
	19: 6260, 20: 7800, 21: 9650, 22: 11860, 23: 14490, 24: 17600, 25: 21260,
	26: 25550, 27: 30550, 28: 36350, 29: 43050, 30: 50750
}

TALOON_EXP = {
	1: 0, 2: 11, 3: 28, 4: 54, 5: 91, 6: 145, 7: 222, 8: 333, 9: 488, 10: 700,
	11: 982, 12: 1351, 13: 1828, 14: 2433, 15: 3193, 16: 4133, 17: 5290, 18: 6698,
	19: 8405, 20: 10463, 21: 12932, 22: 15882, 23: 19394, 24: 23555, 25: 28463,
	26: 34218, 27: 40933, 28: 48728, 29: 57733, 30: 68083
}


def compute_deltas(exp: Dict[int, int]) -> List[int]:
	"""Compute EXP needed to go from level N to N+1."""
	return [exp[i+1] - exp[i] for i in range(1, max(exp.keys()))]


def try_polynomial(deltas: List[int], degree: int) -> Tuple[bool, str]:
	"""Try to fit deltas to polynomial of given degree."""
	# For polynomial degree d, the d-th differences should be constant
	diffs = deltas.copy()
	for _ in range(degree):
		new_diffs = [diffs[i+1] - diffs[i] for i in range(len(diffs)-1)]
		diffs = new_diffs
		if len(diffs) == 0:
			break
	
	if len(set(diffs[:10])) == 1:  # Check if constant (first 10)
		return True, f"Constant {degree}th difference = {diffs[0]}"
	else:
		return False, f"Non-constant {degree}th differences: {diffs[:8]}"


def try_exponential(values: List[int], start_idx: int = 3) -> Tuple[bool, float, str]:
	"""Check if deltas follow exponential growth after initial levels."""
	ratios = []
	for i in range(start_idx, len(values)-1):
		if values[i] > 0:
			ratios.append(values[i+1] / values[i])
	
	avg_ratio = sum(ratios) / len(ratios) if ratios else 0
	variance = sum((r - avg_ratio)**2 for r in ratios) / len(ratios) if ratios else 0
	
	if variance < 0.01:  # Low variance = likely exponential
		return True, avg_ratio, f"Avg ratio={avg_ratio:.4f}, var={variance:.6f}"
	else:
		return False, avg_ratio, f"Varying ratios: {[f'{r:.3f}' for r in ratios[:10]]}"


def try_recursive(deltas: List[int]) -> Tuple[bool, str]:
	"""Check if delta(N) = delta(N-1) + f(N) for some simple f."""
	second_diffs = [deltas[i+1] - deltas[i] for i in range(len(deltas)-1)]
	
	# Check if second diffs follow a pattern
	# Try: second_diff = a*N + b
	# Using first few points to estimate
	if len(second_diffs) < 5:
		return False, "Not enough data"
	
	# Linear fit on second differences
	n_vals = list(range(len(second_diffs)))
	n_sum = sum(n_vals)
	sd_sum = sum(second_diffs)
	n2_sum = sum(n**2 for n in n_vals)
	nsd_sum = sum(n * sd for n, sd in zip(n_vals, second_diffs))
	
	n_count = len(n_vals)
	denom = n_count * n2_sum - n_sum**2
	if denom == 0:
		return False, "Degenerate"
	
	a = (n_count * nsd_sum - n_sum * sd_sum) / denom
	b = (sd_sum - a * n_sum) / n_count
	
	# Check fit
	predicted = [a * n + b for n in n_vals]
	errors = [abs(p - a) for p, a in zip(predicted, second_diffs)]
	avg_error = sum(errors) / len(errors)
	
	if avg_error < 5:  # Good fit
		return True, f"Second diff ≈ {a:.2f}*N + {b:.2f}, avg_err={avg_error:.2f}"
	else:
		return False, f"Poor fit: a={a:.2f}, b={b:.2f}, avg_err={avg_error:.2f}"


def main():
	print("=" * 70)
	print("Dragon Warrior IV Experience Formula Analysis")
	print("=" * 70)
	
	datasets = {
		"Hero": HERO_EXP,
		"Alena": ALENA_EXP,
		"Taloon": TALOON_EXP,
	}
	
	for name, exp_data in datasets.items():
		print(f"\n{'='*70}")
		print(f"=== {name} ===")
		print(f"{'='*70}")
		
		deltas = compute_deltas(exp_data)
		print(f"\nDeltas (first 15): {deltas[:15]}")
		
		# Try polynomial fits
		print("\n--- Polynomial Analysis ---")
		for degree in range(1, 5):
			success, msg = try_polynomial(deltas, degree)
			status = "✓" if success else "✗"
			print(f"  Degree {degree}: {status} {msg}")
		
		# Try exponential fit
		print("\n--- Exponential Analysis ---")
		success, ratio, msg = try_exponential(deltas)
		status = "✓" if success else "✗"
		print(f"  {status} {msg}")
		
		# Try recursive pattern
		print("\n--- Recursive Pattern Analysis ---")
		success, msg = try_recursive(deltas)
		status = "✓" if success else "✗"
		print(f"  {status} {msg}")
		
		# Analyze ratios between characters
		print("\n--- Delta Pattern ---")
		# Check if deltas can be expressed as: delta(L) = base * L + c or similar
		for start_l in [1, 2, 3]:
			test_deltas = deltas[start_l-1:]
			levels = list(range(start_l, start_l + len(test_deltas)))
			
			# Try delta = a*L^2 + b*L + c using least squares on first 10 points
			n = min(10, len(test_deltas))
			sum_l = sum(levels[:n])
			sum_l2 = sum(l**2 for l in levels[:n])
			sum_l3 = sum(l**3 for l in levels[:n])
			sum_l4 = sum(l**4 for l in levels[:n])
			sum_d = sum(test_deltas[:n])
			sum_ld = sum(l*d for l, d in zip(levels[:n], test_deltas[:n]))
			sum_l2d = sum(l**2 * d for l, d in zip(levels[:n], test_deltas[:n]))
			
			# Simplified: try delta = k * L^2 and find best k
			k_sum = sum(d / (l**2) for l, d in zip(levels[:n], test_deltas[:n]) if l > 0)
			k = k_sum / n
			
			predicted = [k * l**2 for l in levels[:n]]
			errors = [abs(p - a) for p, a in zip(predicted, test_deltas[:n])]
			avg_error = sum(errors) / n
			max_error = max(errors)
			
			print(f"  delta ≈ {k:.4f} * L² (starting L={start_l}): avg_err={avg_error:.1f}, max_err={max_error:.1f}")
	
	print("\n" + "=" * 70)
	print("Summary: Compare character formulas")
	print("=" * 70)
	
	# Check if characters share same formula with different coefficients
	print("\nRatio of first delta (L=1->2) between characters:")
	print(f"  Hero/Alena:   {HERO_EXP[2]/ALENA_EXP[2]:.3f}")
	print(f"  Hero/Taloon:  {HERO_EXP[2]/TALOON_EXP[2]:.3f}")
	print(f"  Alena/Taloon: {ALENA_EXP[2]/TALOON_EXP[2]:.3f}")
	
	print("\nRatio at L=10:")
	print(f"  Hero/Alena:   {HERO_EXP[10]/ALENA_EXP[10]:.3f}")
	print(f"  Hero/Taloon:  {HERO_EXP[10]/TALOON_EXP[10]:.3f}")
	print(f"  Alena/Taloon: {ALENA_EXP[10]/TALOON_EXP[10]:.3f}")
	
	print("\nRatio at L=20:")
	print(f"  Hero/Alena:   {HERO_EXP[20]/ALENA_EXP[20]:.3f}")
	print(f"  Hero/Taloon:  {HERO_EXP[20]/TALOON_EXP[20]:.3f}")
	print(f"  Alena/Taloon: {ALENA_EXP[20]/TALOON_EXP[20]:.3f}")
	
	# The ratios staying constant would suggest same formula with multiplier
	# Ratios changing suggests different exponents or base values


if __name__ == "__main__":
	main()
