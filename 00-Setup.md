Follow these steps to get set up. 

1. Navigate to a folder where you want to work and clone this repo- by typing `git clone https://github.com/BIOS3010/Module-11-Genome-Assembly.git`. This will create a folder called Module-11-Genome-Assembly. We will work inside this folder during the exercises.
2. To map reads to a genome we will use a software called `Minimap2`. Install Minimap2 using _option a) if you work on the analysis server_, or using _option b) if you work locally_:  

   a)  
   ```
   git clone https://github.com/lh3/minimap2
   cd minimap2 && make
   ```
   
   b) (This require that you have `conda` and `git` install and available in your path)    
   ```
   conda env create --name MINIMAP2 # Click yes when prompted
   conda activate MINIMAP2
   conda install -c bioconda minimap2
   ```
3. _NB: This is only necessay if you work locally_: To work with sam/bam files we need a set of tools called `Samtools`. To install Samtools do the following:

   ```
   conda env create --name SAMTOOLS # Click yes when prompted
   conda activate SAMTOOLS
   conda install -c bioconda samtools
   ```

4. To generate a consensus sequence we will use a program called `iVar`. We will install this software using `conda`. Use option a) on the server and option b) locally:

   a)
   ```
   module load Miniconda3/4.9.2
   conda env create --file=data/conda-ivar.yml   
   ```
   
   b)
   ```
   conda env create --file=data/conda-ivar.yml  
   ```
  
