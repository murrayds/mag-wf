#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --time=8:00:00
#SBATCH --job-name=mag
#SBATCH --exclusive
#SBATCH --mem=8G
#SBATCH --partition=short

# a job to run conda on a server that implements slurm
snakemake --unlock
snakemake -j 2 --rerun-incomplete --latency-wait 30
