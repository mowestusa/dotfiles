#!/bin/sh

if [ x"${DESKTOP_SESSION##*/}" = x"fluxbox" ]; then 
   sleep 20s
   killall conky
   cd "$HOME/.conky/MX-APInfo"
   conky -c "$HOME/.conky/MX-APInfo/AP-info-debianUpdates-coloursMod" &
   exit 0
fi
