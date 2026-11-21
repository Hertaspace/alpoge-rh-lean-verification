# Build status

Auto-generated from the build server. Last refresh: 2026-11-21 19:41 UTC.

```
pass 2 (log build2.log)
START 2026-11-21T17:32:32+00:00
ENV LD_PRELOAD=/home/ubuntu/rh-alpoge/tools/nommap/no_fixed_file_mmap.so NOMMAP_THRESHOLD=40000 LEAN_NUM_THREADS=32
pass1 EXIT 1 2026-11-21T17:31:57+00:00
pass1 AXCHECK_EXIT 1 2026-11-21T17:31:59+00:00
mem_used_GB 389
now 2026-11-21T19:41:25+00:00
load 35.49 34.84 34.51
```

## Progress

```
latest_job 162989/163408
built_ok 1933
built_with_warnings 91801
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
⚠ [162975/163408] Built Development.AutomorphicArithmetic.Foundations.Convolution.RealGroupAnalysis.WeilRepresentation.One (51s)
✔ [162976/163408] Built Development.AutomorphicArithmetic.Foundations.IwahoriReduction.NormProducts.LUnH (47s)
✔ [162977/163408] Built Development.AbelianVarietyTheory.Definitions.Foundations.AdmissibleHodgeTateZetaClassParams (47s)
⚠ [162978/163408] Built Development.AbelianVarietyTheory.Proofs.FoundationProofs.ShCocWsumProps (48s)
⚠ [162979/163408] Built Development.AbelianVarietyTheory.Definitions.Foundations.AdmissibleNewformZetaData (47s)
✔ [162980/163408] Built Development.AbelianVarietyTheory.Proofs.FoundationProofs.ZetaSystemExponentRaiseOfPrimePowSmul (49s)
⚠ [162981/163408] Built Development.AbelianVarietyTheory.Proofs.FoundationProofs.CohomologyUnramifiedLiftStatement (47s)
⚠ [162982/163408] Built Development.AutomorphicArithmetic.AutomorphicVarieties.EisensteinModularTowers.RepMApplyZtEqPowRedTop (48s)
✔ [162983/163408] Built Development.AutomorphicArithmetic.AutomorphicVarieties.EisensteinModularTowers.InZlClosedAddMulAndCyclotomicGaloisStable (48s)
✔ [162984/163408] Built Development.AutomorphicArithmetic.AutomorphicVarieties.EisensteinModularTowers.TwistedEisensteinPieceTrivialCharacterEq (49s)
✔ [162985/163408] Built Development.AutomorphicArithmetic.AutomorphicVarieties.EisensteinModularTowers.CongruenceActionInvariant (49s)
✔ [162986/163408] Built Development.AutomorphicArithmetic.AutomorphicVarieties.EisensteinModularTowers.SumLevelSubgroupModEqSmulSumReps (48s)
⚠ [162987/163408] Built Development.AutomorphicArithmetic.AutomorphicVarieties.EisensteinModularTowers.CardFiberReductionEqTotient (50s)
✔ [162988/163408] Built Development.AutomorphicArithmetic.AutomorphicVarieties.EisensteinModularTowers.SmoothedEisensteinRootPow (53s)
✔ [162989/163408] Built Development.AutomorphicArithmetic.AutomorphicVarieties.EisensteinModularTowers.SmoothedEisensteinCoeffShiftSecondIndex (53s)
```
