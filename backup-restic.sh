#!/bin/bash
# Intro

$id

echo "------------------------------------------------------"
echo "Hello $USER what would you like to do today?"
echo "------------------------------------------------------"

echo ""
echo "Be sure to use full paths"
echo ""

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
   echo ""
   echo "What folders would you like to backup?"
   read serverSource
   echo ""
   restic -r sftp:$serverInfo:$serverFolder --verbose backup $serverSource
   exit 1
   ;;
1) echo ""
   echo "What is the destination of the repo?"
   read localInfo
   echo ""
   restic init --repo $localInfo
   echo ""
   echo "What folders would you like to backup?"
   read localSource
   echo ""
   restic -r $localInfo --verbose backup $localSource
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