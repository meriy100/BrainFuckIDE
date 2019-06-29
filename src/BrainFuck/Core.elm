module BrainFuck.Core exposing (Model, init, update)

import BrainFuck.Parser as Parser
import BrainFuck.Tape as Tape exposing (Tape)
import BrainFuck.Value as Value exposing (Value)


type alias Model =
    { tape : Tape Int
    , waitings : Maybe (List Char)
    , whileStack : List (List Char)
    }


init =
    { tape = Tape.init
    , waitings = Nothing
    , whileStack = []
    }


codeToString (Parser.Code str) =
    str


pushWhileStack whileStack c =
    ((whileStack |> List.head |> Maybe.withDefault []) ++ [ c ]) :: (whileStack |> List.tail |> Maybe.withDefault [])


update : Model -> List Char -> Model
update model cs =
    case cs of
        c :: cs_ ->
            case c of
                '+' ->
                    { model
                        | tape = Tape.inc model.tape
                        , waitings = Just cs_
                        , whileStack = pushWhileStack model.whileStack c
                    }

                '-' ->
                    { model
                        | tape = Tape.dec model.tape
                        , waitings = Just cs_
                        , whileStack = pushWhileStack model.whileStack c
                    }

                '>' ->
                    { model
                        | tape = Tape.pointerInc model.tape
                        , waitings = Just cs_
                        , whileStack = pushWhileStack model.whileStack c
                    }

                '<' ->
                    { model
                        | tape = Tape.pointerDec model.tape
                        , waitings = Just cs_
                        , whileStack = pushWhileStack model.whileStack c
                    }

                '.' ->
                    model

                '[' ->
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

                ']' ->
                    { model
                        | waitings = Just ((model.whileStack |> List.head |> Maybe.withDefault []) ++ cs)
                        , whileStack = model.whileStack |> List.tail |> Maybe.withDefault []
                    }

                _ ->
                    model

        [] ->
            model
