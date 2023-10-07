module Geometry ( Point, Line, Polygon ) where
import Control.Monad (forM_)

data Point = Point
    { x :: Float
    , y :: Float
    } deriving (Show, Eq)

data Line = Line
    { a :: Point
    , b :: Point
    } deriving Show

data Polygon = Polygon
    { vertices :: [Point]
    , segments :: [Line]
    }

new_line :: Point -> Point -> Line
new_line a b 
    | a == b    = error "origin and end points are identical"
    | otherwise = Line { a , b }

-- calculate the intersection between two polygons
polygon_intersection :: Polygon -> Polygon -> IO Polygon
polygon_intersection a b = do
    let a_size :: Int = length (vertices a)
        b_size :: Int = length (vertices b)

    -- fix handler
    let handler = print "HI"
    forM_ (vertices a) (\x -> handler)

    return $ Polygon { vertices = [], segments = [] }
