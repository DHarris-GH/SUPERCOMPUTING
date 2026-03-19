#!/bin/bash
set -ueo pipefail

#if necessary create data directory
mkdir -p ./data

#download and rename fastq file
wget -O SRR33939694.fastq.gz "https://zenodo.org/records/15730819/files/SRR33939694.fastq.gz?download=1"

#move file to data directory
mv SRR33939694.fastq.gz ./data/


