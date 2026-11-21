#!/bin/bash
# Usage: run-scans.sh PROJECT_DIR OUT_PREFIX "Imp1 Imp2 ..." "Pfx1 Pfx2 ..."
# Generates a scan file from scan_template.lean and runs it with `lake env lean` in PROJECT_DIR.
set -u
. "$HOME/rh-alpoge/tools/env.sh"
PROJ=$1; OUT=$2; IMPORTS=$3; PREFIXES=$4
F="$OUT.scan.lean"
imp=$(for m in $IMPORTS; do echo "import $m"; done)
pfx=$(for p in $PREFIXES; do printf "\"%s\", " "$p"; done | sed "s/, $//")
python3 - "$TOOLS/scan_template.lean" "$F" "$imp" "$pfx" "$OUT.report.txt" <<"PY"
import sys
t = open(sys.argv[1]).read()
t = t.replace("__IMPORTS__", sys.argv[3]).replace("__PREFIXES__", sys.argv[4]).replace("__OUT__", sys.argv[5])
open(sys.argv[2], "w").write(t)
PY
cd "$PROJ"
echo "SCAN START $(date -Is) imports=[$IMPORTS] prefixes=[$PREFIXES]"
/usr/bin/time -v lake env lean --tstack=400000 "$F" 2>&1
rc=$?
echo "SCAN EXIT $rc $(date -Is)"
echo "--- report head"; head -12 "$OUT.report.txt" 2>/dev/null
exit $rc
