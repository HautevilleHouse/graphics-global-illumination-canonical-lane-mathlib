import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIlluminationCanonicalLaneLean

structure RenderingEquationPackage where
  radianceField : Type u
  surfaceGeometry : Type v
  brdf : Type w
  lightingDistribution : Prop
  transportOperator : Prop
  equilibriumCondition : Prop
  pathIntegralFormulation : Prop

structure RenderingEquationEvidence (P : RenderingEquationPackage) where
  lightingDistributionClosed : P.lightingDistribution
  transportOperatorClosed : P.transportOperator
  equilibriumConditionClosed : P.equilibriumCondition
  pathIntegralFormulationClosed : P.pathIntegralFormulation

def RenderingEquationClosed (P : RenderingEquationPackage) : Prop :=
  P.lightingDistribution ∧
  P.transportOperator ∧
  P.equilibriumCondition ∧
  P.pathIntegralFormulation

theorem rendering_equation_closed_from_evidence (P : RenderingEquationPackage)
    (E : RenderingEquationEvidence P) : RenderingEquationClosed P := by
  exact And.intro E.lightingDistributionClosed
    (And.intro E.transportOperatorClosed
      (And.intro E.equilibriumConditionClosed
        E.pathIntegralFormulationClosed))

end GraphicsGlobalIlluminationCanonicalLaneLean
end HautevilleHouse