#  _____    _
# |__  /___| |__  _ __ ___
#   / // __| '_ \| '__/ __|
#  / /_\__ \ | | | | | (__
# /____|___/_| |_|_|  \___|
# Aliases for a few useful commands

alias mirrorUpdate='sudo reflector --country us --latest 15 --protocol https --sort rate --save /etc/pacman.d/mirrorlist --verbose'
alias pacmanGhost='~/.scripts/pacman.sh'
alias shivita='toilet -f mono12 -F rainbow 'andrea' | ponythink -f winona'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias ip='ip -c'
alias rm='rm -i'
alias x='ranger'
alias h='htop'

setopt autocd extendedglob nomatch notify appendhistory sharehistory incappendhistory HIST_IGNORE_SPACE COMPLETE_ALIASES
unsetopt beep
bindkey -e
autoload -Uz compinit promptinit bashcompinit
compinit
promptinit
bashcompinit
zstyle :compinstall filename '$HOME/.zshrc'
complete -o nospace -C /usr/bin/vault vault
complete -o nospace -C /usr/bin/terraform terraform
neofetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(
    colorize
    copyfile
    docker
    docker-compose
    emacs
    git
    gitfast
    golang
    history-substring-search
    kubectl
    rust
    safe-paste
    tmux
    virtualenv
)

# Source Oh My ZSH for plugins and zsh-autosuggestions, zsh-syntax-highlighting,
# zsh-history-substring-search and the powerlevel10k theme.
while IFS= read -r script
do
    source "$script"
done < <(find /usr/share/zsh/plugins/ -maxdepth 2 -type f -name "*.zsh" ! -name '*plugin.zsh')
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
