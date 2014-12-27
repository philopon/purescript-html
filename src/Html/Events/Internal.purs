module Html.Events.Internal where

import Html.Attributes

newtype KeyEvent = KeyEvent Event
newtype MouseButtonEvent = MouseButtonEvent Event
newtype MouseHoverEvent = MouseHoverEvent Event
