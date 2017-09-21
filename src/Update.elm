module Update exposing (..)

import Msgs exposing (Msg)
import Models exposing (Model)
import Routing exposing (parseLocation)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.OnLocationChange location ->
            let
                newRoute =
                    Routing.parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )

        Msgs.SubmitLogin ->
            ( model, Cmd.none )

        Msgs.SignupSubmit ->
            ( model, Cmd.none )

        Msgs.SignupChangeUsername userName ->
            ( model |> updateUserName userName, Cmd.none )

        Msgs.SignupChangePassword password ->
            ( model |> updatePassword password, Cmd.none )

        Msgs.SignupChangePasswordConfirmation passwordConfirmation ->
            ( model |> updatePasswordConfirmation passwordConfirmation, Cmd.none )


updateUserName : String -> Model -> Model
updateUserName newUserName model =
    let
        fields =
            model.formFields

        newFields =
            { fields | username = newUserName }
    in
        { model | formFields = newFields }


updatePassword : String -> Model -> Model
updatePassword newPassword model =
    let
        fields =
            model.formFields

        newFields =
            { fields | password = newPassword }
    in
        { model | formFields = newFields }


updatePasswordConfirmation : String -> Model -> Model
updatePasswordConfirmation newPasswordConfirmation model =
    let
        fields =
            model.formFields

        newFields =
            { fields | passwordConfirmation = newPasswordConfirmation }
    in
        { model | formFields = newFields }
