
# Download PacBio HiFi reads
In these exercises we will download and inspect fastq-files from genome sequencing projects of SARS-CoV-2, just like we did in Module 10. However, this time we will use PacBio Hifi reads generated with the [HiFiViral SARS-CoV-2 kit](https://www.pacb.com/research-focus/microbiology/public-health/covid-19-sequencing-tools-and-resources/). You can work either on the analysis server or locally. If you work locally I highly recommend that you have `conda` and `git` installed.  

Go to the NCBI SRA SARS-CoV-2 database (see Module 10) and find PacBio HiFi sequencing experiments by ticking the boxes on the left. Click on one SRA sample (if you have trouble click [here](https://www.ncbi.nlm.nih.gov/sra/SRX15953134[accn])). **Download the fastq file to the server using whatever method you want (I suggest going through ENA like in Module 10) and store the file in the `data` folder**. Then run FastQC ([see Module 10](https://github.com/BIOS3010/Module-10-HTS/blob/main/00-Get_started.md#installing-and-using-software-on-a-linux-system)) and answer the following questions:

```diff
! How is the quality of these sequencese compared to the Illumina sequences from Module 10?
! Why is the quality of PacBio HiFi reads so high?
! How long is the shortest and longest read? How long are the majority of the reads? How is this length compared to the Illumina reads you looked at?
! Are there any sequencing adapters in the reads that needs to be removed?  
````  

If the reads are of good quality, and there are no sequence adapters to be removed, we can go on to assemble the SARS-CoV-2 genome from this sample. We will use two methods, reference-based assembly and _de novo_ assembly.

# Reference-based genome assembly  
The NCBI accession [NC_045512.2](https://www.ncbi.nlm.nih.gov/nuccore/NC_045512.2/) is the official reference genome for SARS-CoV-2, the so-called Wuhan-Hu-1.  

**Create a copy of this genome sequence in fasta format and store it on your computer or server. Store it in a file called `NC_045512.fa`.**  

We first need to map the HiFi reads to the genome. 


LAGE EN DEL OPPGAVER SOM GÅR PÅ Å FORSTÅ BAM-FILA. HVOR MAPPER ET READ... START/STOP...
FÅ DEM TIL Å REGNE UT AVERAGE SEQUENCING DEPTH.
FÅ DEM TIL Å REGNE UT COVERAGE AV CONSENSUS - ALTSÅ SE BORT I FRA N'S OG DELE PÅ REFERANSE-LENGDEN.

# de novo genome assembly




Plan so far:
1. Download PacBio HiFi data from SARS-CoV-2 from the SRA database.  
2. Use FastQC to inspect the read files.  
3. Assemble SARS-CoV-2 genomes using two approaches:  
   a) Reference-based  
   b) de novo  


-------
Notes:

Tanker:
1. Lage mappinger.
2. Lage mpileup - se på fila??
3. Se på mappingen i IGV
4. Bruke ulik setting for å kalle N (option i Ivar). Se på dette i IGV at det stemmer med coverage. 
5. Lage de novo - sammenligne med referansebasert - lengde? N's? etc. NB: ved de novo kan orienteringen av sekvensen bli ulik. 
6. Mappe en mixed sample - spørre studentene om de har noe forslag til hva som kan ha skjedd med denne prøven? Ha en mixed som er i 1:2-forhold.

Update 28. feb: mystery.fastq.gz er AY.44 og AY.20 blandet. AY.20 har flest reads.
Kanskje de kan prøve å se på mappingen i IGV å finne ut hvilke to prøver som er blitt blandet?



| Sample       | Pangolin         | Reference based (Nextclade)                         | de novo (Nextclade)    |               Comment |
| ------------ | ---------------- | --------------------------------------------------- | ---------------------- | --------------------- |
| SRR19868708  | AY.44            | AY.44                                               | AY.44                  |                       |
| SRR19910221  | AY.20            | AY.20                                               | AY.20                  |                       |
| SRR22291955  | BA.5.2.1         | BA.5.2.1                                            | 1 scaffold full length |                       |

Comment:  
It's quite interesting to compare the results of the reference-based and de novo. For example, are they identical? Which is the longest? Which has the most number of N's? The Nextclade server is a good starting point. 

NB: I don't think that the BA.5.2.1 reads are used correctly in Spades. Do they have different format or something? Why does it not have any matches in Nextclade or Blast? It's strange because the mapping seems alright. There are not only duplicated reads or something like that. The whole genome is covered. And the fastqc results are also looking ok. IT'S PROBABLY JUST THE WRONG ORIENTATINO OF THE SEQUENCE.

-------
The purpose of this exercise is to assemble the genome of a SARS-CoV-2 virus. We will compare two different approaches to genome assembly, reference-based and *de novo* assembly. We will use PacBio HiFi reads generated with the [HiFiViral SARS-CoV-2 kit](https://www.pacb.com/research-focus/microbiology/public-health/covid-19-sequencing-tools-and-resources/).

![field-cuckoo](https://user-images.githubusercontent.com/46928237/116210234-f67d0280-a742-11eb-88fe-5fe9cae1ed22.jpg)

Genome assembly is the process of reconstructing a genome from a set of sequencing reads. This is often a hard problem, because sequencing reads are short. The optimal sequencing technology would have provided complete chromosomes perfectly. These could have been used in further analysis without any processing. However, the different sequencing technologies provide sequencing reads much shorter than chromosomes, and an assembly step is needed. When sequencing a genome for assembly, each nucleotide in the genome should be sequenced to a certain coverage, depending on the sequencing technology. Often a sequencing coverage of at least 60x (where each nucleotide is sequenced an average of 60 times) is used. One of the steps in the sequencing process is a fragmentation step, which is random. Optimally, each read starts in different places along the genome which means that each read should have sequence in common with multiple other reads. This is necessary for genome assembly to be performed.

Here we will perform genome assembly of HiFi reads, which are a type of data produced using the circular consensus sequencing (CCS) mode on one of the PacBio Sequel Systems. HiFi reads provide base-level resolution with >99.9% single-molecule read accuracy.

I have downloaded and converted the data from bam format to fastq format, [to see how look here](https://github.com/BIOS3010/Module-11-Genome-Assembly/blob/main/Pre-processing_data.md). In this module you will carry out two exercises:

Day 1: [Exercise 1: Genome assembly](https://github.com/BIOS3010/Module-11-Genome-Assembly/blob/main/Exercise1_Genome_Assembly.md)

Day 2: [Exercise 2: A first look at our genome assembly](https://github.com/BIOS3010/Module-11-Genome-Assembly/blob/main/Exercise2_a_first_look.md)

Day 3: [Exercise 3: Genome assembly quality assessment](https://github.com/BIOS3010/Module-11-Genome-Assembly/blob/main/Exercise3_Assembly_quality.md)

Day 4: [Exercise 4: Assessing the assembly QC results](https://github.com/BIOS3010/Module-11-Genome-Assembly/blob/main/Exercise4_QC_results.md)


Notes:
Using these reads: https://www.ncbi.nlm.nih.gov/sra/SRX15953134[accn]
SRX15953134
SRR19910221
Downloaded using the web interface. Downloaded fastq-files. Not clipped or filtered. 
Dette er variant: AY.20 (B.1.617.2.20)

SRR19868708: Variant AY.44

Det er noen forskjeller mellom disse faktisk. Inkludert aminosyreforskjeller i Spike. Det kan bli en liten utfordring å skille disse to. Kanskje jeg kan gi som oppgave å si at denne ene prøven er en blanding av to varianter. Elevene får i oppgave å identifisere hvilke to. Først må de velge assembly-strategi (kanskje vi på forhånd har sett på en annen blanding med refereansebasert).
Spades lager bare en contig av disse to. 

Task 1:
Create the conda environment (on Saga load fastqc modules):
module load FastQC/0.11.9-Java-11
Run fastqc on the downloaded reads:
fastqc data/SRR...gz
How is the quality? (The quality is 30 all over)
Sequence length? 275-1575 bp

Task 2:
Map to the genome using minimap2
module load minimap2/2.17-GCC-8.3.0

It seems that too old versions of minimap2 is installed on Saga. Later versions have prebuilt settings for mapping HiFi/CCS reads. We therefore use conda to create a separate environment with all the software we need. This is comparable to using module load, however we can now install the software we want. 

Inspect the mapping file using IGV browser. Are there reads covering the entire genome? Are all portions of the genome equally well sequenced? Are some regions covered more than others? What about the ends of the genome?

Task 3:
Create consensus sequence. Play around with different coverage thresholds. (maybe skip this. Using -m which is the recommended calling model.)
Compare the consensus sequence against the reference. Are there any mutations?
NB! Pass på å kalle N der hvor coverage er lavere enn et threshold.

Task 4:
Create a de novo assembly.
Inspect the results. Are there one or several contigs?
Inspect the scaffolds.fasta file
How many fasta sequences are there? What is the length of the sequence(s)?
Align the contigs against the reference. 
Align the contigs against the consensus sequence created with mapping to the reference. Are they identical? Which of the assemblies/results are most complete? I.e. cover most of the reference?