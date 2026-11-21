-- Compiled-environment scan. Generated from scan_template.lean by run-scans.sh.
-- For every constant of a project module in the import closure of the imported modules, it checks
--   (a) whether the constant is itself an axiom,
--   (b) whether its own type or value mentions sorryAx directly,
--   (c) which axioms other than propext, Classical.choice and Quot.sound it depends on, transitively
--       (the same traversal as Lean.CollectAxioms, with a shared cache of constants already known clean).
import Lean
__IMPORTS__
open Lean Elab Command

def scanPrefixes : List String := [__PREFIXES__]

def isProjectModule (m : Name) : Bool := scanPrefixes.contains m.getRoot.toString

/-- The constants whose axioms a constant inherits, exactly as in `Lean.CollectAxioms.collect`. -/
def axiomDeps (ci : ConstantInfo) : Array Name :=
  match ci with
  | .axiomInfo _ => #[]
  | .defnInfo v => v.type.getUsedConstants ++ v.value.getUsedConstants
  | .thmInfo v => v.type.getUsedConstants ++ v.value.getUsedConstants
  | .opaqueInfo v => v.type.getUsedConstants ++ v.value.getUsedConstants
  | .quotInfo _ => #[]
  | .ctorInfo v => v.type.getUsedConstants
  | .recInfo v => v.type.getUsedConstants
  | .inductInfo v => v.type.getUsedConstants ++ v.ctors.toArray

def directUses (ci : ConstantInfo) : Array Name :=
  match ci with
  | .defnInfo v => v.type.getUsedConstants ++ v.value.getUsedConstants
  | .thmInfo v => v.type.getUsedConstants ++ v.value.getUsedConstants
  | .opaqueInfo v => v.type.getUsedConstants ++ v.value.getUsedConstants
  | _ => ci.type.getUsedConstants

set_option maxHeartbeats 0 in
elab "#rh_scan " out:str : command => do
  let env ← getEnv
  let std : Std.HashSet Name := Std.HashSet.ofList [``propext, ``Classical.choice, ``Quot.sound]
  let mods := env.header.moduleNames
  let mut clean : Std.HashSet Name := {}
  let mut nMods := 0
  let mut nConsts := 0
  let mut nThms := 0
  let mut projectAxioms : Array Name := #[]
  let mut directSorry : Array Name := #[]
  let mut bad : Array (Name × Array Name) := #[]
  let mut missing : Array Name := #[]
  for i in [0:mods.size] do
    let m := mods[i]!
    unless isProjectModule m do continue
    nMods := nMods + 1
    for c in env.header.moduleData[i]!.constNames do
      nConsts := nConsts + 1
      match env.find? c with
      | none => missing := missing.push c
      | some ci =>
        if ci matches .thmInfo _ then nThms := nThms + 1
        if ci matches .axiomInfo _ then projectAxioms := projectAxioms.push c
        if (directUses ci).contains ``sorryAx then directSorry := directSorry.push c
        if !clean.contains c then
          let mut visited : Std.HashSet Name := {}
          let mut stack : Array Name := #[c]
          let mut axs : Array Name := #[]
          while !stack.isEmpty do
            let n := stack.back!
            stack := stack.pop
            if visited.contains n || clean.contains n then continue
            visited := visited.insert n
            match env.find? n with
            | none => axs := axs.push n
            | some (.axiomInfo _) => if !std.contains n then axs := axs.push n
            | some ci2 => stack := stack ++ axiomDeps ci2
          if axs.isEmpty then
            clean := visited.fold (init := clean) fun s v => s.insert v
          else
            bad := bad.push (c, axs)
  let lines := bad.toList.map fun (c, axs) => s!"{c}\t{axs.toList}"
  IO.FS.writeFile out.getString <| String.intercalate "\n" (
    [s!"modules {nMods}", s!"constants {nConsts}", s!"theorems {nThms}",
     s!"project_axioms {projectAxioms.size} {projectAxioms.toList}",
     s!"direct_sorry {directSorry.size} {directSorry.toList.take 100}",
     s!"missing {missing.size} {missing.toList.take 100}",
     s!"nonstandard_axiom_dependents {bad.size}"] ++ lines) ++ "\n"
  logInfo m!"scanned {nConsts} constants ({nThms} theorems) from {nMods} project modules in the import closure; project axioms: {projectAxioms.size} {projectAxioms.toList.take 20}; constants mentioning sorryAx directly: {directSorry.size} {directSorry.toList.take 20}; constants depending on an axiom other than propext, Classical.choice, Quot.sound: {bad.size} {(bad.toList.take 20).map (·.1)}; full report in {out.getString}"

#rh_scan "__OUT__"
