import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure FenichelNormalFormPackage where
  slowManifoldPerturbed : Prop
  invariantManifoldExists : Prop
  normallyHyperbolic : Prop
  foliationStable : Prop
  centerManifoldReduction : Prop

structure FenichelNormalFormEvidence (F : FenichelNormalFormPackage) where
  slowManifoldPerturbedClosed : F.slowManifoldPerturbed
  invariantManifoldExistsClosed : F.invariantManifoldExists
  normallyHyperbolicClosed : F.normallyHyperbolic
  foliationStableClosed : F.foliationStable
  centerManifoldReductionClosed : F.centerManifoldReduction

def FenichelNormalFormClosed (F : FenichelNormalFormPackage) : Prop :=
  F.slowManifoldPerturbed ∧ F.invariantManifoldExists ∧ F.normallyHyperbolic ∧
  F.foliationStable ∧ F.centerManifoldReduction

theorem fenichel_normal_form_closed_from_evidence (F : FenichelNormalFormPackage)
    (E : FenichelNormalFormEvidence F) : FenichelNormalFormClosed F := by
  exact And.intro E.slowManifoldPerturbedClosed (And.intro E.invariantManifoldExistsClosed
    (And.intro E.normallyHyperbolicClosed (And.intro E.foliationStableClosed
      E.centerManifoldReductionClosed)))

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse