# Unload any modules loaded previously
module --force purge

# The modules need to be loaded here also
module load canu/2.1.1-GCCcore-9.3.0-Java-11

# Create a folder for the assembly
mkdir ~/canu_assembly
cd ~/canu_assembly

# backslash allows us to spread a command across several lines for easier readability
# change -d to the correct folder if needed
canu -p canu_assembly -d  ~/canu_assembly maxThreads=8 useGrid=false genomeSize=260m \
-pacbio-hifi /storage/BIOS3010/Genome_assembly/m64094_200521_143350.ccs.fastq.gz \
1> canu.out 2> canu.err

# 1> redirects content on stdout to a file, while 2> redirects stderr to a separate file.
