#!/usr/python3

import os
import sys
import tarfile

# Setting some variable
version = 0.2

#print(kernel)

print("----------------------------------------------")
print("Welcome to version", version, "of the backup tool")
print("----------------------------------------------")

docs = tarfile.open("docs.tar.gz","w:gz")
docs.add("/home/aaronh/Documents/*")
docs.close()