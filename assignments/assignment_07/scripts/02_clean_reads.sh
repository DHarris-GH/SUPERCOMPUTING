#!/bin/bash
set -ueo pipefail

#navigate to ~/programs directory to conda install fastp
cd ~/programs

module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"

mamba create -y -n fastp-env fastp -c bioconda
conda activate fastp-env

#navigate back to original directory
cd -


#loop through data in ./data/raw directory
for i in ./data/raw/*_1.fastq.gz
do
FWD_IN=$i;
REV_IN=${FWD_IN/_1/_2};
FWD_OUT=${FWD_IN/.fastq.gz/.clean.fastq.gz};
REV_OUT=${REV_IN/.fastq.gz/.clean.fastq.gz};



#running fastpt
#quality trimming
fastp \
 --in1 "$FWD_IN" \
 --in2 "$REV_IN" \
 --out1 "$FWD_OUT" \
 --out2 "$REV_OUT" \
 --json /dev/null \
 --html /dev/null \
 --trim_poly_g \
 --cut_front \
 --cut_tail \
 --cut_window_size 8 \
 --cut_mean_quality 20 \

mkdir -p ./data/clean
mv ./data/raw/*.clean.fastq.gz ./data/clean/

done;

conda deactivate

