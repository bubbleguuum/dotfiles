# Sample .profile for SuSE Linux
# rewritten by Christian Steinruecken <cstein@suse.de>
#
# This file is read each time a login shell is started.
# All other interactive shells will only read .bashrc; this is particularly
# important for language settings, see below.

test -z "$PROFILEREAD" && . /etc/profile || true

# also used in ~/.config/sxhkd/commonsxhkdrc to set DigitalVibrance
export BW=y

# also used in .emacs
export USE_LIGHT_THEME=y

test -s ~/.bashrc_private && . ~/.bashrc_private
export BORG_PASSPHRASE BORG_REPO

# bash stuff
export PS1='\A \w> '
export HISTSIZE=10000
export HISTCONTROL=ignoreboth

export PATH=$PATH:~/gradle/bin:~/android-ndk-r18b:~/Android/Sdk/platform-tools:~/bin:~/visualvm_205/bin

unset JAVA_BINDIR JAVA_ROOT JAVA_HOME
export JAVA_HOME=/usr/lib64/jvm/java-1.8.0-openjdk-1.8.0
export GRAALVM_HOME=~/graalvm-ce-java11-20.3.0

if [ -n "$USE_LIGHT_THEME" ]; then
    # Light theme
    
    export GTK_THEME=Adwaita
    (cd ~/nf5sc5cv.default/chrome && rm userChrome.css)
    (cd ~ && cat .Xdefaults.common .Xdefaults.light > .Xdefaults)
    
else
    # Dark theme
    
    # GTK2 theme, can also be set in ~/.gtkrc-2.0
    export GTK2_RC_FILES=~/.themes/Shades-of-gray/gtk-2.0/gtkrc
    export GTK_THEME=Shades-of-gray
    #export GTK_THEME=Adwaita:dark
    (cd ~/nf5sc5cv.default/chrome && cp userChrome_shades_of_gray.css userChrome.css)
    (cd ~ && cat .Xdefaults.common .Xdefaults.dark > .Xdefaults)

fi

if [ -n "$BW" ]; then

    # Black and White

    # remove color=--tty option, add --file-type
    export LS_OPTIONS="-N -T 0 --file-type"
    cp ~/.dir_colors_bw ~/.dir_colors
else
    # Color
    cp ~/.dir_colors_color ~/.dir_colors
fi


export GDK_SCALE=2 
export GDK_DPI_SCALE=0.5

# Cursor
# Alternative is to symlink ~/.icons/default to a cursor theme in /usr/share/icons
#export XCURSOR_THEME=Adwaita
#export XCURSOR_SIZE=48

# MPD
export MPD_HOST=~/.mpd/socket

#systemctl --user import-environment GDK_SCALE GDK_DPI_SCALE

# useful even on i3 for using Plasma apps on i3
#export XDG_CURRENT_DESKTOP=KDE

# enables automatic scaling, based on the pixel density of the monitor.
# This will not change the size of point sized fonts, since point is a physical unit of measure.
# Multiple screens may get different scale factors

# WARNING: with "intel" driver a value of 0 cause improper scaling and it must be set to 1

#if grep "Driver \"intel\"" /etc/X11/xorg.conf.d/90-intel*.conf > /dev/null;
#then   
#    export QT_AUTO_SCREEN_SCALE_FACTOR=1
#else
export QT_AUTO_SCREEN_SCALE_FACTOR=0
#fi    

# for use when QT_AUTO_SCREEN_SCALE_FACTOR does not work: eg for eDP-1-1 latop panel (EDID issue)
# WARNING: overwritten by startkde taking scale factor configured in kscreen5 and written to .config/kdeglobals
# problematic when switching between modesetting and nvidia driver because laptop panel name changes (see below) 
# WARNING: latop panel is eDP-1 on modesetting driver, eDP1 on intel driver and eDP-1-1 on NVIDIA driver !!! DP-0 is NVIDIA specific (DisplayPort)
export QT_SCREEN_SCALE_FACTORS="eDP1=2;eDP-1=2;eDP-1-1=2;DP-0=2"

# fixes scaling of Plasma UI (icons, widget spacing, ...)
#export PLASMA_USE_QT_SCALING=1

# also set in /etc/environment to qt5ct for 'kdesu <kde app>'
#export QT_QPA_PLATFORMTHEME=kde
export QT_QPA_PLATFORMTHEME=qt5ct

# eliminates tearing on NVIDIA when using external monitor
# for laptop, modeset=1 option to nvidia_drm kernel module takes care of it
export KWIN_TRIPLE_BUFFER=1

export VISUAL="emacs"
export EDITOR="$VISUAL"

export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

# journalctl does not honor LESS variable. These flags enable line wrapping
# https://unix.stackexchange.com/questions/229188/journalctl-how-to-prevent-text-from-truncating-in-terminal
export SYSTEMD_LESS=FRXMK

export EXTERNAL_MONITOR="DP-0"
export INTERNAL_PANEL="eDP-1-1"

# for gzdoom to use NVIDIA's Vulkan rather than Intel's 
export VK_ICD_FILENAMES=/etc/vulkan/icd.d/nvidia_icd.json

# poor's man console Display Manager:
# login on tty1 starts i3, on tty2 starts Plasma

if [ "$(tty)" = "/dev/tty1" ]; then
     exec startx ~/.xinitrc i3 
elif [ "$(tty)" = "/dev/tty2" ]; then 
     exec startx ~/.xinitrc plasma
elif [ "$(tty)" = "/dev/tty3" ]; then 
     exec startx ~/.xinitrc plasma_i3 
elif [ "$(tty)" = "/dev/tty4" ]; then 
     exec startx ~/.xinitrc gnome
fi
 

 
