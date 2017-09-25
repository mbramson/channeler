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

        Msgs.SubmitLogin ->
            ( model |> clearFields, Cmd.none )

        Msgs.OnFetchSignup session ->
            ( model |> loginUser session, Cmd.none )

        Msgs.SignupSubmit ->
            ( model |> clearFields, signupUser model.formFields )

        Msgs.SignupChangeUsername userName ->
            ( model |> updateUserName userName, Cmd.none )

        Msgs.SignupChangeEmail email ->
            ( model |> updateEmail email, Cmd.none )

        Msgs.SignupChangePassword password ->
            ( model |> updatePassword password, Cmd.none )

        Msgs.SignupChangePasswordConfirmation passwordConfirmation ->
            ( model |> updatePasswordConfirmation passwordConfirmation, Cmd.none )


loginUser : WebData Session -> Model -> Model
loginUser sessionData model =
    case sessionData of
        RemoteData.Success session ->
            { model | currentUser = Just session.user }

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
