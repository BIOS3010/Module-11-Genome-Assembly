# Module-8-Genome-Assembly

Genome assembly is the process of reconstructing a genome from a set of sequencing reads. This is often a hard problem, because sequencing reads are short. The optimal sequencing technology would have provided complete chromosomes perfectly. These could have been used in further analysis without any processing. However, the different sequencing technologies provide sequencing reads much shorter than chromosomes, and an assembly step is needed. When sequencing a genome for assembly, each nucleotide in the genome should be sequenced to a certain coverage, depending on the sequencing technology. Often a sequencing coverage of 60x (where each nucleotide is sequenced average 60 times) is used. One of the steps in the sequencing process is a fragmentation step, which is random. Optimally, each read starts in different places along the genome which means that each read should have sequence in common with multiple other reads. This is necessary for genome assembly to be performed. Here we will perform genome assembly with two of the most common sequencing technologies, Illumina and PacBio. We will use two highly-used genome assemblers, Spades and canu. Running these assemblies might take some time, so we will start these before continuing with other exercises. 


`ssh itf-appn-test01.hpc.uio.no `



