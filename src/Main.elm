module Main exposing (..)

import Html exposing (Html, div, text, program)
import Models exposing (Model, initialModel)
import Navigation exposing (Location)
import UrlParser exposing (..)
import Routing


-- MODEL


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( initialModel currentRoute, Cmd.none )



-- MESSAGES


type Msg
    = OnLocationChange Location



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        Models.LogInRoute ->
            logInView

        Models.NotFoundRoute ->
            notFoundView


logInView : Html msg
logInView =
    div []
        [ text "Login"
        ]


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnLocationChange location ->
            let
                newRoute =
                    Routing.parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
