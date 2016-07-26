#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage install.sh <VERTICAL_PADDING> <HORIZONTAL_PADDING>"
  exit 0
fi

if [ ! -d "iTerm2" ]; then
  git clone https://github.com/gnachman/iTerm2
fi

VERTICAL=$1
HORIZONTAL=$2

pushd iTerm2

sed -i "" "s/HORIZONTAL_VAR/${HORIZONTAL}/g" ../0001-Remove-borders-add-padding.patch
sed -i "" "s/VERTICAL_VAR/${VERTICAL}/g" ../0001-Remove-borders-add-padding.patch
git checkout 2b2f92ba49370cfb072a7e0e43e9c26882bee4cc
git apply ../0001-Remove-borders-add-padding.patch
make

popd
