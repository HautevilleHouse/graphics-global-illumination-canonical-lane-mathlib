import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIlluminationCanonicalLaneLean

structure PhotonMappingDensityEstimationPackage where
  photonMap : Type u
  densityKernel : Type v
  biasConsistency : Prop
  asymptoticUnbiasedness : Prop
  kernelBandwidth : Prop

structure PhotonMappingDensityEstimationEvidence
    (P : PhotonMappingDensityEstimationPackage) where
  biasConsistencyClosed : P.biasConsistency
  asymptoticUnbiasednessClosed : P.asymptoticUnbiasedness
  kernelBandwidthClosed : P.kernelBandwidth

def PhotonMappingDensityEstimationClosed (P : PhotonMappingDensityEstimationPackage) : Prop :=
  P.biasConsistency ∧ P.asymptoticUnbiasedness ∧ P.kernelBandwidth

theorem photon_mapping_density_estimation_closed_from_evidence
    (P : PhotonMappingDensityEstimationPackage)
    (E : PhotonMappingDensityEstimationEvidence P) :
    PhotonMappingDensityEstimationClosed P := by
  exact And.intro E.biasConsistencyClosed
    (And.intro E.asymptoticUnbiasednessClosed E.kernelBandwidthClosed)

end GraphicsGlobalIlluminationCanonicalLaneLean
end HautevilleHouse