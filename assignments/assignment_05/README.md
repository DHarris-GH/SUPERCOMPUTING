## Creation Descriptions

First, I added the necessary directories to the Assignment 5 directory. Next, inside the scripts directory I made a `.sh` file using `nano 01_download_data.sh`. In this file I checked for the `./data/raw` directory and used `wget` to download the tarball file. Then I unpacked it with `tar -xf` in the current directory and moved it to `./data/raw` with `mv`. Lastly, I removed the tarball file with `rm` since it was no longer needed.

Installing fastp was also straightforward because the instructions can be copied directly from GitHub. In the programs directory I pasted the installation lines and exported the path. Just to be sure I could properly access fastp, I added the path to my `.bashrc` and verified it with `which fastp`.

The second script `02_run_fastp.sh` gave me a few issues. I created it the same way as the first script. Unfortunately, it took me quite a while to understand that all the fastp parameters listed in the assignment details were necessary to use. In the beginning I only used variants of `--in/--out`, which did not change the contents of the file at all. I eventually figured it out after reading the fastp documentation multiple times.

To create the `pipeline.sh` file I started with:

```
#!/bin/bash 
set -ueo pipefail

```


Then I wrote a few comments explaining what the pipeline does and how to use it. The next step was to test the first download script `./scripts/01_download_data.sh` on a singular fastq file. Finally, I wrote the for loop to run fastp on all of the file pairs.

```
for i in ./data/raw/*_R1_*;
do ./pipeline.sh "$i";
done
```

## Pipeline Instructions

First ensure scripts `01_download_data.sh` and `02_run_fastp.sh` are downloaded, as these files are used in the pipeline. `01_download_data.sh` is used to install and extract the data needed to run fastp, and it creates a `data/raw` directory to store the data if necessary. `02_run_fastp.sh` processes the contents of each fastp file, which is why it is called in a for loop. This for loop iterates over the list of files in the `data/raw` directory and runs fastp on all files.

To run the pipeline use the following command:


```
‘./pipeline.sh’
```

## Reflection

Most challenges I had to overcome while doing this assignment were consequences of making mistakes or not understanding the instructions. For example, I tried only calling the second script in the pipeline once and then running the for loop in the Assignment 5 directory. I soon realized my mistake because I only had a single HTML report for hundreds of files.Although I made mistakes, I did not stop trying if I felt my output looked off. During the process of completing Task 4 I discovered that the command `basename` creates filenames from the last element in a path. I was very pleased to learn about this command because my HTML reports were overwriting a single file at first.

Additionally, the reason scripts are written individually was made clear as well. In order to not promote antisocial behavior, scripts are used to automate processes for others. However, this means scripts must stay flexible to work across many different environments. Attempting to put all steps into one file will get messy and most likely antisocial, since you will not be able to leave some decisions up to others.
A benefit of this method is that it allows for easy collaboration. However, the longer and more complex the tasks are, the harder it will become for others to use them.

