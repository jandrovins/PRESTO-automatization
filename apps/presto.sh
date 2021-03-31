#!/usr/bin/env bash

ROOT_DIR=$(pwd)
DIS_DIR=$ROOT_DIR/files/presto
export PRESTO=/share/apps/presto/3.0.1/gcc-8.3.1

mkdir -p $PRESTO
tar xf $DIS_DIR/presto-3.0.1.tar.gz -C $DIS_DIR
cp -r $DIS_DIR/presto-3.0.1/* $PRESTO

#INSTALL PRESTO BINARIES
source /share/apps/intel/oneapi/setvars.sh
module load cfitsio fftw glib pgplot tempo
cd $PRESTO/src
make makewisdom
make prep
make -j 16
make clean

#INSTALL PRESTO PYTHON ROUTINES
conda create -n prestopy2 python=2.7 python -y
conda activate prestopy2
pip install numpy scipy
cd $PRESTO ; pip install .


cd $ROOT_DIR
cp -r $ROOT_DIR/modules/presto /share/apps/modules
