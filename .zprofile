# startx when logged in
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec sway
fi
