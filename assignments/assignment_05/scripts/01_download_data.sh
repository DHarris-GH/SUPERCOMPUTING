#!/bin/bash

#install tarball file
wget https://gzahn.github.io/data/fastq_examples.tar

#unpack file contents
tar -xf fastq_examples.tar

#check for raw directory and create if not found
mkdir -p ./data/raw/

#move file contents to raw directory
mv *fastq.gz ./data/raw/

#clean up tarball file
rm fastq_examples.tar
