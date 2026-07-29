import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure AdmissibleClass where
  canardObject : CanardAdmittedObject
  fastSlowSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : fastSlowSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CanardWitnessClosed A.canardObject ∧ (A.fastSlowSatisfied ∨ A.remainderRecorded)

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse
