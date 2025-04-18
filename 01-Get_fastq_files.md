NB! Every time you log on to the server you need to activate the pre-installed BIOS3010 software:  
`module use /home/BIOS3010/software/modules/all/:/opt/software/BIOS3010/modules/all/` 


# Download PacBio HiFi reads
In these exercises we will download and inspect fastq-files from genome sequencing projects of SARS-CoV-2, just like we did in Module 10. However, this time we will use PacBio Hifi reads generated with the [HiFiViral SARS-CoV-2 kit](https://www.pacb.com/research-focus/microbiology/public-health/covid-19-sequencing-tools-and-resources/). You can work either on the analysis server or locally. If you work locally I highly recommend that you have `conda` and `git` installed.  

Go to the NCBI SRA SARS-CoV-2 database (see Module 10) and find data from the PacBio HiFi sequencing experiment SRR19910221. Click on the SRA sample (if you have trouble click [here]([https://www.ncbi.nlm.nih.gov/sra/SRX15953134[accn]](https://www.ncbi.nlm.nih.gov/sra/?term=SRR19910221))). Download the fastq file using the SRA Toolkit:  

```bash
# Activate SRA toolkit
module load SRA-Toolkit/2.10.9-gompi-2020b
fastq-dump --outdir ~/Module-11-Genome-Assembly/data --split-3 SRR19910221
```

Then run FastQC ([see Module 10](https://github.com/BIOS3010/Module-10-HTS/blob/main/00-Get_started.md#installing-and-using-software-on-a-linux-system)) and answer the following questions:
 
```diff
! How is the quality of these sequencese compared to the Illumina sequences from Module 10?
! Why is the quality of PacBio HiFi reads so high?
! How long is the shortest and longest read? How long are the majority of the reads? How is this length compared to the Illumina reads you looked at?
! Are there any sequencing adapters in the reads that needs to be removed?  
````  

If the reads are of good quality, and there are no sequence adapters to be removed, we can go on to assemble the SARS-CoV-2 genome from this sample. We will use two methods, reference-based assembly and _de novo_ assembly.
