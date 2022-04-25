
**NOTE** some of the commands in this file are outdated.

# Helpful commands

Downloading files to your computer. Open up a new terminal window. You are now on your local computer

`rsync -avz username@itf-appn-test01.hpc.uio.no:~/path_to/file.txt  ~/path_to_folder_local_computer/`

You can also use rsync to transfer files on the cluster, this is particularly good for big files, like the assemblies:

`rsync -avz  /storage/BIOS3010/Genome_assembly/canu_assembly  ~/`

Change directory (move into a different folder:

`cd /storage/BIOS3010/Genome_assembly/canu_assembly `

Go up one level in the directory:

`cd ../`

Go to home directory simply write

`cd`

Copy: (NB use rsync if the file is big!)

`cp /path/file_to_copy /path/to_copy_file_t`

To open and read files:

`less file`

`cat file`

`zless zipped_file`

`zcat zipped file`

To see files as a list:

`ls -lh`

To edit files use nano:

`nano filename`

To start a shell script:

`sh script_name.sh`

Open up a new screen like this. To exit the screen press Ctrl + a + d at the same time

`screen -S name_screen`

Look at the list of screens:

`screen -ls`

<img width="285" alt="Screenshot 2021-05-07 at 13 23 43" src="https://user-images.githubusercontent.com/46928237/117442737-740cf380-af37-11eb-9bbb-ccf6665acc6a.png">

Reopen a specific screen:

`screen -R 30867`
