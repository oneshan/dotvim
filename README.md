dotvim
======


## Personal Vim setup, using vundle 

  $ git clone --recursive git@github.com:oneshan/dotvim.git ~/.vim


## Symbolic Link for vimrc

  $ ln -s ~/.vim/vimrc ~/.vimrc


## Install Plugins

  $ pip install pep8 flake8

  $ vim -c BundleInstall 


## Install Plugin YouCompleteMe

  $ sudo yum install cmake build-essential cmake python-dev

  $ cd ~/.vim/bundle/YouCompleteMe

  $ ./install.sh --clang-completer

## Install ctags

  * CentOS

  $ yum install ctags

  * Ubuntu

  $ apt-get install exuberant-ctags

  * MacOS

  $ wget http://tenet.dl.sourceforge.net/project/ctags/ctags/5.8/ctags-5.8.tar.gz && tar -zxvf ctags-5.8.tar.gz && cd ctags-5.8 && ./configure && make && sudo make install 
