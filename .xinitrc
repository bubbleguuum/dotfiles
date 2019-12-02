#!/bin/sh

cmd=$1

[ -z "$cmd" ] && cmd=i3

[ -f ~/.xprofile ] && . ~/.xprofile $cmd



if [ "$cmd" = "startkde_i3" ]; then
    export KDEWM=/usr/bin/i3
    cmd=startplasma-x11
    i3config=config.kde    
elif [ "$cmd" = "i3" ]; then
    i3config=config.i3    
fi

if [ -n "$i3config" ]; then
    . ~/.functions
    geni3conf $i3config
fi    

$cmd

sudo ~/bin/backlight_on.sh
