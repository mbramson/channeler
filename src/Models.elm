module Models exposing (..)


type alias Model =
    { currentUser : String
    , route : Route
    , formFields : InitialFormFields
    }


initialModel : Route -> Model
initialModel route =
    { currentUser = "matt"
    , route = route
    , formFields = initialFormFields
    }


initialFormFields : InitialFormFields
initialFormFields =
    { username = ""
    , password = ""
    , passwordConfirmation = ""
    }


type alias InitialFormFields =
    { username : String
    , password : String
    , passwordConfirmation : String
    }


type Route
    = LogInRoute
    | SignUpRoute
    | NotFoundRoute
