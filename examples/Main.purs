module Main where

  import Html
  import Html.Lazy
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

  foreign import logging "function logging(a){console.log(a); return a}"
    :: forall a. a -> a

  main = onDOMContentLoaded $ do
    listenMouseMove
    html <- createElement $ partial1 (==) test1 "blue"
    appendSelector "div" html
    timeout 100 $ do
      patch (partial2 (\a b -> a.a == b.b) (\a b -> test1 a) "red" "blue") html
      timeout 1000 $ patch  test2 html
    return unit
