module Data.Html
  ( Html(), EffHtml(), VTree()
  , createElementOptions, createElement
  , patch
  , getNode
  ) where

import Control.Monad.Eff

import Data.Html.Elements hiding (VTree)
import qualified Data.Html.Elements as E
import qualified Data.Html.Internal.Attributes as I

import Data.Html.Attributes
import Data.Html.Internal.VirtualDOM

import Data.Function
import DOM

type EffHtml e a = Eff (dom :: DOM | e) a
type VTree = E.VTree

foreign import data Html :: *

foreign import createElementImpl """
function createElementImpl(create, vtree){
  return function createElementImplEff(){
    return { vtree: vtree
           , node: create(vtree)
           }
  }
}""" :: forall e create. Fn2 create VTree (EffHtml e Html)

createElement :: VTree -> EffHtml _ Html
createElement = runFn2 createElementImpl virtualDOM.create

foreign import createElementOptitionsImpl """
function createElementOptitionsImpl(create, opts, vtree){
  return function createElementImplEff(){
    return { vtree: vtree
           , node: create(vtree, opts)
           }
  }
}""" :: forall e create opts. Fn3 create {|opts} VTree (EffHtml e Html)

createElementOptions :: forall opts. { | opts } -> VTree -> EffHtml _ Html
createElementOptions = runFn3 createElementOptitionsImpl virtualDOM.create

foreign import getNode """
function getNode(html){
  return function getNodeEff(){
    return html.node;
  }
}""" :: forall e. Html -> EffHtml e Node

foreign import patchImpl """
function patchImpl(fn, next, html){
  return function patchImplEff(){
    var patch  = fn.diff(html.vtree, next);
    html.node  = fn.patch(html.node, patch);
    html.vtree = next;
  }
}""" :: forall fn e. Fn3 fn VTree Html (EffHtml e Unit)

patch :: VTree -> Html -> EffHtml _ Unit
patch = runFn3 patchImpl virtualDOM
