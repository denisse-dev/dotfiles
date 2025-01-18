# startx when logged in
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec sway
fi

# Created by `pipx` on 2025-01-14 18:09:15
export PATH="$PATH:/home/denisse/.local/bin"
