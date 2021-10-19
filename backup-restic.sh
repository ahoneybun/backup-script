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

echo "[0] Create SFTP backup"
echo "[1] View SFTP snapshots"
echo "[2] Forget SFTP snapshot"
echo ""
echo "[3] Create local backup"
echo "[4] View local snapshots"
echo "[5] Forget local snapshot"

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