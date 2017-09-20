module View exposing (..)

import Html exposing (Html, div, text)
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
            logInView

        Models.SignUpRoute ->
            signUpView

        Models.NotFoundRoute ->
            notFoundView


logInView : Html msg
logInView =
    div []
        [ text "Login"
        ]


signUpView : Html msg
signUpView =
    div []
        [ text "Sign-up"
        ]


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
