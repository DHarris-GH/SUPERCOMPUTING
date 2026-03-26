## Pipeline Instruction

In the directory you choose to work in, move your metadata.csv to a directory called data `./data`. Run the pipeline containing three scripts to inspect for canine contamination in your metadata with: 
```
sbatch assignment_7_pipeline.slurm.

```
Use `sacct` to see your current projects and `squeue` to see your job position in the queue. All of the scripts include the commands needed to download the necessary programs for these tasks. To see more details, read the comments in the scripts and the creation description below.

## Creation Description

### 01_download_data.sh

After setting up my assignment_07 directory, I went to NCBI’s SRA page to find data to download. Using the search string “(illumina metagenome) AND "metagenome"[orgn:__txid256318]” and the filters “Type: genome”, “Platform: illuminated”, and lastly “Results by taxon: metagenome”. To create the script, I started with #!/bin/bash and set -ueo pipefail so I am informed of any potential errors during runtime. Then for the loop, I used `cut -f 1 -d "," | tail -n +2` to get the filenames in the first column but not the column name. The only thing left to do in the loop is use faster-dump to download the files. Outside of the loop, I moved all of the fastq.gz files to the data/raw directory. Next, I changed to the `~/programs` directory and installed datasets with wget. Finally, I moved to the `./data/dog_reference/` directory so I could download the dog reference genome for comparisons with: 
``` 
datasets download genome accession GCF_011100685.1. 

```

In order to keep the directories tidy, I moved the dog reference file to `data/dog_reference`. To prepare for the next script, I navigated to the starting directory.

### 02_clean_reads.sh

For the second script, I set up the shebang and pipefail again and moved back to `~/programs` to conda install the fastp-env. Using the following commands: 
```
module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"
mamba create -y -n fastp-env fastp -c bioconda, conda
activate fastp-env

```

Immediately after going back to the starting directory, I activated fastp. Next, I looped through the forward files and changed the file name using `{//}` and variables for the fastp parameters. Instead of automatically cutting the first and last 8 lines, I used: 
```
--cut_front
 --cut_tail 
--cut_window_size 8
 --cut_mean_quality 20

``` 
This way, it only cuts the tail and front of lines that don’t have a mean quality of 20. Additionally, when reading the fastp documentation, I decided to use: 
`--trim_poly_g` since it’s used for cutting the G tail off Illumina sequences. Of course, it’s necessary to deactivate the fastp-env when it’s done being used. The last thing to do is make the `./data/raw directory` if it doesn’t exist and move the clean.fastq.gz files there.

### 03_map_reads.sh

The last script involved a lot of directory changing, so to make things easier, I assigned the current path to a variable so I can return to it. Then, since there are two programs to install, I moved to `~/programs` and created the bbmap-env the same as the last script. Next, I installed samtools with the link and instructions from the webpage. After using cd with the variable I created earlier, I’m back in the starting directory. At this point, I created the ./output directory if it didn’t exist with mkdir -p. In order to use fastp, first I exported the path it was created in, then activated the env. Next, I used a loop similar to the last script. It used {//} with variables to change the filenames for the bbmap parameters. Being that the metadata files could range in size, I had to use all 16g of memory. To stop the reads from failing, I only used 6 threads. The minimum alignment, or minid, is set to 0.95 to get the most accurate mapping.
```
bbmap.sh -Xmx16g threads=6 in="$FWD" in2="$REV" ref=./data/dog_reference/dog_reference_genome.fna out="$OUT" minid=0.95

```
At this point, I deactivated the env and moved sam files to ./output. However, I still needed to use samtools to find any dog genome matches. After all the files are moved to the new location, I used a for loop with the following do command: 
```
do samtools view "$i" -F 4 > "${i/.sam/.dog-matches.sam}";

```
Once that was finally finished, the very last thing to do is remove the ref directory the sam files were first stored in.

## Reflection

This assignment was especially challenging due to the amount of time needed to complete the slurm job. I thought I accounted for this by starting the assignment four days in advance, but unfortunately mistakes made during the scripting process took up a lot of time. Additionally, I learned that faster-dump doesn’t support the parameter to compress files. However, all I could do was work with what I have currently (cleaned files ready for mapping). The Slurm job only was able to get two files compressed in about six hours, so I used those files and ran the scripts manually after downloading the reference genome. This worked because all of the scripts were tested beforehand, but it didn't have enough time to finish mapping. Although this assignment was especially frustrating because of the time it took, I am slightly proud that I was able to confidently create a slurm job.
