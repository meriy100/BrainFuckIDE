module Main exposing (Model, Msg(..), init, main, subscriptions, tdListView, update, view)

import Browser as Browser
import Html as Html exposing (Html)
import Html.Attributes as Attributes
import Html.Events as Events


import BrainFuck.Tape as Tape exposing (Tape)
import BrainFuck.Parser as Parser


type alias Model =
    { code : Parser.Code
    , tape : Tape Int
    }


type Msg
    = ChangeCode String
    | Run
    | Inc
    | Dec
    | PointerInc
    | PointerDec
    | TestWhile

codeToString (Parser.Code str) =
    str


main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { code = Parser.Code "+++[->+>+<<]"
      , tape = Tape.init
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
        , Html.div [Attributes.class "row"]
            [ Html.div [Attributes.class "six columns"]
                [ Html.div []
                    [ Html.button [Events.onClick Run] [ Html.text "Run" ]
                    ]
                , Html.div []
                    [ Html.textarea [Events.onInput ChangeCode, model.code |> codeToString |> Attributes.value] []
                    ]
                ]
            , Html.div [Attributes.class "six columns"]
                [ Html.div []
                    [ Html.button [ Events.onClick Inc ] [ Html.text "+" ]
                    , Html.button [ Events.onClick Dec ] [ Html.text "-" ]
                    , Html.button [ Events.onClick PointerDec ] [ Html.text "<" ]
                    , Html.button [ Events.onClick PointerInc ] [ Html.text ">" ]
                    , Html.button [ Events.onClick TestWhile ] [ Html.text "[->+<]" ]
                    ]
                , Html.table []
                    [ tdListView model.tape
                        |> Html.tr []
                    ]
                ]
            ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeCode str ->
            ( { model | code = Parser.Code str }, Cmd.none )
        Run ->
            let
                f = Parser.parse model.code
            in
            ( { model | tape = Tape.run f model.tape }, Cmd.none )
        Inc ->
            ( { model | tape = Tape.inc model.tape }, Cmd.none )

        Dec ->
            ( { model | tape = Tape.dec model.tape }, Cmd.none )

        PointerInc ->
            ( { model | tape = Tape.pointerInc model.tape }, Cmd.none )

        PointerDec ->
            ( { model | tape = Tape.pointerDec model.tape }, Cmd.none )
        TestWhile ->
            ( { model | tape = Tape.while (Tape.dec >> Tape.pointerInc >> Tape.inc >> Tape.pointerDec) model.tape }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
