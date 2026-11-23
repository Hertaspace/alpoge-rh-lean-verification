#!/bin/bash
# con-leche --compare (branch compare at 5dc36dc1, as in the MIT run): check that the five challenge theorems
# are justified by the solution export, an independent implementation of comparator statement matching.
set -x
export PATH=$HOME/.elan/bin:$PATH
T=$HOME/rh-alpoge/tools; R=$HOME/rh-alpoge
cd $T
[ -d con-leche-compare ] || git clone -q https://github.com/leanprover/con-leche con-leche-compare
cd con-leche-compare && git checkout -q 5dc36dc1 && lake build con-leche > $T/con-leche-compare-build.log 2>&1 || exit 1
/usr/bin/time -v .lake/build/bin/con-leche --compare --jobs=32 $R/challenge-compare/project.ndjson $R/export/main.ndjson > $R/con-leche-compare.log 2>&1
echo "CMP_EXIT $?" >> $R/con-leche-compare.log
