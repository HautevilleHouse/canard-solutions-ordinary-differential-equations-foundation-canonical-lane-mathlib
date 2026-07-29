import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure FastSlowDynamicsPackage where
  fastEquation : Type u → Prop
  slowEquation : Type v → Prop
  slowVariableParameter : Type v
  fastSlowCoupling : Prop
  singularPerturbationParameter : ℝ
  singularLimitDefined : Prop
  fastSubsystemLayer : Prop
  slowSubsystemLayer : Prop

structure FastSlowDynamicsEvidence (D : FastSlowDynamicsPackage) where
  fastSlowCouplingClosed : D.fastSlowCoupling
  singularLimitDefinedClosed : D.singularLimitDefined
  fastSubsystemLayerClosed : D.fastSubsystemLayer
  slowSubsystemLayerClosed : D.slowSubsystemLayer

def FastSlowDynamicsClosed (D : FastSlowDynamicsPackage) : Prop :=
  D.fastSlowCoupling ∧ D.singularLimitDefined ∧
  D.fastSubsystemLayer ∧ D.slowSubsystemLayer

theorem fast_slow_dynamics_closed_from_evidence (D : FastSlowDynamicsPackage)
    (E : FastSlowDynamicsEvidence D) : FastSlowDynamicsClosed D := by
  exact And.intro E.fastSlowCouplingClosed
    (And.intro E.singularLimitDefinedClosed
      (And.intro E.fastSubsystemLayerClosed E.slowSubsystemLayerClosed))

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse
