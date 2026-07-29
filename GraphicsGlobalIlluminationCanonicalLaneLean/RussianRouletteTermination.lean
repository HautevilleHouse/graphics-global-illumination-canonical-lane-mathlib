import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIlluminationCanonicalLaneLean

structure RussianRouletteTerminationPackage (P : PathSpaceSamplingPackage) where
  survivalProbability : Type u
  unbiasedTermination : Prop
  efficiencyGain : Prop
  finiteExpectedLength : Prop

structure RussianRouletteTerminationEvidence {P : PathSpaceSamplingPackage}
    (R : RussianRouletteTerminationPackage P) where
  unbiasedTerminationClosed : R.unbiasedTermination
  efficiencyGainClosed : R.efficiencyGain
  finiteExpectedLengthClosed : R.finiteExpectedLength

def RussianRouletteTerminationClosed {P : PathSpaceSamplingPackage}
    (R : RussianRouletteTerminationPackage P) : Prop :=
  R.unbiasedTermination ∧ R.efficiencyGain ∧ R.finiteExpectedLength

theorem russian_roulette_termination_closed_from_evidence
    {P : PathSpaceSamplingPackage} (R : RussianRouletteTerminationPackage P)
    (E : RussianRouletteTerminationEvidence R) : RussianRouletteTerminationClosed R := by
  exact And.intro E.unbiasedTerminationClosed
    (And.intro E.efficiencyGainClosed E.finiteExpectedLengthClosed)

end GraphicsGlobalIlluminationCanonicalLaneLean
end HautevilleHouse