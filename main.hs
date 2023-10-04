data TraitType = 
    STRUCTURE_GEOMETRY | -- geometry of structures within cell
    OUTER_MEMBRANE     | -- cell membrane
    OTHER_TRAITS         -- placeholder
    deriving (Show, Eq)

data Traits = Traits
    { name  :: TraitType
    , value :: Float
    } deriving Show

data Organism = Organism
    { traits     :: [Traits]
    , generation :: Int
    , lifetime   :: Float
    } deriving Show

org :: [Traits] -> Int -> Float -> Organism
org traits generation lifetime
    | generation /= 0 = error "Non-zero initial generation"
    | lifetime   /= 0 = error "Non-zero initial lifetime"
    | otherwise       = Organism { traits = traits
                                 , generation = generation
                                 , lifetime = lifetime
                                 }

deforg :: Organism
deforg = org [] 0 0

for :: [a] -> (a -> IO ()) -> IO ()
for list action = mapM_ action list

main :: IO ()
main = do
    let generations :: Integer    = 100
    let organisms   :: [Organism] = [deforg, deforg]

    for [0..generations] (\i -> do
        print i 
        )

    print (traits (head organisms))
