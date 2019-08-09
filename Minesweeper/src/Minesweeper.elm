module Main exposing (Board, Cache, Cell, CellState(..), Cells, Game(..), GameState(..), Model, Position, randomPositionGenerator)

import Random exposing (..) 
-- CELL


type CellState
    = Hidden { pushed : Bool }
    | Flagged
    | Revealed


type alias Cache =
    { neighbouringMines : Int
    }


type alias Cell cache =
    { cache
        | state : CellState
        , mined : Bool
    }



-- BOARD


type alias Position =
    ( Int, Int )


type alias Cells cache =
    Dict Position (Cell cache)


type alias Board =
    { size : Int
    , mines : Int
    , cells : Cells cache
    }



-- TOP LEVEL


type alias Model =
    { game : Game
    , controlPressed : Bool
    }


type Game
    = Loading
    | Loaded { state : GameState, board : Board }


type GameState
    = Playing
    | Lost
    | Won



-- ALGORITHM


randomPositionGenerator : Int -> Random.Generator Position
randomPositionGenerator size =
    Random.map2 (\x -> \y -> ( x, y ))
        (Random.int 0 (size - 1))
        (Random.int 0 (size - 1))
