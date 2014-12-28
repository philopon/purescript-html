module Data.Html.Elements
  ( VTree(), vnode, text
  ) where

import Control.Monad.Eff
import qualified Data.Html.Internal.Attributes as I
import Data.Html.Attributes
import Data.Html.Internal.VirtualDOM
import Data.Function
import DOM
import Control.Monad.Eff.Ref

foreign import data VTree :: *

type VNodeFs a = 
  { attrType :: Attribute -> String
  , attrKey  :: Attribute -> String
  , attrVal  :: Attribute -> I.Attr
  , getKey   :: Attribute -> String
  , getNs    :: Attribute -> String
  , vnode    :: a
  }

foreign import vnodeImpl """
function vnodeImpl (fn, name, attrs, children) {
  var props     = {}
    , key       = undefined
    , namespace = undefined;

  for(var i = 0; i < attrs.length; i++) {
    var attr = attrs[i];
    var typ  = fn.attrType(attr);
    if(typ === "a") {
      props[fn.attrKey(attr)] = fn.attrVal(attr);
    } else if (typ === "k") {
      key = fn.getKey(attr);
    } else {
      namespace = fn.getNs(attr);
    }
  }
  return new fn.vnode(name, props, children, key, namespace);
}""" :: forall a. Fn4 (VNodeFs a) String [Attribute] [VTree] VTree

vnode :: String -> [Attribute] -> [VTree] -> VTree
vnode = runFn4 vnodeImpl
  { attrType: I.attrType
  , attrKey:  I.getAttrKey
  , attrVal:  I.getAttrValue
  , getKey:   I.getKeyString
  , getNs:    I.getNamespaceString
  , vnode:    virtualDOM.vnode
  }

foreign import vtextImpl """
function vtextImpl(vtext, text){
  return new vtext(text);
}""" :: forall a. Fn2 a String VTree

text :: String -> VTree
text = runFn2 vtextImpl virtualDOM.vtext
