module Msgs exposing (..)

import Navigation exposing (Location)
import RemoteData exposing (WebData)
import Models exposing (User, Session)


type Msg
    = OnLocationChange Location
    | SubmitLogin
    | OnFetchSignup (WebData Session)
    | SignupSubmit
    | SignupChangeEmail String
    | SignupChangeUsername String
    | SignupChangePassword String
    | SignupChangePasswordConfirmation String
