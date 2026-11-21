#!/bin/bash
# Wait for pass 2 to finish; if the build succeeded, run every post-build check.
cd ~/rh-alpoge
until grep -q "^AXCHECK_EXIT" build2.log; do sleep 60; done
grep -q "^EXIT 0" build2.log || { echo "build failed, checks not started $(date -Is)" > run-all.log; exit 1; }
~/rh-alpoge/tools/run-all.sh > ~/rh-alpoge/run-all.log 2>&1
echo "RUNALL_EXIT $? $(date -Is)" >> ~/rh-alpoge/run-all.log
