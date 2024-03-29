module Main exposing (Model, Msg(..))

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Browser

main =
    Browser.sandbox { init = init, update = update, view = view }

type alias Model =
    Int

init : Model
init =
    0

type Msg
    = Increment
    | Decrement
    | Reset


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1

        Reset ->
            0


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Increment ] [ text "+" ]
        , button [ onClick Reset ] [ text "Reset" ]
        ]
