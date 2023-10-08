import Geometry

-- we obviously cannot simulate materials true to nature here,
-- so im opting for a fictional universe where these compositions
-- are readily available to the organism

data Composition = Composition
    { carbon    :: Float -- increases strength of material, but increases weight
    , potassium :: Float -- affects osmotic balance and cell turgor pressure
    , water     :: Float -- increases efficiency of processes, but weakens overall structure   
    }

data GeometricStructure = GeometricStructure
    { structure  :: Polygon
    , composites :: Composition
    }

data TraitType = 
    MEMBRANE_GEOMETRY  | -- shape, thickness
    STRUCTURE		     -- organelles, specialised structures
    deriving Eq

class TraitValue a where
    toTraitValue :: a -> TraitValue

data TraitValue = FloatValue Float | CompositionValue Composition

instance TraitValue Float       where toTraitValue = FloatValue
instance TraitValue Composition where toTraitValue = CompositionValue

data FloatValue       = FloatValue       Float
data CompositionValue = CompositionValue Composition

data Trait = Trait
    { name  :: TraitType
    , value :: TraitValue
    }

data Organism = Organism
    { traits     :: [Trait]
    , generation :: Int
    , lifetime   :: Float
    }

org :: [Trait] -> Int -> Float -> Organism
org traits generation lifetime
    | generation /= 0 = error "non-zero initial generation"
    | lifetime   /= 0 = error "non-zero initial lifetime"
    | otherwise       = Organism { traits , generation , lifetime }

def_org :: Organism
def_org = org [] 0 0

org_count :: Int = 10
gen_count :: Int = 100

-- calculate next generation
calcgen :: Organism -> Int -> Organism
calcgen organism iteration
    | iteration == gen_count = organism
    | otherwise = calcgen (updateorg organism) (iteration + 1)
        where updateorg :: Organism -> Organism
              updateorg o = o { generation = generation o + 1 }

main :: IO ()
main = do
    let organisms :: [Organism] = take org_count (repeat def_org)

    let _ = calcgen (head organisms) 0

    -- print (traits (head organisms))
