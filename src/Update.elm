module Update exposing (..)

import Commands exposing (..)
import Msgs exposing (Msg)
import Models exposing (Model, Session)
import RemoteData exposing (WebData)
import Routing exposing (parseLocation)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.OnLocationChange location ->
            let
                newRoute =
                    Routing.parseLocation location

                clearedModel =
                    model |> clearFields
            in
                ( { clearedModel | route = newRoute }, Cmd.none )

        Msgs.Logout ->
            ( model |> logout, Cmd.none )

        Msgs.LoginSubmit ->
            ( model |> clearFields, loginUser model.formFields )

        Msgs.SignupSubmit ->
            ( model |> clearFields, signupUser model.formFields )

        Msgs.OnFetchSession session ->
            ( model |> addSession session, Cmd.none )

        Msgs.SignupChangeUsername userName ->
            ( model |> updateUserName userName, Cmd.none )

        Msgs.SignupChangeEmail email ->
            ( model |> updateEmail email, Cmd.none )

        Msgs.SignupChangePassword password ->
            ( model |> updatePassword password, Cmd.none )

        Msgs.SignupChangePasswordConfirmation passwordConfirmation ->
            ( model |> updatePasswordConfirmation passwordConfirmation, Cmd.none )


logout : Model -> Model
logout model =
    { model | currentUser = Nothing, jwt = Nothing }


addSession : WebData Session -> Model -> Model
addSession sessionData model =
    case sessionData of
        RemoteData.Success session ->
            { model | currentUser = Just session.user, jwt = Just session.jwt }

        _ ->
            model


clearFields : Model -> Model
clearFields model =
    { model | formFields = Models.initialFormFields }


updateUserName : String -> Model -> Model
updateUserName newUserName model =
    let
        fields =
            model.formFields

        newFields =
            { fields | username = newUserName }
    in
        { model | formFields = newFields }


updateEmail : String -> Model -> Model
updateEmail newEmail model =
    let
        fields =
            model.formFields

        newFields =
            { fields | email = newEmail }
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
