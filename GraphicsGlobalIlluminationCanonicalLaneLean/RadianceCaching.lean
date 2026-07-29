import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIlluminationCanonicalLaneLean

structure RadianceCachingPackage where
  cacheEntries : Nat
  interpolationKernel : Prop
  irradianceEstimate : Prop
  indirectDiffuse : Prop

structure RadianceCachingEvidence (R : RadianceCachingPackage) where
  cacheEntriesClosed : R.cacheEntries > 0
  interpolationKernelClosed : R.interpolationKernel
  irradianceEstimateClosed : R.irradianceEstimate
  indirectDiffuseClosed : R.indirectDiffuse

def RadianceCachingClosed (R : RadianceCachingPackage) : Prop :=
  R.cacheEntries > 0 ∧ R.interpolationKernel ∧
  R.irradianceEstimate ∧ R.indirectDiffuse

theorem radiance_caching_closed_from_evidence (R : RadianceCachingPackage)
    (E : RadianceCachingEvidence R) : RadianceCachingClosed R := by
  exact And.intro E.cacheEntriesClosed
    (And.intro E.interpolationKernelClosed
      (And.intro E.irradianceEstimateClosed E.indirectDiffuseClosed))

end GraphicsGlobalIlluminationCanonicalLaneLean
end HautevilleHouse
