module Main exposing (Model, Msg(..), init, main, subscriptions, tdListView, update, view)

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
    , tape : Tape Int
    , waitings : Maybe (List Char)
    , whileStack : List (List Char)
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
      , tape = Tape.init
      , waitings = Nothing
      , whileStack = []
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
                    [ model.waitings
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
                        model.whileStack
                    )
                ]
            , Html.div [ Attributes.class "six columns" ]
                [ Html.table []
                    [ tdListView model.tape
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
            case model.waitings of
                Nothing ->
                    ( { model | waitings = model.code |> codeToString |> String.toList |> Just }, Cmd.none )

                Just cs ->
                    case cs of
                        c :: cs_ ->
                            case c of
                                '+' ->
                                    ( { model
                                        | tape = Tape.inc model.tape
                                        , waitings = Just cs_
                                        , whileStack = pushWhileStack model.whileStack c
                                      }
                                    , Cmd.none
                                    )

                                '-' ->
                                    ( { model
                                        | tape = Tape.dec model.tape
                                        , waitings = Just cs_
                                        , whileStack = pushWhileStack model.whileStack c
                                      }
                                    , Cmd.none
                                    )

                                '>' ->
                                    ( { model
                                        | tape = Tape.pointerInc model.tape
                                        , waitings = Just cs_
                                        , whileStack = pushWhileStack model.whileStack c
                                      }
                                    , Cmd.none
                                    )

                                '<' ->
                                    ( { model
                                        | tape = Tape.pointerDec model.tape
                                        , waitings = Just cs_
                                        , whileStack = pushWhileStack model.whileStack c
                                      }
                                    , Cmd.none
                                    )

                                '.' ->
                                    ( model, Cmd.none )

                                '[' ->
                                    if model.tape |> Tape.isZero then
                                        ( { model
                                            | waitings = Just (cs_ |> Parser.dropWhileEnd)
                                            , whileStack = ((model.whileStack |> List.head |> Maybe.withDefault []) ++ [ c ] ++ Parser.whileRange 0 cs_) :: (model.whileStack |> List.tail |> Maybe.withDefault [] |> List.tail |> Maybe.withDefault [])
                                          }
                                        , Cmd.none
                                        )

                                    else
                                        ( { model
                                            | waitings = Just cs_
                                            , whileStack = [ c ] :: model.whileStack
                                          }
                                        , Cmd.none
                                        )

                                ']' ->
                                    ( { model
                                        | waitings = Just ((model.whileStack |> List.head |> Maybe.withDefault []) ++ cs)
                                        , whileStack = model.whileStack |> List.tail |> Maybe.withDefault []
                                      }
                                    , Cmd.none
                                    )

                                _ ->
                                    ( model, Cmd.none )

                        [] ->
                            ( model, Cmd.none )

        Run ->
            let
                f =
                    Parser.parse model.code
            in
            ( { model | tape = Tape.run f model.tape }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
