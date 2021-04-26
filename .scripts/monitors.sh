#!/bin/bash
intern=DP-2
extern=HDMI-0

xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --off --output DP-2 --primary --mode 2560x1440 --rate 144 --pos 0x0 --rotate normal --output DP-3 --off --output DP-4 --mode 1920x1080 --rate 144 --pos 2560x0 --rotate right --output DP-5 --off --output USB-C-0 --off
# if xrandr | grep "$extern disconnected"; then
#     xrandr --output "$extern" --off --output "$intern" --auto
# else
#     xrandr --output "$intern" --off --output "$extern" --auto
# fi
