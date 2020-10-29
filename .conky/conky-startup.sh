#!/bin/sh

if [ x"${DESKTOP_SESSION##*/}" = x"fluxbox" ]; then 
   sleep 20s
   killall conky
   cd "$HOME/.conky/MX-Conkyglass"
   conky -c "$HOME/.conky/MX-Conkyglass/conkys" &
   exit 0
fi
