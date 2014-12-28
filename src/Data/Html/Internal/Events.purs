module Data.Html.Internal.Events where

import Data.Html.Attributes

newtype KeyEvent = KeyEvent Event
newtype MouseButtonEvent = MouseButtonEvent Event
newtype MouseHoverEvent = MouseHoverEvent Event
