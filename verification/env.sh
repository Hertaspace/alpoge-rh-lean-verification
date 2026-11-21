# Source this before running comparator / kernels.
TOOLS=$HOME/rh-alpoge/tools
T33=$HOME/.elan/toolchains/leanprover--lean4---v4.33.1/bin
T35=$HOME/.elan/toolchains/leanprover--lean4---v4.35.0-rc2/bin
export PATH=$HOME/.elan/bin:$PATH
export COMPARATOR=$TOOLS/comparator/.lake/build/bin/comparator
export COMPARATOR_LEAN4EXPORT=$TOOLS/comparator/.lake/packages/lean4export/.lake/build/bin/lean4export
export COMPARATOR_LANDRUN=$TOOLS/bin/landrun
export COMPARATOR_NANODA=$T35/nanoda_bin
export LEAN_ABORT_ON_PANIC=1
ulimit -n 1048576 2>/dev/null || true
# Map-count workaround (see VERIFICATION.md): Lean processes that import Main exceed vm.max_map_count.
export LD_PRELOAD=$TOOLS/nommap/no_fixed_file_mmap.so
export NOMMAP_THRESHOLD=40000
