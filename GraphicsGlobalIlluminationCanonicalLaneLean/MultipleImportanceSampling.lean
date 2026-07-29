import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIlluminationCanonicalLaneLean

structure MultipleImportanceSamplingPackage (P : PathSpaceSamplingPackage) where
  heuristicWeight : Type u
  balanceHeuristic : Prop
  powerHeuristic : Prop
  varianceReduction : Prop
  unbiasedCombination : Prop

structure MultipleImportanceSamplingEvidence {P : PathSpaceSamplingPackage}
    (M : MultipleImportanceSamplingPackage P) where
  balanceHeuristicClosed : M.balanceHeuristic
  powerHeuristicClosed : M.powerHeuristic
  varianceReductionClosed : M.varianceReduction
  unbiasedCombinationClosed : M.unbiasedCombination

def MultipleImportanceSamplingClosed {P : PathSpaceSamplingPackage}
    (M : MultipleImportanceSamplingPackage P) : Prop :=
  M.balanceHeuristic ∧ M.powerHeuristic ∧ M.varianceReduction ∧ M.unbiasedCombination

theorem multiple_importance_sampling_closed_from_evidence
    {P : PathSpaceSamplingPackage} (M : MultipleImportanceSamplingPackage P)
    (E : MultipleImportanceSamplingEvidence M) : MultipleImportanceSamplingClosed M := by
  exact And.intro E.balanceHeuristicClosed
    (And.intro E.powerHeuristicClosed
      (And.intro E.varianceReductionClosed E.unbiasedCombinationClosed))

end GraphicsGlobalIlluminationCanonicalLaneLean
end HautevilleHouse