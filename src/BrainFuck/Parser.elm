module BrainFuck.Parser exposing (Code, Token(..), UnNormalized, cons, dropWhileEnd, none, toString, toTokens, whileRange)

import Regex as Rx


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


none : Code UnNormalized
none =
    Code UnNormalized ""


toString : Code UnNormalized -> String
toString (Code _ str) =
    str


normalize : Code UnNormalized -> Code Normalized
normalize (Code _ str) =
    Rx.replace (Rx.fromString "[^,-><\\]\\[\\+]" |> Maybe.withDefault Rx.never) (\_ -> "") str |> Code Normalized


toList : Code Normalized -> List Char
toList (Code _ str) =
    String.toList str


charToTokens : Char -> Maybe Token
charToTokens c =
    case c of
        '+' ->
            Just Increment

        '-' ->
            Just Decrement

        '>' ->
            Just PointerInc

        '<' ->
            Just PointerDec

        ',' ->
            Just Get

        '.' ->
            Just Put

        '[' ->
            Just While

        ']' ->
            Just End

        _ ->
            Nothing


toTokens : Code UnNormalized -> List Token
toTokens code =
    normalize code
        |> toList
        |> List.filterMap charToTokens


dropWhileEnd : List Token -> List Token
dropWhileEnd cs =
    case cs of
        c :: cs_ ->
            case c of
                While ->
                    dropWhileEnd (dropWhileEnd cs_)

                End ->
                    cs_

                _ ->
                    dropWhileEnd cs_

        [] ->
            []


whileRange : Int -> List Token -> List Token
whileRange x cs =
    case cs of
        c :: cs_ ->
            case c of
                While ->
                    c :: whileRange (x + 1) cs_

                End ->
                    if x == 0 then
                        [ c ]

                    else
                        c :: whileRange (x - 1) cs_

                _ ->
                    c :: whileRange x cs_

        [] ->
            []
