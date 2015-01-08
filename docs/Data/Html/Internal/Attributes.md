# Module Documentation

## Module Data.Html.Internal.Attributes

### Types

    data Attr :: *

    newtype AttrType

    type AttrTypes = { key :: AttrType, namespace :: AttrType, attribute :: AttrType }

    data Attribute where
      Attribute :: String -> Attr -> Attribute
      Key :: String -> Attribute
      Namespace :: String -> Attribute


### Values

    attrType :: Attribute -> AttrType

    attrTypes :: AttrTypes

    attribute :: String -> Attr -> Attribute

    attriute :: AttrType

    getAttrKey :: Attribute -> String

    getAttrValue :: Attribute -> Attr

    getKeyString :: Attribute -> String

    getNamespaceString :: Attribute -> String

    key :: AttrType

    namespace :: AttrType

    unsafeCoerce :: forall a b. a -> b



