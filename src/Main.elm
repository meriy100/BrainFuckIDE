port module Main exposing (Model, Msg(..), init, main, subscriptions, tdListView, update, view)

import BrainFuck.Core as Core
import BrainFuck.Parser as Parser
import BrainFuck.Snippet as Snippet
import BrainFuck.Tape as Tape exposing (Tape)
import BrainFuck.Value as Value
import Browser as Browser
import Cmd.Extra as CEx
import Html as Html exposing (Html)
import Html.Attributes as Attributes
import Html.Events as Events
import HtmlHelper as HH
import Task as Task


type alias CodeInputRecord =
    { inputType : String
    , snippetId : Maybe String
    , codeString : String
    }


port codeOnInput : (CodeInputRecord -> msg) -> Sub msg


port run : (Int -> msg) -> Sub msg


port createBreakePoint : Int -> Cmd msg


port destroyBreakePoint : Int -> Cmd msg


type alias Model =
    { code : Parser.Code Parser.UnNormalized
    , input : String
    , snippets : List Snippet.Snippet
    , bfcore : Core.Model
    }


type Msg
    = ChangeCode CodeInputRecord
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


init : String -> ( Model, Cmd Msg )
init codeStr =
    let
        snippets =
            Parser.cons codeStr |> Snippet.toSnippets
    in
    ( { code = Parser.cons codeStr
      , input = ""
      , snippets = snippets
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


viewSnippet : Snippet.Snippet -> Html Msg
viewSnippet snippet =
    Html.div [ Attributes.class "snippetCard" ]
        [ Html.div [ Attributes.class "snippetCard__name" ]
            [ Html.text snippet.name
            ]
        , Snippet.codeString snippet
            |> HH.nl2br [ Attributes.class "snippetCard__line" ]
            |> Html.div [ Attributes.class "snippetCard__code" ]
        ]


view : Model -> Html Msg
view model =
    Html.node "main"
        [ Attributes.class "l-editor" ]
        [ Html.div [ Attributes.class "row l-editor-row" ]
            [ Html.div [ Attributes.class "six columns l-editor-columns" ]
                [ Html.textarea
                    [ Attributes.id "editor"
                    , Attributes.style "display" "none"
                    , model.code |> Parser.toString |> Attributes.value
                    ]
                    []
                ]
            , Html.div [ Attributes.class "six columns l-editor-columns" ]
                [ Html.div []
                    [ Html.button [ Events.onClick Run ] [ Html.text "Run" ]
                    ]
                , Html.div []
                    [ Html.textarea [ Events.onInput ChangeInput, model.input |> Attributes.value ] []
                    ]
                , Html.div []
                    [ Html.p []
                        [ model.bfcore.outputBuffer
                            |> List.map Char.fromCode
                            |> String.fromList
                            |> Html.text
                        ]
                    ]
                , Html.table []
                    [ tdListView model.bfcore.tape
                        |> Html.tr []
                    ]
                , model.snippets
                    |> List.map viewSnippet
                    |> Html.div []
                ]
            ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeCode { codeString } ->
            CEx.pure
                { model
                    | code = Parser.cons codeString
                    , snippets = Parser.cons codeString |> Snippet.toSnippets
                }

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
        , run (\_ -> Run)
        ]
