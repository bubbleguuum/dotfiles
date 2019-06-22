# Sample .profile for SuSE Linux
# rewritten by Christian Steinruecken <cstein@suse.de>
#
# This file is read each time a login shell is started.
# All other interactive shells will only read .bashrc; this is particularly
# important for language settings, see below.

test -z "$PROFILEREAD" && . /etc/profile || true

export PATH="$PATH:~/bin"
export JAVA_HOME=/usr/lib64/jvm/java-1.8.0-openjdk-1.8.0

export GTK_THEME=Shades-of-gray
export GDK_SCALE=2 
export GDK_DPI_SCALE=0.5

# useful even on i3 for using Plasma apps on i3
export XDG_CURRENT_DESKTOP=KDE

# enables automatic scaling, based on the pixel density of the monitor.
# This will not change the size of point sized fonts, since point is a physical unit of measure.
# Multiple screens may get different scale factors
# WARNING: startkde set this to 0
#export QT_AUTO_SCREEN_SCALE_FACTOR=1

# for use when QT_AUTO_SCREEN_SCALE_FACTOR does not work: eg for eDP-1-1 latop panel (EDID issue)
# WARNING: overwritten by startkde taking scale factor configured in kscreen5 and written to .config/kdeglobals
# problematic when switching between modesetting and nvidia driver because laptop panel name changes (see below) 
# WARNING: latop panel is eDP-1 on modesetting driver, eDP1 on intel driver and eDP-1-1 on NVIDIA driver !!! DP-0 is NVIDIA specific (DisplayPort)
export QT_SCREEN_SCALE_FACTORS="eDP1=2;eDP-1=2;eDP-1-1=2;DP-0=2"

# fixes scaling of Plasma UI (icons, widget spacing, ...)
export PLASMA_USE_QT_SCALING=1

# also set in /etc/environment to qt5ct for 'kdesu <kde app>'
export QT_QPA_PLATFORMTHEME=kde

# eliminates tearing on NVIDIA when using external monitor
# for laptop, modeset=1 option to nvidia_drm kernel module takes care of it
export KWIN_TRIPLE_BUFFER=1

export VISUAL="emacs"
export EDITOR="$VISUAL"

export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

# poor's man console Display Manager:
# login on tty1 starts i3, on tty2 starts Plasma

if [ "$(tty)" = "/dev/tty1" ]; then
     exec startx ~/.xinitrc i3 
elif [ "$(tty)" = "/dev/tty2" ]; then 
     exec startx ~/.xinitrc startkde 
elif [ "$(tty)" = "/dev/tty3" ]; then 
     exec startx ~/.xinitrc startkde_i3 
fi 
 
