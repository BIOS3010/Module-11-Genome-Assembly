# Assembly quality assessment

Doing _de novo_ assembly on Illumina sequenced SARS-CoV-2 genomes is often very "easy", meaning that we have such high coverage that we almost always get only a single contig representing the entire genome. This is of course a good thing, but it does not provide much opportunity for learning about the complexities of the assembly process. Therefore we will attempt to assemble the genome of the [Mpox virus](https://en.wikipedia.org/wiki/Mpox). Mpox belongs to the family _Poxviridae_ together with other viruses such as variola virus which causes smallpox (kopper). Poxviruses have large double-stranded DNA genomes of several hundred kb. The Mpox genome consists of almost 200.000 kb and 181 protein coding genes. We will _de novo_ assemble Illumina sequences from an Mpox genome sequencing project.  

Run the following commands:  
```
# Download the fastq data
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR287/055/SRR28726555/SRR28726555_1.fastq.gz  
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR287/055/SRR28726555/SRR28726555_2.fastq.gz

# Run de novo assembly with SPAdes
module load SPAdes/3.15.2-foss-2019b
spades.py \
    -o de_novo/ \
    -1 SRR28726555_1.fastq.gz -2 SRR28726555_2.fastq.gz \
    --phred-offset 33
```

Doing de novo assembly of eukaryotic genomes however often results in many contigs and a highly fragmented assembly. 

MPOX: SRR28726555
Spades noen minutter (16 threads default. Husk å spesifisere --phred-offset 33)
Kjøre BUSCO med virus...
Kjøre QUAST



The quality of an assembly can be assessed in many ways, but one of the most common ways is to use the [QUAST](http://quast.sourceforge.net/) tool. QUAST is a quality assessment tool for genome assemblies that takes as input a set of contigs and compares them to a reference genome. QUAST produces a report with many different statistics, such as the number of contigs, the N50 value, and the number of mismatches, indels, and misassemblies.

Download mpox fastq data:
`wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR287/055/SRR28726555/SRR28726555_1.fastq.gz .`  
`wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR287/055/SRR28726555/SRR28726555_2.fastq.gz .`

Run de novo assembly with SPAdes:
```
module load SPAdes/3.15.2-foss-2019b
spades.py \
    -o de_novo/ \
    -1 SRR28726555_1.fastq.gz -2 SRR28726555_2.fastq.gz \
    --phred-offset 33
```

How many scaffolds are there? (use linux command: hint grep)

Run QUAST (quick):
`module load QUAST/5.0.2-foss-2020a-Python-3.8.2`

```
quast \
de_novo/scaffolds.fasta \
-r /storage/BIOS3010/Module11/NC_063383.1.fna \
-o quast_results \
-t 2 
```
 

Run BUSCO (time:):
`module --force purge`
`module load BUSCO/5.0.0-foss-2020a`

`busco --list-datasets`

```
busco \
    -c 4 \
    -i de_novo/scaffolds.fasta \
    -l poxviridae_odb10 \
    -m genome \
    -o busco
```



HELLE:
Exercise 4: Assessing the assembly QC results
Today, we will inspect the results of the BUSCO and Quast analysis. Ultimately, we would like these result to help us answer the question

Which assembly, if any, is better: canu or flye?

First, make sure your BUSCO and Quast analyses are finished:

BUSCO is finished when the .out file has a table of the results at the end, followed by three lines of which the first reads INFO:   BUSCO analysis done. Total running time: XXX seconds.
Quast is finished when the .out file ends with Thank you for using QUAST!
If you do not have a complet BUSCO or Quast analysis, these are provided in the folder /storage/BIOS3010/Genome_assembly/busco_quast.

BUSCO
In the folder created by BUSCO (canu_busco, for example) inspect the file whose name starts with short_summary.specific.insecta_odb10.

The first line of the Results section ooks something like this:

C:99.9%[S:99.9%,D:0.0%],F:0.1%,M:-0.0%,n:781

This means that 99.9 % were complete and 0.1 % were incomplete. Below this line are the numbers of genes in the different categories.

! What scores did you get?
! How do you interpret these scores? Is the assembly complete?
Pair up with someone who used the other program (canu or flye) so you can compare BUSCO results. For the question below, have a look inside the canu_busco or flye_busco folder and check the files in there.

! Does one of the assemblies have more missing genes than the other?
! Compare the list of missing genes. Are the same genes missing in both assemblies?
Quast
Quast creates a subfolder with many different files. Take a look around in it. Then, look at the file called report.txt.

! How many contigs longer than 50000 bp does your assembly consist of?
! What is the N50 length?
! How many misassemblies are there?
There is also a PDF file which you can download to your computer to look at, and an interactive html report you can open in your browser.

Navigate to where the reference assembly is located https://www.ebi.ac.uk/ena/browser/view/GCA_905333015

Screenshot 2021-05-01 at 13 47 44

Click on the “Assembly Statistics” on the right hand side.

! How does the reference genome assembly compare to your assembly in terms of contiguity?
You can also download the sequence report (click “Sequence Report” on the right hand side.

! How many chromosomes does the assembly contain?
Pair up with someone who used the other program (canu or flye) so you can compare Quast results.

! What are the main differences between flye and canu? (N50, misassemblies, longest contig…)
! Which assembly is more contiguous?
Which assembly is better?
Finally, answer this question:

! Can you, based on the combined results of *all* analyses we did, say which assembly (canu or flye) is best, and why?
