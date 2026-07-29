import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIlluminationCanonicalLaneLean

structure PhotonMappingPackage where
  photonEmission : Prop
  photonBouncing : Prop
  photonStorage : Prop
  densityEstimation : Prop
  finalGathering : Prop

structure PhotonMappingEvidence (P : PhotonMappingPackage) where
  photonEmissionClosed : P.photonEmission
  photonBouncingClosed : P.photonBouncing
  photonStorageClosed : P.photonStorage
  densityEstimationClosed : P.densityEstimation
  finalGatheringClosed : P.finalGathering

def PhotonMappingClosed (P : PhotonMappingPackage) : Prop :=
  P.photonEmission ∧ P.photonBouncing ∧
  P.photonStorage ∧ P.densityEstimation ∧
  P.finalGathering

theorem photon_mapping_closed_from_evidence
    (P : PhotonMappingPackage) (E : PhotonMappingEvidence P) :
    PhotonMappingClosed P := by
  exact And.intro E.photonEmissionClosed
    (And.intro E.photonBouncingClosed
      (And.intro E.photonStorageClosed
        (And.intro E.densityEstimationClosed
          E.finalGatheringClosed)))

end GraphicsGlobalIlluminationCanonicalLaneLean
end HautevilleHouse
