module View exposing (..)

import Views.HeaderView exposing (navBar, flashMessage)
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
