module Data.Html.Events
  ( EventLike, KeyEvent(), MouseButtonEvent(), MouseHoverEvent()
  , listen
  , Button(..)
  , HasModifier
  , altKey, ctrlKey, metaKey, shiftKey
  , HasPosition, Position(..)
  , client, page, screen
  , button
  , targetValue, targetChecked
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

import Data.Html.Internal.Delegator

type KeyEvent = I.KeyEvent
type MouseButtonEvent = I.MouseButtonEvent
type MouseHoverEvent  = I.MouseHoverEvent

class EventLike e
instance eventLikeEvent :: EventLike Event
instance eventLikeKeyEvent :: EventLike I.KeyEvent
instance eventLikeMouseButtonEvent :: EventLike I.MouseButtonEvent
instance eventLikeMouseHoverEvent :: EventLike I.MouseHoverEvent

targetValue :: forall ev. (EventLike ev) => ev -> String
targetValue e = eventProp (eventProp e "target") "value"

targetChecked :: forall ev. (EventLike ev) => ev -> Boolean
targetChecked e = eventProp (eventProp e "target") "checked"

type Position = {x :: Number, y :: Number}

listen :: EffHtml _ Unit
listen = let _ = delegator in return unit

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
}""" :: forall ev a. Fn2 ev String a

eventProp :: forall ev a. ev -> String -> a
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
