# Build status

Auto-generated from the build server. Last refresh: 2026-11-21 20:22 UTC.

```
pass 2 (log build2.log)
START 2026-11-21T17:32:32+00:00
ENV LD_PRELOAD=/home/ubuntu/rh-alpoge/tools/nommap/no_fixed_file_mmap.so NOMMAP_THRESHOLD=40000 LEAN_NUM_THREADS=32
pass1 EXIT 1 2026-11-21T17:31:57+00:00
pass1 AXCHECK_EXIT 1 2026-11-21T17:31:59+00:00
mem_used_GB 361
now 2026-11-21T20:22:11+00:00
load 34.47 34.45 34.52
```

## Progress

```
latest_job 169924/172092
built_ok 2606
built_with_warnings 95685
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
⚠ [169910/172092] Built Development.AutomorphicArithmetic.Foundations.IwahoriReduction.NormProducts.AdmissibleWeightedDataMonoCoef (56s)
⚠ [169911/172092] Built Development.AutomorphicArithmetic.Foundations.Convolution.SphericalIdeles.QuadLiftOf (59s)
✔ [169912/172092] Built Development.AutomorphicArithmetic.Foundations.Convolution.RealGroupAnalysis.QuadBC2 (53s)
✔ [169913/172092] Built Development.AutomorphicArithmetic.Foundations.GaloisRepresentations.RegularSemisimpleFibres.PowerMatchingTraces.VarTraceHolds (59s)
✔ [169914/172092] Built Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.KatoQuadraticCharacters.FrobeniusHodgeTateLaws.KatoGlobalUnitLawOfSmoothedClasses (52s)
⚠ [169915/172092] Built Development.AutomorphicArithmetic.Foundations.GaloisRepresentations.IntegralStructures.CrystallineDescent.JoinEndHolds (54s)
⚠ [169916/172092] Built Development.AutomorphicArithmetic.Foundations.GaloisRepresentations.IntegralStructures.CrystallineDescent.JoinAll (52s)
⚠ [169917/172092] Built Development.AbelianVarietyTheory.Proofs.SatakeParameters.IsSemistableAtPlaceTwistCrystallineCharacterStatement (49s)
✔ [169918/172092] Built Development.AutomorphicArithmetic.Foundations.GaloisRepresentations.InertiaQuadraticRamification.MainUnr (50s)
✔ [169919/172092] Built Development.AutomorphicArithmetic.Foundations.BaseChangeIdentities.BaseChangeNB (67s)
✔ [169920/172092] Built Development.AutomorphicArithmetic.Foundations.GaloisRepresentations.CharpolyFromTrace.GoodLiftAlt (53s)
✔ [169921/172092] Built Development.AutomorphicArithmetic.Foundations.GaloisRepresentations.IntegralStructures.CrystallineDescent.BadFinite (58s)
⚠ [169922/172092] Built Development.AutomorphicArithmetic.Foundations.GaloisRepresentations.IntegralStructures.CrystallineDescent.ExistsQuadraticCMExtSplitAt (60s)
⚠ [169923/172092] Built Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.CuspidalDescent.GLDenseRanges.InertiaPartMaps.IrrOfComp (136s)
✔ [169924/172092] Built Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.LocPublished (59s)
```
