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

create_snap () {
   echo "What folder do you want to backup?"
   read snapCreate
   echo ""
}

select_snap () {
   echo "Which snapshot do you want to forget?"
   read snapDelete
   echo ""
}

echo "------------------------------------------------------"
echo "Hello $USER what would you like to do today?"
echo "------------------------------------------------------"

echo ""
echo "Be sure to use full paths"
echo ""

echo "[0] Create SFTP backup"
echo "[1] Create new SFTP snapshot"
echo "[2] View SFTP snapshots"
echo "[3] Forget SFTP snapshot"
echo ""
echo "[4] Create local backup"
echo "[5] Create new local snapshot"
echo "[6] View local snapshots"
echo "[7] Forget local snapshot"

echo "------------------------------------------------------"
echo -n "Enter choice: "; read choice
case "$choice" in

0) server_repo
   restic -r sftp:$serverInfo:$serverFolder init
   create_snap
   restic -r sftp:$serverInfo:$serverFolder --verbose backup $snapCreate
   ;;

1) server_repo
   create_snap
   restic -r sftp:$serverInfo:$serverFolder --verbose backup $snapCreate
   ;;

2) server_repo
   restic -r sftp:$serverInfo:$serverFolder snapshots
   ;;

3) server_repo
   restic -r sftp:$serverInfo:$serverFolder snapshots
   select_snap
   restic -r sftp:$serverInfo:$serverFolder forget $snapDelete
   ;;

4) local_repo
   restic init --repo $localInfo
   create_snap
   ;;

5) local_repo
   create_snap
   restic -r $localInfo --verbose backup $snapCreate
   ;;

6) local_repo
   restic -r $localInfo snapshots
   ;;

7) local_repo
   restic -r $localInfo snapshots
   select_snap
   restic -r $localInfo forget $snapDelete
   ;;

esac