#!/bin/bash

#  Name scipt: FastCleaner 
#  Release date: 2021-10-20 
#  Version: 1.0
#  Copyright (C) DrSheppard | gbog@proton.me

set -e

snap refresh

LANG=C snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        sudo snap remove "$snapname" --revision="$revision"
    done
sudo flatpak update
sudo flatpak remove --unused
sudo rm /var/lib/snapd/cache/*
sudo journalctl --vacuum-size=15M
sudo journalctl --vacuum-time=1days
rm -r ~/.cache/thumbnails/*
