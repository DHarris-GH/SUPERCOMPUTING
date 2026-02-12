Dawn Harris
02/11/26
Assignment 2


Task 1: Setting Up Your Workspace on the HPC

Connecting to the HPC:
bora 

Check if directory is valid
cd ~/SUPERCOMPUTING/assignments/assignment_02/data

Back to the parent directory:
cd ..

Confirming README.md is also under the assignment directory
Dawn Harris
02/11/26
Assignment 2


Task 1: Setting Up Your Workspace on the HPC

Connecting to the HPC:
bora 

Check if directory is valid
cd ~/SUPERCOMPUTING/assignments/assignment_02/data

Back to the parent directory:
cd ..

Confirming README.md is also under the assignment directory
ls

Create a README file (if necessary):
touch README.md

Confirming file creation:
ls

Closing connection to HPC:
exit



Task 2: Download Files from NCBI via Command-Line FTP 
Install ftp command for local Mac (if necessary): brew install inetutils

Connect to provided sever:
ftp ftp.ncbi.nlm.nih.gov

Type user name:
anonymous
 Type password
your@email

To avoid firewalls during connection (initiates connections locally source stack exchange):
passive

Navigate to desired directory:
cd genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/


Download files locally:
get GCF_000005845.2_ASM584v2_genomic.fna.gz
get GCF_000005845.2_ASM584v2_genomic.gff.gz

Close connection:
bye


Task 3: File Transfer and Permission

Confirm download onto local:
ls

Move files to /SUPERCOMPUTING/assignments/assignment_02/data using FileZilla


Task 4: File Transfer

Retrieve hash digest for each file locally:
md5sum GCF_000005845.2_ASM584v2_genomic.fna.gz
md5sum GCF_000005845.2_ASM584v2_genomic.gff.gz

Connect to the HPC:
bora

Navigate to desired directory:
cd ~/SUPERCOMPUTING/assignments/assignment_02/data

Retrieve hash digest for each file on HPC:
md5sum GCF_000005845.2_ASM584v2_genomic.fna.gz
md5sum GCF_000005845.2_ASM584v2_genomic.gff.gz

Close connection:
exit
 

File Hash Digests Comparisons

GCF_000005845.2_ASM584v2_genomic.fna.gz

	Local:
	c13d459b5caa702ff7e1f26fe44b8ad7

	HPC:
	c13d459b5caa702ff7e1f26fe44b8ad7

GCF_000005845.2_ASM584v2_genomic.gff.gz

	Local:
	2238238dd39e11329547d26ab138be41

	HPC:
	2238238dd39e11329547d26ab138be41



Task 5: Creating Useful Bash Aliases

Edit bash file:
Nano .zshrc

Paste the following aliases into bash file
alias u='cd ..;clear;pwd;ls -alFh --group-directories-first'
alias d='cd -;clear;pwd;ls -alFh --group-directories-first'
alias ll='ls -alFh --group-directories-first'

Enable aliases:
source ~/.zshrc


Command Parsing

alias u='cd ..;clear;pwd;ls -alFh --group-directories-first'

What it does:
	First it navigates to the current parent directory, clears the terminal of any past actions and prints the current absolute path, 
	then lists all human readable files in the long format classifies file types with symbols, but the directories are listed first


alias d='cd -;clear;pwd;ls -alFh --group-directories-first'

What it does:
	This command navigated to the last directory the terminal was in, then moves clears the terminal of any past actions and prints the current absolute path, 
	then lists all human-readable files in the long format and classifies file types with symbols, but the directories are listed first


alias ll='ls -alFh --group-directories-first'

What it does:
	In the current directory it lists all human-readable files in the long format and classifies file types with symbols, but the directories are listed first

Parsing:
	cd.. - navigates to the parent directory
	cd - - navigates to the last working directory
	clear- clears the terminal
	pwd- prints the current absolute path
	ls = list directory
	a - all
	l -long
 	F - identifies file type with symbols
	h - human readable
	--group-directories-first - directory comes before files


Assignment Reflection

The most difficult portion of this assignment was attempting to download the files using the ftp commands.
 Specifically, if the command was entered incorrectly or too slowly, the connection would break.
 Additionally, when I finally confirmed the correct download, I ran into this error: “ftp error 425 unable to build data connection.” 
 After looking online at how others dealt with this problem, I developed a plan that worked well.
 Typing the commands elsewhere and pasting them into the terminal was very efficient.
