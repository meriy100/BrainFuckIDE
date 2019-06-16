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
    |> charsToCommand


charsToCommand : List Char -> Tape.Command Int
charsToCommand cs =
    case cs of
        c :: cs_->
            case c of
                '+' ->
                    Tape.inc >> charsToCommand cs_
                '-' ->
                    Tape.dec >> charsToCommand cs_
                '>' ->
                    Tape.pointerInc >> charsToCommand cs_
                '<' ->
                    Tape.pointerDec >> charsToCommand cs_
                '[' ->
                    Tape.while (charsToCommand cs_) >> charsToCommand (dropWhileEnd cs_)
                ']' ->
                    Tape.none
                _ ->
                    Tape.none
        [] ->
            Tape.none

dropWhileEnd cs =
    case cs of
        c :: cs_->
            case c of
                '[' ->
                    dropWhileEnd (dropWhileEnd cs_)
                ']' ->
                    cs_
                _ ->
                    dropWhileEnd cs_
        [] ->
            []
