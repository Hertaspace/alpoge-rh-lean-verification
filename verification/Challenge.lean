-- Challenge for comparator. The four definitions are copied verbatim from src/Statements.lean
-- of the Alpöge project. The five theorems are the statements of src/Main.lean with their proofs removed.
import Mathlib

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

theorem riemannHypothesis : RiemannHypothesis := by sorry
theorem riemannZeta_eq_zero_re : RiemannZetaZerosOnLine := by sorry
theorem LFunction_ne_zero_of_half_lt_re : DirichletLNonvanishingRightOfHalf := by sorry
theorem LFunction_eq_zero_re : DirichletLZerosOnLine := by sorry
theorem LFunction_eq_zero_re_of_isPrimitive : PrimitiveDirichletLZerosOnLine := by sorry
