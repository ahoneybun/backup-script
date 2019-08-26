#!/bin/bash
# Dead simple backup script written in Bash 
# By Aaron Honeycutt
---

# Defining some variables
day=$(date +%Y-%m-%d)

clear
echo "---------------------------------------------"
echo "Welcome to version 1.0 of the Backup Script"
echo "---------------------------------------------"
sleep 2
clear

# Selecting which dictories to backup
echo "-----------------------------------------------------------"
echo "Hello $USER how would you like to backup today?"
echo "-----------------------------------------------------------"
echo "[1] Archive Method"
echo "-------------------"
echo -n "Enter choice: "; read choice
case "$choice" in
1) tar -czvf Pictures-$day.tar.gz ~/Pictures/* 
   mv Pictures-$day.tar.gz ~/Backup-Drive/
   tar -czvf Documents-$day.tar.gz ~/Documents/* 
   mv Documents-$day.tar.gz ~/Backup-Drive/
   tar -czvf config-files-$day.tar.gz ~/.config/* 
   mv config-files-$day.tar.gz ~/Backup-Drive/
esac
clear

# Exit script
echo "---------------------------------"
echo "Done backing up those dictories"
echo "Have a great day!"
echo "---------------------------------"
sleep 2
clear

