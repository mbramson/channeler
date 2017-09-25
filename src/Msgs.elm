module Msgs exposing (..)

import Navigation exposing (Location)
import RemoteData exposing (WebData)
import Models exposing (User, Session)


type Msg
    = OnLocationChange Location
    | SubmitLogin
    | OnFetchSignup (WebData Session)
    | SignupSubmit
    | SignupChangeUsername String
    | SignupChangePassword String
    | SignupChangePasswordConfirmation String
