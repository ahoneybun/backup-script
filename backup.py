#!/usr/python3

import os
import sys
import tarfile
import subprocess

# Setting some variable
version = 0.2

print("----------------------------------------------------")
print("Welcome to version", version, "of the backup tool")
print("----------------------------------------------------")

# backing up Documents
docs = tarfile.open("docs.tar.gz","w:gz")
docs.add("/home/aaronh/Documents/", filter=None)
docs.close()

# moving Documents
subprocess.call(["mv", "docs.tar.gz", "/home/aaronh/ExtraDrive"])

# backing up Pictures
pics = tarfile.open("pics.tar.gz","w:gz")
pics.add("/home/aaronh/Pictures/", filter=None)
pics.close()

subprocess.call(["mv", "pics.tar.gz", "/home/aaronh/ExtraDrive"])

# backing up Music
tunes = tarfile.open("tunes.tar.gz","w:gz")
tunes.add("/home/aaronh/Music/", filter=None)
tunes.close()

subprocess.call(["mv", "tunes.tar.gz", "/home/aaronh/ExtraDrive"])