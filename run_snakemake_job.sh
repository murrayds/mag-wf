#!/bin/bash
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=2
#SBATCH --time=12:00:00
#SBATCH --job-name=mag
#SBATCH --exclusive
#SBATCH --mem=4G
#SBATCH --partition=short

# a job to run conda on a server that implements slurm
snakemake --unlock
snakemake -j 4 --rerun-incomplete --latency-wait 30
