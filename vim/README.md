Vim
===

My configuration file for the [Vim](http://www.vim.org/) editor.

Installation
------------

* Copy `.vimrc` to `$HOME/`.

Plugins:
--------

I use the following Vim plugins, which you can install by using
[pathogen](https://github.com/tpope/vim-pathogen).

* General:
  * [AutoFenc](https://github.com/s3rvac/AutoFenc) - Automatically detects and sets file encoding when opening files.
  * [Command-T](https://github.com/wincent/command-t) - Fast, intuitive mechanism for opening files.
  * [CSApprox](https://github.com/godlygeek/csapprox) - Makes GVim-only colorschemes work transparently in terminal Vim.
  * [matchit](http://www.vim.org/scripts/script.php?script_id=39) - Extends `%` matching for HTML, LaTeX, and many other languages.
  * [netrw](http://www.vim.org/scripts/script.php?script_id=1075) - Network oriented reading, writing, and browsing.
  * [Rename](http://www.vim.org/scripts/script.php?script_id=1928) - Easier renaming of files.
  * [ReplaceWithRegister](https://github.com/vim-scripts/ReplaceWithRegister) - Easy way of replacing text with the contents of a register.
  * [sessionman](http://www.vim.org/scripts/script.php?script_id=2010) - Session manager.
  * [targets.vim](https://github.com/wellle/targets.vim) - Additional text objects.
  * [tcomment_vim](https://github.com/tomtom/tcomment_vim) - Adds a motion to (un)comment lines.
  * [ultisnips](https://github.com/SirVer/ultisnips) - The ultimate snippet solution for Vim.
  * [vim-argwrap](https://github.com/FooSoft/vim-argwrap) - Wrap and unwrap function arguments, lists, and dictionaries.
  * [vim-bracketed-paste](https://github.com/ConradIrwin/vim-bracketed-paste) - Handles bracketed-paste-mode (aka automatic `:set paste`).
  * [vim-grepper](https://github.com/mhinz/vim-grepper) - A convenient wrapper around grepping facilities in Vim.
  * [vim-indent-object](https://github.com/michaeljsmith/vim-indent-object) - Adds a text object representing lines with the same indent.
  * [vim-sort-motion](https://github.com/christoomey/vim-sort-motion) - Adds a motion to sort text objects.
  * [vim-repeat](https://github.com/tpope/vim-repeat) - Enables repeating-supported plugin maps with `"."`.
  * [vim-surround](https://github.com/tpope/vim-surround) - Quoting/parenthesizing made simple.

* Filetype:
  * [LaTeX Box](https://github.com/LaTeX-Box-Team/LaTeX-Box) - Lightweight Toolbox for LaTeX.
  * [vim-mail-refs](https://github.com/sopticek/vim-mail-refs) - Automatic insertion of URL references into mails.
  * [xmledit](https://github.com/sukima/xmledit) - Helps edit XML files.

* Syntax:
  * [dokuwiki](https://github.com/nblock/vim-dokuwiki)
  * [jinja2](https://github.com/Glench/Vim-Jinja2-Syntax)
  * [python](https://github.com/hdima/python-syntax)
  * [rdoc](https://github.com/depuracao/vim-rdoc)
  * [redminewiki](https://github.com/s3rvac/vim-syntax-redminewiki)
  * [retdecdsm](https://github.com/s3rvac/vim-syntax-retdecdsm)
  * [tracwiki](http://www.vim.org/scripts/script.php?script_id=3337)
  * [llvm](https://llvm.org/svn/llvm-project/llvm/trunk/utils/vim/syntax/llvm.vim)


How to install vim with lua on Ubuntu
-------------------------------------
**Note - Make sure gcc g++ cc have been installed.**

[Installing vim 7.4 with lua on Ubuntu 12.04](https://gist.github.com/jdewit/9818870)
```
sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common

sudo apt-get build-dep vim-gnome

sudo apt-get install liblua5.1-dev luajit libluajit-5.1 python-dev ruby-dev libperl-dev libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev

sudo rm -rf /usr/local/share/vim

sudo rm /usr/bin/vim

sudo mkdir /usr/include/lua5.1/include
sudo mv /usr/include/lua5.1/*.h /usr/include/lua5.1/include/

sudo ln -s /usr/bin/luajit-2.0.0-beta9 /usr/bin/luajit

cd ~
git clone https://github.com/vim/vim
cd vim/src
make distclean
./configure --with-features=huge \
            --enable-rubyinterp \
            --enable-largefile \
            --disable-netbeans \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp \
            --enable-luainterp \
            --with-luajit \
      --enable-gui=auto \
            --enable-fail-if-missing \
            --with-lua-prefix=/usr/include/lua5.1 \
            --enable-cscope
make
sudo make install
```

How to install vim with lua on Redhat/CentOS 7
----------------------------------------------
**Note - Make sure gcc g++ cc have been installed.**

[How to build Vim 7.4 with Lua support on CentOS 7](https://dky.io/post/how-to-build-vim-7.4-with-lua-support-on-centos-7/)

