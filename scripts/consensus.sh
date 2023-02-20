#!/bin/bash

# Usage: bash scripts/mapping.sh data/NC_045512.fa data/reads_file.fastq.gz
cd ~/Module-11-Genome-Assembly

# create results folder
mkdir -p results/consensus

# First we create a pileup file which calculates the likelihood of each nucleotide at each position given the coverage.

# The call command makes the actual base calls - i.e. sets the nucleotide
# -m means default calling method. -v output only variants to the reference (to save space). -O sets the output format (uncompressed BCF output, or -z compressed).
# max-depth sets the maximum number of reads considered per position
#module load BCFtools/1.15.1-GCC-11.3.0 
module load SAMtools/1.15.1-GCC-11.3.0
# Activate the iVar conda environment (make sure that you have run the script create_ivar_env.sh first)
# conda init bash
#conda activate ivar_env
samtools mpileup -d 10000 -f data/NC_045512.fa results/mapping/mapping.sorted.bam -B | ~/.conda/envs/ivar_env/bin/ivar consensus -t 0 -m 10 -n N -p results/consensus/consensus 
#bcftools mpileup --max-depth 5000 -Ou -f data/NC_045512.fa results/mapping/mapping.sorted.bam | bcftools call -mv -Oz -o results/consensus/calls.vcf.gz
#bcftools index results/consensus/calls.vcf.gz

#cat data/NC_045512.fa | bcftools consensus results/consensus/calls.vcf.gz > results/consensus/consensus.fa

