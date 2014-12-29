module Main where

import Data.Html
import qualified Data.Html.Elements.Html5 as E
import qualified Data.Html.Attributes.Html5 as A
import Data.Html.Lazy
import Data.Html.Events
import Data.Html.Events.Heavy
import Control.Timer
import Debug.Trace
import Data.Function
import DOM

import Data.Html.Stringify

foreign import appendSelector """
  function appendSelector(sel, node) {
    return function(){
      var elm = document.querySelector(sel);
      if(elm) { elm.appendChild(node) }
    }
  }""" :: forall e. Fn2 String Node (EffHtml e Unit)

test1 color = E.div
  [ A.class_ "neko"
  , A.title "title"
  , A.id_   "idnt"
  , A.style {color: color}
--    , on_ "click" (\e -> print e.pageX)
  ] [E.text "neko"]

test2 = E.div [onMouseMove print] 
  [ E.text "inu"
  , E.span [A.style {color: "red"}] [E.text "bowow"]
  , E.input [] []
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
