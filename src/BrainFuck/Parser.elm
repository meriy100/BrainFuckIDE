module BrainFuck.Parser exposing (Code(..), dropWhileEnd, whileRange)


type Code
    = Code String


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
