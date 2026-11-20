# Build status

Auto-generated from the build server. Last refresh: 2026-11-20 16:16 UTC.

```
START 2026-11-20T16:12:56+00:00
now 2026-11-20T16:16:00+00:00
load 32.81 25.04 11.87
```

## Progress

```
✔ [8712/183903]
built_lines 1057
error_lines 0
```

## Errors (first 50)

```
```

## Axiom check

```
```

## Log tail

```
  omit hϖ in theorem ...

Note: This linter can be disabled with `set_option linter.unusedSectionVars false`
warning: src/Formalism/SharpRestriction/LevelLetterCocycles/RepresentationCongruences/ConstantCoeffResidueUXPow.lean:357:0: automatically included section variable(s) unused in theorem `Formalism.MainNotions.N.FrobeniusPowerSeries.V2`:
  [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
consider restructuring your `variable` declarations so that the variables are not in scope or explicitly omit them:
  omit [IsAdicComplete (IsLocalRing.maximalIdeal O) O] in theorem ...

Note: This linter can be disabled with `set_option linter.unusedSectionVars false`
⚠ [8706/183903] Built Formalism.SharpRestriction.LevelLetterCocycles.RepresentationCongruences.DenBound (4.4s)
warning: src/Formalism/SharpRestriction/LevelLetterCocycles/RepresentationCongruences/DenBound.lean:35:2: `push_neg` has been deprecated. Prefer using `push Not` instead.
If you'd rather continue using `push_neg` in your project, you can implement it as follows:
```
open Lean.Parser.Tactic in
macro "push_neg" cfg:optConfig loc:(location)? : tactic =>
  `(tactic| push $cfg:optConfig Not $[$loc]?)
```
warning: src/Formalism/SharpRestriction/LevelLetterCocycles/RepresentationCongruences/DenBound.lean:63:12: `ENat.coe_toNat` has been deprecated: Use `ENat.natCast_toNat` instead
✔ [8707/183903] Built Mathlib.AlgebraicGeometry.Group.Abelian (15s)
⚠ [8708/183903] Built Formalism.HermitianCurvature.HermitianCurvatureProofs.SmoothDecayOfWeighted (4.4s)
warning: src/Formalism/HermitianCurvature/HermitianCurvatureProofs/SmoothDecayOfWeighted.lean:37:0: automatically included section variable(s) unused in theorem `Formalism.FourierDecayAlt.P5.HerC.Fou.inv_sq_le`:
  [InnerProductSpace ℝ V]
consider restructuring your `variable` declarations so that the variables are not in scope or explicitly omit them:
  omit [InnerProductSpace ℝ V] in theorem ...

Note: This linter can be disabled with `set_option linter.unusedSectionVars false`
✔ [8709/183903] Built Formalism.HermitianCurvature.HermitianCurvatureProofs.MomentIntegrable (4.4s)
✔ [8710/183903] Built ReciprocityTheory.ReductiveGroups.ArithmeticGeometry.SemiabelianSchemes.SplitTori.SplitTorusAff (3.5s)
✔ [8711/183903] Built Mathlib.NumberTheory.FLT.Three (6.8s)
✔ [8712/183903] Built Mathlib.NumberTheory.NumberField.Ideal.Asymptotics (7.3s)
```
