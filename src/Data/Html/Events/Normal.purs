module Data.Html.Events.Normal where

import Control.Monad.Eff
import Data.Html.Attributes
import Data.Html.Events
import qualified Data.Html.Internal.Events as I

onBlur :: forall e. (Event -> Eff e Unit) -> Attribute
onBlur = on_ "blur"

onChange :: (Event -> Eff _ Unit) -> Attribute
onChange = on_ "change"

onFocus :: (Event -> Eff _ Unit) -> Attribute
onFocus = on_ "focus"

onFocusIn :: (Event -> Eff _ Unit) -> Attribute
onFocusIn = on_ "focusin"

onFocusOut :: (Event -> Eff _ Unit) -> Attribute
onFocusOut = on_ "focusout"

onSubmit :: (Event -> Eff _ Unit) -> Attribute
onSubmit = on_ "submit"

onInput :: (Event -> Eff _ Unit) -> Attribute
onInput = on_ "input"

onSelect :: (Event -> Eff _ Unit) -> Attribute
onSelect = on_ "select"

onUnload :: (Event -> Eff _ Unit) -> Attribute
onUnload = on_ "unload"

onKeyUp :: (KeyEvent -> Eff _ Unit) -> Attribute
onKeyUp f = on_ "keyup" (f <<< I.KeyEvent)

onKeyDown :: (KeyEvent -> Eff _ Unit) -> Attribute
onKeyDown f = on_ "keydown" (f <<< I.KeyEvent)

onKeyPress :: (KeyEvent -> Eff _ Unit) -> Attribute
onKeyPress f = on_ "keypress" (f <<< I.KeyEvent)

onClick :: (MouseButtonEvent -> Eff _ Unit) -> Attribute
onClick f = on_ "click" (f <<< I.MouseButtonEvent)

onDoubleClick :: (MouseButtonEvent -> Eff _ Unit) -> Attribute
onDoubleClick f = on_ "dblclick" (f <<< I.MouseButtonEvent)

onContextMenu :: (MouseButtonEvent -> Eff _ Unit) -> Attribute
onContextMenu f = on_ "contextmenu" (f <<< I.MouseButtonEvent)

onMouseDown :: (MouseButtonEvent -> Eff _ Unit) -> Attribute
onMouseDown f = on_ "mousedown" (f <<< I.MouseButtonEvent)

onMouseUp :: (MouseButtonEvent -> Eff _ Unit) -> Attribute
onMouseUp f = on_ "mouseup" (f <<< I.MouseButtonEvent)

onTouchCancel :: (MouseHoverEvent -> Eff _ Unit) -> Attribute
onTouchCancel f = on_ "touchcalcel" (f <<< I.MouseHoverEvent)

onTouchStart :: (MouseHoverEvent -> Eff _ Unit) -> Attribute
onTouchStart f = on_ "touchstart" (f <<< I.MouseHoverEvent)

onTouchEnd :: (MouseHoverEvent -> Eff _ Unit) -> Attribute
onTouchEnd f = on_ "touchend" (f <<< I.MouseHoverEvent)
