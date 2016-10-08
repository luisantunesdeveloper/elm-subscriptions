import Html exposing(Html, div, text)
import Html.App
import Keyboard exposing (..)


-- MODEL


type alias Model =
    Int


init : (Model, Cmd Msg)
init =
    (0, Cmd.none)


-- MESSAGES


type Msg =
    KeyMsg Keyboard.KeyCode


-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text (toString model) ]


-- UPDATE


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        KeyMsg code ->
            (model + 2, Cmd.none)


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Keyboard.presses (\code -> KeyMsg code)


-- MAIN


main : Program Never
main =
    Html.App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
