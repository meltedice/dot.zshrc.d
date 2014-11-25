# -*- coding: utf-8 -*-

# TIPS
# C-r 履歴検索
# ESC-q command-line stack (入力中の内容を一時退避)

# zsh-completions
#   https://github.com/zsh-users/zsh-completions
#     You may have to force rebuild zcompdump:
#     rm -f ~/.zcompdump; compinit
#   http://d.hatena.ne.jp/guyon/20120116/1326725427
fpath=(~/.zshrc.d/zsh-completions $fpath)
fpath=($fpath $HOME/.zshrc.d/plugins)
typeset -U fpath

# 補完関数をロード
autoload -U ~/.zshrc.d/plugins/*(:t)

## refs
#            http://www28.atwiki.jp/fmemo/pages/31.html
# LBUFFER    http://www.csse.uwa.edu.au/programming/linux/zsh-doc/zsh_19.html
# color      http://goryugo.ldblog.jp/archives/392346.html
# zsh-lovers http://www.cuspy.org/wiki/zsh-lovers
#            http://nanabit.net/softwares/shell-script/zshrc
autoload -U compinit
compinit

autoload colors
colors

# http://www.ayu.ics.keio.ac.jp/~mukai/tips/zshmerit.html
# コマンド行の最初にスペースを入れると履歴に残さない
setopt HIST_IGNORE_SPACE 

# http://0xcc.net/unimag/3/
# 各ターミナルと履歴を共有
setopt share_history

## completion
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

## history
#HISTFILE=~/.histfile
HISTFILE=~/.zshrc.d/histfile
# HISTSIZE=8000
# SAVEHIST=8000
HISTSIZE=200000
SAVEHIST=200000

# exists?
function exists {
    if which "$1" 1>/dev/null 2>&1; then return 0; else return 1; fi
}

# --color=auto doesn't work on Mac OS X
COLOR_OPTION=""
case "${OSTYPE}" in
    freebsd*|darwin*)
        alias ls="ls -F -G -w"
        alias emacs-nw="emacs -nw"
        COLOR_OPTION=""
        ;;
    linux*)
        alias ls="ls -F --color"
        alias emacs-nw="env TERM=xterm-256color emacs -nw"
        COLOR_OPTION="--color=auto"
        ;;
esac

alias grep="grep $COLOR_OPTION"
alias fgrep="fgrep $COLOR_OPTION"
alias egrep="egrep $COLOR_OPTION"

# http://www.ayu.ics.keio.ac.jp/~mukai/tips/zshmerit.html
# ESC-q : command line stack
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'
alias -g S='| sed'
alias -g A='| awk'
alias -g W='| wc'

# 環境変数を読み込む
[[ -f $HOME/.zshrc.d/envrc.zsh ]] && source $HOME/.zshrc.d/envrc.zsh

alias du="du -h"
alias df="df -h"
alias su="su -l"
alias la='ls -hA'
alias lf="ls -F"
alias ll='ls -hl'
alias lla='ls -hlA'
## clipboard (requires xsel which can be installed by "sudo aptitude install xsel")
# http://nanabit.net/softwares/shell-script/zshrc
if exists xsel; then
    alias -g   B=" | xsel -bi" # stdout => clip
    alias -g  B2=" 2>&1 | xsel -bi" # stdout + stderr => clip
    alias -g  BB=" | (cat 1>&2 | xsel -bi) 2>&1" # stdout => clip and stdout
    alias -g BB2=" 2>&1 | (cat 1>&2 | xsel -bi) 2>&1" # stdout, stderr => clip and stdout
fi

# alias cdgems='cd /usr/lib/ruby/gems/1.8/gems/'
alias nwemacs='emacs-nw'
alias eshell='emacs-nw -f eshell'
alias sudoh='sudo -H env PATH=$PATH'
alias dropbox-restart='(dropbox stop; dropbox start)'
alias count-files='find . -maxdepth 1 -type d | sort | while read -r d; do printf "%5d  %s\n" `find "$d" -type f | wc -l` $d; done'
alias count-files-du='find . -maxdepth 1 -type d | sort | while read -r d; do printf "%+7s  %7d  %s\n" `du -s "$d" | cut -f1` `find "$d" -type f | wc -l` $d; done'
alias be='bundle exec'

## Mac OS X
# alias iphone='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'
alias quick-hibernate-mode-on='sudo pmset -a hibernatemode 0'
alias quick-hibernate-mode-off='sudo pmset -a hibernatemode 3' # default
alias fix-lssave='/System/Library/Frameworks/CoreServices.framework/Versions/Current/Frameworks/LaunchServices.framework/Versions/Current/Support/lsregister -kill -r -domain local -domain system -domain user'

color_red=$'%{\e[1;31m%}'
color_dark_green=$'%{\e[1;32m%}'
color_yellow=$'%{\e[1;33m%}'
color_dark_blue=$'%{\e[1;34m%}'
color_magenta=$'%{\e[1;35m%}'
color_light_blue=$'%{\e[1;36m%}'
color_white=$'%{\e[1;37m%}'
color_green=$'%{\e[1;40m%}'

ROOT_PROMPT="${color_red}%B[%n@%m]%.%# - %b${color_red}"
ROOT_RPROMPT="${color_red}[%~]""%{[1;m%}"
USER_PROMPT="${color_dark_green}%B[%n@%m]%. ${color_red}◊ %b"
USER_RPROMPT="${color_red}[%~]""%{[1;m%}"

# http://www.charbase.com/
# http://www.ffortune.net/comp/net/ref/special.htm
# http://www.kotalog.net/archives/1176
# http://hp.vector.co.jp/authors/VA026623/text/kigou_uni.htm
# http://papaliv.web.fc2.com/papa_h_kigo_unicode.html
# http://code.cside.com/3rdpage/jp/utf-8/
# ☖☗♠♡♢♣♤♥♦♧◊๛༗❤
case `hostname` in
    tokoyuki*)
        # USER_PROMPT="${color_dark_green}%B[%n@%m]%. ${color_red}◊ %b"
        USER_PROMPT="${color_dark_green}%B[%n@%m]%. ${color_red}༗  %b"
        ;;
    mizukagami*)
        USER_PROMPT="${color_dark_green}%B[%n@%m]%. ${color_red}๛  %b"
        ;;
    odoro*)
        USER_PROMPT="${color_dark_green}%B[%n@%m]%. ${color_red}❤  %b"
        ;;
    yoki*)
        USER_PROMPT="${color_dark_green}%B[%n@%m]%. ${color_red}༗  %b"
        ;;
    *)
        USER_PROMPT="${color_dark_green}%B[%n@%m]%. ${color_red}%% %b"
        ;;
esac

set-prompt-default() {
    case $UID in
        0)
            # root
            # COLOR=$'%{\e[1;31m%}' # red
            # PROMPT=$COLOR"%B[%n@%m]%.%# %b"       # following command is default color.
            # PROMPT=$COLOR"%B[%n@%m]%.%# %b"$COLOR # following command is red.
            PROMPT=$ROOT_PROMPT
            # PROMPT=$COLOR"%B[%n@%m][%*]%.%# %b"$COLOR # [time]
            PROMPT2=$COLOR"%B%_> %b"
            PROMPT3=$COLOR"%B?# %b"
            PROMPT4=$COLOR"%B+%N:%i> %b"
            SPROMPT=$COLOR"%Bzsh: correct '%R' to '%r' [nyae]? %b"

            RPROMPT=$ROOT_RPROMPT
            ;;
        *)
            # user
            # PROMPT="%B[%n@%m]%.%# %b"
            PROMPT=$USER_PROMPT
            #PROMPT="%B[%n@%m][%*]%.%# %b" # [time]
            PROMPT2="%B%_> %b"
            PROMPT3="%B?# %b"
            PROMPT4="%B+%N:%i> %b"
            SPROMPT="%Bzsh: correct '%R' to '%r' [nyae]? %b"

            RPROMPT=$USER_RPROMPT
            ;;
    esac
}
set-prompt-default

# set terminal title
set-terminal-title() {
    case "${TERM}" in
        kterm*|xterm*)
            # echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
            dirname=`if [[ "$HOME" == "$PWD" ]] then; echo '~'; else; echo $PWD | sed -e 's/^\/.*\///'; fi`
            echo -ne "\033]0;${USER}@${HOST%%.*}:${dirname}\007"
            ;;
    esac

    # set a fancy prompt (non-color, unless we know we "want" color)
    case "$TERM" in
        xterm-color) color_prompt=yes;;
    esac
}

# ---------------------------------------

## terminal configuration
#
#LSCOLORS  is for : BSD : ?
#LS_COLORS is for : GNU : Ubuntu / emacs
set-colors() {
    unset LSCOLORS
    case "${TERM}" in
        xterm)
            export TERM=xterm-color
            ;;
        kterm)
            export TERM=kterm-color
            ## set BackSpace control character
            #stty erase
            ;;
        cons25)
            #unset LANG
            #export LSCOLORS=ExFxCxdxBxegedabagacad
            #export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
            #zstyle ':completion:*' list-colors \
            #  'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
            ;;
        dumb)
            ## for emacs shell-mode
            #export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
            export  LS_COLORS='di=01:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
            ;;
    esac

    case "${TERM}" in
        kterm*|xterm*)
            export  LS_COLORS='di=1;94:ln=1;96:so=32:pi=33:ex=31:bd=33:cd=1;33:su=41;30:sg=46;30:tw=1;31:ow=43;30'
            #zstyle ':completion:*' list-colors \
            #  'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
            ;;
    esac
}
set-colors

# ---------------------------------------

# auto change directory
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd

# command correct edition before each completion attempt
setopt correct

# compacked complete list display
setopt list_packed

# no remove postfix slash of command line
setopt noautoremoveslash

# no beep sound when complete list displayed
setopt nolistbeep

bindkey -e

setopt hist_ignore_dups # ignore duplication command history list
#setopt share_history # share command history data

# http://github.com/jcorbin/zsh-git/
# prompt_wunjo_setup zgitinit
# zgitinit and prompt_wunjo_setup must be somewhere in your $fpath, see README for more.
setopt promptsubst
# Load the prompt theme system
autoload -U promptinit
promptinit
# Use the wunjo prompt theme
# prompt wunjo
#
# % git config --global color.diff auto
# % git config --global color.ui true
# % git diff --color .emacs | less -R
# % git diff --color .emacs | less -r
#

# brew install hub
if type hub >& /dev/null;then
  alias git=hub
fi

# https://github.com/knu/zsh-git-escape-magic
# https://raw.github.com/knu/zsh-git-escape-magic/master/git-escape-magic
autoload -Uz git-escape-magic
git-escape-magic

# ---------------------------------------

## 補完関数をリロード
reload-zsh-compfuncs() {
    local f
    f=(~/.zshrc.d/plugins/*(.))
    unfunction $f:t 2> /dev/null
    autoload -U $f:t
}

## 行末で C-w → 単語を削除
# http://d.akinori.org/?date=20070703
tcsh-backward-delete-word () {
    local WORDCHARS="${WORDCHARS:s#/#}"
    zle backward-delete-word
}
zle -N tcsh-backward-delete-word
kill-region-or-tcsh-backward-delete-word () {
    if [ $MARK -eq 0 ]; then
        tcsh-backward-delete-word
    else
        zle kill-region
        MARK=0
    fi
}
zle -N kill-region-or-tcsh-backward-delete-word
bindkey '^W' kill-region-or-tcsh-backward-delete-word

## ディレクトリを高速に上る
# http://d.hatena.ne.jp/f99aq/20090418/1240067145
# .   => .
# ..  => ..
# ... => ../..
# rationalise-dot() {
#     if [[ $LBUFFER = *.. ]] ; then
#         LBUFFER+=/..
#     else
#         LBUFFER+=.
#     fi
# }
# zle -N rationalise-dot
# bindkey . rationalise-dot

## zshでコマンド入力中に親ディレクトリに移動する技
# http://sho.tdiary.net/20060927.html#p01
# C-^
function cdup() {
    #echo
    cd ..
    zle reset-prompt
}
zle -N cdup
bindkey '^\^' cdup

# function git () {
#     if [[ $1 == "" ]]; then
#         # git ってだけうったときは status 表示
#         command git --no-pager branch -a --verbose
#         command git --no-pager diff --stat
#         command git --no-pager status
#     elif [[ $1 == "log" ]]; then
#         # 常に diff を表示してほしい
#         command git log -p ${@[2, -1]}
#     else
#         command git $@
#     fi
# }

## 最初に .git が見つかったディレクトリへ移動
# 自作
cdgit() {
    local dir_path=.
    if [ $1 ] ; then
        dir_path=${1%/}
    fi
    for depth in {1..20} ; do
        if [ -d $dir_path/.git ] ; then
            cd $dir_path
            pwd
            break
        else
            dir_path=../$dir_path
        fi
    done
}
alias gitup='cdgit'

## １つ上のディレクトリから開始して、最初に .git が見つかったディレクトリへ移動
# 自作
cdgit..() {
    local dir_path=..
    for depth in {1..20} ; do
        if [ -d $dir_path/.git ] ; then
            cd $dir_path
            pwd
            break
        else
            dir_path=../$dir_path
        fi
    done
}
alias gitup..='cdgit..'

## * find grep
# 自作
fgcss() { find . -type f -name "*.css" -print0 | xargs -0 grep $COLOR_OPTION -n "$1" }
fgel()  { find . -type f -name "*.el"  -print0 | xargs -0 grep $COLOR_OPTION -n "$1" }
fgerb() { find . -type f -name "*.erb" -print0 | xargs -0 grep $COLOR_OPTION -n "$1" }
fgphp() { find . -type f -name "*.php" -print0 | xargs -0 grep $COLOR_OPTION -n "$1" }
fgpl()  { find . -type f -name "*.pl"  -print0 | xargs -0 grep $COLOR_OPTION -n "$1" }
fgrb()  { find . -type f -name "*.rb"  -print0 | xargs -0 grep $COLOR_OPTION -n "$1" }
fgyml() { find . -type f -name "*.yml" -print0 | xargs -0 grep $COLOR_OPTION -n "$1" }
find-grep() {
    if [ $2 ] ; then
        find . -type f -name "$1" -print0 | xargs -0 grep $COLOR_OPTION -n "$2"
    else
        find . -type f            -print0 | xargs -0 grep $COLOR_OPTION -n "$1"
    fi
}

## show-colors
show-colors() {
    for i in 0 1 4 5 30 31 32 33 34 35 36 37 40 41 42 43 44 45 46 47
    do
        COLOR=$'%{\e[1;'$i$'m%}'
        #PROMPT=$COLOR"%B[%n@%m]%.%# %b"$COLOR
        #echo $COLOR"color#"$i"    $'%{\e[1;'"$i"$'m%}'"
        echo '\e[1;'$i$'m'"      color#"$i'\e[1;'0$'m'
    done
}

#short-prompt
set-prompt-short() {
    # user
    # PROMPT="%B[%n@%m][%*]%.%# %b" # [time]
    # PROMPT="%B[%m]%# %b"
    PROMPT="%# %b"
    RPROMPT=""
}
short-prompt() {
    set-prompt-short
}

#long-prompt
set-prompt-long() {
    # user
    # PROMPT="%B[%n@%m][%*]%.%# %b" # [time]
    # PROMPT="%B[%n@%m]%.%# %b"
    PROMPT=$USER_PROMPT
    RPROMPT=$USER_RPROMPT
}
long-prompt() {
    set-prompt-long
}

# ---------------------------------------

# disable zle (zsh line editor) when call from emacs
[[ $EMACS = t ]] && unsetopt zle

set-prompt-rvm() {
    if [[ -f $HOME/.rvm/bin/rvm-prompt ]]; then
        PROMPT='${color_dark_green}%B[`~/.rvm/bin/rvm-prompt v p g`]%. ${color_red}◊ %b'
    fi
}

precmd() {
    set-terminal-title
    # vcs_info
}

STTYOPTS=`stty -g`
fix-stty() { \stty $STTYOPTS }

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
enable-rvm() {
    PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
}
