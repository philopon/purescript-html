module Data.Html.Stringify
  ( stringifyVNode
  ) where

import Data.Html
import qualified Data.Html.Elements as E
import qualified Data.Html.Internal.Stringify as Stringify

import Data.Function

foreign import stringifyVNodeImpl """
function stringifyVNodeImpl(stringify, opts, vnode){
  return stringify(vnode);
}""" :: forall stringify opts. Fn3 stringify {|opts} VTree String

stringifyVNode :: forall opts. {|opts} -> VTree -> String
stringifyVNode o v = runFn3 stringifyVNodeImpl Stringify.exports o v

instance showVTree :: Show E.VTree where
  show = stringifyVNode {}
