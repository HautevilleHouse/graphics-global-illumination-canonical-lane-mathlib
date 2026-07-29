import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIlluminationCanonicalLaneLean

structure PathTracingPackage where
  raySurfaceInteraction : Prop
  bsdfSampling : Prop
  importanceSampling : Prop
  monteCarloIntegration : Prop
  russianRoulette : Prop

structure PathTracingEvidence (P : PathTracingPackage) where
  raySurfaceInteractionClosed : P.raySurfaceInteraction
  bsdfSamplingClosed : P.bsdfSampling
  importanceSamplingClosed : P.importanceSampling
  monteCarloIntegrationClosed : P.monteCarloIntegration
  russianRouletteClosed : P.russianRoulette

def PathTracingClosed (P : PathTracingPackage) : Prop :=
  P.raySurfaceInteraction ∧ P.bsdfSampling ∧
  P.importanceSampling ∧ P.monteCarloIntegration ∧
  P.russianRoulette

theorem path_tracing_closed_from_evidence
    (P : PathTracingPackage) (E : PathTracingEvidence P) :
    PathTracingClosed P := by
  exact And.intro E.raySurfaceInteractionClosed
    (And.intro E.bsdfSamplingClosed
      (And.intro E.importanceSamplingClosed
        (And.intro E.monteCarloIntegrationClosed
          E.russianRouletteClosed)))

end GraphicsGlobalIlluminationCanonicalLaneLean
end HautevilleHouse
