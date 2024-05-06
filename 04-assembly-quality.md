QUAST kan bli brukt til å måle både "contiguity" og "correctness".

TODO:
Kanskje dette blir litt for likt med oppgavene i nr. 3...
- [] Map the fastq reads to the reference genome with Bowtie2. JEG KAN GJØRE DETTE PÅ FORHÅND. LAGE EN SORTED BAM OG INDEX. SÅ KAN VI SE PÅ DEKNINGEN OG SAMMENLIGNE DETTE MED CONTIGSENE. DE MAPPER ALTSÅ CONTIGSENE MED MINIMAP.
- [] Sort and index the bam file
- [] Index the fasta file so that it can be loaded in IGV. 
- [] Check if the contigs and scaffolds can be mapped to the reference using Minimap2.
- [] Ask the students to view everything in IGV. 

# Assembly quality assessment

Doing _de novo_ assembly on Illumina sequenced SARS-CoV-2 genomes is often very "easy", meaning that we have such high coverage that we almost always get only a single contig representing the entire genome. This is of course a good thing, but it does not provide much opportunity for learning about the complexities of the assembly process. Therefore we will attempt to assemble the genome of the [Mpox virus](https://en.wikipedia.org/wiki/Mpox). Mpox belongs to the family _Poxviridae_ together with other viruses such as variola virus which causes smallpox (kopper). Poxviruses have large double-stranded DNA genomes. The Mpox genome consists of almost 200.000 kb and 181 protein coding genes. We will assemble a Mpox genome _de novo_ from Illumina sequences.  

Download Fastq reads. The commands assume you are working inside the `Module-11-Genome-Assembly` directory which is placed on your home directory.    
```bash
sratoolkit.3.1.0-ubuntu64/bin/fastq-dump --split-files --outdir ~/Module-11-Genome-Assembly/data SRR28726555

# Run de novo assembly with SPAdes
module load SPAdes/3.15.2-foss-2019b
python3.6 SPAdes-3.15.5-Linux/bin/spades.py \
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
module load QUAST/5.0.2-foss-2020a-Python-3.8.2
quast \
    de_novo_mpox/scaffolds.fasta \
    # Mpox reference for comparison
    -r data/GCF_014621545.1_ASM1462154v1_genomic.fna \
    -o quast_results \
    -t 2 
```
Quast creates a subfolder with many different files. Take a look around in it. Then, look at the file called `report.txt`.

```diff
! What is the length of the longest contig?
! What is the contig N50 value?
! What is the size of the total assembly? How does this compare to the reference genome?
! Completeness? What is the coverage breadth %?
! How many mismatches to the reference?
! Flere?
```  

There is also a PDF file which you can download to your computer to look at, and an interactive html report you can open in your browser.


### Quality assessment with BUSCO
Another way to assess the quality of an assembly is to use the [BUSCO](https://busco.ezlab.org/) tool. BUSCO is a tool that assesses the completeness of genome assemblies by comparing them to a set of conserved genes that are expected to be present in the genome. The genes are selected from a set of orthologous genes that are conserved across a wide range of species. The idea is that a good assembly should contain most of these genes.

Load BUSCO:
```bash
module --force purge
module load BUSCO/5.0.0-foss-2020a
```

Check which datasets of BUSCO genes are available with `busco --list-datasets`

Then run BUSCO using the `poxviridae_odb10` dataset:  

```bash
busco \
    -c 4 \
    -i de_novo_mpox/scaffolds.fasta \
    -l poxviridae_odb10 \
    -m genome \
    -o busco
```

Kjøre `generate_plot.py`: https://busco.ezlab.org/busco_userguide.html#interpreting-the-results

HELLE:

In the folder created by BUSCO (canu_busco, for example) inspect the file whose name starts with short_summary.specific.insecta_odb10.

The first line of the Results section looks something like this:

C:99.9%[S:99.9%,D:0.0%],F:0.1%,M:-0.0%,n:781

This means that 99.9 % were complete and 0.1 % were incomplete. Below this line are the numbers of genes in the different categories.

```diff
! What scores did you get?
! How do you interpret these scores? Is the assembly complete?
```  

Pair up with someone who used the other program (canu or flye) so you can compare BUSCO results. For the question below, have a look inside the canu_busco or flye_busco folder and check the files in there.

! Does one of the assemblies have more missing genes than the other?
! Compare the list of missing genes. Are the same genes missing in both assemblies?


Which assembly is better?
Finally, answer this question:

! Can you, based on the combined results of *all* analyses we did, say which assembly (canu or flye) is best, and why?

TANKE:
VI MÅ KUNNE KONKLUDERE NOE OM KVALITETEN PÅ ASSEMBLIET. I FORHOLD TIL DE TRE C'ER. 
HVOR "CONTIGUOUS" ER DE NOVO ASSEMBLIET?
hVOR "CORRECT" SAMMENLIGNET MED REFERANSEN?
HVOR "COMPLETE" ER ASSEMBLIET I FORHOLD TIL BUSCO-RESULTATENE?


KAN VI MAPPE CONTIGSENE, ELLER SCAFFOLDS KANSKJE?, TIL REFERANSEN? KAN VI BRUKE MINIMAP2? KANSKJE JEG SKAL MAPPE READSENE TIL REFERANSEN MED BOWTIE2 OG GI DEM BAM-FILA? DET ER LITT MORSOMT Å SE PÅ DEKNINGEN I DE OMRÅDENE HVOR DET IKKE ER BLITT SATT SAMMEN NOEN CONTIGS. DETTE KAN KANSKJE FORKLARE HVORFOR VI HAR FÅTT FLERE CONTIGS. KANSKJE VI OGSÅ KAN BRUKE PAIRED-READS TIL Å FORSTÅ HVORDAN NOEN CONTIGS HAR BLITT SATT SAMMEN TIL SCAFFOLDS?
