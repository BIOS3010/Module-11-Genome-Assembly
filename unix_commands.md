# Helpful commands

Downloading files to your computer. Open up a new terminal window. You are now on your local computer

`rsync -avz username@itf-appn-test01.hpc.uio.no:~/path_to/file.txt  ~/path_to_folder_local_computer/`

You can also use rsync to transfer files on the cluster, this is particularly good for big files, like the assemblies:

`rsync -avz  /storage/BIOS3010/helle/canu_assembly  ~/`


