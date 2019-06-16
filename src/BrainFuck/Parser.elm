module BrainFuck.Parser exposing (..)

import BrainFuck.Tape as Tape exposing (Tape)

type Code
    = Code String

--codeToString : Code -> String
--codeToString (Code cs) =
--    cs


parse : Code -> Tape.Command Int
parse (Code cs) =
    String.toList cs
    |> List.map charToCommand
    |> List.foldr (>>) Tape.inc


charToCommand : Char -> Tape.Command Int
charToCommand c =
    case c of
        '+' ->
            Tape.inc
        '-' ->
            Tape.dec
        '>' ->
            Tape.pointerInc
        '<' ->
            Tape.pointerDec
        _ ->
            Tape.inc


