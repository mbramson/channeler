module Msgs exposing (..)

import Navigation exposing (Location)


type Msg
    = OnLocationChange Location
    | SubmitLogin
    | SignupSubmit
    | SignupChangeUsername String
    | SignupChangePassword String
    | SignupChangePasswordConfirmation String
