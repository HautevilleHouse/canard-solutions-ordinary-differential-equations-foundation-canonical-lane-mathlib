import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure SlowFastSystem (P : CanardPhaseSpace) where
  fastEquation : P.fastVariable -> P.stateSpace -> P.parameter -> P.fastVariable
  slowEquation : P.slowVariable -> P.stateSpace -> P.parameter -> P.slowVariable
  timescaleSeparation : Prop
  epsilon : ℝ
  epsilonPositive : Prop
  fastEquationSmooth : Prop
  slowEquationSmooth : Prop
  timescaleSeparationTerm : timescaleSeparation
  epsilonPositiveTerm : epsilonPositive
  fastEquationSmoothTerm : fastEquationSmooth
  slowEquationSmoothTerm : slowEquationSmooth

structure SlowFastSystemEvidence {P : CanardPhaseSpace}
    (S : SlowFastSystem P) where
  timescaleSeparationClosed : S.timescaleSeparation
  epsilonPositiveClosed : S.epsilonPositive
  fastEquationSmoothClosed : S.fastEquationSmooth
  slowEquationSmoothClosed : S.slowEquationSmooth

def SlowFastSystemClosed {P : CanardPhaseSpace} (S : SlowFastSystem P) : Prop :=
  S.timescaleSeparation ∧ S.epsilonPositive ∧ S.fastEquationSmooth ∧
  S.slowEquationSmooth

theorem slow_fast_system_closed_from_evidence {P : CanardPhaseSpace}
    (S : SlowFastSystem P) (E : SlowFastSystemEvidence S) :
    SlowFastSystemClosed S := by
  exact And.intro E.timescaleSeparationClosed
    (And.intro E.epsilonPositiveClosed
      (And.intro E.fastEquationSmoothClosed E.slowEquationSmoothClosed))

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse