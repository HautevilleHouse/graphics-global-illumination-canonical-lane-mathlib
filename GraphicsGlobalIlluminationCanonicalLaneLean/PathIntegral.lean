import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIlluminationCanonicalLaneLean

structure PathIntegralPackage where
  pathSpace : Type u
  measureOnPaths : Prop
  throughputFunction : Prop
  pathSampling : Prop
  monteCarloConvergence : Prop
  pathRegularization : Prop

structure PathIntegralEvidence (P : PathIntegralPackage) where
  measureOnPathsClosed : P.measureOnPaths
  throughputFunctionClosed : P.throughputFunction
  pathSamplingClosed : P.pathSampling
  monteCarloConvergenceClosed : P.monteCarloConvergence
  pathRegularizationClosed : P.pathRegularization

def PathIntegralClosed (P : PathIntegralPackage) : Prop :=
  P.measureOnPaths ∧ P.throughputFunction ∧ P.pathSampling ∧ P.monteCarloConvergence ∧ P.pathRegularization

theorem path_integral_closed_from_evidence (P : PathIntegralPackage) (E : PathIntegralEvidence P) : PathIntegralClosed P := by
  exact And.intro E.measureOnPathsClosed (And.intro E.throughputFunctionClosed (And.intro E.pathSamplingClosed (And.intro E.monteCarloConvergenceClosed E.pathRegularizationClosed)))

end GraphicsGlobalIlluminationCanonicalLaneLean
end HautevilleHouse