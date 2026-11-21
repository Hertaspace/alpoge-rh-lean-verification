# Build status

Auto-generated from the build server. Last refresh: 2026-11-21 18:09 UTC.

```
pass 2 (log build2.log)
START 2026-11-21T17:32:32+00:00
ENV LD_PRELOAD=/home/ubuntu/rh-alpoge/tools/nommap/no_fixed_file_mmap.so NOMMAP_THRESHOLD=40000 LEAN_NUM_THREADS=32
pass1 EXIT 1 2026-11-21T17:31:57+00:00
pass1 AXCHECK_EXIT 1 2026-11-21T17:31:59+00:00
mem_used_GB 309
now 2026-11-21T18:09:31+00:00
load 33.66 34.80 41.28
```

## Progress

```
latest_job 125902/126637
built_ok 593
built_with_warnings 67264
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
⚠ [125884/126637] Replayed Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.ExistsInertiaMulGaloisCompositum
⚠ [125886/126637] Replayed Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.InertPlaceLatticeIndexSumBound
⚠ [125887/126637] Replayed Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.InjectiveOfInnerEq
⚠ [125888/126637] Replayed Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.SpeiserDescentSpan
⚠ [125889/126637] Replayed Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.IsCrysOfCrystallinePeriodsLeSpan
✔ [125892/126637] Built Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.NonemptyExtensionEntries (46s)
⚠ [125893/126637] Built Development.AbelianVarietyTheory.Proofs.IwasawaDecomposition.KernelTaylorSeriesPreservedDivisionLatticeChangeStatement (36s)
⚠ [125894/126637] Replayed Development.AbelianVarietyTheory.Proofs.SatakeParameters.WeightCocharacterEqOfGoodPlaces
⚠ [125895/126637] Replayed Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.LocalGenerationThetaFunAtTypePrimeStatement
⚠ [125896/126637] Replayed Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.ParahoricSchwartzMemSpanDatumTranslatesStatement
⚠ [125897/126637] Replayed Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.UnitaryBasisGeneralLinearSeriesStatement
⚠ [125898/126637] Replayed Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.GoodTypesExcludeLevelCharacter
⚠ [125900/126637] Replayed Development.AbelianVarietyTheory.Proofs.SatakeParameters.TwoSidedHeckePartnerInertPrimeStatement
⚠ [125901/126637] Built Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.PeriodEntriesAtBuiltStatement (48s)
⚠ [125902/126637] Built Development.AbelianVarietyTheory.Proofs.IwasawaDecomposition.DivisionLocalDataPreservedDivisionLatticeChangeStatement (38s)
```
