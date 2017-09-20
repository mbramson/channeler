module View exposing (..)

import Html exposing (Html, Attribute, button, div, hr, h2, text, input)
import Html.Events exposing (onClick)
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
            logInView

        Models.SignUpRoute ->
            signUpView

        Models.NotFoundRoute ->
            notFoundView


logInView : Html Msg
logInView =
    div []
        [ h2 [] [ text "Login" ]
        , hr [] []
        , input [ placeholder "Username" ] []
        , input [ placeholder "Password" ] []
        , button [ onClick Msgs.SubmitLogin ] [ text "submit" ]
        ]


signUpView : Html Msg
signUpView =
    div []
        [ h2 [] [ text "Sign up" ]
        , hr [] []
        , input [ placeholder "Username" ] []
        , input [ placeholder "Password" ] []
        , input [ placeholder "Confirm Password" ] []
        , button [ onClick Msgs.SubmitSignup ] [ text "submit" ]
        ]


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
