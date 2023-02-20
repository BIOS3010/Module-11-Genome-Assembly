#!/bin/bash

# Usage: bash scripts/de_novo.sh path_to_fastq
module load SPAdes/3.15.3-GCC-11.2.0

# Create results folder if not present
mkdir -p results/de_novo

# spades has a dedicated SARS-CoV-2 model
spades.py --corona --threads 4 -o results/de_novo -s $1 
