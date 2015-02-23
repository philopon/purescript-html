module Data.Html.Parse where

import DOM
import Data.Html.Elements
import Data.Html.Internal.Virtualize

parseDOM :: Node -> VTree
parseDOM = virtualize

parseString :: String -> VTree
parseString = virtualize.fromHTML
