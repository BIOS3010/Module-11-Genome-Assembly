#!/bin/bash

# Activate conda on the server
module load Miniconda3/4.9.2

# Install the necessary software into a separate conda environment
conda env create --file=data/conda-ivar.yml
