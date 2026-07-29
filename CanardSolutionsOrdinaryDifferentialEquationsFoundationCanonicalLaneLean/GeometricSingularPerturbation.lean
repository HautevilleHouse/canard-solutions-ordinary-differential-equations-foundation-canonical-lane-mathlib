import canonicalLaneMathlib.AdmissibleClass

/-!
# Geometric Singular Perturbation Package
-/

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure GeometricSingularPerturbationPackage
    (D : FastSlowDynamicsPackage) where
  normallyHyperbolicCriticalManifold : Prop
  stableFiber : Prop
  unstableFiber : Prop
  centerFiber : Prop
  fastDynamics : Prop
  slowDynamics : Prop
  adiabaticInvariant : Prop
  adiabaticInvariantProof : adiabaticInvariant

structure GeometricSingularPerturbationEvidence
    {D : FastSlowDynamicsPackage}
    (G : GeometricSingularPerturbationPackage D) where
  normallyHyperbolicCriticalManifoldClosed : G.normallyHyperbolicCriticalManifold
  stableFiberClosed : G.stableFiber
  unstableFiberClosed : G.unstableFiber
  centerFiberClosed : G.centerFiber
  fastDynamicsClosed : G.fastDynamics
  slowDynamicsClosed : G.slowDynamics
  adiabaticInvariantClosed : G.adiabaticInvariant

def GeometricSingularPerturbationClosed
    {D : FastSlowDynamicsPackage}
    (G : GeometricSingularPerturbationPackage D) : Prop :=
  G.normallyHyperbolicCriticalManifold ∧ G.stableFiber ∧ G.unstableFiber ∧
  G.centerFiber ∧ G.fastDynamics ∧ G.slowDynamics ∧ G.adiabaticInvariant

theorem geometric_singular_perturbation_closed_from_evidence
    {D : FastSlowDynamicsPackage}
    (G : GeometricSingularPerturbationPackage D)
    (E : GeometricSingularPerturbationEvidence G) :
    GeometricSingularPerturbationClosed G := by
  exact And.intro E.normallyHyperbolicCriticalManifoldClosed
    (And.intro E.stableFiberClosed
      (And.intro E.unstableFiberClosed
        (And.intro E.centerFiberClosed
          (And.intro E.fastDynamicsClosed
            (And.intro E.slowDynamicsClosed
              E.adiabaticInvariantClosed)))))

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse
