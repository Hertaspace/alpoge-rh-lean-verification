# Build status

Auto-generated from the build server. Last refresh: 2026-11-21 19:00 UTC.

```
pass 2 (log build2.log)
START 2026-11-21T17:32:32+00:00
ENV LD_PRELOAD=/home/ubuntu/rh-alpoge/tools/nommap/no_fixed_file_mmap.so NOMMAP_THRESHOLD=40000 LEAN_NUM_THREADS=32
pass1 EXIT 1 2026-11-21T17:31:57+00:00
pass1 AXCHECK_EXIT 1 2026-11-21T17:31:59+00:00
mem_used_GB 270
now 2026-11-21T19:00:29+00:00
load 34.72 34.57 34.89
```

## Progress

```
latest_job 156032/156666
built_ok 1305
built_with_warnings 87714
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
⚠ [156016/156666] Replayed Development.AutomorphicArithmetic.IntegralCasts.CapelliIdentities.PtLt
✔ [156017/156666] Built Development.AutomorphicArithmetic.AutomorphicVarieties.HeckeAlgebras.OrdinaryHeckeCharacters.PartUR2MemSpan (54s)
⚠ [156018/156666] Replayed Development.AutomorphicArithmetic.IntegralCasts.CapelliIdentities.HeckeMap
⚠ [156022/156666] Built Development.AutomorphicArithmetic.AutomorphicVarieties.HeckeAlgebras.OrdinaryHeckeCharacters.SatTUnif (50s)
✔ [156023/156666] Built Development.AutomorphicArithmetic.AutomorphicVarieties.BuildingsResidueChars.MemMaximalCompactOfUnderEq (51s)
⚠ [156024/156666] Replayed Development.AutomorphicArithmetic.IntegralCasts.CapelliIdentities.ExistsFun
✔ [156025/156666] Built Development.AutomorphicArithmetic.AutomorphicVarieties.BuildingsResidueChars.UnderChosenPlaceAndIsSplitAtOfDecompLe (52s)
✔ [156026/156666] Built Development.AbelianVarietyTheory.Proofs.DivisorProofs.CuspValueLePhiComplement (72s)
⚠ [156027/156666] Built Development.AutomorphicArithmetic.AutomorphicVarieties.HeckeAlgebras.OrdinaryHeckeCharacters.EqOfTwist (62s)
✔ [156028/156666] Built Development.AutomorphicArithmetic.AutomorphicVarieties.BuildingsResidueChars.InjectiveInfinitePlaceOfEmbAtSplitPlaces (51s)
✔ [156029/156666] Built Development.AutomorphicArithmetic.AutomorphicVarieties.BuildingsResidueChars.IsSplitAtOfUnramifiedOfInertiaDegEqOne (49s)
⚠ [156030/156666] Built Development.AutomorphicArithmetic.AutomorphicVarieties.HeckeAlgebras.OrdinaryHeckeCharacters.PlaceBetween (65s)
✔ [156031/156666] Built Development.AutomorphicArithmetic.AutomorphicVarieties.BuildingsResidueChars.GaloisRepDirectSumAwayFromPlaces (50s)
✔ [156032/156666] Built Development.AutomorphicArithmetic.AutomorphicVarieties.BuildingsResidueChars.SumHodgeTate (48s)
✔ [156034/156666] Built Development.AutomorphicArithmetic.AutomorphicVarieties.BuildingsResidueChars.FiniteSumReduction (46s)
```
