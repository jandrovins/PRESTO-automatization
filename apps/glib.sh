#!/bin/bash
export ROOT_DIR=$(pwd)
source /share/apps/intel/setvars.sh --config=${ROOT_DIR}/config.txt
export CC='icx' CFLAGS='-march=sandybridge -O3 -Ofast -fp-model fast' F77='ifort' FFLAGS='-f77rtl -fast'

#install dependencies
sudo dnf install -y ninja-build meson

DIS_DIR=$ROOT_DIR/files/glib
TAR_DIR=/share/apps/glib/2.66.4/intel-2021

tar -C $DIS_DIR -xf $DIS_DIR/glib-2.66.4.tar.xz
SRC_DIR=$DIS_DIR/glib-2.66.4

cd $SRC_DIR

sudo mkdir -p $TAR_DIR
sudo meson build-icc --prefix $TAR_DIR
ninja-build -C build-icc || exit 1
ninja-build -C build-icc install || exit 2

cd $ROOT_DIR

sudo cp -r $ROOT_DIR/modules/glib /share/apps/modules
