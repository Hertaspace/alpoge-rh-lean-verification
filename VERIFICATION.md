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

`lake exe cache get` downloaded all 8,690 Mathlib cache files, but 2,531 of them failed to decompress, so the build also recompiles that part of Mathlib from source. This makes the build slower but does not weaken it.

Started 20 November 2026, 16:12 UTC. Result: in progress.

## Axioms

Pending.

## Comparator replay

Planned, with the same `lake comparator --paranoid` setup used for [sic-povm-lean](https://github.com/Hertaspace/sic-povm-lean).
