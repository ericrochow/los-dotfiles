#!/bin/sh
#source https://github.com/x70b1/polybar-scripts

if ! updates_ubuntu=$(apt list --upgradeable 2>/dev/null | grep -v -i Listing | wc -l); then
    updates_ubuntu=0
fi

# updates=$(("$updates_ubuntu" + "$updates_other"))
updates=$updates_ubuntu

if [ "$updates" -gt 0 ]; then
    echo " $updates"
else
    echo "0"
fi
