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

listenTo :: forall e. String -> EffHtml e Unit
listenTo = runFn2 listenToImpl delegator

listenMouseMove :: forall e. EffHtml e Unit
listenMouseMove = listenTo "mousemove"

listenMouseEnter :: forall e. EffHtml e Unit
listenMouseEnter = listenTo "mouseenter"

listenMouseLeave :: forall e. EffHtml e Unit
listenMouseLeave = listenTo "mouseleave"

listenMouseOver :: forall e. EffHtml e Unit
listenMouseOver = listenTo "mouseover"

listenMouseOut :: forall e. EffHtml e Unit
listenMouseOut = listenTo "mouseout"

onMouseMove :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute
onMouseMove f = on_ "mousemove" (f <<< I.MouseHoverEvent)

onMouseEnter :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute
onMouseEnter f = on_ "mouseenter" (f <<< I.MouseHoverEvent)

onMouseLeave :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute
onMouseLeave f = on_ "mouseleave" (f <<< I.MouseHoverEvent)

onMouseOver :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute
onMouseOver f = on_ "mouseover" (f <<< I.MouseHoverEvent)

onMouseOut :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute
onMouseOut f = on_ "mouseout" (f <<< I.MouseHoverEvent)
