#!/bin/bash
export PATH=$HOME/.elan/bin:$PATH
cd ~/rh-alpoge/lean
echo "START $(date -Is)" > ../build.log
/usr/bin/time -v lake build >> ../build.log 2>&1
echo "EXIT $? $(date -Is)" >> ../build.log
lake env lean ../CheckAxioms.lean > ../axioms.log 2>&1
echo "AXCHECK_EXIT $? $(date -Is)" >> ../build.log
