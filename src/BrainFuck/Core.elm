module BrainFuck.Core exposing (InputBuffer(..), Model, init, setup, update)

import BrainFuck.Parser as Parser
import BrainFuck.Tape as Tape exposing (Tape)
import BrainFuck.Value as Value exposing (Value)


type alias Model =
    { tape : Tape Value
    , waitings : Maybe (List Parser.Token)
    , whileStack : List (List Parser.Token)
    , inputBuffer : InputBuffer
    , outputBuffer : List Int
    , commandCount : Int
    }


type InputBuffer
    = Waiting
    | InputBuffer (List Char)


init =
    { tape = Tape.init
    , waitings = Nothing
    , whileStack = []
    , inputBuffer = Waiting
    , outputBuffer = []
    , commandCount = 0
    }


setup : Parser.Code Parser.UnNormalized -> String -> Model
setup code input =
    { tape = Tape.init
    , waitings = code |> Parser.toTokens |> Just
    , whileStack = []
    , inputBuffer = input |> String.toList |> InputBuffer
    , outputBuffer = []
    , commandCount = 0
    }


pushWhileStack whileStack c =
    ((whileStack |> List.head |> Maybe.withDefault []) ++ [ c ]) :: (whileStack |> List.tail |> Maybe.withDefault [])


update : Model -> List Parser.Token -> Model
update model ts =
    case ts of
        t :: ts_ ->
            case t.action of
                Parser.Increment ->
                    { model
                        | tape = Tape.inc model.tape
                        , waitings = Just ts_
                        , whileStack = pushWhileStack model.whileStack t
                        , commandCount = model.commandCount + 1
                    }

                Parser.Decrement ->
                    { model
                        | tape = Tape.dec model.tape
                        , waitings = Just ts_
                        , whileStack = pushWhileStack model.whileStack t
                        , commandCount = model.commandCount + 1
                    }

                Parser.PointerInc ->
                    { model
                        | tape = Tape.pointerInc model.tape
                        , waitings = Just ts_
                        , whileStack = pushWhileStack model.whileStack t
                        , commandCount = model.commandCount + 1
                    }

                Parser.PointerDec ->
                    { model
                        | tape = Tape.pointerDec model.tape
                        , waitings = Just ts_
                        , whileStack = pushWhileStack model.whileStack t
                        , commandCount = model.commandCount + 1
                    }

                Parser.Get ->
                    case model.inputBuffer of
                        Waiting ->
                            model

                        InputBuffer [] ->
                            { model
                                | inputBuffer = Waiting
                            }

                        InputBuffer (i :: is) ->
                            { model
                                | tape = Tape.get i model.tape
                                , waitings = Just ts_
                                , whileStack = pushWhileStack model.whileStack t
                                , inputBuffer = InputBuffer is
                                , commandCount = model.commandCount + 1
                            }

                Parser.Put ->
                    { model
                        | waitings = Just ts_
                        , whileStack = pushWhileStack model.whileStack t
                        , outputBuffer = model.outputBuffer ++ [ model.tape |> Tape.putValue |> Value.toInt ]
                        , commandCount = model.commandCount + 1
                    }

                Parser.While ->
                    if model.tape |> Tape.isZero then
                        { model
                            | waitings = Just (ts_ |> Parser.dropWhileEnd)
                            , whileStack = ((model.whileStack |> List.head |> Maybe.withDefault []) ++ [ t ] ++ Parser.whileRange 0 ts_) :: (model.whileStack |> List.tail |> Maybe.withDefault [] |> List.tail |> Maybe.withDefault [])
                            , commandCount = model.commandCount + 1
                        }

                    else
                        { model
                            | waitings = Just ts_
                            , whileStack = [ t ] :: model.whileStack
                            , commandCount = model.commandCount + 1
                        }

                Parser.End ->
                    { model
                        | waitings = Just ((model.whileStack |> List.head |> Maybe.withDefault []) ++ ts)
                        , whileStack = model.whileStack |> List.tail |> Maybe.withDefault []
                        , commandCount = model.commandCount + 1
                    }

        [] ->
            { model
                | waitings = Nothing
                , whileStack = []
                , inputBuffer = Waiting
            }
