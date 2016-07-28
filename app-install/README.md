Author: ujnzxw - Steven Zhao
Distributed under the MIT license. See the LICENSE file for more details.

Some application Install
======================

These are some of the applications need to install for use.

Install Steps:
-------------
1. Vundle - plugin manager
2. run ../install.sh - make a soft link for the configure file
3. The other app list below.

Vundle
------------
A vim plugin manager

[GitHub](https://github.com/VundleVim/Vundle.vim)

`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle`

The configuration please find ../vim/.vimrc.plugin

Vimperator
------------
Vimperator is a free browser add-on for Firefox, which makes it look and behave like the Vim text editor.

Please install this add-on in Firfox.

Vim-airline
-----------
lean & mean status/tabline for vim that's light as air

1. Install necessary font in ../font
2. Set system font:
   Terminal -> Edit -> Profile Perference
   - Un-check "Use the system fixed width font"
   - Select font "Droid Sans Mono Slashed for Powerline"
   - Set font SIZE to 11
3. Install vim-airline by Vundle

pip
------------
Pip is a tool for installing and managing Python packages.

`curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"`
`python get-pip.py`

Reference:[How to Install Pip on Ubuntu 14.04 LTS](http://www.liquidweb.com/kb/how-to-install-pip-on-ubuntu-14-04-lts/)

