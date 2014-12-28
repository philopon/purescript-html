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

    onBlur :: forall e. Eff e Unit -> Attribute

    onChange :: forall e. Eff e Unit -> Attribute

    onClick :: forall e. (MouseButtonEvent -> Eff e Unit) -> Attribute

    onContextMenu :: forall e. (MouseButtonEvent -> Eff e Unit) -> Attribute

    onDoubleClick :: forall e. (MouseButtonEvent -> Eff e Unit) -> Attribute

    onFocus :: forall e. Eff e Unit -> Attribute

    onFocusIn :: forall e. Eff e Unit -> Attribute

    onFocusOut :: forall e. Eff e Unit -> Attribute

    onInput :: forall e. Eff e Unit -> Attribute

    onKeyDown :: forall e. (KeyEvent -> Eff e Unit) -> Attribute

    onKeyPress :: forall e. (KeyEvent -> Eff e Unit) -> Attribute

    onKeyUp :: forall e. (KeyEvent -> Eff e Unit) -> Attribute

    onMouseDown :: forall e. (MouseButtonEvent -> Eff e Unit) -> Attribute

    onMouseUp :: forall e. (MouseButtonEvent -> Eff e Unit) -> Attribute

    onSelect :: forall e. Eff e Unit -> Attribute

    onSubmit :: forall e. Eff e Unit -> Attribute

    onTouchCancel :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute

    onTouchEnd :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute

    onTouchStart :: forall e. (MouseHoverEvent -> Eff e Unit) -> Attribute

    onUnload :: forall e. Eff e Unit -> Attribute



