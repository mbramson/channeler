module View exposing (..)

import Html exposing (Html, Attribute, a, button, div, hr, h2, nav, p, text, input)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)
import Models exposing (Model, User, Flash)
import Msgs exposing (Msg)


view : Model -> Html Msg
view model =
    div [] [ page model ]


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


header : Model -> Html Msg
header model =
    div []
        [ navBar model
        , flashMessage model.flash
        , button [ onClick Msgs.Logout ] [ text "Log out" ]
        ]


navBar : Model -> Html Msg
navBar model =
    nav [ class "navbar navbar-toggleable-md navbar-light bg-faded" ]
        [ currentUserNav model.currentUser ]


currentUserNav : Maybe User -> Html Msg
currentUserNav currentUser =
    case currentUser of
        Just user ->
            div [] [ text user.username ]

        Nothing ->
            a
                [ class "btn btn-primary"
                , href "localhost:3000/#login"
                ]
                [ text "Log in" ]


flashMessage : Maybe Flash -> Html Msg
flashMessage flash =
    case flash of
        Just flash ->
            div [] [ text flash.message ]

        Nothing ->
            div [] []


homeView : Model -> Html Msg
homeView model =
    div []
        [ header model
        , text "Welcome to the app!"
        ]


logInView : Model -> Html Msg
logInView model =
    div []
        [ header model
        , h2 [] [ text "Login" ]
        , hr [] []
        , p []
            [ input [ type_ "text", placeholder "Email", onInput Msgs.SignupChangeEmail ] []
            ]
        , p []
            [ input [ type_ "password", placeholder "Password", onInput Msgs.SignupChangePassword ] []
            ]
        , button [ onClick Msgs.LoginSubmit ] [ text "submit" ]
        ]


signUpView : Model -> Html Msg
signUpView model =
    div []
        [ header model
        , h2 [] [ text "Sign up" ]
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
        , button [ class "btn btn-primary", onClick Msgs.SignupSubmit ] [ text "submit" ]
        ]


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
