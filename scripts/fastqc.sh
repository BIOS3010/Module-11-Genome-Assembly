#!/bin/bash

module load FastQC/0.11.9-Java-11

fastqc data/SRR19910221.fastq.gz -o results/fastqc
