module Main where

-- virtual-dom example(https://github.com/Matt-Esch/virtual-dom#example) clone with click event.

import Data.Html
import Data.Html.Events
import qualified Data.Html.Elements.Html5 as E
import qualified Data.Html.Attributes.Html5 as A

import Control.Monad.Eff.Ref
import Control.Timer
import DOM

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

main :: forall e. EffHtml (timer :: Timer | e) Unit
main = do
  listen -- dummy function to save event listener from dead code elimination. 
  ref <- newRef 0
  html <- createElement $ render ref 0
  getNode html >>= appendBody
  interval 100 $ do
    c' <- modifyRef' ref (\r -> let r' = r + 1 in {retVal: r', newState: r'})
    patch (render ref c') html

  return unit
