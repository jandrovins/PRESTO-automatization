#!/usr/bin/env bash

ROOT_DIR=$(pwd)
DIS_DIR=$ROOT_DIR/files/presto
export PRESTO=/shared/apps/presto/3.0.1/gcc-8.3.1
ANACONDA_HOME=/home/ec2-user

mkdir -p $PRESTO
tar xf $DIS_DIR/presto-3.0.1.tar.gz -C $DIS_DIR
cp -r $DIS_DIR/presto-3.0.1/* $PRESTO

#INSTALL PRESTO BINARIES
source /shared/apps/intel/oneapi/setvars.sh --config=$ROOT_DIR/config.txt
module load cfitsio fftw glib pgplot tempo
cd $PRESTO/src
make makewisdom
make prep
make -j 16
make clean

#INSTALL PRESTO PYTHON ROUTINES
source $ANACONDA_HOME/anaconda3/bin/activate
conda env remove -n prestopy2 -y
conda create -n prestopy2 python=2.7 python -y
conda install -c anaconda -n prestopy2 mpi4py -y
conda activate prestopy2
pip install numpy scipy
cd $PRESTO ; pip install .


cd $ROOT_DIR
cp -r $ROOT_DIR/modules/presto /shared/apps/modules
