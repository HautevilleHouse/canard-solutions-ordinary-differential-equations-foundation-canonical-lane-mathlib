import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean.SlowManifold

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure FastSystemsPackage (S : SlowManifoldPackage) where
  fastSubsystemAnalysis : Prop
  layerProblemDefined : Prop
  desingularizationComputed : Prop
  blowupTechniqueApplied : Prop

structure FastSystemsEvidence {S : SlowManifoldPackage} (F : FastSystemsPackage S) where
  fastSubsystemAnalysisClosed : F.fastSubsystemAnalysis
  layerProblemDefinedClosed : F.layerProblemDefined
  desingularizationComputedClosed : F.desingularizationComputed
  blowupTechniqueAppliedClosed : F.blowupTechniqueApplied

def FastSystemsClosed {S : SlowManifoldPackage} (F : FastSystemsPackage S) : Prop :=
  F.fastSubsystemAnalysis ∧ F.layerProblemDefined ∧
  F.desingularizationComputed ∧ F.blowupTechniqueApplied

theorem fast_systems_closed_from_evidence {S : SlowManifoldPackage}
    (F : FastSystemsPackage S) (E : FastSystemsEvidence F) : FastSystemsClosed F := by
  exact And.intro E.fastSubsystemAnalysisClosed
    (And.intro E.layerProblemDefinedClosed
      (And.intro E.desingularizationComputedClosed E.blowupTechniqueAppliedClosed))

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse