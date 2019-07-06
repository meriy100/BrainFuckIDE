module BrainFuck.Core exposing (InputBuffer(..), Model, init, setup, update)

import BrainFuck.Parser as Parser
import BrainFuck.Tape as Tape exposing (Tape)
import BrainFuck.Value as Value exposing (Value)


type alias Model =
    { tape : Tape Value
    , waitings : Waitings
    , whileStack : WhileStack
    , inputBuffer : InputBuffer
    , outputBuffer : List Int
    , commandCount : CommandCount
    }


type alias Waitings =
    Maybe (List Parser.Token)


type alias WhileStack =
    List (List Parser.Token)


type alias CommandCount =
    Int


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


pushWhileStack : WhileStack -> Parser.Token -> WhileStack
pushWhileStack whileStack token =
    ((whileStack |> List.head |> Maybe.withDefault []) ++ [ token ]) :: (whileStack |> List.tail |> Maybe.withDefault [])


nextModel : Model -> Parser.Token -> List Parser.Token -> Tape Value -> Model
nextModel model t ts nextTape =
    { model
        | tape = nextTape
        , waitings = Just ts
        , whileStack = pushWhileStack model.whileStack t
        , commandCount = model.commandCount + 1
    }


update : Model -> List Parser.Token -> Model
update model ts =
    case ts of
        t :: ts_ ->
            case t.action of
                Parser.Increment ->
                    Tape.inc model.tape
                        |> nextModel model t ts_

                Parser.Decrement ->
                    Tape.dec model.tape
                        |> nextModel model t ts_

                Parser.PointerInc ->
                    Tape.pointerInc model.tape
                        |> nextModel model t ts_

                Parser.PointerDec ->
                    Tape.pointerDec model.tape
                        |> nextModel model t ts_

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
