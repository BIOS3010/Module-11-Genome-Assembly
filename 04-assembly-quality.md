MPOX: SRR28726555
Spades noen minutter (16 threads default. Husk å spesifisere --phred-offset 33)
Kjøre BUSCO med virus...
Kjøre QUAST

Doing de novo assembly on Illumina sequenced viral genomes is often very "easy", meaning that we have such high coverage that we almost always get only a single contig representing the entire genome. Doing de novo assembly of eukaryotic genomes however often results in many contigs and a highly fragmented assembly. 

The quality of an assembly can be assessed in many ways, but one of the most common ways is to use the [QUAST](http://quast.sourceforge.net/) tool. QUAST is a quality assessment tool for genome assemblies that takes as input a set of contigs and compares them to a reference genome. QUAST produces a report with many different statistics, such as the number of contigs, the N50 value, and the number of mismatches, indels, and misassemblies.

Fungerer det å kjøre QUAST på SARS-COV-2 de novo assembly? Vi får vel bare en eneste contig?

Download assembly:
`wget ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/caj/CAJOSK03.fasta.gz .`

How many scaffolds are there? (use linux command: hint grep)

Run QUAST (quick):
`module load QUAST/5.0.2-foss-2020a-Python-3.8.2`

```
quast GCA_905333015.3.fasta -o quast_results -t 4
```

Hvis de skal gjøre BUSCO så bør de starte dette tidlig. Kanskje på to ulike servere. Det tar ca. 1 time. Bør startes med en gang og så ser vi på det i time to. Eventuelt så kan vi starte analysen på slutten av første datalab. 

Run BUSCO (time:):
`module --force purge`
`module load BUSCO/5.0.0-foss-2020a`

`busco --list-datasets`

```
busco -c 4 \
-i GCA_905333015.3.fasta \
-l insecta_odb10 \
-m genome \
-o busco
```