#!/bin/bash
# Intro
# ------
clear
echo "---------------------------------------------"
echo "Welcome to version 1.0 of the Backup Script"
echo "---------------------------------------------"
sleep 2
clear

# Setting the username for path logic
#echo "------------------------------------------"
#echo "Setting username for path logic"
#read -p 'Username: ' uservar
#sleep 2
#clear

# Setting drive location for path logic
echo "------------------------------------------"
echo "Setting drive location home and media are"
echo "the most common locations, if you're not sure"
echo "use media as it's the system default on most distros"
read -p 'Mount Point: ' mountvar
sleep 2
clear

# Testing for automounting
#if [ findmnt --fstab --evaluate | grep Backup = "Backup" ]; then
#echo "Yes"
#fi

#echo "---------------------------"
#echo "Mounting your Backup"
#echo "---------------------------"
#sudo mount /dev/sda1 /media/$uservar/Backup
#sleep 2
#clear

# Selecting which dictories to backup
echo "-----------------------------------------------------------"
echo "Hello $USER what would you like to backup today?"
echo "-----------------------------------------------------------"
echo "[1] Archive Method"
echo "-------------------"
echo -n "Enter choice: "; read choice
case "$choice" in
1) tar -czvf Pictures.tar.gz ~/Pictures/* 
   mv Pictures.tar.gz /media/$USER/Backup/
   tar -czvf Documents.tar.gz ~/Documents/* 
   mv Documents.tar.gz /media/$USER/Backup/
   tar -czvf config-files.tar.gz ~/.config/* 
   mv config-files.tar.gz /media/$USER/Backup/
esac
clear

# Exit script
echo "---------------------------------"
echo "Done backing up those dictories"
echo "Have a great day!"
echo "---------------------------------"
sleep 2
clear

