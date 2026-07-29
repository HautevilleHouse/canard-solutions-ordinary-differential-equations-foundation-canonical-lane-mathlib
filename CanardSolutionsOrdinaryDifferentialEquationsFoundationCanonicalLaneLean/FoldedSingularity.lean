import .CanardSolution

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure FoldedSingularityPackage {S : SlowFastSystemPackage}
    {C : CriticalManifoldPackage S} where
  singularPoint : S.stateSpace
  foldCondition : Prop
  fastSubsystemJacobian : S.stateSpace → Matrix (Fin 1) (Fin 1) ℝ
  slowSubsystemJacobian : S.stateSpace → Matrix (Fin 1) (Fin 1) ℝ
  foldType : FoldType

inductive FoldType where
| regular
| folded
| canard

definingFoldType : Prop := True

structure FoldedSingularityEvidence {S : SlowFastSystemPackage}
    {C : CriticalManifoldPackage S} (F : FoldedSingularityPackage S C) where
  foldConditionClosed : F.foldCondition

def FoldedSingularityClosed {S : SlowFastSystemPackage}
    {C : CriticalManifoldPackage S} (F : FoldedSingularityPackage S C) : Prop :=
  F.foldCondition

theorem folded_singularity_closed_from_evidence
    {S : SlowFastSystemPackage} {C : CriticalManifoldPackage S}
    (F : FoldedSingularityPackage S C) (E : FoldedSingularityEvidence F) :
    FoldedSingularityClosed F := by
  exact E.foldConditionClosed

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse