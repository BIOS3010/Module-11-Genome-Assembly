# Exercise 2 - Assembly completeness - BUSCO

We like to use BUSCO to assess the completeness of an assembly. BUSCO (https://busco.ezlab.org/) uses a set of conserved genes that should be present in the species we are interested in. For instance, if you run it on a mammalian species, it tries to find 4104 genes. A high quality genome assembly should have the vast majority of these present and with exons in the correct order and orientation with regards to each other. In vertebrates, genes can span several 100 kbp, so if most genes are found complete, it is likely that the genome assembly is of high quality.

`Module load BUSCO/4.0.5-foss-2019b-Python-3.7.4`

Look at the different BUSCO datasets: 

`busco --list-datasets`

I have run BUSCO using the insect dataset, **insecta_odb10**. If you want you could try a different one, for instance arthropods or eukaryotes. 

You can find two scripts in the folder shared folder, copy the one set up for your assembly to your home directory:

`cp/storage/BIOS3010/helle/busco_flye.sh ~/`

`cp/storage/BIOS3010/helle/busco_canu.sh ~/`

Change name of gene set if you want using *nano*, edit the *-l insecta_odb10* to another database from the list you looked at in the step above. 

Both scripts are set up to run BUSCO on assemblies we created,

Open up a screen

`screen -S Busco_canu`

(Ctrl + A + D to exit screen)

Check to see if it is running using top and checking the .err and .log files like previously. This script will take some time to complete. 

As an example, when I ran BUSCO with the insect dataset on the reference genome, we got this:     

C:99.9%[S:99.9%,D:0.0%],F:0.1%,M:-0.0%,n:781

This means that of the 781 genes, 99.9 % were complete and 0.1 % were incomplete. 

Look in the file called busco_insecta.out. It is the last 10 lines or so which are important, so you can for instance write:

`tail busco_insecta.out`


````diff
! What scores did you get?


````diff
! How do interpret these scores? Is the assembly complete? 



<span style=“color:orange;”> text goes here</span>
