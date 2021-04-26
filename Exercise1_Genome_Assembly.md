#Exercise 1: Genome Assembly

We will use two highly-used genome assemblers, canu and flye. Running canu and flye might take some time, so we will start these before continuing with other exercises. 

Each one of you will only run one program according to which group you belong to. 
Group 1-5: run canu
Group 6-10: run flye


Log on to the appropriate server

Groups 1 to 5
ssh itf-appn-test01.hpc.uio.no
or 
Group 6 to 10
ssh itf-appn-test02.hpc.uio.no

cd /storage/BIOS3010/helle
ls -lh

As you can see, there are two different assembly scripts here. Copy the appropriate one to your home directory like this:
cp canu.sh ~/
cp Flye.sh ~/

Examine the scripts:
Less canu.sh  #press q to quit less

Both canu and flye are set up as modules on this server and can be activated using module load. Look at the help pages for canu http://gensoft.pasteur.fr/docs/canu/1.6/parameter-reference.html or flye https://github.com/fenderglass/Flye to see if there are any settings you would like to change. To edit the script you can use nano. To start nano type:

nano canu.sh

Press Ctrl+X to exit, it will ask you to choose a name for your file. Type name and press enter. 
(PS, on a Mac, Cmd+C and Cmd+V works in the terminal and while editing. It could be something similar on Windows, but we are not so familiar with that platform.)

Assemblies usually take some time to run. We will therefore run them in the background in a screen so that it continues to run when you close the connection. 

screen -S chooseanyname

You will now enter a new window. Start one of the assembly scripts. 

sh canu.sh
or
sh flye.sh

To leave screen press Ctrl + A + D

Is it running? Check by entering top
Or look at the files .err and .out
