#!/bin/bash

HELP="Usage: sudo ./packages.sh <operation> [...]
Automatically install Arch Linux packages

operations:
    -a           installs AUR packages
    -t <options> installs packages of GUI or CLI

Examples:
sudo ./packages.sh -at GUI
sudo ./packages.sh -a -t cli"

if [ -z "$SUDO_USER" ]; then
    echo "$HELP"
    exit 1
fi

aurFlag=
typeFlag=
while getopts at: name
do
    case $name in
        a) aurFlag=1;;
        t) typeFlag=1
           typeVal=$(echo "$OPTARG" | tr '[:upper:]' '[:lower:]');;
        *) echo "$HELP"
           exit 2;;
    esac
done

if [ $OPTIND -eq 1 ]; then
    echo "$HELP"
    exit 1
fi

BASE_PACKAGES=(
    'acpi'
    'bat'
    'blueman'
    'bluez-utils'
    'curl'
    'firewalld'
    'git'
    'go-pie'
    'go-tools'
    'htop'
    'jq'
    'less'
    'lsd'
    'neofetch'
    'openvpn'
    'pacman-contrib'
    'ranger'
    'tmux'
    'usbguard'
    'weechat'
    'whois'
    'zsh'
    'zsh-theme-powerlevel9k'
)

CLI_PACKAGES=(
    'elinks'
    'emacs-nox'
)

GUI_PACKAGES=(
    'adobe-source-code-pro-fonts'
    'alacritty'
    'compton'
    'emacs'
    'feh'
    'firefox'
    'i3-gaps'
    'i3blocks'
    'i3lock'
    'rofi'
    'xbindkeys'
    'xfce4-notifyd'
    'xorg'
)

AUR_PACKAGES=(
    'gotop'
    'nerd-fonts-source-code-pro'
    'oh-my-zsh-git'
)

function banner() {
    YELLOW='\033[0;33m'
    CYAN='\033[0;36m'
    NC='\033[0m'
    MSG="${YELLOW}~ ${CYAN}$* ${YELLOW}~${NC}"
    EDGE=$(echo "  $*  " | sed 's/./~/g')
    echo -e "\n${YELLOW}$EDGE${NC}"
    echo -e "$MSG"
    echo -e "${YELLOW}$EDGE${NC}\n"
}

function installPackages() {
    PACKAGES=("$@")
    for i in "${PACKAGES[@]}";
    do
        pacman -S "$i" --quiet --noconfirm
    done
}

function installYay() {
    sudo -u "$SUDO_USER" -- sh -c "
    git clone https://aur.archlinux.org/yay.git;
    cd yay || return;
    yes | makepkg -si"
}

function installAurPackages() {
    banner "I will install the AUR packages"
    PACKAGES=("$@")
    for i in "${PACKAGES[@]}";
    do
        sudo -u "$SUDO_USER" yay -S "$i" -q --noconfirm
    done
}

function installOhMyZsh() {
    banner "I will install Oh My Zsh and plugins"
    URL='https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh'
    USER_HOME=$(eval echo "~${SUDO_USER}")

    sudo -u "$SUDO_USER" -- sh -c "$(curl -fsSL $URL)"
    sudo -u "$SUDO_USER" -- sh -c "
    git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    cd ~/.oh-my-zsh/custom/themes/powerlevel9k
    git checkout next
    cd - &>/dev/null"
}

function configurePacman() {
    sed -i 's/#Color/Color\nILoveCandy/g' /etc/pacman.conf
    sed -i 's/#TotalDownload/TotalDownload/g' /etc/pacman.conf
}

function installSpacemacs() {
    if [ "$(uname -m)" == 'x86_64' ]; then
        sudo -u "$SUDO_USER" -- sh -c "
        git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
        cd ~/.emacs.d
        git checkout develop
        cd - &>/dev/null"
    fi
}

if [ -z "$typeFlag" ]; then
    banner "Packages can't be blank"
    exit 1
fi

if [ "$typeVal" != 'cli' ] && [ "$typeVal" != 'gui' ]; then
    banner "Invalid packages"
    exit 1
fi

if [ "$(uname -m)" == 'x86_64' ]; then
    BASE_PACKAGES+=('acpi'
                    'reflector'
                    'playerctl'
                    'pulseaudio'
                    'pulseaudio-alsa'
                    'pulseaudio-bluetooth'
                    'xfce4-power-manager')
    GUI_PACKAGES+=('gimp'
                   'pavucontrol'
                   'vlc')
    AUR_PACKAGES+=('spotify')
fi

banner "I will install the base system"
configurePacman
installPackages "${BASE_PACKAGES[@]}"

if [ "$typeVal" == 'cli' ]; then
    banner "I will install the CLI packages"
    installPackages "${CLI_PACKAGES[@]}"
elif [ "$typeVal" == 'gui' ]; then
    banner "I will install the GUI packages"
    installPackages "${GUI_PACKAGES[@]}"
fi

installYay

if [ -n "$aurFlag" ]; then
    installAurPackages "${AUR_PACKAGES[@]}"
fi

installOhMyZsh
installSpacemacs

banner "Done :)"
