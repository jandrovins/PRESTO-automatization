#!/bin/bash

# download test and python script
cd /root/PRESTO-automatization
./download_datasets.sh

# copy sbatch files
cd /root/PRESTO-automatization
cp sbatch/sbatch_prestoTD1.sh /root/presto/TestData1
cp sbatch/sbatch_prestoTD2.sh /root/presto/TestData2

# TEST DATA 1
cd /root/presto/TestData1
./sbatch_prestoTD1.sh

# TEST DATA 2
cd /root/presto/TestData2
./sbatch_prestoTD2.sh
