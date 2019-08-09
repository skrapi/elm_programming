import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

-- MAIN

main =
    Browser.sandbox { init = init, update = update, view = view}

type alias Model =
    { firstName : String
    , lastName : String
    , password : String
    , passwordAgain : String
    }

init : Model
init =
    Model "" "" "" ""

type Msg
    = Name String
    | LastName String
    | Password String
    | PasswordAgain String 

update : Msg -> Model -> Model
update msg model =
    case msg of      
        Name firstName ->
            { model | firstName  = firstName }

        LastName lastName ->
            { model | lastName = lastName }

        Password password ->
            { model | password = password}

        PasswordAgain passwordAgain ->
            { model | passwordAgain = passwordAgain }

view : Model -> Html Msg
view model =
  div []
    [ viewInput "text" "Name" model.firstName Name
    , viewInput "text" " Surname" model.lastName LastName
    , viewInput "password" "Password" model.password Password
    , viewInput "password" "Re-enter Password" model.passwordAgain PasswordAgain
    , viewValidation model
    , div [] [ text (model.firstName ++ " " ++ model.lastName) ]
    ]

viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg = 
    input [ type_ t, placeholder p, value v, onInput toMsg ] []


viewValidation : Model -> Html msg
viewValidation model =
    if model.password == model.passwordAgain then 
        div [ style "color" "green" ] [ text "OK"]
    else
        div [ style "color" "red"] [text "Passwords do not match"]


