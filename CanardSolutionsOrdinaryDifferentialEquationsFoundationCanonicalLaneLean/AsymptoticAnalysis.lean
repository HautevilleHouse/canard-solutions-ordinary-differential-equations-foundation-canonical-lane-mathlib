import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure AsymptoticAnalysisPackage where
  matchedAsymptoticsApplied : Prop
  innerLayerExpansion : Prop
  outerExpansion : Prop
  matchingCondition : Prop
  uniformValidity : Prop

structure AsymptoticAnalysisEvidence (A : AsymptoticAnalysisPackage) where
  matchedAsymptoticsAppliedClosed : A.matchedAsymptoticsApplied
  innerLayerExpansionClosed : A.innerLayerExpansion
  outerExpansionClosed : A.outerExpansion
  matchingConditionClosed : A.matchingCondition
  uniformValidityClosed : A.uniformValidity

def AsymptoticAnalysisClosed (A : AsymptoticAnalysisPackage) : Prop :=
  A.matchedAsymptoticsApplied ∧ A.innerLayerExpansion ∧ A.outerExpansion ∧
  A.matchingCondition ∧ A.uniformValidity

theorem asymptotic_analysis_closed_from_evidence (A : AsymptoticAnalysisPackage)
    (E : AsymptoticAnalysisEvidence A) : AsymptoticAnalysisClosed A := by
  exact And.intro E.matchedAsymptoticsAppliedClosed (And.intro E.innerLayerExpansionClosed
    (And.intro E.outerExpansionClosed (And.intro E.matchingConditionClosed E.uniformValidityClosed)))

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse