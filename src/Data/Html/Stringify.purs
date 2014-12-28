module Data.Html.Stringify
  ( stringifyVNode
  ) where

import Data.Html
import Data.Html.Elements
import Data.Html.Internal.Stringify

import Data.Function

foreign import stringifyVNodeImpl """
function stringifyVNodeImpl(stringify, opts, vnode){
  return stringify(vnode);
}""" :: forall stringify opts. Fn3 stringify {|opts} VTree String

stringifyVNode :: forall opts. {|opts} -> VTree -> String
stringifyVNode = runFn3 stringifyVNodeImpl stringify

instance showVTree :: Show VTree where
  show = stringifyVNode {}
