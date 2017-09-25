module Models exposing (..)


type alias Model =
    { currentUser : Maybe User
    , route : Route
    , formFields : FormFields
    }


initialModel : Route -> Model
initialModel route =
    { currentUser = Nothing
    , route = route
    , formFields = initialFormFields
    }


initialFormFields : FormFields
initialFormFields =
    { username = ""
    , email = ""
    , password = ""
    , passwordConfirmation = ""
    }


type alias Session =
    { user : User
    , jwt : String
    }


type alias User =
    { id : Int
    , username : String
    , email : String
    }


type alias FormFields =
    { username : String
    , email : String
    , password : String
    , passwordConfirmation : String
    }


type Route
    = LogInRoute
    | SignUpRoute
    | NotFoundRoute
