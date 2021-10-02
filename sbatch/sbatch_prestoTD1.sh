#!/usr/bin/env bash

#SBATCH --job-name='PRESTO TD1'
#SBATCH --output=out-%J.log
#SBATCH --error=err-%J.log
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --nodes=1
#SBATCH --time=14-0
#SBATCH --nodelist=compute-1-5

source ~/anaconda3/bin/activate # conda activation
source /share/apps/intel/setvars.sh # since most of the dependencies are compiled with intel compilers

# GCC
conda activate prestopy2 # Contains presto GCC
module load presto

(time python ./pipeline.py GBT_Lband_PSR.fil) 1>log.pulsar_search 2>&1


