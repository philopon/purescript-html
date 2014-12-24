module Html.Attributes
  ( Attribute(..)
  , stringAttribute
  , booleanAttribute
  , numberAttribute
  , style
  , key
  , Event(), on_
  , data_
  , namespace
  ) where

  import Control.Monad.Eff

  import Html.VirtualDOM

  import qualified Html.Attributes.Internal as I

  import Data.Function

  type Attribute = I.Attribute

  stringAttribute :: String -> String -> Attribute
  stringAttribute n v = I.attribute n $ I.unsafeCoerce v

  booleanAttribute :: String -> Boolean -> Attribute
  booleanAttribute n v = I.attribute n $ I.unsafeCoerce v

  numberAttribute :: String -> Number -> Attribute
  numberAttribute n v = I.attribute n $ I.unsafeCoerce v

  style :: forall styles. {|styles} -> Attribute
  style v = I.attribute "style" $ I.unsafeCoerce v

  key :: String -> Attribute
  key = I.Key

  namespace :: String -> Attribute
  namespace = I.Namespace

  data_ :: String -> String -> Attribute
  data_ nm dat = I.attribute ("data-" ++ nm) $ I.unsafeCoerce (virtualDOM.dsHook dat)

  foreign import data Event :: *

  foreign import mkEvHook """
    function mkEvHook (eh, fn) {
      function mkEvHook_callback(ev){
        fn(ev)();
      }
      return eh(mkEvHook_callback);
    }""" :: forall eh event e. Fn2 eh (Event -> Eff e Unit) I.Attr

  on_ :: forall event e. String -> (Event -> Eff e Unit) -> Attribute
  on_ ev fn = I.attribute ("ev-" ++ ev) $ I.unsafeCoerce (runFn2 mkEvHook virtualDOM.evHook fn)
