#!/bin/bash

#SBATCH -p standard
#SBATCH -A open
#SBATCH --job-name=SSRM_pipeline
#SBATCH --time=00:40:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G
#SBATCH --error=Eliza/logs/%x_%j.err
#SBATCH --output=Eliza/logs/%x_%j.out

set -e
set -u

# load snakemake
eval "$(/storage/home/ehd5113/miniconda3/bin/conda shell.bash hook)"
conda activate snakemake

# set working directory
cd /storage/group/jag548/default/projects/capscan-gen1/meta

## change cores to match threads in the rule and time to match resources in the rule

snakemake --executor slurm --profile slurm --use-conda --rerun-incomplete --cores 1 --jobs 1 --latency-wait 60
