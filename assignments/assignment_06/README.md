## Script Creation Descriptions

To create `01_download_data.sh`, first use `#!/bin/bash` to set the language to bash. `Wget` installs the fastq.gz file once, and `-O` renames the file so it’s easier to work with. When I did not rename the file, my script would not work. Before moving the contents to the data directory, first check if it exists. `Mkdir -p` will create the directory only if it doesn’t exist. Now, using `mv` to move the fastq.gz file won’t result in an error.

The flye installation and flye manual building .sh files have a similar process. Always start with `#!/bin/bash` and create any necessary directories first. Then, for the installation, `module load miniforge3` and give conda control of the shell instead of bashrc with `source "$(conda info --base)/etc/profile.d/conda.sh"`. Test the environment once installed with `flye -v` and use `conda env export --no-builds > flye-env.yml` to export dependencies. For the manual build, paste the GitHub instructions in the sh file. Lastly, export it to your path.

Before creating the run flye files, I read the documentation using `flye --help`. I did not understand it immediately, so I used chat to get detailed explanations of each command. After going over which commands I felt I needed, I tested them. First, repeat the previous process of checking for directories before they are needed with `mkdir -p` and `cd`. Then run flye using the method in the file name. Remove all files except for flye.log and assembly.fastq with `rm`. I used the following regular expression: 

```
("conda_assembly.fasta"|"flye.log")

```
 However, when testing it, I received the following error: 

```
./scripts/03_run_flye_conda.sh: line 30: syntax error near unexpected token '('

```
After explaining the error to GPT, it suggested I use `shopt -s extglob`. I was very skeptical, but after searching the command, I heard it was safe. Finally, navigate back to the starting directory using cd `../..`.

After setting the pipefail and the language to bash, I called each of the scripts in sequential order. Then, using `tail -n 10` on each of the files, I was able to print the output to stdout. I used `*` to get all files in that folder:

```
assemblies/assembly_conda/* assemblies/assembly_local/* assemblies/assembly_module/*

```
## Reflections

Most of the challenges I faced were self-made, unfortunately, like small hard-to-find typos or forgetting to export to path. These mistakes did add up quite a bit, but it served as a reminder to check my scripts thoroughly before testing them. During this process, I learned the following command:

```
rm -rf directoryname

``` 
which is very convenient but still dangerous. This command saved me from clearing out each file in every directory before deleting. Overall, I prefer the module method because it was the easiest for me, since I don’t have to install/build it beforehand. I will most likely use this method in the next assignment.
