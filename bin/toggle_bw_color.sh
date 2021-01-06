#!/bin/sh

value=$(nvidia-settings -t -q DigitalVibrance)

if (( value == 0 )); then
    value=-1024
else
    value=0
fi

nvidia-settings -a DigitalVibrance=$value
