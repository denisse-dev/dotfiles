export LC_ALL=en_US.UTF-8
export TERMINAL=alacritty
export PAGER=less
export VISUAL=emacs
export EDITOR=emacs
export TERM="xterm-256color"
export GPG_TTY=$(tty)

export RANGER_LOAD_DEFAULT_RC=FALSE
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000
export DISABLE_AUTO_UPDATE="true"
export ZSH=/usr/share/oh-my-zsh
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export MOZ_ENABLE_WAYLAND=1
export MOZ_USE_XINPUT2=1
export MOZ_DBUS_REMOTE=1
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
source ~/.zshenv_secret

# PIP
export PATH=$HOME/.local/bin:$PATH

export PATH="$HOME/.local/bin:$PATH"
export npm_config_prefix="$HOME/.local"
