import Geometry

data TraitType = 
    STRUCTURE_GEOMETRY | -- geometry of structures within cell
    OUTER_MEMBRANE     | -- cell membrane
    OTHER_TRAITS         -- placeholder
    deriving (Show, Eq)

data Trait = Trait
    { name  :: TraitType
    , value :: Float
    } deriving Show

data Organism = Organism
    { traits     :: [Trait]
    , generation :: Int
    , lifetime   :: Float
    } deriving Show

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

    print (traits (head organisms))
