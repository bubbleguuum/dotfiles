# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

bindsym $mod+Shift+p exec systemctl suspend

# exit i3 kaboom version
bindsym $mod+Shift+t exec pkill -TERM -x i3

exec --no-startup-id urxvtc-256color

for_window [instance="sun-awt-X11-XWindowPeer"] focus

# needed for no tearing on external monitor when the laptop's panel is also active (--auto)
# exec --no-startup-id fix_ext_mon_tearing.sh


