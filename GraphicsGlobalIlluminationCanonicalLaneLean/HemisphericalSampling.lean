import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIlluminationCanonicalLaneLean

structure HemisphericalSamplingPackage where
  sampleCount : Nat
  cosineWeighted : Prop
  importanceSampling : Prop
  uniformityMetric : Prop

structure HemisphericalSamplingEvidence (H : HemisphericalSamplingPackage) where
  sampleCountClosed : H.sampleCount > 0
  cosineWeightedClosed : H.cosineWeighted
  importanceSamplingClosed : H.importanceSampling
  uniformityMetricClosed : H.uniformityMetric

def HemisphericalSamplingClosed (H : HemisphericalSamplingPackage) : Prop :=
  H.sampleCount > 0 ∧ H.cosineWeighted ∧ H.importanceSampling ∧ H.uniformityMetric

theorem hemispherical_sampling_closed_from_evidence (H : HemisphericalSamplingPackage)
    (E : HemisphericalSamplingEvidence H) : HemisphericalSamplingClosed H := by
  exact And.intro E.sampleCountClosed
    (And.intro E.cosineWeightedClosed
      (And.intro E.importanceSamplingClosed E.uniformityMetricClosed))

end GraphicsGlobalIlluminationCanonicalLaneLean
end HautevilleHouse
