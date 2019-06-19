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
export XDG_CURRENT_DESKTOP=KDE

#export QT_AUTO_SCREEN_SCALE_FACTOR=1
#export QT_SCREEN_SCALE_FACTOR=2
export PLASMA_USE_QT_SCALING=1

# also set in /etc/environment to qt5ct for 'kdesu <kde app>'
export QT_QPA_PLATFORMTHEME=kde

# eliminates tearing on NVIDIA when using external monitor
# for laptop, modeset=1 optio to nvidia_drm takes care of it
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
fi 
