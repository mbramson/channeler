module View exposing (..)

import Html exposing (Html, Attribute, button, div, hr, h2, p, text, input)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)
import Models exposing (Model)
import Msgs exposing (Msg)


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        Models.LogInRoute ->
            logInView model

        Models.SignUpRoute ->
            signUpView model

        Models.NotFoundRoute ->
            notFoundView


logInView : Model -> Html Msg
logInView model =
    div []
        [ h2 [] [ text "Login" ]
        , hr [] []
        , p [] [ text model.formFields.email ]
        , p [] [ text model.formFields.password ]
        , hr [] []
        , p []
            [ input [ type_ "text", placeholder "Email", onInput Msgs.SignupChangeEmail ] []
            ]
        , p []
            [ input [ type_ "password", placeholder "Password", onInput Msgs.SignupChangePassword ] []
            ]
        , button [ onClick Msgs.SubmitLogin ] [ text "submit" ]
        ]


signUpView : Model -> Html Msg
signUpView model =
    div []
        [ h2 [] [ text "Sign up" ]
        , hr [] []
        , p [] [ text model.formFields.username ]
        , p [] [ text model.formFields.email ]
        , p [] [ text model.formFields.password ]
        , p [] [ text model.formFields.passwordConfirmation ]
        , hr [] []
        , p []
            [ input [ type_ "text", placeholder "Username", onInput Msgs.SignupChangeUsername ] []
            ]
        , p []
            [ input [ type_ "text", placeholder "Email", onInput Msgs.SignupChangeEmail ] []
            ]
        , p []
            [ input [ type_ "password", placeholder "Password", onInput Msgs.SignupChangePassword ] []
            ]
        , p []
            [ input [ type_ "password", placeholder "Confirm Password", onInput Msgs.SignupChangePasswordConfirmation ] []
            ]
        , button [ onClick Msgs.SignupSubmit ] [ text "submit" ]
        ]


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
