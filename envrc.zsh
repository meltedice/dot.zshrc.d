# -*- coding: utf-8; mode: shell-script -*-

# Common environment variables for bash/zsh 
#
# bash:
#   [[ -f $HOME/.envrc ]] && . $HOME/.envrc
# zsh:
#   [[ -f $HOME/.envrc ]] && source $HOME/.envrc

# $PATH # => /usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

export LESS=-R
export LANG=en_US.UTF-8
#export LANG=ja_JP.ujis
#export LANG=en_US.ujis
export LC_ALL=en_US.UTF-8
export NLS_LANG=.UTF-8
# LC_COLLATE="C" for ls sort order: http://cpplover.blogspot.jp/2012/04/ubuntu.html
export LC_COLLATE="C"
export PERL_BADLANG=0
export SVN_EDITOR="emacs -nw"
export GIT_EDITOR="emacs -nw"
export GIT_PAGER='less -FRSX'

# brew
export PATH=/usr/local/sbin:/usr/local/bin:$PATH

# export PATH=$PATH:$HOME/bin

# export PYTHONPATH=/usr/lib/python2.6/:/usr/lib/python2.6/site-packages/:/Library/Python/2.6/site-packages/:~/.emacs.d/plugins/pymacs/:~/.emacs.d/plugins/pymacs-ext

if [ -f /usr/local/opt/curl-ca-bundle/share/ca-bundle.crt ]; then
  export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
fi

# http://xoyip.hatenablog.com/entry/2014/04/24/200613
[[ -f $HOME/bin/bundler.sh ]] && export BUNDLER_EDITOR=~/bin/bundler.sh

# Cask
[[ -d $HOME/.cask ]] && export PATH="$HOME/.cask/bin:$PATH"


