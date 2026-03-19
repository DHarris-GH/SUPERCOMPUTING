#!/bin/bash
set -ueo pipefail

#create assemblies directory necessary if necessary and move to directoryy
mkdir -p ./assemblies
cd ./assemblies

#create assembly_conda if necessary and move to directory
mkdir -p ./assembly_conda
cd ./assembly_conda

#load conda and give control to shell only (not bashrc)
module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"

#activate the env with conda
conda activate flye-env

#run flye to assembly phage genome
flye \
  --nano-raw ../../data/SRR33939694.fastq.gz \
  --out-dir ./ \
  --meta \
  --genome-size 52k \
  --threads 4
#rename the file and move to appropriate directory
mv assembly.fasta conda_assembly.fasta
mv flye.log conda_flye.log

#enable extglob to avoid '(' error
shopt -s extglob

#remove all files except these twos
rm -rf !("conda_assembly.fasta"|"conda_flye.log")

#deactivate env
conda deactivate

#return to starting directory
cd ../..
