module Data.Html.Events.Heavy
  ( listenTo
  , listenMouseMove
  , listenMouseEnter, listenMouseLeave
  , listenMouseOver, listenMouseOut
  , onMouseMove
  , onMouseEnter, onMouseLeave
  , onMouseOver, onMouseOut
  ) where

import Control.Monad.Eff
import Data.Html
import Data.Html.Attributes
import Data.Html.Events
import qualified Data.Html.Internal.Events as I
import Data.Function
import Data.Html.Internal.Delegator

foreign import listenToImpl """
function listenToImpl(d, l){
  return function listenToImpl_Eff(){
    d.listenTo(l);
  }
}""" :: forall delegator e. Fn2 delegator String (EffHtml e Unit)

listenTo :: String -> EffHtml _ Unit
listenTo = runFn2 listenToImpl delegator

listenMouseMove :: EffHtml _ Unit
listenMouseMove = listenTo "mousemove"

listenMouseEnter :: EffHtml _ Unit
listenMouseEnter = listenTo "mouseenter"

listenMouseLeave :: EffHtml _ Unit
listenMouseLeave = listenTo "mouseleave"

listenMouseOver :: EffHtml _ Unit
listenMouseOver = listenTo "mouseover"

listenMouseOut :: EffHtml _ Unit
listenMouseOut = listenTo "mouseout"

onMouseMove :: (MouseHoverEvent -> Eff _ Unit) -> Attribute
onMouseMove f = on_ "mousemove" (f <<< I.MouseHoverEvent)

onMouseEnter :: (MouseHoverEvent -> Eff _ Unit) -> Attribute
onMouseEnter f = on_ "mouseenter" (f <<< I.MouseHoverEvent)

onMouseLeave :: (MouseHoverEvent -> Eff _ Unit) -> Attribute
onMouseLeave f = on_ "mouseleave" (f <<< I.MouseHoverEvent)

onMouseOver :: (MouseHoverEvent -> Eff _ Unit) -> Attribute
onMouseOver f = on_ "mouseover" (f <<< I.MouseHoverEvent)

onMouseOut :: (MouseHoverEvent -> Eff _ Unit) -> Attribute
onMouseOut f = on_ "mouseout" (f <<< I.MouseHoverEvent)
