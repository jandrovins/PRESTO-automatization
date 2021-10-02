#!/bin/bash
export ROOT_DIR=$(pwd)
source /share/apps/intel/setvars.sh --config=${ROOT_DIR}/config.txt
export CC='icx' CFLAGS='-march=sandybridge -O3 -Ofast -fp-model fast' F77='ifort' FFLAGS=''


DIS_DIR=$ROOT_DIR/files/pgplot
SRC_DIR=$DIS_DIR/pgplot-5.2
TARGET_DIR='/share/apps/pgplot/intel-2021'

tar xf $DIS_DIR/pgplot-5.2.tar.gz -C $DIS_DIR
mkdir -p $TARGET_DIR
cp $DIS_DIR/drivers.list $DIS_DIR/local.conf $TARGET_DIR
cd $TARGET_DIR

$SRC_DIR/makemake $SRC_DIR linux #uses $TARGET_DIR/local.conf as third

#Uncomment In case of problems with X11
sudo dnf install -y libX11 libX11-devel libXt-devel

make
make clean
sed -i 's/cpgdemo cpgdemo/cpgdemo -nofor-main cpgdemo/g' makefile
make cpg

cd $ROOT_DIR
cp -r ./modules/pgplot /share/apps/modules/
