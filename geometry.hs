module Geometry ( Point, Line, PolygonGeometry ) where

data Point = Point
    { x :: Float,
      y :: Float
    } deriving Show

data Line = Line
    { a :: Point,
      b :: Point
    } deriving Show

data PolygonGeometry = PolygonGeometry
    { points   :: [Point]
    , segments :: [Line]
    }
