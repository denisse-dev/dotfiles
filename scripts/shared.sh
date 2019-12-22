#!/bin/bash

function banner() {
    RED='\033[0;31m'
    YELLOW='\033[0;33m'
    CYAN='\033[0;36m'
    NC='\033[0m'
    TEXT=$CYAN
    BORDER=$YELLOW
    EDGE=$(echo "  $1  " | sed 's/./~/g')

    if [ "$2" == "warn" ]; then
        TEXT=$YELLOW
        BORDER=$RED
    fi

    MSG="${BORDER}~ ${TEXT}$1 ${BORDER}~${NC}"
    echo -e "${BORDER}$EDGE${NC}"
    echo -e "$MSG"
    echo -e "${BORDER}$EDGE${NC}"
}

function rootValidator() {
    if [ "$(whoami)" != "root" ]; then
        echo "$HELP"
        exit 1
    fi
}

function packageIterator() {
    local MANAGER="$1"
    shift
    local PACKAGES=("$@")

    for i in "${PACKAGES[@]}";
    do
        if pacman -Qq "$i" > /dev/null ; then
            continue
        fi

        if [ "$MANAGER" == yay ]; then
            if ! sudo -u "$SUDO_USER" yay -S "$i" -q --noconfirm; then
                banner "I was unable to install the package $i" "warn"
                exit 1
            fi
            continue
        fi

        if ! pacman -S "$i" --quiet --noconfirm; then
            banner "I was unable to install the package $i" "warn"
            exit 1
        fi
    done
}
