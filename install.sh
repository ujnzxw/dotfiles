#!/bin/bash
#
#-----------------------------------------------------------
# Author       : ujnzxw
# Description  : install the dotfiles into OS smoothly
# Note         : don't move this script singlly.
#              : please run this script in the current path
#-----------------------------------------------------------

# get currect directories
ROOT=$( cd "$( dirname "$0" )" && pwd )

# @function: Create a soft link
# @Param:    src_file - the source file
#			 tar_file - the target file
#
function LN()
{
	# check parms
	if [ $# -ne 2 ]; then
		echo "Must input 2 parms for func LN()"
		exit
	fi
	src_file=$1
	tar_file=$2

	# check if the file is already exist
	if [ -f $tar_file ]; then
		mv $tar_file ${tar_file}.bk.dotfiles
		echo "File exists!"
		echo "Run \"mv $tar_file ${tar_file}.bk.dotfiles\""
	fi

	# run link cmd
	ln $src_file -s $tar_file
}

# create soft link for the dot files
LN $ROOT/bash/.bash_profile $HOME/.bash_profile
LN $ROOT/bash/.bashrc 		$HOME/.bashrc
LN $ROOT/bash/.bashrc.local $HOME/.bashrc.local
LN $ROOT/vim/.vimrc 		$HOME/.vimrc
LN $ROOT/vim/.vimrc.plugin  $HOME/.vimrc.plugin
LN $ROOT/xmodmap/.Xmodmap   $HOME/.Xmodmap
