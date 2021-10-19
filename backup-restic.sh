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
echo "[2] Manage SFTP repository"
echo "[3] Manage local repostory"

server_repo () {
   echo ""
   echo "What is the user@hostname for the server?"
   read serverInfo
   echo ""
   echo "What is the name of the folder?"
   read serverFolder
   echo ""
}

local_repo () {
   echo ""
   echo "What is the destination of the repo?"
   read localInfo
   echo ""
}

echo "------------------------------------------------------"
echo -n "Enter choice: "; read choice
case "$choice" in

0) server_repo
   restic -r sftp:$serverInfo:$serverFolder init
   echo ""
   echo "What folders would you like to backup?"
   read serverSource
   echo ""
   restic -r sftp:$serverInfo:$serverFolder --verbose backup $serverSource
   ;;

1) local_repo
   restic init --repo $localInfo
   echo ""
   echo "What folders would you like to backup?"
   read localSource
   echo ""
   restic -r $localInfo --verbose backup $localSource
   ;;

2) server_repo
   restic -r sftp:$serverInfo:$serverFolder snapshots
   ;;

3) local_repo
   restic -r $localInfo snapshots
   ;;

esac