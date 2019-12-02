#!/bin/sh

backlight=$(cat /sys/class/backlight/intel_backlight/bl_power)

if [ "$backlight" = "0" ]; then
    /home/bobbie/bin/backlight_off.sh
else
    /home/bobbie/bin/backlight_on.sh
fi
