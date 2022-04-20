# Pre-processing of the data

Navigate to the shared folder for this exercise:

`cd /storage/BIOS3010/Genome_assembly `

I have already downloaded the sequence data from https://github.com/darwintreeoflife/darwintreeoflife.data/tree/master/species/Bombus_campestris

`wget https://darwin.cog.sanger.ac.uk/insects/Bombus_campestris/iyBomCamp1/genomic_data/pacbio/m64094_200521_143350.ccs.bam`

`wget https://darwin.cog.sanger.ac.uk/insects/Bombus_campestris/iyBomCamp1/genomic_data/pacbio/m64094_200521_143350.ccs.bam.pbi`

Here the data was in bam format, which cannot be used by the assembly software. I have converted the data using  https://github.com/PacificBiosciences/bam2fastx

`bam2fastq  m64094_200521_143350.ccs.bam  -c 6 -o m64094_200521_143350.ccs`
