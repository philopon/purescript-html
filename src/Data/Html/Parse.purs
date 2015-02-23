module Data.Html.Parse where

import Data.Html.Elements
import Data.Html.Internal.VirtualDOM
import Data.Html.Internal.HtmlToVDom

parseString :: String -> VTree
parseString = htmlToVDom virtualDOM.vtext
