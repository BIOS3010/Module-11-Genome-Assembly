#!/bin/bash

# Usage: bash scripts/mapping.sh data/NC_045512.fa data/reads_file.fastq.gz
cd ~/Module-11-Genome-Assembly

# create results folder
mkdir -p results/mapping

# Map PacBio HiFi/CCS reads
./minimap2/minimap2 -ax map-pb $1 $2 > results/mapping/mapping.sam

#sort and index the bam file:
module load SAMtools/1.15.1-GCC-11.3.0

cd results/mapping
samtools view -Sb mapping.sam | samtools sort - -o mapping.sorted.bam
samtools index mapping.sorted.bam

#create consensus

#fastqc data/SRR19910221.fastq.gz -o results/fastqc
