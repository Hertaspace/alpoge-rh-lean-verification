# Build status

Auto-generated from the build server. Last refresh: 2026-11-21 18:29 UTC.

```
pass 2 (log build2.log)
START 2026-11-21T17:32:32+00:00
ENV LD_PRELOAD=/home/ubuntu/rh-alpoge/tools/nommap/no_fixed_file_mmap.so NOMMAP_THRESHOLD=40000 LEAN_NUM_THREADS=32
pass1 EXIT 1 2026-11-21T17:31:57+00:00
pass1 AXCHECK_EXIT 1 2026-11-21T17:31:59+00:00
mem_used_GB 283
now 2026-11-21T18:29:52+00:00
load 36.52 35.15 36.66
```

## Progress

```
latest_job 140438/140620
built_ok 884
built_with_warnings 76668
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
⚠ [140417/140610] Built Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.ExistsGaloisSide (52s)
✔ [140418/140610] Built Development.WeilBound.CoreStatements.VolumeEquality.VolEqOfIsFullIntersectionSystem (30s)
⚠ [140419/140610] Replayed Development.AutomorphicSpectrum.Proofs.MetricProofs.HeightBoundFullIntersectionSystem
⚠ [140420/140610] Replayed Development.AutomorphicSpectrum.Proofs.GeometryProofs.HodgeCompCoverCmSigns
⚠ [140421/140610] Replayed Development.AutomorphicSpectrum.Proofs.GeometryProofs.ModelDescentIntegralClosureStatement
⚠ [140422/140610] Replayed Development.AutomorphicSpectrum.Proofs.DivisibilityProofs.FlagM3FromLocal
✔ [140425/140615] Built Development.WeilBound.CoreStatements.MultihomogeneousSquares.AntisymmetryOfSingularStatement (31s)
⚠ [140426/140615] Replayed Development.AutomorphicSpectrum.Proofs.MetricProofs.HeightBoundFullIntersectionSystemStatement
⚠ [140427/140615] Replayed Development.AutomorphicSpectrum.Proofs.GeometryProofs.HodgeCompCoverCmSignsStatement
⚠ [140428/140615] Replayed Development.AutomorphicSpectrum.Proofs.DivisibilityProofs.FlagM3FromLocalStatement
⚠ [140430/140615] Built Development.AbelianVarietyTheory.Proofs.TwistedOperators.FourierJacobiDepthDatumMulLineVacuumIsVacuum (33s)
⚠ [140431/140615] Replayed Development.AutomorphicSpectrum.Proofs.GeometryProofs.IntersectionDegreeUpper
⚠ [140435/140618] Built Development.AbelianVarietyTheory.Proofs.IwasawaDecomposition.ExistsMemberOfConstructionStepsSecondPassStatement (44s)
⚠ [140436/140618] Replayed Development.AutomorphicSpectrum.Proofs.GeometryProofs.IntersectionDegreeUpperStatement
⚠ [140438/140620] Built Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.GoodFormsClassSumsOfProjectedLiftRangeStatement (44s)
```
