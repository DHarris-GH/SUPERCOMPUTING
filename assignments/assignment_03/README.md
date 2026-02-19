Dawn Harris
2/19/26
Assignment 3


Task 1: Navigating To Directory
Connect to HPC
bora

enter hpc password
password

Move to SUPERCOMPUTING directory
cd ~/SUPERCOMPUNTING

Move to third assignment directory
cd assignments/assignment_03

Make README.md to document steps
touch README.md

Make data directory
mkdir data

Move to data directory
cd data


Task 2: Downloading fasta sequence file

Inside of data directory  download fasta seqs w/ wget
wget https://gzahn.github.io/data/GCF_000001735.4_TAIR10.1_genomic.fna.gz

Uncompress using gunzip
gunzip GCF_000001735.4_TAIR10.1_genomic.fna.gz
 

Task 3: Exploring File Contents w/ Unix Tools
1. How many sequences are in the FASTA file? (answer=7)
        grep -c "^>" GCF_000001735.4_TAIR10.1_genomic.fna
2. What is the total number of nucleotides (not including header lines or newlines)? (answer=119,668,634)
        grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna| wc -c
3. How many total lines are in the file? (answer=14)
        wc -l GCF_000001735.4_TAIR10.1_genomic.fna          
4. How many header lines contain the word "mitochondrion"? (answer=1)
        grep -o "mitochondrion" GCF_000001735.4_TAIR10.1_genomic.fna |wc -l
5. How many header lines contain the word "chromosome"? (answer=5)
        grep -o "chromosome" GCF_000001735.4_TAIR10.1_genomic.fna |wc -l
6. How many nucleotides are in each of the first 3 chromosome sequences? (answer=30,427,672   19,698,290  23,459,831)
        grep -v "^>"  GCF_000001735.4_TAIR10.1_genomic.fna | tr "\t" "\n" | head -n 1 | wc -c 
        grep -v "^>"  GCF_000001735.4_TAIR10.1_genomic.fna | tr "\t" "\n" | head -n 2 |tail -n 1| wc -c 
        grep -v "^>"  GCF_000001735.4_TAIR10.1_genomic.fna | tr "\t" "\n" | head -n 3|tail -n 1| wc -c 
7. How many nucleotides are in the sequence for 'chromosome 5'? (answer=26,975,503)
        grep -v "^>"  GCF_000001735.4_TAIR10.1_genomic.fna | tr "\t" "\n" | head -n 5|tail -n 1| wc -c 
8. How many sequences contain "AAAAAAAAAAAAAAAA"? (answer=1)
        grep -c "AAAAAAAAAAAAAAAA" GCF_000001735.4_TAIR10.1_genomic.fna
9. If you were to sort the sequences alphabetically, which sequence (header) would be first in that list? (answer=>NC_000932.1...)
        grep -i "^>" GCF_000001735.4_TAIR10.1_genomic.fna| sort
10. How would you make a new tab-separated version of this file, where the first column is the headers and the second column are the associated sequences? (show the command(s))
        paste <(grep -i "^>" GCF_000001735.4_TAIR10.1_genomic.fna) <(grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna)



Task 5: Reflection

The best approach to this assignment was to test individual commands before pipelining them.
This was especially efficient during task three, where multiple commands were necessary to achieve the desired result.
Not only do you avoid mistakes in larger commands, but you also become more familiar with the basic commands.
As a result of this assignment, I have memorized at least 4 of the grep commands.
Additionally, I was reminded that any file made by pasting is stored in the temporary location /dev/fd/63, which gave me a few issues with the last question on task three.
Overall, I am more confident in using Unix tools.

One command line tool I found especially frustrating was ‘–group-separator=SEP’.
Unfortunately, I could not use it properly to separate the names and the sequences with tabs.
I have tried incorporating it into several different pipelines, but it had no effect on the stdout in this case.
Apart from that, the only other issue I dealt with was attempting to use too many pipelines.
Question six of task three has three different stdouts, but despite that, I first attempted to make one giant command.
After that was not working, I realized it was much more efficient to just use multiple commands to get the desired result.

The skills applied here are essential in computational work because they allow you to effectively analyze large amounts of data.
Also, pipelining lets you make commands tailored to a task without having repeat multiple commands.
Any patterns can be found thanks to the extensive list of possible commands to use.
When working with Unix tools, saving and editing existing files can be done with only a single command.
Computational work will, without a doubt, require these features because of their convenience when dealing with large data sets.
