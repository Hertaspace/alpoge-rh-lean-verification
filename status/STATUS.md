# Build status

Auto-generated from the build server. Last refresh: 2026-11-21 19:10 UTC.

```
pass 2 (log build2.log)
START 2026-11-21T17:32:32+00:00
ENV LD_PRELOAD=/home/ubuntu/rh-alpoge/tools/nommap/no_fixed_file_mmap.so NOMMAP_THRESHOLD=40000 LEAN_NUM_THREADS=32
pass1 EXIT 1 2026-11-21T17:31:57+00:00
pass1 AXCHECK_EXIT 1 2026-11-21T17:31:59+00:00
mem_used_GB 326
now 2026-11-21T19:10:40+00:00
load 34.73 35.04 34.89
```

## Progress

```
latest_job 157586/158308
built_ok 1526
built_with_warnings 88443
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
✔ [157572/158306] Built PositivityTheory.AutomorphicForms.PublishedInputs.HilbertEisenstein.Imports (47s)
⚠ [157573/158306] Built PositivityTheory.AutomorphicForms.PublishedInputs.HilbertEisenstein.IdeleModuleSectionMul (50s)
⚠ [157574/158306] Built PositivityTheory.AutomorphicForms.PublishedInputs.HilbertEisenstein.ContinuousPInfCoord (51s)
✔ [157575/158306] Built PositivityTheory.AutomorphicForms.PublishedInputs.HilbertEisenstein.ImportsAlt (50s)
⚠ [157576/158306] Built Development.AutomorphicArithmetic.AutomorphicVarieties.GaussSumFiltrations.EvenPos (49s)
⚠ [157577/158306] Built PositivityTheory.AutomorphicForms.PublishedInputs.HilbertEisenstein.ExistsDecayBoundTwo (60s)
✔ [157578/158306] Built Development.AutomorphicArithmetic.AutomorphicVarieties.IdeleGenerators.NormCongruenceUnits.SeedIII (51s)
✔ [157579/158306] Built Development.AutomorphicArithmetic.AutomorphicVarieties.AutomorphicForms.TemperedLocalComponents.CongruenceNumberRankThree (56s)
⚠ [157580/158306] Replayed Development.AutomorphicArithmetic.AutomorphicVarieties.LiteratureResults.BorelHarmonicForms.ImportsVariant
⚠ [157581/158306] Built Development.AutomorphicArithmetic.AutomorphicVarieties.HeckeAlgebras.OrdinaryHeckeCharacters.ModuleStructureOfCommuting (57s)
⚠ [157582/158306] Replayed Development.AutomorphicArithmetic.AutomorphicVarieties.GaussSumFiltrations.ExistsRatDetPos
⚠ [157583/158308] Built PositivityTheory.AutomorphicForms.PublishedInputs.HilbertEisenstein.ContinuousPInfApply (58s)
✔ [157584/158308] Built Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.BaseChangeUnits.ComplexBaseChangeOfLiterature (52s)
✔ [157585/158308] Built Development.AutomorphicArithmetic.Foundations.Convolution.CentreSplitting.ParEx (50s)
✔ [157586/158308] Built Development.AutomorphicArithmetic.Foundations.Convolution.BlockHeckeSlices.CuspidalNormBounds.DatDatum (52s)
```
