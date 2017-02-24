module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (id, src, class)


type alias Model =
    { photos : List Photo
    }


type alias Photo =
    { url : String }


init : ( Model, Cmd Msg )
init =
    (Model
        [ (Photo "1.jpeg")
        , (Photo "2.jpeg")
        , (Photo "3.jpeg")
        ]
    )
        ! []


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div [ class "content" ]
        [ h1 [] []
        , div [ id "thumbnails" ]
            (List.map viewThumbnail model.photos)
        ]


photoPrefix : String
photoPrefix =
    "http://elm-in-action.com/"


viewThumbnail : Photo -> Html Msg
viewThumbnail photo =
    img [ src (photoPrefix ++ photo.url) ] []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
