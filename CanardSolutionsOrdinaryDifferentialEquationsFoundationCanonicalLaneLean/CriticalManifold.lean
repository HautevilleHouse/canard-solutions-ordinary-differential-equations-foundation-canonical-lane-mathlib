import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure CriticalManifold {P : CanardPhaseSpace} where
  manifold : Type u
  embedding : manifold -> P.stateSpace
  foldCondition : Prop
  genericCondition : Prop
  smoothness : Prop
  fastNullcline : Prop
  attractivity : Prop
  repulsivity : Prop
  foldConditionTerm : foldCondition
  genericConditionTerm : genericCondition
  smoothnessTerm : smoothness
  fastNullclineTerm : fastNullcline
  attractivityTerm : attractivity
  repulsivityTerm : repulsivity

structure CriticalManifoldEvidence {P : CanardPhaseSpace}
    (M : CriticalManifold P) where
  foldConditionClosed : M.foldCondition
  genericConditionClosed : M.genericCondition
  smoothnessClosed : M.smoothness
  fastNullclineClosed : M.fastNullcline
  attractivityClosed : M.attractivity
  repulsivityClosed : M.repulsivity

def CriticalManifoldClosed {P : CanardPhaseSpace} (M : CriticalManifold P) : Prop :=
  M.foldCondition ∧ M.genericCondition ∧ M.smoothness ∧ M.fastNullcline ∧
  M.attractivity ∧ M.repulsivity

theorem critical_manifold_closed_from_evidence {P : CanardPhaseSpace}
    (M : CriticalManifold P) (E : CriticalManifoldEvidence M) :
    CriticalManifoldClosed M := by
  exact And.intro E.foldConditionClosed
    (And.intro E.genericConditionClosed
      (And.intro E.smoothnessClosed
        (And.intro E.fastNullclineClosed
          (And.intro E.attractivityClosed E.repulsivityClosed))))

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse