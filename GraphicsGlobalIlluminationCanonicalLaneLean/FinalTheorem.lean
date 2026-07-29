import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGlobalIlluminationCanonicalLaneLean

def ConstrainedGlobalIlluminationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_global_illumination_endgame (A : AdmissibleClass) :
    ConstrainedGlobalIlluminationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GraphicsGlobalIlluminationCanonicalLaneLean
end HautevilleHouse
