#!/bin/bash

# download test and python script
cd /root/PRESTO-automatization
./download_datasets.sh

# TEST DATA 1
cd /root/PRESTO-automatization
./sbatch/sbatch_prestoTD1.sh

# TEST DATA 2
cd /root/PRESTO-automatization
./sbatch/sbatch_prestoTD2.sh
