module Data.Html.Events
  ( KeyEvent(), MouseButtonEvent(), MouseHoverEvent()
  , Button(..)
  , HasModifier
  , altKey, ctrlKey, metaKey, shiftKey
  , HasPosition, Position(..)
  , client, page, screen
  , button
  , onBlur, onChange
  , onFocus, onFocusIn, onFocusOut
  , onSubmit, onInput, onSelect, onUnload
  , onKeyUp, onKeyDown, onKeyPress
  , onClick, onDoubleClick, onContextMenu
  , onMouseDown, onMouseUp
  , onTouchCancel, onTouchStart, onTouchEnd
  ) where

import Control.Monad.Eff
import Data.Function
import Data.String
import Data.Html
import Data.Html.Attributes
import Data.Html.Internal.VirtualDOM
import qualified Data.Html.Internal.Events as I

type KeyEvent = I.KeyEvent
type MouseButtonEvent = I.MouseButtonEvent
type MouseHoverEvent  = I.MouseHoverEvent

type Position = {x :: Number, y :: Number}

showPosition :: Position -> String
showPosition p = "(" ++ show p.x ++ "," ++ show p.y ++ ")"

data Button = Left | Middle | Right

instance showKeyEvent :: Show I.KeyEvent where
  show e =
    (if altKey   e then "Alt-"   else "") ++
    (if ctrlKey  e then "Ctrl-"  else "") ++
    (if metaKey  e then "Meta-"  else "") ++
    (if shiftKey e then "Shift-" else "") ++
    fromCharCode (keyCode e)

instance showButton :: Show Button where
  show Left   = "Left"
  show Middle = "Middle"
  show Right  = "Right"

instance showMouseButtonEvent :: Show I.MouseButtonEvent where
  show e = joinWith "-" $
    (if altKey       e then ((:) "Alt")    else id) $
    (if ctrlKey      e then ((:) "Ctrl")   else id) $
    (if metaKey      e then ((:) "Meta")   else id) $
    (if shiftKey     e then ((:) "Shift")  else id) $
    [show (button e) ++
      "[client:" ++ showPosition (client e) ++
      ",page:"   ++ showPosition (page   e) ++
      ",screen:" ++ showPosition (screen e) ++
      "]"
    ]

instance showMouseHoverEvent :: Show I.MouseHoverEvent where
  show e = joinWith "-" $
    (if altKey       e then ((:) "Alt")    else id) $
    (if ctrlKey      e then ((:) "Ctrl")   else id) $
    (if metaKey      e then ((:) "Meta")   else id) $
    (if shiftKey     e then ((:) "Shift")  else id) $
    [ "[client:" ++ showPosition (client e) ++
      ",page:"   ++ showPosition (page   e) ++
      ",screen:" ++ showPosition (screen e) ++
      "]"
    ]

foreign import eventPropImpl """
function eventPropImpl(ev, prop) {
  return ev[prop];
}""" :: forall a. Fn2 Event String a

eventProp :: forall a. Event -> String -> a
eventProp = runFn2 eventPropImpl

class HasModifier a where
  altKey   :: a -> Boolean
  ctrlKey  :: a -> Boolean
  metaKey  :: a -> Boolean
  shiftKey :: a -> Boolean

instance keyEventHasModifier :: HasModifier I.KeyEvent where
  altKey   (I.KeyEvent e) = eventProp e "altKey"
  ctrlKey  (I.KeyEvent e) = eventProp e "ctrlKey"
  metaKey  (I.KeyEvent e) = eventProp e "metaKey"
  shiftKey (I.KeyEvent e) = eventProp e "shiftKey"

instance mouseButtonEventHasModifier :: HasModifier I.MouseButtonEvent where
  altKey   (I.MouseButtonEvent e) = eventProp e "altKey"
  ctrlKey  (I.MouseButtonEvent e) = eventProp e "ctrlKey"
  metaKey  (I.MouseButtonEvent e) = eventProp e "metaKey"
  shiftKey (I.MouseButtonEvent e) = eventProp e "shiftKey"

instance mouseHoverEventHasModifier :: HasModifier I.MouseHoverEvent where
  altKey   (I.MouseHoverEvent e) = eventProp e "altKey"
  ctrlKey  (I.MouseHoverEvent e) = eventProp e "ctrlKey"
  metaKey  (I.MouseHoverEvent e) = eventProp e "metaKey"
  shiftKey (I.MouseHoverEvent e) = eventProp e "shiftKey"

