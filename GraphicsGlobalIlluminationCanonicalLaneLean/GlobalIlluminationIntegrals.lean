import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIlluminationCanonicalLaneLean

structure GlobalIlluminationIntegralsPackage where
  radianceIntegral : Type u
  brdfWeight : Type v
  reflectanceModel : Prop
  energyConservation : Prop
  sDomainBounded : Prop
  sContinuity : Prop

structure GlobalIlluminationIntegralsEvidence (G : GlobalIlluminationIntegralsPackage) where
  reflectanceModelClosed : G.reflectanceModel
  energyConservationClosed : G.energyConservation
  sDomainBoundedClosed : G.sDomainBounded
  sContinuityClosed : G.sContinuity

def GlobalIlluminationIntegralsClosed (G : GlobalIlluminationIntegralsPackage) : Prop :=
  G.reflectanceModel ∧ G.energyConservation ∧ G.sDomainBounded ∧ G.sContinuity

theorem global_illumination_integrals_closed_from_evidence
    (G : GlobalIlluminationIntegralsPackage) (E : GlobalIlluminationIntegralsEvidence G) :
    GlobalIlluminationIntegralsClosed G := by
  exact And.intro E.reflectanceModelClosed
    (And.intro E.energyConservationClosed
      (And.intro E.sDomainBoundedClosed E.sContinuityClosed))

end GraphicsGlobalIlluminationCanonicalLaneLean
end HautevilleHouse