import HautevilleHouse.CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean.ReviewerBridge

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  manifoldConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceRepository : String := "canard-solutions-ordinary-differential-equations-foundation"
def sourceDescription : String := "Canard Solutions ODE Foundation"

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := sourceRepository,
  theoremName := sourceRepository,
  theoremObject := sourceDescription,
  classicalBoundary := "classical boundary for canard solutions ODE foundation",
  manifoldConstrainedStatement := "manifold-constrained theorem certificate internalized through baseline gates, source constants, reviewer bridge, manifest hashes, and outside-constant dependency count",
  certificateLane := "manifold_constrained",
  carriedRemainder := "classical source boundary carried by formalizationCertificate.theoremBoundaryOpen and sourceTheoremBoundary"
}

end CanardSolutionsOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse