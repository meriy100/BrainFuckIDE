module Main exposing (Model, Msg(..), init, main, subscriptions, tdListView, update, view)

import BrainFuck.Core as Core
import BrainFuck.Parser as Parser
import BrainFuck.Tape as Tape exposing (Tape)
import Browser as Browser
import Html as Html exposing (Html)
import Html.Attributes as Attributes
import Html.Events as Events
import Task as Task


type alias Model =
    { code : Parser.Code
    , input : String
    , bfcore : Core.Model
    }


type Msg
    = ChangeCode String
    | ChangeInput String
    | Run
    | Next Int


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
      , input = ""
      , bfcore = Core.init
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
        , Html.div [ Attributes.class "row" ]
            [ Html.div [ Attributes.class "six columns" ]
                [ Html.div []
                    [ Html.button [ Events.onClick Run ] [ Html.text "Run" ]
                    , Html.button [ Events.onClick (Next 1) ] [ Html.text "Next" ]
                    ]
                , Html.div []
                    [ Html.textarea [ Events.onInput ChangeCode, model.code |> codeToString |> Attributes.value ] []
                    ]
                , Html.div []
                    [ Html.textarea [ Events.onInput ChangeInput, model.input |> Attributes.value ] []
                    ]
                , Html.div []
                    [ model.bfcore.waitings
                        |> Maybe.withDefault []
                        |> List.map String.fromChar
                        |> String.join ""
                        |> Html.text
                        |> List.singleton
                        |> Html.p [ Attributes.style "color" "red" ]
                    ]
                , Html.div []
                    (List.map
                        (Html.p [] << List.singleton << Html.text << String.join "" << List.map String.fromChar)
                        model.bfcore.whileStack
                    )
                ]
            , Html.div [ Attributes.class "six columns" ]
                [ Html.table []
                    [ tdListView model.bfcore.tape
                        |> Html.tr []
                    ]
                ]
            ]
        ]


pushWhileStack whileStack c =
    ((whileStack |> List.head |> Maybe.withDefault []) ++ [ c ]) :: (whileStack |> List.tail |> Maybe.withDefault [])


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeCode str ->
            ( { model | code = Parser.Code str }, Cmd.none )

        ChangeInput str ->
            ( { model | input = str }, Cmd.none )

        Next _ ->
            case model.bfcore.waitings of
                Nothing ->
                    let
                        bfcore =
                            model.bfcore
                    in
                    ( { model | bfcore = { bfcore | waitings = model.code |> codeToString |> String.toList |> Just } }, Cmd.none )

                Just cs ->
                    ( { model | bfcore = Core.update model.bfcore cs }, Cmd.none )

        Run ->
            let
                f =
                    Parser.parse model.code

                bfcore =
                    model.bfcore
            in
            ( { model | bfcore = { bfcore | tape = Tape.run f model.bfcore.tape } }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
