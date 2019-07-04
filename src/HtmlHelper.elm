module HtmlHelper exposing (nl2br)

import Html as H exposing (Attribute, Html)
import Regex as Rx


nlPattern =
    Rx.fromString "\n"
        |> Maybe.withDefault Rx.never


nl2br : List (Attribute msg) -> String -> List (Html msg)
nl2br attributes string =
    Rx.split nlPattern string
        |> List.map H.text
        |> List.map List.singleton
        |> List.map (H.p attributes)
