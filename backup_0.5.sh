#!/bin/bash
# Intro
# ------
clear
echo "---------------------------------------------"
echo "Welcome to version 0.5 of the Backup Script"
echo "---------------------------------------------"
sleep 2
clear

# Setting the username for path logic
echo "------------------------------------------"
echo "Setting username for path logic"
read -p 'Username: ' uservar
sleep 2
clear

# Setting drive location for path logic
echo "------------------------------------------"
echo "Setting drive location"
echo "home and media are the most common"
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
echo "Hello $uservar what would you like to backup today?"
echo "-----------------------------------------------------------"
echo "[1] WIP Archive Method"
echo "---------------"
echo -n "Enter choice: "; read choice
case "$choice" in
1) tar -czvf Pictures.tar.gz /home/$uservar/Pictures/* 
   mv Pictures.tar.gz /media/$uservar/Backup/
   tar -czvf Documents.tar.gz /home/$uservar/Documents/* 
   mv Documents.tar.gz /media/$uservar/Backup/
   tar -czvf config-files.tar.gz /home/$uservar/.config/* 
   mv config-files.tar.gz /media/$uservar/Backup/
esac
clear

# Exit script
echo "---------------------------------"
echo "Done backing up those dictories"
echo "Have a great day!"
echo "---------------------------------"
sleep 2
clear

