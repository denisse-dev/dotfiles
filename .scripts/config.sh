#!/bin/bash

HELP="Usage: # ./users.sh <operation> [...]
Automatically configure Arch Linux SSH

operations:
    -c           configure ssh
    -t           configure totp

Examples:
$ sudo ./config.sh -ct
# ./config.sh -c -t"

# shellcheck source=/dev/null
. "$(dirname "$0")/shared.sh"

rootValidator
configFlag=''
totpFlag=''
while getopts ct name
do
    case $name in
        c) configFlag=1;;
        t) totpFlag=1;;
        *) echo "$HELP"
           exit 2;;
    esac
done

GOOGLE_AUTHENTICATOR='auth     required  pam_google_authenticator.so'
DISABLE_PASSWORD='auth      include   system-remote-login'
PAM_CONFIG=(
    "s/${DISABLE_PASSWORD}/${GOOGLE_AUTHENTICATOR}\n#${DISABLE_PASSWORD}/g"
    's/#auth     required  pam_securetty.so/auth      required  pam_securetty.so/g'
)
SSH_CONFIG=(
    's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g'
    's/#MaxAuthTries 6/MaxAuthTries 3/g'
    's/#PermitRootLogin prohibit-password/PermitRootLogin no/g'
    's/#PasswordAuthentication yes/PasswordAuthentication no/g'
    's/#X11Forwarding no/X11Forwarding no/g'
)
TOTP_PACKAGES=(
    'libpam-google-authenticator'
    'qrencode'
)

function sedIterator() {
    local LOCATION="$1"
    shift
    local CONFIG=("$@")
    for i in "${CONFIG[@]}";
    do
        sed -i "$i" "$LOCATION"
    done
}

function reloadDaemons() {
    systemctl reload sshd
    systemctl restart sshd
}

function configureTotp() {
    packageIterator "pacman" "${TOTP_PACKAGES[@]}"
    SSH_CONFIG+=(
        's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g'
    )
    echo 'AuthenticationMethods publickey,keyboard-interactive:pam' >> /etc/ssh/sshd_config

    sedIterator "/etc/pam.d/sshd" "${PAM_CONFIG[@]}"
}

function configureSSH() {
    if [ -z "$configFlag" ]; then
        echo "$HELP"
        exit 1
    fi

    if [ -n "$totpFlag" ]; then
        banner "I will TOTP for SSH"
        configureTotp
    fi

    banner "I will end up configuring SSH"
    sedIterator "/etc/ssh/sshd_config" "${SSH_CONFIG[@]}"

    if [ -n "$totpFlag" ]; then
        sudo -u "$SUDO_USER" -- sh -c "google-authenticator"
    fi
}

configureSSH
reloadDaemons
