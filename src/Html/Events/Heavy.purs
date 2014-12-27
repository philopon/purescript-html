module Html.Events.Heavy
  ( listenTo
  , listenMouseMove
  , listenMouseEnter, listenMouseLeave
  , listenMouseOver, listenMouseOut
  , onMouseMove
  , onMouseEnter, onMouseLeave
  , onMouseOver, onMouseOut
  ) where

import Control.Monad.Eff
import Html
import Html.Attributes
import Html.VirtualDOM
import Html.Events
import qualified Html.Events.Internal as I
import Data.Function

foreign import listenToImpl """
function listenToImpl(d, l){
  return function listenToImpl_Eff(){
    d.listenTo(l);
  }
}""" :: forall delegator e. Fn2 delegator String (HtmlEff e Unit)

listenTo :: forall e. String -> HtmlEff e Unit
listenTo = runFn2 listenToImpl virtualDOM.delegator

listenMouseMove :: forall e. HtmlEff e Unit
listenMouseMove = listenTo "mousemove"

listenMouseEnter :: forall e. HtmlEff e Unit
listenMouseEnter = listenTo "mouseenter"

listenMouseLeave :: forall e. HtmlEff e Unit
listenMouseLeave = listenTo "mouseleave"

listenMouseOver :: forall e. HtmlEff e Unit
listenMouseOver = listenTo "mouseover"

listenMouseOut :: forall e. HtmlEff e Unit
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
