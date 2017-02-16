module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (id, src, class)


type alias Model =
    { message : String
    , logo : String
    }


init : String -> ( Model, Cmd Msg )
init path =
    ( { message = "Photo Groove", logo = path }, Cmd.none )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div [ class "content" ]
        [ h1 [] [ text model.message ]
        , div [ id "thumbnails" ]
            [ img [ src "http://elm-in-action.com/1.jpeg" ] []
            , img [ src "http://elm-in-action.com/2.jpeg" ] []
            , img [ src "http://elm-in-action.com/3.jpeg" ] []
            ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
