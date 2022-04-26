# Exercise 1: Genome Assembly

## Introduction

We will use two highly-used genome assemblers, canu and flye. **Canu** is made to assemble PacBio reads using **K-mer-based overlap computation**. It is derived from an assembler called Celera Assembler, which was made by Celera, the private company that competed against the Human Genome Project and were the quickest to sequence and assemble the human genome. It was first used to assemble Drosophila which was published in 2000. Celera is no longer maintained, but parts of the code lives on in canu. It first uses a k-mer hashing algorithm to compute overlaps between the error-prone input reads while attempting to avoid mistaken overlaps from repetitive regions and then uses these overlaps to correct the reads. Next, reads containing segments unsupported by overlaps are trimmed or broken into multiple reads. Finally, Canu uses a modified version of the best overlap graph algorithm to assemble the corrected and trimmed reads into contigs. **Flye** is a de novo assembler for single molecule sequencing reads, such as those produced by PacBio and Oxford Nanopore Technologies. Flye uses a **de Bruijn graph–based algorithm** rather than an overlap graph–based algorithm. The modified de Bruijn graph, called an A-Bruijn graph, has the repeat-resolving capabilities of a classic de Bruijn graph but is better able to handle read errors.

Running canu and flye might take some time, so we will start these and let them finish before continuing with other exercises. Each one of you will only run one program:

**If your birthday is in an odd-numbered month**:
* run canu for the assembly

**If your birthday is in an even-numbered month**:
* run flye for the assembly

Which server to use:

**Odd-numbered groups**:
* use `itf-appn-test01.hpc.uio.no`

**Even-numbered groups**:
* use `itf-appn-test02.hpc.uio.no`

Log on to the appropriate server

Navigate to the shared folder for this exercise and check what files are there

```
cd /storage/BIOS3010/Genome_assembly
ls -lh
```

The data is in the file `m64094_200521_143350.ccs.fastq.gz`

As you can see, there are two different assembly scripts here. Copy the appropriate one to your home directory like this:

`cp canu.sh ~/`

`cp flye.sh ~/`

Examine the scripts:

`less canu.sh  #press q to quit less`

Both the canu and flye programs are set up as modules on this server and can be activated using `module load`.

You should be able to use the script 'as is'. If you still would like to edit the script, you can use `nano`. To start `nano` type:

`nano canu.sh`

One thing you could do is change the name of the location of the folder the assembly will be created in.

Press Ctrl+X to exit; `nano` will ask you whether you want to save any changes, and if so, to choose a name for your file. Press enter to keep the same name.

(PS, on a Mac, Cmd+C and Cmd+V works in the terminal and while editing. It could be something similar on Windows, but we are not so familiar with that platform.)

Look at the help pages for canu http://gensoft.pasteur.fr/docs/canu/1.9/tutorial.html or flye https://github.com/fenderglass/Flye/blob/flye/docs/USAGE.md to see if you understand all the settings.

```diff
! How many threads is the program allowed to use?
! What does this mean and why do we allow more than one?
```

## Starting the assembly

Assemblies usually take some time to run. We will therefore run them in the background in a so-called 'screen' so that it continues to run when you lose the connection (e.g., close the terminal window or lose internet connectivity).

`screen -S chooseanyname`

You will now enter a 'new' terminal window that 'lives' independently of the terminal where you worked in before.
Start one of the assembly scripts.

`sh canu.sh`

or

`sh flye.sh`

To leave screen press Ctrl + A + D

If you now close the terminal that you have worked in so far
(the one *not* running the assembly),
the assembly will still continue!

How can we now check whether the program is running? Check by typing `top` and pressing enter. You should see your username and the processes you are running. One of them should be the assembly program.
Press `q` to leave `top`.

Also look at the files `.err` and `.out` (inside the directory you created, either `canu_assembly` or `flye_assembly`),
see also below.

To 're-enter' a screen type

`screen -rd`

This will take you back to your 'screen' terminal.
If you have more than one screen running,
you will see a list like this:

```
There are several suitable screens on:
	1735995.canu	(Detached)
	1464188.134235	(Detached)
Type "screen [-d] -r [pid.]tty.host" to resume one of them.
```

Use the name you used yourself, or the number to the left to 're-enter' a specific screen, e.g:

`screen -rd canu`

eller

`screen -rd 1735995`

To leave screen again press Ctrl + A + D as before.

If you are done with a screen, and want to terminate it,
re-enter it and type `exit`.

##  Following progress

These assemblies may take up to a day to get finished (!). How can we check what is happening?

When the assembly starts, you should have a file called `canu.err` or `flye.err`. This is the log of the assembly process, and it is always good to see how the process has gone. Check the file regularly, for example using the `tail` command to see the last 10 lines.


##  When is the assembly done?

* Canu: if the last line in `canu.err` is `-- Bye.`, then you know it has finished successfully
* Flye: When there is be some assembly statistics at the end of `flye.err`, then you know it has finished successfully

**Congratulations, you have created your (possibly) first assembly that should give you a genome of *Bombus campestris*.**

When complete, the genome assembly will be found in a file called `canu_assembly.contigs.fasta` (canu) or `assembly.fasta` (flye) in the same folder as the `canu.err` or `flye.err` files.

In Exercise 2 we will evaluate the genome assemblies.

##  Starting the assembly again when something went wrong

When something went wrong, and you need to restart your script, then you should first delete the directory you have created, either `canu_assembly` or `flye_assembly`. You can do this by using the following command:

`rm -rd foldername`

**CAREFUL**: this deletes an entire folder and there is no way to undo it!

## Other things to try

### Quality control of the sequencing data

One thing you could try once your assembly is running is to run `fastqc` on the reads.
However, since the dataset is very large, you should first create a subset of, for example, 10 000 reads.
This can be done using:

`zcat /storage/BIOS3010/Genome_assembly/m64094_200521_143350.ccs.fastq.gz | head -n 40000 > m64094_200521_143350.ccs.10000.fastq`

* `zcat` uncompresses the `fastq.gz` file and shows its content
* `head -n 40000` selects the first 40 000 lines (why 40 000 and not 10 000?)

Now run `fastqc` on the `m64094_200521_143350.ccs.10000.fastq` file (see the exercises from the HTS week).

Note that fastqc was developed for much shorter reads and that its results on these long PacBio reads may not be as useful.

Study the results and see if you understand all the plots.

### Run the other program also

All students should have one assembly, either canu or flye, to work with for the remaining exercises. But if you like you could generate a second one.

**Only** when your assembly has finished successfully may you decide to run the assembly using the other program (flye or canu) also.
