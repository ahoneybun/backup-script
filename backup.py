#!/usr/python3

import os
import sys
import tarfile

# Setting some variable
version = 0.2

print("----------------------------------------------------")
print("Welcome to version", version, "of the backup tool")
print("----------------------------------------------------")

# backing up Documents
docs = tarfile.open("docs.tar.gz","w:gz")
docs.add("/home/aaronh/Documents/", filter=None)
docs.close()

# backing up Pictures
pics = tarfile.open("pics.tar.gz","w:gz")
pics.add("/home/aaronh/Pictures/", filter=None)
pics.close()

# backing up Music
tunes = tarfile.open("tunes.tar.gz","w:gz")
tunes.add("/home/aaronh/Music/", filter=None)
tunes.close()