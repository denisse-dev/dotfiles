#!/bin/bash

PARAMS=(
    "animals"
    "clouds"
    "dogs"
    "flowers"
    "mountains"
    "nature"
)
RAND=$((RANDOM % ${#PARAMS[@]}))
RESOLUTION="2560x1440"
URL="https://source.unsplash.com/featured/${RESOLUTION}/daily?${PARAMS[$RAND]}"
WALLPAPER=~/.wallpaper.jpeg

if test -f "$WALLPAPER"; then
    feh --bg-scale "$WALLPAPER"
fi

RES=$(curl -L "$URL" -o "$WALLPAPER")
if [ -z "$RES" ]; then
    feh --bg-scale "$WALLPAPER"
fi
