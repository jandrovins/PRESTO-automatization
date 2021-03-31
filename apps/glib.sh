#!/bin/bash

#compile dependencies
#sudo dnf install -y ninja-build meson

ROOT_DIR=$(pwd)
DIS_DIR=$ROOT_DIR/files/glib
TAR_DIR=/share/apps/glib/2.66.4/intel-2021

#COMPILING DEPENDENCIES

#ninja
tar -xf $DIS_DIR/ninja-1.10.2.tar.gz -C $DIS_DIR
NINJA=$DIS_DIR/ninja-1.10.2
cd $NINJA
./configure.py --bootstrap
PATH=$PATH:$NINJA

#meson
cd $ROOT_DIR

tar -xf $DIS_DIR/meson-0.57.1.tar.gz -C $DIS_DIR
MESON=$DIS_DIR/meson-0.57.1
PATH=$PATH:$MESON

tar -xf $DIS_DIR/glib-2.66.4.tar.xz -C $DIS_DIR
SRC_DIR=$DIS_DIR/glib-2.66.4

cd $SRC_DIR

mkdir -p $TAR_DIR
source /share/apps/intel/oneapi/setvars.sh
export CC='icc'
export CXX='icpc'
export CFLAGS='-xHost -O3 -g'
meson.py build-icc --prefix $TAR_DIR
ninja -C build-icc
ninja -C build-icc install

cd $ROOT_DIR

cp -r $ROOT_DIR/modules/glib /share/apps/modules
