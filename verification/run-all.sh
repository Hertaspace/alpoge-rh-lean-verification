#!/bin/bash
# Run every check on the built project, concurrently. Logs in ~/rh-alpoge/:
#   comparator.log, challenge-compare.log, scans.log (+ scan-main.report.txt), kernels.log (+ export/main.ndjson.*)
set -u
. "$HOME/rh-alpoge/tools/env.sh"
R=${RH_ROOT:-$HOME/rh-alpoge}; PROJ=$R/lean
cd "$PROJ"
lake build --no-build Main > /dev/null 2>&1 || { echo "ABORT: Main is not fully built"; exit 10; }
mkdir -p "$R/export" "$R/scan"
THMS=${THMS:-"riemannHypothesis riemannZeta_eq_zero_re LFunction_ne_zero_of_half_lt_re LFunction_eq_zero_re LFunction_eq_zero_re_of_isPrimitive"}
PFX=${PFX:-"BuildAid CompanionTheory Development Formalism GroundTheory Lemmata PositivityTheory ReciprocityTheory Supplements Main Statements"}
echo "ALL START $(date -Is)"
INSTALL_ONLY=1 "$TOOLS/run-comparator.sh" "$R/challenge-install.log" || { echo "ABORT: challenge install failed, see $R/challenge-install.log"; exit 11; }
"$TOOLS/run-comparator.sh" "$R/comparator.log" & P1=$!
"$TOOLS/run-scans.sh" "$PROJ" "$R/scan/main" "Main" "$PFX" > "$R/scans.log" 2>&1 & P2=$!
PARALLEL=1 "$TOOLS/run-kernels.sh" "$PROJ" Main "$R/export/main.ndjson" $THMS > "$R/kernels.log" 2>&1 & P3=$!
wait $P1; r1=$?; echo "comparator rc=$r1 $(date -Is)"
"$TOOLS/compare-challenge.sh" > "$R/challenge-compare.log" 2>&1; r4=$?; echo "challenge-compare rc=$r4 $(date -Is)"
wait $P2; r2=$?; echo "scans rc=$r2 $(date -Is)"
wait $P3; r3=$?; echo "kernels rc=$r3 $(date -Is)"
echo "ALL DONE comparator=$r1 challenge-compare=$r4 scans=$r2 kernels=$r3 $(date -Is)"
