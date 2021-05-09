#!/bin/bash

#compile dependencies
#sudo dnf install -y ninja-build meson

ROOT_DIR=$(pwd)
DIS_DIR=$ROOT_DIR/files/glib
TAR_DIR=/shared/apps/glib/2.66.4/intel-2021

#COMPILING DEPENDENCIES
sudo yum install -y ninja-build 

# #ninja
# tar -xf $DIS_DIR/ninja-1.10.2.tar.gz -C $DIS_DIR
# NINJA=$DIS_DIR/ninja-1.10.2
# cd $NINJA
# ./configure.py --bootstrap
# PATH=$PATH:$NINJA

# #meson
# cd $ROOT_DIR

# tar -xf $DIS_DIR/meson-0.57.1.tar.gz -C $DIS_DIR
# MESON=$DIS_DIR/meson-0.57.1
# PATH=$PATH:$MESON

tar -xf $DIS_DIR/glib-2.66.4.tar.xz -C $DIS_DIR
SRC_DIR=$DIS_DIR/glib-2.66.4

cd $SRC_DIR

sudo mkdir -p $TAR_DIR
source /shared/apps/intel/oneapi/setvars.sh --config=$ROOT_DIR/config.txt
export CC='icc' CXX='icpc' CFLAGS='-xHost -O3 -g'
sudo meson build-icc --prefix $TAR_DIR
ninja-build -C build-icc
ninja-build -C build-icc install

cd $ROOT_DIR

sudo cp -r $ROOT_DIR/modules/glib /shared/apps/modules
