# Exercise 4: Assessing the assembly QC results

Today, we will inspect the results of the BUSCO and Quast analysis.
Ultimately, we would like these result to help us answer the question

**Which assembly, if any, is better: canu or flye?**

First, make sure your BUSCO and Quast analyses are finished:

* BUSCO is finished when the `.out` file has a table of the results at the end, followed by three lines of which the first reads `INFO:   BUSCO analysis done. Total running time: XXX seconds`.
* Quast is finished when the `.out` file ends with `Thank you for using QUAST!`

If you do not have a complet BUSCO or Quast analysis, these are provided in the folder `/storage/BIOS3010/Genome_assembly/busco_quast`.


## BUSCO

In the folder created by BUSCO (`canu_busco`, for example) inspect the file whose name starts with `short_summary.specific.insecta_odb10`.

The first line of the `Results` section ooks something like this:

`C:99.9%[S:99.9%,D:0.0%],F:0.1%,M:-0.0%,n:781`

This means that 99.9 % were complete and 0.1 % were incomplete.
Below this line are the numbers of genes in the different categories.

````diff
! What scores did you get?
! How do you interpret these scores? Is the assembly complete?
````

Pair up with someone who used the other program (canu or flye)
so you can compare BUSCO results.
For the question below, have a look inside the `canu_busco` or `flye_busco` folder and check the files in there.

````diff
! Does one of the assemblies have more missing genes than the other?
! Compare the list of missing genes. Are the same genes missing in both assemblies?
````

## Quast

Quast creates a subfolder with many different files. Take a look around in it. Then, look at the file called `report.txt`.

````diff
! How many contigs longer than 50000 bp does your assembly consist of?
! What is the N50 length?
! How many misassemblies are there?
````

There is also a PDF file which you can download to your computer to look at,
and an interactive html report you can open in your browser.

Navigate to where the reference assembly is located https://www.ebi.ac.uk/ena/browser/view/GCA_905333015

<img width="1263" alt="Screenshot 2021-05-01 at 13 47 44" src="https://user-images.githubusercontent.com/46928237/116781542-d1aac700-aa83-11eb-8b60-a55f5abf23a0.png">

Click on the “Assembly Statistics” on the right hand side.

````diff
! How does the reference genome assembly compare to your assembly in terms of contiguity?
````

You can also download the sequence report (click “Sequence Report” on the right hand side.

````diff
! How many chromosomes does the assembly contain?
````

Pair up with someone who used the other program (canu or flye)
so you can compare Quast results.

````diff
! What are the main differences between flye and canu? (N50, misassemblies, longest contig…)
! Which assembly is more contiguous?
````

## Which assembly is better?

Finally, answer this question:

```diff
! Can you, based on the combined results of *all* analyses we did, say which assembly (canu or flye) is best, and why?
```
