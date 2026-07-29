import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIllumination

structure IrradianceCachingPackage {R : RenderingEquationPackage}
    {M : MonteCarloIntegrationPackage R} where
  indirectCacheStorage : Prop
  interpolationScheme : Prop
  irradianceEstimate : Prop
  visibilityApproximation : Prop
  gradientBasedCacheUpdate : Prop
  cacheValidation : Prop

structure IrradianceCachingEvidence {R : RenderingEquationPackage}
    {M : MonteCarloIntegrationPackage R} (I : IrradianceCachingPackage R M) where
  indirectCacheStorageClosed : I.indirectCacheStorage
  interpolationSchemeClosed : I.interpolationScheme
  irradianceEstimateClosed : I.irradianceEstimate
  visibilityApproximationClosed : I.visibilityApproximation
  gradientBasedCacheUpdateClosed : I.gradientBasedCacheUpdate
  cacheValidationClosed : I.cacheValidation

def IrradianceCachingClosed {R : RenderingEquationPackage}
    {M : MonteCarloIntegrationPackage R} (I : IrradianceCachingPackage R M) : Prop :=
  I.indirectCacheStorage ∧ I.interpolationScheme ∧
  I.irradianceEstimate ∧ I.visibilityApproximation ∧
  I.gradientBasedCacheUpdate ∧ I.cacheValidation

theorem irradiance_caching_closed_from_evidence
    {R : RenderingEquationPackage} {M : MonteCarloIntegrationPackage R}
    (I : IrradianceCachingPackage R M) (E : IrradianceCachingEvidence I) :
    IrradianceCachingClosed I := by
  exact And.intro E.indirectCacheStorageClosed
    (And.intro E.interpolationSchemeClosed
      (And.intro E.irradianceEstimateClosed
        (And.intro E.visibilityApproximationClosed
          (And.intro E.gradientBasedCacheUpdateClosed E.cacheValidationClosed))))

end GraphicsGlobalIllumination
end HautevilleHouse