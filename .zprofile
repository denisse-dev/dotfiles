# Enviroment variables
export ZSH="$HOME/.oh-my-zsh"
export LC_ALL=en_US.UTF-8
export TERMINAL=terminator
export PAGER=less
export VISUAL=emacs
export TERM="xterm-256color"
export GPG_TTY=$(tty)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vi'
else
    export EDITOR='emacs'
fi

PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export GEM_HOME=$HOME/.gem
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

# startx when logged in
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
