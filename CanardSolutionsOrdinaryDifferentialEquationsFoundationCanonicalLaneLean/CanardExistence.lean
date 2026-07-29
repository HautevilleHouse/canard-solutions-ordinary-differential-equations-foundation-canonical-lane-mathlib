import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure CanardExistencePackage {P : CanardPhaseSpace} {M : CriticalManifold P}
    (S : SlowFastSystem P) where
  singularOrbit : Type u
  slowSegment : Type v
  fastSegment : Type w
  crossingTime : ℝ
  canardSolution : Type x
  canardCondition : Prop
  canardConditionTerm : canardCondition
  singularOrbitDefined : Prop
  slowSegmentDefined : Prop
  fastSegmentDefined : Prop
  crossingTimeFinite : Prop
  canardSolutionSmooth : Prop
  singularOrbitDefinedTerm : singularOrbitDefined
  slowSegmentDefinedTerm : slowSegmentDefined
  fastSegmentDefinedTerm : fastSegmentDefined
  crossingTimeFiniteTerm : crossingTimeFinite
  canardSolutionSmoothTerm : canardSolutionSmooth

structure CanardExistenceEvidence {P : CanardPhaseSpace} {M : CriticalManifold P}
    {S : SlowFastSystem P} (C : CanardExistencePackage S) where
  canardConditionClosed : C.canardCondition
  singularOrbitDefinedClosed : C.singularOrbitDefined
  slowSegmentDefinedClosed : C.slowSegmentDefined
  fastSegmentDefinedClosed : C.fastSegmentDefined
  crossingTimeFiniteClosed : C.crossingTimeFinite
  canardSolutionSmoothClosed : C.canardSolutionSmooth

def CanardExistenceClosed {P : CanardPhaseSpace} {M : CriticalManifold P}
    {S : SlowFastSystem P} (C : CanardExistencePackage S) : Prop :=
  C.canardCondition ∧ C.singularOrbitDefined ∧ C.slowSegmentDefined ∧
  C.fastSegmentDefined ∧ C.crossingTimeFinite ∧ C.canardSolutionSmooth

theorem canard_existence_closed_from_evidence {P : CanardPhaseSpace}
    {M : CriticalManifold P} {S : SlowFastSystem P}
    (C : CanardExistencePackage S) (E : CanardExistenceEvidence C) :
    CanardExistenceClosed C := by
  exact And.intro E.canardConditionClosed
    (And.intro E.singularOrbitDefinedClosed
      (And.intro E.slowSegmentDefinedClosed
        (And.intro E.fastSegmentDefinedClosed
          (And.intro E.crossingTimeFiniteClosed E.canardSolutionSmoothClosed))))

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse