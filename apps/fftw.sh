#!/bin/bash

# fftw compilation
mkdir -p /share/apps/fftw/3.3.9
cd /share/apps/fftw/3.3.9
wget http://www.fftw.org/fftw-3.3.9.tar.gz
tar -xf fftw-3.3.9.tar.gz
mv fftw-3.3.9 intel-2021
cd intel-2021
source /share/apps/intel/oneapi/setvars.sh
export CC='icc' CFLAGS='-xHost -O3 -g' F77='ifort' FFLAGS='-f77rtl -fast'
./configure --enable-shared --enable-single --prefix=/share/apps/fftw/3.3.9/intel-2021 --enable-avx

# module
mkdir /share/apps/modules/fftw
cp /root/PRESTO-automatization/modules/fftw/3.3.9_intel-2021 /share/apps/modules/fftw
