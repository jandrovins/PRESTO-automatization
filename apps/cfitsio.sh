#!/bin/bash
export ROOT_DIR=$(pwd)
source /share/apps/intel/setvars.sh --config=${ROOT_DIR}/config.txt
export CC='icx' CFLAGS='-march=sandybridge -O3 -Ofast -fp-model fast' F77='ifort' FFLAGS='-f77rtl -fast'

# cfitsio compilation
mkdir -p /share/apps/cfitsio/3.49
cd /share/apps/cfitsio/3.49
wget http://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio-3.49.tar.gz
tar -xf cfitsio-3.49.tar.gz
mv cfitsio-3.49 intel-2021
cd intel-2021
./configure --prefix=/share/apps/cfitsio/3.49/intel-2021
make -j 16 || exit 1
make install  || exit 2

# module
mkdir /share/apps/modules/cfitsio
cp ${ROOT_DIR}/modules/cfitsio/3.49_intel-2021 /share/apps/modules/cfitsio
