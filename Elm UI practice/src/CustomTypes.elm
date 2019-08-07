-- https://discourse.elm-lang.org/t/introduction-to-elm-ui-a-package-for-creating-uis-in-pure-elm/2540/6
import Element exposing (..)
import Element.Font as Font

type Style
    = Header
    | Subheader
    | MainText
    | SubText


styling : Style -> List (Attribute msg)
styling style =
  case style of
    Header ->
        [ Font.color (colorPalette PrimaryLight)
        , Font.size 36
        , Font.family
            [ fontStack Headline
            , fontStack Fallback
            ]
        ]

    Subheader ->
        [ Font.color (colorPalette PrimaryLight), Font.size 22, Font.heavy, Font.family [ fontStack PrimarySans, fontStack Headline, fontStack Fallback ] ]

    MainText ->
        [ Font.color (colorPalette PrimaryLight), Font.size 18, Font.medium, Font.family [ fontStack PrimarySans, fontStack Fallback ] ]

    SubText ->
        [ Font.color (colorPalette PrimaryLight), Font.size 16, Font.light, Font.family [ fontStack PrimarySans, fontStack Fallback ] ]


type MyFonts
    = Headline
    | PrimarySans
    | SecondarySans
    | PrimarySerif
    | SecondarySerif
    | Fallback


type ColorPalette
    = Primary
    | PrimaryDark
    | PrimaryLight
    | Secondary
    | SecondaryDark
    | SecondaryLight
    | Highlight
    | Alert
    | White
    | Black


fontStack : MyFonts -> Font.Font
fontStack font =
    case font of
        Headline ->
            Font.external { url = "https://fonts.googleapis.com/css?family=Dosis", name = "dosis" }

        PrimarySans ->
            Font.external { url = "https://fonts.googleapis.com/css?family=Roboto", name = "roboto" }

        SecondarySans ->
            Font.sansSerif

        PrimarySerif ->
            Font.external { url = "https://fonts.googleapis.com/css?family=Esteban", name = "esteban" }

        SecondarySerif ->
            Font.serif

        Fallback ->
            Font.sansSerif


colorPalette : ColorPalette -> Color
colorPalette color =
    case color of
        Primary ->
            rgba255 100 100 100 1

        --96 125 139 1
        PrimaryDark ->
            rgba255 69 90 100 1

        PrimaryLight ->
            rgba255 200 200 200 1

        --207 216 220 1
        Secondary ->
            rgba255 200 100 50 1

        --156 39 176 1
        SecondaryDark ->
            rgba255 123 31 162 1

        SecondaryLight ->
            rgba255 213 192 182 1

        --225 190 231 1
        Highlight ->
            rgba 254 128 25 1

        Alert ->
            rgba 207 80 75 1

        White ->
            rgba 233 236 250 1

        Black ->
            rgba 0 0 0 1