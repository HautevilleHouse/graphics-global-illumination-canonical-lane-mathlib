import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIlluminationCanonicalLaneLean

structure PathSpaceMeasurePackage where
  pathSpace : Type u
  areaMeasure : Type v
  solidAngleMeasure : Prop
  throughputFunction : Prop
  measureEquivalence : Prop
  integrationDomain : Prop

structure PathSpaceMeasureEvidence (P : PathSpaceMeasurePackage) where
  solidAngleMeasureClosed : P.solidAngleMeasure
  throughputFunctionClosed : P.throughputFunction
  measureEquivalenceClosed : P.measureEquivalence
  integrationDomainClosed : P.integrationDomain

def PathSpaceMeasureClosed (P : PathSpaceMeasurePackage) : Prop :=
  P.solidAngleMeasure ∧
  P.throughputFunction ∧
  P.measureEquivalence ∧
  P.integrationDomain

theorem path_space_measure_closed_from_evidence (P : PathSpaceMeasurePackage)
    (E : PathSpaceMeasureEvidence P) : PathSpaceMeasureClosed P := by
  exact And.intro E.solidAngleMeasureClosed
    (And.intro E.throughputFunctionClosed
      (And.intro E.measureEquivalenceClosed
        E.integrationDomainClosed))

end GraphicsGlobalIlluminationCanonicalLaneLean
end HautevilleHouse