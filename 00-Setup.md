Follow these steps to get set up. 

1. Navigate to a folder where you want to work and clone this repo- by typing `git clone https://github.com/BIOS3010/Module-11-Genome-Assembly.git`. This will create a folder called `Module-11-Genome-Assembly`. We will work inside this folder during the exercises.  

2. We will need `conda` to install some software. If you did not do this for Module 10: Set up conda on the server:  
   ```bash
   module load Miniconda3/4.9.2
   conda init bash
   source ~/.bashrc
   ```

3. To map reads to a genome we will use a software called `Minimap2`. Install Minimap2 with conda:  
   ```bash
   module load Miniconda3/4.9.2
   # We create separate environments for each software in this Module
   conda create --name MINIMAP2 # Say yes when prompted
   conda activate MINIMAP2
   conda install -c bioconda minimap2
   ```

4. To generate a consensus sequence we will use a program called `iVar`. Install iVar with conda using a pre-made environment file (yml file in the data folder) that creates an environment with iVar. 

   ```bash
   # If conda is not activated already:
   module load Miniconda3/4.9.2

   # (Make sure the file path to the yml file is correct)
   conda env create --file data/conda-ivar.yml
   ```

