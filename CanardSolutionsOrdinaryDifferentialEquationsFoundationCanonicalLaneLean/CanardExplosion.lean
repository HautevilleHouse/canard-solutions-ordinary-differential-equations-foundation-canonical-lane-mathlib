import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure CanardExplosionPackage {P : CanardPhaseSpace} {M : CriticalManifold P}
    {S : SlowFastSystem P} (C : CanardExistencePackage S) where
  explosionTime : ℝ
  amplitude : ℝ
  criticalParameterValue : ℝ
  explosiveBehavior : Prop
  amplitudeDiverges : Prop
  timescaleBreakdown : Prop
  explosiveBehaviorTerm : explosiveBehavior
  amplitudeDivergesTerm : amplitudeDiverges
  timescaleBreakdownTerm : timescaleBreakdown
  explosionTimeFinite : Prop
  criticalParameterValueDefined : Prop
  explosionTimeFiniteTerm : explosionTimeFinite
  criticalParameterValueDefinedTerm : criticalParameterValueDefined

structure CanardExplosionEvidence {P : CanardPhaseSpace} {M : CriticalManifold P}
    {S : SlowFastSystem P} {C : CanardExistencePackage S}
    (E : CanardExplosionPackage C) where
  explosiveBehaviorClosed : E.explosiveBehavior
  amplitudeDivergesClosed : E.amplitudeDiverges
  timescaleBreakdownClosed : E.timescaleBreakdown
  explosionTimeFiniteClosed : E.explosionTimeFinite
  criticalParameterValueDefinedClosed : E.criticalParameterValueDefined

def CanardExplosionClosed {P : CanardPhaseSpace} {M : CriticalManifold P}
    {S : SlowFastSystem P} {C : CanardExistencePackage S}
    (E : CanardExplosionPackage C) : Prop :=
  E.explosiveBehavior ∧ E.amplitudeDiverges ∧ E.timescaleBreakdown ∧
  E.explosionTimeFinite ∧ E.criticalParameterValueDefined

theorem canard_explosion_closed_from_evidence {P : CanardPhaseSpace}
    {M : CriticalManifold P} {S : SlowFastSystem P} {C : CanardExistencePackage S}
    (E : CanardExplosionPackage C) (Ev : CanardExplosionEvidence E) :
    CanardExplosionClosed E := by
  exact And.intro Ev.explosiveBehaviorClosed
    (And.intro Ev.amplitudeDivergesClosed
      (And.intro Ev.timescaleBreakdownClosed
        (And.intro Ev.explosionTimeFiniteClosed
          Ev.criticalParameterValueDefinedClosed)))

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse