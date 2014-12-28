module Data.Html
  ( Html(), HtmlEff()
  , createElementOptions, createElement
  , patch
  , getNode
  ) where

import Control.Monad.Eff
import Control.Monad.Eff.Ref

import Data.Html.Elements
import qualified Data.Html.Internal.Attributes as I

import Data.Html.Attributes
import Data.Html.Internal.VirtualDOM

import Data.Function
import DOM

type HtmlEff e a = Eff (dom :: DOM, ref :: Ref | e) a

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

data Html = Html (RefVal {node :: Node, vtree :: VTree})

getNode :: forall e. Html -> HtmlEff e Node
getNode (Html ref) = do
  readRef ref >>= \h -> return h.node

createElementOptions :: forall opts e. { | opts } -> VTree -> HtmlEff e Html
createElementOptions opts vtree = do
  let n = runFn2 virtualDOM.create vtree opts
  ref <- newRef {node: n, vtree: vtree}
  return $ Html ref

createElement :: forall e. VTree -> HtmlEff e Html
createElement vtree = do
  let n = virtualDOM.create vtree
  ref <- newRef {node: n, vtree: vtree}
  return $ Html ref

patch :: forall e. VTree -> Html -> HtmlEff e Unit
patch new (Html ref) = do
  h <- readRef ref
  let patch = runFn2 virtualDOM.diff h.vtree new
      node' = runFn2 virtualDOM.patch h.node patch
  writeRef ref {node: node', vtree: new}
