# Module Documentation

## Module Html.Attributes.Internal

### Types

    data Attr :: *

    data Attribute where
      Attribute :: String -> Attr -> Attribute
      Key :: String -> Attribute
      Namespace :: String -> Attribute


### Values

    attrType :: Attribute -> String

    attribute :: String -> Attr -> Attribute

    getAttrKey :: Attribute -> String

    getAttrValue :: Attribute -> Attr

    getKeyString :: Attribute -> String

    getNamespaceString :: Attribute -> String

    unsafeCoerce :: forall a b. a -> b



