import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIllumination

structure FiniteElementBasisPackage {R : RenderingEquationPackage} where
  basisFunctions : Type u
  projectionOperator : Type v
  innerProductDefined : Prop
  orthonormality : Prop
  reconstructionError : Prop

structure FiniteElementBasisEvidence {R : RenderingEquationPackage}
    (F : FiniteElementBasisPackage R) where
  innerProductDefinedClosed : F.innerProductDefined
  orthonormalityClosed : F.orthonormality
  reconstructionErrorClosed : F.reconstructionError

def FiniteElementBasisClosed {R : RenderingEquationPackage}
    (F : FiniteElementBasisPackage R) : Prop :=
  F.innerProductDefined ∧ F.orthonormality ∧ F.reconstructionError

theorem finite_element_basis_closed_from_evidence
    {R : RenderingEquationPackage} (F : FiniteElementBasisPackage R)
    (E : FiniteElementBasisEvidence F) : FiniteElementBasisClosed F := by
  exact And.intro E.innerProductDefinedClosed
    (And.intro E.orthonormalityClosed E.reconstructionErrorClosed)

end GraphicsGlobalIllumination
end HautevilleHouse