module Main exposing (Model, Msg(..), init, main, subscriptions, tdListView, update, view)

import BrainFuck.Core as Core
import BrainFuck.Parser as Parser
import BrainFuck.Tape as Tape exposing (Tape)
import BrainFuck.Value as Value
import Browser as Browser
import Cmd.Extra as CEx
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
    | Next


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


tdListView : Tape Value.Value -> List (Html Msg)
tdListView tape =
    Tape.currentOrMap
        (Html.td [ Attributes.style "color" "red" ] << List.singleton << Html.text << String.fromInt << Value.toInt)
        (Html.td [] << List.singleton << Html.text << String.fromInt << Value.toInt)
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
                    , Html.button [ Events.onClick Next ] [ Html.text "Next" ]
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
        , Html.div [ Attributes.class "six columns" ]
            [ Html.p []
                [ model.bfcore.outputBuffer
                    |> List.map Char.fromCode
                    |> String.fromList
                    |> Html.text
                ]
            ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeCode str ->
            CEx.pure { model | code = Parser.Code str }

        ChangeInput str ->
            CEx.pure { model | input = str }

        Next ->
            case model.bfcore.waitings of
                Nothing ->
                    CEx.pure model

                Just cs ->
                    case model.bfcore.inputBuffer of
                        Core.Waiting ->
                            CEx.pure model

                        _ ->
                            CEx.withTrigger Next { model | bfcore = Core.update model.bfcore cs }

        Run ->
            case model.bfcore.waitings of
                Nothing ->
                    let
                        bfcore =
                            model.bfcore
                    in
                    CEx.withTrigger Next { model | bfcore = { bfcore | waitings = model.code |> codeToString |> String.toList |> Just, inputBuffer = model.input |> String.toList |> Core.InputBuffer } }

                Just cs ->
                    CEx.pure model


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
