#!/usr/bin/env bash

#SBATCH --job-name='PRESTO TD2'
#SBATCH --output=out-%J.log
#SBATCH --error=err-%J.log
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --nodes=1
#SBATCH --nodelist=compute-1-27

source /share/apps/intel/setvars.sh # since most of the dependencies are compiled with intel compilers

# GCC
conda activate intel-presto3.0.1-py3 # Contains presto GCC
module load presto/3.0.1_gcc-11.2 gcc/11.2

(time python ./pipeline.py Dec+1554_arcdrift+23.4-M12_0194.fil) &>TD2.log
