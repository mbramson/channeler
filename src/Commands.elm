module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode exposing (field)
import Json.Encode as Encode
import Models exposing (FormFields, Session, User)
import Msgs exposing (Msg)
import RemoteData


signupUser : FormFields -> Cmd Msg
signupUser formFields =
    signupRequest formFields
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchSignup


signupRequest : FormFields -> Http.Request Session
signupRequest formFields =
    Http.request
        { body = encodeSession formFields |> Http.jsonBody
        , expect = Http.expectJson decodeSession
        , headers = []
        , method = "POST"
        , timeout = Nothing
        , url = signupUrl
        , withCredentials = False
        }


signupUrl : String
signupUrl =
    "http://localhost:4000/api/v1/registrations"


decodeSession : Decode.Decoder Session
decodeSession =
    Decode.map2 Session
        (field "user" decodeUser)
        (field "jwt" Decode.string)


decodeUser : Decode.Decoder User
decodeUser =
    Decode.map3 User
        (field "id" Decode.int)
        (field "username" Decode.string)
        (field "email" Decode.string)



--encodeSession : FormFields -> Encode.Value
--encodeSession formFields =
--    let
--        user_params =
--            [ ( "username", Encode.string formFields.username )
--            , ( "email", Encode.string formFields.email )
--            , ( "password", Encode.string formFields.password )
--            ]
--
--        attributes =
--            [ ( "user_params", user_params ) ]
--    in
--        Encode.object attributes
--
--
--encodeUser : FormFields -> Encode.Value
--encodeUser formFields =
--    [ ( "username", Encode.string formFields.username )
--    , ( "email", Encode.string formFields.email )
--    , ( "password", Encode.string formFields.password )
--    ]


encodeSession : FormFields -> Encode.Value
encodeSession formFields =
    Encode.object
        [ ( "userParams", encodeUser <| formFields )
        ]


encodeUser : FormFields -> Encode.Value
encodeUser record =
    Encode.object
        [ ( "username", Encode.string <| record.username )
        , ( "email", Encode.string <| record.email )
        , ( "password", Encode.string <| record.password )
        ]
