import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIlluminationCanonicalLaneLean

structure RadiosityMethodPackage where
  sceneDiscretization : Prop
  formFactorComputed : Prop
  radiosityEquation : Prop
  progressiveRefinement : Prop
  convergenceCriterion : Prop

structure RadiosityMethodEvidence (R : RadiosityMethodPackage) where
  sceneDiscretizationClosed : R.sceneDiscretization
  formFactorComputedClosed : R.formFactorComputed
  radiosityEquationClosed : R.radiosityEquation
  progressiveRefinementClosed : R.progressiveRefinement
  convergenceCriterionClosed : R.convergenceCriterion

def RadiosityMethodClosed (R : RadiosityMethodPackage) : Prop :=
  R.sceneDiscretization ∧ R.formFactorComputed ∧
  R.radiosityEquation ∧ R.progressiveRefinement ∧
  R.convergenceCriterion

theorem radiosity_method_closed_from_evidence
    (R : RadiosityMethodPackage) (E : RadiosityMethodEvidence R) :
    RadiosityMethodClosed R := by
  exact And.intro E.sceneDiscretizationClosed
    (And.intro E.formFactorComputedClosed
      (And.intro E.radiosityEquationClosed
        (And.intro E.progressiveRefinementClosed
          E.convergenceCriterionClosed)))

end GraphicsGlobalIlluminationCanonicalLaneLean
end HautevilleHouse
