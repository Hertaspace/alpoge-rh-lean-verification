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

Started 20 November 2026, 16:12 UTC. Result: in progress.

**Incident during the first pass.** At about 16:16 UTC the module `Statements` failed with

```
error: src/Statements.lean:1:0: failed to read file '.../mathlib/.lake/build/lib/lean/Mathlib/CategoryTheory/Bicategory/Extension.ir', invalid header
```

This is an error reading a compiled Mathlib file, not an error in the project. The file has a valid header when inspected afterwards, and `lake env lean src/Statements.lean` then succeeded in 11 s. The likely cause is that the file was read while it was being rewritten, during the partial recompilation of Mathlib described above. Because `Main` imports `Statements`, the first pass cannot build `Main`. A second `lake build` after the first pass ends rebuilds every module that failed or was skipped, and the results below refer to that second pass.

## Cross-checks with the MIT run

These comparisons with the independent run at [math.mit.edu/~drew/grh](https://math.mit.edu/~drew/grh/) were made on 21 November 2026, while our build was still running. The MIT files used (`SHA256SUMS`, `project-oleans.sha256`, `comparator.json`, `Audit.lean`, `challenge.ndjson.zst`) were downloaded from that page. The hashes of `comparator.json`, `Audit.lean` and `challenge.ndjson.zst` match the page's `SHA256SUMS`.

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

Pending.

## Planned checks after the build

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
