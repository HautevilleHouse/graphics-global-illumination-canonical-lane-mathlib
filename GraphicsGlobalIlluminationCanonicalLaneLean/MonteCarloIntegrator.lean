import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIlluminationCanonicalLaneLean

structure MonteCarloIntegratorPackage where
  sampleStrategy : Type u
  weightFunction : Type v
  unbiasedEstimator : Prop
  varianceReduction : Prop
  convergenceRate : Prop
  stratificationCapability : Prop

structure MonteCarloIntegratorEvidence (P : MonteCarloIntegratorPackage) where
  unbiasedEstimatorClosed : P.unbiasedEstimator
  varianceReductionClosed : P.varianceReduction
  convergenceRateClosed : P.convergenceRate
  stratificationCapabilityClosed : P.stratificationCapability

def MonteCarloIntegratorClosed (P : MonteCarloIntegratorPackage) : Prop :=
  P.unbiasedEstimator ∧
  P.varianceReduction ∧
  P.convergenceRate ∧
  P.stratificationCapability

theorem monte_carlo_integrator_closed_from_evidence (P : MonteCarloIntegratorPackage)
    (E : MonteCarloIntegratorEvidence P) : MonteCarloIntegratorClosed P := by
  exact And.intro E.unbiasedEstimatorClosed
    (And.intro E.varianceReductionClosed
      (And.intro E.convergenceRateClosed
        E.stratificationCapabilityClosed))

end GraphicsGlobalIlluminationCanonicalLaneLean
end HautevilleHouse