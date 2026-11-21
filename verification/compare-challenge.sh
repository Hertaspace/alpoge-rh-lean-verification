#!/bin/bash
# Byte-compare the export of Challenge (statement closure of the five theorems, plus kernel
# primitives) built inside the project against the same file built in a clean Mathlib-only
# project (tools/cleanroom) at the same Mathlib revision and with the same lean options.
# Identical exports mean the Mathlib definitions the statements rely on (riemannZeta,
# DirichletCharacter.LFunction, ...) are those of upstream Mathlib, not altered copies inside
# the project's .lake. Run after run-comparator.sh has installed src/Challenge.lean.
set -u
. "$HOME/rh-alpoge/tools/env.sh"
R=${RH_ROOT:-$HOME/rh-alpoge}
OUT=$R/challenge-compare; mkdir -p "$OUT"
ARGS=(Challenge -- riemannHypothesis riemannZeta_eq_zero_re LFunction_ne_zero_of_half_lt_re LFunction_eq_zero_re
      LFunction_eq_zero_re_of_isPrimitive propext Quot.sound Classical.choice Nat.add Nat.sub Nat.mul Nat.pow
      Nat.gcd Nat.div Nat.mod Nat.beq Nat.ble Nat.land Nat.lor Nat.xor Nat.shiftLeft Nat.shiftRight
      String.ofList Char.ofNat List eagerReduce)
cmp -s "$TOOLS/cleanroom/src/Challenge.lean" "$R/lean/src/Challenge.lean" || { echo "ABORT: the two Challenge.lean differ"; exit 11; }
(cd "$TOOLS/cleanroom" && lake build Challenge > /dev/null 2>&1 && lake env "$COMPARATOR_LEAN4EXPORT" "${ARGS[@]}" > "$OUT/cleanroom.ndjson") || { echo "cleanroom export failed"; exit 2; }
(cd "$R/lean" && lake build --no-build Challenge > /dev/null 2>&1 && lake env "$COMPARATOR_LEAN4EXPORT" "${ARGS[@]}" > "$OUT/project.ndjson") || { echo "project export failed"; exit 3; }
sha256sum "$OUT/cleanroom.ndjson" "$OUT/project.ndjson"
wc -l "$OUT/cleanroom.ndjson" "$OUT/project.ndjson"
if cmp "$OUT/cleanroom.ndjson" "$OUT/project.ndjson"; then echo "CHALLENGE_EXPORTS_IDENTICAL"; exit 0; else echo "CHALLENGE_EXPORTS_DIFFER"; exit 1; fi
