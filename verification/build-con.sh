#!/bin/bash
# Build con-leche (master cd2eceab) and con-ron (master 3f22699b) from source, the commits used by the MIT run,
# and check the export in --verified mode.
set -x
export PATH=$HOME/.elan/bin:$HOME/.cargo/bin:$PATH
T=$HOME/rh-alpoge/tools; OUT=$HOME/rh-alpoge/export/main.ndjson
cd $T
[ -d con-leche ] || git clone -q https://github.com/leanprover/con-leche
(cd con-leche && git checkout -q cd2eceab && cat lean-toolchain && lake build con-leche) > $T/con-leche-build.log 2>&1
[ -x $HOME/.cargo/bin/cargo ] || curl -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal > $T/rustup.log 2>&1
[ -d con-ron ] || git clone -q https://github.com/leanprover/con-ron
(cd con-ron && git checkout -q 3f22699b && cargo build --release) > $T/con-ron-build.log 2>&1
CL=$T/con-leche/.lake/build/bin/con-leche; CR=$T/con-ron/target/release/con-ron
( /usr/bin/time -v $CL --verified --jobs=32 $OUT > $OUT.con-leche-master.log 2>&1; echo $? > $OUT.con-leche-master.rc ) &
( /usr/bin/time -v $CR --verified --jobs=32 $OUT > $OUT.con-ron-master.log 2>&1; echo $? > $OUT.con-ron-master.rc ) &
wait
echo BUILDCON_DONE
