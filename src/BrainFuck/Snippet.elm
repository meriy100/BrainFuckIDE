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
    Maybe.withDefault Rx.never (Rx.fromString "\\@(\\w+)\n(.|\n)*\\@end")


fromMatch : Rx.Match -> Snippet
fromMatch ({ match, submatches } as m) =
    { name = submatches |> List.head |> Maybe.withDefault Nothing |> Maybe.withDefault "Unnamed"
    , code = Parser.cons match
    , match = m
    }


toSnippets : Parser.Code Parser.UnNormalized -> List Snippet
toSnippets code =
    code
        |> Parser.toString
        |> Rx.find snippetPattern
        |> List.map fromMatch
