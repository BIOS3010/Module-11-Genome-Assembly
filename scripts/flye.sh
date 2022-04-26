# Unload any modules loaded previously
module --force purge

# To check if stranded: https://www.biostars.org/p/66627/

# The modules need to be loaded here also
module load Flye/2.9-GCC-9.3.0

# Create a folder for the assembly
mkdir ~/flye_assembly
cd ~/flye_assembly

# add the read files in a so-called shell variable
PACBIO=/storage/BIOS3010/Genome_assembly/m64094_200521_143350.ccs.fastq.gz

flye -t 8 --pacbio-hifi "$PACBIO" -g 260m -o .  1> flye.out 2> flye.err

# 1> redirects content on stdout to a file, while 2> redirects stderr to a separate file.
