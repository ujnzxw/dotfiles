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

# get currect directories
ROOT=$( cd "$( dirname "$0" )" && pwd )

#----------------Sub-functions------------------------------

# @function: Create a soft link
# @Param:    src_file - the source file
#             tar_file - the target file
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

#--------------------------Main-----------------------------

# create soft link for the dot files
#--The source file/dir-------------The target file/dir------
LN $ROOT/bash/.bash_profile        $HOME/.bash_profile
LN $ROOT/bash/.bashrc              $HOME/.bashrc
LN $ROOT/bash/.bashrc.local        $HOME/.bashrc.local
LN $ROOT/vim/.vimrc                $HOME/.vimrc
LN $ROOT/vim/.vimrc.plugin         $HOME/.vimrc.plugin
LN $ROOT/xmodmap/.Xmodmap          $HOME/.Xmodmap
LN $ROOT/mplayer/.mplayer          $HOME/.mplayer
LN $ROOT/vimperator/.vimperatorrc  $HOME/.vimperatorrc
LN $ROOT/ssh/config                $HOME/.ssh/config

