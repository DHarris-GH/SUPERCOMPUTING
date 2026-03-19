#!/bin/bash
set -ueo pipefail

#create assemblies directory necessary if necessary and move to directoryy
mkdir -p ./assemblies
cd ./assemblies

#create assembly_conda if necessary and move to directory
mkdir -p ./assembly_module
cd ./assembly_module

#load latest version of flye
module load Flye/gcc-11.4.1/2.9.6

#run flye to assembly phage genome
flye \
  --nano-raw ../../data/SRR33939694.fastq.gz \
  --out-dir ./ \
  --meta \
  --genome-size 52k \
  --threads 4
#rename the file and move to appropriate directory
mv assembly.fasta module_assembly.fasta
mv flye.log module_flye.log

#enable extglob to avoid '(' error
shopt -s extglob

#remove all files except these twos
rm -rf !("module_assembly.fasta"|"module_flye.log")

#return to starting directory
cd ../..
