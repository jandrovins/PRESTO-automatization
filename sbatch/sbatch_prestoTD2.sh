#!/usr/bin/env bash

#SBATCH --job-name='PRESTO TD2'
#SBATCH --output=out-%J.log
#SBATCH --error=err-%J.log
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --nodes=1
#SBATCH --time=14-0
#SBATCH --nodelist=compute-1-29

source ~/anaconda3/bin/activate # conda activation
source /share/apps/intel/oneapi/setvars.sh # since most of the dependencies are compiled with intel compilers

# GCC
conda activate prestopy2 # Contains presto GCC
module load presto

(time python ./pipeline.py Dec+1554_arcdrift+23.4-M12_0194.fil) 1>log.pulsar_search 2>&1


