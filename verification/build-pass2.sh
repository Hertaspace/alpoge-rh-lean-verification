#!/bin/bash
# Second pass: rebuild every module that failed or was skipped in pass 1.
# Pass 1 failed on modules whose imports exceed the kernel limit vm.max_map_count = 65530.
# The LD_PRELOAD shim makes Lean read files beyond the first 40000 mappings into heap memory
# instead of mapping them (see tools/nommap/no_fixed_file_mmap.c). Output is byte-identical.
# LEAN_NUM_THREADS caps Lake parallelism so that the extra heap memory stays well below 2 TB.
export PATH=$HOME/.elan/bin:$PATH
cd ~/rh-alpoge/lean
until grep -q "^AXCHECK_EXIT" ../build.log; do sleep 60; done
export LD_PRELOAD=$HOME/rh-alpoge/tools/nommap/no_fixed_file_mmap.so
export NOMMAP_THRESHOLD=40000
export LEAN_NUM_THREADS=32
echo "START $(date -Is)" > ../build2.log
echo "ENV LD_PRELOAD=$LD_PRELOAD NOMMAP_THRESHOLD=$NOMMAP_THRESHOLD LEAN_NUM_THREADS=$LEAN_NUM_THREADS" >> ../build2.log
/usr/bin/time -v lake build >> ../build2.log 2>&1
echo "EXIT $? $(date -Is)" >> ../build2.log
lake env lean ../CheckAxioms.lean > ../axioms.log 2>&1
echo "AXCHECK_EXIT $? $(date -Is)" >> ../build2.log
