# Exercise 1: Genome Assembly

We will use two highly-used genome assemblers, canu and flye. **Canu** is made to assemble PacBio reads using **K-mer-based overlap computation**. It is derived from an assembler called Celera Assembler, which was made by Celera, the private company that competed against the Human Genome Project and were the quickest to sequence and assemble the human genome. It was first used to assemble Drosophila which was published in 2000. Celera is no longer maintained, but parts of the code lives on in canu. It first uses a k-mer hashing algorithm to compute overlaps between the error-prone input reads while attempting to avoid mistaken overlaps from repetitive regions and then uses these overlaps to correct the reads. Next, reads containing segments unsupported by overlaps are trimmed or broken into multiple reads. Finally, Canu uses a modified version of the best overlap graph algorithm to assemble the corrected and trimmed reads into contigs. **Flye** is a de novo assembler for single molecule sequencing reads, such as those produced by PacBio and Oxford Nanopore Technologies. Flye uses a **de Bruijn graph–based algorithm** rather than an overlap graph–based algorithm. The modified de Bruijn graph, called an A-Bruijn graph, has the repeat-resolving capabilities of a classic de Bruijn graph but is better able to handle read errors.

Running canu and flye might take some time, so we will start these before continuing with other exercises. Each one of you will only run one program according to which group you belong to. 

**Group 1 and 6 – run canu

**Group 2-5 and 7-10 – run flye

Log on to the appropriate server

Groups 1 to 5

`ssh itf-appn-test01.hpc.uio.no`
        
or Group 6 to 10

`ssh itf-appn-test02.hpc.uio.no`

navigate to the shared folder for this exercise 

`cd /storage/BIOS3010/helle`

`ls -lh`

The data is in the file m64094_200521_143350.ccs.fastq.gz

As you can see, there are two different assembly scripts here. Copy the appropriate one to your home directory like this:

`cp canu.sh ~/`

`cp Flye.sh ~/`

Examine the scripts:

`less canu.sh  #press q to quit less`

Both canu and flye are set up as modules on this server and can be activated using module load. Look at the help pages for canu http://gensoft.pasteur.fr/docs/canu/1.6/parameter-reference.html or flye https://github.com/fenderglass/Flye to see if there are any settings you would like to change. To edit the script you can use nano. To start nano type:

`nano canu.sh`

Press Ctrl+X to exit, it will ask you to choose a name for your file. Type name and press enter. 
(PS, on a Mac, Cmd+C and Cmd+V works in the terminal and while editing. It could be something similar on Windows, but we are not so familiar with that platform.)

Assemblies usually take some time to run. We will therefore run them in the background in a screen so that it continues to run when you close the connection. 

`screen -S chooseanyname`

You will now enter a new window. Start one of the assembly scripts. 

`sh canu.sh`

or

`sh flye.sh`

To leave screen press Ctrl + A + D

Is it running? Check by entering top
Or look at the files .err and .out

To reenter a screen do the following steps. Look at which screens you have using

`screen -ls`

You will see a list like this:
There are screens on:
	1735995.name	(Detached)
	1464188.134235	(Detached)
	1347235.BAM	(Detached)
	1342030.bam	(Detached)

Use the number to the left to enter a specific screen, e.g:

`screen -R 1735995`

To leave screen press Ctrl + A + D

**Look at the assembly output.**

**Canu**

When complete, the genome assembly will be found in a file called canu_assembly.contigs.fasta in the same folder as the canu.sh script.

When the assembly starts, you should have a file called canu.err. This is the log of the assembly process, and it is always good to see how the process has gone. The last line should be “-- Bye.”, then you know it has finished successfully. 

**Flye**

When complete, the genome assembly will be found in a file called assembly.fasta in the same folder as the flye.sh script.

When the assembly starts, you should have a file called flye.err. This is the log of the assembly process, and it is always good to see how the process has gone. At the end there should be some assembly statistics, then you know it has finished successfully. 

**Congratulations, you have created your (possibly) first assembly that should give you a genome of *Bombus campestris*. In Exercise 2 we will evaluate the genome assembly.**

PS. If you need to restart your script you may have to delete the directory you have created, either canu_assembly or flye_assembly. You can do this by using the following command

`rm -rd foldername´




