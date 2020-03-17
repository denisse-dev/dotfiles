export ZSH="/home/andrea/.oh-my-zsh"
export LC_ALL=en_US.UTF-8
export TERMINAL=alacritty
export PAGER=less
export VISUAL=emacs
export TERM="xterm-256color"
export GPG_TTY=$(tty)
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export EDITOR='emacs'
export RANGER_LOAD_DEFAULT_RC=FALSE

# Node.js
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

# PIP
export PATH=$HOME/.local/bin:$PATH

# Go
export PATH="$PATH:$HOME/go/bin"
