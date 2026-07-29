import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIlluminationCanonicalLaneLean

structure RadiosityPackage where
  formFactor : Prop
  radiosityEquation : Prop
  iterativeSolution : Prop
  patchDiscretization : Prop
  diffuseSurfaceModel : Prop
  energyBalance : Prop

structure RadiosityEvidence (R : RadiosityPackage) where
  formFactorClosed : R.formFactor
  radiosityEquationClosed : R.radiosityEquation
  iterativeSolutionClosed : R.iterativeSolution
  patchDiscretizationClosed : R.patchDiscretization
  diffuseSurfaceModelClosed : R.diffuseSurfaceModel
  energyBalanceClosed : R.energyBalance

def RadiosityClosed (R : RadiosityPackage) : Prop :=
  R.formFactor ∧ R.radiosityEquation ∧ R.iterativeSolution ∧ R.patchDiscretization ∧ R.diffuseSurfaceModel ∧ R.energyBalance

theorem radiosity_closed_from_evidence (R : RadiosityPackage) (E : RadiosityEvidence R) : RadiosityClosed R := by
  exact And.intro E.formFactorClosed (And.intro E.radiosityEquationClosed (And.intro E.iterativeSolutionClosed (And.intro E.patchDiscretizationClosed (And.intro E.diffuseSurfaceModelClosed E.energyBalanceClosed))))

end GraphicsGlobalIlluminationCanonicalLaneLean
end HautevilleHouse