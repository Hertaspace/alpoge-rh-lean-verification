#!/bin/bash
# Statement comparison + axiom check + Lean 4.33.1 kernel replay with comparator v4.33.0.
# Run only after `lake build` of ~/rh-alpoge/lean has finished.
# It installs src/Challenge.lean and a `Challenge` lean_lib into the project (the original
# lakefile is saved to $RH_ROOT/lakefile.toml.orig), after checking that Main is fully built,
# and checks again afterwards that nothing became out of date.
set -u
. "$HOME/rh-alpoge/tools/env.sh"
RH_ROOT=${RH_ROOT:-$HOME/rh-alpoge}
PROJ=$RH_ROOT/lean
CHALLENGE=${CHALLENGE:-$TOOLS/Challenge.lean}
CFG=${COMPARATOR_CFG:-$TOOLS/comparator.json}
LOG=${1:-$RH_ROOT/comparator.log}
exec > "$LOG" 2>&1
echo "START $(date -Is)"
cd "$PROJ"
lake build --no-build Main
rc=$?; if [[ $rc != 0 ]]; then echo "ABORT: Main is not fully built (lake build --no-build Main rc=$rc)"; exit 10; fi
if [[ -e src/Challenge.lean ]] && ! cmp -s src/Challenge.lean "$CHALLENGE"; then
  echo "ABORT: src/Challenge.lean exists and differs from $CHALLENGE"; exit 11
fi
cp "$CHALLENGE" src/Challenge.lean
if ! grep -q '^name = "Challenge"$' lakefile.toml; then
  [[ -e $RH_ROOT/lakefile.toml.orig ]] || cp lakefile.toml "$RH_ROOT/lakefile.toml.orig"
  printf '\n[[lean_lib]]\nname = "Challenge"\n' >> lakefile.toml
fi
lake build --no-build Main
rc=$?; if [[ $rc != 0 ]]; then echo "ABORT: installing the challenge made Main out of date (rc=$rc)"; exit 12; fi
if [[ -n "${INSTALL_ONLY:-}" ]]; then echo "CHALLENGE_INSTALLED $(date -Is)"; exit 0; fi
echo "--- inputs"
sha256sum src/Challenge.lean src/Statements.lean src/Main.lean lakefile.toml "$CFG" "$COMPARATOR" "$COMPARATOR_LEAN4EXPORT"
git -C "$TOOLS/comparator" rev-parse HEAD
git -C "$TOOLS/comparator/.lake/packages/lean4export" rev-parse HEAD
lean --version
echo "--- comparator $(date -Is)"
/usr/bin/time -v nice -n 5 lake env "$COMPARATOR" "$CFG"
rc=$?
echo "COMPARATOR_EXIT $rc $(date -Is)"
exit $rc
