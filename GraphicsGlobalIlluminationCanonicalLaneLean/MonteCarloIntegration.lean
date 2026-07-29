import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIllumination

structure MonteCarloIntegrationPackage {R : RenderingEquationPackage} where
  sampleGeneration : Prop
  weightFunction : Prop
  varianceReduction : Prop
  convergenceRate : Prop

structure MonteCarloIntegrationEvidence {R : RenderingEquationPackage}
    (M : MonteCarloIntegrationPackage R) where
  sampleGenerationClosed : M.sampleGeneration
  weightFunctionClosed : M.weightFunction
  varianceReductionClosed : M.varianceReduction
  convergenceRateClosed : M.convergenceRate

def MonteCarloIntegrationClosed {R : RenderingEquationPackage}
    (M : MonteCarloIntegrationPackage R) : Prop :=
  M.sampleGeneration ∧ M.weightFunction ∧ M.varianceReduction ∧ M.convergenceRate

theorem monte_carlo_integration_closed_from_evidence
    {R : RenderingEquationPackage} (M : MonteCarloIntegrationPackage R)
    (E : MonteCarloIntegrationEvidence M) : MonteCarloIntegrationClosed M := by
  exact And.intro E.sampleGenerationClosed
    (And.intro E.weightFunctionClosed
      (And.intro E.varianceReductionClosed E.convergenceRateClosed))

end GraphicsGlobalIllumination
end HautevilleHouse