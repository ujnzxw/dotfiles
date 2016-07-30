#!/bin/bash
#
#-----------------------------------------------------------
# Author       : ujnzxw - zhaoxiaowei.cn@hotmail.com
# Description  : install the dotfiles smoothly
# Date         : 2016-07-11
# Note         : don't move this script singlly.
#              : please run this script in the current path
#-----------------------------------------------------------

#***********************************************************
# Before run this script, please read README.md            *
# in ./app-install first                                   *
#***********************************************************

#**************************
#   SETUP PARAMETERS      *
#**************************
ROOT=$( cd "$( dirname "$0" )" && pwd )

app_name='dotfiles'
[ -z "$APP_PATH" ] && APP_PATH="$HOME/.ujnzxw-dotfiles"
[ -z "$REPO_URI" ] && REPO_URI='https://github.com/ujnzxw/dotfiles.git'
[ -z "$VUNDLE_URI" ] && VUNDLE_URI="https://github.com/gmarik/vundle.git"
debug_mode='0'

#**************************
#   BASIC FUNCTIONS       *
#**************************
msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ]; then
        msg "\33[32m[✔]\33[0m ${1}${2}"
    fi
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

debug() {
    if [ "$debug_mode" -eq '1' ] && [ "$ret" -gt '1' ]; then
        msg "ERROR in func \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}."
    fi
}

program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1'; }

    # fail on non-zero return value
    if [ "$ret" -ne 0 ]; then
        return 1
    fi

    return 0
}

program_must_exist() {
    program_exists $1

    # throw error on non-zero return value
    if [ "$?" -ne 0 ]; then
        error "You must have '$1' installed to continue."
    fi
}

# @function: Create a soft link
# @Param:    src_file - the source file
#            tar_file - the target file
#
LN()
{
    # check parms
    if [ $# -ne 2 ]; then
        echo "Must input 2 parms for func LN()" && exit 1
    fi

    src_file=${1}
    tar_file=$2

    # check if the file is already exist
    if [ -f ${tar_file} ]; then
        # chcek if the file is a link file
        if [ -L ${tar_file} ]; then
            echo "Link file exists! Remove the link..."
            echo "Run \"rm ${tar_file}\""
            rm ${tar_file}
        else
            echo "File exists! Make a backup..."
            echo "Run \"mv ${tar_file} ${tar_file}.bk.dotfiles\""
            mv ${tar_file} ${tar_file}.bk.dotfiles
        fi
    fi

    # run link cmd
    echo "----------------------"
    echo "Make a link: ${tar_file} -> ${src_file}"
    echo "----------------------"
    ln ${src_file} -sf ${tar_file}
}

sync_repo() {
    local repo_path="$1"
    local repo_uri="$2"
    local repo_branch="$3"
    local repo_name="$4"

    msg "Trying to update $repo_name"

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

setup_vundle() {
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

create_symlinks() {
    local source_path="$1"
    local target_path="$2"

    LN $source_path/bash/.bash_profile       $target_path/.bash_profile
    LN $source_path/bash/.bashrc             $target_path/.bashrc
    LN $source_path/bash/.bashrc.local       $target_path/.bashrc.local
    LN $source_path/vim/.vimrc               $target_path/.vimrc
    LN $source_path/vim/.vimrc.plugin        $target_path/.vimrc.plugin
    LN $source_path/vim                      $target_path/.vim
    LN $source_path/xmodmap/.Xmodmap         $target_path/.Xmodmap
    LN $source_path/mplayer/.mplayer         $target_path/.mplayer
    LN $source_path/vimperator/.vimperatorrc $target_path/.vimperatorrc
    LN $source_path/ssh/config               $target_path/.ssh/config
    LN $source_path/tmux/.tmux.conf          $target_path/.tmux.conf
    LN $source_path/tmux/tmux-powerline      $target_path/.tmux-powerline
    LN $source_path/tmux/.tmux-powerlinerc   $target_path/.tmux-powerlinerc

    ret="$?"
    success "Setting up vim symlinks."
    debug
}
#**************************
#           MAIN          *
#**************************
program_must_exist "vim"
program_must_exist "git"

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

setup_vundle    "$APP_PATH/.vimrc.plugin"

msg             "\nThanks for installing $app_name."
msg             "© `date +%Y` https://github.com/ujnzxw"
 
