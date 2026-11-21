# Build status

Auto-generated from the build server. Last refresh: 2026-11-21 20:52 UTC.

```
pass 2 (log build2.log)
START 2026-11-21T17:32:32+00:00
ENV LD_PRELOAD=/home/ubuntu/rh-alpoge/tools/nommap/no_fixed_file_mmap.so NOMMAP_THRESHOLD=40000 LEAN_NUM_THREADS=32
pass1 EXIT 1 2026-11-21T17:31:57+00:00
pass1 AXCHECK_EXIT 1 2026-11-21T17:31:59+00:00
mem_used_GB 370
now 2026-11-21T20:52:44+00:00
load 34.99 34.58 34.70
```

## Progress

```
latest_job 182033/183903
built_ok 3074
built_with_warnings 102959
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
⚠ [182018/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.StrCalcO (45s)
✔ [182019/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.LocalTypeDictionary.ThetaFlipTensorMatch (62s)
⚠ [182020/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.LocalTypeDictionary.ExistsFinitePlaceThetaMatch (58s)
⚠ [182021/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.SideWChrStatement (32s)
⚠ [182022/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.NGalAut (69s)
⚠ [182023/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.SideWExportSmallStatement (33s)
⚠ [182024/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.IsobaricRigidOfPin (51s)
⚠ [182025/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.RaysOfRayRecStatement (32s)
⚠ [182026/183903] Replayed Development.AbelianVarietyTheory.Proofs.DivisorProofs.SummableAbsDetRationalPointsGodement
⚠ [182027/183903] Replayed Development.AbelianVarietyTheory.Proofs.DivisorProofs.NormOneAdelicGLLocallyCompactDiscreteFiniteCovolStatement
⚠ [182028/183903] Replayed Development.AutomorphicSpectrum.Proofs.BlockDecomposition.SplitPlaceRankCutOfAlternativeStatement
⚠ [182029/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.LocalTypeDictionary.TwistedMultiplicityOne (32s)
⚠ [182031/183903] Replayed Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.ConclusionOfAdmissiblesStatement
⚠ [182032/183903] Replayed Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.PrvZrOfInputsRowsStatement
✔ [182033/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.ExistsNbcAuSide (54s)
```
