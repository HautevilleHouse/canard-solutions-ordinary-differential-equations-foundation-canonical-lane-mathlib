import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure CanardCriticalManifoldPackage where
  slowManifold : Type u
  fastManifold : Type v
  criticalManifold : Prop
  slowManifoldSmooth : Prop
  fastManifoldSmooth : Prop
  criticalManifoldSmooth : Prop

structure CanardCriticalManifoldEvidence (C : CanardCriticalManifoldPackage) where
  criticalManifoldClosed : C.criticalManifold
  slowManifoldSmoothClosed : C.slowManifoldSmooth
  fastManifoldSmoothClosed : C.fastManifoldSmooth
  criticalManifoldSmoothClosed : C.criticalManifoldSmooth

def CanardCriticalManifoldClosed (C : CanardCriticalManifoldPackage) : Prop :=
  C.criticalManifold ∧ C.slowManifoldSmooth ∧ C.fastManifoldSmooth ∧ C.criticalManifoldSmooth

theorem canard_critical_manifold_closed_from_evidence (C : CanardCriticalManifoldPackage)
    (E : CanardCriticalManifoldEvidence C) : CanardCriticalManifoldClosed C := by
  exact And.intro E.criticalManifoldClosed (And.intro E.slowManifoldSmoothClosed
    (And.intro E.fastManifoldSmoothClosed E.criticalManifoldSmoothClosed))

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse