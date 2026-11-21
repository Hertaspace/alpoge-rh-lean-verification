# Build status

Auto-generated from the build server. Last refresh: 2026-11-21 19:31 UTC.

```
pass 2 (log build2.log)
START 2026-11-21T17:32:32+00:00
ENV LD_PRELOAD=/home/ubuntu/rh-alpoge/tools/nommap/no_fixed_file_mmap.so NOMMAP_THRESHOLD=40000 LEAN_NUM_THREADS=32
pass1 EXIT 1 2026-11-21T17:31:57+00:00
pass1 AXCHECK_EXIT 1 2026-11-21T17:31:59+00:00
mem_used_GB 374
now 2026-11-21T19:31:15+00:00
load 33.48 33.99 34.38
```

## Progress

```
latest_job 160558/162062
built_ok 1771
built_with_warnings 90204
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
⚠ [160524/162062] Replayed Development.AutomorphicArithmetic.Foundations.Convolution.RealGroupAnalysis.GaussianForms.EtaQuad
⚠ [160526/162062] Replayed Development.AutomorphicArithmetic.Foundations.Convolution.RealGroupAnalysis.GaussianForms.ChirpInf
⚠ [160527/162062] Replayed Development.AutomorphicArithmetic.Foundations.Convolution.RealGroupAnalysis.GaussianForms.FtBasic
⚠ [160535/162062] Replayed Development.AutomorphicArithmetic.Foundations.Convolution.RealGroupAnalysis.GaussianForms.LamReal
⚠ [160537/162062] Replayed Development.AutomorphicArithmetic.Foundations.Convolution.RealGroupAnalysis.GaussianForms.ResBig
⚠ [160540/162062] Replayed Development.AutomorphicArithmetic.Foundations.Convolution.RealGroupAnalysis.GaussianForms.TorusEq
⚠ [160541/162062] Replayed Development.AutomorphicArithmetic.Foundations.Convolution.RealGroupAnalysis.GaussianForms.NLevel
⚠ [160542/162062] Replayed Development.AutomorphicArithmetic.Foundations.Convolution.RealGroupAnalysis.GaussianForms.ContinuousFiniteAdeleEmbed
⚠ [160546/162062] Replayed Development.AutomorphicArithmetic.Foundations.Convolution.RealGroupAnalysis.ThetaReindexing.ActRat
⚠ [160547/162062] Replayed Development.AutomorphicArithmetic.Foundations.Convolution.RealGroupAnalysis.ThetaBounds.FderivOfExp
⚠ [160553/162062] Replayed Development.AutomorphicArithmetic.Foundations.Convolution.RealGroupAnalysis.FockOperators.CoeffB
⚠ [160554/162062] Replayed Development.AutomorphicArithmetic.Foundations.Convolution.RealGroupAnalysis.FockOperators.ActFin
⚠ [160556/162062] Replayed Development.AutomorphicArithmetic.Foundations.Convolution.RealGroupAnalysis.ThetaBounds.WtLeOfNorm
⚠ [160558/162062] Replayed GroundTheory.HeightsAndTheta.Theta.Weil.PartialFourierSchwartz
⚠ [160559/162062] Built Development.AbelianVarietyTheory.Proofs.FoundationProofs.NormIntCastLeOfDvd (48s)
```
