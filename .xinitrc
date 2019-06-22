#!/bin/sh

cmd=$1

[ -z "$cmd" ] && cmd=i3

[ -f ~/.xprofile ] && . ~/.xprofile $cmd



if [ "$cmd" = "startkde_i3" ]; then
    export KDEWM=/usr/bin/i3
    cmd=startkde
    i3config=config.kde    
elif [ "$cmd" = "i3" ]; then
    i3config=config.i3    
fi

if [ -n "$i3config" ]; then
    confdir=~/.config/i3
    cat $confdir/config.common $confdir/$i3config > $confdir/config
fi    

exec $cmd

