#!/bin/bash

#This command is used to print the contents of a variable or the contents of a file to the terminal
echo hello world

#To define a variable
var=10
var="My name is Karan Agrawal"

#To create a file using redirection operator for input and output between files and commands
pwd > var1

#To print a variable
echo $var

#To know the current directory
pwd

#To list the content in the current directory
ls

#This command is an alias for "ls -l", which lists the contents of the current directory in long format.
ll

#To change directory
cd del

#To change it back to home directory
cd	

#To create a folder/directory
mkdir testfolder	

#This command creates an empty file with the name "file01".
touch file01	

#This command opens the file "file01" in the nano text editor.			
nano file01			

#This command outputs the contents of the file "file01".
cat file01

# This command renames the file "file01" to "file1".			
mv file01 file1			

#This command moves the file "file1" to the subdirectory "testfolder".
mv file1 testfolder/file1

#This command creates a copy of the file "file1" in the subdirectory "testfolder" with the name "file2"
cp file1 testfolder/file2

#This command creates a copy of the directory "testfolder" with the name "test1".
cp -r testfolder test1

#This command removes the file "file1"
rm file1

#This command finds the location of the executable file for the Python 3 program.
which python3		

#This command attempts to switch to the "root" user.
su root

#This command attempts to install a package using the apt package manager with superuser privileges
sudo apt install --
