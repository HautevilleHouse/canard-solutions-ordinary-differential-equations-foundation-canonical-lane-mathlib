import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure SingularPerturbationGeometricPackage where
  fastManifold : Type u
  slowManifold : Type v
  fastFibration : fastManifold → slowManifold → Prop
  slowManifoldFibration : slowManifold → Prop
  criticalManifold : Type w
  normalHyperbolicityCondition : Prop
  foldCondition : Prop
  canardConnection : fastManifold → (slowManifold → Prop) → Prop
  slowDynamicsOnCritical : Prop
  canardPoint : fastManifold
  canardSolution : Prop

structure SingularPerturbationGeometricEvidence (G : SingularPerturbationGeometricPackage) where
  normalHyperbolicityConditionClosed : G.normalHyperbolicityCondition
  foldConditionClosed : G.foldCondition
  canardConnectionClosed : ∀ (f : G.fastManifold), G.canardConnection f (fun s : G.slowManifold => True)
  slowDynamicsOnCriticalClosed : G.slowDynamicsOnCritical
  canardSolutionClosed : G.canardSolution

def SingularPerturbationGeometricClosed (G : SingularPerturbationGeometricPackage) : Prop :=
  G.normalHyperbolicityCondition ∧ G.foldCondition ∧
  (∀ (f : G.fastManifold), G.canardConnection f (fun s : G.slowManifold => True)) ∧
  G.slowDynamicsOnCritical ∧ G.canardSolution

theorem singular_perturbation_geometric_closed_from_evidence
    (G : SingularPerturbationGeometricPackage)
    (E : SingularPerturbationGeometricEvidence G) : SingularPerturbationGeometricClosed G := by
  exact And.intro E.normalHyperbolicityConditionClosed
    (And.intro E.foldConditionClosed
      (And.intro E.canardConnectionClosed
        (And.intro E.slowDynamicsOnCriticalClosed E.canardSolutionClosed)))

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse
