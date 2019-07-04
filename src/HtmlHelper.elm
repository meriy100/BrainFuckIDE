module HtmlHelper exposing (nl2br)

import Html as H exposing (Html)
import Regex as Rx


nlPattern =
    Rx.fromString "\n"
        |> Maybe.withDefault Rx.never


nl2br : String -> List (Html msg)
nl2br string =
    Rx.split nlPattern string
        |> List.map H.text
        |> List.map List.singleton
        |> List.map (H.p [])
