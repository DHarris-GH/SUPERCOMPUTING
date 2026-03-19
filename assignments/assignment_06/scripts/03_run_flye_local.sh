#!/bin/bash
set -ueo pipefail

#create assemblies directory necessary if necessary and move to directoryy
mkdir -p ./assemblies
cd ./assemblies

#create assembly_conda if necessary and move to directory
mkdir -p ./assembly_local
cd ./assembly_local

#flye has already been added to path in flye_2.9.6_manual_build.sh
#run flye locally to assembly phage genome
flye \
  --nano-raw ../../data/SRR33939694.fastq.gz \
  --out-dir ./ \
  --meta \
  --genome-size 52k \
  --threads 4
#rename the files and move to appropriate directory
mv assembly.fasta local_assembly.fasta
mv flye.log local_flye.log

#enable extglob to avoid '(' error
shopt -s extglob

#remove all files except these twos
rm -rf !("local_assembly.fasta"|"local_flye.log")

#return to starting directory
cd ../..

