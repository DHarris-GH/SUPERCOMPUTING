#!/bin/bash
set -ueo pipefail

#install in programs
mkdir -p ~/programs
cd ~/programs

#intialize conda env (without init)
module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"

#activate flye with conda
mamba create -y -n flye-env flye -c bioconda 
conda activate flye-env

#test the env
flye -v

#back to perivous direectory
cd -

#export yml file with dependencies
conda env export --no-builds > ./data/../flye-env.yml

#deactivate env
conda deactivate
