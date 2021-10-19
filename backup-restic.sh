#!/bin/bash
# Intro

$id

echo "------------------------------------------------------"
echo "Hello $USER what would you like to do today?"
echo "------------------------------------------------------"

echo "[0] Create SFTP backup"
echo "[1] Create local backup"
echo "[3] View snapshots"
echo "[4] Remove snapshots"

echo "------------------------------------------------------"
echo -n "Enter choice: "; read choice
case "$choice" in

0) echo ""
   echo "What is the user@hostname for the server?"
   read serverInfo
   echo ""
   echo "What is the name of the folder?"
   read serverFolder
   echo ""
   restic -r sftp:$serverInfo:$serverFolder init
   exit 1
   ;;
1) echo ""
   echo "What is the destination of the repo?"
   read localInfo
   echo ""
   restic init --repo $localInfo
   exit 1
   ;;
3) echo ""
   echo "What is the user@hostname for the server?"
   read serverInfo
   echo ""
   echo "What is the name of the folder?"
   read serverFolder
   echo ""
   restic -r sftp:$serverInfo:$serverFolder snapshots
   exit 1
   ;;
4) echo "Displaying snapshots" 
   sudo restic -r /media/aaronh/ExtraDrive/Backup/ snapshots
   ;;

esac