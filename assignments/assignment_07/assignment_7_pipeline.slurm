#!/bin/bash
#SBATCH --job-name=assignment_07
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=5
#SBATCH --time=36:00:00
#SBATCH --mem=85G
#SBATCH --mail-type=FAIL,BEGIN,END
#SBATCH --mail-user=dnharris@wm.edu     #input your email
#SBATCH -o ./output/assignment_07_%j.out
#SBATCH -e ./output/assignment_07_%j.err

bash ./scripts/01_download_data.sh
bash ./scripts/02_clean_reads.sh
bash ./scripts/03_map_reads.sh
