module Main exposing (..)

import Html exposing (Html, div, text, program)
import Navigation exposing (Location)
import UrlParser exposing (..)


-- MODEL


type alias Model =
    { current_user : String
    , route : Route
    }


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            parseLocation location
    in
        ( initialModel currentRoute, Cmd.none )


initialModel : Route -> Model
initialModel route =
    { current_user = "matt"
    , route = route
    }


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map LogInRoute top
        ]



-- ROUTING


type Route
    = LogInRoute
    | NotFoundRoute



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
        LogInRoute ->
            logInView

        NotFoundRoute ->
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
                    parseLocation location
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
