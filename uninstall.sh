#!/bin/bash
#
#           _
#    _   _ (_)_ __  ______  ____      __
#   | | | || | '_ \|_  /\ \/ /\ \ /\ / /
#   | |_| || | | | |/ /  >  <  \ V  V /
#    \__,_|/ |_| |_/___|/_/\_\  \_/\_/
#        |__/
#
#-----------------------------------------------------------

#***********************************************************
# Before run this script, please read README.md            *
#***********************************************************

#**************************
#   SETUP PARAMETERS      *
#**************************
ROOT=$( cd "$( dirname "$0" )" && pwd )

debug_mode='0'
app_name='dotfiles'

[ -z "$APP_PATH" ]    && APP_PATH="$HOME/.dotfiles"
[ -z "$REPO_URI" ]    && REPO_URI='https://github.com/ujnzxw/dotfiles.git'
[ -z "$VUNDLE_URI" ]  && VUNDLE_URI="https://github.com/gmarik/vundle.git"
[ -z "$REPO_BRANCH" ] && REPO_BRANCH="master"

#**************************
#   BASIC FUNCTIONS       *
#**************************
msg()
{
    printf '%b\n' "$1" >&2
}

success()
{
    [ "$ret" -eq '0' ] && msg "\33[32m[SUCC]\33[0m ${1}${2}"
}

error()
{
    msg "\33[31m[ERRO]\33[0m ${1}${2}" && exit 1
}

warning()
{
    msg "\33[33m[WARN]\33[0m ${1}${2}"
}


debug()
{
    if [ "$debug_mode" -eq '1' ] && [ "$ret" -gt '1' ]; then
        msg "ERROR in func \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}."
    fi
}

program_exists()
{
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1'; }

    # fail on non-zero return value
    [ "$ret" -ne 0 ] && return 1

    return 0
}

program_must_exist()
{
    program_exists $1

    # throw error on non-zero return value
    [ "$?" -ne 0 ] && error "You must have '$1' installed to continue."
}

lnif()
{
    if [ -e "$1" ]; then
        [ -d "$1" ] && `ln -sf -d "$1" "$2"`
        [ -f "$1" ] && `ln -sf "$1" "$2"`
    fi

    ret="$?"
    debug
}

remove_symlinks()
{
    local target_path="$1"

    rm "$target_path/.bash_profile"
    rm "$target_path/.bashrc"
    rm "$target_path/.bashrc.local"
    rm "$target_path/.vimrc"
    rm "$target_path/.vimrc.plugin"
    rm "$target_path/.vimperatorrc"
    rm "$target_path/.ssh/config"
    rm "$target_path/.tmux.conf"
    rm "$target_path/.tmux-powerline"
    rm "$target_path/.tmux-powerlinerc"

    ret="$?"
    success "Setting up dotfiles symlinks successfully."
    debug
}

#**************************
#           MAIN          *
#**************************
remove_symlinks $HOME

# remove dotfiles repo
rm -rf "$HOME/.dotfiles"

# remove vundle repo
rm -rf "$HOME/.vim/bundle/vundle"

msg "\nThanks for using $app_name, please restart your shell first!"
msg "© `date +%Y` https://github.com/ujnzxw"
