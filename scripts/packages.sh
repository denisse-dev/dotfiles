#!/bin/bash

HELP="Usage: sudo ./packages.sh <operation> [...]
Automatically install Arch Linux packages

operations:
    -a           installs AUR packages
    -t <options> installs packages of GUI or CLI

Examples:
$ sudo ./packages.sh -at GUI
$ sudo ./packages.sh -a -t cli"

source $(dirname "$0")/shared.sh

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
    'atool'
    'bat'
    'blueman'
    'bluez-utils'
    'curl'
    'dhcpcd'
    'ffmpegthumbnailer'
    'firewalld'
    'git'
    'go-pie'
    'go-tools'
    'highlight'
    'htop'
    'jq'
    'less'
    'lsd'
    'mediainfo'
    'neofetch'
    'odt2txt'
    'openvpn'
    'openssh'
    'pacman-contrib'
    'poppler'
    'ranger'
    'tmux'
    'usbguard'
    'weechat'
    'whois'
    'xterm'
    'zsh'
    'zsh-theme-powerlevel9k'
)

CLI_PACKAGES=(
    'elinks'
    'emacs-nox'
)

GUI_PACKAGES=(
    'adapta-gtk-theme'
    'adobe-source-code-pro-fonts'
    'alacritty'
    'compton'
    'discount'
    'emacs'
    'evince'
    'feh'
    'firefox'
    'i3-gaps'
    'i3blocks'
    'i3lock'
    'npm'
    'papirus-icon-theme'
    'rofi'
    'xbindkeys'
    'xfce4-notifyd'
    'xfce4-screenshooter'
    'xorg'
)

AUR_PACKAGES=(
    'gotop'
    'nerd-fonts-source-code-pro'
    'oh-my-zsh-git'
)

function installAurPackages() {
    if [ -z "$aurFlag" ]; then
        return 0
    fi
    banner "I will install the AUR packages"
    packageIterator "yay" "${AUR_PACKAGES[@]}"
}

function installYay() {
    if pacman -Qs yay > /dev/null ; then
        return 0
    fi
    sudo -u "$SUDO_USER" -- sh -c "
    git clone https://aur.archlinux.org/yay.git;
    cd yay || return;
    yes | makepkg -si"
}

function installOhMyZsh() {
    local URL='https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh'
    banner "I will install Oh My Zsh and plugins"

    sudo -u "$SUDO_USER" -- sh -c "$(curl -fsSL $URL)"
    sudo -u "$SUDO_USER" -- sh -c "
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-history-substring-search ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
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
        banner "I will install spacemacs"

        sudo -u "$SUDO_USER" -- sh -c "
        git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d &>/dev/null
        cd ~/.emacs.d
        git checkout develop &>/dev/null
        cd - &>/dev/null"
    fi
}

function installPackages() {
    banner "I will install the base system"
    configurePacman
    packageIterator "pacman" "${BASE_PACKAGES[@]}"

    if [ "$typeVal" == 'cli' ]; then
        banner "I will install the CLI packages"
        packageIterator "pacman" "${CLI_PACKAGES[@]}"
    elif [ "$typeVal" == 'gui' ]; then
        banner "I will install the GUI packages"
        packageIterator "pacman" "${GUI_PACKAGES[@]}"
    fi

    installYay
}

if [ -z "$typeFlag" ]; then
    banner "Packages can't be blank" "warn"
    exit 1
fi

if [ "$typeVal" != 'cli' ] && [ "$typeVal" != 'gui' ]; then
    banner "Invalid packages" "warn"
    exit 1
fi

if [ "$typeVal" == 'gui' ]; then
    AUR_PACKAGES+=('bibata-cursor-theme')
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
                   'vlc'
                   'xorg-xinit')
    AUR_PACKAGES+=('spotify'
                   'pulseaudio-ctl')
fi

installPackages
installAurPackages
installOhMyZsh
installSpacemacs

banner "Done :)"
