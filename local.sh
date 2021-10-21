#!/bin/bash

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

delete_snap () {
   echo ""
   echo "Which snapshot do you want to forget?"
   read snapDelete
   echo ""
}

echo "[0] Create local backup"
echo "[1] Create new local snapshot"
echo "[2] View local snapshots"
echo "[3] Forget local snapshot"
echo ""

echo "------------------------------------------------------"
echo -n "Enter choice: "; read choice
case "$choice" in

0) local_repo
   restic init --repo $localInfo
   create_snap
   restic -r $localInfo --verbose backup $snapCreate
   ;;

1) local_repo
   create_snap
   restic -r $localInfo --verbose backup $snapCreate
   ;;

1) local_repo
   restic -r $localInfo snapshots
   ;;

2) local_repo
   restic -r $localInfo snapshots
   delete_snap
   restic -r $localInfo forget $snapDelete
   ;;