module BrainFuck.Parser exposing (Code(..), charsToCommand, dropWhileEnd, parse, whileRange)

import BrainFuck.Tape as Tape exposing (Tape)


type Code
    = Code String


parse : Code -> Tape.Command Int
parse (Code cs) =
    String.toList cs
        |> charsToCommand


charsToCommand : List Char -> Tape.Command Int
charsToCommand cs =
    case cs of
        c :: cs_ ->
            case c of
                '+' ->
                    Tape.inc >> charsToCommand cs_

                '-' ->
                    Tape.dec >> charsToCommand cs_

                '>' ->
                    Tape.pointerInc >> charsToCommand cs_

                '<' ->
                    Tape.pointerDec >> charsToCommand cs_

                '.' ->
                    Tape.put >> charsToCommand cs_

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
        c :: cs_ ->
            case c of
                '[' ->
                    dropWhileEnd (dropWhileEnd cs_)

                ']' ->
                    cs_

                _ ->
                    dropWhileEnd cs_

        [] ->
            []


whileRange : Int -> List Char -> List Char
whileRange x cs =
    case cs of
        c :: cs_ ->
            case c of
                '[' ->
                    c :: whileRange (x + 1) cs_

                ']' ->
                    if x == 0 then
                        [ c ]

                    else
                        c :: whileRange (x - 1) cs_

                _ ->
                    c :: whileRange x cs_

        [] ->
            []
