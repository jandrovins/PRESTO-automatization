#!/usr/bin/env bash
ROOT_DIR=$(pwd)
# download test and python script
cd ${ROOT_DIR}
#./download_datasets.sh

# copy sbatch files
cd ${ROOT_DIR} 
cp sbatch/sbatch_prestoTD1.sh ../presto/TestData1
cp sbatch/sbatch_prestoTD2.sh ../presto/TestData2

# TEST DATA 1
cd ../presto/TestData1
TESTS_DIR=$(pwd)/..
sbatch ./sbatch_prestoTD1.sh

# TEST DATA 2
cd ${TESTS_DIR}/TestData2
sbatch ./sbatch_prestoTD2.sh
