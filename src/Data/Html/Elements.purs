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

foreign import data Dummy :: *

type VNodeFs = 
  { attrType    :: Attribute -> I.AttrType
  , attrTypes   :: I.AttrTypes
  , attrKey     :: Attribute -> String
  , attrVal     :: Attribute -> I.Attr
  , getKey      :: Attribute -> String
  , getNs       :: Attribute -> String
  , isHook      :: Dummy
  , softSetHook :: Dummy
  , vnode       :: Dummy
  }

foreign import vnodeImpl """
function vnodeImpl (fn, name, attrs, children) {
  var props     = {}
    , key       = undefined
    , namespace = undefined;

  for(var i = 0; i < attrs.length; i++) {
    var attr = attrs[i];
    var typ  = fn.attrType(attr);
    if(typ === fn.attrTypes.attribute) {
      props[fn.attrKey(attr)] = fn.attrVal(attr);
    } else if (typ === fn.attrTypes.key) {
      key = fn.getKey(attr);
    } else {
      namespace = fn.getNs(attr);
    }
  }

  if( name.toUpperCase() === "INPUT" &&
      !namespace &&
      props.hasOwnProperty('value') &&
      props.value !== undefined &&
      !fn.isHook(props.value)
    ) {
      props.value = fn.softSetHook(props.value);
    }

  return new fn.vnode(name, props, children, key, namespace);
}""" :: Fn4 VNodeFs String [Attribute] [VTree] VTree

vnode :: String -> [Attribute] -> [VTree] -> VTree
vnode t a c = runFn4 vnodeImpl
  { attrType:  I.attrType
  , attrTypes: I.attrTypes
  , attrKey:   I.getAttrKey
  , attrVal:   I.getAttrValue
  , getKey:    I.getKeyString
  , getNs:     I.getNamespaceString
  , vnode:     virtualDOM.vnode
  , isHook:    virtualDOM.isHook
  , softSetHook: virtualDOM.softSetHook
  } t a c

foreign import vtextImpl """
function vtextImpl(vtext, text){
  return new vtext(text);
}""" :: forall a. Fn2 a String VTree

text :: String -> VTree
text s = runFn2 vtextImpl virtualDOM.vtext s
