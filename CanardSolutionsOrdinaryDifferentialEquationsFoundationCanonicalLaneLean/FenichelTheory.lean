import canonicalLaneMathlib.AdmissibleClass
import CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean.AdmissibleClass
import CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean.SlowFastSystem

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure FenichelPackage {S : SlowFastSystemPackage} where
  normalHyperbolicity : Prop
  centerManifoldExistence : Prop
  invariantManifold : Prop
  slowApproximation : Prop

structure FenichelEvidence {S : SlowFastSystemPackage} (F : FenichelPackage S) where
  normalHyperbolicityClosed : F.normalHyperbolicity
  centerManifoldExistenceClosed : F.centerManifoldExistence
  invariantManifoldClosed : F.invariantManifold
  slowApproximationClosed : F.slowApproximation

def FenichelClosed {S : SlowFastSystemPackage} (F : FenichelPackage S) : Prop :=
  F.normalHyperbolicity ∧ F.centerManifoldExistence ∧
  F.invariantManifold ∧ F.slowApproximation

theorem fenichel_closed_from_evidence {S : SlowFastSystemPackage}
    (F : FenichelPackage S) (E : FenichelEvidence F) : FenichelClosed F := by
  exact And.intro E.normalHyperbolicityClosed
    (And.intro E.centerManifoldExistenceClosed
      (And.intro E.invariantManifoldClosed E.slowApproximationClosed))

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse