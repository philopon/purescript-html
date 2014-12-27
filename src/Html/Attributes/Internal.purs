module Html.Attributes.Internal
  ( Attribute(..)
  , Attr(..)
  , attribute
  , attrType
  , unsafeCoerce

  , getAttrKey
  , getAttrValue
  , getKeyString
  , getNamespaceString
  ) where
  
import Data.Function

foreign import data Attr :: *

data Attribute
  = Attribute String Attr
  | Key       String
  | Namespace String

foreign import unsafeCoerce """
function unsafeCoerce(a) {
  return a;
}""" :: forall a b. a -> b

attribute :: String -> Attr -> Attribute
attribute = Attribute

attrType :: Attribute -> String
attrType (Attribute _ _) = "a"
attrType (Namespace _)   = "n"
attrType (Key _)         = "k"

getAttrKey :: Attribute -> String
getAttrKey (Attribute s _) = s

getAttrValue :: Attribute -> Attr
getAttrValue (Attribute _ v) = v

getKeyString :: Attribute -> String
getKeyString (Key k) = k

getNamespaceString :: Attribute -> String
getNamespaceString (Namespace n) = n
