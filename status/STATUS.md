# Build status

Auto-generated from the build server. Last refresh: 2026-11-21 17:38 UTC.

```
pass 2 (log build2.log)
START 2026-11-21T17:32:32+00:00
ENV LD_PRELOAD=/home/ubuntu/rh-alpoge/tools/nommap/no_fixed_file_mmap.so NOMMAP_THRESHOLD=40000 LEAN_NUM_THREADS=32
pass1 EXIT 1 2026-11-21T17:31:57+00:00
pass1 AXCHECK_EXIT 1 2026-11-21T17:31:59+00:00
mem_used_GB 307
now 2026-11-21T17:38:50+00:00
load 33.43 30.85 79.76
```

## Progress

```
latest_job 106275/107086
built_ok 83
built_with_warnings 55143
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
⚠ [106258/107086] Replayed Development.AbelianVarietyTheory.Proofs.DivisorProofs.ToricRatioFieldDataConjugate
⚠ [106259/107086] Replayed Development.AbelianVarietyTheory.Proofs.DivisorProofs.ToricRatioFieldDataAbelianStatement
⚠ [106260/107086] Replayed Development.AbelianVarietyTheory.Proofs.DivisorProofs.TwistedThetaValueValuationLeDivSqStatement
⚠ [106261/107086] Replayed Development.AbelianVarietyTheory.Proofs.FoundationProofs.ConjugateJetBoundVacuumTorsionTranslateStatement
⚠ [106262/107086] Replayed Development.AbelianVarietyTheory.Proofs.FoundationProofs.VacuumUnderAdelicPairUnitModulusFactorStatement
⚠ [106263/107086] Replayed Development.AbelianVarietyTheory.Proofs.DivisorProofs.SquareBottomPairsSmallReferenceTupleStatement
⚠ [106264/107086] Replayed Development.AbelianVarietyTheory.Proofs.DivisorProofs.RamifiedSumsFifthEstimateStatement
⚠ [106265/107086] Replayed Development.AbelianVarietyTheory.Proofs.DivisorProofs.FieldDataExistenceOfSumsStatement
⚠ [106268/107086] Replayed Development.AbelianVarietyTheory.Proofs.DivisorProofs.ThetaEV0EqICPqRowsStatement
⚠ [106269/107086] Replayed Development.AbelianVarietyTheory.Proofs.FoundationProofs.NegRankMulLogLeLogCovolumeHermitianStatement
⚠ [106270/107086] Replayed Development.AbelianVarietyTheory.Proofs.FoundationProofs.FockNormExtremalVectorEqBoundedNatStatement
⚠ [106271/107086] Replayed Development.AbelianVarietyTheory.Proofs.FoundationProofs.ExtNormMulWeylPairingIntegralSelfDualStatement
⚠ [106272/107086] Replayed Development.AbelianVarietyTheory.Proofs.FoundationProofs.OrthogonalSumCoefficientLatticeIsLatticeAndDualStatement
⚠ [106273/107086] Replayed Development.AbelianVarietyTheory.Proofs.FoundationProofs.DefGramSelfDualAfterFieldEmbeddingStatement
⚠ [106275/107086] Built Development.AutomorphicArithmetic.LocalEmbeddings.RootInCore (58s)
```
