#!/bin/bash

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

select_snap () {
   echo ""
   echo "Which snapshot do you want to forget?"
   read snapPick
   echo ""
}

echo "------------------------------------------------------"
echo "Hello $USER what would you like to do today?"
echo "------------------------------------------------------"

echo ""
echo "Be sure to use full paths"
echo ""

echo "[1] Manage SFTP repo"
echo "[2] Manage local repo"

echo "------------------------------------------------------"
echo -n "Enter choice: "; read choice
case "$choice" in

    if [ $choice = 1 ]; then
        echo "[1] Create SFTP backup"
        echo "------------------------------------------------------"
        echo -n "Enter choice: "; read sftp
        case "$sftp" in

    if [ $choice = 2 ]; then
        echo "[1] Create local backup"
        echo "------------------------------------------------------"
        echo -n "Enter choice: "; read local
        case "$local" in

0) server_repo
   restic -r sftp:$serverInfo:$serverFolder init
   echo ""
   echo "What folders would you like to backup?"
   read serverSource
   echo ""
   restic -r sftp:$serverInfo:$serverFolder --verbose backup $serverSource
   ;;

1) server_repo
   restic -r sftp:$serverInfo:$serverFolder snapshots
   ;;

2) server_repo
   restic -r sftp:$serverInfo:$serverFolder snapshots
   select_snap
   restic -r sftp:$serverInfo:$serverFolder forget $snapPick
   ;;

3) local_repo
   restic init --repo $localInfo
   echo ""
   echo "What folders would you like to backup?"
   read localSource
   echo ""
   restic -r $localInfo --verbose backup $localSource
   ;;

4) local_repo
   restic -r $localInfo snapshots
   ;;

5) local_repo
   restic -r $localInfo snapshots
   select_snap
   restic -r $localInfo forget $snapPick
   ;;

esac