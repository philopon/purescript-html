module Data.Html.Events.Delegator where

import Control.Monad.Eff
import Data.Html.Attributes
import Data.Html.Events
import qualified Data.Html.Internal.Events as I

onBlur :: forall e. (Event -> Eff e Unit) -> Attribute
onBlur = ev_ "blur"

onChange :: (Event -> Eff _ Unit) -> Attribute
onChange = ev_ "change"

onFocus :: (Event -> Eff _ Unit) -> Attribute
onFocus = ev_ "focus"

onFocusIn :: (Event -> Eff _ Unit) -> Attribute
onFocusIn = ev_ "focusin"

onFocusOut :: (Event -> Eff _ Unit) -> Attribute
onFocusOut = ev_ "focusout"

onSubmit :: (Event -> Eff _ Unit) -> Attribute
onSubmit = ev_ "submit"

onInput :: (Event -> Eff _ Unit) -> Attribute
onInput = ev_ "input"

onSelect :: (Event -> Eff _ Unit) -> Attribute
onSelect = ev_ "select"

onUnload :: (Event -> Eff _ Unit) -> Attribute
onUnload = ev_ "unload"

onKeyUp :: (KeyEvent -> Eff _ Unit) -> Attribute
onKeyUp f = ev_ "keyup" (f <<< I.KeyEvent)

onKeyDown :: (KeyEvent -> Eff _ Unit) -> Attribute
onKeyDown f = ev_ "keydown" (f <<< I.KeyEvent)

onKeyPress :: (KeyEvent -> Eff _ Unit) -> Attribute
onKeyPress f = ev_ "keypress" (f <<< I.KeyEvent)

onClick :: (MouseButtonEvent -> Eff _ Unit) -> Attribute
onClick f = ev_ "click" (f <<< I.MouseButtonEvent)

onDoubleClick :: (MouseButtonEvent -> Eff _ Unit) -> Attribute
onDoubleClick f = ev_ "dblclick" (f <<< I.MouseButtonEvent)

onContextMenu :: (MouseButtonEvent -> Eff _ Unit) -> Attribute
onContextMenu f = ev_ "contextmenu" (f <<< I.MouseButtonEvent)

onMouseDown :: (MouseButtonEvent -> Eff _ Unit) -> Attribute
onMouseDown f = ev_ "mousedown" (f <<< I.MouseButtonEvent)

onMouseUp :: (MouseButtonEvent -> Eff _ Unit) -> Attribute
onMouseUp f = ev_ "mouseup" (f <<< I.MouseButtonEvent)

onTouchCancel :: (MouseHoverEvent -> Eff _ Unit) -> Attribute
onTouchCancel f = ev_ "touchcalcel" (f <<< I.MouseHoverEvent)

onTouchStart :: (MouseHoverEvent -> Eff _ Unit) -> Attribute
onTouchStart f = ev_ "touchstart" (f <<< I.MouseHoverEvent)

onTouchEnd :: (MouseHoverEvent -> Eff _ Unit) -> Attribute
onTouchEnd f = ev_ "touchend" (f <<< I.MouseHoverEvent)
