#!/bin/bash

# tempo compilation
mkdir -p /share/apps/tempo/1.0.0
cd /share/apps/tempo/1.0.0
git clone git://git.code.sf.net/p/tempo/tempo 
mv tempo intel-2021
cd intel-2021
source /share/apps/intel/oneapi/setvars.sh
export CC='icc' CFLAGS='-xHost -O3 -g' F77='ifort' FFLAGS='-f77rtl -fast'
export TEMPO='/share/apps/tempo/1.0.0/intel-2021'
rm -f src/bnrydds.f
cp /root/presto_pipeline/PRESTO-automatization/files/bnrydds.f src/
./prepare
./configure --prefix=$TEMPO

# module
mkdir /share/apps/modules/tempo
cp /root/PRESTO-automatization/modules/tempo/1.0.0_intel-2021 /share/apps/modules/tempo
