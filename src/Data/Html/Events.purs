module Data.Html.Events
  ( EventLike, KeyEvent(), MouseButtonEvent(), MouseHoverEvent()
  , Button(..)
  , HasModifier
  , keyCode, altKey, ctrlKey, metaKey, shiftKey
  , HasPosition, Position(..)
  , client, page, screen
  , button
  , targetValue, targetChecked
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

showPosition :: Position -> String
showPosition p = "(" ++ show p.x ++ "," ++ show p.y ++ ")"

data Button = Left | Middle | Right

instance showKeyEvent :: Show I.KeyEvent where
  show e = joinWith ""
    [ if altKey   e then "Alt-"   else ""
    , if ctrlKey  e then "Ctrl-"  else ""
    , if metaKey  e then "Meta-"  else ""
    , if shiftKey e then "Shift-" else ""
    , fromCharCode (keyCode e)
    ]

instance showButton :: Show Button where
  show Left   = "Left"
  show Middle = "Middle"
  show Right  = "Right"

instance showMouseButtonEvent :: Show I.MouseButtonEvent where
  show e = joinWith ""
    [ if altKey       e then "Alt-"    else ""
    , if ctrlKey      e then "Ctrl-"   else ""
    , if metaKey      e then "Meta-"   else ""
    , if shiftKey     e then "Shift-"  else ""
    , show (button e)
    , "[client:", showPosition (client e)
    , ",page:",   showPosition (page   e)
    , ",screen:", showPosition (screen e)
    , "]"
    ]

instance showMouseHoverEvent :: Show I.MouseHoverEvent where
  show e = joinWith ""
    [ if altKey       e then "Alt-"    else ""
    , if ctrlKey      e then "Ctrl-"   else ""
    , if metaKey      e then "Meta-"   else ""
    , if shiftKey     e then "Shift-"  else ""
    , "[client:", showPosition (client e)
    , ",page:",   showPosition (page   e)
    , ",screen:", showPosition (screen e)
    , "]"
    ]

foreign import eventPropImpl """
function eventPropImpl(ev, prop) {
  return ev[prop];
}""" :: forall ev a. Fn2 ev String a

eventProp :: forall ev a. ev -> String -> a
eventProp ev p = runFn2 eventPropImpl ev p

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
  client a = runFn2 positionImpl {x: "clientX", y: "clientY"} a
  page   a = runFn2 positionImpl {x: "pageX", y: "pageY"}     a
  screen a = runFn2 positionImpl {x: "screenX", y: "screenY"} a

instance mouseHoverHasPosition :: HasPosition I.MouseHoverEvent where
  client a = runFn2 positionImpl {x: "clientX", y: "clientY"} a
  page   a = runFn2 positionImpl {x: "pageX", y: "pageY"}     a
  screen a = runFn2 positionImpl {x: "screenX", y: "screenY"} a
