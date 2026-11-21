# Build status

Auto-generated from the build server. Last refresh: 2026-11-21 18:50 UTC.

```
pass 2 (log build2.log)
START 2026-11-21T17:32:32+00:00
ENV LD_PRELOAD=/home/ubuntu/rh-alpoge/tools/nommap/no_fixed_file_mmap.so NOMMAP_THRESHOLD=40000 LEAN_NUM_THREADS=32
pass1 EXIT 1 2026-11-21T17:31:57+00:00
pass1 AXCHECK_EXIT 1 2026-11-21T17:31:59+00:00
mem_used_GB 376
now 2026-11-21T18:50:19+00:00
load 36.65 34.93 35.33
```

## Progress

```
latest_job 153689/153872
built_ok 1135
built_with_warnings 86303
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
⚠ [153675/153868] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.ArchimedeanTermTendstoZero (39s)
⚠ [153676/153869] Built Development.AbelianVarietyTheory.Proofs.IwasawaDecomposition.FiniteLevelAndSecondStatement (61s)
⚠ [153677/153869] Replayed Development.AbelianVarietyTheory.Proofs.DivisorProofs.MatchedDiffsInvariantSubspace
⚠ [153678/153869] Replayed Development.AbelianVarietyTheory.Proofs.DivisorProofs.MatchedAdaptedPlaneVanishing
⚠ [153679/153869] Replayed Development.AbelianVarietyTheory.Proofs.DivisorProofs.ExistsNonzeroThetaLiftAnisotropicStatement
⚠ [153680/153869] Replayed Development.AbelianVarietyTheory.Proofs.DivisorProofs.ExistsNonzeroDualThetaLiftStatement
⚠ [153681/153869] Replayed Development.AbelianVarietyTheory.Proofs.DivisorProofs.ConfigAThetaGlobalFactorStatement
✔ [153682/153869] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.AntisymmetryFromPrismaticDieudonne (44s)
⚠ [153683/153871] Replayed Development.AbelianVarietyTheory.Proofs.DivisorProofs.MatchedDiffsInvariantSubspaceStatement
⚠ [153684/153871] Replayed Development.AbelianVarietyTheory.Proofs.DivisorProofs.DefiniteAdaptedPlaneThetaIdentity
⚠ [153685/153871] Replayed Development.AbelianVarietyTheory.Proofs.DivisorProofs.MatchedOrbitalIntegralAsymptoticBound
⚠ [153686/153871] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.NefInducedModelDominantWeight (45s)
⚠ [153688/153872] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.ArchimedeanTermFormulaStatement (32s)
⚠ [153689/153872] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.ArchimedeanValueLimitDegreeStatement (31s)
✔ [153690/153872] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.ReferenceWeightOfDeepGood (41s)
```
