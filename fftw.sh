#!/bin/bash

# fftw compilation
mkdir /share/apps/fftw
cd /share/apps/fftw
wget http://www.fftw.org/fftw-3.3.9.tar.gz
tar -xf fftw-3.3.9.tar.gz
mv fftw-3.3.9 '3.3.9'
cd '3.3.9'
source /share/apps/intel/oneapi/setvars.sh
export CC='icc' CFLAGS='-xHost -O3 -g' F77='ifort' FFLAGS='-f77rtl -fast'
./configure --enable-shared --enable-single --prefix=/share/apps/FFTW/3.3.9/intel-2021 --enable-avx

# module

