#!/bin/sh

if [ x"${DESKTOP_SESSION##*/}" = x"fluxbox" ]; then 
   sleep 20s
   killall conky
   cd "$HOME/.conky/MX-antiX"
   conky -c "$HOME/.conky/MX-antiX/MX-antiX17" &
   exit 0
fi
