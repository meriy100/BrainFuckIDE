module BrainFuck.Parser exposing (Action(..), Code, Token, UnNormalized, cons, dropWhileEnd, none, toString, toTokens, whileRange)

import Regex as Rx


type Normalized
    = Normalized


type UnNormalized
    = UnNormalized


type Code a
    = Code String


type alias LineNumber =
    Int


type alias Token =
    { lineNumber : LineNumber
    , action : Action
    }


type Action
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
    Code str


none : Code UnNormalized
none =
    Code ""


toString : Code UnNormalized -> String
toString (Code str) =
    str


normalize : Code UnNormalized -> Code Normalized
normalize (Code str) =
    --    Rx.replace (Rx.fromString "[^,-><\\]\\[\\+]" |> Maybe.withDefault Rx.never) (\_ -> "") str |> Code
    Code str


nlPattern : Rx.Regex
nlPattern =
    Rx.fromString "\n" |> Maybe.withDefault Rx.never


splitNl : Code Normalized -> List ( LineNumber, Code Normalized )
splitNl (Code str) =
    Rx.split nlPattern str
        |> List.map Code
        |> List.indexedMap Tuple.pair


f : ( LineNumber, Code Normalized ) -> List ( LineNumber, Char )
f ( lineNumber, Code str ) =
    String.toList str
        |> List.map (Tuple.pair lineNumber)


toList : List ( LineNumber, Code Normalized ) -> List ( LineNumber, Char )
toList cs =
    cs
        |> List.map f
        |> List.concat


charToTokens : ( LineNumber, Char ) -> Maybe Token
charToTokens ( n, c ) =
    case c of
        '+' ->
            Just { lineNumber = n, action = Increment }

        '-' ->
            Just { lineNumber = n, action = Decrement }

        '>' ->
            Just { lineNumber = n, action = PointerInc }

        '<' ->
            Just { lineNumber = n, action = PointerDec }

        ',' ->
            Just { lineNumber = n, action = Get }

        '.' ->
            Just { lineNumber = n, action = Put }

        '[' ->
            Just { lineNumber = n, action = While }

        ']' ->
            Just { lineNumber = n, action = End }

        _ ->
            Nothing


toTokens : Code UnNormalized -> List Token
toTokens code =
    normalize code
        |> splitNl
        |> toList
        |> List.filterMap charToTokens


dropWhileEnd : List Token -> List Token
dropWhileEnd ts =
    case ts of
        t :: ts_ ->
            case t.action of
                While ->
                    dropWhileEnd (dropWhileEnd ts_)

                End ->
                    ts_

                _ ->
                    dropWhileEnd ts_

        [] ->
            []


whileRange : Int -> List Token -> List Token
whileRange x ts =
    case ts of
        t :: ts_ ->
            case t.action of
                While ->
                    t :: whileRange (x + 1) ts_

                End ->
                    if x == 0 then
                        [ t ]

                    else
                        t :: whileRange (x - 1) ts_

                _ ->
                    t :: whileRange x ts_

        [] ->
            []
