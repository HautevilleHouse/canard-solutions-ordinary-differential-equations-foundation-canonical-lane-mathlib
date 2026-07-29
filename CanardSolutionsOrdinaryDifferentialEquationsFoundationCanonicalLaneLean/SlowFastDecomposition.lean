import canonicalLaneMathlib.AdmissibleClass

/-!
# Slow-Fast Decomposition Package for Canard Solutions
-/

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure SlowFastDecompositionPackage where
  slowSubsystem : Type u
  fastSubsystem : Type v
  slowFastTimescaleSeparation : Prop
  slowManifoldPerturbation : Prop
  fastLayerStability : Prop
  slowFastInteraction : Prop

structure SlowFastDecompositionEvidence (D : SlowFastDecompositionPackage) where
  slowFastTimescaleSeparationClosed : D.slowFastTimescaleSeparation
  slowManifoldPerturbationClosed : D.slowManifoldPerturbation
  fastLayerStabilityClosed : D.fastLayerStability
  slowFastInteractionClosed : D.slowFastInteraction

def SlowFastDecompositionClosed (D : SlowFastDecompositionPackage) : Prop :=
  D.slowFastTimescaleSeparation ∧ D.slowManifoldPerturbation ∧
  D.fastLayerStability ∧ D.slowFastInteraction

theorem slow_fast_decomposition_closed_from_evidence (D : SlowFastDecompositionPackage)
    (E : SlowFastDecompositionEvidence D) : SlowFastDecompositionClosed D := by
  exact And.intro E.slowFastTimescaleSeparationClosed
    (And.intro E.slowManifoldPerturbationClosed
      (And.intro E.fastLayerStabilityClosed E.slowFastInteractionClosed))

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse
