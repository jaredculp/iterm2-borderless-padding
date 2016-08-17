#!/bin/bash

clean_up() {
    if [ -e 0001-Remove-borders-add-padding.tmp.patch ]; then
        rm 0001-Remove-borders-add-padding.tmp.patch
    fi
}

trap clean_up SIGINT SIGTERM

if [ "$#" -ne 2 ]; then
  echo "Usage install.sh <VERTICAL_PADDING> <HORIZONTAL_PADDING>"
  exit 0
fi

if [ ! -d "iTerm2" ]; then
  git clone https://github.com/gnachman/iTerm2
fi

VERTICAL=$1
HORIZONTAL=$2

sed -e "s/HORIZONTAL_VAR/${HORIZONTAL}/g" -e "s/VERTICAL_VAR/${VERTICAL}/g" 0001-Remove-borders-add-padding.patch > 0001-Remove-borders-add-padding.tmp.patch

pushd iTerm2

git checkout 2b2f92ba49370cfb072a7e0e43e9c26882bee4cc
git apply ../0001-Remove-borders-add-padding.tmp.patch
make

popd

clean_up
