module Main exposing (Code(..), Model, Msg(..), init, main, subscriptions, tdListView, update, view)

import BrainFuck.Tape as Tape exposing (Tape)
import Browser as Browser
import Html as Html exposing (Html)
import Html.Attributes as Attributes
import Html.Events as Events


type Code
    = Code String


type alias Model =
    { code : Code
    , tape : Tape Int
    }


type Msg
    = ChangeCode String
    | Inc
    | Dec
    | PointerInc
    | PointerDec


main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { code = Code ""
      , tape = Tape.Tape Tape.UnUsed 2 Tape.UnUsed
      }
    , Cmd.none
    )


tdListView : Tape Int -> List (Html Msg)
tdListView tape =
    Tape.currentOrMap
        (Html.td [ Attributes.style "color" "red" ] << List.singleton << Html.text << String.fromInt)
        (Html.td [] << List.singleton << Html.text << String.fromInt)
        tape
        |> Tape.toList


view : Model -> Html Msg
view model =
    Html.div [ Attributes.class "container" ]
        [ Html.h1 [] [ Html.text "Hello BF World!" ]
        , Html.div []
            [ Html.button [ Events.onClick Inc ] [ Html.text "+" ]
            , Html.button [ Events.onClick Dec ] [ Html.text "-" ]
            , Html.button [ Events.onClick PointerDec ] [ Html.text "<" ]
            , Html.button [ Events.onClick PointerInc ] [ Html.text ">" ]
            ]
        , Html.table []
            [ tdListView model.tape
                |> Html.tr []
            ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeCode str ->
            ( { model | code = Code str }, Cmd.none )

        Inc ->
            ( { model | tape = Tape.inc model.tape }, Cmd.none )

        Dec ->
            ( { model | tape = Tape.dec model.tape }, Cmd.none )

        PointerInc ->
            ( { model | tape = Tape.pointerInc model.tape }, Cmd.none )

        PointerDec ->
            ( { model | tape = Tape.pointerDec model.tape }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
