# Build status

Auto-generated from the build server. Last refresh: 2026-11-21 17:49 UTC.

```
pass 2 (log build2.log)
START 2026-11-21T17:32:32+00:00
ENV LD_PRELOAD=/home/ubuntu/rh-alpoge/tools/nommap/no_fixed_file_mmap.so NOMMAP_THRESHOLD=40000 LEAN_NUM_THREADS=32
pass1 EXIT 1 2026-11-21T17:31:57+00:00
pass1 AXCHECK_EXIT 1 2026-11-21T17:31:59+00:00
mem_used_GB 295
now 2026-11-21T17:49:08+00:00
load 35.32 33.86 57.55
```

## Progress

```
latest_job 107584/107874
built_ok 263
built_with_warnings 55935
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
✔ [107569/107874] Built Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.BaseChangeUnits.QuadraticInductionGL2Alt (53s)
✔ [107570/107874] Built Development.AutomorphicArithmetic.AutomorphicVarieties.IdeleGenerators.ShortLatticeUnitarize.Unitarize (51s)
⚠ [107571/107874] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.HeckeLFunctionBottomPairStatement (45s)
⚠ [107572/107874] Built Development.AutomorphicArithmetic.AutomorphicVarieties.IdeleGenerators.HolomorphicIrreducibility.ExistsIdele (56s)
✔ [107573/107874] Built Development.AutomorphicArithmetic.AutomorphicVarieties.TheoremsMuLinked.FreeFlag (56s)
✔ [107575/107874] Built Development.AutomorphicArithmetic.AutomorphicVarieties.BuildingsResidueChars.SymmetricCubeIsomorphism (48s)
⚠ [107576/107874] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.IsOpenProductOfLocalLevelsUnitaryStatement (47s)
✔ [107577/107874] Built Development.AutomorphicArithmetic.AutomorphicVarieties.CurveDVRSpecialization.FrameCriterionGaloisEquivariance (49s)
✔ [107578/107874] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.BottomTriangleNonzeroConstantSecond (54s)
⚠ [107579/107874] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.BottomTriangleArchimedeanConstantStatement (34s)
⚠ [107580/107874] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.RigidBoundaryChartsForFanOfUnitarySeparationStatement (33s)
⚠ [107581/107874] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.VectorFormTensorRangeLeUnitaryAutFormsWeightLeve (54s)
✔ [107582/107874] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.SiegelToroidalCompactificationPolarisedCharts (38s)
✔ [107583/107874] Built Development.AutomorphicArithmetic.AutomorphicVarieties.CurveDVRSpecialization.ResidualOkOfLocalCharsRestrict (50s)
⚠ [107584/107874] Built Development.AutomorphicArithmetic.AutomorphicVarieties.CurveDVRSpecialization.FrameCriterionLambdaCharacters (50s)
```
