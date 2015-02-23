module Main where

-- virtual-dom example(https://github.com/Matt-Esch/virtual-dom#example) clone with click event.

import Data.Html
import Data.Html.Events
import Data.Html.Events.Delegator
import Data.Html.Parse
import qualified Data.Html.Elements.Html5 as E
import qualified Data.Html.Attributes.Html5 as A

import Control.Monad.Eff.Ref
import Control.Timer
import DOM
import DOM.Delegator

foreign import appendBody """
function appendBody (e) {
  return function appendBodyEff(){
    document.body.appendChild(e);
  }
}""" :: forall e. Node -> EffHtml e Unit

render :: RefVal Number -> Number -> E.VTree
render ref count = E.div
  [ A.style
    { textAlign: "center"
    , lineHeight: show (100 + count) ++ "px"
    , border: "1px solid red"
    , width: show (100 + count) ++ "px"
    , height: show (100 + count) ++ "px"
    }
  , onClick (\_ -> writeRef ref 0)
  ]
  [E.text $ show count]

parsingExample :: E.VTree
parsingExample = parseString "<div style=\"background:red\">parsed element</div>"

main :: forall e. EffHtml (ref :: Ref, timer :: Timer | e) Unit
main = domDelegator $ do
  p <- createElement parsingExample
  getNode p >>= appendBody

  ref <- newRef 0
  html <- createElement $ render ref 0
  getNode html >>= appendBody
  interval 100 $ do
    c' <- modifyRef' ref (\r -> let r' = r + 1 in {retVal: r', newState: r'})
    patch (render ref c') html

  return unit
