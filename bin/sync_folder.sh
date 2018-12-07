#!/bin/sh

if ps -ef | grep -v grep | grep sync_folder.sh; then
    exit 0
else
    while inotifywait -r -e modify,create,delete ~/tenzing-poc; do
        rsync -azP --delete --cvs-exclude --exclude='.idea' --exclude='.gitignore' ~/tenzing-poc mp5516@zld04959.vci.att.com:~/
    done
fi
