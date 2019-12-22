source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
setxkbmap -layout us -variant intl
xbindkeys
numlockx &
exec i3
