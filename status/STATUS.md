# Build status

Auto-generated from the build server. Last refresh: 2026-11-21 21:53 UTC.

```
pass 2 (log build2.log)
START 2026-11-21T17:32:32+00:00
ENV LD_PRELOAD=/home/ubuntu/rh-alpoge/tools/nommap/no_fixed_file_mmap.so NOMMAP_THRESHOLD=40000 LEAN_NUM_THREADS=32
pass1 EXIT 1 2026-11-21T17:31:57+00:00
pass1 AXCHECK_EXIT 1 2026-11-21T17:31:59+00:00
mem_used_GB 70
now 2026-11-21T21:53:53+00:00
load 1.58 1.64 6.13
```

## Progress

```
latest_job 183898/183903
built_ok 3501
built_with_warnings 104045
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
✔ [183883/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.FamAllQOfAllTrue (56s)
✔ [183884/183903] Built Development.AutomorphicArithmetic.Foundations.GaloisRepresentations.IntegralStructures.RowSrc (87s)
⚠ [183885/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.FamAllQOfAllTrueStatement (59s)
⚠ [183886/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.MainTheoremFromPublishedResultsAltAltAltAlt (59s)
⚠ [183887/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.MainTheoremFromPublishedResultsAltAltAltAltAlt (61s)
✔ [183888/183903] Built Development.AutomorphicArithmetic.AutomorphicVarieties.SmallClassNumbers.CorGKOf (200s)
⚠ [183889/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.MainTheoremPublishedResultsFinal (64s)
⚠ [183890/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.MainTheoremPublishedInputsVariant (63s)
⚠ [183891/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.MainTheoremPublishedInputsThird (72s)
⚠ [183892/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.OpenOrbitOfUnramifiedExponents (82s)
✔ [183893/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.HypothesesNonemptyOfUnramifiedExponents (114s)
✔ [183894/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.SiegelEisensteinSecondTermHypotheses (147s)
⚠ [183895/183903] Built Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.EveryCharacterOfLiteratureOfVWin (188s)
✔ [183896/183903] Built Development.AutomorphicArithmetic.CharacterBoxes.MainConclusion (204s)
✔ [183898/183903] Built Supplements.Kernels.MainTheorems (210s)
```
