#!/bin/bash

# Usage: bash scripts/consensus.sh path/to/sorted_bam_file consensus_name depth_threshold
cd ~/Module-11-Genome-Assembly

# create results folder if not present
mkdir -p results/consensus

# Create consensus sequence

# First we create a pileup file that summarizes the number of reads at each location in the reference genome. The -d option specifies the maximum depth considered at each position. We set this really high to be sure all reads are considered.

# Activate the samtools software
module load SAMtools/1.15.1-GCC-11.3.0

samtools mpileup -B -d 10000 -f data/NC_045512.fa $1 | /cluster/home/jonbra/.conda/envs/ivar_env/bin/ivar consensus -t 0 -m $3 -n N -p results/consensus/$2 

