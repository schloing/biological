import Geometry
import Value    -- Composition, TraitValue

-- we obviously cannot simulate materials true to nature here,
-- so im opting for a fictional universe where these compositions
-- are readily available to the organism

data GeometricStructure = GeometricStructure
    { structure  :: Polygon
    , composites :: Composition
    }

data TraitType = MEMBRANE_GEOMETRY | STRUCTURE
    deriving Eq

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
    | otherwise       = Organism { traits = traits , generation = generation , lifetime = lifetime }

def_org :: Organism
def_org = org [] 0 0

org_count :: Int
org_count = 10

gen_count :: Int
gen_count = 100

-- calculate next generation (with a stopping condition)
calcgen :: Organism -> Int -> Organism
calcgen organism iteration
    | iteration >= gen_count = organism
    | otherwise = calcgen (updateorg organism) (iteration + 1)
        where updateorg :: Organism -> Organism
              updateorg o = o { generation = generation o + 1 }

main :: IO ()
main = do
    let organisms :: [Organism] = take org_count (repeat def_org)
    
    let finalGeneration = calcgen (head organisms) 0

    return ()