module Main exposing (..)

import Html exposing (Html, button, div, img, text)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)


---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { view = view
        , model = model
        , update = update
        }



---- MODEL ----


type alias Model =
    { patrick : Int
    , jojo : Int
    }


model : Model
model =
    { patrick = 0
    , jojo = 0
    }



---- UPDATE ----


type Msg
    = AddPatrick


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddPatrick ->
            { model | patrick = model.patrick + 1 }



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ div [ class "row" ] <| repeatImage "patrick.png" model.patrick
        , div [ class "row" ] <| repeatImage "jojo.jpeg" 1
        , div [] [ button [ onClick AddPatrick ] [ text "Add Patrick" ] ]
        ]


repeatImage : String -> Int -> List (Html msg)
repeatImage imagePath times =
    img [ src imagePath ] []
        |> List.repeat times
