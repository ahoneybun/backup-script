#!/usr/python3

import os

# Setting some variable
version = 0.2

print("----------------------------------------------------")
print("Welcome to version", version, "of the backup tool")
print("----------------------------------------------------")

# backing up Documents
os.system("mkdir -p /home/aaronh/ExtraDrive/Backups/Documents/")
os.system("rsync -avrz /home/aaronh/Documents/* /home/aaronh/ExtraDrive/Backups/Documents/")

# backing up Pictures
os.system("mkdir -p /home/aaronh/ExtraDrive/Backups/Pictures/")
os.system("rsync -avrz /home/aaronh/Pictures/* /home/aaronh/ExtraDrive/Backups/Pictures/")

# backing up Music
os.system("mkdir -p /home/aaronh/ExtraDrive/Backups/Music/")
os.system("rsync -avrz /home/aaronh/Music/* /home/aaronh/ExtraDrive/Backups/Music/")