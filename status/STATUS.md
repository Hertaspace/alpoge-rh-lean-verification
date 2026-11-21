# Build status

Auto-generated from the build server. Last refresh: 2026-11-21 18:40 UTC.

```
pass 2 (log build2.log)
START 2026-11-21T17:32:32+00:00
ENV LD_PRELOAD=/home/ubuntu/rh-alpoge/tools/nommap/no_fixed_file_mmap.so NOMMAP_THRESHOLD=40000 LEAN_NUM_THREADS=32
pass1 EXIT 1 2026-11-21T17:31:57+00:00
pass1 AXCHECK_EXIT 1 2026-11-21T17:31:59+00:00
mem_used_GB 243
now 2026-11-21T18:40:07+00:00
load 34.38 35.02 35.86
```

## Progress

```
latest_job 143857/144125
built_ok 1006
built_with_warnings 79075
failed 0
error_messages 0
```

## Errors (first 50)

```
```

## Axiom check

```
../AxiomCheck.lean:1:0: error: unknown module prefix 'Main'

No directory 'Main' or file 'Main.olean' in the search path entries:
/home/ubuntu/rh-alpoge/lean/.lake/packages/Cli/.lake/build/lib/lean
/home/ubuntu/rh-alpoge/lean/.lake/packages/batteries/.lake/build/lib/lean
/home/ubuntu/rh-alpoge/lean/.lake/packages/Qq/.lake/build/lib/lean
/home/ubuntu/rh-alpoge/lean/.lake/packages/aesop/.lake/build/lib/lean
/home/ubuntu/rh-alpoge/lean/.lake/packages/proofwidgets/.lake/build/lib/lean
/home/ubuntu/rh-alpoge/lean/.lake/packages/importGraph/.lake/build/lib/lean
/home/ubuntu/rh-alpoge/lean/.lake/packages/LeanSearchClient/.lake/build/lib/lean
/home/ubuntu/rh-alpoge/lean/.lake/packages/plausible/.lake/build/lib/lean
/home/ubuntu/rh-alpoge/lean/.lake/packages/mathlib/.lake/build/lib/lean
/home/ubuntu/rh-alpoge/lean/.lake/build/lib/lean
/home/ubuntu/.elan/toolchains/leanprover--lean4---v4.33.1/lib/lean
/home/ubuntu/.elan/toolchains/leanprover--lean4---v4.33.1/lib/lean
```

## Log tail

```
⚠ [143839/144120] Built Development.AbelianVarietyTheory.Proofs.IwasawaDecomposition.Lb1OfRestagingHostsStatement (50s)
⚠ [143840/144120] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.RingBoundOfDeepGoodStatement (37s)
✔ [143841/144120] Built Development.AbelianVarietyTheory.Proofs.SatakeParameters.FactsAtMembership (59s)
⚠ [143842/144120] Replayed Development.AutomorphicSpectrum.Proofs.AlgebraProofs.HausdorffConeBallMeasureStatement
⚠ [143843/144120] Replayed Development.AutomorphicSpectrum.Proofs.AlgebraProofs.BallAverageFibreCountStatement
⚠ [143844/144120] Replayed Development.AutomorphicSpectrum.Proofs.AlgebraProofs.ChowFormFibreSpecialization
⚠ [143845/144124] Replayed Development.WeilBound.CoreStatements.HomogeneousNonvanishing.VuOntoA
⚠ [143847/144124] Replayed Development.AutomorphicSpectrum.Proofs.GeometryProofs.ToroidalFlagSmoothProjectiveStatement
✔ [143849/144124] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.ReferenceThetaOfCore (38s)
✔ [143850/144124] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.FlatBoundOfAnchor (61s)
⚠ [143852/144124] Replayed Development.AutomorphicSpectrum.Proofs.AlgebraProofs.ChowFormFibreSpecializationStatement
⚠ [143853/144124] Replayed Development.WeilBound.CoreStatements.HomogeneousNonvanishing.VuOntoC
⚠ [143855/144124] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.ExistsNonzeroSectionWeightBoundStatement (44s)
⚠ [143856/144125] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.ReferenceExponentPrimeBound (37s)
⚠ [143857/144125] Replayed Development.AutomorphicSpectrum.Proofs.AlgebraProofs.AeFibrePointsCardEqDegreeStatement
```
