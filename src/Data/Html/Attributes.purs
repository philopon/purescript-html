module Data.Html.Attributes
  ( Attribute()
  , stringAttribute
  , booleanAttribute
  , numberAttribute
  , style
  , key
  , Event(), on_
  , namespace
  ) where

import Control.Monad.Eff

import Data.Html.Internal.VirtualDOM

import Data.Function
import Data.Array

foreign import data Attribute :: *

foreign import attributeImpl """
function attributeImpl(k, v){
  var prop = {};
  prop[k] = v;
  return prop;
}
""" :: forall v. Fn2 String v Attribute

attribute :: forall v. String -> v -> Attribute
attribute k v = runFn2 attributeImpl k v

foreign import appendAttributeImpl """
function appendAttributeImpl (a, b) {
  var props = {};
  var merge = function(from){
    for(var key in from){
      props[key] = from[key];
    }
  }
  merge(a);
  merge(b);
  return props;
}""" :: Fn2 Attribute Attribute Attribute

instance semigroupAttribute :: Semigroup Attribute where
  (<>) a b = runFn2 appendAttributeImpl a b

stringAttribute :: String -> String -> Attribute
stringAttribute = attribute

booleanAttribute :: String -> Boolean -> Attribute
booleanAttribute = attribute

numberAttribute :: String -> Number -> Attribute
numberAttribute = attribute

style :: forall styles. {|styles} -> Attribute
style = attribute "style"

key :: String -> Attribute
key = attribute "key"

namespace :: String -> Attribute
namespace = attribute "namespace"

foreign import data Event :: *

foreign import mkEvent """
function mkEvent (fn) {
  return function mkEvHook_callback(ev){
    fn(ev)();
  }
}""" :: forall e ev. (Event -> Eff e Unit) -> ev

on_ :: forall event e. String -> (Event -> Eff e Unit) -> Attribute
on_ ev fn = attribute ("on" ++ ev) $ mkEvent fn
