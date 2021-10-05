module load presto/3.0.1_gcc-11.2
module load gcc/11.2
. /share/apps/intel/setvars.sh
conda activate intel-presto3.0.1-py3 # contains numpy, scipy and presto 3.0.1

DIR_WHERE_FIL_AND_SCRIPT=/root/PRESTO-automatization/VINCENT/Parallelizing/TestData1
cd $DIR_WHERE_FIL_AND_SCRIPT
NUM_PARALLEL_PROCESSES=2
time mpirun -host localhost -n 1 -genv OMP_NUM_THREADS 8 -usize $NUM_PARALLEL_PROCESSES python -m mpi4py.futures  $DIR_WHERE_FIL_AND_SCRIPT/mpi_pipeline.py $DIR_WHERE_FIL_AND_SCRIPT/GBT_Lband_PSR.fil
## EXMPLAE: mpiexec -n 1 -usize 17 python julia.py
