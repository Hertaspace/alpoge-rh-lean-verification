#!/bin/bash
# Usage: run-kernels.sh PROJECT_DIR MODULE EXPORT_FILE THEOREM...
# 1. Exports MODULE (the dependency closure of the given theorems and of the kernel primitives)
#    with lean4export v4.33.0 built for Lean 4.33.1 (export format 3.1.0).
# 2. Runs on the export file the independent checkers bundled with Lean 4.35.0-rc2:
#    Lean paranoid and default kernels (leanchecker --from-export), nanoda, con-leche, con-ron.
# 3. Unless SKIP_OLEAN=1: replays the whole import closure of MODULE from its .olean files into a
#    fresh environment with Lean 4.33.1's leanchecker --fresh, and, if RUN_LEAN4LEAN=1, with
#    lean4lean --fresh (upstream lean4lean built for 4.33.1; much slower).
# Env: KERNEL_JOBS (threads for nanoda/con-leche/con-ron, default 32), PARALLEL=1 runs the
# export-based checkers concurrently. Prints one RESULT line per checker. Exit 0 iff all accept.
set -u
. "$HOME/rh-alpoge/tools/env.sh"
PROJ=$1; MOD=$2; OUT=$3; shift 3
THMS=("$@")
JOBS=${KERNEL_JOBS:-32}
PRIMS=(Nat String String.mk Char Quot Quot.mk Quot.lift Quot.ind propext Quot.sound Classical.choice
       Nat.add Nat.sub Nat.mul Nat.pow Nat.gcd Nat.div Nat.mod Nat.beq Nat.ble Nat.land Nat.lor Nat.xor
       Nat.shiftLeft Nat.shiftRight String.ofList Char.ofNat List eagerReduce)
cd "$PROJ"
if [[ ! -s "$OUT" ]]; then
  echo "EXPORT $MOD -> $OUT $(date -Is)"
  /usr/bin/time -v lake env "$COMPARATOR_LEAN4EXPORT" "$MOD" -- "${THMS[@]}" "${PRIMS[@]}" > "$OUT.partial" 2> "$OUT.export.err" \
    || { echo "EXPORT_FAILED"; tail -30 "$OUT.export.err"; exit 2; }
  mv "$OUT.partial" "$OUT"
  grep -E "Elapsed|Maximum resident" "$OUT.export.err"
fi
echo "EXPORT_FILE $OUT bytes=$(stat -c %s "$OUT") lines=$(wc -l < "$OUT") sha256=$(sha256sum "$OUT" | cut -d' ' -f1)"
head -c 300 "$OUT"; echo
CFG="$OUT.nanoda.json"
cat > "$CFG" <<J
{"use_stdin": false, "export_file_path": "$OUT", "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"],
 "unpermitted_axiom_hard_error": true, "num_threads": $JOBS, "nat_extension": true, "string_extension": true}
J
NAMES=()
launch() { # name cmd...
  local name=$1; shift
  NAMES+=("$name")
  echo "==== start $name: $* $(date -Is)"
  ( /usr/bin/time -v "$@" > "$OUT.$name.log" 2>&1; echo $? > "$OUT.$name.rc" ) &
  [[ -n "${PARALLEL:-}" ]] || wait
}
rm -f "$OUT".*.rc
launch lean-4.35-paranoid "$T35/leanchecker-paranoid" --from-export "$OUT"
launch lean-4.35-default  "$T35/leanchecker" --from-export "$OUT"
launch nanoda             "$COMPARATOR_NANODA" "$CFG"
launch con-leche          "$T35/con-leche" --verified --jobs=$JOBS "$OUT"
launch con-ron            "$T35/con-ron" --verified --jobs=$JOBS "$OUT"
if [[ -z "${SKIP_OLEAN:-}" ]]; then
  launch lean-4.33.1-fresh lake env "$T33/leanchecker" --fresh "$MOD"
  if [[ -n "${RUN_LEAN4LEAN:-}" ]]; then
    launch lean4lean-fresh lake env "$TOOLS/lean4lean/.lake/build/bin/lean4lean" --fresh "$MOD"
  fi
fi
wait
fail=0
for name in "${NAMES[@]}"; do
  rc=$(cat "$OUT.$name.rc" 2>/dev/null || echo missing)
  wall=$(grep -oP "Elapsed \(wall clock\) time \(h:mm:ss or m:ss\): \K.*" "$OUT.$name.log")
  mem=$(grep -oP "Maximum resident set size \(kbytes\): \K.*" "$OUT.$name.log")
  echo "--- $name (wall $wall, maxrss ${mem} kB)"
  grep -v -P "^\t" "$OUT.$name.log" | grep -v "^Command exited" | tail -6 | cut -c1-300
  if [[ "$rc" == 0 ]]; then echo "RESULT $name ACCEPT"; else echo "RESULT $name REJECT(rc=$rc)"; fail=1; fi
done
echo "KERNELS_DONE fail=$fail $(date -Is)"
exit $fail
