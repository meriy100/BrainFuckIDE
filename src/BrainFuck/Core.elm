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
    }


setup : Parser.Code Parser.UnNormalized -> String -> Model
setup code input =
    { tape = Tape.init
    , waitings = code |> Parser.toTokens |> Just
    , whileStack = []
    , inputBuffer = input |> String.toList |> InputBuffer
    , outputBuffer = []
    }


pushWhileStack whileStack c =
    ((whileStack |> List.head |> Maybe.withDefault []) ++ [ c ]) :: (whileStack |> List.tail |> Maybe.withDefault [])


update : Model -> List Parser.Token -> Model
update model cs =
    case cs of
        c :: cs_ ->
            case c of
                Parser.Increment ->
                    { model
                        | tape = Tape.inc model.tape
                        , waitings = Just cs_
                        , whileStack = pushWhileStack model.whileStack c
                    }

                Parser.Decrement ->
                    { model
                        | tape = Tape.dec model.tape
                        , waitings = Just cs_
                        , whileStack = pushWhileStack model.whileStack c
                    }

                Parser.PointerInc ->
                    { model
                        | tape = Tape.pointerInc model.tape
                        , waitings = Just cs_
                        , whileStack = pushWhileStack model.whileStack c
                    }

                Parser.PointerDec ->
                    { model
                        | tape = Tape.pointerDec model.tape
                        , waitings = Just cs_
                        , whileStack = pushWhileStack model.whileStack c
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
                                , waitings = Just cs_
                                , whileStack = pushWhileStack model.whileStack c
                                , inputBuffer = InputBuffer is
                            }

                Parser.Put ->
                    { model
                        | waitings = Just cs_
                        , whileStack = pushWhileStack model.whileStack c
                        , outputBuffer = model.outputBuffer ++ [ model.tape |> Tape.putValue |> Value.toInt ]
                    }

                Parser.While ->
                    if model.tape |> Tape.isZero then
                        { model
                            | waitings = Just (cs_ |> Parser.dropWhileEnd)
                            , whileStack = ((model.whileStack |> List.head |> Maybe.withDefault []) ++ [ c ] ++ Parser.whileRange 0 cs_) :: (model.whileStack |> List.tail |> Maybe.withDefault [] |> List.tail |> Maybe.withDefault [])
                        }

                    else
                        { model
                            | waitings = Just cs_
                            , whileStack = [ c ] :: model.whileStack
                        }

                Parser.End ->
                    { model
                        | waitings = Just ((model.whileStack |> List.head |> Maybe.withDefault []) ++ cs)
                        , whileStack = model.whileStack |> List.tail |> Maybe.withDefault []
                    }

        [] ->
            { model
                | waitings = Nothing
                , whileStack = []
                , inputBuffer = Waiting
            }
