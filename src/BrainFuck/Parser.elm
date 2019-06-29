module BrainFuck.Parser exposing (Code, UnNormalized, cons, dropWhileEnd, toString, whileRange)


type Normalized
    = Normalized


type UnNormalized
    = UnNormalized


type Code a
    = Code a String


type Token
    = Increment
    | Decrement
    | PointerInc
    | PointerDec
    | Get
    | Put
    | While
    | End


cons : String -> Code UnNormalized
cons str =
    Code UnNormalized str


toString (Code _ str) =
    str



--
--normalize : Code UnNormalized -> Code Normalized
--normalize (Code _ str) =


toTokens : Code Normalized -> List Token
toTokens (Code _ s) =
    case '-' of
        '+' ->
            []

        '-' ->
            []

        '>' ->
            []

        '<' ->
            []

        ',' ->
            []

        '.' ->
            []

        '[' ->
            []

        ']' ->
            []

        _ ->
            []


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
