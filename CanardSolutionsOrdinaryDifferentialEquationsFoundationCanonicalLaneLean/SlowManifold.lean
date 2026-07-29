import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure SlowManifoldPackage where
  criticalManifoldExists : Prop
  normalHyperbolicity : Prop
  slowSubspaceDefined : Prop
  perturbationRegular : Prop

structure SlowManifoldEvidence (S : SlowManifoldPackage) where
  criticalManifoldExistsClosed : S.criticalManifoldExists
  normalHyperbolicityClosed : S.normalHyperbolicity
  slowSubspaceDefinedClosed : S.slowSubspaceDefined
  perturbationRegularClosed : S.perturbationRegular

def SlowManifoldClosed (S : SlowManifoldPackage) : Prop :=
  S.criticalManifoldExists ∧ S.normalHyperbolicity ∧
  S.slowSubspaceDefined ∧ S.perturbationRegular

theorem slow_manifold_closed_from_evidence (S : SlowManifoldPackage) (E : SlowManifoldEvidence S) :
    SlowManifoldClosed S := by
  exact And.intro E.criticalManifoldExistsClosed
    (And.intro E.normalHyperbolicityClosed
      (And.intro E.slowSubspaceDefinedClosed E.perturbationRegularClosed))

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse