module Main where

  import Html
  import Html.Events
  import Html.Events.Heavy
  import Html.Attributes
  import Html.Attributes.Html5
  import Control.Timer
  import Debug.Trace

  test1 color = vnode "div"
    [ class_ "neko"
    , title "title"
    , id_   "idnt"
    , style {color: color}
--    , on_ "click" (\e -> print e.pageX)
    ] [text "neko"]

  test2 = vnode "div" [onMouseMove print] 
    [ text "inu"
    , vnode "span" [style {color: "red"}] [text "bowow"]
    , vnode "input" [] []
    ]

  main = onDOMContentLoaded $ do
    listenMouseMove
    html <- createElement $ test1 "blue"
    appendSelector "div" html
    timeout 100 $ do
      patch (test1 "red") html
      timeout 100 $ patch  test2 html
    return unit
