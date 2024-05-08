### Count the number of fasta sequences in a multi-fasta file:  
`grep -c "^>" fasta_file.fasta`  
The "^" makes sure that only lines starting with ">" are counted.  

### Log on to the server:  
`ssh -J username@gothmog.uio.no username@itf-appn-test02.hpc.uio.no`  

### Download files from the server:  
`scp -J username@gothmog.uio.no username@itf-appn-test02.hpc.uio.no:/path/to/file.txt .` 

Tip: Keep another terminal window where you are logged on to the server. Go to the file(s) you want to download and type `pwd`. Copy the path into the command above.  
Tip: To download multiple files use wildcards (e.g. `*`). If you're smart about filenaming this is easy.