foreign import keyCode """
function keyCode(evt){
  evt = evt || window.event;
  return evt.which || evt.keyCode;
}""" :: KeyEvent -> Number

foreign import fromCharCode """
function fromCharCode(c) {
  return String.fromCharCode(c);
}""" :: Number -> String

foreign import testBitImpl """
function testBitImpl(n, b) {
  return (n>>b) % 2 !== 0
}""" :: Fn2 Number Number Boolean

foreign import buttonNumber """
function buttonNumber(evt) {
  return evt.button;
}""" :: MouseButtonEvent -> Number

button :: MouseButtonEvent -> Button
button e = case buttonNumber e of
  0 -> Left
  2 -> Right
  _ -> Middle

foreign import positionImpl """
function positionImpl(i, evt){
  return {x: evt[i.x], y: evt[i.y]};
}""" :: forall a. Fn2 {x :: String, y :: String} a Position

class HasPosition a where
  client :: a -> Position
  page   :: a -> Position
  screen :: a -> Position

instance mouseButtonHasPosition :: HasPosition I.MouseButtonEvent where
  client = runFn2 positionImpl {x: "clientX", y: "clientY"}
  page   = runFn2 positionImpl {x: "pageX", y: "pageY"}
  screen = runFn2 positionImpl {x: "screenX", y: "screenY"}

instance mouseHoverHasPosition :: HasPosition I.MouseHoverEvent where
  client = runFn2 positionImpl {x: "clientX", y: "clientY"}
  page   = runFn2 positionImpl {x: "pageX", y: "pageY"}
  screen = runFn2 positionImpl {x: "screenX", y: "screenY"}

onBlur :: forall e. Eff e Unit -> Attribute
onBlur f = on_ "blur" (const f)

onChange :: forall e. Eff e Unit -> Attribute
onChange f = on_ "change" (const f)

onFocus :: forall e. Eff e Unit -> Attribute
onFocus f = on_ "focus" (const f)

onFocusIn :: forall e. Eff e Unit -> Attribute
onFocusIn f = on_ "focusin" (const f)

onFocusOut :: forall e. Eff e Unit -> Attribute
onFocusOut f = on_ "focusout" (const f)

onSubmit :: forall e. Eff e Unit -> Attribute
onSubmit f = on_ "submit" (const f)

onInput :: forall e. Eff e Unit -> Attribute
onInput f = on_ "input" (const f)

onSelect :: forall e. Eff e Unit -> Attribute
onSelect f = on_ "select" (const f)

onUnload :: forall e. Eff e Unit -> Attribute
onUnload f = on_ "unload" (const f)

onKeyUp :: forall e. (KeyEvent -> Eff e Unit) -> Attribute
onKeyUp f = on_ "keyup" (f <<< I.KeyEvent)

onKeyDown :: forall e. (KeyEvent -> Eff e Unit) -> Attribute
onKeyDown f = on_ "keydown" (f <<< I.KeyEvent)

onKeyPress :: forall e. (KeyEvent -> Eff e Unit) -> Attribute
onKeyPress f = on_ "keypress" (f <<< I.KeyEvent)

onClick :: forall e. (MouseButtonEvent -> Eff e Unit) -> Attribute
onClick f = on_ "click" (f <<< I.MouseButtonEvent)

onDoubleClick :: forall e. (MouseButtonEvent -> Eff e Unit) -> Attribute
onDoubleClick f = on_ "dblclick" (f <<< I.MouseButtonEvent)

onContextMenu :: forall e. (MouseButtonEvent -> Eff e Unit) -> Attribute
onContextMenu f = on_ "contextmenu" (f <<< I.MouseButtonEvent)

onMouseDown :: forall e. (MouseButtonEvent -> Eff e Unit) -> Attribute
onMouseDown f = on_ "mousedown" (f <<< I.MouseButtonEvent)

onMouseUp :: forall e. (MouseButtonEvent -> Eff e Unit) -> Attribute
onMouseUp f = on_ "mouseup" (f <<< I.MouseButtonEvent)

onTouchCancel :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute
onTouchCancel f = on_ "touchcalcel" (f <<< I.MouseHoverEvent)

onTouchStart :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute
onTouchStart f = on_ "touchstart" (f <<< I.MouseHoverEvent)

onTouchEnd :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute
onTouchEnd f = on_ "touchend" (f <<< I.MouseHoverEvent)
