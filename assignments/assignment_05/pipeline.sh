#!/bin/bash
set -ueo pipefail

#The pipeline is the conductor that calls modular scripts in order
#usage: ./pipeline.sh 

#download fastp data
./scripts/01_download_data.sh

#run 'fastp' on the file pairs
for i in ./data/raw/*_R1_*;
do ./scripts/02_run_fastp.sh "$i"
done
