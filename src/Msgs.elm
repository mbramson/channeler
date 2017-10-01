module Msgs exposing (..)

import Navigation exposing (Location)
import RemoteData exposing (WebData)
import Models exposing (User, Session)


type Msg
    = OnLocationChange Location
    | Logout
    | LoginSubmit
    | SignupSubmit
    | OnFetchSession (WebData Session)
    | SignupChangeEmail String
    | SignupChangeUsername String
    | SignupChangePassword String
    | SignupChangePasswordConfirmation String
