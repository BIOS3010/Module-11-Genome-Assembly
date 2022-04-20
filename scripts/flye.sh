# Unload any modules loaded previously
# Recommended for reproducibility
module --force purge

# To check if stranded: https://www.biostars.org/p/66627/

# The modules need to be loaded here also
module load Flye/2.8.3-foss-2020a-Python-3.8.2

# Create a folder for the assembly
# -p: skip if it is already there
mkdir -p ~/flye_assembly
cd ~/flye_assembly

# add the read files in a so-called shell variable
PACBIO=/storage/BIOS3010/Genome_assembly/m64094_200521_143350.ccs.fastq.gz

flye -t 2 --pacbio-hifi "$PACBIO" -g 260m -o .  1> flye_1.out 2> flye_1.err

# 1> redirects content on stdout to a file, while 2> redirects stderr to a separate file.
