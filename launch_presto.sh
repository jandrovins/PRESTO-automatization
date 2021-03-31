#!/usr/bin/env bash

# download test and python script
cd /root/asc-environment/PRESTO-automatization
./download_datasets.sh

# copy sbatch files
cd /root/asc-environment/PRESTO-automatization
cp sbatch/sbatch_prestoTD1.sh /root/presto/TestData1
cp sbatch/sbatch_prestoTD2.sh /root/presto/TestData2

# TEST DATA 1
cd /root/presto/TestData1
sbatch ./sbatch_prestoTD1.sh

# TEST DATA 2
cd /root/presto/TestData2
sbatch ./sbatch_prestoTD2.sh
