#!/bin/bash
set -ueo pipefail


#loop thorough filenames in the run column of the metadata and download
for i in $(cat ./data/*|cut -f 1 -d ","|tail -n +2);
do fasterq-dump $i;
done;

#create ./data/raw directory if necessary
mkdir -p ./data/raw

#compress all the fastq files and move them to data/raw
gzip *.fastq
mv *.fastq.gz ./data/raw

#navigate to ./data/raw directory and create if necessary
mkdir -p ~/programs
cd ~/programs

#install datasets and make it executable
wget https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/v2/linux-amd64/datasets
chmod +x datasets

#navigate back to orginal directory and create ./data/dog_reference directory if necessary
cd -
mkdir -p ./data/dog_reference/

#download reference genome and move to the approriate directory
datasets download genome accession GCF_011100685.1  --include genome
mv ncbi_dataset.zip ./data/dog_reference/


#navigate to ./data/dog_reference/ and unzip
cd ./data/dog_reference/
unzip ncbi_dataset.zip

#rename the refernce file for convenience
mv ncbi_dataset/data/GCF_011100685.1/GCF_011100685.1_UU_Cfam_GSD_1.0_genomic.fna  dog_reference_genome.fna

#remove other uncessary files
rm -rf  md5sum.txt README.md ncbi_dataset
rm ncbi_dataset.zip

#navigate back to orginal directory
cd -
