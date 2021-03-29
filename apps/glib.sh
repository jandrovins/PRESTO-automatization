#!/bin/bash

#compile dependencies
sudo dnf install -y ninja-build meson

ROOT_DIR=$(pwd)
DIS_DIR=$ROOT_DIR/files/glib
TAR_DIR=/share/apps/glib/2.66.4/intel-2021

tar -xf $DIS_DIR/glib-2.66.4.tar.xz -C $DIS_DIR
SRC_DIR=$DIS_DIR/glib-2.66.4

cd $SRC_DIR

mkdir -p $TAR_DIR
source /share/apps/intel/oneapi/setvars.sh
export CC='icc'
export CXX='icpc'
export CFLAGS='-xHost -O3 -g'
meson build-icc --prefix $TAR_DIR
ninja -C build-icc
ninja -C build-icc install

cd $ROOT_DIR
