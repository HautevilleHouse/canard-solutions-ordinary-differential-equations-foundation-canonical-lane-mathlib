import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure SlowFastDynamicsPackage where
  slowTimeScale : Prop
  fastTimeScale : Prop
  singularPerturbationParameter : ℝ
  slowDynamicsDefined : Prop
  fastDynamicsDefined : Prop
  couplingTermDefined : Prop

structure SlowFastDynamicsEvidence (S : SlowFastDynamicsPackage) where
  slowTimeScaleClosed : S.slowTimeScale
  fastTimeScaleClosed : S.fastTimeScale
  slowDynamicsDefinedClosed : S.slowDynamicsDefined
  fastDynamicsDefinedClosed : S.fastDynamicsDefined
  couplingTermDefinedClosed : S.couplingTermDefined

def SlowFastDynamicsClosed (S : SlowFastDynamicsPackage) : Prop :=
  S.slowTimeScale ∧ S.fastTimeScale ∧ S.slowDynamicsDefined ∧ S.fastDynamicsDefined ∧ S.couplingTermDefined

theorem slow_fast_dynamics_closed_from_evidence (S : SlowFastDynamicsPackage)
    (E : SlowFastDynamicsEvidence S) : SlowFastDynamicsClosed S := by
  exact And.intro E.slowTimeScaleClosed (And.intro E.fastTimeScaleClosed
    (And.intro E.slowDynamicsDefinedClosed (And.intro E.fastDynamicsDefinedClosed
      E.couplingTermDefinedClosed)))

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse