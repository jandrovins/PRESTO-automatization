#!/bin/bash


DIS_DIR=$(pwd)/files/pgplot
SRC_DIR=$DIS_DIR/pgplot-5.2
TARGET_DIR='/share/apps/pgplot/gcc-8.3.1'
CORES=16

tar xf $DIS_DIR/pgplot-5.2.tar.gz
mkdir -p $TARGET_DIR
cp $DIS_DIR/drivers.list $DIS_DIR/local.conf $TARGET_DIR
cd $TARGET_DIR

$SRC_DIR/makemake $SRC_DIR linux #uses $TARGET_DIR/local.conf as third

make -j $CORES
make clean
make cpg

cp -r ./modules/pgplot /share/apps/modules/
