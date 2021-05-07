#!/bin/bash

# tempo compilation
ROOT_DIR=$(pwd)
mkdir -p /share/apps/tempo/1.0.0
cd /share/apps/tempo/1.0.0
git clone git://git.code.sf.net/p/tempo/tempo 
mv tempo intel-2021
cd intel-2021
source /share/apps/intel/oneapi/setvars.sh --config=${ROOT_DIR}/config.txt
export CC='icc' CFLAGS='-xHost -O3 -g' F77='ifort' FFLAGS='-f77rtl -fast'
export TEMPO='/share/apps/tempo/1.0.0/intel-2021'
rm -f src/bnrydds.f
cp ${ROOT_DIR}/files/tempo/bnrydds.f src/
./prepare
./configure --prefix=$TEMPO
rm -f Makefile src/Makefile
cp ${ROOT_DIR}/files/tempo/root_makefile Makefile
cp ${ROOT_DIR}/files/tempo/src_makefile src/Makefile
make
make install

# module
mkdir /share/apps/modules/tempo
cp ${ROOT_DIR}/modules/tempo/1.0.0_intel-2021 /share/apps/modules/tempo
