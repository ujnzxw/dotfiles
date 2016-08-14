ujnzxw's Dot Files
=====================

Steven ZHAO's configuration files.

Linux, \*nix Installation
------------
The easiest way to install ujnzxw-dotfiles is to use our automatic installer by simply copying and pasting the following line into a terminal. This will install ujnzxw-dotfiles and backup your existing vim configuration.

*Requires Git 1.7+ and Vim 7.3+*

```
export APP_PATH=/your/Install/path (Default path is: ~/.ujnzxw-dotfiles)
curl https://raw.githubusercontent.com/ujnzxw/dotfiles/master/install.sh -L > ujnzxw-dotfiles.sh && sh ujnzxw-dotfiles.sh
```
If you have a bash-compatible shell you can run the script directly:

```
export APP_PATH=/your/Install/path (Default path is: ~/.ujnzxw-dotfiles)
sh <(curl https://raw.githubusercontent.com/ujnzxw/dotfiles/master/install.sh -L)
```




Software/Plugin Abstract
------------------------
#####  Vundle

A vim plugin manager

[GitHub](https://github.com/VundleVim/Vundle.vim)

`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle`

The configuration please find ../vim/.vimrc.plugin

##### Vimperator

Vimperator is a free browser add-on for Firefox, which makes it look and behave like the Vim text editor.

Please install this add-on in Firfox.

##### Vim-airline

lean & mean status/tabline for vim that's light as air

1. Install necessary font in ../font
2. Set system font:
   Terminal -> Edit -> Profile Perference
   - Un-check "Use the system fixed width font"
   - Select font "Droid Sans Mono Slashed for Powerline"
   - Set font SIZE to 11
3. Install vim-airline by Vundle

##### pip

Pip is a tool for installing and managing Python packages.

`curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"`
`python get-pip.py`

License
-------

Copyright (c) 2016 ujnzxw <ujnzxw@gmail.com>

Distributed under the MIT license. See the LICENSE file for more details.


Thanks
------

- [spf13/spf13-vim](https://github.com/spf13/spf13-vim)
- [s3rvac/dotfiles](https://github.com/s3rvac/dotfiles)
- [erikw/tmux-powerline](https://github.com/erikw/tmux-powerline)

Author
------

ujnzxw - Steven ZHAO


Distributed under the MIT license. See the LICENSE file for more details.

Reference
---------
1. [How to Install Pip on Ubuntu 14.04 LTS](http://www.liquidweb.com/kb/how-to-install-pip-on-ubuntu-14-04-lts/)
2. [tmux - A Great Terminal Multiplexer](http://blog.chinaunix.net/attachment/attach/77/17/19/907717190c5d1d25c8b0c72bd53ad9c203af9561a.pdf)

