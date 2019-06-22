# start a terminal
bindsym $mod+Return exec urxvtc-256color

# start dmenu (a program launcher)
bindsym $mod+d exec dmenu_run

# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"


exec --no-startup-id urxvtc-256color
