module Main where

import Html
import Html.Lazy
import Html.Events
import Html.Events.Heavy
import Html.Attributes
import Html.Attributes.Html5
import Control.Timer
import Debug.Trace
import Data.Function
import DOM

import Html.Stringify

foreign import appendSelector """
  function appendSelector(sel, node) {
    return function(){
      var elm = document.querySelector(sel);
      if(elm) { elm.appendChild(node) }
    }
  }""" :: forall e. Fn2 String Node (HtmlEff e Unit)

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

main = do
  listenMouseMove
  print (test1 "black")
  html <- createElement $ partial1 (==) test1 "blue"
  getNode html >>= runFn2 appendSelector "div"
  timeout 100 $ do
    patch (partial2 (\a b -> a.a == b.b) (\a b -> test1 a) "red" "blue") html
    timeout 1000 $ patch  test2 html
  return unit
