#!/bin/bash

# Usage: bash scripts/mapping.sh data/reads_file.fastq.gz outfile
cd ~/Module-11-Genome-Assembly

# create results folder
mkdir -p results/mapping

# Map PacBio HiFi/CCS reads
./minimap2/minimap2 -ax map-pb data/NC_045512.fa $1 > results/mapping/$2.sam

#sort and index the bam file:
module load SAMtools/1.15.1-GCC-11.3.0

cd results/mapping
samtools view -Sb $2.sam | samtools sort - -o ${2%%.sam}.sorted.bam
samtools index ${2%%.sam}.sorted.bam

#create consensus

#fastqc data/SRR19910221.fastq.gz -o results/fastqc
