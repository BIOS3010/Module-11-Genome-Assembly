Follow these steps to get set up. 

1. Navigate to a folder where you want to work and clone this repo- by typing `git clone https://github.com/BIOS3010/Module-11-Genome-Assembly.git`. This will create a folder called `Module-11-Genome-Assembly`. We will work inside this folder during the exercises.  

2. We will need `conda` to install some software. On the analysis server conda needs to be set up properly the first time you use it. On the server, do the following:
   ```
   module load Miniconda3/4.9.2
   conda init bash
   source ~/.bashrc
   ```

3. To map reads to a genome we will use a software called `Minimap2`. Install Minimap2 with conda:  
   ```
   module load Miniconda3/4.9.2 # Only do this if you use the server
   conda create --name MINIMAP2 # Say yes when prompted
   conda activate MINIMAP2
   conda install -c bioconda minimap2
   ```

4. _NB! Do not do this on the server. Only if you work locally_: To work with sam/bam files we need a set of tools called `Samtools`. To install Samtools do the following:

   ```
   conda create --name SAMTOOLS # Click yes when prompted
   conda activate SAMTOOLS
   conda install -c bioconda samtools
   ```

5. To generate a consensus sequence we will use a program called `iVar`. Install iVar with conda:

   ```
   module load Miniconda3/4.9.2 # Only do this if you use the server
   conda create --file=data/conda-ivar.yml   
   ```
  
