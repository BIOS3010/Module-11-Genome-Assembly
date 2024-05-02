Follow these steps to get set up. 

1. Navigate to a folder where you want to work and clone this repo- by typing `git clone https://github.com/BIOS3010/Module-11-Genome-Assembly.git`. This will create a folder called `Module-11-Genome-Assembly`. We will work inside this folder during the exercises.  

2. We will need `conda` to install some software. On the analysis server conda needs to be set up properly the first time you use it. On the server, do the following:
   ```bash
   module load Miniconda3/4.9.2
   conda init bash
   source ~/.bashrc
   ```

3. To download fastq files from the SRA server we will use the SRA Toolkit developed by the NCBI. But we need to use the latest version:
```bash
wget --output-document sratoolkit.tar.gz https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz
tar -vxzf sratoolkit.tar.gz
```

4. To map reads to a genome we will use a software called `Minimap2`. Install Minimap2 with conda:  
   ```bash
   module load Miniconda3/4.9.2 # Only do this if you use the server
   conda create --name MINIMAP2 # Say yes when prompted
   conda activate MINIMAP2
   conda install -c bioconda minimap2
   ```

5. _NB! Do not do this on the server. Only if you work locally_: To work with sam/bam files we need a set of tools called `Samtools`. To install Samtools do the following:

   ```bash
   conda create --name SAMTOOLS # Click yes when prompted
   conda activate SAMTOOLS
   conda install -c bioconda samtools
   ```

6. To generate a consensus sequence we will use a program called `iVar`. Install iVar with conda using a pre-made environment file (yml file) that creates an environment with iVar. 

   ```bash
   # On the server do this:
   module load Miniconda3/4.9.2 
   conda env create --file data/conda-ivar.yml

   # If you work locally do this:
   conda env create --file data/conda-ivar.yml  
   ```

7. For _de novo_ assembly we need to download `SPAdes`. We will do this also on the server to get the latest version.

   ```bash
   wget https://github.com/ablab/spades/releases/download/v3.15.5/SPAdes-3.15.5-Linux.tar.gz
   tar -xzf SPAdes-3.15.5-Linux.tar.gz
   ```
  
