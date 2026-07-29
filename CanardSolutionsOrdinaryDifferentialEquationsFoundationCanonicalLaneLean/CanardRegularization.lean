import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure CanardRegularization (M : CanardPhaseSpace) (S : SlowFastSystem M) where
  regularizedSystem : SlowFastSystem M
  blowupTimeExtension : Prop
  trajectoryContinuation : Prop
  regularizationParameter : ℝ
  blowupTimeExtensionTerm : blowupTimeExtension
  trajectoryContinuationTerm : trajectoryContinuation

def CanardRegularizationClosed (R : CanardRegularization M S) : Prop :=
  R.blowupTimeExtension ∧ R.trajectoryContinuation

theorem canard_regularization_closed (R : CanardRegularization M S) :
    CanardRegularizationClosed R := by
  exact And.intro R.blowupTimeExtensionTerm R.trajectoryContinuationTerm

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse