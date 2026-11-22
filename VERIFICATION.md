# Verification record

This file records the environment, commands and outputs of each check. It is updated as the checks finish.

## Source

- Note: `https://alpo.ge/remark.pdf`
- Lean project: `https://alpo.ge/lean.tar.gz.part01` … `part14`, 14 parts, 239,275,554 bytes joined.
- Downloaded twice, on 20 November 2026, once on a macOS laptop and once directly on the build server. Both joined archives have SHA-256 `9631b4f0…a229c42` (full hashes in [`SHA256SUMS`](SHA256SUMS)).
- The archive unpacks to a single directory `lean/`. No entry has an absolute path or `..`.

## Project configuration

| | |
|---|---|
| Lean toolchain | `leanprover/lean4:v4.33.1` |
| Mathlib revision | `0df444a360eaa60ab8c11dca51a86af692955474` |
| Libraries | `BuildAid`, `CompanionTheory`, `Development`, `Formalism`, `GroundTheory`, `GroundTheoryFields`, `Lemmata`, `PositivityTheory`, `ReciprocityTheory`, `Supplements`, `Main` |
| Options | `autoImplicit = false`, `maxHeartbeats = 4000000`, `--tstack=400000` |

Files per top-level directory of `src/`:

| Directory | `.lean` files |
|---|---:|
| `Development` | 141,928 |
| `Formalism` | 18,254 |
| `GroundTheory` | 8,507 |
| `ReciprocityTheory` | 3,845 |
| `CompanionTheory` | 2,027 |
| `PositivityTheory` | 449 |
| `Lemmata` | 167 |
| `BuildAid` | 5 |
| `Supplements` | 3 |
| `Main.lean`, `Statements.lean` | 2 |

## Source scan

A text search over all `.lean` files, run before building:

| Pattern | Matches |
|---|---:|
| `sorry` (whole word) | 0 files |
| `axiom` declarations | 0 |
| `native_decide`, `implemented_by`, `@[extern]` | 0 files |
| `IO.Process`, `IO.FS`, `#eval`, `initialize`, `unsafe def` | 0 |
| `run_cmd` | 5 |
| `addDecl` | 2 |

The five `run_cmd` lines are in `src/BuildAid/D1.lean` … `D5.lean`. Each adds one namespace to `Lean.LibrarySuggestions.nameDenyListExt`, which only affects which lemmas the library-suggestion tactics propose:

```lean
run_cmd Lean.modifyEnv fun env => Lean.LibrarySuggestions.nameDenyListExt.addEntry env "CompanionTheory"
```

The two `addDecl` calls are in `src/Formalism/HermitianCurvature/HermitianCurvatureProofs/CutCptCopy.lean`. They belong to a command `cpt_copy_thms` that copies existing definitions and theorems under new names with a substitution applied. `addDecl` sends each copy to the kernel, so the copies are checked like any other declaration.

A text scan cannot rule out every way to subvert a proof. The build, the axiom check and the comparator replay below are the real checks.

## Build

Environment: Linux x86-64, 256 cores, 2 TB RAM. Lean `4.33.1` (commit `819816b2e0a3`).

```bash
lake exe cache get
lake build
```

`lake exe cache get` downloaded all 8,690 Mathlib cache files, but 2,531 of them failed to decompress. The files were not corrupt: the decompressor `leantar` hit the limit of 1,024 open files per process (`os error 24`). Lake therefore recompiles that part of Mathlib from source. This makes the build slower but does not weaken it.

Result: **success.** The second pass ended with `Build completed successfully (183903 jobs).`

| Pass | Started (UTC) | Wall-clock time | Result |
|---|---|---|---|
| 1, plain `lake build` | 20 Nov, 16:12 | 25 h 19 min | 167,624 jobs built, 242 failed, `error: build failed` |
| 2, `lake build` with the shim below | 21 Nov, 17:32 | 4 h 30 min | 8,577 modules rebuilt, 0 failed, `Build completed successfully (183903 jobs).` |

Every one of the 242 failures of the first pass is an error in reading a file or allocating memory, not an error in a proof. In 210 of them Lean reports `failed to read file` for an imported `.olean` or `.ir` file (one of these is the `invalid header` incident described next). The remaining 32 end with `std::bad_alloc`, `INTERNAL PANIC: out of memory` or `failed to create thread`. We checked the output of every failed job for one of these messages. Apart from the `Statements` incident, all of them come from the map-count limit explained below. In the second pass the largest single process used 99.6 GB (maximum resident set size reported by `time -v`).

**Incident during the first pass.** At about 16:16 UTC the module `Statements` failed with

```
error: src/Statements.lean:1:0: failed to read file '.../mathlib/.lake/build/lib/lean/Mathlib/CategoryTheory/Bicategory/Extension.ir', invalid header
```

This is an error reading a compiled Mathlib file, not an error in the project. The file has a valid header when inspected afterwards, and `lake env lean src/Statements.lean` then succeeded in 11 s. The likely cause is that the file was read while it was being rewritten, during the partial recompilation of Mathlib described above. Because `Main` imports `Statements`, the first pass cannot build `Main`. A second `lake build` after the first pass ends rebuilds every module that failed or was skipped, and the results below refer to that second pass.

**Map-count limit, and the second pass.** At 11:02 UTC on 21 November the module `Development.AbelianVarietyTheory.Proofs.DecoratedLatticeProofs.AllTrueFamilyGeometry` failed with

```
error: .../AllTrueFamilyGeometry.lean:1:0: failed to read file '.../Formalism/LocalToGlobal/Divisibility/DivisionHeightBoundColumns.olean'
```

The file it names was written at 02:17 UTC and is intact, and the failure reproduces when the module is compiled alone. `strace` shows the cause: after about 65,900 memory mappings, `mmap` of that file returns `ENOMEM`, and so do the anonymous allocations of Lean's fallback path. The kernel of the build server limits a process to `vm.max_map_count = 65530` mappings, and the setting cannot be changed from inside its container. Lean maps every imported `.olean` file separately, and modules near the top of this project import close to 200,000 of them (`Main` imports 186,200 modules according to the MIT audit). Every such module fails on this machine. The amount of memory is not the problem: the failing process used 2.3 GB.

Lean already has a fallback for a file that cannot be mapped at its preferred address: it reads the file into heap memory and relocates its pointers. It takes this path whenever two files want the same address. Heap memory is anonymous, and the kernel merges it into few mappings. The shim [`verification/no_fixed_file_mmap.c`](verification/no_fixed_file_mmap.c), loaded with `LD_PRELOAD`, makes every file mapping after the first 40,000 in a process fail, so that Lean takes this fallback for the rest. It changes nothing else.

The shim does not change the compiled output. Built with Lake's exact arguments, with and without the shim:

| Module | without shim (`lake build`) | with shim |
|---|---|---|
| `ReciprocityTheory/…/MultiplicityOne/JSmoothB` | `88fbcaff64067ca3` | `88fbcaff64067ca3` |
| `Formalism/LocalToGlobal/Divisibility/DivisionHeightBoundColumns` | `3f70cbef237cfe0f` | `3f70cbef237cfe0f` |
| `Development/…/AllTrueFamilyGeometry` | fails (map limit) | `3b69583eb2b65f1e`, 41 s, 14.6 GB peak memory |

The first pass continued without the shim and built every module below the limit. A second `lake build` then ran with the shim and with `LEAN_NUM_THREADS=32`, which limits Lake's parallelism so that the extra heap memory stays well below the 2 TB of the server. It rebuilt every module that failed or was skipped in the first pass, including `Statements` and `Main`, without a single failure. Script: [`verification/build-pass2.sh`](verification/build-pass2.sh).

## Cross-checks with the MIT run

