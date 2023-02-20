#!/bin/bash

module load SPAdes/3.15.3-GCC-11.2.0

mkdir -p results/de_novo

# spades has a dedicated SARS-CoV-2 model
spades.py --corona --threads 4 -o results/de_novo -s data/SRR19910221.fastq.gz 
