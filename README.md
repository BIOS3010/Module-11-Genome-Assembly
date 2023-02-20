# Module-11-Genome-Assembly

The purpose of this exercise is to assemble the genome of a SARS-CoV-2 virus. We will compare two different approaches to genome assembly, reference-based and *de novo* assembly. We will use PacBio HiFi reads generated with the [HiFiViral SARS-CoV-2 kit](https://www.pacb.com/research-focus/microbiology/public-health/covid-19-sequencing-tools-and-resources/).

![field-cuckoo](https://user-images.githubusercontent.com/46928237/116210234-f67d0280-a742-11eb-88fe-5fe9cae1ed22.jpg)

Genome assembly is the process of reconstructing a genome from a set of sequencing reads. This is often a hard problem, because sequencing reads are short. The optimal sequencing technology would have provided complete chromosomes perfectly. These could have been used in further analysis without any processing. However, the different sequencing technologies provide sequencing reads much shorter than chromosomes, and an assembly step is needed. When sequencing a genome for assembly, each nucleotide in the genome should be sequenced to a certain coverage, depending on the sequencing technology. Often a sequencing coverage of at least 60x (where each nucleotide is sequenced an average of 60 times) is used. One of the steps in the sequencing process is a fragmentation step, which is random. Optimally, each read starts in different places along the genome which means that each read should have sequence in common with multiple other reads. This is necessary for genome assembly to be performed.

Here we will perform genome assembly of HiFi reads, which are a type of data produced using the circular consensus sequencing (CCS) mode on one of the PacBio Sequel Systems. HiFi reads provide base-level resolution with >99.9% single-molecule read accuracy.

I have downloaded and converted the data from bam format to fastq format, [to see how look here](https://github.com/BIOS3010/Module-11-Genome-Assembly/blob/main/Pre-processing_data.md). In this module you will carry out two exercises:

Day 1: [Exercise 1: Genome assembly](https://github.com/BIOS3010/Module-11-Genome-Assembly/blob/main/Exercise1_Genome_Assembly.md)

Day 2: [Exercise 2: A first look at our genome assembly](https://github.com/BIOS3010/Module-11-Genome-Assembly/blob/main/Exercise2_a_first_look.md)

Day 3: [Exercise 3: Genome assembly quality assessment](https://github.com/BIOS3010/Module-11-Genome-Assembly/blob/main/Exercise3_Assembly_quality.md)

Day 4: [Exercise 4: Assessing the assembly QC results](https://github.com/BIOS3010/Module-11-Genome-Assembly/blob/main/Exercise4_QC_results.md)
