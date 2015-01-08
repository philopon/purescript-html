module Data.Html.Events.Heavy
  ( onMouseMove
  , onMouseEnter, onMouseLeave
  , onMouseOver, onMouseOut
  ) where

import Control.Monad.Eff
import Data.Html
import Data.Html.Attributes
import Data.Html.Events
import qualified Data.Html.Internal.Events as I
import Data.Function

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
