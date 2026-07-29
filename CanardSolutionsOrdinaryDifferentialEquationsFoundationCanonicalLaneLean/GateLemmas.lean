import HautevilleHouse.CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse