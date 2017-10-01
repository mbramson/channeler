module Models exposing (..)


type alias Model =
    { currentUser : Maybe User
    , jwt : Maybe String
    , route : Route
    , formFields : FormFields
    , flash : Maybe Flash
    }


initialModel : Route -> Model
initialModel route =
    { currentUser = Nothing
    , jwt = Nothing
    , route = route
    , formFields = initialFormFields
    , flash = Nothing
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


type alias Flash =
    { message : String
    , flash_type : String
    }
