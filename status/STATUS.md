# Build status

Auto-generated from the build server. Last refresh: 2026-11-21 17:59 UTC.

```
pass 2 (log build2.log)
START 2026-11-21T17:32:32+00:00
ENV LD_PRELOAD=/home/ubuntu/rh-alpoge/tools/nommap/no_fixed_file_mmap.so NOMMAP_THRESHOLD=40000 LEAN_NUM_THREADS=32
pass1 EXIT 1 2026-11-21T17:31:57+00:00
pass1 AXCHECK_EXIT 1 2026-11-21T17:31:59+00:00
mem_used_GB 329
now 2026-11-21T17:59:20+00:00
load 37.16 36.12 47.18
```

## Progress

```
latest_job 116296/116554
built_ok 438
built_with_warnings 61265
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
✔ [116278/116554] Built Development.AbelianVarietyTheory.Proofs.DecoratedLatticeProofs.LargeGapAllMembers (47s)
⚠ [116283/116554] Built Development.AbelianVarietyTheory.Proofs.DecoratedLatticeProofs.PeriodSingle (52s)
⚠ [116284/116554] Replayed Formalism.LocalToGlobal.Columns.TwQDense
⚠ [116285/116554] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.TransporterMovesAllFramesOfDenseOpen (33s)
⚠ [116286/116554] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.ExplicitFieldOfThetaHypothesesStatement (64s)
⚠ [116287/116554] Replayed Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.RayClassLFunctionLogDerivLocalFormulaStatement
⚠ [116288/116554] Replayed Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.ExistsRayClassLFunctionRealZeroFarFromOne
⚠ [116289/116554] Replayed Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.ExistsLFamRayStatement
✔ [116290/116554] Built Development.AbelianVarietyTheory.Proofs.DecoratedLatticeProofs.LevelCharacterMatchesWitness (49s)
⚠ [116291/116554] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.IsAlgebraicOfSmallInt (45s)
✔ [116292/116554] Built Development.AbelianVarietyTheory.Proofs.DecoratedLatticeProofs.TwistCharacterMatchesWitness (53s)
⚠ [116293/116554] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.ExistsAdelicFormEqRationalPhaseKernelSeries (48s)
⚠ [116294/116554] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.BottomTriangleIntegralsNeZero (47s)
✔ [116295/116554] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.LatticeIntersectionAtPlace (65s)
⚠ [116296/116554] Replayed Development.AbelianVarietyTheory.Proofs.IwasawaDecomposition.UfGLRatHom
```
