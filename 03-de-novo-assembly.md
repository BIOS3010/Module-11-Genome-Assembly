# _de novo_ genome assembly

One of the most popular _de novo_ genome assemblers is [SPAdes](https://cab.spbu.ru/software/spades/). SPAdes uses the De Bruijn Graph approach and can take both short read libraries like Illumina, long read libraries like Nanopore, or a combination. SPAdes has several modes and options that can be tweaked to best suite the types of organism or sequencing library you have. We will assemble the SARS-CoV-2 genome using the PacBio HiFi reads. This is a fairly small haploid genome and not the most difficult job. Since we also have quite few reads this does not require that much computational power and can be run on a laptop.


```
# Create results folder if not present
# This assumes you're located in the Module-11-Genome-Assembly folder
mkdir -p results/de_novo

# SPAdes has a dedicated SARS-CoV-2 model activated with the --corona flag
./SPAdes-3.15.5-Linux/bin/spades.py --corona -o results/de_novo/ -s data/FASTQ_FILE
```

The assembly runs very fast and produces a lot of info and files in the `results/de_novo` folder. Use `less` to look at the `spades.log`. Here you can see info about which k-mer sizes were used for example. The final assembly is in the `scaffolds.fasta` file. To see how many scaffolds were assembled, and info about their length, we can pull out only the fasta headers using `grep ">" scaffolds.fasta`.

```diff
! How many scaffolds (fasta sequences) were assembled and how long are the sequence(s)?
! How does this compare to the length of the reference-based assembly (not counting the N's)?
```

Next we will compare the _de novo_ assembled genome sequence with the reference-based assembly. We will align the two sequences using the pairwise Blast function on the NCBI web pages. Go to the [NCBI Blast pages](https://blast.ncbi.nlm.nih.gov/Blast.cgi), click on "Nucleotide BLAST". If you tick the box called "Align two or more sequences" you get a second window to paste a sequence. Paste the two sequences into the two boxes and click `BLAST` (a simple way to copy the sequences is to run `cat` and then the file. This will print the entire sequence to screen and you can select and copy it). In the "Alignments" tab you can inspect the alignment. 

```diff
! Are there any differences between the two assemblies?
! Look at the start and stop positions of the alignment on the two sequences (Query and Subject). Do they start at the exact same positions?
! If you compare the de novo assembled genome with the mapping file you see in IGV, at roughly what coverage level did SPAdes assemble a sequence?
```
