module BrainFuck.Snippet exposing (Snippet, codeString, toSnippets)

import BrainFuck.Parser as Parser
import Regex as Rx


type alias Snippet =
    { name : String
    , code : Parser.Code Parser.UnNormalized
    , match : Rx.Match
    }


codeString : Snippet -> String
codeString snippet =
    Parser.toString snippet.code


snippetPattern : Rx.Regex
snippetPattern =
    Maybe.withDefault Rx.never (Rx.fromString "(\\@\\w+)\n(([^\\@]|\n)*)\\@end")


submatchesToNameCode : List (Maybe String) -> Maybe ( String, Parser.Code Parser.UnNormalized )
submatchesToNameCode submatches =
    case submatches of
        mName :: (mCode :: _) ->
            case ( mName, mCode ) of
                ( Just name, Just code ) ->
                    Just ( name, Parser.cons code )

                _ ->
                    Nothing

        _ ->
            Nothing


fromMatch : Rx.Match -> Snippet
fromMatch ({ submatches } as m) =
    let
        ( name, code ) =
            submatchesToNameCode submatches |> Maybe.withDefault ( "Unnamed", Parser.none )
    in
    { name = name
    , code = code
    , match = m
    }


toSnippets : Parser.Code Parser.UnNormalized -> List Snippet
toSnippets code =
    code
        |> Parser.toString
        |> Rx.find snippetPattern
        |> List.map fromMatch
