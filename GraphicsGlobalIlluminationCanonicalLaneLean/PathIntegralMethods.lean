import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIllumination

structure PathIntegralMethodsPackage {R : RenderingEquationPackage}
    (M : MonteCarloIntegrationPackage R) where
  pathSamplingStrategy : Prop
  importanceSamplingWeighted : Prop
  russianRoulette : Prop
  multipleImportanceSampling : Prop
  pathRegularization : Prop

structure PathIntegralMethodsEvidence {R : RenderingEquationPackage}
    {M : MonteCarloIntegrationPackage R} (P : PathIntegralMethodsPackage M) where
  pathSamplingStrategyClosed : P.pathSamplingStrategy
  importanceSamplingWeightedClosed : P.importanceSamplingWeighted
  russianRouletteClosed : P.russianRoulette
  multipleImportanceSamplingClosed : P.multipleImportanceSampling
  pathRegularizationClosed : P.pathRegularization

def PathIntegralMethodsClosed {R : RenderingEquationPackage}
    {M : MonteCarloIntegrationPackage R} (P : PathIntegralMethodsPackage M) : Prop :=
  P.pathSamplingStrategy ∧ P.importanceSamplingWeighted ∧
  P.russianRoulette ∧ P.multipleImportanceSampling ∧ P.pathRegularization

theorem path_integral_methods_closed_from_evidence
    {R : RenderingEquationPackage} {M : MonteCarloIntegrationPackage R}
    (P : PathIntegralMethodsPackage M) (E : PathIntegralMethodsEvidence P) :
    PathIntegralMethodsClosed P := by
  exact And.intro E.pathSamplingStrategyClosed
    (And.intro E.importanceSamplingWeightedClosed
      (And.intro E.russianRouletteClosed
        (And.intro E.multipleImportanceSamplingClosed E.pathRegularizationClosed)))

end GraphicsGlobalIllumination
end HautevilleHouse