port module Worker exposing (Model, Msg(..), consoleLog, init, main, subscriptions, update)

import Cmd.Extra as CE
import Platform as Platform


type alias Model =
    {}


type Msg
    = Hello


port consoleLog : String -> Cmd msg


init : () -> ( Model, Cmd Msg )
init _ =
    CE.withTrigger Hello {}


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Hello ->
            CE.with (consoleLog "Hello World") model


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Platform.Program () Model Msg
main =
    Platform.worker
        { init = init
        , update = update
        , subscriptions = subscriptions
        }
