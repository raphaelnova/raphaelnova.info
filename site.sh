#!/bin/bash

if [ "$#" -ne "1" ]; then
  echo "Wrong number of arguments."
  echo "  $0 <action>"
  exit 1
fi

GITBKP=$(mktemp -d submodule.XXXXX)
cp raphaelnova.github.io/.git "${GITBKP}/"

./dist/build/site/site "$1"

mv "${GITBKP}/.git" raphaelnova.github.io/
rmdir "$GITBKP"

