#!/bin/bash
set -ueo pipefail

FILENAME=$1
echo 'Total number of sequences'
SEQS=$(seqtk size $FILENAME | cut -f1)
echo "$SEQS"

echo 'Total number of nucleotides'
NUCLEOS=$(seqtk size $FILENAME | cut -f2)
echo "$NUCLEOS"

echo 'Table of sequence names and lengths (all seqs in file)'
SEQ_LEN_TABLE=$(seqtk comp $FILENAME | cut -f1-2)
echo "$SEQ_LEN_TABLE"
