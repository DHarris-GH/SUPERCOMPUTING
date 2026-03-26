#!/bin/bash
set -ueo pipefail

#variable for orginal directory
START_PWD=$(pwd)

#navigate to ~/programs directory
cd ~/programs

#conda install bbmap-rnv
module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"

mamba create -y -n bbmap-env bbmap -c bioconda

#install samtools
wget https://github.com/samtools/samtools/releases/download/1.23.1/samtools-1.23.1.tar.bz2
tar -xf samtools-1.23.1.tar.bz2
cd samtools-1.23.1
./configure --prefix=$HOME/programs
make
make install

#navigate back to original directory and create ./output directory if necessary
cd "$START_PWD"
mkdir -p ./output

#export path to use programs
export PATH=$HOME/programs/bin:$PATH

#activate bbmap
conda activate bbmap-env

#loop through clean data to run bbmap
for i in ./data/clean/*_1.clean.fastq.gz;
do FWD=$i;
REV=${FWD/_1/_2};
OUT=${FWD/_1.clean.fastq.gz/.sam}

#running bbmap
bbmap.sh -Xmx16g threads=6 in="$FWD" in2="$REV" ref=./data/dog_reference/dog_reference_genome.fna out="$OUT" minid=0.95
done

#deactivate bbmap-env
conda deactivate

#move sam files to ./output directory
mv ./data/clean/*.sam ./output

#loop through sam files and find matches
for i in ./output/*.sam;
do samtools view "$i" -F 4 > "${i/.sam/.dog-matches.sam}";
done

#remove ref directory
rm -rf ./ref
