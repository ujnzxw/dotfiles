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

[ -z "$APP_PATH" ]    && APP_PATH="$HOME/.ujnzxw-dotfiles"
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
    [ "$ret" -eq '0' ] && msg "\33[32m[✔]\33[0m ${1}${2}"
}

error()
{
    msg "\33[31m[✘]\33[0m ${1}${2}" && exit 1
}

warning()
{
    msg "\33[33m[!]\33[0m ${1}${2}"
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

# @Function: Create a soft link
# @Param:    src_file - the source file
#            tar_file - the target file
#
LN()
{
    # check parms
    [ $# -ne 2 ] && echo "Must input 2 parms for func LN()" && exit 1

    src_file=${1}
    tar_file=${2}

    # check if the file/path is already existed
    if [ -f ${tar_file} ] || [ -d ${tar_file} ]; then
        # chcek if the file is a link file
        if [ -L ${tar_file} ]; then
            warning "Link file/path ${tar_file} existed! Remove the link..."
            warning "Run \"rm ${tar_file}\""
            rm ${tar_file}
        else
            warning "File/path existed! Make a backup..."
            warning "Run \"mv ${tar_file} ${tar_file}.bk.dotfiles\""
            mv ${tar_file} ${tar_file}.bk.dotfiles
        fi
    fi

    # run link cmd
    warning "Make a link: ${tar_file} -> ${src_file}"
    lnif "$src_file" "$tar_file"

    ret="$?"
    debug
}

sync_repo() {
    local repo_path="$1"
    local repo_uri="$2"
    local repo_branch="$3"
    local repo_name="$4"

    msg "Trying to update $repo_name ..."

    if [ ! -e "$repo_path" ]; then
        mkdir -p "$repo_path"
        git clone -b "$repo_branch" "$repo_uri" "$repo_path"
        ret="$?"
        success "Successfully cloned $repo_name."
    else
        cd "$repo_path" && git pull origin "$repo_branch"
        ret="$?"
        success "Successfully updated $repo_name"
    fi

    debug
}

setup_vundle()
{
    local system_shell="$SHELL"
    export SHELL='/bin/sh'

    vim \
        -u "$1" \
        "+set nomore" \
        "+BundleInstall!" \
        "+BundleClean" \
        "+qall"

    export SHELL="$system_shell"

    ret="$?"
    success "Now updating/installing plugins using Vundle"
    debug
}

create_symlinks()
{
    local source_path="$1"
    local target_path="$2"

    LN "$source_path/bash/.bash_profile"       "$target_path/.bash_profile"
    LN "$source_path/bash/.bashrc"             "$target_path/.bashrc"
    LN "$source_path/bash/.bashrc.local"       "$target_path/.bashrc.local"
    LN "$source_path/vim/.vimrc"               "$target_path/.vimrc"
    LN "$source_path/vim/.vimrc.plugin"        "$target_path/.vimrc.plugin"
    LN "$source_path/xmodmap/.Xmodmap"         "$target_path/.Xmodmap"
    LN "$source_path/mplayer/.mplayer"         "$target_path/.mplayer"
    LN "$source_path/vimperator/.vimperatorrc" "$target_path/.vimperatorrc"
    LN "$source_path/ssh/config"               "$target_path/.ssh/config"
    LN "$source_path/tmux/.tmux.conf"          "$target_path/.tmux.conf"
    LN "$source_path/tmux/tmux-powerline"      "$target_path/.tmux-powerline"
    LN "$source_path/tmux/.tmux-powerlinerc"   "$target_path/.tmux-powerlinerc"

    ret="$?"
    success "Setting up dotfiles symlinks successfully."
    debug
}

#**************************
#           MAIN          *
#**************************
program_must_exist "bash"
program_must_exist "vim"
program_must_exist "git"

# check if running shell is bash, if not, use bash to login
echo $SHELL | grep bash
[ "$?" -ne 0 ] && bash=$(command -v "bash") && echo "exec $bash --login" >> $HOME/.profile

# check if tmux is existed, if not, tmux cannot be used
program_exists "tmux"
[ "$?" -ne 0 ] && warning "You should have 'tmux' installed to continue."
msg "How to install tmux? - https://gist.github.com/Root-shady/d48d5282651634f464af "

# sync dotfiles repo
sync_repo       "$APP_PATH" \
                "$REPO_URI" \
                "$REPO_BRANCH" \
                "$app_name"

create_symlinks "$APP_PATH" \
                "$HOME"

# sync vundle repo
sync_repo       "$HOME/.vim/bundle/vundle" \
                "$VUNDLE_URI" \
                "master" \
                "vundle"

setup_vundle    "$APP_PATH/vim/.vimrc.plugin"

msg             "\nThanks for installing $app_name, please restart your shell first, enjoy it"
msg             "© `date +%Y` https://github.com/ujnzxw"

