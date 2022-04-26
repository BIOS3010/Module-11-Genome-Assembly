# Exercise 2: A first look at our genome assembly

Today, we will make sure the assembly has finished.
Look at the sections **Following progress** and **When is the assembly done?** in the instructions for **Exercise 1: Genome Assembly**
and check whether your assembly has finished.

Pair up with someone who used the other program (canu or flye)
so you can compare assemblies.

Use these files:
* canu: `k12.report`, look at the end of the file
* flye: `flye.log`, look at the end of the file

Answer the following questions:

```diff
! How many contigs (sequences) does the assembly consist of
! What is the total length of the assembly?
! What is the N50 of the assembly?
! What does `N50` mean?
```

**NOTE** For canu, the NG50, which is a variant of the N50, is in the table at the end of the file `k12.report`, the line with `50` and the (first) column `NG (bp)`

Finally, answer this question:

```diff
! can you, based on the answers to the questions above, say which assembly (canu or flye) is best, and why?
```

## Other things to try

### Run the other program also

If you have run the canu assembly, you could start the flye assembly now, and vise versa.

### Write your own program to calculate N50

Use your Python and Biopython knowledge to write a Python program that takes a fasta file with sequences as input, and prints out the N50 for the sequences.
