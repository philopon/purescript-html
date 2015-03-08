#!/usr/bin/env bash -ue
if [ $# -ne 3 ]; then
  echo $0 MODULE INPUT OUTPUT
  exit 1
fi

MODULE=$1
INPUT=$2
OUTPUT=$3

cat <<EOC > $OUTPUT
module $MODULE (exports) where

foreign import exports """
EOC

cat $INPUT | tr -d '\r' >> $OUTPUT

cat <<EOC >> $OUTPUT
""" :: forall a. a
EOC
