import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure CanardSolutionPackage where
  fastTimeScale : Type u
  slowTimeScale : Type v
  fastVariable : fastTimeScale → Type w
  slowVariable : slowTimeScale → Type x
  systemODEs : (fastTimeScale → slowTimeScale → Prop) → Prop
  slowManifoldCondition : Prop
  criticalManifoldDefined : Prop
  canardCondition : Prop
  canardTime : fastTimeScale
  maximalCanardInterval : Prop

structure CanardSolutionEvidence (C : CanardSolutionPackage) where
  slowManifoldConditionClosed : C.slowManifoldCondition
  criticalManifoldDefinedClosed : C.criticalManifoldDefined
  canardConditionClosed : C.canardCondition
  maximalCanardIntervalClosed : C.maximalCanardInterval

def CanardSolutionClosed (C : CanardSolutionPackage) : Prop :=
  C.slowManifoldCondition ∧ C.criticalManifoldDefined ∧
  C.canardCondition ∧ C.maximalCanardInterval

theorem canard_solution_closed_from_evidence (C : CanardSolutionPackage)
    (E : CanardSolutionEvidence C) : CanardSolutionClosed C := by
  exact And.intro E.slowManifoldConditionClosed
    (And.intro E.criticalManifoldDefinedClosed
      (And.intro E.canardConditionClosed E.maximalCanardIntervalClosed))

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse
