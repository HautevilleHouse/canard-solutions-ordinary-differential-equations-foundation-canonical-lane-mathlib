import canonicalLaneMathlib.AdmissibleClass

/-!
# Asymptotic Expansion Package
-/

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure AsymptoticExpansionPackage
    {D : FastSlowDynamicsPackage}
    {G : GeometricSingularPerturbationPackage D}
    (C : CanardExistencePackage G) where
  outerExpansion : Prop
  innerExpansion : Prop
  matchingCondition : Prop
  asymptoticCanard : Prop
  canardRenormalization : Prop
  canardFormalExpansion : Prop
  asymptoticCanardProof : asymptoticCanard

structure AsymptoticExpansionEvidence
    {D : FastSlowDynamicsPackage}
    {G : GeometricSingularPerturbationPackage D}
    {C : CanardExistencePackage G}
    (A : AsymptoticExpansionPackage C) where
  outerExpansionClosed : A.outerExpansion
  innerExpansionClosed : A.innerExpansion
  matchingConditionClosed : A.matchingCondition
  asymptoticCanardClosed : A.asymptoticCanard
  canardRenormalizationClosed : A.canardRenormalization
  canardFormalExpansionClosed : A.canardFormalExpansion

def AsymptoticExpansionClosed
    {D : FastSlowDynamicsPackage}
    {G : GeometricSingularPerturbationPackage D}
    {C : CanardExistencePackage G}
    (A : AsymptoticExpansionPackage C) : Prop :=
  A.outerExpansion ∧ A.innerExpansion ∧ A.matchingCondition ∧
  A.asymptoticCanard ∧ A.canardRenormalization ∧ A.canardFormalExpansion

theorem asymptotic_expansion_closed_from_evidence
    {D : FastSlowDynamicsPackage}
    {G : GeometricSingularPerturbationPackage D}
    {C : CanardExistencePackage G}
    (A : AsymptoticExpansionPackage C) (E : AsymptoticExpansionEvidence A) :
    AsymptoticExpansionClosed A := by
  exact And.intro E.outerExpansionClosed
    (And.intro E.innerExpansionClosed
      (And.intro E.matchingConditionClosed
        (And.intro E.asymptoticCanardClosed
          (And.intro E.canardRenormalizationClosed
            E.canardFormalExpansionClosed))))

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse
