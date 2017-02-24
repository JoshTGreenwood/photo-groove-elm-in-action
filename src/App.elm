module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (id, src, class, classList)
import Html.Events exposing (onClick)


type alias Model =
    { photos : List Photo
    , selectedPhotoUrl : String
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
        "1.jpeg"
    )
        ! []


type Msg
    = PhotoClicked Photo


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PhotoClicked photo ->
            { model | selectedPhotoUrl = photo.url } ! []


view : Model -> Html Msg
view model =
    div [ class "content" ]
        [ h1 [] [ text "Photo Groove" ]
        , div [ id "thumbnails" ]
            (List.map (viewThumbnail model.selectedPhotoUrl) model.photos)
        , img [ class "large", src (photoPrefix ++ model.selectedPhotoUrl) ] []
        ]


photoPrefix : String
photoPrefix =
    "http://elm-in-action.com/"


viewThumbnail : String -> Photo -> Html Msg
viewThumbnail selectedPhotoUrl photo =
    img
        [ src (photoPrefix ++ photo.url)
        , classList [ ( "selected", photo.url == selectedPhotoUrl ) ]
        , onClick (PhotoClicked photo)
        ]
        []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
