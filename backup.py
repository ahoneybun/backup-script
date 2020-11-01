#!/usr/python3

import os
import sys
import tarfile

# Setting some variable
kernel = os.uname()

#print(kernel)

print("----------------------------------------------")
print("Welcome to version 1.0 of the backup tool")
print("----------------------------------------------")

docs = tarfile.open("docs.tar.gz","w:gz")
docs.add("/home/aaronh/Documents/*")
docs.close()