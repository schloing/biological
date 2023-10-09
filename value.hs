module Value ( Composition, TraitValue(..) ) where

import Geometry

data Composition = Composition
    { carbon    :: Float -- increases strength of material, but increases weight
    , potassium :: Float -- affects osmotic balance and cell turgor pressure
    , water     :: Float -- increases efficiency of processes, but weakens overall structure   
    }

data TraitValue = FloatValue Float | CompositionValue Composition

-- i hate this code so much
-- no programming language is perfect, i guess

class ToTraitValue a where
    toTraitValue :: a -> TraitValue

instance ToTraitValue Float where
    toTraitValue = FloatValue

instance ToTraitValue Composition where
    toTraitValue = CompositionValue