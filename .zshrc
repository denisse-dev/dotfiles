# Path to your oh-my-zsh installation.
  export ZSH=/home/andrea/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="powerlevel9k/powerlevel9k"

# Font mode for powerlevel9k
POWERLEVEL9K_MODE="nerdfont-complete"

# OS segment
POWERLEVEL9K_LINUX_ICON="%F{cyan}\uf300 %F{white}arch%F{cyan}linux"
POWERLEVEL9K_OS_ICON_BACKGROUND='black'

# Command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Command execution time stamp shown in the history command output.
HIST_STAMPS="mm/dd/yyyy"

# Plugins to load
plugins=(git)

source $ZSH/oh-my-zsh.sh
export LANG=es_MX.UTF-8

# Context
DEFAULT_USER="andrea"
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
POWERLEVEL9K_CONTEXT_FOREGROUND='white'
POWERLEVEL9K_CONTEXT_BACKGROUND='magenta'
POWERLEVEL9K_CONTEXT_TEMPLATE="%K{black}%F{green}%n"

# Dirs
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# Separators
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="\ue0ce"
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=$'\ue0cf'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\ue0c7'
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=$'\ue0cf'

# Git icons
POWERLEVEL9K_VCS_GIT_ICON=''
POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'

# Thumbs icons
POWERLEVEL9K_OK_ICON=$'\uf164'
POWERLEVEL9K_FAIL_ICON=$'\uf165'

# Time
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M} \uf252"

# Prompt settings
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%K{black}%F{green}\ue0ce"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%K{black}%F{green}\ue0ce%F{yellow}  \Uf155 %f%k%F{black}\ue0ce%f "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs time battery)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='emacs'
 else
   export EDITOR='emacs'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
export LC_CTYPE=es_MX.UTF-8
autoload -Uz compinit
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias screenfetch="screenfetch -w -c 31,3"
alias yaourt="yaourt --pager --color "
./.pacman.sh

man() {
    env \
	LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	LESS_TERMCAP_md=$(printf "\e[1;31m") \
	LESS_TERMCAP_me=$(printf "\e[0m") \
	LESS_TERMCAP_se=$(printf "\e[0m") \
	LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	LESS_TERMCAP_ue=$(printf "\e[0m") \
	LESS_TERMCAP_us=$(printf "\e[1;32m") \
	man "$@"
}
