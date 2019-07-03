port module Main exposing (Model, Msg(..), init, main, subscriptions, tdListView, update, view)

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


port codeOnInput : (String -> msg) -> Sub msg


type alias Model =
    { code : Parser.Code Parser.UnNormalized
    , input : String
    , bfcore : Core.Model
    }


type Msg
    = ChangeCode String
    | ChangeInput String
    | Run
    | Next


main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


sample =
    ">+++++++++[<++++++++>-]<.>+++++++[<++++>-]<+.+++++++..+++.[-]>++++++++[<++++>-]<.>+++++++++++[<+++++>-]<.>++++++++[<+++>-]<.+++.------.--------.[-]>++++++++[<++++>-]<+.[-]++++++++++."


init : () -> ( Model, Cmd Msg )
init _ =
    ( { code = Parser.cons sample
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
    Html.div [ Attributes.class "e ]
        [ Html.h1 [] [ Html.text "Hello BF World!" ]
        , Html.div [ Attributes.class "row" ]
            [ Html.div [ Attributes.class "six columns" ]
                [ Html.div []
                    [ Html.button [ Events.onClick Run ] [ Html.text "Run" ]
                    , Html.button [ Events.onClick Next ] [ Html.text "Next" ]
                    ]
                ]
            ]
        , Html.div [ Attributes.class "row" ]
            [ Html.div [ Attributes.class "six columns" ]
                [ Html.div [ Attributes.class "editor" ]
                    [ Html.textarea
                        [ Attributes.id "editor"
                        , Attributes.style "display" "none"
                        , model.code |> Parser.toString |> Attributes.value
                        ]
                        []
                    ]
                ]
            , Html.div [ Attributes.class "six columns" ]
                [ Html.table []
                    [ tdListView model.bfcore.tape
                        |> Html.tr []
                    ]
                ]
            ]
        , Html.div [ Attributes.class "row" ]
            [ Html.div [ Attributes.class "six columns" ]
                [ Html.div []
                    [ Html.textarea [ Events.onInput ChangeInput, model.input |> Attributes.value ] []
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
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeCode str ->
            CEx.pure { model | code = Parser.cons str }

        ChangeInput str ->
            CEx.pure { model | input = str }

        Next ->
            case model.bfcore.waitings of
                Nothing ->
                    CEx.pure model

                Just cs ->
                    if model.bfcore.commandCount == 10000 then
                        CEx.pure model

                    else
                        case model.bfcore.inputBuffer of
                            Core.Waiting ->
                                CEx.pure model

                            _ ->
                                CEx.withTrigger Next { model | bfcore = Core.update model.bfcore cs }

        Run ->
            case model.bfcore.waitings of
                Nothing ->
                    CEx.withTrigger Next { model | bfcore = Core.setup model.code model.input }

                Just cs ->
                    CEx.pure model


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ codeOnInput ChangeCode
        ]
