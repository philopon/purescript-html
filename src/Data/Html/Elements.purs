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
  { attrType    :: I.Attribute -> I.AttrType
  , attrTypes   :: I.AttrTypes
  , attrKey     :: I.Attribute -> String
  , attrVal     :: I.Attribute -> I.Attr
  , getKey      :: I.Attribute -> String
  , getNs       :: I.Attribute -> String
  , isHook      :: Dummy
  , softSetHook :: Dummy
  , vnode       :: Dummy
  }

foreign import vnodeImpl """
function vnodeImpl (fn, name, attrs, children) {
  var attrTypes = fn.attrTypes
    , props     = {}
    , key       = undefined
    , namespace = undefined;

  for(var i = 0, li = attrs.length; i < li; i++) {
    for(var j = 0, lj = attrs[i].length; j < lj; j++){
      var attr = attrs[i][j];
      var typ  = fn.attrType(attr);
      if(typ === attrTypes.attribute) {
        props[fn.attrKey(attr)] = fn.attrVal(attr);
      } else if (typ === attrTypes.key) {
        key = fn.getKey(attr);
      } else {
        namespace = fn.getNs(attr);
      }
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
