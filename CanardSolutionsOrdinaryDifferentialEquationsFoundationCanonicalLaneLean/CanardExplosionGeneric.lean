import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure CanardExplosionGenericPackage where
  parameterSpace : Type u
  bifurcationParameter : ℝ
  explosionThreshold : ℝ
  genericFamily : ℝ → Type v
  canardDetonation : Prop
  maximalCanardLength : ℝ
  delayInBifurcation : Prop
  explosionPhenomenon : Prop
  genericCondition : Prop
  structuralStabilityMargin : ℝ

structure CanardExplosionGenericEvidence (E : CanardExplosionGenericPackage) where
  canardDetonationClosed : E.canardDetonation
  delayInBifurcationClosed : E.delayInBifurcation
  explosionPhenomenonClosed : E.explosionPhenomenon
  genericConditionClosed : E.genericCondition
  structuralStabilityMarginClosed : E.structuralStabilityMargin > 0

def CanardExplosionGenericClosed (E : CanardExplosionGenericPackage) : Prop :=
  E.canardDetonation ∧ E.delayInBifurcation ∧ E.explosionPhenomenon ∧
  E.genericCondition ∧ (E.structuralStabilityMargin > 0)

theorem canard_explosion_generic_closed_from_evidence
    (E : CanardExplosionGenericPackage)
    (Ev : CanardExplosionGenericEvidence E) : CanardExplosionGenericClosed E := by
  exact And.intro Ev.canardDetonationClosed
    (And.intro Ev.delayInBifurcationClosed
      (And.intro Ev.explosionPhenomenonClosed
        (And.intro Ev.genericConditionClosed Ev.structuralStabilityMarginClosed)))

end CanardsSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse
