import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIlluminationCanonicalLaneLean

structure PathSpaceSamplingPackage (I : GlobalIlluminationIntegralsPackage) where
  pathSpace : Type u
  probabilityMeasure : Type v
  unbiasedEstimate : Prop
  finiteVariance : Prop
  convergenceRate : Prop

structure PathSpaceSamplingEvidence {I : GlobalIlluminationIntegralsPackage}
    (P : PathSpaceSamplingPackage I) where
  unbiasedEstimateClosed : P.unbiasedEstimate
  finiteVarianceClosed : P.finiteVariance
  convergenceRateClosed : P.convergenceRate

def PathSpaceSamplingClosed {I : GlobalIlluminationIntegralsPackage}
    (P : PathSpaceSamplingPackage I) : Prop :=
  P.unbiasedEstimate ∧ P.finiteVariance ∧ P.convergenceRate

theorem path_space_sampling_closed_from_evidence
    {I : GlobalIlluminationIntegralsPackage} (P : PathSpaceSamplingPackage I)
    (E : PathSpaceSamplingEvidence P) : PathSpaceSamplingClosed P := by
  exact And.intro E.unbiasedEstimateClosed
    (And.intro E.finiteVarianceClosed E.convergenceRateClosed)

end GraphicsGlobalIlluminationCanonicalLaneLean
end HautevilleHouse