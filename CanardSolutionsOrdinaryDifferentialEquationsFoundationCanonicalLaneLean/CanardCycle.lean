import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean.SlowManifold
import HautevilleHouse.CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean.FastSystems

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure CanardCyclePackage {S : SlowManifoldPackage} {F : FastSystemsPackage S} where
  canardSolutionExists : Prop
  maximalCanardIdentified : Prop
  bifurcationDelayComputed : Prop
  cycleClassificationComplete : Prop

structure CanardCycleEvidence {S : SlowManifoldPackage} {F : FastSystemsPackage S}
    (C : CanardCyclePackage F) where
  canardSolutionExistsClosed : C.canardSolutionExists
  maximalCanardIdentifiedClosed : C.maximalCanardIdentified
  bifurcationDelayComputedClosed : C.bifurcationDelayComputed
  cycleClassificationCompleteClosed : C.cycleClassificationComplete

def CanardCycleClosed {S : SlowManifoldPackage} {F : FastSystemsPackage S}
    (C : CanardCyclePackage F) : Prop :=
  C.canardSolutionExists ∧ C.maximalCanardIdentified ∧
  C.bifurcationDelayComputed ∧ C.cycleClassificationComplete

theorem canard_cycle_closed_from_evidence {S : SlowManifoldPackage} {F : FastSystemsPackage S}
    (C : CanardCyclePackage F) (E : CanardCycleEvidence C) : CanardCycleClosed C := by
  exact And.intro E.canardSolutionExistsClosed
    (And.intro E.maximalCanardIdentifiedClosed
      (And.intro E.bifurcationDelayComputedClosed E.cycleClassificationCompleteClosed))

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse