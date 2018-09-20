ujnzxw's Dot Files
=====================

Steven ZHAO's configuration files.

Linux, \*nix Installation
------------------------
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




Features:
---------
Many features are included in this dotfiles project. In fact, all the dotfiles you concerned can be managed and maintained by dotfiles project. Such as bash dot files(.bashrc, etc), VIM dot files (.vimrc, plugins, etc), TMUX dotfiles, python autoenv scripts, etc.

Here I only list the main features for every part. 

#### Bash
It include bash dot files: .bashrc, .bash_profile, .bashrc.local. 

You can add your bash settings into .bashrc.local if you need, and this file is ignored by dotfiles git.
The main bash configuration data is included in .bashrc, it include but not limit:

* Editor defination
* History settings
* Language and Time Zone settings
* Many useful aliases and functions defination, such as `function bak() { cp -a "$1" "$1".bak; }`
* PS1 - Command lind prompt string settings 

#### Vim
It include Vim dotfiles: .vimrc and .vimrc.plugins

The main Vim configuration data is included in .vimrc, the features for Vim include but not limit:
* use Vundle to manage VIM plugins
* Support Ctags (Hot Key `F5` trigger)
* Support file tree (Hot Key `F4` trigger)
* Support Vim airline
* Support auto-complete
* Code auto format for python code (`*.py`) and Go code (`*.go`)
* Exceeding chars highlight (Hot Key `F2` trigger highlight and `F3` trigger reminder line)
* Suppot spelling check and auto correcting
* Ctrl + S to save files (equal to :w)

Below is the introduction for the plugins installed in Vim:

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

##### gmarik/vundle

Plugin Manager

##### majutsushi/tagbar

Vim plugin that displays tags in a window
ordered by scope http://majutsushi.github.com/tagbar/

##### Shougo/neocomplete.vim

Auto-compete plugin

##### fatih/vim-go

Go development plugin for Vim https://patreon.com/fatih


License
-------

Copyright (c) 2016 ujnzxw <ujnzxw@gmail.com>

Distributed under the MIT license. See the LICENSE file for more details.

Fix issues
---------

1. neocomplete requires Vim 7.3.885 or later with Lua support ("+lua").

Please refer to vim/README.md


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
3. [How to install tmux](https://gist.github.com/Root-shady/d48d5282651634f464af)

