Dawn Harris
2/25/26
Assignment 4


This assignment seemed a bit intimidating before Tuesday’s lecture, but overall, the first 5 tasks were relatively easy.
Some of the required steps were already done in previous assignments/lectures, like installing files with wget. Creating the script for installing GH and setqk was straightforward as well.
First, I remembered to add the two important components to the script: ‘#!/bin/bash’ and ‘set -ueo pipefail’. These two commands specify the interpreter and exit the script in case of errors.
Then I pasted the commands necessary to complete the task into a sh file, the same way I did in the previous README files. However, when learning new skills, there will always be mistakes or errors.
I encountered my first error when ensuring my seqtk was in my path. For whatever reason, the command ‘source ~/.bashrc’ would result in the following errors:

-bash: eval: line 66: syntax error near unexpected token `('
-bash: eval: line 66: `ml() { module ml "$@"; };'

After repeatedly reviewing my script for any possible bash syntax errors, I sought troubleshooting assistance. I learned to use ‘exec bash’ instead of ‘source ~/.bashrc’ for this specific instance.
Once this was fixed, the seqtk script was in my path and ran as expected. To familiarize myself with seqtk, I read the GitHub documentation and looked through this website: https://docs.csc.fi/apps/seqtk/#seqtk.
After testing out some of the commands on assignment three data, I felt comfortable enough to move on. At this point, I successfully retrieved the number of sequences, the number of nucleotides, and their compositions.

When writing the summarize_fasta script, I forgot that ‘cut’ splits on character columns and expected it to remove characters.
I decided to test my commands on the assignment three data again, so I can see my mistake. Fortunately, the output led me to use ‘cut –help’ to re-learn how it functions; creating commands using ‘cut -f-N’ had the best results.
I attempted to use the less-than symbol and parentheses to group my outputs in a tmp file, but permission was denied. Next, I assigned a variable to each command and called the variable without any quotes.
This actually gave me an output, but the table format was incorrect. Finally, I realized that double quotes were necessary to allow variable expansion.

After saving the .sh file, I ensured the path to the script was properly saved. Instead of testing it on just one file, I tested it on all three fasta files in the assignment 4 data directory. 
The for loop was also straightforward, although I did forget the asterisk that accesses any file with zero or more characters. 
For Loop Command: for FILENAME in ~/SUPERCOMPUTING/assignments/assignment_04/data/*; do bash summarize_fasta.sh $FILENAME; done

$PATH is the environment variable that holds each directory path to an executable file.
Since this variable has all of the absolute paths, you can execute files with relative paths from any directory


