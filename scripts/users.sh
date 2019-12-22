#!/bin/bash

HELP="Usage: # ./users.sh <operation> [...]
Automatically create Arch Linux users

operations:
    -c [name]    create user
    -r           give sudo privilege
    -k           import my ed25519 public key
    -s <options> define user's default shell (zsh if blank)

Examples:
$ sudo ./users.sh -rc andrea -k add
# ./users.sh -c andrea -k gen -s bash"

source $(dirname "$0")/shared.sh

rootValidator
createFlag=''
sudoFlag=''
keysFlag=''
shellFlag=''
while getopts c:rks: name
do
    case $name in
        c) createFlag=1
           createVal="$OPTARG";;
        r) sudoFlag=1;;
        k) keysFlag=1;;
        s) shellFlag=1
           shellVal=$(echo "$OPTARG" | tr '[:upper:]' '[:lower:]');;
        *) echo "$HELP"
           exit 2;;
    esac
done

function createUser() {
    if [ -z "$createFlag" ]; then
        echo "$HELP"
        exit 1
    fi

    if [[ $(id -u "$createVal" 2> /dev/null) == +([0-9]) ]]; then
        banner "The user \"$createVal\" already exists" "warn"
        exit 1
    fi

    if [ -d /home/"$createVal" ]; then
        banner "A home directory for \"$createVal\" already exists" "warn"
        exit 1
    fi

    if [ -z "$shellFlag" ]; then
        shellVal='zsh'
    fi

    USER_SHELL=$(command -v $shellVal)
    if [ -z "$USER_SHELL" ]; then
        banner "The shell \"$shellVal\" is not installed" "warn"
        exit 1
    fi

    banner "I will create user \"$createVal\" with $USER_SHELL"
    useradd -m -s "$USER_SHELL" "$createVal"

    if [ -n "$sudoFlag" ]; then
        banner "I will give user \"$createVal\" sudo privilege" "warn"
        echo "$createVal  ALL=(ALL)   ALL" > /etc/sudoers.d/$createVal
    fi

    banner "Type a password for \"$createVal\":"
    passwd "$createVal"
}

function sshKeys() {
    banner "I'll import Andrea's SSH keys"

    sudo -u "$createVal" -- sh -c "
    mkdir ~/.ssh
    chmod 700 ~/.ssh
    curl https://github.com/da-edra.keys -o ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys"
}

createUser
sshKeys

banner "Done :)"
