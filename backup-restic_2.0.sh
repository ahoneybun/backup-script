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

submenu_sftp () {
    local PS3='Select SFTP option: '
    local option=("Create Repo" "View Snapshots" "Delete Snapshot")
    local opt
    select opt in "${options[@]}"
    do
       case $opt in 
        "Create Repo")
            server_repo
            restic -r sftp:$serverInfo:$serverFolder init
            echo ""
            echo "What folders would you like to backup?"
            read serverSource
            echo ""
            restic -r sftp:$serverInfo:$serverFolder --verbose backup $serverSource
            ;;
        "View Snapshots")
           server_repo
           ;;
        esac
    done
}

PS3='Select restic repo method: '
options=("SFTP" "Local")
select opt in "${options[@]}"
do 
   case $opt in 
      "SFTP")
         submenu_sftp
         ;;
    esac
done