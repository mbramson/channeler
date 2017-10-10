module View exposing (..)

import Views.HeaderView exposing (navBar, flashMessage)
import Html exposing (Html, Attribute, a, button, div, h4, label, nav, p, text, input, span, ul, li)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)
import Models exposing (Model, User, Flash)
import Msgs exposing (Msg)


view : Model -> Html Msg
view model =
    div [ class "container-fluid" ]
        [ navBar model
        , div [ class "container" ]
            [ flashMessage model.flash
            , page model
            ]
        ]


page : Model -> Html Msg
page model =
    case model.route of
        Models.HomeRoute ->
            homeView model

        Models.LogInRoute ->
            logInView model

        Models.SignUpRoute ->
            signUpView model

        Models.NotFoundRoute ->
            notFoundView


homeView : Model -> Html Msg
homeView model =
    div []
        [ text "Welcome to the app!" ]


logInView : Model -> Html Msg
logInView model =
    div []
        [ h4 [ class "display-4" ] [ text "Login" ]
        , Html.form []
            [ div [ class "form-group" ]
                [ label [ for "logInEmail" ] [ text "Email" ]
                , input [ class "form-control", type_ "text", placeholder "Email", id "logInEmail", onInput Msgs.SignupChangeEmail ] []
                ]
            , div [ class "form-group" ]
                [ label [ for "logInPassword" ] [ text "Password" ]
                , input [ class "form-control", type_ "password", placeholder "Password", id "logInPassword", onInput Msgs.SignupChangePassword ] []
                ]
            , button [ onClick Msgs.LoginSubmit, class "btn btn-primary" ] [ text "submit" ]
            ]
        ]


signUpView : Model -> Html Msg
signUpView model =
    div []
        [ h4 [ class "display-4" ] [ text "Sign up" ]
        , Html.form []
            [ div [ class "form-group" ]
                [ label [ for "signUpUsername" ] [ text "Username" ]
                , input [ class "form-control", type_ "text", placeholder "Username", id "signUpUsername", onInput Msgs.SignupChangeUsername ] []
                ]
            , div [ class "form-group" ]
                [ label [ for "signUpEmail" ] [ text "Email" ]
                , input [ class "form-control", type_ "text", placeholder "Email", id "signUpEmail", onInput Msgs.SignupChangeEmail ] []
                ]
            , div [ class "form-group" ]
                [ label [ for "signUpPassword" ] [ text "Password" ]
                , input [ class "form-control", type_ "password", placeholder "Password", id "signUpPassword", onInput Msgs.SignupChangePassword ] []
                ]
            , div [ class "form-group" ]
                [ label [ for "signUpPasswordConfirmation" ] [ text "Password" ]
                , input [ class "form-control", type_ "password", placeholder "Confirm Password", id "signUpPasswordConfirmation", onInput Msgs.SignupChangePasswordConfirmation ] []
                ]
            , button [ onClick Msgs.SignupSubmit, class "btn btn-primary" ] [ text "submit" ]
            ]
        ]


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]


for value =
    attribute "for" value
