import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure CanardPhaseSpace where
  stateSpace : Type u
  fastVariable : Type v
  slowVariable : Type w
  parameter : Type x
  dimensionTotal : Nat
  dimensionFast : Nat
  dimensionSlow : Nat
  parameterSpace : Type y
  smoothStructure : Prop
  smoothStructureTerm : smoothStructure

structure CanardPhaseSpaceEvidence (P : CanardPhaseSpace) where
  smoothStructureClosed : P.smoothStructure

def CanardPhaseSpaceClosed (P : CanardPhaseSpace) : Prop :=
  P.smoothStructure

theorem canard_phase_space_closed_from_evidence (P : CanardPhaseSpace)
    (E : CanardPhaseSpaceEvidence P) : CanardPhaseSpaceClosed P := by
  exact E.smoothStructureClosed

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse