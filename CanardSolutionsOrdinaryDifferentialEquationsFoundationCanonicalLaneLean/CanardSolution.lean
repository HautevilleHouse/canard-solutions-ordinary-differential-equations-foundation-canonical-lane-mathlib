import canonicalLaneMathlib.AdmissibleClass
import CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean.AdmissibleClass
import CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean.SlowFastSystem
import CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean.FenichelTheory

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure CanardSolutionPackage {S : SlowFastSystemPackage} {F : FenichelPackage S} where
  canardExistence : Prop
  canardTransition : Prop
  maximalDelay : Prop
  explosiveBifurcation : Prop

structure CanardSolutionEvidence {S : SlowFastSystemPackage} {F : FenichelPackage S}
    (C : CanardSolutionPackage S F) where
  canardExistenceClosed : C.canardExistence
  canardTransitionClosed : C.canardTransition
  maximalDelayClosed : C.maximalDelay
  explosiveBifurcationClosed : C.explosiveBifurcation

def CanardSolutionClosed {S : SlowFastSystemPackage} {F : FenichelPackage S}
    (C : CanardSolutionPackage S F) : Prop :=
  C.canardExistence ∧ C.canardTransition ∧
  C.maximalDelay ∧ C.explosiveBifurcation

theorem canard_solution_closed_from_evidence {S : SlowFastSystemPackage}
    {F : FenichelPackage S} (C : CanardSolutionPackage S F)
    (E : CanardSolutionEvidence C) : CanardSolutionClosed C := by
  exact And.intro E.canardExistenceClosed
    (And.intro E.canardTransitionClosed
      (And.intro E.maximalDelayClosed E.explosiveBifurcationClosed))

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse