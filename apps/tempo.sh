#!/bin/bash
export ROOT_DIR=$(pwd)
source /share/apps/intel/setvars.sh --config=${ROOT_DIR}/config.txt
export CC='icx' CFLAGS='-march=sandybridge -O3 -Ofast -fp-model fast' F77='ifort' FFLAGS='-f77rtl -fast'

# tempo compilation
mkdir -p /share/apps/tempo/1.0.0
cd /share/apps/tempo/1.0.0
git clone git://git.code.sf.net/p/tempo/tempo 
mv tempo intel-2021
cd intel-2021
rm -f src/bnrydds.f
cp ${ROOT_DIR}/files/tempo/bnrydds.f src/
./prepare
./configure --prefix=$TEMPO
rm -f src/Makefile
cp ${ROOT_DIR}/files/tempo/src_Makefile.ManuGil src/Makefile
make -j 16 || exit 1
make install || exit 2

# module
mkdir /share/apps/modules/tempo
cp ${ROOT_DIR}/modules/tempo/1.0.0_intel-2021 /share/apps/modules/tempo
