module Data.Html.Elements
  ( VTree(), vnode, text
  ) where

import Control.Monad.Eff
import Data.Html.Attributes
import Data.Html.Internal.VirtualDOM
import Data.Function
import DOM

foreign import data VTree :: *

foreign import data Dummy :: *

foreign import vnodeImpl """
function vnodeImpl (h, name, attrs, children) {
  var props = {};
  var merge = function(from){
    for(var key in from){
      props[key] = from[key];
    }
  }

  for(var i = 0, l = attrs.length; i < l; i ++){
    merge(attrs[i]);
  }

  return h(name, props, children);
}""" :: forall h. Fn4 h String [Attribute] [VTree] VTree

vnode :: String -> [Attribute] -> [VTree] -> VTree
vnode t a c = runFn4 vnodeImpl virtualDOM.hyperscript t a c

foreign import vtextImpl """
function vtextImpl(vtext, text){
  return new vtext(text);
}""" :: forall a. Fn2 a String VTree

text :: String -> VTree
text s = runFn2 vtextImpl virtualDOM.vtext s
