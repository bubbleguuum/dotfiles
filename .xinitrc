#!/bin/sh

# if we are called by SDDM,
#WINDOWMANAGER is set and point to the full path to the window manager

cmd=$1

[ "$WINDOWMANAGER" = "i3" ] && cmd=i3
[ "$WINDOWMANAGER" = "/usr/bin/startplasma-x11" ] && cmd=plasma

xsetup=/usr/share/sddm/scripts/Xsetup

[ -x $xsetup ] && $xsetup

[ -f ~/.xprofile ] && . ~/.xprofile $cmd


if [ "$cmd" = "plasma" ]; then
    WINDOWMANAGER=/usr/bin/startplasma-x11
    i3config=config.kde    
elif [ "$cmd" = "plasma_i3" ]; then
    WINDOWMANAGER=/usr/bin/startplasma-x11
    export KDEWM=/usr/bin/i3
    i3config=config.kde    
elif [ "$cmd" = "i3" ]; then
    WINDOWMANAGER=/usr/bin/i3
    i3config=config.i3    
elif [ "$cmd" = "gnome" ]; then
    #export GDK_SCALE=
    #export GDK_DPI_SCALE=
    WINDOWMANAGER=/usr/bin/gnome-session
#    i3config=config.i3    
fi

if [ -n "$i3config" ]; then
    . ~/.functions
    geni3conf $i3config
fi    

export WINDOWMANAGER
#/etc/X11/xinit/xinitrc
/usr/libexec/xinit/xinitrc

#exec -l -a bash /bin/bash --login -c /etc/X11/xinit/xinitrc
