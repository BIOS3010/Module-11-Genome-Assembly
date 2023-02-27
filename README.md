# Module-11-Genome-Assembly
-------
Notes:
SRR19868708: AY.44  
SRR19910221: AY.20  
SRR22291955: BA.5.2.1  

Mixed_1: AY.20 + BA.5.2.1. 1:1 reads  
Mixed_2: AY.20 + BA.5.2.1. 1:2 reads

| Sample       | Pangolin         | Reference based (Nextclade)                         | de novo (Nextclade) |               Comment |
| ------------ | ---------------- | --------------------------------------------------- | ------------------- | --------------------- |
| SRR19868708  | AY.44            | AY.44                                               |                     |                       |
| SRR19910221  | AY.20            | AY.20                                               |                     |                       |
| SRR22291955  | BA.5.2.1         | BA.5.2.1                                            |                     |                       |
| Mixed_1      | AY.20 + BA.5.2.1 | B.1.617.2 (i.e. base Delta. Not identical to AY.20) |                     | Ratio 1:1             |
| Mixed_2      | AY.20 + BA.5.2.1 | BA.5.2.1                                            |                     | Ratio 1:2 (most BA.5) |

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
