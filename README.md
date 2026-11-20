# Independent verification of Alpöge's Lean proof of the Riemann Hypothesis

In November 2026 Levent Alpöge released a note, [remark.pdf](https://alpo.ge/remark.pdf), and a Lean 4 project that he says proves the **Riemann Hypothesis** and the **Generalized Riemann Hypothesis for Dirichlet L-functions**, without extra assumptions. This repository records an independent attempt to check that project by compiling it and inspecting what its main theorems depend on.

- **Statement:** `RiemannHypothesis` is Mathlib's own definition, not one introduced by the project (see [Main theorems](#main-theorems)).
- **Source:** the Lean project from `https://alpo.ge/lean.tar.gz.part01` … `part14`. We do not redistribute it. [`SHA256SUMS`](SHA256SUMS) lists the hashes of the parts we checked.
- **Size:** 175,187 Lean files and about 17.4 million lines, built on Mathlib.
- **Status:** build in progress since 20 November 2026, 16:12 UTC, on 256 cores. At the observed rate of about 140 build jobs per minute, the 183,903 jobs need roughly 20 hours. Live progress is in [`status/STATUS.md`](status/STATUS.md), refreshed every 10 minutes.

## Main theorems

`src/Main.lean` of the project contains five theorems:

```lean
theorem riemannHypothesis : RiemannHypothesis
theorem riemannZeta_eq_zero_re : RiemannZetaZerosOnLine
theorem LFunction_ne_zero_of_half_lt_re : DirichletLNonvanishingRightOfHalf
theorem LFunction_eq_zero_re : DirichletLZerosOnLine
theorem LFunction_eq_zero_re_of_isPrimitive : PrimitiveDirichletLZerosOnLine
```

The first uses the definition in Mathlib (`Mathlib/NumberTheory/LSeries/RiemannZeta.lean`, at the pinned revision):

```lean
/-- A formal statement of the **Riemann hypothesis** – constructing a term of this type is worth a
million dollars. -/
def RiemannHypothesis : Prop :=
  ∀ (s : ℂ) (_ : riemannZeta s = 0) (_ : ¬∃ n : ℕ, s = -2 * (n + 1)) (_ : s ≠ 1), s.re = 1 / 2
```

The other four statements are defined in `src/Statements.lean` of the project, which imports only Mathlib:

```lean
def RiemannZetaZerosOnLine : Prop :=
  ∀ s : ℂ, riemannZeta s = 0 → (¬∃ n : ℕ, s = -2 * ((n : ℂ) + 1)) → s ≠ 1 → s.re = 1 / 2

def DirichletLNonvanishingRightOfHalf : Prop :=
  ∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (s : ℂ),
    1 / 2 < s.re → (χ ≠ 1 ∨ s ≠ 1) → DirichletCharacter.LFunction χ s ≠ 0

def DirichletLZerosOnLine : Prop :=
  ∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (s : ℂ),
    0 < s.re → s.re < 1 → DirichletCharacter.LFunction χ s = 0 → s.re = 1 / 2

def PrimitiveDirichletLZerosOnLine : Prop :=
  ∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), χ.IsPrimitive →
    ∀ s : ℂ, 0 < s.re → s.re < 1 → DirichletCharacter.LFunction χ s = 0 → s.re = 1 / 2
```

## Verification

### Results

| Check | What it checks | Result |
|---|---|---|
| source scan | no `sorry`, `axiom`, `native_decide`, `implemented_by`, `@[extern]`, or file and process IO in the 175,187 files | passed (details in [`VERIFICATION.md`](VERIFICATION.md)) |
| `lake build` | the whole project and everything it imports compile | in progress |
| `lake env lean CheckAxioms.lean` | the axioms of the five theorems above | pending |
| `lake comparator --paranoid` | the theorems have exactly the statements above, and their proofs are replayed by six kernels | planned |

A sound result lists only `propext`, `Classical.choice` and `Quot.sound` for each theorem. [`VERIFICATION.md`](VERIFICATION.md) records the environment, the commands and the outputs, and `verification/` contains the scripts.

### Trust base

For `riemannHypothesis`, a reader who accepts the checks above needs to trust only:

- Mathlib's definitions of `riemannZeta` and `RiemannHypothesis`,
- the Lean kernel, or one of the independent checkers,
- the three standard axioms.

The definitions and lemmas inside the project cannot change the meaning of the result, whatever they say, because every step is checked by the kernel. The other four theorems also depend on the definitions in `src/Statements.lean`, quoted above.

### Reproducing the checks

**Step 1. Install Lean** with [elan](https://github.com/leanprover/elan):

```bash
curl https://elan.lean-lang.org/elan-init.sh -sSf | sh
```

The project's `lean-toolchain` asks for Lean `v4.33.1`, which elan downloads on first use.

**Step 2. Download and unpack the project.**

```bash
for i in $(seq -w 1 14); do curl -fLO https://alpo.ge/lean.tar.gz.part$i; done
cat lean.tar.gz.part{01..14} > lean.tar.gz
sha256sum -c SHA256SUMS --ignore-missing   # from this repository
tar -xzf lean.tar.gz && cd lean
```

**Step 3. Download the compiled Mathlib.**

```bash
lake exe cache get
```

**Step 4. Build.**

```bash
lake build
```

This compiles all 175,187 files of the project. Expect many hours even on a large machine. Plan for a lot of disk space for the compiled files.

**Step 5. See which axioms the proofs use.** Copy [`CheckAxioms.lean`](CheckAxioms.lean) next to the `lean/` directory and run

```bash
lake env lean ../CheckAxioms.lean
```

## How this work was produced

The checks were set up and run by a large language model agent (Claude) under human direction. We are not affiliated with the author of the proof. Independent verification is welcome. If you find a problem, please [open an issue](https://github.com/Hertaspace/alpoge-rh-lean-verification/issues) with the command, environment and relevant output.

## License

The scripts and documentation of this repository are under the [MIT License](LICENSE). The Lean project being checked belongs to its author and is not included here.
