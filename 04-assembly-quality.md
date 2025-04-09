# Assembly quality assessment

Doing _de novo_ assembly on Illumina sequenced SARS-CoV-2 genomes is often very "easy", meaning that we have such high coverage that we almost always get only a single contig representing the entire genome. This is of course a good thing, but it does not provide much opportunity for learning about the complexities of the assembly process. Therefore we will attempt to assemble the genome of the [Mpox virus](https://en.wikipedia.org/wiki/Mpox). Mpox belongs to the family _Poxviridae_ together with other viruses such as variola virus which causes smallpox (kopper). Poxviruses have large double-stranded DNA genomes. The Mpox genome consists of almost 200.000 kb and 181 protein coding genes. We will assemble a Mpox genome _de novo_ from Illumina sequences.  

Download Fastq reads. The commands assume you are working inside the `Module-11-Genome-Assembly` directory which is placed on your home directory.    
```bash
# Remember to load SRA tools first
fastq-dump --split-3 --outdir ~/Module-11-Genome-Assembly/data SRR28726555
```

Run de novo assembly with SPAdes
```bash
# Remember to load Spades first 
spades.py \
    -o results/de_novo_mpox/ \
    -1 data/SRR28726555_1.fastq -2 data/SRR28726555_2.fastq \
    --phred-offset 33
```

```diff
! How many scaffolds and contigs were assembled?
```

### Quality assessment with QUAST
The quality of an assembly can be assessed in many ways, but one of the most common ways is to use the [QUAST](http://quast.sourceforge.net/) tool. QUAST is a quality assessment tool for genome assemblies that takes as input a set of contigs and compares them to a reference genome. QUAST produces a report with many different statistics, such as the number of contigs, the N50 value, and the number of mismatches, indels, and misassemblies.

Run QUAST:
```bash
module load QUAST/5.0.2-foss-2020b
# We use the Mpox reference genome GCF_014621545.1_ASM1462154v1_genomic.fna for comparison
quast \
    results/de_novo_mpox/scaffolds.fasta \
    -r data/GCF_014621545.1_ASM1462154v1_genomic.fna \
    -o quast_results \
    -t 2 
```
Quast creates a subfolder with many different files. Take a look around in it. Then, look at the file called `report.txt` and see if you can answer these questions:  

```diff
! What is the length of the longest contig?
! What is the contig N50 value?
! What is the size of the total assembly? How does this compare to the reference genome? How large fraction of the reference genome is covered (coverage breadth)?
! How many mismatches are there compared to the reference?
```  

There is also a PDF file which you can download to your computer to look at, and an interactive html report you can open in your browser.


### Quality assessment with BUSCO
Another way to assess the quality of an assembly is to use the [BUSCO](https://busco.ezlab.org/) tool. BUSCO is a tool that assesses the completeness of genome assemblies by comparing them to a set of conserved genes that are expected to be present in the genome. The genes are selected from a set of orthologous genes that are conserved across a wide range of species. The idea is that a good assembly should contain most of these genes.

Load BUSCO:
```bash
# Let's purge all loaded module to avoid potential dependency conflicts
module --force purge

# Then load BUSCO
module load BUSCO/5.1.2-foss-2020b
```

Check which datasets of BUSCO genes are available with `busco --list-datasets`

We will run BUSCO using the `poxviridae_odb10` dataset:  

```bash
busco \
    -c 4 \
    -i results/de_novo_mpox/scaffolds.fasta \
    -l poxviridae_odb10 \
    -m genome \
    -o busco
```  

Already on the screen you can see some BUSCO statistics. And you can also find more info in the file `busco/short_summary.specific.poxviridae_odb10.busco.txt`.   

```diff
! How many complete and fragmented BUSCO genes were found?
! Were there any missing genes?
! Were there any duplicated genes?
! Based on the BUSCO result, would you say that the assembly is complete?
```  

**Bonus exercise**: In the folder `data/bowtie2` there are the following files:
```bash
SRR28726555.bam  SRR28726555.bam.bai  contigs.bam  contigs.bam.bai NC_063383.fasta 
```  
Here I have mapped the Illumina reads to the Mpox reference NC_063383.fasta using `Bowtie2` (`SRR28726555.bam` and `SRR28726555.bam.bai`) and also mapped the de novo assembled contigs to the reference (`contigs.bam` and `contigs.bam.bai`). You can download these files and open them in IGV (remember to also load the reference sequence under "Genome"). 
```diff
! Is there any correlation between the read coverage and where the different contigs have been assembled?   
```
