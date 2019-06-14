module Main exposing (..)

import Browser as Browser
import Html as Html exposing (Html)

type Code =
    Code String
type alias Model =
    { code : Code
    }

type Msg =
    ChangeCode String

main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


init : () -> ( Model, Cmd Msg )
init _ =
    ({code = Code ""}, Cmd.none)

view : Model -> Html Msg
view model =
    Html.div []
        [ Html.h1 [] [Html.text "Hello BF World!"]
        ]

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        ChangeCode str ->
            ({model | code = Code str}, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
