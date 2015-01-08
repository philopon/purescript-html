module Data.Html.Internal.Attributes
  ( Attribute(..)
  , Attr(..)
  , AttrTypes(), attrTypes
  , AttrType(), attriute, namespace, key
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

newtype AttrType = AttrType Number
type AttrTypes =
  { attribute :: AttrType
  , namespace :: AttrType
  , key       :: AttrType
  }

attrTypes :: AttrTypes
attrTypes =
  { attribute: attriute
  , namespace: namespace
  , key:       key
  }

attriute :: AttrType
attriute = AttrType 0

namespace :: AttrType
namespace = AttrType 1

key :: AttrType
key = AttrType 2

attrType :: Attribute -> AttrType
attrType (Attribute _ _) = attriute
attrType (Namespace _)   = namespace
attrType (Key _)         = key

getAttrKey :: Attribute -> String
getAttrKey (Attribute s _) = s

getAttrValue :: Attribute -> Attr
getAttrValue (Attribute _ v) = v

getKeyString :: Attribute -> String
getKeyString (Key k) = k

getNamespaceString :: Attribute -> String
getNamespaceString (Namespace n) = n
