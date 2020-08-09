#!/bin/bash

MONITOR_RESOLUTIONS=(
    '2560x1440'
    '1080x1920'
)
BASE_URL="https://source.unsplash.com/featured/RESOLUTION/?minimalism"
BASE_WALLPAPER=~/.images/wallpaper_RESOLUTION.jpeg

function wallpaper_existence_validator() {
    COUNTER=1
    WALLPAPER_1=
    WALLPAPER_2=
    WALLPAPERS_EXIST=true
    for i in "${MONITOR_RESOLUTIONS[@]}";
    do
        WALLPAPER=${BASE_WALLPAPER/RESOLUTION/$i}
        if test -f "$WALLPAPER"; then
            declare WALLPAPER_"${COUNTER}"="${WALLPAPER}"
            ((COUNTER+=1))
            continue
        fi
        WALLPAPERS_EXIST=false
    done

    if [ "$WALLPAPERS_EXIST" ] ; then
        feh --bg-scale "$WALLPAPER_1" --bg-scale "$WALLPAPER_2"
    fi
}

function wallpaper_downloader() {
    COUNTER=1
    WALLPAPER_1=
    WALLPAPER_2=
    for i in "${MONITOR_RESOLUTIONS[@]}";
    do
        URL=${BASE_URL/RESOLUTION/$i}
        WALLPAPER=${BASE_WALLPAPER/RESOLUTION/$i}
        RES=$(curl -L "$URL" -o "$WALLPAPER" --create-dirs)

        if [ -z "$RES" ]; then
            declare WALLPAPER_"${COUNTER}"="${WALLPAPER}"
            ((COUNTER+=1))
            continue
        fi
        exit 1
    done
    feh --bg-scale "$WALLPAPER_1" --bg-scale "$WALLPAPER_2"
}

wallpaper_existence_validator
wallpaper_downloader
