import canonicalLaneMathlib.AdmissibleClass

/-!
# Canard Solution ODE Package
-/

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure CanardSolutionODEPackage where
  slowManifold : Type u
  fastManifold : Type v
  slowVariable : slowManifold → ℝ
  fastVariable : fastManifold → ℝ
  criticalManifold : Prop
  foldPointDetected : Prop
  canardTrajectoryExists : Prop
  persistenceUnderParameterVariation : Prop

structure CanardSolutionODEEvidence (C : CanardSolutionODEPackage) where
  criticalManifoldClosed : C.criticalManifold
  foldPointDetectedClosed : C.foldPointDetected
  canardTrajectoryExistsClosed : C.canardTrajectoryExists
  persistenceUnderParameterVariationClosed : C.persistenceUnderParameterVariation

def CanardSolutionODEClosed (C : CanardSolutionODEPackage) : Prop :=
  C.criticalManifold ∧ C.foldPointDetected ∧ C.canardTrajectoryExists ∧ C.persistenceUnderParameterVariation

theorem canard_solution_ode_closed_from_evidence (C : CanardSolutionODEPackage)
    (E : CanardSolutionODEEvidence C) : CanardSolutionODEClosed C := by
  exact And.intro E.criticalManifoldClosed
    (And.intro E.foldPointDetectedClosed
      (And.intro E.canardTrajectoryExistsClosed E.persistenceUnderParameterVariationClosed))

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse
