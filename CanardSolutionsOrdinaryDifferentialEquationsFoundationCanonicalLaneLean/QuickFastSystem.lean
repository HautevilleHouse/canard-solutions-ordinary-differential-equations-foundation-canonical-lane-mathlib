import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundation

structure QuickFastSystem where
  slowVariable : Type u
  fastVariable : Type v
  parameter : Type w
  slowEquation : (slowVariable × fastVariable × parameter) → slowVariable
  fastEquation : (slowVariable × fastVariable × parameter) → fastVariable
  timescaleSeparation : Prop
  slowManifold : Set (slowVariable × fastVariable × parameter)
  slowManifoldInvariant : Prop

structure QuickFastEvidence (S : QuickFastSystem) where
  timescaleSeparationClosed : S.timescaleSeparation
  slowManifoldInvariantClosed : S.slowManifoldInvariant

def QuickFastClosed (S : QuickFastSystem) : Prop :=
  S.timescaleSeparation ∧ S.slowManifoldInvariant

theorem quick_fast_closed_from_evidence (S : QuickFastSystem) (E : QuickFastEvidence S) :
    QuickFastClosed S := by
  exact And.intro E.timescaleSeparationClosed E.slowManifoldInvariantClosed

end CanardSolutionsOrdinaryDifferentialEquationsFoundation
end HautevilleHouse