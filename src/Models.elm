module Models exposing (..)


type alias Model =
    { current_user : String
    , route : Route
    }


initialModel : Route -> Model
initialModel route =
    { current_user = "matt"
    , route = route
    }


type Route
    = LogInRoute
    | SignUpRoute
    | NotFoundRoute
