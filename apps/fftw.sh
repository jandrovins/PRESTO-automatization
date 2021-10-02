#!/bin/bash
export ROOT_DIR=$(pwd)
source /share/apps/intel/setvars.sh --config=${ROOT_DIR}/config.txt
whereis icx
export CC='icx' CFLAGS='-march=sandybridge -O3 -Ofast -fp-model fast' F77='ifort' FFLAGS='-f77rtl -fast'

# fftw compilation
mkdir -p /share/apps/fftw/3.3.9
cd /share/apps/fftw/3.3.9
wget http://www.fftw.org/fftw-3.3.9.tar.gz
tar -xf fftw-3.3.9.tar.gz
mv fftw-3.3.9 intel-2021
cd intel-2021
./configure --enable-fma --enable-shared --enable-single --prefix=/share/apps/fftw/3.3.9/intel-2021 --enable-avx
make -j 16 || exit 1
make install || exit 2

# module
mkdir -p /share/apps/modules/fftw
cp ${ROOT_DIR}/modules/fftw/3.3.9_intel-2021 /share/apps/modules/fftw
