#!/usr/python3

import os

# Setting some variable
version = 0.2

print("----------------------------------------------------")
print("Welcome to version", version, "of the backup tool")
print("----------------------------------------------------")

# backing up Documents
os.system("mkdir -p /media/aaronh/SteamLinux/Backups2/Documents/")
os.system("rsync -avrz /home/aaronh/Documents/* /media/aaronh/SteamLinux/Backups2/Documents/")

# backing up Pictures
os.system("mkdir -p /media/aaronh/SteamLinux/Backups2/Pictures/")
os.system("rsync -avrz /home/aaronh/Pictures/* /media/aaronh/SteamLinux/Backups2/Pictures/")

# backing up Music
os.system("mkdir -p /media/aaronh/SteamLinux/Backups2/Music/")
os.system("rsync -avrz /home/aaronh/Music/* /media/aaronh/SteamLinux/Backups2/Music/")

# backing up config files
os.system("mkdir -p /media/aaronh/SteamLinux/Backups2/.config/")
os.system("rsync -avrz /home/aaronh/.config/* /media/aaronh/SteamLinux/Backups2/.config/")