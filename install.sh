#!/bin/bash
#
#----------------------------------------------------------
# Author       : ujnzxw
# Description  : install the dotfiles into OS smoothly
# Note         : don't move this script singlly.
#              : please run this script in the current path
#----------------------------------------------------------

# create soft link for the dot files
ln ./bash/.bash_profile -s $HOME/.bash_profile
ln ./bash/.bashrc -s $HOME/.bashrc
ln ./vim/.vimrc -s $HOME/.vimrc
ln ./vim/.vimrc.plugin -s $HOME/.vimrc.plugin
