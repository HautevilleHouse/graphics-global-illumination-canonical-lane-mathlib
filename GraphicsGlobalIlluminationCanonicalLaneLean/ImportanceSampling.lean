import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIlluminationCanonicalLaneLean

structure ImportanceSamplingPackage where
  targetDistribution : Type u
  proposalDistribution : Type v
  weightFunction : Prop
  varianceReduction : Prop
  sampleGeneration : Prop
  unbiasedness : Prop
  multipleImportanceSampling : Prop

structure ImportanceSamplingEvidence (I : ImportanceSamplingPackage) where
  weightFunctionClosed : I.weightFunction
  varianceReductionClosed : I.varianceReduction
  sampleGenerationClosed : I.sampleGeneration
  unbiasednessClosed : I.unbiasedness
  multipleImportanceSamplingClosed : I.multipleImportanceSampling

def ImportanceSamplingClosed (I : ImportanceSamplingPackage) : Prop :=
  I.weightFunction ∧ I.varianceReduction ∧ I.sampleGeneration ∧ I.unbiasedness ∧ I.multipleImportanceSampling

theorem importance_sampling_closed_from_evidence (I : ImportanceSamplingPackage) (E : ImportanceSamplingEvidence I) : ImportanceSamplingClosed I := by
  exact And.intro E.weightFunctionClosed (And.intro E.varianceReductionClosed (And.intro E.sampleGenerationClosed (And.intro E.unbiasednessClosed E.multipleImportanceSamplingClosed)))

end GraphicsGlobalIlluminationCanonicalLaneLean
end HautevilleHouse