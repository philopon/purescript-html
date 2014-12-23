module Html
  ( VTree(), vnode
  , text
  , Html(), HtmlEff()
  , createElementOptions, createElement
  , appendBody, appendSelector
  , patch
  , onDOMContentLoaded
  ) where

  import Control.Monad.Eff
  import qualified Html.Attributes.Internal as I
  import Html.Attributes
  import Data.Function
  import Html.VirtualDOM
  import DOM
  import Control.Monad.Eff.Ref

  type HtmlEff e a = Eff (dom :: DOM, ref :: Ref | e) a
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
    }
    """ :: forall a. Fn4 (VNodeFs a) String [Attribute] [VTree] VTree

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

  data Html = Html (RefVal {node :: Node, vtree :: VTree})

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

  foreign import appendBodyImpl """
    function appendBodyImpl(node){
      return function(){
        document.body.appendChild(node);
      }
    }""" :: forall e. Node -> HtmlEff e Unit

  appendBody :: forall e. Html -> HtmlEff e Unit
  appendBody (Html ref) = do
    h <- readRef ref
    appendBodyImpl h.node

  foreign import appendSelectorImpl """
    function appendSelectorImpl(sel, node) {
      return function(){
        var elm = document.querySelector(sel);
        if(elm) { elm.appendChild(node) }
      }
    }""" :: forall e. Fn2 String Node (HtmlEff e Unit)

  appendSelector :: forall e. String -> Html -> HtmlEff e Unit
  appendSelector sel (Html ref) = do
    h <- readRef ref
    runFn2 appendSelectorImpl sel h.node

  foreign import onDOMContentLoaded """
    function onDOMContentLoaded(f){
      return function(){
        document.addEventListener("DOMContentLoaded", f);
      }
    }""" :: forall e. Eff (dom :: DOM | e) Unit -> Eff (dom :: DOM | e) Unit

  patch :: forall e. VTree -> Html -> HtmlEff e Unit
  patch new (Html ref) = do
    h <- readRef ref
    let patch = runFn2 virtualDOM.diff h.vtree new
        node' = runFn2 virtualDOM.patch h.node patch
    writeRef ref {node: node', vtree: new}