These comparisons with the independent run at [math.mit.edu/~drew/grh](https://math.mit.edu/~drew/grh/) were made on 21 November 2026, while our build was still running, except for the comparison of `Main.olean`, made after it. The MIT files used (`SHA256SUMS`, `project-oleans.sha256`, `comparator.json`, `Audit.lean`, `challenge.ndjson.zst`) were downloaded from that page. The hashes of `comparator.json`, `Audit.lean` and `challenge.ndjson.zst` match the page's `SHA256SUMS`.

**Archive.** Both runs used an archive with SHA-256 `9631b4f020199e580ba86178cb56c6e9b09f690c2369a80dc4334aa93f49c7fc`.

**Mathlib build files.** All 8,322 Mathlib `.olean` files of our build, including the 2,531 modules recompiled from source, are byte-identical to the official Mathlib cache, as unpacked in a separate Mathlib-only project. The MIT page reports the same for its 8,322 Mathlib files.

**Project build files.** For a random sample of 500 project `.olean` files that our build had already produced, 257 are byte-identical to the MIT manifest and 243 differ. The difference comes from file paths, not from content. A `.olean` file can record the path of its source file, and Lake passes the absolute path, which differs between the two machines. We checked this on one of the 243, `ReciprocityTheory/ReductiveGroups/DiscreteSeries/MultiplicityOne/JSmoothB`:

| Build of `JSmoothB.lean` | SHA-256 of the `.olean` (prefix) |
|---|---|
| our `lake build` | `88fbcaff64067ca3` |
| rebuilt with Lake's exact arguments, same absolute path | `88fbcaff64067ca3` |
| same, run twice with a relative path | `e7456bf9cd2d7ef9`, `e7456bf9cd2d7ef9` |
| MIT manifest | `1f3c1efc0eb85d07` |

The two variants differ in the embedded string `/home/ubuntu/rh-alpoge/lean/src/…/JSmoothB.lean` versus `src/…/JSmoothB.lean`. The build is therefore deterministic, and a byte comparison of `.olean` files across machines is only meaningful for files that do not record a path. Exports, which contain only kernel declarations, are compared instead.

After the build we hashed all 175,187 project `.olean` files. Every file in the MIT manifest is present in our build and vice versa. 76,968 are byte-identical and 98,219 differ, which is consistent with the sample above. `Main.olean` is among the identical ones (next paragraph).

**`Main.olean`.** After the build, our `Main.olean` has SHA-256 `9146dfb4148e24d2252e04c50742f3e49dd126dfcc5006d10bf5f873ddf796ad`, the same as in the MIT manifest. `src/Main.lean` contains no term that records its source path, so the file is comparable across machines.

**Statements.** The challenge module (the five statements, with `sorry` as proofs) was compiled in our Mathlib-only project and exported with lean4export `v4.33.0`. The MIT export of its challenge module differs from ours byte for byte, because exports number every name and expression in order of first use and the two runs pass different lists of root constants. [`verification/compare_exports.py`](verification/compare_exports.py) resolves the numbering, hashes every expression structurally and compares the declarations by name:

```
declarations: mit/challenge.ndjson: 51692, challenge-compare/cleanroom.ndjson: 51690, common: 51690
identical: 51686, different: 4
DIFFERENT thm LFunction_eq_zero_re (same type, different value)
DIFFERENT thm LFunction_eq_zero_re_of_isPrimitive (same type, different value)
DIFFERENT thm LFunction_ne_zero_of_half_lt_re (same type, different value)
DIFFERENT thm riemannHypothesis (same type, different value)
only in first: 2
ONLY_FIRST def String.mk
ONLY_FIRST thm String.mk._proof_1
only in second: 0
```

The four differing declarations are challenge theorems whose statements are identical and whose values are the `sorry` placeholders, which differ between the two challenge files. `String.mk` is an extra root that the comparator of Lean 4.36 adds. Every other declaration, including all of Mathlib that the statements use, is identical.

## Axioms

After the second pass, `lake env lean ../CheckAxioms.lean` ([`CheckAxioms.lean`](CheckAxioms.lean)) printed, on 21 November 2026 at 22:06 UTC:

```
'riemannHypothesis' depends on axioms: [propext, Classical.choice, Quot.sound]
'riemannZeta_eq_zero_re' depends on axioms: [propext, Classical.choice, Quot.sound]
'LFunction_ne_zero_of_half_lt_re' depends on axioms: [propext, Classical.choice, Quot.sound]
'LFunction_eq_zero_re' depends on axioms: [propext, Classical.choice, Quot.sound]
'LFunction_eq_zero_re_of_isPrimitive' depends on axioms: [propext, Classical.choice, Quot.sound]
riemannHypothesis : RiemannHypothesis
def RiemannHypothesis : Prop :=
∀ (s : ℂ), riemannZeta s = 0 → (¬∃ n, s = -2 * (↑n + 1)) → s ≠ 1 → s.re = 1 / 2
```

These are the three standard axioms of Lean and Mathlib. No `sorryAx` and no axiom declared by the project appears. The last lines confirm that `RiemannHypothesis` is Mathlib's definition, unchanged.

## Checks after the build

Started 21 November 2026, 22:09 UTC, with [`verification/run-all.sh`](verification/run-all.sh), which runs checks 1 to 4 below concurrently.

**Scan of the compiled environment (check 3): passed.** [`verification/scan_template.lean`](verification/scan_template.lean), run with `import Main` over every constant whose module lies in one of the project's top-level directories, finished at 22:52 UTC (40 min, 101 GB peak memory):

```
scanned 1945519 constants (1588253 theorems) from 175187 project modules in the import closure; project axioms: 0 []; constants mentioning sorryAx directly: 0 []; constants depending on an axiom other than propext, Classical.choice, Quot.sound: 0 [];
```

All 175,187 project modules are in the import closure of `Main`. None declares an axiom, none uses `sorry`, and no constant in them depends on an axiom other than the three standard ones.

Checks 1, 2 and 4: in progress.

Lake 4.33.1 has no `lake comparator` or `lake check` subcommand, which the [sic-povm-lean](https://github.com/Hertaspace/sic-povm-lean) record used. The same checks are therefore run with the standalone tools, pinned as follows.

| Tool | Version |
|---|---|
| [comparator](https://github.com/leanprover/comparator) | tag `v4.33.0` (`3927ad383f20`), run with Lean 4.33.1 |
| [lean4export](https://github.com/leanprover/lean4export) | tag `v4.33.0` (`15f6055e299a`), built with Lean 4.33.1, export format 3.1.0 |
| [lean4lean](https://github.com/digama0/lean4lean) | `67f63b0c8189`, built with Lean 4.33.1 |
| Lean paranoid and default kernels, nanoda 0.4.17, con-leche, con-ron | as bundled with Lean 4.35.0-rc2, reading export format 3.1.0 |

1. **comparator.** The challenge module [`verification/Challenge.lean`](verification/Challenge.lean) imports only Mathlib. It copies the four definitions of `src/Statements.lean` verbatim and states the five theorems of `src/Main.lean` with `sorry`. [`verification/comparator.json`](verification/comparator.json) names the five theorems and permits only `propext`, `Quot.sound` and `Classical.choice`. It has no `definition_names` entry, so every constant the statements use, definition bodies included, must be identical in the challenge and in `Main`. comparator then replays the proofs in the Lean 4.33.1 kernel.
2. **Clean-room comparison of the statements.** comparator reads the challenge and the solution from the same compiled Mathlib, so it cannot detect a modified copy of Mathlib inside the project. The challenge is therefore also compiled in a separate project that contains only Mathlib, at the same commit and with the official Mathlib cache. The two exports of the challenge must be byte-identical.
3. **Scans of the compiled environment.** Every constant of a project module in the import closure of `Main` is checked for declared axioms, direct uses of `sorryAx`, and dependence on any axiom other than the three standard ones.
4. **Independent kernels.** The import closure of `Main` is exported and replayed by Lean's paranoid and default kernels, nanoda, con-leche and con-ron. Lean 4.33.1's `leanchecker --fresh Main` also replays it from the compiled files.

These tools were tested on small Lean 4.33.1 projects before use. A correct toy proof was accepted by comparator and by every kernel. comparator rejected a toy whose definition was changed (`Const does not match between challenge and target`), one with an extra axiom (`Illegal axiom detected: 'cheat'`) and one with `sorry` (`Illegal axiom detected: 'sorryAx'`). An export edited to claim `2 + 2 = 5` was rejected by all five export kernels.

Caveats. The kernels bundled with Lean 4.35.0-rc2 are a later release than the project's Lean 4.33.1, although they read the same export format. The lean4lean bundled with 4.35.0-rc2 cannot read a 4.33.1 export, because it expects the constant `Decidable.intro`, which first appears in Lean 4.35. Upstream lean4lean built with 4.33.1 is used instead. The sandbox that comparator normally uses (Landlock, through landrun) is not enforced in the container of the build server, so the checkers run unsandboxed. The project is compiled without a sandbox in any case.

The map-count limit also affects every tool that loads `Main` from its compiled files, so all of them run with the shim of the [Build](#build) section. comparator passes only a fixed list of environment variables to the programs it starts, so we added `LD_PRELOAD` and `NOMMAP_THRESHOLD` to that list ([`verification/comparator-envpass.diff`](verification/comparator-envpass.diff)). The change touches only the environment, not what comparator checks.

## Computing resources

Everything ran on one server: two AMD EPYC 7763 processors (128 cores, 256 hardware threads), 2 TB of RAM, Ubuntu 20.04 in an LXD container on Linux 5.15. Times and memory come from `/usr/bin/time -v`. "Peak memory" is the largest resident set size of a single process, not the total for the machine. CPU time is the processor time used by our processes, summed over all of them and counted in hardware threads.

All figures are approximate. The container shares the physical server with other containers, whose load we cannot see, and the build processes also competed with each other and with our own checks. Such load can lengthen the wall-clock times and can also raise the measured CPU time somewhat, because a busy processor runs each thread more slowly. CPU time and memory never include other users' processes. The figures describe one run on this server and should be read as a guide to the order of magnitude.

| Step | Wall-clock time | CPU time | Peak memory | Written to disk |
|---|---|---|---|---|
| `lake build`, pass 1 (plain) | 25 h 19 min | 3,670 h (145 threads busy on average) | 19 GB | 1.17 TB |
| `lake build`, pass 2 (with the shim, at most 32 jobs) | 4 h 30 min | 126 h | 100 GB | 102 GB |
| export of the closure of `Main` (lean4export) | 2 h 26 min | 2.4 h | 170 GB | 61.6 GB |
| scan of the compiled environment | 40 min | 0.7 h | 101 GB | |
| comparator | in progress | | | |
| independent kernels | in progress | | | |

The two build passes together took about 30 hours and 3,800 CPU-hours. Pass 1 kept on average 145 of the 256 hardware threads busy. A large share of the CPU time is system time, the time the operating system kernel spends on requests from Lean, such as mapping imported files into memory, handling the resulting page faults, and writing files: 921 of the 3,670 h in pass 1, and 86 of the 126 h in pass 2. We did not measure how it divides among these.

Disk usage after the build:

| Content | Size |
|---|---|
| project source (`lean.tar.gz`, 239 MB compressed) | 2.0 GB |
| project `.olean` files (175,187) | 94.6 GB |
| project `.ilean` files | 4.7 GB |
| project `.c` files | 1.0 GB |
| Lake's `*.setup.json` files, one per project module | 1.17 TB |
| Mathlib and other dependencies, compiled | 8.4 GB |
| export of the closure of `Main` | 61.6 GB |

The largest item is not the compiled proofs. For every module Lake writes a `.setup.json` file that lists the path of every compiled file the module imports, directly or indirectly. Modules near the top of this project import close to 200,000 modules, so these files reach 50 MB each (`Main.setup.json` is 49.8 MB), and together they take 1.17 TB. A rerun should plan for about 1.3 TB of free disk for the build alone.

What a rerun on a different machine should expect, from our experience:

- **Open files.** `lake exe cache get` needs a high limit on open files (`ulimit -n`). With the default of 1,024, 2,531 of the 8,690 Mathlib cache files failed to unpack and were recompiled from source. This cost time but did not change the result.
- **Memory mappings.** Modules near the top need more than 65,530 memory mappings per process (`vm.max_map_count`). Raise the limit if you can, or use the shim of the [Build](#build) section.
- **Memory.** In pass 1, no single compiler process exceeded 19 GB. With the shim, imported files are read into memory instead of mapped, and the largest process reached 100 GB, so we limited pass 2 to 32 parallel jobs. Tools that load all of `Main` (the export, the scan, the kernels) need 100 to 170 GB each.
- **Time.** On fewer cores the build should scale roughly with the 3,800 CPU-hours above. A machine with 64 cores would need at least two to three days.
