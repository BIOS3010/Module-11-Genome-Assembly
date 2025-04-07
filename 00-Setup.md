Follow these steps to get set up. 

1. Navigate to a folder where you want to work and clone this repo- by typing `git clone https://github.com/BIOS3010/Module-11-Genome-Assembly.git`. This will create a folder called `Module-11-Genome-Assembly`. We will work inside this folder during the exercises.  

2. We will need `conda` to install some software. If you did not do this for Module 10: Set up conda on the server:  
   ```bash
   module load Miniconda3/4.9.2
   conda init bash
   source ~/.bashrc
   ```

3. To download fastq files from the SRA server we will use the SRA Toolkit developed by the NCBI: 
```bash
module use /home/BIOS3010/software/modules/all/:/opt/software/BIOS3010/modules/all/
module load SRA-Toolkit/2.10.9-gompi-2020b
```

4. To map reads to a genome we will use a software called `Minimap2`. Install Minimap2 with conda:  
   ```bash
   module load Miniconda3/4.9.2
   # We create separate environments for each software in this Module
   conda create --name MINIMAP2 # Say yes when prompted
   conda activate MINIMAP2
   conda install -c bioconda minimap2
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
  
