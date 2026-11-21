# Build status

Auto-generated from the build server. Last refresh: 2026-11-21 20:32 UTC.

```
pass 2 (log build2.log)
START 2026-11-21T17:32:32+00:00
ENV LD_PRELOAD=/home/ubuntu/rh-alpoge/tools/nommap/no_fixed_file_mmap.so NOMMAP_THRESHOLD=40000 LEAN_NUM_THREADS=32
pass1 EXIT 1 2026-11-21T17:31:57+00:00
pass1 AXCHECK_EXIT 1 2026-11-21T17:31:59+00:00
mem_used_GB 388
now 2026-11-21T20:32:22+00:00
load 33.45 34.05 34.33
```

## Progress

```
latest_job 176610/177315
built_ok 2761
built_with_warnings 99721
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
⚠ [176588/177315] Replayed Development.AutomorphicSpectrum.Proofs.BlockDecomposition.LocalGradedClassRepresentativeStatement
⚠ [176589/177315] Replayed Development.AutomorphicSpectrum.Proofs.BlockDecomposition.BasicOpenRsLe
⚠ [176591/177315] Replayed Development.AutomorphicSpectrum.Proofs.BlockDecomposition.GradedCechCohomologyFinite
⚠ [176594/177315] Replayed Development.WeilBound.CoreStatements.PadicHodgeComparison.EtaleCohomologyComparison.PerfectoidPullbacks.ConeSectionRestriction.TorusMemFldF
⚠ [176595/177315] Replayed Development.AutomorphicSpectrum.Proofs.BlockDecomposition.ExistsPderivNotDvd
⚠ [176598/177315] Replayed Development.AutomorphicSpectrum.Proofs.BlockDecomposition.ExistsTwistingLineDataProjectiveStatement
⚠ [176599/177315] Replayed Development.AutomorphicSpectrum.Proofs.BlockDecomposition.ScalarMultiplicationShiftsFiltrationStatement
⚠ [176600/177315] Replayed Development.AutomorphicSpectrum.Proofs.BlockDecomposition.GradedSplittingOverFieldStatement
⚠ [176602/177315] Replayed Development.AutomorphicSpectrum.Proofs.BlockDecomposition.QuotientFiltrationBijectiveOfCoverStatement
⚠ [176603/177315] Replayed Development.AutomorphicSpectrum.Proofs.BlockDecomposition.LiftPOfBounds
⚠ [176604/177315] Replayed Development.AutomorphicSpectrum.Proofs.BlockDecomposition.ChartTensorBaseCompatStatement
⚠ [176605/177315] Replayed Development.AutomorphicSpectrum.Proofs.BlockDecomposition.GradedSplittingTensorFiltrationStatement
⚠ [176606/177315] Replayed Development.AutomorphicSpectrum.Proofs.BlockDecomposition.GradedSplittingOverLatticeBaseStatement
⚠ [176609/177315] Replayed Development.WeilBound.CoreStatements.PadicHodgeComparison.EtaleCohomologyComparison.BocksteinBaseChange.AdicTorsionCup.HeqOfEqCast
⚠ [176610/177315] Replayed Development.WeilBound.CoreStatements.PadicHodgeComparison.EtaleCohomologyComparison.BocksteinBaseChange.AdicTorsionCup.PowMonoTors
```
