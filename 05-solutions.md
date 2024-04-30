# Get fastq files
You should have cloned this GitHub repo to your home directory, and have a folder on your home directory called `sratoolkit.3.1.0-ubuntu64`. Then you can run the following command to download the SRA entry `SRR13452896` (or any other SRA entry you like):

```bash
# ~/ is a shortcut for your home directory
~/sratoolkit.3.1.0-ubuntu64/bin/fastq-dump --outdir ~/Module-11-Genome-Assembly/data SRR13452896
```  

You should then have the following content in the data folder:

```bash
ls ~/Module-11-Genome-Assembly/data
conda-ivar.yml  GCF_014621545.1_ASM1462154v1_genomic.fna  NC_045512.fa  NC_045512.gff  SRR13452896.fastq
```

NB! I realize that it's not relevant to even inspect the Q-scores of these PacBio HiFI reads. This is because... Let's just skip the first question below. 

```diff
! How is the quality of these sequences compared to the Illumina sequences from Module 10?
```  

```diff
! Why is the quality of PacBio HiFi reads so high?
```  
In 

```diff
! How long is the shortest and longest read? How long are the majority of the reads? How is this length compared to the Illumina reads you looked at?
```
```diff
! Are there any sequencing adapters in the reads that needs to be removed?  
````  