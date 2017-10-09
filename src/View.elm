module View exposing (..)

import Html exposing (Html, Attribute, a, button, div, hr, h2, nav, p, text, input, span, ul, li)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)
import Models exposing (Model, User, Flash)
import Msgs exposing (Msg)


view : Model -> Html Msg
view model =
    div [ class "container-fluid" ]
        [ navBar model
        , div [ class "container-fluid" ]
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


header : Model -> Html Msg
header model =
    div []
        [ navBar model
        , flashMessage model.flash
        ]


navBar : Model -> Html Msg
navBar model =
    nav [ class "navbar navbar-expand-md navbar-dark bg-dark" ]
        [ a [ class "navbar-brand", href "#" ] [ text "HOME" ]
        , navBarCollapseButton
        , div [ class "collapse navbar-collapse", id "navbarSupportedContent" ]
            [ ul [ class "navbar-nav mr-auto" ]
                [ li [ class "nav-item active" ] [ currentUserNav model.currentUser ] ]
            ]
        ]


navBarCollapseButton : Html Msg
navBarCollapseButton =
    button
        [ class "navbar-toggler navbar-toggler-right"
        , attribute "type" "button"
        , attribute "data-toggle" "collapse"
        , attribute "data-target" "#navbarSupportedContent"
        , attribute "aria-controls" "navbarSupportedContent"
        , attribute "aria-expanded" "false"
        , attribute "aria-label" "Toggle navigation"
        ]
        [ span [ class "navbar-toggler-icon" ] [] ]


currentUserNav : Maybe User -> Html Msg
currentUserNav currentUser =
    case currentUser of
        Just user ->
            a [ onClick Msgs.Logout, class "nav-link", href "#login" ] [ text "Log out" ]

        Nothing ->
            a [ class "nav-link", href "#login" ]
                [ text "Log in" ]


flashMessage : Maybe Flash -> Html Msg
flashMessage flash =
    case flash of
        Just flash ->
            flashAlert flash

        Nothing ->
            text ""


flashAlert : Flash -> Html Msg
flashAlert flash =
    case flash.flash_type of
        "error" ->
            div [ class "alert alert-danger" ] [ text flash.message ]

        other ->
            div [ class "alert alert-primary" ] [ text flash.message ]


homeView : Model -> Html Msg
homeView model =
    div []
        [ text "Welcome to the app!" ]


logInView : Model -> Html Msg
logInView model =
    div []
        [ h2 [] [ text "Login" ]
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
        [ h2 [] [ text "Sign up" ]
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
