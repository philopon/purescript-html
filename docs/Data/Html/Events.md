# Module Documentation

## Module Data.Html.Events

### Types

    data Button where
      Left :: Button
      Middle :: Button
      Right :: Button

    type KeyEvent = I.KeyEvent

    type MouseButtonEvent = I.MouseButtonEvent

    type MouseHoverEvent = I.MouseHoverEvent

    type Position = { y :: Number, x :: Number }


### Type Classes

    class EventLike e where

    class HasModifier a where
      altKey :: a -> Boolean
      ctrlKey :: a -> Boolean
      metaKey :: a -> Boolean
      shiftKey :: a -> Boolean

    class HasPosition a where
      client :: a -> Position
      page :: a -> Position
      screen :: a -> Position


### Type Class Instances

    instance eventLikeEvent :: EventLike Event

    instance eventLikeKeyEvent :: EventLike I.KeyEvent

    instance eventLikeMouseButtonEvent :: EventLike I.MouseButtonEvent

    instance eventLikeMouseHoverEvent :: EventLike I.MouseHoverEvent

    instance keyEventHasModifier :: HasModifier I.KeyEvent

    instance mouseButtonEventHasModifier :: HasModifier I.MouseButtonEvent

    instance mouseButtonHasPosition :: HasPosition I.MouseButtonEvent

    instance mouseHoverEventHasModifier :: HasModifier I.MouseHoverEvent

    instance mouseHoverHasPosition :: HasPosition I.MouseHoverEvent

    instance showButton :: Show Button

    instance showKeyEvent :: Show I.KeyEvent

    instance showMouseButtonEvent :: Show I.MouseButtonEvent

    instance showMouseHoverEvent :: Show I.MouseHoverEvent


### Values

    button :: MouseButtonEvent -> Button

    keyCode :: KeyEvent -> Number

    listen :: EffHtml _ Unit

    onBlur :: forall e. (Event -> Eff e Unit) -> Attribute

    onChange :: (Event -> Eff _ Unit) -> Attribute

    onClick :: (MouseButtonEvent -> Eff _ Unit) -> Attribute

    onContextMenu :: (MouseButtonEvent -> Eff _ Unit) -> Attribute

    onDoubleClick :: (MouseButtonEvent -> Eff _ Unit) -> Attribute

    onFocus :: (Event -> Eff _ Unit) -> Attribute

    onFocusIn :: (Event -> Eff _ Unit) -> Attribute

    onFocusOut :: (Event -> Eff _ Unit) -> Attribute

    onInput :: (Event -> Eff _ Unit) -> Attribute

    onKeyDown :: (KeyEvent -> Eff _ Unit) -> Attribute

    onKeyPress :: (KeyEvent -> Eff _ Unit) -> Attribute

    onKeyUp :: (KeyEvent -> Eff _ Unit) -> Attribute

    onMouseDown :: (MouseButtonEvent -> Eff _ Unit) -> Attribute

    onMouseUp :: (MouseButtonEvent -> Eff _ Unit) -> Attribute

    onSelect :: (Event -> Eff _ Unit) -> Attribute

    onSubmit :: (Event -> Eff _ Unit) -> Attribute

    onTouchCancel :: (MouseHoverEvent -> Eff _ Unit) -> Attribute

    onTouchEnd :: (MouseHoverEvent -> Eff _ Unit) -> Attribute

    onTouchStart :: (MouseHoverEvent -> Eff _ Unit) -> Attribute

    onUnload :: (Event -> Eff _ Unit) -> Attribute

    targetChecked :: forall ev. (EventLike ev) => ev -> Boolean

    targetValue :: forall ev. (EventLike ev) => ev -> String



